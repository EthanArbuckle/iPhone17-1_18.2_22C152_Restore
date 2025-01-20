@interface SWViewController
- (BOOL)allowsRemoteInspection;
- (BOOL)focusShouldStartInputSession;
- (BOOL)isWebViewPresentingInFullScreen;
- (BOOL)webView:(id)a3 shouldPreviewElement:(id)a4;
- (NSURL)URL;
- (SWContentRuleManager)contentRuleManager;
- (SWDatastoreManager)localDatastoreManager;
- (SWDatastoreSynchronizationManager)datastoreSynchronizationManager;
- (SWDocumentStateReporting)documentStateReporter;
- (SWErrorReporting)errorReporter;
- (SWLoader)loader;
- (SWLogger)logger;
- (SWMessageHandlerManager)messageHandlerManager;
- (SWNavigationManager)navigationManager;
- (SWProcessTerminationManager)terminationManager;
- (SWReachabilityProvider)reachabilityProvider;
- (SWScriptsManager)scriptsManager;
- (SWSessionManager)sessionManager;
- (SWSetupManager)setupManager;
- (SWTimeoutManager)timeoutManager;
- (SWURLSchemeHandlerManager)URLSchemeHandlerManager;
- (SWViewController)initWithWebView:(id)a3 setupManager:(id)a4 scriptsManager:(id)a5 messageHandlerManager:(id)a6 navigationManager:(id)a7 errorReporter:(id)a8 documentStateReporter:(id)a9 timeoutManager:(id)a10 terminationManager:(id)a11 contentRuleManager:(id)a12 reachabilityProvider:(id)a13 logger:(id)a14 sessionManager:(id)a15 datastoreSynchronizationManager:(id)a16 localDatastoreManager:(id)a17 URLSchemeHandlerManager:(id)a18;
- (SWWebView)webView;
- (id)accessibilityElements;
- (id)inputAccessoryView;
- (id)webView:(id)a3 previewingViewControllerForElement:(id)a4 defaultActions:(id)a5;
- (void)_webView:(id)a3 navigation:(id)a4 didSameDocumentNavigation:(int64_t)a5;
- (void)_webViewDidEnterElementFullscreen:(id)a3;
- (void)_webViewDidExitElementFullscreen:(id)a3;
- (void)initiateLoadingWithLoader:(id)a3;
- (void)loadHTMLString:(id)a3 baseURL:(id)a4;
- (void)loadLocalDatastore:(id)a3 forceUpdate:(BOOL)a4 completion:(id)a5;
- (void)loadURL:(id)a3;
- (void)loadURL:(id)a3 cachePolicy:(unint64_t)a4;
- (void)prewarm;
- (void)removeMenusForIdentifiers:(id)a3;
- (void)setAllowsRemoteInspection:(BOOL)a3;
- (void)setFocusShouldStartInputSession:(BOOL)a3;
- (void)setInputAccessoryView:(id)a3;
- (void)setIsWebViewPresentingInFullScreen:(BOOL)a3;
- (void)setLoader:(id)a3;
- (void)setShortcutsBarWithLeadingGroups:(id)a3 trailingGroups:(id)a4;
- (void)setTextInputTraits:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)webView:(id)a3 commitPreviewingViewController:(id)a4;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webViewSetNeedsLayout;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation SWViewController

- (SWViewController)initWithWebView:(id)a3 setupManager:(id)a4 scriptsManager:(id)a5 messageHandlerManager:(id)a6 navigationManager:(id)a7 errorReporter:(id)a8 documentStateReporter:(id)a9 timeoutManager:(id)a10 terminationManager:(id)a11 contentRuleManager:(id)a12 reachabilityProvider:(id)a13 logger:(id)a14 sessionManager:(id)a15 datastoreSynchronizationManager:(id)a16 localDatastoreManager:(id)a17 URLSchemeHandlerManager:(id)a18
{
  id v23 = a3;
  id v41 = a4;
  id v40 = a5;
  id v39 = a6;
  id v38 = a7;
  id v37 = a8;
  id v36 = a9;
  id v44 = a10;
  id v43 = a11;
  id v35 = a12;
  id v34 = a13;
  id v33 = a14;
  id v32 = a15;
  id v31 = a16;
  id v30 = a17;
  id v29 = a18;
  v50.receiver = self;
  v50.super_class = (Class)SWViewController;
  v24 = [(SWViewController *)&v50 initWithNibName:0 bundle:0];
  v25 = v24;
  if (v24)
  {
    p_webView = (id *)&v24->_webView;
    objc_storeStrong((id *)&v24->_webView, a3);
    [*p_webView setNavigationDelegate:v25];
    [*p_webView setUIDelegate:v25];
    [*p_webView _setFullscreenDelegate:v25];
    [*p_webView _setInputDelegate:v25];
    objc_storeStrong((id *)&v25->_setupManager, a4);
    objc_storeStrong((id *)&v25->_scriptsManager, a5);
    objc_storeStrong((id *)&v25->_messageHandlerManager, a6);
    objc_storeStrong((id *)&v25->_navigationManager, a7);
    objc_storeStrong((id *)&v25->_errorReporter, a8);
    objc_storeStrong((id *)&v25->_documentStateReporter, a9);
    objc_storeStrong((id *)&v25->_timeoutManager, a10);
    objc_storeStrong((id *)&v25->_terminationManager, a11);
    objc_storeStrong((id *)&v25->_contentRuleManager, a12);
    objc_storeStrong((id *)&v25->_reachabilityProvider, a13);
    objc_storeStrong((id *)&v25->_logger, a14);
    objc_storeStrong((id *)&v25->_sessionManager, a15);
    objc_storeStrong((id *)&v25->_datastoreSynchronizationManager, a16);
    objc_storeStrong((id *)&v25->_localDatastoreManager, a17);
    objc_storeStrong((id *)&v25->_URLSchemeHandlerManager, a18);
    objc_initWeak(&location, v25);
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __314__SWViewController_initWithWebView_setupManager_scriptsManager_messageHandlerManager_navigationManager_errorReporter_documentStateReporter_timeoutManager_terminationManager_contentRuleManager_reachabilityProvider_logger_sessionManager_datastoreSynchronizationManager_localDatastoreManager_URLSchemeHandlerManager___block_invoke;
    v47[3] = &unk_2646FF9C0;
    objc_copyWeak(&v48, &location);
    [v44 onTimeout:v47];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __314__SWViewController_initWithWebView_setupManager_scriptsManager_messageHandlerManager_navigationManager_errorReporter_documentStateReporter_timeoutManager_terminationManager_contentRuleManager_reachabilityProvider_logger_sessionManager_datastoreSynchronizationManager_localDatastoreManager_URLSchemeHandlerManager___block_invoke_2;
    v45[3] = &unk_2646FF9C0;
    objc_copyWeak(&v46, &location);
    [v43 onRetry:v45];
    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }

  return v25;
}

void __314__SWViewController_initWithWebView_setupManager_scriptsManager_messageHandlerManager_navigationManager_errorReporter_documentStateReporter_timeoutManager_terminationManager_contentRuleManager_reachabilityProvider_logger_sessionManager_datastoreSynchronizationManager_localDatastoreManager_URLSchemeHandlerManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [NSURL URLWithString:@"about:blank"];
  [WeakRetained loadURL:v1];
}

void __314__SWViewController_initWithWebView_setupManager_scriptsManager_messageHandlerManager_navigationManager_errorReporter_documentStateReporter_timeoutManager_terminationManager_contentRuleManager_reachabilityProvider_logger_sessionManager_datastoreSynchronizationManager_localDatastoreManager_URLSchemeHandlerManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained loader];
  [v1 load];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SWViewController;
  [(SWViewController *)&v7 viewDidLoad];
  v3 = [(SWViewController *)self view];
  v4 = [MEMORY[0x263F1C550] clearColor];
  [v3 setBackgroundColor:v4];

  v5 = [(SWViewController *)self view];
  v6 = [(SWViewController *)self webView];
  [v5 addSubview:v6];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SWViewController;
  [(SWViewController *)&v5 viewDidLayoutSubviews];
  if (!self->_isWebViewPresentingInFullScreen)
  {
    v3 = [(SWViewController *)self webView];
    v4 = [(SWViewController *)self view];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SWViewController;
  [(SWViewController *)&v5 viewDidDisappear:a3];
  v4 = [(SWViewController *)self webView];
  [v4 pauseAllMediaPlaybackWithCompletionHandler:0];
}

- (void)prewarm
{
  id v3 = [(SWViewController *)self webView];
  id v2 = (id)[v3 loadHTMLString:&stru_26D81E068 baseURL:0];
}

- (void)webViewSetNeedsLayout
{
  id v2 = [(SWViewController *)self webView];
  [v2 setNeedsLayout];
}

- (NSURL)URL
{
  id v2 = [(SWViewController *)self webView];
  id v3 = [v2 URL];

  return (NSURL *)v3;
}

- (void)loadURL:(id)a3
{
}

- (void)loadURL:(id)a3 cachePolicy:(unint64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __40__SWViewController_loadURL_cachePolicy___block_invoke;
  v12 = &unk_264700120;
  objc_copyWeak(v14, &location);
  id v7 = v6;
  id v13 = v7;
  v14[1] = (id)a4;
  v8 = +[SWLoader loaderWithBlock:&v9];
  -[SWViewController initiateLoadingWithLoader:](self, "initiateLoadingWithLoader:", v8, v9, v10, v11, v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __40__SWViewController_loadURL_cachePolicy___block_invoke(id *a1)
{
  id v2 = a1 + 5;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  v4 = [WeakRetained sessionManager];
  [v4 refresh];

  objc_super v5 = [a1[4] absoluteString];
  int v6 = [v5 isEqualToString:@"about:blank"];

  id v7 = objc_loadWeakRetained(v2);
  v8 = [v7 documentStateReporter];
  uint64_t v9 = v8;
  if (v6) {
    [v8 documentWillUnload];
  }
  else {
    [v8 documentStartedLoading];
  }

  id v10 = objc_loadWeakRetained(v2);
  v11 = [v10 logger];
  v12 = [a1[4] absoluteString];
  [v11 bindValue:v12 forKey:@"URL"];

  id v13 = objc_loadWeakRetained(v2);
  v14 = [v13 contentRuleManager];
  v15 = [v14 configureContentRules];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __40__SWViewController_loadURL_cachePolicy___block_invoke_2;
  v17[3] = &unk_2647000F8;
  id v18 = a1[4];
  objc_copyWeak(v19, v2);
  v19[1] = a1[6];
  id v16 = (id)[v15 then:v17];

  objc_destroyWeak(v19);
}

id __40__SWViewController_loadURL_cachePolicy___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isFileURL];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    v4 = [MEMORY[0x263F089E0] requestWithURL:v3];
    [v4 setAttribution:1];
    id v5 = (id)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:*(void *)(a1 + 32) resolvingAgainstBaseURL:1];
    [v5 setQuery:0];
    [v5 setFragment:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = [WeakRetained webView];
    v8 = [v5 URL];
    uint64_t v9 = [v8 URLByDeletingLastPathComponent];
    id v10 = [v7 loadFileRequest:v4 allowingReadAccessToURL:v9];
  }
  else
  {
    v4 = [MEMORY[0x263F089E0] requestWithURL:v3 cachePolicy:*(void *)(a1 + 48) timeoutInterval:10.0];
    [v4 setAttribution:1];
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    id WeakRetained = [v5 webView];
    id v10 = [WeakRetained loadRequest:v4];
  }

  return v10;
}

- (void)loadHTMLString:(id)a3 baseURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __43__SWViewController_loadHTMLString_baseURL___block_invoke;
  v14 = &unk_264700170;
  objc_copyWeak(&v17, &location);
  id v8 = v7;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  id v10 = +[SWLoader loaderWithBlock:&v11];
  -[SWViewController initiateLoadingWithLoader:](self, "initiateLoadingWithLoader:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __43__SWViewController_loadHTMLString_baseURL___block_invoke(id *a1)
{
  int v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = [WeakRetained sessionManager];
  [v4 refresh];

  id v5 = [a1[4] absoluteString];
  int v6 = [v5 isEqualToString:@"about:blank"];

  id v7 = objc_loadWeakRetained(v2);
  id v8 = [v7 documentStateReporter];
  id v9 = v8;
  if (v6) {
    [v8 documentWillUnload];
  }
  else {
    [v8 documentStartedLoading];
  }

  id v10 = objc_loadWeakRetained(v2);
  uint64_t v11 = [v10 logger];
  uint64_t v12 = [a1[4] absoluteString];
  [v11 bindValue:v12 forKey:@"baseURL"];

  id v13 = objc_loadWeakRetained(v2);
  v14 = [v13 contentRuleManager];
  id v15 = [v14 configureContentRules];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __43__SWViewController_loadHTMLString_baseURL___block_invoke_2;
  v17[3] = &unk_264700148;
  id v18 = a1[4];
  objc_copyWeak(&v20, v2);
  id v19 = a1[5];
  id v16 = (id)[v15 then:v17];

  objc_destroyWeak(&v20);
}

id __43__SWViewController_loadHTMLString_baseURL___block_invoke_2(uint64_t a1)
{
  int v2 = [MEMORY[0x263F089E0] requestWithURL:*(void *)(a1 + 32)];
  [v2 setAttribution:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [WeakRetained webView];
  id v5 = [v4 loadSimulatedRequest:v2 responseHTMLString:*(void *)(a1 + 40)];

  return v5;
}

- (void)loadLocalDatastore:(id)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v12 = [(SWViewController *)self localDatastoreManager];
  id v10 = [(SWViewController *)self sessionManager];
  uint64_t v11 = [v10 session];
  [v12 updateDatastore:v9 originatingSession:v11 forceUpdate:v5 completion:v8];
}

- (void)initiateLoadingWithLoader:(id)a3
{
  [(SWViewController *)self setLoader:a3];
  id v4 = [(SWViewController *)self loader];
  [v4 load];
}

- (BOOL)allowsRemoteInspection
{
  int v2 = [(SWViewController *)self webView];
  char v3 = [v2 _allowsRemoteInspection];

  return v3;
}

- (void)setAllowsRemoteInspection:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SWViewController *)self webView];
  int v6 = [v5 configuration];
  id v7 = [v6 preferences];
  [v7 _setDeveloperExtrasEnabled:v3];

  id v8 = [(SWViewController *)self webView];
  [v8 setInspectable:v3];
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  id v3 = [(SWViewController *)self terminationManager];
  [v3 webContentProcessTerminated];
}

- (void)_webView:(id)a3 navigation:(id)a4 didSameDocumentNavigation:(int64_t)a5
{
  id v5 = [(SWViewController *)self documentStateReporter];
  [v5 documentIsReady];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v12 = a4;
  id v7 = (void (**)(id, uint64_t))a5;
  if ([v12 navigationType])
  {
    uint64_t v8 = 1;
  }
  else
  {
    id v9 = [(SWViewController *)self navigationManager];
    id v10 = [v12 request];
    unint64_t v11 = [v9 actionForRequest:v10];

    if (v11 > 2) {
      goto LABEL_6;
    }
    uint64_t v8 = qword_224D3BCD0[v11];
  }
  v7[2](v7, v8);
LABEL_6:
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6 = a5;
  id v7 = [(SWViewController *)self errorReporter];
  [v7 reportError:v6];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6 = a5;
  id v7 = [(SWViewController *)self errorReporter];
  [v7 reportError:v6];
}

- (BOOL)webView:(id)a3 shouldPreviewElement:(id)a4
{
  id v5 = a4;
  id v6 = [(SWViewController *)self navigationManager];
  id v7 = (void *)MEMORY[0x263F08BD8];
  uint64_t v8 = [v5 linkURL];

  id v9 = [v7 requestWithURL:v8];
  LOBYTE(v7) = [v6 shouldPreviewRequest:v9];

  return (char)v7;
}

- (id)webView:(id)a3 previewingViewControllerForElement:(id)a4 defaultActions:(id)a5
{
  id v6 = a4;
  id v7 = [(SWViewController *)self navigationManager];
  uint64_t v8 = (void *)MEMORY[0x263F08BD8];
  id v9 = [v6 linkURL];

  id v10 = [v8 requestWithURL:v9];
  unint64_t v11 = [v7 previewViewControllerForRequest:v10];

  return v11;
}

- (void)webView:(id)a3 commitPreviewingViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(SWViewController *)self navigationManager];
  [v6 commitViewController:v5];
}

- (void)_webViewDidEnterElementFullscreen:(id)a3
{
}

- (void)_webViewDidExitElementFullscreen:(id)a3
{
}

- (id)accessibilityElements
{
  v5[1] = *MEMORY[0x263EF8340];
  int v2 = [(SWViewController *)self webView];
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)inputAccessoryView
{
  int v2 = [(SWViewController *)self webView];
  id v3 = [v2 inputAccessoryView];

  return v3;
}

- (void)setInputAccessoryView:(id)a3
{
  id v4 = a3;
  id v5 = [(SWViewController *)self webView];
  [v5 setInputAccessoryView:v4];

  id v6 = [(SWViewController *)self firstResponder];
  [v6 reloadInputViews];
}

- (void)setTextInputTraits:(id)a3
{
  id v4 = a3;
  id v5 = [(SWViewController *)self webView];
  [v5 setTextInputTraits:v4];
}

- (void)setShortcutsBarWithLeadingGroups:(id)a3 trailingGroups:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SWViewController *)self webView];
  [v8 setShortcutsBarWithLeadingGroups:v7 trailingGroups:v6];
}

- (void)removeMenusForIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(SWViewController *)self webView];
  [v5 removeMenusForIdentifiers:v4];
}

- (SWScriptsManager)scriptsManager
{
  return self->_scriptsManager;
}

- (SWMessageHandlerManager)messageHandlerManager
{
  return self->_messageHandlerManager;
}

- (SWNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (BOOL)focusShouldStartInputSession
{
  return self->_focusShouldStartInputSession;
}

- (void)setFocusShouldStartInputSession:(BOOL)a3
{
  self->_focusShouldStartInputSession = a3;
}

- (SWContentRuleManager)contentRuleManager
{
  return self->_contentRuleManager;
}

- (SWWebView)webView
{
  return self->_webView;
}

- (SWSetupManager)setupManager
{
  return self->_setupManager;
}

- (SWErrorReporting)errorReporter
{
  return self->_errorReporter;
}

- (SWDocumentStateReporting)documentStateReporter
{
  return self->_documentStateReporter;
}

- (SWTimeoutManager)timeoutManager
{
  return self->_timeoutManager;
}

- (SWProcessTerminationManager)terminationManager
{
  return self->_terminationManager;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (SWLoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
}

- (SWSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (SWDatastoreSynchronizationManager)datastoreSynchronizationManager
{
  return self->_datastoreSynchronizationManager;
}

- (SWURLSchemeHandlerManager)URLSchemeHandlerManager
{
  return self->_URLSchemeHandlerManager;
}

- (SWDatastoreManager)localDatastoreManager
{
  return self->_localDatastoreManager;
}

- (BOOL)isWebViewPresentingInFullScreen
{
  return self->_isWebViewPresentingInFullScreen;
}

- (void)setIsWebViewPresentingInFullScreen:(BOOL)a3
{
  self->_isWebViewPresentingInFullScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDatastoreManager, 0);
  objc_storeStrong((id *)&self->_URLSchemeHandlerManager, 0);
  objc_storeStrong((id *)&self->_datastoreSynchronizationManager, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_storeStrong((id *)&self->_terminationManager, 0);
  objc_storeStrong((id *)&self->_timeoutManager, 0);
  objc_storeStrong((id *)&self->_documentStateReporter, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_contentRuleManager, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_messageHandlerManager, 0);
  objc_storeStrong((id *)&self->_scriptsManager, 0);
}

@end