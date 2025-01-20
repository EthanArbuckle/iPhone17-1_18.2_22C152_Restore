@interface ICQPurchase
+ (id)clearCacheAndNotifyClientsWithCompletion:(id)a3;
+ (id)parseParameters:(id)a3 action:(int64_t)a4;
+ (id)upgradeStorageKeyBagForOffer:(id)a3 buttonID:(id)a4;
+ (id)upgradeStorageQueryDictionaryForOffer:(id)a3 buttonID:(id)a4;
+ (id)upgradeStorageQueryKeySet;
+ (id)userAgentForBundleIdentifier:(id)a3 appVersion:(id)a4 attributionSuffix:(id)a5;
+ (void)clearCacheAndNotifyClients;
- (BOOL)isLegacyNativeFlow;
- (ICQOffer)offer;
- (ICQPurchase)initWithOffer:(id)a3 clientInfo:(id)a4;
- (ICQPurchaseDelegate)delegate;
- (NSArray)interruptedBuyErrorCodes;
- (NSDictionary)clientInfo;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (NSString)userAgentSuffix;
- (NSURLSession)session;
- (id)actionString;
- (id)completionHandler;
- (int64_t)amsServerErrorCode;
- (int64_t)offerAction;
- (int64_t)statusCode;
- (void)beginPurchaseFlow;
- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handlePurchaseCompletionWithError:(id)a3;
- (void)preparePurchase;
- (void)setAmsServerErrorCode:(int64_t)a3;
- (void)setClientInfo:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInterruptedBuyErrorCodes:(id)a3;
- (void)setIsLegacyNativeFlow:(BOOL)a3;
- (void)setOffer:(id)a3;
- (void)setPresentingSceneBundleIdentifier:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setSession:(id)a3;
- (void)setStatusCode:(int64_t)a3;
- (void)setUserAgentSuffix:(id)a3;
- (void)startPurchaseWithCompletion:(id)a3;
@end

@implementation ICQPurchase

- (ICQPurchase)initWithOffer:(id)a3 clientInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICQPurchase;
  v8 = [(ICQPurchase *)&v15 init];
  v9 = v8;
  if (v8)
  {
    [(ICQPurchase *)v8 setOffer:v6];
    objc_storeStrong((id *)&v9->_clientInfo, a4);
    v10 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    v11 = (void *)[objc_alloc(MEMORY[0x263F29120]) initWithIdentifier:@"ICQPurchaseURLSession"];
    objc_msgSend(v10, "set_appleIDContext:", v11);

    uint64_t v12 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v10];
    session = v9->_session;
    v9->_session = (NSURLSession *)v12;
  }
  return v9;
}

- (id)actionString
{
  v2 = [(ICQPurchase *)self clientInfo];
  v3 = [v2 objectForKeyedSubscript:@"action"];

  return v3;
}

- (int64_t)offerAction
{
  v2 = [(ICQPurchase *)self actionString];
  int64_t v3 = _ICQActionForServerActionString();

  return v3;
}

- (void)startPurchaseWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ICQPurchase *)self clientInfo];
  id v6 = [v5 objectForKeyedSubscript:@"parameters"];

  int64_t v7 = [(ICQPurchase *)self offerAction];
  [(ICQPurchase *)self preparePurchase];
  v8 = +[ICQPurchase parseParameters:v6 action:v7];
  if (v8)
  {
    v9 = (void *)[v4 copy];
    [(ICQPurchase *)self setCompletionHandler:v9];

    v10 = [(ICQPurchase *)self offer];
    v11 = [(ICQPurchase *)self actionString];
    [v10 updateOfferWithPlanDetails:v8 actionString:v11];

    [(ICQPurchase *)self beginPurchaseFlow];
  }
  else
  {
    uint64_t v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(ICQPurchase *)self actionString];
      int v15 = 138412546;
      uint64_t v16 = 0;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "No plan details found for planDetails %@ and actionString %@.", (uint8_t *)&v15, 0x16u);
    }
    v14 = ICQCreateError();
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v14);
  }
}

- (void)preparePurchase
{
}

- (void)beginPurchaseFlow
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "AMSPurchase did not support selector setAccount", v1, 2u);
}

uint64_t __32__ICQPurchase_beginPurchaseFlow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePurchaseCompletionWithError:");
}

- (void)handlePurchaseCompletionWithError:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICQPurchase handlePurchaseCompletionWithError:]((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v53) = 0;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Oslo purchase completed without any error!", (uint8_t *)&v53, 2u);
  }

  v13 = [(ICQPurchase *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    int v15 = [(ICQPurchase *)self delegate];
    [v15 stopActivityIndicator];
  }
  [(ICQPurchase *)self setAmsServerErrorCode:0];
  uint64_t v16 = [v4 domain];
  int v17 = [v16 isEqualToString:*MEMORY[0x263F27850]];

  if (!v17)
  {
LABEL_20:
    if ([v4 code] == 305)
    {
      interruptedBuyErrorCodes = self->_interruptedBuyErrorCodes;
      if (interruptedBuyErrorCodes)
      {
        v35 = objc_msgSend(NSNumber, "numberWithLong:", -[ICQPurchase amsServerErrorCode](self, "amsServerErrorCode"));
        BOOL v36 = [(NSArray *)interruptedBuyErrorCodes containsObject:v35];

        v37 = _ICQGetLogSystem();
        BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
        if (v36)
        {
          if (v38)
          {
            int64_t v39 = [(ICQPurchase *)self amsServerErrorCode];
            int v53 = 134217984;
            int64_t v54 = v39;
            v40 = "interrupted flow with error code = %ld";
            v41 = v37;
            uint32_t v42 = 12;
LABEL_31:
            _os_log_impl(&dword_22C821000, v41, OS_LOG_TYPE_DEFAULT, v40, (uint8_t *)&v53, v42);
            goto LABEL_32;
          }
          goto LABEL_32;
        }
        if (v38)
        {
          int64_t v43 = [(ICQPurchase *)self amsServerErrorCode];
          int v53 = 134217984;
          int64_t v54 = v43;
          _os_log_impl(&dword_22C821000, v37, OS_LOG_TYPE_DEFAULT, "uninterrupted flow with error code = %ld", (uint8_t *)&v53, 0xCu);
        }
      }
    }
    if (!objc_msgSend(v4, "icq_isPSD2StepUpError"))
    {
      if (v4
        && [(ICQPurchase *)self amsServerErrorCode] != 3067
        && [(ICQPurchase *)self amsServerErrorCode] != 3068
        && [(ICQPurchase *)self amsServerErrorCode] != 8067
        && [(ICQPurchase *)self amsServerErrorCode] != 8068)
      {
        v25 = self;
        uint64_t v24 = 1;
LABEL_16:
        [(ICQPurchase *)v25 setStatusCode:v24];
        v26 = [(ICQPurchase *)self completionHandler];
        v27 = (void (*)(void))v26[2];
LABEL_47:
        v27();
        goto LABEL_48;
      }
      [(ICQPurchase *)self setStatusCode:0];
      v46 = [(ICQPurchase *)self clientInfo];
      v47 = [v46 objectForKeyedSubscript:@"action"];
      int v48 = [v47 isEqualToString:@"UPGRADE_ENABLE_ICPL_OSLO"];

      if (v48)
      {
        v49 = [(ICQPurchase *)self delegate];
        char v50 = objc_opt_respondsToSelector();

        if (v50)
        {
          v51 = [(ICQPurchase *)self delegate];
          [v51 enableCloudPhotoLibraryWithCompletion:&__block_literal_global_2];
        }
      }
      if (![(ICQPurchase *)self isLegacyNativeFlow]
        || [(ICQPurchase *)self amsServerErrorCode] != 3068
        && [(ICQPurchase *)self amsServerErrorCode] != 8068)
      {
        v26 = [(ICQPurchase *)self completionHandler];
        v27 = (void (*)(void))v26[2];
        goto LABEL_47;
      }
      v26 = [(ICQPurchase *)self completionHandler];
      v52 = ICQCreateErrorWithMessage();
      ((void (*)(void *, uint64_t, void *))v26[2])(v26, 1, v52);

      goto LABEL_48;
    }
    v37 = _ICQGetLogSystem();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v53) = 0;
      v40 = "PSD2 step-up detected. Registering for darwin notifications.";
      v41 = v37;
      uint32_t v42 = 2;
      goto LABEL_31;
    }
LABEL_32:

    v44 = [(ICQPurchase *)self delegate];
    char v45 = objc_opt_respondsToSelector();

    if ((v45 & 1) == 0) {
      goto LABEL_49;
    }
    v26 = [(ICQPurchase *)self delegate];
    [v26 registerForDarwinNotifications];
LABEL_48:

    goto LABEL_49;
  }
  if ([v4 code] != 6)
  {
    if ([v4 code] == 305)
    {
      v28 = [v4 userInfo];
      uint64_t v29 = *MEMORY[0x263F27860];
      v30 = [v28 objectForKeyedSubscript:*MEMORY[0x263F27860]];
      char v31 = objc_opt_respondsToSelector();

      if (v31)
      {
        v32 = [v4 userInfo];
        v33 = [v32 objectForKeyedSubscript:v29];
        -[ICQPurchase setAmsServerErrorCode:](self, "setAmsServerErrorCode:", [v33 longValue]);
      }
    }
    goto LABEL_20;
  }
  v18 = [(ICQPurchase *)self delegate];
  int v19 = [v18 isLiftUIFlow];

  if (v19)
  {
    [(ICQPurchase *)self setStatusCode:1];
    v20 = [(ICQPurchase *)self completionHandler];
    ((void (**)(void, void, id))v20)[2](v20, 0, v4);
  }
  v21 = [(ICQPurchase *)self offer];
  uint64_t v22 = [v21 action];

  if (v22 == 118)
  {
    v23 = _ICQGetLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v53) = 0;
      _os_log_impl(&dword_22C821000, v23, OS_LOG_TYPE_DEFAULT, "Purchase cancelled during direct to oslo, running completion", (uint8_t *)&v53, 2u);
    }

    uint64_t v24 = [v4 code];
    v25 = self;
    goto LABEL_16;
  }
LABEL_49:
}

+ (id)upgradeStorageQueryDictionaryForOffer:(id)a3 buttonID:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v9 = +[ICQPurchase upgradeStorageKeyBagForOffer:v6 buttonID:v7];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = objc_msgSend(a1, "upgradeStorageQueryKeySet", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v16 = [v9 objectForKey:v15];
        if (v16) {
          [v8 setObject:v16 forKey:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  return v8;
}

+ (id)upgradeStorageKeyBagForOffer:(id)a3 buttonID:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = [v5 storagePurchaseKeybagForButtonId:a4];
  }
  else
  {
    id v8 = [v5 buttonSpecification];
    uint64_t v9 = [v8 buttonLink];
    uint64_t v10 = [v9 parameters];

    uint64_t v11 = [v10 objectForKeyedSubscript:@"ServerLinkId"];
    id v7 = [v6 storagePurchaseKeybagForButtonId:v11];

    id v6 = v10;
  }

  return v7;
}

+ (id)upgradeStorageQueryKeySet
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_26E01EC78];
}

+ (id)parseParameters:(id)a3 action:(int64_t)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  id v7 = 0;
  char v8 = a4 - 105;
  if ((unint64_t)(a4 - 105) <= 0x16)
  {
    if (((1 << v8) & 0x403800) != 0)
    {
      id v9 = objc_alloc(MEMORY[0x263EFF9A0]);
      char v14 = @"buyParams";
      v15[0] = v6;
      uint64_t v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      uint64_t v11 = [v9 initWithDictionary:v10];
    }
    else
    {
      if (((1 << v8) & 9) == 0) {
        goto LABEL_7;
      }
      uint64_t v10 = [v5 dataUsingEncoding:4];
      uint64_t v13 = 0;
      uint64_t v11 = [MEMORY[0x263F08900] JSONObjectWithData:v10 options:0 error:&v13];
    }
    id v7 = (void *)v11;
  }
LABEL_7:

  return v7;
}

+ (id)userAgentForBundleIdentifier:(id)a3 appVersion:(id)a4 attributionSuffix:(id)a5
{
  if (a5) {
    [NSString stringWithFormat:@"%@/%@ %@%@", a3, a4, a5, @" CastleSettings/1.0"];
  }
  else {
  id v5 = [NSString stringWithFormat:@"%@/%@%@", a3, a4, @" CastleSettings/1.0", v7];
  }
  return v5;
}

+ (id)clearCacheAndNotifyClientsWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__ICQPurchase_clearCacheAndNotifyClientsWithCompletion___block_invoke;
  v8[3] = &unk_264921BD8;
  id v9 = v4;
  id v10 = a1;
  id v5 = v4;
  id v6 = _Block_copy(v8);

  return v6;
}

uint64_t __56__ICQPurchase_clearCacheAndNotifyClientsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (a2) {
    objc_msgSend(*(id *)(a1 + 40), "clearCacheAndNotifyClients", v5);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }
  return MEMORY[0x270F9A790]();
}

+ (void)clearCacheAndNotifyClients
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[ICQPurchase clearCacheAndNotifyClients]";
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  [MEMORY[0x263F32BA0] clearCacheAndNotify];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2050000000;
  int64_t v3 = (void *)getINDaemonConnectionClass_softClass_1;
  uint64_t v12 = getINDaemonConnectionClass_softClass_1;
  if (!getINDaemonConnectionClass_softClass_1)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    char v14 = __getINDaemonConnectionClass_block_invoke_1;
    uint64_t v15 = &unk_264921E58;
    uint64_t v16 = &v9;
    __getINDaemonConnectionClass_block_invoke_1((uint64_t)&buf);
    int64_t v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  id v5 = objc_alloc_init(v4);
  uint64_t v6 = objc_msgSend(v5, "daemonWithErrorHandler:", &__block_literal_global_125, v9);
  uint64_t v7 = [MEMORY[0x263EFB210] defaultStore];
  id v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  [v6 teardownOffersForAccount:v8 withCompletion:&__block_literal_global_129];
}

void __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke()
{
  v0 = _ICQGetLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke_cold_1(v0);
  }
}

void __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke_126()
{
  v0 = _ICQGetLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_22C821000, v0, OS_LOG_TYPE_DEFAULT, "Offers teardown has completed.", v2, 2u);
  }

  v1 = [MEMORY[0x263F88928] sharedOfferManager];
  [v1 getDefaultOfferWithCompletion:&__block_literal_global_134];
}

void __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke_131(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke_131_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a3;
  uint64_t v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "We were asked to authenticate.  Attempting silent authentication.", v12, 2u);
  }

  uint64_t v11 = [(ICQPurchase *)self delegate];
  [v11 handleAuthenticateRequest:v9 purchase:self completion:v8];
}

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a3;
  uint64_t v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "We were asked to handle a dialog request", v12, 2u);
  }

  uint64_t v11 = [(ICQPurchase *)self delegate];
  [v11 handleDialogRequest:v9 purchase:self completion:v8];
}

- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a3;
  uint64_t v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "We were asked to handle an engagement request", v12, 2u);
  }

  uint64_t v11 = [(ICQPurchase *)self delegate];
  [v11 handleEngagementRequest:v9 purchase:self completion:v8];
}

- (ICQPurchaseDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICQPurchaseDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isLegacyNativeFlow
{
  return self->_isLegacyNativeFlow;
}

- (void)setIsLegacyNativeFlow:(BOOL)a3
{
  self->_isLegacyNativeFlow = a3;
}

- (int64_t)amsServerErrorCode
{
  return self->_amsServerErrorCode;
}

- (void)setAmsServerErrorCode:(int64_t)a3
{
  self->_amsServerErrorCode = a3;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSDictionary)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSArray)interruptedBuyErrorCodes
{
  return self->_interruptedBuyErrorCodes;
}

- (void)setInterruptedBuyErrorCodes:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSString)userAgentSuffix
{
  return self->_userAgentSuffix;
}

- (void)setUserAgentSuffix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentSuffix, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_interruptedBuyErrorCodes, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)handlePurchaseCompletionWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22C821000, a2, a3, "Oslo purchase completed with error = %@", a5, a6, a7, a8, 2u);
}

void __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "XPC Error while fetching storage detail.", v1, 2u);
}

void __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke_131_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end