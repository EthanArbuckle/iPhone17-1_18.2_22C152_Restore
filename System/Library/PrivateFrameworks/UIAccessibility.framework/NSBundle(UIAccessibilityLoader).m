@interface NSBundle(UIAccessibilityLoader)
+ (id)_accessibilityBundleWithBundlePath:()UIAccessibilityLoader;
+ (id)accessibilityBundleWithLastPathComponent:()UIAccessibilityLoader;
+ (id)accessibilityInternalBundleWithLastPathComponent:()UIAccessibilityLoader;
+ (id)accessibilityLocalBundleWithLastPathComponent:()UIAccessibilityLoader;
+ (id)accessibilityMacCalystBundleWithLastPathComponent:()UIAccessibilityLoader;
- (id)accessibilityBundlePath;
- (void)_loadAXBundleForBundleOffMainThread;
@end

@implementation NSBundle(UIAccessibilityLoader)

+ (id)accessibilityLocalBundleWithLastPathComponent:()UIAccessibilityLoader
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 mainBundle];
  v6 = [v5 bundlePath];
  v7 = [v6 stringByAppendingPathComponent:@"AccessibilityBundles"];

  v8 = [v7 stringByAppendingPathComponent:v4];

  v9 = [MEMORY[0x1E4F28B50] bundleWithPath:v8];

  return v9;
}

+ (id)accessibilityInternalBundleWithLastPathComponent:()UIAccessibilityLoader
{
  id v3 = a3;
  id v4 = AXInternalAccessibilityBundlesDirectory();
  v5 = [v4 stringByAppendingPathComponent:v3];

  v6 = [MEMORY[0x1E4F28B50] bundleWithPath:v5];
  [v6 _accessibilitySetValue:v5 forKey:@"accessibilityBundlePath" storageMode:1];

  return v6;
}

+ (id)_accessibilityBundleWithBundlePath:()UIAccessibilityLoader
{
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 bundleWithPath:v4];
  [v5 _accessibilitySetValue:v4 forKey:@"accessibilityBundlePath" storageMode:1];

  return v5;
}

+ (id)accessibilityBundleWithLastPathComponent:()UIAccessibilityLoader
{
  id v4 = a3;
  v5 = AXAccessibilityBundlesDirectory();
  v6 = [v5 stringByAppendingPathComponent:v4];

  v7 = [a1 _accessibilityBundleWithBundlePath:v6];

  return v7;
}

+ (id)accessibilityMacCalystBundleWithLastPathComponent:()UIAccessibilityLoader
{
  id v4 = a3;
  v5 = AXAccessibilityMacCatalystBundlesDirectory();
  v6 = [v5 stringByAppendingPathComponent:v4];

  v7 = [a1 _accessibilityBundleWithBundlePath:v6];

  return v7;
}

- (id)accessibilityBundlePath
{
  v2 = [a1 _accessibilityValueForKey:@"accessibilityBundlePath"];
  if (![v2 length])
  {
    uint64_t v3 = [a1 safeValueForKey:@"_resolvedPath"];

    if (v3 || ([a1 bundlePath], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [a1 _accessibilitySetValue:v3 forKey:@"accessibilityBundlePath" storageMode:1];
      v2 = (void *)v3;
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

- (void)_loadAXBundleForBundleOffMainThread
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [a1 safeValueForKey:@"accessibilityBundlePath"];
  uint64_t v3 = v2;
  if (!v2 || [v2 rangeOfString:kUIAccessibilityBundleExtension] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = AXLogLoading();
    if (os_signpost_enabled(v4))
    {
      int v6 = 138412290;
      v7 = a1;
      _os_signpost_emit_with_name_impl(&dword_19F2DB000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LoadingBundlePostLaunch", "%@", (uint8_t *)&v6, 0xCu);
    }

    v5 = AXLogLoading();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      v7 = a1;
      _os_log_impl(&dword_19F2DB000, v5, OS_LOG_TYPE_INFO, "Bundle is causing _loadAXBundleForBundle (expensive!): %@", (uint8_t *)&v6, 0xCu);
    }

    +[UIAccessibilityLoader loadAccessibilityBundleForBundle:a1 didLoadCallback:&__block_literal_global_7];
  }
}

@end