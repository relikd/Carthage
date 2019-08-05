import Result

/// Describes the type of product built by an Xcode target.
public enum ProductType: String {
	/// A framework bundle.
	case framework = "com.apple.product-type.framework"

	/// A static library.
	case staticLibrary = "com.apple.product-type.library.static"

	/// A unit test bundle.
	case testBundle = "com.apple.product-type.bundle.unit-test"
	
	/// A generic bundle, e.g., QLGenerator.
	case genericBundle = "com.apple.product-type.bundle"

	/// Attempts to parse a product type from a string returned from
	/// `xcodebuild`.
	public static func from(string: String) -> Result<ProductType, CarthageError> {
		return Result(self.init(rawValue: string), failWith: .parseError(description: "unexpected product type \"\(string)\""))
	}
	
	/// Returns true for .framework or .genericBundle
	public func archivable() -> Bool {
		return self == .framework || self == .genericBundle;
	}
}
