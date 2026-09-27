local function render_inlines_as_latex(inlines)
  local doc = pandoc.Pandoc({
    pandoc.Para(inlines)
  })

  local latex = pandoc.write(doc, "latex")
  return latex:gsub("%s+$", "")
end

function Pandoc(doc)
  local blocks = {}

  local found_title = false
  local after_title_paragraphs = 0

  for _, block in ipairs(doc.blocks) do

    -- First H1: name
    if block.t == "Header" and block.level == 1 and not found_title then
      found_title = true

      local title = pandoc.utils.stringify(block.content)

      -- Special styling for "(random6)"
      title = title:gsub(
        "%s*%(random6%)$",
        " {\\normalfont\\fontsize{14pt}{17pt}\\selectfont\\color{resumegray}(random6)}"
      )

      table.insert(
        blocks,
        pandoc.RawBlock(
          "latex",
          "\\section{" .. title .. "}"
        )
      )

    -- First paragraph after title: subtitle
    elseif found_title
      and block.t == "Para"
      and after_title_paragraphs == 0 then

      local latex = render_inlines_as_latex(block.content)

      table.insert(
        blocks,
        pandoc.RawBlock(
          "latex",
          "\\resumesubtitle{" .. latex .. "}"
        )
      )

      after_title_paragraphs = 1

    -- Second paragraph after title: links
    elseif found_title
      and block.t == "Para"
      and after_title_paragraphs == 1 then

      local latex = render_inlines_as_latex(block.content)

      table.insert(
        blocks,
        pandoc.RawBlock(
          "latex",
          "\\resumecontacts{" .. latex .. "}"
        )
      )

      after_title_paragraphs = 2

    else
      table.insert(blocks, block)
    end
  end

  doc.blocks = blocks
  return doc
end
