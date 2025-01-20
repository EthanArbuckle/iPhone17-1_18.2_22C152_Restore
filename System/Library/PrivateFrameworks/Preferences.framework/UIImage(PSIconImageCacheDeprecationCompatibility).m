@interface UIImage(PSIconImageCacheDeprecationCompatibility)
+ (id)ps_settingsIconImageDescriptor;
+ (id)ps_synchronousIconWithApplicationBundleIdentifier:()PSIconImageCacheDeprecationCompatibility;
+ (id)ps_synchronousIconWithTypeIdentifier:()PSIconImageCacheDeprecationCompatibility;
@end

@implementation UIImage(PSIconImageCacheDeprecationCompatibility)

+ (id)ps_settingsIconImageDescriptor
{
  v0 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2B8]];
  [v0 setDrawBorder:1];
  v1 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  objc_msgSend(v0, "setAppearance:", objc_msgSend(v1, "userInterfaceStyle") != 1);

  v2 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  if ([v2 layoutDirection]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [v0 setLanguageDirection:v3];

  v4 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  objc_msgSend(v0, "setContrast:", objc_msgSend(v4, "accessibilityContrast") == 1);

  return v0;
}

+ (id)ps_synchronousIconWithApplicationBundleIdentifier:()PSIconImageCacheDeprecationCompatibility
{
  v4 = (objc_class *)MEMORY[0x1E4F6F248];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithBundleIdentifier:v5];

  v7 = objc_msgSend(a1, "ps_settingsIconImageDescriptor");
  v8 = [v6 prepareImageForDescriptor:v7];

  v9 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v10 = [v8 CGImage];
  [v8 scale];
  v11 = objc_msgSend(v9, "imageWithCGImage:scale:orientation:", v10, 0);

  return v11;
}

+ (id)ps_synchronousIconWithTypeIdentifier:()PSIconImageCacheDeprecationCompatibility
{
  v4 = (objc_class *)MEMORY[0x1E4F6F248];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithType:v5];

  v7 = objc_msgSend(a1, "ps_settingsIconImageDescriptor");
  v8 = [v6 prepareImageForDescriptor:v7];

  v9 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v10 = [v8 CGImage];
  [v8 scale];
  v11 = objc_msgSend(v9, "imageWithCGImage:scale:orientation:", v10, 0);

  return v11;
}

@end