load("@fbsource//xplat/executorch/build:runtime_wrapper.bzl", "runtime")

def define_common_targets():
    """Defines targets that should be shared between fbcode and xplat.

    The directory containing this targets.bzl file should also contain both
    TARGETS and BUCK files that call this function.
    """

    runtime.cxx_library(
        name = "utils",
        srcs = [
            "UnitTestMain.cpp",
        ],
        exported_headers = [
            "alignment.h",
            "DeathTest.h",
        ],
        visibility = [
            "//executorch/...",
            "@EXECUTORCH_CLIENTS",
        ],
        deps = [
            "//executorch/runtime/platform:platform",
            "//executorch/runtime/core:core",
        ],
        exported_external_deps = [
            "gtest",
            "gmock",
        ],
    )

    runtime.cxx_test(
        name = "alignment_test",
        srcs = [
            "alignment_test.cpp",
        ],
        deps = [
            ":utils",
        ],
    )
