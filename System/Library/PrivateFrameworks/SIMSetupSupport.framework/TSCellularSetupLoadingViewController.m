@interface TSCellularSetupLoadingViewController
- (BOOL)isProcessCanceled;
- (BOOL)isRemotePlan;
- (BOOL)useLiveID;
- (NSDictionary)postdata;
- (NSURL)carrierURL;
- (TSCellularSetupLoadingView)loadingView;
- (TSCellularSetupLoadingViewController)initWithRemotePlanWebsheetContext:(id)a3 isRemotePlan:(BOOL)a4;
- (TSRemotePlanWebsheetContext)remotePlanWebsheetContext;
- (TSSIMSetupFlowDelegate)delegate;
- (id)navBarTitle;
- (int)flowType;
- (void)_showFailureAlert:(id)a3 completion:(id)a4;
- (void)cancelButtonTapped;
- (void)deactivate;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)safariViewController:(id)a3 didCompleteInitialLoad:(BOOL)a4;
- (void)safariViewController:(id)a3 url:(id)a4 postdata:(id)a5 completion:(id)a6;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)setCarrierURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlowType:(int)a3;
- (void)setIsProcessCanceled:(BOOL)a3;
- (void)setIsRemotePlan:(BOOL)a3;
- (void)setLoadingView:(id)a3;
- (void)setPostdata:(id)a3;
- (void)setRemotePlanWebsheetContext:(id)a3;
- (void)setupCoreTelephonyClientForRemoteSignup;
- (void)setupNavigationBarItems;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSCellularSetupLoadingViewController

- (TSCellularSetupLoadingViewController)initWithRemotePlanWebsheetContext:(id)a3 isRemotePlan:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSCellularSetupLoadingViewController;
  v7 = [(TSCellularSetupLoadingViewController *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(TSCellularSetupLoadingViewController *)v7 setRemotePlanWebsheetContext:v6];
    [(TSCellularSetupLoadingViewController *)v8 setIsRemotePlan:v4];
    [(TSCellularSetupLoadingViewController *)v8 setIsProcessCanceled:0];
  }

  return v8;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)TSCellularSetupLoadingViewController;
  [(SSUIViewController *)&v20 viewDidLoad];
  [(TSCellularSetupLoadingViewController *)self setupNavigationBarItems];
  v3 = +[TSUtilities backgroundColorForRemotePlan:[(TSCellularSetupLoadingViewController *)self isRemotePlan]];
  BOOL v4 = [(TSCellularSetupLoadingViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = -[TSCellularSetupLoadingView initWithFrame:]([TSCellularSetupLoadingView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  [(TSCellularSetupLoadingViewController *)self setLoadingView:v5];

  id v6 = [(TSCellularSetupLoadingViewController *)self view];
  v7 = [(TSCellularSetupLoadingViewController *)self loadingView];
  [v6 addSubview:v7];

  v8 = [(TSCellularSetupLoadingViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(TSCellularSetupLoadingViewController *)self loadingView];
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  BOOL v18 = [(TSCellularSetupLoadingViewController *)self isRemotePlan];
  v19 = [(TSCellularSetupLoadingViewController *)self loadingView];
  [v19 setIsRemotePlan:v18];

  [(TSCellularSetupLoadingViewController *)self setupCoreTelephonyClientForRemoteSignup];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSCellularSetupLoadingViewController;
  [(TSCellularSetupLoadingViewController *)&v7 viewWillAppear:a3];
  BOOL v4 = [(TSCellularSetupLoadingViewController *)self navigationController];
  v5 = [v4 navigationBar];
  id v6 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v5 setBackgroundColor:v6];
}

- (void)setupNavigationBarItems
{
  v3 = [(TSCellularSetupLoadingViewController *)self navigationItem];
  [v3 setHidesBackButton:1];

  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonTapped];
  v5 = [(TSCellularSetupLoadingViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:v4];

  id v7 = [(TSCellularSetupLoadingViewController *)self navBarTitle];
  id v6 = [(TSCellularSetupLoadingViewController *)self navigationItem];
  [v6 setTitle:v7];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v12 = "-[TSCellularSetupLoadingViewController viewDidDisappear:]";
    __int16 v13 = 2080;
    double v14 = "-[TSCellularSetupLoadingViewController viewDidDisappear:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "dismiss %s  @%s", buf, 0x16u);
  }

  v10.receiver = self;
  v10.super_class = (Class)TSCellularSetupLoadingViewController;
  [(TSCellularSetupLoadingViewController *)&v10 viewDidDisappear:v3];
  id v6 = [(TSCellularSetupLoadingViewController *)self loadingView];
  [v6 spinnerStopAnimating];

  id v7 = [(TSCellularSetupLoadingViewController *)self remotePlanWebsheetContext];
  if ([v7 useLiveID])
  {
  }
  else
  {
    BOOL v8 = [(TSCellularSetupLoadingViewController *)self isProcessCanceled];

    if (!v8) {
      return;
    }
  }
  double v9 = [(TSCellularSetupLoadingViewController *)self delegate];
  [v9 userDidTapCancel];
}

- (void)setupCoreTelephonyClientForRemoteSignup
{
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __79__TSCellularSetupLoadingViewController_setupCoreTelephonyClientForRemoteSignup__block_invoke;
  v21[3] = &unk_264827C08;
  v21[4] = self;
  BOOL v3 = (void (**)(void, void, void, void))MEMORY[0x22A683B20](v21, a2);
  BOOL v4 = [(TSCellularSetupLoadingViewController *)self remotePlanWebsheetContext];
  v5 = [v4 url];

  if (v5)
  {
    id v6 = NSURL;
    id v7 = [(TSCellularSetupLoadingViewController *)self remotePlanWebsheetContext];
    BOOL v8 = [v7 url];
    double v9 = [v6 URLWithString:v8];
    objc_super v10 = [(TSCellularSetupLoadingViewController *)self remotePlanWebsheetContext];
    double v11 = [v10 postdata];
    ((void (**)(void, void *, void *, void))v3)[2](v3, v9, v11, 0);

LABEL_7:
    goto LABEL_8;
  }
  id v12 = objc_alloc(MEMORY[0x263F02D30]);
  __int16 v13 = (CoreTelephonyClient *)[v12 initWithQueue:MEMORY[0x263EF83A0]];
  coreTelephonyClient = self->_coreTelephonyClient;
  self->_coreTelephonyClient = v13;

  uint64_t v15 = [(TSCellularSetupLoadingViewController *)self remotePlanWebsheetContext];
  int v16 = [v15 flowType];

  if (v16 == 8)
  {
    v17 = self->_coreTelephonyClient;
    id v7 = [(TSCellularSetupLoadingViewController *)self remotePlanWebsheetContext];
    BOOL v8 = [v7 iccid];
    [(CoreTelephonyClient *)v17 getRemotePlanManageAccountInfoFor:v8 completion:v3];
    goto LABEL_7;
  }
  BOOL v18 = [(TSCellularSetupLoadingViewController *)self remotePlanWebsheetContext];
  int v19 = [v18 flowType];

  if (v19 == 7)
  {
    objc_super v20 = self->_coreTelephonyClient;
    id v7 = [(TSCellularSetupLoadingViewController *)self remotePlanWebsheetContext];
    BOOL v8 = [v7 subscriptionContext];
    [(CoreTelephonyClient *)v20 remotePlanSignupInfoFor:v8 userConsent:0 completion:v3];
    goto LABEL_7;
  }
LABEL_8:
}

void __79__TSCellularSetupLoadingViewController_setupCoreTelephonyClientForRemoteSignup__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  double v9 = *(void **)(a1 + 32);
  if (!a4)
  {
    char v10 = [v9 isProcessCanceled];
    double v11 = _TSLogDomain();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315394;
        int v19 = "-[TSCellularSetupLoadingViewController setupCoreTelephonyClientForRemoteSignup]_block_invoke_2";
        __int16 v20 = 2080;
        v21 = "-[TSCellularSetupLoadingViewController setupCoreTelephonyClientForRemoteSignup]_block_invoke_2";
        _os_log_impl(&dword_227A17000, v11, OS_LOG_TYPE_DEFAULT, "Flow Stop by Cancel Set Purchase to NO %s @%s", buf, 0x16u);
      }
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315138;
        int v19 = "-[TSCellularSetupLoadingViewController setupCoreTelephonyClientForRemoteSignup]_block_invoke";
        _os_log_impl(&dword_227A17000, v11, OS_LOG_TYPE_DEFAULT, "Flow Start @%s", buf, 0xCu);
      }

      [*(id *)(a1 + 32) setCarrierURL:v7];
      [*(id *)(a1 + 32) setPostdata:v8];
      __int16 v13 = [*(id *)(a1 + 32) remotePlanWebsheetContext];
      int v14 = [v13 useLiveID];

      uint64_t v15 = *(void **)(a1 + 32);
      if (v14)
      {
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __79__TSCellularSetupLoadingViewController_setupCoreTelephonyClientForRemoteSignup__block_invoke_95;
        v16[3] = &unk_2648279D0;
        v16[4] = v15;
        [v15 safariViewController:v15 url:v7 postdata:v8 completion:v16];
        goto LABEL_12;
      }
      double v11 = [v15 delegate];
      [v11 viewControllerDidComplete:*(void *)(a1 + 32)];
    }

    goto LABEL_12;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __79__TSCellularSetupLoadingViewController_setupCoreTelephonyClientForRemoteSignup__block_invoke_2;
  v17[3] = &unk_2648279D0;
  v17[4] = v9;
  [v9 _showFailureAlert:v9 completion:v17];
LABEL_12:
}

void __79__TSCellularSetupLoadingViewController_setupCoreTelephonyClientForRemoteSignup__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 dismissViewControllerAnimated:0 completion:0];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 userDidTapCancel];
}

void __79__TSCellularSetupLoadingViewController_setupCoreTelephonyClientForRemoteSignup__block_invoke_95(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 userDidTapCancel];
}

- (void)cancelButtonTapped
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[TSCellularSetupLoadingViewController cancelButtonTapped]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "Cancel Process in Loading @%s", (uint8_t *)&v4, 0xCu);
  }

  [(TSCellularSetupLoadingViewController *)self setIsProcessCanceled:1];
  [(TSCellularSetupLoadingViewController *)self dismissViewControllerWithTransition:7 completion:0];
}

- (id)navBarTitle
{
  id v3 = [(TSCellularSetupLoadingViewController *)self remotePlanWebsheetContext];
  uint64_t v4 = [v3 carrierName];
  if (v4)
  {
    v5 = (void *)v4;
    uint64_t v6 = [(TSCellularSetupLoadingViewController *)self remotePlanWebsheetContext];
    id v7 = [v6 carrierName];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      double v9 = [(TSCellularSetupLoadingViewController *)self remotePlanWebsheetContext];
      uint64_t v10 = [v9 carrierName];
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"CELLULAR ACCOUNT" value:&stru_26DBE8E78 table:@"Localizable"];
LABEL_6:
  double v11 = (void *)v10;

  return v11;
}

- (void)_showFailureAlert:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"Connection Failed" value:&stru_26DBE8E78 table:@"Localizable"];

  double v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"The connection to the server was lost.  Please try again later." value:&stru_26DBE8E78 table:@"Localizable"];

  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v12 = (void *)MEMORY[0x263F82400];
  __int16 v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v14 = [v13 localizedStringForKey:@"ERROR_OK" value:&stru_26DBE8E78 table:@"Localizable"];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __69__TSCellularSetupLoadingViewController__showFailureAlert_completion___block_invoke;
  v27[3] = &unk_264827C30;
  id v15 = v6;
  id v28 = v15;
  int v16 = [v12 actionWithTitle:v14 style:0 handler:v27];
  [v11 addObject:v16];

  v17 = [MEMORY[0x263F82418] alertControllerWithTitle:v8 message:v10 preferredStyle:1];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(v17, "addAction:", *(void *)(*((void *)&v23 + 1) + 8 * v22++), (void)v23);
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v20);
  }

  [v5 presentViewController:v17 animated:1 completion:0];
}

uint64_t __69__TSCellularSetupLoadingViewController__showFailureAlert_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)safariViewController:(id)a3 url:(id)a4 postdata:(id)a5 completion:(id)a6
{
  v22[1] = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263F08BD0];
  id v8 = a3;
  double v9 = [(TSCellularSetupLoadingViewController *)self postdata];
  uint64_t v10 = [v9 valueForKey:@"carrierPostData"];
  id v11 = [v7 queryItemWithName:@"signup-url-data" value:v10];

  BOOL v12 = (void *)MEMORY[0x263F08BA0];
  __int16 v13 = [(TSCellularSetupLoadingViewController *)self carrierURL];
  int v14 = [v12 componentsWithURL:v13 resolvingAgainstBaseURL:0];

  v22[0] = v11;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  [v14 setQueryItems:v15];

  id v16 = objc_alloc_init(MEMORY[0x263F16988]);
  [v16 setEntersReaderIfAvailable:0];
  [v16 _setEphemeral:1];
  id v17 = objc_alloc(MEMORY[0x263F16980]);
  id v18 = [v14 URL];
  uint64_t v19 = (void *)[v17 initWithURL:v18 configuration:v16];

  [v19 setDelegate:self];
  [v19 _setShowingLinkPreview:0];
  [v19 _setShowingLinkPreviewWithMinimalUI:0];
  [v19 setModalPresentationStyle:1];
  uint64_t v20 = [v19 presentationController];
  [v20 setDelegate:self];

  uint64_t v21 = [v8 navigationController];

  [v21 presentViewController:v19 animated:1 completion:0];
}

- (void)deactivate
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[TSCellularSetupLoadingViewController deactivate]";
    __int16 v7 = 2080;
    id v8 = "-[TSCellularSetupLoadingViewController deactivate]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "%s @%s", (uint8_t *)&v5, 0x16u);
  }

  uint64_t v4 = [(TSCellularSetupLoadingViewController *)self _remoteViewControllerProxy];
  [v4 dismiss];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = _TSLogDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    __int16 v7 = "-[TSCellularSetupLoadingViewController presentationControllerDidDismiss:]";
    _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "safariViewController dismiss @%s", (uint8_t *)&v6, 0xCu);
  }

  int v5 = [(TSCellularSetupLoadingViewController *)self presentingViewController];
  [v5 dismissViewControllerAnimated:0 completion:0];
}

- (void)safariViewControllerDidFinish:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__TSCellularSetupLoadingViewController_safariViewControllerDidFinish___block_invoke;
  block[3] = &unk_2648279D0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __70__TSCellularSetupLoadingViewController_safariViewControllerDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[TSCellularSetupLoadingViewController safariViewControllerDidFinish:]_block_invoke";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "safariViewController did finish @%s", buf, 0xCu);
  }

  id v3 = [MEMORY[0x263F31978] sharedManager];
  [v3 userSignupInitiatedOrFailed];

  [(id)objc_opt_class() durationForTransition:7];
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__TSCellularSetupLoadingViewController_safariViewControllerDidFinish___block_invoke_135;
  v6[3] = &unk_2648279D0;
  v6[4] = v4;
  [v4 dismissViewControllerWithTransition:7 completion:v6];
  return UIKeyboardOrderOutAutomaticToDirectionWithDuration();
}

uint64_t __70__TSCellularSetupLoadingViewController_safariViewControllerDidFinish___block_invoke_135(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivate];
}

- (void)safariViewController:(id)a3 didCompleteInitialLoad:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = _TSLogDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    __int16 v7 = "-[TSCellularSetupLoadingViewController safariViewController:didCompleteInitialLoad:]";
    _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "safariViewController load complete @%s", (uint8_t *)&v6, 0xCu);
  }

  int v5 = [MEMORY[0x263F31978] sharedManager];
  [v5 userSignupInitiatedOrFailed];
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)carrierURL
{
  return self->_carrierURL;
}

- (void)setCarrierURL:(id)a3
{
}

- (NSDictionary)postdata
{
  return self->_postdata;
}

- (void)setPostdata:(id)a3
{
}

- (BOOL)isProcessCanceled
{
  return self->_isProcessCanceled;
}

- (void)setIsProcessCanceled:(BOOL)a3
{
  self->_isProcessCanceled = a3;
}

- (int)flowType
{
  return self->_flowType;
}

- (void)setFlowType:(int)a3
{
  self->_flowType = a3;
}

- (BOOL)useLiveID
{
  return self->_useLiveID;
}

- (TSCellularSetupLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (BOOL)isRemotePlan
{
  return self->_isRemotePlan;
}

- (void)setIsRemotePlan:(BOOL)a3
{
  self->_isRemotePlan = a3;
}

- (TSRemotePlanWebsheetContext)remotePlanWebsheetContext
{
  return (TSRemotePlanWebsheetContext *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setRemotePlanWebsheetContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePlanWebsheetContext, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_postdata, 0);
  objc_storeStrong((id *)&self->_carrierURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end