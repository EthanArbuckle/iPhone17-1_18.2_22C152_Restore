@interface NDOAppleSupportManager
- (id)_imageAppropriateForDevice:(id)a3;
- (id)checkAppIsPurchased:(id)a3;
- (void)appSupportAvailability:(id)a3 withReply:(id)a4;
- (void)checkIsAvailableInStore:(id)a3 withReply:(id)a4;
@end

@implementation NDOAppleSupportManager

- (id)_imageAppropriateForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v4 = (void *)getUIScreenClass_softClass;
  uint64_t v21 = getUIScreenClass_softClass;
  if (!getUIScreenClass_softClass)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __getUIScreenClass_block_invoke;
    v16 = &unk_264E26510;
    v17 = &v18;
    __getUIScreenClass_block_invoke((uint64_t)&v13);
    v4 = (void *)v19[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v18, 8);
  v6 = [v5 mainScreen];
  [v6 scale];
  double v8 = v7;

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v9 = (void *)getUIImageClass_softClass;
  uint64_t v21 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __getUIImageClass_block_invoke;
    v16 = &unk_264E26510;
    v17 = &v18;
    __getUIImageClass_block_invoke((uint64_t)&v13);
    v9 = (void *)v19[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v18, 8);
  v11 = [v10 _applicationIconImageForBundleIdentifier:v3 format:2 scale:v8];

  return v11;
}

- (void)checkIsAvailableInStore:(id)a3 withReply:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  double v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v5;
    _os_log_impl(&dword_23C013000, v7, OS_LOG_TYPE_DEFAULT, "Checking for %@ in the App Store", buf, 0xCu);
  }

  double v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v9 = [v8 objectForKey:@"AppSupportAvailability"];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    v22[0] = @"AppTitleKey";
    v22[1] = @"AppVendorName";
    v23[0] = @"Apple Support";
    v23[1] = @"Apple";
    v22[2] = @"AppAvailablityText";
    v22[3] = @"AppAvailabilityType";
    v23[2] = @"OVERRIDE";
    v23[3] = &unk_26EFA4EE8;
    v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    v6[2](v6, v11);
  }
  else
  {
    v12 = (void *)MEMORY[0x263F27B28];
    uint64_t v13 = [MEMORY[0x263F27D18] bagSubProfile];
    uint64_t v14 = [MEMORY[0x263F27D18] bagSubProfileVersion];
    v11 = [v12 bagForProfile:v13 profileVersion:v14];

    v15 = (void *)[objc_alloc(MEMORY[0x263F27D18]) initWithType:0 clientIdentifier:@"com.apple.preferences.applesupport" clientVersion:@"1" bag:v11];
    id v21 = v5;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    [v15 setBundleIdentifiers:v16];

    v17 = [v15 perform];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __60__NDOAppleSupportManager_checkIsAvailableInStore_withReply___block_invoke;
    v18[3] = &unk_264E26498;
    id v19 = v5;
    uint64_t v20 = v6;
    [v17 addFinishBlock:v18];
  }
}

void __60__NDOAppleSupportManager_checkIsAvailableInStore_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (!v5 || v6)
  {
    v32 = _NDOLogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v43 = v33;
      __int16 v44 = 2112;
      v45 = v7;
      _os_log_impl(&dword_23C013000, v32, OS_LOG_TYPE_DEFAULT, "Lookup for %@ in the App Store failed with error %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    double v8 = [v5 responseDataItems];
    uint64_t v9 = [v8 count];

    if (v9 == 1)
    {
      int v10 = [v5 responseDataItems];
      v11 = [v10 firstObject];

      v12 = [v11 objectForKeyedSubscript:@"attributes"];
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      v15 = 0;
      v16 = 0;
      if (v11 && v12)
      {
        uint64_t v14 = [v12 objectForKeyedSubscript:@"artistName"];
        v15 = [v13 objectForKeyedSubscript:@"name"];
        v36 = [v13 objectForKeyedSubscript:@"platformAttributes"];
        [v36 objectForKeyedSubscript:@"ios"];
        v17 = v37 = v11;
        uint64_t v18 = [v17 objectForKeyedSubscript:@"artwork"];
        uint64_t v19 = [v18 objectForKeyedSubscript:@"url"];
        uint64_t v20 = (void *)v19;
        id v21 = &stru_26EF9F650;
        if (v19) {
          id v21 = (__CFString *)v19;
        }
        v16 = v21;

        v11 = v37;
      }
      uint64_t v22 = [v13 objectForKeyedSubscript:@"url"];
      v23 = (void *)v22;
      v24 = &stru_26EF9F650;
      if (v22) {
        v24 = (__CFString *)v22;
      }
      id v25 = v24;

      if ([(__CFString *)v25 length])
      {
        uint64_t v26 = [(__CFString *)v25 stringByAppendingString:@"?pt=2003&ct=coverage.settings&mt=8"];

        id v25 = (__CFString *)v26;
      }
      uint64_t v27 = *(void *)(a1 + 40);
      v40[0] = @"AppLinkURL";
      v40[1] = @"AppIconURL";
      if (v16) {
        v28 = v16;
      }
      else {
        v28 = &stru_26EF9F650;
      }
      v41[0] = v25;
      v41[1] = v28;
      if (v15) {
        v29 = v15;
      }
      else {
        v29 = &stru_26EF9F650;
      }
      v40[2] = @"AppTitleKey";
      v40[3] = @"AppVendorName";
      if (v14) {
        v30 = v14;
      }
      else {
        v30 = &stru_26EF9F650;
      }
      v41[2] = v29;
      v41[3] = v30;
      v40[4] = @"AppAvailablityText";
      v40[5] = @"AppAvailabilityType";
      v41[4] = @"Free – On the App Store";
      v41[5] = &unk_26EFA4F00;
      v31 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:6];
      (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v31);
    }
    else
    {
      uint64_t v34 = *(void *)(a1 + 40);
      v38 = @"AppAvailabilityType";
      v39 = &unk_26EFA4F18;
      v35 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      (*(void (**)(uint64_t, void *))(v34 + 16))(v34, v35);
    }
  }
}

- (id)checkAppIsPurchased:(id)a3
{
  v38[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__0;
  v32[4] = __Block_byref_object_dispose__0;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__0;
  v30[4] = __Block_byref_object_dispose__0;
  id v31 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v37 = @"AppAvailabilityType";
  v38[0] = &unk_26EFA4F18;
  v4 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
  id v29 = (id)[v4 mutableCopy];

  id v5 = objc_opt_new();
  id v6 = objc_msgSend(v5, "aida_accountForPrimaryiCloudAccount");

  double v7 = [MEMORY[0x263F25480] sharedInstance];
  id v8 = objc_alloc_init(MEMORY[0x263F25490]);
  uint64_t v9 = objc_msgSend(v6, "ams_DSID");
  objc_msgSend(v8, "setAccountID:", objc_msgSend(v9, "integerValue"));

  id v36 = v3;
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
  [v8 setBundleIDs:v10];

  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __46__NDOAppleSupportManager_checkAppIsPurchased___block_invoke;
  v17[3] = &unk_264E264C0;
  id v12 = v3;
  id v18 = v12;
  uint64_t v20 = v30;
  id v21 = v32;
  uint64_t v22 = v34;
  v23 = &v24;
  uint64_t v13 = v11;
  uint64_t v19 = v13;
  [v7 executeQuery:v8 withResultHandler:v17];
  dispatch_time_t v14 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v13, v14);
  id v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  return v15;
}

void __46__NDOAppleSupportManager_checkAppIsPurchased___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "bundleID", (void)v27);
        int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

        if (v10)
        {
          uint64_t v11 = [v8 title];
          id v12 = (void *)v11;
          if (v11) {
            uint64_t v13 = (__CFString *)v11;
          }
          else {
            uint64_t v13 = @"== Apple Support ==";
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v13);

          uint64_t v14 = [v8 developerName];
          id v15 = (void *)v14;
          if (v14) {
            v16 = (__CFString *)v14;
          }
          else {
            v16 = @"== Apple ==";
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v16);

          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
          v17 = [v8 productURL];
          uint64_t v18 = [v17 absoluteString];
          uint64_t v19 = (void *)v18;
          uint64_t v20 = &stru_26EF9F650;
          if (v18) {
            uint64_t v20 = (__CFString *)v18;
          }
          id v21 = v20;

          if ([(__CFString *)v21 length])
          {
            uint64_t v22 = [(__CFString *)v21 stringByAppendingString:@"?pt=2003&ct=coverage.settings&mt=8"];

            id v21 = (__CFString *)v22;
          }
          v23 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          v31[0] = @"AppLinkURL";
          v31[1] = @"AppTitleKey";
          uint64_t v24 = *(void *)(a1 + 56);
          uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          v32[0] = v21;
          v32[1] = v25;
          v31[2] = @"AppVendorName";
          v32[2] = *(void *)(*(void *)(v24 + 8) + 40);
          v32[3] = @"DOWNLOAD";
          v31[3] = @"AppAvailablityText";
          v31[4] = @"AppAvailabilityType";
          v32[4] = &unk_26EFA4F30;
          uint64_t v26 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:5];
          [v23 addEntriesFromDictionary:v26];

          goto LABEL_21;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)appSupportAvailability:(id)a3 withReply:(id)a4
{
  v41[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = (void (**)(id, void))a4;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v40 = @"AppBundleID";
  v41[0] = v6;
  id v8 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
  id v33 = (id)[v8 mutableCopy];

  uint64_t v9 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v6];
  int v10 = [v9 appState];
  int v11 = [v10 isInstalled];

  if (v11)
  {
    id v12 = [v9 vendorName];
    uint64_t v13 = [v9 localizedName];
    uint64_t v14 = _NDOLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v37 = v6;
      __int16 v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_23C013000, v14, OS_LOG_TYPE_DEFAULT, "appSupportAvailability %@ %@ is installed.", buf, 0x16u);
    }

    id v15 = (void *)v29[5];
    v16 = &stru_26EF9F650;
    v34[0] = @"AppTitleKey";
    v34[1] = @"AppVendorName";
    if (v13) {
      v17 = v13;
    }
    else {
      v17 = &stru_26EF9F650;
    }
    if (v12) {
      v16 = v12;
    }
    v35[0] = v17;
    v35[1] = v16;
    v34[2] = @"AppAvailablityText";
    uint64_t v18 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
    uint64_t v19 = [v18 localizedStringForKey:@"INSTALLED" value:&stru_26EF9F650 table:@"Localizable"];
    void v34[3] = @"AppAvailabilityType";
    v35[2] = v19;
    v35[3] = &unk_26EFA4EE8;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
    [v15 addEntriesFromDictionary:v20];

    v7[2](v7, v29[5]);
    goto LABEL_16;
  }
  id v21 = [(NDOAppleSupportManager *)self checkAppIsPurchased:v6];
  id v12 = v21;
  if (!v21
    || ([(__CFString *)v21 objectForKey:@"AppAvailabilityType"],
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        BOOL v23 = [v22 intValue] == 0,
        v22,
        v23))
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __59__NDOAppleSupportManager_appSupportAvailability_withReply___block_invoke;
    v25[3] = &unk_264E264E8;
    long long v27 = &v28;
    uint64_t v26 = v7;
    [(NDOAppleSupportManager *)self checkIsAvailableInStore:v6 withReply:v25];
    uint64_t v13 = v26;
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v24 = _NDOLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v6;
    _os_log_impl(&dword_23C013000, v24, OS_LOG_TYPE_DEFAULT, "appSupportAvailability %@ is purchased.", buf, 0xCu);
  }

  [(id)v29[5] addEntriesFromDictionary:v12];
  v7[2](v7, v29[5]);
LABEL_17:

  _Block_object_dispose(&v28, 8);
}

void __59__NDOAppleSupportManager_appSupportAvailability_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_23C013000, v4, OS_LOG_TYPE_DEFAULT, "AppStore --> appSupportAvailability %@.", (uint8_t *)&v5, 0xCu);
  }

  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addEntriesFromDictionary:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end