package tools;

use strict;

our $home = $ENV{'HOME'};
our $IDA  = `which idal64`;
chomp $IDA;
our $CC_OPTIONS  = "   ";
our $CXX_OPTIONS = " -O3 -lpthread";

=pod
our $CC          = "clang-3.8";
our $CXX         = "clang++-3.8";
our $MCSEMA_HOME = "${home}/Github/mcsema_latest_master//";
our $LLVMDIS     = "${MCSEMA_HOME}/build/llvm/bin/llvm-dis";
our $REGSTATE    = "-I${MCSEMA_HOME}/mcsema/Arch/X86/Runtime/";
our $MCSEMA_BRANCH = "master";
our $MCSEMA_LIB = "$MCSEMA_HOME/lib/libmcsema_rt64.a";
=cut

our $CC  = "${home}/Github/remill/remill-build/libraries/llvm/bin/clang";
our $CXX = "${home}/Github/remill/remill-build/libraries/llvm/bin/clang++";
our $MCSEMA_HOME = "/usr/local/";
our $LLVMDIS = "${home}/Github/remill/remill-build/libraries/llvm/bin/llvm-dis";
our $REGSTATE      = "";
our $MCSEMA_BRANCH = "use_remill_semantics";
our $MCSEMA_LIB    = "$MCSEMA_HOME/lib/libmcsema_rt64-4.0.a";
1;

=pod
our $OPT      = "opt";
our $LLVMAS   = "llvm-as";
our $LLVMAS35 = "${home}/Install/llvm-3.5.0.release.install/bin/llvm-as";
our $LLC      = "llc";
our $libnone     = "";
our $BC2ALLVM    = "bc2allvm";
our $ALLTOGETHER = "alltogether";
our $ALLEY       = "alley";
our $OPTSWITCH   = "-constprop -stack-decons -dce  -early-cse-memssa";
our $DWARF_TYPE_READER =
  "${home}/Github/dwarf-type-reader/build/bin/dwarf-type-reader";
our $AUGMENT_TYPE =
"${home}/Github/binary-decompilation/tools/augment_ida_type/augment_ida_types.py";
our $ALLIN_HOME = "../../../build/";
our $LOADSO     = "${ALLIN_HOME}/lib/LLVMstack_deconstructor.so";
=cut