@interface NSBundle(SafariCoreExtras)
+ (__CFString)safari_safariApplicationPlatformBundleIdentifier;
+ (id)safari_passwordsAppBundle;
+ (id)safari_safariCoreBundle;
+ (id)safari_safariInjectedBundleURL;
+ (uint64_t)safari_currentTemplateAppName;
+ (uint64_t)safari_isICloudAppWithBundleIdentifier:()SafariCoreExtras;
+ (uint64_t)safari_isMobileSafariInstalled;
+ (uint64_t)safari_isSafariFamilyBundleIdentifier:()SafariCoreExtras;
- (id)safari_displayName;
- (id)safari_localizedDisplayName;
- (id)safari_localizedShortVersion;
- (id)safari_normalizedVersion;
- (id)safari_shortVersion;
- (id)safari_version;
- (uint64_t)safari_isInSyncAgent;
- (uint64_t)safari_isPasswordsAppBundle;
- (uint64_t)safari_isPasswordsMenuBarAppBundle;
- (uint64_t)safari_isSafariFamilyApplicationBundle;
- (uint64_t)safari_isSafariWidgetExtensionBundle;
- (uint64_t)safari_primaryLocalizationIsEnglish;
@end

@implementation NSBundle(SafariCoreExtras)

- (id)safari_shortVersion
{
  v1 = [a1 infoDictionary];
  v2 = objc_msgSend(v1, "safari_stringForKey:", *MEMORY[0x1E4F1CC70]);

  return v2;
}

- (id)safari_normalizedVersion
{
  v1 = objc_msgSend(a1, "safari_version");
  v2 = objc_msgSend(v1, "safari_stringByNormalizingVersionString");

  return v2;
}

- (id)safari_version
{
  v1 = [a1 infoDictionary];
  v2 = objc_msgSend(v1, "safari_stringForKey:", *MEMORY[0x1E4F1D020]);

  return v2;
}

- (uint64_t)safari_isPasswordsMenuBarAppBundle
{
  return 0;
}

+ (id)safari_safariCoreBundle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__NSBundle_SafariCoreExtras__safari_safariCoreBundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_safariCoreBundle_onceToken != -1) {
    dispatch_once(&safari_safariCoreBundle_onceToken, block);
  }
  v1 = (void *)safari_safariCoreBundle_bundle;
  return v1;
}

- (uint64_t)safari_isPasswordsAppBundle
{
  v1 = [a1 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.Passwords"];

  return v2;
}

- (uint64_t)safari_isSafariFamilyApplicationBundle
{
  v1 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v2 = [a1 bundleIdentifier];
  uint64_t v3 = objc_msgSend(v1, "safari_isSafariFamilyBundleIdentifier:", v2);

  return v3;
}

- (uint64_t)safari_isInSyncAgent
{
  v1 = [a1 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.SafariBookmarksSyncAgent"];

  return v2;
}

+ (uint64_t)safari_isSafariFamilyBundleIdentifier:()SafariCoreExtras
{
  id v3 = a3;
  if ((objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", @"com.apple.Safari") & 1) != 0
    || (objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", @"com.apple.Safari.automation") & 1) != 0
    || (objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", @"com.apple.SafariTechnologyPreview") & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", @"com.apple.mobilesafari");
  }

  return v4;
}

+ (__CFString)safari_safariApplicationPlatformBundleIdentifier
{
  return @"com.apple.mobilesafari";
}

+ (id)safari_safariInjectedBundleURL
{
  if (safari_safariInjectedBundleURL_onceToken != -1) {
    dispatch_once(&safari_safariInjectedBundleURL_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)safari_safariInjectedBundleURL_bundleURL;
  return v0;
}

+ (uint64_t)safari_currentTemplateAppName
{
  return 0;
}

- (id)safari_displayName
{
  v1 = [a1 infoDictionary];
  uint64_t v2 = objc_msgSend(v1, "safari_stringForKey:", *MEMORY[0x1E4F1CC48]);
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    objc_msgSend(v1, "safari_stringForKey:", *MEMORY[0x1E4F1D008]);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)safari_localizedDisplayName
{
  uint64_t v2 = [a1 localizedInfoDictionary];
  id v3 = objc_msgSend(v2, "safari_stringForKey:", *MEMORY[0x1E4F1CC48]);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "safari_displayName");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)safari_localizedShortVersion
{
  uint64_t v2 = [a1 localizedInfoDictionary];
  id v3 = objc_msgSend(v2, "safari_stringForKey:", *MEMORY[0x1E4F1CC70]);

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "safari_shortVersion");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return v5;
}

+ (uint64_t)safari_isMobileSafariInstalled
{
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v1 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariApplicationPlatformBundleIdentifier");
  uint64_t v2 = [v0 applicationIsInstalled:v1];

  return v2;
}

- (uint64_t)safari_primaryLocalizationIsEnglish
{
  v1 = [a1 preferredLocalizations];
  if ([v1 count])
  {
    uint64_t v2 = [v1 objectAtIndexedSubscript:0];
    uint64_t v3 = [v2 isEqualToString:@"English"];
  }
  else
  {
    uint64_t v3 = 1;
  }

  return v3;
}

- (uint64_t)safari_isSafariWidgetExtensionBundle
{
  v1 = [a1 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.mobilesafari.SafariWidgetExtension"];

  return v2;
}

+ (uint64_t)safari_isICloudAppWithBundleIdentifier:()SafariCoreExtras
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"com.apple.CloudKit.ShareBear";
  v8[1] = @"com.apple.bird";
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:v8 count:2];
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)safari_passwordsAppBundle
{
  v1 = (void *)safari_passwordsAppBundle_bundle;
  if (!safari_passwordsAppBundle_bundle)
  {
    uint64_t v2 = [a1 bundleWithIdentifier:@"com.apple.Passwords"];
    uint64_t v3 = (void *)safari_passwordsAppBundle_bundle;
    safari_passwordsAppBundle_bundle = v2;

    v1 = (void *)safari_passwordsAppBundle_bundle;
  }
  return v1;
}

@end