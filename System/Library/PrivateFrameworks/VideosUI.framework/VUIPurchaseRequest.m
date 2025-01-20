@interface VUIPurchaseRequest
+ (BOOL)shouldPlayWhenDoneForActionRef:(id)a3;
+ (int64_t)getPurchaseTypeFromActionRef:(id)a3;
- (AMSBuyParams)amsBuyParams;
- (AMSPurchase)purchase;
- (NSString)buyParamsString;
- (NSString)enhancedBuyParamsString;
- (VUIPurchaseRequest)initWithBuyParams:(id)a3 ofPurchaseType:(int64_t)a4;
- (id)completionHandler;
- (int64_t)purchaseType;
- (int64_t)type;
- (void)_createPurchaseRequest;
- (void)_recordErrorLog:(id)a3;
- (void)enqueueWithCompletion:(id)a3;
- (void)handleRequestCompletionWithResult:(id)a3 andError:(id)a4;
- (void)setAmsBuyParams:(id)a3;
- (void)setBuyParamsString:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setEnhancedBuyParamsString:(id)a3;
- (void)setPurchase:(id)a3;
- (void)setPurchaseType:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation VUIPurchaseRequest

- (VUIPurchaseRequest)initWithBuyParams:(id)a3 ofPurchaseType:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VUIPurchaseRequest;
  v8 = [(VUIPurchaseRequest *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_buyParamsString, a3);
    v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v19 = a4;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIPurchaseRequest - new request type: %ld, %@", buf, 0x16u);
    }

    v11 = +[VUIMetricsController sharedInstance];
    uint64_t v12 = [v11 getMetricsEnhancedBuyParams:v9->_buyParamsString];
    enhancedBuyParamsString = v9->_enhancedBuyParamsString;
    v9->_enhancedBuyParamsString = (NSString *)v12;

    uint64_t v14 = [MEMORY[0x1E4F4DC00] buyParamsWithString:v9->_enhancedBuyParamsString];
    amsBuyParams = v9->_amsBuyParams;
    v9->_amsBuyParams = (AMSBuyParams *)v14;

    v9->_purchaseType = 0;
    [(VUIPurchaseRequest *)v9 _createPurchaseRequest];
    _os_feature_enabled_impl();
  }

  return v9;
}

- (void)_createPurchaseRequest
{
  v3 = (AMSPurchase *)[objc_alloc(MEMORY[0x1E4F4DDD8]) initWithPurchaseType:self->_purchaseType buyParams:self->_amsBuyParams];
  purchase = self->_purchase;
  self->_purchase = v3;

  v5 = self->_purchase;
  v6 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v7 = objc_msgSend(v6, "ams_activeiTunesAccount");
  [(AMSPurchase *)v5 setAccount:v7];

  [(AMSPurchase *)self->_purchase setRequiresAccount:1];
  v8 = self->_purchase;
  [(AMSPurchase *)v8 setUserInitiated:1];
}

- (void)enqueueWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[VUIPurchaser sharedInstance];
  [(VUIPurchaseRequest *)self setCompletionHandler:v4];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__VUIPurchaseRequest_enqueueWithCompletion___block_invoke;
  v6[3] = &unk_1E6DF5970;
  v6[4] = self;
  [v5 enqueuePurchase:self withCompletion:v6];
}

void __44__VUIPurchaseRequest_enqueueWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 responseDictionary];
  [*(id *)(a1 + 32) handleRequestCompletionWithResult:v6 andError:v5];
}

- (void)handleRequestCompletionWithResult:(id)a3 andError:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIPurchaseRequest - Purchase completed: %@, %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v13 = __65__VUIPurchaseRequest_handleRequestCompletionWithResult_andError___block_invoke;
  uint64_t v14 = &unk_1E6DF3F90;
  objc_copyWeak(&v17, (id *)buf);
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  v11 = v12;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v13((uint64_t)v11);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }

  [(VUIPurchaseRequest *)self _recordErrorLog:v10];
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __65__VUIPurchaseRequest_handleRequestCompletionWithResult_andError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained completionHandler];
  v3 = (void *)v2;
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

+ (int64_t)getPurchaseTypeFromActionRef:(id)a3
{
  uint64_t v3 = getPurchaseTypeFromActionRef__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&getPurchaseTypeFromActionRef__onceToken, &__block_literal_global_28);
  }
  id v5 = [(id)getPurchaseTypeFromActionRef__sCommerceActionRefToPurchaseType objectForKeyedSubscript:v4];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

void __51__VUIPurchaseRequest_getPurchaseTypeFromActionRef___block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"actionRefGet";
  v2[1] = @"actionRefBuy";
  v3[0] = &unk_1F3F3C7B8;
  v3[1] = &unk_1F3F3C7B8;
  v2[2] = @"actionRefRentWatchNow";
  v2[3] = @"actionRefComplete";
  v3[2] = &unk_1F3F3C7B8;
  v3[3] = &unk_1F3F3C7B8;
  v2[4] = @"actionRefUpdate";
  v2[5] = @"actionRefRent";
  v3[4] = &unk_1F3F3C7B8;
  v3[5] = &unk_1F3F3C7B8;
  v2[6] = @"actionRefPreorder";
  v2[7] = @"actionRefSubscribe";
  v3[6] = &unk_1F3F3C7B8;
  v3[7] = &unk_1F3F3C7D0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)getPurchaseTypeFromActionRef__sCommerceActionRefToPurchaseType;
  getPurchaseTypeFromActionRef__sCommerceActionRefToPurchaseType = v0;
}

+ (BOOL)shouldPlayWhenDoneForActionRef:(id)a3
{
  return 0;
}

- (void)_recordErrorLog:(id)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = NSString;
    int64_t type = self->_type;
    id v6 = a3;
    uint64_t v7 = [v4 stringWithFormat:@"%@ - %ld", @"commerce transaction failure", type];
    v8 = (void *)v7;
    if (v7) {
      id v9 = (__CFString *)v7;
    }
    else {
      id v9 = &stru_1F3E921E0;
    }
    v27[0] = v9;
    v26[0] = @"message";
    v26[1] = @"errorCode";
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", objc_msgSend(v6, "code"));
    v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = (__CFString *)v10;
    }
    else {
      uint64_t v12 = &stru_1F3E921E0;
    }
    v27[1] = v12;
    v26[2] = @"errorDomain";
    uint64_t v13 = [v6 domain];
    uint64_t v14 = (void *)v13;
    if (v13) {
      id v15 = (__CFString *)v13;
    }
    else {
      id v15 = &stru_1F3E921E0;
    }
    v26[3] = @"buyParams";
    enhancedBuyParamsString = (__CFString *)self->_enhancedBuyParamsString;
    if (!enhancedBuyParamsString) {
      enhancedBuyParamsString = &stru_1F3E921E0;
    }
    v27[2] = v15;
    v27[3] = enhancedBuyParamsString;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

    v18 = [v6 userInfo];

    id v19 = [v18 objectForKeyedSubscript:@"AMSServerErrorCode"];

    if (v19)
    {
      v24[0] = @"underlyingErrorCode";
      v24[1] = @"underlyingErrorDomain";
      v25[0] = v19;
      v25[1] = @"AMSServerError";
      __int16 v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
      id v21 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v17];
      [v21 addEntriesFromDictionary:v20];
      uint64_t v22 = [v21 copy];

      id v17 = (void *)v22;
    }
    v23 = +[VUIMetricsController sharedInstance];
    [v23 recordLog:v17];
  }
}

- (AMSPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
}

- (NSString)buyParamsString
{
  return self->_buyParamsString;
}

- (void)setBuyParamsString:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSString)enhancedBuyParamsString
{
  return self->_enhancedBuyParamsString;
}

- (void)setEnhancedBuyParamsString:(id)a3
{
}

- (AMSBuyParams)amsBuyParams
{
  return self->_amsBuyParams;
}

- (void)setAmsBuyParams:(id)a3
{
}

- (int64_t)purchaseType
{
  return self->_purchaseType;
}

- (void)setPurchaseType:(int64_t)a3
{
  self->_purchaseType = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_amsBuyParams, 0);
  objc_storeStrong((id *)&self->_enhancedBuyParamsString, 0);
  objc_storeStrong((id *)&self->_buyParamsString, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
}

@end