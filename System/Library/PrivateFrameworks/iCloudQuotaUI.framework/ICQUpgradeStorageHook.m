@interface ICQUpgradeStorageHook
- (BOOL)isLiftUIFlow;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (ICQPurchase)purchase;
- (ICQUpgradeStorageHook)initWithOffer:(id)a3 flowDelegate:(id)a4;
- (NSString)buttonId;
- (NSString)flowtype;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (id)completionHandler;
- (id)continuationResponseBody;
- (id)dummyRequestWithAccount:(id)a3 token:(id)a4;
- (id)storageContextJSONString;
- (id)upgradeStorageContextHeaderDictionary;
- (int64_t)_statusCode;
- (int64_t)offerAction;
- (void)_appGoesToBackground:(id)a3;
- (void)_firedStopActivityIndicatorTimer:(id)a3;
- (void)_handlePurchaseRequestSucceededNotification;
- (void)beginLegacyPurchaseFlow;
- (void)beginOsloPurchaseFlow;
- (void)beginPurchaseFlowUsingParameters:(id)a3 completion:(id)a4;
- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 completion:(id)a5;
- (void)handleDialogRequest:(id)a3 purchase:(id)a4 completion:(id)a5;
- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 completion:(id)a5;
- (void)manager:(id)a3 didCompleteWithError:(id)a4;
- (void)manager:(id)a3 loadDidFailWithError:(id)a4;
- (void)manager:(id)a3 willPresentViewController:(id)a4;
- (void)managerDidCancel:(id)a3;
- (void)mockPurchaseFlow;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)registerForDarwinNotifications;
- (void)setButtonId:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlowtype:(id)a3;
- (void)setPresentingSceneBundleIdentifier:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setPurchase:(id)a3;
- (void)stopActivityIndicator;
@end

@implementation ICQUpgradeStorageHook

- (ICQUpgradeStorageHook)initWithOffer:(id)a3 flowDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICQUpgradeStorageHook;
  v9 = [(ICQUpgradeStorageHook *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_offer, a3);
    objc_storeWeak((id *)&v10->_flowDelegate, v8);
    v11 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    v12 = (void *)[objc_alloc(MEMORY[0x263F29120]) initWithIdentifier:@"ICQUpgradeFlowURLSession"];
    objc_msgSend(v11, "set_appleIDContext:", v12);

    uint64_t v13 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v11];
    session = v10->_session;
    v10->_session = (NSURLSession *)v13;
  }
  return v10;
}

- (BOOL)shouldMatchElement:(id)a3
{
  id v5 = a3;
  v6 = [v5 identifier];
  int v7 = [v6 isEqualToString:@"upgradeButton"];

  if (v7)
  {
    objc_storeStrong((id *)&self->_ruiElement, a3);
    id v8 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__firedStopActivityIndicatorTimer_ selector:0 userInfo:0 repeats:45.0];
    stopActivityIndicatorTimer = self->_stopActivityIndicatorTimer;
    self->_stopActivityIndicatorTimer = v8;

    [v5 startActivityIndicator];
  }

  return 0;
}

- (void)_firedStopActivityIndicatorTimer:(id)a3
{
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Did not receive callback from AMS for 30s stopping spinner", v5, 2u);
  }

  [(ICQUpgradeStorageHook *)self stopActivityIndicator];
}

- (void)stopActivityIndicator
{
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Stopping activity indicator", buf, 2u);
  }

  [(NSTimer *)self->_stopActivityIndicatorTimer invalidate];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ICQUpgradeStorageHook_stopActivityIndicator__block_invoke;
  block[3] = &unk_264921C80;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __46__ICQUpgradeStorageHook_stopActivityIndicator__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) stopActivityIndicator];
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a6;
  v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v7 name];
    int v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "Couldn't process element |%@|, It's not yet supported.", (uint8_t *)&v11, 0xCu);
  }
  (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 clientInfo];
  v6 = [v5 objectForKeyedSubscript:@"action"];
  char v7 = [v6 isEqualToString:@"UPGRADE_ICLOUD_STORAGE"];
  v30 = v6;
  if (v7)
  {
    id v8 = v5;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
  }
  else
  {
    v12 = [v4 clientInfo];
    v27 = [v12 objectForKeyedSubscript:@"action"];
    v28 = v12;
    if ([v27 isEqualToString:@"UPGRADE_ICLOUD_STORAGE_OSLO"])
    {
      id v8 = v5;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
    }
    else
    {
      v18 = [v4 clientInfo];
      v19 = [v18 objectForKeyedSubscript:@"action"];
      if ([v19 isEqualToString:@"UPGRADE_ENABLE_ICPL"])
      {
        id v8 = v5;
        v3 = v19;
        v26 = v18;
        int v10 = 0;
        int v11 = 0;
        int v9 = 1;
      }
      else
      {
        v20 = [v4 clientInfo];
        v21 = [v20 objectForKeyedSubscript:@"action"];
        if ([v21 isEqualToString:@"UPGRADE_ICLOUD_STORAGE_DIRECT_TO_OSLO"])
        {
          v29 = v21;
          id v8 = v5;
          id v5 = v20;
          v3 = v19;
          v26 = v18;
          int v11 = 0;
          int v9 = 1;
          int v10 = 1;
        }
        else
        {
          v22 = [v4 clientInfo];
          v23 = [v22 objectForKeyedSubscript:@"action"];
          if (([v23 isEqualToString:@"UPGRADE_ENABLE_ICPL_OSLO"] & 1) == 0)
          {

            BOOL v15 = 0;
            goto LABEL_10;
          }
          v24 = v23;
          v25 = v22;
          v29 = v21;
          id v8 = v5;
          id v5 = v20;
          v3 = v19;
          v26 = v18;
          int v9 = 1;
          int v10 = 1;
          int v11 = 1;
        }
      }
    }
  }
  uint64_t v13 = [v4 clientInfo];
  v14 = [v13 objectForKeyedSubscript:@"parameters"];
  BOOL v15 = v14 != 0;

  if (v11)
  {

    objc_super v16 = v29;
    if ((v10 & 1) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    objc_super v16 = v29;
    if (!v10)
    {
LABEL_7:
      id v5 = v8;
      if (!v9) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }

  id v5 = v8;
  if (v9)
  {
LABEL_8:
  }
LABEL_9:
  v6 = v30;
  if ((v7 & 1) == 0)
  {
LABEL_10:
  }
  return v15;
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 clientInfo];
  clientInfo = self->_clientInfo;
  self->_clientInfo = v8;

  int v10 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"parameters"];
  int v11 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"action"];
  v12 = +[ICQPurchase parseParameters:v10 action:[(ICQUpgradeStorageHook *)self offerAction]];
  if (v12)
  {
    uint64_t v13 = +[ICQPurchase clearCacheAndNotifyClientsWithCompletion:v7];
    [(ICQUpgradeStorageHook *)self setCompletionHandler:v13];

    [(ICQOffer *)self->_offer updateOfferWithPlanDetails:v12 actionString:v11];
    v14 = [(ICQUpgradeStorageHook *)self completionHandler];
    [(ICQUpgradeStorageHook *)self beginPurchaseFlowUsingParameters:v10 completion:v14];
  }
  else
  {
    BOOL v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v16 = [v6 name];
      int v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "Couldn't process object model |%@|, No plan details found.", (uint8_t *)&v18, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    [WeakRetained dismissUpgradeFlowWithSuccess:0];
  }
}

- (RUIServerHookResponse)serverHookResponse
{
  v3 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"refreshUrl"];
  uint64_t v4 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"refreshHttpMethod"];
  id v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "No refresh URL or Http method found.", buf, 2u);
    }

    id v15 = 0;
  }
  else
  {
    id v8 = (void *)[objc_alloc(NSURL) initWithString:v3];
    int v9 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v8];
    int v10 = NSString;
    int64_t v11 = [(ICQUpgradeStorageHook *)self _statusCode];
    v12 = [(ICQUpgradeStorageHook *)self purchase];
    uint64_t v13 = objc_msgSend(v10, "stringWithFormat:", @"<?xml version='1.0' encoding='UTF-8'?><!DOCTYPE plist PUBLIC '-//Apple//DTD PLIST 1.0//EN' 'http://www.apple.com/DTDs/PropertyList-1.0.dtd'><plist version='1.0'><dict><key>statusCode</key><integer>%ld</integer><key>AMSServerErrorCode</key><integer>%ld</integer></dict></plist>", v11, objc_msgSend(v12, "amsServerErrorCode"));

    v14 = [v13 dataUsingEncoding:4];
    [v9 setHTTPBody:v14];

    [v9 setHTTPMethod:v5];
    id v15 = objc_alloc_init(MEMORY[0x263F637C8]);
    [v15 setContinuationRequest:v9];
  }
  return (RUIServerHookResponse *)v15;
}

- (id)continuationResponseBody
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"purchaseStatus";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[ICQUpgradeStorageHook _statusCode](self, "_statusCode"));
  v9[1] = @"amsErrorCodes";
  v10[0] = v3;
  uint64_t v4 = NSNumber;
  id v5 = [(ICQUpgradeStorageHook *)self purchase];
  BOOL v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "amsServerErrorCode"));
  v10[1] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (void)beginPurchaseFlowUsingParameters:(id)a3 completion:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  BOOL v6 = [WeakRetained hostingNavigationController];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263EFF8C0];
    id v8 = [WeakRetained hostingNavigationController];
    int v9 = [v8 topViewController];
    int v10 = [v7 arrayWithObject:v9];

    int64_t v11 = [WeakRetained hostingNavigationController];
    [v11 setViewControllers:v10];
  }
  if ([MEMORY[0x263F88978] isServerMockingEnabled])
  {
    [(ICQUpgradeStorageHook *)self mockPurchaseFlow];
  }
  else
  {
    int64_t v12 = [(ICQUpgradeStorageHook *)self offerAction];
    if ((unint64_t)(v12 - 116) >= 3)
    {
      if (v12 == 108 || v12 == 105)
      {
        [(ICQUpgradeStorageHook *)self beginLegacyPurchaseFlow];
      }
      else
      {
        uint64_t v13 = _ICQGetLogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[ICQUpgradeStorageHook beginPurchaseFlowUsingParameters:completion:](v13);
        }
      }
    }
    else
    {
      [(ICQUpgradeStorageHook *)self beginOsloPurchaseFlow];
    }
  }
}

- (void)mockPurchaseFlow
{
}

- (void)beginLegacyPurchaseFlow
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFB210] defaultStore];
  uint64_t v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
  id v5 = objc_msgSend(v3, "aa_grandSlamAccountForiCloudAccount:", v4);
  id v40 = 0;
  BOOL v6 = [v3 credentialForAccount:v5 serviceID:@"com.apple.gs.icloud.storage.buy" error:&v40];
  id v7 = v40;
  id v8 = v7;
  if (!v7)
  {
LABEL_12:
    if (!v6)
    {
      int v18 = _ICQGetLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v18, OS_LOG_TYPE_DEFAULT, "Credential is nil but no error reported.", buf, 2u);
      }
    }
    int v10 = [v6 token];
    if (v10) {
      goto LABEL_23;
    }
    v19 = _ICQGetLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v19, OS_LOG_TYPE_DEFAULT, "No storage buy token present.", buf, 2u);
    }

    if (![(ICQOffer *)self->_offer isBuddyOffer])
    {
LABEL_23:
      v21 = v8;
      id v22 = objc_alloc(MEMORY[0x263EFF9A0]);
      v23 = [(ICQUpgradeStorageHook *)self upgradeStorageContextHeaderDictionary];
      v24 = (void *)[v22 initWithDictionary:v23];

      if (v10)
      {
        v38 = v6;
        v39 = v3;
        v25 = v5;
        v26 = v4;
        v27 = [(ICQUpgradeStorageHook *)self dummyRequestWithAccount:v4 token:v10];
        v28 = [(NSURLSession *)self->_session configuration];
        v29 = [v28 _appleIDContext];
        v30 = [v29 appleIDHeadersForRequest:v27];

        if ((unint64_t)[v30 count] < 2)
        {

          int v10 = 0;
        }
        else
        {
          [v24 addEntriesFromDictionary:v30];
        }

        uint64_t v4 = v26;
        id v5 = v25;
        BOOL v6 = v38;
        v3 = v39;
      }
      id v8 = v21;
      v31 = v5;
      if (!self->_cloudStorageOffersManager)
      {
        v32 = objc_alloc_init(ICQUICloudStorageOffersManager);
        cloudStorageOffersManager = self->_cloudStorageOffersManager;
        self->_cloudStorageOffersManager = v32;

        [(ICQUICloudStorageOffersManager *)self->_cloudStorageOffersManager setSkipCompletionAlert:1];
        [(ICQUICloudStorageOffersManager *)self->_cloudStorageOffersManager setSupportsModernAlerts:1];
        [(ICQUICloudStorageOffersManager *)self->_cloudStorageOffersManager setDelegate:self];
      }
      [(ICQUICloudStorageOffersManager *)self->_cloudStorageOffersManager setSkipRetryWithoutToken:[(ICQOffer *)self->_offer isBuddyOffer]];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v35 = [WeakRetained presentationContextForHook:self];

      v36 = self->_cloudStorageOffersManager;
      v37 = +[ICQPurchase upgradeStorageQueryDictionaryForOffer:self->_offer buttonID:self->_buttonId];
      [(ICQUICloudStorageOffersManager *)v36 beginFlowWithNavigationController:v35 purchaseToken:v10 buyParameters:v37 requestHeaders:v24 modally:0];

      id v5 = v31;
    }
    else
    {
      uint64_t v20 = _ICQGetLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v20, OS_LOG_TYPE_DEFAULT, "Dismissing the flow as it's a buddy offer and no token received.", buf, 2u);
      }

      int v10 = objc_loadWeakRetained((id *)&self->_flowDelegate);
      [v10 dismissUpgradeFlowWithSuccess:0];
    }
    goto LABEL_31;
  }
  int v9 = [v7 userInfo];
  int v10 = [v9 objectForKey:*MEMORY[0x263F08608]];

  int64_t v11 = [v10 domain];
  if (![v11 isEqualToString:@"com.apple.accounts.keychain"])
  {

LABEL_9:
    v17 = _ICQGetLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v8;
      _os_log_impl(&dword_22C821000, v17, OS_LOG_TYPE_DEFAULT, "Buy storage failed to get token with error: %@", buf, 0xCu);
    }

    goto LABEL_12;
  }
  int64_t v12 = v8;
  uint64_t v13 = [v10 code];

  BOOL v14 = v13 == -128;
  id v8 = v12;
  if (!v14) {
    goto LABEL_9;
  }
  id v15 = _ICQGetLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "User cancelled.", buf, 2u);
  }

  id v16 = objc_loadWeakRetained((id *)&self->_flowDelegate);
  [v16 dismissUpgradeFlowWithSuccess:0];

LABEL_31:
}

- (void)beginOsloPurchaseFlow
{
  v3 = [[ICQPurchase alloc] initWithOffer:self->_offer clientInfo:self->_clientInfo];
  [(ICQUpgradeStorageHook *)self setPurchase:v3];

  uint64_t v4 = [(ICQUpgradeStorageHook *)self flowtype];
  uint64_t v5 = [v4 isEqualToString:@"native"];
  BOOL v6 = [(ICQUpgradeStorageHook *)self purchase];
  [v6 setIsLegacyNativeFlow:v5];

  id v7 = [(ICQUpgradeStorageHook *)self purchase];
  [v7 setDelegate:self];

  presentingSceneIdentifier = self->_presentingSceneIdentifier;
  int v9 = [(ICQUpgradeStorageHook *)self purchase];
  [v9 setPresentingSceneIdentifier:presentingSceneIdentifier];

  presentingSceneBundleIdentifier = self->_presentingSceneBundleIdentifier;
  int64_t v11 = [(ICQUpgradeStorageHook *)self purchase];
  [v11 setPresentingSceneBundleIdentifier:presentingSceneBundleIdentifier];

  int64_t v12 = [(ICQUpgradeStorageHook *)self purchase];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__ICQUpgradeStorageHook_beginOsloPurchaseFlow__block_invoke;
  v13[3] = &unk_264921C58;
  v13[4] = self;
  [v12 startPurchaseWithCompletion:v13];
}

void __46__ICQUpgradeStorageHook_beginOsloPurchaseFlow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([*(id *)(*(void *)(a1 + 32) + 8) action] == 118)
  {
    BOOL v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v11 = a2;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Direct to Oslo purchase finished with success: %d, error: %@", buf, 0x12u);
    }

    if ((a2 & 1) != 0 || [v5 code] != 6)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__ICQUpgradeStorageHook_beginOsloPurchaseFlow__block_invoke_100;
      block[3] = &unk_264921C80;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
      [WeakRetained dismissUpgradeFlowWithSuccess:0];
    }
  }
  id v8 = [*(id *)(a1 + 32) completionHandler];
  ((void (**)(void, uint64_t, id))v8)[2](v8, a2, v5);
}

void __46__ICQUpgradeStorageHook_beginOsloPurchaseFlow__block_invoke_100(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained presentHostingNavigationController];
}

- (int64_t)offerAction
{
  v2 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"action"];
  int64_t v3 = _ICQActionForServerActionString();

  return v3;
}

- (id)dummyRequestWithAccount:(id)a3 token:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [NSURL URLWithString:@"https://www.apple.com/example"];
  id v8 = [MEMORY[0x263F089E0] requestWithURL:v7 cachePolicy:1 timeoutInterval:30.0];
  objc_msgSend(v8, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v5, 0);
  objc_msgSend(v8, "ak_addClientInfoHeader");
  int v9 = [MEMORY[0x263EFFA18] systemTimeZone];
  int v10 = [v9 abbreviation];
  [v8 setValue:v10 forHTTPHeaderField:@"X-MMe-Timezone"];

  objc_msgSend(v8, "ak_addCountryHeader");
  if (v6)
  {
    int v11 = objc_msgSend(v5, "aa_altDSID");
    objc_msgSend(v8, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:", v6, v11);
  }
  return v8;
}

- (id)upgradeStorageContextHeaderDictionary
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(ICQUpgradeStorageHook *)self storageContextJSONString];
  if ([v2 length])
  {
    id v5 = @"X-Apple-Storage-Context";
    v6[0] = v2;
    int64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    int64_t v3 = (void *)MEMORY[0x263EFFA78];
  }

  return v3;
}

- (id)storageContextJSONString
{
  v16[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] mainBundle];
  int64_t v3 = [v2 bundleIdentifier];

  if (![v3 length])
  {
    id v8 = 0;
    goto LABEL_11;
  }
  id v15 = @"appName";
  v16[0] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  id v10 = 0;
  id v5 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:0 error:&v10];
  id v6 = v10;
  if (v6)
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v12 = v3;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Failed to parse storage context for bundleID \"%@\" with error: %@", buf, 0x16u);
    }
  }
  else if (v5)
  {
    id v8 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
    goto LABEL_10;
  }
  id v8 = 0;
LABEL_10:

LABEL_11:
  return v8;
}

- (int64_t)_statusCode
{
  int64_t v3 = [(ICQUpgradeStorageHook *)self purchase];

  if (!v3) {
    return self->_legacyStatusCode;
  }
  uint64_t v4 = [(ICQUpgradeStorageHook *)self purchase];
  int64_t v5 = [v4 statusCode];

  return v5;
}

- (void)manager:(id)a3 willPresentViewController:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a4;
  int64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "ICQUICloudStorageOffersManager: willPresentViewController: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Failed to upgrade storage with error: %@", (uint8_t *)&v7, 0xCu);
  }

  self->_legacyStatusCode = [v5 code];
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (void)managerDidCancel:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade storage cancelled.", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  [WeakRetained dismissUpgradeFlowWithSuccess:0];
}

- (void)manager:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Failed to upgrade storage with error: %@", (uint8_t *)&v11, 0xCu);
    }

    self->_legacyStatusCode = [v5 code];
    id v8 = (void (*)(void))*((void *)self->_completionHandler + 2);
  }
  else
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Storage upgraded successfully. Call completion handler and it'll load refreshURL if exist.", (uint8_t *)&v11, 2u);
    }

    self->_legacyStatusCode = 0;
    uint64_t v9 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"action"];
    int v10 = [v9 isEqualToString:@"UPGRADE_ENABLE_ICPL"];

    if (v10) {
      +[ICQUIPhotosHelper enableCloudPhotosLibraryWithCompletion:&__block_literal_global_22];
    }
    id v8 = (void (*)(void))*((void *)self->_completionHandler + 2);
  }
  v8();
}

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "We were asked to authenticate.  Attempting silent authentication.", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__ICQUpgradeStorageHook_handleAuthenticateRequest_purchase_completion___block_invoke;
  block[3] = &unk_2649224C0;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__ICQUpgradeStorageHook_handleAuthenticateRequest_purchase_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  int64_t v3 = [WeakRetained presentationContext];

  id v4 = objc_alloc(MEMORY[0x263F27FC0]);
  id v5 = [*(id *)(a1 + 40) account];
  int v6 = [*(id *)(a1 + 40) options];
  id v7 = (void *)[v4 initWithAccount:v5 presentingViewController:v3 options:v6];

  id v8 = [v7 performAuthentication];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __71__ICQUpgradeStorageHook_handleAuthenticateRequest_purchase_completion___block_invoke_2;
  v9[3] = &unk_264922498;
  id v10 = *(id *)(a1 + 48);
  [v8 addFinishBlock:v9];
}

void __71__ICQUpgradeStorageHook_handleAuthenticateRequest_purchase_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = _ICQGetLogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__ICQUIOSLOPresenter_handleAuthenticateRequest_purchase_completion___block_invoke_2_cold_1((uint64_t)v5, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Successfully finished silent authentication.", v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "We were asked to handle a dialog request", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ICQUpgradeStorageHook_handleDialogRequest_purchase_completion___block_invoke;
  block[3] = &unk_2649224C0;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__ICQUpgradeStorageHook_handleDialogRequest_purchase_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  id v5 = [WeakRetained presentationContext];

  int64_t v3 = (void *)[objc_alloc(MEMORY[0x263F27FB8]) initWithRequest:a1[5] presentingViewController:v5];
  id v4 = [v3 present];
  [v4 addFinishBlock:a1[6]];
}

- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "We were asked to handle an engagement request", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__ICQUpgradeStorageHook_handleEngagementRequest_purchase_completion___block_invoke;
  block[3] = &unk_2649224C0;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __69__ICQUpgradeStorageHook_handleEngagementRequest_purchase_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  id v8 = [WeakRetained presentationContext];

  id v3 = objc_alloc(MEMORY[0x263F27FE8]);
  uint64_t v4 = a1[5];
  id v5 = [MEMORY[0x263F27B28] quotaBag];
  id v6 = (void *)[v3 initWithRequest:v4 bag:v5 presentingViewController:v8];

  id v7 = [v6 presentEngagement];
  [v7 addFinishBlock:a1[6]];
}

- (BOOL)isLiftUIFlow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  char v3 = [WeakRetained isLiftUIFlow];

  return v3;
}

- (void)_handlePurchaseRequestSucceededNotification
{
  char v3 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"action"];
  if ([v3 isEqualToString:@"UPGRADE_ENABLE_ICPL_OSLO"])
  {
  }
  else
  {
    uint64_t v4 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"action"];
    int v5 = [v4 isEqualToString:@"UPGRADE_ICLOUD_STORAGE_DIRECT_TO_OSLO"];

    if (!v5) {
      goto LABEL_5;
    }
  }
  +[ICQUIPhotosHelper enableCloudPhotosLibraryWithCompletion:&__block_literal_global_124];
LABEL_5:
  self->_legacyStatusCode = 0;
  id v6 = (void (*)(void))*((void *)self->_completionHandler + 2);
  v6();
}

- (void)_appGoesToBackground:(id)a3
{
  uint64_t v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "app goes to background", buf, 2u);
  }

  if (self->_isListeningToAMS)
  {
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterRemoveObserver(DistributedCenter, self, @"kSSPurchaseRequestFinishedNotification", 0);
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:self];

    self->_isListeningToAMS = 0;
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "remove observers", v8, 2u);
    }
  }
}

- (void)registerForDarwinNotifications
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL isListeningToAMS = self->_isListeningToAMS;
  uint64_t v4 = _ICQGetLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isListeningToAMS)
  {
    if (v5)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "already registered to kSSPurchaseRequestSucceededNotification", (uint8_t *)&v11, 2u);
    }
  }
  else
  {
    if (v5)
    {
      int v11 = 138412290;
      id v12 = @"kSSPurchaseRequestFinishedNotification";
      _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "registering for darwin notification %@", (uint8_t *)&v11, 0xCu);
    }

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, self, (CFNotificationCallback)_handleReceivedDarwinNotification, @"kSSPurchaseRequestFinishedNotification", 0, (CFNotificationSuspensionBehavior)1024);
    id v7 = _ICQGetLogSystem();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    uint64_t v9 = (__CFString *)*MEMORY[0x263F83330];
    if (v8)
    {
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "registering for ns notification %@", (uint8_t *)&v11, 0xCu);
    }

    id v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:self selector:sel__appGoesToBackground_ name:v9 object:0];

    self->_BOOL isListeningToAMS = 1;
  }
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSString)buttonId
{
  return self->_buttonId;
}

- (void)setButtonId:(id)a3
{
}

- (NSString)flowtype
{
  return self->_flowtype;
}

- (void)setFlowtype:(id)a3
{
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

- (ICQPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_flowtype, 0);
  objc_storeStrong((id *)&self->_buttonId, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stopActivityIndicatorTimer, 0);
  objc_storeStrong((id *)&self->_ruiElement, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_cloudStorageOffersManager, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

- (void)beginPurchaseFlowUsingParameters:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "ICQUpgradeStorageHook - Unsupported purchaseAction", v1, 2u);
}

@end