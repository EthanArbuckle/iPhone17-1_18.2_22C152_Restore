@interface VideosExtrasRootViewController
+ (id)currentController;
- (BOOL)_areExtrasVisible;
- (BOOL)_setMainDocumentWithViewController:(id)a3;
- (BOOL)appIsTrusted;
- (BOOL)appUsesDefaultStyleSheets;
- (BOOL)isTimeZoneSet;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotate;
- (BOOL)shouldExtrasBeVisibleForViewSize:(CGSize)a3;
- (BOOL)shouldIgnoreJSValidation;
- (BOOL)showsBuiltInNavigationControls;
- (BOOL)showsMenuBar;
- (CGSize)initialPresentationSize;
- (CGSize)screenSize;
- (IKAppContext)applicationContext;
- (IKAppDataStoring)localStorage;
- (IKAppDataStoring)vendorStorage;
- (IKAppUserDefaultsStoring)userDefaultsStorage;
- (NSArray)lastSelectedSnapshotViewControllers;
- (NSArray)mainMenuItemElements;
- (NSLayoutConstraint)extrasScrollViewLeadingConstraint;
- (UIButton)backButton;
- (UINavigationController)navigationController;
- (UIStackView)extrasMenuButtonsStackView;
- (UIView)extrasMenuBarView;
- (UIView)mainMenuBar;
- (VideosExtrasArtworkDataSource)artworkDataSource;
- (VideosExtrasContext)context;
- (VideosExtrasFeatureContainerViewController)featureContainer;
- (VideosExtrasMainTemplateViewController)mainTemplateViewController;
- (VideosExtrasRootViewController)initWithContext:(id)a3;
- (VideosExtrasRootViewControllerDelegate)delegate;
- (id)_createDataStorageForIdentifier:(id)a3;
- (id)_extrasMenuBarViewForElements:(id)a3;
- (id)appIdentifier;
- (id)appJSURL;
- (id)appLaunchParams;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)detectMainDocument:(id)a3;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4;
- (id)navigationControllerForContext:(id)a3;
- (id)storeFrontCountryCode;
- (id)systemLanguage;
- (id)timeZone;
- (id)vendorIdentifier;
- (id)viewElementRegistry;
- (unint64_t)preferredVideoFormat;
- (unint64_t)preferredVideoPreviewFormat;
- (unint64_t)supportedInterfaceOrientations;
- (void)_adjustExtrasVisibilityForViewSize:(CGSize)a3;
- (void)_attemptRestart;
- (void)_backButtonPressed:(id)a3;
- (void)_extrasMenuItemSelected:(id)a3;
- (void)_playbackWillEndNotification:(id)a3;
- (void)_setNavigationController:(id)a3;
- (void)_setUpForApplication;
- (void)_showExtrasBar:(BOOL)a3;
- (void)_stopOldContextIfNeeded;
- (void)appContext:(id)a3 didFailWithError:(id)a4;
- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)popToFeatureOrMain;
- (void)setApplicationContext:(id)a3;
- (void)setArtworkDataSource:(id)a3;
- (void)setBackButton:(id)a3;
- (void)setClearsStackOnNextPush;
- (void)setDelegate:(id)a3;
- (void)setExtrasMenuBarView:(id)a3;
- (void)setExtrasMenuButtonsStackView:(id)a3;
- (void)setExtrasScrollViewLeadingConstraint:(id)a3;
- (void)setFeatureContainer:(id)a3;
- (void)setInitialPresentationSize:(CGSize)a3;
- (void)setLastSelectedSnapshotViewControllers:(id)a3;
- (void)setLocalStorage:(id)a3;
- (void)setMainTemplateViewController:(id)a3;
- (void)setShowsBuiltInNavigationControls:(BOOL)a3;
- (void)setShowsMenuBar:(BOOL)a3;
- (void)setUserDefaultsStorage:(id)a3;
- (void)setVendorStorage:(id)a3;
- (void)showExtrasMenuBarInFrame:(CGRect)a3;
- (void)start;
- (void)updateMenuButtonForSelectionAtIndex:(unint64_t)a3 deselectedIndex:(unint64_t)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VideosExtrasRootViewController

+ (id)currentController
{
  id WeakRetained = objc_loadWeakRetained(&__currentController);
  return WeakRetained;
}

- (void)_setUpForApplication
{
  v21[1] = *MEMORY[0x1E4F143B8];
  [(VideosExtrasRootViewController *)self _stopOldContextIfNeeded];
  v3 = [(VideosExtrasRootViewController *)self _createDataStorageForIdentifier:@"localStorage"];
  localStorage = self->_localStorage;
  self->_localStorage = v3;

  v5 = [(VideosExtrasRootViewController *)self _createDataStorageForIdentifier:@"vendorStorage"];
  vendorStorage = self->_vendorStorage;
  self->_vendorStorage = v5;

  v7 = [MEMORY[0x1E4F6F018] sharedUserDefaults];
  userDefaultsStorage = self->_userDefaultsStorage;
  self->_userDefaultsStorage = v7;

  v9 = [VideosExtrasNavigationController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v11 = [(VideosExtrasNavigationController *)v9 initWithContext:WeakRetained];

  [(VideosExtrasNavigationController *)v11 setShowsBuiltInNavControls:[(VideosExtrasRootViewController *)self showsBuiltInNavigationControls]];
  id v12 = objc_loadWeakRetained((id *)&self->_context);
  v13 = [v12 featurePlaybackViewController];

  if (v13)
  {
    v14 = [VideosExtrasFeatureContainerViewController alloc];
    id v15 = objc_loadWeakRetained((id *)&self->_context);
    v16 = [(VideosExtrasFeatureContainerViewController *)v14 initWithContext:v15];
    featureContainer = self->_featureContainer;
    self->_featureContainer = v16;

    [(VideosExtrasFeatureContainerViewController *)self->_featureContainer setVideoPlaybackViewController:v13];
    v21[0] = self->_featureContainer;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [(VideosExtrasNavigationController *)v11 setViewControllers:v18];
  }
  else
  {
    [(VideosExtrasNavigationController *)v11 setClearsStackOnNextPush];
    id v18 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    [(VideosExtrasNavigationController *)v11 pushViewController:v18 animated:0];
  }

  [(VideosExtrasRootViewController *)self _setNavigationController:v11];
  v19 = (IKAppContext *)[objc_alloc(MEMORY[0x1E4F6F000]) initWithApplication:self mode:0 delegate:self];
  applicationContext = self->_applicationContext;
  self->_applicationContext = v19;
}

- (VideosExtrasRootViewController)initWithContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VideosExtrasRootViewController;
  v5 = [(VideosExtrasRootViewController *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    v7 = objc_alloc_init(VideosExtrasArtworkDataSource);
    artworkDataSource = v6->_artworkDataSource;
    v6->_artworkDataSource = v7;

    v6->_showsMenuBar = 1;
    v6->_showsBuiltInNavigationControls = 1;
    objc_storeWeak(&__currentController, v6);
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v6 selector:sel__playbackWillEndNotification_ name:@"VideosAVPlayerWillEndPlayback" object:0];
  }
  return v6;
}

- (void)dealloc
{
  [(VideosExtrasRootViewController *)self _stopOldContextIfNeeded];
  [(VideosExtrasNavigationController *)self->_navigationController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasRootViewController;
  [(VideosExtrasRootViewController *)&v3 dealloc];
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  v2 = [(VideosExtrasRootViewController *)self childViewControllers];
  objc_super v3 = [v2 lastObject];

  return v3;
}

- (void)_stopOldContextIfNeeded
{
  [(IKAppContext *)self->_applicationContext stop];
  applicationContext = self->_applicationContext;
  self->_applicationContext = 0;
}

- (void)start
{
  [(VideosExtrasRootViewController *)self _setUpForApplication];
  applicationContext = self->_applicationContext;
  [(IKAppContext *)applicationContext start];
}

- (void)popToFeatureOrMain
{
  v10[1] = *MEMORY[0x1E4F143B8];
  navigationController = self->_navigationController;
  if (self->_featureContainer)
  {
    id v4 = [(VideosExtrasNavigationController *)self->_navigationController topViewController];
    featureContainer = self->_featureContainer;

    if (v4 == featureContainer) {
      return;
    }
    v6 = self->_navigationController;
    v10[0] = self->_featureContainer;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(VideosExtrasNavigationController *)v6 setViewControllers:v7];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    [WeakRetained extrasRequestReloadWithContext:0];
  }
  else
  {
    mainTemplateViewController = self->_mainTemplateViewController;
    id WeakRetained = [MEMORY[0x1E4F1C978] arrayWithObjects:&mainTemplateViewController count:1];
    [(VideosExtrasNavigationController *)navigationController setViewControllers:WeakRetained];
  }
}

- (NSArray)mainMenuItemElements
{
  return [(VideosExtrasMainTemplateViewController *)self->_mainTemplateViewController mainMenuItemElements];
}

- (void)setClearsStackOnNextPush
{
}

- (void)updateMenuButtonForSelectionAtIndex:(unint64_t)a3 deselectedIndex:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = [(VideosExtrasRootViewController *)self extrasMenuButtonsStackView];
  v7 = [v6 arrangedSubviews];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v12 tag] == a3)
          {
            v13 = (void *)MEMORY[0x1E4FB1618];
            double v14 = 1.0;
            double v15 = 0.957;
            double v16 = 0.969;
            double v17 = 0.992;
          }
          else
          {
            if ([v12 tag] != a4) {
              goto LABEL_12;
            }
            v13 = (void *)MEMORY[0x1E4FB1618];
            double v14 = 1.0;
            double v15 = 0.545;
            double v16 = 0.565;
            double v17 = 0.573;
          }
          id v18 = [v13 colorWithRed:v15 green:v16 blue:v17 alpha:v14];
          [v12 setTitleColor:v18 forState:0];
        }
LABEL_12:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

- (void)showExtrasMenuBarInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v26[4] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(VideosExtrasRootViewController *)self extrasMenuBarView];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setFrame:", x, y, width, height);
    uint64_t v10 = [(VideosExtrasRootViewController *)self view];
    uint64_t v11 = [(VideosExtrasRootViewController *)self extrasMenuBarView];
    [v10 addSubview:v11];

    long long v21 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v24 = [v9 centerXAnchor];
    v25 = [(VideosExtrasRootViewController *)self view];
    v23 = [v25 centerXAnchor];
    long long v22 = [v24 constraintEqualToAnchor:v23];
    v26[0] = v22;
    id v12 = [v9 widthAnchor];
    v13 = [v12 constraintEqualToConstant:width];
    v26[1] = v13;
    double v14 = [v9 heightAnchor];
    double v15 = [v14 constraintEqualToConstant:height];
    v26[2] = v15;
    double v16 = [v9 bottomAnchor];
    double v17 = [(VideosExtrasRootViewController *)self view];
    id v18 = [v17 topAnchor];
    long long v19 = [v16 constraintEqualToAnchor:v18 constant:y + height];
    v26[3] = v19;
    long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
    [v21 activateConstraints:v20];
  }
}

- (BOOL)appIsTrusted
{
  return 1;
}

- (id)appJSURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_super v3 = [WeakRetained javascriptURL];

  return v3;
}

- (BOOL)shouldIgnoreJSValidation
{
  return 0;
}

- (id)appIdentifier
{
  return 0;
}

- (id)vendorIdentifier
{
  return 0;
}

- (id)appLaunchParams
{
  v16[1] = *MEMORY[0x1E4F143B8];
  double v15 = @"movieInfo";
  v13[0] = @"adamId";
  v2 = (void *)MEMORY[0x1E4F28ED0];
  p_context = &self->_context;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v5 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(WeakRetained, "storeID"));
  v13[1] = @"actionParams";
  v14[0] = v5;
  id v6 = objc_loadWeakRetained((id *)p_context);
  uint64_t v7 = [v6 buyParameters];
  uint64_t v8 = (void *)v7;
  uint64_t v9 = &stru_1F3E921E0;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  v14[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  return v11;
}

- (BOOL)appUsesDefaultStyleSheets
{
  return 0;
}

- (id)viewElementRegistry
{
  if (viewElementRegistry_onceToken != -1) {
    dispatch_once(&viewElementRegistry_onceToken, &__block_literal_global_106);
  }
  v2 = (void *)viewElementRegistry_viewElementRegistry;
  return v2;
}

uint64_t __53__VideosExtrasRootViewController_viewElementRegistry__block_invoke()
{
  [MEMORY[0x1E4F6F1A8] registerStyle:@"extras-itml-section-content-type" withType:3 inherited:1];
  id v0 = objc_alloc_init(MEMORY[0x1E4F6F1A0]);
  v1 = (void *)viewElementRegistry_viewElementRegistry;
  viewElementRegistry_viewElementRegistrdouble y = (uint64_t)v0;

  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EEE8] elementType:82];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EDB0] elementType:4];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EDB8] elementType:5];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EDC0] elementType:6];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EDC8] elementType:7];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EDD0] elementType:8];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EDD8] elementType:12];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EDE0] elementType:15];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EDE8] elementType:19];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EDF0] elementType:20];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE00] elementType:22];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EDF8] elementType:21];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE08] elementType:23];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE10] elementType:24];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE38] elementType:31];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE40] elementType:33];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE50] elementType:43];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE58] elementType:45];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE60] elementType:47];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE68] elementType:48];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE20] elementType:49];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE48] elementType:49];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE78] elementType:49];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EEB0] elementType:49];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE88] elementType:62];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE90] elementType:63];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE98] elementType:64];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EEA0] elementType:65];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EEA8] elementType:66];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EEB8] elementType:68];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EEC0] elementType:70];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EEC8] elementType:71];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EED0] elementType:72];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EEE0] elementType:80];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EEF0] elementType:87];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EEF8] elementType:95];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EF08] elementType:108];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EF10] elementType:118];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EF18] elementType:119];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EF20] elementType:122];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EF28] elementType:132];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE18] elementType:138];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE28] elementType:138];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EE30] elementType:138];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EF30] elementType:138];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EF38] elementType:138];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EF40] elementType:139];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EF58] elementType:138];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EF48] elementType:142];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EF50] elementType:143];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EF60] elementType:152];
  [(id)viewElementRegistry_viewElementRegistry registerClass:objc_opt_class() forElementName:*MEMORY[0x1E4F6EF00] elementType:100];
  v2 = (void *)viewElementRegistry_viewElementRegistry;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *MEMORY[0x1E4F6EED8];
  return [v2 registerClass:v3 forElementName:v4 elementType:74];
}

- (id)navigationControllerForContext:(id)a3
{
  return self->_navigationController;
}

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  uint64_t v7 = [(IKJSITunesStore *)[VideosExtrasJSITunesStore alloc] initWithAppContext:v6];

  [v9 setObject:v7 forKeyedSubscript:@"itms"];
  [(VideosExtrasJSITunesStore *)v7 setFormPresentationViewController:self];
  id v8 = (id)[v9 evaluateScript:@"TabBar = { selectedTab: { rootURL: '' } }"];
}

- (void)_attemptRestart
{
  self->_didAttemptRestartAfterAppContextFailure = 1;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__VideosExtrasRootViewController__attemptRestart__block_invoke;
  v2[3] = &unk_1E6DF75C0;
  v2[4] = self;
  +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:0 withCompletionHandler:v2];
}

void __49__VideosExtrasRootViewController__attemptRestart__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  v5 = *(void **)(a1 + 32);
  if (a2)
  {
    [v5 start];
  }
  else
  {
    id v6 = [v5 context];
    [v6 failWithError:v7];
  }
}

- (void)appContext:(id)a3 didFailWithError:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = v6;
  if (appContext_didFailWithError__onceToken == -1)
  {
    if (!v6)
    {
LABEL_10:
      id v9 = [(VideosExtrasRootViewController *)self context];
      [v9 failWithError:v7];
      goto LABEL_11;
    }
  }
  else
  {
    dispatch_once(&appContext_didFailWithError__onceToken, &__block_literal_global_96);
    if (!v7) {
      goto LABEL_10;
    }
  }
  id v8 = [v7 userInfo];
  id v9 = v8;
  if (!v8
    || (uint64_t v10 = *MEMORY[0x1E4F6EFF0],
        [v8 objectForKeyedSubscript:*MEMORY[0x1E4F6EFF0]],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {

    goto LABEL_10;
  }
  if (appContext_didFailWithError____shouldShowHTTPErrors)
  {
    id v12 = [v9 objectForKeyedSubscript:v10];
    uint64_t v13 = [v12 integerValue];

    if (v13 == 403 && !self->_didAttemptRestartAfterAppContextFailure) {
      [(VideosExtrasRootViewController *)self _attemptRestart];
    }
  }
LABEL_11:
}

uint64_t __62__VideosExtrasRootViewController_appContext_didFailWithError___block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"ExtrasShouldShowHTTPErrors", @"com.apple.videos", 0);
  appContext_didFailWithError____shouldShowHTTPErrors = result != 0;
  return result;
}

- (unint64_t)preferredVideoFormat
{
  return 0;
}

- (unint64_t)preferredVideoPreviewFormat
{
  return 0;
}

- (CGSize)screenSize
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)isTimeZoneSet
{
  return 1;
}

- (id)timeZone
{
  return (id)[MEMORY[0x1E4F1CAF0] systemTimeZone];
}

- (id)systemLanguage
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  double v3 = [v2 arrayForKey:@"AppleLanguages"];

  double v4 = [v3 firstObject];

  return v4;
}

- (id)storeFrontCountryCode
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)VideosExtrasRootViewController;
  [(VideosExtrasRootViewController *)&v21 viewWillAppear:a3];
  double v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v5 = [v4 delegate];
  double v6 = [v5 window];

  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v11 userInterfaceIdiom])
  {
  }
  else
  {
    [(VideosExtrasRootViewController *)self initialPresentationSize];
    double v13 = v12;
    double v15 = v14;
    double v16 = *MEMORY[0x1E4F1DB30];
    double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

    if (v13 != v16 || v15 != v17)
    {
      [(VideosExtrasRootViewController *)self initialPresentationSize];
      double v8 = v19;
      double v10 = v20;
    }
  }
  -[VideosExtrasRootViewController _adjustExtrasVisibilityForViewSize:](self, "_adjustExtrasVisibilityForViewSize:", v8, v10);
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasRootViewController;
  [(VideosExtrasRootViewController *)&v7 viewDidLoad];
  double v3 = [(VideosExtrasRootViewController *)self view];
  double v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setBackgroundColor:v4];

  double v5 = [(VideosExtrasRootViewController *)self view];
  double v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.109803922 green:0.733333333 blue:1.0 alpha:1.0];
  [v5 setTintColor:v6];
}

- (void)viewDidLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)VideosExtrasRootViewController;
  [(VideosExtrasRootViewController *)&v16 viewDidLayoutSubviews];
  double v3 = [(VideosExtrasRootViewController *)self extrasMenuButtonsStackView];
  [v3 frame];
  double v5 = v4;

  double v6 = [(VideosExtrasRootViewController *)self backButton];
  [v6 frame];
  double v8 = v7;

  [(UIView *)self->_extrasMenuBarView frame];
  double v9 = v8 + 40.0 + 14.0;
  double v11 = v10 + v9 * -2.0;
  if (v5 <= v11)
  {
    double v13 = [(VideosExtrasRootViewController *)self extrasScrollViewLeadingConstraint];
    double v14 = v13;
    double v15 = v9;
  }
  else
  {
    double v12 = fmax(v9 + v11 - v5, 14.0);
    double v13 = [(VideosExtrasRootViewController *)self extrasScrollViewLeadingConstraint];
    double v14 = v13;
    double v15 = v12;
  }
  [v13 setConstant:v15];
}

- (unint64_t)supportedInterfaceOrientations
{
  double v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 30;
  }
  double v6 = [(VideosExtrasRootViewController *)self presentedViewController];
  if (v6) {
    unint64_t v5 = 24;
  }
  else {
    unint64_t v5 = 26;
  }

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v25[1] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)VideosExtrasRootViewController;
  -[VideosExtrasRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v24, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  if (![(VideosExtrasRootViewController *)self showsMenuBar]) {
    goto LABEL_7;
  }
  double v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v7 applicationState] != 2)
  {

    goto LABEL_7;
  }
  double v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
LABEL_7:
    -[VideosExtrasRootViewController _adjustExtrasVisibilityForViewSize:](self, "_adjustExtrasVisibilityForViewSize:", width, height);
    double v11 = [(VideosExtrasMainTemplateViewController *)self->_mainTemplateViewController view];
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, width, height);

    [(VideosExtrasMainTemplateViewController *)self->_mainTemplateViewController _prepareLayout];
    return;
  }
  double v10 = [(VideosExtrasRootViewController *)self presentedViewController];
  if (!v10)
  {
    BOOL v12 = -[VideosExtrasRootViewController shouldExtrasBeVisibleForViewSize:](self, "shouldExtrasBeVisibleForViewSize:", width, height);
    if (v12 != [(VideosExtrasRootViewController *)self _areExtrasVisible])
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __85__VideosExtrasRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
      v22[3] = &unk_1E6DF51F0;
      v22[4] = self;
      BOOL v23 = v12;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v22];
    }
    if (v12)
    {
      double v13 = [(VideosExtrasRootViewController *)self lastSelectedSnapshotViewControllers];

      if (v13)
      {
        navigationController = self->_navigationController;
        double v15 = [(VideosExtrasRootViewController *)self lastSelectedSnapshotViewControllers];
        [(VideosExtrasNavigationController *)navigationController setViewControllers:v15];

        [(VideosExtrasRootViewController *)self setLastSelectedSnapshotViewControllers:0];
      }
    }
    else
    {
      objc_super v16 = [(VideosExtrasNavigationController *)self->_navigationController topViewController];
      featureContainer = self->_featureContainer;

      if (v16 != featureContainer)
      {
        id v18 = [(VideosExtrasNavigationController *)self->_navigationController viewControllers];
        double v19 = (void *)[v18 copy];
        [(VideosExtrasRootViewController *)self setLastSelectedSnapshotViewControllers:v19];

        double v20 = self->_navigationController;
        v25[0] = self->_featureContainer;
        objc_super v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
        [(VideosExtrasNavigationController *)v20 setViewControllers:v21];
      }
    }
  }
}

uint64_t __85__VideosExtrasRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showExtrasBar:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)shouldAutorotate
{
  v2 = [(VideosExtrasRootViewController *)self presentedViewController];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  if (![v8 conformsToProtocol:&unk_1F3FF4728]
    || ([v8 animationControllerForNavigationOperation:a4 fromViewController:v8 toViewController:v9],
        (double v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v9 conformsToProtocol:&unk_1F3FF4728])
    {
      double v10 = [v9 animationControllerForNavigationOperation:a4 fromViewController:v8 toViewController:v9];
    }
    else
    {
      double v10 = 0;
    }
  }

  return v10;
}

- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  id v4 = a4;
  if ([v4 conformsToProtocol:&unk_1F3F92718]
    && [v4 conformsToProtocol:&unk_1F3F927F8]
    && [v4 isInteractive])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_createDataStorageForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  double v6 = [v5 firstObject];

  if (v6)
  {
    double v7 = [(VideosExtrasRootViewController *)self appIdentifier];
    id v8 = [v7 stringByAppendingFormat:@".%@", v4];

    id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
    double v10 = [MEMORY[0x1E4F28B50] mainBundle];
    double v11 = [v10 bundleIdentifier];
    BOOL v12 = objc_msgSend(v9, "initWithObjects:", v6, v11, v8, 0);

    double v13 = [NSString pathWithComponents:v12];
    double v14 = [v13 stringByAppendingPathExtension:@"plist"];

    double v15 = (void *)[objc_alloc(MEMORY[0x1E4F6F008]) initWithFilePath:v14 identifier:v8];
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

- (void)_setNavigationController:(id)a3
{
  id v5 = (VideosExtrasNavigationController *)a3;
  p_navigationController = &self->_navigationController;
  navigationController = self->_navigationController;
  if (navigationController != v5)
  {
    double v11 = v5;
    if (navigationController)
    {
      [(VideosExtrasNavigationController *)navigationController willMoveToParentViewController:0];
      id v8 = [(VideosExtrasNavigationController *)*p_navigationController view];
      [v8 removeFromSuperview];

      [(VideosExtrasNavigationController *)*p_navigationController removeFromParentViewController];
      [(VideosExtrasNavigationController *)*p_navigationController setDelegate:0];
    }
    objc_storeStrong((id *)&self->_navigationController, a3);
    [(VideosExtrasNavigationController *)v11 setDelegate:self];
    id v9 = [(VideosExtrasRootViewController *)self view];
    double v10 = [(VideosExtrasNavigationController *)v11 view];
    [v9 bounds];
    objc_msgSend(v10, "setFrame:");
    [(VideosExtrasRootViewController *)self addChildViewController:v11];
    [v9 addSubview:v10];
    [(VideosExtrasNavigationController *)v11 didMoveToParentViewController:self];

    id v5 = v11;
  }
}

- (id)_extrasMenuBarViewForElements:(id)a3
{
  id v4 = a3;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  v62[3] = 0;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F16708]);
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
    double v7 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
    id v8 = [v7 localizedStringForKey:@"EXTRAS_BACK_BUTTON_TITLE" value:0 table:@"VideosExtras"];
    [v6 setTitle:v8 forState:0];

    id v9 = [v6 titleLabel];
    double v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0];
    [v9 setFont:v10];

    double v11 = [MEMORY[0x1E4FB1618] darkGrayColor];
    [v6 setBackgroundColor:v11];

    objc_msgSend(v6, "setContentEdgeInsets:", 2.0, 4.0, 2.0, 4.0);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v12 = [v6 layer];
    [v12 setCornerRadius:4.0];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 addTarget:self action:sel__backButtonPressed_ forControlEvents:64];
    LODWORD(v13) = 1148846080;
    [v6 setContentCompressionResistancePriority:0 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [v6 setContentHuggingPriority:0 forAxis:v14];
    [v5 addSubview:v6];
    [(VideosExtrasRootViewController *)self setBackButton:v6];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __64__VideosExtrasRootViewController__extrasMenuBarViewForElements___block_invoke;
    v59[3] = &unk_1E6DF9DE8;
    v59[4] = self;
    v61 = v62;
    id v58 = v15;
    id v60 = v58;
    [v4 enumerateObjectsUsingBlock:v59];
    objc_super v16 = [v6 trailingAnchor];
    double v17 = [v5 trailingAnchor];
    id v18 = [v16 constraintEqualToAnchor:v17 constant:-14.0];
    [v18 setActive:1];

    double v19 = [v6 centerYAnchor];
    double v20 = [v5 centerYAnchor];
    objc_super v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    id v22 = objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    [v22 setShowsHorizontalScrollIndicator:0];
    [v22 setBounces:1];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:v22];
    BOOL v23 = [v22 leadingAnchor];
    objc_super v24 = [v5 leadingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24 constant:14.0];

    LODWORD(v26) = 1144750080;
    [v25 setPriority:v26];
    [v25 setActive:1];
    [(VideosExtrasRootViewController *)self setExtrasScrollViewLeadingConstraint:v25];
    v27 = [v22 centerYAnchor];
    v28 = [v5 centerYAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v29 setActive:1];

    v30 = [v22 topAnchor];
    v31 = [v5 topAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [v32 setActive:1];

    v33 = [v22 trailingAnchor];
    v34 = [v6 leadingAnchor];
    v35 = [v33 constraintEqualToAnchor:v34 constant:-40.0];
    [v35 setActive:1];

    v36 = [v22 bottomAnchor];
    v37 = [v5 bottomAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    [v38 setActive:1];

    v39 = [v22 centerXAnchor];
    v40 = [v5 centerXAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];

    LODWORD(v42) = 1132068864;
    [v41 setPriority:v42];
    [v41 setActive:1];
    v43 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v58];
    [v43 setDistribution:2];
    [v43 setSpacing:40.0];
    [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v22 addSubview:v43];
    [(VideosExtrasRootViewController *)self setExtrasMenuButtonsStackView:v43];
    v44 = [v43 centerYAnchor];
    v45 = [v22 centerYAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    [v46 setActive:1];

    v47 = [v43 leadingAnchor];
    v48 = [v22 leadingAnchor];
    v49 = [v47 constraintGreaterThanOrEqualToAnchor:v48];
    [v49 setActive:1];

    v50 = [v43 trailingAnchor];
    v51 = [v22 trailingAnchor];
    v52 = [v50 constraintGreaterThanOrEqualToAnchor:v51];
    [v52 setActive:1];

    v53 = [v43 centerXAnchor];
    v54 = [v22 centerXAnchor];
    v55 = [v53 constraintEqualToAnchor:v54];

    LODWORD(v56) = 1132068864;
    [v55 setPriority:v56];
    [v55 setActive:1];
  }
  else
  {
    id v5 = 0;
  }
  _Block_object_dispose(v62, 8);

  return v5;
}

void __64__VideosExtrasRootViewController__extrasMenuBarViewForElements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  id v5 = [*(id *)(a1 + 32) context];
  char v6 = [v5 isMenuItemElementMainFeature:v15];

  double v7 = v15;
  if ((v6 & 1) == 0)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v8 = [v15 title];
    id v9 = [v8 text];
    double v10 = [v9 string];

    if ([v10 length])
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
      BOOL v12 = [MEMORY[0x1E4FB1618] colorWithRed:0.545 green:0.565 blue:0.573 alpha:1.0];
      [v11 setTitleColor:v12 forState:0];

      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v13 = [v11 titleLabel];
      double v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
      [v13 setFont:v14];

      [v11 setTitle:v10 forState:0];
      [v11 setTag:a3];
      [v11 addTarget:*(void *)(a1 + 32) action:sel__extrasMenuItemSelected_ forControlEvents:64];
      [*(id *)(a1 + 40) addObject:v11];
    }
    double v7 = v15;
  }
}

- (void)_backButtonPressed:(id)a3
{
  id v3 = [(VideosExtrasRootViewController *)self context];
  if (objc_opt_respondsToSelector()) {
    [v3 extrasBackButtonPressed];
  }
}

- (void)_extrasMenuItemSelected:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v11;
  if (isKindOfClass)
  {
    id v6 = v11;
    double v7 = [(VideosExtrasRootViewController *)self mainMenuItemElements];
    unint64_t v8 = [v6 tag];
    if (v8 < [v7 count])
    {
      id v9 = [v7 objectAtIndex:v8];
      if (v9)
      {
        double v10 = [(VideosExtrasRootViewController *)self context];
        if (objc_opt_respondsToSelector()) {
          [v10 extrasMenuItemSelected:v9 atIndex:v8];
        }
      }
    }

    id v5 = v11;
  }
}

- (void)setMainTemplateViewController:(id)a3
{
  id v5 = (VideosExtrasMainTemplateViewController *)a3;
  mainTemplateViewController = self->_mainTemplateViewController;
  if (mainTemplateViewController != v5)
  {
    double v14 = v5;
    [(VideosExtrasMainTemplateViewController *)mainTemplateViewController setDidSelectDelegate:0];
    [(VideosExtrasMainTemplateViewController *)v14 setDidSelectDelegate:self];
    objc_storeStrong((id *)&self->_mainTemplateViewController, a3);
    double v7 = [(VideosExtrasRootViewController *)self view];
    [v7 bounds];
    BOOL v10 = -[VideosExtrasRootViewController shouldExtrasBeVisibleForViewSize:](self, "shouldExtrasBeVisibleForViewSize:", v8, v9);

    [(VideosExtrasRootViewController *)self _showExtrasBar:v10];
    id v11 = [(VideosExtrasRootViewController *)self mainMenuItemElements];
    BOOL v12 = [(VideosExtrasRootViewController *)self _extrasMenuBarViewForElements:v11];

    if (v12) {
      [(VideosExtrasRootViewController *)self setExtrasMenuBarView:v12];
    }
    double v13 = [(VideosExtrasRootViewController *)self delegate];
    [v13 extrasRootViewControllerDidLoadMainMenuItems:self];

    id v5 = v14;
  }
}

- (BOOL)_setMainDocumentWithViewController:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 document];
    if (objc_opt_respondsToSelector())
    {
      id v6 = [v5 templateElement];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        [(VideosExtrasRootViewController *)self setMainTemplateViewController:v4];
      }
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)detectMainDocument:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v4, "reverseObjectEnumerator", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([(VideosExtrasRootViewController *)self _setMainDocumentWithViewController:v10])
        {
          id v11 = (id)[v4 mutableCopy];
          [v11 removeObject:v10];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = v4;
LABEL_11:

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (UIView)mainMenuBar
{
  v2 = [(VideosExtrasRootViewController *)self mainTemplateViewController];
  id v3 = [v2 menuBarView];

  return (UIView *)v3;
}

- (void)_adjustExtrasVisibilityForViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v16 = [(VideosExtrasRootViewController *)self presentedViewController];
  NSClassFromString(&cfstr_Mpaudioandsubt.isa);
  unsigned int isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = v16;
  if (self->_mainTemplateViewController)
  {
    if (!v16 || (int v8 = [v16 isBeingDismissed] | isKindOfClass, v7 = v16, (v8 & 1) != 0))
    {
      BOOL v9 = -[VideosExtrasRootViewController shouldExtrasBeVisibleForViewSize:](self, "shouldExtrasBeVisibleForViewSize:", width, height);
      if (![(VideosExtrasRootViewController *)self showsMenuBar])
      {
        id v11 = [(VideosExtrasRootViewController *)self delegate];
        [v11 extrasRootViewController:self extrasVisibilityNeedsUpdate:v9];
LABEL_11:

        uint64_t v7 = v16;
        goto LABEL_12;
      }
      BOOL v10 = v9 == [(VideosExtrasRootViewController *)self _areExtrasVisible];
      uint64_t v7 = v16;
      if (!v10)
      {
        [(VideosExtrasRootViewController *)self _showExtrasBar:v9];
        uint64_t v7 = v16;
        if (!(v9 | isKindOfClass))
        {
          id v11 = [(VideosExtrasMainTemplateViewController *)self->_mainTemplateViewController menuBarView];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = v11;
            BOOL v12 = [v11 indexPathsForSelectedItems];
            if ([v12 count])
            {
              long long v13 = [v12 objectAtIndex:0];
            }
            else
            {
              long long v13 = 0;
            }
            long long v14 = [(VideosExtrasMainTemplateViewController *)self->_mainTemplateViewController indexPathOfFeaturedItem];
            if (v13 && ([v13 isEqual:v14] & 1) == 0)
            {
              [v11 selectItemAtIndexPath:v14 animated:0 scrollPosition:0];
              long long v15 = [v11 delegate];
              [v15 collectionView:v11 didSelectItemAtIndexPath:v14];
            }
          }
          goto LABEL_11;
        }
      }
    }
  }
LABEL_12:
}

- (BOOL)_areExtrasVisible
{
  bottomConstraint = self->_bottomConstraint;
  if (bottomConstraint)
  {
    [(NSLayoutConstraint *)bottomConstraint constant];
    LOBYTE(bottomConstraint) = v3 == 0.0;
  }
  return (char)bottomConstraint;
}

- (void)_playbackWillEndNotification:(id)a3
{
  id v4 = [(VideosExtrasRootViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  -[VideosExtrasRootViewController _adjustExtrasVisibilityForViewSize:](self, "_adjustExtrasVisibilityForViewSize:", v6, v8);
}

- (BOOL)shouldExtrasBeVisibleForViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (![(VideosExtrasRootViewController *)self isViewLoaded]) {
    return 0;
  }
  double v6 = [(VideosExtrasRootViewController *)self view];
  double v7 = [v6 window];
  double v8 = [(VideosExtrasRootViewController *)self view];
  BOOL v9 = v8;
  if (v7)
  {
    BOOL v10 = [v8 window];
    id v11 = [v10 screen];
    BOOL v12 = [v11 coordinateSpace];
    [v12 bounds];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
  }
  else
  {
    [v8 bounds];
    CGFloat v14 = v21;
    CGFloat v16 = v22;
    CGFloat v18 = v23;
    CGFloat v20 = v24;
  }

  v36.origin.double x = v14;
  v36.origin.double y = v16;
  v36.size.double width = v18;
  v36.size.double height = v20;
  double v25 = CGRectGetWidth(v36);
  v37.origin.double x = v14;
  v37.origin.double y = v16;
  v37.size.double width = v18;
  v37.size.double height = v20;
  double v26 = CGRectGetHeight(v37);
  if (v25 >= v26) {
    double v27 = v26;
  }
  else {
    double v27 = v25;
  }
  if (v25 >= v26) {
    double v28 = v25;
  }
  else {
    double v28 = v26;
  }
  v29 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v30 = [v29 orientation];

  BOOL v31 = (unint64_t)(v30 - 3) < 2;
  if (width >= height) {
    double v32 = height;
  }
  else {
    double v32 = width;
  }
  if (width >= height) {
    double v33 = width;
  }
  else {
    double v33 = height;
  }
  if (width > height) {
    BOOL v31 = 1;
  }
  BOOL v34 = v27 == v32 && v28 == v33;
  return v34 && v31;
}

- (void)_showExtrasBar:(BOOL)a3
{
  if (self->_showsMenuBar)
  {
    BOOL v3 = a3;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    BOOL v31 = __Block_byref_object_copy__21;
    double v32 = __Block_byref_object_dispose__21;
    id v33 = [(VideosExtrasMainTemplateViewController *)self->_mainTemplateViewController menuBarView];
    double v5 = [(id)v29[5] superview];

    if (v5) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = !v3;
    }
    if (!v6)
    {
      double v7 = [(VideosExtrasRootViewController *)self view];
      [v7 addSubview:v29[5]];

      if (!self->_bottomConstraint)
      {
        BOOL v10 = [(VideosExtrasRootViewController *)self view];
        if (v10)
        {
          uint64_t v11 = v29[5];

          if (v11)
          {
            BOOL v12 = (void *)MEMORY[0x1E4F28DC8];
            uint64_t v13 = v29[5];
            CGFloat v14 = [(VideosExtrasRootViewController *)self view];
            double v15 = objc_msgSend(v12, "constraintsByAttachingView:toView:alongEdges:insets:", v13, v14, 10, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

            CGFloat v16 = (void *)MEMORY[0x1E4F28DC8];
            uint64_t v17 = v29[5];
            CGFloat v18 = [(VideosExtrasRootViewController *)self view];
            [(id)v29[5] frame];
            double v19 = [v16 constraintWithItem:v17 attribute:4 relatedBy:0 toItem:v18 attribute:4 multiplier:1.0 constant:CGRectGetHeight(v35)];
            bottomConstraint = self->_bottomConstraint;
            self->_bottomConstraint = v19;

            double v21 = self->_bottomConstraint;
            [(VideosExtrasMainTemplateViewController *)self->_mainTemplateViewController collectionViewHeight];
            -[NSLayoutConstraint setConstant:](v21, "setConstant:");
            double v22 = (void *)MEMORY[0x1E4F28DC8];
            double v23 = [v15 arrayByAddingObject:self->_bottomConstraint];
            [v22 activateConstraints:v23];
          }
        }
      }
      double v8 = [(VideosExtrasRootViewController *)self view];
      [v8 layoutIfNeeded];

      [(id)v29[5] setHidden:0];
      double Height = 0.0;
      if (!v3)
      {
        objc_msgSend((id)v29[5], "frame", 0.0);
        double Height = CGRectGetHeight(v34);
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __49__VideosExtrasRootViewController__showExtrasBar___block_invoke;
      v26[3] = &unk_1E6DF9E10;
      *(double *)&v26[6] = Height;
      BOOL v27 = v3;
      v26[4] = self;
      void v26[5] = &v28;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __49__VideosExtrasRootViewController__showExtrasBar___block_invoke_2;
      v24[3] = &unk_1E6DF9E38;
      BOOL v25 = v3;
      v24[4] = self;
      v24[5] = &v28;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v26 animations:v24 completion:0.33];
    }
    _Block_object_dispose(&v28, 8);
  }
}

void __49__VideosExtrasRootViewController__showExtrasBar___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) setConstant:*(double *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  else {
    uint64_t v2 = 0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1040) setMenuBarView:v2];
  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 1040) view];
  [v3 layoutIfNeeded];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];
}

void __49__VideosExtrasRootViewController__showExtrasBar___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1040) videoPlaybackViewController];
  uint64_t v2 = [v5 overlayView];
  unsigned int v3 = [v2 isHidden];
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 1;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setHidden:v4];
}

- (UINavigationController)navigationController
{
  return &self->_navigationController->super;
}

- (VideosExtrasMainTemplateViewController)mainTemplateViewController
{
  return self->_mainTemplateViewController;
}

- (UIView)extrasMenuBarView
{
  return self->_extrasMenuBarView;
}

- (void)setExtrasMenuBarView:(id)a3
{
}

- (VideosExtrasContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (VideosExtrasContext *)WeakRetained;
}

- (CGSize)initialPresentationSize
{
  double width = self->_initialPresentationSize.width;
  double height = self->_initialPresentationSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setInitialPresentationSize:(CGSize)a3
{
  self->_initialPresentationSize = a3;
}

- (VideosExtrasRootViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VideosExtrasRootViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showsMenuBar
{
  return self->_showsMenuBar;
}

- (void)setShowsMenuBar:(BOOL)a3
{
  self->_showsMenuBar = a3;
}

- (BOOL)showsBuiltInNavigationControls
{
  return self->_showsBuiltInNavigationControls;
}

- (void)setShowsBuiltInNavigationControls:(BOOL)a3
{
  self->_showsBuiltInNavigationControls = a3;
}

- (VideosExtrasFeatureContainerViewController)featureContainer
{
  return self->_featureContainer;
}

- (void)setFeatureContainer:(id)a3
{
}

- (IKAppContext)applicationContext
{
  return self->_applicationContext;
}

- (void)setApplicationContext:(id)a3
{
}

- (NSArray)lastSelectedSnapshotViewControllers
{
  return self->_lastSelectedSnapshotViewControllers;
}

- (void)setLastSelectedSnapshotViewControllers:(id)a3
{
}

- (UIStackView)extrasMenuButtonsStackView
{
  return self->_extrasMenuButtonsStackView;
}

- (void)setExtrasMenuButtonsStackView:(id)a3
{
}

- (UIButton)backButton
{
  return self->_backButton;
}

- (void)setBackButton:(id)a3
{
}

- (NSLayoutConstraint)extrasScrollViewLeadingConstraint
{
  return self->_extrasScrollViewLeadingConstraint;
}

- (void)setExtrasScrollViewLeadingConstraint:(id)a3
{
}

- (IKAppDataStoring)localStorage
{
  return self->_localStorage;
}

- (void)setLocalStorage:(id)a3
{
}

- (IKAppDataStoring)vendorStorage
{
  return self->_vendorStorage;
}

- (void)setVendorStorage:(id)a3
{
}

- (IKAppUserDefaultsStoring)userDefaultsStorage
{
  return self->_userDefaultsStorage;
}

- (void)setUserDefaultsStorage:(id)a3
{
}

- (VideosExtrasArtworkDataSource)artworkDataSource
{
  return self->_artworkDataSource;
}

- (void)setArtworkDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkDataSource, 0);
  objc_storeStrong((id *)&self->_userDefaultsStorage, 0);
  objc_storeStrong((id *)&self->_vendorStorage, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
  objc_storeStrong((id *)&self->_extrasScrollViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_extrasMenuButtonsStackView, 0);
  objc_storeStrong((id *)&self->_lastSelectedSnapshotViewControllers, 0);
  objc_storeStrong((id *)&self->_applicationContext, 0);
  objc_storeStrong((id *)&self->_featureContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_extrasMenuBarView, 0);
  objc_storeStrong((id *)&self->_mainTemplateViewController, 0);
  objc_storeStrong((id *)&self->_imageRequestQueue, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
}

@end