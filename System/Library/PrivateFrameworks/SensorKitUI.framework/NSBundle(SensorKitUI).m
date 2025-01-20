@interface NSBundle(SensorKitUI)
+ (uint64_t)skui_bundle;
+ (void)skui_bundleForAuthorizationService:()SensorKitUI;
- (uint64_t)srui_localizedAuthorizationConfirmationDetail;
- (uint64_t)srui_localizedPrivacyPolicyLinkTitle;
- (uint64_t)srui_localizedResearchPurpose;
- (uint64_t)srui_localizedStudyDataAlertTitleWithAuthGroupName:()SensorKitUI;
@end

@implementation NSBundle(SensorKitUI)

+ (uint64_t)skui_bundle
{
  v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = [NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/SensorKitUI.framework" isDirectory:1];
  return [v0 bundleWithURL:v1];
}

+ (void)skui_bundleForAuthorizationService:()SensorKitUI
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v25[0] = [NSURL fileURLWithPath:@"/var/mobile/Library/SensorKit/AuthGroups" isDirectory:1 relativeToURL:0];
  v25[1] = [NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/SensorKitUI.framework/AuthGroups" isDirectory:1 relativeToURL:0];
  id obj = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  uint64_t v13 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (!v13) {
    return 0;
  }
  uint64_t v15 = *(void *)v21;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v21 != v15) {
        objc_enumerationMutation(obj);
      }
      v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", *(void *)(*((void *)&v20 + 1) + 8 * i), 0, 4, 0);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v17;
LABEL_8:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = (void *)[MEMORY[0x263F086E0] bundleWithURL:*(void *)(*((void *)&v16 + 1) + 8 * v9)];
          if (v10)
          {
            v11 = v10;
            if (objc_msgSend((id)objc_msgSend(v10, "objectForInfoDictionaryKey:", @"SRAuthService"), "isEqualToString:", a3) & 1) != 0|| (objc_msgSend((id)objc_msgSend(v11, "objectForInfoDictionaryKey:", @"SRWriterAuthService"), "isEqualToString:", a3))
            {
              return v11;
            }
          }
          if (v7 == ++v9)
          {
            uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v7) {
              goto LABEL_8;
            }
            break;
          }
        }
      }
    }
    v11 = 0;
    uint64_t v13 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v13) {
      continue;
    }
    return v11;
  }
}

- (uint64_t)srui_localizedPrivacyPolicyLinkTitle
{
  uint64_t v1 = objc_msgSend(a1, "sr_bundleType");
  if (v1 == 1)
  {
    uint64_t v2 = 35;
  }
  else
  {
    if (v1 != 2) {
      return 0;
    }
    uint64_t v2 = 34;
  }
  v3 = NSString;
  return objc_msgSend(v3, "srui_localizedStringForCode:", v2);
}

- (uint64_t)srui_localizedResearchPurpose
{
  uint64_t v1 = objc_msgSend(a1, "sr_bundleType");
  if (v1 == 1)
  {
    uint64_t v2 = 76;
  }
  else
  {
    if (v1 != 2) {
      return 0;
    }
    uint64_t v2 = 77;
  }
  v3 = NSString;
  return objc_msgSend(v3, "srui_localizedStringForCode:", v2);
}

- (uint64_t)srui_localizedStudyDataAlertTitleWithAuthGroupName:()SensorKitUI
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(a1, "sr_bundleType");
  if (v5 == 2)
  {
    uint64_t v11 = 0;
    uint64_t v9 = objc_msgSend(NSString, "srui_localizedStringForCode:", 38);
    uint64_t v7 = [NSString stringWithValidatedFormat:v9, @"%@%@", &v11, objc_msgSend(a1, "sk_appName"), a3 validFormatSpecifiers error];
    if (!v7)
    {
      if (_MergedGlobals_9 != -1) {
        dispatch_once(&_MergedGlobals_9, &__block_literal_global_4);
      }
      uint64_t v8 = qword_26870D090;
      if (os_log_type_enabled((os_log_t)qword_26870D090, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v13 = v11;
        goto LABEL_13;
      }
    }
  }
  else
  {
    if (v5 != 1) {
      return 0;
    }
    uint64_t v11 = 0;
    uint64_t v6 = objc_msgSend(NSString, "srui_localizedStringForCode:", 37);
    uint64_t v7 = [NSString stringWithValidatedFormat:v6, @"%@", &v11, a3 validFormatSpecifiers error];
    if (!v7)
    {
      if (_MergedGlobals_9 != -1) {
        dispatch_once(&_MergedGlobals_9, &__block_literal_global_4);
      }
      uint64_t v8 = qword_26870D090;
      if (os_log_type_enabled((os_log_t)qword_26870D090, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v13 = v11;
LABEL_13:
        _os_log_fault_impl(&dword_230B11000, v8, OS_LOG_TYPE_FAULT, "Failed to localize string because %{public}@", buf, 0xCu);
      }
    }
  }
  return v7;
}

- (uint64_t)srui_localizedAuthorizationConfirmationDetail
{
  uint64_t v1 = objc_msgSend(a1, "sr_bundleType");
  if (v1 == 1)
  {
    uint64_t v2 = 53;
  }
  else
  {
    if (v1 != 2) {
      return 0;
    }
    uint64_t v2 = 52;
  }
  v3 = NSString;
  return objc_msgSend(v3, "srui_localizedStringForCode:", v2);
}

@end