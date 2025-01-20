@interface NUArticleViewController
+ (id)_parentOrPresentingViewControllerFor:(id)a3;
- (BOOL)accessibilityShouldScrollForScrollViewController:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)articleIsPresentingFullscreen;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)didRestoreScrollPosition;
- (BOOL)isPreviewingOrShowingHardPaywall;
- (BOOL)resignFirstResponder;
- (BOOL)scrollViewController:(id)a3 shouldOccludeAccessibilityElement:(id)a4;
- (BOOL)shouldAutoPlayVideo;
- (BOOL)shouldDisableTransparentNavigationBar;
- (BOOL)shouldSaveScrollPosition;
- (BOOL)useTransparentNavigationBar;
- (FCObservable)articleViewStyler;
- (NFEventManager)eventManager;
- (NSDate)manualScrollingStartDate;
- (NSHashTable)loadingListeners;
- (NSString)contentSizeCategory;
- (NSString)selectedText;
- (NUANFDebugSettingsProvider)debugSettingsProvider;
- (NUArticleContext)articleContext;
- (NUArticleDataProvider)articleDataProvider;
- (NUArticleKeyCommandManager)keyCommandManager;
- (NUArticleScrollPositionManagerType)articleScrollPositionManager;
- (NUArticleViewController)initWithArticleDataProvider:(id)a3 scrollViewController:(id)a4 appStateMonitor:(id)a5 keyCommandManager:(id)a6 loadingListeners:(id)a7 headerBlueprintProvider:(id)a8 debugSettingsProvider:(id)a9 videoPlayerViewControllerManager:(id)a10 articleScrollPositionManager:(id)a11 chromeControl:(id)a12 spotlightManager:(id)a13;
- (NUArticleViewControllerDelegate)delegate;
- (NUChromeControl)chromeControl;
- (NUDocumentSectionBlueprintProvider)documentSectionBlueprintProvider;
- (NUEndOfArticleDataProvider)endOfArticleDataProvider;
- (NULoadingDelegate)loadingDelegate;
- (NUSpotlightManager)spotlightManager;
- (SXAnalyticsReporting)analyticsReporting;
- (SXScrollViewController)scrollViewController;
- (SXVideoPlayerViewControllerManager)videoPlayerViewControllerManager;
- (UIResponder)responder;
- (UIScrollView)scrollView;
- (double)articleLoadedTime;
- (double)navigationBarHeightForScrollViewController:(id)a3;
- (double)toolBarHeightForScrollViewController:(id)a3;
- (id)articleMessager;
- (id)currentPresentationAttributes;
- (int64_t)contentScale;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)presentationMode;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)finalizeArticleLoadingWithContext:(id)a3;
- (void)loadArticle;
- (void)nowPlayingDidDisappear:(id)a3;
- (void)nowPlayingWillDisappear:(id)a3;
- (void)reportEvent:(id)a3;
- (void)saveScrollPosition:(id)a3;
- (void)scrollToAudioPositionAndHideMessageAfterEvent:(id)a3;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)scrollViewController:(id)a3 didApplyDocumentStyle:(id)a4;
- (void)scrollViewController:(id)a3 enableNavigation:(BOOL)a4;
- (void)scrollViewControllerDidLayoutContent:(id)a3;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)scrollViewControllerDidScrollToBottomOfPrimaryContent:(id)a3;
- (void)scrollViewControllerDidStopScrolling:(id)a3;
- (void)scrollViewControllerDismissFullscreen:(id)a3;
- (void)scrollViewControllerRequestsFullscreen:(id)a3;
- (void)scrollViewControllerWillDismissFullscreen:(id)a3;
- (void)setAnalyticsReporting:(id)a3;
- (void)setArticleContext:(id)a3;
- (void)setArticleIsPresentingFullscreen:(BOOL)a3;
- (void)setArticleLoadedTime:(double)a3;
- (void)setContentScale:(int64_t)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidRestoreScrollPosition:(BOOL)a3;
- (void)setLoadingDelegate:(id)a3;
- (void)setManualScrollingStartDate:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setShouldAutoPlayVideo:(BOOL)a3;
- (void)setShouldDisableTransparentNavigationBar:(BOOL)a3;
- (void)showArticleMessage:(int64_t)a3 hideAfterEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePresentationAttributes;
- (void)updateScrollPositionFromContext;
- (void)updateScrollViewControllerWithContentOverlayBlueprint:(id)a3 topOffset:(double)a4;
- (void)updateScrollViewControllerWithFooterBlueprint:(id)a3;
- (void)updateScrollViewControllerWithHeaderBlueprint:(id)a3;
- (void)updateTextSelectionForPaywallPresentation;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willReturnToFullscreen:(id)a3;
@end

@implementation NUArticleViewController

- (NUArticleViewController)initWithArticleDataProvider:(id)a3 scrollViewController:(id)a4 appStateMonitor:(id)a5 keyCommandManager:(id)a6 loadingListeners:(id)a7 headerBlueprintProvider:(id)a8 debugSettingsProvider:(id)a9 videoPlayerViewControllerManager:(id)a10 articleScrollPositionManager:(id)a11 chromeControl:(id)a12 spotlightManager:(id)a13
{
  id v47 = a3;
  id v18 = a6;
  id v49 = a4;
  id v19 = a5;
  id v50 = a6;
  id v46 = a7;
  id v40 = a8;
  id v45 = a8;
  id v20 = a9;
  id v44 = a10;
  id v43 = a11;
  id v42 = a12;
  id v41 = a13;
  v62.receiver = self;
  v62.super_class = (Class)NUArticleViewController;
  v21 = [(NUArticleViewController *)&v62 init];
  if (v21)
  {
    v22 = (FCObservable *)objc_alloc_init(MEMORY[0x263F59588]);
    articleViewStyler = v21->_articleViewStyler;
    v21->_articleViewStyler = v22;

    v24 = (NFEventManager *)objc_alloc_init(MEMORY[0x263F59E58]);
    eventManager = v21->_eventManager;
    v21->_eventManager = v24;

    objc_storeStrong((id *)&v21->_articleDataProvider, a3);
    objc_storeStrong((id *)&v21->_keyCommandManager, v18);
    objc_storeStrong((id *)&v21->_debugSettingsProvider, a9);
    objc_storeStrong((id *)&v21->_videoPlayerViewControllerManager, a10);
    objc_storeStrong((id *)&v21->_articleScrollPositionManager, a11);
    objc_storeStrong((id *)&v21->_chromeControl, a12);
    objc_storeStrong((id *)&v21->_spotlightManager, a13);
    [v20 addObserver:v21];
    objc_storeStrong((id *)&v21->_scrollViewController, a4);
    uint64_t v26 = [v49 scrollView];
    scrollView = v21->_scrollView;
    v21->_scrollView = (UIScrollView *)v26;

    [(UIScrollView *)v21->_scrollView setAllowsKeyboardScrolling:0];
    [(SXScrollViewController *)v21->_scrollViewController setDelegate:v21];
    v28 = [v49 scrollView];
    [v50 registerScrollView:v28];

    objc_storeStrong((id *)&v21->_loadingListeners, a7);
    objc_storeStrong((id *)&v21->_documentSectionBlueprintProvider, v40);
    v21->_presentationMode = 1;
    v29 = [MEMORY[0x263F08A00] defaultCenter];
    [v29 addObserver:v21 selector:sel_applicationWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];

    v30 = [MEMORY[0x263F08A00] defaultCenter];
    [v30 addObserver:v21 selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];

    v31 = [MEMORY[0x263F08A00] defaultCenter];
    [v31 addObserver:v21 selector:sel_nowPlayingWillDisappear_ name:@"NUNowPlayingViewControllerWillDisappearNotification" object:0];

    v32 = [MEMORY[0x263F08A00] defaultCenter];
    [v32 addObserver:v21 selector:sel_nowPlayingDidDisappear_ name:@"NUNowPlayingViewControllerDidDisappearNotification" object:0];

    objc_initWeak(&location, v21);
    v33 = v21->_eventManager;
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke;
    v59[3] = &unk_2645FED68;
    objc_copyWeak(&v60, &location);
    [(NFEventManager *)v33 triggerOnEvent:@"appWillEnterForegroundEvent" block:v59];
    v34 = v21->_eventManager;
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_2;
    v57[3] = &unk_2645FED68;
    objc_copyWeak(&v58, &location);
    [(NFEventManager *)v34 triggerOnEvent:@"nowPlayingWillDisappearEvent" block:v57];
    v35 = v21->_eventManager;
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_3;
    v55[3] = &unk_2645FED68;
    objc_copyWeak(&v56, &location);
    [(NFEventManager *)v35 triggerOnEvent:@"viewWillAppearEvent" block:v55];
    v36 = v21->_eventManager;
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_4;
    v53[3] = &unk_2645FED68;
    objc_copyWeak(&v54, &location);
    [(NFEventManager *)v36 triggerOnEvent:@"viewWillAppearEvent" block:v53];
    v37 = v21->_eventManager;
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_5;
    v51[3] = &unk_2645FED68;
    objc_copyWeak(&v52, &location);
    [(NFEventManager *)v37 triggerOnEvent:@"viewDidDisappearEvent" block:v51];
    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);
    objc_destroyWeak(&v58);
    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);
  }

  return v21;
}

void __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained scrollToAudioPositionAndHideMessageAfterEvent:@"appDidEnterForegroundEvent"];
}

void __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained scrollToAudioPositionAndHideMessageAfterEvent:@"nowPlayingDidDisappearEvent"];
}

void __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained scrollToAudioPositionAndHideMessageAfterEvent:@"viewDidAppearEvent"];
}

void __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained articleDataProvider];
  [v1 setRelativePriority:1];
}

void __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained articleDataProvider];
  [v1 setRelativePriority:0];
}

- (void)viewDidLoad
{
  v72[1] = *MEMORY[0x263EF8340];
  v69.receiver = self;
  v69.super_class = (Class)NUArticleViewController;
  [(NUArticleViewController *)&v69 viewDidLoad];
  v3 = [(NUArticleViewController *)self view];
  v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = [(NUArticleViewController *)self view];
  [v5 setPreservesSuperviewLayoutMargins:1];

  v6 = [(NUArticleViewController *)self scrollViewController];
  [(NUArticleViewController *)self addChildViewController:v6];

  v7 = [(NUArticleViewController *)self view];
  v8 = [(NUArticleViewController *)self scrollViewController];
  v9 = [v8 view];
  [v7 addSubview:v9];

  v10 = [(NUArticleViewController *)self scrollViewController];
  [v10 didMoveToParentViewController:self];

  v11 = [(NUArticleViewController *)self scrollViewController];
  v12 = [v11 scrollView];
  [v12 _setContentInsetAdjustmentBehavior:2];

  v13 = [(NUArticleViewController *)self scrollViewController];
  v14 = [v13 scrollView];
  [v14 _setIndicatorInsetAdjustmentBehavior:1];

  v15 = [(NUArticleViewController *)self scrollViewController];
  uint64_t v16 = [v15 scrollView];
  [(id)v16 _accessibilitySetOpaqueElementScrollsContentIntoView:1];

  v17 = [(NUArticleViewController *)self loadingDelegate];
  LOBYTE(v16) = objc_opt_respondsToSelector();

  if (v16)
  {
    id v18 = [(NUArticleViewController *)self loadingDelegate];
    [v18 loadingWillStart];
  }
  id v19 = [(NUArticleViewController *)self loadingDelegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    v21 = [(NUArticleViewController *)self loadingDelegate];
    [v21 loadingDidStart];
  }
  objc_initWeak(&location, self);
  v22 = [(NUArticleViewController *)self eventManager];
  v23 = (void *)MEMORY[0x263EFFA08];
  v72[0] = @"silexContextDidLoadEvent";
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:1];
  v25 = [v23 setWithArray:v24];
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __38__NUArticleViewController_viewDidLoad__block_invoke;
  v66[3] = &unk_2645FED68;
  objc_copyWeak(&v67, &location);
  [v22 triggerOnceWhenAllEventsHaveOccurred:v25 block:v66];

  uint64_t v26 = [(NUArticleViewController *)self eventManager];
  v27 = (void *)MEMORY[0x263EFFA08];
  v71[0] = @"viewDidAppearEvent";
  v71[1] = @"silexContextDidLoadEvent";
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
  v29 = [v27 setWithArray:v28];
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_3;
  v64[3] = &unk_2645FED68;
  objc_copyWeak(&v65, &location);
  [v26 triggerAlwaysWhenAllEventsHaveOccurred:v29 block:v64];

  v30 = [(NUArticleViewController *)self eventManager];
  v31 = (void *)MEMORY[0x263EFFA08];
  v70 = @"viewDidDisappearEvent";
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
  v33 = [v31 setWithArray:v32];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_5;
  v62[3] = &unk_2645FED68;
  objc_copyWeak(&v63, &location);
  [v30 triggerAlwaysWhenAllEventsHaveOccurred:v33 block:v62];

  v34 = [(NUArticleViewController *)self documentSectionBlueprintProvider];
  v35 = [v34 observableHeaderBlueprint];
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_7;
  v60[3] = &unk_2645FED90;
  objc_copyWeak(&v61, &location);
  v36 = [v35 observe:v60];
  [v36 disposeOn:self];

  v37 = [(NUArticleViewController *)self documentSectionBlueprintProvider];
  v38 = [v37 observableContentOverlayBlueprintData];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_9;
  v58[3] = &unk_2645FEDB8;
  objc_copyWeak(&v59, &location);
  v39 = [v38 observe:v58];
  [v39 disposeOn:self];

  id v40 = [(NUArticleViewController *)self documentSectionBlueprintProvider];
  id v41 = [v40 observableFooterBlueprint];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_11;
  v56[3] = &unk_2645FED90;
  objc_copyWeak(&v57, &location);
  id v42 = [v41 observe:v56];
  [v42 disposeOn:self];

  id v43 = [(NUArticleViewController *)self documentSectionBlueprintProvider];
  id v44 = [v43 observableHeaderBlueprint];
  id v45 = [v44 value];
  [(NUArticleViewController *)self updateScrollViewControllerWithHeaderBlueprint:v45];

  id v46 = [(NUArticleViewController *)self documentSectionBlueprintProvider];
  id v47 = [v46 observableContentOverlayBlueprintData];
  v48 = [v47 value];
  id v49 = [v48 blueprint];
  id v50 = [(NUArticleViewController *)self documentSectionBlueprintProvider];
  v51 = [v50 observableContentOverlayBlueprintData];
  id v52 = [v51 value];
  [v52 topOffset];
  -[NUArticleViewController updateScrollViewControllerWithContentOverlayBlueprint:topOffset:](self, "updateScrollViewControllerWithContentOverlayBlueprint:topOffset:", v49);

  v53 = [(NUArticleViewController *)self documentSectionBlueprintProvider];
  id v54 = [v53 observableFooterBlueprint];
  v55 = [v54 value];
  [(NUArticleViewController *)self updateScrollViewControllerWithFooterBlueprint:v55];

  [(NUArticleViewController *)self loadArticle];
  objc_destroyWeak(&v57);
  objc_destroyWeak(&v59);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&v63);
  objc_destroyWeak(&v65);
  objc_destroyWeak(&v67);
  objc_destroyWeak(&location);
}

void __38__NUArticleViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v2 = WeakRetained;
    v3 = [v2 loadingDelegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      v5 = [v2 loadingDelegate];
      [v5 loadingWillFinishWithError:0];
    }
    v6 = [v2 loadingDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [v2 loadingDelegate];
      [v8 loadingDidFinishWithError:0];
    }
    id WeakRetained = v9;
  }
}

void __38__NUArticleViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained articleDataProvider];
    [v2 prefetchAssets];

    id WeakRetained = v3;
  }
}

void __38__NUArticleViewController_viewDidLoad__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained articleDataProvider];
    [v2 cancelAssetPrefetch];

    id WeakRetained = v3;
  }
}

void __38__NUArticleViewController_viewDidLoad__block_invoke_7(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained updateScrollViewControllerWithHeaderBlueprint:v5];
  }
}

void __38__NUArticleViewController_viewDidLoad__block_invoke_9(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v6 = [v7 blueprint];
    [v7 topOffset];
    objc_msgSend(v5, "updateScrollViewControllerWithContentOverlayBlueprint:topOffset:", v6);
  }
}

void __38__NUArticleViewController_viewDidLoad__block_invoke_11(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained updateScrollViewControllerWithFooterBlueprint:v5];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUArticleViewController;
  [(NUArticleViewController *)&v5 viewWillAppear:a3];
  char v4 = [(NUArticleViewController *)self eventManager];
  [v4 fireEvent:@"viewWillAppearEvent"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUArticleViewController;
  [(NUArticleViewController *)&v5 viewDidAppear:a3];
  char v4 = [(NUArticleViewController *)self eventManager];
  [v4 fireEvent:@"viewDidAppearEvent"];
}

- (void)viewSafeAreaInsetsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)NUArticleViewController;
  [(NUArticleViewController *)&v8 viewSafeAreaInsetsDidChange];
  id v3 = [(NUArticleViewController *)self articleDataProvider];
  char v4 = [v3 article];
  objc_super v5 = [v4 headline];

  if (v5)
  {
    v6 = [(NUArticleViewController *)self scrollView];
    BOOL v7 = [(NUArticleViewController *)self useTransparentNavigationBar];
    -[UIViewController nu_adjustInsetsForScrollView:transparentNavigationBar:withEdgeInsets:](self, "nu_adjustInsetsForScrollView:transparentNavigationBar:withEdgeInsets:", v6, v7, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUArticleViewController;
  [(NUArticleViewController *)&v4 viewWillDisappear:a3];
  [(NUArticleViewController *)self setArticleIsPresentingFullscreen:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUArticleViewController;
  [(NUArticleViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(NUArticleViewController *)self eventManager];
  [v4 fireEvent:@"viewDidDisappearEvent"];
}

- (void)loadArticle
{
  objc_initWeak(&location, self);
  id v3 = [(NUArticleViewController *)self articleDataProvider];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__NUArticleViewController_loadArticle__block_invoke;
  v4[3] = &unk_2645FEE08;
  objc_copyWeak(&v5, &location);
  [v3 loadContextWithCompletionBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __38__NUArticleViewController_loadArticle__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    id v13 = WeakRetained;
    v14 = [v13 articleDataProvider];
    v15 = [v14 article];
    uint64_t v16 = [v15 headline];

    if (v16)
    {
      v17 = [v13 scrollView];
      uint64_t v18 = [v13 useTransparentNavigationBar];
      objc_msgSend(v13, "nu_adjustInsetsForScrollView:transparentNavigationBar:withEdgeInsets:", v17, v18, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    }
    if (!v7 || v9)
    {
      v24 = [v13 loadingDelegate];
      char v25 = objc_opt_respondsToSelector();

      if (v25)
      {
        uint64_t v26 = [v13 loadingDelegate];
        [v26 loadingWillFinishWithError:v9];
      }
      v27 = [v13 loadingDelegate];
      char v28 = objc_opt_respondsToSelector();

      if (v28)
      {
        v29 = [v13 loadingDelegate];
        [v29 loadingDidFinishWithError:v9];
      }
    }
    else
    {
      id v19 = [v13 articleDataProvider];
      char v20 = [v19 article];
      v21 = [v20 headline];
      v22 = [v21 videoURL];

      if ([v13 shouldAutoPlayVideo] && v22)
      {
        v23 = [v13 videoPlayerViewControllerManager];
        [v23 configureAutoplayForVideoWithURL:v22 analyticsRouter:0];

        [v13 setShouldAutoPlayVideo:0];
      }
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __38__NUArticleViewController_loadArticle__block_invoke_3;
      v30[3] = &unk_2645FEDE0;
      objc_copyWeak(&v32, v10);
      id v31 = v7;
      [v8 registerFontsWithCompletion:v30];

      objc_destroyWeak(&v32);
    }
  }
}

void __38__NUArticleViewController_loadArticle__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained finalizeArticleLoadingWithContext:*(void *)(a1 + 32)];
}

- (void)finalizeArticleLoadingWithContext:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v5 = [(NUArticleViewController *)self loadingListeners];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v51;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v50 + 1) + 8 * v9);
        v11 = [(NUArticleViewController *)self articleDataProvider];
        v12 = [v11 article];
        [v10 didLoadArticle:v12 withContext:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v7);
  }

  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __61__NUArticleViewController_finalizeArticleLoadingWithContext___block_invoke;
  v49[3] = &unk_2645FEE30;
  v49[4] = self;
  id v13 = __61__NUArticleViewController_finalizeArticleLoadingWithContext___block_invoke((uint64_t)v49);
  if (v13) {
    [(NUArticleViewController *)self setPresentationMode:0];
  }
  v14 = NUArticleLoadLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(NUArticleViewController *)self articleDataProvider];
    uint64_t v16 = [v15 articleID];
    *(_DWORD *)buf = 138543362;
    id v56 = v16;
    _os_log_impl(&dword_2221C5000, v14, OS_LOG_TYPE_DEFAULT, "Article did finish loading, starting layout, articleID=%{public}@", buf, 0xCu);
  }
  CFTimeInterval v17 = CACurrentMediaTime();
  uint64_t v18 = [(NUArticleViewController *)self articleDataProvider];
  id v19 = [v18 articleID];

  char v20 = [(NUArticleViewController *)self eventManager];
  v21 = (void *)MEMORY[0x263EFFA08];
  id v54 = @"silexContextDidLoadEvent";
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
  v23 = [v21 setWithArray:v22];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __61__NUArticleViewController_finalizeArticleLoadingWithContext___block_invoke_347;
  v46[3] = &unk_2645FEE58;
  id v24 = v19;
  id v47 = v24;
  CFTimeInterval v48 = v17;
  [v20 triggerOnceWhenAllEventsHaveOccurred:v23 block:v46];

  char v25 = [(NUArticleViewController *)self scrollViewController];
  [v25 loadContext:v4 analyticsReporting:self];

  [(NUArticleViewController *)self updatePresentationAttributes];
  if (v13)
  {
    uint64_t v26 = [(NUArticleViewController *)self scrollViewController];
    [v26 updateScrollPosition:v13 animated:0];

    [(NUArticleViewController *)self setDidRestoreScrollPosition:1];
  }
  v27 = [(NUArticleViewController *)self articleDataProvider];
  char v28 = [v27 article];
  v29 = [v28 headline];

  v30 = [(NUArticleViewController *)self articleDataProvider];
  id v31 = [v30 article];
  id v32 = [v31 headline];
  uint64_t v33 = [v32 role];

  if (v33 == 3)
  {
    v34 = [(NUArticleViewController *)self scrollViewController];
    v35 = [v34 scrollView];
    [v35 setAccessibilityLabel:0];
  }
  else
  {
    v34 = [v29 title];
    v36 = [v29 sourceName];
    uint64_t v37 = [v36 length];

    if (v37)
    {
      v38 = NSString;
      v39 = [v29 sourceName];
      id v40 = [v29 title];
      uint64_t v41 = [v38 stringWithFormat:@"%@, %@", v39, v40];

      v34 = (void *)v41;
    }
    v35 = [(NUArticleViewController *)self scrollViewController];
    id v42 = [v35 scrollView];
    [v42 setAccessibilityLabel:v34];
  }
  UIAccessibilityNotifications v43 = *MEMORY[0x263F1CE18];
  id v44 = [(NUArticleViewController *)self scrollViewController];
  id v45 = [v44 scrollView];
  UIAccessibilityPostNotification(v43, v45);
}

id __61__NUArticleViewController_finalizeArticleLoadingWithContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) articleDataProvider];
  id v3 = [v2 article];
  id v4 = [v3 headline];

  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = [*(id *)(a1 + 32) articleScrollPositionManager];
    uint64_t v7 = [v6 scrollPositionForHeadline:v5];

    if (v7)
    {
      uint64_t v8 = [v7 position];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __61__NUArticleViewController_finalizeArticleLoadingWithContext___block_invoke_347(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = NUArticleLoadLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    CFTimeInterval v4 = CACurrentMediaTime() - *(double *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    CFTimeInterval v8 = v4;
    _os_log_impl(&dword_2221C5000, v2, OS_LOG_TYPE_DEFAULT, "Article did finish initial layout, articleID=%{public}@, duration=%f", (uint8_t *)&v5, 0x16u);
  }
}

- (BOOL)becomeFirstResponder
{
  uint64_t v3 = [(NUArticleViewController *)self scrollViewController];
  [v3 becomeFirstResponder];

  v5.receiver = self;
  v5.super_class = (Class)NUArticleViewController;
  return [(NUArticleViewController *)&v5 becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)resignFirstResponder
{
  uint64_t v3 = [(NUArticleViewController *)self scrollViewController];
  [v3 resignFirstResponder];

  v5.receiver = self;
  v5.super_class = (Class)NUArticleViewController;
  return [(NUArticleViewController *)&v5 resignFirstResponder];
}

- (UIResponder)responder
{
  id v2 = [(NUArticleViewController *)self scrollViewController];
  uint64_t v3 = [v2 responder];

  return (UIResponder *)v3;
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v3 = [(NUArticleViewController *)self eventManager];
  [v3 fireEvent:@"appWillEnterForegroundEvent"];
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v3 = [(NUArticleViewController *)self eventManager];
  [v3 fireEvent:@"appDidEnterForegroundEvent"];
}

- (void)nowPlayingWillDisappear:(id)a3
{
  id v3 = [(NUArticleViewController *)self eventManager];
  [v3 fireEvent:@"nowPlayingWillDisappearEvent"];
}

- (void)nowPlayingDidDisappear:(id)a3
{
  id v3 = [(NUArticleViewController *)self eventManager];
  [v3 fireEvent:@"nowPlayingDidDisappearEvent"];
}

- (void)viewDidLayoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)NUArticleViewController;
  [(NUArticleViewController *)&v26 viewDidLayoutSubviews];
  id v3 = [(NUArticleViewController *)self scrollViewController];
  CFTimeInterval v4 = [v3 presentationAttributes];
  [v4 canvasSize];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [(NUArticleViewController *)self view];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  if (v6 != v11 || v8 != v13) {
    [(NUArticleViewController *)self updatePresentationAttributes];
  }
  v15 = [(NUArticleViewController *)self view];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  id v24 = [(NUArticleViewController *)self scrollViewController];
  char v25 = [v24 view];
  objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NUArticleViewController;
  [(NUArticleViewController *)&v9 traitCollectionDidChange:a3];
  CFTimeInterval v4 = [(NUArticleViewController *)self articleDataProvider];
  double v5 = [v4 article];
  double v6 = [v5 headline];

  if (v6)
  {
    double v7 = [(NUArticleViewController *)self scrollView];
    BOOL v8 = [(NUArticleViewController *)self useTransparentNavigationBar];
    -[UIViewController nu_adjustInsetsForScrollView:transparentNavigationBar:withEdgeInsets:](self, "nu_adjustInsetsForScrollView:transparentNavigationBar:withEdgeInsets:", v7, v8, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  }
}

- (int64_t)preferredStatusBarStyle
{
  id v3 = [(NUArticleViewController *)self articleViewStyler];
  CFTimeInterval v4 = [v3 value];
  if (v4)
  {
    double v5 = [(NUArticleViewController *)self articleViewStyler];
    double v6 = [v5 value];
    id v7 = (id)[v6 statusBarStyle];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NUArticleViewController;
    id v7 = [(NUArticleViewController *)&v9 preferredStatusBarStyle];
  }

  return (int64_t)v7;
}

- (void)scrollViewControllerDidLayoutContent:(id)a3
{
  CFTimeInterval v4 = [(NUArticleViewController *)self eventManager];
  [v4 fireEvent:@"silexContextDidLoadEvent"];

  [(NUArticleViewController *)self setPresentationMode:0];
  [(NUArticleViewController *)self updatePresentationAttributes];

  [(NUArticleViewController *)self updateTextSelectionForPaywallPresentation];
}

- (void)scrollViewController:(id)a3 didApplyDocumentStyle:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    double v6 = [NUArticleViewStyler alloc];
    id v7 = [v5 backgroundColor];
    BOOL v8 = [v5 topBackgroundColor];

    double v10 = [(NUArticleViewStyler *)v6 initWithBackgroundColor:v7 topBackgroundColor:v8];
    objc_super v9 = [(NUArticleViewController *)self articleViewStyler];
    [v9 next:v10];
  }
}

- (void)scrollViewControllerRequestsFullscreen:(id)a3
{
}

- (void)willReturnToFullscreen:(id)a3
{
}

- (void)scrollViewControllerWillDismissFullscreen:(id)a3
{
}

- (void)scrollViewControllerDismissFullscreen:(id)a3
{
}

- (double)navigationBarHeightForScrollViewController:(id)a3
{
  BOOL v4 = [(NUArticleViewController *)self useTransparentNavigationBar];
  id v5 = [(NUArticleViewController *)self navigationController];
  char v6 = [v5 isNavigationBarHidden];

  if ((v6 & 1) != 0 || v4) {
    return 0.0;
  }
  id v7 = [(NUArticleViewController *)self navigationController];
  BOOL v8 = [v7 navigationBar];
  [v8 frame];
  double MaxY = CGRectGetMaxY(v11);

  return MaxY;
}

- (double)toolBarHeightForScrollViewController:(id)a3
{
  BOOL v4 = [(NUArticleViewController *)self navigationController];
  char v5 = [v4 isToolbarHidden];

  double v6 = 0.0;
  if ((v5 & 1) == 0)
  {
    id v7 = [(NUArticleViewController *)self navigationController];
    BOOL v8 = [v7 toolbar];
    [v8 frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    v21.origin.x = v10;
    v21.origin.y = v12;
    v21.size.width = v14;
    v21.size.height = v16;
    if (!CGRectIsNull(v21))
    {
      v22.origin.x = v10;
      v22.origin.y = v12;
      v22.size.width = v14;
      v22.size.height = v16;
      if (!CGRectIsEmpty(v22))
      {
        double v17 = [(NUArticleViewController *)self view];
        [v17 bounds];
        double Height = CGRectGetHeight(v23);
        v24.origin.x = v10;
        v24.origin.y = v12;
        v24.size.width = v14;
        v24.size.height = v16;
        double v19 = Height - CGRectGetMinY(v24);

        return fmax(v19, 0.0);
      }
    }
  }
  return v6;
}

- (void)scrollViewController:(id)a3 enableNavigation:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(UIViewController *)self navigationControl];
  [v5 enableNavigation:v4];
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  BOOL v4 = [(NUArticleViewController *)self scrollViewController];
  id v5 = [v4 scrollView];
  int v6 = [v5 isTracking];

  if (v6)
  {
    uint64_t v7 = [(NUArticleViewController *)self manualScrollingStartDate];
    id v9 = (id)v7;
    if (v7)
    {
      [(NUArticleViewController *)self setManualScrollingStartDate:v7];
    }
    else
    {
      BOOL v8 = [MEMORY[0x263EFF910] date];
      [(NUArticleViewController *)self setManualScrollingStartDate:v8];
    }
  }
}

- (void)scrollViewControllerDidScrollToBottomOfPrimaryContent:(id)a3
{
  BOOL v4 = [(NUArticleViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(NUArticleViewController *)self delegate];
    [v6 articleViewControllerDidScrollToBottomOfPrimaryContent:self];
  }
}

- (void)scrollViewControllerDidStopScrolling:(id)a3
{
  BOOL v4 = [(NUArticleViewController *)self scrollViewController];
  char v5 = [v4 context];

  if (v5)
  {
    id v6 = [(NUArticleViewController *)self scrollViewController];
    uint64_t v10 = [v6 scrollPosition];

    if (v10)
    {
      uint64_t v7 = [(NUArticleViewController *)self delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = [(NUArticleViewController *)self delegate];
        [v9 articleViewController:self didScrollToPosition:v10];
      }
      if ([(NUArticleViewController *)self shouldSaveScrollPosition]) {
        [(NUArticleViewController *)self saveScrollPosition:v10];
      }
    }
    MEMORY[0x270F9A758]();
  }
}

- (BOOL)useTransparentNavigationBar
{
  if ([(NUArticleViewController *)self shouldDisableTransparentNavigationBar]) {
    return 0;
  }
  BOOL v4 = [(NUArticleViewController *)self articleDataProvider];
  char v5 = [v4 article];
  id v6 = [v5 headline];
  char v7 = [v6 useTransparentNavigationBar];

  return v7;
}

- (void)reportEvent:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(NUArticleViewController *)self analyticsReporting];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(NUArticleViewController *)self analyticsReporting];
    [v6 reportEvent:v7];
  }
}

- (void)setArticleContext:(id)a3
{
  char v5 = (NUArticleContext *)a3;
  if (self->_articleContext != v5)
  {
    objc_storeStrong((id *)&self->_articleContext, a3);
    [(NUArticleViewController *)self setShouldAutoPlayVideo:[(NUArticleContext *)v5 shouldAutoPlayVideo]];
    [(NUArticleViewController *)self setShouldDisableTransparentNavigationBar:[(NUArticleContext *)v5 shouldDisableTransparentNavigationBar]];
  }
}

- (void)setArticleIsPresentingFullscreen:(BOOL)a3
{
  if (self->_articleIsPresentingFullscreen != a3)
  {
    BOOL v3 = a3;
    self->_articleIsPresentingFullscreen = a3;
    id v5 = [(NUArticleViewController *)self chromeControl];
    [v5 prefersChromeHidden:v3 fromViewController:self];
  }
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(NUArticleViewController *)self scrollViewController];
  id v5 = [v9 scrollView];
  id v6 = [(NUArticleViewController *)self scrollViewController];
  id v7 = [v6 scrollView];
  [v7 adjustedContentInset];
  objc_msgSend(v5, "setContentOffset:animated:", v3, 0.0, -v8);
}

- (void)setContentSizeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_contentSizeCategory, a3);
  id v5 = [(NUArticleViewController *)self currentPresentationAttributes];
  BOOL v4 = [(NUArticleViewController *)self scrollViewController];
  [v4 updatePresentationWithAttributes:v5];
}

- (NSString)contentSizeCategory
{
  contentSizeCategory = self->_contentSizeCategory;
  if (contentSizeCategory)
  {
    BOOL v3 = contentSizeCategory;
  }
  else
  {
    BOOL v4 = [MEMORY[0x263F1C408] sharedApplication];
    BOOL v3 = [v4 preferredContentSizeCategory];
  }

  return v3;
}

- (NSString)selectedText
{
  id v2 = [(NUArticleViewController *)self scrollViewController];
  BOOL v3 = [v2 selectedText];

  return (NSString *)v3;
}

- (void)setContentScale:(int64_t)a3
{
  self->_contentScale = a3;
  id v5 = [(NUArticleViewController *)self currentPresentationAttributes];
  BOOL v4 = [(NUArticleViewController *)self scrollViewController];
  [v4 updatePresentationWithAttributes:v5];
}

- (void)updateScrollViewControllerWithHeaderBlueprint:(id)a3
{
  id v4 = a3;
  id v5 = [(NUArticleViewController *)self scrollViewController];
  [v5 applyHeaderBlueprint:v4];
}

- (void)updateScrollViewControllerWithContentOverlayBlueprint:(id)a3 topOffset:(double)a4
{
  id v6 = a3;
  id v7 = [(NUArticleViewController *)self scrollViewController];
  [v7 applyContentOverlayBlueprint:v6 topOffset:a4];

  [(NUArticleViewController *)self updateTextSelectionForPaywallPresentation];
}

- (void)updateScrollViewControllerWithFooterBlueprint:(id)a3
{
  id v4 = a3;
  id v5 = [(NUArticleViewController *)self scrollViewController];
  [v5 applyFooterBlueprint:v4];
}

- (void)updatePresentationAttributes
{
  id v4 = [(NUArticleViewController *)self scrollViewController];
  BOOL v3 = [(NUArticleViewController *)self currentPresentationAttributes];
  [v4 updatePresentationWithAttributes:v3];
}

- (id)currentPresentationAttributes
{
  BOOL v3 = objc_opt_new();
  id v4 = [(NUArticleViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setCanvasSize:", v5, v6);

  id v7 = [(NUArticleViewController *)self contentSizeCategory];
  [v3 setContentSizeCategory:v7];

  unint64_t v8 = [(NUArticleViewController *)self contentScale] - 1;
  double v9 = 1.0;
  if (v8 <= 0xA) {
    double v9 = dbl_222201820[v8];
  }
  [v3 setContentScaleFactor:v9];
  uint64_t v10 = [(NUArticleViewController *)self debugSettingsProvider];
  objc_msgSend(v3, "setEnableViewportDebugging:", objc_msgSend(v10, "viewportDebuggingEnabled"));

  double v11 = [(NUArticleViewController *)self debugSettingsProvider];
  objc_msgSend(v3, "setTestingConditionEnabled:", objc_msgSend(v11, "testingConditionEnabled"));

  objc_msgSend(v3, "setPresentationMode:", -[NUArticleViewController presentationMode](self, "presentationMode"));
  objc_msgSend(v3, "setUseTransparentToolbar:", -[NUArticleViewController useTransparentNavigationBar](self, "useTransparentNavigationBar"));

  return v3;
}

- (void)updateScrollPositionFromContext
{
  BOOL v3 = [(NUArticleViewController *)self articleContext];
  id v4 = [v3 scrollPosition];

  if (v4)
  {
    [(NUArticleViewController *)self setPresentationMode:0];
    [(NUArticleViewController *)self updatePresentationAttributes];
    double v5 = [(NUArticleViewController *)self scrollViewController];
    double v6 = [(NUArticleViewController *)self articleContext];
    id v7 = [v6 scrollPosition];
    [v5 updateScrollPosition:v7 animated:0];

    [(NUArticleViewController *)self setDidRestoreScrollPosition:1];
    unint64_t v8 = [(NUArticleViewController *)self articleContext];
    double v9 = [v8 scrollPosition];
    [(NUArticleViewController *)self saveScrollPosition:v9];

    [(NUArticleViewController *)self setArticleContext:0];
  }
}

- (BOOL)shouldSaveScrollPosition
{
  BOOL v3 = [(NUArticleViewController *)self scrollViewController];
  id v4 = [v3 context];

  if (!v4) {
    return 0;
  }
  if ([(NUArticleViewController *)self didRestoreScrollPosition]) {
    return 1;
  }
  uint64_t v5 = [(NUArticleViewController *)self manualScrollingStartDate];
  if (!v5) {
    return 0;
  }
  double v6 = (void *)v5;
  id v7 = [MEMORY[0x263EFF910] date];
  unint64_t v8 = [(NUArticleViewController *)self manualScrollingStartDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  return v10 > 10.0;
}

- (void)saveScrollPosition:(id)a3
{
  id v9 = a3;
  id v4 = [(NUArticleViewController *)self articleDataProvider];
  uint64_t v5 = [v4 article];
  double v6 = [v5 headline];

  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = [(NUArticleViewController *)self articleScrollPositionManager];
    [v8 setPosition:v9 headline:v7];
  }
}

- (void)scrollToAudioPositionAndHideMessageAfterEvent:(id)a3
{
  id v13 = a3;
  id v4 = [(NUArticleViewController *)self articleDataProvider];
  uint64_t v5 = [v4 article];
  double v6 = [v5 headline];

  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = [(NUArticleViewController *)self articleScrollPositionManager];
    id v9 = [v8 scrollPositionForHeadline:v7];

    if (v9)
    {
      id v10 = v9;
      if ([v10 source] == 1)
      {
        double v11 = [(NUArticleViewController *)self scrollViewController];
        CGFloat v12 = [v10 position];
        [v11 updateScrollPosition:v12 animated:0];

        [(NUArticleViewController *)self setDidRestoreScrollPosition:1];
        [(NUArticleViewController *)self showArticleMessage:0 hideAfterEvent:v13];
      }
    }
  }
}

- (void)showArticleMessage:(int64_t)a3 hideAfterEvent:(id)a4
{
  id v6 = a4;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__0;
  v11[4] = __Block_byref_object_dispose__0;
  id v7 = [(NUArticleViewController *)self articleMessager];
  id v12 = [v7 showMessage:a3];

  if (v6)
  {
    unint64_t v8 = [(NUArticleViewController *)self eventManager];
    id v9 = [MEMORY[0x263EFFA08] setWithObject:v6];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__NUArticleViewController_showArticleMessage_hideAfterEvent___block_invoke;
    v10[3] = &unk_2645FEE80;
    v10[4] = v11;
    [v8 triggerOnceWhenAnyEventHasOccurred:v9 block:v10];
  }
  _Block_object_dispose(v11, 8);
}

void __61__NUArticleViewController_showArticleMessage_hideAfterEvent___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (id)articleMessager
{
  id v2 = [(NUArticleViewController *)self navigationController];
  BOOL v3 = [v2 topViewController];
  id v4 = [v3 navigationItem];
  uint64_t v5 = [v4 _bottomPalette];
  id v6 = [v5 contentView];
  id v7 = FCProtocolCast();

  return v7;
}

+ (id)_parentOrPresentingViewControllerFor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 parentViewController];
  if (!v4)
  {
    id v4 = [v3 presentingViewController];
  }

  return v4;
}

- (BOOL)scrollViewController:(id)a3 shouldOccludeAccessibilityElement:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[NUArticleViewController _parentOrPresentingViewControllerFor:self];
  if (v6)
  {
    id v7 = (void *)v6;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v8 = +[NUArticleViewController _parentOrPresentingViewControllerFor:v7];

      id v7 = (void *)v8;
      if (!v8) {
        goto LABEL_5;
      }
    }
    char v9 = [v7 shouldOccludeAccessibilityElement:v5];
  }
  else
  {
LABEL_5:
    char v9 = 0;
  }

  return v9;
}

- (BOOL)accessibilityShouldScrollForScrollViewController:(id)a3 defaultValue:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = +[NUArticleViewController _parentOrPresentingViewControllerFor:self];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v9 = +[NUArticleViewController _parentOrPresentingViewControllerFor:v8];

      uint64_t v8 = (void *)v9;
      if (!v9) {
        goto LABEL_7;
      }
    }
    id v10 = [v6 scrollView];
    LOBYTE(v4) = [v8 accessibilityShouldScroll:v10 defaultValue:v4];
  }
LABEL_7:

  return v4;
}

- (BOOL)isPreviewingOrShowingHardPaywall
{
  id v2 = +[NUArticleViewController _parentOrPresentingViewControllerFor:self];
  if (v2)
  {
    while (![v2 conformsToProtocol:&unk_26D4E5388])
    {
      uint64_t v3 = +[NUArticleViewController _parentOrPresentingViewControllerFor:v2];

      id v2 = (void *)v3;
      if (!v3) {
        goto LABEL_9;
      }
    }
    if ([v2 isPreviewing]) {
      LOBYTE(v3) = 1;
    }
    else {
      LOBYTE(v3) = [v2 isShowingHardPaywall];
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
LABEL_9:

  return v3;
}

- (void)updateTextSelectionForPaywallPresentation
{
  BOOL v3 = [(NUArticleViewController *)self isPreviewingOrShowingHardPaywall];
  id v4 = [(NUArticleViewController *)self scrollViewController];
  [v4 setTextSelectionEnabled:!v3];
}

- (NULoadingDelegate)loadingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadingDelegate);

  return (NULoadingDelegate *)WeakRetained;
}

- (void)setLoadingDelegate:(id)a3
{
}

- (int64_t)contentScale
{
  return self->_contentScale;
}

- (NUArticleViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NUArticleViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXAnalyticsReporting)analyticsReporting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsReporting);

  return (SXAnalyticsReporting *)WeakRetained;
}

- (void)setAnalyticsReporting:(id)a3
{
}

- (FCObservable)articleViewStyler
{
  return self->_articleViewStyler;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (NUArticleContext)articleContext
{
  return self->_articleContext;
}

- (SXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (NUArticleDataProvider)articleDataProvider
{
  return self->_articleDataProvider;
}

- (NUEndOfArticleDataProvider)endOfArticleDataProvider
{
  return self->_endOfArticleDataProvider;
}

- (NFEventManager)eventManager
{
  return self->_eventManager;
}

- (NUArticleKeyCommandManager)keyCommandManager
{
  return self->_keyCommandManager;
}

- (NSHashTable)loadingListeners
{
  return self->_loadingListeners;
}

- (NUDocumentSectionBlueprintProvider)documentSectionBlueprintProvider
{
  return self->_documentSectionBlueprintProvider;
}

- (NUANFDebugSettingsProvider)debugSettingsProvider
{
  return self->_debugSettingsProvider;
}

- (BOOL)articleIsPresentingFullscreen
{
  return self->_articleIsPresentingFullscreen;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (SXVideoPlayerViewControllerManager)videoPlayerViewControllerManager
{
  return self->_videoPlayerViewControllerManager;
}

- (NUArticleScrollPositionManagerType)articleScrollPositionManager
{
  return self->_articleScrollPositionManager;
}

- (BOOL)didRestoreScrollPosition
{
  return self->_didRestoreScrollPosition;
}

- (void)setDidRestoreScrollPosition:(BOOL)a3
{
  self->_didRestoreScrollPosition = a3;
}

- (NSDate)manualScrollingStartDate
{
  return self->_manualScrollingStartDate;
}

- (void)setManualScrollingStartDate:(id)a3
{
}

- (NUSpotlightManager)spotlightManager
{
  return self->_spotlightManager;
}

- (NUChromeControl)chromeControl
{
  return self->_chromeControl;
}

- (double)articleLoadedTime
{
  return self->_articleLoadedTime;
}

- (void)setArticleLoadedTime:(double)a3
{
  self->_articleLoadedTime = a3;
}

- (BOOL)shouldAutoPlayVideo
{
  return self->_shouldAutoPlayVideo;
}

- (void)setShouldAutoPlayVideo:(BOOL)a3
{
  self->_shouldAutoPlayVideo = a3;
}

- (BOOL)shouldDisableTransparentNavigationBar
{
  return self->_shouldDisableTransparentNavigationBar;
}

- (void)setShouldDisableTransparentNavigationBar:(BOOL)a3
{
  self->_shouldDisableTransparentNavigationBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chromeControl, 0);
  objc_storeStrong((id *)&self->_spotlightManager, 0);
  objc_storeStrong((id *)&self->_manualScrollingStartDate, 0);
  objc_storeStrong((id *)&self->_articleScrollPositionManager, 0);
  objc_storeStrong((id *)&self->_videoPlayerViewControllerManager, 0);
  objc_storeStrong((id *)&self->_debugSettingsProvider, 0);
  objc_storeStrong((id *)&self->_documentSectionBlueprintProvider, 0);
  objc_storeStrong((id *)&self->_loadingListeners, 0);
  objc_storeStrong((id *)&self->_keyCommandManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_endOfArticleDataProvider, 0);
  objc_storeStrong((id *)&self->_articleDataProvider, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_storeStrong((id *)&self->_articleContext, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_articleViewStyler, 0);
  objc_destroyWeak((id *)&self->_analyticsReporting);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);

  objc_destroyWeak((id *)&self->_loadingDelegate);
}

@end