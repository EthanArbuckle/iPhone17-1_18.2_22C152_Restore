@interface ICQUILegacyPurchaseFlowManager
- (BOOL)_loadNativeURL:(id)a3;
- (ICQUILegacyPurchaseFlowManager)initWithPresenter:(id)a3;
- (NSString)presentingSceneBundleIdentifier;
- (id)_presentationContext;
- (id)parentViewControllerForObjectModel:(id)a3;
- (unint64_t)requiredStorageThreshold;
- (unint64_t)supportedInterfaceOrientations;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)_beginRUIFlowWithAMSURLResult:(id)a3;
- (void)_beginURLOperationWithURLRequest:(id)a3;
- (void)_clearRetailFollowUpItem;
- (void)_didCompletePurchaseFlowWithStatusCode:(int64_t)a3;
- (void)_dismissPurchaseFlow;
- (void)_fetchURLRequestWithURL:(id)a3 completion:(id)a4;
- (void)_handleAuthenticateRequest:(id)a3 completion:(id)a4;
- (void)_handleDialogRequest:(id)a3 completion:(id)a4;
- (void)_handleEngagementRequest:(id)a3 completion:(id)a4;
- (void)_popObjectModelAnimated:(BOOL)a3;
- (void)_updatePage:(id)a3;
- (void)beginFlowWithCompletion:(id)a3;
- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)makeBuyRequest:(id)a3;
- (void)makeBuyRequestWithParams:(id)a3 completion:(id)a4;
- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5;
- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5 completion:(id)a6;
- (void)objectModelPressedBack:(id)a3;
- (void)setPresentingSceneBundleIdentifier:(id)a3;
- (void)setRequiredStorageThreshold:(unint64_t)a3;
@end

@implementation ICQUILegacyPurchaseFlowManager

- (ICQUILegacyPurchaseFlowManager)initWithPresenter:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICQUILegacyPurchaseFlowManager;
  v5 = [(ICQUILegacyPurchaseFlowManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_presenter, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    objectModels = v6->_objectModels;
    v6->_objectModels = v7;

    v6->_isDowngradePurchaseInProgress = 0;
  }

  return v6;
}

- (void)beginFlowWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  id flowCompletion = self->_flowCompletion;
  self->_id flowCompletion = v4;

  v6 = [MEMORY[0x263F27B28] quotaBag];
  v7 = [v6 URLForKey:@"mint-offers"];
  v8 = [v7 valuePromise];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke;
  v9[3] = &unk_2649238A8;
  v9[4] = self;
  [v8 addFinishBlock:v9];
}

void __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = _ICQGetLogSystem();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      v15 = @"mint-offers";
      _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Successfully fetched the url (%@) for key (%@)", buf, 0x16u);
    }

    v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke_35;
    v10[3] = &unk_264923880;
    v10[4] = v9;
    id v11 = v5;
    [v9 _fetchURLRequestWithURL:v11 completion:v10];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke_cold_1((uint64_t)v6, v8);
    }

    [*(id *)(a1 + 32) _didCompletePurchaseFlowWithStatusCode:3];
  }
}

void __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    +[ICQUsageQuotaRequest addHeadersForPrimaryAccountToRequest:v5];
    [v5 addValue:@" CastleSettings/1.0" forHTTPHeaderField:@"User-agent"];
    [*(id *)(a1 + 32) _beginURLOperationWithURLRequest:v5];
  }
  else
  {
    v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke_35_cold_1();
    }

    [*(id *)(a1 + 32) _didCompletePurchaseFlowWithStatusCode:3];
  }
}

- (id)_presentationContext
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  navController = self->_navController;
  if (navController) {
    WeakRetained = navController;
  }
  else {
    WeakRetained = (UINavigationController *)objc_loadWeakRetained((id *)&self->_presenter);
  }
  id v4 = WeakRetained;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(UINavigationController *)v4 presentedViewController];
    int v8 = 138412546;
    v9 = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Presentation Context: %@ - %@", (uint8_t *)&v8, 0x16u);
  }
  return v4;
}

- (void)_fetchURLRequestWithURL:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[ICQUILegacyPurchaseFlowManager _fetchURLRequestWithURL:completion:]";
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "%s called with url: %@", buf, 0x16u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__ICQUILegacyPurchaseFlowManager__fetchURLRequestWithURL_completion___block_invoke;
  aBlock[3] = &unk_2649238D0;
  id v9 = v6;
  id v23 = v9;
  id v10 = v7;
  id v24 = v10;
  id v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v12 = objc_alloc(MEMORY[0x263F27ED8]);
  id v13 = [MEMORY[0x263F27B28] quotaBag];
  __int16 v14 = (void *)[v12 initWithBag:v13];

  if (self->_amsAccount)
  {
    objc_msgSend(v14, "setAccount:");
    v11[2](v11, v14);
  }
  else
  {
    v15 = [MEMORY[0x263EFB210] defaultStore];
    uint64_t v16 = objc_msgSend(v15, "aa_primaryAppleAccount");
    if (objc_opt_respondsToSelector())
    {
      v17 = objc_msgSend(v15, "ams_iTunesAccountForAccount:forMediaType:createIfNeeded:", v16, *MEMORY[0x263F277F0], 1);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __69__ICQUILegacyPurchaseFlowManager__fetchURLRequestWithURL_completion___block_invoke_2;
      v19[3] = &unk_2649238F8;
      id v20 = v14;
      v21 = v11;
      [v17 addFinishBlock:v19];
    }
    else
    {
      v18 = objc_msgSend(v15, "ams_iTunesAccountForAccount:", v16);
      [v14 setAccount:v18];

      v11[2](v11, v14);
    }
  }
}

void __69__ICQUILegacyPurchaseFlowManager__fetchURLRequestWithURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 requestWithMethod:2 URL:*(void *)(a1 + 32) parameters:0];
  [v3 resultWithCompletion:*(void *)(a1 + 40)];
}

void __69__ICQUILegacyPurchaseFlowManager__fetchURLRequestWithURL_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) setAccount:a2];
  }
  else
  {
    id v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69__ICQUILegacyPurchaseFlowManager__fetchURLRequestWithURL_completion___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_beginURLOperationWithURLRequest:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[ICQUILegacyPurchaseFlowManager _beginURLOperationWithURLRequest:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s called with urlRequest: %@", buf, 0x16u);
  }

  id v6 = [MEMORY[0x263F27EF0] defaultSession];
  defaultAMSURLSession = self->_defaultAMSURLSession;
  self->_defaultAMSURLSession = v6;

  [self->_defaultAMSURLSession setDelegate:self];
  int v8 = [self->_defaultAMSURLSession dataTaskPromiseWithRequest:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__ICQUILegacyPurchaseFlowManager__beginURLOperationWithURLRequest___block_invoke;
  v10[3] = &unk_264923920;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 addFinishBlock:v10];
}

void __67__ICQUILegacyPurchaseFlowManager__beginURLOperationWithURLRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 56))
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "This AMS request has been intercepted to perform AMS purchase for downgrade and need no action here.", buf, 2u);
    }
  }
  else
  {
    int v8 = _ICQGetLogSystem();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __67__ICQUILegacyPurchaseFlowManager__beginURLOperationWithURLRequest___block_invoke_cold_1();
      }

      [*(id *)(a1 + 32) _didCompletePurchaseFlowWithStatusCode:3];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "Successfully completed AMS request %@, with result: %@", buf, 0x16u);
      }

      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __67__ICQUILegacyPurchaseFlowManager__beginURLOperationWithURLRequest___block_invoke_51;
      v11[3] = &unk_264921B68;
      v11[4] = *(void *)(a1 + 32);
      id v12 = v5;
      dispatch_async(MEMORY[0x263EF83A0], v11);
    }
  }
}

uint64_t __67__ICQUILegacyPurchaseFlowManager__beginURLOperationWithURLRequest___block_invoke_51(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginRUIFlowWithAMSURLResult:*(void *)(a1 + 40)];
}

- (void)_beginRUIFlowWithAMSURLResult:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[ICQUILegacyPurchaseFlowManager _beginRUIFlowWithAMSURLResult:]";
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v6 = objc_alloc(MEMORY[0x263F637B8]);
  id v7 = [v4 data];
  int v8 = (void *)[v6 initWithXML:v7];

  if ([v8 succeeded])
  {
    id v9 = [v8 uiObjectModel];
    uint64_t v10 = [v8 actionSignal];
    [v9 setDelegate:self];
    id v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v33 = (const char *)v9;
      __int16 v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "objectModel: %@, actionSignal: %@", buf, 0x16u);
    }

    if (!-[NSMutableArray count](self->_objectModels, "count") && [v10 topSignal] == 3) {
      [v10 setTopSignal:2];
    }
    navController = self->_navController;
    if (!navController)
    {
      id v13 = (UINavigationController *)objc_alloc_init(MEMORY[0x263F829B8]);
      uint64_t v14 = self->_navController;
      self->_navController = v13;

      [(UINavigationController *)self->_navController setModalPresentationStyle:2];
      [(UINavigationController *)self->_navController setModalTransitionStyle:0];
    }
    if (![v10 topSignal]) {
      [v10 setTopSignal:2];
    }
    if ([v10 topSignal] == 2)
    {
      [(NSMutableArray *)self->_objectModels addObject:v9];
      __int16 v15 = [v9 defaultPages];
      id v16 = [v15 firstObject];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        -[ICQUILegacyPurchaseFlowManager _beginRUIFlowWithAMSURLResult:]();
      }
      if (v16) {
        [(ICQUILegacyPurchaseFlowManager *)self _updatePage:v16];
      }
      uint64_t v17 = [(UINavigationController *)self->_navController topViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      v19 = self->_navController;
      if (isKindOfClass)
      {
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __64__ICQUILegacyPurchaseFlowManager__beginRUIFlowWithAMSURLResult___block_invoke;
        v31[3] = &unk_264921C80;
        v31[4] = self;
        [v9 presentInParentViewController:v19 animated:0 completion:v31];

        goto LABEL_32;
      }
      [v9 presentInParentViewController:v19 animated:navController != 0];
      goto LABEL_30;
    }
    if ([v10 topSignal] == 3)
    {
      v21 = [(UINavigationController *)self->_navController viewControllers];
      id v16 = [v21 mutableCopy];

      [(NSMutableArray *)self->_objectModels removeLastObject];
      [v16 removeLastObject];
      v22 = [v9 defaultPages];
      id v23 = [v22 lastObject];
      [v16 addObject:v23];

      [(NSMutableArray *)self->_objectModels addObject:v9];
      [(UINavigationController *)self->_navController setViewControllers:v16 animated:0];
LABEL_30:

      goto LABEL_31;
    }
    if ([v10 topSignal] != 4) {
      goto LABEL_31;
    }
    id v24 = [v9 defaultPages];
    uint64_t v25 = [v24 count];

    if (v25)
    {
      if ((unint64_t)[(NSMutableArray *)self->_objectModels count] <= 1)
      {
        id v16 = _ICQGetLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[ICQUILegacyPurchaseFlowManager _beginRUIFlowWithAMSURLResult:]();
        }
        goto LABEL_30;
      }
      [(NSMutableArray *)self->_objectModels removeLastObject];
      [(NSMutableArray *)self->_objectModels removeLastObject];
      __int16 v27 = [(UINavigationController *)self->_navController viewControllers];
      id v28 = (void *)[v27 mutableCopy];

      [v28 removeLastObject];
      [v28 removeLastObject];
      [(NSMutableArray *)self->_objectModels addObject:v9];
      uint64_t v29 = [v9 defaultPages];
      v30 = [v29 lastObject];
      [v28 addObject:v30];

      [(UINavigationController *)self->_navController setViewControllers:v28 animated:0];
    }
    else
    {
      [(ICQUILegacyPurchaseFlowManager *)self _popObjectModelAnimated:1];
    }
LABEL_31:
    if (navController)
    {
LABEL_33:

      goto LABEL_34;
    }
LABEL_32:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    [WeakRetained presentViewController:self->_navController animated:1 completion:0];

    goto LABEL_33;
  }
  id v20 = _ICQGetLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[ICQUILegacyPurchaseFlowManager _beginRUIFlowWithAMSURLResult:]();
  }

  [(ICQUILegacyPurchaseFlowManager *)self _didCompletePurchaseFlowWithStatusCode:3];
LABEL_34:
}

void __64__ICQUILegacyPurchaseFlowManager__beginRUIFlowWithAMSURLResult___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__ICQUILegacyPurchaseFlowManager__beginRUIFlowWithAMSURLResult___block_invoke_2;
  block[3] = &unk_264921C80;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__ICQUILegacyPurchaseFlowManager__beginRUIFlowWithAMSURLResult___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 40) topViewController];
  id v4 = [v2 arrayWithObject:v3];

  [*(id *)(*(void *)(a1 + 32) + 40) setViewControllers:v4];
}

- (void)_updatePage:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v30 = a3;
  v31 = self;
  if (self->_requiredStorageThreshold)
  {
    id v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t requiredStorageThreshold = self->_requiredStorageThreshold;
      *(_DWORD *)buf = 134217984;
      unint64_t v43 = requiredStorageThreshold;
      _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "May need to update row for requiredStorageThreshold: %lld", buf, 0xCu);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v6 = [v30 tableViewOM];
    id v7 = [v6 sections];

    id obj = v7;
    uint64_t v28 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    int v8 = 0;
    if (v28)
    {
      uint64_t v27 = *(void *)v37;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = v9;
          uint64_t v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v11 = [v10 rows];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v33 != v14) {
                  objc_enumerationMutation(v11);
                }
                id v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                uint64_t v17 = [v16 attributes];
                v18 = [v17 objectForKeyedSubscript:@"totalStorage"];

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (unint64_t v19 = strtoull((const char *)[v18 UTF8String], 0, 0),
                      v19 < [(ICQUILegacyPurchaseFlowManager *)v31 requiredStorageThreshold]))
                {
                  [v16 setEnabled:0];
                  if ([v16 isSelected])
                  {
                    id v20 = [v16 attributes];
                    uint64_t v21 = [v20 objectForKeyedSubscript:@"radioGroup"];

                    [v16 setSelected:0];
                    int v8 = (void *)v21;
                  }
                }
                else
                {
                  v22 = [v16 attributes];
                  id v23 = [v22 objectForKeyedSubscript:@"radioGroup"];
                  int v24 = [v23 isEqualToString:v8];

                  if (v24)
                  {
                    uint64_t v25 = [v30 tableViewOM];
                    [v25 setSelectedRadioGroupRow:v16];

                    int v8 = 0;
                  }
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v13);
          }

          uint64_t v9 = v29 + 1;
        }
        while (v29 + 1 != v28);
        uint64_t v28 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v28);
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return MEMORY[0x270F55308](self, a2);
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  return self->_navController;
}

- (void)_popObjectModelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSMutableArray *)self->_objectModels count])
  {
    id v5 = [(NSMutableArray *)self->_objectModels lastObject];
    id v13 = [v5 defaultPages];

    [(NSMutableArray *)self->_objectModels removeLastObject];
    uint64_t v6 = [v13 count] - 1;
    if (v6 >= 0)
    {
      do
      {
        id v7 = [v13 objectAtIndex:v6];
        int v8 = [(UINavigationController *)self->_navController topViewController];

        if (v8 == v7)
        {
          if (v6) {
            BOOL v9 = 0;
          }
          else {
            BOOL v9 = v3;
          }
          id v10 = [(UINavigationController *)self->_navController popViewControllerAnimated:v9];
        }
      }
      while (v6-- > 0);
    }
  }
  else
  {
    uint64_t v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICQUILegacyPurchaseFlowManager _popObjectModelAnimated:]();
    }
  }
}

- (void)objectModelPressedBack:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[ICQUILegacyPurchaseFlowManager objectModelPressedBack:]";
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v6 = [(UINavigationController *)self->_navController topViewController];
  id v7 = [(UINavigationController *)self->_navController popViewControllerAnimated:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    if (v8)
    {
      BOOL v9 = [v4 defaultPages];
      int v10 = [v9 containsObject:v8];

      if (v10) {
        [(NSMutableArray *)self->_objectModels removeLastObject];
      }
    }
  }
  else
  {
    id v8 = 0;
  }
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315650;
    int v24 = "-[ICQUILegacyPurchaseFlowManager objectModel:pressedButton:attributes:]";
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "%s called with element name: %@, attributes: %@", (uint8_t *)&v23, 0x20u);
  }

  uint64_t v12 = [v10 objectForKeyedSubscript:@"ams_followup"];
  if ([v12 isEqualToString:@"clear"]) {
    [(ICQUILegacyPurchaseFlowManager *)self _clearRetailFollowUpItem];
  }
  if ([v9 isEqualToString:@"cancel"])
  {
    uint64_t v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "Purchase flow cancelled!", (uint8_t *)&v23, 2u);
    }

    [(ICQUILegacyPurchaseFlowManager *)self _didCompletePurchaseFlowWithStatusCode:2];
  }
  else if ([v9 isEqualToString:@"buy"])
  {
    uint64_t v14 = [v8 defaultPages];
    __int16 v15 = [v14 lastObject];
    id v16 = [v15 navTitle];

    [v8 startNavigationBarSpinnerWithTitle:v16];
    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    v18 = [v8 defaultPages];
    unint64_t v19 = [v18 lastObject];
    [v19 populatePostbackDictionary:v17];

    id v20 = [v17 objectForKey:@"quota"];
    if (!v20)
    {
      uint64_t v21 = [v10 objectForKeyedSubscript:@"id"];
      int v22 = [v21 isEqualToString:@"quota"];

      if (v22)
      {
        id v20 = [v10 objectForKeyedSubscript:@"value"];
      }
      else
      {
        id v20 = 0;
      }
    }
    [(ICQUILegacyPurchaseFlowManager *)self makeBuyRequest:v20];
  }
  else if ([v9 isEqualToString:@"pop"])
  {
    [(ICQUILegacyPurchaseFlowManager *)self _popObjectModelAnimated:1];
  }
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, uint64_t, void))a6;
  uint64_t v14 = _ICQGetLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v30 = "-[ICQUILegacyPurchaseFlowManager objectModel:pressedLink:httpMethod:completion:]";
    __int16 v31 = 2112;
    id v32 = v11;
    _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "%s called with URL: %@", buf, 0x16u);
  }

  if ([(ICQUILegacyPurchaseFlowManager *)self _loadNativeURL:v11])
  {
    __int16 v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "Successfully handled native url/deep link URL.", buf, 2u);
    }

    v13[2](v13, 1, 0);
  }
  else
  {
    id v16 = [v12 lowercaseString];
    int v17 = [v16 isEqualToString:@"post"];

    if (v17)
    {
      v18 = [MEMORY[0x263EFF9A0] dictionary];
      unint64_t v19 = [v10 defaultPages];
      id v20 = [v19 lastObject];
      [v20 populatePostbackDictionary:v18];

      uint64_t v21 = [MEMORY[0x263F08AC0] dataWithPropertyList:v18 format:100 options:0 error:0];
    }
    else
    {
      uint64_t v21 = 0;
    }
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __80__ICQUILegacyPurchaseFlowManager_objectModel_pressedLink_httpMethod_completion___block_invoke;
    v23[3] = &unk_264923948;
    id v24 = v21;
    id v25 = v12;
    id v26 = self;
    id v28 = v13;
    id v27 = v11;
    id v22 = v21;
    [(ICQUILegacyPurchaseFlowManager *)self _fetchURLRequestWithURL:v27 completion:v23];
  }
}

void __80__ICQUILegacyPurchaseFlowManager_objectModel_pressedLink_httpMethod_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [v5 addValue:@" CastleSettings/1.0" forHTTPHeaderField:@"User-agent"];
    if (*(void *)(a1 + 32))
    {
      [v5 setHTTPMethod:*(void *)(a1 + 40)];
      [v5 setHTTPBody:*(void *)(a1 + 32)];
      [v5 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
      +[ICQUsageQuotaRequest addHeadersForPrimaryAccountToRequest:v5];
    }
    [*(id *)(a1 + 48) _beginURLOperationWithURLRequest:v5];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __80__ICQUILegacyPurchaseFlowManager_objectModel_pressedLink_httpMethod_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [*(id *)(a1 + 48) _didCompletePurchaseFlowWithStatusCode:3];
  }
}

- (void)makeBuyRequestWithParams:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _Block_copy(a4);
  id flowCompletion = self->_flowCompletion;
  self->_id flowCompletion = v7;

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v16 = (void *)MEMORY[0x263F08BD0];
        int v17 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, (void)v22);
        v18 = [v16 queryItemWithName:v15 value:v17];
        [v9 addObject:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  id v19 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v19 setQueryItems:v9];
  id v20 = [v19 query];

  if (v20)
  {
    uint64_t v21 = [v19 query];
    [(ICQUILegacyPurchaseFlowManager *)self makeBuyRequest:v21];
  }
  else
  {
    uint64_t v21 = _ICQGetLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ICQUILegacyPurchaseFlowManager makeBuyRequestWithParams:completion:]();
    }
  }
}

- (void)makeBuyRequest:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v35 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Performing AMSPurchase request with buyParams: %@", buf, 0xCu);
  }

  id v6 = objc_alloc(MEMORY[0x263F27E38]);
  id v7 = [MEMORY[0x263F27B28] quotaBag];
  id v8 = (void *)[v6 initWithBag:v7];

  [v8 setDelegate:self];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F27E30]) initWithConfiguration:v8];
  id v10 = objc_alloc(MEMORY[0x263F27E28]);
  uint64_t v11 = [MEMORY[0x263F27B80] buyParamsWithString:v4];
  uint64_t v12 = (void *)[v10 initWithPurchaseType:0 buyParams:v11];

  [v12 setUserInitiated:1];
  [v12 setAdditionalHeaders:&unk_26E01F2D0];
  id v32 = @"mtTopic";
  uint64_t v33 = @"xp_its_main";
  uint64_t v13 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  [v12 setMetricsOverlay:v13];

  uint64_t v14 = [(ICQUILegacyPurchaseFlowManager *)self _presentationContext];
  uint64_t v15 = [v14 view];
  id v16 = [v15 window];
  int v17 = [v16 windowScene];
  v18 = [v17 _sceneIdentifier];
  [v12 setPresentingSceneIdentifier:v18];

  id v19 = _ICQGetLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v12 presentingSceneIdentifier];
    *(_DWORD *)buf = 138412290;
    long long v35 = v20;
    _os_log_impl(&dword_22C821000, v19, OS_LOG_TYPE_DEFAULT, "Setting sceneIdentifier: %@ to AMSPurchase.", buf, 0xCu);
  }
  uint64_t v21 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  if (objc_msgSend(v21, "ams_isActiveAccountCombined")) {
    objc_msgSend(v21, "ams_activeiTunesAccount");
  }
  else {
  long long v22 = objc_msgSend(v21, "ams_activeiCloudAccount");
  }
  [v12 setAccount:v22];

  long long v23 = [MEMORY[0x263F27E08] currentProcess];
  long long v24 = [NSString stringWithFormat:@"CastleSettings/1.0"];
  [v23 setUserAgentSuffix:v24];

  if (self->_presentingSceneBundleIdentifier)
  {
    long long v25 = _ICQGetLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      presentingSceneBundleIdentifier = self->_presentingSceneBundleIdentifier;
      *(_DWORD *)buf = 138412290;
      long long v35 = presentingSceneBundleIdentifier;
      _os_log_impl(&dword_22C821000, v25, OS_LOG_TYPE_DEFAULT, "Setting app bundleID: %@ to AMSPurchase.", buf, 0xCu);
    }

    [v23 setProxyAppBundleID:self->_presentingSceneBundleIdentifier];
  }
  [v12 setClientInfo:v23];
  __int16 v31 = v12;
  uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
  id v28 = [v9 enquePurchases:v27];

  objc_initWeak((id *)buf, self);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke;
  v29[3] = &unk_264923970;
  objc_copyWeak(&v30, (id *)buf);
  v29[4] = self;
  [v28 addFinishBlock:v29];
  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

void __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (!WeakRetained)
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_cold_1(a1, v7);
    }
    goto LABEL_7;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_121;
  block[3] = &unk_264921C80;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
  if (v4)
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_cold_2();
    }
LABEL_7:

    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = 3;
LABEL_8:
    [v8 _didCompletePurchaseFlowWithStatusCode:v9];
    goto LABEL_9;
  }
  int v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
  uint64_t v11 = _ICQGetLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "AMSPurchase for upgrade completed successfully. Dismissing the flow.", buf, 2u);
    }

    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "AMSPurchase for downgrade completed successfully. Navigating back to previous page.", buf, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_122;
  v14[3] = &unk_264921C80;
  v14[4] = *(void *)(a1 + 32);
  uint64_t v13 = (void *)MEMORY[0x263EF83A0];
  dispatch_async(MEMORY[0x263EF83A0], v14);

LABEL_9:
}

void __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_121(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 32) lastObject];
  [v1 stopNavigationBarSpinner];
}

uint64_t __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_122(uint64_t a1)
{
  return [*(id *)(a1 + 32) _popObjectModelAnimated:1];
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

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
}

- (void)_handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "We've been asked to handle Authenticate request. Attempting silent authentication.", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ICQUILegacyPurchaseFlowManager__handleAuthenticateRequest_completion___block_invoke;
  block[3] = &unk_2649224C0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __72__ICQUILegacyPurchaseFlowManager__handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F27FC0]);
  BOOL v3 = [*(id *)(a1 + 32) account];
  id v4 = [*(id *)(a1 + 40) _presentationContext];
  id v5 = [*(id *)(a1 + 32) options];
  id v6 = (void *)[v2 initWithAccount:v3 presentingViewController:v4 options:v5];

  id v7 = [v6 performAuthentication];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__ICQUILegacyPurchaseFlowManager__handleAuthenticateRequest_completion___block_invoke_2;
  v9[3] = &unk_264923998;
  id v8 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  id v10 = v8;
  [v7 addFinishBlock:v9];
}

void __72__ICQUILegacyPurchaseFlowManager__handleAuthenticateRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = _ICQGetLogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __72__ICQUILegacyPurchaseFlowManager__handleAuthenticateRequest_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Successfully finished silent authentication.", v12, 2u);
  }

  uint64_t v9 = [v6 account];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v9;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_handleDialogRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "We've been asked to handle AMS dialog request.", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__ICQUILegacyPurchaseFlowManager__handleDialogRequest_completion___block_invoke;
  block[3] = &unk_2649224C0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __66__ICQUILegacyPurchaseFlowManager__handleDialogRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F27FB8]);
  uint64_t v18 = a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) _presentationContext];
  id v19 = (void *)[v2 initWithRequest:v3 presentingViewController:v4];

  uint64_t v34 = 0;
  long long v35 = (id *)&v34;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__10;
  long long v38 = __Block_byref_object_dispose__10;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = (id *)&v28;
  uint64_t v30 = 0x3032000000;
  __int16 v31 = __Block_byref_object_copy__10;
  id v32 = __Block_byref_object_dispose__10;
  id v33 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [*(id *)(a1 + 32) buttonActions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v10 = [v9 userInfo];
        uint64_t v11 = [v10 objectForKeyedSubscript:@"AMSDialogRequestUserInfoKeyServerPayload"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = [v11 objectForKey:@"buyParams"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_storeStrong(v29 + 5, v12);
            objc_storeStrong(v35 + 5, v9);
            uint64_t v13 = _ICQGetLogSystem();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              id v14 = v35[5];
              id v15 = v29[5];
              *(_DWORD *)buf = 138412546;
              id v41 = v14;
              __int16 v42 = 2112;
              id v43 = v15;
              _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "It's a confirm downgrade action: %@, buyParams: %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v44 count:16];
    }
    while (v6);
  }

  id v16 = [v19 present];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __66__ICQUILegacyPurchaseFlowManager__handleDialogRequest_completion___block_invoke_133;
  v20[3] = &unk_2649239C0;
  long long v22 = &v34;
  long long v23 = &v28;
  int v17 = *(void **)(v18 + 48);
  v20[4] = *(void *)(v18 + 40);
  id v21 = v17;
  [v16 addFinishBlock:v20];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
}

void __66__ICQUILegacyPurchaseFlowManager__handleDialogRequest_completion___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier];
  id v8 = [v5 selectedActionIdentifier];
  int v9 = [v7 isEqualToString:v8];

  id v10 = _ICQGetLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "It's not a downgrade confirmation dialog or user chose to cancel.", (uint8_t *)&v18, 2u);
    }
    goto LABEL_10;
  }
  if (v11)
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v18 = 138412290;
    uint64_t v19 = v12;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "User confirmed downgrade. Let's begin buy request with buyParams: %@", (uint8_t *)&v18, 0xCu);
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __66__ICQUILegacyPurchaseFlowManager__handleDialogRequest_completion___block_invoke_133_cold_1();
    }
LABEL_10:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "makeBuyRequest:");
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.iCloudQuota.LegacyPurchase" code:1 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_11:
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;

  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  int v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = 0;
}

- (void)_handleEngagementRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "We were asked to handle an engagement request.", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__ICQUILegacyPurchaseFlowManager__handleEngagementRequest_completion___block_invoke;
  block[3] = &unk_2649224C0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __70__ICQUILegacyPurchaseFlowManager__handleEngagementRequest_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F27FE8]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x263F27B28] quotaBag];
  id v5 = [*(id *)(a1 + 40) _presentationContext];
  id v8 = (id)[v2 initWithRequest:v3 bag:v4 presentingViewController:v5];

  id v6 = [MEMORY[0x263F27E08] currentProcess];
  [v6 setUserAgentSuffix:@"CastleSettings/1.0"];
  [v8 setClientInfo:v6];
  id v7 = [v8 presentEngagement];
  [v7 addFinishBlock:*(void *)(a1 + 48)];
}

- (void)_clearRetailFollowUpItem
{
  id v2 = dispatch_get_global_queue(0, 0);
  dispatch_async(v2, &__block_literal_global_18);
}

void __58__ICQUILegacyPurchaseFlowManager__clearRetailFollowUpItem__block_invoke()
{
  v0 = _ICQGetLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_22C821000, v0, OS_LOG_TYPE_DEFAULT, "Clearing iCloud follow up item.", v8, 2u);
  }

  id v1 = AMSGenerateLogCorrelationKey();
  id v2 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  uint64_t v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  id v4 = (void *)MEMORY[0x263F27B28];
  id v5 = [MEMORY[0x263F27C00] bagSubProfile];
  id v6 = [MEMORY[0x263F27C00] bagSubProfileVersion];
  id v7 = [v4 bagForProfile:v5 profileVersion:v6];

  [MEMORY[0x263F27BF8] removeDeviceOfferWithIdentifier:*MEMORY[0x263F27830] account:v3 bag:v7 logKey:v1];
}

- (BOOL)_loadNativeURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheme];
  int v5 = [v4 isEqualToString:@"ams-ui"];

  if (v5)
  {
    id v6 = [MEMORY[0x263F01880] defaultWorkspace];
    [v6 openSensitiveURL:v3 withOptions:0];
  }
  return v5;
}

- (void)_didCompletePurchaseFlowWithStatusCode:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v8 = a3;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Legacy purchase flow has been completed with error code: %ld", buf, 0xCu);
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke;
  v6[3] = &unk_264922628;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _dismissPurchaseFlow];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.iCloudQuota.LegacyPurchase" code:v2 userInfo:0];
      id v4 = _ICQGetLogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke_cold_3();
      }

      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
    }
    else
    {
      id v6 = _ICQGetLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke_cold_2();
      }

      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
    }
    uint64_t v7 = *(void *)(a1 + 32);
    int v5 = *(NSObject **)(v7 + 16);
    *(void *)(v7 + 16) = 0;
  }
  else
  {
    int v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke_cold_1();
    }
  }
}

- (void)_dismissPurchaseFlow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  [WeakRetained dismissViewControllerAnimated:1 completion:0];

  [(NSMutableArray *)self->_objectModels removeAllObjects];
  navController = self->_navController;
  self->_navController = 0;
}

- (unint64_t)requiredStorageThreshold
{
  return self->_requiredStorageThreshold;
}

- (void)setRequiredStorageThreshold:(unint64_t)a3
{
  self->_unint64_t requiredStorageThreshold = a3;
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_amsAccount, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong((id *)&self->_defaultAMSURLSession, 0);
  objc_storeStrong(&self->_flowCompletion, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

void __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  id v3 = @"mint-offers";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch url from AMS-Quota bag for key %@ with error: %@", (uint8_t *)&v2, 0x16u);
}

void __58__ICQUILegacyPurchaseFlowManager_beginFlowWithCompletion___block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4(&dword_22C821000, v0, v1, "AMSURLRequestEncoder failed to return request for URL: %@, with error: %@");
}

void __69__ICQUILegacyPurchaseFlowManager__fetchURLRequestWithURL_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "ams_iTunesAccountForAccount failed to return result with error: %@", v2, v3, v4, v5, v6);
}

void __67__ICQUILegacyPurchaseFlowManager__beginURLOperationWithURLRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4(&dword_22C821000, v0, v1, "Failed to complete AMS request: %@, with error: %@");
}

- (void)_beginRUIFlowWithAMSURLResult:.cold.1()
{
}

- (void)_beginRUIFlowWithAMSURLResult:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Pop + Replace requires at least 2 existing object models.", v2, v3, v4, v5, v6);
}

- (void)_beginRUIFlowWithAMSURLResult:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "RUIParser failed to parse AMSURLResult: %@", v2, v3, v4, v5, v6);
}

- (void)_popObjectModelAnimated:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "No object model found, can't pop view controller!", v2, v3, v4, v5, v6);
}

void __80__ICQUILegacyPurchaseFlowManager_objectModel_pressedLink_httpMethod_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4(&dword_22C821000, v0, v1, "AMSURLRequestEncoder failed to return request for URL: %@, with error: %@");
}

- (void)makeBuyRequestWithParams:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "Failed to form query for buyParams: %@", v2, v3, v4, v5, v6);
}

void __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  id v4 = v3;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "%@ object got destroyed.", v5, 0xCu);
}

void __49__ICQUILegacyPurchaseFlowManager_makeBuyRequest___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "AMS Purchase failed with error %@", v2, v3, v4, v5, v6);
}

void __72__ICQUILegacyPurchaseFlowManager__handleAuthenticateRequest_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "Failed to handle silent AMS Auth with error: %@", v2, v3, v4, v5, v6);
}

void __66__ICQUILegacyPurchaseFlowManager__handleDialogRequest_completion___block_invoke_133_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "No buy param exist. Can't initiate AMS Purchase.", v2, v3, v4, v5, v6);
}

void __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_22C821000, v0, OS_LOG_TYPE_DEBUG, "No flow completion provided!", v1, 2u);
}

void __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_22C821000, v0, OS_LOG_TYPE_DEBUG, "Calling flow completion w/ success.", v1, 2u);
}

void __73__ICQUILegacyPurchaseFlowManager__didCompletePurchaseFlowWithStatusCode___block_invoke_cold_3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_22C821000, v0, OS_LOG_TYPE_DEBUG, "Calling flow completion w/ error: %@", v1, 0xCu);
}

@end