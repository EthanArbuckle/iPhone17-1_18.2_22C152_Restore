@interface SBFloatingDockRootViewController
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isDefaultLibraryContainerViewControllerForegroundForFloatingDockViewController:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isFloatingDockFullyPresented;
- (BOOL)isFloatingDockPresented;
- (BOOL)isFloatingDockViewControllerPresentedOnExternalDisplay:(id)a3;
- (BOOL)isFloatingDockViewControllerPresentedOverApplication:(id)a3;
- (BOOL)isFloatingDockViewControllerPresentedOverTransitioningAppToAppContent:(id)a3;
- (BOOL)isFloatingDockViewControllerPresentedOverTransitioningSwitcherContent:(id)a3;
- (BOOL)isLibraryPodIconEnabled;
- (BOOL)isPresentingFolder;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)isTransitioningPresentation;
- (BOOL)useDismissHitTestPadding;
- (BSInvalidatable)displayLayoutAssertion;
- (CGRect)_calculateStandardDockFrame;
- (CGRect)floatingDockScreenFrame;
- (CGRect)floatingDockScreenPresentationFrame;
- (NSSet)presentedIconLocations;
- (SBAppSuggestionManager)appSuggestionManager;
- (SBApplication)requestedSuggestedApplication;
- (SBApplicationController)applicationController;
- (SBFAnalyticsClient)analyticsClient;
- (SBFloatingDockHomeScreenContextProviding)homeScreenContextProvider;
- (SBFloatingDockRootViewController)initWithHomeScreenContextProvider:(id)a3 applicationController:(id)a4 recentsController:(id)a5 recentsDataStore:(id)a6 appSuggestionManager:(id)a7 layoutStateTransitionCoordinator:(id)a8 iconViewProvider:(id)a9 analyticsClient:(id)a10;
- (SBFloatingDockRootViewControllerDelegate)delegate;
- (SBFloatingDockSuggestionsModel)suggestionsModel;
- (SBFloatingDockViewController)floatingDockViewController;
- (SBFolderController)presentedFolderController;
- (SBIconListView)suggestionsIconListView;
- (SBIconListView)userIconListView;
- (SBIconViewProviding)iconViewProvider;
- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator;
- (SBRecentDisplayItemsController)recentsController;
- (SBRecentDisplayItemsDataStore)recentsDataStore;
- (SBWorkspaceApplicationSceneTransitionContext)currentTransitionContext;
- (_UILegibilitySettings)legibilitySettings;
- (double)_floatingDockViewTranslation;
- (double)_floatingDockViewTranslationForHeight:(double)a3;
- (double)effectiveFloatingDockHeight;
- (double)floatingDockHeight;
- (double)floatingDockHeightForFrame:(CGRect)a3;
- (double)floatingDockViewTopMargin;
- (double)maximumDockContinuousCornerRadius;
- (double)maximumFloatingDockHeight;
- (double)minimumHomeScreenScaleForFloatingDockViewController:(id)a3;
- (double)preferredVerticalMargin;
- (double)presentedProgress;
- (double)translationFromFullyPresentedFrame;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)floatingDockViewController:(id)a3 acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason:(id)a4;
- (id)foregroundLibraryContainerViewControllerForFloatingDockViewController:(id)a3;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (id)libraryContainerViewControllerForFloatingDockViewController:(id)a3;
- (unint64_t)floatingDockPresentationAnimationCount;
- (void)_beginPresentationTransition;
- (void)_endPresentationTransition;
- (void)_handlePanGestureRecognizer:(id)a3;
- (void)_layoutFloatingDockPresentationProgress:(double)a3;
- (void)_setDisplayLayoutElementActive:(BOOL)a3;
- (void)_setDisplayLayoutElementActive:(BOOL)a3 windowLevel:(double)a4;
- (void)_setPresentedProgress:(double)a3 animated:(BOOL)a4 interactive:(BOOL)a5 completion:(id)a6;
- (void)cleanupAfterTransitionToEnvironmentMode:(int64_t)a3;
- (void)dealloc;
- (void)dismissPresentedFolderAnimated:(BOOL)a3 withTransitionContext:(id)a4 completion:(id)a5;
- (void)dismissPresentedLibraryAnimated:(BOOL)a3 withTransitionContext:(id)a4 completion:(id)a5;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)floatingDockViewController:(id)a3 didChangeContentFrame:(CGRect)a4;
- (void)floatingDockViewController:(id)a3 didChangeContentHeight:(double)a4;
- (void)floatingDockViewController:(id)a3 wantsToBePresented:(BOOL)a4;
- (void)floatingDockViewController:(id)a3 willPerformTransitionWithFolder:(id)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6;
- (void)floatingDockViewController:(id)a3 willUseAnimator:(id)a4 forTransitioningWithFolder:(id)a5 presenting:(BOOL)a6;
- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4;
- (void)layoutUserControlledIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4;
- (void)prepareForTransitionToEnvironmentMode:(int64_t)a3 fromDockVisible:(BOOL)a4 toDockVisible:(BOOL)a5;
- (void)presentFolderForIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setAnalyticsClient:(id)a3;
- (void)setCurrentTransitionContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLayoutAssertion:(id)a3;
- (void)setFloatingDockPresentationAnimationCount:(unint64_t)a3;
- (void)setFloatingDockViewController:(id)a3;
- (void)setLayoutStateTransitionCoordinator:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLibraryPodIconEnabled:(BOOL)a3;
- (void)setPresentationProgress:(double)a3 animated:(BOOL)a4 interactive:(BOOL)a5;
- (void)setPresentationProgress:(double)a3 animated:(BOOL)a4 interactive:(BOOL)a5 withCompletion:(id)a6;
- (void)setPresentationProgress:(double)a3 interactive:(BOOL)a4;
- (void)setPresentationProgress:(double)a3 interactive:(BOOL)a4 withCompletion:(id)a5;
- (void)setPresentationProgressInteractively:(double)a3;
- (void)setPresentationProgressInteractively:(double)a3 withCompletion:(id)a4;
- (void)setRecentsController:(id)a3;
- (void)setRecentsDataStore:(id)a3;
- (void)setRequestedSuggestedApplication:(id)a3;
- (void)setSuggestionsModel:(id)a3;
- (void)setTransitioningPresentation:(BOOL)a3;
- (void)setUseDismissHitTestPadding:(BOOL)a3;
- (void)updateDisplayLayoutElementWindowLevel:(double)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SBFloatingDockRootViewController

- (SBFloatingDockRootViewController)initWithHomeScreenContextProvider:(id)a3 applicationController:(id)a4 recentsController:(id)a5 recentsDataStore:(id)a6 appSuggestionManager:(id)a7 layoutStateTransitionCoordinator:(id)a8 iconViewProvider:(id)a9 analyticsClient:(id)a10
{
  id v16 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)SBFloatingDockRootViewController;
  v20 = [(SBFloatingDockRootViewController *)&v27 initWithNibName:0 bundle:0];
  v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_homeScreenContextProvider, v16);
    objc_storeStrong((id *)&v21->_applicationController, a4);
    objc_storeStrong((id *)&v21->_appSuggestionManager, a7);
    v21->_presentedProgress = 1.0;
    objc_storeStrong((id *)&v21->_recentsController, a5);
    objc_storeStrong((id *)&v21->_recentsDataStore, a6);
    objc_storeWeak((id *)&v21->_layoutStateTransitionCoordinator, v17);
    objc_storeWeak((id *)&v21->_iconViewProvider, v18);
    objc_storeStrong((id *)&v21->_analyticsClient, a10);
  }

  return v21;
}

- (void)dealloc
{
  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (displayLayoutAssertion)
  {
    [(BSInvalidatable *)displayLayoutAssertion invalidate];
    v4 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBFloatingDockRootViewController;
  [(SBFloatingDockRootViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v37.receiver = self;
  v37.super_class = (Class)SBFloatingDockRootViewController;
  [(SBFloatingDockRootViewController *)&v37 viewDidLoad];
  v3 = [(SBFloatingDockRootViewController *)self homeScreenContextProvider];
  v4 = [(SBFloatingDockRootViewController *)self applicationController];
  v32 = [(SBFloatingDockRootViewController *)self iconViewProvider];
  objc_super v5 = +[SBDefaults localDefaults];
  v6 = [v5 floatingDockDefaults];

  uint64_t v7 = [MEMORY[0x1E4FA6238] extendedFloatingDockCapacityIconCount];
  v8 = [SBFloatingDockSuggestionsModel alloc];
  recentsController = self->_recentsController;
  recentsDataStore = self->_recentsDataStore;
  v11 = +[SBDefaults localDefaults];
  v12 = [v11 recentDisplayItemsDefaults];
  v13 = [(SBFloatingDockSuggestionsModel *)v8 initWithMaximumNumberOfSuggestions:v7 homeScreenContextProvider:v3 recentsController:recentsController recentsDataStore:recentsDataStore recentsDefaults:v12 floatingDockDefaults:v6 appSuggestionManager:self->_appSuggestionManager applicationController:v4];

  v14 = [(SBFloatingDockRootViewController *)self requestedSuggestedApplication];
  [(SBFloatingDockSuggestionsModel *)v13 setRequestedSuggestedApplication:v14];

  [(SBFloatingDockRootViewController *)self setSuggestionsModel:v13];
  v15 = [SBFloatingDockSuggestionsViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
  id v17 = [(SBFloatingDockSuggestionsViewController *)v15 initWithNumberOfRecents:v7 homeScreenContextProvider:v3 applicationController:v4 layoutStateTransitionCoordinator:WeakRetained suggestionsModel:v13 iconViewProvider:v32];

  id v18 = objc_alloc(MEMORY[0x1E4FA61A8]);
  id v19 = [v3 iconManager];
  v20 = (void *)[v18 initWithIconManager:v19 iconViewProvider:v32];

  [v20 setDelegate:self];
  [v20 setSuggestionsViewController:v17];
  v21 = [(SBFloatingDockRootViewController *)self legibilitySettings];
  [v20 setLegibilitySettings:v21];

  if (SBFEffectiveHomeButtonType() == 2)
  {
    v22 = [MEMORY[0x1E4F743B8] sharedInstance];
    [v22 height];
    double v24 = v23;
    [v22 edgeSpacing];
    [v20 setRequestedVerticalMargin:v24 + v25 * 2.0];
  }
  [(SBFloatingDockRootViewController *)self bs_addChildViewController:v20];
  [(SBFloatingDockRootViewController *)self setFloatingDockViewController:v20];
  -[SBFloatingDockRootViewController setLibraryPodIconEnabled:](self, "setLibraryPodIconEnabled:", [v6 appLibraryEnabled]);
  objc_initWeak(&location, self);
  id v26 = [NSString stringWithUTF8String:"appLibraryEnabled"];
  uint64_t v27 = MEMORY[0x1E4F14428];
  id v28 = MEMORY[0x1E4F14428];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __47__SBFloatingDockRootViewController_viewDidLoad__block_invoke;
  v33[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v35, &location);
  id v29 = v6;
  id v34 = v29;
  id v30 = (id)[v29 observeDefault:v26 onQueue:v27 withBlock:v33];

  v31 = (void *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel__handlePanGestureRecognizer_];
  [v31 setDelegate:self];
  [v20 _addDockGestureRecognizer:v31];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __47__SBFloatingDockRootViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setLibraryPodIconEnabled:", objc_msgSend(*(id *)(a1 + 32), "appLibraryEnabled"));
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SBFloatingDockRootViewController;
  [(SBFloatingDockRootViewController *)&v6 viewDidLayoutSubviews];
  v3 = [(SBFloatingDockRootViewController *)self view];
  v4 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  objc_super v5 = [v4 view];

  [v3 bounds];
  objc_msgSend(v5, "setBounds:");
  [v3 center];
  objc_msgSend(v5, "setCenter:");
  [(SBFloatingDockRootViewController *)self _layoutFloatingDockPresentationProgress:self->_presentedProgress];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFloatingDockRootViewController;
  [(SBFloatingDockRootViewController *)&v5 viewDidAppear:a3];
  if (!self->_hasInitializedDockVisibility)
  {
    self->_hasInitializedDockVisibility = 1;
    if ([(SBFloatingDockRootViewController *)self isFloatingDockFullyPresented])
    {
      v4 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
      [v4 dockViewWillBecomeVisible];
      [v4 dockViewDidBecomeVisible];
    }
  }
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3) {
    a3->var6 = 0;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_super v5 = WeakRetained;
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      *(unsigned char *)&self->_delegateRespondsTo &= ~1u;
    }
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj) {
      *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
    }
  }
}

- (BOOL)isFloatingDockPresented
{
  return self->_presentedProgress > 0.0;
}

- (BOOL)isFloatingDockFullyPresented
{
  return self->_presentedProgress >= 1.0;
}

- (BOOL)isLibraryPodIconEnabled
{
  v2 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  char v3 = [v2 isLibraryPodIconEnabled];

  return v3;
}

- (void)setLibraryPodIconEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  [v4 setLibraryPodIconEnabled:v3];
}

- (double)maximumFloatingDockHeight
{
  v2 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  [v2 maximumContentHeight];
  double v4 = v3;

  return v4;
}

- (double)maximumDockContinuousCornerRadius
{
  v2 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  [v2 maximumDockContinuousCornerRadius];
  double v4 = v3;

  return v4;
}

- (double)floatingDockHeight
{
  v2 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  [v2 contentHeight];
  double v4 = v3;

  return v4;
}

- (double)floatingDockHeightForFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  objc_msgSend(v7, "contentHeightForFrame:", x, y, width, height);
  double v9 = v8;

  return v9;
}

- (double)effectiveFloatingDockHeight
{
  if (![(SBFloatingDockRootViewController *)self isFloatingDockPresented]) {
    return 0.0;
  }
  [(SBFloatingDockRootViewController *)self floatingDockHeight];
  return result;
}

- (double)preferredVerticalMargin
{
  v2 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  [v2 preferredVerticalMargin];
  double v4 = v3;

  return v4;
}

- (double)floatingDockViewTopMargin
{
  double v3 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  double v4 = [(SBFloatingDockRootViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "minimumVerticalMarginForFrame:");
  double v6 = v5;

  return v6;
}

- (double)translationFromFullyPresentedFrame
{
  v2 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  [v2 translationFromFullyPresentedFrame];
  double v4 = v3;

  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  double v3 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  legibilitySettings = [v3 legibilitySettings];
  double v5 = legibilitySettings;
  if (!legibilitySettings) {
    legibilitySettings = self->_legibilitySettings;
  }
  double v6 = legibilitySettings;

  return v6;
}

- (void)setLegibilitySettings:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_legibilitySettings] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    double v5 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
    [v5 setLegibilitySettings:v6];
  }
}

- (BOOL)isPresentingFolder
{
  v2 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  char v3 = [v2 isPresentingFolder];

  return v3;
}

- (SBFolderController)presentedFolderController
{
  v2 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  char v3 = [v2 presentedFolderController];

  return (SBFolderController *)v3;
}

- (void)layoutUserControlledIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  [v6 layoutUserControlledIconListsWithAnimationType:a3 forceRelayout:v4];
}

- (double)presentedProgress
{
  return self->_presentedProgress;
}

- (SBIconListView)userIconListView
{
  v2 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  char v3 = [v2 userIconListView];

  return (SBIconListView *)v3;
}

- (SBIconListView)suggestionsIconListView
{
  v2 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  char v3 = [v2 recentIconListView];

  return (SBIconListView *)v3;
}

- (void)setRequestedSuggestedApplication:(id)a3
{
  id v6 = (SBApplication *)a3;
  if (self->_requestedSuggestedApplication != v6)
  {
    objc_storeStrong((id *)&self->_requestedSuggestedApplication, a3);
    double v5 = [(SBFloatingDockRootViewController *)self suggestionsModel];
    [v5 setRequestedSuggestedApplication:v6];
  }
}

- (CGRect)floatingDockScreenFrame
{
  v2 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  [v2 floatingDockScreenFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)floatingDockScreenPresentationFrame
{
  v2 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  [v2 floatingDockScreenPresentationFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setPresentationProgressInteractively:(double)a3 withCompletion:(id)a4
{
}

- (void)setPresentationProgress:(double)a3 interactive:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__SBFloatingDockRootViewController_setPresentationProgress_interactive_withCompletion___block_invoke;
  v10[3] = &unk_1E6AF5A50;
  id v11 = v8;
  id v9 = v8;
  [(SBFloatingDockRootViewController *)self _setPresentedProgress:1 animated:v5 interactive:v10 completion:a3];
}

uint64_t __87__SBFloatingDockRootViewController_setPresentationProgress_interactive_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setPresentationProgress:(double)a3 animated:(BOOL)a4 interactive:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__SBFloatingDockRootViewController_setPresentationProgress_animated_interactive_withCompletion___block_invoke;
  v12[3] = &unk_1E6AF5A50;
  id v13 = v10;
  id v11 = v10;
  [(SBFloatingDockRootViewController *)self _setPresentedProgress:v7 animated:v6 interactive:v12 completion:a3];
}

uint64_t __96__SBFloatingDockRootViewController_setPresentationProgress_animated_interactive_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setPresentationProgressInteractively:(double)a3
{
}

- (void)setPresentationProgress:(double)a3 interactive:(BOOL)a4
{
}

- (void)setPresentationProgress:(double)a3 animated:(BOOL)a4 interactive:(BOOL)a5
{
}

- (void)presentFolderForIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  [v13 presentFolderForIcon:v12 location:v11 animated:v6 completion:v10];
}

- (void)dismissPresentedFolderAnimated:(BOOL)a3 withTransitionContext:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  [(SBFloatingDockRootViewController *)self setCurrentTransitionContext:a4];
  id v9 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __100__SBFloatingDockRootViewController_dismissPresentedFolderAnimated_withTransitionContext_completion___block_invoke;
  v11[3] = &unk_1E6AF5AA0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 dismissPresentedFolderAnimated:v6 completion:v11];
}

uint64_t __100__SBFloatingDockRootViewController_dismissPresentedFolderAnimated_withTransitionContext_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentTransitionContext:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)dismissPresentedLibraryAnimated:(BOOL)a3 withTransitionContext:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  if ([v10 isPresentingLibrary])
  {
    [(SBFloatingDockRootViewController *)self setCurrentTransitionContext:v8];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __101__SBFloatingDockRootViewController_dismissPresentedLibraryAnimated_withTransitionContext_completion___block_invoke;
    v11[3] = &unk_1E6AF5AA0;
    v11[4] = self;
    id v12 = v9;
    [v10 dismissLibraryAnimated:v6 completion:v11];
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
}

uint64_t __101__SBFloatingDockRootViewController_dismissPresentedLibraryAnimated_withTransitionContext_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentTransitionContext:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  char v6 = [v5 isDisplayingIcon:v4];

  return v6;
}

- (void)prepareForTransitionToEnvironmentMode:(int64_t)a3 fromDockVisible:(BOOL)a4 toDockVisible:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [(SBFloatingDockRootViewController *)self setUseDismissHitTestPadding:a3 == 3];
  id v9 = [(SBFloatingDockRootViewController *)self view];
  [v9 setNeedsLayout];

  id v12 = [MEMORY[0x1E4FA6260] configurationWithEnvironmentMode:a3];
  id v10 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  BOOL v11 = (unint64_t)(a3 - 4) < 0xFFFFFFFFFFFFFFFELL;
  [v10 setWantsFastIconReordering:v11];
  [v10 setShouldIndicateImpossibleDrop:v11];
  [v10 prepareForTransitionToStyleConfiguration:v12 fromDockVisible:v6 toDockVisible:v5];
}

- (void)cleanupAfterTransitionToEnvironmentMode:(int64_t)a3
{
  id v3 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  [v3 cleanUpAfterUnderlyingBackgroundStyleTransition];
}

- (void)_setDisplayLayoutElementActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(SBFloatingDockRootViewController *)self view];
  BOOL v5 = [v6 window];
  [v5 level];
  -[SBFloatingDockRootViewController _setDisplayLayoutElementActive:windowLevel:](self, "_setDisplayLayoutElementActive:windowLevel:", v3);
}

- (void)_setDisplayLayoutElementActive:(BOOL)a3 windowLevel:(double)a4
{
  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (a3)
  {
    if (displayLayoutAssertion) {
      return;
    }
    id v7 = objc_alloc(MEMORY[0x1E4FA6A68]);
    v15 = (void *)[v7 initWithIdentifier:*MEMORY[0x1E4FA6F38]];
    [v15 setLevel:(uint64_t)a4];
    [v15 setLayoutRole:4];
    id v8 = [(SBFloatingDockRootViewController *)self view];
    id v9 = [v8 window];
    [(SBFloatingDockRootViewController *)self _calculateStandardDockFrame];
    objc_msgSend(v8, "convertRect:toView:", 0);
    objc_msgSend(v9, "_convertRectToSceneReferenceSpace:");
    objc_msgSend(v15, "setReferenceFrame:");
    id v10 = [(UIViewController *)self _sbWindowScene];
    BOOL v11 = [v10 displayLayoutPublisher];
    id v12 = [v11 addElement:v15];
    id v13 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = v12;

    double v14 = (BSInvalidatable *)v15;
  }
  else
  {
    if (!displayLayoutAssertion) {
      return;
    }
    [(BSInvalidatable *)displayLayoutAssertion invalidate];
    double v14 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;
  }
}

- (void)updateDisplayLayoutElementWindowLevel:(double)a3
{
  BOOL v5 = [(SBFloatingDockRootViewController *)self displayLayoutAssertion];

  if (v5)
  {
    id v6 = [(UIViewController *)self _sbWindowScene];
    id v7 = [v6 displayLayoutPublisher];
    id v8 = [v7 transitionAssertionWithReason:0];

    [(SBFloatingDockRootViewController *)self _setDisplayLayoutElementActive:0 windowLevel:a3];
    [(SBFloatingDockRootViewController *)self _setDisplayLayoutElementActive:1 windowLevel:a3];
    [v8 invalidate];
  }
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  id v9 = [v8 iconViewForIcon:v7 location:v6];

  return v9;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  id v9 = [v8 firstIconViewForIcon:v7 inLocations:v6];

  return v9;
}

- (id)firstIconViewForIcon:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  id v6 = [v5 firstIconViewForIcon:v4];

  return v6;
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  id v9 = [v8 firstIconViewForIcon:v7 excludingLocations:v6];

  return v9;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  char v9 = [v8 isDisplayingIcon:v7 inLocation:v6];

  return v9;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[SBFloatingDockRootViewController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v6, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  char v6 = [v5 isDisplayingIconView:v4];

  return v6;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  char v9 = [v8 isDisplayingIconView:v7 inLocation:v6];

  return v9;
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  [v5 enumerateDisplayedIconViewsUsingBlock:v4];
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  [v8 enumerateDisplayedIconViewsForIcon:v7 usingBlock:v6];
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  char v6 = [v5 isPresentingIconLocation:v4];

  return v6;
}

- (NSSet)presentedIconLocations
{
  v2 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  BOOL v3 = [v2 presentedIconLocations];

  return (NSSet *)v3;
}

- (void)_layoutFloatingDockPresentationProgress:(double)a3
{
  if ([(SBFloatingDockRootViewController *)self useDismissHitTestPadding])
  {
    id v5 = +[SBMedusaDomain rootSettings];
    [v5 dismissHitTestTopPadding];
  }
  UIEdgeInsetsMakeWithEdges();
  -[SBFloatingDockViewController _setPaddingEdgeInsets:](self->_floatingDockViewController, "_setPaddingEdgeInsets:");
  [(SBFloatingDockViewController *)self->_floatingDockViewController setDockOffscreenProgress:1.0 - a3];
  id v6 = [(SBFloatingDockRootViewController *)self delegate];
  [(SBFloatingDockRootViewController *)self floatingDockScreenFrame];
  objc_msgSend(v6, "floatingDockRootViewController:didChangeToFrame:", self);
}

- (void)_setPresentedProgress:(double)a3 animated:(BOOL)a4 interactive:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  uint64_t v10 = (void (**)(id, uint64_t))a6;
  if (BSFloatEqualToFloat()) {
    goto LABEL_32;
  }
  int v11 = BSFloatGreaterThanFloat();
  BOOL v12 = [(SBFloatingDockRootViewController *)self isFloatingDockPresented];
  BOOL v13 = v12;
  if (v11)
  {
    if (!v12)
    {
      [(SBFloatingDockRootViewController *)self loadViewIfNeeded];
      long long v14 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
      [v14 dockViewWillBecomeVisible];

      [(SBFloatingDockRootViewController *)self _beginPresentationTransition];
      [(SBFloatingDockRootViewController *)self _setDisplayLayoutElementActive:1];
    }
    int v15 = !v13;
    if (!BSFloatGreaterThanFloat()) {
      goto LABEL_10;
    }
    long long v16 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
    long long v17 = [v16 _sbWindowScene];
    id v18 = [v17 switcherController];

    uint64_t v19 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
    LODWORD(v17) = [v19 isPresentingFolder];

    if (v17)
    {
      v20 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
      [v20 dismissPresentedFolderAnimated:v7 completion:0];
    }
    else if (v6 {
           && ([(SBFloatingDockRootViewController *)self floatingDockViewController],
    }
               id v34 = objc_claimAutoreleasedReturnValue(),
               int v35 = [v34 isPresentingLibraryInForeground],
               v34,
               v35))
    {
      v20 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
      [v20 dismissLibraryAnimated:v7 completion:0];
    }
    else
    {
      if ([v18 unlockedEnvironmentMode] == 3) {
        goto LABEL_9;
      }
      v20 = [(SBFloatingDockRootViewController *)self homeScreenContextProvider];
      v36 = [v20 iconManager];
      int v37 = [v36 hasOpenFolder];

      if (v37)
      {
        v38 = [v20 iconManager];
        [v38 popExpandedIconAnimated:v7 completionHandler:0];
      }
    }

LABEL_9:
LABEL_10:
    int v21 = 0;
    goto LABEL_14;
  }
  if (v12)
  {
    v22 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
    [v22 dockViewWillResignVisible];

    [(SBFloatingDockRootViewController *)self _beginPresentationTransition];
    [(SBFloatingDockRootViewController *)self _setDisplayLayoutElementActive:0];
    int v15 = 0;
    int v21 = 1;
  }
  else
  {
    int v21 = 0;
    int v15 = 0;
  }
LABEL_14:
  self->_presentedProgress = a3;
  double v23 = fmin(fmax(a3, 0.0), 1.0);
  double v24 = [(SBFloatingDockRootViewController *)self viewIfLoaded];

  if (!v24) {
    goto LABEL_19;
  }
  double v25 = [(SBFloatingDockRootViewController *)self delegate];
  [(SBFloatingDockRootViewController *)self floatingDockHeight];
  double v27 = v26 * a3;
  if (!v7)
  {
    [v25 floatingDockRootViewController:self willChangeToHeight:v6 interactive:v26 * a3];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __90__SBFloatingDockRootViewController__setPresentedProgress_animated_interactive_completion___block_invoke_3;
    v39[3] = &unk_1E6AF4A70;
    v39[4] = self;
    *(double *)&v39[5] = a3;
    [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v39];

LABEL_19:
    if (v10) {
      v10[2](v10, 1);
    }
    if (v15)
    {
      id v29 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
      [v29 dockViewDidBecomeVisible];
    }
    else
    {
      if (!v21 || !BSFloatIsZero()) {
        goto LABEL_32;
      }
      id v29 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
      [v29 dockViewDidResignVisible];
    }

    [(SBFloatingDockRootViewController *)self _endPresentationTransition];
    goto LABEL_32;
  }
  id v28 = +[SBMedusaDomain rootSettings];
  if ([(SBFloatingDockRootViewController *)self isPresentingFolder]) {
    [v28 dockWithPresentedFolderAnimationSettings];
  }
  else {
  id v30 = [v28 dockAnimationSettings];
  }
  ++self->_floatingDockPresentationAnimationCount;
  if (v6) {
    uint64_t v31 = 5;
  }
  else {
    uint64_t v31 = 3;
  }
  v32 = (void *)MEMORY[0x1E4F42FF0];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __90__SBFloatingDockRootViewController__setPresentedProgress_animated_interactive_completion___block_invoke;
  v44[3] = &unk_1E6B08558;
  id v45 = v25;
  v46 = self;
  BOOL v49 = v6;
  double v47 = v27;
  double v48 = a3;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __90__SBFloatingDockRootViewController__setPresentedProgress_animated_interactive_completion___block_invoke_2;
  v40[3] = &unk_1E6B08580;
  v40[4] = self;
  double v42 = a3;
  v41 = v10;
  double v43 = v23;
  id v33 = v25;
  objc_msgSend(v32, "sb_animateWithSettings:mode:animations:completion:", v30, v31, v44, v40);

LABEL_32:
}

uint64_t __90__SBFloatingDockRootViewController__setPresentedProgress_animated_interactive_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) floatingDockRootViewController:*(void *)(a1 + 40) willChangeToHeight:*(unsigned __int8 *)(a1 + 64) interactive:*(double *)(a1 + 48)];
  v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 56);
  return [v2 _layoutFloatingDockPresentationProgress:v3];
}

uint64_t __90__SBFloatingDockRootViewController__setPresentedProgress_animated_interactive_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 1128);
  if (v3 && (*(void *)(v2 + 1128) = v3 - 1, *(void *)(*(void *)(a1 + 32) + 1128))) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = BSFloatEqualToFloat();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  if (v4)
  {
    if (BSFloatIsOne())
    {
      BOOL v6 = [*(id *)(a1 + 32) floatingDockViewController];
      [v6 dockViewDidBecomeVisible];
    }
    else
    {
      if (!BSFloatIsZero())
      {
LABEL_14:
        BOOL v7 = *(void **)(a1 + 32);
        return [v7 _endPresentationTransition];
      }
      BOOL v6 = [*(id *)(a1 + 32) floatingDockViewController];
      [v6 dockViewDidResignVisible];
    }

    goto LABEL_14;
  }
  return result;
}

uint64_t __90__SBFloatingDockRootViewController__setPresentedProgress_animated_interactive_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutFloatingDockPresentationProgress:*(double *)(a1 + 40)];
}

- (void)_beginPresentationTransition
{
  if (![(SBFloatingDockRootViewController *)self isTransitioningPresentation])
  {
    [(SBFloatingDockRootViewController *)self setTransitioningPresentation:1];
    if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleFloatingDock") & 1) == 0)
    {
      uint64_t v3 = [(SBFloatingDockRootViewController *)self view];
      id v6 = [v3 window];

      uint64_t v4 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        [v6 disableInterfaceOrientationChangesForReason:@"floating-dock"];
      }
    }
  }
}

- (void)_endPresentationTransition
{
  if ([(SBFloatingDockRootViewController *)self isTransitioningPresentation])
  {
    [(SBFloatingDockRootViewController *)self setTransitioningPresentation:0];
    if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleFloatingDock") & 1) == 0)
    {
      uint64_t v3 = [(SBFloatingDockRootViewController *)self view];
      uint64_t v4 = [v3 window];

      id v5 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        [v4 enableInterfaceOrientationChangesForReason:@"floating-dock"];
      }
    }
    id v7 = [(SBFloatingDockRootViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 floatingDockRootViewControllerDidEndPresentationTransition:self];
    }
  }
}

- (CGRect)_calculateStandardDockFrame
{
  uint64_t v3 = [(SBFloatingDockRootViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  memset(&slice, 0, sizeof(slice));
  BOOL v12 = [(SBFloatingDockRootViewController *)self floatingDockViewController];
  objc_msgSend(v12, "contentHeightForFrame:", v5, v7, v9, v11);
  CGFloat v14 = ceil(v13);
  v21.origin.double x = v5;
  v21.origin.double y = v7;
  v21.size.double width = v9;
  v21.size.double height = v11;
  CGRectDivide(v21, &slice, &v19, v14, CGRectMaxYEdge);

  double x = slice.origin.x;
  double y = slice.origin.y;
  double width = slice.size.width;
  double height = slice.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_handlePanGestureRecognizer:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_delegateRespondsTo & 1) == 0
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        int v6 = [WeakRetained floatingDockRootViewControllerShouldHandlePanGestureRecognizer:self],
        WeakRetained,
        v6))
  {
    double v7 = [(SBFloatingDockRootViewController *)self view];
    [v4 translationInView:v7];
    [v4 velocityInView:v7];
    double v9 = v8;
    [(SBFloatingDockRootViewController *)self _floatingDockViewTranslation];
    long long v21 = *MEMORY[0x1E4F4F630];
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F4F630] + 16);
    BSUIConstrainValueToIntervalWithRubberBand();
    double v11 = v10;
    BOOL v12 = [(SBFloatingDockRootViewController *)self delegate];
    switch([v4 state])
    {
      case 1:
        analyticsClient = self->_analyticsClient;
        uint64_t v29 = *MEMORY[0x1E4FA74B8];
        v30[0] = &unk_1F334AA90;
        id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
        [(SBFAnalyticsClient *)analyticsClient emitEvent:26 withPayload:v18];

        goto LABEL_6;
      case 2:
LABEL_6:
        [v12 floatingDockRootViewController:self modifyProgress:1 interactive:0 completion:v11];
        break;
      case 3:
        if (v11 >= 0.25 && v9 <= 10.0)
        {
          [v12 floatingDockRootViewController:self modifyProgress:0 interactive:0 completion:1.0];
          double v13 = self->_analyticsClient;
          uint64_t v25 = *MEMORY[0x1E4FA74B8];
          double v26 = &unk_1F334AAC0;
          CGFloat v14 = (void *)MEMORY[0x1E4F1C9E8];
          int v15 = &v26;
          long long v16 = &v25;
        }
        else
        {
          [v12 floatingDockRootViewController:self modifyProgress:0 interactive:0 completion:0.0];
          double v13 = self->_analyticsClient;
          uint64_t v27 = *MEMORY[0x1E4FA74B8];
          id v28 = &unk_1F334AAA8;
          CGFloat v14 = (void *)MEMORY[0x1E4F1C9E8];
          int v15 = &v28;
          long long v16 = &v27;
        }
        goto LABEL_13;
      case 4:
      case 5:
        [v12 floatingDockRootViewController:self modifyProgress:0 interactive:0 completion:1.0];
        double v13 = self->_analyticsClient;
        uint64_t v23 = *MEMORY[0x1E4FA74B8];
        double v24 = &unk_1F334AAC0;
        CGFloat v14 = (void *)MEMORY[0x1E4F1C9E8];
        int v15 = &v24;
        long long v16 = &v23;
LABEL_13:
        v20 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
        [(SBFAnalyticsClient *)v13 emitEvent:26 withPayload:v20];

        break;
      default:
        break;
    }
  }
}

- (double)_floatingDockViewTranslationForHeight:(double)a3
{
  [(SBFloatingDockRootViewController *)self floatingDockViewTopMargin];
  return v4 + a3;
}

- (double)_floatingDockViewTranslation
{
  [(SBFloatingDockRootViewController *)self floatingDockHeight];
  -[SBFloatingDockRootViewController _floatingDockViewTranslationForHeight:](self, "_floatingDockViewTranslationForHeight:");
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 1) == 0) {
    return 1;
  }
  double v4 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v4) = [WeakRetained floatingDockRootViewControllerShouldHandlePanGestureRecognizer:v4];

  return (char)v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)floatingDockViewController:(id)a3 wantsToBePresented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SBFloatingDockRootViewController *)self delegate];
  [v6 floatingDockRootViewController:self floatingDockWantsToBePresented:v4];
}

- (void)floatingDockViewController:(id)a3 didChangeContentHeight:(double)a4
{
  if ([(SBFloatingDockRootViewController *)self isFloatingDockPresented])
  {
    id v6 = [(SBFloatingDockRootViewController *)self delegate];
    [v6 floatingDockRootViewController:self willChangeToHeight:0 interactive:a4];
  }
}

- (void)floatingDockViewController:(id)a3 didChangeContentFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = [(SBFloatingDockRootViewController *)self delegate];
  objc_msgSend(v9, "floatingDockRootViewController:didChangeToFrame:", self, x, y, width, height);
}

- (void)floatingDockViewController:(id)a3 willPerformTransitionWithFolder:(id)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6
{
  BOOL v7 = a5;
  id v11 = a4;
  id v9 = a6;
  double v10 = [(SBFloatingDockRootViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 floatingDockRootViewController:self willPerformTransitionWithFolder:v11 presenting:v7 withTransitionCoordinator:v9];
  }
}

- (void)floatingDockViewController:(id)a3 willUseAnimator:(id)a4 forTransitioningWithFolder:(id)a5 presenting:(BOOL)a6
{
  id v15 = a4;
  id v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  double v8 = v15;
  if (isKindOfClass)
  {
    id v9 = [v15 iconAnimator];
    double v10 = self;
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      id v12 = v9;
      double v13 = +[SBMedusaDomain rootSettings];
      CGFloat v14 = [v13 dockWithPresentedFolderAnimationSettings];
      [v12 setDockAnimationSettings:v14];
    }
    double v8 = v15;
  }
}

- (double)minimumHomeScreenScaleForFloatingDockViewController:(id)a3
{
  BOOL v4 = [(SBFloatingDockRootViewController *)self delegate];
  double v5 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v4 minimumHomeScreenScaleForFloatingDockRootViewController:self];
    double v5 = v6;
  }

  return v5;
}

- (BOOL)isFloatingDockViewControllerPresentedOverTransitioningAppToAppContent:(id)a3
{
  uint64_t v3 = [(SBFloatingDockRootViewController *)self currentTransitionContext];
  BOOL v4 = [v3 previousLayoutState];
  uint64_t v5 = [v4 unlockedEnvironmentMode];
  double v6 = [v3 layoutState];
  uint64_t v7 = [v6 unlockedEnvironmentMode];
  unsigned int v8 = (v7 == 3) & ~[v6 isEqual:v4];
  if (v5 == 3) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isFloatingDockViewControllerPresentedOverApplication:(id)a3
{
  uint64_t v3 = [a3 _sbWindowScene];
  BOOL v4 = [v3 switcherController];

  LOBYTE(v3) = [v4 unlockedEnvironmentMode] == 3;
  return (char)v3;
}

- (BOOL)isFloatingDockViewControllerPresentedOverTransitioningSwitcherContent:(id)a3
{
  uint64_t v3 = [(SBFloatingDockRootViewController *)self currentTransitionContext];
  BOOL v4 = [v3 previousLayoutState];
  uint64_t v5 = [v4 unlockedEnvironmentMode];
  double v6 = [v3 layoutState];
  uint64_t v7 = [v6 unlockedEnvironmentMode];
  BOOL v8 = v5 == 2 && v7 == 2 || v5 == 2 && v7 == 3;

  return v8;
}

- (BOOL)isFloatingDockViewControllerPresentedOnExternalDisplay:(id)a3
{
  uint64_t v3 = [a3 _sbWindowScene];
  BOOL v4 = [v3 delegate];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8 != 0;
}

- (id)libraryContainerViewControllerForFloatingDockViewController:(id)a3
{
  BOOL v4 = [(SBFloatingDockRootViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 libraryContainerViewControllerForFloatingDockRootViewController:self];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isDefaultLibraryContainerViewControllerForegroundForFloatingDockViewController:(id)a3
{
  BOOL v4 = [(SBFloatingDockRootViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 isDefaultLibraryContainerViewControllerForegroundForFloatingDockRootViewController:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)foregroundLibraryContainerViewControllerForFloatingDockViewController:(id)a3
{
  BOOL v4 = [(SBFloatingDockRootViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v5 = [v4 foregroundLibraryContainerViewControllerForFloatingDockRootViewController:self];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)floatingDockViewController:(id)a3 acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFloatingDockRootViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 floatingDockRootViewController:self acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (SBFloatingDockSuggestionsModel)suggestionsModel
{
  return self->_suggestionsModel;
}

- (void)setSuggestionsModel:(id)a3
{
}

- (SBFloatingDockRootViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFloatingDockRootViewControllerDelegate *)WeakRetained;
}

- (SBApplication)requestedSuggestedApplication
{
  return self->_requestedSuggestedApplication;
}

- (BOOL)isTransitioningPresentation
{
  return self->_transitioningPresentation;
}

- (void)setTransitioningPresentation:(BOOL)a3
{
  self->_transitioningPresentation = a3;
}

- (SBFloatingDockViewController)floatingDockViewController
{
  return self->_floatingDockViewController;
}

- (void)setFloatingDockViewController:(id)a3
{
}

- (SBFloatingDockHomeScreenContextProviding)homeScreenContextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeScreenContextProvider);
  return (SBFloatingDockHomeScreenContextProviding *)WeakRetained;
}

- (SBApplicationController)applicationController
{
  return self->_applicationController;
}

- (SBAppSuggestionManager)appSuggestionManager
{
  return self->_appSuggestionManager;
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
  return (SBLayoutStateTransitionCoordinator *)WeakRetained;
}

- (void)setLayoutStateTransitionCoordinator:(id)a3
{
}

- (SBRecentDisplayItemsController)recentsController
{
  return self->_recentsController;
}

- (void)setRecentsController:(id)a3
{
}

- (SBRecentDisplayItemsDataStore)recentsDataStore
{
  return self->_recentsDataStore;
}

- (void)setRecentsDataStore:(id)a3
{
}

- (BOOL)useDismissHitTestPadding
{
  return self->_useDismissHitTestPadding;
}

- (void)setUseDismissHitTestPadding:(BOOL)a3
{
  self->_useDismissHitTestPadding = a3;
}

- (SBFAnalyticsClient)analyticsClient
{
  return self->_analyticsClient;
}

- (void)setAnalyticsClient:(id)a3
{
}

- (SBWorkspaceApplicationSceneTransitionContext)currentTransitionContext
{
  return self->_currentTransitionContext;
}

- (void)setCurrentTransitionContext:(id)a3
{
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (BSInvalidatable)displayLayoutAssertion
{
  return self->_displayLayoutAssertion;
}

- (void)setDisplayLayoutAssertion:(id)a3
{
}

- (unint64_t)floatingDockPresentationAnimationCount
{
  return self->_floatingDockPresentationAnimationCount;
}

- (void)setFloatingDockPresentationAnimationCount:(unint64_t)a3
{
  self->_floatingDockPresentationAnimationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLayoutAssertion, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_currentTransitionContext, 0);
  objc_storeStrong((id *)&self->_analyticsClient, 0);
  objc_storeStrong((id *)&self->_recentsDataStore, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
  objc_destroyWeak((id *)&self->_layoutStateTransitionCoordinator);
  objc_storeStrong((id *)&self->_appSuggestionManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_destroyWeak((id *)&self->_homeScreenContextProvider);
  objc_storeStrong((id *)&self->_floatingDockViewController, 0);
  objc_storeStrong((id *)&self->_requestedSuggestedApplication, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestionsModel, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end