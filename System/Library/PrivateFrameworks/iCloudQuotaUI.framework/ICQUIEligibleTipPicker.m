@interface ICQUIEligibleTipPicker
- (BOOL)_deviceStoragePassesCriteria:(id)a3 freeCloudStorage:(id)a4;
- (BOOL)_eligibleForSyncWithiCloudTipExcludingApps:(id)a3;
- (ICQUIEligibleTipPicker)initWithAccount:(id)a3 planRecommendation:(id)a4;
- (void)getFirstEligibleTipFromTips:(id)a3 completion:(id)a4;
@end

@implementation ICQUIEligibleTipPicker

- (ICQUIEligibleTipPicker)initWithAccount:(id)a3 planRecommendation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQUIEligibleTipPicker;
  v9 = [(ICQUIEligibleTipPicker *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_planRecommendation, a4);
  }

  return v10;
}

- (void)getFirstEligibleTipFromTips:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[ICQUIEligibleTipPicker getFirstEligibleTipFromTips:completion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "%s determining first eligible tip from tips: %@", buf, 0x16u);
  }

  v9 = [v6 firstObject];
  v10 = [v9 criteria];

  if (v10)
  {
    planRecommendation = self->_planRecommendation;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __65__ICQUIEligibleTipPicker_getFirstEligibleTipFromTips_completion___block_invoke;
    v13[3] = &unk_2649235E8;
    id v16 = v7;
    id v14 = v6;
    v15 = self;
    [(ICQStoragePlanRecommendation *)planRecommendation calculateExtraQuotaNeededToSyncIsAccountFull:0 completion:v13];

    objc_super v12 = v16;
  }
  else
  {
    objc_super v12 = [v6 firstObject];
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

void __65__ICQUIEligibleTipPicker_getFirstEligibleTipFromTips_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v23 = v6;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      uint64_t v11 = *MEMORY[0x263F888A8];
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v14 = *(void **)(a1 + 40);
          v15 = objc_msgSend(v13, "criteria", v23);
          LODWORD(v14) = [v14 _deviceStoragePassesCriteria:v15 freeCloudStorage:v5];

          if (v14)
          {
            id v16 = [v13 anchor];
            int v17 = [v16 isEqualToString:v11];

            if (!v17) {
              goto LABEL_19;
            }
            v18 = *(void **)(a1 + 40);
            __int16 v19 = [v13 criteria];
            id v20 = [v19 excludeApps];
            LODWORD(v18) = [v18 _eligibleForSyncWithiCloudTipExcludingApps:v20];

            if (v18)
            {
              v22 = _ICQGetLogSystem();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22C821000, v22, OS_LOG_TYPE_DEFAULT, "Found tip for Sync with iCloud section.", buf, 2u);
              }

LABEL_19:
              (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

              goto LABEL_20;
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_20:
    id v7 = v23;
  }
  else
  {
    uint64_t v21 = _ICQGetLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __65__ICQUIEligibleTipPicker_getFirstEligibleTipFromTips_completion___block_invoke_cold_1((uint64_t)v7, v21);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (BOOL)_eligibleForSyncWithiCloudTipExcludingApps:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[ICQUIDataclassHelper unsyncedDataclassesExcludingPhotosForAccount:self->_account];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += [v4 containsObject:*(void *)(*((void *)&v23 + 1) + 8 * i)] ^ 1;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v37 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }
  uint64_t v11 = (void *)MEMORY[0x263F88978];
  account = self->_account;
  v13 = [MEMORY[0x263EFB210] defaultStore];
  int v14 = [v11 isBackupEnabledForAccount:account accountStore:v13];

  int v15 = [MEMORY[0x263F88978] isICPLEnabledForAccount:self->_account];
  int v16 = v15 ^ 1;
  if (v8 > 1) {
    int v16 = 1;
  }
  if (v14) {
    BOOL v17 = v16;
  }
  else {
    BOOL v17 = 1;
  }
  v18 = _ICQGetLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = @"NO";
    long long v28 = "-[ICQUIEligibleTipPicker _eligibleForSyncWithiCloudTipExcludingApps:]";
    *(_DWORD *)buf = 136316162;
    if (v14) {
      id v20 = @"YES";
    }
    else {
      id v20 = @"NO";
    }
    v30 = v20;
    __int16 v29 = 2112;
    if (v15) {
      uint64_t v21 = @"YES";
    }
    else {
      uint64_t v21 = @"NO";
    }
    __int16 v31 = 2112;
    v32 = v21;
    if (v17) {
      __int16 v19 = @"YES";
    }
    __int16 v33 = 2048;
    unint64_t v34 = v8;
    __int16 v35 = 2112;
    v36 = v19;
    _os_log_impl(&dword_22C821000, v18, OS_LOG_TYPE_DEFAULT, "%s: isiCloudBackupEnabled (%@) isiCPLEnabled (%@) numberOfUnsyncedDataclasses (%lu) is eligible? (%@)", buf, 0x34u);
  }

  return v17;
}

- (BOOL)_deviceStoragePassesCriteria:(id)a3 freeCloudStorage:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 minimumRange];
  unint64_t v8 = [v7 unsignedIntegerValue];
  unint64_t v9 = [v6 unsignedIntegerValue];

  unint64_t v10 = [v6 unsignedIntegerValue];
  uint64_t v11 = [v5 maximumRange];
  unint64_t v12 = [v11 unsignedIntegerValue];

  v13 = _ICQGetLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v6 unsignedLongValue];
    int v15 = @"NO";
    int v20 = 136316162;
    uint64_t v21 = "-[ICQUIEligibleTipPicker _deviceStoragePassesCriteria:freeCloudStorage:]";
    __int16 v22 = 2112;
    __int16 v24 = 2048;
    if (v8 >= v9) {
      int v16 = @"NO";
    }
    else {
      int v16 = @"YES";
    }
    id v23 = v5;
    uint64_t v25 = v14;
    if (v10 < v12) {
      int v15 = @"YES";
    }
    __int16 v26 = 2112;
    long long v27 = v16;
    __int16 v28 = 2112;
    __int16 v29 = v15;
    _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "%s criteria (%@) and freeCloudStorage %lu: satisfies minimum range (%@) satisfies maximum range (%@)", (uint8_t *)&v20, 0x34u);
  }

  BOOL v18 = v8 < v9 && v10 < v12;
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planRecommendation, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

void __65__ICQUIEligibleTipPicker_getFirstEligibleTipFromTips_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[ICQUIEligibleTipPicker getFirstEligibleTipFromTips:completion:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "%s - Failed to fetch storage space with error: %@, will not evaluate tip criteria.", (uint8_t *)&v2, 0x16u);
}

@end