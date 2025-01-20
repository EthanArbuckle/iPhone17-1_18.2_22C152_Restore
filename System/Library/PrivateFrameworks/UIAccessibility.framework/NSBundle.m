@interface NSBundle
@end

@implementation NSBundle

void __70__NSBundle_UIAccessibilityLoader___loadAXBundleForBundleOffMainThread__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 || a2)
  {
    v5 = AXLogLoading();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v4;
      _os_log_impl(&dword_19F2DB000, v5, OS_LOG_TYPE_DEBUG, "Main bundle: %{public}@", buf, 0xCu);
    }

    id v12 = v4;
    v6 = +[UIAccessibilityLoader _accessibilityBundlesForBundle:v4];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            _AXAssert();
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            +[UIAccessibilityLoader loadAccessibilityBundleForBundle:v11 didLoadCallback:0];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    AXPerformBlockAsynchronouslyOnMainThread();

    id v4 = v12;
  }
}

void __70__NSBundle_UIAccessibilityLoader___loadAXBundleForBundleOffMainThread__block_invoke_2()
{
  id v0 = +[UIAccessibilityInformationLoader sharedInstance];
  [v0 setNeedsLoadAccessibilityInformation];
}

@end