@interface WSWebSheetViewController
- (BOOL)shouldAutorotate;
- (unint64_t)supportedInterfaceOrientations;
- (void)dismissViewController:(int64_t)a3;
- (void)handleProbeResult:(int64_t)a3 completionHandler:(id)a4;
- (void)loadView;
- (void)startWithURL:(id)a3 ssid:(id)a4 interface:(id)a5 proxyConfiguration:(id)a6 enableTVMode:(BOOL)a7 delegate:(id)a8;
- (void)startWithURL:(id)a3 ssid:(id)a4 interface:(id)a5 proxyConfiguration:(id)a6 showCancelMenu:(BOOL)a7 delegate:(id)a8;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation WSWebSheetViewController

- (void)loadView
{
  NSLog(&cfstr_Loadview.isa, a2);
  v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  v8 = -[WSWebSheetView initWithFrame:webSheetViewController:]([WSWebSheetView alloc], "initWithFrame:webSheetViewController:", self, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), v5, v7);
  [(WSWebSheetViewController *)self setView:v8];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WSWebSheetViewController;
  [(WSWebSheetViewController *)&v6 viewDidAppear:a3];
  double v4 = [(WSWebSheetViewController *)self view];
  double v5 = [v4 window];
  [v5 makeKeyWindow];
}

- (void)dismissViewController:(int64_t)a3
{
  double v5 = [(WSWebSheetViewController *)self webSheetView];
  objc_super v6 = [v5 delegate];

  if (v6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__WSWebSheetViewController_dismissViewController___block_invoke;
    v7[3] = &unk_26504AE48;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

void __50__WSWebSheetViewController_dismissViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) webSheetView];
  [v2 dismissWebSheetWithCaptiveWebSheetResult:*(void *)(a1 + 40)];
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)startWithURL:(id)a3 ssid:(id)a4 interface:(id)a5 proxyConfiguration:(id)a6 enableTVMode:(BOOL)a7 delegate:(id)a8
{
  BOOL v8 = a7;
  [(WSWebSheetViewController *)self startWithURL:a3 ssid:a4 interface:a5 proxyConfiguration:a6 showCancelMenu:!a7 delegate:a8];
  v10 = [(WSWebSheetViewController *)self view];

  if (v10)
  {
    id v11 = [(WSWebSheetViewController *)self view];
    [v11 setEnableTVMode:v8];
  }
}

- (void)startWithURL:(id)a3 ssid:(id)a4 interface:(id)a5 proxyConfiguration:(id)a6 showCancelMenu:(BOOL)a7 delegate:(id)a8
{
  BOOL v9 = a7;
  id v26 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v18 = [(WSWebSheetViewController *)self view];

  if (v18)
  {
    v19 = [MEMORY[0x263EFC5D8] sharedHTTPCookieStorage];
    objc_msgSend(v19, "webui_applySafariCookieAcceptPolicy");
    v20 = [MEMORY[0x263F86248] standardPreferences];
    [v20 _synchronizeWebStoragePolicyWithCookiePolicy];
    [v20 setStorageTrackerEnabled:0];
    [v20 setOfflineWebApplicationCacheEnabled:0];
    [v20 setDatabasesEnabled:0];
    [v20 setLocalStorageEnabled:0];
    v21 = [MEMORY[0x263F86248] standardPreferences];
    [v21 setPrivateBrowsingEnabled:1];

    v22 = [(WSWebSheetViewController *)self view];
    [v22 setDelegate:v17];
    [v22 setCurrentURL:v26];
    [v22 setProbeURL:v26];
    [v22 setSSID:v14];
    if (v16) {
      [v22 setProxyConfiguration:v16];
    }
    [v22 setShouldShowStayConnectedOptions:v9];
    [v22 setWebViewWithInterfaceName:v15];
    v23 = [v22 webView];
    v24 = [MEMORY[0x263EFC630] requestWithURL:v26];
    id v25 = (id)[v23 loadRequest:v24];
  }
  else
  {
    NSLog(&cfstr_WebsheetViewIs.isa);
  }
}

- (void)handleProbeResult:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__WSWebSheetViewController_handleProbeResult_completionHandler___block_invoke;
  block[3] = &unk_26504AF30;
  id v9 = v6;
  int64_t v10 = a3;
  block[4] = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __64__WSWebSheetViewController_handleProbeResult_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) webSheetView];
  [v2 handleProbeResult:*(void *)(a1 + 48)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

@end