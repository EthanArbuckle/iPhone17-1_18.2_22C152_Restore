@interface LTUITranslationViewController
+ (BOOL)isAvailable;
+ (void)initialize;
- (BOOL)_canShowWhileLocked;
- (BOOL)consentDisplayOnly;
- (BOOL)isSourceEditable;
- (BOOL)userConsentConfirmed;
- (LTUIRemoteViewController)remoteViewController;
- (LTUISourceMeta)sourceMeta;
- (LTUITranslationViewController)init;
- (LTUITranslationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSArray)ignoredAttributes;
- (NSAttributedString)text;
- (NSCopying)requestID;
- (NSExtension)currentExtension;
- (NSLocale)sourceLocale;
- (NSLocale)targetLocale;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)_sheetPresentationController;
- (id)_userInfo;
- (id)dismissCompletionHandler;
- (id)matchingToken;
- (id)replacementHandler;
- (void)_cleanUpExtension;
- (void)_insertBackground;
- (void)_presentError:(id)a3;
- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)_presentationControllerDidDismiss:(id)a3;
- (void)_refreshExtensionList;
- (void)_removeBackground;
- (void)_setChildController:(id)a3;
- (void)confirmUserConsent;
- (void)didMoveToParentViewController:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)dismiss;
- (void)expandSheet;
- (void)finishWithError:(id)a3;
- (void)finishWithTranslation:(id)a3;
- (void)invalidate;
- (void)receiveExtensions:(id)a3;
- (void)setConsentDisplayOnly:(BOOL)a3;
- (void)setCurrentExtension:(id)a3;
- (void)setDismissCompletionHandler:(id)a3;
- (void)setIgnoredAttributes:(id)a3;
- (void)setIsSourceEditable:(BOOL)a3;
- (void)setMatchingToken:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setReplacementHandler:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setSourceLocale:(id)a3;
- (void)setSourceMeta:(id)a3;
- (void)setTargetLocale:(id)a3;
- (void)setText:(id)a3;
- (void)setUserConsentConfirmed:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation LTUITranslationViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    instrumentationLog = _LTOSLogSignpost();
    MEMORY[0x270F9A758]();
  }
}

+ (BOOL)isAvailable
{
  return MEMORY[0x270ED8070]("Translate", "system");
}

- (LTUITranslationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)LTUITranslationViewController;
  v4 = [(LTUITranslationViewController *)&v13 initWithNibName:0 bundle:0];
  if (v4)
  {
    if (([(id)objc_opt_class() isAvailable] & 1) == 0)
    {
      v5 = _LTOSLogSystemTranslation();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[LTUITranslationViewController initWithNibName:bundle:]();
      }
    }
    ignoredAttributes = v4->_ignoredAttributes;
    v4->_ignoredAttributes = (NSArray *)MEMORY[0x263EFFA68];

    [(LTUITranslationViewController *)v4 _refreshExtensionList];
    v4->os_signpost_id_t cplID = os_signpost_id_generate((os_log_t)instrumentationLog);
    v7 = (id)instrumentationLog;
    v8 = v7;
    os_signpost_id_t cplID = v4->cplID;
    if (cplID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_2180E5000, v8, OS_SIGNPOST_INTERVAL_BEGIN, cplID, "CPL", " enableTelemetry=YES ", v12, 2u);
    }

    v10 = v4;
  }

  return v4;
}

- (LTUITranslationViewController)init
{
  v2 = [(LTUITranslationViewController *)self initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)didReceiveMemoryWarning
{
  v3.receiver = self;
  v3.super_class = (Class)LTUITranslationViewController;
  [(LTUITranslationViewController *)&v3 didReceiveMemoryWarning];
  [(LTUITranslationViewController *)self invalidate];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)LTUITranslationViewController;
  [(LTUITranslationViewController *)&v3 viewDidLoad];
  [(LTUITranslationViewController *)self _insertBackground];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)LTUITranslationViewController;
  [(LTUITranslationViewController *)&v5 viewDidLayoutSubviews];
  uint64_t v3 = [(LTUITranslationViewController *)self _isInPopoverPresentation];
  v4 = [(_UIRemoteViewController *)self->_remoteViewController serviceViewControllerProxy];
  [v4 adaptForPresentationInPopover:v3];
}

- (void)willMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LTUITranslationViewController;
  -[LTUITranslationViewController willMoveToParentViewController:](&v7, sel_willMoveToParentViewController_);
  if (a3)
  {
    uint64_t v5 = [(LTUITranslationViewController *)self _isInPopoverPresentation];
    v6 = [(_UIRemoteViewController *)self->_remoteViewController serviceViewControllerProxy];
    [v6 adaptForPresentationInPopover:v5];
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LTUITranslationViewController;
  -[LTUITranslationViewController didMoveToParentViewController:](&v7, sel_didMoveToParentViewController_);
  if (a3)
  {
    uint64_t v5 = [(LTUITranslationViewController *)self _isInPopoverPresentation];
    v6 = [(_UIRemoteViewController *)self->_remoteViewController serviceViewControllerProxy];
    [v6 adaptForPresentationInPopover:v5];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LTUITranslationViewController;
  [(LTUITranslationViewController *)&v5 viewWillAppear:a3];
  v4 = [(LTUITranslationViewController *)self presentationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 _setBackgroundBlurDisabled:1];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LTUITranslationViewController;
  [(LTUITranslationViewController *)&v6 viewDidDisappear:a3];
  v4 = [(LTUITranslationViewController *)self dismissCompletionHandler];

  if (v4)
  {
    objc_super v5 = [(LTUITranslationViewController *)self dismissCompletionHandler];
    v5[2]();

    [(LTUITranslationViewController *)self setDismissCompletionHandler:0];
  }
  [(LTUITranslationViewController *)self _cleanUpExtension];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteViewController;
}

- (void)_refreshExtensionList
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v13 = *MEMORY[0x263F07FF8];
  v14[0] = kLTUIViewServiceProtocol;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  objc_initWeak(&location, self);
  self->os_signpost_id_t extensionQueryID = os_signpost_id_generate((os_log_t)instrumentationLog);
  v4 = (id)instrumentationLog;
  objc_super v5 = v4;
  os_signpost_id_t extensionQueryID = self->extensionQueryID;
  if (extensionQueryID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2180E5000, v5, OS_SIGNPOST_INTERVAL_BEGIN, extensionQueryID, "RemoteViewControllerSetup", "", buf, 2u);
  }

  objc_super v7 = (void *)MEMORY[0x263F08800];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__LTUITranslationViewController__refreshExtensionList__block_invoke;
  v9[3] = &unk_2642FFD98;
  objc_copyWeak(&v10, &location);
  v8 = [v7 beginMatchingExtensionsWithAttributes:v3 completion:v9];
  [(LTUITranslationViewController *)self setMatchingToken:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __54__LTUITranslationViewController__refreshExtensionList__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (v6)
  {
    v9 = _LTOSLogXPC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __54__LTUITranslationViewController__refreshExtensionList__block_invoke_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
      if (!v8) {
        goto LABEL_9;
      }
      goto LABEL_4;
    }
    if (v8)
    {
LABEL_4:
      v16 = (id *)v19;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __54__LTUITranslationViewController__refreshExtensionList__block_invoke_19;
      v19[3] = &unk_2642FFD70;
      v19[4] = v8;
      v17 = v6;
LABEL_8:
      v16[5] = v17;
      dispatch_async(MEMORY[0x263EF83A0], v16);
    }
  }
  else if (WeakRetained && [v5 count])
  {
    v16 = (id *)v18;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__LTUITranslationViewController__refreshExtensionList__block_invoke_2;
    v18[3] = &unk_2642FFD70;
    v18[4] = v8;
    v17 = v5;
    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __54__LTUITranslationViewController__refreshExtensionList__block_invoke_19(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentError:*(void *)(a1 + 40)];
}

uint64_t __54__LTUITranslationViewController__refreshExtensionList__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiveExtensions:*(void *)(a1 + 40)];
}

- (void)_presentError:(id)a3
{
  id v4 = a3;
  id v5 = _LTOSLogSystemTranslation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[LTUITranslationViewController _presentError:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  [(LTUITranslationViewController *)self _cleanUpExtension];
}

- (id)_userInfo
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08AB0] processInfo];
  id v4 = [v3 arguments];
  uint64_t v5 = [v4 containsObject:@"-SkipFirstUse"];

  uint64_t v6 = _LTOSLogOnboarding();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v25 = v5;
    _os_log_impl(&dword_2180E5000, v6, OS_LOG_TYPE_INFO, "Skip first use consent: %{BOOL}i", buf, 8u);
  }
  uint64_t v7 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[LTUITranslationViewController consentDisplayOnly](self, "consentDisplayOnly", @"ConsentDisplayOnly"));
  v23[0] = v8;
  v22[1] = @"SkipFirstUse";
  uint64_t v9 = [NSNumber numberWithBool:v5];
  v23[1] = v9;
  v22[2] = @"ReplacementAvailable";
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[LTUITranslationViewController isSourceEditable](self, "isSourceEditable"));
  v23[2] = v10;
  v22[3] = @"IgnoredAttributes";
  uint64_t v11 = [(LTUITranslationViewController *)self ignoredAttributes];
  v23[3] = v11;
  v22[4] = @"CPLIntervalID";
  uint64_t v12 = [NSNumber numberWithUnsignedLongLong:self->cplID];
  v23[4] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];
  uint64_t v14 = [v7 dictionaryWithDictionary:v13];

  sourceMeta = self->_sourceMeta;
  if (sourceMeta)
  {
    v16 = [(LTUISourceMeta *)sourceMeta dictionaryRepresentation];
    [v14 setObject:v16 forKeyedSubscript:@"SourceMeta"];
  }
  sourceLocale = self->_sourceLocale;
  if (sourceLocale)
  {
    v18 = [(NSLocale *)sourceLocale localeIdentifier];
    [v14 setObject:v18 forKeyedSubscript:@"SourceLocale"];
  }
  targetLocale = self->_targetLocale;
  if (targetLocale)
  {
    v20 = [(NSLocale *)targetLocale localeIdentifier];
    [v14 setObject:v20 forKeyedSubscript:@"TargetLocale"];
  }

  return v14;
}

- (void)receiveExtensions:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        int v11 = [v10 isEqualToString:@"com.apple.TranslationUIServices.TranslationUIService"];

        if (v11)
        {
          id v12 = v9;

          uint64_t v6 = v12;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v5);

    if (v6)
    {
      [(LTUITranslationViewController *)self setCurrentExtension:v6];
      id v13 = objc_alloc_init(MEMORY[0x263F08810]);
      uint64_t v14 = [(LTUITranslationViewController *)self _userInfo];
      [v13 setUserInfo:v14];
      uint64_t v15 = [(LTUITranslationViewController *)self text];

      if (v15)
      {
        id v16 = objc_alloc(MEMORY[0x263F086A0]);
        v17 = [(LTUITranslationViewController *)self text];
        v18 = [v17 string];
        v19 = (void *)[v16 initWithString:v18];
        [v13 setAttributedContentText:v19];
      }
      else
      {
        v21 = _LTOSLogSystemTranslation();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[LTUITranslationViewController receiveExtensions:]();
        }
      }
      objc_initWeak(&location, self);
      v22 = _LTOSLogSystemTranslation();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2180E5000, v22, OS_LOG_TYPE_INFO, "System-wide translation requested", buf, 2u);
      }
      v23 = _LTOSLogSystemTranslation();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v36 = v14;
        _os_log_impl(&dword_2180E5000, v23, OS_LOG_TYPE_INFO, "Starting translation with user info: %{public}@", buf, 0xCu);
      }
      [(LTUITranslationViewController *)self _beginDelayingPresentation:0 cancellationHandler:3.0];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __51__LTUITranslationViewController_receiveExtensions___block_invoke;
      v27[3] = &unk_2642FFDC0;
      objc_copyWeak(&v28, &location);
      [v6 setRequestInterruptionBlock:v27];
      id v34 = v13;
      v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __51__LTUITranslationViewController_receiveExtensions___block_invoke_34;
      v25[3] = &unk_2642FFE10;
      objc_copyWeak(&v26, &location);
      [v6 instantiateViewControllerWithInputItems:v24 connectionHandler:v25];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);

      goto LABEL_23;
    }
  }
  else
  {
  }
  v20 = _LTOSLogSystemTranslation();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    -[LTUITranslationViewController receiveExtensions:]();
  }
LABEL_23:
}

void __51__LTUITranslationViewController_receiveExtensions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__LTUITranslationViewController_receiveExtensions___block_invoke_2;
    block[3] = &unk_2642FFD00;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __51__LTUITranslationViewController_receiveExtensions___block_invoke_2(uint64_t a1)
{
  v2 = _LTOSLogSystemTranslation();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __51__LTUITranslationViewController_receiveExtensions___block_invoke_2_cold_1();
  }
  uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationUIServicesErrorDomain" code:1 userInfo:0];
  [*(id *)(a1 + 32) finishWithError:v3];
}

void __51__LTUITranslationViewController_receiveExtensions___block_invoke_34(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__LTUITranslationViewController_receiveExtensions___block_invoke_2_35;
  v13[3] = &unk_2642FFDE8;
  id v14 = v9;
  id v10 = v9;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  id v15 = v7;
  id v16 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v13);

  objc_destroyWeak(&v17);
}

void __51__LTUITranslationViewController_receiveExtensions___block_invoke_2_35(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = _LTOSLogSystemTranslation();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __51__LTUITranslationViewController_receiveExtensions___block_invoke_2_35_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained finishWithError:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = objc_loadWeakRetained((id *)(a1 + 56));
    [v12 setRequestID:v11];

    id v13 = objc_loadWeakRetained((id *)(a1 + 56));
    [v13 setRemoteViewController:*(void *)(a1 + 48)];

    id v14 = objc_loadWeakRetained((id *)(a1 + 56));
    [v14 _endDelayingPresentation];
  }
}

- (void)_setChildController:(id)a3
{
  id v4 = a3;
  [(LTUITranslationViewController *)self addChildViewController:v4];
  uint64_t v5 = (void *)MEMORY[0x263F1CB60];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__LTUITranslationViewController__setChildController___block_invoke;
  v7[3] = &unk_2642FFD70;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 performWithoutAnimation:v7];
}

void __53__LTUITranslationViewController__setChildController___block_invoke(uint64_t a1)
{
  v22[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v3 = [*(id *)(a1 + 40) view];
  [v3 addSubview:v2];

  id v14 = (void *)MEMORY[0x263F08938];
  v20 = [v2 topAnchor];
  v21 = [*(id *)(a1 + 40) view];
  v19 = [v21 topAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v22[0] = v18;
  id v17 = [*(id *)(a1 + 40) view];
  id v16 = [v17 bottomAnchor];
  id v15 = [v2 bottomAnchor];
  id v13 = [v16 constraintEqualToAnchor:v15];
  v22[1] = v13;
  id v12 = [v2 leadingAnchor];
  id v4 = [*(id *)(a1 + 40) view];
  uint64_t v5 = [v4 leadingAnchor];
  id v6 = [v12 constraintEqualToAnchor:v5];
  v22[2] = v6;
  uint64_t v7 = [*(id *)(a1 + 40) view];
  id v8 = [v7 trailingAnchor];
  uint64_t v9 = [v2 trailingAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  v22[3] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  [v14 activateConstraints:v11];

  [*(id *)(a1 + 32) didMoveToParentViewController:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) preferredContentSize];
  [*(id *)(a1 + 40) setPreferredContentSize:0.0];
}

- (void)setRemoteViewController:(id)a3
{
  id v5 = a3;
  p_remoteViewController = &self->_remoteViewController;
  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    id v8 = [(LTUIRemoteViewController *)remoteViewController view];
    [v8 removeFromSuperview];

    [(LTUIRemoteViewController *)*p_remoteViewController removeFromParentViewController];
  }
  objc_storeStrong((id *)&self->_remoteViewController, a3);
  [(LTUIRemoteViewController *)*p_remoteViewController setDelegate:self];
  if (*p_remoteViewController)
  {
    -[LTUITranslationViewController _setChildController:](self, "_setChildController:");
    uint64_t v9 = [(LTUITranslationViewController *)self _isInPopoverPresentation];
    id v10 = [(_UIRemoteViewController *)*p_remoteViewController serviceViewControllerProxy];
    [v10 adaptForPresentationInPopover:v9];

    uint64_t v11 = (id)instrumentationLog;
    id v12 = v11;
    os_signpost_id_t extensionQueryID = self->extensionQueryID;
    if (extensionQueryID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)id v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_2180E5000, v12, OS_SIGNPOST_INTERVAL_END, extensionQueryID, "RemoteViewControllerSetup", "", v14, 2u);
    }
  }
}

- (void)invalidate
{
  [(LTUITranslationViewController *)self setRemoteViewController:0];

  [(LTUITranslationViewController *)self _cleanUpExtension];
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [[LTUIErrorViewController alloc] initWithError:v4];
  id v6 = _LTOSLogSystemTranslation();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[LTUITranslationViewController finishWithError:]((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }
  [(LTUITranslationViewController *)self _insertBackground];
  [(LTUITranslationViewController *)self _setChildController:v5];
  [(LTUITranslationViewController *)self _cleanUpExtension];
}

- (void)_cleanUpExtension
{
  uint64_t v3 = (void *)MEMORY[0x263F08800];
  id v4 = [(LTUITranslationViewController *)self matchingToken];
  [v3 endMatchingExtensions:v4];

  [(LTUITranslationViewController *)self setMatchingToken:0];
  id v5 = [(LTUITranslationViewController *)self currentExtension];
  id v6 = [(LTUITranslationViewController *)self requestID];
  [v5 cancelExtensionRequestWithIdentifier:v6];

  [(LTUITranslationViewController *)self setCurrentExtension:0];

  [(LTUITranslationViewController *)self setRequestID:0];
}

- (void)finishWithTranslation:(id)a3
{
  replacementHandler = (void (**)(id, id))self->_replacementHandler;
  if (replacementHandler) {
    replacementHandler[2](replacementHandler, a3);
  }

  [(LTUITranslationViewController *)self dismiss];
}

- (void)dismiss
{
  uint64_t v3 = _LTOSLogSystemTranslation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2180E5000, v3, OS_LOG_TYPE_INFO, "Dismissing system view controller", v5, 2u);
  }
  id v4 = [(LTUITranslationViewController *)self dismissCompletionHandler];
  [(LTUITranslationViewController *)self dismissViewControllerAnimated:1 completion:v4];

  [(LTUITranslationViewController *)self setDismissCompletionHandler:0];
  [(LTUITranslationViewController *)self _cleanUpExtension];
}

- (void)confirmUserConsent
{
  uint64_t v3 = _LTOSLogOnboarding();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2180E5000, v3, OS_LOG_TYPE_DEFAULT, "User confirmed consent to using system translation", v4, 2u);
  }
  [(LTUITranslationViewController *)self setUserConsentConfirmed:1];
  [(LTUITranslationViewController *)self dismiss];
}

- (void)expandSheet
{
  uint64_t v3 = [(LTUITranslationViewController *)self _sheetPresentationController];
  id v4 = [v3 detents];
  unint64_t v5 = [v4 count];

  if (v3 && v5 >= 2)
  {
    id v6 = (void *)MEMORY[0x263F1CB60];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__LTUITranslationViewController_expandSheet__block_invoke;
    v7[3] = &unk_2642FFD70;
    id v8 = v3;
    uint64_t v9 = self;
    [v6 _animateUsingDefaultDampedSpringWithDelay:2 initialSpringVelocity:v7 options:0 animations:0.0 completion:0.0];
  }
}

void __44__LTUITranslationViewController_expandSheet__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F1C988] largeDetent];
  uint64_t v3 = [v2 identifier];
  [*(id *)(a1 + 32) setSelectedDetentIdentifier:v3];

  id v5 = [*(id *)(a1 + 40) view];
  id v4 = [v5 window];
  [v4 layoutIfNeeded];
}

- (void)_insertBackground
{
  uint64_t v3 = [(LTUITranslationViewController *)self view];
  id v4 = [v3 viewWithTag:101];

  if (!v4)
  {
    id v8 = [MEMORY[0x263F1C480] effectWithStyle:9];
    id v5 = (void *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v8];
    [v5 setTag:101];
    id v6 = [(LTUITranslationViewController *)self view];
    [v6 bounds];
    objc_msgSend(v5, "setFrame:");

    [v5 setAutoresizingMask:18];
    uint64_t v7 = [(LTUITranslationViewController *)self view];
    [v7 insertSubview:v5 atIndex:0];
  }
}

- (void)_removeBackground
{
  uint64_t v2 = [(LTUITranslationViewController *)self view];
  id v3 = [v2 viewWithTag:101];

  [v3 removeFromSuperview];
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  v9[2] = *MEMORY[0x263EF8340];
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 _setShouldDismissWhenTappedOutside:1];
    id v6 = [MEMORY[0x263F1C988] mediumDetent];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x263F1C988] largeDetent];
    v9[1] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
    [v5 setDetents:v8];

    [v5 setLargestUndimmedDetentIdentifier:0];
    [v5 setPrefersGrabberVisible:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 _setBackgroundBlurDisabled:1];
  }
}

- (void)_presentationControllerDidDismiss:(id)a3
{
  id v4 = [(LTUITranslationViewController *)self dismissCompletionHandler];

  if (v4)
  {
    id v5 = [(LTUITranslationViewController *)self dismissCompletionHandler];
    v5[2]();

    [(LTUITranslationViewController *)self setDismissCompletionHandler:0];
  }
}

- (id)_sheetPresentationController
{
  uint64_t v2 = [(LTUITranslationViewController *)self _existingPresentationControllerImmediate:0 effective:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)consentDisplayOnly
{
  return self->_consentDisplayOnly;
}

- (void)setConsentDisplayOnly:(BOOL)a3
{
  self->_consentDisplayOnly = a3;
}

- (BOOL)userConsentConfirmed
{
  return self->_userConsentConfirmed;
}

- (void)setUserConsentConfirmed:(BOOL)a3
{
  self->_userConsentConfirmed = a3;
}

- (NSAttributedString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSLocale)sourceLocale
{
  return self->_sourceLocale;
}

- (void)setSourceLocale:(id)a3
{
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void)setTargetLocale:(id)a3
{
}

- (NSArray)ignoredAttributes
{
  return self->_ignoredAttributes;
}

- (void)setIgnoredAttributes:(id)a3
{
}

- (BOOL)isSourceEditable
{
  return self->_isSourceEditable;
}

- (void)setIsSourceEditable:(BOOL)a3
{
  self->_isSourceEditable = a3;
}

- (LTUISourceMeta)sourceMeta
{
  return self->_sourceMeta;
}

- (void)setSourceMeta:(id)a3
{
}

- (id)replacementHandler
{
  return self->_replacementHandler;
}

- (void)setReplacementHandler:(id)a3
{
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
}

- (id)matchingToken
{
  return self->_matchingToken;
}

- (void)setMatchingToken:(id)a3
{
}

- (NSCopying)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSExtension)currentExtension
{
  return self->_currentExtension;
}

- (void)setCurrentExtension:(id)a3
{
}

- (LTUIRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_currentExtension, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong(&self->_matchingToken, 0);
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_storeStrong(&self->_replacementHandler, 0);
  objc_storeStrong((id *)&self->_sourceMeta, 0);
  objc_storeStrong((id *)&self->_ignoredAttributes, 0);
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_2180E5000, v0, OS_LOG_TYPE_FAULT, "Attempting to use system translation on a platform that doesn't support it. Clients need to first call LTUITranslationViewController.isAvailable before initializing", v1, 2u);
}

void __54__LTUITranslationViewController__refreshExtensionList__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_presentError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)receiveExtensions:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_2180E5000, v0, OS_LOG_TYPE_FAULT, "Failed to find TranslationUI service", v1, 2u);
}

- (void)receiveExtensions:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2180E5000, v0, OS_LOG_TYPE_ERROR, "Attempting to initiate translation without text to translate", v1, 2u);
}

void __51__LTUITranslationViewController_receiveExtensions___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2180E5000, v0, OS_LOG_TYPE_ERROR, "Extension request was inturrupted", v1, 2u);
}

void __51__LTUITranslationViewController_receiveExtensions___block_invoke_2_35_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)finishWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

@end