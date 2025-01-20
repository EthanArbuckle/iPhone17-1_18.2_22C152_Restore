@interface WBSASCLockupViewGenerator
+ (id)cloudLockupViewGroup;
+ (id)importLockupViewGroup;
+ (id)sharedGenerator;
- (id)presentingViewControllerForLockupView:(id)a3;
- (id)productDetailsPresentationContextForLockupView:(id)a3;
- (void)_allLockupViewRequestsCompleted;
- (void)_lockupViewRequestedCompleted:(id)a3 loadedSuccessfully:(BOOL)a4;
- (void)generateLockupViewsForAvailableApps:(id)a3 forExtensionImport:(BOOL)a4 completionHandler:(id)a5;
- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4;
- (void)lockupViewDidBeginRequest:(id)a3;
- (void)lockupViewDidFinishRequest:(id)a3;
@end

@implementation WBSASCLockupViewGenerator

+ (id)sharedGenerator
{
  if (sharedGenerator_onceToken != -1) {
    dispatch_once(&sharedGenerator_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedGenerator_sharedGenerator;
  return v2;
}

void __44__WBSASCLockupViewGenerator_sharedGenerator__block_invoke()
{
  v0 = objc_alloc_init(WBSASCLockupViewGenerator);
  v1 = (void *)sharedGenerator_sharedGenerator;
  sharedGenerator_sharedGenerator = (uint64_t)v0;
}

+ (id)cloudLockupViewGroup
{
  if (cloudLockupViewGroup_onceToken != -1) {
    dispatch_once(&cloudLockupViewGroup_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)cloudLockupViewGroup_group;
  return v2;
}

void __49__WBSASCLockupViewGenerator_cloudLockupViewGroup__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F4BB10]) initWithName:@"ExtensionLockups"];
  v1 = (void *)cloudLockupViewGroup_group;
  cloudLockupViewGroup_group = v0;
}

+ (id)importLockupViewGroup
{
  if (importLockupViewGroup_onceToken != -1) {
    dispatch_once(&importLockupViewGroup_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)importLockupViewGroup_group;
  return v2;
}

void __50__WBSASCLockupViewGenerator_importLockupViewGroup__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F4BB10]) initWithName:@"ExtensionImportLockups"];
  v1 = (void *)importLockupViewGroup_group;
  importLockupViewGroup_group = v0;
}

- (void)generateLockupViewsForAvailableApps:(id)a3 forExtensionImport:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__WBSASCLockupViewGenerator_generateLockupViewsForAvailableApps_forExtensionImport_completionHandler___block_invoke;
  v12[3] = &unk_1E5E40CF0;
  id v13 = v8;
  id v14 = v9;
  v12[4] = self;
  BOOL v15 = a4;
  id v10 = v8;
  id v11 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __102__WBSASCLockupViewGenerator_generateLockupViewsForAvailableApps_forExtensionImport_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    v2 = *(void **)(a1 + 48);
LABEL_3:
    v3 = (void (*)(void))v2[2];
    v3();
    return;
  }
  uint64_t v4 = [*(id *)(a1 + 40) count];
  v2 = *(void **)(a1 + 48);
  if (!v4) {
    goto LABEL_3;
  }
  uint64_t v5 = [v2 copy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v8;

  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v11;

  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 32);
  *(void *)(v15 + 32) = v14;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v17 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v63;
    double v21 = *MEMORY[0x1E4F1DB28];
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v54 = *MEMORY[0x1E4F4BA98];
    v53 = (void *)*MEMORY[0x1E4F4BA68];
    v55 = (void *)*MEMORY[0x1E4F4BA60];
    uint64_t v50 = *MEMORY[0x1E4F4BA80];
    *(void *)&long long v18 = 138478083;
    long long v49 = v18;
    uint64_t v51 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v63 != v20) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4BB08]), "initWithFrame:", v21, v22, v23, v24);
        [v27 setSize:v54];
        [v27 setDelegate:*(void *)(a1 + 32)];
        v28 = v53;
        if (!*(unsigned char *)(a1 + 56)) {
          v28 = v55;
        }
        id v29 = v28;
        int v30 = *(unsigned __int8 *)(a1 + 56);
        v31 = objc_opt_class();
        if (v30) {
          [v31 importLockupViewGroup];
        }
        else {
        v32 = [v31 cloudLockupViewGroup];
        }
        objc_msgSend(v27, "setGroup:", v32, v49);

        [*(id *)(*(void *)(a1 + 32) + 16) addObject:v27];
        v33 = [v26 platformSpecificBundleID];
        if (v33)
        {
          v34 = [v27 group];
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __102__WBSASCLockupViewGenerator_generateLockupViewsForAvailableApps_forExtensionImport_completionHandler___block_invoke_18;
          v56[3] = &unk_1E5E40CC8;
          id v35 = v33;
          id v57 = v35;
          id v58 = v27;
          id v36 = v29;
          uint64_t v37 = *(void *)(a1 + 32);
          id v59 = v36;
          uint64_t v60 = v37;
          v61 = v26;
          [v34 _lockupRequestForBundleID:v35 withContext:v55 completionBlock:v56];

          v38 = v57;
        }
        else
        {
          uint64_t v39 = v19;
          id v40 = objc_alloc(MEMORY[0x1E4F4BAC0]);
          v41 = [v26 adamID];
          v38 = (void *)[v40 initWithStringValue:v41];

          id v42 = objc_alloc(MEMORY[0x1E4F4BB00]);
          char v43 = objc_opt_respondsToSelector();
          id v44 = v42;
          v45 = v44;
          if (v43) {
            uint64_t v46 = [v44 _initWithID:v38 kind:v50 context:v29 clientID:@"SafariExtensions" enableAppDistribution:1];
          }
          else {
            uint64_t v46 = [v44 _initWithID:v38 kind:v50 context:v29 clientID:@"SafariExtensions"];
          }
          v47 = (void *)v46;
          [v27 setRequest:v46];

          v48 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v49;
            v67 = v38;
            __int16 v68 = 2113;
            v69 = v27;
            _os_log_impl(&dword_1ABB70000, v48, OS_LOG_TYPE_INFO, "Adam ID %{private}@ created lockup view %{private}@", buf, 0x16u);
          }

          uint64_t v19 = v39;
          uint64_t v20 = v51;
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v19);
  }
}

void __102__WBSASCLockupViewGenerator_generateLockupViewsForAvailableApps_forExtensionImport_completionHandler___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__WBSASCLockupViewGenerator_generateLockupViewsForAvailableApps_forExtensionImport_completionHandler___block_invoke_2;
  block[3] = &unk_1E5E40CA0;
  id v10 = v5;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  long long v14 = *(_OWORD *)(a1 + 56);
  id v15 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __102__WBSASCLockupViewGenerator_generateLockupViewsForAvailableApps_forExtensionImport_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v19 = 138478083;
      uint64_t v20 = v5;
      __int16 v21 = 2113;
      uint64_t v22 = v6;
      _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_INFO, "Bundle identifier %{private}@ created lockup view %{private}@", (uint8_t *)&v19, 0x16u);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F4BB00]);
    char v8 = objc_opt_respondsToSelector();
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = v7;
    id v11 = [v9 id];
    id v12 = [*(id *)(a1 + 32) kind];
    uint64_t v13 = *(void *)(a1 + 56);
    if (v8) {
      uint64_t v14 = [v10 _initWithID:v11 kind:v12 context:v13 clientID:@"SafariExtensions" enableAppDistribution:1];
    }
    else {
      uint64_t v14 = [v10 _initWithID:v11 kind:v12 context:v13 clientID:@"SafariExtensions"];
    }
    id v15 = (void *)v14;

    [*(id *)(a1 + 48) setRequest:v15];
    v16 = [*(id *)(a1 + 72) requiredTeamID];
    uint64_t v17 = *(void **)(*(void *)(a1 + 64) + 32);
    long long v18 = [*(id *)(a1 + 48) request];
    [v17 setObject:v16 forKeyedSubscript:v18];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __102__WBSASCLockupViewGenerator_generateLockupViewsForAvailableApps_forExtensionImport_completionHandler___block_invoke_2_cold_1(a1, v4);
    }
    [*(id *)(a1 + 64) _lockupViewRequestedCompleted:*(void *)(a1 + 48) loadedSuccessfully:0];
  }
}

- (void)_lockupViewRequestedCompleted:(id)a3 loadedSuccessfully:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4) {
    [(NSMutableArray *)self->_succesfullyLoadedLockupViews addObject:v6];
  }
  [(NSMutableArray *)self->_lockupViewsPendingLoad removeObject:v6];
  if (![(NSMutableArray *)self->_lockupViewsPendingLoad count]) {
    [(WBSASCLockupViewGenerator *)self _allLockupViewRequestsCompleted];
  }
}

- (void)_allLockupViewRequestsCompleted
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v7 = (void (**)(id, void *))[self->_pendingGenerateLockupViewsCompletionHandler copy];
  id pendingGenerateLockupViewsCompletionHandler = self->_pendingGenerateLockupViewsCompletionHandler;
  self->_id pendingGenerateLockupViewsCompletionHandler = 0;

  if (v7)
  {
    BOOL v4 = [(NSMutableArray *)self->_succesfullyLoadedLockupViews sortedArrayUsingComparator:&__block_literal_global_22];
    v7[2](v7, v4);

    lockupViewsPendingLoad = self->_lockupViewsPendingLoad;
    self->_lockupViewsPendingLoad = 0;

    succesfullyLoadedLockupViews = self->_succesfullyLoadedLockupViews;
    self->_succesfullyLoadedLockupViews = 0;
  }
}

uint64_t __60__WBSASCLockupViewGenerator__allLockupViewRequestsCompleted__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 lockup];
  id v6 = [v5 title];
  id v7 = [v4 lockup];

  char v8 = [v7 title];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (void)lockupViewDidBeginRequest:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138477827;
    id v6 = v3;
    _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_INFO, "Started loading lockup view: %{private}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__WBSASCLockupViewGenerator_lockupViewDidFinishRequest___block_invoke;
  v6[3] = &unk_1E5E40D38;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__WBSASCLockupViewGenerator_lockupViewDidFinishRequest___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    int v12 = 138477827;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_INFO, "Succeeded loading lockup view: %{private}@", (uint8_t *)&v12, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) request];
  id v5 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v4];
  [*(id *)(*(void *)(a1 + 40) + 32) removeObjectForKey:v4];
  if (!v5)
  {
    char v8 = 0;
LABEL_10:
    uint64_t v10 = 1;
    goto LABEL_11;
  }
  id v6 = *(id *)(a1 + 32);
  id v7 = [v6 lockup];
  char v8 = [v7 contentProviderTeamID];

  if (!v8 || ([v5 isEqualToString:v8] & 1) != 0) {
    goto LABEL_10;
  }
  uint64_t v9 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138478339;
    uint64_t v13 = v5;
    __int16 v14 = 2113;
    id v15 = v8;
    __int16 v16 = 2113;
    uint64_t v17 = v11;
    _os_log_error_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_ERROR, "Hiding lockup view due to team ID mismatch (required team ID: %{private}@ vs computed team ID: %{private}@): %{private}@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v10 = 0;
LABEL_11:
  [*(id *)(a1 + 40) _lockupViewRequestedCompleted:*(void *)(a1 + 32) loadedSuccessfully:v10];
}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WBSASCLockupViewGenerator_lockupView_didFailRequestWithError___block_invoke;
  block[3] = &unk_1E5E40D60;
  id v11 = v7;
  id v12 = v6;
  uint64_t v13 = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__WBSASCLockupViewGenerator_lockupView_didFailRequestWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __64__WBSASCLockupViewGenerator_lockupView_didFailRequestWithError___block_invoke_cold_1(a1, v2);
  }
  id v3 = *(void **)(*(void *)(a1 + 48) + 32);
  id v4 = [*(id *)(a1 + 40) request];
  [v3 removeObjectForKey:v4];

  return [*(id *)(a1 + 48) _lockupViewRequestedCompleted:*(void *)(a1 + 40) loadedSuccessfully:0];
}

- (id)productDetailsPresentationContextForLockupView:(id)a3
{
  id v3 = [a3 group];
  id v4 = [(id)objc_opt_class() importLockupViewGroup];
  int v5 = [v3 isEqual:v4];

  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F4BAF8]) initWithPresentationStyle:1];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F4BAF8] defaultPresentationContext];
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupRequestToRequiredTeamIDMap, 0);
  objc_storeStrong((id *)&self->_succesfullyLoadedLockupViews, 0);
  objc_storeStrong((id *)&self->_lockupViewsPendingLoad, 0);
  objc_storeStrong(&self->_pendingGenerateLockupViewsCompletionHandler, 0);
}

void __102__WBSASCLockupViewGenerator_generateLockupViewsForAvailableApps_forExtensionImport_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(a1 + 80);
  id v4 = a2;
  int v5 = objc_msgSend(v3, "safari_privacyPreservingDescription");
  int v6 = 138478083;
  uint64_t v7 = v2;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_ERROR, "Failed to generate lockup request for %{private}@ with error: %{public}@", (uint8_t *)&v6, 0x16u);
}

void __56__WBSASCLockupViewGenerator_lockupViewDidFinishRequest___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138478083;
  uint64_t v4 = a1;
  __int16 v5 = 2113;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Error computing content provider team ID for lockup view: %{private}@, exception: %{private}@", (uint8_t *)&v3, 0x16u);
}

void __64__WBSASCLockupViewGenerator_lockupView_didFailRequestWithError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  __int16 v5 = objc_msgSend(v3, "safari_privacyPreservingDescription");
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = 138543619;
  __int16 v8 = v5;
  __int16 v9 = 2113;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_ERROR, "Failed loading lockup view with error: %{public}@ - lockup view: %{private}@", (uint8_t *)&v7, 0x16u);
}

@end