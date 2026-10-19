# Woojin Ji (random6)

**Linux kernel & eBPF security | Rust / C / Python**

[GitHub](https://github.com/random6-xyz) · [Technical blog](https://rust.random6.xyz/) · [Email](mailto:random6.xyz@gmail.com)

## Profile

Open-source contributor focused on Linux eBPF verification and systems security. Authored four commits in mainline Linux and two merged into bpf-next across the BPF verifier, selftests, and bpftool; builds Rust and C tooling for differential testing, kernel experiments, and endpoint telemetry.

## Open-source contributions

**Linux kernel, BPF subsystem** · 2026

- **BPF verifier:** Preserved known-zero stack reads across scalar zero spills while tracking spill precision for sound pruning. Authored the [kernel fix](https://github.com/torvalds/linux/commit/69fdbe63e16919a885a8f9441e248ce0ddf15b25) and [regression selftests](https://github.com/torvalds/linux/commit/e693da913d2cdd69c1612fbf71bdf2b6771f6dba) ([patch series](https://lore.kernel.org/all/20260625-bpf-stack-var-off-zero-v1-v3-0-a068210a761b@gmail.com/)).
- **BPF helper inlining (bpf-next):** [Fixed](https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=1c1dda9ba9f3af9cd511a197dcc86de2465d8fe5) `bpf_get_func_arg()` to zero-extend its 32-bit index before address calculation, preventing out-of-bounds context reads. Added [regression selftests](https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=38dbc3047a2fa706f6b4485679eb5eb62ff55b87) for upper index bits and out-of-range indices in `fexit` and `tp_btf` programs.
- **BPF selftests:** Added an [arena regression test](https://github.com/torvalds/linux/commit/7bfb93e3475be9de894f1cecd3a727d3e1649b03) for a direct-value pseudo load at the one-past-end offset ([patch discussion](https://lore.kernel.org/all/20260612-arena-direct-value-v1-v4-1-b81b642f5277@gmail.com/)).
- **bpftool:** [Fixed](https://github.com/torvalds/linux/commit/8a7f2bff2165e53595d1e91c160b340f978c0ab7) flow-dissector query handling to use libbpf's error code rather than `errno` after `close()`, preserving old-kernel compatibility ([patch discussion](https://lore.kernel.org/all/20260603003339.33791-1-random6.xyz@gmail.com/)).

## CTF

**DEF CON 33 CTF Finals (2025)** — Finalist with **cold fusion**; competed in pwn and reverse engineering.

## Selected projects

- **[rand-verifier](https://github.com/random6-xyz/rand-verifier)** · Rust — Differential testing for the Linux eBPF verifier, combining a path-sensitive abstract interpreter, bounded concrete execution, an independent safety specification, and real-kernel verdicts. Includes fuzzing, test-case reduction, SMT checks, and a bpf-next QEMU test path.
- **[kernel-ebpf-lab](https://github.com/random6-xyz/kernel-ebpf-lab)** · Buildroot, QEMU — Reproducible kernel builds and guest boots for BPF patch work, with SSH-based smoke tests and verifier-response collection.
- **[rand-guard](https://github.com/random6-xyz/rand-guard)** · Rust, Aya — An eBPF endpoint detection prototype with process and file telemetry, opt-in network events, userspace enrichment, focused detections, and JSON Lines output ([project write-up](https://rust.random6.xyz/projects/linux-kernel-rand-guard/)).

## Technical focus

**Languages:** Rust, C  
**Systems and security:** Linux kernel, eBPF verifier, BPF selftests, endpoint telemetry, low-level security  
**Tools and methods:** Aya, libbpf, LLVM/Clang, QEMU, Buildroot, fuzzing, differential testing

## Selected writing

- [Patching the eBPF Verifier to Preserve Spilled Zeroes](https://rust.random6.xyz/blog/linux-kernel-ebpf-verifier-patch-1/) — How the upstream verifier fix preserves precision without breaking pruning.
- [Why 12 eBPF Partial-Init Variants That Looked Equivalent Produced Different Verification Results](https://rust.random6.xyz/blog/linux-kernel-ebpf-partial-init-verifier/) — Controlled experiments on stack initialization and verifier behavior.

## Education

**Dankook University, Jukjeon Campus** — B.Eng. in Cybersecurity  
Expected graduation: February 2028
