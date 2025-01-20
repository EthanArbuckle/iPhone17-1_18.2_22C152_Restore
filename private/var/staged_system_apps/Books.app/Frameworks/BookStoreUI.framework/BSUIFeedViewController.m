@interface BSUIFeedViewController
+ (void)createAsync:(id)a3 :(id)a4;
+ (void)createAsyncWithNavigationController:(id)a3 :(id)a4;
+ (void)createSeriesViewControllerFromOptions:(NSDictionary *)a3 withParentTracker:(_TtC13BookAnalytics9BATracker *)a4 navigationTypeValue:(NSString *)a5 navigationContext:(BSUINavigationContext *)a6 shouldReportFigaro:(BOOL)a7 completion:(id)a8;
- (AMSEngagement)amsEngagement;
- (BCCardContentDelegate)cardContentDelegate;
- (BCCardContentScrollManager)cardContentScrollManager;
- (BCCardStackTransitioningCoverSource)cardStackTransitioningCardContentCoverSource;
- (BCMessageViewControllerProvider)messageViewControllerProvider;
- (BCSafeAreaInsetsObserver)bcSafeAreaInsetsObserver;
- (BOOL)alreadyNotifiedBottomReached;
- (BOOL)avoidSyncTransactionInViewWillAppear;
- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented;
- (BOOL)canHandleDropSession:(id)a3 behavior:(id)a4;
- (BOOL)coverAnimationHostIsFullyVisible:(id)a3;
- (BOOL)coverAnimationHostWantsScrollOnClose;
- (BOOL)coverEffectsNightMode;
- (BOOL)deferUIUpdateUntilInitialContentReady;
- (BOOL)disallowLoadingView;
- (BOOL)dismissOnViewDisappear;
- (BOOL)feedControllerIsOnScreen:(id)a3;
- (BOOL)feedEntry:(id)a3 handleBehavior:(id)a4 name:(id)a5 arguments:(id)a6;
- (BOOL)feedViewControllerIsConsideredVisible:(id)a3;
- (BOOL)isInCard;
- (BOOL)isPresented;
- (BOOL)lastTwoLineTitleFixHadSearchController;
- (BOOL)openFinalized;
- (BOOL)performantForReadingExperience;
- (BOOL)performantForScrolling;
- (BOOL)prefersAdditionalSafeAreaInsetsForInsetting;
- (BOOL)shouldNotifyScrollViewReachedTheBottom;
- (BOOL)shouldOnlyAllowDismiss;
- (BOOL)wasPresentingCards;
- (BSUIAlertController)alertController;
- (BSUICardAuxiliaryNavigationBarManager)cardAuxiliaryNavigationBarManager;
- (BSUIDynamicValue)currentStackName;
- (BSUIFeedTriggerBlockObserver)feedTriggerObserver;
- (BSUIFeedViewController)initWithOptions:(id)a3;
- (BSUIFeedViewControllerFeedMetadataDelegate)metadataDelegate;
- (CGRect)_frameOfElementWithEntryID:(id)a3 refId:(id)a4 refInstance:(id)a5;
- (CGRect)getSourceRectFromOptions:(id)a3;
- (CGSize)viewSizeWhenNotifiedBottomReached;
- (Class)jsaFeedControllerClass;
- (JSAFeedController)jsFeedController;
- (JSValue)feed;
- (NSArray)notificationObservers;
- (NSMutableSet)activeRenderOverrides;
- (NSMutableSet)deferredEngagementMessageIdentifiers;
- (NSString)description;
- (NSString)lastTwoLineTitleFixed;
- (NSString)parentCardNavigationType;
- (NSString)trackerName;
- (OS_dispatch_queue)deferredReloadsQueue;
- (TUIAssertion)assertionForSuspendingLayoutUpdates;
- (TUIAssertion)suspendLayoutForScrolling;
- (UIColor)navigationBarTintColorWhenLayoutReady;
- (UIColor)preferredNavigationBarTintColor;
- (UIEdgeInsets)feedViewController:(id)a3 contentInsetsForScrollingToRectWithContentInsets:(UIEdgeInsets)a4;
- (UIEdgeInsets)navigationBarMetricsLayoutMargins;
- (UINavigationItem)navigationItem;
- (UIView)popoverArrowBackgroundView;
- (UIViewController)currentPopOverViewController;
- (_BYTE)showLoadingViewForFeedController:(unsigned char *)result;
- (_TtC13BookAnalytics9BATracker)effectiveAnalyticsTracker;
- (id)_coverSourceQueryForRepresentedObject:(id)a3;
- (id)_createFeedContentFromDictionaries:(id)a3 initialContentReadyEntryIndex:(int64_t)a4;
- (id)_dataModelWithData:(id)a3;
- (id)_getBarButtonItemFromOptions:(id)a3;
- (id)_localIdentifiers;
- (id)_overrideMatchingQuery:(id)a3;
- (id)_overrideMatchingRefId:(id)a3 refInstance:(id)a4;
- (id)accessibilityCardContentSummary;
- (id)artworkSourceInEntryWithIndex:(unint64_t)a3 refId:(id)a4 refInstance:(id)a5 isCover:(BOOL)a6;
- (id)cardStackTransitionSuspendUpdatesAssertion;
- (id)coverAnimationHostSourceForItem:(id)a3;
- (id)coverAnimationHostSourceForUUID:(id)a3 uid:(id)a4 refId:(id)a5 refInstance:(id)a6;
- (id)coverEffectRTLOverride;
- (id)coverSourceForRepresentedObject:(id)a3;
- (id)dragItemForFeedEntry:(id)a3 name:(id)a4 arguments:(id)a5 imageResourceBlock:(id)a6;
- (id)feedContentCompletion;
- (id)feedEntry:(id)a3 requestDataWithPriority:(float)a4 block:(id)a5;
- (id)getTintColorFromOptions:(id)a3;
- (id)menuElementsWithData:(id)a3;
- (id)metricsForFeedController:(id)a3;
- (id)newAnalyticsSessionAssertionForFeedController:(id)a3;
- (id)newAnalyticsSessionExtendingAssertionForFeedController:(id)a3;
- (id)preferredFocusEnvironments;
- (id)redactedDescription;
- (id)resumeAndRebuildForReason:(id)a3;
- (id)sheetTransitioningCardContentArtworkSourceInEntryWithIndex:(unint64_t)a3;
- (int64_t)distanceFromFocusedCard;
- (int64_t)feedContentLoadingState;
- (int64_t)feedLiveResizeOptions;
- (int64_t)loadPriority;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)coverEffectsContent;
- (unint64_t)navigationBarStyle;
- (unint64_t)statsModeForFeedViewController:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)supportedInterfaceOrientationsForSelf;
- (unint64_t)visibilityOfArtworkSource:(id)a3;
- (unint64_t)visibilityOfCoverSource:(id)a3 ignoringYAxis:(BOOL)a4;
- (void)_addAlphaOverrideToRefId:(id)a3 refInstance:(id)a4 alpha:(double)a5 animated:(BOOL)a6 duration:(double)a7;
- (void)_configureNavigationBarWithStyle:(unint64_t)a3;
- (void)_customizePresentationUsingViewController:(id)a3 environment:(id)a4;
- (void)_dismissBanner:(BOOL)a3;
- (void)_displayBottomBanner:(id)a3 animated:(BOOL)a4;
- (void)_displayBottomBannerForRequest:(id)a3;
- (void)_feedContentDidLoad:(id)a3 signpost:(unint64_t)a4;
- (void)_feedMetadataDidUpdate;
- (void)_fixTwoLineLargeTitleLayoutIfNeeded;
- (void)_handleEngagementMessageRequest:(id)a3 forIdentifier:(id)a4;
- (void)_manuallyAdjustBottomContentInset;
- (void)_prepareForOpenWithViewController:(id)a3 viewSize:(CGSize)a4 overrideTraitsBlock:(id)a5 numEntries:(int64_t)a6 completion:(id)a7;
- (void)_removeAlphaOverrideFromRefId:(id)a3 refInstance:(id)a4 animated:(BOOL)a5 duration:(double)a6;
- (void)_scheduleUpdateEngagementMessagesToDisplay:(id)a3;
- (void)_setEffectiveAnalyticsTracker:(id)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateBackgroundColor:(BOOL)a3;
- (void)_updateEngagementMessagesToDisplay;
- (void)_updateEngagementMessagesToDisplay:(id)a3;
- (void)_updateNavigationItemWithTitle:(id)a3;
- (void)_updateNavigationLayoutMetrics;
- (void)_updateSyncTransactionBehaviorInViewWillAppear;
- (void)_updateViewWithBackgroundColor:(id)a3;
- (void)addEngagementObserver:(id)a3;
- (void)auxiliaryNavigationBarViewControllerWithCompletionHandler:(id)a3;
- (void)bc_analyticsVisibilityDidAppear;
- (void)bc_analyticsVisibilityDidDisappear;
- (void)bc_analyticsVisibilityWillDisappear;
- (void)cardSetViewController:(id)a3 willUpdateWithNavigationType:(int64_t)a4;
- (void)cardStackTransitionSuspendUpdatesUntilEndOfTransaction;
- (void)cardStackTransitioningCardContentFinalizeForOpen;
- (void)cardStackTransitioningCardContentFinalizePreparationForOpen;
- (void)cardStackTransitioningCardContentPrepareForDismiss;
- (void)cardStackTransitioningCardContentPrepareForOpenWithViewController:(id)a3 viewSize:(CGSize)a4 index:(unint64_t)a5 completion:(id)a6;
- (void)cardStackViewController:(id)a3 parentCardWillDismissWithReason:(int64_t)a4 targetViewController:(id)a5;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 withData:(id)a5;
- (void)coverAnimationHostPrepareWithCompletion:(id)a3;
- (void)coverAnimationHostScrollToMakeVisible:(id)a3;
- (void)coverAnimationHostUpdateItemVisibility:(BOOL)a3 refId:(id)a4 refInstance:(id)a5;
- (void)dealloc;
- (void)didBecomeCurrentFeed;
- (void)didBecomeVisibleContentScrollView;
- (void)didEndDragSession:(id)a3 dropOperation:(unint64_t)a4;
- (void)didSetCurrentCardState:(id)a3;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)feedController:(id)a3 addAlphaOverrideToItem:(id)a4 alpha:(double)a5 animated:(BOOL)a6 duration:(double)a7;
- (void)feedController:(id)a3 addObserver:(id)a4 forTrigger:(id)a5;
- (void)feedController:(id)a3 collectAndFlush:(BOOL)a4 accumulatedImpressionsWithCompletion:(id)a5;
- (void)feedController:(id)a3 collectStatsWithCompletion:(id)a4;
- (void)feedController:(id)a3 collectVisibleImpressionsWithCompletion:(id)a4;
- (void)feedController:(id)a3 didLoadCardResource:(id)a4;
- (void)feedController:(id)a3 dismissKeyboard:(id)a4;
- (void)feedController:(id)a3 removeAlphaOverrideFromItem:(id)a4 animated:(BOOL)a5 duration:(double)a6;
- (void)feedController:(id)a3 removeObserver:(id)a4 forTrigger:(id)a5;
- (void)feedController:(id)a3 requestToRenderSharableImage:(id)a4 completion:(id)a5;
- (void)feedController:(id)a3 requestToSetNavigationBarHidden:(BOOL)a4 animated:(BOOL)a5;
- (void)feedController:(id)a3 scrollToItem:(id)a4 animated:(BOOL)a5 skipVoiceOverFocus:(BOOL)a6;
- (void)feedController:(id)a3 wantsToAppendCards:(id)a4 options:(id)a5;
- (void)feedController:(id)a3 wantsToCreateNewFeedWithOptions:(id)a4 completion:(id)a5;
- (void)feedController:(id)a3 wantsToDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5;
- (void)feedController:(id)a3 wantsToPerformRawActionModel:(id)a4 shouldReportFigaro:(BOOL)a5;
- (void)feedController:(id)a3 wantsToPopToRootViewControllerAnimated:(BOOL)a4 completion:(id)a5;
- (void)feedController:(id)a3 wantsToPopViewController:(BOOL)a4 completion:(id)a5;
- (void)feedController:(id)a3 wantsToPresentCardsWithCardArray:(id)a4 focusedIndex:(unint64_t)a5 animated:(BOOL)a6 options:(id)a7 completion:(id)a8;
- (void)feedController:(id)a3 wantsToPresentViewController:(id)a4 animated:(BOOL)a5 params:(id)a6;
- (void)feedController:(id)a3 wantsToPresentViewControllerInPopover:(id)a4 withParams:(id)a5;
- (void)feedController:(id)a3 wantsToPushViewController:(id)a4 animated:(BOOL)a5;
- (void)feedController:(id)a3 wantsToReplaceCurrentViewController:(id)a4 animated:(BOOL)a5;
- (void)feedController:(id)a3 wantsToSlideInFeedViewController:(id)a4;
- (void)feedController:(id)a3 wantsToUpdateContentWithData:(id)a4;
- (void)feedController:(id)a3 wantsToUpdateNavBarBackgroundOpacity:(double)a4;
- (void)feedControllerWillHotReload:(id)a3;
- (void)feedViewController:(id)a3 customizeEnvironment:(id)a4;
- (void)feedViewController:(id)a3 willTransitionToLayoutState:(unint64_t)a4;
- (void)feedViewController:(id)val didTransitionToLayoutState:;
- (void)feedViewControllerAllContentReady:(id)a3;
- (void)feedViewControllerInitialContentReady:(id)a3;
- (void)hideLoadingViewForFeedController:(id)a3;
- (void)hostedMessageViewDidBecomeVisible:(id)a3;
- (void)hostedMessageViewDidTriggerAction:(id)a3;
- (void)hostingController:(id)a3 didChangeContentIdentifiers:(id)a4;
- (void)loadEntries;
- (void)menuElementsWithData:(id)a3 completion:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithURL:(id)a4;
- (void)messageViewControllerDidSelectCancel:(id)a3;
- (void)navigationBarItemsDidUpdate:(id)a3 hasItems:(BOOL)a4;
- (void)performDropWithSession:(id)a3 behavior:(id)a4;
- (void)preloadAugmentedExperienceContentWithViewController:(id)a3 numEntries:(int64_t)a4 completion:(id)a5;
- (void)removeEngagementObserver:(id)a3;
- (void)removeProviderForIdentifier:(id)a3;
- (void)renderSharableImageWithOptions:(id)a3 completion:(id)a4;
- (void)resetImpressionsForFeedController:(id)a3;
- (void)revealCoverForRepresentedObject:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActiveRenderOverrides:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setAlreadyNotifiedBottomReached:(BOOL)a3;
- (void)setAmsEngagement:(id)a3;
- (void)setAssertionForSuspendingLayoutUpdates:(id)a3;
- (void)setAvoidSyncTransactionInViewWillAppear:(BOOL)a3;
- (void)setBcSafeAreaInsetsObserver:(id)a3;
- (void)setCardAuxiliaryNavigationBarManager:(id)a3;
- (void)setCardContentDelegate:(id)a3;
- (void)setCardContentScrollManager:(id)a3;
- (void)setCurrentPopOverViewController:(id)a3;
- (void)setCurrentStackName:(id)a3;
- (void)setDisallowLoadingView:(BOOL)a3;
- (void)setDismissOnViewDisappear:(BOOL)a3;
- (void)setDistanceFromFocusedCard:(int64_t)a3;
- (void)setEffectiveAnalyticsTracker:(id)a3;
- (void)setFeedContentLoadingState:(int64_t)a3;
- (void)setFeedLiveResizeOptions:(int64_t)a3;
- (void)setFeedTriggerObserver:(id)a3;
- (void)setIsInCard:(BOOL)a3;
- (void)setIsPresented:(BOOL)a3;
- (void)setJsFeedController:(id)a3;
- (void)setLastTwoLineTitleFixHadSearchController:(BOOL)a3;
- (void)setLastTwoLineTitleFixed:(id)a3;
- (void)setLoadPriority:(int64_t)a3;
- (void)setMessageViewControllerProvider:(id)a3;
- (void)setMetadataDelegate:(id)a3;
- (void)setNavBarBackgroundOpacity:(double)a3 manualScrollEdgeAppearanceEnabled:(BOOL)a4;
- (void)setNavBarBackgroundOpacity:(double)a3 withTitle:(BOOL)a4 manualScrollEdgeAppearanceEnabled:(BOOL)a5;
- (void)setNavigationBarStyle:(unint64_t)a3;
- (void)setNavigationBarTintColorWhenLayoutReady:(id)a3;
- (void)setNavigationItem:(id)a3;
- (void)setNotificationObservers:(id)a3;
- (void)setOpenFinalized:(BOOL)a3;
- (void)setParentCardNavigationType:(id)a3;
- (void)setPerformantForReadingExperience:(BOOL)a3;
- (void)setPerformantForScrolling:(BOOL)a3;
- (void)setPopoverArrowBackgroundView:(id)a3;
- (void)setSuspendLayoutForScrolling:(id)a3;
- (void)setTrackerName:(id)a3;
- (void)setViewSizeWhenNotifiedBottomReached:(CGSize)a3;
- (void)setWasPresentingCards:(BOOL)a3;
- (void)setupAMSEngagementObservers;
- (void)sheetTransitioningCardContentPrepareForOpenWithViewController:(id)a3 viewSize:(CGSize)a4 overrideTraitsBlock:(id)a5 numEntries:(int64_t)a6 completion:(id)a7;
- (void)showPopoverWithViewController:(id)a3 params:(id)a4;
- (void)suspendAndTeardownForReason:(id)a3;
- (void)updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)updateFeedContentSynchronously;
- (void)updateFeedContentWithCompletion:(id)a3;
- (void)updateNavigationBarOpacity;
- (void)viewController:(id)a3 didDisplayMessageWithId:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BSUIFeedViewController

- (BSUIFeedViewController)initWithOptions:(id)a3
{
  id v4 = a3;
  v5 = +[BSUITemplate manager];
  v6 = +[BSUITemplate factory];
  v38.receiver = self;
  v38.super_class = (Class)BSUIFeedViewController;
  v7 = [(BSUIFeedViewController *)&v38 initWithFeedContent:0 manager:v5 factory:v6];

  if (v7)
  {
    v8 = [BSUIDynamicValue alloc];
    v9 = [(BSUIDynamicValue *)v8 initWithValue:TUIFeedContentDefaultStackName options:&off_3A0C68];
    currentStackName = v7->_currentStackName;
    v7->_currentStackName = v9;

    v7->_contentInsetAdjustmentBehavior = 0;
    v11 = [objc_alloc(-[BSUIFeedViewController jsaFeedControllerClass](v7, "jsaFeedControllerClass")) initWithOptions:v4 completion:0];
    jsFeedController = v7->_jsFeedController;
    v7->_jsFeedController = v11;

    [(JSAFeedController *)v7->_jsFeedController setDataSource:v7];
    [(JSAFeedController *)v7->_jsFeedController setDelegate:v7];
    v7->_preferredLargeTitleDisplayMode = [(JSAFeedController *)v7->_jsFeedController isRootFeed];
    v13 = [v4 objectForKeyedSubscript:@"contextMenuProvider"];
    uint64_t v14 = BUProtocolCast();
    contextMenuProvider = v7->_contextMenuProvider;
    v7->_contextMenuProvider = (BSUIContextMenuProviding *)v14;

    v16 = [v4 objectForKeyedSubscript:@"contextMenuProvider"];
    uint64_t v17 = BUProtocolCast();
    asyncContextMenuProvider = v7->_asyncContextMenuProvider;
    v7->_asyncContextMenuProvider = (BSUIAsyncContextMenuProviding *)v17;

    if (v7->_contextMenuProvider && v7->_asyncContextMenuProvider) {
      [(BSUIFeedViewController *)v7 setContextMenuConfigurationProvider:v7];
    }
    v19 = objc_alloc_init(BSUIFeedTriggerBlockObserver);
    feedTriggerObserver = v7->_feedTriggerObserver;
    v7->_feedTriggerObserver = v19;

    [(BSUIFeedViewController *)v7 setDelegate:v7];
    [(BSUIFeedViewController *)v7 _feedMetadataDidUpdate];
    objc_opt_class();
    v21 = [v4 objectForKeyedSubscript:@"isInCard"];
    v22 = BUDynamicCast();
    id v23 = [v22 BOOLValue];

    [(BSUIFeedViewController *)v7 setIsInCard:v23];
    if (v23)
    {
      v24 = objc_alloc_init(BSUICardAuxiliaryNavigationBarManager);
      cardAuxiliaryNavigationBarManager = v7->_cardAuxiliaryNavigationBarManager;
      v7->_cardAuxiliaryNavigationBarManager = v24;
    }
    else
    {
      [(BSUIFeedViewController *)v7 loadEntries];
    }
    objc_opt_class();
    v26 = [v4 objectForKeyedSubscript:@"deferUIUpdateUntilInitialContentReady"];
    v27 = BUDynamicCast();
    v7->_deferUIUpdateUntilInitialContentReady = [v27 BOOLValue];

    if ([(BSUIFeedViewController *)v7 deferUIUpdateUntilInitialContentReady])
    {
      v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v29 = dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_USER_INITIATED, 0);
      v30 = dispatch_queue_attr_make_initially_inactive(v29);
      dispatch_queue_t v31 = dispatch_queue_create("com.apple.iBooks.BSUIFeedVC.deferredReloads", v30);
      deferredReloadsQueue = v7->_deferredReloadsQueue;
      v7->_deferredReloadsQueue = (OS_dispatch_queue *)v31;

      uint64_t v33 = +[NSMutableSet set];
      deferredEngagementMessageIdentifiers = v7->_deferredEngagementMessageIdentifiers;
      v7->_deferredEngagementMessageIdentifiers = (NSMutableSet *)v33;
    }
    v35 = +[UITraitCollection bc_allAPITraits];
    id v36 = [(BSUIFeedViewController *)v7 registerForTraitChanges:v35 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v7;
}

+ (void)createAsync:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_461BC;
  v13[3] = &unk_38FB58;
  id v8 = v6;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  id v16 = a1;
  v10 = objc_retainBlock(v13);
  if (v10)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v10[2])(v10);
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_46650;
      v11[3] = &unk_38E0B8;
      v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    }
  }
}

+ (void)createAsyncWithNavigationController:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_467B8;
  v13[3] = &unk_38FB58;
  id v16 = a1;
  id v8 = v6;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  v10 = objc_retainBlock(v13);
  if (v10)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v10[2])(v10);
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_468DC;
      v11[3] = &unk_38E0B8;
      v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    }
  }
}

- (int64_t)preferredStatusBarStyle
{
  v3 = [(BSUIFeedViewController *)self view];
  id v4 = [v3 traitCollection];
  unsigned int v5 = [v4 bc_userInterfaceStyleDark];

  if (v5) {
    int64_t v6 = 1;
  }
  else {
    int64_t v6 = 3;
  }
  id v7 = [(BSUIFeedViewController *)self jsFeedController];
  id v8 = [v7 metadata];
  uint64_t v9 = [v8 navigationBarTintColor];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(BSUIFeedViewController *)self navigationItem];
    v12 = [v11 navigationBar];
    [v12 _titleOpacity];
    double v14 = v13;

    if (v14 <= 0.5)
    {
      id v15 = [(BSUIFeedViewController *)self navigationController];
      id v16 = [v15 navigationBar];
      uint64_t v17 = [v16 tintColor];
      [v17 bc_brightness];
      double v19 = v18;

      if (v19 > 0.7) {
        int64_t v6 = 1;
      }
      else {
        int64_t v6 = 3;
      }
    }
  }
  else
  {
  }
  char v20 = _os_feature_enabled_impl();
  if ([(BSUIFeedViewController *)self isInCard])
  {
    v21 = [(BSUIFeedViewController *)self navigationController];
    v22 = [v21 viewControllers];
    if ([v22 count] != (char *)&dword_0 + 1) {
      char v20 = 0;
    }

    if (v20) {
      return 0;
    }
  }
  return v6;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v24 viewDidLoad];
  if (![(BSUIFeedViewController *)self isInCard]) {
    -[BSUIFeedViewController showLoadingViewForFeedController:]_0(self);
  }
  int64_t contentInsetAdjustmentBehavior = self->_contentInsetAdjustmentBehavior;
  id v4 = [(BSUIFeedViewController *)self scrollView];
  [v4 setContentInsetAdjustmentBehavior:contentInsetAdjustmentBehavior];

  if (self->_wantsTransparentNavigationBar) {
    sub_46DD8(self);
  }
  if (self->_deferredAdjustBottomContentInset) {
    [(BSUIFeedViewController *)self _manuallyAdjustBottomContentInset];
  }
  unsigned int v5 = [(BSUIFeedViewController *)self hostingController];
  [v5 addContentObserver:self];

  [(BSUIFeedViewController *)self setupAMSEngagementObservers];
  [(BSUIFeedViewController *)self loadEntries];
  int64_t v6 = [(BSUIFeedViewController *)self cardContentScrollManager];
  id v7 = [(BSUIFeedViewController *)self scrollView];
  [v6 cardContentViewController:self initializeManagerWithScrollView:v7];

  id v8 = [(BSUIFeedViewController *)self scrollView];
  [v8 bounds];
  -[BSUIFeedViewController setViewSizeWhenNotifiedBottomReached:](self, "setViewSizeWhenNotifiedBottomReached:", v9, v10);

  [(BSUIFeedViewController *)self _updateBackgroundColor:0];
  objc_initWeak(&location, self);
  v11 = +[NSNotificationCenter defaultCenter];
  v12 = +[NSOperationQueue mainQueue];
  double v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  char v20 = sub_46E84;
  v21 = &unk_38FB80;
  objc_copyWeak(&v22, &location);
  double v13 = [v11 addObserverForName:UIApplicationWillEnterForegroundNotification object:0 queue:v12 usingBlock:&v18];

  v25 = v13;
  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1, v18, v19, v20, v21);
  double v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  notificationObservers = self->_notificationObservers;
  self->_notificationObservers = v14;

  id v16 = [(BSUIFeedViewController *)self navigationItem];
  uint64_t v17 = [v16 title];
  [(BSUIFeedViewController *)self setLastTwoLineTitleFixed:v17];

  [(BSUIFeedViewController *)self _feedMetadataDidUpdate];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (_BYTE)showLoadingViewForFeedController:(unsigned char *)result
{
  if (result)
  {
    v1 = result;
    if (([result isViewLoaded] & 1) == 0) {
      BUHaltDebugger();
    }
    v1[24] = 1;
    return [v1 setNeedsUpdateContentUnavailableConfiguration];
  }
  return result;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  if ([(BSUIFeedViewController *)self isInCard])
  {
    objc_opt_class();
    unsigned int v5 = [(BSUIFeedViewController *)self navigationController];
    BUDynamicCast();
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if ([v6 isCurrentCard]) {
      [(BSUIFeedViewController *)self didBecomeVisibleContentScrollView];
    }
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v5 viewSafeAreaInsetsDidChange];
  if ((char *)[(BSUIFeedViewController *)self navigationBarStyle] == (char *)&dword_0 + 2) {
    [(BSUIFeedViewController *)self _manuallyAdjustBottomContentInset];
  }
  v3 = [(BSUIFeedViewController *)self bcSafeAreaInsetsObserver];
  id v4 = [(BSUIFeedViewController *)self view];
  [v4 safeAreaInsets];
  [v3 bcSafeAreaInsetsObservableViewController:self safeAreaInsetsDidChange:];
}

- (void)updateNavigationBarOpacity
{
  v3 = [(BSUIFeedViewController *)self navigationController];
  id v4 = [v3 topViewController];

  if (v4 == self)
  {
    v5.receiver = self;
    v5.super_class = (Class)BSUIFeedViewController;
    [(BSUIFeedViewController *)&v5 updateNavigationBarOpacity];
  }
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (void)setFeedLiveResizeOptions:(int64_t)a3
{
  self->_feedLiveResizeOptions = a3;
  if ((unint64_t)a3 <= 3) {
    [(BSUIFeedViewController *)self setLiveResizeOptions:qword_2FCE00[a3]];
  }
}

- (id)preferredFocusEnvironments
{
  v2 = [(BSUIFeedViewController *)self view];
  objc_super v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@ %p [fid:%lu] >", objc_opt_class(), self, [(BSUIFeedViewController *)self feedId]];
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:@"<%@ %p [fid:%lu] >", objc_opt_class(), self, [(BSUIFeedViewController *)self feedId]];
}

- (void)cardSetViewController:(id)a3 willUpdateWithNavigationType:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)a4 <= 3)
  {
    id v7 = v6;
    [(BSUIFeedViewController *)self setParentCardNavigationType:off_390018[a4]];
    id v6 = v7;
  }
}

- (void)cardStackViewController:(id)a3 parentCardWillDismissWithReason:(int64_t)a4 targetViewController:(id)a5
{
  if ((unint64_t)a4 > 2) {
    id v6 = 0;
  }
  else {
    id v6 = off_390038[a4];
  }
  BUProtocolCast();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v11 currentFeedViewController];
  id v8 = [v7 feedController];
  double v9 = [v8 feed];

  double v10 = [(BSUIFeedViewController *)self feedController];
  [v10 notifyParentCardWillDismissWithReason:v6 targetFeed:v9];
}

- (void)setMetadataDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_metadataDelegate, a3);

  [(BSUIFeedViewController *)self _feedMetadataDidUpdate];
}

- (void)_feedMetadataDidUpdate
{
  v3 = [(BSUIFeedViewController *)self jsFeedController];
  id v16 = [v3 metadata];

  id v4 = v16;
  if (!v16) {
    goto LABEL_15;
  }
  objc_super v5 = [(BSUIFeedViewController *)self metadataDelegate];
  [v5 bsuiFeedViewControllerNavigationBarStyle:[v16 navigationBarStyle]];

  id v6 = [v16 trackerName];
  if ([v6 length]) {
    [(BSUIFeedViewController *)self setTrackerName:v6];
  }
  -[BSUIFeedViewController bc_setNavBarVisible:](self, "bc_setNavBarVisible:", [v16 navigationBarVisible]);
  id v7 = [(BSUIFeedViewController *)self jsFeedController];
  unsigned __int8 v8 = [v7 isRootFeed];

  double v9 = v16;
  if ((v8 & 1) == 0)
  {
    if ([v16 navigationBarStyle] == (char *)&dword_0 + 2)
    {
      [(BSUIFeedViewController *)self _updateNavigationItemWithTitle:&stru_39B8B0];
LABEL_9:
      double v9 = v16;
      goto LABEL_10;
    }
    double v10 = [v16 title];

    double v9 = v16;
    if (v10)
    {
      id v11 = [v16 title];
      [(BSUIFeedViewController *)self _updateNavigationItemWithTitle:v11];

      goto LABEL_9;
    }
  }
LABEL_10:
  v12 = [v9 backTitle];
  double v13 = v12;
  if (!v12)
  {
    double v13 = [v16 title];
  }
  double v14 = [(BSUIFeedViewController *)self navigationItem];
  [v14 setBackButtonTitle:v13];

  if (!v12) {
  id v15 = [(BSUIFeedViewController *)self navigationItem];
  }
  [v15 _setSupportsTwoLineLargeTitles:1];

  -[BSUIFeedViewController _configureNavigationBarWithStyle:](self, "_configureNavigationBarWithStyle:", [v16 navigationBarStyle]);
  [(BSUIFeedViewController *)self _updateBackgroundColor:1];
  [(BSUIFeedViewController *)self _fixTwoLineLargeTitleLayoutIfNeeded];
  [(BSUIFeedViewController *)self _updateNavigationLayoutMetrics];
  -[BSUIFeedViewController setShowsVerticalScrollIndicator:](self, "setShowsVerticalScrollIndicator:", [v16 showsVerticalScrollIndicator]);

  id v4 = v16;
LABEL_15:
}

- (void)_manuallyAdjustBottomContentInset
{
  v3 = [(BSUIFeedViewController *)self scrollView];

  if (v3)
  {
    id v4 = [(BSUIFeedViewController *)self scrollView];
    [v4 contentInset];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;

    id v11 = [(BSUIFeedViewController *)self viewIfLoaded];
    [v11 safeAreaInsets];
    double v13 = v12;

    double v14 = [(BSUIFeedViewController *)self scrollView];
    [v14 setContentInset:v6, v8, v13, v10];

    id v15 = [(BSUIFeedViewController *)self scrollView];
    [v15 setScrollIndicatorInsets:v6, v8, v13, v10];

    BOOL v16 = 0;
  }
  else
  {
    BOOL v16 = 1;
  }
  self->_deferredAdjustBottomContentInset = v16;
}

- (void)_configureNavigationBarWithStyle:(unint64_t)a3
{
  if ([(BSUIFeedViewController *)self navigationBarStyle] != a3)
  {
    [(BSUIFeedViewController *)self setNavigationBarStyle:a3];
    double v5 = [(BSUIFeedViewController *)self jsFeedController];
    double v6 = [v5 metadata];
    double v7 = [v6 navigationBarTintColor];

    if (v7) {
      [(BSUIFeedViewController *)self setNavigationBarTintColorWhenLayoutReady:v7];
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_477CC;
    v12[3] = &unk_38E738;
    v12[4] = self;
    double v8 = objc_retainBlock(v12);
    double v9 = v8;
    switch(a3)
    {
      case 4uLL:
        ((void (*)(void *))v8[2])(v8);
        sub_46DD8(self);
        self->_wantsTransparentNavigationBar = 1;
        break;
      case 2uLL:
        ((void (*)(void *))v8[2])(v8);
        goto LABEL_12;
      case 0uLL:
        double v10 = self;
        uint64_t v11 = 1;
LABEL_10:
        sub_47844(v10, v11);
LABEL_12:

        return;
    }
    double v10 = self;
    uint64_t v11 = 2;
    goto LABEL_10;
  }
}

- (void)_updateNavigationLayoutMetrics
{
  objc_opt_class();
  v3 = [(BSUIFeedViewController *)self navigationController];
  BUDynamicCast();
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [v4 updateLayoutMetrics];
}

- (void)_updateBackgroundColor:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BSUIFeedViewController *)self isViewLoaded])
  {
    double v5 = [(BSUIFeedViewController *)self traitCollection];
    double v6 = (char *)[v5 userInterfaceStyle];

    double v7 = [(BSUIFeedViewController *)self jsFeedController];
    double v8 = [v7 metadata];
    double v9 = [v8 dayBackgroundColor];

    double v10 = [(BSUIFeedViewController *)self jsFeedController];
    uint64_t v11 = [v10 metadata];
    double v12 = [v11 nightBackgroundColor];

    if (v9 && v12)
    {
      id v13 = +[UIColor bc_dynamicColorWithLightColor:v9 darkColor:v12];
    }
    else
    {
      if (v6 == (unsigned char *)&dword_0 + 2 && v12)
      {
        id v14 = v12;
        goto LABEL_10;
      }
      id v13 = v9;
    }
    id v14 = v13;
    if (!v13)
    {
LABEL_14:

      return;
    }
LABEL_10:
    if (v3
      && ([(BSUIFeedViewController *)self viewIfLoaded],
          id v15 = objc_claimAutoreleasedReturnValue(),
          [v15 window],
          BOOL v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_47B00;
      v17[3] = &unk_38E1F8;
      v17[4] = self;
      id v14 = v14;
      id v18 = v14;
      +[UIView animateWithDuration:v17 animations:0.2];
    }
    else
    {
      [(BSUIFeedViewController *)self _updateViewWithBackgroundColor:v14];
    }
    goto LABEL_14;
  }
}

- (void)setNavBarBackgroundOpacity:(double)a3 manualScrollEdgeAppearanceEnabled:(BOOL)a4
{
}

- (UINavigationItem)navigationItem
{
  navigationItem = self->_navigationItem;
  if (!navigationItem)
  {
    id v4 = (UINavigationItem *)objc_opt_new();
    [(UINavigationItem *)v4 setAllowsTitle:1];
    [(UINavigationItem *)v4 _dci_setPreferredSearchBarPlacement:2];
    double v5 = self->_navigationItem;
    self->_navigationItem = v4;

    navigationItem = self->_navigationItem;
  }

  return navigationItem;
}

- (void)_updateNavigationItemWithTitle:(id)a3
{
  id v9 = a3;
  id v4 = [(BSUIFeedViewController *)self navigationItem];
  double v5 = [v4 title];
  unsigned __int8 v6 = [v5 isEqualToString:v9];

  if ((v6 & 1) == 0)
  {
    objc_opt_class();
    double v7 = [(BSUIFeedViewController *)self navigationItem];
    double v8 = BUDynamicCast();

    [v8 setAllowsTitle:1];
    [v8 setTitle:v9];
    [v8 setAllowsTitle:[v9 length] != 0];
  }
}

- (void)_fixTwoLineLargeTitleLayoutIfNeeded
{
  id v21 = [(BSUIFeedViewController *)self navigationItem];
  BOOL v3 = [v21 title];
  if (![v3 length]
    || [v21 largeTitleDisplayMode] == (char *)&dword_0 + 2
    || [v21 _largeTitleTwoLineMode] != (char *)&dword_0 + 1)
  {
    goto LABEL_11;
  }
  id v4 = [(BSUIFeedViewController *)self lastTwoLineTitleFixed];
  if (![v4 length]) {
    goto LABEL_9;
  }
  double v5 = [(BSUIFeedViewController *)self lastTwoLineTitleFixed];
  unsigned __int8 v6 = [v21 title];
  if (![v5 isEqualToString:v6])
  {

LABEL_9:
    goto LABEL_10;
  }
  unsigned __int8 v7 = [(BSUIFeedViewController *)self lastTwoLineTitleFixHadSearchController];
  double v8 = [v21 searchController];
  char v9 = v7 ^ (v8 != 0);

  if (v9)
  {
LABEL_10:
    double v10 = [v21 title];
    [(BSUIFeedViewController *)self setLastTwoLineTitleFixed:v10];

    uint64_t v11 = [v21 searchController];
    [(BSUIFeedViewController *)self setLastTwoLineTitleFixHadSearchController:v11 != 0];

    double v12 = [(BSUIFeedViewController *)self navigationController];
    id v13 = [v12 navigationBar];
    [v13 sizeThatFits:CGSizeZero.width, CGSizeZero.height];
    double v15 = v14;

    BOOL v16 = [(BSUIFeedViewController *)self navigationController];
    uint64_t v17 = [v16 navigationBar];
    [v17 frame];
    double v19 = -(v15 + v18);

    char v20 = [(BSUIFeedViewController *)self scrollView];
    [v20 setContentOffset:0.0, v19];

    BOOL v3 = [(BSUIFeedViewController *)self scrollView];
    [v3 setContentOffset:0.0 v19];
LABEL_11:
  }
}

- (void)setNavBarBackgroundOpacity:(double)a3 withTitle:(BOOL)a4 manualScrollEdgeAppearanceEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  char v9 = [(BSUIFeedViewController *)self jsFeedController];
  unsigned __int8 v10 = [v9 isRootFeed];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [(BSUIFeedViewController *)self jsFeedController];
    double v12 = [v11 metadata];
    id v13 = (char *)[v12 navigationBarStyle];

    if (v13 == (unsigned char *)&dword_0 + 2)
    {
      if (fabs(a3) >= 2.22044605e-16)
      {
        double v14 = [(BSUIFeedViewController *)self jsFeedController];
        double v15 = [v14 metadata];
        BOOL v16 = [v15 title];

        if (v16 && v6)
        {
          uint64_t v17 = [(BSUIFeedViewController *)self jsFeedController];
          double v18 = [v17 metadata];
          double v19 = [v18 title];
          [(BSUIFeedViewController *)self _updateNavigationItemWithTitle:v19];
        }
      }
      else
      {
        [(BSUIFeedViewController *)self _updateNavigationItemWithTitle:&stru_39B8B0];
      }
    }
  }
  if (a3 > 0.5)
  {
    char v20 = [(BSUIFeedViewController *)self navigationController];
    id v21 = [v20 navigationBar];
    id v22 = +[UIColor bc_booksKeyColor];
    [v21 setTintColor:v22];
    goto LABEL_13;
  }
  id v23 = [(BSUIFeedViewController *)self jsFeedController];
  objc_super v24 = [v23 metadata];
  if ([v24 navigationBarStyle] != (char *)&dword_0 + 2)
  {

    goto LABEL_16;
  }
  v25 = [(BSUIFeedViewController *)self jsFeedController];
  v26 = [v25 metadata];
  v27 = [v26 navigationBarTintColor];

  if (v27)
  {
    char v20 = [(BSUIFeedViewController *)self jsFeedController];
    id v21 = [v20 metadata];
    id v22 = [v21 navigationBarTintColor];
    v28 = [(BSUIFeedViewController *)self navigationController];
    v29 = [v28 navigationBar];
    [v29 setTintColor:v22];

LABEL_13:
    if (([(BSUIFeedViewController *)self runningInExtension] & 1) == 0) {
      [(BSUIFeedViewController *)self setNeedsStatusBarAppearanceUpdate];
    }
  }
LABEL_16:
  v30.receiver = self;
  v30.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v30 setNavBarBackgroundOpacity:v5 manualScrollEdgeAppearanceEnabled:a3];
}

- (UIColor)preferredNavigationBarTintColor
{
  BOOL v3 = [(BSUIFeedViewController *)self navigationItem];
  unsigned int v4 = [v3 _isManualScrollEdgeAppearanceEnabled];

  if (v4)
  {
    BOOL v5 = [(BSUIFeedViewController *)self navigationItem];
    [v5 _manualScrollEdgeAppearanceProgress];
    if (v6 > 0.5)
    {
      char v9 = +[UIColor bc_booksKeyColor];
    }
    else
    {
      unsigned __int8 v7 = [(BSUIFeedViewController *)self jsFeedController];
      double v8 = [v7 metadata];
      char v9 = [v8 navigationBarTintColor];
    }
  }
  else
  {
    char v9 = +[UIColor bc_booksKeyColor];
  }

  return (UIColor *)v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BSUIFeedViewController *)self avoidSyncTransactionInViewWillAppear])
  {
    BOOL v5 = BSUIFeedViewControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      id v29 = [(BSUIFeedViewController *)self feedId];
      __int16 v30 = 1024;
      unsigned int v31 = [(BSUIFeedViewController *)self performantForScrolling];
      __int16 v32 = 1024;
      unsigned int v33 = [(BSUIFeedViewController *)self performantForReadingExperience];
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[fid:%lu] viewWillAppear skips sync transaction because either Scrolling=%{BOOL}d or ReadingExperience=%{BOOL}d", buf, 0x18u);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v27 viewWillAppear:v3];
  double v6 = [(BSUIFeedViewController *)self feedController];
  [v6 notifyOnAppear];

  if (([(BSUIFeedViewController *)self isBeingPresented] & 1) == 0)
  {
    unsigned __int8 v7 = [(BSUIFeedViewController *)self jsFeedController];
    double v8 = [v7 metadata];
    -[BSUIFeedViewController _configureNavigationBarWithStyle:](self, "_configureNavigationBarWithStyle:", [v8 navigationBarStyle]);
  }
  char v9 = [(BSUIFeedViewController *)self presentedViewController];
  if (v9) {
    goto LABEL_10;
  }
  unsigned __int8 v10 = [(BSUIFeedViewController *)self navigationController];
  unsigned int v11 = [v10 isNavigationBarHidden];
  unsigned int v12 = [(BSUIFeedViewController *)self bc_navBarVisible];

  if (v11 == v12)
  {
    char v9 = [(BSUIFeedViewController *)self navigationController];
    id v13 = [(BSUIFeedViewController *)self navigationController];
    [v9 setNavigationBarHidden:[v13 isNavigationBarHidden] ^ 1 animated:v3];

LABEL_10:
  }
  if (self->_trackerName)
  {
    double v14 = [(BSUIFeedViewController *)self ba_analyticsTracker];

    if (!v14)
    {
      double v15 = [(BSUIFeedViewController *)self ba_setupNewAnalyticsTrackerWithName:self->_trackerName];
      [(BSUIFeedViewController *)self _setEffectiveAnalyticsTracker:v15];
    }
  }
  BOOL v16 = [(BSUIFeedViewController *)self transitionCoordinator];
  unsigned int v17 = [v16 isAnimated];

  if (v17)
  {
    double v18 = [(BSUIFeedViewController *)self transitionCoordinator];
    v25[4] = self;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_48640;
    v26[3] = &unk_38E0E0;
    v26[4] = self;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_48648;
    v25[3] = &unk_38E0E0;
    [v18 animateAlongsideTransition:v26 completion:v25];
  }
  id v19 = [(BSUIFeedViewController *)self waitForVisibleImageResourcesToLoadAssertionWithTimeout:0 completion:0.2];
  char v20 = [(BSUIFeedViewController *)self metadataDelegate];
  id v21 = [(BSUIFeedViewController *)self jsFeedController];
  id v22 = [v21 metadata];
  [v20 bsuiFeedViewControllerNavigationBarStyle:[v22 navigationBarStyle]];

  if ([(BSUIFeedViewController *)self isInCard])
  {
    objc_opt_class();
    id v23 = [(BSUIFeedViewController *)self navigationController];
    objc_super v24 = BUDynamicCast();

    if ([v24 isCurrentCard]) {
      [(BSUIFeedViewController *)self didBecomeVisibleContentScrollView];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v11 viewDidAppear:a3];
  unsigned int v4 = [(BSUIFeedViewController *)self presentingViewController];
  [(BSUIFeedViewController *)self setIsPresented:v4 != 0];

  BOOL v5 = [(BSUIFeedViewController *)self feedController];
  [v5 notifyDidAppear];

  [(BSUIFeedViewController *)self bc_analyticsVisibilityUpdateSubtree];
  if ([(BSUIFeedViewController *)self isPresented])
  {
    double v6 = [(BSUIFeedViewController *)self navigationController];
    unsigned __int8 v7 = [v6 navigationBar];
    unsigned __int8 v8 = [v7 isHidden];

    if ((v8 & 1) == 0)
    {
      UIAccessibilityNotifications v9 = UIAccessibilityScreenChangedNotification;
      unsigned __int8 v10 = [(BSUIFeedViewController *)self view];
      UIAccessibilityPostNotification(v9, v10);
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v9 viewWillDisappear:a3];
  unsigned int v4 = [(BSUIFeedViewController *)self navigationController];
  if ([v4 isNavigationBarHidden])
  {
    unsigned int v5 = [(BSUIFeedViewController *)self bc_navBarVisible];

    if (!v5) {
      goto LABEL_5;
    }
    unsigned int v4 = [(BSUIFeedViewController *)self navigationController];
    [v4 setNavigationBarHidden:0 animated:0];
  }

LABEL_5:
  double v6 = [(BSUIFeedViewController *)self currentPopOverViewController];

  if (v6)
  {
    unsigned __int8 v7 = [(BSUIFeedViewController *)self currentPopOverViewController];
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
  [(BSUIFeedViewController *)self setIsPresented:0];
  [(BSUIFeedViewController *)self setWasPresentingCards:0];
  unsigned __int8 v8 = [(BSUIFeedViewController *)self feedController];
  [v8 notifyOnDisappear];

  [(BSUIFeedViewController *)self bc_analyticsVisibilitySubtreeWillDisappear];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v7 viewDidDisappear:a3];
  [(BSUIFeedViewController *)self bc_analyticsVisibilitySubtreeDidDisappear];
  unsigned int v4 = BSUIFeedViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(BSUIFeedViewController *)self feedId];
    *(_DWORD *)buf = 134217984;
    id v9 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[fid:%lu] viewDidDisappear: Sending BSUIFeedViewControllerDidDisappearNotification", buf, 0xCu);
  }

  double v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"BSUIFeedViewControllerDidDisappearNotification" object:0];
}

- (void)bc_analyticsVisibilityDidAppear
{
  v4.receiver = self;
  v4.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v4 bc_analyticsVisibilityDidAppear];
  [(BSUIFeedViewController *)self updateVisibility];
  BOOL v3 = [(BSUIFeedViewController *)self jsFeedController];
  [v3 notifyAnalyticsVisibilityDidAppear];

  [(BSUIFeedViewController *)self _updateEngagementMessagesToDisplay];
}

- (void)bc_analyticsVisibilityWillDisappear
{
  v4.receiver = self;
  v4.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v4 bc_analyticsVisibilityWillDisappear];
  BOOL v3 = [(BSUIFeedViewController *)self jsFeedController];
  [v3 notifyAnalyticsVisibilityWillDisappear];
}

- (void)bc_analyticsVisibilityDidDisappear
{
  v3.receiver = self;
  v3.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v3 bc_analyticsVisibilityDidDisappear];
  [(BSUIFeedViewController *)self updateVisibility];
}

- (void)setPerformantForScrolling:(BOOL)a3
{
  if (self->_performantForScrolling != a3)
  {
    BOOL v3 = a3;
    self->_performantForScrolling = a3;
    if (a3)
    {
      id v5 = [(BSUIFeedViewController *)self suspendLayout];
      [(BSUIFeedViewController *)self setSuspendLayoutForScrolling:v5];
    }
    else
    {
      [(BSUIFeedViewController *)self setSuspendLayoutForScrolling:0];
    }
    [(BSUIFeedViewController *)self setDisallowLoadingView:v3];
    [(BSUIFeedViewController *)self _updateSyncTransactionBehaviorInViewWillAppear];
  }
}

- (void)setPerformantForReadingExperience:(BOOL)a3
{
  if (self->_performantForReadingExperience != a3)
  {
    self->_performantForReadingExperience = a3;
    [(BSUIFeedViewController *)self _updateSyncTransactionBehaviorInViewWillAppear];
  }
}

- (void)didBecomeVisibleContentScrollView
{
  unsigned __int8 v3 = [(BSUIFeedViewController *)self isInCard];
  objc_super v4 = [(BSUIFeedViewController *)self cardStackViewController];
  id v5 = [v4 topCardSetViewController];
  double v6 = [v5 currentCardViewController];
  id v15 = [v6 currentState];

  if ((v3 & 1) == 0)
  {
    unsigned __int8 v8 = [(BSUIFeedViewController *)self tabBarController];
    [v8 bc_setPreferredTabBarScrollEdgeAppearance:0];
    goto LABEL_5;
  }
  objc_super v7 = [(BSUIFeedViewController *)self presentingViewController];
  unsigned __int8 v8 = [v7 tabBarController];

  id v9 = +[BCCardSetState expandedState];

  if (v15 != v9)
  {
    unsigned __int8 v10 = [v8 tabBar];
    objc_super v11 = [v10 standardAppearance];
    [v8 bc_setPreferredTabBarScrollEdgeAppearance:v11];

LABEL_5:
    unsigned int v12 = [v8 selectedViewController];
    [v12 setContentScrollView:0 forEdge:4];
    goto LABEL_7;
  }
  [v8 bc_setPreferredTabBarScrollEdgeAppearance:0];
  id v13 = [v8 selectedViewController];
  [v13 setContentScrollView:0 forEdge:4];

  unsigned int v12 = [v8 selectedViewController];
  double v14 = [(BSUIFeedViewController *)self scrollView];
  [v12 setContentScrollView:v14 forEdge:4];

LABEL_7:
}

- (void)didSetCurrentCardState:(id)a3
{
  id v4 = a3;
  id v5 = [(BSUIFeedViewController *)self presentingViewController];
  id v11 = [v5 tabBarController];

  id v6 = +[BCCardSetState expandedState];

  if (v6 == v4)
  {
    [v11 bc_setPreferredTabBarScrollEdgeAppearance:0];
    id v9 = [v11 selectedViewController];
    unsigned __int8 v10 = [(BSUIFeedViewController *)self scrollView];
    [v9 setContentScrollView:v10 forEdge:4];
  }
  else
  {
    objc_super v7 = [v11 tabBar];
    unsigned __int8 v8 = [v7 standardAppearance];
    [v11 bc_setPreferredTabBarScrollEdgeAppearance:v8];

    id v9 = [v11 selectedViewController];
    [v9 setContentScrollView:0 forEdge:4];
  }
}

- (void)didBecomeCurrentFeed
{
  unsigned __int8 v3 = BSUIFeedViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    id v5 = [(BSUIFeedViewController *)self feedId];
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "[fid:%lu] didBecomeCurrentFeed", (uint8_t *)&v4, 0xCu);
  }
}

- (void)loadEntries
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  p_stateLock = &self->_stateLock;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  double v14 = sub_490C0;
  id v15 = &unk_38E428;
  BOOL v16 = self;
  unsigned int v17 = &v18;
  int v4 = v13;
  os_unfair_lock_lock(p_stateLock);
  v14((uint64_t)v4);
  os_unfair_lock_unlock(p_stateLock);

  if (*((unsigned char *)v19 + 24))
  {
    id v5 = BCSignpostFeedViewController();
    id v6 = (char *)os_signpost_id_generate(v5);

    objc_super v7 = BCSignpostFeedViewController();
    unsigned __int8 v8 = v7;
    if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v6, "Load Entries", "", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v9 = [(BSUIFeedViewController *)self jsFeedController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_490F0;
    v10[3] = &unk_38FBA8;
    objc_copyWeak(v11, buf);
    v11[1] = v6;
    [v9 requestEntriesWithCompletion:v10];

    objc_destroyWeak(v11);
    objc_destroyWeak(buf);
  }
  _Block_object_dispose(&v18, 8);
}

- (id)_createFeedContentFromDictionaries:(id)a3 initialContentReadyEntryIndex:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = BSUIFixRelativeURLInEntryDictionary(*(void **)(*((void *)&v19 + 1) + 8 * i));
        id v14 = objc_alloc((Class)TUIFeedEntry);
        id v15 = [v14 initWithDictionary:v13];
        [v15 setDelegate:self];
        [v7 addObject:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  BOOL v16 = [(BSUIFeedViewController *)self currentStackName];
  unsigned int v17 = +[TUIFeedContent feedContentWithEntries:v7 stackName:v16 initialContentReadyEntryIndex:a4];

  return v17;
}

- (void)_feedContentDidLoad:(id)a3 signpost:(unint64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  objc_super v7 = [(BSUIFeedViewController *)self jsFeedController];
  id v8 = [v7 options];
  id v9 = [v8 objectForKeyedSubscript:@"isInitialFeed"];
  id v10 = BUDynamicCast();
  unsigned int v11 = [v10 BOOLValue];

  if (v11)
  {
    unsigned int v12 = +[JSABridge sharedInstance];
    id v13 = [v12 environment];
    id v14 = [v13 context];

    id v15 = [v14 objectForKeyedSubscript:@"App"];
    BOOL v16 = [v15 invokeMethod:@"initialContentReadySection" withArguments:0];
    unsigned int v17 = [v16 toNumber];

    if (v17)
    {
      [v17 doubleValue];
      uint64_t v18 = BSUIFeedViewControllerLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = [(BSUIFeedViewController *)self feedId];
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v17;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "[fid:%lu] Obtained initialContentReadySection=%@ from JS", buf, 0x16u);
      }
    }
    else
    {

      uint64_t v18 = BSUIFeedViewControllerLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_2DD828(self, v18);
      }
      unsigned int v17 = &off_3A0B78;
    }

    uint64_t v19 = (uint64_t)[v17 unsignedIntegerValue];
  }
  else
  {
    unsigned int v17 = 0;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  long long v20 = [(BSUIFeedViewController *)self _createFeedContentFromDictionaries:v6 initialContentReadyEntryIndex:v19];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v35 = sub_49728;
  id v36 = sub_49754;
  id v37 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  __int16 v30 = sub_4975C;
  unsigned int v31 = &unk_38FBD0;
  __int16 v32 = self;
  unsigned int v33 = buf;
  long long v21 = v29;
  os_unfair_lock_lock(&self->_stateLock);
  v30((uint64_t)v21);
  os_unfair_lock_unlock(&self->_stateLock);

  if (*(void *)(*(void *)&buf[8] + 40))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_497D4;
    block[3] = &unk_38FBF8;
    objc_super v27 = buf;
    v26 = v20;
    unint64_t v28 = a4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    long long v22 = v26;
  }
  else
  {
    [(BSUIFeedViewController *)self setContent:v20];
    id v23 = BCSignpostFeedViewController();
    long long v22 = v23;
    if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)objc_super v24 = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v22, OS_SIGNPOST_INTERVAL_END, a4, "Load Entries", "", v24, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)setCardContentScrollManager:(id)a3
{
  int v4 = (BCCardContentScrollManager *)a3;
  if (self->_cardContentScrollManager != v4)
  {
    self->_cardContentScrollManager = v4;
    objc_super v7 = v4;
    id v5 = [(BSUIFeedViewController *)self scrollView];

    int v4 = v7;
    if (v5)
    {
      id v6 = [(BSUIFeedViewController *)self scrollView];
      [(BCCardContentScrollManager *)v7 cardContentViewController:self initializeManagerWithScrollView:v6];

      int v4 = v7;
    }
  }
}

- (int64_t)feedContentLoadingState
{
  uint64_t v11 = 0;
  unsigned int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  p_stateLock = &self->_stateLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  objc_super v7 = sub_49A18;
  id v8 = &unk_38E428;
  id v9 = self;
  id v10 = &v11;
  unsigned __int8 v3 = v6;
  os_unfair_lock_lock(p_stateLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_stateLock);

  int64_t v4 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)setFeedContentLoadingState:(int64_t)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_49AD0;
  v4[3] = &unk_38FC20;
  p_stateLock = &self->_stateLock;
  v4[4] = self;
  v4[5] = a3;
  os_unfair_lock_lock(&self->_stateLock);
  sub_49AD0((uint64_t)v4);
  os_unfair_lock_unlock(p_stateLock);
}

- (id)feedContentCompletion
{
  uint64_t v11 = 0;
  unsigned int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = sub_49728;
  id v15 = sub_49754;
  id v16 = 0;
  p_stateLock = &self->_stateLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  objc_super v7 = sub_49C18;
  id v8 = &unk_38E428;
  id v9 = self;
  id v10 = &v11;
  unsigned __int8 v3 = v6;
  os_unfair_lock_lock(p_stateLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_stateLock);

  id v4 = objc_retainBlock((id)v12[5]);
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (void)setLoadPriority:(int64_t)a3
{
  if (self->_loadPriority != a3)
  {
    self->_loadPriority = a3;
    id v4 = [(BSUIFeedViewController *)self jsFeedController];
    *((void *)&v6 + 1) = self->_loadPriority;
    *(void *)&long long v6 = *((void *)&v6 + 1) + 8;
    unint64_t v5 = v6 >> 2;
    LODWORD(v7) = 0.5;
    if (v5 <= 4) {
      LODWORD(v7) = dword_2FCE20[v5];
    }
    id v8 = v4;
    [v4 setFeedDataRequestPriority:v7];
  }
}

- (void)navigationBarItemsDidUpdate:(id)a3 hasItems:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(BSUIFeedViewController *)self _appearState])
  {
    if (v4)
    {
      [(BSUIFeedViewController *)self bc_setNavBarVisible:1];
    }
    else
    {
      long long v6 = [(BSUIFeedViewController *)self jsFeedController];
      double v7 = [v6 metadata];
      if (v7)
      {
        id v8 = [(BSUIFeedViewController *)self jsFeedController];
        id v9 = [v8 metadata];
        -[BSUIFeedViewController bc_setNavBarVisible:](self, "bc_setNavBarVisible:", [v9 navigationBarVisible]);
      }
      else
      {
        [(BSUIFeedViewController *)self bc_setNavBarVisible:1];
      }
    }
    id v10 = [(BSUIFeedViewController *)self navigationController];
    uint64_t v11 = [v10 topViewController];

    if (v11 == self)
    {
      unsigned int v12 = [(BSUIFeedViewController *)self jsFeedController];
      uint64_t v13 = [v12 metadata];

      if (v13)
      {
        id v15 = [(BSUIFeedViewController *)self scrollView];
        [v15 _verticalVelocity];
        double v17 = v16;

        double v14 = 0.15;
        if (v17 < -3.5) {
          double v14 = 0.0;
        }
        if (v17 >= -2.0) {
          double v18 = 0.2;
        }
        else {
          double v18 = v14;
        }
      }
      else
      {
        double v18 = 0.0;
      }
      uint64_t v19 = [(BSUIFeedViewController *)self navigationController];
      [v19 bc_updateNavBarVisibleWithTransitionCoordinator:0 duration:v18];

      [(BSUIFeedViewController *)self _fixTwoLineLargeTitleLayoutIfNeeded];
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  unsigned __int8 v3 = [(BSUIFeedViewController *)self presentedViewController];
  BOOL v4 = v3;
  if (v3 && [v3 conformsToProtocol:&OBJC_PROTOCOL___BCOrientationControlling]) {
    id v5 = [v4 supportedInterfaceOrientations];
  }
  else {
    id v5 = [(BSUIFeedViewController *)self supportedInterfaceOrientationsForSelf];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (unint64_t)supportedInterfaceOrientationsForSelf
{
  if (isPad()) {
    return 30;
  }
  else {
    return 2;
  }
}

- (id)feedEntry:(id)a3 requestDataWithPriority:(float)a4 block:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v8)
  {
    id v9 = [(BSUIFeedViewController *)self jsFeedController];

    if (v9)
    {
      uint64_t v28 = 0;
      id v29 = &v28;
      uint64_t v30 = 0x2020000000;
      os_signpost_id_t v31 = 0;
      id v10 = BCSignpostFeedViewController();
      os_signpost_id_t v11 = os_signpost_id_generate(v10);

      os_signpost_id_t v31 = v11;
      unsigned int v12 = BCSignpostFeedViewController();
      uint64_t v13 = v12;
      os_signpost_id_t v14 = v29[3];
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        id v15 = [v7 uid];
        double v16 = [v7 templateURL];
        double v17 = [v16 lastPathComponent];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v17;
        _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Request Entry Data", "Entry: %{public}@, Template: %{public}@", buf, 0x16u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      uint64_t v33 = -1;
      objc_initWeak(&location, self);
      double v18 = [(BSUIFeedViewController *)self jsFeedController];
      uint64_t v19 = [v7 uid];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_4A254;
      v21[3] = &unk_38FC70;
      objc_copyWeak(&v26, &location);
      objc_super v24 = &v28;
      v25 = buf;
      id v22 = v7;
      id v23 = v8;
      [v18 requestCompleteDataForEntry:v19 completion:v21];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v28, 8);
    }
    else
    {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }

  return 0;
}

- (BOOL)feedEntry:(id)a3 handleBehavior:(id)a4 name:(id)a5 arguments:(id)a6
{
  if (!a3 || !a5) {
    return 0;
  }
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  unsigned int v12 = [(BSUIFeedViewController *)self jsFeedController];
  uint64_t v13 = [v11 uid];

  LOBYTE(v11) = [v12 executeBehaviorNamed:v10 forEntry:v13 withArguments:v9];
  return (char)v11;
}

- (id)dragItemForFeedEntry:(id)a3 name:(id)a4 arguments:(id)a5 imageResourceBlock:(id)a6
{
  id v6 = a5;
  objc_opt_class();
  id v7 = [v6 objectForKeyedSubscript:@"item"];

  id v8 = BUDynamicCast();

  objc_opt_class();
  id v9 = [v8 objectForKeyedSubscript:@"assetID"];
  id v10 = BUDynamicCast();

  objc_opt_class();
  id v11 = [v8 objectForKeyedSubscript:@"storeID"];
  unsigned int v12 = BUDynamicCast();

  if (![v12 length])
  {
    if ([v10 length])
    {
      long long v20 = (BSUIItemDescription *)[objc_alloc((Class)BCAssetDragInfo) initWithDragInfo:v8];
LABEL_7:
      double v16 = 0;
      goto LABEL_8;
    }
LABEL_6:
    long long v20 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  uint64_t v13 = [v8 objectForKeyedSubscript:@"isRestricted"];
  os_signpost_id_t v14 = BUDynamicCast();
  unsigned __int8 v15 = [v14 BOOLValue];

  if (v15) {
    goto LABEL_6;
  }
  double v16 = [[BSUIItemDescription alloc] initWithDragInfo:v8];
  objc_opt_class();
  double v17 = [v8 objectForKeyedSubscript:@"kind"];
  double v18 = BUDynamicCast();
  id v19 = [v18 integerValue];

  long long v20 = (BSUIItemDescription *)objc_alloc_init((Class)BCAssetDragInfo);
  long long v21 = [(BSUIItemDescription *)v16 title];
  [(BSUIItemDescription *)v20 setTitle:v21];

  id v22 = [(BSUIItemDescription *)v16 author];
  [(BSUIItemDescription *)v20 setAuthor:v22];

  id v23 = [(BSUIItemDescription *)v16 productURL];
  [(BSUIItemDescription *)v20 setStoreURL:v23];

  [(BSUIItemDescription *)v20 setAssetID:v10];
  [(BSUIItemDescription *)v20 setStoreID:v12];
  [(BSUIItemDescription *)v20 setContentType:v19];
  objc_opt_class();
  objc_super v24 = [v8 objectForKeyedSubscript:@"isSample"];
  v25 = BUDynamicCast();
  -[BSUIItemDescription setIsSample:](v20, "setIsSample:", [v25 BOOLValue]);

LABEL_8:
  id v26 = (int *)[(BSUIItemDescription *)v20 contentType];
  if ((unint64_t)v26 - 2 < 2) {
    goto LABEL_16;
  }
  if (v26 != &dword_4 && v26 != (int *)((char *)&dword_0 + 1))
  {
LABEL_14:
    BOOL v27 = 0;
    if (!v20) {
      goto LABEL_22;
    }
LABEL_17:
    id v28 = objc_alloc_init((Class)NSItemProvider);
    id v29 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v28];
    uint64_t v30 = v29;
    if (v16) {
      os_signpost_id_t v31 = v16;
    }
    else {
      os_signpost_id_t v31 = v20;
    }
    [v29 setLocalObject:v31];
    +[BCDragRepresentationFactory registerRepresentationsFromAssetDragInfo:v20 withProvider:v28 canDragToNewCanvas:v27];

    goto LABEL_23;
  }
  if ([v12 length])
  {
    if (![v10 length] || (-[BSUIItemDescription isSample](v20, "isSample") & 1) != 0) {
      goto LABEL_14;
    }
    __int16 v32 = BSUIGetLibraryItemStateProvider();
    uint64_t v33 = [v32 itemStateWithIdentifier:v10];

    BOOL v27 = [v33 library] != (char *)&dword_0 + 3;
    if (v20) {
      goto LABEL_17;
    }
  }
  else
  {
LABEL_16:
    BOOL v27 = 1;
    if (v20) {
      goto LABEL_17;
    }
  }
LABEL_22:
  uint64_t v30 = 0;
LABEL_23:

  return v30;
}

- (void)performDropWithSession:(id)a3 behavior:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(BSUIFeedViewController *)self im_ancestorViewControllerConformingToProtocol:&OBJC_PROTOCOL___BSUIFeedViewControllerDropHandler];
  id v8 = v7;
  if (v7) {
    [v7 performDropWithSession:v9 behavior:v6];
  }
}

- (BOOL)canHandleDropSession:(id)a3 behavior:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSUIFeedViewController *)self im_ancestorViewControllerConformingToProtocol:&OBJC_PROTOCOL___BSUIFeedViewControllerDropHandler];
  id v9 = v8;
  if (v8) {
    unsigned __int8 v10 = [v8 canHandleDropSession:v6 behavior:v7];
  }
  else {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)setTrackerName:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4AEC4;
  v9[3] = &unk_38EA28;
  objc_copyWeak(&v12, &location);
  id v5 = v4;
  id v10 = v5;
  id v11 = self;
  id v6 = objc_retainBlock(v9);
  if (v6)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v6[2])(v6);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_4B034;
      block[3] = &unk_38E0B8;
      id v8 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (JSValue)feed
{
  v2 = [(BSUIFeedViewController *)self jsFeedController];
  unsigned __int8 v3 = [v2 feed];

  return (JSValue *)v3;
}

- (void)renderSharableImageWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    os_signpost_id_t v14 = sub_49728;
    unsigned __int8 v15 = sub_49754;
    id v16 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_4B1CC;
    v10[3] = &unk_38FCC0;
    void v10[4] = self;
    v10[5] = &v11;
    id v8 = objc_retainBlock(v10);
    id v9 = (void *)v12[5];
    void v12[5] = (uint64_t)v8;

    (*(void (**)(void))(v12[5] + 16))();
    _Block_object_dispose(&v11, 8);
  }
}

- (id)metricsForFeedController:(id)a3
{
  id v4 = objc_opt_new();
  id v5 = [(BSUIFeedViewController *)self parentCardNavigationType];

  if (v5)
  {
    id v6 = [(BSUIFeedViewController *)self parentCardNavigationType];
    [v4 setObject:v6 forKey:@"navigationType"];
  }
  else if ([(BSUIFeedViewController *)self wasPresentingCards])
  {
    [v4 setObject:@"pop" forKey:@"navigationType"];
  }

  return v4;
}

- (id)newAnalyticsSessionAssertionForFeedController:(id)a3
{
  unsigned __int8 v3 = [(BSUIFeedViewController *)self effectiveAnalyticsTracker];
  id v4 = [v3 newSessionAssertion];

  return v4;
}

- (id)newAnalyticsSessionExtendingAssertionForFeedController:(id)a3
{
  unsigned __int8 v3 = [(BSUIFeedViewController *)self effectiveAnalyticsTracker];
  id v4 = [v3 newSessionExtendingAssertion];

  return v4;
}

- (void)coverAnimationHostUpdateItemVisibility:(BOOL)a3 refId:(id)a4 refInstance:(id)a5
{
  if (a3) {
    [(BSUIFeedViewController *)self _removeAlphaOverrideFromRefId:a4 refInstance:a5 animated:0 duration:0.0];
  }
  else {
    [(BSUIFeedViewController *)self _addAlphaOverrideToRefId:a4 refInstance:a5 alpha:0 animated:0.0 duration:0.0];
  }
}

- (void)_addAlphaOverrideToRefId:(id)a3 refInstance:(id)a4 alpha:(double)a5 animated:(BOOL)a6 duration:(double)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = [(BSUIFeedViewController *)self _overrideMatchingRefId:v12 refInstance:v13];
  if (!v14)
  {
    if (!self->_activeRenderOverrides)
    {
      double v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      activeRenderOverrides = self->_activeRenderOverrides;
      self->_activeRenderOverrides = v18;
    }
    id v16 = +[TUIRenderReferenceQuery queryWithUUID:0 uid:0 refId:v12 refInstance:v13];
    unsigned __int8 v15 = +[TUIRenderReferenceOverride overrideWithQuery:v16 alpha:a5];
    [(BSUIFeedViewController *)self addRenderOverride:v15 animated:v8 duration:a7];
    [(NSMutableSet *)self->_activeRenderOverrides addObject:v15];
    double v17 = BSUIFeedViewControllerLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      long long v20 = +[NSNumber numberWithDouble:a5];
      int v21 = 138412802;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v20;
      _os_log_debug_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "_addAlphaOverride: added - refId: %@, refInstance: %@, alpha: %@", (uint8_t *)&v21, 0x20u);
    }
    goto LABEL_8;
  }
  unsigned __int8 v15 = (void *)v14;
  id v16 = BSUIFeedViewControllerLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    double v17 = +[NSNumber numberWithDouble:a5];
    int v21 = 138412802;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v13;
    __int16 v25 = 2112;
    id v26 = v17;
    _os_log_debug_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "_addAlphaOverride: override exists - refId: %@, refInstance: %@, alpha: %@", (uint8_t *)&v21, 0x20u);
LABEL_8:
  }
}

- (void)_removeAlphaOverrideFromRefId:(id)a3 refInstance:(id)a4 animated:(BOOL)a5 duration:(double)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [(BSUIFeedViewController *)self _overrideMatchingRefId:v10 refInstance:v11];
  if (v12)
  {
    [(BSUIFeedViewController *)self removeRenderOverride:v12 animated:v7 duration:a6];
    [(NSMutableSet *)self->_activeRenderOverrides removeObject:v12];
    id v13 = BSUIFeedViewControllerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412802;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v12;
      _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "_removeAlphaOverride: removed - refId: %@, refInstance: %@, override: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    id v13 = BSUIFeedViewControllerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_2DD900();
    }
  }
}

- (id)_overrideMatchingRefId:(id)a3 refInstance:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = +[TUIRenderReferenceQuery queryWithUUID:0 uid:0 refId:v7 refInstance:v6];
  id v9 = [(BSUIFeedViewController *)self _overrideMatchingQuery:v8];
  unsigned int v10 = [v7 isEqualToString:@"currentBook"];

  if (v10 && !v9)
  {
    uint64_t v11 = +[TUIRenderReferenceQuery queryWithUUID:0 uid:0 refId:@"cover" refInstance:v6];

    id v9 = [(BSUIFeedViewController *)self _overrideMatchingQuery:v11];
    BOOL v8 = (void *)v11;
  }

  return v9;
}

- (id)_overrideMatchingQuery:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_4B33C;
  __int16 v16 = sub_4B34C;
  id v17 = 0;
  activeRenderOverrides = self->_activeRenderOverrides;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4BE30;
  v9[3] = &unk_38FCE8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(NSMutableSet *)activeRenderOverrides enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)feedControllerIsOnScreen:(id)a3
{
  if (![(BSUIFeedViewController *)self isViewLoaded]) {
    return 0;
  }
  id v4 = [(BSUIFeedViewController *)self view];
  id v5 = [v4 window];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)feedViewController:(id)val didTransitionToLayoutState:
{
  if (val)
  {
    objc_initWeak(&location, val);
    v1[0] = _NSConcreteStackBlock;
    v1[1] = 3221225472;
    v1[2] = sub_51A30;
    v1[3] = &unk_38E9F8;
    objc_copyWeak(&v2, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v1);
    objc_destroyWeak(&v2);
    objc_destroyWeak(&location);
  }
}

- (void)feedController:(id)a3 wantsToCreateNewFeedWithOptions:(id)a4 completion:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  id v10 = [v8 objectForKeyedSubscript:@"useSwiftUI"];
  uint64_t v11 = BUDynamicCast();
  unsigned int v12 = [v11 BOOLValue];

  if (v12)
  {
    objc_opt_class();
    id v13 = [v24 metrics];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"navigationType"];
    BUDynamicCast();
    id v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    __int16 v16 = [v8 objectForKeyedSubscript:@"shouldReportFigaro"];
    id v17 = BUDynamicCast();
    id v18 = [v17 BOOLValue];

    id v19 = [BSUINavigationContext alloc];
    id v20 = [(BSUIFeedViewController *)self bc_isPresentedInCardViewController];
    int v21 = [(BSUIFeedViewController *)self presentingViewController];
    id v22 = [(BSUINavigationContext *)v19 initWithIsInCard:v20 isInModal:v21 != 0];

    __int16 v23 = [(BSUIFeedViewController *)self ba_effectiveAnalyticsTracker];
    +[BSUIFeedViewController createSeriesViewControllerFromOptions:v8 withParentTracker:v23 navigationTypeValue:v15 navigationContext:v22 shouldReportFigaro:v18 completion:v9];
  }
  else
  {
    id v15 = (void (**)(void, void, void))objc_retainBlock(v9);
    if (!v15) {
      goto LABEL_6;
    }
    id v22 = [[BSUIFeedViewController alloc] initWithOptions:v8];
    ((void (**)(void, BSUIFeedViewController *, void))v15)[2](v15, v22, 0);
  }

LABEL_6:
}

- (void)feedController:(id)a3 wantsToUpdateNavBarBackgroundOpacity:(double)a4
{
}

- (void)feedController:(id)a3 wantsToUpdateContentWithData:(id)a4
{
  id v5 = [(BSUIFeedViewController *)self _createFeedContentFromDictionaries:a4 initialContentReadyEntryIndex:0x7FFFFFFFFFFFFFFFLL];
  [(BSUIFeedViewController *)self setContent:v5];
}

- (void)feedController:(id)a3 wantsToPushViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(BSUIFeedViewController *)self navigationController];
  [v8 pushViewController:v7 animated:v5];
}

- (void)feedController:(id)a3 wantsToReplaceCurrentViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a4;
  id v7 = [(BSUIFeedViewController *)self navigationController];
  id v8 = [v7 viewControllers];
  id v9 = [v8 mutableCopy];

  if ([v9 count]) {
    id v10 = (char *)[v9 count] - 1;
  }
  else {
    id v10 = 0;
  }
  [v9 replaceObjectAtIndex:v10 withObject:v12];
  uint64_t v11 = [(BSUIFeedViewController *)self navigationController];
  [v11 setViewControllers:v9 animated:v5];
}

- (void)feedController:(id)a3 wantsToPresentViewController:(id)a4 animated:(BOOL)a5 params:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = (BSUIFeedNavigationController *)v9;
  objc_opt_class();
  id v12 = [v10 objectForKeyedSubscript:@"noNavigationController"];
  id v13 = BUDynamicCast();
  unsigned __int8 v14 = [v13 BOOLValue];

  id v15 = v11;
  if ((v14 & 1) == 0)
  {
    id v15 = [[BSUIFeedNavigationController alloc] initWithOptions:v10];
    __int16 v23 = v11;
    __int16 v16 = +[NSArray arrayWithObjects:&v23 count:1];
    [(BSUINavigationController *)v15 setViewControllers:v16 animated:0];
  }
  id v17 = [v10 objectForKeyedSubscript:@"presentationStyle"];

  if (v17)
  {
    objc_opt_class();
    id v18 = [v10 objectForKeyedSubscript:@"presentationStyle"];
    id v19 = BUDynamicCast();
    -[BSUIFeedNavigationController setModalPresentationStyle:](v15, "setModalPresentationStyle:", [v19 integerValue]);
  }
  id v20 = [v10 objectForKeyedSubscript:@"transitionStyle"];

  if (v20)
  {
    objc_opt_class();
    int v21 = [v10 objectForKeyedSubscript:@"transitionStyle"];
    id v22 = BUDynamicCast();
    -[BSUIFeedNavigationController setModalTransitionStyle:](v15, "setModalTransitionStyle:", [v22 integerValue]);
  }
  [(BSUIFeedViewController *)self presentViewController:v15 animated:v7 completion:0];
}

- (void)feedController:(id)a3 wantsToSlideInFeedViewController:(id)a4
{
  id v5 = a4;
  [v5 bsui_setPrefersExtraCompactNavBarMargin:1];
  id v6 = [(BSUIFeedViewController *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (void)feedController:(id)a3 wantsToPresentViewControllerInPopover:(id)a4 withParams:(id)a5
{
}

- (void)feedController:(id)a3 wantsToPopViewController:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(BSUIFeedViewController *)self navigationController];
  id v9 = [v8 viewControllers];
  id v10 = [v9 count];

  if ((unint64_t)v10 < 2)
  {
    __int16 v16 = [(BSUIFeedViewController *)self cardStackViewController];

    if (v16)
    {
      id v17 = [(BSUIFeedViewController *)self cardStackViewController];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_4C9A8;
      v23[3] = &unk_38E738;
      id v24 = v7;
      [v17 popAllCardsAnimated:v5 completion:v23];

      id v15 = v24;
      goto LABEL_6;
    }
    id v18 = +[JSABridge sharedInstance];
    id v19 = v18;
    id v20 = &off_3A0CD8;
    id v21 = v7;
    uint64_t v22 = 1753;
LABEL_9:
    [v18 enqueueValueCall:v21 arguments:v20 file:@"BSUIFeedViewController.m" line:v22];

    goto LABEL_10;
  }
  uint64_t v11 = [(BSUIFeedViewController *)self navigationController];
  id v12 = [v11 popViewControllerAnimated:v5];

  if (!v5)
  {
    id v18 = +[JSABridge sharedInstance];
    id v19 = v18;
    id v20 = &off_3A0C90;
    id v21 = v7;
    uint64_t v22 = 1742;
    goto LABEL_9;
  }
  id v13 = [(BSUIFeedViewController *)self navigationController];
  unsigned __int8 v14 = [v13 transitionCoordinator];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_4C93C;
  v25[3] = &unk_38E0E0;
  id v26 = v7;
  [v14 animateAlongsideTransition:0 completion:v25];

  id v15 = v26;
LABEL_6:

LABEL_10:
}

- (void)feedController:(id)a3 wantsToPopToRootViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = dispatch_group_create();
  objc_opt_class();
  id v9 = [(BSUIFeedViewController *)self navigationController];
  id v10 = [v9 presentedViewController];
  uint64_t v11 = BUDynamicCast();

  BOOL v12 = v11 != 0;
  if (v11)
  {
    dispatch_group_enter(v8);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_4CC98;
    v26[3] = &unk_38E738;
    BOOL v27 = v8;
    [v11 popAllCardsAnimated:v5 prefersCrossfade:1 completion:v26];
  }
  id v13 = [(BSUIFeedViewController *)self navigationController];
  unsigned __int8 v14 = [v13 viewControllers];
  id v15 = [v14 count];

  if ((unint64_t)v15 >= 2)
  {
    __int16 v16 = [(BSUIFeedViewController *)self navigationController];
    id v17 = [v16 popToRootViewControllerAnimated:v5];

    if (v5)
    {
      dispatch_group_enter(v8);
      id v18 = [(BSUIFeedViewController *)self navigationController];
      id v19 = [v18 transitionCoordinator];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_4CCA0;
      v24[3] = &unk_38E0E0;
      __int16 v25 = v8;
      [v19 animateAlongsideTransition:0 completion:v24];
    }
    BOOL v12 = 1;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_4CCA8;
  v21[3] = &unk_38F610;
  id v22 = v7;
  BOOL v23 = v12;
  id v20 = v7;
  dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, v21);
}

- (void)feedController:(id)a3 wantsToDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4CE20;
  v8[3] = &unk_38E738;
  id v9 = a5;
  id v7 = v9;
  [(BSUIFeedViewController *)self dismissViewControllerAnimated:v5 completion:v8];
}

- (void)feedController:(id)a3 wantsToAppendCards:(id)a4 options:(id)a5
{
}

- (void)feedController:(id)a3 wantsToPresentCardsWithCardArray:(id)a4 focusedIndex:(unint64_t)a5 animated:(BOOL)a6 options:(id)a7 completion:(id)a8
{
  BOOL v9 = a6;
  id v13 = a8;
  id v14 = a7;
  id v15 = a4;
  [(BSUIFeedViewController *)self setWasPresentingCards:1];
  [(BSUIFeedViewController *)self presentFeedsInCards:v15 focusedIndex:a5 animated:v9 options:v14 completion:v13];
}

- (void)feedController:(id)a3 didLoadCardResource:(id)a4
{
  id v5 = a4;
  id v6 = [(BSUIFeedViewController *)self cardAuxiliaryNavigationBarManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4CFE4;
  v8[3] = &unk_38FD10;
  id v9 = v5;
  id v7 = v5;
  [v6 viewControllerWhenAvailable:v8];
}

- (void)feedController:(id)a3 collectAndFlush:(BOOL)a4 accumulatedImpressionsWithCompletion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(BSUIFeedViewController *)self impressionController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_4D0AC;
  v10[3] = &unk_38FD38;
  id v11 = v7;
  id v9 = v7;
  [v8 collectAndFlush:v5 accumulatedImpressionsWithCompletion:v10];
}

- (void)feedController:(id)a3 collectVisibleImpressionsWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(BSUIFeedViewController *)self impressionController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4D2F8;
  v8[3] = &unk_38FD38;
  id v9 = v5;
  id v7 = v5;
  [v6 collectVisibleImpressionsWithCompletion:v8];
}

- (void)resetImpressionsForFeedController:(id)a3
{
  id v3 = [(BSUIFeedViewController *)self impressionController];
  [v3 reset];
}

- (void)feedController:(id)a3 collectStatsWithCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_4D56C;
  v6[3] = &unk_38FD60;
  id v7 = a4;
  id v5 = v7;
  [(BSUIFeedViewController *)self collectStatsWithCompletion:v6];
}

- (void)feedController:(id)a3 dismissKeyboard:(id)a4
{
  id v4 = [(BSUIFeedViewController *)self view];
  [v4 endEditing:1];
}

- (void)feedController:(id)a3 scrollToItem:(id)a4 animated:(BOOL)a5 skipVoiceOverFocus:(BOOL)a6
{
  BOOL v36 = a6;
  BOOL v6 = a5;
  id v8 = a4;
  objc_opt_class();
  id v9 = [v8 objectForKeyedSubscript:@"refId"];
  id v10 = BUDynamicCast();

  objc_opt_class();
  id v11 = [v8 objectForKeyedSubscript:@"refInstance"];
  BOOL v12 = BUDynamicCast();

  objc_opt_class();
  id v13 = [v8 objectForKeyedSubscript:@"entryID"];
  id v14 = BUDynamicCast();

  objc_opt_class();
  id v15 = [v8 objectForKeyedSubscript:@"entryIndex"];
  __int16 v16 = BUDynamicCast();

  id v37 = self;
  if (v14)
  {
    objc_super v38 = v12;
    BOOL v34 = v6;
    v35 = v10;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v17 = [(BSUIFeedViewController *)self content];
    id v18 = [v17 entries];

    id v19 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v40;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(v18);
          }
          BOOL v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v24 = [v23 uid];
          unsigned int v25 = [v24 isEqualToString:v14];

          if (v25)
          {
            BOOL v12 = v38;
            id v10 = v35;
            [(BSUIFeedViewController *)v37 scrollToRefId:v35 refInstance:v38 onEntry:v23 animated:v34 skipVoiceOverFocus:v36];

            goto LABEL_17;
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    id v10 = v35;
    goto LABEL_16;
  }
  if (v16)
  {
    unint64_t v26 = (unint64_t)[v16 integerValue];
    if ((v26 & 0x8000000000000000) == 0)
    {
      unint64_t v27 = v26;
      [(BSUIFeedViewController *)self content];
      v28 = objc_super v38 = v12;
      id v29 = [v28 entries];
      id v30 = [v29 count];

      BOOL v12 = v38;
      if (v27 < (unint64_t)v30)
      {
        os_signpost_id_t v31 = [(BSUIFeedViewController *)self content];
        __int16 v32 = [v31 entries];
        uint64_t v33 = [v32 objectAtIndexedSubscript:v27];
        [(BSUIFeedViewController *)self scrollToRefId:v10 refInstance:v38 onEntry:v33 animated:v6 skipVoiceOverFocus:v36];

LABEL_16:
        BOOL v12 = v38;
      }
    }
  }
LABEL_17:
}

- (void)feedControllerWillHotReload:(id)a3
{
  id v4 = [(BSUIFeedViewController *)self navigationItem];
  id v3 = [v4 searchController];
  [v3 setActive:0];
}

- (void)feedController:(id)a3 requestToSetNavigationBarHidden:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = [(BSUIFeedViewController *)self navigationController];
  id v11 = [v8 navigationBar];

  id v9 = [(BSUIFeedViewController *)self navigationItem];
  if (![v11 state]
    && [v11 isHidden] != v6
    && ([v9 _isManualScrollEdgeAppearanceEnabled] & 1) == 0)
  {
    id v10 = [(BSUIFeedViewController *)self navigationController];
    [v10 setNavigationBarHidden:v6 animated:v5];
  }
}

- (void)feedController:(id)a3 requestToRenderSharableImage:(id)a4 completion:(id)a5
{
}

- (void)feedController:(id)a3 addAlphaOverrideToItem:(id)a4 alpha:(double)a5 animated:(BOOL)a6 duration:(double)a7
{
  BOOL v8 = a6;
  id v11 = a4;
  objc_opt_class();
  BOOL v12 = [v11 objectForKeyedSubscript:@"refId"];
  BUDynamicCast();
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  id v13 = [v11 objectForKeyedSubscript:@"refInstance"];

  id v14 = BUDynamicCast();

  if (v15) {
    [(BSUIFeedViewController *)self _addAlphaOverrideToRefId:v15 refInstance:v14 alpha:v8 animated:a5 duration:a7];
  }
}

- (void)feedController:(id)a3 removeAlphaOverrideFromItem:(id)a4 animated:(BOOL)a5 duration:(double)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  objc_opt_class();
  id v10 = [v9 objectForKeyedSubscript:@"refId"];
  BUDynamicCast();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  id v11 = [v9 objectForKeyedSubscript:@"refInstance"];

  BOOL v12 = BUDynamicCast();

  if (v13) {
    [(BSUIFeedViewController *)self _removeAlphaOverrideFromRefId:v13 refInstance:v12 animated:v7 duration:a6];
  }
}

- (void)feedController:(id)a3 addObserver:(id)a4 forTrigger:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    if ([v9 length])
    {
      id v11 = [(BSUIFeedViewController *)self triggerStateManager];

      if (v11)
      {
        feedTriggerObserver = self->_feedTriggerObserver;
        id v13 = [(BSUIFeedViewController *)self triggerStateManager];
        [(BSUIFeedTriggerBlockObserver *)feedTriggerObserver addObserver:v8 forTrigger:v10 inStateManager:v13];
      }
    }
  }
}

- (void)feedController:(id)a3 removeObserver:(id)a4 forTrigger:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    if ([v9 length])
    {
      id v11 = [(BSUIFeedViewController *)self triggerStateManager];

      if (v11)
      {
        feedTriggerObserver = self->_feedTriggerObserver;
        id v13 = [(BSUIFeedViewController *)self triggerStateManager];
        [(BSUIFeedTriggerBlockObserver *)feedTriggerObserver removeObserver:v8 forTrigger:v10 inStateManager:v13];
      }
    }
  }
}

- (void)feedController:(id)a3 wantsToPerformRawActionModel:(id)a4 shouldReportFigaro:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v9 = [(BSUIFeedViewController *)self jetActionHandlerInContext];
  id v8 = [(BSUIFeedViewController *)self ba_effectiveAnalyticsTracker];
  [v9 performRawActionModel:v7 withParentTracker:v8 shouldReportFigaro:v5 sourceViewController:self completion:&stru_38FDA0];
}

- (CGRect)getSourceRectFromOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  if (v4)
  {
    id v10 = [v4 objectForKeyedSubscript:@"popoverAnchorRefId"];

    if (v10)
    {
      objc_opt_class();
      id v11 = [v5 objectForKeyedSubscript:@"popoverAnchorRefId"];
      BOOL v12 = BUDynamicCast();

      objc_opt_class();
      id v13 = [v5 objectForKeyedSubscript:@"popoverAnchorRefInstance"];
      id v14 = BUDynamicCast();

      objc_opt_class();
      id v15 = [v5 objectForKeyedSubscript:@"popoverAnchorEntryID"];
      __int16 v16 = BUDynamicCast();

      if (v12 && v14 && v16)
      {
        [(BSUIFeedViewController *)self _frameOfElementWithEntryID:v16 refId:v12 refInstance:v14];
        CGFloat x = v17;
        CGFloat y = v18;
        CGFloat width = v19;
        CGFloat height = v20;
      }
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v21 = [v5 objectForKeyedSubscript:@"sourceRect"];

    if (v21)
    {
      objc_opt_class();
      id v22 = [v5 objectForKeyedSubscript:@"sourceRect"];
      BOOL v12 = BUDynamicCast();

      objc_opt_class();
      BOOL v23 = [v12 objectForKeyedSubscript:@"x"];
      id v14 = BUDynamicCast();

      objc_opt_class();
      id v24 = [v12 objectForKeyedSubscript:@"y"];
      __int16 v16 = BUDynamicCast();

      objc_opt_class();
      unsigned int v25 = [v12 objectForKeyedSubscript:@"width"];
      unint64_t v26 = BUDynamicCast();

      objc_opt_class();
      unint64_t v27 = [v12 objectForKeyedSubscript:@"height"];
      id v28 = BUDynamicCast();

      if (v14 && v16 && v26 && v28)
      {
        [v14 doubleValue];
        CGFloat x = v29;
        [v16 doubleValue];
        CGFloat y = v30;
        [v26 doubleValue];
        CGFloat width = v31;
        [v28 doubleValue];
        CGFloat height = v32;
      }

      goto LABEL_14;
    }
  }
LABEL_15:

  double v33 = x;
  double v34 = y;
  double v35 = width;
  double v36 = height;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

- (id)_getBarButtonItemFromOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:@"popoverAnchorRefId"],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_opt_class();
    id v7 = [v5 objectForKeyedSubscript:@"popoverAnchorRefId"];
    id v8 = BUDynamicCast();

    objc_opt_class();
    id v9 = [v5 objectForKeyedSubscript:@"popoverAnchorRefInstance"];
    id v10 = BUDynamicCast();

    objc_opt_class();
    id v11 = [v5 objectForKeyedSubscript:@"popoverAnchorEntryID"];
    BOOL v12 = BUDynamicCast();

    id v13 = 0;
    if (v8 && v10 && v12)
    {
      id v14 = +[TUIRenderReferenceQuery queryWithUUID:0 uid:v12 refId:v8 refInstance:v10];
      id v13 = [(BSUIFeedViewController *)self navigationBarItemMatchingQuery:v14];
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)getTintColorFromOptions:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 objectForKeyedSubscript:@"tintColor"];
  BOOL v5 = BUDynamicCast();

  if (v5)
  {
    objc_opt_class();
    BOOL v6 = [v3 objectForKeyedSubscript:@"tintColor"];
    id v7 = BUDynamicCast();

    objc_opt_class();
    id v8 = [v7 objectForKeyedSubscript:@"red"];
    id v9 = BUDynamicCast();

    objc_opt_class();
    id v10 = [v7 objectForKeyedSubscript:@"green"];
    id v11 = BUDynamicCast();

    objc_opt_class();
    BOOL v12 = [v7 objectForKeyedSubscript:@"blue"];
    id v13 = BUDynamicCast();

    objc_opt_class();
    id v14 = [v7 objectForKeyedSubscript:@"alpha"];
    id v15 = BUDynamicCast();

    __int16 v16 = 0;
    if (v9 && v11 && v13 && v15)
    {
      [v9 floatValue];
      double v18 = v17;
      [v11 floatValue];
      double v20 = v19;
      [v13 floatValue];
      double v22 = v21;
      [v15 floatValue];
      __int16 v16 = +[UIColor colorWithRed:v18 green:v20 blue:v22 alpha:v23];
    }
  }
  else
  {
    __int16 v16 = 0;
  }

  return v16;
}

- (void)showPopoverWithViewController:(id)a3 params:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (BSUINavigationController *)v6;
  objc_opt_class();
  id v9 = [v7 objectForKeyedSubscript:@"noNavigationController"];
  id v10 = BUDynamicCast();
  unsigned __int8 v11 = [v10 BOOLValue];

  BOOL v12 = v8;
  if ((v11 & 1) == 0)
  {
    BOOL v12 = [[BSUINavigationController alloc] initWithOptions:v7];
    long long v42 = v8;
    id v13 = +[NSArray arrayWithObjects:&v42 count:1];
    [(BSUINavigationController *)v12 setViewControllers:v13 animated:0];
  }
  id v14 = [(BSUIFeedViewController *)self currentPopOverViewController];

  if (v14)
  {
    id v15 = [(BSUIFeedViewController *)self currentPopOverViewController];
    [v15 dismissViewControllerAnimated:1 completion:0];
  }
  __int16 v16 = [(BSUIFeedViewController *)self view];
  if (v7)
  {
    float v17 = [v7 objectForKeyedSubscript:@"arrowDirection"];

    if (v17)
    {
      double v18 = [v7 objectForKeyedSubscript:@"arrowDirection"];
      id v19 = [v18 integerValue];
    }
    else
    {
      id v19 = &dword_0 + 1;
    }
    uint64_t v20 = [v7 objectForKeyedSubscript:@"width"];
    if (v20)
    {
      float v21 = (void *)v20;
      double v22 = [v7 objectForKeyedSubscript:@"height"];

      if (v22)
      {
        objc_opt_class();
        long long v41 = [v7 objectForKeyedSubscript:@"width"];
        float v23 = BUDynamicCast();
        [v23 floatValue];
        double v25 = v24;
        objc_opt_class();
        [v7 objectForKeyedSubscript:@"height"];
        unint64_t v26 = v16;
        id v27 = v19;
        double v29 = v28 = v8;
        double v30 = BUDynamicCast();
        [v30 floatValue];
        -[BSUINavigationController setPreferredContentSize:](v12, "setPreferredContentSize:", v25, v31);

        id v8 = v28;
        id v19 = v27;
        __int16 v16 = v26;
      }
    }
  }
  else
  {
    id v19 = &dword_0 + 1;
  }
  double v32 = [v7 objectForKeyedSubscript:@"presentationStyle"];

  if (v32)
  {
    objc_opt_class();
    double v33 = [v7 objectForKeyedSubscript:@"presentationStyle"];
    double v34 = BUDynamicCast();
    -[BSUINavigationController setModalPresentationStyle:](v12, "setModalPresentationStyle:", [v34 integerValue]);
  }
  else
  {
    double v33 = [(BSUIFeedViewController *)self traitCollection];
    if ([v33 horizontalSizeClass] == (char *)&dword_0 + 1) {
      uint64_t v35 = 2;
    }
    else {
      uint64_t v35 = 7;
    }
    [(BSUINavigationController *)v12 setModalPresentationStyle:v35];
  }

  [(BSUIFeedViewController *)self presentViewController:v12 animated:1 completion:0];
  double v36 = [(BSUINavigationController *)v12 popoverPresentationController];
  [v36 setPermittedArrowDirections:v19];
  id v37 = +[UIColor bc_booksBackground];
  [v36 setBackgroundColor:v37];

  [v36 setSourceView:v16];
  objc_super v38 = [(BSUIFeedViewController *)self traitCollection];
  long long v39 = (char *)[v38 horizontalSizeClass];

  if (v39 == (unsigned char *)&dword_0 + 2)
  {
    long long v40 = [(BSUIFeedViewController *)self _getBarButtonItemFromOptions:v7];
    if (v40)
    {
      [v36 setBarButtonItem:v40];
    }
    else
    {
      [(BSUIFeedViewController *)self getSourceRectFromOptions:v7];
      [v36 setSourceRect:];
    }
  }
  [(BSUIFeedViewController *)self setCurrentPopOverViewController:v12];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  BOOL v5 = [(BSUIFeedViewController *)self alertController];
  [v5 dismiss];

  [(BSUIFeedViewController *)self setAlertController:0];
  id v6 = [(BSUIFeedViewController *)self currentPopOverViewController];
  [v6 dismissViewControllerAnimated:0 completion:0];

  [(BSUIFeedViewController *)self setCurrentPopOverViewController:0];
  uint64_t v7 = [(BSUIFeedViewController *)self messageViewControllerProvider];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [(BSUIFeedViewController *)self messageViewControllerProvider];
    id v10 = [v9 viewController];

    if (v10)
    {
      unsigned __int8 v11 = [(BSUIFeedViewController *)self messageViewControllerProvider];
      BOOL v12 = [v11 viewController];
      id v13 = [v12 view];
      id v14 = [(BSUIFeedViewController *)self view];
      [v14 bounds];
      [v13 sizeThatFits:v15, v16];
    }
  }
}

- (BOOL)shouldNotifyScrollViewReachedTheBottom
{
  [(BSUIFeedViewController *)self viewSizeWhenNotifiedBottomReached];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(BSUIFeedViewController *)self scrollView];
  [v7 bounds];
  BOOL v10 = v6 == v9 && v4 == v8;

  if (v10 && [(BSUIFeedViewController *)self alreadyNotifiedBottomReached]) {
    return 0;
  }
  BOOL v12 = [(BSUIFeedViewController *)self scrollView];
  [v12 contentOffset];
  double v14 = v13;
  double v15 = [(BSUIFeedViewController *)self scrollView];
  [v15 bounds];
  double v17 = v14 + v16 + 50.0;
  double v18 = [(BSUIFeedViewController *)self scrollView];
  [v18 contentSize];
  double v20 = v19;

  BOOL v11 = v17 > v20;
  char v21 = v17 <= v20 || v10;
  if ((v21 & 1) == 0)
  {
    double v22 = [(BSUIFeedViewController *)self scrollView];
    [v22 bounds];
    -[BSUIFeedViewController setViewSizeWhenNotifiedBottomReached:](self, "setViewSizeWhenNotifiedBottomReached:", v23, v24);
  }
  return v11;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v5 scrollViewDidScroll:a3];
  if ([(BSUIFeedViewController *)self shouldNotifyScrollViewReachedTheBottom])
  {
    double v4 = [(BSUIFeedViewController *)self jsFeedController];
    [v4 notifyScrollViewReachedTheBottom];

    [(BSUIFeedViewController *)self setAlreadyNotifiedBottomReached:1];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (a4.y < -3.5)
  {
    double v6 = [(BSUIFeedViewController *)self navigationController];
    unsigned int v7 = [v6 isNavigationBarHidden];

    if (v7)
    {
      id v8 = [(BSUIFeedViewController *)self navigationController];
      [v8 bc_updateNavBarVisibleWithTransitionCoordinator:0 duration:0.0];
    }
  }
}

- (id)coverAnimationHostSourceForUUID:(id)a3 uid:(id)a4 refId:(id)a5 refInstance:(id)a6
{
  id v10 = a6;
  BOOL v11 = +[TUIRenderReferenceQuery queryWithUUID:a3 uid:a4 refId:a5 refInstance:v10];
  uint64_t v12 = +[BSUICoverAnimatingSource renderReferenceMatchingQuery:v11 inFeedViewController:self];
  if (v12)
  {
    double v13 = (void *)v12;
LABEL_5:
    double v16 = [v13 UUID];
    double v17 = [v13 uid];
    double v18 = [v13 refId];
    double v19 = [v13 refInstance];
    double v14 = +[TUIRenderReferenceQuery queryWithUUID:v16 uid:v17 refId:v18 refInstance:v19];

    double v20 = [v13 UUID];
    char v21 = [v13 uid];
    double v22 = [v13 refInstance];
    double v23 = +[TUIRenderReferenceQuery queryWithUUID:v20 uid:v21 refId:@"audiobook-control" refInstance:v22];

    goto LABEL_6;
  }
  double v14 = +[TUIRenderReferenceQuery queryWithUUID:0 uid:0 refId:@"cover" refInstance:v10];

  uint64_t v15 = +[BSUICoverAnimatingSource renderReferenceMatchingQuery:v14 inFeedViewController:self];
  if (v15)
  {
    double v13 = (void *)v15;
    BOOL v11 = v14;
    goto LABEL_5;
  }
  double v13 = [v14 UUID];
  double v20 = [v14 uid];
  double v23 = +[TUIRenderReferenceQuery queryWithUUID:v13 uid:v20 refId:@"audiobook-control" refInstance:v10];
LABEL_6:

  double v24 = [[BSUICoverAnimatingSource alloc] initWithFeedViewController:self query:v14 audioBookControlQuery:v23];

  return v24;
}

- (id)coverAnimationHostSourceForItem:(id)a3
{
  return 0;
}

- (BOOL)coverAnimationHostIsFullyVisible:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BSUIFeedViewController *)self view];
  [v4 coverAnimationSourceFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [v4 coverAnimationSourceReferenceView];

  [v5 convertRect:v14 fromView:v7];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = [(BSUIFeedViewController *)self view];
  double v24 = [v23 safeAreaLayoutGuide];
  [v24 layoutFrame];
  v34.origin.CGFloat x = v16;
  v34.origin.CGFloat y = v18;
  v34.size.double width = v20;
  v34.size.double height = v22;
  CGRect v32 = CGRectIntersection(v31, v34);
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  double width = v32.size.width;
  double height = v32.size.height;

  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.double width = width;
  v33.size.double height = height;
  if (CGRectIsEmpty(v33)) {
    return 0;
  }
  BOOL v30 = vabdd_f64(width, v20) < 0.01;
  return vabdd_f64(height, v22) < 0.01 && v30;
}

- (void)coverAnimationHostScrollToMakeVisible:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  id v4 = BUDynamicCast();
  objc_super v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 query];
    if (v6)
    {
      double v7 = (void *)v6;
      [v5 coverAnimationSourceFrame];
      v13.origin.CGFloat x = CGRectZero.origin.x;
      v13.origin.CGFloat y = CGRectZero.origin.y;
      v13.size.double width = CGRectZero.size.width;
      v13.size.double height = CGRectZero.size.height;
      BOOL v8 = CGRectEqualToRect(v12, v13);

      if (!v8)
      {
        double v9 = [v5 query];
        [(BSUIFeedViewController *)self scrollToItemsMatchingQuery:v9 atScrollPosition:18 animated:0 skipVoiceOverFocus:0];

        [v10 coverAnimationSourceInvalidateFrame];
      }
    }
  }
}

- (BOOL)coverAnimationHostWantsScrollOnClose
{
  return 0;
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v11 viewDidLayoutSubviews];
  if ([(BSUIFeedViewController *)self modalPresentationStyle] == (char *)&dword_4 + 3
    && !self->_popoverArrowBackgroundView)
  {
    double v3 = [(BSUIFeedViewController *)self view];
    [v3 safeAreaInsets];
    double v5 = v4;

    if (v5 > 0.0)
    {
      uint64_t v6 = [(BSUIFeedViewController *)self view];
      id v7 = objc_alloc((Class)UIView);
      [v6 frame];
      BOOL v8 = [v7 initWithFrame:0.0, 0.0];
      popoverArrowBackgroundView = self->_popoverArrowBackgroundView;
      self->_popoverArrowBackgroundView = v8;

      id v10 = +[UIColor bc_booksBackground];
      [(UIView *)self->_popoverArrowBackgroundView setBackgroundColor:v10];

      [v6 addSubview:self->_popoverArrowBackgroundView];
    }
  }
}

- (void)coverAnimationHostPrepareWithCompletion:(id)a3
{
  id v3 = [(BSUIFeedViewController *)self waitForVisibleImageResourcesToLoadAssertionWithTimeout:a3 completion:0.2];
}

- (unint64_t)coverEffectsContent
{
  return 0;
}

- (BOOL)coverEffectsNightMode
{
  id v2 = [(BSUIFeedViewController *)self traitCollection];
  BOOL v3 = [v2 userInterfaceStyle] == (char *)&dword_0 + 2;

  return v3;
}

- (id)coverEffectRTLOverride
{
  return 0;
}

- (id)_coverSourceQueryForRepresentedObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  double v4 = BUDynamicCast();

  double v5 = [v4 objectForKeyedSubscript:@"id"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"instanceId"];
  id v7 = (void *)v6;
  if (v6) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    double v9 = v5;
  }
  else {
    double v9 = (void *)v6;
  }
  id v10 = v9;
  uint64_t v11 = [v4 objectForKeyedSubscript:@"entryID"];
  CGRect v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    double v14 = 0;
  }
  else
  {
    objc_opt_class();
    double v15 = [v4 objectForKeyedSubscript:@"columnIndex"];
    CGFloat v16 = BUDynamicCast();

    if (!v16 || ((unint64_t)[v16 integerValue] & 0x8000000000000000) != 0)
    {
      double v17 = @"cover";
    }
    else
    {
      double v17 = [v16 stringValue];
    }
    double v14 = +[TUIRenderReferenceQuery queryWithUUID:0 uid:v12 refId:v17 refInstance:v10];
  }

  return v14;
}

- (id)coverSourceForRepresentedObject:(id)a3
{
  id v4 = a3;
  double v5 = [(BSUIFeedViewController *)self _coverSourceQueryForRepresentedObject:v4];
  if (v5)
  {
    if (+[BSUICardStackTransitioningCoverSource isValidSourceWithFeedViewController:self query:v5])
    {
      objc_opt_class();
      uint64_t v6 = BUDynamicCast();
      id v7 = [v6 objectForKeyedSubscript:@"isInNonHorizontalLayout"];
      id v8 = [v7 BOOLValue];

      double v9 = [[BSUICardStackTransitioningCoverSource alloc] initWithFeedViewController:self query:v5 isInNonHorizontalLayout:v8];
      goto LABEL_8;
    }
    id v10 = BCCardModelLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2DD9F4(v10);
    }
  }
  double v9 = 0;
LABEL_8:

  return v9;
}

- (unint64_t)visibilityOfCoverSource:(id)a3 ignoringYAxis:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = [(BSUIFeedViewController *)self view];
  [v6 cardStackTransitioningCoverSourceFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  CGFloat v16 = [v6 cardStackTransitioningCoverSourceReferenceView];

  [v7 convertRect:v16 fromView:v9];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = [(BSUIFeedViewController *)self view];
  [v25 bounds];
  v35.origin.CGFloat x = v18;
  v35.origin.CGFloat y = v20;
  v35.size.double width = v22;
  v35.size.double height = v24;
  CGRect v33 = CGRectIntersection(v32, v35);
  CGFloat x = v33.origin.x;
  CGFloat y = v33.origin.y;
  double width = v33.size.width;
  double height = v33.size.height;

  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.double width = width;
  v34.size.double height = height;
  if (CGRectIsEmpty(v34)) {
    return 2;
  }
  unsigned int v31 = (vabdd_f64(height, v24) >= 0.01) & ~v4;
  if (vabdd_f64(width, v22) >= 0.01) {
    return 1;
  }
  else {
    return v31;
  }
}

- (void)revealCoverForRepresentedObject:(id)a3
{
  uint64_t v4 = [(BSUIFeedViewController *)self _coverSourceQueryForRepresentedObject:a3];
  if (v4) {
    [(BSUIFeedViewController *)self scrollToItemsMatchingQuery:v4 atScrollPosition:0 animated:0 skipVoiceOverFocus:0];
  }

  _objc_release_x1();
}

- (void)updateFeedContentSynchronously
{
}

- (void)updateFeedContentWithCompletion:(id)a3
{
}

- (BCCardStackTransitioningCoverSource)cardStackTransitioningCardContentCoverSource
{
  objc_opt_class();
  id v3 = [(BSUIFeedViewController *)self feedController];
  uint64_t v4 = [v3 options];
  double v5 = BUDynamicCast();

  id v6 = [v5 objectForKeyedSubscript:@"id"];
  objc_opt_class();
  id v7 = [v5 objectForKeyedSubscript:@"isInNonHorizontalLayout"];
  double v8 = BUDynamicCast();
  id v9 = [v8 BOOLValue];

  if (v6)
  {
    double v10 = [(BSUIFeedViewController *)self content];
    double v11 = [v10 entries];
    double v12 = [v11 firstObject];

    double v13 = [v12 uuid];
    double v14 = +[TUIRenderReferenceQuery queryWithUUID:v13 uid:0 refId:@"cover" refInstance:v6];
    double v15 = [[BSUICardStackTransitioningCoverSource alloc] initWithFeedViewController:self query:v14 isInNonHorizontalLayout:v9];
  }
  else
  {
    double v15 = 0;
  }

  return (BCCardStackTransitioningCoverSource *)v15;
}

- (void)cardStackTransitioningCardContentFinalizePreparationForOpen
{
  if (!self->_openFinalized) {
    [(BSUIFeedViewController *)self pauseUpdates];
  }
}

- (void)cardStackTransitioningCardContentPrepareForOpenWithViewController:(id)a3 viewSize:(CGSize)a4 index:(unint64_t)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v13 = a3;
  double v12 = +[NSNumber numberWithUnsignedInteger:a5];
  [(BSUIFeedViewController *)self setPerformanceIdentifier:v12];

  -[BSUIFeedViewController _prepareForOpenWithViewController:viewSize:overrideTraitsBlock:numEntries:completion:](self, "_prepareForOpenWithViewController:viewSize:overrideTraitsBlock:numEntries:completion:", v13, 0, 1, v11, width, height);
}

- (void)_prepareForOpenWithViewController:(id)a3 viewSize:(CGSize)a4 overrideTraitsBlock:(id)a5 numEntries:(int64_t)a6 completion:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  objc_initWeak(&location, self);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_501B4;
  v33[3] = &unk_38FE18;
  objc_copyWeak(v37, &location);
  id v16 = v13;
  id v34 = v16;
  id v17 = v14;
  id v35 = v17;
  v37[1] = *(id *)&width;
  v37[2] = *(id *)&height;
  v37[3] = (id)a6;
  id v18 = v15;
  id v36 = v18;
  uint64_t v29 = 0;
  BOOL v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  double v24 = sub_50498;
  double v25 = &unk_38FE40;
  id v28 = &v29;
  unint64_t v26 = self;
  double v19 = objc_retainBlock(v33);
  id v27 = v19;
  CGFloat v20 = v23;
  os_unfair_lock_lock(&self->_stateLock);
  v24((uint64_t)v20);
  os_unfair_lock_unlock(&self->_stateLock);

  uint64_t v21 = v30[3];
  if (!v21)
  {
    [(BSUIFeedViewController *)self loadEntries];
    uint64_t v21 = v30[3];
  }
  if (v21 == 2)
  {
    double v22 = [(BSUIFeedViewController *)self content];
    ((void (*)(void *, void *))v19[2])(v19, v22);
  }
  _Block_object_dispose(&v29, 8);

  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
}

- (void)cardStackTransitioningCardContentFinalizeForOpen
{
  [(BSUIFeedViewController *)self resumeUpdates];
  [(BSUIFeedViewController *)self layoutIfNeeded];
  self->_openFinalized = 1;

  [(BSUIFeedViewController *)self setPerformanceIdentifier:0];
}

- (void)cardStackTransitioningCardContentPrepareForDismiss
{
}

- (id)cardStackTransitionSuspendUpdatesAssertion
{
  return [(BSUIFeedViewController *)self suspendUpdates];
}

- (void)cardStackTransitionSuspendUpdatesUntilEndOfTransaction
{
}

- (id)artworkSourceInEntryWithIndex:(unint64_t)a3 refId:(id)a4 refInstance:(id)a5 isCover:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  double v12 = [(BSUIFeedViewController *)self content];
  id v13 = [v12 entries];

  if ((unint64_t)[v13 count] <= a3)
  {
    id v17 = 0;
  }
  else
  {
    id v14 = [v13 objectAtIndexedSubscript:a3];
    id v15 = [v14 uuid];
    id v16 = +[TUIRenderReferenceQuery queryWithUUID:v15 uid:0 refId:v10 refInstance:v11];
    id v17 = 0;
    if (+[BSUISheetTransitioningArtworkSource isValidSourceWithFeedViewController:self query:v16])
    {
      id v17 = [[BSUISheetTransitioningArtworkSource alloc] initWithFeedViewController:self query:v16 isCover:v6];
    }
  }

  return v17;
}

- (unint64_t)visibilityOfArtworkSource:(id)a3
{
  id v4 = a3;
  double v5 = [(BSUIFeedViewController *)self view];
  [v4 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [v4 referenceView];

  [v5 convertRect:v14 fromView:v7];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = [(BSUIFeedViewController *)self view];
  [v23 bounds];
  v33.origin.CGFloat x = v16;
  v33.origin.CGFloat y = v18;
  v33.size.double width = v20;
  v33.size.double height = v22;
  CGRect v31 = CGRectIntersection(v30, v33);
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  double width = v31.size.width;
  double height = v31.size.height;

  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.double width = width;
  v32.size.double height = height;
  if (CGRectIsEmpty(v32)) {
    return 2;
  }
  BOOL v29 = vabdd_f64(width, v20) >= 0.01;
  return vabdd_f64(height, v22) >= 0.01 || v29;
}

- (id)sheetTransitioningCardContentArtworkSourceInEntryWithIndex:(unint64_t)a3
{
  return [(BSUIFeedViewController *)self artworkSourceInEntryWithIndex:a3 refId:@"cover" refInstance:0 isCover:1];
}

- (void)sheetTransitioningCardContentPrepareForOpenWithViewController:(id)a3 viewSize:(CGSize)a4 overrideTraitsBlock:(id)a5 numEntries:(int64_t)a6 completion:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  id v14 = a5;
  id v15 = a3;
  [(BSUIFeedViewController *)self setPerformanceIdentifier:&off_3A0B90];
  self->_openFinalized = 0;
  -[BSUIFeedViewController _prepareForOpenWithViewController:viewSize:overrideTraitsBlock:numEntries:completion:](self, "_prepareForOpenWithViewController:viewSize:overrideTraitsBlock:numEntries:completion:", v15, v14, a6, v13, width, height);
}

- (void)preloadAugmentedExperienceContentWithViewController:(id)a3 numEntries:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [(BSUIFeedViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;

  id v15 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v42.double width = v12;
    v42.double height = v14;
    CGFloat v16 = NSStringFromCGSize(v42);
    *(_DWORD *)buf = 138413058;
    id v35 = self;
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2112;
    long long v39 = v16;
    __int16 v40 = 2048;
    int64_t v41 = a4;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "%@: preloadAugmentedExperienceContent _prepareForOpen (vc: %@, viewSize: %@, numEntries: %ld)", buf, 0x2Au);
  }
  double v17 = BCAugmentedExperienceSignpost();
  os_signpost_id_t v18 = os_signpost_id_generate(v17);

  double v19 = BCAugmentedExperienceSignpost();
  double v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "BSUIFeedVC.AugExp.preload", "", buf, 2u);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_50C3C;
  v31[3] = &unk_38FE68;
  os_signpost_id_t v33 = v18;
  id v21 = v9;
  id v32 = v21;
  double v22 = objc_retainBlock(v31);
  double v23 = BCAugmentedExperienceSignpost();
  double v24 = (char *)os_signpost_id_generate(v23);

  double v25 = BCAugmentedExperienceSignpost();
  unint64_t v26 = v25;
  if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v26, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v24, "BSUIFeedVC.AugExp.prepareForOpen", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_50D68;
  v28[3] = &unk_38FEB8;
  objc_copyWeak(v30, (id *)buf);
  v30[1] = v24;
  v28[4] = self;
  id v27 = v22;
  id v29 = v27;
  -[BSUIFeedViewController _prepareForOpenWithViewController:viewSize:overrideTraitsBlock:numEntries:completion:](self, "_prepareForOpenWithViewController:viewSize:overrideTraitsBlock:numEntries:completion:", v8, 0, a4, v28, v12, v14);

  objc_destroyWeak(v30);
  objc_destroyWeak((id *)buf);
}

- (id)accessibilityCardContentSummary
{
  id v2 = [(BSUIFeedViewController *)self jsFeedController];
  id v3 = [v2 metadata];
  id v4 = [v3 accessibilitySummary];

  return v4;
}

- (BOOL)shouldOnlyAllowDismiss
{
  id v2 = [(BSUIFeedViewController *)self contentUnavailableConfiguration];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)prefersAdditionalSafeAreaInsetsForInsetting
{
  return 0;
}

- (void)auxiliaryNavigationBarViewControllerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  double v5 = [(BSUIFeedViewController *)self cardAuxiliaryNavigationBarManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_51390;
  v7[3] = &unk_38FF08;
  id v8 = v4;
  id v6 = v4;
  [v5 createViewControllerForFeedViewController:self shouldReportFigaro:1 completionHandler:v7];
}

- (void)suspendAndTeardownForReason:(id)a3
{
  id v4 = a3;
  double v5 = [(BSUIFeedViewController *)self cardAuxiliaryNavigationBarManager];
  id v6 = [v5 viewControllerIfAvailable];
  [v6 suspendAndTeardown];

  v7.receiver = self;
  v7.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v7 suspendAndTeardownForReason:v4];
}

- (id)resumeAndRebuildForReason:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BSUIFeedViewController;
  id v4 = [(BSUIFeedViewController *)&v9 resumeAndRebuildForReason:a3];
  double v5 = [(BSUIFeedViewController *)self cardAuxiliaryNavigationBarManager];
  id v6 = [v5 viewControllerIfAvailable];
  objc_super v7 = [(BSUIFeedViewController *)self triggerStateManager];
  [v6 resumeAndRebuildWithTriggerStateManager:v7];

  return v4;
}

- (void)_customizePresentationUsingViewController:(id)a3 environment:(id)a4
{
  id v21 = (BSUIFeedViewController *)a3;
  id v6 = a4;
  if (v21 == self)
  {
    id v8 = [(BSUIFeedViewController *)v21 traitCollection];
    unsigned int v7 = [v8 bc_userInterfaceStyleDark];
  }
  else
  {
    unsigned int v7 = [v6 style] == (char *)&dword_0 + 2;
  }
  objc_super v9 = [(BSUIFeedViewController *)self jsFeedController];
  double v10 = [v9 metadata];
  double v11 = [v10 dayBackgroundColor];

  double v12 = [(BSUIFeedViewController *)self jsFeedController];
  double v13 = [v12 metadata];
  double v14 = [v13 nightBackgroundColor];

  if (v11 && v14)
  {
    if (v7) {
      id v15 = v14;
    }
    else {
      id v15 = v11;
    }
    [(BSUIFeedViewController *)self _updateViewWithBackgroundColor:v15];
  }
  else
  {
    CGFloat v16 = +[UIColor bc_booksBackground];
    [(BSUIFeedViewController *)self _updateViewWithBackgroundColor:v16];
  }
  double v17 = +[UIColor whiteColor];
  os_signpost_id_t v18 = +[UIColor colorWithRed:0.1804 green:0.1804 blue:0.1804 alpha:1.0];
  double v19 = +[UIColor bc_dynamicColorWithLightColor:v17 darkColor:v18];
  double v20 = +[TUIDragController sharedInstance];
  [v20 setDragBackgroundColor:v19];
}

- (void)feedViewController:(id)a3 customizeEnvironment:(id)a4
{
}

- (UIEdgeInsets)feedViewController:(id)a3 contentInsetsForScrollingToRectWithContentInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  objc_super v9 = [(BSUIFeedViewController *)self cardContentScrollManager];

  if (v9)
  {
    double v10 = [(BSUIFeedViewController *)self cardContentScrollManager];
    [v10 cardContentViewController:self contentInsetsForScrollingToRectWithContentInsets:top, left, bottom, right];
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

- (void)feedViewController:(id)a3 willTransitionToLayoutState:(unint64_t)a4
{
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_518D8;
  block[3] = &unk_38FF30;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)feedViewControllerInitialContentReady:(id)a3
{
  kdebug_trace();
  id v4 = BSUIFeedViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "feedViewControllerInitialContentReady: Sending BSUIFeedInitialContentReadyNotification", buf, 2u);
  }

  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"BSUIFeedInitialContentReadyNotification" object:0];

  id v6 = [(BSUIFeedViewController *)self feedController];
  [v6 notifyInitialContentReady];

  if ([(BSUIFeedViewController *)self deferUIUpdateUntilInitialContentReady])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_51CF0;
    block[3] = &unk_38E738;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_51DB0;
    v7[3] = &unk_38E738;
    void v7[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (void)feedViewControllerAllContentReady:(id)a3
{
  id v3 = [(BSUIFeedViewController *)self feedController];
  [v3 allContentReady];
}

- (unint64_t)statsModeForFeedViewController:(id)a3
{
  return 4;
}

- (void)hideLoadingViewForFeedController:(id)a3
{
  if (self)
  {
    self->_showLoadingView = 0;
    [(BSUIFeedViewController *)self setNeedsUpdateContentUnavailableConfiguration];
  }
}

- (BOOL)feedViewControllerIsConsideredVisible:(id)a3
{
  if (![(BSUIFeedViewController *)self bc_analyticsVisibility]) {
    return 0;
  }
  id v4 = [(BSUIFeedViewController *)self viewIfLoaded];
  double v5 = [v4 window];
  id v6 = [v5 windowScene];
  BOOL v7 = [v6 activationState] == 0;

  return v7;
}

- (void)didEndDragSession:(id)a3 dropOperation:(unint64_t)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BSUIFeedViewController;
  unint64_t v19 = a4;
  [(BSUIFeedViewController *)&v24 didEndDragSession:v6 dropOperation:a4];
  BOOL v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [v6 items];
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v12);
        objc_opt_class();
        double v14 = [v13 localObject];
        double v15 = BUDynamicCast();

        double v16 = [v15 storeID];
        if ([v16 length]) {
          [v7 addObject:v16];
        }

        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v10);
  }

  if (v19 - 1 > 2) {
    CFStringRef v17 = @"cancel";
  }
  else {
    CFStringRef v17 = off_390050[v19 - 1];
  }
  double v18 = objc_opt_new();
  [v18 setObject:JSARecordEventTypeDragAndDrop forKeyedSubscript:JSARecordKeyEventType];
  [v18 setObject:v17 forKeyedSubscript:JSARecordKeyResult];
  [v18 setObject:v7 forKeyedSubscript:JSARecordKeyItems];
  +[JSAApplication recordNativeEvent:v18];
}

- (void)hostingController:(id)a3 didChangeContentIdentifiers:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  id v6 = [(BSUIFeedViewController *)self navigationController];
  BOOL v7 = BUDynamicCast();

  if (!v7 || [v7 isCurrentCard])
  {
    id v8 = +[NSMutableSet set];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v5;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          double v15 = [v14 type];
          unsigned int v16 = [v15 isEqualToString:@"message"];

          if (v16)
          {
            CFStringRef v17 = [v14 identifier];
            [v8 addObject:v17];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    [v18 _scheduleUpdateEngagementMessagesToDisplay:v8];
    id v5 = v19;
  }
}

- (void)removeProviderForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BSUIFeedViewController *)self hostingController];
  [v5 removeProviderForIdentifier:v4];
}

- (void)hostedMessageViewDidTriggerAction:(id)a3
{
  id v4 = a3;
  id v5 = [(BSUIFeedViewController *)self feedController];
  [v5 notifyOnMessageActionTriggered:v4];
}

- (void)hostedMessageViewDidBecomeVisible:(id)a3
{
  id v5 = a3;
  if ([(BSUIFeedViewController *)self isInCard])
  {
    id v4 = [(BSUIFeedViewController *)self cardStackViewController];
    [v4 viewController:self didDisplayMessageWithId:v5];
  }
}

- (void)setupAMSEngagementObservers
{
  id v3 = objc_alloc((Class)AMSEngagement);
  id v5 = +[BUBag defaultBag];
  id v4 = [v3 initWithBag:v5];
  [(BSUIFeedViewController *)self setAmsEngagement:v4];
}

- (void)addEngagementObserver:(id)a3
{
  id v4 = a3;
  id v6 = [(BSUIFeedViewController *)self amsEngagement];
  id v5 = [v4 identifier];

  [v6 addObserver:self placement:v5 serviceType:@"books"];
}

- (void)removeEngagementObserver:(id)a3
{
  id v4 = a3;
  id v6 = [(BSUIFeedViewController *)self amsEngagement];
  id v5 = [v4 identifier];

  [v6 removeObserver:self placement:v5 serviceType:@"books"];
}

- (void)_updateEngagementMessagesToDisplay
{
  id v3 = [(BSUIFeedViewController *)self feedController];
  id v4 = [v3 metadata];
  uint64_t v5 = [v4 messagePlacements];
  id v6 = (void *)v5;
  BOOL v7 = &__NSArray0__struct;
  if (v5) {
    BOOL v7 = (void *)v5;
  }
  id v8 = v7;

  long long v20 = v8;
  id v9 = +[NSMutableSet setWithArray:v8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = [(BSUIFeedViewController *)self hostingController];
  id v11 = [v10 contentIdentifiers];

  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        unsigned int v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        CFStringRef v17 = [v16 type];
        unsigned int v18 = [v17 isEqualToString:@"message"];

        if (v18)
        {
          id v19 = [v16 identifier];
          [v9 addObject:v19];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  [(BSUIFeedViewController *)self _scheduleUpdateEngagementMessagesToDisplay:v9];
}

- (void)_scheduleUpdateEngagementMessagesToDisplay:(id)a3
{
  id v4 = a3;
  if (self->_deferredEngagementMessageIdentifiers)
  {
    uint64_t v5 = BSUIFeedViewControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "_scheduleUpdateEngagementMessagesToDisplay: deferring updating engagement messages for: %@", (uint8_t *)&v6, 0xCu);
    }

    [(NSMutableSet *)self->_deferredEngagementMessageIdentifiers unionSet:v4];
  }
  else
  {
    [(BSUIFeedViewController *)self _updateEngagementMessagesToDisplay:v4];
  }
}

- (void)_updateEngagementMessagesToDisplay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BSUIFeedViewController *)self _localIdentifiers];
  if ([v5 count])
  {
    id v6 = [v4 mutableCopy];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[NSMutableSet set];
    }
    id v9 = v8;

    [v9 unionSet:v5];
    id v10 = [v9 copy];

    id v4 = v10;
  }
  if ([v4 count])
  {
    id v11 = [(BSUIFeedViewController *)self bc_effectiveEngagementProvider];
    if (v11)
    {
      id v12 = [(BSUIFeedViewController *)self hostingController];
      objc_initWeak(&location, self);
      id v13 = BSUIFeedViewControllerLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v4;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "_updateEngagementMessagesToDisplay: fetchDialogRequestsFor: %@", buf, 0xCu);
      }

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_52B5C;
      v15[3] = &unk_38FF80;
      objc_copyWeak(&v18, &location);
      id v14 = v12;
      id v16 = v14;
      id v17 = v5;
      [v11 fetchDialogRequestsFor:v4 completion:v15];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

- (id)_localIdentifiers
{
  id v3 = +[NSMutableArray array];
  if ([(BSUIFeedViewController *)self isInCard]) {
    [v3 addObject:@"product_page_want_to_read_bubble_tip"];
  }
  id v4 = +[NSSet setWithArray:v3];

  return v4;
}

- (void)_handleEngagementMessageRequest:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((char *)[v6 style] - 3 <= (unsigned char *)&dword_0 + 1)
  {
    id v8 = [(BSUIFeedViewController *)self hostingController];
    id v9 = [[BSUIHostedMessageViewProvider alloc] initWithRequest:v6 identifier:v7 delegate:self];
    [v8 addProvider:v9 forIdentifier:v7];

    id v10 = [(BSUIFeedViewController *)self cardAuxiliaryNavigationBarManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    id v11[2] = sub_53268;
    v11[3] = &unk_38FFA8;
    id v12 = v6;
    id v13 = v7;
    [v10 viewControllerWhenAvailable:v11];
  }
}

- (void)_displayBottomBannerForRequest:(id)a3
{
  id v9 = a3;
  id v4 = [(BSUIFeedViewController *)self messageViewControllerProvider];

  if (!v4)
  {
    id v5 = [objc_alloc((Class)BCMessageViewControllerProvider) initWithRequest:v9 placement:@"store_page_bottom_banner"];
    [(BSUIFeedViewController *)self setMessageViewControllerProvider:v5];

    id v6 = [(BSUIFeedViewController *)self messageViewControllerProvider];
    [v6 setDelegate:self];

    id v7 = [(BSUIFeedViewController *)self messageViewControllerProvider];
    id v8 = [v7 viewController];
    [(BSUIFeedViewController *)self _displayBottomBanner:v8 animated:1];
  }
}

- (void)_displayBottomBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BSUIFeedViewController *)self view];
  id v8 = [v6 view];
  [v7 bounds];
  [v8 sizeThatFits:CGRectGetWidth(v29) 1.79769313e308];
  double v10 = v9;
  double v12 = v11;
  [v7 bounds];
  CGFloat Height = CGRectGetHeight(v30);
  double v14 = Height - v12;
  [v8 setFrame:0.0, Height - v12, v10, v12];
  double v15 = [v8 layer];
  [v15 setCornerRadius:0.0];

  [v8 setAutoresizingMask:10];
  id v16 = [(BSUIFeedViewController *)self view];
  [v16 addSubview:v8];

  [(BSUIFeedViewController *)self addChildViewController:v6];
  if (v4)
  {
    v31.origin.CGFloat x = 0.0;
    v31.origin.CGFloat y = v14;
    v31.size.double width = v10;
    v31.size.double height = v12;
    [v8 setFrame:CGRectMake(0.0, v14 + CGRectGetHeight(v31), v10, v12)];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    void v23[2] = sub_53614;
    v23[3] = &unk_38FFD0;
    id v24 = v8;
    uint64_t v25 = 0;
    double v26 = v14;
    double v27 = v10;
    double v28 = v12;
    id v17 = objc_retainBlock(v23);
    id v18 = BUProtocolCast();
    id v19 = v18;
    if (v18)
    {
      long long v20 = [v18 loadPromise];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_536D8;
      v21[3] = &unk_38F0E8;
      long long v22 = v17;
      [v20 addFinishBlock:v21];
    }
    else
    {
      ((void (*)(void *))v17[2])(v17);
    }
  }
}

- (void)_dismissBanner:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BSUIFeedViewController *)self messageViewControllerProvider];
  id v6 = [v5 viewController];

  id v7 = [v6 view];
  id v8 = v7;
  if (v3)
  {
    double v9 = [(BSUIFeedViewController *)self messageViewControllerProvider];
    double v10 = [v9 viewController];
    double v11 = [v10 view];

    [v11 frame];
    CGFloat x = v27.origin.x;
    CGFloat width = v27.size.width;
    CGFloat height = v27.size.height;
    CGFloat v15 = CGRectGetHeight(v27) + v27.origin.y;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_538D0;
    v21[3] = &unk_38FFD0;
    id v22 = v11;
    CGFloat v23 = x;
    CGFloat v24 = v15;
    CGFloat v25 = width;
    CGFloat v26 = height;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_538E0;
    v17[3] = &unk_38FFF8;
    id v18 = v22;
    id v19 = v6;
    long long v20 = self;
    id v16 = v22;
    +[UIView animateWithDuration:0 delay:v21 options:v17 animations:0.3 completion:0.0];
  }
  else
  {
    [v7 removeFromSuperview];
    [v6 removeFromParentViewController];
    [(BSUIFeedViewController *)self setMessageViewControllerProvider:0];
  }
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_53AEC;
  v19[3] = &unk_38EA28;
  objc_copyWeak(&v22, &location);
  id v14 = v12;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = objc_retainBlock(v19);
  if (v16)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v16[2])(v16);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_53C64;
      block[3] = &unk_38E0B8;
      id v18 = v16;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)messageViewController:(id)a3 didSelectActionWithURL:(id)a4
{
  id v5 = a4;
  id v7 = [(BSUIFeedViewController *)self feedController];
  id v6 = [v5 absoluteString];

  [v7 notifyOnMessageActionTriggered:v6];
}

- (void)messageViewControllerDidSelectCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(BSUIFeedViewController *)self messageViewControllerProvider];

  if (v5 == v4)
  {
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_53E74;
    v9[3] = &unk_38E9F8;
    objc_copyWeak(&v10, &location);
    id v6 = objc_retainBlock(v9);
    if (v6)
    {
      if (+[NSThread isMainThread])
      {
        ((void (*)(void *))v6[2])(v6);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_53EB8;
        block[3] = &unk_38E0B8;
        id v8 = v6;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)viewController:(id)a3 didDisplayMessageWithId:(id)a4
{
  if (a3 != self)
  {
    id v6 = a4;
    id v8 = [objc_alloc((Class)TUIHostingIdentifier) initWithType:@"message" identifier:v6];

    id v7 = [(BSUIFeedViewController *)self hostingController];
    [v7 removeProviderForIdentifier:v8];
  }
}

- (void)setDistanceFromFocusedCard:(int64_t)a3
{
  if (self->_distanceFromFocusedCard != a3)
  {
    self->_distanceFromFocusedCard = a3;
    if (a3 >= 0) {
      unint64_t v3 = a3;
    }
    else {
      unint64_t v3 = -a3;
    }
    if (v3 > 2) {
      [(BSUIFeedViewController *)self setLoadPriority:-8];
    }
    else {
      [(BSUIFeedViewController *)self setLoadPriority:qword_2FCE38[v3]];
    }
  }
}

- (id)menuElementsWithData:(id)a3
{
  contextMenuProvider = self->_contextMenuProvider;
  id v5 = [(BSUIFeedViewController *)self _dataModelWithData:a3];
  id v6 = [(BSUIContextMenuProviding *)contextMenuProvider menuElementsForViewController:self dataModel:v5];

  return v6;
}

- (void)menuElementsWithData:(id)a3 completion:(id)a4
{
  asyncContextMenuProvider = self->_asyncContextMenuProvider;
  id v7 = a4;
  id v8 = [(BSUIFeedViewController *)self _dataModelWithData:a3];
  [(BSUIAsyncContextMenuProviding *)asyncContextMenuProvider menuElementsWithDataModel:v8 viewController:self completion:v7];
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4
{
  self->_contextMenuAppearDate = +[NSDate date];

  _objc_release_x1();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 withData:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (self->_contextMenuProvider && [v9 count])
  {
    contextMenuAppearDate = self->_contextMenuAppearDate;
    if (contextMenuAppearDate)
    {
      id v12 = contextMenuAppearDate;
    }
    else
    {
      id v12 = +[NSDate date];
    }
    id v13 = v12;
    id v14 = [(BSUIFeedViewController *)self _dataModelWithData:v10];
    id v15 = [(BSUIContextMenuProviding *)self->_contextMenuProvider analyticsAssetPropertyProviderForDataModel:v14];
    if (v15)
    {
      id v16 = +[BAEventReporter sharedReporter];
      id v17 = [(BSUIFeedViewController *)self ba_effectiveAnalyticsTracker];
      [v16 emitContextualActionSheetExposureEventWithTracker:v17 startDate:v13 propertyProvider:v15];
    }
    id v18 = self->_contextMenuAppearDate;
    self->_contextMenuAppearDate = 0;
  }
}

- (id)_dataModelWithData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = [v3 objectForKeyedSubscript:@"assets"];
  id v5 = BUDynamicCast();

  uint64_t v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  id v7 = (void *)v6;
  if (v5)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v8 = v5;
    id v9 = (char *)[v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v43;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(void *)v43 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_opt_class();
          id v13 = BUDynamicCast();
          id v14 = sub_547EC((uint64_t)v13, v13);
          if (v14) {
            [v7 addObject:v14, v42];
          }
        }
        id v10 = (char *)[v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v10);
    }
  }
  else
  {
    sub_547EC(v6, v3);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8) {
      [v7 addObject:v8];
    }
  }

  id v15 = (char *)[v7 count];
  id v16 = [BSUIContextActionDataModel alloc];
  id v17 = v16;
  if (v15 == (unsigned char *)&dword_0 + 1)
  {
    id v18 = [v7 objectAtIndexedSubscript:0];
    objc_opt_class();
    id v19 = [v3 objectForKeyedSubscript:@"sourceView"];
    id v20 = BUDynamicCast();
    id v21 = [(BSUIContextActionDataModel *)v17 initWithAssetModel:v18 sourceView:v20];
  }
  else
  {
    id v21 = [(BSUIContextActionDataModel *)v16 initWithAssetModels:v7];
  }
  objc_opt_class();
  id v22 = [v3 objectForKeyedSubscript:@"animateFromRefId"];
  CGFloat v23 = BUDynamicCast();
  [(BSUIContextActionDataModel *)v21 setPresentationRefID:v23];

  objc_opt_class();
  CGFloat v24 = [v3 objectForKeyedSubscript:@"animateFromRefInstance"];
  CGFloat v25 = BUDynamicCast();
  [(BSUIContextActionDataModel *)v21 setPresentationRefInstance:v25];

  objc_opt_class();
  CGFloat v26 = [v3 objectForKeyedSubscript:@"entryID"];
  CGRect v27 = BUDynamicCast();
  [(BSUIContextActionDataModel *)v21 setPresentationUID:v27];

  objc_opt_class();
  double v28 = [v3 objectForKeyedSubscript:@"location"];
  CGRect v29 = BUDynamicCast();
  [(BSUIContextActionDataModel *)v21 setOriginatingLocation:v29];

  objc_opt_class();
  CGRect v30 = [v3 objectForKeyedSubscript:@"isAnODPRecommendation"];
  CGRect v31 = BUDynamicCast();
  -[BSUIContextActionDataModel setIsAnODPRecommendation:](v21, "setIsAnODPRecommendation:", [v31 BOOLValue]);

  id v32 = [v3 objectForKeyedSubscript:@"supportsSuggestionContextMenu"];
  if (v32)
  {
    objc_opt_class();
    os_signpost_id_t v33 = [v3 objectForKeyedSubscript:@"supportsSuggestionContextMenu"];
    id v34 = BUDynamicCast();
    -[BSUIContextActionDataModel setSupportsSuggestionContextMenu:](v21, "setSupportsSuggestionContextMenu:", [v34 BOOLValue]);
  }
  else
  {
    [(BSUIContextActionDataModel *)v21 setSupportsSuggestionContextMenu:[(BSUIContextActionDataModel *)v21 isAnODPRecommendation]];
  }

  objc_opt_class();
  id v35 = [v3 objectForKeyedSubscript:@"shouldRecordMetrics"];
  __int16 v36 = BUDynamicCast();
  -[BSUIContextActionDataModel setShouldReportFigaro:](v21, "setShouldReportFigaro:", [v36 BOOLValue]);

  objc_opt_class();
  id v37 = [v3 objectForKeyedSubscript:@"sourcePoint"];
  __int16 v38 = BUDynamicCast();
  [(BSUIContextActionDataModel *)v21 setSourcePoint:v38];

  long long v39 = [v3 objectForKeyedSubscript:BCTransactionOptionsTransactionKey];
  __int16 v40 = BUProtocolCast();
  [(BSUIContextActionDataModel *)v21 setTransaction:v40];

  if ([(BSUIContextActionDataModel *)v21 isAnODPRecommendation]) {
    [(BSUIContextActionDataModel *)v21 setODPAnalyticsWithAttributes:v3];
  }

  return v21;
}

- (void)_setEffectiveAnalyticsTracker:(id)a3
{
  id v4 = a3;
  [(BSUIFeedViewController *)self setEffectiveAnalyticsTracker:v4];
  id v5 = [(BSUIFeedViewController *)self cardAuxiliaryNavigationBarManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_54A3C;
  v7[3] = &unk_38FD10;
  id v8 = v4;
  id v6 = v4;
  [v5 viewControllerWhenAvailable:v7];
}

- (CGRect)_frameOfElementWithEntryID:(id)a3 refId:(id)a4 refInstance:(id)a5
{
  id v6 = +[TUIRenderReferenceQuery queryWithUUID:0 uid:a3 refId:a4 refInstance:a5];
  id v7 = [(BSUIFeedViewController *)self renderReferencesMatchingQuery:v6];
  id v8 = [v7 allKeys];
  id v9 = [v8 firstObject];

  if (v9
    && ([v7 objectForKeyedSubscript:v9],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 firstObject],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    [v11 center];
    [v11 size];
    CGRectMakeWithCenterAndSize();
    CGFloat x = v12;
    CGFloat y = v14;
    CGFloat width = v16;
    CGFloat height = v18;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)dealloc
{
  deferredReloadsQueue = self->_deferredReloadsQueue;
  if (deferredReloadsQueue) {
    dispatch_activate(deferredReloadsQueue);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_notificationObservers;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        id v10 = +[NSNotificationCenter defaultCenter];
        [v10 removeObserver:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [(JSAFeedController *)self->_jsFeedController setAbandoned:1];
  [(JSAFeedController *)self->_jsFeedController tearDownWithCompletion:0];
  v11.receiver = self;
  v11.super_class = (Class)BSUIFeedViewController;
  [(BSUIFeedViewController *)&v11 dealloc];
}

- (Class)jsaFeedControllerClass
{
  return (Class)objc_opt_class();
}

- (void)_updateViewWithBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(BSUIFeedViewController *)self viewIfLoaded];
  [v5 setBackgroundColor:v4];

  [(BSUIFeedViewController *)self setNeedsUpdateContentUnavailableConfiguration];
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  if (self->_showLoadingView)
  {
    id v9 = +[UIContentUnavailableConfiguration loadingConfiguration];
    id v4 = [(BSUIFeedViewController *)self viewIfLoaded];
    id v5 = [v4 backgroundColor];
    id v6 = [v9 background];
    [v6 setBackgroundColor:v5];

    [(BSUIFeedViewController *)self setContentUnavailableConfiguration:v9];
  }
  else
  {
    int64_t preferredLargeTitleDisplayMode = self->_preferredLargeTitleDisplayMode;
    id v8 = [(BSUIFeedViewController *)self navigationItem];
    [v8 setLargeTitleDisplayMode:preferredLargeTitleDisplayMode];

    [(BSUIFeedViewController *)self setContentUnavailableConfiguration:0];
  }
}

- (void)_updateSyncTransactionBehaviorInViewWillAppear
{
  if (self->_performantForScrolling) {
    [(BSUIFeedViewController *)self setAvoidSyncTransactionInViewWillAppear:1];
  }
  else {
    [(BSUIFeedViewController *)self setAvoidSyncTransactionInViewWillAppear:self->_performantForReadingExperience];
  }
}

- (UIEdgeInsets)navigationBarMetricsLayoutMargins
{
  id v2 = [(BSUIFeedViewController *)self feedController];
  id v3 = [v2 metadata];
  [v3 navigationBarLayoutInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.double right = v15;
  result.double bottom = v14;
  result.double left = v13;
  result.double top = v12;
  return result;
}

- (BCCardContentDelegate)cardContentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->cardContentDelegate);

  return (BCCardContentDelegate *)WeakRetained;
}

- (void)setCardContentDelegate:(id)a3
{
}

- (NSString)trackerName
{
  return self->_trackerName;
}

- (int64_t)distanceFromFocusedCard
{
  return self->_distanceFromFocusedCard;
}

- (BCSafeAreaInsetsObserver)bcSafeAreaInsetsObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bcSafeAreaInsetsObserver);

  return (BCSafeAreaInsetsObserver *)WeakRetained;
}

- (void)setBcSafeAreaInsetsObserver:(id)a3
{
}

- (BOOL)avoidSyncTransactionInViewWillAppear
{
  return self->_avoidSyncTransactionInViewWillAppear;
}

- (void)setAvoidSyncTransactionInViewWillAppear:(BOOL)a3
{
  self->_avoidSyncTransactionInViewWillAppear = a3;
}

- (BCCardContentScrollManager)cardContentScrollManager
{
  return self->_cardContentScrollManager;
}

- (int64_t)loadPriority
{
  return self->_loadPriority;
}

- (TUIAssertion)assertionForSuspendingLayoutUpdates
{
  return self->_assertionForSuspendingLayoutUpdates;
}

- (void)setAssertionForSuspendingLayoutUpdates:(id)a3
{
}

- (BOOL)disallowLoadingView
{
  return self->_disallowLoadingView;
}

- (void)setDisallowLoadingView:(BOOL)a3
{
  self->_disallowLoadingView = a3;
}

- (BSUIFeedViewControllerFeedMetadataDelegate)metadataDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metadataDelegate);

  return (BSUIFeedViewControllerFeedMetadataDelegate *)WeakRetained;
}

- (int64_t)feedLiveResizeOptions
{
  return self->_feedLiveResizeOptions;
}

- (BOOL)performantForReadingExperience
{
  return self->_performantForReadingExperience;
}

- (JSAFeedController)jsFeedController
{
  return self->_jsFeedController;
}

- (void)setJsFeedController:(id)a3
{
}

- (BSUIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (BSUIFeedTriggerBlockObserver)feedTriggerObserver
{
  return self->_feedTriggerObserver;
}

- (void)setFeedTriggerObserver:(id)a3
{
}

- (CGSize)viewSizeWhenNotifiedBottomReached
{
  double width = self->_viewSizeWhenNotifiedBottomReached.width;
  double height = self->_viewSizeWhenNotifiedBottomReached.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setViewSizeWhenNotifiedBottomReached:(CGSize)a3
{
  self->_viewSizeWhenNotifiedBottomReached = a3;
}

- (BOOL)alreadyNotifiedBottomReached
{
  return self->_alreadyNotifiedBottomReached;
}

- (void)setAlreadyNotifiedBottomReached:(BOOL)a3
{
  self->_alreadyNotifiedBottomReached = a3;
}

- (BOOL)dismissOnViewDisappear
{
  return self->_dismissOnViewDisappear;
}

- (void)setDismissOnViewDisappear:(BOOL)a3
{
  self->_dismissOnViewDisappear = a3;
}

- (unint64_t)navigationBarStyle
{
  return self->_navigationBarStyle;
}

- (void)setNavigationBarStyle:(unint64_t)a3
{
  self->_navigationBarStyle = a3;
}

- (BSUIDynamicValue)currentStackName
{
  return self->_currentStackName;
}

- (void)setCurrentStackName:(id)a3
{
}

- (NSArray)notificationObservers
{
  return self->_notificationObservers;
}

- (void)setNotificationObservers:(id)a3
{
}

- (BOOL)openFinalized
{
  return self->_openFinalized;
}

- (void)setOpenFinalized:(BOOL)a3
{
  self->_openFinalized = a3;
}

- (BOOL)performantForScrolling
{
  return self->_performantForScrolling;
}

- (TUIAssertion)suspendLayoutForScrolling
{
  return self->_suspendLayoutForScrolling;
}

- (void)setSuspendLayoutForScrolling:(id)a3
{
}

- (void)setNavigationItem:(id)a3
{
}

- (UIViewController)currentPopOverViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentPopOverViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setCurrentPopOverViewController:(id)a3
{
}

- (UIColor)navigationBarTintColorWhenLayoutReady
{
  return self->_navigationBarTintColorWhenLayoutReady;
}

- (void)setNavigationBarTintColorWhenLayoutReady:(id)a3
{
}

- (NSString)lastTwoLineTitleFixed
{
  return self->_lastTwoLineTitleFixed;
}

- (void)setLastTwoLineTitleFixed:(id)a3
{
}

- (BOOL)lastTwoLineTitleFixHadSearchController
{
  return self->_lastTwoLineTitleFixHadSearchController;
}

- (void)setLastTwoLineTitleFixHadSearchController:(BOOL)a3
{
  self->_lastTwoLineTitleFixHadSearchController = a3;
}

- (NSMutableSet)activeRenderOverrides
{
  return self->_activeRenderOverrides;
}

- (void)setActiveRenderOverrides:(id)a3
{
}

- (UIView)popoverArrowBackgroundView
{
  return self->_popoverArrowBackgroundView;
}

- (void)setPopoverArrowBackgroundView:(id)a3
{
}

- (BOOL)isInCard
{
  return self->_isInCard;
}

- (void)setIsInCard:(BOOL)a3
{
  self->_isInCard = a3;
}

- (BOOL)deferUIUpdateUntilInitialContentReady
{
  return self->_deferUIUpdateUntilInitialContentReady;
}

- (OS_dispatch_queue)deferredReloadsQueue
{
  return self->_deferredReloadsQueue;
}

- (NSMutableSet)deferredEngagementMessageIdentifiers
{
  return self->_deferredEngagementMessageIdentifiers;
}

- (NSString)parentCardNavigationType
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setParentCardNavigationType:(id)a3
{
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (void)setIsPresented:(BOOL)a3
{
  self->_isPresented = a3;
}

- (BOOL)wasPresentingCards
{
  return self->_wasPresentingCards;
}

- (void)setWasPresentingCards:(BOOL)a3
{
  self->_wasPresentingCards = a3;
}

- (_TtC13BookAnalytics9BATracker)effectiveAnalyticsTracker
{
  return (_TtC13BookAnalytics9BATracker *)objc_getProperty(self, a2, 304, 1);
}

- (void)setEffectiveAnalyticsTracker:(id)a3
{
}

- (AMSEngagement)amsEngagement
{
  return self->_amsEngagement;
}

- (void)setAmsEngagement:(id)a3
{
}

- (BCMessageViewControllerProvider)messageViewControllerProvider
{
  return self->_messageViewControllerProvider;
}

- (void)setMessageViewControllerProvider:(id)a3
{
}

- (BSUICardAuxiliaryNavigationBarManager)cardAuxiliaryNavigationBarManager
{
  return self->_cardAuxiliaryNavigationBarManager;
}

- (void)setCardAuxiliaryNavigationBarManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardAuxiliaryNavigationBarManager, 0);
  objc_storeStrong((id *)&self->_messageViewControllerProvider, 0);
  objc_storeStrong((id *)&self->_amsEngagement, 0);
  objc_storeStrong((id *)&self->_effectiveAnalyticsTracker, 0);
  objc_storeStrong((id *)&self->_parentCardNavigationType, 0);
  objc_storeStrong((id *)&self->_deferredEngagementMessageIdentifiers, 0);
  objc_storeStrong((id *)&self->_deferredReloadsQueue, 0);
  objc_storeStrong((id *)&self->_popoverArrowBackgroundView, 0);
  objc_storeStrong((id *)&self->_activeRenderOverrides, 0);
  objc_storeStrong((id *)&self->_lastTwoLineTitleFixed, 0);
  objc_storeStrong((id *)&self->_navigationBarTintColorWhenLayoutReady, 0);
  objc_destroyWeak((id *)&self->_currentPopOverViewController);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_suspendLayoutForScrolling, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_currentStackName, 0);
  objc_storeStrong((id *)&self->_feedTriggerObserver, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_jsFeedController, 0);
  objc_destroyWeak((id *)&self->_metadataDelegate);
  objc_storeStrong((id *)&self->_assertionForSuspendingLayoutUpdates, 0);
  objc_destroyWeak((id *)&self->_bcSafeAreaInsetsObserver);
  objc_storeStrong(&self->_feedContentCompletion, 0);
  objc_storeStrong((id *)&self->_trackerName, 0);
  objc_destroyWeak((id *)&self->cardContentDelegate);
  objc_storeStrong((id *)&self->_asyncContextMenuProvider, 0);
  objc_storeStrong((id *)&self->_contextMenuProvider, 0);

  objc_storeStrong((id *)&self->_contextMenuAppearDate, 0);
}

+ (void)createSeriesViewControllerFromOptions:(NSDictionary *)a3 withParentTracker:(_TtC13BookAnalytics9BATracker *)a4 navigationTypeValue:(NSString *)a5 navigationContext:(BSUINavigationContext *)a6 shouldReportFigaro:(BOOL)a7 completion:(id)a8
{
  uint64_t v15 = sub_63BAC((uint64_t *)&unk_3CE280);
  __chkstk_darwin(v15 - 8);
  id v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v18 = _Block_copy(a8);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a3;
  *(void *)(v19 + 24) = a4;
  *(void *)(v19 + 32) = a5;
  *(void *)(v19 + 40) = a6;
  *(unsigned char *)(v19 + 48) = a7;
  *(void *)(v19 + 56) = v18;
  *(void *)(v19 + 64) = a1;
  uint64_t v20 = sub_2E4780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  double v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  void v21[4] = &unk_3CC908;
  v21[5] = v19;
  double v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_3C86C0;
  v22[5] = v21;
  double v23 = a3;
  CGFloat v24 = a4;
  CGFloat v25 = a5;
  CGFloat v26 = a6;
  sub_1D4150((uint64_t)v17, (uint64_t)&unk_3C86C8, (uint64_t)v22);
  swift_release();
}

@end