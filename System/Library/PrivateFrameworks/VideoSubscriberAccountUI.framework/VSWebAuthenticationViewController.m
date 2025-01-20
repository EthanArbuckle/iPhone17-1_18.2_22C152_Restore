@interface VSWebAuthenticationViewController
- (BOOL)isCancellationAllowed;
- (UIActivityIndicatorView)activityIndicator;
- (VSAuthenticationViewControllerDelegate)delegate;
- (VSWebAuthenticationViewModel)viewModel;
- (WKWebView)webView;
- (id)_canonicalRequestForRequest:(id)a3;
- (void)_cancelButtonPressed:(id)a3;
- (void)_didBeginActivity;
- (void)_didEndActivity;
- (void)_retrieveMessages;
- (void)_sendMessage:(id)a3;
- (void)_sendMessages:(id)a3;
- (void)_startObservingViewModel:(id)a3;
- (void)_stopObservingViewModel:(id)a3;
- (void)dealloc;
- (void)didAddMessagesToMessageQueue:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActivityIndicator:(id)a3;
- (void)setCancellationAllowed:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setWebView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation VSWebAuthenticationViewController

- (void)dealloc
{
  [(VSWebAuthenticationViewController *)self _stopObservingViewModel:self->_viewModel];
  v3.receiver = self;
  v3.super_class = (Class)VSWebAuthenticationViewController;
  [(VSWebAuthenticationViewController *)&v3 dealloc];
}

- (void)setViewModel:(id)a3
{
  v5 = (VSWebAuthenticationViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    -[VSWebAuthenticationViewController _stopObservingViewModel:](self, "_stopObservingViewModel:");
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(VSWebAuthenticationViewController *)self _startObservingViewModel:self->_viewModel];
    v5 = v6;
  }
}

- (void)_didBeginActivity
{
  objc_super v3 = [(VSWebAuthenticationViewController *)self webView];
  [v3 setHidden:1];

  id v4 = [(VSWebAuthenticationViewController *)self activityIndicator];
  [v4 startAnimating];
}

- (void)_didEndActivity
{
  objc_super v3 = [(VSWebAuthenticationViewController *)self webView];
  [v3 setHidden:0];

  id v4 = [(VSWebAuthenticationViewController *)self activityIndicator];
  [v4 stopAnimating];
}

- (void)_cancelButtonPressed:(id)a3
{
  id v4 = [(VSWebAuthenticationViewController *)self delegate];
  [v4 authenticationViewControllerDidCancel:self];
}

- (void)_sendMessage:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(VSWebAuthenticationViewController *)self webView];
  v6 = VSScriptMessageDispatchInjection(v4);
  v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_23F9AB000, v7, OS_LOG_TYPE_DEFAULT, "Will inject message to web: %@", buf, 0xCu);
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__VSWebAuthenticationViewController__sendMessage___block_invoke;
  v9[3] = &unk_265077B48;
  id v10 = v4;
  id v8 = v4;
  [v5 evaluateJavaScript:v6 completionHandler:v9];
}

void __50__VSWebAuthenticationViewController__sendMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_23F9AB000, v7, OS_LOG_TYPE_DEFAULT, "Result of message injection: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __50__VSWebAuthenticationViewController__sendMessage___block_invoke_cold_1();
    }
  }

  id v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "Did inject message: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_retrieveMessages
{
  objc_super v3 = [(VSWebAuthenticationViewController *)self webView];
  id v4 = [v3 URL];
  id v5 = objc_alloc_init(VSScriptSecurityOrigin);
  id v6 = [v4 scheme];
  [(VSScriptSecurityOrigin *)v5 setScheme:v6];

  v7 = [v4 host];
  [(VSScriptSecurityOrigin *)v5 setHost:v7];

  id v8 = [v4 port];
  -[VSScriptSecurityOrigin setPort:](v5, "setPort:", [v8 integerValue]);

  v9 = VSDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v9, OS_LOG_TYPE_DEFAULT, "Will retrieve messages.", buf, 2u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke;
  v11[3] = &unk_265077B70;
  uint64_t v12 = v5;
  uint64_t v13 = self;
  int v10 = v5;
  [v3 evaluateJavaScript:@"VideoSubscriberAccount._retrieveMessages();" completionHandler:v11];
}

void __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_4();
    }
LABEL_4:

    goto LABEL_5;
  }
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v5;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v10 = *MEMORY[0x263EFF4A0];
        id v11 = (void *)MEMORY[0x263EFF940];
        uint64_t v12 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v12);
        [v11 raise:v10, @"Unexpectedly, VSForceUnwrapNullable(result) was %@, instead of NSString.", v13 format];
      }
      v7 = [v8 dataUsingEncoding:4];
      if (v7)
      {
        id v37 = 0;
        v14 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v37];
        v15 = v37;
        if (v14)
        {
          v16 = v14;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v32 = v5;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v17 = (void *)MEMORY[0x263EFF940];
              uint64_t v18 = *MEMORY[0x263EFF4A0];
              v19 = (objc_class *)objc_opt_class();
              v20 = NSStringFromClass(v19);
              [v17 raise:v18, @"Unexpectedly, messages was %@, instead of NSArray.", v20 format];
            }
            v21 = v16;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v38 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              v29 = v16;
              v30 = v14;
              v31 = v15;
              uint64_t v24 = *(void *)v34;
              do
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v34 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  v26 = VSScriptMessageForValueFromContextWithOrigin(*(void **)(*((void *)&v33 + 1) + 8 * i), *(void **)(a1 + 32));
                  if (v26)
                  {
                    v27 = [*(id *)(a1 + 40) viewModel];
                    v28 = [v27 messagesFromWeb];
                    [v28 addMessage:v26];
                  }
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v38 count:16];
              }
              while (v23);
              v15 = v31;
              id v5 = v32;
              v16 = v29;
              v14 = v30;
            }
            else
            {
              id v5 = v32;
            }
          }
          else
          {
            v21 = VSErrorLogObject();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_3();
            }
          }
        }
        else
        {
          v16 = VSErrorLogObject();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_2();
          }
        }
      }
      else
      {
        v15 = VSErrorLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_1();
        }
      }

      goto LABEL_4;
    }
  }
LABEL_5:
}

- (void)_sendMessages:(id)a3
{
  id v4 = a3;
  id v5 = [(VSWebAuthenticationViewController *)self webView];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__VSWebAuthenticationViewController__sendMessages___block_invoke;
  v7[3] = &unk_265077B70;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 evaluateJavaScript:@"location.origin" completionHandler:v7];
}

void __51__VSWebAuthenticationViewController__sendMessages___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v6 = (void *)MEMORY[0x263EFF940];
        uint64_t v7 = *MEMORY[0x263EFF4A0];
        id v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        [v6 raise:v7, @"Unexpectedly, result was %@, instead of NSString.", v9 format];
      }
      uint64_t v10 = v5;
      id v11 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithString:v10];
      if (v11)
      {
        uint64_t v12 = objc_alloc_init(VSScriptSecurityOrigin);
        uint64_t v13 = [v11 scheme];
        [(VSScriptSecurityOrigin *)v12 setScheme:v13];

        v14 = [v11 host];
        [(VSScriptSecurityOrigin *)v12 setHost:v14];

        uint64_t v22 = v11;
        v15 = [v11 port];
        -[VSScriptSecurityOrigin setPort:](v12, "setPort:", [v15 integerValue]);

        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v16 = *(id *)(a1 + 32);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v24 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              if (VSShouldSendScriptMessageToContextWithOrigin(v21, v12)) {
                [*(id *)(a1 + 40) _sendMessage:v21];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v18);
        }

        id v11 = v22;
      }
      else
      {
        VSErrorLogObject();
        uint64_t v12 = (VSScriptSecurityOrigin *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
          __51__VSWebAuthenticationViewController__sendMessages___block_invoke_cold_2();
        }
      }
    }
    else
    {
      uint64_t v10 = VSErrorLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __51__VSWebAuthenticationViewController__sendMessages___block_invoke_cold_3();
      }
    }
  }
  else
  {
    id v5 = VSErrorLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __51__VSWebAuthenticationViewController__sendMessages___block_invoke_cold_1();
    }
  }
}

- (void)_startObservingViewModel:(id)a3
{
  uint64_t v4 = kVSKeyValueObservingContext_SourceURL;
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"sourceURL" options:4 context:v4];
  id v6 = [v5 messagesToWeb];

  [v6 setDelegate:self];
}

- (void)_stopObservingViewModel:(id)a3
{
  uint64_t v4 = kVSKeyValueObservingContext_SourceURL;
  id v5 = a3;
  [v5 removeObserver:self forKeyPath:@"sourceURL" context:v4];
  id v6 = [v5 messagesToWeb];

  [v6 setDelegate:0];
}

- (id)_canonicalRequestForRequest:(id)a3
{
  id v3 = (id) [a3 mutableCopy];
  [v3 _CFURLRequest];
  objc_msgSend(MEMORY[0x263F08890], "vs_sharedCookieStorage");
  id v4 = objc_claimAutoreleasedReturnValue();
  [v4 _cookieStorage];
  CFURLRequestSetHTTPCookieStorage();
  [v3 setHTTPShouldHandleCookies:1];

  return v3;
}

- (void)didAddMessagesToMessageQueue:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  VSPerformBlockOnMainThread();
}

void __66__VSWebAuthenticationViewController_didAddMessagesToMessageQueue___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isViewLoaded])
  {
    v2 = *(void **)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) removeAllMessages];
    [v2 _sendMessages:v3];
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v5 = a3;
  VSScriptMessageSupportInjection(0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v5 evaluateJavaScript:v9 completionHandler:&__block_literal_global_13];

  id v6 = [(VSWebAuthenticationViewController *)self viewModel];
  uint64_t v7 = [v6 messagesToWeb];
  id v8 = [v7 removeAllMessages];
  [(VSWebAuthenticationViewController *)self _sendMessages:v8];

  [(VSWebAuthenticationViewController *)self _didEndActivity];
}

void __65__VSWebAuthenticationViewController_webView_didFinishNavigation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = VSErrorLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__VSWebAuthenticationViewController_webView_didFinishNavigation___block_invoke_cold_1();
    }
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8 = [(VSWebAuthenticationViewController *)self viewModel];
  id v6 = [v8 messagesToWeb];
  uint64_t v7 = [v6 removeAllMessages];
  [(VSWebAuthenticationViewController *)self _sendMessages:v7];

  [(VSWebAuthenticationViewController *)self _didEndActivity];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void (**)(id, uint64_t))a5;
  id v8 = [a4 request];
  id v9 = [v8 URL];
  int v10 = VSIsScriptMessageNotificationURL(v9);
  id v11 = VSDefaultLogObject();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      int v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_23F9AB000, v11, OS_LOG_TYPE_DEFAULT, "Web view will *not* load request: %@", (uint8_t *)&v14, 0xCu);
    }

    [(VSWebAuthenticationViewController *)self _retrieveMessages];
    uint64_t v13 = 0;
  }
  else
  {
    if (v12)
    {
      int v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_23F9AB000, v11, OS_LOG_TYPE_DEFAULT, "Web view will load request %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v13 = 1;
  }
  v7[2](v7, v13);
}

- (void)setCancellationAllowed:(BOOL)a3
{
  if (self->_cancellationAllowed != a3)
  {
    self->_cancellationAllowed = a3;
    if (a3)
    {
      id v4 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
      id v5 = [v4 localizedStringForKey:@"CANCEL_TITLE" value:0 table:0];

      id v7 = (id)[objc_alloc(MEMORY[0x263F1C468]) initWithTitle:v5 style:0 target:self action:sel__cancelButtonPressed_];
    }
    else
    {
      id v7 = 0;
    }
    id v6 = [(VSWebAuthenticationViewController *)self navigationItem];
    [v6 setLeftBarButtonItem:v7];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  if ((void *)kVSKeyValueObservingContext_SourceURL == a6)
  {
    if ([(VSWebAuthenticationViewController *)self isViewLoaded])
    {
      BOOL v12 = [(VSWebAuthenticationViewController *)self webView];
      if (!v11) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The objectOrNil parameter must not be nil."];
      }
      id v13 = v11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v14 = (void *)MEMORY[0x263EFF940];
        uint64_t v15 = *MEMORY[0x263EFF4A0];
        uint64_t v16 = (objc_class *)objc_opt_class();
        uint64_t v17 = NSStringFromClass(v16);
        [v14 raise:v15, @"Unexpectedly, object was %@, instead of VSWebAuthenticationViewModel.", v17 format];
      }
      id v18 = v13;
      if (!v10) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The keyPathOrNil parameter must not be nil."];
      }
      uint64_t v19 = [v18 valueForKeyPath:v10];
      if (v19)
      {
        v20 = [MEMORY[0x263F08BD8] requestWithURL:v19];
        v21 = [(VSWebAuthenticationViewController *)self _canonicalRequestForRequest:v20];

        id v22 = (id)[v12 loadRequest:v21];
      }
      else
      {
        [v12 stopLoading];
      }
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)VSWebAuthenticationViewController;
    [(VSWebAuthenticationViewController *)&v23 observeValueForKeyPath:v10 ofObject:v11 change:a5 context:a6];
  }
}

- (void)viewDidLoad
{
  v42.receiver = self;
  v42.super_class = (Class)VSWebAuthenticationViewController;
  [(VSWebAuthenticationViewController *)&v42 viewDidLoad];
  id v3 = [(VSWebAuthenticationViewController *)self view];
  id v4 = [MEMORY[0x263F1C550] groupTableViewBackgroundColor];
  [v3 setBackgroundColor:v4];

  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = objc_alloc_init(MEMORY[0x263F1FA60]);
  int v14 = [MEMORY[0x263F1FA68] nonPersistentDataStore];
  [v13 setWebsiteDataStore:v14];

  uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263F1FA58]), "initWithFrame:configuration:", v13, v6, v8, v10, v12);
  [v15 setNavigationDelegate:self];
  [v15 setHidden:1];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v15];
  [(VSWebAuthenticationViewController *)self setWebView:v15];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:2];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v16];
  [(VSWebAuthenticationViewController *)self setActivityIndicator:v16];
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v18 = [v16 centerXAnchor];
  uint64_t v19 = [v3 centerXAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  [v17 addObject:v20];

  v21 = [v16 centerYAnchor];
  id v22 = [v3 centerYAnchor];
  objc_super v23 = [v21 constraintEqualToAnchor:v22];
  [v17 addObject:v23];

  long long v24 = [v15 topAnchor];
  long long v25 = [v3 safeAreaLayoutGuide];
  long long v26 = [v25 topAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  [v17 addObject:v27];

  uint64_t v28 = [v15 bottomAnchor];
  v29 = [v3 bottomAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [v17 addObject:v30];

  v31 = [v15 leftAnchor];
  id v32 = [v3 leftAnchor];
  long long v33 = [v31 constraintEqualToAnchor:v32];
  [v17 addObject:v33];

  long long v34 = [v15 rightAnchor];
  long long v35 = [v3 rightAnchor];
  long long v36 = [v34 constraintEqualToAnchor:v35];
  [v17 addObject:v36];

  [MEMORY[0x263F08938] activateConstraints:v17];
  id v37 = [(VSWebAuthenticationViewController *)self viewModel];
  v38 = [v37 sourceURL];

  uint64_t v39 = [MEMORY[0x263F08BD8] requestWithURL:v38];
  v40 = [(VSWebAuthenticationViewController *)self _canonicalRequestForRequest:v39];

  id v41 = (id)[v15 loadRequest:v40];
  VSAuthenticationViewControllerViewDidLoad(self);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSWebAuthenticationViewController;
  [(VSWebAuthenticationViewController *)&v4 viewWillAppear:a3];
  VSAuthenticationViewControllerViewWillAppear(self);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSWebAuthenticationViewController;
  [(VSWebAuthenticationViewController *)&v4 viewDidAppear:a3];
  VSAuthenticationViewControllerViewDidAppear(self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSWebAuthenticationViewController;
  [(VSWebAuthenticationViewController *)&v4 viewWillDisappear:a3];
  VSAuthenticationViewControllerViewWillDisappear(self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSWebAuthenticationViewController;
  [(VSWebAuthenticationViewController *)&v4 viewDidDisappear:a3];
  VSAuthenticationViewControllerViewDidDisappear(self);
}

- (BOOL)isCancellationAllowed
{
  return self->_cancellationAllowed;
}

- (VSAuthenticationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSAuthenticationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSWebAuthenticationViewModel)viewModel
{
  return self->_viewModel;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __50__VSWebAuthenticationViewController__sendMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "Error injecting message.", v2, v3, v4, v5, v6);
}

void __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "Unable to encode messages as UTF-8.", v2, v3, v4, v5, v6);
}

void __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Error deserializing messages: %@", v2, v3, v4, v5, v6);
}

void __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "Top-level messages object was not an array.", v2, v3, v4, v5, v6);
}

void __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Error retrieving messages from queue: %@", v2, v3, v4, v5, v6);
}

void __51__VSWebAuthenticationViewController__sendMessages___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "Unable to determine location origin.", v2, v3, v4, v5, v6);
}

void __51__VSWebAuthenticationViewController__sendMessages___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Unable to parse location origin string: %@", v2, v3, v4, v5, v6);
}

void __51__VSWebAuthenticationViewController__sendMessages___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "Location origin is not a string.", v2, v3, v4, v5, v6);
}

void __65__VSWebAuthenticationViewController_webView_didFinishNavigation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Unable to inject message support: %@", v2, v3, v4, v5, v6);
}

@end