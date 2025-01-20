@interface NDOAppleCareAMSUIViewController
- (BOOL)initialLoadCompleted;
- (BOOL)isMultipleDevicePurchaseCall;
- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4;
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (NDOAppleCareAMSUIViewController)initWithWarranty:(id)a3 serialNumber:(id)a4 source:(id)a5 deeplinkParams:(id)a6;
- (NDOAppleCareAMSUIViewController)initWithWarranty:(id)a3 serialNumber:(id)a4 source:(id)a5 url:(id)a6 purchaseBody:(id)a7 deeplinkParams:(id)a8;
- (NDOAppleCareAMSUIViewPresenterProtocol)presenter;
- (NDOWarranty)warranty;
- (NSDictionary)purchaseAPIBody;
- (NSString)deeplinkParams;
- (NSString)serialNumber;
- (NSString)source;
- (NSString)ulSalesURL;
- (UINavigationController)navController;
- (id)_initWithWarranty:(id)a3 serialNumber:(id)a4 source:(id)a5 isMultiCall:(BOOL)a6 url:(id)a7 deeplinkParams:(id)a8 purchaseBody:(id)a9;
- (unint64_t)supportedInterfaceOrientations;
- (void)cancelTapped:(id)a3;
- (void)loadAMSUIView;
- (void)loadView;
- (void)setDeeplinkParams:(id)a3;
- (void)setInitialLoadCompleted:(BOOL)a3;
- (void)setIsMultipleDevicePurchaseCall:(BOOL)a3;
- (void)setNavController:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setPurchaseAPIBody:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSource:(id)a3;
- (void)setUlSalesURL:(id)a3;
- (void)setWarranty:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NDOAppleCareAMSUIViewController

- (NDOAppleCareAMSUIViewController)initWithWarranty:(id)a3 serialNumber:(id)a4 source:(id)a5 deeplinkParams:(id)a6
{
  return (NDOAppleCareAMSUIViewController *)[(NDOAppleCareAMSUIViewController *)self _initWithWarranty:a3 serialNumber:a4 source:a5 isMultiCall:0 url:0 deeplinkParams:a6 purchaseBody:0];
}

- (NDOAppleCareAMSUIViewController)initWithWarranty:(id)a3 serialNumber:(id)a4 source:(id)a5 url:(id)a6 purchaseBody:(id)a7 deeplinkParams:(id)a8
{
  return (NDOAppleCareAMSUIViewController *)[(NDOAppleCareAMSUIViewController *)self _initWithWarranty:a3 serialNumber:a4 source:a5 isMultiCall:1 url:a6 deeplinkParams:a8 purchaseBody:a7];
}

- (id)_initWithWarranty:(id)a3 serialNumber:(id)a4 source:(id)a5 isMultiCall:(BOOL)a6 url:(id)a7 deeplinkParams:(id)a8 purchaseBody:(id)a9
{
  BOOL v30 = a6;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v18 = objc_opt_new();
  v19 = objc_msgSend(v18, "aida_accountForPrimaryiCloudAccount");

  v20 = (void *)MEMORY[0x263F27B40];
  v21 = [MEMORY[0x263F27ED8] bagKeySet];
  v22 = [MEMORY[0x263F27ED8] bagSubProfile];
  v23 = [MEMORY[0x263F27ED8] bagSubProfileVersion];
  [v20 registerBagKeySet:v21 forProfile:v22 profileVersion:v23];

  v24 = v13;
  v25 = [MEMORY[0x263F27B28] bagForProfile:@"AppleCare" profileVersion:@"1"];
  v33.receiver = self;
  v33.super_class = (Class)NDOAppleCareAMSUIViewController;
  v26 = [(AMSUIWebViewController *)&v33 initWithBag:v25 account:v19 clientInfo:0];
  v27 = v26;
  if (v26)
  {
    [(NDOAppleCareAMSUIViewController *)v26 setWarranty:v31];
    [(NDOAppleCareAMSUIViewController *)v27 setSerialNumber:v24];
    [(NDOAppleCareAMSUIViewController *)v27 setSource:v14];
    [(NDOAppleCareAMSUIViewController *)v27 setUlSalesURL:v15];
    [(NDOAppleCareAMSUIViewController *)v27 setDeeplinkParams:v16];
    [(NDOAppleCareAMSUIViewController *)v27 setPurchaseAPIBody:v17];
    [(NDOAppleCareAMSUIViewController *)v27 setIsMultipleDevicePurchaseCall:v30];
    [(NDOAppleCareAMSUIViewController *)v27 setModalPresentationStyle:3];
    [(AMSUIWebViewController *)v27 setDelegate:v27];
    if (objc_opt_respondsToSelector()) {
      [(AMSUIWebViewController *)v27 setLoadUsingWebKit:1];
    }
    v28 = _NDOLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136448002;
      v35 = "-[NDOAppleCareAMSUIViewController _initWithWarranty:serialNumber:source:isMultiCall:url:deeplinkParams:purchaseBody:]";
      __int16 v36 = 2112;
      v37 = v24;
      __int16 v38 = 2112;
      id v39 = v14;
      __int16 v40 = 2112;
      id v41 = v15;
      __int16 v42 = 2112;
      id v43 = v16;
      __int16 v44 = 2112;
      id v45 = v17;
      __int16 v46 = 1024;
      BOOL v47 = v30;
      __int16 v48 = 2112;
      uint64_t v49 = 0;
      _os_log_debug_impl(&dword_238845000, v28, OS_LOG_TYPE_DEBUG, "%{public}s: serialNumber: %@, source: %@, url: %@, deeplinkParams: %@, body: %@, isMultiCall: %d, clientInfo: %@", buf, 0x4Eu);
    }
  }
  return v27;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)NDOAppleCareAMSUIViewController;
  [(AMSUIWebViewController *)&v5 loadView];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelTapped_];
  v4 = [(NDOAppleCareAMSUIViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NDOAppleCareAMSUIViewController;
  [(NDOAppleCareAMSUIViewController *)&v3 viewDidLoad];
  [(NDOAppleCareAMSUIViewController *)self loadAMSUIView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NDOAppleCareAMSUIViewController;
  [(AMSUIWebViewController *)&v7 viewWillAppear:a3];
  v4 = [(NDOAppleCareAMSUIViewController *)self navigationController];
  [v4 setNavigationBarHidden:0];

  objc_super v5 = [(NDOAppleCareAMSUIViewController *)self navigationItem];
  id v6 = objc_alloc_init(MEMORY[0x263F829A8]);
  [v6 configureWithTransparentBackground];
  [v5 setScrollEdgeAppearance:v6];
  [v5 setStandardAppearance:v6];
  [v5 setCompactAppearance:v6];
}

- (void)loadAMSUIView
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  objc_super v3 = "-[NDOAppleCareAMSUIViewController loadAMSUIView]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_238845000, a2, OS_LOG_TYPE_ERROR, "%s: Failed to instatiate amsUI flow from: %@", (uint8_t *)&v2, 0x16u);
}

void __48__NDOAppleCareAMSUIViewController_loadAMSUIView__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __48__NDOAppleCareAMSUIViewController_loadAMSUIView__block_invoke_31(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __48__NDOAppleCareAMSUIViewController_loadAMSUIView__block_invoke_65(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) loadRequest:*(void *)(a1 + 40)];
}

- (void)cancelTapped:(id)a3
{
  id v3 = [(NDOAppleCareAMSUIViewController *)self presenter];
  [v3 amsUIViewFinishedWithCompletion:0];
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  return 0;
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = _NDOLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    id v16 = "-[NDOAppleCareAMSUIViewController webViewController:handleDelegateAction:completion:]";
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_238845000, v9, OS_LOG_TYPE_DEFAULT, "%s: %@ action: %@", (uint8_t *)&v15, 0x20u);
  }

  if (v8)
  {
    v10 = [v8 objectForKey:@"status"];
    uint64_t v11 = (int)[v10 intValue];

    id v12 = v8;
  }
  else
  {
    uint64_t v11 = 2;
  }
  id v13 = [(NDOAppleCareAMSUIViewController *)self presenter];
  [v13 amsUIViewFinishedWithCompletion:v11 params:v8];

  return 1;
}

- (NDOAppleCareAMSUIViewPresenterProtocol)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (NDOAppleCareAMSUIViewPresenterProtocol *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
  self->_navController = (UINavigationController *)a3;
}

- (NDOWarranty)warranty
{
  return (NDOWarranty *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setWarranty:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setSource:(id)a3
{
}

- (BOOL)initialLoadCompleted
{
  return self->_initialLoadCompleted;
}

- (void)setInitialLoadCompleted:(BOOL)a3
{
  self->_initialLoadCompleted = a3;
}

- (BOOL)isMultipleDevicePurchaseCall
{
  return self->_isMultipleDevicePurchaseCall;
}

- (void)setIsMultipleDevicePurchaseCall:(BOOL)a3
{
  self->_isMultipleDevicePurchaseCall = a3;
}

- (NSString)deeplinkParams
{
  return (NSString *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setDeeplinkParams:(id)a3
{
}

- (NSString)ulSalesURL
{
  return (NSString *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setUlSalesURL:(id)a3
{
}

- (NSDictionary)purchaseAPIBody
{
  return (NSDictionary *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setPurchaseAPIBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseAPIBody, 0);
  objc_storeStrong((id *)&self->_ulSalesURL, 0);
  objc_storeStrong((id *)&self->_deeplinkParams, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_warranty, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

@end