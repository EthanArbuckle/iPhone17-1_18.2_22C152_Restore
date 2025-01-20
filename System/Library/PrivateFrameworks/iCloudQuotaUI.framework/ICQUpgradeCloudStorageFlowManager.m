@interface ICQUpgradeCloudStorageFlowManager
+ (BOOL)_canDoTokenPurchaseWithOffer:(id)a3;
+ (BOOL)shouldSubclassShowForOffer:(id)a3;
- (ICQUICloudStorageOffersManager)storageOffersManager;
- (NSDictionary)storagePurchaseKeybag;
- (NSString)storagePurchaseButtonId;
- (id)_buyProductQueryDictionary;
- (id)_buyProductQueryKeySet;
- (id)_dummyRequestWithAccount:(id)a3 token:(id)a4;
- (id)_storageContextHeaderDictionary;
- (id)_storageContextJSONString;
- (id)initSubclassWithOffer:(id)a3;
- (id)purchaseCompletionHandler;
- (id)secureTokenMissingError;
- (void)_adoptRemoteUIWithPurchaseToken:(id)a3 buyParameters:(id)a4 requestHeaders:(id)a5;
- (void)_buyProductShouldUseToken:(BOOL)a3 completionHandler:(id)a4;
- (void)_performPageButtonActionWithParameters:(id)a3 completion:(id)a4;
- (void)_performPurchase;
- (void)_performPurchaseUsingSettingsUI;
- (void)_performPurchaseUsingTouchID;
- (void)manager:(id)a3 didCompleteWithError:(id)a4;
- (void)manager:(id)a3 loadDidFailWithError:(id)a4;
- (void)manager:(id)a3 willPresentViewController:(id)a4;
- (void)managerDidCancel:(id)a3;
- (void)setPurchaseCompletionHandler:(id)a3;
- (void)setStorageOffersManager:(id)a3;
- (void)setStoragePurchaseButtonId:(id)a3;
@end

@implementation ICQUpgradeCloudStorageFlowManager

+ (BOOL)shouldSubclassShowForOffer:(id)a3
{
  id v4 = a3;
  if ([v4 isBuddyOffer]) {
    char v5 = [a1 _canDoTokenPurchaseWithOffer:v4];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)initSubclassWithOffer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ICQUpgradeCloudStorageFlowManager;
  v3 = [(ICQUpgradeFlowManager *)&v9 initSubclassWithOffer:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    char v5 = (void *)[objc_alloc(MEMORY[0x263F29120]) initWithIdentifier:@"ICQUpgradeFlowURLSession"];
    objc_msgSend(v4, "set_appleIDContext:", v5);

    uint64_t v6 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v4];
    v7 = (void *)v3[31];
    v3[31] = v6;
  }
  return v3;
}

- (void)_performPageButtonActionWithParameters:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _Block_copy(v7);
  id purchaseCompletionHandler = self->_purchaseCompletionHandler;
  self->_id purchaseCompletionHandler = v8;

  v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F88810]];
  storagePurchaseButtonId = self->_storagePurchaseButtonId;
  self->_storagePurchaseButtonId = v10;

  v12 = [(ICQUpgradeCloudStorageFlowManager *)self storagePurchaseKeybag];
  [(ICQUpgradeFlowManager *)self setBindings:v12];

  if (!self->_storagePurchaseButtonId)
  {
    v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v6;
      _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "Attempt to upgrade cloud storage without proper button ID (parameters: %@)", (uint8_t *)&v25, 0xCu);
    }
  }
  v14 = [(ICQUpgradeFlowManager *)self bindings];
  uint64_t v15 = [v14 objectForKey:@"buyParams"];
  if (!v15)
  {

    goto LABEL_11;
  }
  v16 = (void *)v15;
  v17 = [v6 objectForKey:@"osloPurchase"];

  if (!v17)
  {
LABEL_11:
    [(ICQUpgradeCloudStorageFlowManager *)self _performPurchase];
    goto LABEL_12;
  }
  v18 = _ICQGetLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(ICQUpgradeFlowManager *)self bindings];
    v20 = [v19 objectForKey:@"buyParams"];
    int v25 = 138412290;
    id v26 = v20;
    _os_log_impl(&dword_22C821000, v18, OS_LOG_TYPE_DEFAULT, "Performing purchase using oslo with buyParams = %@", (uint8_t *)&v25, 0xCu);
  }
  v21 = [ICQUpgradeStorageHook alloc];
  v22 = [(ICQUpgradeFlowManager *)self offer];
  v23 = [(ICQUpgradeStorageHook *)v21 initWithOffer:v22 flowDelegate:self];

  [(ICQUpgradeStorageHook *)v23 setButtonId:self->_storagePurchaseButtonId];
  [(ICQUpgradeStorageHook *)v23 setFlowtype:@"native"];
  v24 = +[ICQPurchase clearCacheAndNotifyClientsWithCompletion:v7];
  [(ICQUpgradeStorageHook *)v23 setCompletionHandler:v24];

  [(ICQUpgradeStorageHook *)v23 beginOsloPurchaseFlow];
LABEL_12:
}

- (NSDictionary)storagePurchaseKeybag
{
  v3 = [(ICQUpgradeFlowManager *)self offer];
  id v4 = [(ICQUpgradeCloudStorageFlowManager *)self storagePurchaseButtonId];
  char v5 = [v3 storagePurchaseKeybagForButtonId:v4];

  return (NSDictionary *)v5;
}

- (id)_buyProductQueryKeySet
{
  if (_buyProductQueryKeySet_onceToken != -1) {
    dispatch_once(&_buyProductQueryKeySet_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)_buyProductQueryKeySet_sBuyProductQueryKeySet;
  return v2;
}

void __59__ICQUpgradeCloudStorageFlowManager__buyProductQueryKeySet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithArray:&unk_26E01EC90];
  v1 = (void *)_buyProductQueryKeySet_sBuyProductQueryKeySet;
  _buyProductQueryKeySet_sBuyProductQueryKeySet = v0;
}

- (id)_buyProductQueryDictionary
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  id v4 = [(ICQUpgradeCloudStorageFlowManager *)self storagePurchaseKeybag];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v5 = [(ICQUpgradeCloudStorageFlowManager *)self _buyProductQueryKeySet];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 138412290;
    long long v16 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v4, "objectForKey:", v11, v16);
        if (v12)
        {
          [v3 setObject:v12 forKey:v11];
        }
        else
        {
          v13 = _ICQGetLogSystem();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            uint64_t v22 = v11;
            _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "query item %@ missing from keybag", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v3 copy];
  return v14;
}

- (id)_dummyRequestWithAccount:(id)a3 token:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v7 = [NSURL URLWithString:@"https://www.apple.com/example"];
  uint64_t v8 = [MEMORY[0x263F089E0] requestWithURL:v7 cachePolicy:1 timeoutInterval:30.0];
  objc_msgSend(v8, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v5, 0);
  objc_msgSend(v8, "ak_addClientInfoHeader");
  uint64_t v9 = [MEMORY[0x263EFFA18] systemTimeZone];
  v10 = [v9 abbreviation];
  [v8 setValue:v10 forHTTPHeaderField:@"X-MMe-Timezone"];

  objc_msgSend(v8, "ak_addCountryHeader");
  if (v6)
  {
    uint64_t v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "adding storageBuyingToken: %@", (uint8_t *)&v15, 0xCu);
    }

    v12 = objc_msgSend(v5, "aa_altDSID");
    objc_msgSend(v8, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:", v6, v12);
  }
  v13 = (void *)[v8 copy];

  return v13;
}

- (id)_storageContextJSONString
{
  v16[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];

  if (![v3 length])
  {
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  int v15 = @"appName";
  v16[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  id v10 = 0;
  id v5 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:0 error:&v10];
  id v6 = v10;
  if (v6)
  {
    long long v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v3;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Could not convert storage context for bundleID \"%@\" to JSON. Error: %@", buf, 0x16u);
    }
  }
  else if (v5)
  {
    uint64_t v8 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
    goto LABEL_10;
  }
  uint64_t v8 = 0;
LABEL_10:

LABEL_11:
  return v8;
}

- (id)_storageContextHeaderDictionary
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(ICQUpgradeCloudStorageFlowManager *)self _storageContextJSONString];
  if ([v2 length])
  {
    id v5 = @"X-Apple-Storage-Context";
    v6[0] = v2;
    v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFFA78];
  }

  return v3;
}

- (void)_buyProductShouldUseToken:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, uint64_t))a4;
  long long v7 = [MEMORY[0x263EFB210] defaultStore];
  uint64_t v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  if (!v4)
  {
    long long v19 = 0;
LABEL_10:
    uint64_t v9 = [(ICQUpgradeCloudStorageFlowManager *)self _dummyRequestWithAccount:v8 token:v19];
    long long v20 = [(NSURLSession *)self->_buyProductSession configuration];
    v21 = [v20 _appleIDContext];
    v12 = [v21 appleIDHeadersForRequest:v9];

    uint64_t v22 = _ICQGetLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      *(_DWORD *)buf = 138412290;
      v36 = v23;
      _os_log_impl(&dword_22C821000, v22, OS_LOG_TYPE_DEFAULT, "AKAppleIDSession returned %@ headers", buf, 0xCu);
    }
    if ((unint64_t)[v12 count] < 2)
    {
      id v10 = [(ICQUpgradeCloudStorageFlowManager *)self _buyProductQueryDictionary];
      int v25 = [(ICQUpgradeCloudStorageFlowManager *)self _storageContextHeaderDictionary];
      id v26 = self;
      uint64_t v27 = 0;
      v28 = v10;
      v29 = v25;
    }
    else
    {
      id v10 = (void *)[v12 mutableCopy];
      uint64_t v24 = [(ICQUpgradeCloudStorageFlowManager *)self _storageContextHeaderDictionary];
      [v10 addEntriesFromDictionary:v24];

      int v25 = [(ICQUpgradeCloudStorageFlowManager *)self _buyProductQueryDictionary];
      id v26 = self;
      uint64_t v27 = v19;
      v28 = v25;
      v29 = v10;
    }
    [(ICQUpgradeCloudStorageFlowManager *)v26 _adoptRemoteUIWithPurchaseToken:v27 buyParameters:v28 requestHeaders:v29];

    goto LABEL_29;
  }
  uint64_t v9 = objc_msgSend(v7, "aa_grandSlamAccountForiCloudAccount:", v8);
  id v34 = 0;
  id v10 = [v7 credentialForAccount:v9 serviceID:@"com.apple.gs.icloud.storage.buy" error:&v34];
  id v11 = v34;
  v12 = v11;
  if (v11)
  {
    __int16 v13 = [v11 userInfo];
    id v14 = [v13 objectForKey:*MEMORY[0x263F08608]];

    int v15 = [v14 domain];
    if ([v15 isEqualToString:@"com.apple.accounts.keychain"])
    {
      uint64_t v16 = [v14 code];

      if (v16 == -128)
      {
        uint64_t v17 = _ICQGetLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C821000, v17, OS_LOG_TYPE_DEFAULT, "user canceled", buf, 2u);
        }

        if (!v6) {
          goto LABEL_27;
        }
        uint64_t v18 = 3;
LABEL_26:
        v6[2](v6, v18);
LABEL_27:

LABEL_28:
        long long v19 = 0;
        goto LABEL_29;
      }
    }
    else
    {
    }
    v32 = _ICQGetLogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v12;
      _os_log_impl(&dword_22C821000, v32, OS_LOG_TYPE_DEFAULT, "storage buy get token error %@", buf, 0xCu);
    }

    if (!v6) {
      goto LABEL_27;
    }
    uint64_t v18 = 2;
    goto LABEL_26;
  }
  long long v19 = [v10 token];
  if (v10)
  {
    v30 = _ICQGetLogSystem();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (!v19)
    {
      if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v30, OS_LOG_TYPE_DEFAULT, "no storage buy token present", buf, 2u);
      }

      if (v6) {
        v6[2](v6, 2);
      }
      goto LABEL_28;
    }
    if (v31)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v30, OS_LOG_TYPE_DEFAULT, "valid purchase", buf, 2u);
    }

    goto LABEL_10;
  }
  v33 = _ICQGetLogSystem();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v33, OS_LOG_TYPE_DEFAULT, "credential nil but no error reported", buf, 2u);
  }

  if (v6) {
    v6[2](v6, 2);
  }
LABEL_29:
}

- (void)_adoptRemoteUIWithPurchaseToken:(id)a3 buyParameters:(id)a4 requestHeaders:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ICQUpgradeFlowManager *)self offer];
  int v12 = [v11 isBuddyOffer];

  if (v10) {
    BOOL v13 = v9 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v14 = v13 || v8 == 0;
  if (!v14 || !v12)
  {
    if (!self->_storageOffersManager)
    {
      long long v20 = objc_alloc_init(ICQUICloudStorageOffersManager);
      storageOffersManager = self->_storageOffersManager;
      self->_storageOffersManager = v20;

      [(ICQUICloudStorageOffersManager *)self->_storageOffersManager setSkipCompletionAlert:1];
      [(ICQUICloudStorageOffersManager *)self->_storageOffersManager setSupportsModernAlerts:1];
      uint64_t v22 = [(ICQUpgradeCloudStorageFlowManager *)self storagePurchaseKeybag];
      v23 = [v22 objectForKeyedSubscript:@"totalStorage"];

      if (v23)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v23 doubleValue];
          [(ICQUICloudStorageOffersManager *)self->_storageOffersManager setRequiredStorageThreshold:(unint64_t)(v24 * 1000000000.0)];
        }
      }
      [(ICQUICloudStorageOffersManager *)self->_storageOffersManager setDelegate:self];
    }
    int v25 = [(ICQUpgradeFlowManager *)self offer];
    -[ICQUICloudStorageOffersManager setSkipRetryWithoutToken:](self->_storageOffersManager, "setSkipRetryWithoutToken:", [v25 isBuddyOffer]);

    id v26 = _ICQGetLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(NSNumber, "numberWithBool:", -[ICQUICloudStorageOffersManager skipRetryWithoutToken](self->_storageOffersManager, "skipRetryWithoutToken"));
      uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v31 = 138543362;
      v32 = v27;
      _os_log_impl(&dword_22C821000, v26, OS_LOG_TYPE_DEFAULT, "skipRetryWithoutToken == %{public}@", (uint8_t *)&v31, 0xCu);
    }
    v28 = _ICQGetLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = @"YES";
      if (!v8) {
        v29 = @"NO";
      }
      int v31 = 138543618;
      v32 = v29;
      __int16 v33 = 2114;
      id v34 = v9;
      _os_log_impl(&dword_22C821000, v28, OS_LOG_TYPE_DEFAULT, "Calling out to ICQUICloudStorageOffersManager with purchaseToken:%{public}@, buyParameters:%{public}@", (uint8_t *)&v31, 0x16u);
    }

    v30 = self->_storageOffersManager;
    id purchaseCompletionHandler = [(ICQUpgradeFlowManager *)self hostingNavigationController];
    [(ICQUICloudStorageOffersManager *)v30 beginFlowWithNavigationController:purchaseCompletionHandler purchaseToken:v8 buyParameters:v9 requestHeaders:v10 modally:0];
    goto LABEL_26;
  }
  int v15 = _ICQGetLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "Token not available and legacy flow cannot be used in Buddy; returning token missing failure",
      (uint8_t *)&v31,
      2u);
  }

  uint64_t v16 = [(ICQUpgradeCloudStorageFlowManager *)self purchaseCompletionHandler];

  if (v16)
  {
    uint64_t v17 = [(ICQUpgradeCloudStorageFlowManager *)self purchaseCompletionHandler];
    uint64_t v18 = [(ICQUpgradeCloudStorageFlowManager *)self secureTokenMissingError];
    ((void (**)(void, void, void *))v17)[2](v17, 0, v18);

    id purchaseCompletionHandler = self->_purchaseCompletionHandler;
    self->_id purchaseCompletionHandler = 0;
LABEL_26:
  }
}

- (void)_performPurchaseUsingSettingsUI
{
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Switch to purchase flow using settings UI", v6, 2u);
  }

  BOOL v4 = [(ICQUpgradeCloudStorageFlowManager *)self _buyProductQueryDictionary];
  id v5 = [(ICQUpgradeCloudStorageFlowManager *)self _storageContextHeaderDictionary];
  [(ICQUpgradeCloudStorageFlowManager *)self _adoptRemoteUIWithPurchaseToken:0 buyParameters:v4 requestHeaders:v5];
}

- (void)_performPurchaseUsingTouchID
{
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Authenticating purchase using Touch ID", buf, 2u);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__ICQUpgradeCloudStorageFlowManager__performPurchaseUsingTouchID__block_invoke;
  v4[3] = &unk_2649226E0;
  v4[4] = self;
  [(ICQUpgradeCloudStorageFlowManager *)self _buyProductShouldUseToken:1 completionHandler:v4];
}

void __65__ICQUpgradeCloudStorageFlowManager__performPurchaseUsingTouchID__block_invoke(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __65__ICQUpgradeCloudStorageFlowManager__performPurchaseUsingTouchID__block_invoke_2;
  v2[3] = &unk_264922628;
  v2[4] = *(void *)(a1 + 32);
  v2[5] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __65__ICQUpgradeCloudStorageFlowManager__performPurchaseUsingTouchID__block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  switch(*(void *)(result + 40))
  {
    case 0:
      v3 = _ICQGetLogSystem();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "ERROR: Unexpected ICQBuyProductSucceeded -- should go through ICQUICloudStorageOffersManager", v5, 2u);
      }

      [*(id *)(v1 + 32) _presentUpgradeComplete];
      result = [*(id *)(v1 + 32) _clearBusyOfferViewController];
      break;
    case 2:
    case 4:
      [*(id *)(result + 32) _clearBusyOfferViewController];
      v2 = *(void **)(v1 + 32);
      result = [v2 _performPurchaseUsingSettingsUI];
      break;
    case 3:
      BOOL v4 = *(void **)(result + 32);
      result = [v4 _cancelFlow];
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)_canDoTokenPurchaseWithOffer:(id)a3
{
  id v3 = a3;
  if ([v3 iTunesAccountExists])
  {
    BOOL v4 = [MEMORY[0x263F53C50] sharedConnection];
    char v5 = [v4 isPasscodeSet];

    id v6 = _ICQGetLogSystem();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "checking biometric state", buf, 2u);
      }

      *(void *)buf = 0;
      v23 = buf;
      uint64_t v24 = 0x2020000000;
      uint64_t v25 = 5;
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      id v9 = objc_alloc_init(MEMORY[0x263F7B138]);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __66__ICQUpgradeCloudStorageFlowManager__canDoTokenPurchaseWithOffer___block_invoke;
      v19[3] = &unk_264922708;
      v21 = buf;
      id v10 = v8;
      long long v20 = v10;
      [v9 getStateWithCompletionBlock:v19];
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v11 = *((void *)v23 + 3);
      BOOL v12 = v11 == 1;
      if (v11 == 1)
      {
        int v15 = _ICQGetLogSystem();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
LABEL_18:

          _Block_object_dispose(buf, 8);
          goto LABEL_19;
        }
        *(_WORD *)uint64_t v18 = 0;
        BOOL v13 = "Touch ID purchase should be available";
      }
      else
      {
        int v15 = _ICQGetLogSystem();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        *(_WORD *)uint64_t v18 = 0;
        BOOL v13 = "Touch ID purchase not enabled";
      }
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, v13, v18, 2u);
      goto LABEL_18;
    }
    if (v7)
    {
      *(_WORD *)buf = 0;
      BOOL v14 = "no Touch ID purchase: Passcode not set";
      goto LABEL_13;
    }
  }
  else
  {
    id v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      BOOL v14 = "no Touch ID purchase: iTunes account does not exist";
LABEL_13:
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
  }

  BOOL v12 = 0;
LABEL_19:

  return v12;
}

intptr_t __66__ICQUpgradeCloudStorageFlowManager__canDoTokenPurchaseWithOffer___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_performPurchase
{
  id v3 = objc_opt_class();
  BOOL v4 = [(ICQUpgradeFlowManager *)self offer];
  LODWORD(v3) = [v3 _canDoTokenPurchaseWithOffer:v4];

  if (v3)
  {
    [(ICQUpgradeCloudStorageFlowManager *)self _performPurchaseUsingTouchID];
  }
  else
  {
    char v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "_performPurchase: _canDoTokenPurchaseWithOffer: says NO", v6, 2u);
    }

    [(ICQUpgradeCloudStorageFlowManager *)self _performPurchaseUsingSettingsUI];
  }
}

- (id)secureTokenMissingError
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F7BC78] code:1003 userInfo:0];
}

- (void)manager:(id)a3 willPresentViewController:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "will present view controller %@", (uint8_t *)&v7, 0xCu);
  }

  [(ICQUpgradeFlowManager *)self _clearBusyOfferViewController];
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "load failed with error %@", (uint8_t *)&v19, 0xCu);
  }

  if (v5)
  {
    id v7 = v5;
    id v8 = [v7 domain];
    int v9 = [v8 isEqualToString:@"com.apple.Preferences.cloud-storage-offers"];

    if (v9)
    {
      uint64_t v10 = [v7 code];
      uint64_t v11 = [v7 userInfo];
      uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F08608]];

      id v7 = (id)v12;
      if (v10 != 1) {
        goto LABEL_13;
      }
    }
    else
    {
      BOOL v13 = [v7 domain];
      if ([v13 isEqualToString:*MEMORY[0x263F7B758]])
      {
      }
      else
      {
        BOOL v14 = [v7 domain];
        int v15 = [v14 isEqualToString:*MEMORY[0x263F7BC78]];

        if (!v15) {
          goto LABEL_13;
        }
      }
      if ([v7 code] != 16 && objc_msgSend(v7, "code") != 140)
      {
LABEL_13:
        uint64_t v16 = [(ICQUpgradeCloudStorageFlowManager *)self purchaseCompletionHandler];

        if (v16)
        {
          uint64_t v17 = [(ICQUpgradeCloudStorageFlowManager *)self purchaseCompletionHandler];
          ((void (**)(void, void, id))v17)[2](v17, 0, v7);

          id purchaseCompletionHandler = self->_purchaseCompletionHandler;
          self->_id purchaseCompletionHandler = 0;
        }
        goto LABEL_15;
      }
    }
    [(ICQUpgradeFlowManager *)self _cancelFlow];
LABEL_15:
  }
}

- (void)managerDidCancel:(id)a3
{
  BOOL v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "cloud storage offers manager canceled", v5, 2u);
  }

  [(ICQUpgradeFlowManager *)self _cancelFlow];
}

- (void)manager:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Cloud storage offers manager did complete with error %@", (uint8_t *)&v16, 0xCu);
  }

  id v7 = [(ICQUpgradeCloudStorageFlowManager *)self purchaseCompletionHandler];

  if (v7)
  {
    id v8 = [v5 userInfo];
    int v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    BOOL v10 = v5 == 0;
    uint64_t v11 = [v5 domain];
    int v12 = [v11 isEqualToString:@"com.apple.Preferences.cloud-storage-offers"];

    if (v12)
    {
      if ([v5 code]) {
        BOOL v10 = [v5 code] == 2;
      }
      else {
        BOOL v10 = 1;
      }
    }
    BOOL v14 = [(ICQUpgradeCloudStorageFlowManager *)self purchaseCompletionHandler];
    ((void (**)(void, BOOL, void *))v14)[2](v14, v10, v9);

    id purchaseCompletionHandler = self->_purchaseCompletionHandler;
    self->_id purchaseCompletionHandler = 0;
  }
  else
  {
    BOOL v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "ERROR: purchaseCompletionHandler missing -- using fallback", (uint8_t *)&v16, 2u);
    }

    [(ICQUpgradeFlowManager *)self _presentUpgradeComplete];
    [(ICQUpgradeFlowManager *)self _clearBusyOfferViewController];
  }
}

- (NSString)storagePurchaseButtonId
{
  return self->_storagePurchaseButtonId;
}

- (void)setStoragePurchaseButtonId:(id)a3
{
}

- (ICQUICloudStorageOffersManager)storageOffersManager
{
  return self->_storageOffersManager;
}

- (void)setStorageOffersManager:(id)a3
{
}

- (id)purchaseCompletionHandler
{
  return self->_purchaseCompletionHandler;
}

- (void)setPurchaseCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_purchaseCompletionHandler, 0);
  objc_storeStrong((id *)&self->_storageOffersManager, 0);
  objc_storeStrong((id *)&self->_storagePurchaseButtonId, 0);
  objc_storeStrong((id *)&self->_legacyPurchaseFlowManager, 0);
  objc_storeStrong((id *)&self->_buyProductSession, 0);
}

@end