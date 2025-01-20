@interface QLExtensionManager(_QLUtilities)
+ (id)extensionForItem:()_QLUtilities;
+ (id)ql_applicationBundleIdentifierOfExtensionForItem:()_QLUtilities;
+ (id)ql_previewExtensionCustomLoadingTimeForItem:()_QLUtilities;
+ (uint64_t)ql_isPreviewExtensionThatHaveCustomPresentationViewForItem:()_QLUtilities;
@end

@implementation QLExtensionManager(_QLUtilities)

+ (id)extensionForItem:()_QLUtilities
{
  v3 = (void *)MEMORY[0x1E4F945C0];
  id v4 = a3;
  v5 = [v3 sharedManager];
  v6 = [v4 previewItemContentType];

  LOBYTE(v9) = 1;
  v7 = [v5 extensionForContentType:v6 allowExtensionsForParentTypes:0 applicationBundleIdentifier:0 extensionPath:0 extensionType:0 generationType:1 shouldUseRestrictedExtension:v9];

  return v7;
}

+ (uint64_t)ql_isPreviewExtensionThatHaveCustomPresentationViewForItem:()_QLUtilities
{
  v1 = objc_msgSend(a1, "extensionForItem:");
  uint64_t v2 = objc_msgSend(v1, "ql_isPreviewExtensionThatHaveCustomPresentationView");

  return v2;
}

+ (id)ql_previewExtensionCustomLoadingTimeForItem:()_QLUtilities
{
  v1 = objc_msgSend(a1, "extensionForItem:");
  uint64_t v2 = objc_msgSend(v1, "ql_previewExtensionCustomLoadingTime");

  return v2;
}

+ (id)ql_applicationBundleIdentifierOfExtensionForItem:()_QLUtilities
{
  v1 = objc_msgSend(a1, "extensionForItem:");
  uint64_t v2 = objc_msgSend(v1, "QL_parentBundleID");

  return v2;
}

@end