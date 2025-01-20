@interface TSSecureIntentGestureViewController
- (BOOL)isExternalizedContextSent;
- (BOOL)isLocalConvertFlow;
- (BOOL)isSecureIntentFailed;
- (LAUIPhysicalButtonView)physicalButtonView;
- (NSData)externalizedContext;
- (NSString)descriptor;
- (PKGlyphView)glyphView;
- (PRXAction)confirmTextView;
- (TSSIMSetupFlowDelegate)delegate;
- (TSSecureIntentGestureViewController)initWithExternalizedContext:(id)a3 descriptor:(id)a4 isLocalConvertFlow:(BOOL)a5;
- (id)_createPKGlyphView;
- (void)_doubleClickGesture;
- (void)_handleUserCancelNotification:(id)a3;
- (void)_maybeSendExternalizedContext:(id)a3;
- (void)_updateAuthenticationStatus:(id)a3;
- (void)_updateLayoutConstraint;
- (void)dealloc;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)setConfirmTextView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setExternalizedContext:(id)a3;
- (void)setGlyphView:(id)a3;
- (void)setIsExternalizedContextSent:(BOOL)a3;
- (void)setIsLocalConvertFlow:(BOOL)a3;
- (void)setIsSecureIntentFailed:(BOOL)a3;
- (void)setPhysicalButtonView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TSSecureIntentGestureViewController

- (TSSecureIntentGestureViewController)initWithExternalizedContext:(id)a3 descriptor:(id)a4 isLocalConvertFlow:(BOOL)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TSSecureIntentGestureViewController;
  v11 = [(TSSecureIntentGestureViewController *)&v15 init];
  if (v11)
  {
    v12 = _TSLogDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v9;
      __int16 v18 = 2080;
      v19 = "-[TSSecureIntentGestureViewController initWithExternalizedContext:descriptor:isLocalConvertFlow:]";
      _os_log_impl(&dword_227A17000, v12, OS_LOG_TYPE_DEFAULT, "externalized context = %@ @%s", buf, 0x16u);
    }

    objc_storeStrong((id *)&v11->_externalizedContext, a3);
    objc_storeStrong((id *)&v11->_descriptor, a4);
    v11->_isExternalizedContextSent = 0;
    v11->_isSecureIntentFailed = 0;
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v11 selector:sel__handleUserCancelNotification_ name:@"ss.user.canceled" object:0];

    v11->_isLocalConvertFlow = a5;
  }

  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TSSecureIntentGestureViewController;
  [(TSSecureIntentGestureViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)TSSecureIntentGestureViewController;
  [(TSSecureIntentGestureViewController *)&v24 viewDidLoad];
  if (!self->_glyphView)
  {
    puts("in viewDidLoad secure intent");
    printf("isLocalConvertFlow: %d\n", self->_isLocalConvertFlow);
    BOOL isLocalConvertFlow = self->_isLocalConvertFlow;
    objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = v4;
    if (isLocalConvertFlow) {
      v6 = @"CONFIRM_CONVERT";
    }
    else {
      v6 = @"CONFIRM_TRANSFER";
    }
    v7 = [v4 localizedStringForKey:v6 value:&stru_26DBE8E78 table:@"Localizable"];
    [(TSSecureIntentGestureViewController *)self setTitle:v7];

    if (self->_isLocalConvertFlow)
    {
      v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v9 = v8;
      id v10 = @"DOUBLE_CLICK_SIDE_BUTTON_LOCAL_CONVERT";
    }
    else
    {
      if ([(NSString *)self->_descriptor length])
      {
        v12 = NSString;
        id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v11 = [v9 localizedStringForKey:@"DOUBLE_CLICK_SIDE_BUTTON_%@" value:&stru_26DBE8E78 table:@"Localizable"];
        v13 = objc_msgSend(v12, "stringWithFormat:", v11, self->_descriptor);
        [(TSSecureIntentGestureViewController *)self setSubtitle:v13];

        goto LABEL_10;
      }
      v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v9 = v8;
      id v10 = @"DOUBLE_CLICK_SIDE_BUTTON_NO_DESCRIPTOR";
    }
    v11 = [v8 localizedStringForKey:v10 value:&stru_26DBE8E78 table:@"Localizable"];
    [(TSSecureIntentGestureViewController *)self setSubtitle:v11];
LABEL_10:

    [(TSSecureIntentGestureViewController *)self setDismissalType:1];
    objc_initWeak(&location, self);
    v14 = (void *)MEMORY[0x263F62360];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __50__TSSecureIntentGestureViewController_viewDidLoad__block_invoke;
    v21[3] = &unk_264827C58;
    objc_copyWeak(&v22, &location);
    objc_super v15 = [v14 actionWithTitle:&stru_26DBE8E78 style:0 handler:v21];
    [(TSSecureIntentGestureViewController *)self setDismissButtonAction:v15];

    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v17 = [v16 localizedStringForKey:@"READY..." value:&stru_26DBE8E78 table:@"Localizable"];
    [(TSSecureIntentGestureViewController *)self showActivityIndicatorWithStatus:v17];

    __int16 v18 = [(TSSecureIntentGestureViewController *)self _createPKGlyphView];
    glyphView = self->_glyphView;
    self->_glyphView = v18;

    [(PKGlyphView *)self->_glyphView setState:2];
    [(PKGlyphView *)self->_glyphView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v20 = [(TSSecureIntentGestureViewController *)self contentView];
    [v20 addSubview:self->_glyphView];

    [(TSSecureIntentGestureViewController *)self _updateLayoutConstraint];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __50__TSSecureIntentGestureViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:89 userInfo:0];
  [WeakRetained _maybeSendExternalizedContext:v3];

  id v5 = objc_loadWeakRetained(v1);
  objc_super v4 = [v5 delegate];
  [v4 userDidTapCancel];
}

- (void)viewDidAppear:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)TSSecureIntentGestureViewController;
  [(TSSecureIntentGestureViewController *)&v19 viewDidAppear:a3];
  [(TSSecureIntentGestureViewController *)self _doubleClickGesture];
  if (!self->_physicalButtonView)
  {
    objc_super v4 = (LAUIPhysicalButtonView *)[objc_alloc(MEMORY[0x263F52588]) initWithStyle:1];
    physicalButtonView = self->_physicalButtonView;
    self->_physicalButtonView = v4;

    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"DOUBLE_CLICK_TO_CONFIRM" value:&stru_26DBE8E78 table:@"Localizable"];
    [(LAUIPhysicalButtonView *)self->_physicalButtonView setInstruction:v7];

    [(LAUIPhysicalButtonView *)self->_physicalButtonView setAnimationStyle:1];
  }
  v8 = [(TSSecureIntentGestureViewController *)self view];
  id v9 = [v8 window];

  if (v9)
  {
    id v10 = [(TSSecureIntentGestureViewController *)self view];
    v11 = [v10 window];
    [v11 addSubview:self->_physicalButtonView];
  }
  else
  {
    id v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TSSecureIntentGestureViewController viewDidAppear:](v10, v12, v13, v14, v15, v16, v17, v18);
    }
  }

  [(LAUIPhysicalButtonView *)self->_physicalButtonView setAnimating:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TSSecureIntentGestureViewController viewWillDisappear:](v5);
  }

  [(LAUIPhysicalButtonView *)self->_physicalButtonView setAnimating:0];
  [(LAUIPhysicalButtonView *)self->_physicalButtonView removeFromSuperview];
  [(TSSecureIntentGestureViewController *)self _maybeSendExternalizedContext:0];
  v6.receiver = self;
  v6.super_class = (Class)TSSecureIntentGestureViewController;
  [(TSSecureIntentGestureViewController *)&v6 viewWillDisappear:v3];
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
}

- (void)_doubleClickGesture
{
}

void __58__TSSecureIntentGestureViewController__doubleClickGesture__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = _TSLogDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2080;
    id v22 = "-[TSSecureIntentGestureViewController _doubleClickGesture]_block_invoke";
    _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "evaluateAccessControl reply:%@, error:%@, ctx:%@ @%s", buf, 0x2Au);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__TSSecureIntentGestureViewController__doubleClickGesture__block_invoke_73;
  v12[3] = &unk_264827B08;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v13 = v6;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v12);

  objc_destroyWeak(&v14);
}

void __58__TSSecureIntentGestureViewController__doubleClickGesture__block_invoke_73(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v4 = [WeakRetained physicalButtonView];
  [v4 setAnimating:0];

  id v5 = objc_loadWeakRetained(v2);
  [v5 _updateAuthenticationStatus:*(void *)(a1 + 32)];
}

- (void)_updateAuthenticationStatus:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [(PKGlyphView *)self->_glyphView bounds];
  double v6 = v5;
  v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 scale];
  double v9 = v6 * 0.439999998 / v8;

  id v10 = [MEMORY[0x263F82818] configurationWithPointSize:4 weight:v9];
  if (v4) {
    id v11 = @"exclamationmark";
  }
  else {
    id v11 = @"checkmark";
  }
  uint64_t v12 = [MEMORY[0x263F827E8] systemImageNamed:v11 withConfiguration:v10];
  if (v4) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 1;
  }
  [(PKGlyphView *)self->_glyphView setColorMode:v13 animated:1];
  id v14 = [(PKGlyphView *)self->_glyphView primaryColor];
  uint64_t v15 = [v12 _flatImageWithColor:v14];

  glyphView = self->_glyphView;
  id v17 = v15;
  uint64_t v18 = [v17 CGImage];
  [v17 alignmentRectInsets];
  -[PKGlyphView setCustomImage:withAlignmentEdgeInsets:](glyphView, "setCustomImage:withAlignmentEdgeInsets:", v18);
  __int16 v19 = self->_glyphView;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __67__TSSecureIntentGestureViewController__updateAuthenticationStatus___block_invoke;
  v21[3] = &unk_264827958;
  objc_copyWeak(&v23, &location);
  id v20 = v4;
  id v22 = v20;
  [(PKGlyphView *)v19 setState:10 animated:1 completionHandler:v21];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __67__TSSecureIntentGestureViewController__updateAuthenticationStatus___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__TSSecureIntentGestureViewController__updateAuthenticationStatus___block_invoke_2;
  v3[3] = &unk_264827B08;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x263EF83A0], v3);

  objc_destroyWeak(&v5);
}

void __67__TSSecureIntentGestureViewController__updateAuthenticationStatus___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_time_t v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    double v9 = "-[TSSecureIntentGestureViewController _updateAuthenticationStatus:]_block_invoke_2";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "1s expired, dismiss UI @%s", (uint8_t *)&v8, 0xCu);
  }

  BOOL v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _maybeSendExternalizedContext:*(void *)(a1 + 32)];

  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  double v6 = [v5 delegate];
  id v7 = objc_loadWeakRetained(v3);
  [v6 viewControllerDidComplete:v7];
}

- (void)_maybeSendExternalizedContext:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!self->_isExternalizedContextSent)
  {
    self->_isExternalizedContextSent = 1;
    if (!v4)
    {
      if (!self->_externalizedContext)
      {
        uint64_t v10 = _TSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[TSSecureIntentGestureViewController _maybeSendExternalizedContext:](v10, v11, v12, v13, v14, v15, v16, v17);
        }
      }
      uint64_t v18 = _TSLogDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        externalizedContext = self->_externalizedContext;
        int v48 = 138412546;
        v49 = (const char *)externalizedContext;
        __int16 v50 = 2080;
        v51 = "-[TSSecureIntentGestureViewController _maybeSendExternalizedContext:]";
        _os_log_impl(&dword_227A17000, v18, OS_LOG_TYPE_DEFAULT, "notify secure intent data:%@ @%s", (uint8_t *)&v48, 0x16u);
      }

      id v20 = +[TSCoreTelephonyClientCache sharedInstance];
      double v6 = v20;
      __int16 v21 = self->_externalizedContext;
      goto LABEL_24;
    }
    id v7 = [v4 domain];
    if ([v7 isEqualToString:*MEMORY[0x263F07F70]])
    {
      uint64_t v8 = [v5 code];

      if (v8 == 89)
      {
        double v9 = _TSLogDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v48 = 136315138;
          v49 = "-[TSSecureIntentGestureViewController _maybeSendExternalizedContext:]";
          _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling secure intent @%s", (uint8_t *)&v48, 0xCu);
        }
LABEL_23:

        self->_isSecureIntentFailed = 1;
        id v20 = +[TSCoreTelephonyClientCache sharedInstance];
        double v6 = v20;
        __int16 v21 = 0;
LABEL_24:
        id v38 = (id)[v20 updateSecureIntentData:v21];
        goto LABEL_25;
      }
    }
    else
    {
    }
    id v22 = [v5 domain];
    int v23 = [v22 isEqualToString:@"com.apple.LocalAuthentication"];

    if (v23)
    {
      if ([v5 code] == -1003)
      {
        double v9 = _TSLogDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[TSSecureIntentGestureViewController _maybeSendExternalizedContext:](v9, v24, v25, v26, v27, v28, v29, v30);
        }
      }
      else
      {
        uint64_t v39 = [v5 code];
        double v9 = _TSLogDomain();
        BOOL v40 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
        if (v39 == -1007)
        {
          if (v40) {
            -[TSSecureIntentGestureViewController _maybeSendExternalizedContext:](v9, v41, v42, v43, v44, v45, v46, v47);
          }
        }
        else if (v40)
        {
          -[TSSecureIntentGestureViewController _maybeSendExternalizedContext:].cold.4(v9, v41, v42, v43, v44, v45, v46, v47);
        }
      }
    }
    else
    {
      double v9 = _TSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[TSSecureIntentGestureViewController _maybeSendExternalizedContext:].cold.5(v9, v31, v32, v33, v34, v35, v36, v37);
      }
    }
    goto LABEL_23;
  }
  double v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v48 = 136315138;
    v49 = "-[TSSecureIntentGestureViewController _maybeSendExternalizedContext:]";
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "already notify externalized context updated @%s", (uint8_t *)&v48, 0xCu);
  }
LABEL_25:
}

- (id)_createPKGlyphView
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  dispatch_time_t v2 = (void *)getPKGlyphViewClass_softClass;
  uint64_t v10 = getPKGlyphViewClass_softClass;
  if (!getPKGlyphViewClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getPKGlyphViewClass_block_invoke;
    v6[3] = &unk_264827BA8;
    v6[4] = &v7;
    __getPKGlyphViewClass_block_invoke((uint64_t)v6);
    dispatch_time_t v2 = (void *)v8[3];
  }
  BOOL v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = (void *)[[v3 alloc] initWithStyle:1];
  return v4;
}

- (void)_handleUserCancelNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [v4 object];
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 2080;
    uint64_t v12 = "-[TSSecureIntentGestureViewController _handleUserCancelNotification:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "user canceled with reason : %@ @%s", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:89 userInfo:0];
  [(TSSecureIntentGestureViewController *)self _maybeSendExternalizedContext:v7];

  uint64_t v8 = [(TSSecureIntentGestureViewController *)self delegate];
  [v8 userDidTapCancel];
}

- (void)_updateLayoutConstraint
{
  v31[5] = *MEMORY[0x263EF8340];
  BOOL v3 = [(TSSecureIntentGestureViewController *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if (v5 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v5;
  }
  double v9 = v8 * 0.275;
  id v22 = (void *)MEMORY[0x263F08938];
  uint64_t v29 = [(PKGlyphView *)self->_glyphView topAnchor];
  uint64_t v30 = [(TSSecureIntentGestureViewController *)self contentView];
  uint64_t v28 = [v30 mainContentGuide];
  uint64_t v27 = [v28 topAnchor];
  uint64_t v26 = [v29 constraintGreaterThanOrEqualToAnchor:v27];
  v31[0] = v26;
  uint64_t v24 = [(PKGlyphView *)self->_glyphView centerXAnchor];
  uint64_t v25 = [(TSSecureIntentGestureViewController *)self contentView];
  int v23 = [v25 mainContentGuide];
  __int16 v21 = [v23 centerXAnchor];
  id v20 = [v24 constraintEqualToAnchor:v21];
  v31[1] = v20;
  uint64_t v10 = [(PKGlyphView *)self->_glyphView centerYAnchor];
  __int16 v11 = [(TSSecureIntentGestureViewController *)self contentView];
  uint64_t v12 = [v11 mainContentGuide];
  uint64_t v13 = [v12 centerYAnchor];
  uint64_t v14 = [v10 constraintEqualToAnchor:v13];
  v31[2] = v14;
  uint64_t v15 = [(PKGlyphView *)self->_glyphView widthAnchor];
  uint64_t v16 = [v15 constraintEqualToConstant:v9];
  v31[3] = v16;
  uint64_t v17 = [(PKGlyphView *)self->_glyphView heightAnchor];
  uint64_t v18 = [v17 constraintEqualToConstant:v9];
  v31[4] = v18;
  __int16 v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:5];
  [v22 activateConstraints:v19];
}

- (BOOL)isSecureIntentFailed
{
  return self->_isSecureIntentFailed;
}

- (void)setIsSecureIntentFailed:(BOOL)a3
{
  self->_isSecureIntentFailed = a3;
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSData)externalizedContext
{
  return self->_externalizedContext;
}

- (void)setExternalizedContext:(id)a3
{
}

- (NSString)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (PRXAction)confirmTextView
{
  return self->_confirmTextView;
}

- (void)setConfirmTextView:(id)a3
{
}

- (LAUIPhysicalButtonView)physicalButtonView
{
  return self->_physicalButtonView;
}

- (void)setPhysicalButtonView:(id)a3
{
}

- (PKGlyphView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
}

- (BOOL)isExternalizedContextSent
{
  return self->_isExternalizedContextSent;
}

- (void)setIsExternalizedContextSent:(BOOL)a3
{
  self->_isExternalizedContextSent = a3;
}

- (BOOL)isLocalConvertFlow
{
  return self->_isLocalConvertFlow;
}

- (void)setIsLocalConvertFlow:(BOOL)a3
{
  self->_BOOL isLocalConvertFlow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_physicalButtonView, 0);
  objc_storeStrong((id *)&self->_confirmTextView, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_externalizedContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewDidAppear:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)viewWillDisappear:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  dispatch_time_t v2 = "-[TSSecureIntentGestureViewController viewWillDisappear:]";
  _os_log_debug_impl(&dword_227A17000, log, OS_LOG_TYPE_DEBUG, "[Db] secure intent view will disappear @%s", (uint8_t *)&v1, 0xCu);
}

- (void)_maybeSendExternalizedContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_maybeSendExternalizedContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_maybeSendExternalizedContext:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_maybeSendExternalizedContext:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_maybeSendExternalizedContext:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end