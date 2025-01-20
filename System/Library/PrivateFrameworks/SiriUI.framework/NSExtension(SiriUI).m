@interface NSExtension(SiriUI)
- (id)_siriui_extensionIconImage;
- (id)_siriui_iconImageWithFormat:()SiriUI;
- (id)siriui_displayName;
- (uint64_t)siriui_iconImage;
@end

@implementation NSExtension(SiriUI)

- (id)siriui_displayName
{
  v2 = [a1 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  if (![v2 length])
  {
    v3 = (void *)MEMORY[0x263F01868];
    v4 = (void *)MEMORY[0x263F018C0];
    v5 = [a1 identifier];
    v6 = [v4 pluginKitProxyForIdentifier:v5];
    v7 = [v6 containingBundle];
    v8 = [v7 bundleIdentifier];
    v9 = [v3 applicationProxyForIdentifier:v8];

    uint64_t v10 = [v9 localizedName];

    v2 = (void *)v10;
  }
  return v2;
}

- (uint64_t)siriui_iconImage
{
  return objc_msgSend(a1, "_siriui_iconImageWithFormat:", 5);
}

- (id)_siriui_iconImageWithFormat:()SiriUI
{
  v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 scale];
  double v7 = v6;

  v8 = objc_msgSend(a1, "_siriui_extensionIconImage");
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 _applicationIconImageForFormat:a3 precomposed:0 scale:v7];
  }
  else
  {
    v11 = (void *)MEMORY[0x263F1C6B0];
    v12 = (void *)MEMORY[0x263F018C0];
    v13 = [a1 identifier];
    v14 = [v12 pluginKitProxyForIdentifier:v13];
    uint64_t v10 = [v11 _iconForResourceProxy:v14 format:a3];
  }
  return v10;
}

- (id)_siriui_extensionIconImage
{
  if (!SiriUISystemLanguageIsRTL()
    || ([a1 objectForInfoDictionaryKey:@"CFBundleIconFilesRightToLeft"],
        (v2 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v2 = [a1 objectForInfoDictionaryKey:@"CFBundleIconFiles"];
  }
  if ([v2 count])
  {
    v3 = (void *)MEMORY[0x263F1C6B0];
    v4 = [v2 firstObject];
    v5 = (void *)MEMORY[0x263F086E0];
    double v6 = (void *)MEMORY[0x263F018C0];
    double v7 = [a1 identifier];
    v8 = [v6 pluginKitProxyForIdentifier:v7];
    v9 = [v8 bundleURL];
    uint64_t v10 = [v5 bundleWithURL:v9];
    v11 = [v3 imageNamed:v4 inBundle:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end