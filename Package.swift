// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "geos-cpp",
    platforms: [.iOS(.v11), .macOS("10.9"), .tvOS(.v11), .watchOS(.v4)],
    products: [
        .library(
            name: "geos-cpp",
            type: .dynamic,
            targets: ["geos-cpp"]),
    ],
    targets: [
        .target(
            name: "geos-cpp",
            path: "Sources/geos",
            exclude: ["benchmarks", "capi", "cmake", "debian", "doxygen", "examples", "tools", "tests"],
            publicHeadersPath: "include",
            cxxSettings: [
                .define("USE_UNSTABLE_GEOS_CPP_API"),
                .define("NDEBUG"),
                .headerSearchPath("../geos_extra"),
                .headerSearchPath("include"),
                .headerSearchPath("src/deps"),
            ])
    ],
    cxxLanguageStandard: .cxx11
)
