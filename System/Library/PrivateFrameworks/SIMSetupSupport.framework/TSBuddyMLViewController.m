@interface TSBuddyMLViewController
- (BOOL)_isActionDismissToCancelFlow:(id)a3;
- (CTPlan)plan;
- (NSDictionary)postdata;
- (NSString)buddyMLURL;
- (RemoteUIController)remoteUIController;
- (TSBuddyMLViewController)initWithCTPlan:(id)a3 inBuddy:(BOOL)a4;
- (TSBuddyMLViewController)initWithCTPlan:(id)a3 websheetURL:(id)a4 postdata:(id)a5;
- (TSSIMSetupFlowDelegate)delegate;
- (void)_configureRUIController;
- (void)_handlePlanAddition:(id)a3;
- (void)_requestCipherText:(id)a3 completion:(id)a4;
- (void)_setUserInPurchaseFlow;
- (void)dealloc;
- (void)prepare:(id)a3;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)setBuddyMLURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPlan:(id)a3;
- (void)setPostdata:(id)a3;
- (void)setRemoteUIController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSBuddyMLViewController

- (TSBuddyMLViewController)initWithCTPlan:(id)a3 websheetURL:(id)a4 postdata:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TSBuddyMLViewController;
  v12 = [(TSBuddyMLViewController *)&v20 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_plan, a3);
    objc_storeStrong((id *)&v13->_buddyMLURL, a4);
    objc_storeStrong((id *)&v13->_postdata, a5);
    v13->_initialRequest = 1;
    v13->_isBootstrapAsserted = 0;
  }
  uint64_t v14 = objc_opt_new();
  objectModels = v13->_objectModels;
  v13->_objectModels = (NSMutableArray *)v14;

  id v16 = objc_alloc(MEMORY[0x263F02D30]);
  uint64_t v17 = [v16 initWithQueue:MEMORY[0x263EF83A0]];
  coreTelephonyClient = v13->_coreTelephonyClient;
  v13->_coreTelephonyClient = (CoreTelephonyClient *)v17;

  [(TSBuddyMLViewController *)v13 _setUserInPurchaseFlow];
  return v13;
}

- (TSBuddyMLViewController)initWithCTPlan:(id)a3 inBuddy:(BOOL)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TSBuddyMLViewController;
  v8 = [(TSBuddyMLViewController *)&v16 initWithNibName:0 bundle:0];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_plan, a3);
    v9->_inBuddy = a4;
    v9->_initialRequest = 1;
    v9->_isBootstrapAsserted = 0;
  }
  uint64_t v10 = objc_opt_new();
  objectModels = v9->_objectModels;
  v9->_objectModels = (NSMutableArray *)v10;

  id v12 = objc_alloc(MEMORY[0x263F02D30]);
  uint64_t v13 = [v12 initWithQueue:MEMORY[0x263EF83A0]];
  coreTelephonyClient = v9->_coreTelephonyClient;
  v9->_coreTelephonyClient = (CoreTelephonyClient *)v13;

  [(TSBuddyMLViewController *)v9 _setUserInPurchaseFlow];
  return v9;
}

- (void)dealloc
{
  if (self->_isBootstrapAsserted)
  {
    v3 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v3 deassertUserInPurchaseFlowWithForce:0 caller:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)TSBuddyMLViewController;
  [(TSBuddyMLViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  [(TSBuddyMLViewController *)self _configureRUIController];
  v3 = [NSURL URLWithString:self->_buddyMLURL];
  objc_super v4 = +[TSURLRequestFactory requestWithType:5 URL:v3 postdata:self->_postdata];

  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __38__TSBuddyMLViewController_viewDidLoad__block_invoke;
  id v9 = &unk_264827A70;
  uint64_t v10 = self;
  id v11 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], &v6);
  -[TSBuddyMLViewController setModalInPresentation:](self, "setModalInPresentation:", 1, v6, v7, v8, v9, v10);
}

void __38__TSBuddyMLViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteUIController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__TSBuddyMLViewController_viewDidLoad__block_invoke_2;
  v4[3] = &unk_2648287E8;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  [v2 loadRequest:v3 completion:v4];
}

void __38__TSBuddyMLViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __38__TSBuddyMLViewController_viewDidLoad__block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) setBuddyMLURL:0];
    uint64_t v6 = [*(id *)(a1 + 32) delegate];
    [v6 viewControllerDidComplete:*(void *)(a1 + 32)];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1033) = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  remoteUIController = self->_remoteUIController;
  id v4 = [(TSBuddyMLViewController *)self navigationController];
  [(RemoteUIController *)remoteUIController setHostViewController:v4];
}

- (void)prepare:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[TSCoreTelephonyClientCache sharedInstance];
  plan = self->_plan;
  BOOL inBuddy = self->_inBuddy;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__TSBuddyMLViewController_prepare___block_invoke;
  v9[3] = &unk_264828418;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v5 getWebsheetInfoForPlan:plan inBuddy:inBuddy completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __35__TSBuddyMLViewController_prepare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 132, a2);
    objc_storeStrong(v9 + 133, a3);
    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __35__TSBuddyMLViewController_prepare___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v10();
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
}

- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [(NSMutableArray *)self->_objectModels indexOfObject:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2080;
      id v11 = "-[TSBuddyMLViewController remoteUIController:didRemoveObjectModel:]";
      _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "RemoteUI removed an object model that is not on stack: %@ @%s", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    [(NSMutableArray *)self->_objectModels removeObjectAtIndex:v6];
  }
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v8 = a4;
  if (a5)
  {
    unint64_t v9 = *a5;
    if (*a5 == 1)
    {
      __int16 v10 = _TSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v76 = "-[TSBuddyMLViewController remoteUIController:didReceiveObjectModel:actionSignal:]";
        _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, "ActionSignalDismiss!!! @%s", buf, 0xCu);
      }

      id v11 = [v8 clientInfo];
      BOOL v12 = [(TSBuddyMLViewController *)self _isActionDismissToCancelFlow:v11];

      if (v12)
      {
        uint64_t v13 = [(TSBuddyMLViewController *)self delegate];
        [v13 userDidTapCancel];
      }
      unint64_t v9 = *a5;
    }
    if (v9 == 2)
    {
      uint64_t v14 = _TSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v76 = "-[TSBuddyMLViewController remoteUIController:didReceiveObjectModel:actionSignal:]";
        _os_log_impl(&dword_227A17000, v14, OS_LOG_TYPE_DEFAULT, "ActionSignalPush!!! @%s", buf, 0xCu);
      }
    }
    uint64_t v15 = [(RemoteUIController *)self->_remoteUIController displayedPages];
    uint64_t v16 = [v15 count];

    if (!v16)
    {
      if (*a5 == 4)
      {
        uint64_t v17 = _TSLogDomain();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[TSBuddyMLViewController remoteUIController:didReceiveObjectModel:actionSignal:](v17, v26, v27, v28, v29, v30, v31, v32);
        }
        unint64_t v25 = 0;
      }
      else
      {
        if (*a5 != 3) {
          goto LABEL_22;
        }
        uint64_t v17 = _TSLogDomain();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[TSBuddyMLViewController remoteUIController:didReceiveObjectModel:actionSignal:](v17, v18, v19, v20, v21, v22, v23, v24);
        }
        unint64_t v25 = 2;
      }

      *a5 = v25;
    }
  }
LABEL_22:
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = [v8 allPages];
  uint64_t v53 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v53)
  {
    uint64_t v52 = *(void *)v69;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v69 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v55 = v33;
        v34 = [*(id *)(*((void *)&v68 + 1) + 8 * v33) tableViewOM];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        v54 = v34;
        id v56 = [v34 sections];
        uint64_t v58 = [v56 countByEnumeratingWithState:&v64 objects:v73 count:16];
        if (v58)
        {
          uint64_t v57 = *(void *)v65;
          do
          {
            uint64_t v35 = 0;
            do
            {
              if (*(void *)v65 != v57) {
                objc_enumerationMutation(v56);
              }
              uint64_t v59 = v35;
              v36 = *(void **)(*((void *)&v64 + 1) + 8 * v35);
              long long v60 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              v37 = [v36 rows];
              uint64_t v38 = [v37 countByEnumeratingWithState:&v60 objects:v72 count:16];
              if (v38)
              {
                uint64_t v39 = v38;
                uint64_t v40 = *(void *)v61;
                do
                {
                  for (uint64_t i = 0; i != v39; ++i)
                  {
                    if (*(void *)v61 != v40) {
                      objc_enumerationMutation(v37);
                    }
                    v42 = *(void **)(*((void *)&v60 + 1) + 8 * i);
                    v43 = [v42 attributes];
                    v44 = [v43 objectForKeyedSubscript:@"secure"];
                    int v45 = [v44 BOOLValue];

                    if (v45)
                    {
                      v46 = [v42 attributes];
                      v47 = [v46 objectForKey:@"id"];
                      idNeedsEncryption = self->_idNeedsEncryption;
                      self->_idNeedsEncryption = v47;
                    }
                  }
                  uint64_t v39 = [v37 countByEnumeratingWithState:&v60 objects:v72 count:16];
                }
                while (v39);
              }

              uint64_t v35 = v59 + 1;
            }
            while (v59 + 1 != v58);
            uint64_t v58 = [v56 countByEnumeratingWithState:&v64 objects:v73 count:16];
          }
          while (v58);
        }

        uint64_t v33 = v55 + 1;
      }
      while (v55 + 1 != v53);
      uint64_t v53 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
    }
    while (v53);
  }

  v49 = [v8 clientInfo];
  [(TSBuddyMLViewController *)self _handlePlanAddition:v49];
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, uint64_t, void))a6;
  uint64_t v14 = [(NSMutableArray *)self->_objectModels lastObject];
  id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v14 populatePostbackDictionary:v15];
  uint64_t v16 = [v15 objectForKey:self->_idNeedsEncryption];
  [v11 setValue:@"iOS Device Activation" forHTTPHeaderField:@"User-Agent"];
  if (self->_initialRequest)
  {
    uint64_t v17 = _TSLogDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v25 = "-[TSBuddyMLViewController remoteUIController:shouldLoadRequest:redirectResponse:withCompletionHandler:]";
      _os_log_impl(&dword_227A17000, v17, OS_LOG_TYPE_DEFAULT, "Set type as json for initial request @%s", buf, 0xCu);
    }

    [v11 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    v13[2](v13, 1, 0);
  }
  else if (v16)
  {
    objc_initWeak((id *)buf, self);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __103__TSBuddyMLViewController_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke;
    v19[3] = &unk_264828810;
    objc_copyWeak(&v23, (id *)buf);
    uint64_t v22 = v13;
    id v20 = v15;
    id v21 = v11;
    [(TSBuddyMLViewController *)self _requestCipherText:v16 completion:v19];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v18 = _TSLogDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v25 = "-[TSBuddyMLViewController remoteUIController:shouldLoadRequest:redirectResponse:withCompletionHandler:]";
      _os_log_impl(&dword_227A17000, v18, OS_LOG_TYPE_DEFAULT, "No encryption needed @%s", buf, 0xCu);
    }

    v13[2](v13, 1, 0);
  }
}

void __103__TSBuddyMLViewController_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    uint64_t v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __103__TSBuddyMLViewController_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_9;
  }
  if (!v3)
  {
    uint64_t v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __103__TSBuddyMLViewController_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke_cold_2(v6, v14, v15, v16, v17, v18, v19, v20);
    }
LABEL_9:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  [*(id *)(a1 + 32) setObject:v3 forKey:WeakRetained[123]];
  id v5 = [MEMORY[0x263F08AC0] dataWithPropertyList:*(void *)(a1 + 32) format:100 options:0 error:0];
  [*(id *)(a1 + 40) setHTTPBody:v5];
  [*(id *)(a1 + 40) setTimeoutInterval:180.0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_10:
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    uint64_t v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v24 = v9;
      __int16 v25 = 2080;
      uint64_t v26 = "-[TSBuddyMLViewController remoteUIController:didFinishLoadWithError:forRequest:]";
      _os_log_impl(&dword_227A17000, v11, OS_LOG_TYPE_DEFAULT, "RemoteUI didFinishLoadWithError: %{public}@ @%s", buf, 0x16u);
    }

    if ([v9 code] == -1001)
    {
      uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v20 = [v12 localizedStringForKey:@"ERROR_TRANSFER_ITEM_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

      uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v14 = [v13 localizedStringForKey:@"CARRRIER_SETUP_TIMEOUT_MESSAGE" value:&stru_26DBE8E78 table:@"Localizable"];

      uint64_t v15 = [MEMORY[0x263F82418] alertControllerWithTitle:v20 message:v14 preferredStyle:1];
      objc_initWeak((id *)buf, self);
      uint64_t v16 = (void *)MEMORY[0x263F82400];
      uint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v18 = [v17 localizedStringForKey:@"ERROR_OK" value:&stru_26DBE8E78 table:@"Localizable"];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __80__TSBuddyMLViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke;
      v21[3] = &unk_264827A48;
      objc_copyWeak(&v22, (id *)buf);
      uint64_t v19 = [v16 actionWithTitle:v18 style:1 handler:v21];
      [v15 addAction:v19];

      [(TSBuddyMLViewController *)self presentViewController:v15 animated:1 completion:0];
      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __80__TSBuddyMLViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[TSBuddyMLViewController remoteUIController:didFinishLoadWithError:forRequest:]_block_invoke";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "Complete viewController to allow user continue flow @%s", (uint8_t *)&v7, 0xCu);
  }

  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained delegate];
  id v6 = objc_loadWeakRetained(v3);
  [v5 viewControllerDidComplete:v6];
}

- (void)_configureRUIController
{
  if (!self->_remoteUIController)
  {
    id v3 = (RemoteUIController *)objc_alloc_init(MEMORY[0x263F637E8]);
    remoteUIController = self->_remoteUIController;
    self->_remoteUIController = v3;

    [(RemoteUIController *)self->_remoteUIController setDelegate:self];
    id v5 = self->_remoteUIController;
    id v6 = [MEMORY[0x263F637D0] setupAssistantStyle];
    [(RemoteUIController *)v5 setStyle:v6];

    int v7 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
    objc_msgSend(v7, "set_sourceApplicationSecondaryIdentifier:", @"com.apple.CommCenter.CellularPlanProvisioning");
    [(RemoteUIController *)self->_remoteUIController setSessionConfiguration:v7];
    objc_initWeak(&location, self);
    id v8 = self->_remoteUIController;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__TSBuddyMLViewController__configureRUIController__block_invoke;
    v9[3] = &unk_264828838;
    objc_copyWeak(&v10, &location);
    [(RemoteUIController *)v8 setHandlerForElementName:@"cancel" handler:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __50__TSBuddyMLViewController__configureRUIController__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[TSBuddyMLViewController _configureRUIController]_block_invoke";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "User canceled flow @%s", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained delegate];
  [v4 userDidTapCancel];
}

- (void)_handlePlanAddition:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"eid"];
  uint64_t v40 = [v4 objectForKeyedSubscript:@"iccid"];
  uint64_t v39 = [v4 objectForKeyedSubscript:@"phoneNumber"];
  id v6 = [v4 objectForKeyedSubscript:@"mcc"];
  mcc = self->_mcc;
  self->_mcc = v6;

  id v8 = [v4 objectForKeyedSubscript:@"mnc"];
  mnc = self->_mnc;
  self->_mnc = v8;

  id v10 = [v4 objectForKeyedSubscript:@"gid1"];
  gid1 = self->_gid1;
  self->_gid1 = v10;

  uint64_t v12 = [v4 objectForKeyedSubscript:@"gid2"];
  gid2 = self->_gid2;
  self->_gid2 = v12;

  uint64_t v38 = (void *)v5;
  if (v5 && v40 && v39)
  {
    id v34 = objc_alloc(MEMORY[0x263F02C40]);
    v36 = [v4 objectForKeyedSubscript:@"sourceIccid"];
    uint64_t v35 = [v4 objectForKeyedSubscript:@"UnusableIccid"];
    uint64_t v33 = [v4 objectForKeyedSubscript:@"mcc"];
    v37 = [v4 objectForKeyedSubscript:@"mnc"];
    uint64_t v14 = [v4 objectForKeyedSubscript:@"gid1"];
    uint64_t v32 = [v4 objectForKeyedSubscript:@"gid2"];
    uint64_t v31 = [v4 objectForKeyedSubscript:@"smdpAddress"];
    uint64_t v15 = [v4 objectForKeyedSubscript:@"useDS"];
    char v16 = [v15 BOOLValue];
    uint64_t v17 = [v4 objectForKeyedSubscript:@"isESim"];
    char v18 = [v17 BOOLValue];
    uint64_t v19 = [v4 objectForKeyedSubscript:@"flowType"];
    BYTE1(v30) = v18;
    LOBYTE(v30) = v16;
    uint64_t v20 = objc_msgSend(v34, "initWithDetails:installIccid:sourceIccid:unusableIccid:phoneNumber:mcc:mnc:gid1:gid2:smdp:useDS:esim:flowType:", v5, v40, v36, v35, v39, v33, v37, v14, v32, v31, v30, v19);

    if (v20)
    {
      id v21 = _TSLogDomain();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v42 = "-[TSBuddyMLViewController _handlePlanAddition:]";
        _os_log_impl(&dword_227A17000, v21, OS_LOG_TYPE_DEFAULT, "Adding cellular plan... @%s", buf, 0xCu);
      }

      [(CoreTelephonyClient *)self->_coreTelephonyClient addPlanWith:v20 completionHandler:&__block_literal_global_16];
      id v22 = [(TSBuddyMLViewController *)self delegate];
      [v22 viewControllerDidComplete:self];
    }
  }
  else
  {
    uint64_t v20 = _TSLogDomain();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[TSBuddyMLViewController _handlePlanAddition:](v20, v23, v24, v25, v26, v27, v28, v29);
    }
  }
}

void __47__TSBuddyMLViewController__handlePlanAddition___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (a2 != 2)
  {
    uint64_t v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __47__TSBuddyMLViewController__handlePlanAddition___block_invoke_cold_1();
    }
  }
}

- (void)_requestCipherText:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TSLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[TSBuddyMLViewController _requestCipherText:completion:]((uint64_t)self, v8);
  }

  objc_initWeak(&location, self);
  coreTelephonyClient = self->_coreTelephonyClient;
  mcc = self->_mcc;
  mnc = self->_mnc;
  gid1 = self->_gid1;
  gid2 = self->_gid2;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__TSBuddyMLViewController__requestCipherText_completion___block_invoke;
  v15[3] = &unk_264828880;
  objc_copyWeak(&v17, &location);
  id v14 = v7;
  id v16 = v14;
  [(CoreTelephonyClient *)coreTelephonyClient encryptDataWithCarrierIdentifiers:mcc mnc:mnc gid1:gid1 gid2:gid2 data:v6 completion:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __57__TSBuddyMLViewController__requestCipherText_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = _TSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __57__TSBuddyMLViewController__requestCipherText_completion___block_invoke_cold_1();
      }
    }
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

- (BOOL)_isActionDismissToCancelFlow:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"eid"];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)_setUserInPurchaseFlow
{
  if (+[TSUtilities isOnBootstrap])
  {
    self->_isBootstrapAsserted = 1;
    id v3 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v3 assertUserInPurchaseFlowStartOver:0 caller:self];
  }
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CTPlan)plan
{
  return (CTPlan *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setPlan:(id)a3
{
}

- (NSString)buddyMLURL
{
  return (NSString *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setBuddyMLURL:(id)a3
{
}

- (NSDictionary)postdata
{
  return (NSDictionary *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setPostdata:(id)a3
{
}

- (RemoteUIController)remoteUIController
{
  return (RemoteUIController *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setRemoteUIController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_postdata, 0);
  objc_storeStrong((id *)&self->_buddyMLURL, 0);
  objc_storeStrong((id *)&self->_plan, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gid2, 0);
  objc_storeStrong((id *)&self->_gid1, 0);
  objc_storeStrong((id *)&self->_mnc, 0);
  objc_storeStrong((id *)&self->_mcc, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_idNeedsEncryption, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
}

void __38__TSBuddyMLViewController_viewDidLoad__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]RemoteUI loadRequest error %@ @%s", v2, v3, v4, v5, v6);
}

void __35__TSBuddyMLViewController_prepare___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)remoteUIController:(uint64_t)a3 didReceiveObjectModel:(uint64_t)a4 actionSignal:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)remoteUIController:(uint64_t)a3 didReceiveObjectModel:(uint64_t)a4 actionSignal:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __103__TSBuddyMLViewController_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __103__TSBuddyMLViewController_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handlePlanAddition:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47__TSBuddyMLViewController__handlePlanAddition___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Failed to add cellular plan: %@ @%s", v2, v3, v4, v5, v6);
}

- (void)_requestCipherText:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 1000);
  uint64_t v3 = *(void *)(a1 + 1008);
  int v4 = 138412802;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2080;
  uint64_t v9 = "-[TSBuddyMLViewController _requestCipherText:completion:]";
  _os_log_debug_impl(&dword_227A17000, a2, OS_LOG_TYPE_DEBUG, "[Db] IMSI %@/%@ @%s", (uint8_t *)&v4, 0x20u);
}

void __57__TSBuddyMLViewController__requestCipherText_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
}

@end