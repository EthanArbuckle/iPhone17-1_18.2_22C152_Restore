@interface NSExtension(SafariSharedExtras)
- (id)_safari_containingAppRecord;
- (id)_safari_stringFromContainingAppInfoPlistWithKey:()SafariSharedExtras;
- (id)safari_containingAppAdamID;
- (id)safari_correspondingMacOSExtensionBundleIdentifier;
- (id)safari_displayVersion;
- (id)safari_humanReadableDescription;
- (id)safari_launchServicesDeveloperIdentifier;
- (id)safari_launchServicesDeveloperName;
- (id)safari_localizedContainingAppDisplayName;
- (id)safari_localizedDisplayName;
- (id)sf_uniqueIdentifier;
- (uint64_t)safari_containingAppIsTestFlightApp;
- (uint64_t)safari_correspondingMacOSContainingAppBundleIdentifier;
- (uint64_t)safari_isTestExtension;
- (uint64_t)safari_isUnsignedExtension;
- (void)_safari_containingAppRecord;
@end

@implementation NSExtension(SafariSharedExtras)

- (id)sf_uniqueIdentifier
{
  v1 = [a1 _plugIn];
  v2 = [v1 uuid];

  return v2;
}

- (id)safari_humanReadableDescription
{
  v1 = [a1 _extensionBundle];
  v2 = [v1 localizedInfoDictionary];
  v3 = objc_msgSend(v2, "safari_stringForKey:", @"NSHumanReadableDescription");
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [v1 infoDictionary];
    objc_msgSend(v6, "safari_stringForKey:", @"NSHumanReadableDescription");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)safari_localizedDisplayName
{
  v1 = [a1 _extensionBundle];
  v2 = objc_msgSend(v1, "safari_localizedDisplayName");

  return v2;
}

- (id)safari_displayVersion
{
  v1 = [a1 _extensionBundle];
  v2 = objc_msgSend(v1, "safari_localizedShortVersion");

  return v2;
}

- (id)safari_localizedContainingAppDisplayName
{
  v1 = [a1 _plugIn];
  v2 = [v1 containingUrl];

  if (v2)
  {
    v3 = [v1 localizedContainingName];
    v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E4F28B50];
      v7 = [v1 containingUrl];
      v8 = [v6 bundleWithURL:v7];
      objc_msgSend(v8, "safari_localizedDisplayName");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)safari_launchServicesDeveloperIdentifier
{
  v1 = objc_msgSend(a1, "_safari_containingAppRecord");
  v2 = [v1 teamIdentifier];

  return v2;
}

- (id)safari_launchServicesDeveloperName
{
  v1 = objc_msgSend(a1, "_safari_containingAppRecord");
  v2 = [v1 iTunesMetadata];
  v3 = [v2 artistName];

  return v3;
}

- (id)_safari_containingAppRecord
{
  id v2 = objc_alloc(MEMORY[0x1E4F223C8]);
  v3 = [a1 _plugIn];
  v4 = [v3 containingUrl];
  id v9 = 0;
  id v5 = (void *)[v2 initWithURL:v4 allowPlaceholder:0 error:&v9];
  id v6 = v9;

  if (!v5)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(NSExtension(SafariSharedExtras) *)v7 _safari_containingAppRecord];
    }
  }

  return v5;
}

- (id)safari_containingAppAdamID
{
  id v2 = objc_getAssociatedObject(a1, (const void *)safari_containingAppAdamID_containingAppAdamIDKey);
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = objc_msgSend(a1, "_safari_containingAppRecord");
    id v6 = v5;
    if (v5)
    {
      v7 = [v5 iTunesMetadata];
      id v4 = (id)[v7 storeItemIdentifier];

      if (v4)
      {
        v8 = [NSNumber numberWithUnsignedLongLong:v4];
        id v4 = [v8 stringValue];

        objc_setAssociatedObject(a1, (const void *)safari_containingAppAdamID_containingAppAdamIDKey, v4, (void *)1);
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  return v4;
}

- (uint64_t)safari_containingAppIsTestFlightApp
{
  v1 = objc_msgSend(a1, "_safari_containingAppRecord");
  uint64_t v2 = [v1 isBeta];

  return v2;
}

- (id)_safari_stringFromContainingAppInfoPlistWithKey:()SafariSharedExtras
{
  id v4 = a3;
  id v5 = [a1 _plugIn];
  id v6 = [v5 containingUrl];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F28B50] bundleWithURL:v6];
    v8 = [v7 infoDictionary];
    id v9 = objc_msgSend(v8, "safari_stringForKey:", v4);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)safari_correspondingMacOSExtensionBundleIdentifier
{
  v1 = [a1 _extensionBundle];
  uint64_t v2 = [v1 infoDictionary];
  v3 = objc_msgSend(v2, "safari_stringForKey:", @"SFSafariCorrespondingMacOSExtensionBundleIdentifier");

  return v3;
}

- (uint64_t)safari_correspondingMacOSContainingAppBundleIdentifier
{
  return objc_msgSend(a1, "_safari_stringFromContainingAppInfoPlistWithKey:", @"SFSafariCorrespondingMacOSAppBundleIdentifier");
}

- (uint64_t)safari_isTestExtension
{
  v1 = [a1 identifier];
  uint64_t v2 = [v1 hasPrefix:@"com.apple.Safari.TestExtensions."];

  return v2;
}

- (uint64_t)safari_isUnsignedExtension
{
  v1 = objc_msgSend(a1, "safari_launchServicesDeveloperIdentifier");
  uint64_t v2 = [v1 isEqualToString:@"0000000000"];

  return v2;
}

- (void)_safari_containingAppRecord
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = [a2 identifier];
  v7 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v8 = 138478083;
  id v9 = v6;
  __int16 v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Couldn't find LSApplicationRecord for %{private}@, error: %{public}@", (uint8_t *)&v8, 0x16u);
}

@end