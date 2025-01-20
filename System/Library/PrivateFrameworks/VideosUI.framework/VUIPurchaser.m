@interface VUIPurchaser
+ (id)sharedInstance;
- (AMSUIPurchaseQueue)purchaseUIQueue;
- (BOOL)_isInterruptedPurchaseFulfilledBySSPurchaseResponse:(id)a3;
- (BOOL)isPurchaseInProgress;
- (BOOL)isPurchasing:(id)a3;
- (NSMutableSet)purchasingParamsSet;
- (SSEventMonitor)eventMonitor;
- (VUIPurchaseRequest)interruptedPurchaseRequest;
- (VUIPurchaser)init;
- (id)_getAdamIdFromBuyParams:(id)a3;
- (void)didCompleteInterruptedBuyWithResponse:(id)a3 error:(id)a4;
- (void)enqueuePurchase:(id)a3 withCompletion:(id)a4;
- (void)eventMonitor:(id)a3 receivedEventWithName:(id)a4 userInfo:(id)a5;
- (void)forgetPurchasing:(id)a3;
- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)postCrossProcessNotificationWithBuyParams:(id)a3 error:(id)a4;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
- (void)rememberPurchasing:(id)a3;
- (void)setEventMonitor:(id)a3;
- (void)setInterruptedPurchaseRequest:(id)a3;
- (void)setPurchaseUIQueue:(id)a3;
- (void)setPurchasingParamsSet:(id)a3;
@end

@implementation VUIPurchaser

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_15 != -1) {
    dispatch_once(&sharedInstance_onceToken_15, &__block_literal_global_72);
  }
  v2 = (void *)sharedInstance_purchaser;
  return v2;
}

void __30__VUIPurchaser_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIPurchaser);
  v1 = (void *)sharedInstance_purchaser;
  sharedInstance_purchaser = (uint64_t)v0;
}

- (VUIPurchaser)init
{
  v12.receiver = self;
  v12.super_class = (Class)VUIPurchaser;
  v2 = [(VUIPurchaser *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    purchasingParamsSet = v2->_purchasingParamsSet;
    v2->_purchasingParamsSet = (NSMutableSet *)v3;

    v5 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F4DFF8]) initWithBag:v5];
    _os_feature_enabled_impl();
    [v6 setPurchaseTaskClass:objc_opt_class()];
    [v6 setDelegate:v2];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F4DFF0]) initWithConfiguration:v6];
    purchaseUIQueue = v2->_purchaseUIQueue;
    v2->_purchaseUIQueue = (AMSUIPurchaseQueue *)v7;

    v9 = (SSEventMonitor *)objc_alloc_init(MEMORY[0x1E4FA81C0]);
    eventMonitor = v2->_eventMonitor;
    v2->_eventMonitor = v9;

    [(SSEventMonitor *)v2->_eventMonitor setDelegate:v2];
  }
  return v2;
}

- (void)enqueuePurchase:(id)a3 withCompletion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  [(VUIPurchaser *)self setInterruptedPurchaseRequest:v7];
  v8 = [v7 purchase];

  v9 = [v8 uniqueIdentifier];
  v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v9;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - enqueue purchase %@", buf, 0xCu);
  }

  v11 = _Block_copy(v6);
  objc_super v12 = (void *)_completion;
  _completion = (uint64_t)v11;

  v13 = [(VUIPurchaser *)self purchaseUIQueue];
  v26 = v8;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v15 = [v13 enquePurchases:v14];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __47__VUIPurchaser_enqueuePurchase_withCompletion___block_invoke;
  v24[3] = &unk_1E6DF8228;
  id v16 = v6;
  id v25 = v16;
  [v15 addErrorBlock:v24];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__VUIPurchaser_enqueuePurchase_withCompletion___block_invoke_19;
  aBlock[3] = &unk_1E6DF8250;
  aBlock[4] = self;
  id v23 = v16;
  id v17 = v16;
  v18 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__VUIPurchaser_enqueuePurchase_withCompletion___block_invoke_21;
  v20[3] = &unk_1E6DF8278;
  id v21 = v18;
  id v19 = v18;
  [v15 addSuccessBlock:v20];
}

void __47__VUIPurchaser_enqueuePurchase_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 userInfo];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - purchase failed %@", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__VUIPurchaser_enqueuePurchase_withCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) setInterruptedPurchaseRequest:0];
  v4 = [v3 purchase];
  v5 = [v4 uniqueIdentifier];

  int v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - purchase succeeded %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __47__VUIPurchaser_enqueuePurchase_withCompletion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)postCrossProcessNotificationWithBuyParams:(id)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = objc_opt_new();
  uint64_t v8 = v7;
  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:@"VUIStoreAcquisitionCrossProcessNotificationKeyError"];
  }
  if ([v5 length]) {
    [v8 setObject:v5 forKeyedSubscript:@"VUIStoreAcquisitionCrossProcessNotificationKeyBuyParams"];
  }
  uint64_t v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Posting VUIStoreAcquisitionCrossProcessNotification with buy params: %@, error: %@", (uint8_t *)&v11, 0x16u);
  }

  v10 = [MEMORY[0x1E4F28C40] defaultCenter];
  objc_msgSend(v10, "vui_postNotificationName:object:userInfo:", @"com.apple.VideosUI.StoreAcquisitionCrossProcessNotification", 0, v8);
}

- (BOOL)isPurchaseInProgress
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(NSMutableSet *)self->_purchasingParamsSet count];
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = v2;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - isPurchaseInProgress: %ld", (uint8_t *)&v5, 0xCu);
  }

  return v2 != 0;
}

- (BOOL)isPurchasing:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(NSMutableSet *)self->_purchasingParamsSet containsObject:v4];
  uint64_t v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = "Not Purchasing";
    if (v5) {
      uint64_t v7 = "Purchasing";
    }
    int v9 = 136315394;
    v10 = v7;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - %s: %@", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (void)rememberPurchasing:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - rememberPurchasing: %@", (uint8_t *)&v6, 0xCu);
  }

  [(NSMutableSet *)self->_purchasingParamsSet addObject:v4];
}

- (void)forgetPurchasing:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - forgetPurchasing: %@", (uint8_t *)&v6, 0xCu);
  }

  [(NSMutableSet *)self->_purchasingParamsSet removeObject:v4];
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [v8 logKey];
    id v12 = [v7 uniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - handle auth request %@ for purchase %@", buf, 0x16u);
  }
  uint64_t v16 = MEMORY[0x1E4F143A8];
  id v17 = __62__VUIPurchaser_purchase_handleAuthenticateRequest_completion___block_invoke;
  v18 = &unk_1E6DF4AD0;
  id v19 = v8;
  id v20 = v9;
  uint64_t v13 = (void *)MEMORY[0x1E4F29060];
  id v14 = v9;
  id v15 = v8;
  if (objc_msgSend(v13, "isMainThread", v16, 3221225472)) {
    v17((uint64_t)&v16);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v16);
  }
}

void __62__VUIPurchaser_purchase_handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[VUIApplicationRouter topMostVisibleViewController];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F4DF30]) initWithRequest:*(void *)(a1 + 32) presentingViewController:v2];
  id v4 = [v3 performAuthentication];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__VUIPurchaser_purchase_handleAuthenticateRequest_completion___block_invoke_2;
  v5[3] = &unk_1E6DF5998;
  id v6 = *(id *)(a1 + 40);
  [v4 addFinishBlock:v5];
}

void __62__VUIPurchaser_purchase_handleAuthenticateRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 authenticationResults];
    int v10 = 138412546;
    __int16 v11 = v8;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - finished auth request: %@, %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [v8 logKey];
    __int16 v12 = [v7 uniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - handle dialog request %@ for purchase %@", buf, 0x16u);
  }
  uint64_t v16 = MEMORY[0x1E4F143A8];
  id v17 = __56__VUIPurchaser_purchase_handleDialogRequest_completion___block_invoke;
  v18 = &unk_1E6DF4AD0;
  id v19 = v8;
  id v20 = v9;
  id v13 = (void *)MEMORY[0x1E4F29060];
  id v14 = v9;
  id v15 = v8;
  if (objc_msgSend(v13, "isMainThread", v16, 3221225472)) {
    v17((uint64_t)&v16);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v16);
  }
}

void __56__VUIPurchaser_purchase_handleDialogRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[VUIApplicationRouter topMostVisibleViewController];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F4DF28]) initWithRequest:*(void *)(a1 + 32) presentingViewController:v2];
  id v4 = [v3 present];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__VUIPurchaser_purchase_handleDialogRequest_completion___block_invoke_2;
  v5[3] = &unk_1E6DF6978;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v4 addFinishBlock:v5];
}

void __56__VUIPurchaser_purchase_handleDialogRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 selectedActionIdentifier];
  id v9 = [v7 locateActionWithIdentifier:v8];
  uint64_t v10 = [v9 style];

  __int16 v11 = VUIDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218498;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - finished dialog with actionStyle %ld for request: %@, %@", (uint8_t *)&v14, 0x20u);
  }

  if ((unint64_t)(v10 - 1) <= 1)
  {
    __int16 v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - User canceled purchase dialog", (uint8_t *)&v14, 2u);
    }
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  }
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [v8 logKey];
    __int16 v12 = [v7 uniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - handle engagement request %@ for purchase %@", buf, 0x16u);
  }
  uint64_t v16 = MEMORY[0x1E4F143A8];
  id v17 = __60__VUIPurchaser_purchase_handleEngagementRequest_completion___block_invoke;
  __int16 v18 = &unk_1E6DF4AD0;
  id v19 = v8;
  id v20 = v9;
  uint64_t v13 = (void *)MEMORY[0x1E4F29060];
  id v14 = v9;
  id v15 = v8;
  if (objc_msgSend(v13, "isMainThread", v16, 3221225472)) {
    v17((uint64_t)&v16);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v16);
  }
}

void __60__VUIPurchaser_purchase_handleEngagementRequest_completion___block_invoke(uint64_t a1)
{
  id v5 = +[VUIApplicationRouter topMostVisibleViewController];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F4DFB8]) initWithRequest:*(void *)(a1 + 32) bag:v2 presentingViewController:v5];
  id v4 = [v3 presentEngagement];
  [v4 addFinishBlock:*(void *)(a1 + 40)];
}

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
}

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
}

- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
}

- (void)setInterruptedPurchaseRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = (VUIPurchaseRequest *)a3;
  id v6 = self;
  objc_sync_enter(v6);
  if (v6->_interruptedPurchaseRequest != v5)
  {
    if (v5)
    {
      id v7 = VUIDefaultLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(VUIPurchaseRequest *)v5 purchase];
        id v9 = [v8 uniqueIdentifier];
        int v12 = 138412290;
        uint64_t v13 = v9;
        _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Remember request [%@] for interrupted case", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      id v7 = VUIDefaultLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [(VUIPurchaseRequest *)v6->_interruptedPurchaseRequest purchase];
        __int16 v11 = [v10 uniqueIdentifier];
        int v12 = 138412290;
        uint64_t v13 = v11;
        _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Forget request [%@] for interrupted case", (uint8_t *)&v12, 0xCu);
      }
    }

    objc_storeStrong((id *)&v6->_interruptedPurchaseRequest, a3);
  }
  objc_sync_exit(v6);
}

- (VUIPurchaseRequest)interruptedPurchaseRequest
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_interruptedPurchaseRequest;
  objc_sync_exit(v2);

  return v3;
}

- (void)didCompleteInterruptedBuyWithResponse:(id)a3 error:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v31 = (uint64_t)v6;
    __int16 v32 = 2112;
    uint64_t v33 = (uint64_t)v7;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Received interrupted buy completion event [%@], error: %@", buf, 0x16u);
  }

  id v9 = [(VUIPurchaseRequest *)self->_interruptedPurchaseRequest purchase];
  uint64_t v10 = [v9 buyParams];
  __int16 v11 = [v10 stringValue];

  int v12 = [(VUIPurchaser *)self _getAdamIdFromBuyParams:v11];
  uint64_t v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 longLongValue];
    id v15 = objc_msgSend(v6, "vui_dictionaryForKey:", @"metrics");
    v27 = [v15 vui_arrayForKey:@"itemIds"];
    uint64_t v16 = [v27 firstObject];
    id v28 = v7;
    if (v16)
    {
      id v17 = (void *)v16;
      uint64_t v29 = 0;
      __int16 v18 = 0;
    }
    else
    {
      id v19 = objc_msgSend(v6, "vui_arrayForKey:", @"songList");
      __int16 v18 = [v19 firstObject];
      uint64_t v20 = objc_msgSend(v18, "vui_numberForKey:", @"songId");
      if (v20)
      {
        id v17 = (void *)v20;
        uint64_t v29 = v19;
      }
      else
      {
        id v21 = objc_msgSend(v6, "vui_arrayForKey:", @"app-list");

        v22 = [v21 firstObject];

        id v17 = objc_msgSend(v22, "vui_numberForKey:", @"item-id");
        uint64_t v29 = v21;
        __int16 v18 = v22;
      }
    }
    uint64_t v23 = [v17 longLongValue];
    v24 = VUIDefaultLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v31 = v14;
      __int16 v32 = 2048;
      uint64_t v33 = v23;
      _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - saved interrupted buy [%li], incoming buy [%li] ", buf, 0x16u);
    }

    uint64_t v25 = VUIDefaultLogObject();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v23 && v14 && v14 == v23)
    {
      if (v26)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Interrupted buy completed!", buf, 2u);
      }

      id v7 = v28;
      [(VUIPurchaseRequest *)self->_interruptedPurchaseRequest handleRequestCompletionWithResult:v6 andError:v28];
    }
    else
    {
      if (v26)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Not the buy completion for which we were interrupted", buf, 2u);
      }

      id v7 = v28;
    }
  }
  else
  {
    id v15 = VUIDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - No saved interrupted purchase request", buf, 2u);
    }
  }
}

- (id)_getAdamIdFromBuyParams:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v4 setQuery:v3];
    [v4 queryItems];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          __int16 v11 = objc_msgSend(v10, "name", (void)v15);
          char v12 = [v11 isEqualToString:@"salableAdamId"];

          if (v12)
          {
            uint64_t v13 = [v10 value];
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v13 = 0;
LABEL_12:
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)eventMonitor:(id)a3 receivedEventWithName:(id)a4 userInfo:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a4;
  id v8 = a5;
  id v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v7;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Received SS event [%@]", buf, 0xCu);
  }

  if ([v7 isEqualToString:*MEMORY[0x1E4FA8690]])
  {
    uint64_t v10 = [v8 objectForKey:@"response"];
    if (!v10)
    {
      __int16 v11 = VUIDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - No payload in ss purchase completion event", buf, 2u);
      }
      goto LABEL_19;
    }
    id v33 = 0;
    __int16 v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v33];
    char v12 = v33;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = VUIDefaultLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v13;
        _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Failed to unarchive data with error: %@", buf, 0xCu);
      }

      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v13 = VUIDefaultLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        long long v16 = "VUIPurchaser - ss event payload has invalid response type";
        goto LABEL_17;
      }
LABEL_18:

LABEL_19:
      goto LABEL_20;
    }
    long long v15 = [v11 error];

    if (v15)
    {
      uint64_t v13 = VUIDefaultLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        long long v16 = "VUIPurchaser - SS event success notification receieved an unexpected error";
LABEL_17:
        _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    BOOL v17 = [(VUIPurchaser *)self _isInterruptedPurchaseFulfilledBySSPurchaseResponse:v11];
    uint64_t v13 = VUIDefaultLogObject();
    BOOL v18 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (!v17)
    {
      if (!v18) {
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      long long v16 = "VUIPurchaser - Not the buy completion for which we were interrupted";
      goto LABEL_17;
    }
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Interrupted buy completed!", buf, 2u);
    }

    id v19 = [v11 URLResponse];
    uint64_t v20 = [v19 bodyData];

    if (v20)
    {
      id v32 = 0;
      id v21 = [MEMORY[0x1E4F28F98] propertyListWithData:v20 options:0 format:0 error:&v32];
      id v22 = v32;
    }
    else
    {
      id v21 = 0;
      id v22 = 0;
    }
    uint64_t v23 = [v11 error];
    v24 = (void *)v23;
    if (v21) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = v22;
    }
    if (v23) {
      uint64_t v25 = (void *)v23;
    }
    uint64_t v13 = v25;

    BOOL v26 = [v13 domain];
    uint64_t v31 = (void *)v20;
    if ([v26 isEqualToString:*MEMORY[0x1E4FB87D0]])
    {
      uint64_t v27 = [v13 code];

      if (v27 == 16)
      {
        BOOL v28 = 1;
        goto LABEL_43;
      }
    }
    else
    {
    }
    uint64_t v29 = [v21 objectForKey:*MEMORY[0x1E4FB8880]];
    BOOL v28 = v29 != 0;

    if (!v22 && !v13 && !v29 && v21)
    {
      [(VUIPurchaseRequest *)self->_interruptedPurchaseRequest handleRequestCompletionWithResult:v21 andError:0];
      id v22 = 0;
LABEL_46:

      goto LABEL_18;
    }
LABEL_43:
    v30 = VUIDefaultLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v35 = v13;
      __int16 v36 = 2112;
      id v37 = v22;
      __int16 v38 = 1024;
      BOOL v39 = v28;
      _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Error finishing interrupted purchse: [%@] plist error [%@] Was cancelled [%d]", buf, 0x1Cu);
    }

    [(VUIPurchaser *)self setInterruptedPurchaseRequest:0];
    goto LABEL_46;
  }
LABEL_20:
}

- (BOOL)_isInterruptedPurchaseFulfilledBySSPurchaseResponse:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 purchase];
  id v5 = v4;
  if (!v4)
  {
    uint64_t v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      long long v15 = "VUIPurchaser - Interrupted purchase not valid ss response";
LABEL_13:
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, 2u);
    }
LABEL_14:
    char v14 = 0;
    goto LABEL_15;
  }
  if (!self->_interruptedPurchaseRequest)
  {
    uint64_t v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      long long v15 = "VUIPurchaser - No interrupted purchase request";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v6 = [v4 buyParameters];
  uint64_t v7 = [(VUIPurchaseRequest *)self->_interruptedPurchaseRequest purchase];
  id v8 = [v7 buyParams];
  id v9 = [v8 stringValue];

  uint64_t v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    BOOL v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - buyParams [%@], interruptedBuyParams[%@] ", (uint8_t *)&v17, 0x16u);
  }

  __int16 v11 = [(VUIPurchaser *)self _getAdamIdFromBuyParams:v6];
  uint64_t v12 = [(VUIPurchaser *)self _getAdamIdFromBuyParams:v9];
  uint64_t v13 = (void *)v12;
  char v14 = 0;
  if (v11 && v12) {
    char v14 = [v11 isEqualToString:v12];
  }

LABEL_15:
  return v14;
}

- (NSMutableSet)purchasingParamsSet
{
  return self->_purchasingParamsSet;
}

- (void)setPurchasingParamsSet:(id)a3
{
}

- (AMSUIPurchaseQueue)purchaseUIQueue
{
  return self->_purchaseUIQueue;
}

- (void)setPurchaseUIQueue:(id)a3
{
}

- (SSEventMonitor)eventMonitor
{
  return self->_eventMonitor;
}

- (void)setEventMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMonitor, 0);
  objc_storeStrong((id *)&self->_purchaseUIQueue, 0);
  objc_storeStrong((id *)&self->_purchasingParamsSet, 0);
  objc_storeStrong((id *)&self->_interruptedPurchaseRequest, 0);
}

@end