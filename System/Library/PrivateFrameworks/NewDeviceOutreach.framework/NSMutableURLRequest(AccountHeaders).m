@interface NSMutableURLRequest(AccountHeaders)
- (__CFString)storeLocaleWithAccountStore:()AccountHeaders;
- (id)_deviceProductType;
- (id)_osVersion;
- (id)_userAgent;
- (id)_userAgentWithBundleID:()AccountHeaders;
- (id)bodyDescription;
- (id)headerDescription;
- (id)storeLocale;
- (uint64_t)_addGSHeadersForAccount:()AccountHeaders withStore:forceReprovisioning:avoidUI:;
- (uint64_t)ndo_signWithAccountHeaders:()AccountHeaders avoidUI:;
- (void)addBAAAuthenticationHeadersWithBody:()AccountHeaders;
- (void)addStoreLocaleHeaderIfNeeded;
- (void)ndo_addBasicHeadersWithBundleID:()AccountHeaders;
- (void)ndo_addOASHeadersWithOfferID:()AccountHeaders serialNumber:primarySerialNumber:;
- (void)ndo_setCoverageRequestBodyWithSerialNumber:()AccountHeaders primarySerialNumber:displayedEvents:;
- (void)ndo_setDeviceListRequestBodyWithSerialNumber:()AccountHeaders localDevices:primaryAccount:;
@end

@implementation NSMutableURLRequest(AccountHeaders)

- (void)ndo_addBasicHeadersWithBundleID:()AccountHeaders
{
  id v4 = a3;
  id v10 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v6 = [MEMORY[0x263F086E0] mainBundle];
    id v5 = [v6 bundleIdentifier];
  }
  v7 = [a1 _userAgentWithBundleID:v5];
  [a1 setValue:v7 forHTTPHeaderField:@"User-Agent"];

  [a1 setValue:v5 forHTTPHeaderField:@"x-apple-bundle-id"];
  v8 = [a1 _osVersion];
  [a1 setValue:v8 forHTTPHeaderField:@"x-apple-os-version"];

  v9 = [a1 _deviceProductType];
  [a1 setValue:v9 forHTTPHeaderField:@"x-apple-primary-device-model"];
}

- (uint64_t)ndo_signWithAccountHeaders:()AccountHeaders avoidUI:
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v7 = objc_opt_new();
  v8 = objc_msgSend(v7, "aida_accountForPrimaryiCloudAccount");
  if (!v8)
  {
    v11 = _NDOLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v20 = "No primary iCloud account, can't sign this request";
LABEL_15:
      _os_log_impl(&dword_23C013000, v11, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    }
LABEL_16:
    uint64_t v19 = 0;
    goto LABEL_17;
  }
  if (([a1 _addGSHeadersForAccount:v8 withStore:v7 forceReprovisioning:a3 avoidUI:a4] & 1) == 0)
  {
    v11 = _NDOLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v20 = "Failed to add GS headers, can't sign this request";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  objc_msgSend(a1, "ak_addClientInfoHeader");
  objc_msgSend(a1, "ak_addDeviceUDIDHeader");
  v9 = objc_opt_new();
  id v10 = [v9 appleIDHeadersForRequest:a1];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v17 = -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v16, (void)v22);
        [a1 setValue:v17 forHTTPHeaderField:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v13);
  }

  v18 = objc_msgSend(v8, "aa_altDSID");
  [a1 setValue:v18 forHTTPHeaderField:@"altDSID"];

  [a1 addStoreLocaleHeaderIfNeeded];
  uint64_t v19 = 1;
LABEL_17:

  return v19;
}

- (void)ndo_setDeviceListRequestBodyWithSerialNumber:()AccountHeaders localDevices:primaryAccount:
{
  v28[5] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v22 = a3;
  [a1 setHTTPMethod:@"POST"];
  [a1 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v7 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __112__NSMutableURLRequest_AccountHeaders__ndo_setDeviceListRequestBodyWithSerialNumber_localDevices_primaryAccount___block_invoke;
  v23[3] = &unk_264E26570;
  id v24 = v7;
  id v21 = v7;
  [v6 enumerateObjectsUsingBlock:v23];

  v26[1] = v21;
  v27[0] = @"devicesInfo";
  v25[0] = @"primarySN";
  v25[1] = @"localDevices";
  v26[0] = v22;
  v8 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  v28[0] = v8;
  v27[1] = @"storefrontLocale";
  v9 = [a1 storeLocale];
  v28[1] = v9;
  v27[2] = @"locale";
  id v10 = [MEMORY[0x263EFF960] preferredLocale];
  v11 = [v10 localeIdentifier];
  v28[2] = v11;
  v27[3] = @"requestTimestamp";
  uint64_t v12 = NSNumber;
  uint64_t v13 = [MEMORY[0x263EFF910] date];
  [v13 timeIntervalSince1970];
  v15 = [v12 numberWithUnsignedLongLong:(unint64_t)(v14 * 1000.0)];
  v28[3] = v15;
  v27[4] = @"requestTimezone";
  uint64_t v16 = NSNumber;
  v17 = [MEMORY[0x263EFFA18] localTimeZone];
  v18 = objc_msgSend(v16, "numberWithInt:", ((int)objc_msgSend(v17, "secondsFromGMT") / 3600));
  v28[4] = v18;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:5];

  v20 = [MEMORY[0x263F08900] dataWithJSONObject:v19 options:0 error:0];
  [a1 setHTTPBody:v20];
}

- (void)ndo_setCoverageRequestBodyWithSerialNumber:()AccountHeaders primarySerialNumber:displayedEvents:
{
  v30[5] = *MEMORY[0x263EF8340];
  v8 = a3;
  v9 = a4;
  id v26 = a5;
  [a1 setHTTPMethod:@"POST"];
  [a1 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = @"empty";
  }
  v11 = v10;
  if (v9) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = @"empty";
  }
  v29[0] = @"serialNumber";
  v29[1] = @"x-apple-primary-sn";
  v27 = v12;
  uint64_t v28 = v11;
  v30[0] = v11;
  v30[1] = v27;
  v29[2] = @"locale";
  uint64_t v13 = [MEMORY[0x263EFF960] preferredLocale];
  double v14 = [v13 localeIdentifier];
  v30[2] = v14;
  v29[3] = @"requestTimestamp";
  v15 = NSNumber;
  uint64_t v16 = [MEMORY[0x263EFF910] date];
  [v16 timeIntervalSince1970];
  v18 = [v15 numberWithUnsignedLongLong:(unint64_t)(v17 * 1000.0)];
  v30[3] = v18;
  v29[4] = @"requestTimezone";
  uint64_t v19 = NSNumber;
  v20 = [MEMORY[0x263EFFA18] localTimeZone];
  id v21 = objc_msgSend(v19, "numberWithInt:", ((int)objc_msgSend(v20, "secondsFromGMT") / 3600));
  v30[4] = v21;
  id v22 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:5];

  long long v23 = (void *)[v22 mutableCopy];
  id v24 = v23;
  if (v26) {
    [v23 setObject:v26 forKey:@"displayedEvents"];
  }
  long long v25 = [MEMORY[0x263F08900] dataWithJSONObject:v24 options:0 error:0];
  [a1 setHTTPBody:v25];
}

- (void)ndo_addOASHeadersWithOfferID:()AccountHeaders serialNumber:primarySerialNumber:
{
  id v8 = a5;
  id v9 = a3;
  [a1 setValue:a4 forHTTPHeaderField:@"X-Apple-SN"];
  [a1 setValue:v8 forHTTPHeaderField:@"x-apple-primary-sn"];

  id v10 = [MEMORY[0x263F08C38] UUID];
  v11 = [v10 UUIDString];
  [a1 setValue:v11 forHTTPHeaderField:@"X-Apple-Txn-ID"];

  id v12 = (id)CFPreferencesCopyAppValue(@"UIPreferredContentSizeCategoryName", @"com.apple.UIKit");
  [a1 setValue:v12 forHTTPHeaderField:@"X-Apple-Content-Size"];
  [a1 setValue:@"No" forHTTPHeaderField:@"X-Apple-DM"];
  [a1 setValue:v9 forHTTPHeaderField:@"Offer-ID"];

  [a1 addStoreLocaleHeaderIfNeeded];
}

- (id)storeLocale
{
  v2 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  v3 = [a1 storeLocaleWithAccountStore:v2];

  return v3;
}

- (__CFString)storeLocaleWithAccountStore:()AccountHeaders
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v5 = [v4 objectForKey:@"storefrontLocale"];

  if (+[NDOTypeChecking isNotEmptyString:v5])
  {
    id v6 = v5;
    goto LABEL_15;
  }
  v7 = objc_msgSend(v3, "ams_activeiTunesAccount");
  if (!v7)
  {
    id v8 = _NDOLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136446210;
      v27 = "-[NSMutableURLRequest(AccountHeaders) storeLocaleWithAccountStore:]";
      _os_log_impl(&dword_23C013000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s No active itunes account. Falling back to local account", (uint8_t *)&v26, 0xCu);
    }

    v7 = objc_msgSend(v3, "ams_localiTunesAccount");
    if (!v7) {
      goto LABEL_11;
    }
  }
  objc_msgSend(v7, "ams_storefront");
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!+[NDOTypeChecking isNotEmptyString:v6])
  {
    id v9 = _NDOLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NSMutableURLRequest(AccountHeaders) storeLocaleWithAccountStore:](v9, v10, v11, v12, v13, v14, v15, v16);
    }

LABEL_11:
    double v17 = _NDOLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[NSMutableURLRequest(AccountHeaders) storeLocaleWithAccountStore:](v17, v18, v19, v20, v21, v22, v23, v24);
    }

    id v6 = &stru_26EF9F650;
  }

LABEL_15:
  return v6;
}

- (void)addStoreLocaleHeaderIfNeeded
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = [a1 valueForHTTPHeaderField:@"storefrontLocale"];
  if (v2)
  {
    id v3 = _NDOLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_impl(&dword_23C013000, v3, OS_LOG_TYPE_DEFAULT, "storeLocale already set to %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    id v3 = [a1 storeLocale];
    [a1 setValue:v3 forHTTPHeaderField:@"storefrontLocale"];
    id v4 = _NDOLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_23C013000, v4, OS_LOG_TYPE_DEFAULT, "storeLocale %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)headerDescription
{
  v1 = NSString;
  v2 = [a1 allHTTPHeaderFields];
  id v3 = [v1 stringWithFormat:@"%@", v2];

  return v3;
}

- (id)bodyDescription
{
  id v2 = [NSString alloc];
  id v3 = [a1 HTTPBody];
  id v4 = (void *)[v2 initWithData:v3 encoding:4];

  return v4;
}

- (uint64_t)_addGSHeadersForAccount:()AccountHeaders withStore:forceReprovisioning:avoidUI:
{
  v41[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = objc_msgSend(v11, "aida_accountForiCloudAccount:", v10);
  uint64_t v13 = v12;
  if (!v12)
  {
    uint64_t v15 = _NDOLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_23C013000, v15, OS_LOG_TYPE_DEFAULT, "GrandSlam signing failed because no GS account was provided.", v34, 2u);
    }
    goto LABEL_16;
  }
  uint64_t v14 = objc_msgSend(v12, "aida_alternateDSID");

  if (!v14)
  {
    uint64_t v15 = _NDOLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[NSMutableURLRequest(AccountHeaders) _addGSHeadersForAccount:withStore:forceReprovisioning:avoidUI:](v15);
    }
LABEL_16:
    uint64_t v22 = 0;
    goto LABEL_17;
  }
  uint64_t v15 = [v11 credentialForAccount:v13 serviceID:@"com.apple.gs.supportapp.auth"];
  *(void *)v34 = 0;
  v35 = v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__1;
  v38 = __Block_byref_object_dispose__1;
  id v39 = [v15 token];
  if (*((void *)v35 + 5)) {
    BOOL v16 = a5 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16) {
    goto LABEL_10;
  }
  double v17 = _NDOLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23C013000, v17, OS_LOG_TYPE_DEFAULT, "Reprovision GS tokens", buf, 2u);
  }

  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  v40[0] = *MEMORY[0x263EFB388];
  uint64_t v19 = [NSNumber numberWithBool:a6];
  v40[1] = *MEMORY[0x263EFB380];
  v41[0] = v19;
  v41[1] = &unk_26EFA4FA8;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  v27 = __101__NSMutableURLRequest_AccountHeaders___addGSHeadersForAccount_withStore_forceReprovisioning_avoidUI___block_invoke;
  uint64_t v28 = &unk_264E26598;
  id v29 = v11;
  id v30 = v13;
  v32 = v34;
  uint64_t v21 = v18;
  v31 = v21;
  [v29 renewCredentialsForAccount:v30 options:v20 completion:&v25];
  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);

  if (*((void *)v35 + 5))
  {
LABEL_10:
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v25, v26, v27, v28);
    uint64_t v22 = 1;
  }
  else
  {
    uint64_t v24 = _NDOLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C013000, v24, OS_LOG_TYPE_DEFAULT, "Error: still no GS token even after calling renewCredentialsForAccount.", buf, 2u);
    }

    uint64_t v22 = 0;
  }
  _Block_object_dispose(v34, 8);

LABEL_17:
  return v22;
}

- (id)_osVersion
{
  v0 = (void *)MGCopyAnswer();
  return v0;
}

- (id)_deviceProductType
{
  v0 = (void *)MGCopyAnswer();
  return v0;
}

- (id)_userAgent
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];

  id v4 = [a1 _userAgentWithBundleID:v3];

  return v4;
}

- (id)_userAgentWithBundleID:()AccountHeaders
{
  id v4 = a3;
  int v5 = [a1 _osVersion];
  id v6 = [a1 _deviceProductType];
  uint64_t v7 = [NSString stringWithFormat:@"<%@/%@/%@>", v4, v5, v6];

  return v7;
}

- (void)addBAAAuthenticationHeadersWithBody:()AccountHeaders
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v22 = "-[NSMutableURLRequest(AccountHeaders) addBAAAuthenticationHeadersWithBody:]";
    _os_log_impl(&dword_23C013000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: Initiating device authentication", buf, 0xCu);
  }

  id v6 = objc_opt_new();
  uint64_t v7 = [v6 generateBAACertficate:&__block_literal_global_0];
  id v8 = _NDOLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [NSNumber numberWithBool:v7];
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v9;
    _os_log_impl(&dword_23C013000, v8, OS_LOG_TYPE_DEFAULT, "BAA certificate generation success: %@", buf, 0xCu);
  }
  if (v7)
  {
    id v20 = 0;
    int v10 = [v6 addBAAAuthenticationHeadersToRequest:a1 withBody:v4 error:&v20];
    id v11 = v20;
    uint64_t v12 = _NDOLogSystem();
    uint64_t v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23C013000, v13, OS_LOG_TYPE_DEFAULT, "Device authentication successful", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[NSMutableURLRequest(AccountHeaders) addBAAAuthenticationHeadersWithBody:]((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)storeLocaleWithAccountStore:()AccountHeaders .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)storeLocaleWithAccountStore:()AccountHeaders .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addGSHeadersForAccount:()AccountHeaders withStore:forceReprovisioning:avoidUI:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23C013000, log, OS_LOG_TYPE_ERROR, "GrandSlam signing failed because no there's no altDSID on the account.", v1, 2u);
}

- (void)addBAAAuthenticationHeadersWithBody:()AccountHeaders .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end