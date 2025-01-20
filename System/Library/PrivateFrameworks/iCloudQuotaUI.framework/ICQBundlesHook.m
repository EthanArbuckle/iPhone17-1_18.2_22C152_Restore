@interface ICQBundlesHook
- (BOOL)dynamicViewControllerShouldDismiss:(id)a3;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (ICQBundlesHook)initWithFlowManager:(id)a3;
- (NSString)buffervar;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (id)continuationResponseBody;
- (id)dynamicViewController:(id)a3 contentViewControllerWithDictionary:(id)a4;
- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)launchBundleOffer;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setAdditionalParameters:(id)a3;
- (void)setBuffervar:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ICQBundlesHook

- (ICQBundlesHook)initWithFlowManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICQBundlesHook;
  v5 = [(ICQBundlesHook *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_flowManager, v4);
  }

  return v6;
}

- (BOOL)shouldMatchElement:(id)a3
{
  return 0;
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
  id v3 = a3;
  id v4 = [v3 clientInfo];
  v5 = [v4 objectForKeyedSubscript:@"action"];
  if ([v5 isEqualToString:@"LAUNCH_BUNDLE_OFFER_VIEW"])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [v3 clientInfo];
    id v8 = [v7 objectForKeyedSubscript:@"action"];
    char v6 = [v8 isEqualToString:@"ICQActionLaunchAppleOne"];
  }
  return v6;
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  clientInfo = self->_clientInfo;
  self->_clientInfo = v7;

  v9 = +[ICQPurchase clearCacheAndNotifyClientsWithCompletion:v6];

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v9;

  [(ICQBundlesHook *)self launchBundleOffer];
}

- (RUIServerHookResponse)serverHookResponse
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"refreshUrl"];
  id v4 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"refreshHttpMethod"];
  v5 = _ICQGetLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "No refresh URL or Http method found.", buf, 2u);
    }
    id v8 = 0;
  }
  else
  {
    if (v6)
    {
      int64_t statusCode = self->_statusCode;
      int64_t amsErrorCode = self->_amsErrorCode;
      int64_t amsAction = self->_amsAction;
      *(_DWORD *)buf = 134218496;
      int64_t v19 = statusCode;
      __int16 v20 = 2048;
      int64_t v21 = amsAction;
      __int16 v22 = 2048;
      int64_t v23 = amsErrorCode;
      _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "_int64_t statusCode = %ld, _amsAction = %ld, _amsErrorCode = %ld", buf, 0x20u);
    }

    v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      buyParamsStr = self->_buyParamsStr;
      *(_DWORD *)buf = 138412290;
      int64_t v19 = (int64_t)buyParamsStr;
      _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "_buyParamsStr = %@", buf, 0xCu);
    }

    v5 = [objc_alloc(NSURL) initWithString:v3];
    v14 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v5];
    v15 = [NSString stringWithFormat:@"<?xml version='1.0' encoding='UTF-8'?><!DOCTYPE plist PUBLIC '-//Apple//DTD PLIST 1.0//EN' 'http://www.apple.com/DTDs/PropertyList-1.0.dtd'><plist version='1.0'><dict><key>statusCode</key><integer>%ld</integer><key>amsAction</key><integer>%ld</integer><key>amsErrorCode</key><integer>%ld</integer><key>buyParams</key><string>%@</string></dict></plist>", self->_statusCode, self->_amsAction, self->_amsErrorCode, self->_buyParamsStr];
    v16 = [v15 dataUsingEncoding:4];
    [v14 setHTTPBody:v16];

    [v14 setHTTPMethod:v4];
    id v8 = objc_alloc_init(MEMORY[0x263F637C8]);
    [v8 setContinuationRequest:v14];
  }
  return (RUIServerHookResponse *)v8;
}

- (id)continuationResponseBody
{
  v10[4] = *MEMORY[0x263EF8340];
  v9[0] = @"statusCode";
  id v3 = [NSNumber numberWithInteger:self->_statusCode];
  v10[0] = v3;
  v9[1] = @"amsErrorCodes";
  id v4 = [NSNumber numberWithInteger:self->_amsErrorCode];
  v10[1] = v4;
  v9[2] = @"amsAction";
  v5 = [NSNumber numberWithInteger:self->_amsAction];
  v9[3] = @"buyParams";
  buyParamsStr = self->_buyParamsStr;
  v10[2] = v5;
  v10[3] = buyParamsStr;
  BOOL v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (void)launchBundleOffer
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  p_flowManager = &self->_flowManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowManager);
  v5 = [WeakRetained offer];
  uint64_t v6 = [v5 action];

  if (v6 == 118)
  {
    id v7 = objc_loadWeakRetained((id *)p_flowManager);
    [v7 presentHostingNavigationController];
  }
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "present bundle start from server hook path", buf, 2u);
  }

  v9 = [MEMORY[0x263F27B28] quotaBag];
  v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v9;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "bag = %@", buf, 0xCu);
  }

  int v11 = (void *)[objc_alloc(MEMORY[0x263F27FF8]) initWithServiceType:@"icloud" placement:@"iCloudPreBuyFlow" bag:v9];
  [v11 setDelegate:self];
  [(ICQBundlesHook *)self setAdditionalParameters:v11];
  v12 = _ICQGetLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "replacing the spinner with bundle view", buf, 2u);
  }

  id v13 = objc_loadWeakRetained((id *)p_flowManager);
  v14 = [v13 hostingNavigationController];
  v15 = [v14 presentingViewController];
  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = v15;

  v17 = [MEMORY[0x263EFF8C0] arrayWithObject:v11];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = objc_loadWeakRetained((id *)p_flowManager);
  int64_t v19 = objc_msgSend(v18, "hostingNavigationController", 0);
  __int16 v20 = [v19 navigationBar];
  int64_t v21 = [v20 subviews];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v31 + 1) + 8 * v25);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v26 setHidden:1];
        }
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v23);
  }

  id v27 = objc_loadWeakRetained((id *)p_flowManager);
  v28 = [v27 hostingNavigationController];
  [v28 setNavigationBarHidden:0 animated:0];

  id v29 = objc_loadWeakRetained((id *)p_flowManager);
  v30 = [v29 hostingNavigationController];
  [v30 setViewControllers:v17];
}

- (void)setAdditionalParameters:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  uint64_t v6 = objc_msgSend(v5, "ams_activeiTunesAccount");
  id v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v6;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "acc = %@", buf, 0xCu);
  }

  [v4 setAccount:v6];
  id v8 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"amsParams"];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263EFF8F8]);
    v10 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"amsParams"];
    int v11 = (void *)[v9 initWithBase64EncodedString:v10 options:0];

    if (v11)
    {
      id v39 = 0;
      v12 = [MEMORY[0x263F08900] JSONObjectWithData:v11 options:0 error:&v39];
      id v13 = v39;
      if (v13)
      {
        v14 = v13;
        v15 = _ICQGetLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v14;
          _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "error parsing ams bundle dictionary: %@", buf, 0xCu);
        }

LABEL_13:
        goto LABEL_14;
      }
      if (v12)
      {
        v16 = _ICQGetLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v12;
          _os_log_impl(&dword_22C821000, v16, OS_LOG_TYPE_DEFAULT, "AMS Bundle additional Parameters = %@", buf, 0xCu);
        }

        [v4 setClientOptions:v12];
        v14 = v12;
        goto LABEL_13;
      }
    }
LABEL_14:
  }
  v17 = [MEMORY[0x263F27E08] currentProcess];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowManager);
  int64_t v19 = [WeakRetained offer];

  __int16 v20 = [v19 appVersionId];
  int64_t v21 = NSString;
  uint64_t v22 = [v19 bundleIdentifier];
  uint64_t v23 = [v21 stringWithFormat:@"%@/%@ MBF/1.0 CastleSettings/1.0", v22, v20];
  [v17 setUserAgentSuffix:v23];

  [v4 setClientInfo:v17];
  [v4 setMediaClientIdentifier:@"com.apple.RemoteICloudQuotaUI"];
  id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v24 setObject:@"icloud" forKey:@"app"];
  [v24 setObject:@"xp_its_main" forKey:@"topic"];
  uint64_t v25 = objc_msgSend(v6, "ams_DSID");

  if (v25)
  {
    v26 = objc_msgSend(v6, "ams_DSID");
    [v24 setObject:v26 forKey:@"DSID"];
  }
  id v27 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"precedingMarketing"];

  if (v27)
  {
    id v28 = objc_alloc(MEMORY[0x263EFF8F8]);
    id v29 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"precedingMarketing"];
    v30 = (void *)[v28 initWithBase64EncodedString:v29 options:0];

    if (v30)
    {
      v37 = v5;
      id v38 = 0;
      long long v31 = [MEMORY[0x263F08900] JSONObjectWithData:v30 options:0 error:&v38];
      id v32 = v38;
      if (v32)
      {
        long long v33 = v32;
        long long v34 = _ICQGetLogSystem();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v33;
          _os_log_impl(&dword_22C821000, v34, OS_LOG_TYPE_DEFAULT, "error parsing precedingMarketing dictionary: %@", buf, 0xCu);
        }

LABEL_27:
        v5 = v37;
        goto LABEL_28;
      }
      if (v31)
      {
        v35 = _ICQGetLogSystem();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v31;
          _os_log_impl(&dword_22C821000, v35, OS_LOG_TYPE_DEFAULT, "AMS precedingMarketing = %@", buf, 0xCu);
        }

        [v24 setObject:v31 forKey:@"precedingMarketing"];
        long long v33 = v31;
        goto LABEL_27;
      }
    }
LABEL_28:
  }
  v36 = _ICQGetLogSystem();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v24;
    _os_log_impl(&dword_22C821000, v36, OS_LOG_TYPE_DEFAULT, "Setting overlayDictionary = %@", buf, 0xCu);
  }

  [v4 setMetricsOverlay:v24];
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  v50[1] = *MEMORY[0x263EF8340];
  id v8 = (char *)a3;
  id v9 = (char *)a4;
  v10 = (char *)a5;
  int v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v43) = 0;
    _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "AMSUIDynamicViewControllerDelegate:didFinishPurchaseWithResult", (uint8_t *)&v43, 2u);
  }

  v12 = _ICQGetLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v43 = 138412290;
    v44 = v8;
    _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "AMSUIDynamicViewController = %@", (uint8_t *)&v43, 0xCu);
  }

  id v13 = _ICQGetLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v43 = 138412290;
    v44 = v9;
    _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "AMSPurchaseResult = %@", (uint8_t *)&v43, 0xCu);
  }

  v14 = _ICQGetLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v43 = 138412290;
    v44 = v10;
    _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "error = %@", (uint8_t *)&v43, 0xCu);
  }

  int64_t v15 = [v10 code];
  self->_int64_t amsErrorCode = v15;
  if (v9)
  {
    v16 = _ICQGetLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = 136315138;
      v44 = "-[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:]";
      _os_log_impl(&dword_22C821000, v16, OS_LOG_TYPE_DEFAULT, "%s: We have a purchase result", (uint8_t *)&v43, 0xCu);
    }

    v17 = (void *)MEMORY[0x263EFF8C0];
    id v18 = objc_alloc_init(MEMORY[0x263F25D70]);
    int64_t v19 = [v17 arrayWithObject:v18];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowManager);
    int64_t v21 = [WeakRetained hostingNavigationController];
    [v21 setViewControllers:v19];

    id v22 = objc_loadWeakRetained((id *)&self->_flowManager);
    uint64_t v23 = [v22 hostingNavigationController];
    if (v23)
    {
      id v24 = (void *)v23;
      uint64_t v25 = [(UIViewController *)self->_presentingViewController presentedViewController];

      if (!v25)
      {
        presentingViewController = self->_presentingViewController;
        id v27 = objc_loadWeakRetained((id *)&self->_flowManager);
        id v28 = [v27 hostingNavigationController];
        [(UIViewController *)presentingViewController presentPreferredSizeWithViewController:v28 animated:1 completion:0];

LABEL_22:
        self->_int64_t statusCode = 0;
        v30 = [v9 purchase];
        v49 = @"mtTopic";
        v50[0] = @"xp_its_main";
        long long v31 = [NSDictionary dictionaryWithObjects:v50 forKeys:&v49 count:1];
        [v30 setMetricsOverlay:v31];

        id v32 = [v30 buyParams];
        long long v33 = v32;
        if (v32)
        {
          long long v34 = [v32 stringValue];
          buyParamsStr = self->_buyParamsStr;
          self->_buyParamsStr = v34;

          v36 = [MEMORY[0x263F88978] base64EncodeString:self->_buyParamsStr];
          v37 = self->_buyParamsStr;
          self->_buyParamsStr = v36;
        }
        else
        {
          v37 = _ICQGetLogSystem();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            -[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:](v37);
          }
        }

        self->_int64_t amsAction = 2;
        v10 = 0;
        uint64_t v38 = 1;
        goto LABEL_33;
      }
    }
    else
    {
    }
    id v27 = _ICQGetLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:]((id *)&self->_flowManager, (uint64_t)self, v27);
    }
    goto LABEL_22;
  }
  if (v15)
  {
    if (v15 == 6)
    {
      id v29 = _ICQGetLogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v43 = 136315138;
        v44 = "-[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:]";
        _os_log_impl(&dword_22C821000, v29, OS_LOG_TYPE_DEFAULT, "%s: Cancelled", (uint8_t *)&v43, 0xCu);
      }
    }
    else
    {
      id v29 = _ICQGetLogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int64_t amsErrorCode = self->_amsErrorCode;
        id v41 = [v10 localizedDescription];
        int v43 = 136315650;
        v44 = "-[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:]";
        __int16 v45 = 2048;
        int64_t v46 = amsErrorCode;
        __int16 v47 = 2112;
        v48 = v41;
        _os_log_impl(&dword_22C821000, v29, OS_LOG_TYPE_DEFAULT, "%s: Error code %ld. Error: %@", (uint8_t *)&v43, 0x20u);
      }
    }

    uint64_t v38 = 0;
    self->_int64_t statusCode = 1;
    self->_int64_t amsAction = 1;
  }
  else
  {
    id v39 = _ICQGetLogSystem();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = 136315138;
      v44 = "-[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:]";
      _os_log_impl(&dword_22C821000, v39, OS_LOG_TYPE_DEFAULT, "%s: no error & no purchase result -- counting this as success.", (uint8_t *)&v43, 0xCu);
    }

    uint64_t v38 = 1;
    self->_int64_t statusCode = 1;
    self->_int64_t amsAction = 2;

    v10 = 0;
  }
LABEL_33:
  (*((void (**)(void))self->_completionHandler + 2))();
  id v42 = objc_loadWeakRetained((id *)&self->_flowManager);
  [v42 dismissUpgradeFlowWithSuccess:v38];
}

- (id)dynamicViewController:(id)a3 contentViewControllerWithDictionary:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "AMSUIDynamicViewControllerDelegate:contentViewControllerWithDictionary", (uint8_t *)&v11, 2u);
  }

  id v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "contentViewControllerDictionary = %@", (uint8_t *)&v11, 0xCu);
  }

  id v8 = (void *)[objc_alloc(MEMORY[0x263F25D70]) initWithNibName:0 bundle:0];
  self->_int64_t statusCode = 1;
  self->_int64_t amsErrorCode = 0;
  self->_int64_t amsAction = 0;
  buyParamsStr = self->_buyParamsStr;
  self->_buyParamsStr = (NSString *)&stru_26DFF2C90;

  (*((void (**)(void))self->_completionHandler + 2))();
  return v8;
}

- (BOOL)dynamicViewControllerShouldDismiss:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ICQBundlesHook dynamicViewControllerShouldDismiss:]";
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowManager);
  [WeakRetained dismissUpgradeFlowWithSuccess:0];

  return 0;
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)buffervar
{
  return self->_buffervar;
}

- (void)setBuffervar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffervar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_buyParamsStr, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_destroyWeak((id *)&self->_flowManager);
}

- (void)dynamicViewController:(os_log_t)log didFinishPurchaseWithResult:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "AMSBuyParams object not found or corrupted", v1, 2u);
}

- (void)dynamicViewController:(id *)a1 didFinishPurchaseWithResult:(uint64_t)a2 error:(NSObject *)a3 .cold.2(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v6 = [WeakRetained hostingNavigationController];
  int v7 = [*(id *)(a2 + 64) presentedViewController];
  id v8 = @"YES";
  v10 = "-[ICQBundlesHook dynamicViewController:didFinishPurchaseWithResult:error:]";
  int v9 = 136315650;
  if (!v7) {
    id v8 = @"NO";
  }
  __int16 v11 = 2112;
  id v12 = v6;
  __int16 v13 = 2112;
  v14 = v8;
  _os_log_error_impl(&dword_22C821000, a3, OS_LOG_TYPE_ERROR, "%s: failed to present with _flowManager.hostingNavigationController: %@, _presentingViewController.presentedViewController: %@", (uint8_t *)&v9, 0x20u);
}

@end