@interface VUIActionCommerceTransaction
+ (BOOL)isTransactionInProgressForBuyParams:(id)a3;
+ (id)extractSalableAdamIDFromBuyParams:(id)a3;
+ (void)displayConfirmationUIWithTitle:(id)a3 andBody:(id)a4;
+ (void)displayConfirmationUIWithTitle:(id)a3 andBody:(id)a4 completion:(id)a5;
- (NSDictionary)contextData;
- (NSString)buyParams;
- (NSString)commerceActionRef;
- (VUIActionCommerceTransaction)initWithActionRef:(id)a3 contextData:(id)a4 appContext:(id)a5;
- (VUIAppContext)appContext;
- (id)_preflightManagerForTransactionOffer:(id)a3 purchaseType:(int64_t)a4;
- (void)_handleBuyCompletionForOffer:(id)a3 appContext:(id)a4 shouldPlayWhenDone:(BOOL)a5 serverResponse:(id)a6 completionHandler:(id)a7;
- (void)_handleSubscriptionCompletionForOffer:(id)a3 appContext:(id)a4 shouldInitiateFamilySetup:(BOOL)a5 serverResponse:(id)a6 completionHandler:(id)a7;
- (void)_notifyDidEndPurchaseType:(int64_t)a3 transactionOffer:(id)a4 withError:(id)a5;
- (void)_notifyDidStartPurchaseType:(int64_t)a3 transactionOffer:(id)a4;
- (void)_recordLog:(id)a3 withBuyParams:(id)a4;
- (void)_showUIConfirmationForSubTransaction:(id)a3 completion:(id)a4;
- (void)_startTransactionOfOffer:(id)a3 withAppContext:(id)a4 andCompletionHandler:(id)a5;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setAppContext:(id)a3;
- (void)setCommerceActionRef:(id)a3;
@end

@implementation VUIActionCommerceTransaction

- (VUIActionCommerceTransaction)initWithActionRef:(id)a3 contextData:(id)a4 appContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VUIActionCommerceTransaction;
  v11 = [(VUIActionCommerceTransaction *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(VUIActionCommerceTransaction *)v11 setCommerceActionRef:v8];
    objc_storeStrong((id *)&v12->_contextData, a4);
    objc_storeWeak((id *)&v12->_appContext, v10);
    v13 = +[VUIActionCommerceInterruptedTransactionManager sharedInstance];
    [v13 setLastInterruptedOfferDetails:0];
  }
  return v12;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, void))a4;
  v6 = [[VUITransactionOffer alloc] initWithDictionary:self->_contextData];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  id v8 = +[VUIPurchaser sharedInstance];
  id v9 = [(VUITransactionOffer *)v6 buyParams];
  int v10 = [v8 isPurchasing:v9];

  if (v10)
  {
    v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "PurchaseAction - performWithTargetResponder: ending early because purchase with buyParams already exists", v12, 2u);
    }

    if (v5) {
      v5[2](v5, 0);
    }
  }
  else
  {
    [(VUIActionCommerceTransaction *)self _startTransactionOfOffer:v6 withAppContext:WeakRetained andCompletionHandler:v5];
  }
}

- (NSString)buyParams
{
  v2 = [[VUITransactionOffer alloc] initWithDictionary:self->_contextData];
  v3 = [(VUITransactionOffer *)v2 buyParams];

  return (NSString *)v3;
}

- (id)_preflightManagerForTransactionOffer:(id)a3 purchaseType:(int64_t)a4
{
  id v5 = a3;
  v6 = +[VUIPreflightManager defaultPreflightManager];
  v7 = +[VUIApplicationRouter topPresentedViewController];
  if (!v7)
  {
    id v8 = +[VUITVAppLauncher sharedInstance];
    id v9 = [v8 appWindow];

    v7 = [v9 rootViewController];
  }
  [v6 setPresentingController:v7];
  [v6 setRestrictionsCheckType:2];
  if (v5)
  {
    int v10 = [v5 videosPlayables];

    if (v10)
    {
      v11 = [v5 videosPlayables];
      uint64_t v12 = [v11 firstObject];
    }
    else
    {
      objc_super v15 = [v5 offer];
      v11 = [v15 objectForKey:@"playbackMetadata"];

      if (!v11
        || ([v11 objectForKey:@"ratingDomain"],
            v16 = objc_claimAutoreleasedReturnValue(),
            v16,
            !v16))
      {
        if (a4 == 1) {
          [v6 setIsSubscriptionPurchaseWithoutPlayback:1];
        }
        goto LABEL_7;
      }
      v17 = [VUIVideosPlayable alloc];
      uint64_t v12 = [(VUIVideosPlayable *)v17 initWithDictionary:MEMORY[0x1E4F1CC08] andMetadataDictionary:v11];
    }
    v13 = (void *)v12;
    [v6 setVideosPlayable:v12];

LABEL_7:
  }

  return v6;
}

- (void)_startTransactionOfOffer:(id)a3 withAppContext:(id)a4 andCompletionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = +[VUIPurchaseRequest getPurchaseTypeFromActionRef:self->_commerceActionRef];
  BOOL v12 = +[VUIPurchaseRequest shouldPlayWhenDoneForActionRef:self->_commerceActionRef];
  char v13 = [v8 initiateFamilySetup];
  v14 = VUIDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    commerceActionRef = self->_commerceActionRef;
    *(_DWORD *)buf = 138412802;
    v32 = commerceActionRef;
    __int16 v33 = 2048;
    int64_t v34 = v11;
    __int16 v35 = 1024;
    BOOL v36 = v12;
    _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "PurchaseAction - _amsStartPurchaseFlowForOffer: [%@], type: %ld, shouldPlayWhenDone: %d", buf, 0x1Cu);
  }

  v16 = [v8 buyParams];
  v17 = +[VUIPurchaser sharedInstance];
  [v17 rememberPurchasing:v16];

  v18 = [(VUIActionCommerceTransaction *)self _preflightManagerForTransactionOffer:v8 purchaseType:v11];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke;
  v23[3] = &unk_1E6DFD558;
  v23[4] = self;
  id v24 = v8;
  id v27 = v10;
  int64_t v28 = v11;
  id v25 = v16;
  id v26 = v9;
  char v29 = v13;
  BOOL v30 = v12;
  id v19 = v9;
  id v20 = v10;
  id v21 = v16;
  id v22 = v8;
  [v18 preflightWithOptions:1 completion:v23];
}

void __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  [*(id *)(a1 + 32) _notifyDidStartPurchaseType:*(void *)(a1 + 72) transactionOffer:*(void *)(a1 + 40)];
  if (a2)
  {
    v4 = [[VUIPurchaseRequest alloc] initWithBuyParams:*(void *)(a1 + 48) ofPurchaseType:*(void *)(a1 + 72)];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_113;
    v8[3] = &unk_1E6DFD530;
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    id v5 = *(id *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 72);
    id v13 = v5;
    uint64_t v14 = v6;
    id v12 = *(id *)(a1 + 56);
    __int16 v15 = *(_WORD *)(a1 + 80);
    [(VUIPurchaseRequest *)v4 enqueueWithCompletion:v8];
  }
  else
  {
    v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "PurchaseAction - Purchase restricted", buf, 2u);
    }

    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRANSACTION_RESTRICTED_CONTENT" code:0 userInfo:0];
    [*(id *)(a1 + 32) _notifyDidEndPurchaseType:*(void *)(a1 + 72) transactionOffer:*(void *)(a1 + 40) withError:v4];
  }
}

void __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_113(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = +[VUIPurchaser sharedInstance];
  [v7 forgetPurchasing:*(void *)(a1 + 32)];

  id v8 = VUIDefaultLogObject();
  id v9 = v8;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_113_cold_1((uint64_t)v6, v9);
    }

    uint64_t v14 = [*(id *)(a1 + 40) videosPlayables];
    __int16 v15 = [v14 firstObject];
    v16 = [v15 sharedWatchId];

    v17 = +[VUIInterfaceFactory sharedInstance];
    v18 = [v17 groupActivitiesManager];
    int v19 = [v18 isSharedWatchIdValidForCurrentSession:v16];

    id v20 = VUIDefaultLogObject();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "PurchaseAction - Leaving session due to failed purchase flow", buf, 2u);
      }

      id v20 = +[VUIInterfaceFactory sharedInstance];
      id v22 = [v20 groupActivitiesManager];
      [v22 leaveSession];
    }
    else if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "PurchaseAction - Not leaving session because the active session is different than the upsell session", buf, 2u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    int64_t v28 = __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_115;
    char v29 = &unk_1E6DFD508;
    id v23 = *(id *)(a1 + 64);
    uint64_t v24 = *(void *)(a1 + 72);
    id v32 = v23;
    uint64_t v33 = v24;
    int8x16_t v26 = *(int8x16_t *)(a1 + 40);
    id v25 = (id)v26.i64[0];
    int8x16_t v30 = vextq_s8(v26, v26, 8uLL);
    id v31 = v6;
    char v34 = 0;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v28((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v5;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "PurchaseAction - Purchase server response [%@]", buf, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v11 = *(void **)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    if (*(void *)(a1 + 72) == 1) {
      [v11 _handleSubscriptionCompletionForOffer:v12 appContext:v13 shouldInitiateFamilySetup:*(unsigned __int8 *)(a1 + 80) serverResponse:v5 completionHandler:v10];
    }
    else {
      [v11 _handleBuyCompletionForOffer:v12 appContext:v13 shouldPlayWhenDone:*(unsigned __int8 *)(a1 + 81) serverResponse:v5 completionHandler:v10];
    }
  }
}

void __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_115(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_2;
  aBlock[3] = &unk_1E6DFD4E0;
  id v2 = *(id *)(a1 + 56);
  v3 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 64);
  id v17 = v2;
  uint64_t v18 = v4;
  id v15 = v3;
  id v16 = *(id *)(a1 + 48);
  id v5 = _Block_copy(aBlock);
  id v6 = v5;
  if (*(unsigned char *)(a1 + 72))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E6DF3DD0;
    v7 = &v13;
    uint64_t v13 = v5;
    id v8 = v5;
    +[VUIApplicationRouter dismissOrPopLastViewControllerWithCompletion:v12];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_4;
    v10[3] = &unk_1E6DF3DD0;
    v7 = &v11;
    uint64_t v11 = v5;
    id v9 = v5;
    +[VUIApplicationRouter dismissOrPopViewControllerWithId:@"CommerceViewControllerIdentifier" completion:v10];
  }
}

uint64_t __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 56))
  {
    v1 = (void *)result;
    [*(id *)(result + 32) _notifyDidEndPurchaseType:*(void *)(result + 64) transactionOffer:v1[5] withError:v1[6]];
    id v2 = *(uint64_t (**)(void))(v1[7] + 16);
    return v2();
  }
  return result;
}

uint64_t __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleBuyCompletionForOffer:(id)a3 appContext:(id)a4 shouldPlayWhenDone:(BOOL)a5 serverResponse:(id)a6 completionHandler:(id)a7
{
  id v9 = a3;
  id v10 = a7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  id v15 = __124__VUIActionCommerceTransaction__handleBuyCompletionForOffer_appContext_shouldPlayWhenDone_serverResponse_completionHandler___block_invoke;
  id v16 = &unk_1E6DF4510;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  uint64_t v11 = (void *)MEMORY[0x1E4F29060];
  id v12 = v10;
  id v13 = v9;
  if ([v11 isMainThread]) {
    v15((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __124__VUIActionCommerceTransaction__handleBuyCompletionForOffer_appContext_shouldPlayWhenDone_serverResponse_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F31890] sharedCloudController];
  [v2 updateJaliscoMediaLibraryWithReason:1 completionHandler:0];

  v3 = +[VUIPurchaser sharedInstance];
  uint64_t v4 = [*(id *)(a1 + 32) buyParams];
  [v3 postCrossProcessNotificationWithBuyParams:v4 error:0];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __124__VUIActionCommerceTransaction__handleBuyCompletionForOffer_appContext_shouldPlayWhenDone_serverResponse_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6DF4510;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  id v9 = *(id *)(a1 + 48);
  +[VUIApplicationRouter dismissOrPopViewControllerWithId:@"CommerceViewControllerIdentifier" completion:v7];
}

void __124__VUIActionCommerceTransaction__handleBuyCompletionForOffer_appContext_shouldPlayWhenDone_serverResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyDidEndPurchaseType:0 transactionOffer:*(void *)(a1 + 40) withError:0];
  id v2 = [*(id *)(a1 + 40) sharedWatchUrl];
  if (v2)
  {
    v3 = +[VUIInterfaceFactory sharedInstance];
    uint64_t v4 = [v3 groupActivitiesManager];
    [v4 handleCommerceSharedWatchUrl:v2];
  }
  else
  {
    v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int8x16_t v6 = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "PurchaseAction - BuyRentFlow:: GroupActivity no shared watch url!", v6, 2u);
    }
  }

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
  }
}

- (void)_handleSubscriptionCompletionForOffer:(id)a3 appContext:(id)a4 shouldInitiateFamilySetup:(BOOL)a5 serverResponse:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  uint64_t v14 = [MEMORY[0x1E4FB5088] sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke;
  v19[3] = &unk_1E6DFD5F8;
  id v20 = v11;
  BOOL v21 = self;
  id v22 = v12;
  id v23 = v13;
  BOOL v24 = a5;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  [v14 fetchConfigurationWithOptions:0 cachePolicy:3 queryParameters:0 completion:v19];

  uint64_t v18 = [MEMORY[0x1E4FB5170] sharedInstance];
  [v18 fetchSubscriptionData:1 completion:&__block_literal_global_159];
}

void __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "PurchaseAction - UTS Subscription state refreshed. error: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  id v10 = __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_120;
  id v11 = &unk_1E6DFD5D0;
  id v12 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 40);
  int8x16_t v8 = *(void **)(a1 + 48);
  id v15 = v6;
  uint64_t v13 = v7;
  id v14 = v8;
  char v16 = *(unsigned char *)(a1 + 64);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v10((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_120(uint64_t a1)
{
  id v2 = +[VUIPurchaser sharedInstance];
  v3 = [*(id *)(a1 + 32) buyParams];
  [v2 postCrossProcessNotificationWithBuyParams:v3 error:0];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_2;
  v6[3] = &unk_1E6DF7728;
  id v9 = *(id *)(a1 + 56);
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  id v8 = *(id *)(a1 + 48);
  char v10 = *(unsigned char *)(a1 + 64);
  +[VUIApplicationRouter dismissOrPopViewControllerWithId:@"CommerceViewControllerIdentifier" completion:v6];
}

void __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    [*(id *)(a1 + 32) _notifyDidEndPurchaseType:1 transactionOffer:*(void *)(a1 + 40) withError:0];
    v3 = *(void **)(a1 + 32);
    id v2 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_3;
    v6[3] = &unk_1E6DFD5A8;
    id v7 = v2;
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = v4;
    uint64_t v9 = v5;
    char v11 = *(unsigned char *)(a1 + 64);
    id v10 = *(id *)(a1 + 56);
    [v3 _showUIConfirmationForSubTransaction:v7 completion:v6];
  }
}

uint64_t __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = +[VUIPlaybackManager sharedInstance];
  int v3 = [v2 isPostPlayActive];

  id v4 = [*(id *)(a1 + 32) sharedWatchUrl];
  if (v4)
  {
    uint64_t v5 = v4;
    if (v3)
    {
      id v6 = [v4 vui_URLByAddingQueryParamWithName:@"postPlay" value:@"true"];

      uint64_t v5 = objc_msgSend(v6, "vui_URLByAddingQueryParamWithName:value:", @"binge", @"true");
    }
    id v7 = +[VUIInterfaceFactory sharedInstance];
    id v8 = [v7 groupActivitiesManager];
    char v9 = [v8 handleCommerceSharedWatchUrl:v5];
  }
  else
  {
    uint64_t v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "PurchaseAction - SubscriptionFlow:: GroupActivity no shared watch url!", buf, 2u);
    }
    char v9 = 0;
  }

  if ((v9 & 1) == 0 && ((v3 ^ 1) & 1) == 0)
  {
    id v10 = [*(id *)(a1 + 32) videosPlayables];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) videosPlayables];
      uint64_t v13 = [v12 firstObject];

      id v14 = VUIDefaultLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v13 canonicalID];
        *(_DWORD *)buf = 138412290;
        int8x16_t v30 = v15;
        _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "PurchaseAction - Resolving playable for id %@", buf, 0xCu);
      }
      char v16 = [v13 canonicalID];
      id v17 = [v13 showCanonicalID];
      id v18 = [v13 mediaType];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_126;
      v25[3] = &unk_1E6DFD580;
      id v19 = *(id *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      id v26 = v19;
      uint64_t v27 = v20;
      id v28 = v13;
      BOOL v21 = v13;
      +[VUIPlayableResolver playableForCanonicalID:v16 showID:v17 mediaType:v18 completion:v25];

      id v22 = v26;
LABEL_18:

      return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  if (*(unsigned char *)(a1 + 64))
  {
    id v23 = VUIDefaultLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "PurchaseAction - SubscriptionFlow showing family invite manager", buf, 2u);
    }

    BOOL v21 = objc_alloc_init(VUIFamilyInviteManager);
    id v22 = [*(id *)(a1 + 32) buyParams];
    [(VUIFamilyInviteManager *)v21 presentFamilySetupScreenWithBuyParams:v22];
    goto LABEL_18;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = VUIDefaultLogObject();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = [v5 canonicalID];
      *(_DWORD *)buf = 138412290;
      id v23 = v9;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "PurchaseAction - Finished resolving playable for id %@", buf, 0xCu);
    }
    id v10 = [VUIMediaInfo alloc];
    id v21 = v5;
    uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
    id v12 = v5;
    uint64_t v13 = [v11 arrayWithObjects:&v21 count:1];

    id v8 = [(VUIMediaInfo *)v10 initWithPlaybackContext:5 videosPlayables:v13 imageProxies:0 storeDictionary:0];
    [v8 setAppContext:*(void *)(a1 + 32)];
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v8 setUserPlaybackInitiationDate:v14 openURLCompletionDate:0];

    [v8 setIntent:1];
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      uint64_t v16 = [*(id *)(v15 + 8) isEqualToString:@"actionRefRentWatchNow"];
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = [v12 sharedWatchId];
    id v18 = +[VUIInterfaceFactory sharedInstance];
    id v19 = [v18 groupActivitiesManager];
    uint64_t v20 = [v19 isSharedWatchIdValidForCurrentSession:v17];

    +[VUIActionPlay playMediaInfo:v8 watchType:v20 isRentAndWatchNow:v16];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_126_cold_1(a1, (uint64_t)v6, v8);
  }
}

void __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_135(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VUIDefaultLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      id v7 = "PurchaseAction - SubscriptionFlow successfully refreshed subscription store";
      id v8 = v5;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    int v10 = 138412290;
    id v11 = v4;
    id v7 = "PurchaseAction - SubscriptionFlow error refreshing subscriptions from finance: %@";
    id v8 = v5;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

- (void)_showUIConfirmationForSubTransaction:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 notificationTitle];
  uint32_t v9 = (void *)[v8 copy];

  int v10 = [v7 notificationBody];

  id v11 = (void *)[v10 copy];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  id v17 = __80__VUIActionCommerceTransaction__showUIConfirmationForSubTransaction_completion___block_invoke;
  id v18 = &unk_1E6DF4538;
  id v19 = self;
  id v20 = v9;
  id v21 = v11;
  id v22 = v6;
  uint64_t v12 = (void *)MEMORY[0x1E4F29060];
  id v13 = v6;
  id v14 = v11;
  id v15 = v9;
  if (objc_msgSend(v12, "isMainThread", v16, 3221225472)) {
    v17(&v16);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v16);
  }
}

uint64_t __80__VUIActionCommerceTransaction__showUIConfirmationForSubTransaction_completion___block_invoke(void *a1)
{
  id v2 = objc_opt_class();
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  return [v2 displayConfirmationUIWithTitle:v3 andBody:v4 completion:v5];
}

- (void)_notifyDidStartPurchaseType:(int64_t)a3 transactionOffer:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v14 = a3;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "PurchaseAction - _notifyPurchaseDidStart, type:%ld", buf, 0xCu);
  }

  id v7 = [v5 buyParams];

  id v8 = +[VUIPurchaser sharedInstance];
  [v8 rememberPurchasing:v7];
  uint32_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v11 = @"TransactionID";
  uint64_t v12 = v7;
  int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v9 postNotificationName:@"VUIPurchaseOrSubscribeRequestDidStartNotification" object:0 userInfo:v10];
}

- (void)_notifyDidEndPurchaseType:(int64_t)a3 transactionOffer:(id)a4 withError:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint32_t v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v25 = a3;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "PurchaseAction - _notifyPurchaseDidEnd, type:%ld, error:%@", buf, 0x16u);
  }

  int v10 = [v7 buyParams];
  id v11 = +[VUIPurchaser sharedInstance];
  [v11 forgetPurchasing:v10];
  uint64_t v12 = objc_opt_new();
  [v12 setObject:v10 forKeyedSubscript:@"TransactionID"];
  if (v8) {
    [v12 setObject:v8 forKeyedSubscript:@"Error"];
  }
  id v13 = [v7 canonicalIDs];
  if (v13) {
    [v12 setObject:v13 forKeyedSubscript:@"CanonicalIDs"];
  }
  int64_t v14 = VUIPurchaseRequestDidFinishNotification;
  if (a3 == 1) {
    int64_t v14 = VUISubscribeRequestDidFinishNotification;
  }
  uint64_t v15 = *v14;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __85__VUIActionCommerceTransaction__notifyDidEndPurchaseType_transactionOffer_withError___block_invoke;
  id v21 = &unk_1E6DF3F68;
  id v22 = v15;
  id v23 = v12;
  id v16 = v12;
  id v17 = v15;
  dispatch_async(MEMORY[0x1E4F14428], &v18);
  if (!v8) {
    objc_msgSend(v11, "setInterruptedPurchaseRequest:", 0, v18, v19, v20, v21, v22, v23);
  }
}

void __85__VUIActionCommerceTransaction__notifyDidEndPurchaseType_transactionOffer_withError___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 32) object:0 userInfo:*(void *)(a1 + 40)];
}

+ (void)displayConfirmationUIWithTitle:(id)a3 andBody:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

+ (void)displayConfirmationUIWithTitle:(id)a3 andBody:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)objc_opt_class() displayConfirmationUIWithTitle:v6 andBody:v5 completion:0];
}

+ (BOOL)isTransactionInProgressForBuyParams:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[VUIPurchaser sharedInstance];
  char v5 = [v4 isPurchasing:v3];

  return v5;
}

- (void)_recordLog:(id)a3 withBuyParams:(id)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a4;
  id v7 = a3;
  id v8 = [(VUIActionCommerceTransaction *)self commerceActionRef];
  uint32_t v9 = [@"commerce transaction failure - " stringByAppendingString:v8];

  if (v9) {
    int v10 = v9;
  }
  else {
    int v10 = &stru_1F3E921E0;
  }
  v20[0] = v10;
  v19[0] = @"message";
  v19[1] = @"errorCode";
  id v11 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v12 = [v7 code];

  uint64_t v13 = [v11 numberWithLong:v12];
  int64_t v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (__CFString *)v13;
  }
  else {
    uint64_t v15 = &stru_1F3E921E0;
  }
  v19[2] = @"buyParams";
  if (v6) {
    id v16 = v6;
  }
  else {
    id v16 = &stru_1F3E921E0;
  }
  v20[1] = v15;
  v20[2] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  uint64_t v18 = +[VUIMetricsController sharedInstance];

  [v18 recordLog:v17];
}

+ (id)extractSalableAdamIDFromBuyParams:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v17 = v3;
  [v3 componentsSeparatedByString:@"&"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      int v10 = [*(id *)(*((void *)&v18 + 1) + 8 * v9) componentsSeparatedByString:@"="];
      id v11 = [v10 firstObject];
      uint64_t v12 = [v11 stringByRemovingPercentEncoding];

      uint64_t v13 = [v10 lastObject];
      int64_t v14 = [(id)v13 stringByRemovingPercentEncoding];

      [v4 setObject:v14 forKey:v12];
      LOBYTE(v13) = [v12 isEqualToString:@"salableAdamId"];

      if (v13) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v15 = [v4 objectForKey:@"salableAdamId"];

  return v15;
}

- (NSString)commerceActionRef
{
  return self->_commerceActionRef;
}

- (void)setCommerceActionRef:(id)a3
{
}

- (NSDictionary)contextData
{
  return self->_contextData;
}

- (VUIAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (VUIAppContext *)WeakRetained;
}

- (void)setAppContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_commerceActionRef, 0);
}

void __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_113_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "PurchaseAction - Purchase failed: %@", (uint8_t *)&v2, 0xCu);
}

void __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_126_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1 + 48) canonicalID];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1E2BD7000, a3, OS_LOG_TYPE_ERROR, "PurchaseAction - Failed to resolve playable for id %@, with error %@", (uint8_t *)&v6, 0x16u);
}

@end