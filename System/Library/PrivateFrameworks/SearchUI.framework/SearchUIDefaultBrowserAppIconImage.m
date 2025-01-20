@interface SearchUIDefaultBrowserAppIconImage
+ (id)defaultBrowserBundleIdentifier;
+ (void)invalidateDefaultBrowserBundleIdentifier;
- (SearchUIDefaultBrowserAppIconImage)initWithVariant:(unint64_t)a3;
- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4;
@end

@implementation SearchUIDefaultBrowserAppIconImage

+ (void)invalidateDefaultBrowserBundleIdentifier
{
  v2 = (void *)sDefaultBrowserBundleIdentifier;
  sDefaultBrowserBundleIdentifier = 0;
}

+ (id)defaultBrowserBundleIdentifier
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!sDefaultBrowserBundleIdentifier)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F22408]);
    v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://"];
    v5 = (void *)[v3 initWithURL:v4 error:0];

    v6 = [v5 bundleRecord];
    v7 = [v6 bundleIdentifier];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = +[SearchUIUtilities bundleIdentifierForApp:14];
    }
    v10 = (void *)sDefaultBrowserBundleIdentifier;
    sDefaultBrowserBundleIdentifier = (uint64_t)v9;
  }
  objc_sync_exit(v2);

  v11 = (void *)sDefaultBrowserBundleIdentifier;
  return v11;
}

- (SearchUIDefaultBrowserAppIconImage)initWithVariant:(unint64_t)a3
{
  v5 = [(id)objc_opt_class() defaultBrowserBundleIdentifier];
  v8.receiver = self;
  v8.super_class = (Class)SearchUIDefaultBrowserAppIconImage;
  v6 = [(SearchUIAppIconImage *)&v8 initWithBundleIdentifier:v5 variant:a3 contentType:0];

  return v6;
}

- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(id)objc_opt_class() defaultBrowserBundleIdentifier];
  [(SearchUIAppIconImage *)self setBundleIdentifier:v7];

  v10.receiver = self;
  v10.super_class = (Class)SearchUIDefaultBrowserAppIconImage;
  objc_super v8 = [(SearchUIAppIconImage *)&v10 loadImageWithScale:v4 isDarkStyle:a3];
  return v8;
}

@end