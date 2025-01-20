@interface TUIFeedViewController
- ($61A80719B04F7407D3E47539F1B23CAA)feedId;
- (BOOL)_didSizeChangeComparedToEnvironment;
- (BOOL)_handleNativePressAction:(id)a3 arguments:(id)a4;
- (BOOL)_shouldDisableLayoutDueToAppBeingBackgrounded;
- (BOOL)avoidSyncTransactionInViewWillAppear;
- (BOOL)canHandleDropSession:(id)a3 actionObject:(id)a4 behavior:(id)a5;
- (BOOL)handleActionForObject:(id)a3 withName:(id)a4 arguments:(id)a5;
- (BOOL)isContentVisible;
- (BOOL)runningInExtension;
- (BOOL)shouldPromoteLargeTitleAccessoryViewButtonsForAccessibility;
- (BOOL)showsVerticalScrollIndicator;
- (BOOL)suspendedDueToMemoryPressure;
- (BOOL)updateEnvironmentOnViewLoad;
- (BOOL)viewDidDisappearWasCalled;
- (BOOL)visibilityProviderIsScrolling;
- (BOOL)visibilityProviderIsVisible;
- (CGPoint)contentOffset;
- (CGPoint)savedContentOffset;
- (CGRect)boundsForFeedView;
- (CGRect)screenCoordinatesForFrame:(CGRect)a3;
- (CGRect)visibilityProviderVisibleBounds;
- (CGSize)_viewSize;
- (CGSize)_windowSize;
- (CGSize)savedContentSize;
- (NSArray)extraLeftItems;
- (NSArray)extraRightItems;
- (NSHashTable)heightLayoutConditions;
- (NSNumber)performanceIdentifier;
- (NSNumber)visibleOverride;
- (TUIAuxiliaryViewState)auxiliaryViewState;
- (TUIContextMenuConfigurationProviding)contextMenuConfigurationProvider;
- (TUIDropController)dropController;
- (TUIDynamicInstance)feedContentLayoutStackNameInstance;
- (TUIEmbeddedScrollViewCoordinator)embeddedScrollViewCoordinator;
- (TUIFeedAutoScrollController)autoScrollController;
- (TUIFeedContent)content;
- (TUIFeedDebugDelegate)debugDelegate;
- (TUIFeedLayoutController)layoutController;
- (TUIFeedOverlayDebugView)overlayDebugView;
- (TUIFeedView)feedView;
- (TUIFeedViewController)initWithFeedContent:(id)a3 manager:(id)a4 factory:(id)a5;
- (TUIFeedViewControllerDelegate)delegate;
- (TUIFeedViewState)restoreViewState;
- (TUIFeedViewState)suspendedViewState;
- (TUIHostingController)hostingController;
- (TUIImagePrefetchController)imagePrefetchController;
- (TUIImpressionController)impressionController;
- (TUIInteractionBuilding)interactionBuilder;
- (TUIKeyboardAvoidingSupport)keyboardSupport;
- (TUILinkEntityController)linkEntityController;
- (TUIManager)manager;
- (TUIMutableViewState)savedViewState;
- (TUIPagedScrollableControlling)pagedScrollableController;
- (TUIRenderModelAuxiliary)auxiliaryRenderModel;
- (TUIRenderReferenceOverrideProvider)renderOverrideProvider;
- (TUIReusableSubviewPool)subviewPool;
- (TUISearchController)searchController;
- (TUISyncLayoutController)syncLayoutController;
- (TUITemplateFactory)templateFactory;
- (TUITransaction)syncTransaction;
- (TUITriggerStateManager)triggerStateManager;
- (TUIVideoPlayerManager)videoPlayerManager;
- (TUIViewFactory)viewFactory;
- (TUIViewRegistry)registry;
- (TUIViewVisibilityController)viewVisibilityController;
- (TUIVisibilityController)visibilityController;
- (TUIVisibilityTracker)impressionTracker;
- (TUIVisibilityTracker)linkEntityTracker;
- (UIEdgeInsets)contentInsetsForScrollingToRectWithContentInsets:(UIEdgeInsets)a3;
- (UINavigationBar)hostingNavigationBar;
- (UIScrollView)scrollView;
- (_TUIFeedViewControllerQueueContext)queueContext;
- (double)availableHeight;
- (double)viewAppearingingSyncTimeoutDuration;
- (double)viewTransitionSyncTimeoutDuration;
- (float)hiddenPriority;
- (float)visiblePriority;
- (id)_captureFeedViewState;
- (id)_effectiveSyncLayoutController;
- (id)_renderModel;
- (id)_renderModelForIndexPath:(id)a3;
- (id)_renderModelForSection:(unint64_t)a3;
- (id)descendentViewWithIdentifier:(id)a3;
- (id)dragItemForObject:(id)a3 withName:(id)a4 arguments:(id)a5;
- (id)feedViewForAX;
- (id)imageResourcesMatchingQuery:(id)a3;
- (id)navigationBarItemMatchingQuery:(id)a3;
- (id)renderReferenceOverrideObservers;
- (id)renderReferencesMatchingQuery:(id)a3;
- (id)resolveViewWithPath:(id)a3;
- (id)resumeAndRebuildForReason:(id)a3;
- (id)suspendLayout;
- (id)suspendUpdates;
- (id)suspendUpdatesUntilContentExceedsHeightWithCompletion:(id)a3;
- (id)topLevelAXElement;
- (id)viewFactoryDequeueReusableSubviewWithReuseIdentifier:(id)a3 indexPath:(id)a4 host:(id)a5;
- (id)visibilityProviderHostingLayer;
- (id)visibilityProviderSections;
- (id)visibilityProviderWindowLayer;
- (id)waitForVisibleImageResourcesToLoadAssertionWithTimeout:(double)a3 completion:(id)a4;
- (unint64_t)heightGuessForScrollingOption;
- (unint64_t)layoutDirection;
- (unint64_t)liveResizeOptions;
- (unint64_t)options;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_createSyncTransactionIfNeededAnimated:(BOOL)a3 duration:(double)a4 timeout:(double)a5 flags:(unint64_t)a6;
- (void)_createSyncTransactionIfNeededAnimated:(BOOL)a3 duration:(double)a4 timingParameters:(id)a5 timeout:(double)a6 isLayingOutFeed:(BOOL)a7 ignoreWindow:(BOOL)a8 flags:(unint64_t)a9;
- (void)_createSyncTransactionWithOptions:(id)a3;
- (void)_layoutFeed;
- (void)_layoutFeedIgnoringWindow:(BOOL)a3;
- (void)_loadFeed;
- (void)_removeTriggerObservationForRenderModel:(id)a3;
- (void)_setContentNeedsUpdate;
- (void)_setupControllers;
- (void)_setupFeedView;
- (void)_synchronouslyUpdateContent:(id)a3 environment:(id)a4 andWaitForEntry:(id)a5 timeout:(double)a6 assertion:(id)a7 completion:(id)a8;
- (void)_teardownControllers;
- (void)_teardownFeedView;
- (void)_updateDatesCollectorInitialResourcesRenderedDate;
- (void)_updateEnvironment;
- (void)_updateHeightLayoutConditions;
- (void)_updateHostingGeometryMapIfNeededWithTransaction:(id)a3;
- (void)_updateHostingGeometryMapWithTransaction:(id)a3;
- (void)_updateLayoutIfNeededIgnoringWindow:(BOOL)a3;
- (void)_updateNavigationBarItems;
- (void)_updateNavigationItemTriggerObservanceForCurrentRenderModel:(id)a3 previous:(id)a4;
- (void)_updatePriority;
- (void)_waitForSyncTransaction;
- (void)_waitForSyncTransactionCompletion:(id)a3;
- (void)addRenderOverride:(id)a3;
- (void)addRenderOverride:(id)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)applyUpdate:(id)a3;
- (void)applyUpdate:(id)a3 controller:(id)a4 completion:(id)a5;
- (void)clearSuspendedViewState;
- (void)clearVisibleOverride;
- (void)collectStatsWithCompletion:(id)a3;
- (void)configureWithSyncLayoutController:(id)a3;
- (void)dealloc;
- (void)debugDumpEnvironmentContainerStructure;
- (void)didAddChildViewController:(id)a3;
- (void)didBeginDraggingView:(id)a3;
- (void)didEndDraggingView:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)didScrollToQuery:(id)a3;
- (void)dynamicChanged:(id)a3 transaction:(id)a4;
- (void)feedLayoutController:(id)a3 applyUpdatesFromTransactionGroup:(id)a4;
- (void)feedLayoutController:(id)a3 axModelSections:(id)a4 renderModelCollection:(id)a5 renderModelSections:(id)a6;
- (void)feedLayoutController:(id)a3 didTransitionToLayoutState:(unint64_t)a4;
- (void)feedLayoutController:(id)a3 updateStats:(id)a4;
- (void)feedLayoutController:(id)a3 willTransitionToLayoutState:(unint64_t)a4;
- (void)feedLayoutControllerAllContentReady:(id)a3;
- (void)feedLayoutControllerInitialContentReady:(id)a3;
- (void)finalizeSynchronousTransaction:(id)a3;
- (void)flushPendingTransactionsWithCompletion:(id)a3;
- (void)flushPendingTransactionsWithTimeout:(double)a3;
- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5;
- (void)hostingControllerGeometryUpdated:(id)a3;
- (void)imagePrefetchControllerDidLoadAllResources:(id)a3;
- (void)imagePrefetchControllerDidStartLoadingInitialResources:(id)a3;
- (void)impressionController:(id)a3 didUpdateSnapshot:(id)a4;
- (void)layoutIfNeeded;
- (void)notifyWhenVisibleImageResourcesAreLoadedWithTimeout:(double)a3 completion:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseEnvironmentUpdates;
- (void)pauseUpdates;
- (void)performDropWithSession:(id)a3 actionObject:(id)a4 behavior:(id)a5;
- (void)removeRenderOverride:(id)a3;
- (void)removeRenderOverride:(id)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)reportLargeLayer:(id)a3 renderModel:(id)a4;
- (void)resumeEnvironmentUpdates;
- (void)resumeUpdates;
- (void)scrollToItemsMatchingQuery:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5 skipVoiceOverFocus:(BOOL)a6;
- (void)scrollToRefId:(id)a3 refInstance:(id)a4 onEntry:(id)a5 animated:(BOOL)a6 skipVoiceOverFocus:(BOOL)a7;
- (void)scrollViewDidChangeAdjustedContentInset:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAutoScrollController:(id)a3;
- (void)setAuxiliaryRenderModel:(id)a3;
- (void)setAvoidSyncTransactionInViewWillAppear:(BOOL)a3;
- (void)setContent:(id)a3;
- (void)setContentNeedsUpdate;
- (void)setContextMenuConfigurationProvider:(id)a3;
- (void)setDebugDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtraLeftItems:(id)a3;
- (void)setExtraRightItems:(id)a3;
- (void)setFeedContentLayoutStackNameInstance:(id)a3;
- (void)setHeightGuessForScrollingOption:(unint64_t)a3;
- (void)setHeightLayoutConditions:(id)a3;
- (void)setHiddenPriority:(float)a3;
- (void)setKeyboardSupport:(id)a3;
- (void)setLiveResizeOptions:(unint64_t)a3;
- (void)setNavBarBackgroundOpacity:(double)a3 manualScrollEdgeAppearanceEnabled:(BOOL)a4;
- (void)setNeedsEnvironmentUpdate;
- (void)setOptions:(unint64_t)a3;
- (void)setPerformanceIdentifier:(id)a3;
- (void)setQueueContext:(id)a3;
- (void)setRenderOverrideProvider:(id)a3;
- (void)setRestoreViewState:(id)a3;
- (void)setSavedContentOffset:(CGPoint)a3;
- (void)setSavedContentSize:(CGSize)a3;
- (void)setSavedViewState:(id)a3;
- (void)setShowsVerticalScrollIndicator:(BOOL)a3;
- (void)setSuspendedDueToMemoryPressure:(BOOL)a3;
- (void)setSuspendedViewState:(id)a3;
- (void)setSyncTransaction:(id)a3;
- (void)setTriggerStateManager:(id)a3;
- (void)setUpdateEnvironmentOnViewLoad:(BOOL)a3;
- (void)setViewAppearingingSyncTimeoutDuration:(double)a3;
- (void)setViewDidDisappearWasCalled:(BOOL)a3;
- (void)setViewFactory:(id)a3;
- (void)setViewTransitionSyncTimeoutDuration:(double)a3;
- (void)setVisibleOverride:(id)a3;
- (void)setVisiblePriority:(float)a3;
- (void)suspendAndTeardownForReason:(id)a3;
- (void)suspendUpdatesUntilEndOfTransaction:(id)a3;
- (void)synchronouslyUpdateContent:(id)a3 environment:(id)a4 andWaitForEntry:(id)a5 timeout:(double)a6;
- (void)synchronouslyUpdateContent:(id)a3 environment:(id)a4 andWaitForEntry:(id)a5 timeout:(double)a6 completion:(id)a7;
- (void)tui_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)updateHostingMap:(id)a3 controller:(id)a4;
- (void)updateNavigationBarOpacity;
- (void)updateVisibility;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewFactoryPrepareToReuseHost:(id)a3;
- (void)viewFactoryReuseSubviews:(id)a3 host:(id)a4;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)visibleOverrideVisible:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TUIFeedViewController

- (TUIFeedViewController)initWithFeedContent:(id)a3 manager:(id)a4 factory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(TUIFeedViewController *)self initWithNibName:0 bundle:0];
  if (v12)
  {
    v12->_visibilityController = (TUIVisibilityController *)TUIFeedIdentifierGenerate();
    v13 = TUIDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      visibilityController = v12->_visibilityController;
      *(_DWORD *)buf = 134218242;
      v40 = visibilityController;
      __int16 v41 = 2112;
      v42 = v12;
      _os_log_impl(&def_141F14, v13, OS_LOG_TYPE_INFO, "[fid:%lu] created view controller %@", buf, 0x16u);
    }

    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_hiddenPriority, a3);
    v12->_contentNeedsUpdate = v9 != 0;
    v15 = [*(id *)&v12->_hiddenPriority currentStackName];
    uint64_t v16 = [v15 instanceForObserver:v12];
    restoreViewState = v12->_restoreViewState;
    v12->_restoreViewState = (TUIFeedViewState *)v16;

    *(_DWORD *)&v12->_viewDidDisappearWasCalled = 1061158912;
    v12->_visiblePriority = 0.25;
    *((unsigned char *)&v12->_flags + 2) = 1;
    v12->_viewTransitionSyncTimeoutDuration = 1.0;
    v12->_contextMenuConfigurationProvider = (TUIContextMenuConfigurationProviding *)0x3FF0000000000000;
    v12->_liveResizeOptions = 1;
    objc_storeStrong((id *)&v12->_templateFactory, a4);
    objc_storeStrong((id *)&v12->_triggerStateManager, a5);
    v18 = [[TUIFeedLayoutController alloc] initWithFeedId:v12->_visibilityController environment:0 factory:v12->_triggerStateManager manager:v10 renderMode:0];
    feedView = v12->_feedView;
    v12->_feedView = (TUIFeedView *)v18;

    *(float *)&double v20 = v12->_visiblePriority;
    [(TUIFeedView *)v12->_feedView setPriority:v20];
    [(TUIFeedView *)v12->_feedView setDelegate:v12];
    [(TUIFeedView *)v12->_feedView setActionHandlerDelegate:v12];
    v21 = [[TUIFeedAutoScrollController alloc] initWithDelegate:v12];
    heightLayoutConditions = v12->_heightLayoutConditions;
    v12->_heightLayoutConditions = (NSHashTable *)v21;

    v23 = objc_alloc_init(_TUIFeedViewControllerQueueContext);
    autoScrollController = v12->_autoScrollController;
    v12->_autoScrollController = (TUIFeedAutoScrollController *)v23;

    v25 = [[TUIHostingController alloc] initWithFeedId:v12->_visibilityController delegate:v12 viewController:v12 manager:v12->_templateFactory];
    renderOverrideProvider = v12->_renderOverrideProvider;
    v12->_renderOverrideProvider = (TUIRenderReferenceOverrideProvider *)v25;

    v27 = [TUILinkEntityController alloc];
    v28 = +[TUIVisibilityController sharedQueue];
    v29 = [(TUILinkEntityController *)v27 initWithFeedId:v12->_visibilityController queue:v28 viewResolver:v12];
    impressionController = v12->_impressionController;
    v12->_impressionController = (TUIImpressionController *)v29;

    *(CGSize *)&v12->_savedContentOffset.y = CGSizeZero;
    *(CGPoint *)&v12->_debugDelegate = CGPointZero;
    [(TUIFeedViewController *)v12 _setupControllers];
    v31 = +[NSUserDefaults standardUserDefaults];
    LODWORD(v28) = [v31 BOOLForKey:@"TUIRecordStats"];

    if (v28) {
      [(TUIFeedView *)v12->_feedView setStatsMode:31];
    }
    v32 = +[NSNotificationCenter defaultCenter];
    [v32 addObserver:v12 selector:"setNeedsEnvironmentUpdate" name:kAXSApplicationAccessibilityEnabledNotification object:0];
    [v32 addObserver:v12 selector:"_applicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
    [v32 addObserver:v12 selector:"setNeedsEnvironmentUpdate" name:NSCurrentLocaleDidChangeNotification object:0];
    v33 = +[NSUserDefaults standardUserDefaults];
    [v33 addObserver:v12 forKeyPath:@"TUIForceFallbackFont" options:0 context:off_2DDBA8];

    v34 = objc_alloc_init(TUIRenderReferenceOverrideProvider);
    uniqueIdentifier = (void *)v12->_feedId.uniqueIdentifier;
    v12->_feedId.uniqueIdentifier = (unint64_t)v34;

    [(id)v12->_feedId.uniqueIdentifier setDelegate:v12];
    [(TUIFeedViewController *)v12 setContainmentSupport:1];
    v36 = +[UITraitCollection tui_allAPITraits];
    id v37 = [(TUIFeedViewController *)v12 registerForTraitChanges:v36 withTarget:v12 action:"tui_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v12;
}

- (void)dealloc
{
  [(TUIFeedViewController *)self _teardownControllers];
  [(TUIFeedView *)self->_feedView teardown];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObserver:self forKeyPath:@"TUIForceFallbackFont" context:off_2DDBA8];

  v5.receiver = self;
  v5.super_class = (Class)TUIFeedViewController;
  [(TUIFeedViewController *)&v5 dealloc];
}

- (void)setLiveResizeOptions:(unint64_t)a3
{
  *(void *)&self->_viewAppearingingSyncTimeoutDuration = a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_2DDBA8 == a6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_118020;
    v7[3] = &unk_251990;
    v7[4] = self;
    TUIDispatchAsyncViaRunLoop((uint64_t)v7);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TUIFeedViewController;
    -[TUIFeedViewController observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_content);

  objc_super v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_content, obj);
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFD | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFB | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 8;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xF7 | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 16;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xEF | v9;
    if (objc_opt_respondsToSelector()) {
      char v10 = 32;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xDF | v10;
    id v11 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v12 = [v11 BOOLForKey:@"TUIRecordStats"];

    if (v12 & 1) == 0 && (objc_opt_respondsToSelector()) {
      -[TUIFeedView setStatsMode:](self->_feedView, "setStatsMode:", [obj statsModeForFeedViewController:self]);
    }
    if (objc_opt_respondsToSelector())
    {
      v13 = [obj feedViewControllerInteractionBuilder:self];
      objc_storeWeak((id *)&self->_interactionBuilder, v13);
    }
    else
    {
      objc_storeWeak((id *)&self->_interactionBuilder, 0);
    }
    objc_super v5 = obj;
  }
}

- (TUIInteractionBuilding)interactionBuilder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionBuilder);

  return (TUIInteractionBuilding *)WeakRetained;
}

- (TUIFeedViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_content);

  return (TUIFeedViewControllerDelegate *)WeakRetained;
}

- (void)_setupControllers
{
  v3 = [TUIVisibilityController alloc];
  v4 = +[TUIVisibilityController sharedQueue];
  objc_super v5 = [(TUIVisibilityController *)v3 initWithRootProvider:self queue:v4];
  embeddedScrollViewCoordinator = self->_embeddedScrollViewCoordinator;
  self->_embeddedScrollViewCoordinator = v5;

  char v7 = (TUIAuxiliaryViewState *)[(TUIEmbeddedScrollViewCoordinator *)self->_embeddedScrollViewCoordinator newTrackerWithDefaultThreshold:&stru_2559D8 block:0.5];
  auxiliaryViewState = self->_auxiliaryViewState;
  self->_auxiliaryViewState = v7;

  char v9 = (TUIVisibilityTracker *)[(TUIEmbeddedScrollViewCoordinator *)self->_embeddedScrollViewCoordinator newTrackerWithDefaultThreshold:&stru_2559F8 block:0.0];
  impressionTracker = self->_impressionTracker;
  self->_impressionTracker = v9;

  id v11 = [TUIImpressionController alloc];
  unsigned __int8 v12 = self->_auxiliaryViewState;
  v13 = +[TUIVisibilityController sharedQueue];
  v14 = [(TUIImpressionController *)v11 initWithFeedId:self->_visibilityController delegate:self tracker:v12 queue:v13];
  options = (void *)self->_options;
  self->_options = (unint64_t)v14;

  [(TUIImpressionController *)self->_impressionController attachToTracker:self->_impressionTracker];
  uint64_t v16 = objc_alloc_init(TUITriggerStateManager);
  dropController = self->_dropController;
  self->_dropController = (TUIDropController *)v16;

  v18 = [TUIImagePrefetchController alloc];
  v19 = [(TUITemplateFactory *)self->_templateFactory resourceLoader];
  double v20 = [(TUIImagePrefetchController *)v18 initWithResourceLoader:v19];
  linkEntityController = self->_linkEntityController;
  self->_linkEntityController = v20;

  [(TUILinkEntityController *)self->_linkEntityController setDelegate:self];
  v22 = objc_alloc_init(TUIDropController);
  imagePrefetchController = self->_imagePrefetchController;
  self->_imagePrefetchController = (TUIImagePrefetchController *)v22;

  [(TUIImagePrefetchController *)self->_imagePrefetchController setActionHandlerDelegate:self];
  v24 = objc_alloc_init(TUIEmbeddedScrollViewCoordinator);
  pagedScrollableController = self->_pagedScrollableController;
  self->_pagedScrollableController = (TUIPagedScrollableControlling *)v24;
}

- (void)_teardownControllers
{
  [(TUIImpressionController *)self->_impressionController detachFromTracker];
  [self->_options teardown];
  options = (void *)self->_options;
  self->_options = 0;

  [(TUIEmbeddedScrollViewCoordinator *)self->_embeddedScrollViewCoordinator removeTracker:self->_auxiliaryViewState];
  [(TUIEmbeddedScrollViewCoordinator *)self->_embeddedScrollViewCoordinator removeTracker:self->_impressionTracker];
  embeddedScrollViewCoordinator = self->_embeddedScrollViewCoordinator;
  self->_embeddedScrollViewCoordinator = 0;

  dropController = self->_dropController;
  self->_dropController = 0;

  [(TUILinkEntityController *)self->_linkEntityController setDelegate:0];
  linkEntityController = self->_linkEntityController;
  self->_linkEntityController = 0;

  [(TUIImagePrefetchController *)self->_imagePrefetchController setActionHandlerDelegate:0];
  imagePrefetchController = self->_imagePrefetchController;
  self->_imagePrefetchController = 0;

  pagedScrollableController = self->_pagedScrollableController;
  self->_pagedScrollableController = 0;
}

- (void)clearVisibleOverride
{
  savedViewState = self->_savedViewState;
  self->_savedViewState = 0;

  [(TUIFeedViewController *)self _updatePriority];
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  id v3 = [(TUIFeedViewController *)self viewIfLoaded];
  [v3 setNeedsLayout];
}

- (void)visibleOverrideVisible:(BOOL)a3
{
  v4 = +[NSNumber numberWithBool:a3];
  savedViewState = self->_savedViewState;
  self->_savedViewState = v4;

  [(TUIFeedViewController *)self _updatePriority];
}

- (BOOL)isContentVisible
{
  savedViewState = self->_savedViewState;
  if (savedViewState)
  {
    return [(TUIMutableViewState *)savedViewState BOOLValue];
  }
  else
  {
    unsigned int v5 = [(TUIFeedViewController *)self _appearState];
    if (v5 == 1) {
      return 1;
    }
    if (v5 != 2) {
      return 0;
    }
    char v6 = [(TUIFeedViewController *)self viewIfLoaded];
    char v7 = [v6 window];
    BOOL v8 = v7 != 0;

    return v8;
  }
}

- (TUIVideoPlayerManager)videoPlayerManager
{
  return (TUIVideoPlayerManager *)[(TUITemplateFactory *)self->_templateFactory videoPlayerManager];
}

- (UINavigationBar)hostingNavigationBar
{
  v2 = [(TUIFeedViewController *)self navigationController];
  id v3 = [v2 navigationBar];

  return (UINavigationBar *)v3;
}

- (void)_updatePriority
{
  if ([(TUIFeedViewController *)self isContentVisible]) {
    [(TUIFeedViewController *)self visiblePriority];
  }
  else {
    [(TUIFeedViewController *)self hiddenPriority];
  }
  int v4 = v3;
  -[TUIFeedView setPriority:](self->_feedView, "setPriority:");
  linkEntityController = self->_linkEntityController;
  LODWORD(v6) = v4;

  [(TUILinkEntityController *)linkEntityController setPriority:v6];
}

- (TUIViewRegistry)registry
{
  return (TUIViewRegistry *)[(TUITemplateFactory *)self->_templateFactory viewRegistry];
}

- (void)_updateEnvironment
{
  int v3 = [TUIEnvironment alloc];
  [(TUIFeedViewController *)self _viewSize];
  double v5 = v4;
  double v7 = v6;
  [(TUIFeedViewController *)self _windowSize];
  char v10 = -[TUIEnvironment initWithViewController:viewSize:windowSize:](v3, "initWithViewController:viewSize:windowSize:", self, v5, v7, v8, v9);
  environment = self->_environment;
  self->_environment = v10;

  renderOverrideProvider = self->_renderOverrideProvider;
  v13 = [(TUIEnvironment *)self->_environment traitCollection];
  [(TUIRenderReferenceOverrideProvider *)renderOverrideProvider updateTraitCollection:v13];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_content);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained feedViewController:self customizeEnvironment:self->_environment];
  }
}

- (void)setNeedsEnvironmentUpdate
{
  self->_environmentNeedsUpdate = 1;
  id v2 = [(TUIFeedViewController *)self viewIfLoaded];
  [v2 setNeedsLayout];
}

- (void)_setupFeedView
{
  int v3 = [(TUIFeedView *)self->_feedView updateController];
  id v39 = [v3 registerDelegate:self];

  double v4 = [v39 first];
  double v5 = [TUIFeedView alloc];
  double v6 = [(TUIFeedViewController *)self view];
  [v6 bounds];
  double v7 = -[TUIFeedView initWithFrame:](v5, "initWithFrame:");
  syncLayoutController = self->_syncLayoutController;
  self->_syncLayoutController = v7;

  double v9 = NAN;
  if (self->_liveResizeOptions == 1) {
    double v9 = 2.0;
  }
  [(TUISyncLayoutController *)self->_syncLayoutController setContentHeightFactorForScrollingGuess:v9];
  [(TUISyncLayoutController *)self->_syncLayoutController setAutoresizingMask:18];
  [(TUISyncLayoutController *)self->_syncLayoutController setViewFactory:self->_feedContentLayoutStackNameInstance];
  [(TUISyncLayoutController *)self->_syncLayoutController setCurrentViewState:self->_keyboardSupport];
  renderOverrideProvider = self->_renderOverrideProvider;
  id v11 = [v39 second];
  [(TUIRenderReferenceOverrideProvider *)renderOverrideProvider updateHostingMap:v11];

  [(TUISyncLayoutController *)self->_syncLayoutController reloadWithRenderModel:v4];
  unsigned __int8 v12 = +[UIColor clearColor];
  [(TUISyncLayoutController *)self->_syncLayoutController setBackgroundColor:v12];

  v13 = self->_syncLayoutController;
  v14 = +[TUIDragController sharedInstance];
  v15 = [v14 dragInteractionWithActionHandlerDelegate:self dragDelegate:self];
  [(TUISyncLayoutController *)v13 addInteraction:v15];

  uint64_t v16 = self->_syncLayoutController;
  v17 = [(TUIImagePrefetchController *)self->_imagePrefetchController dropInteraction];
  [(TUISyncLayoutController *)v16 addInteraction:v17];

  [(TUISyncLayoutController *)self->_syncLayoutController setDelegate:self];
  [(TUISyncLayoutController *)self->_syncLayoutController setSubviewsDelegate:self];
  [(TUISyncLayoutController *)self->_syncLayoutController setRectScrollingDelegate:self];
  [(TUISyncLayoutController *)self->_syncLayoutController setScrollingDelegate:self];
  [(TUISyncLayoutController *)self->_syncLayoutController setControllerHost:self];
  [(TUISyncLayoutController *)self->_syncLayoutController setAlwaysBounceVertical:1];
  v18 = [(TUIFeedViewController *)self view];
  [v18 addSubview:self->_syncLayoutController];

  [(TUIFeedViewController *)self setContentScrollView:self->_syncLayoutController forEdge:5];
  v19 = [TUIViewVisibilityController alloc];
  double v20 = [(TUIFeedViewController *)self view];
  v21 = [(TUIViewVisibilityController *)v19 initWithView:v20 scrollView:self->_syncLayoutController];
  hostingController = self->_hostingController;
  self->_hostingController = v21;

  v23 = objc_alloc_init(TUIPagedScrollableController);
  delegate = self->_delegate;
  self->_delegate = (TUIFeedViewControllerDelegate *)v23;

  v25 = [(TUIFeedView *)self->_feedView auxiliaryUpdateController];
  id v26 = [v25 registerDelegate:self];

  v27 = +[NSUserDefaults standardUserDefaults];
  if ([v27 BOOLForKey:@"TUIEnableDebugMenu"])
  {
  }
  else
  {
    v28 = +[NSUserDefaults standardUserDefaults];
    unsigned int v29 = [v28 BOOLForKey:@"TUIReportErrors"];

    if (!v29) {
      goto LABEL_7;
    }
  }
  v30 = objc_alloc_init(TUIFeedOverlayDebugView);
  queueContext = self->_queueContext;
  self->_queueContext = (_TUIFeedViewControllerQueueContext *)v30;

  [(_TUIFeedViewControllerQueueContext *)self->_queueContext setDelegate:self];
  [(_TUIFeedViewControllerQueueContext *)self->_queueContext setTranslatesAutoresizingMaskIntoConstraints:1];
  [(_TUIFeedViewControllerQueueContext *)self->_queueContext setAutoresizingMask:18];
  v32 = [(TUIFeedViewController *)self view];
  [v32 bounds];
  double v34 = v33;
  v35 = [(TUIFeedViewController *)self view];
  [v35 bounds];
  -[_TUIFeedViewControllerQueueContext setFrame:](self->_queueContext, "setFrame:", 0.0, 48.0, v34);

  v36 = [(TUIFeedViewController *)self view];
  [v36 addSubview:self->_queueContext];

LABEL_7:
  id v37 = [[TUIAuxiliaryViewState alloc] initWithSearchControllerDelegate:self hostingController:self->_renderOverrideProvider viewVisibilityController:self->_hostingController];
  overlayDebugView = self->_overlayDebugView;
  self->_overlayDebugView = (TUIFeedOverlayDebugView *)v37;
}

- (void)_teardownFeedView
{
  [(TUIFeedViewController *)self setContentScrollView:0 forEdge:5];
  overlayDebugView = self->_overlayDebugView;
  self->_overlayDebugView = 0;

  hostingController = self->_hostingController;
  self->_hostingController = 0;

  [(TUISyncLayoutController *)self->_syncLayoutController saveViewStateForVisibleViews];
  double v5 = [(TUISyncLayoutController *)self->_syncLayoutController currentViewState];
  keyboardSupport = self->_keyboardSupport;
  self->_keyboardSupport = v5;

  [(TUISyncLayoutController *)self->_syncLayoutController removeFromSuperview];
  syncLayoutController = self->_syncLayoutController;
  self->_syncLayoutController = 0;

  [(TUIRenderReferenceOverrideProvider *)self->_renderOverrideProvider updateHostingMap:0];
  [(_TUIFeedViewControllerQueueContext *)self->_queueContext removeFromSuperview];
  queueContext = self->_queueContext;
  self->_queueContext = 0;

  delegate = self->_delegate;
  self->_delegate = 0;

  [(TUIDynamicInstance *)self->_feedContentLayoutStackNameInstance clearPool];
  char v10 = [(TUIFeedView *)self->_feedView updateController];
  [v10 unregisterDelegate:self];

  id v11 = [(TUIFeedView *)self->_feedView auxiliaryUpdateController];
  [v11 unregisterDelegate:self];
}

- (void)_setContentNeedsUpdate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_contentNeedsUpdate)
  {
    self->_contentNeedsUpdate = 1;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    uint64_t v4 = *(void *)&self->_hiddenPriority;
    self->_contentNeedsUpdate = v4 != 0;
    os_unfair_lock_unlock(p_lock);
    if (v4)
    {
      if (+[NSThread isMainThread])
      {
        id v5 = [(TUIFeedViewController *)self viewIfLoaded];
        [v5 setNeedsLayout];
      }
      else
      {
        v6[0] = _NSConcreteStackBlock;
        v6[1] = 3221225472;
        v6[2] = sub_1192FC;
        v6[3] = &unk_251990;
        v6[4] = self;
        TUIDispatchAsyncViaRunLoop((uint64_t)v6);
      }
    }
  }
}

- (void)setContentNeedsUpdate
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);

  [(TUIFeedViewController *)self _setContentNeedsUpdate];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)TUIFeedViewController;
  [(TUIFeedViewController *)&v17 viewDidLoad];
  +[TUIButtonBox setupSize];
  +[TUIToggleBox setupSize];
  if (!self->_feedContentLayoutStackNameInstance)
  {
    int v3 = [TUIViewFactory alloc];
    uint64_t v4 = [(TUITemplateFactory *)self->_templateFactory viewRegistry];
    id v5 = [(TUIViewFactory *)v3 initWithRegistry:v4];
    feedContentLayoutStackNameInstance = self->_feedContentLayoutStackNameInstance;
    self->_feedContentLayoutStackNameInstance = v5;
  }
  if (!self->_environment)
  {
    double v7 = [(TUIFeedViewController *)self parentViewController];
    if (v7)
    {
      int v8 = *((unsigned __int8 *)&self->_flags + 2);

      if (v8)
      {
        self->_environmentNeedsUpdate = 1;
        double v9 = [(TUIFeedViewController *)self view];
        [v9 setNeedsLayout];
      }
    }
  }
  if (self->_environmentNeedsUpdate || self->_environment) {
    [(TUIFeedViewController *)self _setContentNeedsUpdate];
  }
  char v10 = +[UIColor systemBackgroundColor];
  id v11 = [(TUIFeedViewController *)self view];
  [v11 setBackgroundColor:v10];

  unsigned __int8 v12 = [(TUIFeedViewController *)self suspendedViewState];

  if (v12) {
    id v13 = [(TUIFeedViewController *)self resumeAndRebuildForReason:@"view loaded"];
  }
  else {
    [(TUIFeedViewController *)self _setupFeedView];
  }
  LODWORD(v14) = *(_DWORD *)&self->_viewDidDisappearWasCalled;
  [(TUIFeedView *)self->_feedView setPriority:v14];
  v15 = [(TUIFeedViewController *)self navigationController];
  uint64_t v16 = [v15 navigationBar];
  [v16 setPrefersLargeTitles:1];
}

- (void)didReceiveMemoryWarning
{
  v6.receiver = self;
  v6.super_class = (Class)TUIFeedViewController;
  [(TUIFeedViewController *)&v6 didReceiveMemoryWarning];
  unsigned int v3 = [(TUIFeedViewController *)self _appearState];
  uint64_t v4 = [(TUIFeedViewController *)self viewIfLoaded];
  id v5 = [v4 window];
  if (v5 || v3 == 1)
  {
  }
  else
  {

    if (v3 != 2)
    {
      [(TUIFeedViewController *)self suspendAndTeardownForReason:@"memory pressure: view not in window & VC is not appearing nor appeared"];
      [(TUIFeedViewController *)self setSuspendedDueToMemoryPressure:1];
    }
  }
}

- (id)_captureFeedViewState
{
  unsigned int v3 = objc_alloc_init(TUIMutableFeedViewState);
  [(TUISyncLayoutController *)self->_syncLayoutController contentOffset];
  double v5 = v4;
  double v7 = v6;
  int v8 = [(TUISyncLayoutController *)self->_syncLayoutController renderModel];
  double v9 = [v8 anchorSet];
  char v10 = [v9 scrollAnchorWithScrollView:self->_syncLayoutController offset:v5, v7];
  [(TUIFeedViewState *)v3 setFeedScrollAnchor:v10];

  return v3;
}

- (BOOL)_didSizeChangeComparedToEnvironment
{
  unsigned int v3 = [(TUIFeedViewController *)self viewIfLoaded];
  if (v3)
  {
    environment = self->_environment;
    if (environment)
    {
      [(TUIEnvironment *)environment viewSize];
      double width = v5;
      double height = v7;
    }
    else
    {
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
    }
    [v3 bounds];
    BOOL v11 = self->_environment == 0;
    BOOL v13 = width != v12 || self->_environment == 0;
    if (height != v10) {
      BOOL v11 = 1;
    }
    if ((uint64_t)self->_viewVisibilityController) {
      BOOL v11 = 0;
    }
    BOOL v9 = v13 || v11;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)viewWillLayoutSubviews
{
  [(TUIRenderReferenceOverrideProvider *)self->_renderOverrideProvider beginLayout];
  [(TUIFeedViewController *)self _updateHeightLayoutConditions];
  unsigned int v3 = [(TUIFeedViewController *)self _didSizeChangeComparedToEnvironment];
  if (!self->_auxiliaryRenderModel
    && ![(TUIFeedViewController *)self avoidSyncTransactionInViewWillAppear])
  {
    double v4 = [(TUIFeedViewController *)self content];
    if (v4)
    {
      BOOL needUpdate = self->_pendingViewAppearingTransition.needUpdate;

      if (needUpdate) {
        -[TUIFeedViewController _createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:](self, "_createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:", self->_pendingViewAppearingTransition.duration > 0.0, 0, 0, 1, 4);
      }
    }
  }
  self->_pendingViewAppearingTransition.BOOL needUpdate = 0;
  if (v3)
  {
    double v6 = [(TUIFeedViewController *)self viewIfLoaded];
    double v7 = [v6 window];
    if (v7
      || self->_auxiliaryRenderModel
      || +[UIView areAnimationsEnabled])
    {
    }
    else
    {
      unsigned __int8 v25 = [(TUIFeedViewController *)self avoidSyncTransactionInViewWillAppear];

      if ((v25 & 1) == 0) {
        [(TUIFeedViewController *)self _createSyncTransactionIfNeededAnimated:0 duration:0 timingParameters:1 timeout:1 isLayingOutFeed:4 ignoreWindow:0.0 flags:self->_viewTransitionSyncTimeoutDuration];
      }
    }
    uint64_t v8 = [(TUIFeedViewController *)self content];
    if (v8)
    {
      BOOL v9 = (void *)v8;
      double v10 = [(TUIFeedViewController *)self viewIfLoaded];
      BOOL v11 = [v10 window];
      double v12 = v11;
      if (v11 && !self->_auxiliaryRenderModel)
      {
        +[UIView inheritedAnimationDuration];
        double v24 = v23;

        if (v24 == 0.0)
        {
          self->_needsVisibleStateUpdate = 1;
          [(TUIFeedViewController *)self _createSyncTransactionIfNeededAnimated:0 duration:0 timingParameters:1 timeout:0 isLayingOutFeed:4 ignoreWindow:0.0 flags:*(double *)&self->_contextMenuConfigurationProvider];
        }
      }
      else
      {
      }
    }
  }
  if (self->_auxiliaryRenderModel
    || (*(unsigned char *)&self->_flags & 1) != 0
    || (!self->_environment ? (int v13 = 1) : (int v13 = v3), v13 == 1))
  {
    double v14 = TUILayoutLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      visibilityController = self->_visibilityController;
      BOOL v16 = self->_auxiliaryRenderModel != 0;
      uint64_t v17 = *(unsigned char *)&self->_flags & 1;
      BOOL v18 = self->_environment != 0;
      feedView = self->_feedView;
      *(_DWORD *)buf = 134219266;
      v28 = visibilityController;
      __int16 v29 = 2048;
      v30 = (TUIFeedView *)v16;
      __int16 v31 = 2048;
      uint64_t v32 = v17;
      __int16 v33 = 2048;
      BOOL v34 = v18;
      __int16 v35 = 2048;
      uint64_t v36 = v3;
      __int16 v37 = 2112;
      v38 = feedView;
      _os_log_impl(&def_141F14, v14, OS_LOG_TYPE_DEFAULT, "[fid:%lu] viewWillLayoutSubviews start sync layout: wasSync=%ld, force=%ld, hasEnv=%ld, changedSize=%ld, FeedLayoutController=%@", buf, 0x3Eu);
    }

    [(TUIFeedViewController *)self _layoutFeedIgnoringWindow:self->_auxiliaryRenderModel != 0];
  }
  else
  {
    double v20 = TUILayoutLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_visibilityController;
      v22 = self->_feedView;
      *(_DWORD *)buf = 134218242;
      v28 = v21;
      __int16 v29 = 2112;
      v30 = v22;
      _os_log_impl(&def_141F14, v20, OS_LOG_TYPE_DEFAULT, "[fid:%lu] viewWillLayoutSubviews start async layout: FeedLayoutController=%@", buf, 0x16u);
    }

    [(TUIFeedViewController *)self layoutIfNeeded];
  }
  *(unsigned char *)&self->_flags &= ~1u;
  v26.receiver = self;
  v26.super_class = (Class)TUIFeedViewController;
  [(TUIFeedViewController *)&v26 viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
  if (self->_needsVisibleStateUpdate)
  {
    [(TUISyncLayoutController *)self->_syncLayoutController restoreViewStateForVisibleViews];
    self->_needsVisibleStateUpdate = 0;
  }
  [(TUIRenderReferenceOverrideProvider *)self->_renderOverrideProvider endLayout];
  [(TUIHostingController *)self->_hostingController updateView];
  [(TUIHostingController *)self->_hostingController updatePopoverLayout];
  v3.receiver = self;
  v3.super_class = (Class)TUIFeedViewController;
  [(TUIFeedViewController *)&v3 viewDidLayoutSubviews];
}

- (id)_renderModel
{
  return [(TUISyncLayoutController *)self->_syncLayoutController renderModel];
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_syncLayoutController;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIFeedViewController;
  [(TUIFeedViewController *)&v12 willTransitionToTraitCollection:a3 withTransitionCoordinator:v6];
  self->_needsVisibleStateUpdate = 1;
  [(TUIFeedViewController *)self setNeedsEnvironmentUpdate];
  ++self->_pendingCoordinatedTransition.needUpdate;
  [v6 transitionDuration];
  self->_pendingCoordinatedTransition.duration = v7;
  char v8 = objc_opt_respondsToSelector();
  if (v8)
  {
    BOOL v9 = [v6 timingParameters];
  }
  else
  {
    BOOL v9 = 0;
  }
  objc_storeStrong((id *)&self->_pendingCoordinatedTransitionTimingProvider, v9);
  if (v8) {

  }
  double v10 = [(TUITemplateFactory *)self->_templateFactory imageResourceCache];
  [v10 deferLoadsBegin];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_119DA0;
  v11[3] = &unk_255958;
  v11[4] = self;
  [v6 animateAlongsideTransition:0 completion:v11];
}

- (void)tui_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  self->_needsVisibleStateUpdate = 1;
  [(TUIFeedViewController *)self setNeedsEnvironmentUpdate];
}

- (void)_createSyncTransactionIfNeededAnimated:(BOOL)a3 duration:(double)a4 timeout:(double)a5 flags:(unint64_t)a6
{
}

- (void)_createSyncTransactionWithOptions:(id)a3
{
  if (!self->_auxiliaryRenderModel)
  {
    double v4 = +[TUITransaction transactionWithOptions:a3];
    auxiliaryRenderModel = self->_auxiliaryRenderModel;
    self->_auxiliaryRenderModel = v4;

    id v6 = [(TUIFeedViewController *)self _captureFeedViewState];
    suspendedViewState = self->_suspendedViewState;
    self->_suspendedViewState = v6;

    id v8 = [(TUIFeedView *)self->_feedView transactionCoordinator];
    [v8 scheduleSyncTransaction:self->_auxiliaryRenderModel];
  }
}

- (void)_createSyncTransactionIfNeededAnimated:(BOOL)a3 duration:(double)a4 timingParameters:(id)a5 timeout:(double)a6 isLayingOutFeed:(BOOL)a7 ignoreWindow:(BOOL)a8 flags:(unint64_t)a9
{
  BOOL v14 = a3;
  id v16 = a5;
  if (!self->_auxiliaryRenderModel)
  {
    if (a8
      || ([(TUIFeedViewController *)self viewIfLoaded],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          [v17 window],
          BOOL v18 = objc_claimAutoreleasedReturnValue(),
          v18,
          v17,
          v18))
    {
      v19 = objc_alloc_init(TUIMutableTransactionOptions);
      [(TUITransactionOptions *)v19 setAnimate:v14];
      [(TUITransactionOptions *)v19 setDuration:a4];
      [(TUITransactionOptions *)v19 setSyncTimeout:a6];
      [(TUITransactionOptions *)v19 setFlags:a9];
      [(TUITransactionOptions *)v19 setTimingProvider:v16];
      double v20 = +[TUITransaction transactionWithOptions:v19];
      auxiliaryRenderModel = self->_auxiliaryRenderModel;
      self->_auxiliaryRenderModel = v20;

      v22 = [(TUIFeedViewController *)self _captureFeedViewState];
      suspendedViewState = self->_suspendedViewState;
      self->_suspendedViewState = v22;

      double v24 = [(TUIFeedView *)self->_feedView transactionCoordinator];
      [v24 scheduleSyncTransaction:self->_auxiliaryRenderModel];

      if (!a7)
      {
        unsigned __int8 v25 = [(TUIFeedViewController *)self view];
        [v25 setNeedsLayout];
      }
      objc_super v26 = TUITransactionLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        visibilityController = self->_visibilityController;
        v28 = [(TUIRenderModelAuxiliary *)self->_auxiliaryRenderModel tx];
        int v29 = 134218242;
        v30 = visibilityController;
        __int16 v31 = 2114;
        uint64_t v32 = v28;
        _os_log_impl(&def_141F14, v26, OS_LOG_TYPE_INFO, "[fid:%lu] _createSyncTransactionIfNeededAnimated:... syncTransaction=%{public}@", (uint8_t *)&v29, 0x16u);
      }
    }
  }
}

- (void)feedLayoutController:(id)a3 applyUpdatesFromTransactionGroup:(id)a4
{
  id v5 = a4;
  if ([v5 flags])
  {
    [(TUIRenderReferenceOverrideProvider *)self->_renderOverrideProvider beginViewUpdates];
    [v5 applyUpdates];
    id v6 = [(TUIFeedViewController *)self view];
    [v6 layoutIfNeeded];

    [(TUIRenderReferenceOverrideProvider *)self->_renderOverrideProvider endViewUpdatesNotifyDelegate:0];
    if ([(TUIRenderReferenceOverrideProvider *)self->_renderOverrideProvider geometryUpdatedFlag])
    {
      [v5 addNotifyWhenAppliedDeferral];
      double v7 = [v5 options];
      [(TUIFeedViewController *)self _createSyncTransactionWithOptions:v7];

      [(TUIFeedViewController *)self _updateHostingGeometryMapWithTransaction:self->_auxiliaryRenderModel];
      id v8 = self->_auxiliaryRenderModel;
      auxiliaryRenderModel = self->_auxiliaryRenderModel;
      self->_auxiliaryRenderModel = 0;

      [(TUIRenderModelAuxiliary *)v8 commit];
      double v10 = TUITransactionLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        visibilityController = self->_visibilityController;
        objc_super v12 = [(TUIRenderModelAuxiliary *)v8 tx];
        *(_DWORD *)buf = 134218242;
        int v29 = visibilityController;
        __int16 v30 = 2112;
        __int16 v31 = v12;
        _os_log_impl(&def_141F14, v10, OS_LOG_TYPE_DEFAULT, "[fid:%lu] scheduled sync transaction for hosting geometry update: %@", buf, 0x16u);
      }
      int v13 = [(TUIFeedViewController *)self _effectiveSyncLayoutController];
      BOOL v14 = [(TUIRenderModelAuxiliary *)v8 options];
      [v14 syncTimeout];
      double v16 = v15;
      uint64_t v17 = [(TUIRenderModelAuxiliary *)v8 tx];
      BOOL v18 = [v13 syncAssertionWithTimeout:v17 transaction:self->_visibilityController feedId:v16];

      v19 = [(TUIRenderModelAuxiliary *)v8 tx];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_11A428;
      v26[3] = &unk_251990;
      id v27 = v5;
      [v19 notifyWhenAppliedWithBlock:v26];
      double v20 = [(TUIFeedView *)self->_feedView transactionCoordinator];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_11A430;
      v23[3] = &unk_252320;
      v23[4] = self;
      double v24 = v8;
      id v25 = v18;
      id v21 = v18;
      v22 = v8;
      [v20 waitForSyncTransaction:v22 completion:v23];
    }
  }
  else
  {
    [v5 applyUpdates];
  }
}

- (void)_waitForSyncTransactionCompletion:(id)a3
{
  double v4 = (void (**)(void))a3;
  auxiliaryRenderModel = self->_auxiliaryRenderModel;
  if (auxiliaryRenderModel)
  {
    self->_auxiliaryRenderModel = 0;
    id v8 = v4;
    id v6 = auxiliaryRenderModel;

    [(TUIRenderModelAuxiliary *)v6 commit];
    double v7 = [(TUIFeedView *)self->_feedView transactionCoordinator];
    [v7 waitForSyncTransaction:v6 completion:v8];
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    id v8 = v4;
    v4[2]();
  }
  double v4 = v8;
LABEL_6:
}

- (void)_waitForSyncTransaction
{
  auxiliaryRenderModel = self->_auxiliaryRenderModel;
  if (auxiliaryRenderModel)
  {
    double v4 = auxiliaryRenderModel;
    id v5 = self->_auxiliaryRenderModel;
    self->_auxiliaryRenderModel = 0;

    [(TUIRenderModelAuxiliary *)v4 commit];
    id v6 = [(TUIFeedViewController *)self _effectiveSyncLayoutController];
    double v7 = [(TUIRenderModelAuxiliary *)v4 options];
    [v7 syncTimeout];
    double v9 = v8;
    double v10 = [(TUIRenderModelAuxiliary *)v4 tx];
    BOOL v11 = [v6 syncAssertionWithTimeout:v10 transaction:self->_visibilityController feedId:v9];

    objc_super v12 = [(TUIFeedView *)self->_feedView transactionCoordinator];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_11A764;
    v16[3] = &unk_252320;
    v16[4] = self;
    uint64_t v17 = v4;
    id v18 = v11;
    id v13 = v11;
    BOOL v14 = v4;
    [v12 waitForSyncTransaction:v14 completion:v16];

    suspendedViewState = self->_suspendedViewState;
    self->_suspendedViewState = 0;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  self->_needsVisibleStateUpdate = 1;
  ++self->_pendingCoordinatedTransition.needUpdate;
  [v7 transitionDuration];
  self->_pendingCoordinatedTransition.duration = v8;
  char v9 = objc_opt_respondsToSelector();
  if (v9)
  {
    double v10 = [v7 timingParameters];
  }
  else
  {
    double v10 = 0;
  }
  objc_storeStrong((id *)&self->_pendingCoordinatedTransitionTimingProvider, v10);
  if (v9) {

  }
  BOOL v11 = [(TUITemplateFactory *)self->_templateFactory imageResourceCache];
  [v11 deferLoadsBegin];

  v12[4] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_11AA00;
  v13[3] = &unk_255958;
  v13[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_11AB80;
  v12[3] = &unk_255958;
  [v7 animateAlongsideTransition:v13 completion:v12];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TUIFeedViewController;
  [(TUIFeedViewController *)&v10 viewWillAppear:a3];
  if (![(TUIFeedViewController *)self avoidSyncTransactionInViewWillAppear])
  {
    double v4 = [(TUIFeedViewController *)self content];

    if (v4)
    {
      self->_pendingViewAppearingTransition.BOOL needUpdate = 1;
      +[UIView inheritedAnimationDuration];
      self->_pendingViewAppearingTransition.duration = v5;
    }
  }
  [(TUIFeedViewController *)self _updatePriority];
  heightGuessForScrollingOption = (void *)self->_heightGuessForScrollingOption;
  if (!heightGuessForScrollingOption)
  {
    id v7 = [[TUIKeyboardAvoidingSupport alloc] initWithViewController:self];
    double v8 = (void *)self->_heightGuessForScrollingOption;
    self->_heightGuessForScrollingOption = (unint64_t)v7;

    heightGuessForScrollingOption = (void *)self->_heightGuessForScrollingOption;
  }
  [heightGuessForScrollingOption registerForNotifications];
  [self->_heightGuessForScrollingOption setViewIsDisappearing:0];
  id v9 = [(TUIFeedViewController *)self resumeAndRebuildForReason:@"view appearing"];
  [(TUIFeedViewController *)self setSuspendedDueToMemoryPressure:0];
  [(TUIFeedView *)self->_feedView statRecordViewWillAppear];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TUIFeedViewController;
  [(TUIFeedViewController *)&v12 viewDidAppear:a3];
  self->_pendingViewAppearingTransition.BOOL needUpdate = 0;
  [(TUIFeedViewController *)self _updatePriority];
  [(TUIEmbeddedScrollViewCoordinator *)self->_embeddedScrollViewCoordinator updateVisible];
  if ([(TUIFeedViewController *)self suspendedDueToMemoryPressure])
  {
    id v4 = [(TUIFeedViewController *)self resumeAndRebuildForReason:@"view appeared: recovering from suspend caused by memory pressure"];
    [(TUIFeedViewController *)self setSuspendedDueToMemoryPressure:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_content);
  id v6 = [(TUIFeedViewController *)self navigationItem];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [WeakRetained feedViewControllerNavigationBarItem:self];

    id v6 = (void *)v7;
  }
  [(TUIFeedOverlayDebugView *)self->_overlayDebugView configureSearchControllerIfNeededForNavigationItem:v6];
  double v8 = [(TUIFeedView *)self->_feedView anchorSet];
  if (v8)
  {
    dropController = self->_dropController;
    objc_super v10 = [(TUIFeedViewController *)self scrollView];
    BOOL v11 = [v8 computeTriggerStatesInScrollView:v10 axis:2];
    [(TUIDropController *)dropController updateTriggerStatesWithNewStates:v11 updateEvent:0];
  }
  self->_updateEnvironmentOnViewLoad = 0;
}

- (TUISearchController)searchController
{
  return (TUISearchController *)[(TUIFeedOverlayDebugView *)self->_overlayDebugView searchController];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [self->_heightGuessForScrollingOption setViewIsDisappearing:1];
  [self->_heightGuessForScrollingOption unregisterForNotifications];
  v5.receiver = self;
  v5.super_class = (Class)TUIFeedViewController;
  [(TUIFeedViewController *)&v5 viewWillDisappear:v3];
  [(TUIFeedViewController *)self _updatePriority];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TUIFeedViewController;
  [(TUIFeedViewController *)&v8 viewDidDisappear:a3];
  [(TUIEmbeddedScrollViewCoordinator *)self->_embeddedScrollViewCoordinator updateVisible];
  [(TUIFeedViewController *)self _updatePriority];
  [(NSHashTable *)self->_heightLayoutConditions invalidatePendingScrolls];
  id v4 = [(TUIFeedView *)self->_feedView anchorSet];
  objc_super v5 = v4;
  if (v4)
  {
    dropController = self->_dropController;
    uint64_t v7 = [v4 feedNotVisibleTriggerStatesForAxis:2];
    [(TUIDropController *)dropController updateTriggerStatesWithNewStates:v7 updateEvent:1];
  }
  self->_updateEnvironmentOnViewLoad = 1;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TUIFeedViewController;
  [(TUIFeedViewController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3) {
    [(TUIFeedViewController *)self setNeedsEnvironmentUpdate];
  }
}

- (TUIFeedContent)content
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = *(id *)&self->_hiddenPriority;
  os_unfair_lock_unlock(p_lock);

  return (TUIFeedContent *)v4;
}

- (void)setContent:(id)a3
{
  id v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = *(id *)&self->_hiddenPriority;
  os_unfair_lock_unlock(&self->_lock);
  if (([v5 isEqual:v9] & 1) == 0)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_hiddenPriority, a3);
    objc_super v6 = [*(id *)&self->_hiddenPriority currentStackName];
    uint64_t v7 = [v6 instanceForObserver:self];
    restoreViewState = self->_restoreViewState;
    self->_restoreViewState = v7;

    os_unfair_lock_unlock(&self->_lock);
    [(TUIFeedViewController *)self _setContentNeedsUpdate];
  }
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TUISyncLayoutController *)self->_syncLayoutController showsVerticalScrollIndicator] != a3)
  {
    *((unsigned char *)&self->_flags + 3) = v3;
    syncLayoutController = self->_syncLayoutController;
    [(TUISyncLayoutController *)syncLayoutController setShowsVerticalScrollIndicator:v3];
  }
}

- (void)synchronouslyUpdateContent:(id)a3 environment:(id)a4 andWaitForEntry:(id)a5 timeout:(double)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(TUIFeedViewController *)self _effectiveSyncLayoutController];
  id v14 = [v13 syncAssertionWithTimeout:0 transaction:self->_visibilityController feedId:a6];

  [(TUIFeedViewController *)self _synchronouslyUpdateContent:v12 environment:v11 andWaitForEntry:v10 timeout:v14 assertion:0 completion:a6];
}

- (void)synchronouslyUpdateContent:(id)a3 environment:(id)a4 andWaitForEntry:(id)a5 timeout:(double)a6 completion:(id)a7
{
}

- (void)_synchronouslyUpdateContent:(id)a3 environment:(id)a4 andWaitForEntry:(id)a5 timeout:(double)a6 assertion:(id)a7 completion:(id)a8
{
  id v15 = a3;
  id v32 = a4;
  unint64_t v16 = (unint64_t)a7;
  unint64_t v17 = (unint64_t)a8;
  id v18 = *(void **)&self->_hiddenPriority;
  *(void *)&self->_hiddenPriority = 0;
  id v19 = a5;

  [(TUIFeedViewController *)self loadViewIfNeeded];
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_hiddenPriority, a3);
  double v20 = [*(id *)&self->_hiddenPriority currentStackName];
  id v21 = [v20 instanceForObserver:self];
  restoreViewState = self->_restoreViewState;
  self->_restoreViewState = v21;

  self->_contentNeedsUpdate = 0;
  os_unfair_lock_unlock(&self->_lock);
  auxiliaryRenderModel = self->_auxiliaryRenderModel;
  if (!auxiliaryRenderModel)
  {
    [(TUIFeedViewController *)self _createSyncTransactionIfNeededAnimated:0 duration:0 timingParameters:0 timeout:1 isLayingOutFeed:0 ignoreWindow:0.0 flags:a6];
    auxiliaryRenderModel = self->_auxiliaryRenderModel;
  }
  double v24 = auxiliaryRenderModel;
  id v25 = TUITransactionLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    visibilityController = self->_visibilityController;
    id v27 = [(TUIRenderModelAuxiliary *)self->_auxiliaryRenderModel tx];
    *(_DWORD *)buf = 134218242;
    id v39 = visibilityController;
    __int16 v40 = 2114;
    __int16 v41 = v27;
    _os_log_impl(&def_141F14, v25, OS_LOG_TYPE_INFO, "[fid:%lu] _synchronouslyUpdateContent:... syncTransaction=%{public}@", buf, 0x16u);
  }
  [(TUIRenderReferenceOverrideProvider *)self->_renderOverrideProvider reset];
  if (v32) {
    objc_storeStrong((id *)&self->_environment, a4);
  }
  else {
    [(TUIFeedViewController *)self _updateEnvironment];
  }
  [(TUIFeedView *)self->_feedView updateWithContent:v15 layoutUpToEntry:v19 environment:self->_environment transaction:v24];

  if (v16 | v17)
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_11B684;
    v35[3] = &unk_2525D8;
    id v36 = (id)v16;
    id v37 = (id)v17;
    v28 = objc_retainBlock(v35);
    int v29 = [(TUIRenderModelAuxiliary *)v24 tx];
    __int16 v30 = v29;
    if (v29) {
      [v29 notifyWhenAppliedWithBlock:v28];
    }
    else {
      ((void (*)(void *))v28[2])(v28);
    }
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_11B6D8;
  v33[3] = &unk_251828;
  v33[4] = self;
  BOOL v34 = v24;
  __int16 v31 = v24;
  [(TUIFeedViewController *)self _waitForSyncTransactionCompletion:v33];
}

- (void)finalizeSynchronousTransaction:(id)a3
{
  if (a3)
  {
    feedView = self->_feedView;
    id v5 = a3;
    objc_super v6 = [(TUIFeedView *)feedView transactionCoordinator];
    [v6 finalizeSyncTransaction:v5];

    auxiliaryRenderModel = self->_auxiliaryRenderModel;
    self->_auxiliaryRenderModel = 0;

    suspendedViewState = self->_suspendedViewState;
    self->_suspendedViewState = 0;
  }
}

- (void)_updateLayoutIfNeededIgnoringWindow:(BOOL)a3
{
  if (!self->_pauseEnvironmentUpdates
    && self->_environment
    && [(TUIFeedViewController *)self _didSizeChangeComparedToEnvironment])
  {
    self->_environmentNeedsUpdate = 1;
  }
  unsigned __int8 v5 = [(TUIFeedViewController *)self _shouldDisableLayoutDueToAppBeingBackgrounded];
  if (self->_environmentNeedsUpdate && !self->_pauseEnvironmentUpdates)
  {
    if (v5) {
      goto LABEL_11;
    }
    if (a3
      || ([(TUIFeedViewController *)self viewIfLoaded],
          __int16 v31 = objc_claimAutoreleasedReturnValue(),
          [v31 window],
          id v32 = objc_claimAutoreleasedReturnValue(),
          v32,
          v31,
          v32))
    {
      self->_environmentNeedsUpdate = 0;
      [(TUIFeedViewController *)self _updateEnvironment];
      __int16 v33 = self->_suspendedViewState;
      if (!v33)
      {
        if (([(TUISyncLayoutController *)self->_syncLayoutController isDragging] & 1) != 0
          || ([(TUISyncLayoutController *)self->_syncLayoutController isTracking] & 1) != 0
          || ([(TUISyncLayoutController *)self->_syncLayoutController isDecelerating] & 1) != 0
          || ([(TUISyncLayoutController *)self->_syncLayoutController _isAnimatingScroll] & 1) != 0)
        {
          __int16 v33 = 0;
        }
        else
        {
          __int16 v33 = [(TUIFeedViewController *)self _captureFeedViewState];
        }
      }
      [(TUIFeedViewController *)self _updateHostingGeometryMapIfNeededWithTransaction:self->_auxiliaryRenderModel];
      BOOL v34 = [(TUIFeedViewController *)self layoutController];
      [v34 updateWithEnvironment:self->_environment state:v33 withTransaction:self->_auxiliaryRenderModel];
    }
  }
  else if (v5)
  {
    goto LABEL_11;
  }
  os_unfair_lock_lock(&self->_lock);
  BOOL contentNeedsUpdate = self->_contentNeedsUpdate;
  self->_BOOL contentNeedsUpdate = 0;
  os_unfair_lock_unlock(&self->_lock);
  if (contentNeedsUpdate) {
    [(TUIFeedViewController *)self _loadFeed];
  }
LABEL_11:
  [(TUIFeedViewController *)self _viewSize];
  double v37 = v8;
  double v38 = v7;
  syncLayoutController = self->_syncLayoutController;
  [(TUISyncLayoutController *)syncLayoutController contentOffset];
  double v35 = v11;
  double v36 = v10;
  id v12 = [(TUIFeedViewController *)self scrollView];
  [v12 contentInset];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(TUISyncLayoutController *)self->_syncLayoutController safeAreaInsets];
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  int v29 = [(TUIFeedViewController *)self tabBarController];
  -[TUISyncLayoutController updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:](syncLayoutController, "updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:", v29 != 0, v38, v37, v36, v35, v14, v16, v18, v20, v22, v24, v26, v28);

  if (self->_needsVisibleStateUpdate)
  {
    __int16 v30 = self->_syncLayoutController;
    [(TUISyncLayoutController *)v30 saveViewStateForVisibleViews];
  }
}

- (void)layoutIfNeeded
{
}

- (void)_layoutFeed
{
}

- (void)_layoutFeedIgnoringWindow:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_auxiliaryRenderModel)
  {
    unsigned __int8 v5 = [(TUIFeedViewController *)self content];
    if (v5)
    {
      unint64_t needUpdate = self->_pendingCoordinatedTransition.needUpdate;

      if (needUpdate) {
        -[TUIFeedViewController _createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:](self, "_createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:", self->_pendingCoordinatedTransition.duration > 0.0, self->_pendingCoordinatedTransitionTimingProvider, 1, 0, 6);
      }
    }
  }
  [(TUIFeedViewController *)self _updateLayoutIfNeededIgnoringWindow:v3];

  [(TUIFeedViewController *)self _waitForSyncTransaction];
}

- (void)_updateHostingGeometryMapWithTransaction:(id)a3
{
  feedView = self->_feedView;
  renderOverrideProvider = self->_renderOverrideProvider;
  id v6 = a3;
  id v7 = [(TUIRenderReferenceOverrideProvider *)renderOverrideProvider newGeometryMap];
  [(TUIFeedView *)feedView updateHostingGeometryMap:v7 withTransaction:v6];

  double v8 = self->_renderOverrideProvider;

  [(TUIRenderReferenceOverrideProvider *)v8 resetGeometryUpdatedFlag];
}

- (void)_updateHostingGeometryMapIfNeededWithTransaction:(id)a3
{
  id v6 = a3;
  if ([(TUIRenderReferenceOverrideProvider *)self->_renderOverrideProvider geometryUpdatedFlag])
  {
    feedView = self->_feedView;
    id v5 = [(TUIRenderReferenceOverrideProvider *)self->_renderOverrideProvider newGeometryMap];
    [(TUIFeedView *)feedView updateHostingGeometryMap:v5 withTransaction:v6];

    [(TUIRenderReferenceOverrideProvider *)self->_renderOverrideProvider resetGeometryUpdatedFlag];
  }
}

- (void)flushPendingTransactionsWithTimeout:(double)a3
{
  if (self->_auxiliaryRenderModel)
  {
    id v4 = TUIDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1927C8((uint64_t)self, v4);
    }
  }
  else
  {
    [(TUIFeedViewController *)self _createSyncTransactionIfNeededAnimated:0 duration:0 timingParameters:0 timeout:1 isLayingOutFeed:8 ignoreWindow:0.0 flags:a3];
  }
  [(TUIFeedViewController *)self _layoutFeedIgnoringWindow:1];
}

- (void)flushPendingTransactionsWithCompletion:(id)a3
{
  id v7 = a3;
  [(TUIFeedViewController *)self _updateLayoutIfNeededIgnoringWindow:1];
  id v4 = +[TUITransactionOptions noAnimationOptions];
  [v4 setFlags:8];
  id v5 = +[TUITransaction transactionWithOptions:v4];
  if (v7) {
    [v5 addCompletion:v7 queue:&_dispatch_main_q];
  }
  id v6 = [(TUIFeedView *)self->_feedView transactionCoordinator];
  [v6 scheduleLayoutUpdateWithTransaction:v5 block:&stru_255A18];
}

- (void)pauseUpdates
{
  id v2 = [(TUIFeedView *)self->_feedView transactionCoordinator];
  [v2 pauseUpdates];
}

- (void)resumeUpdates
{
  id v2 = [(TUIFeedView *)self->_feedView transactionCoordinator];
  [v2 resumeUpdates];
}

- (void)pauseEnvironmentUpdates
{
}

- (void)resumeEnvironmentUpdates
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  unint64_t v3 = self->_pauseEnvironmentUpdates - 1;
  self->_pauseEnvironmentUpdates = v3;
  if (!v3)
  {
    [(TUIFeedViewController *)self _createSyncTransactionIfNeededAnimated:0 duration:0 timingParameters:1 timeout:0 isLayingOutFeed:6 ignoreWindow:0.0 flags:*(double *)&self->_contextMenuConfigurationProvider];
    id v4 = [(TUIFeedViewController *)self view];
    [v4 setNeedsLayout];
  }
}

- (void)suspendAndTeardownForReason:(id)a3
{
  id v4 = a3;
  id v5 = TUIDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    visibilityController = self->_visibilityController;
    int v13 = 134218242;
    double v14 = visibilityController;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&def_141F14, v5, OS_LOG_TYPE_DEFAULT, "[fid:%lu] suspend and teardown for reason: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  if ([(TUIFeedViewController *)self runningInExtension])
  {
    [(TUISyncLayoutController *)self->_syncLayoutController contentSize];
    self->_savedContentOffset.y = v7;
    self->_savedContentSize.double width = v8;
    [(TUISyncLayoutController *)self->_syncLayoutController contentOffset];
    self->_debugDelegate = v9;
    self->_savedContentOffset.x = v10;
  }
  double v11 = [(TUIFeedViewController *)self _captureFeedViewState];
  [(TUIFeedViewController *)self setSuspendedViewState:v11];

  [(TUIFeedViewController *)self _teardownFeedView];
  [(TUIFeedViewController *)self _teardownControllers];
  environment = self->_environment;
  self->_environment = 0;

  [(TUIFeedView *)self->_feedView suspendAndTeardownWithTransaction:self->_auxiliaryRenderModel];
}

- (void)clearSuspendedViewState
{
  unint64_t v3 = [(TUIFeedViewController *)self suspendedViewState];
  id v4 = [v3 mutableCopy];

  [v4 setFeedScrollAnchor:0];
  [(TUIFeedViewController *)self setSuspendedViewState:v4];
}

- (id)resumeAndRebuildForReason:(id)a3
{
  id v4 = a3;
  id v5 = TUIDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    visibilityController = self->_visibilityController;
    int v19 = 134218242;
    double v20 = visibilityController;
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_impl(&def_141F14, v5, OS_LOG_TYPE_DEFAULT, "[fid:%lu] resume and rebuild for reason: %{public}@", (uint8_t *)&v19, 0x16u);
  }

  CGFloat v7 = [(TUIFeedViewController *)self suspendedViewState];

  if (v7)
  {
    [(TUIFeedViewController *)self _setupControllers];
    [(TUIFeedViewController *)self _setupFeedView];
    if ([(TUIFeedViewController *)self runningInExtension])
    {
      if ((*(double *)&self->_debugDelegate != CGPointZero.x || self->_savedContentOffset.x != CGPointZero.y)
        && (self->_savedContentOffset.y != CGSizeZero.width || self->_savedContentSize.width != CGSizeZero.height))
      {
        -[TUISyncLayoutController setContentSize:](self->_syncLayoutController, "setContentSize:");
        -[TUISyncLayoutController setContentOffset:animated:](self->_syncLayoutController, "setContentOffset:animated:", 0, *(double *)&self->_debugDelegate, self->_savedContentOffset.x);
      }
    }
    *(unsigned char *)&self->_flags |= 1u;
    CGFloat v10 = [(TUIFeedViewController *)self view];
    [v10 setNeedsLayout];

    [(TUIFeedViewController *)self _updateEnvironment];
    auxiliaryRenderModel = self->_auxiliaryRenderModel;
    if (auxiliaryRenderModel) {
      goto LABEL_20;
    }
    if (![(TUIFeedViewController *)self avoidSyncTransactionInViewWillAppear])
    {
      id v12 = [(TUIFeedViewController *)self content];
      if (v12)
      {
        BOOL needUpdate = self->_pendingViewAppearingTransition.needUpdate;

        if (needUpdate)
        {
          self->_pendingViewAppearingTransition.BOOL needUpdate = 0;
          -[TUIFeedViewController _createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:](self, "_createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:", self->_pendingViewAppearingTransition.duration > 0.0, 0, 0, 1, 4);
        }
      }
    }
    auxiliaryRenderModel = self->_auxiliaryRenderModel;
    if (auxiliaryRenderModel)
    {
LABEL_20:
      double v14 = auxiliaryRenderModel;
    }
    else
    {
      double v14 = +[TUITransaction currentOrImplicitTransaction];
    }
    CGFloat v7 = v14;
    feedView = self->_feedView;
    environment = self->_environment;
    double v17 = [(TUIFeedViewController *)self suspendedViewState];
    [(TUIFeedView *)feedView resumeAndRebuildWithEnvironment:environment state:v17 transaction:v7];

    [(TUIFeedViewController *)self setSuspendedViewState:0];
    [(TUIFeedViewController *)self visibilityProviderIsVisible];
  }

  return v7;
}

- (id)suspendUpdatesUntilContentExceedsHeightWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [TUIFeedHeightLayoutCondition alloc];
  id v6 = [(TUIFeedViewController *)self viewIfLoaded];
  CGFloat v7 = [(TUIFeedHeightLayoutCondition *)v5 initWithView:v6 completion:v4];

  [(TUIFeedView *)self->_feedView suspendUpdatesUntilMeetingLayoutCondition:v7];
  viewFactory = self->_viewFactory;
  if (!viewFactory)
  {
    id v9 = +[NSHashTable hashTableWithOptions:517];
    CGFloat v10 = self->_viewFactory;
    self->_viewFactory = v9;

    viewFactory = self->_viewFactory;
  }
  [(TUIViewFactory *)viewFactory addObject:v7];

  return v7;
}

- (void)_updateHeightLayoutConditions
{
  unint64_t v3 = [(TUIFeedViewController *)self viewIfLoaded];
  if (v3)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = self->_viewFactory;
    id v5 = [(TUIViewFactory *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        CGFloat v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) updateWithView:v3 v9];
          CGFloat v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(TUIViewFactory *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)suspendUpdates
{
  unint64_t v3 = [(TUIFeedBaseLayoutCondition *)[TUIFeedSuspendLayoutUpdateCondition alloc] initWithCompletion:0];
  [(TUIFeedView *)self->_feedView suspendUpdatesUntilMeetingLayoutCondition:v3];

  return v3;
}

- (void)suspendUpdatesUntilEndOfTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIFeedBaseLayoutCondition *)[TUIFeedSuspendLayoutUpdateCondition alloc] initWithCompletion:0];
  if (!v4)
  {
    id v4 = +[TUITransaction currentOrImplicitTransaction];
  }
  [(TUIFeedView *)self->_feedView suspendUpdatesUntilMeetingLayoutCondition:v5];
  id v6 = [(TUIFeedView *)self->_feedView transactionCoordinator];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_11C7E0;
  v8[3] = &unk_2526E0;
  long long v9 = v5;
  uint64_t v7 = v5;
  [v6 scheduleLayoutUpdateWithTransaction:v4 block:v8];
}

- (id)suspendLayout
{
  unint64_t v3 = [(TUIFeedBaseLayoutCondition *)[TUIFeedSuspendLayoutCondition alloc] initWithCompletion:0];
  [(TUIFeedView *)self->_feedView suspendLayoutsUntilMeetingLayoutCondition:v3];

  return v3;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(TUIHostingController *)self->_hostingController updatedVisibleBoundsOfScrollView:self->_syncLayoutController];
  id v4 = [(TUIEmbeddedScrollViewCoordinator *)self->_embeddedScrollViewCoordinator rootCollector];
  [v4 updateVisibleBounds];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  [(TUIHostingController *)self->_hostingController updatedVisibleBoundsOfScrollView:self->_syncLayoutController];
  id v4 = [(TUIEmbeddedScrollViewCoordinator *)self->_embeddedScrollViewCoordinator rootCollector];
  [v4 updateVisibleBounds];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  -[TUIHostingController updatedVisibleBoundsOfScrollView:](self->_hostingController, "updatedVisibleBoundsOfScrollView:", self->_syncLayoutController, a4);
  id v5 = [(TUIEmbeddedScrollViewCoordinator *)self->_embeddedScrollViewCoordinator rootCollector];
  [v5 updateVisibleBounds];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v50 = a3;
  id v4 = [(TUIEmbeddedScrollViewCoordinator *)self->_embeddedScrollViewCoordinator rootCollector];
  [v4 updateVisibleBounds];

  [(TUIHostingController *)self->_hostingController updatedVisibleBoundsOfScrollView:self->_syncLayoutController];
  [(NSHashTable *)self->_heightLayoutConditions invalidatePendingScrolls];
  id v5 = [(TUIFeedView *)self->_feedView anchorSet];
  id v6 = v5;
  if (v5)
  {
    dropController = self->_dropController;
    CGFloat v8 = [v5 computeTriggerStatesInScrollView:v50 axis:2];
    [(TUIDropController *)dropController updateTriggerStatesWithNewStates:v8 updateEvent:3];
  }
  long long v9 = [(TUIFeedViewController *)self navigationController];
  long long v10 = [v9 topViewController];

  if (v10 == self) {
    [(TUIFeedViewController *)self updateNavigationBarOpacity];
  }
  syncLayoutController = self->_syncLayoutController;
  [(TUIFeedViewController *)self _viewSize];
  double v48 = v13;
  double v49 = v12;
  [v50 contentOffset];
  double v46 = v15;
  double v47 = v14;
  id v16 = [(TUIFeedViewController *)self scrollView];
  [v16 contentInset];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  [v50 safeAreaInsets];
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  __int16 v33 = [(TUIFeedViewController *)self tabBarController];
  -[TUISyncLayoutController updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:](syncLayoutController, "updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:", v33 != 0, v49, v48, v47, v46, v18, v20, v22, v24, v26, v28, v30, v32);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_content);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained feedViewControllerDidScroll:self];
  }
  linkEntityController = self->_linkEntityController;
  double v36 = [(TUISyncLayoutController *)self->_syncLayoutController renderModel];
  [(TUISyncLayoutController *)self->_syncLayoutController visibleBounds];
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  v45 = [(TUISyncLayoutController *)self->_syncLayoutController currentViewState];
  -[TUILinkEntityController updatePrioritiesForRenderModel:visibleRect:viewState:](linkEntityController, "updatePrioritiesForRenderModel:visibleRect:viewState:", v36, v45, v38, v40, v42, v44);
}

- (void)viewSafeAreaInsetsDidChange
{
  v30.receiver = self;
  v30.super_class = (Class)TUIFeedViewController;
  [(TUIFeedViewController *)&v30 viewSafeAreaInsetsDidChange];
  syncLayoutController = self->_syncLayoutController;
  [(TUIFeedViewController *)self _viewSize];
  double v28 = v5;
  double v29 = v4;
  [(TUISyncLayoutController *)self->_syncLayoutController contentOffset];
  double v26 = v7;
  double v27 = v6;
  CGFloat v8 = [(TUIFeedViewController *)self scrollView];
  [v8 contentInset];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(TUISyncLayoutController *)self->_syncLayoutController safeAreaInsets];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v25 = [(TUIFeedViewController *)self tabBarController];
  -[TUISyncLayoutController updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:](syncLayoutController, "updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:", v25 != 0, v29, v28, v27, v26, v10, v12, v14, v16, v18, v20, v22, v24);

  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  [(_TUIFeedViewControllerQueueContext *)self->_queueContext setNeedsLayout];
  [(_TUIFeedViewControllerQueueContext *)self->_queueContext layoutIfNeeded];
}

- (void)setNavBarBackgroundOpacity:(double)a3 manualScrollEdgeAppearanceEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(TUIFeedViewController *)self navigationController];
  CGFloat v8 = [v7 navigationBar];
  [v8 _setTitleOpacity:a3];

  if (v4)
  {
    double v9 = [(TUIFeedViewController *)self navigationItem];
    [v9 _setManualScrollEdgeAppearanceEnabled:1];

    id v10 = [(TUIFeedViewController *)self navigationItem];
    [v10 _setManualScrollEdgeAppearanceProgress:a3];
  }
}

- (BOOL)runningInExtension
{
  id v2 = [(TUIFeedViewController *)self extensionContext];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CGSize)_viewSize
{
  id v2 = [(TUIFeedViewController *)self viewIfLoaded];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)_windowSize
{
  id v2 = [(TUIFeedViewController *)self viewIfLoaded];
  double v3 = [v2 window];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[UIWindow _applicationKeyWindow];
  }
  double v6 = v5;

  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (BOOL)_shouldDisableLayoutDueToAppBeingBackgrounded
{
  if ([(TUIFeedViewController *)self runningInExtension]) {
    return 0;
  }
  double v4 = self;
  id v5 = v4;
  do
  {
    double v6 = v4;
    double v4 = v5;

    double v7 = [(TUIFeedViewController *)v4 parentViewController];
    double v8 = v7;
    if (v7)
    {
      double v9 = v7;
    }
    else
    {
      double v9 = [(TUIFeedViewController *)v4 presentingViewController];
    }
    id v5 = v9;
  }
  while (v5);
  if (v4)
  {
    while (1)
    {
      double v10 = [(TUIFeedViewController *)v4 viewIfLoaded];
      double v11 = [v10 window];
      if (v11) {
        break;
      }
      double v12 = [(TUIFeedViewController *)v4 presentedViewController];

      if (v12)
      {
        uint64_t v13 = [(TUIFeedViewController *)v4 presentedViewController];

        double v4 = (TUIFeedViewController *)v13;
        if (v13) {
          continue;
        }
      }
      goto LABEL_14;
    }
  }
LABEL_14:
  double v14 = [(TUIFeedViewController *)v4 viewIfLoaded];
  double v15 = [v14 window];
  double v16 = [v15 windowScene];

  if (v16)
  {
    if ([v16 activationState]) {
      char v3 = [v16 activationState] != (char *)&def_141F14 + 1;
    }
    else {
      char v3 = 0;
    }
  }
  else
  {
    char v3 = 1;
  }

  return v3;
}

- (void)_loadFeed
{
  id v4 = [(TUIFeedViewController *)self layoutController];
  char v3 = [(TUIFeedViewController *)self content];
  [v4 updateWithContent:v3 transaction:0];
}

- (id)_renderModelForIndexPath:(id)a3
{
  id v4 = [a3 section];

  return [(TUIFeedViewController *)self _renderModelForSection:v4];
}

- (id)_renderModelForSection:(unint64_t)a3
{
  id v4 = [(TUIFeedViewController *)self _renderModel];
  id v5 = [v4 sections];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    id v9 = 0;
  }
  else
  {
    double v7 = [v4 sections];
    double v8 = [v7 objectAtIndexedSubscript:a3];

    if ([v8 kind] == (char *)&dword_4 + 3) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_handleNativePressAction:(id)a3 arguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = TUIDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    visibilityController = self->_visibilityController;
    int v11 = 134218498;
    double v12 = visibilityController;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_debug_impl(&def_141F14, v8, OS_LOG_TYPE_DEBUG, "[fid:%lu] handling press: %@ with arguments: %@", (uint8_t *)&v11, 0x20u);
  }

  return 0;
}

- (void)_updateDatesCollectorInitialResourcesRenderedDate
{
  id v2 = [(TUIFeedViewController *)self layoutController];
  [v2 statRecordInitialResourcesRenderedDate];
}

- (UIEdgeInsets)contentInsetsForScrollingToRectWithContentInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v8 = [(TUIFeedViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [(TUIFeedViewController *)self delegate];
    [v10 feedViewController:self contentInsetsForScrollingToRectWithContentInsets:top, left, bottom, right];
    double top = v11;
    double left = v12;
    double bottom = v13;
    double right = v14;
  }
  double v15 = top;
  double v16 = left;
  double v17 = bottom;
  double v18 = right;
  result.double right = v18;
  result.double bottom = v17;
  result.double left = v16;
  result.double top = v15;
  return result;
}

- (void)didScrollToQuery:(id)a3
{
}

- (void)updateHostingMap:(id)a3 controller:(id)a4
{
  id v9 = a3;
  feedView = self->_feedView;
  id v7 = a4;
  id v8 = [(TUIFeedView *)feedView updateController];

  if (v8 == v7) {
    [(TUIRenderReferenceOverrideProvider *)self->_renderOverrideProvider updateHostingMap:v9];
  }
}

- (void)applyUpdate:(id)a3 controller:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  id v10 = a4;
  double v11 = TUIViewUpdateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_19284C((uint64_t)self, v8, v11);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v12 = [(TUIFeedView *)self->_feedView updateController];

  if (v12 != v10) {
    goto LABEL_4;
  }
  double v13 = [v8 to];
  [(_TUIFeedViewControllerQueueContext *)self->_queueContext setRenderModel:v13];

  id WeakRetained = [v8 to];
  uint64_t v15 = [WeakRetained content];
  if (!v15) {
    goto LABEL_15;
  }
  double v16 = (void *)v15;
  double v17 = [v8 to];
  double v18 = [v17 sections];
  if ([v18 count])
  {
  }
  else
  {
    uint64_t v19 = [v8 to];
    uint64_t v20 = [v19 info];
    uint64_t v21 = [v20 objectForKeyedSubscript:@"TUIRenderInfoKeyIsFinal"];
    unsigned __int8 v58 = [v21 BOOLValue];

    if ((v58 & 1) == 0) {
      goto LABEL_16;
    }
  }
  uint64_t v22 = [v8 to];
  [v22 size];
  double v24 = v23;
  double v26 = v25;

  uint64_t v27 = [v8 from];
  if (!v27) {
    goto LABEL_13;
  }
  double v28 = (void *)v27;
  double v29 = [v8 from];
  [v29 size];
  double v31 = v30;
  double v33 = v32;

  if (v31 != v24 || v33 != v26)
  {
LABEL_13:
    if (*(unsigned char *)&self->_delegateFlags)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_content);
      [WeakRetained feedViewController:self willTransitionToContentHeight:v26];
LABEL_15:
    }
  }
LABEL_16:
  BOOL v34 = [v8 to];
  uint64_t v35 = [v34 content];
  if (v35)
  {
    double v36 = (void *)v35;
    double v37 = [v8 to];
    double v38 = [v37 info];
    double v39 = [v38 objectForKeyedSubscript:@"TUIRenderInfoKeyIsFinal"];
    unsigned int v40 = [v39 BOOLValue];

    if (v40) {
      [(TUISyncLayoutController *)self->_syncLayoutController setContentHeightFactorForScrollingGuess:NAN];
    }
    if (!v8) {
      goto LABEL_4;
    }
  }
  else
  {

    if (!v8) {
      goto LABEL_4;
    }
  }
  if (!self->_syncLayoutController)
  {
LABEL_4:
    if (v9) {
      v9[2](v9);
    }
    goto LABEL_29;
  }
  [(TUIRenderReferenceOverrideProvider *)self->_renderOverrideProvider beginViewUpdates];
  [v8 applyToFeedView:self->_syncLayoutController completion:v9];
  [(TUIRenderReferenceOverrideProvider *)self->_renderOverrideProvider endViewUpdates];
  if ([(TUIFeedViewController *)self isContentVisible] && !self->_updateEnvironmentOnViewLoad)
  {
    double v41 = [v8 to];
    double v42 = [v41 anchorSet];

    if (v42)
    {
      dropController = self->_dropController;
      double v44 = [(TUIFeedViewController *)self scrollView];
      v45 = [v42 computeTriggerStatesInScrollView:v44 axis:2];
      [(TUIDropController *)dropController updateTriggerStatesWithNewStates:v45 updateEvent:2];
    }
  }
  [(NSHashTable *)self->_heightLayoutConditions attemptPendingScrolls];
  linkEntityController = self->_linkEntityController;
  double v47 = [(TUIFeedViewController *)self _renderModel];
  [(TUISyncLayoutController *)self->_syncLayoutController visibleBounds];
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  v56 = [(TUISyncLayoutController *)self->_syncLayoutController currentViewState];
  -[TUILinkEntityController updatePrioritiesForRenderModel:visibleRect:viewState:](linkEntityController, "updatePrioritiesForRenderModel:visibleRect:viewState:", v47, v56, v49, v51, v53, v55);

  v57 = [(TUIEmbeddedScrollViewCoordinator *)self->_embeddedScrollViewCoordinator rootCollector];
  [v57 updateSections];

LABEL_29:
}

- (void)applyUpdate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11D9C8;
  v4[3] = &unk_251828;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  TUIDispatchAsyncViaRunLoop((uint64_t)v4);
}

- (void)_updateNavigationBarItems
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_content);
  id v3 = [(TUIFeedViewController *)self navigationItem];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [WeakRetained feedViewControllerNavigationBarItem:self];

    id v3 = (void *)v4;
  }
  [(TUIFeedOverlayDebugView *)self->_overlayDebugView updateWithRenderModel:self->_visibleOverride factory:self triggerManager:self->_dropController promoteAccessory:[(TUIFeedViewController *)self shouldPromoteLargeTitleAccessoryViewButtonsForAccessibility]];
  self->_updatingNavigationBarItems = 1;
  overlayDebugView = self->_overlayDebugView;
  id v6 = [(TUIFeedViewController *)self feedView];
  id v7 = [(TUIFeedViewController *)self extraLeftItems];
  id v8 = [(TUIFeedViewController *)self extraRightItems];
  id v9 = [(TUIFeedOverlayDebugView *)overlayDebugView configureNavigationItem:v3 scrollView:v6 extraLeftItems:v7 extraRightItems:v8];

  [(TUIFeedViewController *)self updateNavigationBarOpacity];
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarItemsDidUpdate:self hasItems:v9];
  }
  self->_updatingNavigationBarItems = 0;
}

- (void)updateNavigationBarOpacity
{
  overlayDebugView = self->_overlayDebugView;
  if (overlayDebugView)
  {
    dropController = self->_dropController;
    id v5 = [(TUIFeedView *)self->_feedView anchorSet];
    id v6 = [(TUIFeedViewController *)self scrollView];
    [(TUIFeedOverlayDebugView *)overlayDebugView navigationBarBackgroundOpacity:dropController anchors:v5 scrollView:v6];
    double v8 = v7;

    [(TUIFeedViewController *)self setNavBarBackgroundOpacity:1 manualScrollEdgeAppearanceEnabled:v8];
  }
}

- (void)_updateNavigationItemTriggerObservanceForCurrentRenderModel:(id)a3 previous:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    [(TUIFeedViewController *)self _removeTriggerObservationForRenderModel:v7];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v8 = [v6 triggers];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(TUIDropController *)self->_dropController addObserver:self forTrigger:*(void *)(*((void *)&v13 + 1) + 8 * (void)v12)];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_removeTriggerObservationForRenderModel:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [a3 triggers];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(TUIDropController *)self->_dropController removeObserver:self forTrigger:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  id v7 = a3;
  if (a5 <= 3 && a5 != 2 && !self->_updatingNavigationBarItems)
  {
    id v8 = v7;
    [(TUIFeedViewController *)self _updateNavigationBarItems];
    id v7 = v8;
  }
}

- (void)feedLayoutController:(id)a3 updateStats:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(TUISyncLayoutController *)self->_syncLayoutController setStats:v5];
}

- (void)feedLayoutControllerAllContentReady:(id)a3
{
  if ((*(unsigned char *)&self->_delegateFlags & 8) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_content);
    [WeakRetained feedViewControllerAllContentReady:self];
  }
}

- (void)feedLayoutControllerInitialContentReady:(id)a3
{
  if ((*(unsigned char *)&self->_delegateFlags & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_content);
    [WeakRetained feedViewControllerInitialContentReady:self];
  }
}

- (void)feedLayoutController:(id)a3 axModelSections:(id)a4 renderModelCollection:(id)a5 renderModelSections:(id)a6
{
  id v62 = a3;
  id v66 = a4;
  id v65 = a5;
  id v67 = a6;
  if (!self->_topLevelAXElement)
  {
    long long v10 = objc_opt_new();
    long long v11 = objc_opt_new();
    [v11 setScreenOffsetProvider:self];
    [v11 setSectionOffset:CGPointZero.x, CGPointZero.y];
    long long v12 = [TUIAXElement alloc];
    long long v13 = [(TUIFeedViewController *)self view];
    long long v14 = [(TUIAXElement *)v12 initWithEvaluationContext:v11 accessibilityContainer:v13];
    topLevelAXElement = self->_topLevelAXElement;
    self->_topLevelAXElement = v14;

    [(TUIAXElement *)self->_topLevelAXElement updateWithAXModel:v10];
  }
  long long v16 = objc_opt_new();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v63 = self;
  double v17 = [(TUIAXElement *)self->_topLevelAXElement accessibilityElements];
  id v18 = [v17 countByEnumeratingWithState:&v68 objects:v73 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v69;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v69 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        uint64_t v23 = objc_opt_class();
        double v24 = TUIDynamicCast(v23, v22);
        double v25 = [v24 context];
        double v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v25 sectionIndex]);
        [v16 setObject:v24 forKeyedSubscript:v26];
      }
      id v19 = [v17 countByEnumeratingWithState:&v68 objects:v73 count:16];
    }
    while (v19);
  }

  uint64_t v27 = v66;
  double v28 = (char *)[v66 count];
  v64 = objc_opt_new();
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  if (v28)
  {
    double v33 = 0;
    double v34 = CGPointZero.y;
    do
    {
      uint64_t v35 = +[NSNumber numberWithUnsignedInteger:v33];
      double v36 = [v67 objectForKeyedSubscript:v35];

      double v37 = [v27 objectAtIndexedSubscript:v33];
      double v38 = +[NSNumber numberWithUnsignedInteger:v33];
      double v39 = [v16 objectForKeyedSubscript:v38];

      if (([v37 hidden] & 1) == 0)
      {
        if (v39)
        {
          unsigned int v40 = [(TUIAXElement *)v39 context];
          [v40 setSectionOffset:CGPointZero.x, v34];

          [v65 size];
          double v42 = v41;
          double v43 = [(TUIAXElement *)v39 context];
          [v43 setTotalContentHeight:v42];

          double v44 = [(TUIAXElement *)v39 context];
          [v44 setRenderModelSection:v36];

          [(TUIAXElement *)v39 updateWithAXModel:v37];
        }
        else
        {
          v45 = objc_opt_new();
          [v45 setScreenOffsetProvider:v63];
          [v45 setSectionOffset:CGPointZero.x, v34];
          [v65 size];
          [v45 setTotalContentHeight:v46];
          [v45 setSectionIndex:v33];
          [v45 setRenderModelSection:v36];
          double v39 = [[TUIAXElement alloc] initWithEvaluationContext:v45 accessibilityContainer:v63->_topLevelAXElement];
          [(TUIAXElement *)v39 updateWithAXModel:v37];
        }
        if ([(TUIAXElement *)v39 isAccessibilityElement]
          || ([(TUIAXElement *)v39 accessibilityElements],
              double v47 = objc_claimAutoreleasedReturnValue(),
              id v48 = [v47 count],
              v47,
              v48))
        {
          [v64 addObject:v39];
        }
        [v37 accessibilityFrameRelativeToScrollAncestor];
        CGRect v77 = CGRectOffset(v74, CGPointZero.x, v34);
        v75.origin.double x = x;
        v75.origin.double y = y;
        v75.size.double width = width;
        v75.size.double height = height;
        CGRect v76 = CGRectUnion(v75, v77);
        double x = v76.origin.x;
        double y = v76.origin.y;
        double width = v76.size.width;
        double height = v76.size.height;
        [v36 frame];
        double v34 = v34 + v49;
        uint64_t v27 = v66;
      }

      ++v33;
    }
    while (v28 != v33);
  }
  id v50 = [v64 copy];
  [(TUIAXElement *)v63->_topLevelAXElement setChildren:v50];

  double v51 = [(TUIAXElement *)v63->_topLevelAXElement axModel];
  [v51 setAccessibilityFrameRelativeToScrollAncestor:x, y, width, height];

  double v52 = [(TUIFeedViewController *)v63 view];
  [(TUIAXElement *)v63->_topLevelAXElement setAccessibilityContainer:v52];

  uint64_t v53 = objc_opt_class();
  double v54 = [(TUIFeedViewController *)v63 view];
  double v55 = [v54 accessibilityElements];
  v56 = [v55 firstObject];
  TUIDynamicCast(v53, v56);
  v57 = (TUIAXElement *)objc_claimAutoreleasedReturnValue();

  unsigned __int8 v58 = [(TUIAXElement *)v63->_topLevelAXElement children];
  if ([v58 count])
  {
    v59 = v63->_topLevelAXElement;

    if (v57 != v59)
    {
      v72 = v63->_topLevelAXElement;
      v60 = +[NSArray arrayWithObjects:&v72 count:1];
      v61 = [(TUIFeedViewController *)v63 view];
      [v61 setAccessibilityElements:v60];

      uint64_t v27 = v66;
      if ([(TUIFeedViewController *)v63 visibilityProviderIsVisible]) {
        UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v63->_topLevelAXElement);
      }
    }
  }
  else
  {
  }
}

- (void)feedLayoutController:(id)a3 willTransitionToLayoutState:(unint64_t)a4
{
  if ((*(unsigned char *)&self->_delegateFlags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_content);
    [WeakRetained feedViewController:self willTransitionToLayoutState:a4];
  }
}

- (void)feedLayoutController:(id)a3 didTransitionToLayoutState:(unint64_t)a4
{
  if ((*(unsigned char *)&self->_delegateFlags & 4) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_content);
    [WeakRetained feedViewController:self didTransitionToLayoutState:a4];
  }
}

- (void)collectStatsWithCompletion:(id)a3
{
}

- (void)scrollToRefId:(id)a3 refInstance:(id)a4 onEntry:(id)a5 animated:(BOOL)a6 skipVoiceOverFocus:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  long long v15 = [v12 uuid];
  long long v16 = [v12 uid];

  id v18 = +[TUIRenderReferenceQuery queryWithUUID:v15 uid:v16 refId:v14 refInstance:v13];

  [(NSHashTable *)self->_heightLayoutConditions addScrollQuery:v18 animated:v8 skipVoiceOverFocus:v7];
  [(NSHashTable *)self->_heightLayoutConditions attemptPendingScrolls];
  if (_AXSFullKeyboardAccessEnabled())
  {
    double v17 = [(TUIFeedViewController *)self scrollView];
    _UIAXAssignFocusToItem();
  }
}

- (id)renderReferencesMatchingQuery:(id)a3
{
  syncLayoutController = self->_syncLayoutController;
  id v5 = a3;
  [(TUISyncLayoutController *)syncLayoutController saveViewStateForVisibleViews];
  id v6 = [(TUISyncLayoutController *)self->_syncLayoutController currentViewState];
  BOOL v7 = +[TUIRenderReferenceCollector referenceCollectorWithViewState:v6];

  [(TUISyncLayoutController *)self->_syncLayoutController contentOffset];
  double v9 = v8;
  double v11 = v10;
  id v12 = [(TUISyncLayoutController *)self->_syncLayoutController renderModel];
  CGAffineTransformMakeTranslation(&v15, -v9, -v11);
  [v12 appendReferencesToCollector:v7 transform:&v15 query:v5 liveTransformResolver:self->_syncLayoutController];

  id v13 = [v7 renderReferences];

  return v13;
}

- (id)navigationBarItemMatchingQuery:(id)a3
{
  overlayDebugView = self->_overlayDebugView;
  if (overlayDebugView)
  {
    overlayDebugView = [overlayDebugView navigationBarItemMatchingQuery:a3];
  }

  return overlayDebugView;
}

- (id)imageResourcesMatchingQuery:(id)a3
{
  id v3 = [(TUIFeedViewController *)self renderReferencesMatchingQuery:a3];
  +[TUIResourceCollector createImageResourceCollector];
  double v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  double v10 = sub_11EB68;
  double v11 = &unk_255A68;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = (id)objc_opt_new();
  id v4 = v13;
  id v5 = v12;
  [v3 enumerateKeysAndObjectsUsingBlock:&v8];
  id v6 = [v4 copy:v8, v9, v10, v11];

  return v6;
}

- (void)scrollToItemsMatchingQuery:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5 skipVoiceOverFocus:(BOOL)a6
{
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  syncLayoutController = self->_syncLayoutController;
  [(TUIFeedViewController *)self _viewSize];
  double v32 = v6;
  double v33 = v5;
  [(TUISyncLayoutController *)self->_syncLayoutController contentOffset];
  double v30 = v8;
  double v31 = v7;
  uint64_t v9 = [(TUIFeedViewController *)self scrollView];
  [v9 contentInset];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(TUISyncLayoutController *)self->_syncLayoutController safeAreaInsets];
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  double v26 = [(TUIFeedViewController *)self tabBarController];
  -[TUISyncLayoutController updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:](syncLayoutController, "updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:", v26 != 0, v33, v32, v31, v30, v11, v13, v15, v17, v19, v21, v23, v25);

  uint64_t v27 = [(TUIEmbeddedScrollViewCoordinator *)self->_embeddedScrollViewCoordinator rootCollector];
  [v27 updateVisibleBounds];

  hostingController = self->_hostingController;
  double v29 = self->_syncLayoutController;

  [(TUIHostingController *)hostingController updatedVisibleBoundsOfScrollView:v29];
}

- (id)waitForVisibleImageResourcesToLoadAssertionWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = TUISignpostFeedViewController();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v9 = TUISignpostFeedViewController();
  double v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&def_141F14, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "waitForVisibleImageResources", (const char *)&unk_243F7A, buf, 2u);
  }

  [(TUISyncLayoutController *)self->_syncLayoutController saveViewStateForVisibleViews];
  double v11 = +[_TUIRunLoopWaiter sharedInstance];
  double v12 = [(TUIFeedAutoScrollController *)self->_autoScrollController userInteractiveCallbackQueue];
  double v13 = [v11 notReadyAssertionWithTimeout:v12 queue:a3];

  double v14 = +[_TUIRunLoopWaiter sharedInstance];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_11EFCC;
  v20[3] = &unk_255AB8;
  v20[4] = self;
  id v15 = v13;
  id v22 = v6;
  os_signpost_id_t v23 = v8;
  id v21 = v15;
  id v16 = v6;
  [v14 addPreCommitBlock:v20];

  double v17 = v22;
  id v18 = v15;

  return v18;
}

- (void)notifyWhenVisibleImageResourcesAreLoadedWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  [(TUISyncLayoutController *)self->_syncLayoutController saveViewStateForVisibleViews];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_11F4D0;
  v15[4] = sub_11F4FC;
  id v16 = objc_retainBlock(v6);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_11F504;
  v14[3] = &unk_2542E0;
  v14[4] = v15;
  double v7 = [[_TUIRunLoopAssertion alloc] initWithCompletion:v14];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11F5E0;
  block[3] = &unk_2542E0;
  block[4] = v15;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  uint64_t v9 = +[_TUIRunLoopWaiter sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_11F64C;
  v11[3] = &unk_251828;
  v11[4] = self;
  double v10 = v7;
  double v12 = v10;
  [v9 addPreCommitBlock:v11];

  _Block_object_dispose(v15, 8);
}

- (void)configureWithSyncLayoutController:(id)a3
{
}

- (id)_effectiveSyncLayoutController
{
  linkEntityTracker = self->_linkEntityTracker;
  if (!linkEntityTracker)
  {
    id v4 = [(TUIFeedViewController *)self parentViewController];
    if (v4
      || ([(TUIFeedViewController *)self presentingViewController],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          0,
          (id v4 = (void *)v5) != 0))
    {
      while (1)
      {
        if (objc_opt_respondsToSelector())
        {
          id v6 = [v4 syncLayoutController];
          if (v6) {
            break;
          }
        }
        double v7 = [v4 parentViewController];
        dispatch_time_t v8 = v7;
        if (v7)
        {
          id v9 = v7;
        }
        else
        {
          id v9 = [v4 presentingViewController];
        }
        id v10 = v9;

        id v4 = v10;
        if (!v10) {
          goto LABEL_10;
        }
      }
      double v14 = self->_linkEntityTracker;
      self->_linkEntityTracker = v6;
      double v13 = v6;
    }
    else
    {
LABEL_10:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_content);
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0)
      {
        id v4 = 0;
LABEL_15:

        linkEntityTracker = self->_linkEntityTracker;
        goto LABEL_16;
      }
      double v13 = (TUIVisibilityTracker *)objc_loadWeakRetained((id *)&self->_content);
      [(TUIVisibilityTracker *)v13 feedViewControllerNeedsSyncLayoutController:self];
      id v4 = 0;
    }

    goto LABEL_15;
  }
LABEL_16:

  return linkEntityTracker;
}

- (void)addRenderOverride:(id)a3
{
}

- (void)removeRenderOverride:(id)a3
{
}

- (void)addRenderOverride:(id)a3 animated:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = v8;
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_11FACC;
    v10[3] = &unk_251828;
    v10[4] = self;
    id v11 = v8;
    +[UIView animateWithDuration:v10 animations:a5];
  }
  else
  {
    [self->_feedId.uniqueIdentifier addRenderOverride:v8];
  }
}

- (void)removeRenderOverride:(id)a3 animated:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = v8;
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_11FC08;
    v10[3] = &unk_251828;
    v10[4] = self;
    id v11 = v8;
    +[UIView animateWithDuration:v10 animations:a5];
  }
  else
  {
    [self->_feedId.uniqueIdentifier removeRenderOverride:v8];
  }
}

- (id)viewFactoryDequeueReusableSubviewWithReuseIdentifier:(id)a3 indexPath:(id)a4 host:(id)a5
{
  syncLayoutController = self->_syncLayoutController;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(TUISyncLayoutController *)syncLayoutController viewFactory];
  char v12 = [v11 viewFactoryDequeueReusableSubviewWithReuseIdentifier:v10 indexPath:v9 host:v8];

  return v12;
}

- (void)viewFactoryPrepareToReuseHost:(id)a3
{
  feedContentLayoutStackNameInstance = self->_feedContentLayoutStackNameInstance;
  id v4 = a3;
  id v5 = [(TUIDynamicInstance *)feedContentLayoutStackNameInstance subviewPool];
  [v5 prepareToReuseHost:v4];
}

- (void)viewFactoryReuseSubviews:(id)a3 host:(id)a4
{
  feedContentLayoutStackNameInstance = self->_feedContentLayoutStackNameInstance;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUIDynamicInstance *)feedContentLayoutStackNameInstance subviewPool];
  [v8 reuseSubviews:v7 host:v6];
}

- (TUIReusableSubviewPool)subviewPool
{
  return (TUIReusableSubviewPool *)[(TUIDynamicInstance *)self->_feedContentLayoutStackNameInstance subviewPool];
}

- (id)descendentViewWithIdentifier:(id)a3
{
  return [(TUISyncLayoutController *)self->_syncLayoutController descendentViewWithIdentifier:a3];
}

- (BOOL)handleActionForObject:(id)a3 withName:(id)a4 arguments:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  char v12 = TUIDynamicCast(v11, v10);

  double v13 = TUIDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    visibilityController = self->_visibilityController;
    int v18 = 134218498;
    uint64_t v19 = visibilityController;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&def_141F14, v13, OS_LOG_TYPE_INFO, "[fid:%lu] handling action: %@: parameters: %@", (uint8_t *)&v18, 0x20u);
  }

  unsigned __int8 v15 = [v12 handleBehaviorWithName:v8 arguments:v9];
  if ((v15 & 1) == 0)
  {
    id v16 = TUIDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_19297C((uint64_t)self, (uint64_t)v8, v16);
    }
  }
  return v15;
}

- (id)dragItemForObject:(id)a3 withName:(id)a4 arguments:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  char v12 = TUIDynamicCast(v11, v10);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1200A0;
  v16[3] = &unk_255AE0;
  v16[4] = self;
  double v13 = objc_retainBlock(v16);
  double v14 = [v12 dragItemForFeedEntry:v10 name:v9 arguments:v8 imageResourceBlock:v13];

  return v14;
}

- (void)didBeginDraggingView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  TUIPlatformAncestorOfClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 suspendReuseOfView:v3];
}

- (void)didEndDraggingView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  TUIPlatformAncestorOfClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 resumeReuseOfView:v3];
}

- (void)performDropWithSession:(id)a3 actionObject:(id)a4 behavior:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  TUIDynamicCast(v10, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [v11 performDropWithSession:v9 behavior:v7];
}

- (BOOL)canHandleDropSession:(id)a3 actionObject:(id)a4 behavior:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  id v11 = TUIDynamicCast(v10, v8);

  LOBYTE(v8) = [v11 canHandleDropSession:v9 behavior:v7];
  return (char)v8;
}

- (unint64_t)layoutDirection
{
  return [(TUIEnvironment *)self->_environment layoutDirection];
}

- (void)impressionController:(id)a3 didUpdateSnapshot:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_120414;
  v5[3] = &unk_251828;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  TUIDispatchAsyncViaRunLoop((uint64_t)v5);
}

- (id)visibilityProviderHostingLayer
{
  id v2 = [(TUIFeedViewController *)self scrollView];
  id v3 = [v2 layer];

  return v3;
}

- (id)visibilityProviderWindowLayer
{
  id v2 = [(TUIFeedViewController *)self view];
  id v3 = [v2 window];
  id v4 = [v3 layer];

  return v4;
}

- (CGRect)visibilityProviderVisibleBounds
{
  id v3 = [(TUIFeedViewController *)self scrollView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  char v12 = [(TUIFeedViewController *)self scrollView];
  [v12 adjustedContentInset];
  double v14 = v5 + v13;
  double v16 = v7 + v15;
  double v18 = v9 - (v13 + v17);
  double v20 = v11 - (v15 + v19);

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (id)visibilityProviderSections
{
  id v2 = [(TUIFeedViewController *)self _renderModel];
  id v3 = [v2 sections];

  return v3;
}

- (BOOL)visibilityProviderIsVisible
{
  id v3 = [(TUIFeedViewController *)self viewIfLoaded];
  if ([v3 isHidden])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 window];

    if (v4)
    {
      if ((*(unsigned char *)&self->_delegateFlags & 0x20) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_content);
        id v4 = [WeakRetained feedViewControllerIsConsideredVisible:self];
      }
      else
      {
        id v4 = &def_141F14 + 1;
      }
    }
  }
  [(TUIHostingController *)self->_hostingController setVisible:v4];

  return (char)v4;
}

- (BOOL)visibilityProviderIsScrolling
{
  if (([(TUISyncLayoutController *)self->_syncLayoutController isDragging] & 1) != 0
    || ([(TUISyncLayoutController *)self->_syncLayoutController isTracking] & 1) != 0
    || ([(TUISyncLayoutController *)self->_syncLayoutController isDecelerating] & 1) != 0)
  {
    return 1;
  }
  syncLayoutController = self->_syncLayoutController;

  return [(TUISyncLayoutController *)syncLayoutController _isAnimatingScroll];
}

- (void)updateVisibility
{
}

- (CGRect)screenCoordinatesForFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(TUIFeedViewController *)self scrollView];
  [v7 convertRect:0 toView:x, y, width, height];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGPoint)contentOffset
{
  [(TUISyncLayoutController *)self->_syncLayoutController contentOffset];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGRect)boundsForFeedView
{
  [(TUISyncLayoutController *)self->_syncLayoutController bounds];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (double)availableHeight
{
  [(TUISyncLayoutController *)self->_syncLayoutController safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  [(TUISyncLayoutController *)self->_syncLayoutController bounds];
  return v7 - v6 - v4;
}

- (id)feedViewForAX
{
  return self->_syncLayoutController;
}

- (void)imagePrefetchControllerDidStartLoadingInitialResources:(id)a3
{
  id v3 = [(TUIFeedViewController *)self layoutController];
  [v3 statRecordResourcesStartLoadingDate];
}

- (void)imagePrefetchControllerDidLoadAllResources:(id)a3
{
  [(TUIFeedViewController *)self _updateDatesCollectorInitialResourcesRenderedDate];
  id v4 = [(TUIFeedViewController *)self layoutController];
  [v4 statRecordResourcesLoadedDate];
}

- (void)reportLargeLayer:(id)a3 renderModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  if (v8 != objc_opt_class())
  {
    double v9 = TUIDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      visibilityController = self->_visibilityController;
      [v6 bounds];
      v35.double width = v11;
      v35.double height = v12;
      double v13 = NSStringFromCGSize(v35);
      double v14 = [(TUIFeedViewController *)self content];
      *(_DWORD *)buf = 134219010;
      double v26 = visibilityController;
      __int16 v27 = 2114;
      id v28 = v6;
      __int16 v29 = 2114;
      double v30 = v13;
      __int16 v31 = 2114;
      id v32 = v7;
      __int16 v33 = 2114;
      double v34 = v14;
      _os_log_error_impl(&def_141F14, v9, OS_LOG_TYPE_ERROR, "[fid:%lu] unexpected large layer used: layer=%{public}@ size=%{public}@ renderModel=%{public}@ content=%{public}@", buf, 0x34u);
    }
    if (_TUIDeviceHasInternalInstall())
    {
      id v15 = objc_alloc((Class)NSException);
      CFStringRef v22 = @"layer";
      double v16 = v6;
      if (!v6)
      {
        double v16 = +[NSNull null];
      }
      v24[0] = v16;
      CFStringRef v23 = @"renderModel";
      double v17 = v7;
      if (!v7)
      {
        double v17 = +[NSNull null];
      }
      double v18 = [(TUIFeedViewController *)self content];
      double v19 = v18;
      if (!v18)
      {
        double v19 = +[NSNull null];
      }
      v24[2] = v19;
      double v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:&v22 count:3];
      id v21 = [v15 initWithName:@"LargeLayer" reason:@"A very large layer was used; this is not expected" userInfo:nil];
                v20));

      if (!v18) {
      if (!v7)
      }

      if (!v6) {
      objc_exception_throw(v21);
      }
    }
  }
}

- (void)didAddChildViewController:(id)a3
{
}

- (id)renderReferenceOverrideObservers
{
  id v3 = objc_opt_new();
  [(TUISyncLayoutController *)self->_syncLayoutController appendRenderOverrideObservers:v3];
  id v4 = [v3 copy];

  return v4;
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  id v8 = a4;
  id v6 = (TUIFeedViewState *)a3;
  os_unfair_lock_lock(&self->_lock);
  id v7 = self->_restoreViewState;
  os_unfair_lock_unlock(&self->_lock);

  if (v7 == v6) {
    [(TUIFeedView *)self->_feedView layoutIfNeededWithTransaction:v8];
  }
}

- (BOOL)shouldPromoteLargeTitleAccessoryViewButtonsForAccessibility
{
  double v2 = [(TUIFeedViewController *)self navigationController];
  id v3 = [v2 navigationBar];
  if ([v3 prefersLargeTitles]) {
    BOOL v4 = UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning();
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)topLevelAXElement
{
  return self->_topLevelAXElement;
}

- (void)hostingControllerGeometryUpdated:(id)a3
{
}

- (id)resolveViewWithPath:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v17;
    char v9 = 1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        CGFloat v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v7)
        {
          if (v9)
          {
            id v12 = v11;
          }
          else
          {
            [*(id *)(*((void *)&v16 + 1) + 8 * i) tui_identifierWithoutUUID];
            id v12 = (id)objc_claimAutoreleasedReturnValue();
          }
          double v13 = v12;
          uint64_t v14 = [v7 descendentViewWithIdentifier:v12 identifier:v16];

          id v7 = (void *)v14;
          if (!v14) {
            goto LABEL_17;
          }
        }
        else
        {
          id v7 = -[TUISyncLayoutController descendentViewWithIdentifier:](self->_syncLayoutController, "descendentViewWithIdentifier:", v11, (void)v16);
          char v9 = 0;
          if (!v7) {
            goto LABEL_17;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
LABEL_17:

  return v7;
}

- (void)setPerformanceIdentifier:(id)a3
{
  id v4 = (TUIManager *)a3;
  manager = self->_manager;
  if (manager != v4)
  {
    double v10 = v4;
    unsigned __int8 v6 = [(TUIManager *)manager isEqual:v4];
    id v4 = v10;
    if ((v6 & 1) == 0)
    {
      id v7 = (TUIManager *)[(TUIManager *)v10 copy];
      uint64_t v8 = self->_manager;
      self->_manager = v7;

      char v9 = [(TUIFeedView *)self->_feedView transactionCoordinator];
      [v9 updatePerformanceIdentifier:v10];

      id v4 = v10;
    }
  }
}

- (void)debugDumpEnvironmentContainerStructure
{
}

- (TUIPagedScrollableControlling)pagedScrollableController
{
  return self->_delegate;
}

- (TUIEmbeddedScrollViewCoordinator)embeddedScrollViewCoordinator
{
  return (TUIEmbeddedScrollViewCoordinator *)self->_pagedScrollableController;
}

- (TUIVisibilityController)visibilityController
{
  return (TUIVisibilityController *)self->_embeddedScrollViewCoordinator;
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_visibilityController;
}

- (TUIRenderReferenceOverrideProvider)renderOverrideProvider
{
  return (TUIRenderReferenceOverrideProvider *)self->_feedId.uniqueIdentifier;
}

- (void)setRenderOverrideProvider:(id)a3
{
}

- (TUIHostingController)hostingController
{
  return (TUIHostingController *)self->_renderOverrideProvider;
}

- (TUIViewVisibilityController)viewVisibilityController
{
  return (TUIViewVisibilityController *)self->_hostingController;
}

- (unint64_t)options
{
  return (unint64_t)self->_viewVisibilityController;
}

- (void)setOptions:(unint64_t)a3
{
  self->_viewVisibilityController = (TUIViewVisibilityController *)a3;
}

- (TUIImpressionController)impressionController
{
  return (TUIImpressionController *)self->_options;
}

- (TUILinkEntityController)linkEntityController
{
  return (TUILinkEntityController *)self->_impressionController;
}

- (TUIImagePrefetchController)imagePrefetchController
{
  return (TUIImagePrefetchController *)self->_linkEntityController;
}

- (TUIDropController)dropController
{
  return (TUIDropController *)self->_imagePrefetchController;
}

- (BOOL)avoidSyncTransactionInViewWillAppear
{
  return *((unsigned char *)&self->_flags + 1);
}

- (void)setAvoidSyncTransactionInViewWillAppear:(BOOL)a3
{
  *((unsigned char *)&self->_flags + 1) = a3;
}

- (TUITriggerStateManager)triggerStateManager
{
  return (TUITriggerStateManager *)self->_dropController;
}

- (void)setTriggerStateManager:(id)a3
{
}

- (TUITemplateFactory)templateFactory
{
  return (TUITemplateFactory *)self->_triggerStateManager;
}

- (TUIManager)manager
{
  return (TUIManager *)self->_templateFactory;
}

- (NSNumber)performanceIdentifier
{
  return (NSNumber *)self->_manager;
}

- (float)visiblePriority
{
  return *(float *)&self->_viewDidDisappearWasCalled;
}

- (void)setVisiblePriority:(float)a3
{
  *(float *)&self->_viewDidDisappearWasCalled = a3;
}

- (float)hiddenPriority
{
  return self->_visiblePriority;
}

- (void)setHiddenPriority:(float)a3
{
  self->_visiblePrioritdouble y = a3;
}

- (BOOL)updateEnvironmentOnViewLoad
{
  return *((unsigned char *)&self->_flags + 2);
}

- (void)setUpdateEnvironmentOnViewLoad:(BOOL)a3
{
  *((unsigned char *)&self->_flags + 2) = a3;
}

- (NSArray)extraLeftItems
{
  return (NSArray *)self->_performanceIdentifier;
}

- (void)setExtraLeftItems:(id)a3
{
}

- (NSArray)extraRightItems
{
  return self->_extraLeftItems;
}

- (void)setExtraRightItems:(id)a3
{
}

- (BOOL)showsVerticalScrollIndicator
{
  return *((unsigned char *)&self->_flags + 3);
}

- (TUIContextMenuConfigurationProviding)contextMenuConfigurationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extraRightItems);

  return (TUIContextMenuConfigurationProviding *)WeakRetained;
}

- (void)setContextMenuConfigurationProvider:(id)a3
{
}

- (double)viewTransitionSyncTimeoutDuration
{
  return *(double *)&self->_contextMenuConfigurationProvider;
}

- (void)setViewTransitionSyncTimeoutDuration:(double)a3
{
  *(double *)&self->_contextMenuConfigurationProvider = a3;
}

- (double)viewAppearingingSyncTimeoutDuration
{
  return self->_viewTransitionSyncTimeoutDuration;
}

- (void)setViewAppearingingSyncTimeoutDuration:(double)a3
{
  self->_viewTransitionSyncTimeoutDuration = a3;
}

- (unint64_t)liveResizeOptions
{
  return *(void *)&self->_viewAppearingingSyncTimeoutDuration;
}

- (unint64_t)heightGuessForScrollingOption
{
  return self->_liveResizeOptions;
}

- (void)setHeightGuessForScrollingOption:(unint64_t)a3
{
  self->_liveResizeOptions = a3;
}

- (TUIKeyboardAvoidingSupport)keyboardSupport
{
  return (TUIKeyboardAvoidingSupport *)self->_heightGuessForScrollingOption;
}

- (void)setKeyboardSupport:(id)a3
{
}

- (TUIMutableViewState)savedViewState
{
  return (TUIMutableViewState *)self->_keyboardSupport;
}

- (void)setSavedViewState:(id)a3
{
}

- (NSNumber)visibleOverride
{
  return (NSNumber *)self->_savedViewState;
}

- (void)setVisibleOverride:(id)a3
{
}

- (TUIRenderModelAuxiliary)auxiliaryRenderModel
{
  return (TUIRenderModelAuxiliary *)self->_visibleOverride;
}

- (void)setAuxiliaryRenderModel:(id)a3
{
}

- (TUITransaction)syncTransaction
{
  return (TUITransaction *)self->_auxiliaryRenderModel;
}

- (void)setSyncTransaction:(id)a3
{
}

- (TUIFeedViewState)suspendedViewState
{
  return (TUIFeedViewState *)self->_syncTransaction;
}

- (void)setSuspendedViewState:(id)a3
{
}

- (TUIFeedViewState)restoreViewState
{
  return self->_suspendedViewState;
}

- (void)setRestoreViewState:(id)a3
{
}

- (BOOL)suspendedDueToMemoryPressure
{
  return self->_avoidSyncTransactionInViewWillAppear;
}

- (void)setSuspendedDueToMemoryPressure:(BOOL)a3
{
  self->_avoidSyncTransactionInViewWillAppear = a3;
}

- (BOOL)viewDidDisappearWasCalled
{
  return self->_updateEnvironmentOnViewLoad;
}

- (void)setViewDidDisappearWasCalled:(BOOL)a3
{
  self->_updateEnvironmentOnViewLoad = a3;
}

- (TUIDynamicInstance)feedContentLayoutStackNameInstance
{
  return (TUIDynamicInstance *)self->_restoreViewState;
}

- (void)setFeedContentLayoutStackNameInstance:(id)a3
{
}

- (TUIViewFactory)viewFactory
{
  return (TUIViewFactory *)self->_feedContentLayoutStackNameInstance;
}

- (void)setViewFactory:(id)a3
{
}

- (NSHashTable)heightLayoutConditions
{
  return (NSHashTable *)self->_viewFactory;
}

- (void)setHeightLayoutConditions:(id)a3
{
}

- (TUIFeedAutoScrollController)autoScrollController
{
  return (TUIFeedAutoScrollController *)self->_heightLayoutConditions;
}

- (void)setAutoScrollController:(id)a3
{
}

- (_TUIFeedViewControllerQueueContext)queueContext
{
  return (_TUIFeedViewControllerQueueContext *)self->_autoScrollController;
}

- (void)setQueueContext:(id)a3
{
}

- (TUIFeedOverlayDebugView)overlayDebugView
{
  return (TUIFeedOverlayDebugView *)self->_queueContext;
}

- (CGPoint)savedContentOffset
{
  debugDelegate = self->_debugDelegate;
  double x = self->_savedContentOffset.x;
  result.double y = x;
  result.double x = *(double *)&debugDelegate;
  return result;
}

- (void)setSavedContentOffset:(CGPoint)a3
{
  *(CGPoint *)&self->_debugDelegate = a3;
}

- (CGSize)savedContentSize
{
  double y = self->_savedContentOffset.y;
  double width = self->_savedContentSize.width;
  result.double height = width;
  result.double width = y;
  return result;
}

- (void)setSavedContentSize:(CGSize)a3
{
  *(CGSize *)&self->_savedContentOffset.double y = a3;
}

- (TUIAuxiliaryViewState)auxiliaryViewState
{
  return (TUIAuxiliaryViewState *)self->_overlayDebugView;
}

- (TUIVisibilityTracker)impressionTracker
{
  return (TUIVisibilityTracker *)self->_auxiliaryViewState;
}

- (TUIVisibilityTracker)linkEntityTracker
{
  return self->_impressionTracker;
}

- (TUISyncLayoutController)syncLayoutController
{
  return (TUISyncLayoutController *)self->_linkEntityTracker;
}

- (TUIFeedView)feedView
{
  return (TUIFeedView *)self->_syncLayoutController;
}

- (TUIFeedLayoutController)layoutController
{
  return (TUIFeedLayoutController *)self->_feedView;
}

- (TUIFeedDebugDelegate)debugDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutController);

  return (TUIFeedDebugDelegate *)WeakRetained;
}

- (void)setDebugDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutController);
  objc_storeStrong((id *)&self->_feedView, 0);
  objc_storeStrong((id *)&self->_syncLayoutController, 0);
  objc_storeStrong((id *)&self->_linkEntityTracker, 0);
  objc_storeStrong((id *)&self->_impressionTracker, 0);
  objc_storeStrong((id *)&self->_auxiliaryViewState, 0);
  objc_storeStrong((id *)&self->_overlayDebugView, 0);
  objc_storeStrong((id *)&self->_queueContext, 0);
  objc_storeStrong((id *)&self->_autoScrollController, 0);
  objc_storeStrong((id *)&self->_heightLayoutConditions, 0);
  objc_storeStrong((id *)&self->_viewFactory, 0);
  objc_storeStrong((id *)&self->_feedContentLayoutStackNameInstance, 0);
  objc_storeStrong((id *)&self->_restoreViewState, 0);
  objc_storeStrong((id *)&self->_suspendedViewState, 0);
  objc_storeStrong((id *)&self->_syncTransaction, 0);
  objc_storeStrong((id *)&self->_auxiliaryRenderModel, 0);
  objc_storeStrong((id *)&self->_visibleOverride, 0);
  objc_storeStrong((id *)&self->_savedViewState, 0);
  objc_storeStrong((id *)&self->_keyboardSupport, 0);
  objc_storeStrong((id *)&self->_heightGuessForScrollingOption, 0);
  objc_destroyWeak((id *)&self->_extraRightItems);
  objc_storeStrong((id *)&self->_extraLeftItems, 0);
  objc_storeStrong((id *)&self->_performanceIdentifier, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_templateFactory, 0);
  objc_storeStrong((id *)&self->_triggerStateManager, 0);
  objc_storeStrong((id *)&self->_dropController, 0);
  objc_storeStrong((id *)&self->_imagePrefetchController, 0);
  objc_storeStrong((id *)&self->_linkEntityController, 0);
  objc_storeStrong((id *)&self->_impressionController, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_renderOverrideProvider, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_embeddedScrollViewCoordinator, 0);
  objc_storeStrong((id *)&self->_pagedScrollableController, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_destroyWeak((id *)&self->_content);
  objc_storeStrong((id *)&self->_hiddenPriority, 0);
  objc_destroyWeak((id *)&self->_interactionBuilder);
  objc_storeStrong((id *)&self->_pendingCoordinatedTransitionTimingProvider, 0);
  objc_storeStrong((id *)&self->_topLevelAXElement, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end