@interface SWContainerViewController
- (BOOL)allowUserInteractionForInteractionType:(unint64_t)a3;
- (BOOL)focusShouldStartInputSession;
- (BOOL)isKeyboardVisible;
- (BOOL)isPencilInputExpected;
- (BOOL)isTransitioning;
- (CGRect)convertedInputAccessoryViewFrame;
- (CGRect)convertedKeyboardFrame;
- (CGRect)inputAccessoryViewFrame;
- (CGRect)keyboardFrame;
- (NSURL)loadedURL;
- (SWActionProvider)actionProvider;
- (SWConfigurationManager)configurationManager;
- (SWContainerConfiguration)configuration;
- (SWContainerViewController)initWithWebContentViewController:(id)a3 actionProvider:(id)a4 interactionProvider:(id)a5 errorProvider:(id)a6 configurationManager:(id)a7 presentationManager:(id)a8 scaleManager:(id)a9 snapshotManager:(id)a10 preferredSizeManager:(id)a11;
- (SWDeveloperSettings)developerSettings;
- (SWErrorProvider)errorProvider;
- (SWInteractionProvider)interactionProvider;
- (SWMessageHandlerManager)messageHandlerManager;
- (SWPreferredSizeManager)preferredSizeManager;
- (SWPresentationManager)presentationManager;
- (SWScaleManager)scaleManager;
- (SWScriptsManager)scriptsManager;
- (SWSnapshotManager)snapshotManager;
- (SWViewController)webContentViewController;
- (UICoordinateSpace)keyboardCoordinateSpace;
- (id)accessibilityElements;
- (id)inputAccessoryView;
- (int64_t)networkStatus;
- (void)addContentRuleList:(id)a3 identifier:(id)a4;
- (void)dealloc;
- (void)handleKeyboardChange:(id)a3;
- (void)handleKeyboardHide:(id)a3;
- (void)handleKeyboardShow:(id)a3;
- (void)loadHTMLString:(id)a3 baseURL:(id)a4;
- (void)loadLocalDatastore:(id)a3 forceUpdate:(BOOL)a4 completion:(id)a5;
- (void)loadURL:(id)a3;
- (void)loadURL:(id)a3 cachePolicy:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prewarm;
- (void)reachabilityChanged:(id)a3;
- (void)removeMenusForIdentifiers:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDeveloperSettings:(id)a3;
- (void)setFocusShouldStartInputSession:(BOOL)a3;
- (void)setInputAccessoryView:(id)a3;
- (void)setInputAccessoryViewFrame:(CGRect)a3;
- (void)setIsKeyboardVisible:(BOOL)a3;
- (void)setIsPencilInputExpected:(BOOL)a3;
- (void)setIsTransitioning:(BOOL)a3;
- (void)setKeyboardCoordinateSpace:(id)a3;
- (void)setKeyboardFrame:(CGRect)a3;
- (void)setNetworkStatus:(int64_t)a3;
- (void)setShortcutsBarWithLeadingGroups:(id)a3 trailingGroups:(id)a4;
- (void)setTextInputTraits:(id)a3;
- (void)updateConfiguration;
- (void)updateReachability;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)webViewSetNeedsLayout;
@end

@implementation SWContainerViewController

- (SWContainerViewController)initWithWebContentViewController:(id)a3 actionProvider:(id)a4 interactionProvider:(id)a5 errorProvider:(id)a6 configurationManager:(id)a7 presentationManager:(id)a8 scaleManager:(id)a9 snapshotManager:(id)a10 preferredSizeManager:(id)a11
{
  id v38 = a3;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  id v34 = a7;
  id v33 = a8;
  id v32 = a9;
  id v31 = a10;
  id v30 = a11;
  v39.receiver = self;
  v39.super_class = (Class)SWContainerViewController;
  v18 = [(SWContainerViewController *)&v39 initWithNibName:0 bundle:0];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_webContentViewController, a3);
    objc_storeStrong((id *)&v19->_actionProvider, a4);
    objc_storeStrong((id *)&v19->_interactionProvider, a5);
    objc_storeStrong((id *)&v19->_errorProvider, a6);
    objc_storeStrong((id *)&v19->_configurationManager, a7);
    objc_storeStrong((id *)&v19->_presentationManager, a8);
    v20 = [[SWDeveloperSettings alloc] initWithAllowRemoteInspection:NFInternalBuild()];
    developerSettings = v19->_developerSettings;
    v19->_developerSettings = v20;

    objc_storeStrong((id *)&v19->_scaleManager, a9);
    objc_storeStrong((id *)&v19->_snapshotManager, a10);
    objc_storeStrong((id *)&v19->_preferredSizeManager, a11);
    CGPoint v28 = (CGPoint)*MEMORY[0x263F001A8];
    CGSize v29 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    v19->_keyboardFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
    v19->_keyboardFrame.size = v29;
    keyboardCoordinateSpace = v19->_keyboardCoordinateSpace;
    v19->_keyboardCoordinateSpace = 0;

    v19->_inputAccessoryViewFrame.origin = v28;
    v19->_inputAccessoryViewFrame.size = v29;
    v19->_isKeyboardVisible = 0;
    v19->_isPencilInputExpected = 0;
    v19->_networkStatus = 0;
    v23 = [MEMORY[0x263F08A00] defaultCenter];
    [v23 addObserver:v19 selector:sel_handleKeyboardShow_ name:*MEMORY[0x263F1D418] object:0];

    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v19 selector:sel_handleKeyboardChange_ name:*MEMORY[0x263F1D408] object:0];

    v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 addObserver:v19 selector:sel_handleKeyboardHide_ name:*MEMORY[0x263F1D480] object:0];

    v26 = [MEMORY[0x263F08A00] defaultCenter];
    [v26 addObserver:v19 selector:sel_reachabilityChanged_ name:*MEMORY[0x263F59EA0] object:0];

    [(id)objc_opt_class() addObserver:v19 forKeyPath:@"isPencilInputExpected" options:5 context:0];
    [(SWContainerViewController *)v19 updateReachability];
  }

  return v19;
}

- (void)dealloc
{
  [(id)objc_opt_class() removeObserver:self forKeyPath:@"isPencilInputExpected"];
  v3.receiver = self;
  v3.super_class = (Class)SWContainerViewController;
  [(SWContainerViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)SWContainerViewController;
  [(SWContainerViewController *)&v14 viewDidLoad];
  objc_super v3 = [(SWContainerViewController *)self view];
  v4 = [MEMORY[0x263F1C550] clearColor];
  [v3 setBackgroundColor:v4];

  v5 = [(SWContainerViewController *)self webContentViewController];
  [(SWContainerViewController *)self addChildViewController:v5];

  v6 = [(SWContainerViewController *)self view];
  v7 = [(SWContainerViewController *)self webContentViewController];
  v8 = [v7 view];
  [v6 addSubview:v8];

  v9 = [(SWContainerViewController *)self webContentViewController];
  [v9 didMoveToParentViewController:self];

  objc_initWeak(&location, self);
  v10 = [(SWContainerViewController *)self interactionProvider];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__SWContainerViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_2646FFF40;
  objc_copyWeak(&v12, &location);
  [v10 onChange:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __40__SWContainerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [WeakRetained view];
  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [v3 type];

  objc_msgSend(v4, "setUserInteractionEnabled:", objc_msgSend(v5, "allowUserInteractionForInteractionType:", v6));
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SWContainerViewController;
  [(SWContainerViewController *)&v6 viewDidLayoutSubviews];
  id v3 = [(SWContainerViewController *)self webContentViewController];
  v4 = [v3 view];
  id v5 = [(SWContainerViewController *)self view];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SWContainerViewController;
  -[SWContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  [(SWContainerViewController *)self setIsTransitioning:1];
  [(SWContainerViewController *)self updateConfiguration];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__SWContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_2646FFF68;
  objc_copyWeak(&v9, &location);
  [v7 animateAlongsideTransition:0 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __80__SWContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsTransitioning:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 updateConfiguration];
}

- (void)prewarm
{
  id v2 = [(SWContainerViewController *)self webContentViewController];
  [v2 prewarm];
}

- (void)webViewSetNeedsLayout
{
  id v2 = [(SWContainerViewController *)self webContentViewController];
  [v2 webViewSetNeedsLayout];
}

- (NSURL)loadedURL
{
  id v2 = [(SWContainerViewController *)self webContentViewController];
  id v3 = [v2 URL];

  return (NSURL *)v3;
}

- (void)loadURL:(id)a3
{
  id v4 = a3;
  id v5 = [(SWContainerViewController *)self webContentViewController];
  [v5 loadURL:v4];
}

- (void)loadURL:(id)a3 cachePolicy:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SWContainerViewController *)self webContentViewController];
  [v7 loadURL:v6 cachePolicy:a4];
}

- (void)loadHTMLString:(id)a3 baseURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SWContainerViewController *)self webContentViewController];
  [v8 loadHTMLString:v7 baseURL:v6];
}

- (void)loadLocalDatastore:(id)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SWContainerViewController *)self webContentViewController];
  [v10 loadLocalDatastore:v9 forceUpdate:v5 completion:v8];
}

- (void)setDeveloperSettings:(id)a3
{
  objc_storeStrong((id *)&self->_developerSettings, a3);
  id v5 = a3;
  id v7 = [(SWContainerViewController *)self webContentViewController];
  uint64_t v6 = [v5 allowRemoteInspection];

  [v7 setAllowsRemoteInspection:v6];
}

- (SWScriptsManager)scriptsManager
{
  id v2 = [(SWContainerViewController *)self webContentViewController];
  id v3 = [v2 scriptsManager];

  return (SWScriptsManager *)v3;
}

- (BOOL)allowUserInteractionForInteractionType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (void)setInputAccessoryView:(id)a3
{
  id v4 = a3;
  id v5 = [(SWContainerViewController *)self webContentViewController];
  [v5 setInputAccessoryView:v4];
}

- (id)inputAccessoryView
{
  id v2 = [(SWContainerViewController *)self webContentViewController];
  id v3 = [v2 inputAccessoryView];

  return v3;
}

- (void)setTextInputTraits:(id)a3
{
  id v4 = a3;
  id v5 = [(SWContainerViewController *)self webContentViewController];
  [v5 setTextInputTraits:v4];
}

- (void)setShortcutsBarWithLeadingGroups:(id)a3 trailingGroups:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SWContainerViewController *)self webContentViewController];
  [v8 setShortcutsBarWithLeadingGroups:v7 trailingGroups:v6];
}

- (void)setConfiguration:(id)a3
{
  id v4 = (SWContainerConfiguration *)[a3 copy];
  configuration = self->_configuration;
  self->_configuration = v4;

  [(SWContainerViewController *)self updateConfiguration];
}

- (void)updateConfiguration
{
  id v3 = [(SWContainerViewController *)self configuration];

  if (v3)
  {
    id v4 = [(SWContainerViewController *)self configuration];
    id v5 = +[SWConfiguration configurationWithContainerConfiguration:v4];
    id v27 = (id)[v5 mutableCopy];

    id v6 = [SWKeyboardConfiguration alloc];
    [(SWContainerViewController *)self convertedKeyboardFrame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(SWContainerViewController *)self convertedInputAccessoryViewFrame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    uint64_t v23 = [MEMORY[0x263F1C738] isSplit];
    uint64_t v24 = [MEMORY[0x263F1C738] isFloating];
    v25 = -[SWKeyboardConfiguration initWithKeyboardFrame:inputAccessoryViewFrame:isKeyboardSplit:isKeyboardFloating:isHardwareKeyboard:isKeyboardVisible:isPencilInputExpected:](v6, "initWithKeyboardFrame:inputAccessoryViewFrame:isKeyboardSplit:isKeyboardFloating:isHardwareKeyboard:isKeyboardVisible:isPencilInputExpected:", v23, v24, [MEMORY[0x263F1C710] isInHardwareKeyboardMode], -[SWContainerViewController isKeyboardVisible](self, "isKeyboardVisible"), -[SWContainerViewController isPencilInputExpected](self, "isPencilInputExpected"), v8, v10, v12, v14, v16, v18, v20, v22);
    [v27 setKeyboardConfiguration:v25];
    objc_msgSend(v27, "setNetworkStatus:", -[SWContainerViewController networkStatus](self, "networkStatus"));
    objc_msgSend(v27, "setIsTransitioning:", -[SWContainerViewController isTransitioning](self, "isTransitioning"));
    v26 = [(SWContainerViewController *)self configurationManager];
    [v26 setConfiguration:v27];
  }
}

- (void)setFocusShouldStartInputSession:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SWContainerViewController *)self webContentViewController];
  [v4 setFocusShouldStartInputSession:v3];
}

- (BOOL)focusShouldStartInputSession
{
  id v2 = [(SWContainerViewController *)self webContentViewController];
  char v3 = [v2 focusShouldStartInputSession];

  return v3;
}

- (SWMessageHandlerManager)messageHandlerManager
{
  id v2 = [(SWContainerViewController *)self webContentViewController];
  char v3 = [v2 messageHandlerManager];

  return (SWMessageHandlerManager *)v3;
}

- (id)accessibilityElements
{
  id v2 = [(SWContainerViewController *)self webContentViewController];
  char v3 = [v2 accessibilityElements];

  return v3;
}

- (void)handleKeyboardChange:(id)a3
{
  id v4 = a3;
  id v29 = [v4 userInfo];
  id v5 = [v29 objectForKey:*MEMORY[0x263F1D428]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = [v4 object];

  double v15 = [v14 coordinateSpace];

  -[SWContainerViewController setKeyboardFrame:](self, "setKeyboardFrame:", v7, v9, v11, v13);
  [(SWContainerViewController *)self setKeyboardCoordinateSpace:v15];
  double v16 = [(SWContainerViewController *)self webContentViewController];
  double v17 = [v16 inputAccessoryView];

  if (v17
    && ([v17 superview], double v18 = objc_claimAutoreleasedReturnValue(), v18, v18))
  {
    double v19 = [v17 coordinateSpace];
    [v17 bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    CGPoint v28 = [(SWContainerViewController *)self keyboardCoordinateSpace];
    objc_msgSend(v19, "convertRect:toCoordinateSpace:", v28, v21, v23, v25, v27);
    -[SWContainerViewController setInputAccessoryViewFrame:](self, "setInputAccessoryViewFrame:");
  }
  else
  {
    -[SWContainerViewController setInputAccessoryViewFrame:](self, "setInputAccessoryViewFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  [(SWContainerViewController *)self updateConfiguration];
}

- (CGRect)convertedKeyboardFrame
{
  uint64_t v3 = [(SWContainerViewController *)self keyboardCoordinateSpace];
  if (v3
    && (id v4 = (void *)v3,
        [(SWContainerViewController *)self keyboardFrame],
        BOOL IsEmpty = CGRectIsEmpty(v20),
        v4,
        !IsEmpty))
  {
    double v10 = [(SWContainerViewController *)self view];
    double v11 = [(SWContainerViewController *)self keyboardCoordinateSpace];
    [(SWContainerViewController *)self keyboardFrame];
    objc_msgSend(v11, "convertRect:toCoordinateSpace:", v10);
    double v6 = v12;
    double v7 = v13;
    double v8 = v14;
    double v9 = v15;
  }
  else
  {
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v16 = v6;
  double v17 = v7;
  double v18 = v8;
  double v19 = v9;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)convertedInputAccessoryViewFrame
{
  uint64_t v3 = [(SWContainerViewController *)self keyboardCoordinateSpace];
  if (v3
    && (id v4 = (void *)v3,
        [(SWContainerViewController *)self inputAccessoryViewFrame],
        BOOL IsEmpty = CGRectIsEmpty(v20),
        v4,
        !IsEmpty))
  {
    double v10 = [(SWContainerViewController *)self view];
    double v11 = [(SWContainerViewController *)self keyboardCoordinateSpace];
    [(SWContainerViewController *)self inputAccessoryViewFrame];
    objc_msgSend(v11, "convertRect:toCoordinateSpace:", v10);
    double v6 = v12;
    double v7 = v13;
    double v8 = v14;
    double v9 = v15;
  }
  else
  {
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v16 = v6;
  double v17 = v7;
  double v18 = v8;
  double v19 = v9;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)handleKeyboardShow:(id)a3
{
  [(SWContainerViewController *)self setIsKeyboardVisible:1];
  [(SWContainerViewController *)self updateConfiguration];
}

- (void)handleKeyboardHide:(id)a3
{
  [(SWContainerViewController *)self setIsKeyboardVisible:0];
  [(SWContainerViewController *)self updateConfiguration];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a4;
  if ([a3 isEqualToString:@"isPencilInputExpected"] && (id)objc_opt_class() == v8)
  {
    -[SWContainerViewController setIsPencilInputExpected:](self, "setIsPencilInputExpected:", [MEMORY[0x263F1C938] isPencilInputExpected]);
    [(SWContainerViewController *)self updateConfiguration];
  }
}

- (void)removeMenusForIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(SWContainerViewController *)self webContentViewController];
  [v5 removeMenusForIdentifiers:v4];
}

- (void)updateReachability
{
  id v3 = [MEMORY[0x263F59E78] sharedInstance];
  -[SWContainerViewController setNetworkStatus:](self, "setNetworkStatus:", [v3 currentReachabilityStatus]);
}

- (void)reachabilityChanged:(id)a3
{
  [(SWContainerViewController *)self updateReachability];
  [(SWContainerViewController *)self updateConfiguration];
}

- (void)addContentRuleList:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SWContainerViewController *)self webContentViewController];
  id v8 = [v9 contentRuleManager];
  [v8 addContentRuleList:v7 identifier:v6];
}

- (SWContainerConfiguration)configuration
{
  return self->_configuration;
}

- (SWActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (SWInteractionProvider)interactionProvider
{
  return self->_interactionProvider;
}

- (SWErrorProvider)errorProvider
{
  return self->_errorProvider;
}

- (SWConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (SWPresentationManager)presentationManager
{
  return self->_presentationManager;
}

- (SWDeveloperSettings)developerSettings
{
  return self->_developerSettings;
}

- (SWScaleManager)scaleManager
{
  return self->_scaleManager;
}

- (SWSnapshotManager)snapshotManager
{
  return self->_snapshotManager;
}

- (SWPreferredSizeManager)preferredSizeManager
{
  return self->_preferredSizeManager;
}

- (SWViewController)webContentViewController
{
  return self->_webContentViewController;
}

- (CGRect)keyboardFrame
{
  double x = self->_keyboardFrame.origin.x;
  double y = self->_keyboardFrame.origin.y;
  double width = self->_keyboardFrame.size.width;
  double height = self->_keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (UICoordinateSpace)keyboardCoordinateSpace
{
  return self->_keyboardCoordinateSpace;
}

- (void)setKeyboardCoordinateSpace:(id)a3
{
}

- (BOOL)isKeyboardVisible
{
  return self->_isKeyboardVisible;
}

- (void)setIsKeyboardVisible:(BOOL)a3
{
  self->_isKeyboardVisible = a3;
}

- (BOOL)isPencilInputExpected
{
  return self->_isPencilInputExpected;
}

- (void)setIsPencilInputExpected:(BOOL)a3
{
  self->_isPencilInputExpected = a3;
}

- (CGRect)inputAccessoryViewFrame
{
  double x = self->_inputAccessoryViewFrame.origin.x;
  double y = self->_inputAccessoryViewFrame.origin.y;
  double width = self->_inputAccessoryViewFrame.size.width;
  double height = self->_inputAccessoryViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputAccessoryViewFrame:(CGRect)a3
{
  self->_inputAccessoryViewFrame = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- (int64_t)networkStatus
{
  return self->_networkStatus;
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->_networkStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_webContentViewController, 0);
  objc_storeStrong((id *)&self->_preferredSizeManager, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_scaleManager, 0);
  objc_storeStrong((id *)&self->_developerSettings, 0);
  objc_storeStrong((id *)&self->_presentationManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_errorProvider, 0);
  objc_storeStrong((id *)&self->_interactionProvider, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end