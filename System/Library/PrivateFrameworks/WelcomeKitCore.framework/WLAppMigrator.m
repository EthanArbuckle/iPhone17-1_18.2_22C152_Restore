@interface WLAppMigrator
+ (id)_ssItemForiTunesStoreIdentifier:(id)a3;
+ (id)contentType;
+ (id)dataType;
+ (void)_sendStoreDownloadRequestForFreeMigratableApps:(id)a3 completion:(id)a4;
+ (void)installMigratableApps:(id)a3 completion:(id)a4;
- (BOOL)accountBased;
- (BOOL)storeRecordDataInDatabase;
- (BOOL)wantsSegmentedDownloads;
- (WLAppMigrator)initWithDevice:(id)a3 sqlController:(id)a4;
- (WLFeaturePayload)featurePayload;
- (WLSQLController)sqlController;
- (WLSourceDevice)device;
- (id)contentType;
- (id)dataType;
- (void)_insertMatchingApps:(id)a3;
- (void)_lookupStoreItemsMatchingExternalIDs:(id)a3 attempt:(unint64_t)a4 completion:(id)a5;
- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4;
- (void)importDataFromProvider:(id)a3 forSummaries:(id)a4 summaryStart:(id)a5 summaryCompletion:(id)a6;
- (void)setDevice:(id)a3;
- (void)setFeaturePayload:(id)a3;
- (void)setSqlController:(id)a3;
@end

@implementation WLAppMigrator

- (WLAppMigrator)initWithDevice:(id)a3 sqlController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WLAppMigrator;
  v8 = [(WLAppMigrator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(WLAppMigrator *)v8 setDevice:v6];
    [(WLAppMigrator *)v9 setSqlController:v7];
  }

  return v9;
}

+ (id)dataType
{
  return @"applications";
}

+ (id)contentType
{
  return @"applications";
}

- (id)contentType
{
  return +[WLAppMigrator contentType];
}

- (id)dataType
{
  return +[WLAppMigrator dataType];
}

- (BOOL)accountBased
{
  return 1;
}

- (BOOL)storeRecordDataInDatabase
{
  return 1;
}

- (BOOL)wantsSegmentedDownloads
{
  return 0;
}

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4 = a3;
  if (![v4 itemSize]) {
    [v4 setItemSize:5242880];
  }
}

- (void)importDataFromProvider:(id)a3 forSummaries:(id)a4 summaryStart:(id)a5 summaryCompletion:(id)a6
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = (uint64_t (**)(id, void))a5;
  v42 = (void (**)(id, void, id))a6;
  v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v41 = self;
  _WLLog();

  id v13 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v14 = objc_msgSend(v11, "count", self, v35);
  v15 = v13;
  v16 = v12;
  v37 = (void *)[v15 initWithCapacity:v14];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v11;
  uint64_t v17 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  v38 = v12;
  v39 = v10;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v22 = v16[2](v16, v21);
        v23 = (void *)MEMORY[0x230F5E5D0](v22);
        v24 = (*((void (**)(id, uint64_t))v10 + 2))(v10, v21);
        if (v24)
        {
          id v46 = 0;
          v25 = [MEMORY[0x263F08900] JSONObjectWithData:v24 options:0 error:&v46];
          id v26 = v46;
          if (v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            _WLLog();
          }
          else
          {
            v27 = (void *)[v25 mutableCopy];
            [v27 removeObjectForKey:@"itemIcon"];
            _WLLog();
            v28 = objc_msgSend(v27, "objectForKeyedSubscript:", @"itemExternalID", v41, v27);
            if (v28) {
              [v37 addObject:v28];
            }

            v16 = v38;
            id v10 = v39;
          }
        }
        else
        {
          id v26 = 0;
        }

        v42[2](v42, v21, v26);
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v18);
  }

  v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v37, "count"));
  v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
  _WLLog();

  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
  if (objc_msgSend(v37, "count", v41, v29, v36))
  {
    do
    {
      if ((unint64_t)[v37 count] <= 0x32) {
        uint64_t v32 = [v37 count];
      }
      else {
        uint64_t v32 = 50;
      }
      v33 = objc_msgSend(v37, "subarrayWithRange:", 0, v32);
      objc_msgSend(v37, "removeObjectsInRange:", 0, v32);
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __84__WLAppMigrator_importDataFromProvider_forSummaries_summaryStart_summaryCompletion___block_invoke;
      v43[3] = &unk_26490CC90;
      id v44 = v30;
      v34 = v31;
      v45 = v34;
      [(WLAppMigrator *)v41 _lookupStoreItemsMatchingExternalIDs:v33 attempt:1 completion:v43];
      dispatch_semaphore_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
    }
    while ([v37 count]);
  }
  [(WLAppMigrator *)v41 _insertMatchingApps:v30];
}

void __84__WLAppMigrator_importDataFromProvider_forSummaries_summaryStart_summaryCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  uint64_t v5 = [v6 count];
  if (!a3 && v5) {
    [*(id *)(a1 + 32) addObjectsFromArray:v6];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_lookupStoreItemsMatchingExternalIDs:(id)a3 attempt:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  _WLLog();
  id v10 = -[WLAppSearchRequest initWithAndroidIdentifiers:]([WLAppSearchRequest alloc], "initWithAndroidIdentifiers:", v8, self, v8);
  uint64_t v11 = [v8 count];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__WLAppMigrator__lookupStoreItemsMatchingExternalIDs_attempt_completion___block_invoke;
  v14[3] = &unk_26490CCE0;
  id v16 = v9;
  uint64_t v17 = v11;
  unint64_t v18 = a4;
  v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  id v13 = v9;
  [(WLAppSearchRequest *)v10 search:v14];
}

void __73__WLAppMigrator__lookupStoreItemsMatchingExternalIDs_attempt_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  _WLLog();

  if (!v6)
  {
    uint64_t v13 = objc_msgSend(v5, "count", v7, v19, 0);
    uint64_t v14 = *(void *)(a1 + 56) - v13;
    id v15 = [MEMORY[0x263F862E0] sharedInstance];
    [v15 didLookupAppsWithMatchedApps:v13 mismatchedApps:v14];

    uint64_t v16 = *(void *)(a1 + 48);
    if (!v16) {
      goto LABEL_9;
    }
    uint64_t v17 = *(void (**)(void))(v16 + 16);
LABEL_8:
    v17();
    goto LABEL_9;
  }
  if (!objc_msgSend(v6, "wk_representsTransientConnectivityIssueForAttempt:", *(void *)(a1 + 64), v7, v19, v6))
  {
    uint64_t v18 = *(void *)(a1 + 48);
    if (!v18) {
      goto LABEL_9;
    }
    uint64_t v17 = *(void (**)(void))(v18 + 16);
    goto LABEL_8;
  }
  _WLLog();
  dispatch_time_t v8 = dispatch_time(0, 3000000000);
  id v9 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__WLAppMigrator__lookupStoreItemsMatchingExternalIDs_attempt_completion___block_invoke_2;
  block[3] = &unk_26490CCB8;
  id v10 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v11 = v10;
  uint64_t v12 = *(void *)(a1 + 64);
  id v21 = v11;
  uint64_t v23 = v12;
  id v22 = *(id *)(a1 + 48);
  dispatch_after(v8, v9, block);

LABEL_9:
}

uint64_t __73__WLAppMigrator__lookupStoreItemsMatchingExternalIDs_attempt_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _lookupStoreItemsMatchingExternalIDs:*(void *)(a1 + 40) attempt:*(void *)(a1 + 56) + 1 completion:*(void *)(a1 + 48)];
}

- (void)_insertMatchingApps:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  _WLLog();

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  uint64_t v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16, self, v18);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        v25[0] = @"bundleIdentifier";
        id v10 = [v9 bundleIdentifier];
        v26[0] = v10;
        v25[1] = @"ITunesStoreIdentifier";
        id v11 = [v9 appStoreIdentifier];
        v26[1] = v11;
        v25[2] = @"isFree";
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isFree"));
        v26[2] = v12;
        uint64_t v13 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

        uint64_t v14 = [v9 bundleIdentifier];
        id v15 = [v9 appStoreIdentifier];
        uint64_t v19 = [v13 objectForKeyedSubscript:@"isFree"];
        _WLLog();

        uint64_t v16 = [(WLAppMigrator *)self sqlController];
        uint64_t v17 = [(WLAppMigrator *)self device];
        [v16 insertMigratableApp:v13 forDevice:v17];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v6);
  }
}

+ (void)installMigratableApps:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = dispatch_get_global_queue(25, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__WLAppMigrator_installMigratableApps_completion___block_invoke;
  v10[3] = &unk_26490CD30;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __50__WLAppMigrator_installMigratableApps_completion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __50__WLAppMigrator_installMigratableApps_completion___block_invoke_2;
  v2[3] = &unk_26490CD08;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  +[WLAppMigrator _sendStoreDownloadRequestForFreeMigratableApps:v1 completion:v2];
}

void __50__WLAppMigrator_installMigratableApps_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  _WLLog();

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }
}

+ (void)_sendStoreDownloadRequestForFreeMigratableApps:(id)a3 completion:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v35 = a4;
  v36 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v50 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "objectForKeyedSubscript:", @"isFree", v33);
        int v13 = [v12 BOOLValue];

        if (v13)
        {
          uint64_t v14 = [v11 objectForKeyedSubscript:@"ITunesStoreIdentifier"];
          id v15 = [a1 _ssItemForiTunesStoreIdentifier:v14];
          if (v15)
          {
            [v36 addObject:v15];
            id v16 = [v14 stringValue];
            uint64_t v17 = [v16 UTF8String];

            id v18 = [v11 objectForKeyedSubscript:@"bundleIdentifier"];
            uint64_t v19 = v6;
            uint64_t v20 = [v18 UTF8String];

            uint64_t v21 = SBSSpringBoardServerPort();
            uint64_t v22 = v20;
            id v6 = v19;
            MEMORY[0x230F5DFD0](v21, v17, v22);
            v33 = [v11 objectForKeyedSubscript:@"bundleIdentifier"];
            _WLLog();
          }
        }
        else
        {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v8);
  }

  long long v23 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v36, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v24 = v36;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v46 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = (void *)[objc_alloc(MEMORY[0x263F7B2D8]) initWithItem:*(void *)(*((void *)&v45 + 1) + 8 * j)];
        [v23 addObject:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v26);
  }

  if ([v24 count])
  {
    v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    _WLLog();

    id v30 = objc_msgSend(objc_alloc(MEMORY[0x263F7B2E8]), "initWithPurchases:", v23, v34);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __75__WLAppMigrator__sendStoreDownloadRequestForFreeMigratableApps_completion___block_invoke;
    v42[3] = &unk_26490CD58;
    id v43 = v30;
    dispatch_semaphore_t v31 = v35;
    id v44 = v35;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __75__WLAppMigrator__sendStoreDownloadRequestForFreeMigratableApps_completion___block_invoke_2;
    v39[3] = &unk_26490CD80;
    id v41 = v44;
    id v40 = v6;
    id v32 = v30;
    [v32 startWithPurchaseResponseBlock:v42 completionBlock:v39];
  }
  else
  {
    dispatch_semaphore_t v31 = v35;
    if (v35) {
      (*((void (**)(id, void *, void))v35 + 2))(v35, v6, 0);
    }
  }
}

void __75__WLAppMigrator__sendStoreDownloadRequestForFreeMigratableApps_completion___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v8 = [v9 error];
  _WLLog();

  id v3 = objc_msgSend(v9, "error", v9, v8);
  id v4 = [v3 domain];
  if (([v4 isEqualToString:*MEMORY[0x263F7B758]] & 1) == 0)
  {

    goto LABEL_6;
  }
  id v5 = [v9 error];
  uint64_t v6 = [v5 code];

  if (v6 == 16)
  {
    _WLLog();
    [*(id *)(a1 + 32) cancel];
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      id v3 = [v9 error];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v3);
LABEL_6:
    }
  }
}

void __75__WLAppMigrator__sendStoreDownloadRequestForFreeMigratableApps_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  _WLLog();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    if (v5) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = *(void *)(a1 + 32);
    }
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
  }
}

+ (id)_ssItemForiTunesStoreIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F7B1C8]);
  [v4 setValue:v3 forParameter:*MEMORY[0x263F7B948]];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  id v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__WLAppMigrator__ssItemForiTunesStoreIdentifier___block_invoke;
  v10[3] = &unk_26490CDA8;
  id v6 = v3;
  id v11 = v6;
  int v13 = &v14;
  uint64_t v7 = v5;
  id v12 = v7;
  [v4 startWithItemLookupBlock:v10];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __49__WLAppMigrator__ssItemForiTunesStoreIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5) {
    _WLLog();
  }
  if (v9 && [v9 count] == 1)
  {
    uint64_t v6 = [v9 objectAtIndexedSubscript:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (WLFeaturePayload)featurePayload
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  return (WLFeaturePayload *)WeakRetained;
}

- (void)setFeaturePayload:(id)a3
{
}

- (WLSourceDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (WLSQLController)sqlController
{
  return self->_sqlController;
}

- (void)setSqlController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlController, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_featurePayload);
}

@end