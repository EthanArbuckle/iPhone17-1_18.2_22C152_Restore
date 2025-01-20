@interface WBSHideMyEmailManager
+ (WBSHideMyEmailManager)sharedManager;
- (WBSHideMyEmailManager)init;
- (void)_performOperation:(unint64_t)a3 withURL:(id)a4 completionHandler:(id)a5;
- (void)getRecordForURL:(id)a3 completionHandler:(id)a4;
- (void)provisionRecordForURL:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSHideMyEmailManager

- (WBSHideMyEmailManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)WBSHideMyEmailManager;
  v2 = [(WBSHideMyEmailManager *)&v11 init];
  if (v2)
  {
    v3 = (WBSPrimaryAppleAccountObserver *)objc_alloc_init(MEMORY[0x1E4F98390]);
    accountObserver = v2->_accountObserver;
    v2->_accountObserver = v3;

    uint64_t v5 = [MEMORY[0x1E4F982C8] provisionNewHideMyEmailAvailabilityObserver];
    provisionNewHideMyEmailAvailabilityObserver = v2->_provisionNewHideMyEmailAvailabilityObserver;
    v2->_provisionNewHideMyEmailAvailabilityObserver = (WBSCloudSubscriptionFeatureAvailabilityObserver *)v5;

    v7 = (AKPrivateEmailController *)objc_alloc_init(MEMORY[0x1E4F4F080]);
    privateEmailController = v2->_privateEmailController;
    v2->_privateEmailController = v7;

    v9 = v2;
  }

  return v2;
}

- (void)_performOperation:(unint64_t)a3 withURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v9 = [a4 host];
  v10 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[WBSHideMyEmailManager _performOperation:withURL:completionHandler:](v10, v11, v12, v13, v14, v15, v16, v17);
  }
  accountObserver = self->_accountObserver;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke;
  v21[3] = &unk_1E5E42E08;
  id v24 = v8;
  unint64_t v25 = a3;
  id v22 = v9;
  v23 = self;
  id v19 = v8;
  id v20 = v9;
  [(WBSPrimaryAppleAccountObserver *)accountObserver getPrimaryAppleAccountAltDSIDWithCompletionHandler:v21];
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length])
  {
    v4 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_4(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "safari_highLevelDomainFromHost");
    if ([v12 isEqualToString:@"icloud.com"])
    {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F98330]) initWithDomain:*(void *)(a1 + 32) state:2 privateEmailAddress:0];
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_2(v14);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v16 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_3(a1, v16);
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4;
      v21[3] = &unk_1E5E42DE0;
      int8x16_t v20 = *(int8x16_t *)(a1 + 32);
      id v17 = (id)v20.i64[0];
      int8x16_t v22 = vextq_s8(v20, v20, 8uLL);
      id v23 = *(id *)(a1 + 48);
      v18 = (void *)MEMORY[0x1AD115160](v21);
      uint64_t v19 = *(void *)(a1 + 56);
      if (v19 == 1)
      {
        [*(id *)(*(void *)(a1 + 40) + 24) fetchPrivateEmailForAltDSID:v3 withKey:*(void *)(a1 + 32) completion:v18];
      }
      else if (!v19)
      {
        [*(id *)(*(void *)(a1 + 40) + 24) lookupPrivateEmailForAltDSID:v3 withKey:*(void *)(a1 + 32) completion:v18];
      }
    }
  }
  else
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F98330]) initWithDomain:*(void *)(a1 + 32) state:3 privateEmailAddress:0];
    uint64_t v15 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_1(v15);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    int v8 = objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E4F4EE90], -6003);
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);
      }
      v18 = *(void **)(*(void *)(a1 + 32) + 16);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_5;
      v22[3] = &unk_1E5E41200;
      id v23 = *(id *)(a1 + 40);
      id v24 = *(id *)(a1 + 48);
      [v18 getFeatureAvailabilityWithCompletionHandler:v22];
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4_cold_3(v10, v7);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v19 = [v5 privateEmailAddress];
    int8x16_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F98330]) initWithDomain:*(void *)(a1 + 40) state:0 privateEmailAddress:v19];
    v21 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4_cold_1(v21);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_5(uint64_t a1, int a2)
{
  id v4 = objc_alloc(MEMORY[0x1E4F98330]);
  if (a2) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  id v6 = (void *)[v4 initWithDomain:*(void *)(a1 + 32) state:v5 privateEmailAddress:0];
  uint64_t v7 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_5_cold_1(a2, v7);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getRecordForURL:(id)a3 completionHandler:(id)a4
{
}

- (void)provisionRecordForURL:(id)a3 completionHandler:(id)a4
{
}

+ (WBSHideMyEmailManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_17);
  }
  v2 = (void *)sharedManager_sharedInstance;
  return (WBSHideMyEmailManager *)v2;
}

void __38__WBSHideMyEmailManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WBSHideMyEmailManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateEmailController, 0);
  objc_storeStrong((id *)&self->_provisionNewHideMyEmailAvailabilityObserver, 0);
  objc_storeStrong((id *)&self->_accountObserver, 0);
}

- (void)_performOperation:(uint64_t)a3 withURL:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_3_5();
  id v3 = WBSHideMyEmailRecordStateStringForRecordState();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1ABB70000, v4, v5, "Primary altDSID not available or empty. Returning record with state: %@.", v6, v7, v8, v9, v10);
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_2(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_3_5();
  id v3 = WBSHideMyEmailRecordStateStringForRecordState();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1ABB70000, v4, v5, "Domain matches entry on quirks list. Returning record with state: %@.", v6, v7, v8, v9, v10);
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 56)) {
    id v3 = @"Fetch (Provision New)";
  }
  else {
    id v3 = @"Lookup (Get Existing)";
  }
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_DEBUG, "Domain not found on quirks list. Starting AuthKit operation: %@.", v5, 0xCu);
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4_cold_1(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_3_5();
  id v3 = WBSHideMyEmailRecordStateStringForRecordState();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1ABB70000, v4, v5, "Hide My Email record exists. Returning record with state: %@.", v6, v7, v8, v9, v10);
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4_cold_3(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Failed to get Hide My Email record with error: %{public}@.", v5, 0xCu);
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_5_cold_1(char a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = @"NO";
  if (a1) {
    id v3 = @"YES";
  }
  uint64_t v4 = v3;
  uint64_t v5 = a2;
  OUTLINED_FUNCTION_3_5();
  uint64_t v6 = WBSHideMyEmailRecordStateStringForRecordState();
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint8_t v10 = v6;
  _os_log_debug_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_DEBUG, "Eligibility to create a new record: %@. Returning record with state: %@.", (uint8_t *)&v7, 0x16u);
}

@end