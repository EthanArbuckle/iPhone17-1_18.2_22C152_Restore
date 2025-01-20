@interface NSBundle(SafariSharedExtras)
+ (id)safari_bundlesFromDirectory:()SafariSharedExtras bundleType:;
+ (id)safari_safariSharedBundle;
@end

@implementation NSBundle(SafariSharedExtras)

+ (id)safari_safariSharedBundle
{
  v2 = (void *)safari_safariSharedBundle_bundle;
  if (!safari_safariSharedBundle_bundle)
  {
    uint64_t v3 = [a1 bundleForClass:objc_opt_class()];
    v4 = (void *)safari_safariSharedBundle_bundle;
    safari_safariSharedBundle_bundle = v3;

    v2 = (void *)safari_safariSharedBundle_bundle;
  }
  return v2;
}

+ (id)safari_bundlesFromDirectory:()SafariSharedExtras bundleType:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFArrayRef BundlesFromDirectory = CFBundleCreateBundlesFromDirectory(0, directoryURL, bundleType);
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[__CFArray count](BundlesFromDirectory, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  CFArrayRef v6 = BundlesFromDirectory;
  uint64_t v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(__CFBundle **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_alloc(MEMORY[0x1E4F28B50]);
        CFURLRef v13 = CFBundleCopyBundleURL(v11);
        v14 = objc_msgSend(v12, "initWithURL:", v13, (void)v16);
        [v5 addObject:v14];
      }
      uint64_t v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

@end