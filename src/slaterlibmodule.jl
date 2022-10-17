const __builtin_popcountll = count_ones
const __builtin_ctzll = trailing_zeros

module slaterlibjl
using CBinding

    slaterlibdir = "/home/chilkuri/Documents/codes/julia/slaterlibjl/lib/"
    c`$([
        "-mpopcnt -march=native -g -std=c99",
        "-I$(slaterlibdir)/include",
        "-L$(dirname(slaterlibdir))/lib", "-lslater",
    ])`

    const c"int8_t" = Int8
    const c"int16_t" = Int16
    const c"int32_t" = Int32
    const c"int64_t" = Int64
    const c"uint8_t" = UInt8
    const c"uint16_t" = UInt16
    const c"uint32_t" = UInt32
    const c"uint64_t" = UInt64
    const c"size_t" = Csize_t

    # define them as Cvoid since they are usually used as opaque
    const c"FILE"    = Cvoid

    c"""
        #include <slater_condon.h>
        #include <slater_condon_simple.h>
        #include <debug.h>
    """ji
end
