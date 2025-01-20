@interface ICQRequestProvider
+ (BOOL)_keyIsEligibleForURLStringReplacement:(id)a3;
+ (BOOL)attemptSetRequest:(id)a3 toPostWithJSONDict:(id)a4;
+ (id)_newAccountBagKeyForOldKey:(id)a3;
+ (id)_urlReplacementDictionaryForKey:(id)a3 withOfferID:(id)a4 withNotificationID:(id)a5;
+ (void)addEntriesToPostDictionary:(id)a3 forStub:(id)a4;
- (BOOL)willUseNewKey:(id)a3 offerID:(id)a4 notificationID:(id)a5;
- (ICQRequestProvider)initWithAccount:(id)a3;
- (id)_bagURLForKey:(id)a3 withOfferID:(id)a4 withNotificationID:(id)a5;
- (id)_stringTimeOfLastBackup;
- (id)_urlForQuotaKey:(id)a3 offerID:(id)a4 notificationID:(id)a5;
- (id)getBackupDeviceUUID;
- (id)httpMethodForKey:(id)a3 offerID:(id)a4 notificationID:(id)a5;
- (id)urlForQuotaKey:(id)a3 offerStub:(id)a4 notificationID:(id)a5;
- (id)urlForUpdateOfferWithContext:(id)a3;
- (void)_stringTimeOfLastBackup;
- (void)addBasicAndCloudBackupHeadersToRequest:(id)a3;
- (void)addBasicHeadersToRequest:(id)a3;
- (void)addCommonHeadersToRequest:(id)a3;
@end

@implementation ICQRequestProvider

- (ICQRequestProvider)initWithAccount:(id)a3
{
  id v5 = a3;
  v6 = [(ICQRequestProvider *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)urlForQuotaKey:(id)a3 offerStub:(id)a4 notificationID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([v8 isEqualToString:@"quotaOfferReset"])
  {
    v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = [v10 offerResetURL];

    v13 = [v11 URLWithString:v12];

    if (!v13)
    {
      v14 = _ICQGetLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "Missing offer reset URL for reset call", v17, 2u);
      }
    }
  }
  else
  {
    v15 = [v10 offerId];

    v13 = [(ICQRequestProvider *)self _urlForQuotaKey:v8 offerID:v15 notificationID:v9];
  }
  return v13;
}

- (id)urlForUpdateOfferWithContext:(id)a3
{
  v4 = [a3 offerId];
  id v5 = [(ICQRequestProvider *)self _urlForQuotaKey:@"quotaUpdateOfferURL" offerID:v4 notificationID:0];

  return v5;
}

- (id)_urlForQuotaKey:(id)a3 offerID:(id)a4 notificationID:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (ACAccount *)a5;
  v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412802;
    v25 = v8;
    __int16 v26 = 2112;
    v27 = v9;
    __int16 v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "Creating URL for quota key \"%@\" with offerID \"%@\" with notificationID \"%@\".", (uint8_t *)&v24, 0x20u);
  }

  uint64_t v12 = [(ICQRequestProvider *)self _bagURLForKey:v8 withOfferID:v9 withNotificationID:v10];
  if (!v12)
  {
    v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412802;
      v25 = v8;
      __int16 v26 = 2112;
      v27 = v9;
      __int16 v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "Failed to create URL string for quota key \"%@\" with offerID \"%@\" with notificationID \"%@\".", (uint8_t *)&v24, 0x20u);
    }
    goto LABEL_14;
  }
  v13 = v12;
  if (+[ICQRequestProvider _keyIsEligibleForURLStringReplacement:v8])
  {
    v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "Replacing words in URL string.", (uint8_t *)&v24, 2u);
    }

    v15 = +[ICQRequestProvider _urlReplacementDictionaryForKey:v8 withOfferID:v9 withNotificationID:v10];
    uint64_t v16 = +[_ICQHelperFunctions replaceWordsIn:v13 with:v15];

    v13 = v16;
  }
  if ([v13 containsString:@"{offerId}"])
  {
    v17 = _ICQGetLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412802;
      v25 = v8;
      __int16 v26 = 2112;
      v27 = v9;
      __int16 v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, "Failed to create URL string for quota key \"%@\" with offerID \"%@\" with notificationID \"%@\". Missing offerID!", (uint8_t *)&v24, 0x20u);
    }

LABEL_14:
    v18 = 0;
    goto LABEL_23;
  }
  v18 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
  v19 = _ICQGetLogSystem();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      int v24 = 138412802;
      v25 = v8;
      __int16 v26 = 2112;
      v27 = v9;
      __int16 v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1D5851000, v19, OS_LOG_TYPE_DEFAULT, "Created URL for quota key \"%@\" with offerID \"%@\" with notificationID \"%@\".", (uint8_t *)&v24, 0x20u);
    }

    id v21 = v18;
  }
  else
  {
    if (v20)
    {
      account = self->_account;
      int v24 = 138412802;
      v25 = v13;
      __int16 v26 = 2112;
      v27 = v8;
      __int16 v28 = 2112;
      v29 = account;
      _os_log_impl(&dword_1D5851000, v19, OS_LOG_TYPE_DEFAULT, "invalid URL string %@ for quota key %@ account %@", (uint8_t *)&v24, 0x20u);
    }
  }
LABEL_23:

  return v18;
}

- (void)addBasicHeadersToRequest:(id)a3
{
  id v13 = a3;
  objc_msgSend(v13, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  objc_msgSend(v13, "ak_addClientInfoHeader");
  v4 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  id v5 = [v4 abbreviation];
  [v13 setValue:v5 forHTTPHeaderField:@"X-MMe-Timezone"];

  v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v7 = [v6 firstObject];

  if (v7) {
    [v13 setValue:v7 forHTTPHeaderField:@"Accept-Language"];
  }
  objc_msgSend(v13, "ak_addCountryHeader");
  id v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v9 = [v8 _numberingSystem];
  [v13 setValue:v9 forHTTPHeaderField:@"X-Apple-Locale-Numbering-System"];

  id v10 = +[_ICQHelperFunctions standardDateFormat:3];
  [v13 setValue:v10 forHTTPHeaderField:@"X-Apple-Locale-Date-Format-Long"];

  v11 = +[_ICQHelperFunctions standardDateFormat:1];
  [v13 setValue:v11 forHTTPHeaderField:@"X-Apple-Locale-Date-Format-Short"];

  uint64_t v12 = (void *)MGCopyAnswer();
  if (v12) {
    [v13 setValue:v12 forHTTPHeaderField:@"X-Mme-Device-Id"];
  }
}

- (void)addBasicAndCloudBackupHeadersToRequest:(id)a3
{
  id v4 = a3;
  [(ICQRequestProvider *)self addBasicHeadersToRequest:v4];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  id v5 = (uint64_t (*)(void))getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  id v13 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke;
    v9[3] = &unk_1E6A52090;
    v9[4] = &v10;
    __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke((uint64_t)v9);
    id v5 = (uint64_t (*)(void))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v5)
  {
    id v8 = (_Unwind_Exception *)+[ICQDaemonOfferConditions isPhotosCloudEnabled]();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v8);
  }
  if ((v5() & 1) == 0)
  {
    v6 = +[ICQDaemonOfferManager ckBackupDeviceID];
    [v4 setValue:v6 forHTTPHeaderField:@"X-Apple-Cloud-Bkp-Id"];

    v7 = [(ICQRequestProvider *)self _stringTimeOfLastBackup];
    [v4 setValue:v7 forHTTPHeaderField:@"X-Apple-Cloud-Bkp-Time"];
  }
}

- (void)addCommonHeadersToRequest:(id)a3
{
  id v5 = a3;
  [(ICQRequestProvider *)self addBasicAndCloudBackupHeadersToRequest:v5];
  id v4 = [(ICQRequestProvider *)self getBackupDeviceUUID];
  [v5 setValue:v4 forHTTPHeaderField:@"X-Client-Backup-UUID"];

  objc_msgSend(v5, "ak_addAnisetteHeaders");
}

- (id)getBackupDeviceUUID
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ICQRequestProvider_getBackupDeviceUUID__block_invoke;
  block[3] = &unk_1E6A524A0;
  block[4] = self;
  if (getBackupDeviceUUID_onceToken != -1) {
    dispatch_once(&getBackupDeviceUUID_onceToken, block);
  }
  return (id)getBackupDeviceUUID_backupDeviceUUID;
}

void __41__ICQRequestProvider_getBackupDeviceUUID__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F78010]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = 0;
  id v4 = (void *)[v2 initWithAccount:v3 delegate:0 eventQueue:0 error:&v9];
  id v5 = v9;
  if (v5)
  {
    v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __41__ICQRequestProvider_getBackupDeviceUUID__block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v7 = [v4 backupDeviceUUID];
    id v8 = (void *)getBackupDeviceUUID_backupDeviceUUID;
    getBackupDeviceUUID_backupDeviceUUID = v7;

    v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = getBackupDeviceUUID_backupDeviceUUID;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "MBManager reports backupDeviceUUID as %@", buf, 0xCu);
    }
  }
}

- (id)_bagURLForKey:(id)a3 withOfferID:(id)a4 withNotificationID:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (__CFString *)a3;
  id v8 = [(ACAccount *)self->_account propertiesForDataclass:@"com.apple.Dataclass.Quota"];
  if (v7 == @"quotaRefreshOfferDetailsURL")
  {
    if (a4) {
      id v9 = @"acseGatewayV1Offer";
    }
    else {
      id v9 = @"acseGatewayV1Notification";
    }
  }
  else
  {
    id v9 = +[ICQRequestProvider _newAccountBagKeyForOldKey:v7];
  }
  uint64_t v10 = [v8 objectForKey:v9];

  uint64_t v11 = _ICQGetLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    id v13 = v9;
    if (v12)
    {
      int v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "Using new key %@ to get url from account bag.", (uint8_t *)&v16, 0xCu);
      id v13 = v9;
    }
  }
  else
  {
    id v13 = v7;
    if (v12)
    {
      int v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "Using old key \"%@\" to get url from account bag.", (uint8_t *)&v16, 0xCu);
      id v13 = v7;
    }
  }

  v14 = [v8 objectForKey:v13];

  return v14;
}

- (BOOL)willUseNewKey:(id)a3 offerID:(id)a4 notificationID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:@"quotaOfferReset"])
  {
    LOBYTE(v11) = 0;
  }
  else
  {
    BOOL v12 = [(ACAccount *)self->_account propertiesForDataclass:@"com.apple.Dataclass.Quota"];
    id v13 = [v12 objectForKey:v8];

    v14 = [(ICQRequestProvider *)self _bagURLForKey:v8 withOfferID:v9 withNotificationID:v10];
    int v11 = [v13 isEqualToString:v14] ^ 1;
  }
  return v11;
}

- (id)httpMethodForKey:(id)a3 offerID:(id)a4 notificationID:(id)a5
{
  id v8 = a3;
  if (!-[ICQRequestProvider willUseNewKey:offerID:notificationID:](self, "willUseNewKey:offerID:notificationID:", v8, a4, a5)|| ([v8 isEqualToString:@"quotaFetchOffersURL"] & 1) != 0)
  {
    goto LABEL_7;
  }
  if (([v8 isEqualToString:@"quotaRefreshOfferDetailsURL"] & 1) == 0)
  {
    if ([v8 isEqualToString:@"quotaUpdateOfferURL"])
    {
      id v9 = @"PUT";
      goto LABEL_8;
    }
LABEL_7:
    id v9 = @"POST";
    goto LABEL_8;
  }
  id v9 = @"GET";
LABEL_8:

  return v9;
}

+ (id)_urlReplacementDictionaryForKey:(id)a3 withOfferID:(id)a4 withNotificationID:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = objc_opt_new();
  id v9 = (void *)MGCopyAnswer();
  if (v9) {
    [v8 setObject:v9 forKeyedSubscript:@"{udId}"];
  }
  if (v6)
  {
    [v8 setObject:v6 forKeyedSubscript:@"{offerId}"];
  }
  else
  {
    if (v7)
    {
      id v10 = v7;
    }
    else
    {
      int v11 = [MEMORY[0x1E4F29128] UUID];
      id v10 = [v11 UUIDString];
    }
    [v8 setObject:v10 forKeyedSubscript:@"{notificationId}"];
  }
  return v8;
}

+ (BOOL)_keyIsEligibleForURLStringReplacement:(id)a3
{
  uint64_t v3 = _keyIsEligibleForURLStringReplacement__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_keyIsEligibleForURLStringReplacement__onceToken, &__block_literal_global_22);
  }
  char v5 = [(id)_keyIsEligibleForURLStringReplacement__eligibleKeys containsObject:v4];

  return v5;
}

void __60__ICQRequestProvider__keyIsEligibleForURLStringReplacement___block_invoke()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"quotaFetchOffersURL";
  v4[1] = @"quotaRefreshOfferDetailsURL";
  v4[2] = @"quotaUpdateOfferURL";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)_keyIsEligibleForURLStringReplacement__eligibleKeys;
  _keyIsEligibleForURLStringReplacement__eligibleKeys = v2;
}

+ (id)_newAccountBagKeyForOldKey:(id)a3
{
  uint64_t v3 = _newAccountBagKeyForOldKey__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_newAccountBagKeyForOldKey__onceToken, &__block_literal_global_85);
  }
  char v5 = [(id)_newAccountBagKeyForOldKey__newAccountBagKeys objectForKeyedSubscript:v4];

  return v5;
}

void __49__ICQRequestProvider__newAccountBagKeyForOldKey___block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"quotaFetchOffersURL";
  v2[1] = @"quotaUpdateOfferURL";
  v3[0] = @"acseGatewayV1Offers";
  v3[1] = @"acseGatewayV1Action";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)_newAccountBagKeyForOldKey__newAccountBagKeys;
  _newAccountBagKeyForOldKey__newAccountBagKeys = v0;
}

+ (BOOL)attemptSetRequest:(id)a3 toPostWithJSONDict:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v5 setHTTPMethod:@"POST"];
  [v5 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v12 = 0;
  id v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:1 error:&v12];
  id v8 = v12;
  if (v8)
  {
    id v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "Could not convert message body to JSON. Error: %@", buf, 0xCu);
    }

    id v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[ICQLink addPOSTParams:toRequest:]((uint64_t)v6, v10);
    }
  }
  else
  {
    [v5 setHTTPBody:v7];
  }

  return v8 == 0;
}

+ (void)addEntriesToPostDictionary:(id)a3 forStub:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 offerId];
    id v9 = [v7 conditionsWhenChosen];
    id v10 = [v7 offerResetPayload];
    if (v8)
    {
      [v5 setObject:v8 forKey:@"offerId"];
      if (v9) {
        goto LABEL_4;
      }
    }
    else
    {
      id v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "request: stub missing offerId", buf, 2u);
      }

      if (v9)
      {
LABEL_4:
        int v11 = [v9 isPhotosCloudEnabled];
        int v12 = [v9 isPhotosOptimizeEnabled];

        if (!v10) {
          goto LABEL_22;
        }
        goto LABEL_14;
      }
    }
    id v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "request: missing conditions when stub was chosen; using live conditions",
        buf,
        2u);
    }
  }
  else
  {
    id v8 = 0;
    id v10 = 0;
  }
  int v11 = +[ICQDaemonOfferConditions isPhotosCloudEnabled];
  int v12 = +[ICQDaemonOfferConditions isPhotosOptimizeEnabled];
  if (!v10) {
    goto LABEL_22;
  }
LABEL_14:
  __int16 v26 = v10;
  v27 = v8;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v21 = objc_msgSend(v15, "objectForKeyedSubscript:", v20, v26, v27, (void)v28);
        [v5 setObject:v21 forKey:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v17);
  }

  id v10 = v26;
  id v8 = v27;
LABEL_22:
  if (v11) {
    v22 = @"true";
  }
  else {
    v22 = @"false";
  }
  objc_msgSend(v5, "setObject:forKey:", v22, @"iCPLEnabled", v26, v27);
  if (v12) {
    v23 = @"true";
  }
  else {
    v23 = @"false";
  }
  [v5 setObject:v23 forKey:@"optimizeEnabled"];
  int v24 = +[ICQAppLaunchLinkTracker shared];
  v25 = [v24 allDaysSinceLastShown];

  if (v25) {
    [v5 setObject:v25 forKey:@"appLaunch"];
  }
}

- (id)_stringTimeOfLastBackup
{
  if (self->_account)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F78010]);
    account = self->_account;
    id v10 = 0;
    id v5 = (void *)[v3 initWithAccount:account delegate:0 eventQueue:0 error:&v10];
    id v6 = v10;
    if (v6)
    {
      id v7 = _ICQGetLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ICQRequestProvider _stringTimeOfLastBackup]();
      }
      id v8 = 0;
    }
    else
    {
      id v7 = [v5 dateOfLastBackup];
      id v8 = [v7 icq_serverFriendlyString];
    }
  }
  else
  {
    id v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ICQRequestProvider _stringTimeOfLastBackup](v6);
    }
    id v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

void __41__ICQRequestProvider_getBackupDeviceUUID__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_1D5851000, v0, OS_LOG_TYPE_ERROR, "%s unable to init MBManager with error: %@", (uint8_t *)v1, 0x16u);
}

- (void)_stringTimeOfLastBackup
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_1D5851000, v0, OS_LOG_TYPE_ERROR, "%s unable to init MBManager with error: %@", (uint8_t *)v1, 0x16u);
}

@end