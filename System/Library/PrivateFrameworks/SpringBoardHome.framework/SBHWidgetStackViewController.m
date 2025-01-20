@interface SBHWidgetStackViewController
+ (BOOL)_shouldDrawSystemBackgroundMaterialForWidget:(id)a3 widgetViewController:(id)a4;
- (BOOL)_alwaysShowStackBorder;
- (BOOL)_alwaysShowStackPageControl;
- (BOOL)_canShowWhileLocked;
- (BOOL)_containerRequiresClippingToBoundsForWidget:(id)a3;
- (BOOL)_createViewControllerForWidgetIfNecessary:(id)a3 usingIconImageInfo:(SBIconImageInfo *)a4;
- (BOOL)_insetWidgetsForTrackingAppearance;
- (BOOL)_isContentViewExtendingOutsideBounds;
- (BOOL)_isScrollViewTracking;
- (BOOL)_pageControlIsHorizontallyConstrained;
- (BOOL)_scrollToActiveWidgetAnimated:(BOOL)a3;
- (BOOL)_shouldDrawSystemBackgroundMaterialForWidget:(id)a3;
- (BOOL)_shouldHideWidgetWithUniqueIdentifier:(id)a3;
- (BOOL)_showAdjacentWidgets;
- (BOOL)alwaysShowsAsStack;
- (BOOL)automaticallyUpdatesVisiblySettled;
- (BOOL)clipsWidgetsToViewBounds;
- (BOOL)flashPageControlOnNextAlphaChange;
- (BOOL)flashPageControlOnNextAppearance;
- (BOOL)forcesEdgeAntialiasing;
- (BOOL)forcesVisible;
- (BOOL)highlightsAtAnySize;
- (BOOL)isEditing;
- (BOOL)isOverlapping;
- (BOOL)isShowingContextMenu;
- (BOOL)isUserInteractionEnabled;
- (BOOL)isWidgetHitTestingDisabled;
- (BOOL)sbh_isWidgetStackViewController;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)showStackBorderWhenShowingPageControl;
- (BOOL)showsSnapshotWhenDeactivated;
- (BOOL)showsSquareCorners;
- (BOOL)wantsCaptureOnlyBackgroundView;
- (BSInvalidatable)imageUpdatesDisabledForContextMenuAssertion;
- (BSInvalidatable)scrollingTouchCancellationAssertion;
- (BSUIScrollView)scrollView;
- (CGPoint)_restingContentOffset;
- (CGRect)visibleBounds;
- (CGSize)_scrollViewContentSize;
- (NSArray)applicationShortcutItems;
- (NSArray)widgetViewControllers;
- (NSHashTable)imageUpdateDisableAssertions;
- (NSMutableDictionary)widgetContainerViewControllersForLayoutOptions;
- (NSMutableDictionary)widgetContainerViewControllersToRemove;
- (NSTimer)pageControlHidingTimer;
- (SBFFluidBehaviorSettings)animationSettings;
- (SBHIconImageAppearance)overrideIconImageAppearance;
- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration;
- (SBHWidgetSettings)widgetSettings;
- (SBHWidgetStackViewController)init;
- (SBHWidgetStackViewController)initWithIcon:(id)a3 iconListLayoutProvider:(id)a4;
- (SBHWidgetStackViewControllerDataSource)dataSource;
- (SBHWidgetStackViewControllerDelegate)delegate;
- (SBIconApproximateLayoutPosition)approximateLayoutPosition;
- (SBIconImageInfo)iconImageInfo;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconViewCustomImageViewHosting)host;
- (SBLeafIconDataSource)activeWidget;
- (SBLeafIconDataSource)visiblyActiveDataSource;
- (SBWidgetIcon)widgetIcon;
- (UIColor)backgroundTintingColor;
- (UIEdgeInsets)minimumPreferredEdgeInsetsForContextMenu;
- (UIPageControl)pageControl;
- (UIView)backgroundView;
- (UIView)containerView;
- (UIView)dimmingView;
- (UIView)snapshotView;
- (UIView)springLoadingEffectTargetView;
- (UIViewController)currentWidgetViewController;
- (_UILegibilitySettings)legibilitySettings;
- (double)brightness;
- (double)continuousCornerRadius;
- (id)_backgroundColorForWidgetWithDistanceFromRestingContentOffset:(double)a3;
- (id)_createBackgroundView;
- (id)_disableImageUpdatesForReason:(id)a3 animateChangesUponInvalidation:(BOOL)a4;
- (id)_effectiveWidgetContainerViewControllers;
- (id)_widgetContainerViewControllersForListLayoutProvider:(id)a3;
- (id)_widgetContextMenuController;
- (id)_widgetWithUniqueIdentifier:(id)a3;
- (id)backgroundViewConfigurator;
- (id)backgroundViewProvider;
- (id)cancelTouchesForCurrentEventInHostedContent;
- (id)disableImageUpdatesForReason:(id)a3;
- (id)effectiveIconImageAppearance;
- (id)sbh_underlyingAvocadoHostViewControllers;
- (id)sourceBackgroundView:(id)a3;
- (id)sourceView;
- (int64_t)_newActiveWidgetIndexForContentOffset:(CGPoint)a3;
- (int64_t)preferredDirection;
- (unint64_t)backgroundAnimationCount;
- (unint64_t)imageViewAlignment;
- (unint64_t)pauseReasons;
- (unint64_t)presentationMode;
- (unint64_t)userVisibilityStatus;
- (unint64_t)widgetScaleAnimationCount;
- (unint64_t)widgetSnapshotAnimationCount;
- (void)_configureBackgroundViewIfNecessary;
- (void)_configureBackgroundViewIfNecessary:(id)a3;
- (void)_createBackgroundViewIfNecessary:(BOOL)a3;
- (void)_decrementBackgroundAnimationCount;
- (void)_decrementWidgetScaleAnimationCount;
- (void)_decrementWidgetSnapshotAnimationCount;
- (void)_flashPageControlAnimated:(BOOL)a3;
- (void)_handleInstalledAppsChanged:(id)a3;
- (void)_incrementBackgroundAnimationCount;
- (void)_incrementWidgetScaleAnimationCount;
- (void)_incrementWidgetSnapshotAnimationCount;
- (void)_layoutWithAnimationUpdateMode:(int64_t)a3;
- (void)_logAllViewControllers;
- (void)_removeWidget:(id)a3 animated:(BOOL)a4;
- (void)_removeWidget:(id)a3 widgetContainerViewControllers:(id)a4 animated:(BOOL)a5;
- (void)_removeWidgetContainerViewControllers:(id)a3 animated:(BOOL)a4;
- (void)_removeWidgetWithUniqueIdentifier:(id)a3 widgetContainerViewControllers:(id)a4 animated:(BOOL)a5;
- (void)_requireLayoutUponActivationForWidgetContainerViewController:(id)a3;
- (void)_restartPageControlTimer;
- (void)_restartPageControlTimerWithTimeInterval:(double)a3;
- (void)_setPageControlHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_setupStateCapture;
- (void)_teardownBackgroundView:(id)a3 contactDelegate:(BOOL)a4;
- (void)_teardownStateCapture;
- (void)_updateAccessibilityValue;
- (void)_updateActiveWidgetIndexAndScrollViewContentOffset;
- (void)_updateApproximateLayoutPositionForWidgetViewControllers;
- (void)_updateBackgroundViewWithAnimationUpdateMode:(int64_t)a3;
- (void)_updateBackgroundViewWithAnimationUpdateMode:(int64_t)a3 allowingOutsetting:(BOOL)a4;
- (void)_updatePageControlWithAnimationUpdateMode:(int64_t)a3;
- (void)_updatePauseReasonForWidgetViewControllers;
- (void)_updatePresentationModeForWidgetViewControllers;
- (void)_updateScrollViewDelaysContentTouches;
- (void)_updateShowsSnapshotWhenDeactivatedForWidgetViewControllers;
- (void)_updateVisiblySettledForWidgetViewControllers;
- (void)_updateWidgetViewClippingAndBackgroundView;
- (void)_updateWidgetViewEdgeAntialiasing;
- (void)_updateWidgetViewHitTesting;
- (void)_updateWidgetViewStyleConfiguration;
- (void)_updateWidgetViewsWithAnimationUpdateMode:(int64_t)a3;
- (void)addCustomImageViewControllerObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)customImageViewControllerWantsLabelHiddenDidChange:(id)a3;
- (void)dealloc;
- (void)didSelectApplicationShortcutItem:(id)a3;
- (void)discardAllWidgetViewControllers;
- (void)enumerateWidgetContainerViewControllersForListLayoutProviderUsingBlock:(id)a3;
- (void)enumerateWidgetViewControllersUsingBlock:(id)a3;
- (void)evaluateBackground;
- (void)flashPageControlAnimated:(BOOL)a3 withTimeInterval:(double)a4;
- (void)leafIcon:(id)a3 didAddIconDataSource:(id)a4;
- (void)leafIcon:(id)a3 didChangeActiveDataSource:(id)a4;
- (void)leafIcon:(id)a3 didRemoveIconDataSource:(id)a4;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReuse;
- (void)removeCustomImageViewControllerObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resizeSnapshotsForWidgetContainerViewControllers:(id)a3 isFakeWidget:(BOOL)a4 reason:(id)a5;
- (void)scrollViewDidEndScrolling:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginScrolling:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActiveWidget:(id)a3;
- (void)setAlwaysShowsAsStack:(BOOL)a3;
- (void)setAnimationSettings:(id)a3;
- (void)setApproximateLayoutPosition:(SBIconApproximateLayoutPosition)a3;
- (void)setAutomaticallyUpdatesVisiblySettled:(BOOL)a3;
- (void)setBackgroundAnimationCount:(unint64_t)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBackgroundViewConfigurator:(id)a3;
- (void)setBackgroundViewProvider:(id)a3;
- (void)setBrightness:(double)a3;
- (void)setClipsWidgetsToViewBounds:(BOOL)a3;
- (void)setContainerView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFlashPageControlOnNextAlphaChange:(BOOL)a3;
- (void)setFlashPageControlOnNextAppearance:(BOOL)a3;
- (void)setForcesEdgeAntialiasing:(BOOL)a3;
- (void)setForcesVisible:(BOOL)a3;
- (void)setHighlightsAtAnySize:(BOOL)a3;
- (void)setHost:(id)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setImageUpdateDisableAssertions:(id)a3;
- (void)setImageUpdatesDisabledForContextMenuAssertion:(id)a3;
- (void)setImageViewAlignment:(unint64_t)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setOverlapping:(BOOL)a3;
- (void)setOverrideIconImageAppearance:(id)a3;
- (void)setOverrideIconImageStyleConfiguration:(id)a3;
- (void)setPageControl:(id)a3;
- (void)setPageControlHidingTimer:(id)a3;
- (void)setPauseReasons:(unint64_t)a3;
- (void)setPreferredDirection:(int64_t)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollingTouchCancellationAssertion:(id)a3;
- (void)setShowStackBorderWhenShowingPageControl:(BOOL)a3;
- (void)setShowingContextMenu:(BOOL)a3;
- (void)setShowsSnapshotWhenDeactivated:(BOOL)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setUserVisibilityStatus:(unint64_t)a3;
- (void)setWidgetContainerViewControllersForLayoutOptions:(id)a3;
- (void)setWidgetContainerViewControllersToRemove:(id)a3;
- (void)setWidgetIcon:(id)a3;
- (void)setWidgetScaleAnimationCount:(unint64_t)a3;
- (void)setWidgetSettings:(id)a3;
- (void)setWidgetSnapshotAnimationCount:(unint64_t)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateImageAnimated:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)widgetContainerViewControllerContentViewControllerDidActivate:(id)a3;
- (void)widgetContainerViewControllerContentViewControllerDidUpdateStyleConfiguration:(id)a3;
- (void)widgetContainerViewControllerInitialWidgetContentReadinessChanged:(id)a3 widgetContentIsReady:(BOOL)a4;
- (void)willShowContextMenuAtLocation:(CGPoint)a3;
@end

@implementation SBHWidgetStackViewController

- (BOOL)sbh_isWidgetStackViewController
{
  return 1;
}

- (id)sbh_underlyingAvocadoHostViewControllers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(SBHWidgetStackViewController *)self widgetViewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "sbh_underlyingAvocadoHostViewControllers");
        v10 = [v9 allObjects];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (SBHWidgetStackViewController)initWithIcon:(id)a3 iconListLayoutProvider:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SBHWidgetStackViewController;
  v9 = [(SBHWidgetStackViewController *)&v23 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_icon, a3);
    [v7 addObserver:v10];
    v11 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v12 = [v11 widgetSettings];
    widgetSettings = v10->_widgetSettings;
    v10->_widgetSettings = (SBHWidgetSettings *)v12;

    [(PTSettings *)v10->_widgetSettings addKeyObserver:v10];
    v10->_userInteractionEnabled = 1;
    v10->_showStackBorderWhenShowingPageControl = 0;
    v10->_flashPageControlOnNextAppearance = [(SBHWidgetSettings *)v10->_widgetSettings stackFlashesPageControlOnAppearance];
    v10->_clipsWidgetsToViewBounds = 1;
    v10->_preferredDirection = 0;
    uint64_t v14 = [v7 activeDataSource];
    activeWidget = v10->_activeWidget;
    v10->_activeWidget = (SBLeafIconDataSource *)v14;

    objc_storeStrong((id *)&v10->_listLayoutProvider, a4);
    v10->_imageViewAlignment = 0;
    v10->_presentationMode = 0;
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
    animationSettings = v10->_animationSettings;
    v10->_animationSettings = (SBFFluidBehaviorSettings *)v16;

    [(SBFFluidBehaviorSettings *)v10->_animationSettings setDampingRatio:1.0];
    [(SBFFluidBehaviorSettings *)v10->_animationSettings setResponse:0.35];
    v10->_automaticallyUpdatesVisiblySettled = 1;
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v10 selector:sel__handleInstalledAppsChanged_ name:@"SBInstalledApplicationsDidChangeNotification" object:0];

    [(SBHWidgetStackViewController *)v10 _setupStateCapture];
    v19 = self;
    v24[0] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    id v21 = (id)[(SBHWidgetStackViewController *)v10 registerForTraitChanges:v20 withAction:sel__updateWidgetViewEdgeAntialiasing];
  }
  return v10;
}

- (SBHWidgetStackViewController)init
{
  return [(SBHWidgetStackViewController *)self initWithIcon:0 iconListLayoutProvider:0];
}

- (void)dealloc
{
  [(SBHWidgetStackViewController *)self _teardownStateCapture];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBInstalledApplicationsDidChangeNotification" object:0];

  v4 = [(SBHWidgetStackViewController *)self view];
  [v4 removeObserver:self forKeyPath:@"alpha"];

  [(SBLeafIcon *)self->_icon removeObserver:self];
  [(PTSettings *)self->_widgetSettings removeKeyObserver:self];
  v5.receiver = self;
  v5.super_class = (Class)SBHWidgetStackViewController;
  [(SBHWidgetStackViewController *)&v5 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v23.receiver = self;
  v23.super_class = (Class)SBHWidgetStackViewController;
  [(SBHWidgetStackViewController *)&v23 loadView];
  v3 = [(SBHWidgetStackViewController *)self view];
  v4 = [v3 layer];
  [v4 setAllowsGroupOpacity:1];

  objc_super v5 = [(SBHWidgetStackViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  uint64_t v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v9, v11, v13);
  containerView = self->_containerView;
  self->_containerView = v14;

  [(UIView *)self->_containerView setClipsToBounds:0];
  uint64_t v16 = [(SBHWidgetStackViewController *)self view];
  [v16 addSubview:self->_containerView];

  uint64_t v17 = (BSUIScrollView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F4F8E0]), "initWithFrame:", v7, v9, v11, v13);
  scrollView = self->_scrollView;
  self->_scrollView = v17;

  [(BSUIScrollView *)self->_scrollView setDelegate:self];
  [(BSUIScrollView *)self->_scrollView setPagingEnabled:1];
  [(BSUIScrollView *)self->_scrollView setBounces:1];
  [(BSUIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
  [(BSUIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  [(BSUIScrollView *)self->_scrollView setScrollsToTop:0];
  [(BSUIScrollView *)self->_scrollView setClipsToBounds:0];
  [(BSUIScrollView *)self->_scrollView _setAutoScrollEnabled:0];
  [(BSUIScrollView *)self->_scrollView _setForwardsTouchesUpResponderChain:1];
  [(BSUIScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:2];
  [(UIView *)self->_containerView addSubview:self->_scrollView];
  v19 = (UIPageControl *)objc_alloc_init(MEMORY[0x1E4FB1A40]);
  pageControl = self->_pageControl;
  self->_pageControl = v19;

  [(UIPageControl *)self->_pageControl setAlpha:0.0];
  [(UIPageControl *)self->_pageControl setDirection:3];
  [(UIPageControl *)self->_pageControl setHidesForSinglePage:1];
  [(UIPageControl *)self->_pageControl _setPreferredNumberOfVisibleIndicators:[(SBHWidgetSettings *)self->_widgetSettings maximumWidgetsInAStack]];
  id v21 = [(SBHWidgetStackViewController *)self view];
  [v21 addSubview:self->_pageControl];

  v22 = [(SBHWidgetStackViewController *)self view];
  [v22 addObserver:self forKeyPath:@"alpha" options:0 context:0];

  [(SBHWidgetStackViewController *)self _updateAccessibilityValue];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetStackViewController;
  [(SBHWidgetStackViewController *)&v4 viewWillLayoutSubviews];
  if ([(BSUIScrollView *)self->_scrollView isScrolling]) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 4;
  }
  [(SBHWidgetStackViewController *)self _layoutWithAnimationUpdateMode:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v5 = SBLogWidgets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543874;
    v20 = v7;
    __int16 v21 = 2048;
    v22 = self;
    __int16 v23 = 2080;
    v24 = "-[SBHWidgetStackViewController viewWillAppear:]";
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);
  }
  v17.receiver = self;
  v17.super_class = (Class)SBHWidgetStackViewController;
  [(SBHWidgetStackViewController *)&v17 viewWillAppear:v3];
  [(SBHWidgetStackViewController *)self _layoutWithAnimationUpdateMode:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v8 = [(SBHWidgetStackViewController *)self childViewControllers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SBHWidgetStackViewController *)self bs_beginAppearanceTransitionForChildViewController:*(void *)(*((void *)&v13 + 1) + 8 * v12++) toVisible:1 animated:v3];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }

  if ([(SBHWidgetStackViewController *)self automaticallyUpdatesVisiblySettled]) {
    [(SBHWidgetStackViewController *)self setUserVisibilityStatus:2];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v5 = SBLogWidgets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543874;
    v20 = v7;
    __int16 v21 = 2048;
    v22 = self;
    __int16 v23 = 2080;
    v24 = "-[SBHWidgetStackViewController viewDidAppear:]";
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);
  }
  v17.receiver = self;
  v17.super_class = (Class)SBHWidgetStackViewController;
  [(SBHWidgetStackViewController *)&v17 viewDidAppear:v3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v8 = [(SBHWidgetStackViewController *)self childViewControllers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SBHWidgetStackViewController *)self bs_endAppearanceTransitionForChildViewController:*(void *)(*((void *)&v13 + 1) + 8 * i) toVisible:1];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }

  if ([(SBHWidgetStackViewController *)self automaticallyUpdatesVisiblySettled]) {
    [(SBHWidgetStackViewController *)self setUserVisibilityStatus:3];
  }
  if (self->_flashPageControlOnNextAppearance)
  {
    [(SBHWidgetStackViewController *)self _flashPageControlAnimated:1];
    self->_flashPageControlOnNextAppearance = 0;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v5 = SBLogWidgets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543874;
    v20 = v7;
    __int16 v21 = 2048;
    v22 = self;
    __int16 v23 = 2080;
    v24 = "-[SBHWidgetStackViewController viewWillDisappear:]";
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);
  }
  v17.receiver = self;
  v17.super_class = (Class)SBHWidgetStackViewController;
  [(SBHWidgetStackViewController *)&v17 viewWillDisappear:v3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v8 = [(SBHWidgetStackViewController *)self childViewControllers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SBHWidgetStackViewController *)self bs_beginAppearanceTransitionForChildViewController:*(void *)(*((void *)&v13 + 1) + 8 * v12++) toVisible:0 animated:v3];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }

  if ([(SBHWidgetStackViewController *)self automaticallyUpdatesVisiblySettled]) {
    [(SBHWidgetStackViewController *)self setUserVisibilityStatus:2];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_super v5 = SBLogWidgets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543874;
    __int16 v21 = v7;
    __int16 v22 = 2048;
    __int16 v23 = self;
    __int16 v24 = 2080;
    uint64_t v25 = "-[SBHWidgetStackViewController viewDidDisappear:]";
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);
  }
  v18.receiver = self;
  v18.super_class = (Class)SBHWidgetStackViewController;
  [(SBHWidgetStackViewController *)&v18 viewDidDisappear:v3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v8 = [(SBHWidgetStackViewController *)self childViewControllers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SBHWidgetStackViewController *)self bs_endAppearanceTransitionForChildViewController:*(void *)(*((void *)&v14 + 1) + 8 * v12++) toVisible:0];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }

  if ([(SBHWidgetStackViewController *)self automaticallyUpdatesVisiblySettled]) {
    [(SBHWidgetStackViewController *)self setUserVisibilityStatus:1];
  }
  [(SBHWidgetStackViewController *)self _layoutWithAnimationUpdateMode:1];
  self->_flashPageControlOnNextAppearance = [(SBHWidgetSettings *)self->_widgetSettings stackFlashesPageControlOnAppearance];
  [(SBHWidgetStackViewController *)self _teardownBackgroundView:self->_backgroundView contactDelegate:1];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = SBLogWidgets();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138543874;
    uint64_t v12 = v9;
    __int16 v13 = 2048;
    long long v14 = self;
    __int16 v15 = 2080;
    long long v16 = "-[SBHWidgetStackViewController viewDidMoveToWindow:shouldAppearOrDisappear:]";
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);
  }
  v10.receiver = self;
  v10.super_class = (Class)SBHWidgetStackViewController;
  [(SBHWidgetStackViewController *)&v10 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)setForcesEdgeAntialiasing:(BOOL)a3
{
  if (self->_forcesEdgeAntialiasing != a3)
  {
    self->_forcesEdgeAntialiasing = a3;
    [(SBHWidgetStackViewController *)self _updateWidgetViewEdgeAntialiasing];
  }
}

- (void)setShowsSnapshotWhenDeactivated:(BOOL)a3
{
  if (self->_showsSnapshotWhenDeactivated != a3)
  {
    self->_showsSnapshotWhenDeactivated = a3;
    [(SBHWidgetStackViewController *)self _updateShowsSnapshotWhenDeactivatedForWidgetViewControllers];
  }
}

- (NSArray)widgetViewControllers
{
  BOOL v3 = [(SBHWidgetStackViewController *)self widgetIcon];
  BOOL v4 = [v3 iconDataSources];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SBHWidgetStackViewController_widgetViewControllers__block_invoke;
  v7[3] = &unk_1E6AB35C8;
  v7[4] = self;
  objc_super v5 = objc_msgSend(v4, "bs_compactMap:", v7);

  return (NSArray *)v5;
}

id __53__SBHWidgetStackViewController_widgetViewControllers__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 uniqueIdentifier];
  BOOL v4 = [*(id *)(a1 + 32) _effectiveWidgetContainerViewControllers];
  objc_super v5 = [v4 objectForKey:v3];
  id v6 = [v5 widgetViewController];

  return v6;
}

- (UIViewController)currentWidgetViewController
{
  activeWidget = self->_activeWidget;
  if (activeWidget)
  {
    BOOL v4 = [(SBLeafIconDataSource *)activeWidget uniqueIdentifier];
    objc_super v5 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
    id v6 = [v5 objectForKey:v4];

    double v7 = [v6 widgetViewController];
    if (objc_msgSend(v7, "sbh_isMultiplexingViewController"))
    {
      uint64_t v8 = [v7 multiplexedViewController];

      double v7 = (void *)v8;
    }
  }
  else
  {
    double v7 = 0;
  }
  return (UIViewController *)v7;
}

- (void)enumerateWidgetViewControllersUsingBlock:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__SBHWidgetStackViewController_enumerateWidgetViewControllersUsingBlock___block_invoke;
  v7[3] = &unk_1E6AB35F0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __73__SBHWidgetStackViewController_enumerateWidgetViewControllersUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = [a3 widgetViewController];
  if (objc_msgSend(v6, "sbh_isMultiplexingViewController"))
  {
    uint64_t v4 = [v6 multiplexedViewController];

    id v5 = (id)v4;
  }
  else
  {
    id v5 = v6;
  }
  id v7 = v5;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (UIColor)backgroundTintingColor
{
  return (UIColor *)[(SBHWidgetStackViewController *)self _backgroundColorForWidgetWithDistanceFromRestingContentOffset:0.0];
}

- (BOOL)isWidgetHitTestingDisabled
{
  if (self->_editing
    || self->_showingContextMenu
    || !self->_userInteractionEnabled
    || [(BSUIScrollView *)self->_scrollView isScrolling]
    || self->_widgetScaleAnimationCount)
  {
    return 1;
  }
  widgetSettings = self->_widgetSettings;
  return [(SBHWidgetSettings *)widgetSettings isHitTestingDisabled];
}

- (void)flashPageControlAnimated:(BOOL)a3 withTimeInterval:(double)a4
{
  [(SBHWidgetStackViewController *)self _setPageControlHidden:0 animated:a3];
  [(SBHWidgetStackViewController *)self _restartPageControlTimerWithTimeInterval:a4];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)leafIcon:(id)a3 didAddIconDataSource:(id)a4
{
  -[SBHWidgetStackViewController _updatePageControlWithAnimationUpdateMode:](self, "_updatePageControlWithAnimationUpdateMode:", 3, a4);
  [(SBHWidgetStackViewController *)self _updateAccessibilityValue];
  id v5 = [(SBHWidgetStackViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 widgetStackViewControllerWidgetCountDidChange:self];
  }
}

- (void)leafIcon:(id)a3 didRemoveIconDataSource:(id)a4
{
  -[SBHWidgetStackViewController _updatePageControlWithAnimationUpdateMode:](self, "_updatePageControlWithAnimationUpdateMode:", 3, a4);
  [(SBHWidgetStackViewController *)self _updateAccessibilityValue];
  id v5 = [(SBHWidgetStackViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 widgetStackViewControllerWidgetCountDidChange:self];
  }
}

- (void)leafIcon:(id)a3 didChangeActiveDataSource:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SBLogWidgets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    objc_super v10 = NSStringFromClass(v9);
    int v20 = 138544130;
    __int16 v21 = v10;
    __int16 v22 = 2048;
    __int16 v23 = self;
    __int16 v24 = 2114;
    id v25 = v6;
    __int16 v26 = 2114;
    id v27 = v7;
    _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> leafIcon:%{public}@ didChangeActiveDataSource:%{public}@", (uint8_t *)&v20, 0x2Au);
  }
  if ([v6 isWidgetIcon])
  {
    id v11 = v6;
    uint64_t v12 = [v11 iconDataSources];
    char v13 = [v12 containsObject:self->_activeWidget];
    if (self->_pauseReasons)
    {
      if ((v13 & 1) == 0) {
        [(SBHWidgetStackViewController *)self _removeWidget:self->_activeWidget animated:0];
      }
      long long v14 = [v11 activeDataSource];
      activeWidget = self->_activeWidget;
      self->_activeWidget = v14;

      pageControl = self->_pageControl;
      uint64_t v17 = [v11 iconDataSources];
      -[UIPageControl setCurrentPage:](pageControl, "setCurrentPage:", [v17 indexOfObject:self->_activeWidget]);
    }
    else
    {
      if (v13)
      {
LABEL_11:
        [(SBHWidgetStackViewController *)self updateImageAnimated:1];
        [(SBHWidgetStackViewController *)self _updateAccessibilityValue];

        goto LABEL_12;
      }
      [(SBHWidgetStackViewController *)self _removeWidget:self->_activeWidget animated:1];
      objc_super v18 = [v11 activeDataSource];
      uint64_t v17 = self->_activeWidget;
      self->_activeWidget = v18;
    }

    v19 = [(SBHWidgetStackViewController *)self view];
    [v19 setNeedsLayout];

    goto LABEL_11;
  }
LABEL_12:
}

- (SBLeafIconDataSource)visiblyActiveDataSource
{
  return self->_activeWidget;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    char v13 = [(SBHWidgetStackViewController *)self view];
    id v15 = [v13 layer];

    [v15 setCornerRadius:v7];
    [v15 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    long long v14 = [(SBHWidgetStackViewController *)self view];
    [v14 setNeedsLayout];
  }
}

- (void)setEditing:(BOOL)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    BOOL v4 = a4;
    self->_editing = a3;
    [(SBHWidgetStackViewController *)self _flashPageControlAnimated:a4];
    if (v4) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 2;
    }
    [(SBHWidgetStackViewController *)self _layoutWithAnimationUpdateMode:v6];
  }
}

- (void)setWidgetIcon:(id)a3
{
  double v5 = (SBWidgetIcon *)a3;
  icon = self->_icon;
  if (icon != v5)
  {
    double v9 = v5;
    [(SBLeafIcon *)icon removeObserver:self];
    objc_storeStrong((id *)&self->_icon, a3);
    [(SBLeafIcon *)v9 addObserver:self];
    double v7 = [(SBLeafIcon *)v9 activeDataSource];
    activeWidget = self->_activeWidget;
    self->_activeWidget = v7;

    if (v9) {
      [(SBHWidgetStackViewController *)self _updateActiveWidgetIndexAndScrollViewContentOffset];
    }
    [(SBHWidgetStackViewController *)self _layoutWithAnimationUpdateMode:2];
    double v5 = v9;
  }
}

- (void)setListLayoutProvider:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (SBIconListLayoutProvider *)a3;
  if (self->_listLayoutProvider != v4)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v6 = [(SBLeafIconDataSource *)self->_activeWidget uniqueIdentifier];
      }
      else
      {
        uint64_t v6 = 0;
      }
      double v7 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
      double v8 = [v7 objectForKey:v6];

      double v9 = [(SBHWidgetStackViewController *)self _widgetContainerViewControllersForListLayoutProvider:v4];
      objc_msgSend(v9, "bs_setSafeObject:forKey:", v8, v6);
    }
    p_widgetContainerViewControllersToRemove = (id *)&self->_widgetContainerViewControllersToRemove;
    if (!self->_widgetContainerViewControllersToRemove)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      id v12 = *p_widgetContainerViewControllersToRemove;
      id *p_widgetContainerViewControllersToRemove = (id)v11;
    }
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    __int16 v23 = __54__SBHWidgetStackViewController_setListLayoutProvider___block_invoke;
    __int16 v24 = &unk_1E6AACA90;
    id v25 = self;
    __int16 v26 = v4;
    char v13 = (void (**)(void))_Block_copy(&v21);
    uint64_t v14 = objc_msgSend(*p_widgetContainerViewControllersToRemove, "count", v21, v22, v23, v24, v25);
    id v15 = SBLogWidgets();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v17;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 1026;
      BOOL v32 = v14 != 0;
      _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p>; received new iconListLayoutProvider. canReuseViewControllerFromLastFullyRenderedLayoutProvider: %{public}d",
        buf,
        0x1Cu);
    }
    objc_super v18 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
    if (v14)
    {
      v13[2](v13);
      v19 = [*p_widgetContainerViewControllersToRemove allValues];
      [(SBHWidgetStackViewController *)self resizeSnapshotsForWidgetContainerViewControllers:v19 isFakeWidget:isKindOfClass & 1 reason:@"List Layout Provider Change Animation"];

      [(SBHWidgetStackViewController *)self _removeWidgetContainerViewControllers:v18 animated:0];
      int v20 = *p_widgetContainerViewControllersToRemove;
      id *p_widgetContainerViewControllersToRemove = 0;
    }
    else
    {
      if ((isKindOfClass & 1) == 0) {
        objc_storeStrong((id *)&self->_widgetContainerViewControllersToRemove, v18);
      }
      v13[2](v13);
      int v20 = [v18 allValues];
      [(SBHWidgetStackViewController *)self resizeSnapshotsForWidgetContainerViewControllers:v20 isFakeWidget:isKindOfClass & 1 reason:@"List Layout Provider Change Animation"];
    }
  }
}

void __54__SBHWidgetStackViewController_setListLayoutProvider___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = SBLogWidgets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = (objc_class *)objc_opt_class();
    BOOL v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543874;
    double v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1D7F0A000, v2, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> iconListLayoutProvider changed to <%{public}@>", (uint8_t *)&v7, 0x20u);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1104), *(id *)(a1 + 40));
}

- (void)resizeSnapshotsForWidgetContainerViewControllers:(id)a3 isFakeWidget:(BOOL)a4 reason:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = SBLogWidgets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138543874;
    objc_super v18 = v12;
    __int16 v19 = 2048;
    int v20 = self;
    __int16 v21 = 2080;
    uint64_t v22 = "-[SBHWidgetStackViewController resizeSnapshotsForWidgetContainerViewControllers:isFakeWidget:reason:]";
    _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; acquiring _imageUpdatesDisabledForNewListLayoutProviderAssertion",
      buf,
      0x20u);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __101__SBHWidgetStackViewController_resizeSnapshotsForWidgetContainerViewControllers_isFakeWidget_reason___block_invoke;
  v14[3] = &unk_1E6AB3618;
  BOOL v16 = a4;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v9 enumerateObjectsUsingBlock:v14];
}

void __101__SBHWidgetStackViewController_resizeSnapshotsForWidgetContainerViewControllers_isFakeWidget_reason___block_invoke(uint64_t a1, void *a2)
{
  double v3 = objc_msgSend(a2, "buildSnapshotResizeCoordinatorForSnapshotSize:expectNewViewController:", *(unsigned char *)(a1 + 48) == 0, *(double *)(*(void *)(a1 + 32) + 1304), *(double *)(*(void *)(a1 + 32) + 1312));
  if (v3)
  {
    BOOL v4 = [*(id *)(a1 + 32) disableImageUpdatesForReason:*(void *)(a1 + 40)];
    if (objc_opt_respondsToSelector()) {
      [v3 setUpResize];
    }
    uint64_t v5 = (void *)MEMORY[0x1E4FB1EB0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __101__SBHWidgetStackViewController_resizeSnapshotsForWidgetContainerViewControllers_isFakeWidget_reason___block_invoke_2;
    v10[3] = &unk_1E6AACA90;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __101__SBHWidgetStackViewController_resizeSnapshotsForWidgetContainerViewControllers_isFakeWidget_reason___block_invoke_3;
    v7[3] = &unk_1E6AB3020;
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v4;
    id v9 = v11;
    id v6 = v4;
    [v5 animateWithDuration:v10 animations:v7 completion:0.3];
  }
}

uint64_t __101__SBHWidgetStackViewController_resizeSnapshotsForWidgetContainerViewControllers_isFakeWidget_reason___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _incrementWidgetSnapshotAnimationCount];
  v2 = *(void **)(a1 + 40);
  return [v2 resize];
}

uint64_t __101__SBHWidgetStackViewController_resizeSnapshotsForWidgetContainerViewControllers_isFakeWidget_reason___block_invoke_3(id *a1)
{
  [a1[4] _decrementWidgetSnapshotAnimationCount];
  [a1[5] invalidate];
  uint64_t v2 = *((void *)a1[4] + 157);
  if ((objc_opt_respondsToSelector() & 1) != 0 && !v2) {
    [a1[6] finishResize];
  }
  id v3 = a1[4];
  return [v3 _layoutWithAnimationUpdateMode:1];
}

- (void)setShowingContextMenu:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_showingContextMenu != a3)
  {
    BOOL v3 = a3;
    self->_showingContextMenu = a3;
    if (a3)
    {
      if (self->_imageUpdatesDisabledForContextMenuAssertion)
      {
LABEL_10:
        [(SBHWidgetStackViewController *)self _flashPageControlAnimated:1];
        [(SBHWidgetStackViewController *)self _layoutWithAnimationUpdateMode:3];
        id v13 = [(SBHWidgetStackViewController *)self _widgetContextMenuController];
        [v13 setShowingContextMenu:v3];

        return;
      }
      uint64_t v5 = [(SBHWidgetStackViewController *)self _disableImageUpdatesForReason:@"SBHWidgetStackImageUpdatesDisabledForContextMenuReason" animateChangesUponInvalidation:1];
      imageUpdatesDisabledForContextMenuAssertion = self->_imageUpdatesDisabledForContextMenuAssertion;
      self->_imageUpdatesDisabledForContextMenuAssertion = v5;

      int v7 = SBLogWidgets();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        int v14 = 138543874;
        id v15 = v9;
        __int16 v16 = 2048;
        uint64_t v17 = self;
        __int16 v18 = 2080;
        __int16 v19 = "-[SBHWidgetStackViewController setShowingContextMenu:]";
        _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; acquiring _imageUpdatesDisabledForContextMenuAssertion",
          (uint8_t *)&v14,
          0x20u);
      }
    }
    else
    {
      uint64_t v10 = SBLogWidgets();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        int v14 = 138543874;
        id v15 = v12;
        __int16 v16 = 2048;
        uint64_t v17 = self;
        __int16 v18 = 2080;
        __int16 v19 = "-[SBHWidgetStackViewController setShowingContextMenu:]";
        _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; invalidating _imageUpdatesDisabledForContextMenuAssertion",
          (uint8_t *)&v14,
          0x20u);
      }
      [(BSInvalidatable *)self->_imageUpdatesDisabledForContextMenuAssertion invalidate];
      int v7 = self->_imageUpdatesDisabledForContextMenuAssertion;
      self->_imageUpdatesDisabledForContextMenuAssertion = 0;
    }

    goto LABEL_10;
  }
}

- (UIEdgeInsets)minimumPreferredEdgeInsetsForContextMenu
{
  if ([(SBWidgetIcon *)self->_icon isWidgetStackIcon]
    || self->_alwaysShowsAsStack
    || [(SBHWidgetSettings *)self->_widgetSettings stackAlwaysShowsPageControl])
  {
    [(UIPageControl *)self->_pageControl frame];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    id v11 = [(SBHWidgetStackViewController *)self view];
    [v11 bounds];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    if (CGRectGetMinX(v24) >= 0.0)
    {
      v26.origin.x = v4;
      v26.origin.y = v6;
      v26.size.width = v8;
      v26.size.height = v10;
      CGRectGetMaxX(v26);
      v27.origin.x = v13;
      v27.origin.y = v15;
      v27.size.width = v17;
      v27.size.height = v19;
      CGRectGetWidth(v27);
    }
    else
    {
      v25.origin.x = v4;
      v25.origin.y = v6;
      v25.size.width = v8;
      v25.size.height = v10;
      CGRectGetMinX(v25);
    }
    UIEdgeInsetsMakeWithEdges();
  }
  else
  {
    double v20 = *MEMORY[0x1E4FB2848];
    double v21 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v22 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v23 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (void)willShowContextMenuAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = [(SBHWidgetStackViewController *)self _widgetContextMenuController];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SBHWidgetStackViewController *)self _widgetContextMenuController];
    objc_msgSend(v8, "willShowContextMenuAtLocation:", x, y);
  }
}

- (void)setOverlapping:(BOOL)a3
{
  if (self->_overlapping != a3)
  {
    self->_overlapping = a3;
    [(SBHWidgetStackViewController *)self _layoutWithAnimationUpdateMode:3];
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  if (self->_userInteractionEnabled != a3)
  {
    self->_userInteractionEnabled = a3;
    [(SBHWidgetStackViewController *)self _updateWidgetViewHitTesting];
  }
}

- (void)evaluateBackground
{
  [(SBHWidgetStackViewController *)self _updateWidgetViewClippingAndBackgroundView];
  [(SBHWidgetStackViewController *)self _updateWidgetViewHitTesting];
  [(SBHWidgetStackViewController *)self _configureBackgroundViewIfNecessary];
  [(SBHWidgetStackViewController *)self _updateWidgetViewStyleConfiguration];
}

- (BOOL)wantsCaptureOnlyBackgroundView
{
  if ([(SBWidgetIcon *)self->_icon isWidgetStackIcon]) {
    return 1;
  }
  activeWidget = self->_activeWidget;
  return [(SBHWidgetStackViewController *)self _shouldDrawSystemBackgroundMaterialForWidget:activeWidget];
}

- (void)setBackgroundViewProvider:(id)a3
{
  if (self->_backgroundViewProvider != a3)
  {
    CGFloat v4 = (void *)[a3 copy];
    id backgroundViewProvider = self->_backgroundViewProvider;
    self->_id backgroundViewProvider = v4;

    backgroundView = self->_backgroundView;
    if (backgroundView) {
      [(SBHWidgetStackViewController *)self _teardownBackgroundView:backgroundView contactDelegate:1];
    }
    [(SBHWidgetStackViewController *)self _createBackgroundViewIfNecessary:1];
  }
}

- (void)setBackgroundViewConfigurator:(id)a3
{
  if (self->_backgroundViewConfigurator != a3)
  {
    CGFloat v4 = (void *)[a3 copy];
    id backgroundViewConfigurator = self->_backgroundViewConfigurator;
    self->_id backgroundViewConfigurator = v4;

    if (!self->_backgroundViewConfigurator)
    {
      CGFloat v6 = _Block_copy(self->_backgroundViewProvider);
      [(SBHWidgetStackViewController *)self setBackgroundViewProvider:0];
      [(SBHWidgetStackViewController *)self setBackgroundViewProvider:v6];
    }
    [(SBHWidgetStackViewController *)self _configureBackgroundViewIfNecessary];
  }
}

- (void)setBrightness:(double)a3
{
  if (self->_brightness != a3)
  {
    self->_brightness = a3;
    if (a3 < 1.0 && !self->_dimmingView)
    {
      id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(UIView *)self->_containerView bounds];
      CGFloat v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
      dimmingView = self->_dimmingView;
      self->_dimmingView = v6;

      [(UIView *)self->_dimmingView setAutoresizingMask:18];
      id v8 = self->_dimmingView;
      double v9 = [MEMORY[0x1E4FB1618] blackColor];
      [(UIView *)v8 setBackgroundColor:v9];

      CGFloat v10 = self->_dimmingView;
      [(SBHWidgetStackViewController *)self continuousCornerRadius];
      -[UIView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:");
      [(UIView *)self->_containerView addSubview:self->_dimmingView];
    }
    id v11 = [(SBHWidgetStackViewController *)self icon];
    int IsOne = BSFloatIsOne();
    CGFloat v13 = (void *)MEMORY[0x1E4FB1EB0];
    v16[1] = 3221225472;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[2] = __46__SBHWidgetStackViewController_setBrightness___block_invoke;
    v16[3] = &unk_1E6AADF50;
    if (IsOne) {
      double v14 = 0.3;
    }
    else {
      double v14 = 0.0;
    }
    v16[4] = self;
    id v17 = v11;
    double v18 = a3;
    id v15 = v11;
    [v13 animateWithDuration:v16 animations:v14];
  }
}

void __46__SBHWidgetStackViewController_setBrightness___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) widgetSettings];
  double v3 = 0.0;
  if ([v2 isHitTestingDisabled]) {
    goto LABEL_12;
  }
  int v4 = [*(id *)(a1 + 40) isLaunchEnabled];

  if (!v4) {
    goto LABEL_13;
  }
  id v5 = [*(id *)(a1 + 32) activeWidget];
  uint64_t v2 = [v5 uniqueIdentifier];

  CGFloat v6 = [*(id *)(a1 + 32) _effectiveWidgetContainerViewControllers];
  char v7 = [v6 objectForKey:v2];

  if (([v7 containsInteractiveControls] & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 40) gridSizeClass];
    if (v8 != @"SBHIconGridSizeClassSmall")
    {
      double v9 = [*(id *)(a1 + 40) gridSizeClass];
      if (([v9 isEqualToString:@"SBHIconGridSizeClassSmall"] & 1) == 0
        && ([*(id *)(a1 + 32) isWidgetHitTestingDisabled] & 1) == 0
        && ![*(id *)(a1 + 32) alwaysShowsAsStack])
      {
        char v10 = [*(id *)(a1 + 32) highlightsAtAnySize];

        if ((v10 & 1) == 0) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
LABEL_10:
    double v3 = (1.0 - *(double *)(a1 + 48)) * 0.5;
  }
LABEL_11:

LABEL_12:
LABEL_13:
  id v11 = [*(id *)(a1 + 32) dimmingView];
  [v11 setAlpha:v3];
}

- (void)setUserVisibilityStatus:(unint64_t)a3
{
  if (self->_userVisibilityStatus != a3)
  {
    self->_userVisibilityStatus = a3;
    [(SBHWidgetStackViewController *)self _updateVisiblySettledForWidgetViewControllers];
  }
}

- (void)setPresentationMode:(unint64_t)a3
{
  if (self->_presentationMode != a3)
  {
    self->_presentationMode = a3;
    [(SBHWidgetStackViewController *)self _updatePresentationModeForWidgetViewControllers];
  }
}

- (void)setPauseReasons:(unint64_t)a3
{
  if (self->_pauseReasons != a3)
  {
    self->_pauseReasons = a3;
    [(SBHWidgetStackViewController *)self _updatePauseReasonForWidgetViewControllers];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v9 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    pageControl = self->_pageControl;
    CGFloat v6 = [v9 primaryColor];
    [(UIPageControl *)pageControl setCurrentPageIndicatorTintColor:v6];

    char v7 = self->_pageControl;
    id v8 = [v9 secondaryColor];
    [(UIPageControl *)v7 setPageIndicatorTintColor:v8];
  }
}

- (void)setImageViewAlignment:(unint64_t)a3
{
  if (self->_imageViewAlignment != a3)
  {
    self->_imageViewAlignment = a3;
    int v4 = [(SBHWidgetStackViewController *)self view];
    [v4 setNeedsLayout];

    id v5 = [(SBHWidgetStackViewController *)self view];
    [v5 layoutIfNeeded];
  }
}

- (void)setApproximateLayoutPosition:(SBIconApproximateLayoutPosition)a3
{
  unint64_t vertical = a3.vertical;
  unint64_t horizontal = a3.horizontal;
  p_approximateLayoutPosition = &self->_approximateLayoutPosition;
  if (!SBIconApproximateLayoutPositionEqualToApproximateLayoutPosition(self->_approximateLayoutPosition.horizontal, self->_approximateLayoutPosition.vertical, a3.horizontal, a3.vertical))
  {
    p_approximateLayoutPosition->unint64_t horizontal = horizontal;
    p_approximateLayoutPosition->unint64_t vertical = vertical;
    [(SBHWidgetStackViewController *)self _updateApproximateLayoutPositionForWidgetViewControllers];
  }
}

- (NSArray)applicationShortcutItems
{
  uint64_t v2 = [(SBHWidgetStackViewController *)self _widgetContextMenuController];
  double v3 = [v2 applicationShortcutItems];

  return (NSArray *)v3;
}

- (void)didSelectApplicationShortcutItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHWidgetStackViewController *)self _widgetContextMenuController];
  [v5 didSelectApplicationShortcutItem:v4];
}

- (id)_widgetContextMenuController
{
  double v3 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  id v4 = [(SBLeafIconDataSource *)self->_activeWidget uniqueIdentifier];
  id v5 = [v3 objectForKey:v4];

  CGFloat v6 = [v5 widgetContextMenuController];

  return v6;
}

- (void)addCustomImageViewControllerObserver:(id)a3
{
  id v4 = a3;
  customImageViewObservers = self->_customImageViewObservers;
  id v8 = v4;
  if (!customImageViewObservers)
  {
    CGFloat v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    char v7 = self->_customImageViewObservers;
    self->_customImageViewObservers = v6;

    id v4 = v8;
    customImageViewObservers = self->_customImageViewObservers;
  }
  [(NSHashTable *)customImageViewObservers addObject:v4];
}

- (void)removeCustomImageViewControllerObserver:(id)a3
{
}

- (void)updateImageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(BSUIScrollView *)self->_scrollView isTracking] & 1) == 0
    && ![(SBHWidgetStackViewController *)self isOverlapping])
  {
    [(SBHWidgetStackViewController *)self _scrollToActiveWidgetAnimated:v3];
  }
}

- (id)disableImageUpdatesForReason:(id)a3
{
  return [(SBHWidgetStackViewController *)self _disableImageUpdatesForReason:a3 animateChangesUponInvalidation:0];
}

- (id)_disableImageUpdatesForReason:(id)a3 animateChangesUponInvalidation:(BOOL)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_imageUpdateDisableAssertions)
  {
    char v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    imageUpdateDisableAssertions = self->_imageUpdateDisableAssertions;
    self->_imageUpdateDisableAssertions = v7;
  }
  objc_initWeak(&location, self);
  id v9 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __93__SBHWidgetStackViewController__disableImageUpdatesForReason_animateChangesUponInvalidation___block_invoke;
  double v18 = &unk_1E6AB3640;
  objc_copyWeak(&v20, &location);
  BOOL v21 = a4;
  CGFloat v19 = self;
  char v10 = (void *)[v9 initWithIdentifier:@"widgetStack.disableImageUpdates" forReason:v6 invalidationBlock:&v15];
  id v11 = SBLogWidgets();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (objc_class *)objc_opt_class();
    CGFloat v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138544130;
    CGRect v24 = v13;
    __int16 v25 = 2048;
    CGRect v26 = self;
    __int16 v27 = 2080;
    uint64_t v28 = "-[SBHWidgetStackViewController _disableImageUpdatesForReason:animateChangesUponInvalidation:]";
    __int16 v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; acquiring 'widgetStack.disableImageUpdates' assertion %{public}@",
      buf,
      0x2Au);
  }
  -[NSHashTable addObject:](self->_imageUpdateDisableAssertions, "addObject:", v10, v15, v16, v17, v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v10;
}

void __93__SBHWidgetStackViewController__disableImageUpdatesForReason_animateChangesUponInvalidation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained imageUpdateDisableAssertions];
    [v6 removeObject:v3];

    [v5 updateImageAnimated:*(unsigned __int8 *)(a1 + 48)];
    [v5 _updateWidgetViewsWithAnimationUpdateMode:2];
    [v5 _updateWidgetViewClippingAndBackgroundView];
  }
  char v7 = SBLogWidgets();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138544130;
    double v12 = v9;
    __int16 v13 = 2048;
    uint64_t v14 = v10;
    __int16 v15 = 2080;
    uint64_t v16 = "-[SBHWidgetStackViewController _disableImageUpdatesForReason:animateChangesUponInvalidation:]_block_invoke";
    __int16 v17 = 2114;
    id v18 = v3;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; invalidating 'widgetStack.disableImageUpdates' assertion %{public}@",
      (uint8_t *)&v11,
      0x2Au);
  }
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  id v3 = [(SBLeafIconDataSource *)self->_activeWidget uniqueIdentifier];
  id v4 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  id v5 = [v4 objectForKey:v3];

  id v6 = [v5 cancelTouchesForCurrentEventInHostedContent];

  return v6;
}

- (UIView)snapshotView
{
  [(SBHWidgetStackViewController *)self _layoutWithAnimationUpdateMode:2];
  id v3 = [(SBLeafIconDataSource *)self->_activeWidget uniqueIdentifier];
  id v4 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  id v5 = [v4 objectForKey:v3];

  id v6 = [v5 snapshotView];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    char v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v6 setBackgroundColor:v7];
  }
  return (UIView *)v6;
}

- (UIView)springLoadingEffectTargetView
{
  id v3 = [(SBLeafIconDataSource *)self->_activeWidget uniqueIdentifier];
  id v4 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  id v5 = [v4 objectForKey:v3];

  id v6 = [v5 view];

  return (UIView *)v6;
}

- (BOOL)_scrollToActiveWidgetAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSHashTable *)self->_imageUpdateDisableAssertions count]) {
    return 0;
  }
  [(BSUIScrollView *)self->_scrollView contentOffset];
  int64_t v5 = -[SBHWidgetStackViewController _newActiveWidgetIndexForContentOffset:](self, "_newActiveWidgetIndexForContentOffset:");
  id v6 = [(SBLeafIcon *)self->_icon iconDataSources];
  char v7 = [(SBLeafIcon *)self->_icon activeDataSource];
  uint64_t v8 = [v6 indexOfObject:v7];

  if (v8 == v5) {
    return 0;
  }
  self->_showStackBorderWhenShowingPageControl = 1;
  [(SBHWidgetStackViewController *)self _setPageControlHidden:0 animated:1];
  if (!v3)
  {
    [(SBHWidgetStackViewController *)self _restartPageControlTimer];
    __int16 v17 = [(SBLeafIcon *)self->_icon activeDataSource];
    activeWidget = self->_activeWidget;
    self->_activeWidget = v17;

    [(UIPageControl *)self->_pageControl setCurrentPage:v8];
    scrollView = self->_scrollView;
    [(SBHWidgetStackViewController *)self _restingContentOffset];
    -[BSUIScrollView setContentOffset:](scrollView, "setContentOffset:");
    id v20 = [(SBHWidgetStackViewController *)self view];
    [v20 setNeedsLayout];

    BOOL v21 = [(SBHWidgetStackViewController *)self view];
    [v21 layoutIfNeeded];

    return 1;
  }
  unint64_t v10 = [(SBLeafIcon *)self->_icon iconDataSourceCount];
  uint64_t v11 = v8 - v5;
  if (v8 <= v5) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = v10;
  }
  if (v8 <= v5) {
    unint64_t v13 = v10;
  }
  else {
    unint64_t v13 = 0;
  }
  unint64_t v28 = v13 + v11;
  uint64_t v14 = (uint64_t *)&v29;
  unint64_t v29 = v11 - v12;
  uint64_t v30 = v8;
  int64_t v31 = v5;
  int64_t v15 = [(SBHWidgetStackViewController *)self preferredDirection];
  if (v15)
  {
    if (v15 == 1)
    {
      uint64_t v14 = (uint64_t *)&v28;
    }
    else
    {
      double v16 = 0.0;
      if (v15 != 2) {
        goto LABEL_21;
      }
    }
  }
  else if (v30 >= v31)
  {
    uint64_t v14 = (uint64_t *)&v28;
  }
  double v16 = (double)*v14;
LABEL_21:
  [(BSUIScrollView *)self->_scrollView contentOffset];
  double v23 = v22;
  double v25 = v24;
  [(SBHWidgetStackViewController *)self _pageSize];
  double v27 = v26 * round(v25 / v26) + v16 * v26;
  [(BSUIScrollView *)self->_scrollView contentOffset];
  if (BSPointEqualToPoint()) {
    return 0;
  }
  -[BSUIScrollView _setContentOffsetWithDecelerationAnimation:](self->_scrollView, "_setContentOffsetWithDecelerationAnimation:", v23, v27);
  return 1;
}

uint64_t __62__SBHWidgetStackViewController__scrollToActiveWidgetAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) preferredDirection];
  switch(v2)
  {
    case 0:
      uint64_t v4 = a1 + 40;
      if (*(void *)(a1 + 56) < *(void *)(a1 + 64)) {
        uint64_t v4 = a1 + 48;
      }
      return *(void *)v4;
    case 2:
      uint64_t v4 = a1 + 48;
      return *(void *)v4;
    case 1:
      uint64_t v4 = a1 + 40;
      return *(void *)v4;
  }
  return v3;
}

- (void)_removeWidgetContainerViewControllers:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__SBHWidgetStackViewController__removeWidgetContainerViewControllers_animated___block_invoke;
  v8[3] = &unk_1E6AB3690;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v8];
}

uint64_t __79__SBHWidgetStackViewController__removeWidgetContainerViewControllers_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeWidgetWithUniqueIdentifier:a2 widgetContainerViewControllers:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_removeWidget:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  [(SBHWidgetStackViewController *)self _removeWidget:v6 widgetContainerViewControllers:v7 animated:v4];
}

- (void)_removeWidget:(id)a3 widgetContainerViewControllers:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [a3 uniqueIdentifier];
  [(SBHWidgetStackViewController *)self _removeWidgetWithUniqueIdentifier:v9 widgetContainerViewControllers:v8 animated:v5];
}

- (void)_removeWidgetWithUniqueIdentifier:(id)a3 widgetContainerViewControllers:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [v9 objectForKey:v8];
  if (v10)
  {
    [v9 removeObjectForKey:v8];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __106__SBHWidgetStackViewController__removeWidgetWithUniqueIdentifier_widgetContainerViewControllers_animated___block_invoke;
    aBlock[3] = &unk_1E6AACDE0;
    id v35 = v8;
    id v11 = v10;
    id v36 = v11;
    v37 = self;
    unint64_t v12 = _Block_copy(aBlock);
    unint64_t v13 = v12;
    if (v5)
    {
      id v14 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(UIView *)self->_containerView bounds];
      int64_t v15 = objc_msgSend(v14, "initWithFrame:");
      [(UIView *)self->_containerView center];
      objc_msgSend(v15, "setCenter:");
      [v15 setClipsToBounds:1];
      [v15 _setContinuousCornerRadius:self->_iconImageInfo.continuousCornerRadius];
      double v16 = [v15 layer];
      [v16 setAllowsGroupOpacity:1];

      __int16 v17 = [(SBHWidgetStackViewController *)self view];
      [v17 addSubview:v15];

      id v18 = [(SBHWidgetStackViewController *)self view];
      [v18 bounds];
      [v15 bounds];
      UIRectCenteredIntegralRect();
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;

      double v27 = [v11 view];
      objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);
      unint64_t v28 = (void *)MEMORY[0x1E4FB1EB0];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __106__SBHWidgetStackViewController__removeWidgetWithUniqueIdentifier_widgetContainerViewControllers_animated___block_invoke_67;
      v33[3] = &unk_1E6AAC810;
      v33[4] = self;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __106__SBHWidgetStackViewController__removeWidgetWithUniqueIdentifier_widgetContainerViewControllers_animated___block_invoke_2;
      v30[3] = &unk_1E6AB36B8;
      id v31 = v15;
      id v32 = v13;
      id v29 = v15;
      [v28 animateWithDuration:v33 animations:v30 completion:0.4];
    }
    else
    {
      (*((void (**)(void *))v12 + 2))(v12);
    }
  }
}

void __106__SBHWidgetStackViewController__removeWidgetWithUniqueIdentifier_widgetContainerViewControllers_animated___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogWidgets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D7F0A000, v2, OS_LOG_TYPE_DEFAULT, "Removing widget with unique identifier %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 40) setUserVisibilityStatus:1];
  objc_msgSend(*(id *)(a1 + 48), "bs_removeChildViewController:", *(void *)(a1 + 40));
  BOOL v4 = [*(id *)(a1 + 48) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 40) widgetViewController];
    [v4 widgetStackViewController:v5 didRemoveViewController:v6];
  }
}

uint64_t __106__SBHWidgetStackViewController__removeWidgetWithUniqueIdentifier_widgetContainerViewControllers_animated___block_invoke_67(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1184) setAlpha:1.0];
}

uint64_t __106__SBHWidgetStackViewController__removeWidgetWithUniqueIdentifier_widgetContainerViewControllers_animated___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 removeFromSuperview];
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  id v4 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v5 = (SBHIconImageAppearance *)[v4 copy];
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v5;

    int v7 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__SBHWidgetStackViewController_setOverrideIconImageAppearance___block_invoke;
    v8[3] = &unk_1E6AB36E0;
    id v9 = v4;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

uint64_t __63__SBHWidgetStackViewController_setOverrideIconImageAppearance___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setOverrideIconImageAppearance:*(void *)(a1 + 32)];
}

- (void)setOverrideIconImageStyleConfiguration:(id)a3
{
  id v4 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v5 = (SBHIconImageStyleConfiguration *)[v4 copy];
    overrideIconImageStyleConfiguration = self->_overrideIconImageStyleConfiguration;
    self->_overrideIconImageStyleConfiguration = v5;

    int v7 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__SBHWidgetStackViewController_setOverrideIconImageStyleConfiguration___block_invoke;
    v8[3] = &unk_1E6AB36E0;
    id v9 = v4;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

uint64_t __71__SBHWidgetStackViewController_setOverrideIconImageStyleConfiguration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setOverrideIconImageStyleConfiguration:*(void *)(a1 + 32)];
}

- (id)effectiveIconImageAppearance
{
  uint64_t v3 = [(SBHWidgetStackViewController *)self overrideIconImageAppearance];
  id v4 = [(SBHWidgetStackViewController *)self traitCollection];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:overrideIconImageAppearance:", v4, v3);

  return v5;
}

- (void)setHost:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_host, obj);
    if (obj) {
      [(SBHWidgetStackViewController *)self _layoutWithAnimationUpdateMode:2];
    }
    else {
      [(SBHWidgetStackViewController *)self discardAllWidgetViewControllers];
    }
    uint64_t v5 = obj;
  }
}

- (void)prepareForReuse
{
  [(SBHWidgetStackViewController *)self _teardownBackgroundView:self->_backgroundView contactDelegate:1];
  [(SBHWidgetStackViewController *)self setDataSource:0];
  [(SBHWidgetStackViewController *)self setDelegate:0];
  [(SBHWidgetStackViewController *)self setAlwaysShowsAsStack:0];
  [(SBHWidgetStackViewController *)self setHighlightsAtAnySize:0];
  [(SBHWidgetStackViewController *)self setClipsWidgetsToViewBounds:1];
  [(SBHWidgetStackViewController *)self setPreferredDirection:0];
  [(SBHWidgetStackViewController *)self setForcesVisible:0];
  [(SBHWidgetStackViewController *)self setOverrideIconImageAppearance:0];
  [(SBHWidgetStackViewController *)self setOverrideIconImageStyleConfiguration:0];
  [(SBHWidgetStackViewController *)self setUserInteractionEnabled:1];
  [(SBHWidgetStackViewController *)self setOverlapping:0];
  [(SBHWidgetStackViewController *)self setBackgroundViewProvider:0];
  [(SBHWidgetStackViewController *)self setBackgroundViewConfigurator:0];
  [(SBHWidgetStackViewController *)self setAutomaticallyUpdatesVisiblySettled:1];
  [(SBHWidgetStackViewController *)self setBrightness:1.0];
  [(SBHWidgetStackViewController *)self setUserVisibilityStatus:1];
  [(SBHWidgetStackViewController *)self setPresentationMode:0];
  [(SBHWidgetStackViewController *)self setPauseReasons:0];
  -[SBHWidgetStackViewController setApproximateLayoutPosition:](self, "setApproximateLayoutPosition:", 0, 0);
  [(SBHWidgetStackViewController *)self setWidgetIcon:0];
  [(SBHWidgetStackViewController *)self setListLayoutProvider:0];
  [(SBHWidgetStackViewController *)self discardAllWidgetViewControllers];
  observers = self->_observers;
  [(NSHashTable *)observers removeAllObjects];
}

- (id)sourceView
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBLeafIconDataSource *)self->_activeWidget uniqueIdentifier];
  activeWidget = self->_activeWidget;
  if (activeWidget)
  {
    [(SBHWidgetStackViewController *)self iconImageInfo];
    char v5 = !-[SBHWidgetStackViewController _createViewControllerForWidgetIfNecessary:usingIconImageInfo:](self, "_createViewControllerForWidgetIfNecessary:usingIconImageInfo:", activeWidget);
  }
  else
  {
    char v5 = 1;
  }
  id v6 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  int v7 = v6;
  if (v3)
  {
    uint64_t v8 = [v6 objectForKey:v3];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = [v8 snapshotView];
  if (v9)
  {
    if ([(SBHWidgetStackViewController *)self _shouldDrawSystemBackgroundMaterialForWidget:self->_activeWidget])
    {
      objc_setAssociatedObject(v9, "SBHTransparentWidgetKey", MEMORY[0x1E4F1CC38], (void *)3);
    }
    if ([v8 wantsTintedAppearanceBackground]) {
      objc_setAssociatedObject(v9, "SBHTintedWidgetKey", MEMORY[0x1E4F1CC38], (void *)3);
    }
  }
  if ((v5 & 1) == 0)
  {
    BOOL v10 = SBLogWidgets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (objc_class *)objc_opt_class();
      unint64_t v12 = NSStringFromClass(v11);
      int v20 = 138544130;
      double v21 = v12;
      __int16 v22 = 2048;
      double v23 = self;
      __int16 v24 = 2080;
      double v25 = "-[SBHWidgetStackViewController sourceView]";
      __int16 v26 = 2114;
      double v27 = v8;
      _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; view controller '%{public}@' didn't exist; we need to remove it now.",
        (uint8_t *)&v20,
        0x2Au);
    }
    [(SBHWidgetStackViewController *)self bs_removeChildViewController:v8];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v14 = [v8 widgetViewController];
    [WeakRetained widgetStackViewController:self didRemoveViewController:v14];

    [v7 removeObjectForKey:v3];
  }
  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    int64_t v15 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v9 setBackgroundColor:v15];

    double v16 = SBLogWidgets();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      int v20 = 138543874;
      double v21 = v18;
      __int16 v22 = 2048;
      double v23 = self;
      __int16 v24 = 2080;
      double v25 = "-[SBHWidgetStackViewController sourceView]";
      _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; returning blank source view",
        (uint8_t *)&v20,
        0x20u);
    }
  }

  return v9;
}

- (id)sourceBackgroundView:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  id v6 = objc_getAssociatedObject(v4, "SBHTintedWidgetKey");
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    [v5 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(SBHWidgetStackViewController *)self iconImageInfo];
    __int16 v17 = +[SBHWidgetContainerViewController buildGradientBackgroundViewWithFrame:continuousCornerRadius:](SBHWidgetContainerViewController, "buildGradientBackgroundViewWithFrame:continuousCornerRadius:", v9, v11, v13, v15, v16);
    goto LABEL_11;
  }
  id v18 = objc_getAssociatedObject(v5, "SBHTransparentWidgetKey");
  int v19 = [v18 BOOLValue];

  if (v19)
  {
    int v20 = SBLogWidgets();
    if (os_signpost_enabled(v20))
    {
      double v21 = NSString;
      __int16 v22 = (objc_class *)objc_opt_class();
      double v23 = NSStringFromClass(v22);
      __int16 v24 = [v21 stringWithFormat:@"<%@: %p>", v23, self];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v24;
      _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_CREATE_BACKGROUND", "%{public}@", buf, 0xCu);
    }
    __int16 v17 = [(SBHWidgetStackViewController *)self _createBackgroundView];
    [(SBHWidgetStackViewController *)self _configureBackgroundViewIfNecessary:v17];
    double v25 = SBLogWidgets();
    if (os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_CREATE_BACKGROUND", " isAnimation=YES ", buf, 2u);
    }
  }
  else
  {
LABEL_10:
    __int16 v17 = 0;
  }
LABEL_11:

  return v17;
}

- (CGRect)visibleBounds
{
  [(SBHWidgetStackViewController *)self iconImageInfo];
  double v3 = v2;
  double v5 = v4;
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (double)continuousCornerRadius
{
  [(SBHWidgetStackViewController *)self iconImageInfo];
  return v2;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  if (self->_showsSquareCorners != a3)
  {
    self->_showsSquareCorners = a3;
    [(UIView *)self->_backgroundView setClipsToBounds:!a3];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v14 = a3;
  [(SBHWidgetStackViewController *)self _pageSize];
  double v5 = v4;
  [(SBHWidgetStackViewController *)self _scrollViewContentSize];
  double v7 = v6;
  [v14 contentOffset];
  double v10 = v9;
  if (v8 >= 0.0 && v8 <= v7 - v5)
  {
    double v12 = v8;
    if ([v14 isScrollAnimating]) {
      -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", -[SBHWidgetStackViewController _newActiveWidgetIndexForContentOffset:](self, "_newActiveWidgetIndexForContentOffset:", v10, v12));
    }
    double v13 = [(SBHWidgetStackViewController *)self view];
    [v13 setNeedsLayout];
  }
  else
  {
    [(SBHWidgetStackViewController *)self _updateActiveWidgetIndexAndScrollViewContentOffset];
  }
}

- (void)scrollViewWillBeginScrolling:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 widgetStackViewControllerWillBeginScrolling:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(SBHWidgetStackViewController *)self _updateActiveWidgetIndexAndScrollViewContentOffset];
  if (!self->_scrollingTouchCancellationAssertion)
  {
    double v4 = [(SBHWidgetStackViewController *)self cancelTouchesForCurrentEventInHostedContent];
    scrollingTouchCancellationAssertion = self->_scrollingTouchCancellationAssertion;
    self->_scrollingTouchCancellationAssertion = v4;
  }
  self->_showStackBorderWhenShowingPageControl = 1;
  [(SBHWidgetStackViewController *)self _setPageControlHidden:0 animated:1];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v13 = a3;
  scrollingTouchCancellationAssertion = self->_scrollingTouchCancellationAssertion;
  if (scrollingTouchCancellationAssertion)
  {
    [(BSInvalidatable *)scrollingTouchCancellationAssertion invalidate];
    uint64_t v8 = self->_scrollingTouchCancellationAssertion;
    self->_scrollingTouchCancellationAssertion = 0;
  }
  int64_t v9 = -[SBHWidgetStackViewController _newActiveWidgetIndexForContentOffset:](self, "_newActiveWidgetIndexForContentOffset:", a5->x, a5->y);
  [(UIPageControl *)self->_pageControl setCurrentPage:v9];
  long long v10 = [(SBHWidgetStackViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v11 = [(SBLeafIcon *)self->_icon iconDataSources];
    long long v12 = [v11 objectAtIndex:v9];
    [v10 widgetStackViewController:self didActivateDataSource:v12 fromUserInteraction:1];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v3 = a3;
  if ([v3 isScrollAnimating]) {
    [v3 stopScrollingAndZooming];
  }
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  [(SBHWidgetStackViewController *)self _updateActiveWidgetIndexAndScrollViewContentOffset];
  [(SBHWidgetStackViewController *)self _restartPageControlTimer];
  [(SBHWidgetStackViewController *)self _updateWidgetViewsWithAnimationUpdateMode:3];
}

- (void)customImageViewControllerWantsLabelHiddenDidChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v4 = SBLogWidgets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543874;
    int v19 = v6;
    __int16 v20 = 2048;
    double v21 = self;
    __int16 v22 = 2080;
    double v23 = "-[SBHWidgetStackViewController customImageViewControllerWantsLabelHiddenDidChange:]";
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = self->_customImageViewObservers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "customImageViewControllerWantsLabelHiddenDidChange:", self, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)widgetContainerViewControllerContentViewControllerDidActivate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogWidgets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v11 = 138543874;
    long long v12 = v7;
    __int16 v13 = 2048;
    long long v14 = self;
    __int16 v15 = 2080;
    long long v16 = "-[SBHWidgetStackViewController widgetContainerViewControllerContentViewControllerDidActivate:]";
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", (uint8_t *)&v11, 0x20u);
  }
  if ([(NSHashTable *)self->_containerViewControllersRequiringLayoutUponActivation containsObject:v4])
  {
    [(NSHashTable *)self->_containerViewControllersRequiringLayoutUponActivation removeObject:v4];
    uint64_t v8 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
    uint64_t v9 = [v8 allValues];
    int v10 = [v9 containsObject:v4];

    if (v10) {
      [(SBHWidgetStackViewController *)self _layoutWithAnimationUpdateMode:1];
    }
  }
}

- (void)widgetContainerViewControllerInitialWidgetContentReadinessChanged:(id)a3 widgetContentIsReady:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = SBLogWidgets();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138544130;
    uint64_t v17 = v9;
    __int16 v18 = 2048;
    int v19 = self;
    __int16 v20 = 2080;
    double v21 = "-[SBHWidgetStackViewController widgetContainerViewControllerInitialWidgetContentReadinessChanged:widgetContentIsReady:]";
    __int16 v22 = 1026;
    BOOL v23 = v4;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s. Widget content is ready? %{public}d", buf, 0x26u);
  }
  int v10 = self->_widgetContainerViewControllersToRemove;
  if ([(NSMutableDictionary *)v10 count])
  {
    if (v4) {
      int64_t v11 = 0;
    }
    else {
      int64_t v11 = 3000000000;
    }
    dispatch_time_t v12 = dispatch_time(0, v11);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __119__SBHWidgetStackViewController_widgetContainerViewControllerInitialWidgetContentReadinessChanged_widgetContentIsReady___block_invoke;
    block[3] = &unk_1E6AACDE0;
    block[4] = self;
    long long v14 = v10;
    id v15 = v6;
    dispatch_after(v12, MEMORY[0x1E4F14428], block);
  }
}

void __119__SBHWidgetStackViewController_widgetContainerViewControllerInitialWidgetContentReadinessChanged_widgetContentIsReady___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeWidgetContainerViewControllers:*(void *)(a1 + 40) animated:1];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1216);
  *(void *)(v2 + 1216) = 0;

  BOOL v4 = *(void **)(a1 + 48);
  if (v4)
  {
    id v5 = [v4 view];
    [v5 setHidden:0];
  }
}

- (void)widgetContainerViewControllerContentViewControllerDidUpdateStyleConfiguration:(id)a3
{
  id v4 = a3;
  if (self->_overlapping
    || (v8 = v4, BOOL v5 = [(BSUIScrollView *)self->_scrollView isScrolling], v4 = v8, v5)
    || (BOOL v6 = [(SBHWidgetStackViewController *)self _alwaysShowStackBorder], v4 = v8, v6))
  {
    if (self->_backgroundView) {
      goto LABEL_7;
    }
    id v8 = v4;
    [(SBHWidgetStackViewController *)self _createBackgroundViewIfNecessary:0];
    goto LABEL_6;
  }
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    [(SBHWidgetStackViewController *)self _teardownBackgroundView:backgroundView contactDelegate:1];
LABEL_6:
    id v4 = v8;
  }
LABEL_7:
}

- (void)_requireLayoutUponActivationForWidgetContainerViewController:(id)a3
{
  id v10 = a3;
  id v4 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  BOOL v5 = [v4 allValues];
  int v6 = [v5 containsObject:v10];

  if (v6)
  {
    containerViewControllersRequiringLayoutUponActivation = self->_containerViewControllersRequiringLayoutUponActivation;
    if (!containerViewControllersRequiringLayoutUponActivation)
    {
      id v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v9 = self->_containerViewControllersRequiringLayoutUponActivation;
      self->_containerViewControllersRequiringLayoutUponActivation = v8;

      containerViewControllersRequiringLayoutUponActivation = self->_containerViewControllersRequiringLayoutUponActivation;
    }
    [(NSHashTable *)containerViewControllersRequiringLayoutUponActivation addObject:v10];
  }
}

- (BOOL)_shouldHideWidgetWithUniqueIdentifier:(id)a3
{
  widgetContainerViewControllersToRemove = self->_widgetContainerViewControllersToRemove;
  id v4 = a3;
  BOOL v5 = [(NSMutableDictionary *)widgetContainerViewControllersToRemove allKeys];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)_createViewControllerForWidgetIfNecessary:(id)a3 usingIconImageInfo:(SBIconImageInfo *)a4
{
  uint64_t v7 = v6;
  uint64_t v8 = v5;
  uint64_t v9 = v4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  __int16 v13 = [v11 uniqueIdentifier];
  long long v14 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  uint64_t v15 = [v14 objectForKey:v13];
  if (v15)
  {
    long long v16 = (SBHWidgetContainerViewController *)v15;
    BOOL v17 = 0;
  }
  else
  {
    __int16 v18 = [WeakRetained widgetStackViewController:self viewControllerForDataSource:v11];
    if (v18 && !self->_widgetSnapshotAnimationCount)
    {
      int v19 = [(SBHWidgetStackViewController *)self widgetIcon];
      uint64_t v20 = [v19 gridSizeClass];

      uint64_t v21 = [WeakRetained widgetStackViewController:self containerApplicationNameForDataSource:v11];
      unsigned int v38 = [WeakRetained widgetStackViewController:self isDataSourceBlockedForScreenTimeExpiration:v11];
      v40 = (void *)v21;
      v41 = (void *)v20;
      __int16 v22 = -[SBHWidgetContainerViewController initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:applicationName:]([SBHWidgetContainerViewController alloc], "initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:applicationName:", v18, v11, v20, v21, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius);
      [(SBHWidgetContainerViewController *)v22 setDelegate:self];
      BOOL v23 = [(SBHWidgetStackViewController *)self overrideIconImageAppearance];
      [(SBHWidgetContainerViewController *)v22 setOverrideIconImageAppearance:v23];

      uint64_t v24 = [(SBHWidgetStackViewController *)self overrideIconImageStyleConfiguration];
      [(SBHWidgetContainerViewController *)v22 setOverrideIconImageStyleConfiguration:v24];

      double v25 = [(SBHWidgetContainerViewController *)v22 view];
      __int16 v26 = self->_scrollView;
      BOOL v27 = [(SBHWidgetStackViewController *)self _containerRequiresClippingToBoundsForWidget:v11];
      v37 = (void *)MEMORY[0x1E4FB1EB0];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __93__SBHWidgetStackViewController__createViewControllerForWidgetIfNecessary_usingIconImageInfo___block_invoke;
      v42[3] = &unk_1E6AB3708;
      id v28 = v25;
      id v43 = v28;
      uint64_t v46 = v9;
      uint64_t v47 = v8;
      v39 = v26;
      v44 = v39;
      uint64_t v48 = v7;
      long long v16 = v22;
      v45 = v16;
      BOOL v49 = v27;
      uint64_t v29 = v28;
      [v37 performWithoutAnimation:v42];
      objc_msgSend(v28, "setHidden:", -[SBHWidgetStackViewController _shouldHideWidgetWithUniqueIdentifier:](self, "_shouldHideWidgetWithUniqueIdentifier:", v13));
      [(SBHWidgetContainerViewController *)v16 setBlockedForScreenTimeExpiration:v38];
      [v14 setObject:v16 forKey:v13];
      [(BSUIScrollView *)self->_scrollView addSubview:v28];
      [(SBHWidgetContainerViewController *)v16 setPresentationMode:self->_presentationMode];
      uint64_t v30 = objc_opt_class();
      id v31 = v18;
      if (v30)
      {
        if (objc_opt_isKindOfClass()) {
          id v32 = v31;
        }
        else {
          id v32 = 0;
        }
      }
      else
      {
        id v32 = 0;
      }
      id v33 = v32;

      v34 = [v33 multiplexedViewController];

      if (!v34) {
        [(SBHWidgetStackViewController *)self _requireLayoutUponActivationForWidgetContainerViewController:v16];
      }

      BOOL v17 = 1;
    }
    else
    {
      BOOL v17 = 0;
      long long v16 = 0;
    }
  }
  id v35 = [(SBHWidgetContainerViewController *)v16 parentViewController];

  if (!v35) {
    [(SBHWidgetStackViewController *)self bs_addChildViewController:v16 withSuperview:self->_scrollView];
  }

  return v17;
}

uint64_t __93__SBHWidgetStackViewController__createViewControllerForWidgetIfNecessary_usingIconImageInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BSRectWithSize();
  objc_msgSend(v2, "setBounds:");
  id v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bounds];
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:");
  [*(id *)(a1 + 32) _setContinuousCornerRadius:*(double *)(a1 + 72)];
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 80);
  return [v4 setRequiresClippingToBounds:v5];
}

- (void)_createBackgroundViewIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(SBHWidgetStackViewController *)self _appearState]
    && !self->_backgroundView
    && (!v3
     || self->_overlapping
     || [(BSUIScrollView *)self->_scrollView isScrolling]
     || [(SBHWidgetStackViewController *)self _alwaysShowStackBorder]))
  {
    uint64_t v5 = SBLogWidgets();
    if (os_signpost_enabled(v5))
    {
      uint64_t v6 = NSString;
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = [v6 stringWithFormat:@"<%@: %p>", v8, self];
      *(_DWORD *)buf = 138543362;
      long long v14 = v9;
      _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_CREATE_BACKGROUND", "%{public}@", buf, 0xCu);
    }
    id v10 = [(SBHWidgetStackViewController *)self _createBackgroundView];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v10;

    if (self->_backgroundView)
    {
      [(SBHWidgetStackViewController *)self _configureBackgroundViewIfNecessary];
      [(UIView *)self->_containerView insertSubview:self->_backgroundView atIndex:0];
      [(SBHWidgetStackViewController *)self _updateBackgroundViewWithAnimationUpdateMode:1 allowingOutsetting:0];
    }
    dispatch_time_t v12 = SBLogWidgets();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_CREATE_BACKGROUND", " isAnimation=YES ", buf, 2u);
    }
  }
}

- (id)_createBackgroundView
{
  id backgroundViewProvider = (void (**)(id, SEL))self->_backgroundViewProvider;
  if (backgroundViewProvider) {
    backgroundViewProvider[2](backgroundViewProvider, a2);
  }
  else {
  uint64_t v4 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:3];
  }
  [v4 setClipsToBounds:!self->_showsSquareCorners];
  [v4 setAutoresizingMask:18];
  return v4;
}

- (void)_teardownBackgroundView:(id)a3 contactDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (UIView *)a3;
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v9 = v6;
  if (self->_backgroundView != v6)
  {
    if (!v4) {
      goto LABEL_9;
    }
LABEL_6:
    uint64_t v7 = [(SBHWidgetStackViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 widgetStackViewController:self didFinishUsingBackgroundView:v9];
    }

    goto LABEL_9;
  }
  self->_backgroundView = 0;

  if (v4) {
    goto LABEL_6;
  }
LABEL_9:
  uint64_t v8 = [(SBHWidgetStackViewController *)self view];
  if ([(UIView *)v9 isDescendantOfView:v8]) {
    [(UIView *)v9 removeFromSuperview];
  }

  uint64_t v6 = v9;
LABEL_12:
}

- (void)discardAllWidgetViewControllers
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __63__SBHWidgetStackViewController_discardAllWidgetViewControllers__block_invoke;
  v2[3] = &unk_1E6AB3730;
  v2[4] = self;
  [(SBHWidgetStackViewController *)self enumerateWidgetContainerViewControllersForListLayoutProviderUsingBlock:v2];
}

void __63__SBHWidgetStackViewController_discardAllWidgetViewControllers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 _removeWidgetContainerViewControllers:v3 animated:0];
  [v3 removeAllObjects];
}

- (BOOL)_containerRequiresClippingToBoundsForWidget:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_layoutWithAnimationUpdateMode:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogWidgets();
  if (os_signpost_enabled(v5))
  {
    uint64_t v6 = NSString;
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = SBStringFromAnimationUpdateMode();
    id v10 = [v6 stringWithFormat:@"<%@: %p updateMode: %@>", v8, self, v9];
    *(_DWORD *)buf = 138543362;
    __int16 v13 = v10;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK", "updateMode=%{public}@", buf, 0xCu);
  }
  if ([MEMORY[0x1E4FB1EB0] _isInRetargetableAnimationBlock]) {
    a3 = 1;
  }
  [(SBHWidgetStackViewController *)self _updateBackgroundViewWithAnimationUpdateMode:a3];
  [(SBHWidgetStackViewController *)self _updateWidgetViewsWithAnimationUpdateMode:a3];
  [(SBHWidgetStackViewController *)self _updateWidgetViewClippingAndBackgroundView];
  [(SBHWidgetStackViewController *)self _updateWidgetViewHitTesting];
  [(SBHWidgetStackViewController *)self _updateWidgetViewEdgeAntialiasing];
  [(SBHWidgetStackViewController *)self _updateScrollViewDelaysContentTouches];
  [(SBHWidgetStackViewController *)self _updatePageControlWithAnimationUpdateMode:a3];
  id v11 = SBLogWidgets();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK", " isAnimation=YES ", buf, 2u);
  }
}

- (void)_updateWidgetViewsWithAnimationUpdateMode:(int64_t)a3
{
  BOOL v4 = self;
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  if (![(NSHashTable *)self->_imageUpdateDisableAssertions count])
  {
    uint64_t v5 = SBLogWidgets();
    v103 = v4;
    if (os_signpost_enabled(v5))
    {
      uint64_t v6 = NSString;
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = SBStringFromAnimationUpdateMode();
      id v10 = [v6 stringWithFormat:@"<%@: %p updateMode: %@>", v8, v103, v9];
      LODWORD(buf.a) = 138543362;
      *(void *)((char *)&buf.a + 4) = v10;
      _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_WIDGET_VIEWS", "updateMode=%{public}@", (uint8_t *)&buf, 0xCu);

      BOOL v4 = v103;
    }

    [(SBHWidgetStackViewController *)v4 iconImageInfo];
    double v85 = v12;
    double v86 = v11;
    double v87 = v14;
    double v88 = v13;
    BSRectWithSize();
    double v16 = v15;
    double v18 = v17;
    int v19 = [(SBLeafIcon *)v4->_icon iconDataSources];
    uint64_t v98 = [v19 indexOfObject:v4->_activeWidget];

    [(BSUIScrollView *)v4->_scrollView contentOffset];
    long double v89 = v20;
    [(SBHWidgetStackViewController *)v4 _restingContentOffset];
    long double v22 = v21;
    BSRectWithSize();
    double v96 = v24;
    double v97 = v23;
    double v94 = v26;
    double v95 = v25;
    double continuousCornerRadius = v4->_iconImageInfo.continuousCornerRadius;
    BOOL v27 = [(SBHWidgetStackViewController *)v4 _effectiveWidgetContainerViewControllers];
    v102 = [(SBLeafIcon *)v4->_icon iconDataSources];
    uint64_t v28 = [v102 count];
    if ([(SBHWidgetStackViewController *)v4 _appearState]) {
      LOBYTE(v101) = 0;
    }
    else {
      int v101 = ![(SBHWidgetStackViewController *)v4 forcesVisible];
    }
    v91 = v27;
    if (v28)
    {
      double v29 = -46.0 / v16 + 1.0;
      uint64_t v90 = v28 - 1;
      uint64_t v30 = -1;
      if (v89 > v22) {
        uint64_t v30 = 1;
      }
      uint64_t v99 = v30;
      double v31 = v16 * 0.5;
      double v83 = v18 * 0.5 + v22;
      double v80 = -6.0 / v16 + 1.0;
      double v81 = (v16 + -1.0) / v16;
      uint64_t v32 = 0;
      double v33 = fabs(fmod(v89, v22));
      double v34 = vabdd_f64(v33, v22);
      if (v33 > v22 * 0.5) {
        double v33 = v34;
      }
      double v82 = v33;
      int64_t v84 = a3;
      uint64_t v100 = v28;
      while (1)
      {
        uint64_t v35 = v32 - v98;
        if (v28 != 1)
        {
          if (v98 || v90 != v32)
          {
            if (v32) {
              BOOL v36 = 0;
            }
            else {
              BOOL v36 = v98 == v90;
            }
            if (v36) {
              uint64_t v35 = 1;
            }
          }
          else
          {
            uint64_t v35 = -1;
          }
        }
        BOOL v37 = v35 && v28 == 2;
        uint64_t v38 = v37 ? v99 : v35;
        uint64_t v39 = [(SBHWidgetStackViewController *)v4 _showAdjacentWidgets];
        uint64_t v40 = v39 << 63 >> 63;
        uint64_t v41 = v39;
        v42 = [v102 objectAtIndex:v32];
        id v43 = [v42 uniqueIdentifier];
        BOOL v44 = v38 >= v40 && v38 <= v41;
        char v45 = v44 ? v101 : 1;
        if ((v45 & 1) == 0) {
          break;
        }
        uint64_t v46 = [v27 objectForKey:v43];
        uint64_t v47 = v46;
        if (v46)
        {
          [v46 setUserVisibilityStatus:1];
          [(SBHWidgetStackViewController *)v4 bs_removeChildViewController:v47];
          uint64_t v28 = v100;
          if (![(BSUIScrollView *)v4->_scrollView isScrolling])
          {
            [v27 removeObjectForKey:v43];
            uint64_t v48 = [(SBHWidgetStackViewController *)v4 delegate];
            if (objc_opt_respondsToSelector())
            {
              BOOL v49 = [v47 widgetViewController];
              [v48 widgetStackViewController:v4 didRemoveViewController:v49];
              goto LABEL_72;
            }
            goto LABEL_73;
          }
        }
        else
        {
          uint64_t v28 = v100;
        }
LABEL_74:

        if (v28 == ++v32) {
          goto LABEL_75;
        }
      }
      if (-[SBHWidgetStackViewController _createViewControllerForWidgetIfNecessary:usingIconImageInfo:](v4, "_createViewControllerForWidgetIfNecessary:usingIconImageInfo:", v42, v88, v87, v86, v85))
      {
        int64_t v50 = 1;
      }
      else
      {
        int64_t v50 = a3;
      }
      uint64_t v47 = [v27 objectForKey:v43];
      uint64_t v48 = [v47 view];
      double v51 = v83 + v18 * (double)v38;
      uint64_t v52 = [(SBHWidgetStackViewController *)v4 _containerRequiresClippingToBoundsForWidget:v42];
      [v48 center];
      double v54 = v53;
      double v56 = v55;
      [v48 bounds];
      v119.origin.double y = v96;
      v119.origin.double x = v97;
      v119.size.height = v94;
      v119.size.width = v95;
      BOOL v57 = CGRectEqualToRect(v118, v119);
      [v48 _continuousCornerRadius];
      double v59 = v58;
      int v60 = [v47 requiresClippingToBounds];
      if (v54 != v31 || v56 != v51) {
        objc_msgSend(v48, "setCenter:", v31, v51);
      }
      if (!v57) {
        objc_msgSend(v48, "setBounds:", v97, v96, v95, v94);
      }
      if (vabdd_f64(v59, continuousCornerRadius) >= 2.22044605e-16) {
        [v48 _setContinuousCornerRadius:continuousCornerRadius];
      }
      BOOL v4 = v103;
      if (v52 != v60) {
        [v47 setRequiresClippingToBounds:v52];
      }
      double v61 = (v29 + -1.0) * vabdd_f64(v51 - v18 * 0.5, v89) / v18 + 1.0;
      if (v29 >= v61) {
        double v61 = v29;
      }
      double v62 = fmin(v61, 1.0);
      if ([(SBHWidgetStackViewController *)v103 _insetWidgetsForTrackingAppearance])
      {
        double v63 = v80 * v62;
      }
      else if (v103->_overlapping)
      {
        double v63 = v81;
      }
      else
      {
        double v63 = v62;
      }
      if ([(SBHWidgetStackViewController *)v103 isOverlapping]) {
        double v64 = 0.75;
      }
      else {
        double v64 = 1.0;
      }
      BOOL v49 = [(SBHWidgetStackViewController *)v103 _backgroundColorForWidgetWithDistanceFromRestingContentOffset:v82];
      [v49 alphaComponent];
      double v66 = v65;
      memset(&buf, 0, sizeof(buf));
      CGAffineTransformMakeScale(&buf, v63, v63);
      int64_t v92 = v50;
      if (v48) {
        [v48 transform];
      }
      else {
        memset(&t2, 0, sizeof(t2));
      }
      CGAffineTransform t1 = buf;
      BOOL v67 = CGAffineTransformEqualToTransform(&t1, &t2);
      BOOL v68 = !v67;
      [v48 alpha];
      double v70 = vabdd_f64(v69, v66);
      BOOL v71 = v70 >= 2.22044605e-16;
      if (!v67 || v70 >= 2.22044605e-16)
      {
        if (!v67) {
          [(SBHWidgetStackViewController *)v103 _incrementWidgetScaleAnimationCount];
        }
        v72 = (void *)MEMORY[0x1E4FB1EB0];
        animationSettings = v103->_animationSettings;
        v108[0] = MEMORY[0x1E4F143A8];
        v108[1] = 3221225472;
        v108[2] = __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke;
        v108[3] = &unk_1E6AB3758;
        BOOL v112 = v68;
        id v109 = v48;
        CGAffineTransform v110 = buf;
        BOOL v113 = v71;
        double v111 = v64;
        v106[0] = MEMORY[0x1E4F143A8];
        v106[1] = 3221225472;
        v106[2] = __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke_2;
        v106[3] = &unk_1E6AB3780;
        BOOL v107 = v68;
        v106[4] = v103;
        v74 = animationSettings;
        BOOL v4 = v103;
        objc_msgSend(v72, "sb_animateWithSettings:mode:animations:completion:", v74, v92, v108, v106);
      }
      a3 = v84;
      uint64_t v28 = v100;
LABEL_72:

      BOOL v27 = v91;
LABEL_73:

      goto LABEL_74;
    }
LABEL_75:
    v75 = objc_msgSend(v102, "bs_map:", &__block_literal_global_60);
    v104[0] = MEMORY[0x1E4F143A8];
    v104[1] = 3221225472;
    v104[2] = __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke_4;
    v104[3] = &unk_1E6AB37C8;
    id v105 = v75;
    id v76 = v75;
    v77 = objc_msgSend(v27, "bs_filter:", v104);
    v78 = (void *)[v77 mutableCopy];

    [(SBHWidgetStackViewController *)v4 _removeWidgetContainerViewControllers:v78 animated:a3 != 2];
    v79 = SBLogWidgets();
    if (os_signpost_enabled(v79))
    {
      LOWORD(buf.a) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v79, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_WIDGET_VIEWS", " isAnimation=YES ", (uint8_t *)&buf, 2u);
    }

    [(SBHWidgetStackViewController *)v4 _updateVisiblySettledForWidgetViewControllers];
    [(SBHWidgetStackViewController *)v4 _updatePresentationModeForWidgetViewControllers];
    [(SBHWidgetStackViewController *)v4 _updateShowsSnapshotWhenDeactivatedForWidgetViewControllers];
    [(SBHWidgetStackViewController *)v4 _updatePauseReasonForWidgetViewControllers];
    [(SBHWidgetStackViewController *)v4 _updateApproximateLayoutPositionForWidgetViewControllers];
  }
}

uint64_t __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 96))
  {
    uint64_t v2 = *(void **)(result + 32);
    long long v3 = *(_OWORD *)(v1 + 56);
    v4[0] = *(_OWORD *)(v1 + 40);
    v4[1] = v3;
    v4[2] = *(_OWORD *)(v1 + 72);
    CGRect result = [v2 setTransform:v4];
  }
  if (*(unsigned char *)(v1 + 97)) {
    return [*(id *)(v1 + 32) setAlpha:*(double *)(v1 + 88)];
  }
  return result;
}

uint64_t __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _decrementWidgetScaleAnimationCount];
  }
  return result;
}

uint64_t __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

uint64_t __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)_updateBackgroundViewWithAnimationUpdateMode:(int64_t)a3
{
}

- (void)_updateBackgroundViewWithAnimationUpdateMode:(int64_t)a3 allowingOutsetting:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = SBLogWidgets();
  if (os_signpost_enabled(v7))
  {
    uint64_t v8 = NSString;
    uint64_t v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    double v11 = SBStringFromAnimationUpdateMode();
    double v12 = [v8 stringWithFormat:@"<%@: %p updateMode: %@>", v10, self, v11];
    *(_DWORD *)CGAffineTransform buf = 138543362;
    v128 = v12;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_BACKGROUND", "updateMode=%{public}@", buf, 0xCu);
  }
  int64_t v90 = a3;

  [(SBHWidgetStackViewController *)self _createBackgroundViewIfNecessary:1];
  BOOL v13 = [(SBHWidgetStackViewController *)self _alwaysShowStackBorder];
  BOOL v14 = [(SBHWidgetStackViewController *)self isOverlapping];
  double v15 = [(SBHWidgetStackViewController *)self view];
  [v15 bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double v21 = v20;
  double v23 = v22;

  [(SBHWidgetStackViewController *)self iconImageInfo];
  BSRectWithSize();
  double v25 = v24;
  double v27 = v26;
  [(SBHWidgetStackViewController *)self iconImageInfo];
  double v29 = v28;
  unint64_t v30 = [(SBHWidgetStackViewController *)self imageViewAlignment];
  double v31 = self->_containerView;
  uint64_t v32 = self->_backgroundView;
  int v101 = self->_scrollView;
  uint64_t v100 = self->_dimmingView;
  double v97 = v25;
  if ([(SBHWidgetStackViewController *)self isOverlapping] && v4)
  {
    double v33 = v21 + 16.0;
    double v34 = v23 + 16.0;
    double v29 = v29 + 8.0;
  }
  else
  {
    BOOL v35 = [(SBHWidgetStackViewController *)self _insetWidgetsForTrackingAppearance];
    double v34 = v23;
    double v33 = v21;
    if (v35 && v4)
    {
      double v36 = 1.0 - 6.0 / v21;
      double v33 = v21 * v36 + 6.0;
      double v34 = v23 * v36 + 6.0;
      double v29 = v29 * v36 + 3.0;
    }
  }
  int v37 = !v13 || v14 || !v4;
  if (v37)
  {
    double v38 = v34;
  }
  else
  {
    double v29 = v29 + 3.0;
    double v38 = v34 + 6.0;
  }
  if (v37) {
    double v39 = v33;
  }
  else {
    double v39 = v33 + 6.0;
  }
  UIRectGetCenter();
  double v98 = v40;
  double v94 = v41;
  double v96 = v27;
  double v42 = -((v23 - v27) * 0.5);
  if (v30) {
    double v42 = (v23 - v27) * 0.5;
  }
  double v92 = v42;
  if ([(SBHWidgetStackViewController *)self showsSquareCorners]) {
    double v43 = 0.0;
  }
  else {
    double v43 = v29;
  }
  UIRectGetCenter();
  double v45 = v44;
  double v47 = v46;
  UIRectGetCenter();
  double v49 = v48;
  double v91 = v50;
  [(UIView *)v31 center];
  double v87 = v47;
  double v88 = v45;
  BOOL v53 = v52 == v47;
  double v54 = v43;
  BOOL v55 = !v53 || v51 != v45;
  [(UIView *)v31 bounds];
  v132.origin.double x = v17;
  v132.origin.double y = v19;
  v132.size.width = v39;
  v132.size.height = v38;
  BOOL v56 = CGRectEqualToRect(v130, v132);
  [(UIView *)v31 _continuousCornerRadius];
  double v58 = vabdd_f64(v57, v43);
  uint64_t v99 = v32;
  double v89 = v49;
  if (v32)
  {
    [(UIView *)v32 center];
    BOOL v60 = v59 != v49;
    double v61 = v91;
    double v62 = v32;
    LODWORD(v32) = v63 != v91 || v60;
    [(UIView *)v62 bounds];
    v133.origin.double x = v17;
    v133.origin.double y = v19;
    v133.size.width = v39;
    v133.size.height = v38;
    BOOL v64 = !CGRectEqualToRect(v131, v133);
    [(UIView *)v62 _continuousCornerRadius];
    BOOL v66 = vabdd_f64(v65, v43) > 2.22044605e-16;
  }
  else
  {
    BOOL v64 = 0;
    BOOL v66 = 0;
    double v61 = v91;
  }
  BOOL v67 = v31;
  int v68 = !v56;
  double v69 = v94 + v92;
  if (v100)
  {
    [(UIView *)v100 _continuousCornerRadius];
    BOOL v71 = vabdd_f64(v70, v54) > 2.22044605e-16;
  }
  else
  {
    BOOL v71 = 0;
  }
  [(BSUIScrollView *)v101 center];
  BOOL v74 = v73 != v69 || v72 != v98;
  int v75 = v55 | v68;
  if (v58 > 2.22044605e-16) {
    int v75 = 1;
  }
  if (((v75 | v32 | v64) & 1) != 0 || v66 || v71 || v74)
  {
    [(SBHWidgetStackViewController *)self _incrementBackgroundAnimationCount];
    animationSettings = self->_animationSettings;
    double v95 = (void *)MEMORY[0x1E4FB1EB0];
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __96__SBHWidgetStackViewController__updateBackgroundViewWithAnimationUpdateMode_allowingOutsetting___block_invoke;
    v103[3] = &unk_1E6AAFDC0;
    BOOL v119 = v55;
    v104 = v67;
    double v108 = v88;
    double v109 = v87;
    char v120 = v68;
    CGFloat v110 = v17;
    CGFloat v111 = v19;
    double v112 = v39;
    double v113 = v38;
    BOOL v121 = v58 > 2.22044605e-16;
    double v114 = v54;
    char v122 = (char)v32;
    id v105 = v99;
    double v115 = v89;
    double v116 = v61;
    BOOL v123 = v64;
    BOOL v124 = v66;
    BOOL v125 = v71;
    v106 = v100;
    BOOL v126 = v74;
    BOOL v107 = v101;
    double v117 = v98;
    double v118 = v69;
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __96__SBHWidgetStackViewController__updateBackgroundViewWithAnimationUpdateMode_allowingOutsetting___block_invoke_2;
    v102[3] = &unk_1E6AAFF28;
    v102[4] = self;
    objc_msgSend(v95, "sb_animateWithSettings:mode:animations:completion:", animationSettings, v90, v103, v102);
  }
  [(BSUIScrollView *)self->_scrollView bounds];
  if (v77 != v97 || v76 != v96)
  {
    [(BSUIScrollView *)self->_scrollView bounds];
    -[BSUIScrollView setBounds:](self->_scrollView, "setBounds:");
  }
  [(SBHWidgetStackViewController *)self _scrollViewContentSize];
  double v79 = v78;
  double v81 = v80;
  [(BSUIScrollView *)self->_scrollView contentSize];
  if (v83 != v79 || v82 != v81)
  {
    -[BSUIScrollView setContentSize:](self->_scrollView, "setContentSize:", v79, v81);
    scrollView = self->_scrollView;
    [(SBHWidgetStackViewController *)self _restingContentOffset];
    -[BSUIScrollView setContentOffset:](scrollView, "setContentOffset:");
  }
  int64_t v85 = [(SBLeafIcon *)self->_icon iconDataSourceCount];
  if (v85 > 1 != [(BSUIScrollView *)self->_scrollView isScrollEnabled]) {
    [(BSUIScrollView *)self->_scrollView setScrollEnabled:v85 > 1];
  }
  [(SBHWidgetStackViewController *)self _configureBackgroundViewIfNecessary];
  double v86 = SBLogWidgets();
  if (os_signpost_enabled(v86))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v86, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_BACKGROUND", " isAnimation=YES ", buf, 2u);
  }
}

uint64_t __96__SBHWidgetStackViewController__updateBackgroundViewWithAnimationUpdateMode_allowingOutsetting___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 152)) {
    CGRect result = objc_msgSend(*(id *)(result + 32), "setCenter:", *(double *)(result + 64), *(double *)(result + 72));
  }
  if (*(unsigned char *)(v1 + 153)) {
    CGRect result = objc_msgSend(*(id *)(v1 + 32), "setBounds:", *(double *)(v1 + 80), *(double *)(v1 + 88), *(double *)(v1 + 96), *(double *)(v1 + 104));
  }
  if (*(unsigned char *)(v1 + 154)) {
    CGRect result = [*(id *)(v1 + 32) _setContinuousCornerRadius:*(double *)(v1 + 112)];
  }
  if (*(unsigned char *)(v1 + 155)) {
    CGRect result = objc_msgSend(*(id *)(v1 + 40), "setCenter:", *(double *)(v1 + 120), *(double *)(v1 + 128));
  }
  if (*(unsigned char *)(v1 + 156)) {
    CGRect result = objc_msgSend(*(id *)(v1 + 40), "setBounds:", *(double *)(v1 + 80), *(double *)(v1 + 88), *(double *)(v1 + 96), *(double *)(v1 + 104));
  }
  if (*(unsigned char *)(v1 + 157)) {
    CGRect result = [*(id *)(v1 + 40) _setContinuousCornerRadius:*(double *)(v1 + 112)];
  }
  if (*(unsigned char *)(v1 + 158)) {
    CGRect result = [*(id *)(v1 + 48) _setContinuousCornerRadius:*(double *)(v1 + 112)];
  }
  if (*(unsigned char *)(v1 + 159))
  {
    uint64_t v2 = *(void **)(v1 + 56);
    double v3 = *(double *)(v1 + 136);
    double v4 = *(double *)(v1 + 144);
    return objc_msgSend(v2, "setCenter:", v3, v4);
  }
  return result;
}

uint64_t __96__SBHWidgetStackViewController__updateBackgroundViewWithAnimationUpdateMode_allowingOutsetting___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementBackgroundAnimationCount];
}

- (void)_updatePageControlWithAnimationUpdateMode:(int64_t)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if ([(SBHWidgetStackViewController *)self _appearState])
  {
    uint64_t v5 = SBLogWidgets();
    if (os_signpost_enabled(v5))
    {
      uint64_t v6 = NSString;
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = SBStringFromAnimationUpdateMode();
      id v10 = [v6 stringWithFormat:@"<%@: %p updateMode: %@>", v8, self, v9];
      LODWORD(buf.a) = 138543362;
      *(void *)((char *)&buf.a + 4) = v10;
      _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_PAGE_CONTROL", "updateMode=%{public}@", (uint8_t *)&buf, 0xCu);
    }
    unint64_t v11 = [(SBLeafIcon *)self->_icon iconDataSourceCount];
    if (v11 == [(UIPageControl *)self->_pageControl numberOfPages]) {
      int64_t v12 = a3;
    }
    else {
      int64_t v12 = 2;
    }
    BOOL v13 = self->_pageControl;
    BOOL v14 = [(SBHWidgetStackViewController *)self _pageControlIsHorizontallyConstrained];
    BOOL v15 = [(SBHWidgetStackViewController *)self _alwaysShowStackBorder];
    double v16 = [(SBHWidgetStackViewController *)self view];
    [v16 bounds];
    double v18 = v17;
    double v20 = v19;

    CGFloat v21 = *MEMORY[0x1E4F1DAD8];
    CGFloat v22 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(UIPageControl *)v13 sizeForNumberOfPages:v11];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    double v27 = v23 * 0.25;
    double v28 = 0.0;
    double v29 = 3.0;
    if (!v15) {
      double v29 = 0.0;
    }
    double v30 = v29 + v27;
    if (v14) {
      double v28 = 2.0;
    }
    double v31 = v30 - v28;
    if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
      double v32 = -v31;
    }
    else {
      double v32 = v18 + v31;
    }
    double v33 = v20 * 0.5;
    memset(&buf, 0, sizeof(buf));
    CGAffineTransformMakeScale(&buf, 0.65, 0.65);
    [(UIPageControl *)self->_pageControl center];
    BOOL v36 = v33 != v35 || v32 != v34;
    int64_t v37 = [(UIPageControl *)self->_pageControl numberOfPages];
    BOOL v38 = v37 != v11;
    pageControl = self->_pageControl;
    if (pageControl) {
      [(UIPageControl *)pageControl transform];
    }
    else {
      memset(&t2, 0, sizeof(t2));
    }
    CGAffineTransform t1 = buf;
    BOOL v40 = !CGAffineTransformEqualToTransform(&t1, &t2);
    [(UIPageControl *)v13 bounds];
    v65.origin.double x = v21;
    v65.origin.double y = v22;
    v65.size.width = v24;
    v65.size.height = v26;
    BOOL v41 = !CGRectEqualToRect(v64, v65);
    if (v36 || v37 != v11 || v40 || v41)
    {
      double v43 = (void *)MEMORY[0x1E4FB1EB0];
      animationSettings = self->_animationSettings;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __74__SBHWidgetStackViewController__updatePageControlWithAnimationUpdateMode___block_invoke;
      v46[3] = &unk_1E6AB37F0;
      BOOL v56 = v38;
      double v47 = v13;
      unint64_t v48 = v11;
      BOOL v57 = v41;
      CGFloat v49 = v21;
      CGFloat v50 = v22;
      CGFloat v51 = v24;
      CGFloat v52 = v26;
      BOOL v58 = v40;
      CGAffineTransform v53 = buf;
      BOOL v59 = v36;
      double v54 = v32;
      double v55 = v33;
      objc_msgSend(v43, "sb_animateWithSettings:mode:animations:completion:", animationSettings, v12, v46, 0);
      double v45 = SBLogWidgets();
      if (os_signpost_enabled(v45))
      {
        LOWORD(t1.a) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_PAGE_CONTROL", " isAnimation=YES ", (uint8_t *)&t1, 2u);
      }

      p_super = &v47->super.super.super.super;
    }
    else
    {
      p_super = SBLogWidgets();
      if (os_signpost_enabled(p_super))
      {
        LOWORD(t1.a) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D7F0A000, p_super, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_PAGE_CONTROL", " isAnimation=YES ", (uint8_t *)&t1, 2u);
      }
    }
  }
}

uint64_t __74__SBHWidgetStackViewController__updatePageControlWithAnimationUpdateMode___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 144)) {
    [*(id *)(a1 + 32) setNumberOfPages:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 145)) {
    objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  if (*(unsigned char *)(a1 + 146))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    long long v3 = *(_OWORD *)(a1 + 96);
    v5[0] = *(_OWORD *)(a1 + 80);
    v5[1] = v3;
    v5[2] = *(_OWORD *)(a1 + 112);
    [v2 setTransform:v5];
  }
  if (*(unsigned char *)(a1 + 147)) {
    objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 128), *(double *)(a1 + 136));
  }
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (id)_effectiveWidgetContainerViewControllers
{
  return [(SBHWidgetStackViewController *)self _widgetContainerViewControllersForListLayoutProvider:self->_listLayoutProvider];
}

- (id)_widgetContainerViewControllersForListLayoutProvider:(id)a3
{
  id v4 = a3;
  if (!self->_widgetContainerViewControllersForLayoutOptions)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    widgetContainerViewControllersForLayoutOptions = self->_widgetContainerViewControllersForLayoutOptions;
    self->_widgetContainerViewControllersForLayoutOptions = v5;
  }
  uint64_t v7 = _SBHLayoutOptionsKeyTypeForListLayoutProvider(v4);
  uint64_t v8 = [(NSMutableDictionary *)self->_widgetContainerViewControllersForLayoutOptions objectForKey:v7];
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_widgetContainerViewControllersForLayoutOptions setObject:v8 forKey:v7];
  }

  return v8;
}

- (void)enumerateWidgetContainerViewControllersForListLayoutProviderUsingBlock:(id)a3
{
  id v4 = a3;
  widgetContainerViewControllersForLayoutOptions = self->_widgetContainerViewControllersForLayoutOptions;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__SBHWidgetStackViewController_enumerateWidgetContainerViewControllersForListLayoutProviderUsingBlock___block_invoke;
  v7[3] = &unk_1E6AB3818;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)widgetContainerViewControllersForLayoutOptions enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __103__SBHWidgetStackViewController_enumerateWidgetContainerViewControllersForListLayoutProviderUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGSize)_scrollViewContentSize
{
  [(SBHWidgetStackViewController *)self _pageSize];
  double v4 = v3 * 3.0;
  result.height = v4;
  result.width = v2;
  return result;
}

- (CGPoint)_restingContentOffset
{
  [(SBHWidgetStackViewController *)self _pageSize];
  double v4 = v3;
  [(SBHWidgetStackViewController *)self _scrollViewContentSize];
  double v6 = v4 * (double)(uint64_t)round((v5 - v4) * 0.5 / v4);
  double v7 = 0.0;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (id)_backgroundColorForWidgetWithDistanceFromRestingContentOffset:(double)a3
{
  double v3 = fmin(fmax(a3 / 60.0, 0.0), 0.3);
  if ([(SBHWidgetStackViewController *)self _alwaysShowStackBorder]) {
    double v3 = v3 + 0.2;
  }
  double v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  double v5 = [v4 colorWithAlphaComponent:v3];

  return v5;
}

- (BOOL)_pageControlIsHorizontallyConstrained
{
  unint64_t v2 = SBHScreenTypeForCurrentDevice();
  return (v2 > 0x2F) | (0x4451411uLL >> v2) & 1;
}

- (void)_setPageControlHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(SBHWidgetStackViewController *)self _alwaysShowStackPageControl]
    || (double v7 = 0.0, !a3))
  {
    pageControlHidingTimer = self->_pageControlHidingTimer;
    double v7 = 1.0;
    if (pageControlHidingTimer)
    {
      [(NSTimer *)pageControlHidingTimer invalidate];
      uint64_t v9 = self->_pageControlHidingTimer;
      self->_pageControlHidingTimer = 0;
    }
  }
  id v10 = self->_pageControl;
  [(UIPageControl *)v10 alpha];
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    if (v4) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 2;
    }
    int64_t v12 = (void *)MEMORY[0x1E4FB1EB0];
    animationSettings = self->_animationSettings;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __63__SBHWidgetStackViewController__setPageControlHidden_animated___block_invoke;
    double v17 = &unk_1E6AAC838;
    double v18 = v10;
    double v19 = v7;
    objc_msgSend(v12, "sb_animateWithSettings:mode:animations:completion:", animationSettings, v11, &v14, 0);
    -[SBHWidgetStackViewController _layoutWithAnimationUpdateMode:](self, "_layoutWithAnimationUpdateMode:", v11, v14, v15, v16, v17);
  }
}

uint64_t __63__SBHWidgetStackViewController__setPageControlHidden_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)_restartPageControlTimer
{
}

- (void)_restartPageControlTimerWithTimeInterval:(double)a3
{
  pageControlHidingTimer = self->_pageControlHidingTimer;
  if (pageControlHidingTimer)
  {
    [(NSTimer *)pageControlHidingTimer invalidate];
    double v6 = self->_pageControlHidingTimer;
    self->_pageControlHidingTimer = 0;
  }
  objc_initWeak(&location, self);
  double v7 = (void *)MEMORY[0x1E4F1CB00];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__SBHWidgetStackViewController__restartPageControlTimerWithTimeInterval___block_invoke;
  v10[3] = &unk_1E6AAFD28;
  objc_copyWeak(&v11, &location);
  id v8 = [v7 scheduledTimerWithTimeInterval:0 repeats:v10 block:a3];
  uint64_t v9 = self->_pageControlHidingTimer;
  self->_pageControlHidingTimer = v8;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __73__SBHWidgetStackViewController__restartPageControlTimerWithTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setShowStackBorderWhenShowingPageControl:0];
    [v3 _setPageControlHidden:1 animated:1];
    unint64_t v2 = [v3 pageControlHidingTimer];
    [v2 invalidate];

    [v3 setPageControlHidingTimer:0];
    id WeakRetained = v3;
  }
}

- (int64_t)_newActiveWidgetIndexForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  [(SBHWidgetStackViewController *)self _pageSize];
  double v6 = v5;
  [(SBHWidgetStackViewController *)self _restingContentOffset];
  double v8 = (y - v7) / v6;
  uint64_t v9 = [(SBLeafIcon *)self->_icon iconDataSources];
  uint64_t v10 = [v9 indexOfObject:self->_activeWidget];

  uint64_t v11 = (uint64_t)(round(v8) + (double)v10);
  int64_t v12 = [(SBLeafIcon *)self->_icon iconDataSourceCount];
  if (v12 <= v11) {
    int64_t v13 = 0;
  }
  else {
    int64_t v13 = v11;
  }
  if (v11 >= 0) {
    return v13;
  }
  else {
    return v12 - 1;
  }
}

- (void)_updateActiveWidgetIndexAndScrollViewContentOffset
{
  [(BSUIScrollView *)self->_scrollView contentOffset];
  long double v4 = v3;
  unint64_t v5 = -[SBHWidgetStackViewController _newActiveWidgetIndexForContentOffset:](self, "_newActiveWidgetIndexForContentOffset:");
  id v19 = [(SBLeafIcon *)self->_icon iconDataSources];
  unint64_t v6 = [v19 count];
  if (v5 < v6)
  {
    double v7 = [v19 objectAtIndex:v5];
    activeWidget = self->_activeWidget;
    self->_activeWidget = v7;
  }
  if ([(UIPageControl *)self->_pageControl numberOfPages] != v6) {
    [(UIPageControl *)self->_pageControl setNumberOfPages:v6];
  }
  if ([(UIPageControl *)self->_pageControl currentPage] != v5) {
    [(UIPageControl *)self->_pageControl setCurrentPage:v5];
  }
  [(SBHWidgetStackViewController *)self _pageSize];
  long double v10 = v9;
  [(SBHWidgetStackViewController *)self _restingContentOffset];
  double v12 = v11;
  double v14 = v13;
  double v15 = fmod(v4, v10);
  double v16 = 0.0;
  if (v15 > v10 * 0.5) {
    double v16 = v10;
  }
  -[BSUIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v12, v14 + v15 - v16);
  double v17 = [(SBHWidgetStackViewController *)self view];
  [v17 setNeedsLayout];

  if (([(BSUIScrollView *)self->_scrollView isScrollAnimating] & 1) == 0)
  {
    double v18 = [(SBHWidgetStackViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v18, "widgetStackViewController:didActivateDataSource:fromUserInteraction:", self, self->_activeWidget, -[BSUIScrollView isTracking](self->_scrollView, "isTracking"));
    }
  }
}

- (void)_incrementWidgetScaleAnimationCount
{
  unint64_t widgetScaleAnimationCount = self->_widgetScaleAnimationCount;
  self->_unint64_t widgetScaleAnimationCount = widgetScaleAnimationCount + 1;
  if (!widgetScaleAnimationCount)
  {
    [(SBHWidgetStackViewController *)self _updateWidgetViewClippingAndBackgroundView];
    [(SBHWidgetStackViewController *)self _updateWidgetViewHitTesting];
    [(SBHWidgetStackViewController *)self _updateScrollViewDelaysContentTouches];
  }
}

- (void)_decrementWidgetScaleAnimationCount
{
  unint64_t widgetScaleAnimationCount = self->_widgetScaleAnimationCount;
  if (widgetScaleAnimationCount)
  {
    unint64_t v4 = widgetScaleAnimationCount - 1;
    self->_unint64_t widgetScaleAnimationCount = v4;
    if (!v4)
    {
      [(SBHWidgetStackViewController *)self _updateWidgetViewClippingAndBackgroundView];
      [(SBHWidgetStackViewController *)self _updateWidgetViewHitTesting];
      [(SBHWidgetStackViewController *)self _updateScrollViewDelaysContentTouches];
    }
  }
}

- (void)_incrementWidgetSnapshotAnimationCount
{
}

- (void)_decrementWidgetSnapshotAnimationCount
{
  unint64_t widgetSnapshotAnimationCount = self->_widgetSnapshotAnimationCount;
  if (widgetSnapshotAnimationCount) {
    self->_unint64_t widgetSnapshotAnimationCount = widgetSnapshotAnimationCount - 1;
  }
}

- (void)_incrementBackgroundAnimationCount
{
  unint64_t backgroundAnimationCount = self->_backgroundAnimationCount;
  self->_unint64_t backgroundAnimationCount = backgroundAnimationCount + 1;
  if (!backgroundAnimationCount)
  {
    [(SBHWidgetStackViewController *)self _updateWidgetViewClippingAndBackgroundView];
    [(SBHWidgetStackViewController *)self _updateWidgetViewHitTesting];
  }
}

- (void)_decrementBackgroundAnimationCount
{
  unint64_t backgroundAnimationCount = self->_backgroundAnimationCount;
  if (backgroundAnimationCount)
  {
    unint64_t v4 = backgroundAnimationCount - 1;
    self->_unint64_t backgroundAnimationCount = v4;
    if (!v4)
    {
      [(SBHWidgetStackViewController *)self _updateWidgetViewClippingAndBackgroundView];
      [(SBHWidgetStackViewController *)self _updateWidgetViewHitTesting];
    }
  }
}

- (void)_updateWidgetViewClippingAndBackgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ([(NSHashTable *)self->_imageUpdateDisableAssertions count]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = WeakRetained == 0;
  }
  if (!v4)
  {
    unint64_t v5 = SBLogWidgets();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_WIDGET_VIEWS_CLIPPING_AND_BACKGROUND_VIEW", " isAnimation=YES ", buf, 2u);
    }

    if (self->_widgetScaleAnimationCount
      || self->_backgroundAnimationCount
      || [(BSUIScrollView *)self->_scrollView isScrolling]
      || self->_overlapping
      || [(SBHWidgetStackViewController *)self _alwaysShowStackBorder]
      || [(SBHWidgetStackViewController *)self _insetWidgetsForTrackingAppearance])
    {
      [(SBHWidgetStackViewController *)self _createBackgroundViewIfNecessary:1];
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = 1;
    }
    BOOL v7 = [(SBHWidgetStackViewController *)self clipsWidgetsToViewBounds];
    BOOL v8 = [(SBHWidgetStackViewController *)self _showAdjacentWidgets];
    BOOL v9 = [(SBHWidgetStackViewController *)self _isContentViewExtendingOutsideBounds];
    if (v7)
    {
      if (self->_widgetSnapshotAnimationCount) {
        BOOL v10 = 0;
      }
      else {
        BOOL v10 = v9;
      }
      uint64_t v11 = v8 | v10;
    }
    else
    {
      uint64_t v11 = 0;
    }
    [(UIView *)self->_containerView setClipsToBounds:v11];
    [(UIView *)self->_backgroundView setHidden:v6];
    double v12 = SBLogWidgets();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)double v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_WIDGET_VIEWS_CLIPPING_AND_BACKGROUND_VIEW", " isAnimation=YES ", v13, 2u);
    }
  }
}

+ (BOOL)_shouldDrawSystemBackgroundMaterialForWidget:(id)a3 widgetViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (objc_opt_respondsToSelector())
          {
            char v9 = [v6 isTransparent];
LABEL_11:
            BOOL v7 = v9;
            goto LABEL_5;
          }
        }
        else
        {
          BOOL v10 = self;
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            char v9 = [v6 usesSystemBackgroundMaterial];
            goto LABEL_11;
          }
        }
        BOOL v7 = 0;
        goto LABEL_5;
      }
    }
  }
  BOOL v7 = 1;
LABEL_5:

  return v7;
}

- (BOOL)_shouldDrawSystemBackgroundMaterialForWidget:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  id v6 = [v4 uniqueIdentifier];
  BOOL v7 = [v5 objectForKey:v6];

  BOOL v8 = [v7 widgetViewController];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  double v13 = [v12 multiplexedViewController];

  char v14 = [(id)objc_opt_class() _shouldDrawSystemBackgroundMaterialForWidget:v4 widgetViewController:v13];
  return v14;
}

- (void)_configureBackgroundViewIfNecessary
{
}

- (void)_configureBackgroundViewIfNecessary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id backgroundViewConfigurator = (void (**)(void))self->_backgroundViewConfigurator;
    if (backgroundViewConfigurator)
    {
      if (self->_activeWidget)
      {
        id v6 = v4;
        backgroundViewConfigurator[2]();
        id v4 = v6;
      }
    }
  }
}

- (void)_updateWidgetViewHitTesting
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v3 = SBLogWidgets();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_UPDATE_WIDGET_VIEW_HIT_TESTING", " isAnimation=YES ", buf, 2u);
  }

  BOOL v4 = [(SBHWidgetStackViewController *)self isWidgetHitTestingDisabled];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) view];
        objc_msgSend(v11, "bs_setHitTestingDisabled:", v4);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = SBLogWidgets();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_UPDATE_WIDGET_VIEW_HIT_TESTING", " isAnimation=YES ", buf, 2u);
  }
}

- (void)_updateWidgetViewEdgeAntialiasing
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v3 = SBLogWidgets();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_UPDATE_WIDGET_VIEW_EDGE_ANTIALIASING", " isAnimation=YES ", buf, 2u);
  }

  uint64_t v4 = self->_editing || self->_forcesEdgeAntialiasing;
  if (!self->_forcesEdgeAntialiasing)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = [(SBLeafIcon *)self->_icon iconDataSources];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            int v11 = [v10 iconSupportsRasterization:self->_icon];
          }
          else {
            int v11 = 1;
          }
          uint64_t v4 = v4 & v11 & self->_editing & ![(SBHWidgetStackViewController *)self _shouldDrawSystemBackgroundMaterialForWidget:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v7);
    }
  }
  id v12 = [(SBHWidgetStackViewController *)self traitCollection];
  [v12 displayScale];
  double v14 = v13;

  long long v15 = [(SBHWidgetStackViewController *)self containerView];
  long long v16 = [v15 layer];

  [v16 setAllowsEdgeAntialiasing:v4];
  [v16 setShouldRasterize:v4];
  [v16 setRasterizationScale:v14];
  double v17 = SBLogWidgets();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_UPDATE_WIDGET_VIEW_EDGE_ANTIALIASING", " isAnimation=YES ", buf, 2u);
  }
}

- (void)_updateWidgetViewStyleConfiguration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v2 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  double v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) updateStyleConfiguration];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateScrollViewDelaysContentTouches
{
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) == 0
    || [(BSUIScrollView *)self->_scrollView isScrolling]
    || self->_widgetScaleAnimationCount != 0;
  scrollView = self->_scrollView;
  [(BSUIScrollView *)scrollView setDelaysContentTouches:v3];
}

- (void)_updateVisiblySettledForWidgetViewControllers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogWidgets();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_UPDATE_VISIBLY_SETTLED_FOR_WIDGET_VIEW_CONTROLLERS", " isAnimation=YES ", buf, 2u);
  }

  unint64_t v4 = [(SBHWidgetStackViewController *)self userVisibilityStatus];
  if (v4 == 3)
  {
    if ([(BSUIScrollView *)self->_scrollView isScrolling]) {
      unint64_t v4 = 2;
    }
    else {
      unint64_t v4 = 3;
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) setUserVisibilityStatus:v4];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }

  long long v11 = SBLogWidgets();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_UPDATE_VISIBLY_SETTLED_FOR_WIDGET_VIEW_CONTROLLERS", " isAnimation=YES ", buf, 2u);
  }
}

- (void)_updatePresentationModeForWidgetViewControllers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  unint64_t v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setPresentationMode:self->_presentationMode];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateShowsSnapshotWhenDeactivatedForWidgetViewControllers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_widgetSnapshotAnimationCount)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    BOOL v3 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
    unint64_t v4 = [v3 allValues];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setShowsSnapshotWhenDeactivated:self->_showsSnapshotWhenDeactivated];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_updatePauseReasonForWidgetViewControllers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t pauseReasons = self->_pauseReasons;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  unint64_t v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setPaused:pauseReasons != 0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateApproximateLayoutPositionForWidgetViewControllers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBHWidgetStackViewController *)self approximateLayoutPosition];
  uint64_t v5 = v4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
  uint64_t v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setApproximateLayoutPosition:", v3, v5);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)_showAdjacentWidgets
{
  return [(BSUIScrollView *)self->_scrollView isScrolling];
}

- (BOOL)_isContentViewExtendingOutsideBounds
{
  uint64_t v3 = [(SBHWidgetStackViewController *)self traitCollection];
  [v3 displayScale];

  uint64_t v4 = [(SBHWidgetStackViewController *)self view];
  [v4 bounds];

  [(SBHWidgetStackViewController *)self iconImageInfo];
  BSRectWithSize();
  UIRectIntegralWithScale();
  double v6 = v5;
  double v8 = v7;
  UIRectIntegralWithScale();
  return v10 > v6 || v9 > v8;
}

- (BOOL)_isScrollViewTracking
{
  if (self->_alwaysShowsAsStack) {
    return 1;
  }
  else {
    return [(BSUIScrollView *)self->_scrollView isTracking];
  }
}

- (BOOL)_insetWidgetsForTrackingAppearance
{
  uint64_t v3 = [(SBHWidgetStackViewController *)self icon];
  if ([v3 isWidgetStackIcon])
  {
  }
  else
  {
    BOOL alwaysShowsAsStack = self->_alwaysShowsAsStack;

    if (!alwaysShowsAsStack) {
      return 0;
    }
  }
  return ([(BSUIScrollView *)self->_scrollView isTracking] & 1) != 0 || self->_alwaysShowsAsStack;
}

- (BOOL)_alwaysShowStackBorder
{
  uint64_t v3 = [(SBHWidgetStackViewController *)self icon];
  if ([v3 isWidgetStackIcon])
  {
  }
  else
  {
    BOOL alwaysShowsAsStack = self->_alwaysShowsAsStack;

    if (!alwaysShowsAsStack) {
      return 0;
    }
  }
  if ([(SBHWidgetSettings *)self->_widgetSettings stackAlwaysShowsBorder]
    || [(SBHWidgetStackViewController *)self _insetWidgetsForTrackingAppearance]
    || self->_editing
    || self->_showingContextMenu)
  {
    return 1;
  }
  if (!self->_showStackBorderWhenShowingPageControl) {
    return 0;
  }
  [(UIPageControl *)self->_pageControl alpha];
  return BSFloatIsOne();
}

- (BOOL)_alwaysShowStackPageControl
{
  return self->_alwaysShowsAsStack
      || [(SBHWidgetSettings *)self->_widgetSettings stackAlwaysShowsPageControl]
      || self->_editing
      || self->_showingContextMenu;
}

- (void)_flashPageControlAnimated:(BOOL)a3
{
}

- (void)_updateAccessibilityValue
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBHWidgetStackViewController *)self widgetIcon];
  if ([v3 isWidgetStackIcon])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v5 = [v3 iconDataSources];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) icon:v3 displayNameForLocation:@"SBIconLocationRoot"];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = (objc_class *)objc_opt_class();
            long long v12 = NSStringFromClass(v11);
            [v4 addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    containerView = self->_containerView;
    long long v14 = NSString;
    long long v15 = [v4 componentsJoinedByString:@","];
    long long v16 = [v14 stringWithFormat:@"widget-stack:<%@>", v15];
    [(UIView *)containerView setAccessibilityIdentifier:v16];
  }
}

- (void)_handleInstalledAppsChanged:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:@"SBInstalledApplicationsUpdatedBundleIDs"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v7 = [(SBLeafIcon *)self->_icon iconDataSources];
  if ([v5 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v20 = v7;
    id obj = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        uint64_t v11 = 0;
        uint64_t v21 = v9;
        do
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(obj);
          }
          long long v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
          long long v13 = [WeakRetained widgetStackViewController:self containerBundleIdentifierForDataSource:v12];
          if (v13 && [v5 containsObject:v13])
          {
            long long v14 = [v12 uniqueIdentifier];
            [(SBHWidgetStackViewController *)self _effectiveWidgetContainerViewControllers];
            uint64_t v15 = v10;
            long long v17 = v16 = WeakRetained;
            [v17 objectForKey:v14];
            v19 = long long v18 = v5;

            id WeakRetained = v16;
            uint64_t v10 = v15;
            objc_msgSend(v19, "setBlockedForScreenTimeExpiration:", objc_msgSend(WeakRetained, "widgetStackViewController:isDataSourceBlockedForScreenTimeExpiration:", self, v12));

            double v5 = v18;
            uint64_t v9 = v21;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    uint64_t v7 = v20;
  }
}

- (id)_widgetWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(SBLeafIcon *)self->_icon iconDataSources];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SBHWidgetStackViewController__widgetWithUniqueIdentifier___block_invoke;
  v9[3] = &unk_1E6AB2560;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __60__SBHWidgetStackViewController__widgetWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_logAllViewControllers
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_DEBUG, "[ViewControllerDebug] Beginning view controller enumeration ------------------------------------------", v1, 2u);
}

void __54__SBHWidgetStackViewController__logAllViewControllers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __54__SBHWidgetStackViewController__logAllViewControllers__block_invoke_cold_1(v4, v6);
  }

  [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_117_1];
}

void __54__SBHWidgetStackViewController__logAllViewControllers__block_invoke_115(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __54__SBHWidgetStackViewController__logAllViewControllers__block_invoke_115_cold_1((uint64_t)v2, v3);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a4;
  if ([a3 isEqualToString:@"alpha"])
  {
    [v8 alpha];
    if (BSFloatIsZero())
    {
      self->_flashPageControlOnNextAlphaChange = 1;
    }
    else if (self->_flashPageControlOnNextAlphaChange)
    {
      [(SBHWidgetStackViewController *)self _flashPageControlAnimated:1];
    }
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_widgetSettings == a3)
  {
    -[SBHWidgetStackViewController _layoutWithAnimationUpdateMode:](self, "_layoutWithAnimationUpdateMode:", 2, a4);
    [(SBHWidgetStackViewController *)self _flashPageControlAnimated:1];
  }
}

- (void)_setupStateCapture
{
  if (!self->_stateCaptureInvalidatable)
  {
    objc_initWeak(&location, self);
    id v3 = MEMORY[0x1E4F14428];
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    objc_copyWeak(&v8, &location);
    BSLogAddStateCaptureBlockWithTitle();
    id v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
    self->_stateCaptureInvalidatable = v6;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

__CFString *__50__SBHWidgetStackViewController__setupStateCapture__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = [MEMORY[0x1E4F4F718] builderWithObject:WeakRetained];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __50__SBHWidgetStackViewController__setupStateCapture__block_invoke_2;
    uint64_t v9 = &unk_1E6AACA90;
    id v10 = v2;
    id v11 = WeakRetained;
    id v3 = v2;
    [v3 appendBodySectionWithName:0 multilinePrefix:0 block:&v6];
    objc_msgSend(v3, "build", v6, v7, v8, v9);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = &stru_1F2FA0300;
  }

  return v4;
}

void __50__SBHWidgetStackViewController__setupStateCapture__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) widgetIcon];
  id v4 = (id)[v2 appendObject:v3 withName:@"widgetIcon"];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) viewIfLoaded];
  id v7 = (id)objc_msgSend(v5, "appendBool:withName:", objc_msgSend(v6, "isHidden"), @"viewIsHidden");

  id v8 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) widgetViewControllers];
  id v9 = (id)objc_msgSend(v8, "sbh_appendDescriptionsForViewControllers:", v10);
}

- (void)_teardownStateCapture
{
  stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
  if (stateCaptureInvalidatable)
  {
    [(BSInvalidatable *)stateCaptureInvalidatable invalidate];
    id v4 = self->_stateCaptureInvalidatable;
    self->_stateCaptureInvalidatable = 0;
  }
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isShowingContextMenu
{
  return self->_showingContextMenu;
}

- (BOOL)isOverlapping
{
  return self->_overlapping;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (id)backgroundViewProvider
{
  return self->_backgroundViewProvider;
}

- (id)backgroundViewConfigurator
{
  return self->_backgroundViewConfigurator;
}

- (double)brightness
{
  return self->_brightness;
}

- (unint64_t)userVisibilityStatus
{
  return self->_userVisibilityStatus;
}

- (BOOL)automaticallyUpdatesVisiblySettled
{
  return self->_automaticallyUpdatesVisiblySettled;
}

- (void)setAutomaticallyUpdatesVisiblySettled:(BOOL)a3
{
  self->_automaticallyUpdatesVisiblySettled = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (BOOL)showsSnapshotWhenDeactivated
{
  return self->_showsSnapshotWhenDeactivated;
}

- (unint64_t)imageViewAlignment
{
  return self->_imageViewAlignment;
}

- (unint64_t)pauseReasons
{
  return self->_pauseReasons;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBIconApproximateLayoutPosition)approximateLayoutPosition
{
  p_approximateLayoutPosition = &self->_approximateLayoutPosition;
  unint64_t horizontal = self->_approximateLayoutPosition.horizontal;
  unint64_t vertical = p_approximateLayoutPosition->vertical;
  result.unint64_t vertical = vertical;
  result.unint64_t horizontal = horizontal;
  return result;
}

- (SBWidgetIcon)widgetIcon
{
  return self->_icon;
}

- (SBIconViewCustomImageViewHosting)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  return (SBIconViewCustomImageViewHosting *)WeakRetained;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (BOOL)alwaysShowsAsStack
{
  return self->_alwaysShowsAsStack;
}

- (void)setAlwaysShowsAsStack:(BOOL)a3
{
  self->_BOOL alwaysShowsAsStack = a3;
}

- (BOOL)highlightsAtAnySize
{
  return self->_highlightsAtAnySize;
}

- (void)setHighlightsAtAnySize:(BOOL)a3
{
  self->_highlightsAtAnySize = a3;
}

- (BOOL)forcesEdgeAntialiasing
{
  return self->_forcesEdgeAntialiasing;
}

- (BOOL)clipsWidgetsToViewBounds
{
  return self->_clipsWidgetsToViewBounds;
}

- (void)setClipsWidgetsToViewBounds:(BOOL)a3
{
  self->_clipsWidgetsToViewBounds = a3;
}

- (int64_t)preferredDirection
{
  return self->_preferredDirection;
}

- (void)setPreferredDirection:(int64_t)a3
{
  self->_preferredDirection = a3;
}

- (BOOL)forcesVisible
{
  return self->_forcesVisible;
}

- (void)setForcesVisible:(BOOL)a3
{
  self->_forcesVisible = a3;
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (SBHWidgetStackViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SBHWidgetStackViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (SBHWidgetStackViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHWidgetStackViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration
{
  return self->_overrideIconImageStyleConfiguration;
}

- (SBLeafIconDataSource)activeWidget
{
  return self->_activeWidget;
}

- (void)setActiveWidget:(id)a3
{
}

- (BSUIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (NSTimer)pageControlHidingTimer
{
  return self->_pageControlHidingTimer;
}

- (void)setPageControlHidingTimer:(id)a3
{
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (BOOL)showStackBorderWhenShowingPageControl
{
  return self->_showStackBorderWhenShowingPageControl;
}

- (void)setShowStackBorderWhenShowingPageControl:(BOOL)a3
{
  self->_showStackBorderWhenShowingPageControl = a3;
}

- (BOOL)flashPageControlOnNextAppearance
{
  return self->_flashPageControlOnNextAppearance;
}

- (void)setFlashPageControlOnNextAppearance:(BOOL)a3
{
  self->_flashPageControlOnNextAppearance = a3;
}

- (BOOL)flashPageControlOnNextAlphaChange
{
  return self->_flashPageControlOnNextAlphaChange;
}

- (void)setFlashPageControlOnNextAlphaChange:(BOOL)a3
{
  self->_flashPageControlOnNextAlphaChange = a3;
}

- (NSMutableDictionary)widgetContainerViewControllersForLayoutOptions
{
  return self->_widgetContainerViewControllersForLayoutOptions;
}

- (void)setWidgetContainerViewControllersForLayoutOptions:(id)a3
{
}

- (NSMutableDictionary)widgetContainerViewControllersToRemove
{
  return self->_widgetContainerViewControllersToRemove;
}

- (void)setWidgetContainerViewControllersToRemove:(id)a3
{
}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (void)setWidgetSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
}

- (unint64_t)widgetScaleAnimationCount
{
  return self->_widgetScaleAnimationCount;
}

- (void)setWidgetScaleAnimationCount:(unint64_t)a3
{
  self->_unint64_t widgetScaleAnimationCount = a3;
}

- (unint64_t)backgroundAnimationCount
{
  return self->_backgroundAnimationCount;
}

- (void)setBackgroundAnimationCount:(unint64_t)a3
{
  self->_unint64_t backgroundAnimationCount = a3;
}

- (unint64_t)widgetSnapshotAnimationCount
{
  return self->_widgetSnapshotAnimationCount;
}

- (void)setWidgetSnapshotAnimationCount:(unint64_t)a3
{
  self->_unint64_t widgetSnapshotAnimationCount = a3;
}

- (NSHashTable)imageUpdateDisableAssertions
{
  return self->_imageUpdateDisableAssertions;
}

- (void)setImageUpdateDisableAssertions:(id)a3
{
}

- (BSInvalidatable)scrollingTouchCancellationAssertion
{
  return self->_scrollingTouchCancellationAssertion;
}

- (void)setScrollingTouchCancellationAssertion:(id)a3
{
}

- (BSInvalidatable)imageUpdatesDisabledForContextMenuAssertion
{
  return self->_imageUpdatesDisabledForContextMenuAssertion;
}

- (void)setImageUpdatesDisabledForContextMenuAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageUpdatesDisabledForContextMenuAssertion, 0);
  objc_storeStrong((id *)&self->_scrollingTouchCancellationAssertion, 0);
  objc_storeStrong((id *)&self->_imageUpdateDisableAssertions, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_widgetContainerViewControllersToRemove, 0);
  objc_storeStrong((id *)&self->_widgetContainerViewControllersForLayoutOptions, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_pageControlHidingTimer, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_activeWidget, 0);
  objc_storeStrong((id *)&self->_overrideIconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong(&self->_backgroundViewConfigurator, 0);
  objc_storeStrong(&self->_backgroundViewProvider, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_containerViewControllersRequiringLayoutUponActivation, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_customImageViewObservers, 0);
}

void __54__SBHWidgetStackViewController__logAllViewControllers__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 unsignedIntegerValue];
  _os_log_debug_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_DEBUG, "[ViewControllerDebug] layout options %lu", (uint8_t *)&v3, 0xCu);
}

void __54__SBHWidgetStackViewController__logAllViewControllers__block_invoke_115_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_DEBUG, "[ViewControllerDebug] widgetUniqueIdentifier: %@", (uint8_t *)&v2, 0xCu);
}

@end