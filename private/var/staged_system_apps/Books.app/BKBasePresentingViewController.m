@interface BKBasePresentingViewController
+ (id)_lastOpenedBookWithKey:(id)a3;
+ (id)_successfullyOpenedBookWithKey:(id)a3 successKey:(id)a4 deleteOnFailure:(BOOL)a5;
+ (id)animatorForAsset:(id)a3 isCurrentBook:(BOOL)a4 opening:(BOOL)a5 largeCover:(BOOL)a6 skipZoom:(BOOL)a7;
+ (id)bkaxPresentedAssetTransitionViewIdentifier;
+ (id)defaultAnimatorForOpening:(BOOL)a3 skipReveal:(BOOL)a4;
+ (id)futureViewControllerWithAssetIdentifier:(id)a3 libraryAssetProvider:(id)a4 options:(id)a5;
+ (id)holdAnimationAssertion;
+ (id)lastKnownOpenedCurrentBookID;
+ (id)lastKnownSuccessfullyOpenBookID;
+ (id)lastKnownSuccessfullyOpenedCurrentBookID;
+ (void)_markBookAsCurrent:(id)a3;
+ (void)clearLastKnownSuccessfullyOpenBookID;
+ (void)clearLastKnownSuccessfullyOpenedCurrentBookID;
+ (void)initialize;
+ (void)markCarPlayBackgroundBookAsCurrent:(id)a3;
+ (void)startingOpenOfMinifedCurrentBook:(id)a3;
- (AEAssetViewController)assetViewController;
- (AEHelper)assetHelper;
- (BAAppAnalyticsAdditionalData)appAnalyticsAdditionalData;
- (BAUpSellData)upSellData;
- (BCCoverAnimatingHost)placeholderViewController;
- (BCMutableFutureValue)sampleProfileFuture;
- (BCReadingStatisticsController)readingStatisticsController;
- (BKAssetLookup)assetLookup;
- (BKAssetPresentingFilePresenter)filePresenter;
- (BKAssetPresentingViewControllerHoldAnimationAssertion)holdAnimationAssertion;
- (BKBasePresentingViewController)initWithAssetIdentifier:(id)a3 assetViewController:(id)a4 helper:(id)a5 libraryAssetProvider:(id)a6;
- (BKBasePresentingViewController)initWithAssetIdentifier:(id)a3 placeholderViewController:(id)a4 holdAnimationAssertion:(id)a5 libraryAssetProvider:(id)a6;
- (BKContentOpenAnimating)assetPresenterAnimator;
- (BKFrontmostAssetTracker)frontmostTracker;
- (BKImportInPlaceMonitor)importInPlaceMonitor;
- (BKLibraryAssetIdentifier)assetIdentifier;
- (BKLibraryAssetProvider)libraryAssetProvider;
- (BKLibraryDownloadStatus)progressStatus;
- (BKMinifiedPresenting)minifiedPresenter;
- (BKSampleToPurchaseMonitor)sampleToPurchasedMonitor;
- (BKTransitioningViewController)transitioningViewController;
- (BOOL)_isAudiobook;
- (BOOL)_isHostedInAuxiliaryScene;
- (BOOL)_requiresCustomPresentationController;
- (BOOL)_shouldTrackReadingSession;
- (BOOL)aspectFitDuringResize;
- (BOOL)assetPresenterKeepOpenWithoutBundle;
- (BOOL)assetViewController:(id)a3 requestClose:(BOOL)a4 error:(id)a5;
- (BOOL)assetViewController:(id)a3 requestClose:(BOOL)a4 finishedConsuming:(BOOL)a5 error:(id)a6 withErrorBlock:(id)a7;
- (BOOL)assetViewController:(id)a3 requestOpenURL:(id)a4 likelyUserInitiated:(BOOL)a5;
- (BOOL)assetViewControllerIsCurrentBook:(id)a3;
- (BOOL)assetViewControllerIsPresentingSupplementalContent:(id)a3;
- (BOOL)autoDownload;
- (BOOL)autoOpen;
- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented;
- (BOOL)canUpdateLibraryBarButtonItem:(id)a3 withOldString:(id)a4;
- (BOOL)didFetchProfile;
- (BOOL)enteringFullScreen;
- (BOOL)exitingFullScreen;
- (BOOL)finishedConsuming;
- (BOOL)im_tabBarVisible;
- (BOOL)inFullScreen;
- (BOOL)inLiveResize;
- (BOOL)isResigningActive;
- (BOOL)isSupplementalContent;
- (BOOL)isTranslateAvailableForAssetViewController:(id)a3;
- (BOOL)minifiedBarHidden;
- (BOOL)minifiedBarVisibilityStyleIsHidden;
- (BOOL)needTOCEntriesForOrdinal:(int64_t)a3;
- (BOOL)needTextNodeCharacterCountsForOrdinal:(int64_t)a3;
- (BOOL)needToForcePagination;
- (BOOL)needToRebuildContextTree;
- (BOOL)prefersStatusBarHidden;
- (BOOL)preparingEndOfBookExperience;
- (BOOL)readingStatisticsEnabled;
- (BOOL)scrimAppliedForLiveResize;
- (BOOL)shouldCloseDueToAssetDeletion;
- (BOOL)shouldRestoreNavBar;
- (BOOL)showBackChevronForCoverView;
- (BOOL)stateDismissInProgress;
- (BOOL)stateShouldClose;
- (BOOL)stateShouldOpen;
- (BOOL)successfullyOpened;
- (BOOL)useLegacyAnimation;
- (BOOL)willTerminate;
- (CGRect)liveResizeViewOriginalFrame;
- (NSArray)bk_previewActionItems;
- (NSDictionary)openOptions;
- (NSMutableDictionary)deferredURLOpenRequests;
- (NSString)assetPresenterAssetID;
- (NSString)assetPresenterPermanentOrTemporaryAssetID;
- (NSString)storeID;
- (NSTimer)confirmActiveTimer;
- (NSTimer)successfullyOpenedTimer;
- (NSUUID)sessionID;
- (UIBarButtonItem)buyButtonItem;
- (UIView)liveResizeWrapperView;
- (UIView)overlayView;
- (UIView)scrimLiveResizeView;
- (UIVisualEffectView)scrimLiveResizeBlurView;
- (double)_transitionDurationForLiveResizeOfViewController:(id)a3;
- (double)assetPresenterCoverAspect;
- (id)_buyButton;
- (id)_closeBarButtonTitle;
- (id)_fetchSampleProfileFuture;
- (id)_newBarButtonItemWithBuyButton;
- (id)_sceneControllerCurrentlyHostingAssetPresenter;
- (id)analyticsAssetPropertyProviderForAssetViewController:(id)a3 fromSourceView:(id)a4;
- (id)analyticsContentDataForAssetViewController:(id)a3 contentSubType:(id)a4 tracker:(id)a5;
- (id)assetPresenterCoverAnimationSource;
- (id)assetPresenterCoverImage;
- (id)assetPresenterCoverShadowImage;
- (id)assetViewController:(id)a3 supplementalContentPickerForAssetWithPlaylistID:(id)a4;
- (id)assetViewControllerBuyButtonItem:(id)a3 isSample:(BOOL)a4 isPreorder:(BOOL)a5 storeID:(id)a6;
- (id)assetViewControllerMinifiedBarButtonItem:(id)a3;
- (id)backItemForCoverView;
- (id)bc_childCardPresentingViewController;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)contextMenuWithAssetViewController:(id)a3 sourceView:(id)a4;
- (id)coordinatedViewControllersFor:(id)a3;
- (id)dataModelWithSourceView:(id)a3;
- (id)donationItemFor:(id)a3 intent:(int64_t)a4;
- (id)donationTargets;
- (id)downloadProgressBlock;
- (id)errorCloseBlock;
- (id)libraryButtonItemForViewController:(id)a3 selector:(SEL)a4;
- (id)loadAssetBlock;
- (id)previewActionItems;
- (id)traitCollection;
- (id)transitionCompletedBlock;
- (int64_t)assetState;
- (unint64_t)stateFlags;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_assetPresenterDidEnterBackground;
- (void)_assetPresenterWillEnterForeground;
- (void)_beginReadingSessionForEventType:(unint64_t)a3;
- (void)_cancelInteractionTimerIfNeeded;
- (void)_cancelSuccessfullyOpenedTimerIfNeeded;
- (void)_clearCacheForBook:(id)a3;
- (void)_clearLiveResizeViews;
- (void)_commonInitWithIdentifier:(id)a3 libraryAssetProvider:(id)a4;
- (void)_configureBuyButton:(id)a3 color:(id)a4;
- (void)_configureBuyButtonForPricing:(id)a3 profile:(id)a4;
- (void)_confirmBookSuccessfullyOpened;
- (void)_didEnterFullScreen:(id)a3;
- (void)_didExitFullScreen:(id)a3;
- (void)_didOpenBookAnimated:(BOOL)a3;
- (void)_downloadStatusNotification:(id)a3;
- (void)_endReadingSessionForEventType:(unint64_t)a3 withCompletion:(id)a4;
- (void)_fetchProfileForStoreID:(id)a3 completion:(id)a4;
- (void)_finalizeAssetVCState;
- (void)_handleClosingCleanup:(BOOL)a3;
- (void)_libraryOwnershipNotification:(id)a3;
- (void)_loadAssetVC;
- (void)_loadWithAssetViewController:(id)a3 helper:(id)a4;
- (void)_maybeUpdateSuccessfullyOpenedCurrentBook:(id)a3;
- (void)_refreshReadingState;
- (void)_reloadAssetCloseViewController:(BOOL)a3;
- (void)_resizeBuyButton:(id)a3;
- (void)_sendDeferredURLOpenRequests;
- (void)_startBookSuccessfullyOpenedTimer;
- (void)_startInteractionTimer;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateAssetStateAndDownloadStatus:(id)a3;
- (void)_updateBuyButtonProgressIfNeeded;
- (void)_updateLastOpenBookWithAssetID:(id)a3;
- (void)_updateLibraryAssetFromMetadataWithURL:(id)a3 completion:(id)a4;
- (void)_waitForOngoingMigrationAttemptToFinish:(id)a3 completion:(id)a4;
- (void)_willEnterFullScreen:(id)a3;
- (void)_willExitFullScreen:(id)a3;
- (void)_willOpenBookAnimated:(BOOL)a3;
- (void)addTOCEntries:(id)a3 ordinal:(int64_t)a4 completion:(id)a5;
- (void)addTextNodeCharacterCounts:(id)a3 ordinal:(int64_t)a4 completion:(id)a5;
- (void)assetPresenterDismissalDidEnd:(BOOL)a3;
- (void)assetPresenterDismissalTransitionWillBegin;
- (void)assetPresenterJumpToBeginningAnimated:(BOOL)a3;
- (void)assetPresenterOpenToLocation:(id)a3 animated:(BOOL)a4;
- (void)assetPresenterPrepareForDismissal;
- (void)assetPresenterPrepareForTermination;
- (void)assetPresenterUpdateCloseTypeState;
- (void)assetPresenterUpdateToolbars;
- (void)assetViewController:(id)a3 assetPropertyChanged:(id)a4;
- (void)assetViewController:(id)a3 attemptClose:(BOOL)a4;
- (void)assetViewController:(id)a3 cancelledClose:(BOOL)a4;
- (void)assetViewController:(id)a3 didShowContentWithCFIs:(id)a4;
- (void)assetViewController:(id)a3 handleFamilyChangeError:(id)a4;
- (void)assetViewController:(id)a3 openSupplementalAssetWithIdentifier:(id)a4;
- (void)assetViewController:(id)a3 presentModalViewController:(id)a4 animated:(BOOL)a5;
- (void)assetViewController:(id)a3 presentTranslationForText:(id)a4 fromRect:(CGRect)a5 onClose:(id)a6;
- (void)assetViewController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)assetViewController:(id)a3 setFinishedAndCloseForAssetID:(id)a4;
- (void)assetViewController:(id)a3 willClose:(BOOL)a4;
- (void)assetViewController:(id)a3 willHideContentWithCFIs:(id)a4;
- (void)assetViewController:(id)a3 willOpen:(BOOL)a4;
- (void)assetViewControllerPaginationCompletedForBook:(id)a3;
- (void)assetViewControllerSignificantReadingLocationChange:(id)a3;
- (void)ba_setAnalyticsTracker:(id)a3;
- (void)bkaxSetUpAccessibilityForPresentedBook;
- (void)dealloc;
- (void)didFinishUpdateForAssetViewController:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)dismissLibraryBookCoverViewController:(id)a3 animated:(BOOL)a4;
- (void)im_dismissAnimated:(BOOL)a3 immediate:(BOOL)a4;
- (void)loadWithAssetWithBlock:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)readingStatisticsDidChangeOnController:(id)a3 changes:(id)a4;
- (void)removeFromParentViewController;
- (void)requestToBuy:(id)a3;
- (void)setAppAnalyticsAdditionalData:(id)a3;
- (void)setAspectFitDuringResize:(BOOL)a3;
- (void)setAssetHelper:(id)a3;
- (void)setAssetIdentifier:(id)a3;
- (void)setAssetLookup:(id)a3;
- (void)setAssetPresenterAnimator:(id)a3;
- (void)setAssetPresenterCoverAspect:(double)a3;
- (void)setAssetPresenterIsSupplementalContent:(BOOL)a3;
- (void)setAssetState:(int64_t)a3;
- (void)setAssetViewController:(id)a3;
- (void)setAutoDownload:(BOOL)a3;
- (void)setAutoOpen:(BOOL)a3;
- (void)setBk_previewActionItems:(id)a3;
- (void)setBuyButtonItem:(id)a3;
- (void)setConfirmActiveTimer:(id)a3;
- (void)setDeferredURLOpenRequests:(id)a3;
- (void)setDidFetchProfile:(BOOL)a3;
- (void)setDownloadProgressBlock:(id)a3;
- (void)setEnteringFullScreen:(BOOL)a3;
- (void)setErrorCloseBlock:(id)a3;
- (void)setExitingFullScreen:(BOOL)a3;
- (void)setFilePresenter:(id)a3;
- (void)setFinishedConsuming:(BOOL)a3;
- (void)setFinishedForAssetID:(id)a3;
- (void)setHoldAnimationAssertion:(id)a3;
- (void)setImportInPlaceMonitor:(id)a3;
- (void)setInFullScreen:(BOOL)a3;
- (void)setInLiveResize:(BOOL)a3;
- (void)setIsResigningActive:(BOOL)a3;
- (void)setLibraryAssetProvider:(id)a3;
- (void)setLiveResizeViewOriginalFrame:(CGRect)a3;
- (void)setLiveResizeWrapperView:(id)a3;
- (void)setLoadAssetBlock:(id)a3;
- (void)setMinifiedBarHidden:(BOOL)a3;
- (void)setMinifiedPresenter:(id)a3;
- (void)setNeedToForcePagination:(BOOL)a3;
- (void)setNeedToRebuildContextTree:(BOOL)a3;
- (void)setOpenOptions:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setPlaceholderViewController:(id)a3;
- (void)setPreparingEndOfBookExperience:(BOOL)a3;
- (void)setProgressStatus:(id)a3;
- (void)setReadingStatisticsController:(id)a3;
- (void)setSampleProfileFuture:(id)a3;
- (void)setSampleToPurchasedMonitor:(id)a3;
- (void)setScrimAppliedForLiveResize:(BOOL)a3;
- (void)setScrimLiveResizeBlurView:(id)a3;
- (void)setScrimLiveResizeView:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setShouldRestoreNavBar:(BOOL)a3;
- (void)setStateDismissInProgress:(BOOL)a3;
- (void)setStateFlags:(unint64_t)a3;
- (void)setStateShouldClose:(BOOL)a3;
- (void)setStateShouldOpen:(BOOL)a3;
- (void)setStoreID:(id)a3;
- (void)setSuccessfullyOpened:(BOOL)a3;
- (void)setSuccessfullyOpenedTimer:(id)a3;
- (void)setTransitionCompletedBlock:(id)a3;
- (void)setTransitioningViewController:(id)a3;
- (void)setUpSellData:(id)a3;
- (void)setUseLegacyAnimation:(BOOL)a3;
- (void)setWillTerminate:(BOOL)a3;
- (void)timeTracker:(id)a3 didPromoteAsset:(id)a4 deletedFromWantToRead:(BOOL)a5;
- (void)transitionContextNeedsSetup;
- (void)transitionContextWillCompleteTransitionInContainerView:(id)a3;
- (void)updatePromotionStateWithCompletion:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillMoveToWindow:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willAddViewToHierarchy;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation BKBasePresentingViewController

+ (id)lastKnownSuccessfullyOpenBookID
{
  return _[a1 _successfullyOpenedBookWithKey:@"BKMainViewControllerLastBook" successKey:@"BKMainViewControllerSuccessfullyOpenedBook" deleteOnFailure:0];
}

+ (id)_successfullyOpenedBookWithKey:(id)a3 successKey:(id)a4 deleteOnFailure:(BOOL)a5
{
  v5 = [a1 _lastOpenedBookWithKey:a3, a4, a5];
  if ([v5 length])
  {
    v6 = +[BKLastOpenBookManager sharedInstance];
    unsigned __int8 v7 = [v6 shouldAutoOpenAsset:v5];

    if ((v7 & 1) == 0)
    {

      v5 = 0;
    }
  }

  return v5;
}

+ (id)_lastOpenedBookWithKey:(id)a3
{
  id v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  v5 = [v4 objectForKey:v3];

  v6 = BCCurrentBookLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Last known assetID: %@ (for key %@)", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = [objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:@"BKMainViewControllerSuccessfullyOpenedBook", &stru_100A70340, @"BKMainViewControllerLastBook", &__kCFBooleanTrue, @"kSuccessfullyOpenedCurrentBook", &stru_100A70340, @"kLastCurrentBookKey", 0];
    v2 = +[NSUserDefaults standardUserDefaults];
    [v2 registerDefaults:v3];
  }
}

+ (id)holdAnimationAssertion
{
  v2 = objc_alloc_init(BKAssetPresentingViewControllerHoldAnimationAssertion);

  return v2;
}

- (id)backItemForCoverView
{
  if (![(BKBasePresentingViewController *)self _isHostedInAuxiliaryScene])
  {
    id v14 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  id v3 = [(BKBasePresentingViewController *)self _sceneControllerCurrentlyHostingAssetPresenter];
  v4 = BUDynamicCast();

  v5 = [v4 rootBarCoordinator];

  if (v5) {
    goto LABEL_7;
  }
  v6 = [(BKBasePresentingViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKSceneHosting];
  unsigned __int8 v7 = [v6 currentSceneController];
  int v8 = [v7 bk_window];
  [v8 bounds];
  double v10 = v9;
  id v11 = +[UIScreen mainScreen];
  [v11 bounds];
  double v13 = v12;

  if (v10 < v13)
  {

LABEL_7:
    v16 = &stru_100A70340;
    goto LABEL_8;
  }
  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"Library" value:&stru_100A70340 table:0];

  if (!v16) {
    goto LABEL_7;
  }
LABEL_8:
  id v14 = [objc_alloc((Class)UINavigationItem) initWithTitle:v16];

LABEL_9:

  return v14;
}

- (BOOL)showBackChevronForCoverView
{
  return ![(BKBasePresentingViewController *)self _isHostedInAuxiliaryScene];
}

- (BOOL)shouldCloseDueToAssetDeletion
{
  v2 = [(BKBasePresentingViewController *)self assetViewController];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v3 = [v2 shouldCloseDueToAssetDeletion];
  }
  else {
    unsigned __int8 v3 = 1;
  }

  return v3;
}

- (BKBasePresentingViewController)initWithAssetIdentifier:(id)a3 assetViewController:(id)a4 helper:(id)a5 libraryAssetProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BKBasePresentingViewController;
  id v14 = [(BKBasePresentingViewController *)&v18 initWithNibName:0 bundle:0];
  v15 = v14;
  if (v14)
  {
    [(BKBasePresentingViewController *)v14 setAssetViewController:v11];
    [(BKBasePresentingViewController *)v15 setAssetHelper:v12];
    v16 = [(BKBasePresentingViewController *)v15 assetViewController];
    [v16 setAssetViewControllerDelegate:v15];

    [(BKBasePresentingViewController *)v15 _commonInitWithIdentifier:v10 libraryAssetProvider:v13];
  }

  return v15;
}

- (BKBasePresentingViewController)initWithAssetIdentifier:(id)a3 placeholderViewController:(id)a4 holdAnimationAssertion:(id)a5 libraryAssetProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BKBasePresentingViewController;
  id v14 = [(BKBasePresentingViewController *)&v18 initWithNibName:0 bundle:0];
  v15 = v14;
  if (v14)
  {
    [(BKBasePresentingViewController *)v14 setPlaceholderViewController:v11];
    objc_opt_class();
    v16 = BUDynamicCast();
    [(BKBasePresentingViewController *)v15 setHoldAnimationAssertion:v16];

    [(BKBasePresentingViewController *)v15 _commonInitWithIdentifier:v10 libraryAssetProvider:v13];
  }

  return v15;
}

- (id)previewActionItems
{
  return [(BKBasePresentingViewController *)self bk_previewActionItems];
}

- (void)_commonInitWithIdentifier:(id)a3 libraryAssetProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_applicationDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:0];
  [v8 addObserver:self selector:"_applicationWillResignActiveNotification:" name:UIApplicationWillResignActiveNotification object:0];
  [v8 addObserver:self selector:"_downloadStatusNotification:" name:BKLibraryDownloadStatusNotification object:0];
  uint64_t v9 = BKLibraryOwnershipDidChangeNotification;
  id v10 = +[BKLibraryManager defaultManager];
  [v8 addObserver:self selector:"_libraryOwnershipNotification:" name:v9 object:v10];

  id v11 = +[BCBookReadingTimeTracker sharedInstance];
  [v11 addPromotionObserver:self];

  id v12 = (BKLibraryAssetIdentifier *)[v6 copy];
  assetIdentifier = self->_assetIdentifier;
  self->_assetIdentifier = v12;

  [(BKBasePresentingViewController *)self setLibraryAssetProvider:v7];
  id v14 = (BCMutableFutureValue *)objc_opt_new();
  sampleProfileFuture = self->_sampleProfileFuture;
  self->_sampleProfileFuture = v14;

  v16 = [[BKTransitioningViewController alloc] initWithContentViewController:0];
  [(BKBasePresentingViewController *)self setTransitioningViewController:v16];

  [(BKBasePresentingViewController *)self setStateShouldOpen:1];
  [(BKBasePresentingViewController *)self bc_setNavBarVisible:0];
  [(BKBasePresentingViewController *)self setDefinesPresentationContext:1];
  [(BKBasePresentingViewController *)self setModalPresentationCapturesStatusBarAppearance:1];
  objc_opt_class();
  v17 = [(BKBasePresentingViewController *)self assetHelper];
  objc_super v18 = BUDynamicCast();

  if (v18)
  {
    v19 = [v18 mAsset];
    id v20 = objc_alloc((Class)BAAppAnalyticsAdditionalData);
    id v21 = [v19 supportsUnifiedProductPage];
    v22 = [v19 editionKind];
    id v23 = [v20 initWithSupportsUnifiedProductPage:v21 editionKind:v22];
    [(BKBasePresentingViewController *)self setAppAnalyticsAdditionalData:v23];
  }
  objc_initWeak(&location, self);
  v24 = [BKFrontmostAssetTracker alloc];
  v25 = [v6 permanentOrTemporaryAssetID];
  v30 = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472;
  v32 = sub_1000A00B8;
  v33 = &unk_100A444A8;
  objc_copyWeak(&v34, &location);
  v26 = [(BKFrontmostAssetTracker *)v24 initWithAssetID:v25 window:0 onFrontmostChanged:&v30];
  frontmostTracker = self->_frontmostTracker;
  self->_frontmostTracker = v26;

  v28 = +[UITraitCollection bc_allAPITraits];
  id v29 = [(BKBasePresentingViewController *)self registerForTraitChanges:v28 withAction:"_traitCollectionDidChange:previousTraitCollection:"];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  [(BKFrontmostAssetTracker *)self->_frontmostTracker setOnFrontmostChanged:0];
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(BKBasePresentingViewController *)self _cancelInteractionTimerIfNeeded];
  [(BKBasePresentingViewController *)self _cancelSuccessfullyOpenedTimerIfNeeded];
  [(BCReadingStatisticsController *)self->_readingStatisticsController removeObserver:self];
  readingStatisticsController = self->_readingStatisticsController;
  self->_readingStatisticsController = 0;

  [(BKBasePresentingViewController *)self setProgressStatus:0];
  v5 = [(BKBasePresentingViewController *)self sampleProfileFuture];
  [v5 cancel];

  [(BKBasePresentingViewController *)self _finalizeAssetVCState];
  id v6 = [(BKBasePresentingViewController *)self filePresenter];
  [v6 deactivate];

  [(BKBasePresentingViewController *)self setFilePresenter:0];
  id v7 = [(BKBasePresentingViewController *)self buyButtonItem];
  int v8 = [v7 customView];
  uint64_t v9 = [v8 viewWithTag:7];

  [v9 removeTarget:self action:"requestToBuy:" forControlEvents:64];
  v10.receiver = self;
  v10.super_class = (Class)BKBasePresentingViewController;
  [(BKBasePresentingViewController *)&v10 dealloc];
}

- (BOOL)_isAudiobook
{
  unsigned __int8 v3 = +[AEAudiobookPlugin associatedAssetType];
  v4 = [(BKBasePresentingViewController *)self assetViewController];
  v5 = [v4 asset];

  if (v5)
  {
    id v6 = [v5 assetType];
    id v7 = [v6 lowercaseString];
    int v8 = [v3 lowercaseString];
    LOBYTE(v9) = [v7 isEqualToString:v8];

LABEL_3:
    goto LABEL_4;
  }
  if (!+[NSThread isMainThread])
  {
    LOBYTE(v9) = 0;
    goto LABEL_4;
  }
  uint64_t v9 = [(BKBasePresentingViewController *)self assetIdentifier];

  if (v9)
  {
    uint64_t v9 = [(BKBasePresentingViewController *)self libraryAssetProvider];
    id v11 = [(BKBasePresentingViewController *)self assetIdentifier];
    id v6 = [v9 libraryAssetOnMainQueueWithAssetIdentifier:v11];

    LOBYTE(v9) = [v6 isAudiobook];
    goto LABEL_3;
  }
LABEL_4:

  return (char)v9;
}

- (BOOL)_shouldTrackReadingSession
{
  if ([(BKBasePresentingViewController *)self successfullyOpened])
  {
    unsigned __int8 v3 = [(BKBasePresentingViewController *)self assetIdentifier];
    v4 = [v3 permanentAssetID];
    if ([v4 length] && !-[BKBasePresentingViewController _isAudiobook](self, "_isAudiobook")) {
      unsigned int v5 = ![(BKBasePresentingViewController *)self isSupplementalContent];
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)removeFromParentViewController
{
  v3.receiver = self;
  v3.super_class = (Class)BKBasePresentingViewController;
  [(BKBasePresentingViewController *)&v3 removeFromParentViewController];
  [(BKBasePresentingViewController *)self _finalizeAssetVCState];
}

- (void)_clearCacheForBook:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BKBasePresentingViewController *)self assetIdentifier];
  id v6 = [v5 permanentAssetID];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = [(BKBasePresentingViewController *)self assetViewController];
    objc_super v10 = [v9 asset];
    id v8 = [v10 assetID];
  }
  if ([v8 length])
  {
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000A05D8;
    v14[3] = &unk_100A44120;
    id v15 = v8;
    id v16 = v4;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v14);
  }
  else
  {
    id v12 = objc_retainBlock(v4);
    id v13 = v12;
    if (v12) {
      (*((void (**)(id))v12 + 2))(v12);
    }
  }
}

- (void)_finalizeAssetVCState
{
  objc_super v3 = [(BKBasePresentingViewController *)self assetViewController];

  if (v3)
  {
    if ([(BKBasePresentingViewController *)self assetState] < 3)
    {
      if (![(BKBasePresentingViewController *)self willTerminate]) {
        [(BKBasePresentingViewController *)self _updateLastOpenBookWithAssetID:0];
      }
      id v4 = [(BKBasePresentingViewController *)self assetViewController];
      [v4 saveStateClosing:1];

      unsigned int v5 = [(BKBasePresentingViewController *)self assetViewController];
      [v5 close:0];

      [(BKBasePresentingViewController *)self setAssetState:3];
      [(BCReadingStatisticsController *)self->_readingStatisticsController removeObserver:self];
      readingStatisticsController = self->_readingStatisticsController;
      self->_readingStatisticsController = 0;
    }
    id v7 = [(BKBasePresentingViewController *)self assetIdentifier];
    id v16 = [v7 permanentAssetID];

    if ([(BKBasePresentingViewController *)self assetState] <= 3)
    {
      id v8 = [(BKBasePresentingViewController *)self minifiedPresenter];
      [v8 minifiedPresenterDidCloseAssetID:v16 finishedConsuming:[self finishedConsuming]];

      uint64_t v9 = [(BKBasePresentingViewController *)self assetViewController];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        dispatch_time_t v11 = [(BKBasePresentingViewController *)self assetViewController];
        [v11 assetViewControllerDidCloseAnimated:0];
      }
      [(BKBasePresentingViewController *)self setAssetState:4];
      [(BKBasePresentingViewController *)self _clearCacheForBook:0];
      id v12 = [(BKBasePresentingViewController *)self libraryAssetProvider];
      id v13 = [(BKBasePresentingViewController *)self libraryAssetProvider];
      id v14 = [(BKBasePresentingViewController *)self assetIdentifier];
      id v15 = [v13 libraryAssetOnMainQueueWithAssetIdentifier:v14];
      [v12 didCloseLibraryAsset:v15];
    }
    [(BKBasePresentingViewController *)self setSampleToPurchasedMonitor:0];
    [(BKBasePresentingViewController *)self setImportInPlaceMonitor:0];
  }
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)BKBasePresentingViewController;
  [(BKBasePresentingViewController *)&v28 viewDidLoad];
  objc_super v3 = [(BKBasePresentingViewController *)self assetViewController];

  if (!v3)
  {
    id v4 = [(BKBasePresentingViewController *)self view];
    [v4 setOpaque:0];
  }
  unsigned int v5 = [(BKBasePresentingViewController *)self assetViewController];

  if (v5)
  {
    id v6 = [(BKBasePresentingViewController *)self transitioningViewController];
    uint64_t v7 = [(BKBasePresentingViewController *)self assetViewController];
LABEL_7:
    uint64_t v9 = (void *)v7;
    [v6 setContentViewController:v7];

    goto LABEL_8;
  }
  id v8 = [(BKBasePresentingViewController *)self placeholderViewController];

  if (v8)
  {
    id v6 = [(BKBasePresentingViewController *)self transitioningViewController];
    uint64_t v7 = [(BKBasePresentingViewController *)self placeholderViewController];
    goto LABEL_7;
  }
LABEL_8:
  char v10 = [(BKBasePresentingViewController *)self transitioningViewController];
  dispatch_time_t v11 = [v10 view];
  [v11 setAutoresizingMask:18];

  id v12 = [(BKBasePresentingViewController *)self transitioningViewController];
  [(BKBasePresentingViewController *)self addChildViewController:v12];

  id v13 = [(BKBasePresentingViewController *)self view];
  id v14 = [(BKBasePresentingViewController *)self transitioningViewController];
  id v15 = [v14 view];
  [v13 addSubview:v15];

  id v16 = [(BKBasePresentingViewController *)self view];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  v25 = [(BKBasePresentingViewController *)self transitioningViewController];
  v26 = [v25 view];
  [v26 setFrame:v18, v20, v22, v24];

  v27 = [(BKBasePresentingViewController *)self transitioningViewController];
  [v27 didMoveToParentViewController:self];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKBasePresentingViewController;
  id v4 = a3;
  [(BKBasePresentingViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  [v4 preferredContentSize];
  double v6 = v5;
  double v8 = v7;

  -[BKBasePresentingViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (id)childViewControllerForStatusBarStyle
{
  v2 = [(BKBasePresentingViewController *)self transitioningViewController];
  objc_super v3 = [v2 childViewControllerForStatusBarStyle];

  return v3;
}

- (id)childViewControllerForStatusBarHidden
{
  objc_super v3 = [(BKBasePresentingViewController *)self assetViewController];
  id v4 = [v3 contentOpenAnimator];
  double v5 = BUProtocolCast();

  double v6 = [(BKBasePresentingViewController *)self assetViewController];
  double v7 = 0;
  if (v6 && !v5)
  {
    double v8 = [(BKBasePresentingViewController *)self transitioningViewController];
    double v7 = [v8 childViewControllerForStatusBarHidden];
  }

  return v7;
}

- (BOOL)prefersStatusBarHidden
{
  v2 = [(BKBasePresentingViewController *)self assetViewController];
  objc_super v3 = [v2 contentOpenAnimator];
  id v4 = BUProtocolCast();

  LOBYTE(v2) = [v4 statusBarHidden];
  return (char)v2;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  v2 = [(BKBasePresentingViewController *)self transitioningViewController];
  objc_super v3 = [v2 childViewControllerForHomeIndicatorAutoHidden];

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_100B1D4E0 == a6)
  {
    if ([(BKBasePresentingViewController *)self autoDownload]
      && [(BKLibraryDownloadStatus *)self->_progressStatus state] == (id)4)
    {
      id v13 = [(BKBasePresentingViewController *)self downloadProgressBlock];
      if (v13)
      {
        [(BKLibraryDownloadStatus *)self->_progressStatus progressValue];
        v13[2](v13, 0);
      }
    }
    [(BKBasePresentingViewController *)self _updateBuyButtonProgressIfNeeded];
  }
  else if (off_100B1D4E8 == a6)
  {
    objc_opt_class();
    id v14 = BUDynamicCast();
    id v15 = [(BKBasePresentingViewController *)self assetIdentifier];
    id v16 = [v15 permanentAssetID];

    double v17 = [v14 assetID];
    unsigned int v18 = [v17 isEqualToString:v16];

    if (v18)
    {
      [(BKBasePresentingViewController *)self _updateBuyButtonProgressIfNeeded];
      [(BKBasePresentingViewController *)self _updateAssetStateAndDownloadStatus:v14];
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)BKBasePresentingViewController;
    [(BKBasePresentingViewController *)&v19 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)setProgressStatus:(id)a3
{
  double v5 = (BKLibraryDownloadStatus *)a3;
  p_progressStatus = &self->_progressStatus;
  progressStatus = self->_progressStatus;
  double v8 = v5;
  if (progressStatus != v5)
  {
    if (progressStatus)
    {
      [(BKLibraryDownloadStatus *)progressStatus removeObserver:self forKeyPath:@"progressValue" context:off_100B1D4E0];
      [(BKLibraryDownloadStatus *)*p_progressStatus removeObserver:self forKeyPath:@"state" context:off_100B1D4E8];
    }
    objc_storeStrong((id *)&self->_progressStatus, a3);
    [(BKBasePresentingViewController *)self _updateBuyButtonProgressIfNeeded];
    if (*p_progressStatus)
    {
      [(BKLibraryDownloadStatus *)*p_progressStatus addObserver:self forKeyPath:@"progressValue" options:0 context:off_100B1D4E0];
      [(BKLibraryDownloadStatus *)*p_progressStatus addObserver:self forKeyPath:@"state" options:0 context:off_100B1D4E8];
    }
  }
}

- (void)_updateLibraryAssetFromMetadataWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(BKBasePresentingViewController *)self assetViewController];
  if (objc_opt_respondsToSelector())
  {
    objc_super v9 = [(BKBasePresentingViewController *)self assetViewController];
    uint64_t v10 = (uint64_t)[v9 pageCountIncludingUpsell];
  }
  else
  {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  objc_initWeak(&location, self);
  id v11 = +[NSFileAccessIntent readingIntentWithURL:v6 options:1];
  id v12 = [v11 URL];
  BOOL v13 = v12 == 0;

  if (v13)
  {
    double v17 = BCIMLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1007E78CC();
    }

    id v18 = objc_retainBlock(v7);
    objc_super v19 = v18;
    if (v18) {
      (*((void (**)(id))v18 + 2))(v18);
    }
  }
  else
  {
    id v14 = objc_opt_new();
    v26 = v11;
    id v15 = +[NSArray arrayWithObjects:&v26 count:1];
    id v16 = objc_opt_new();
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000A11F8;
    v20[3] = &unk_100A444D0;
    objc_copyWeak(v24, &location);
    id v21 = v6;
    double v22 = self;
    v24[1] = (id)v10;
    id v23 = v7;
    [v14 coordinateAccessWithIntents:v15 queue:v16 byAccessor:v20];

    objc_destroyWeak(v24);
  }

  objc_destroyWeak(&location);
}

- (void)_willOpenBookAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_deferredURLOpenRequests)
  {
    double v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deferredURLOpenRequests = self->_deferredURLOpenRequests;
    self->_deferredURLOpenRequests = v5;
  }
  id v7 = [(BKBasePresentingViewController *)self assetIdentifier];
  id v32 = [v7 permanentOrTemporaryAssetID];

  double v8 = +[BEDocumentExternalLoadApprovalCache sharedInstance];
  [v8 removeCachedDisapprovalForBookID:v32];

  objc_super v9 = [(BKBasePresentingViewController *)self libraryAssetProvider];
  uint64_t v10 = [v9 uiChildContext];

  id v11 = [(BKBasePresentingViewController *)self libraryAssetProvider];
  id v12 = [v11 libraryMutableAssetWithPermanentOrTemporaryAssetID:v32 inManagedObjectContext:v10];

  [v10 refreshObject:v12 mergeChanges:1];
  BOOL v13 = +[BKUserActivityManager sharedInstance];
  [v13 startReadingAsset:v12];

  [(BKBasePresentingViewController *)self subscribeToFullScreenEvents];
  objc_opt_class();
  id v14 = [(BKBasePresentingViewController *)self openOptions];
  id v15 = [v14 objectForKeyedSubscript:@"BKAssetPresentingOpenLocationKey"];
  id v16 = BUDynamicCast();

  [(BKBasePresentingViewController *)self setAssetState:1];
  -[BKBasePresentingViewController setAssetPresenterIsSupplementalContent:](self, "setAssetPresenterIsSupplementalContent:", [v12 isSupplementalContent]);
  double v17 = [[BKAssetPresentingFilePresenter alloc] initWithViewController:self];
  [(BKBasePresentingViewController *)self setFilePresenter:v17];

  if ([v32 length]) {
    [(BKBasePresentingViewController *)self _trackProgressForLibraryAsset:v12];
  }
  id v18 = [(BKBasePresentingViewController *)self assetViewController];
  objc_super v19 = [v18 assetViewControllerDelegate];

  if (!v19)
  {
    double v20 = [(BKBasePresentingViewController *)self assetViewController];
    [v20 setAssetViewControllerDelegate:self];
  }
  id v21 = [(BKBasePresentingViewController *)self assetViewController];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    objc_opt_class();
    id v23 = [(BKBasePresentingViewController *)self openOptions];
    double v24 = [v23 objectForKeyedSubscript:AEHelperNumberIsPreorderKey];
    v25 = BUDynamicCast();

    v26 = [(BKBasePresentingViewController *)self assetViewController];
    [v26 setAssetIsPreordered:v25];
  }
  v27 = [(BKBasePresentingViewController *)self assetViewController];
  char v28 = objc_opt_respondsToSelector();

  if (v28)
  {
    id v29 = [(BKBasePresentingViewController *)self assetViewController];
    [v29 assetViewControllerWillOpen];
  }
  v30 = [(BKBasePresentingViewController *)self assetViewController];
  uint64_t v31 = v30;
  if (v16) {
    [v30 openToLocation:v16 animated:v3];
  }
  else {
    [v30 open:v3];
  }
}

- (void)transitionContextWillCompleteTransitionInContainerView:(id)a3
{
  id v29 = a3;
  id v4 = [(BKBasePresentingViewController *)self assetViewController];
  double v5 = [v4 view];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  [v29 bounds];
  v32.origin.x = v7;
  v32.origin.y = v9;
  v32.size.width = v11;
  v32.size.height = v13;
  if (!CGRectEqualToRect(v31, v32))
  {
    id v14 = objc_alloc_init((Class)IMViewControllerNullAnimationTransitionCoordinator);
    [v14 setContainerView:v29];
    id v15 = [(BKBasePresentingViewController *)self assetViewController];
    [v29 bounds];
    [v15 viewWillTransitionToSize:v14 withTransitionCoordinator:v16, v17];

    [v29 bounds];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    v26 = [(BKBasePresentingViewController *)self assetViewController];
    v27 = [v26 view];
    [v27 setFrame:v19, v21, v23, v25];

    [v14 _runAlongsideAnimations];
    [v14 _runAlongsideCompletionsAfterCommit];
  }
  char v28 = [(BKBasePresentingViewController *)self assetViewController];
  [v28 assetViewControllerUpdateToolbarsAfterOpenAnimation];
}

- (void)transitionContextNeedsSetup
{
  id v2 = [(BKBasePresentingViewController *)self assetViewController];
  [v2 assetViewControllerUpdateToolbarsForOpenAnimation];
}

- (void)willAddViewToHierarchy
{
  BOOL v3 = [(BKBasePresentingViewController *)self assetViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(BKBasePresentingViewController *)self assetViewController];
    [v5 assetViewControllerWillAddView];
  }
}

- (void)_didOpenBookAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BKBasePresentingViewController *)self assetIdentifier];
  double v6 = [v5 permanentAssetID];

  CGFloat v7 = [(BKBasePresentingViewController *)self libraryAssetProvider];
  uint64_t v8 = +[NSDate date];
  [v7 updateLibraryAssetWithID:v6 withLastOpenDate:v8 completion:0];

  [(BKBasePresentingViewController *)self setAssetState:2];
  CGFloat v9 = [(BKBasePresentingViewController *)self assetViewController];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    double v10 = [(BKBasePresentingViewController *)self assetViewController];
    [v10 assetViewControllerDidOpenAnimated:v3];
  }
  CGFloat v11 = [(BKBasePresentingViewController *)self minifiedPresenter];
  [v11 minifiedPresenterDidOpenAssetID:v6];

  [(BKBasePresentingViewController *)self setNeedsWhitePointAdaptivityStyleUpdate];
  double v12 = [(BKBasePresentingViewController *)self libraryAssetProvider];
  CGFloat v13 = [v12 libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:v6];

  if ([v13 isSample])
  {
    objc_initWeak(&location, self);
    id v14 = [BKSampleToPurchaseMonitor alloc];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000A1E68;
    v27[3] = &unk_100A444F8;
    objc_copyWeak(&v28, &location);
    id v15 = [(BKSampleToPurchaseMonitor *)v14 initWithAssetID:v6 notify:v27];
    [(BKBasePresentingViewController *)self setSampleToPurchasedMonitor:v15];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  [(BKBasePresentingViewController *)self _sendDeferredURLOpenRequests];
  if ([(BKBasePresentingViewController *)self needToForcePagination])
  {
    [(BKBasePresentingViewController *)self setNeedToForcePagination:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A1EC8;
    block[3] = &unk_100A43D60;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  double v16 = [(BKBasePresentingViewController *)self assetViewController];
  double v17 = BUProtocolCast();

  if (v17)
  {
    double v18 = [(BKBasePresentingViewController *)self upSellData];

    if (v18)
    {
      double v19 = [(BKBasePresentingViewController *)self upSellData];
      [v17 setUpSellData:v19];
    }
    double v20 = [(BKBasePresentingViewController *)self appAnalyticsAdditionalData];

    if (v20)
    {
      double v21 = [(BKBasePresentingViewController *)self appAnalyticsAdditionalData];
      [v17 setAppAnalyticsAdditionalData:v21];
    }
  }
  double v22 = +[NSNotificationCenter defaultCenter];
  [v22 postNotificationName:@"BKAssetPresentingBookOpenComplete" object:0];

  [(BKBasePresentingViewController *)self bkaxSetUpAccessibilityForPresentedBook];
  if (+[BKUIPFeatures useUIPFluidBookOpenTransition]
    && ![(BKBasePresentingViewController *)self useLegacyAnimation])
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v25, &location);
    double v23 = [(BKBasePresentingViewController *)self _preferredTransition];
    [v23 set_interactiveDismissShouldBeginHandler:&v24];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController viewWillAppear:](&v18, "viewWillAppear:");
  id v5 = [(BKBasePresentingViewController *)self ba_analyticsTracker];

  if (!v5) {
    id v6 = [(BKBasePresentingViewController *)self ba_setupNewAnalyticsTrackerWithName:@"ContentReading"];
  }
  CGFloat v7 = [(BKBasePresentingViewController *)self bc_windowForViewController];
  uint64_t v8 = [v7 rootViewController];

  if (([v8 isPerformingModalTransition] & 1) == 0)
  {
    CGFloat v9 = [(BKBasePresentingViewController *)self navigationController];
    -[BKBasePresentingViewController setShouldRestoreNavBar:](self, "setShouldRestoreNavBar:", [v9 isNavigationBarHidden] ^ 1);
  }
  if ([(BKBasePresentingViewController *)self stateShouldOpen])
  {
    double v10 = [(BKBasePresentingViewController *)self assetViewController];

    if (v10)
    {
      [(BKBasePresentingViewController *)self _startBookSuccessfullyOpenedTimer];
      CGFloat v11 = [(BKBasePresentingViewController *)self assetViewController];
      double v12 = [v11 asset];
      CGFloat v13 = [v12 url];

      if (v13)
      {
        objc_initWeak(&location, self);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1000A21F0;
        v14[3] = &unk_100A44548;
        objc_copyWeak(&v15, &location);
        BOOL v16 = a3;
        [(BKBasePresentingViewController *)self _updateLibraryAssetFromMetadataWithURL:v13 completion:v14];
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  uint64_t v8 = BCCurrentBookLiveResizeLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    CGFloat v9 = +[NSNumber numberWithBool:[(BKBasePresentingViewController *)self enteringFullScreen]];
    double v10 = +[NSNumber numberWithBool:[(BKBasePresentingViewController *)self inFullScreen]];
    CGFloat v11 = +[NSNumber numberWithBool:[(BKBasePresentingViewController *)self exitingFullScreen]];
    *(double *)double v21 = width;
    *(double *)&v21[1] = height;
    double v12 = +[NSValue valueWithBytes:v21 objCType:"{CGSize=dd}"];
    CGFloat v13 = [(BKBasePresentingViewController *)self view];
    [v13 bounds];
    v20[0] = v14;
    v20[1] = v15;
    BOOL v16 = +[NSValue valueWithBytes:v20 objCType:"{CGSize=dd}"];
    *(_DWORD *)buf = 138413314;
    double v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    v27 = v11;
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2112;
    CGRect v31 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "viewWillTransitionToSize enteringFullScreen:%@ exitingFullScreen:%@ inFullScreen:%@ size:%@ viewSize:%@", buf, 0x34u);
  }
  v19.receiver = self;
  v19.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v19, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  [(BKBasePresentingViewController *)self setStateFlags:[(BKBasePresentingViewController *)self stateFlags] | 0x40];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000A2500;
  v18[3] = &unk_100A44570;
  v18[4] = self;
  *(double *)&v18[5] = width;
  *(double *)&v18[6] = height;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000A2794;
  v17[3] = &unk_100A44570;
  v17[4] = self;
  *(double *)&v17[5] = width;
  *(double *)&v17[6] = height;
  [v7 animateAlongsideTransition:v18 completion:v17];
}

- (void)_waitForOngoingMigrationAttemptToFinish:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  if ([v5 isSupplementalContent]) {
    BOOL v7 = [v5 contentType] == 3;
  }
  else {
    BOOL v7 = 0;
  }
  if ([v5 isStore] && !v7
    || ([v5 permlink], uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    id v9 = objc_retainBlock(v6);
    double v10 = v9;
    if (v9) {
      (*((void (**)(id))v9 + 2))(v9);
    }
  }
  else
  {
    objc_opt_class();
    CGFloat v11 = +[BKAppDelegate delegate];
    double v10 = BUDynamicCast();

    double v12 = [v10 ubiquitousDocumentsController];
    CGFloat v13 = [v5 assetID];
    uint64_t v14 = [v5 temporaryAssetID];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000A2AB4;
    v15[3] = &unk_100A442B8;
    id v16 = v6;
    [v12 waitForOngoingMigrationAttemptToFinishWithAssetID:v13 temporaryAssetID:v14 completion:v15];
  }
}

- (void)_loadAssetVC
{
  BOOL v3 = sub_10009F878();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(BKBasePresentingViewController *)self assetIdentifier];
    id v5 = [v4 permanentOrTemporaryAssetID];
    id v6 = [(BKBasePresentingViewController *)self loadAssetBlock];
    id v7 = objc_retainBlock(v6);
    *(_DWORD *)buf = 141558530;
    uint64_t v15 = 1752392040;
    __int16 v16 = 2112;
    double v17 = v5;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] _loadAssetVC - localAssetBlock=%@", buf, 0x20u);
  }
  uint64_t v8 = [(BKBasePresentingViewController *)self loadAssetBlock];

  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000A2D48;
    v13[3] = &unk_100A44598;
    v13[4] = self;
    id v9 = objc_retainBlock(v13);
    double v10 = [(BKBasePresentingViewController *)self loadAssetBlock];
    ((void (**)(void, void *))v10)[2](v10, v9);
  }
  else
  {
    id v9 = [(BKBasePresentingViewController *)self assetIdentifier];
    double v10 = [(BKBasePresentingViewController *)self openOptions];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A2D90;
    v12[3] = &unk_100A44598;
    v12[4] = self;
    CGFloat v11 = +[BKAssetLookup assetLookupWithIdentifier:v9 options:v10 completion:v12];
    [(BKBasePresentingViewController *)self setAssetLookup:v11];
  }
}

- (void)loadWithAssetWithBlock:(id)a3
{
}

- (void)_loadWithAssetViewController:(id)a3 helper:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  uint64_t v8 = sub_10009F878();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(BKBasePresentingViewController *)self assetIdentifier];
    double v10 = [v9 permanentOrTemporaryAssetID];
    *(_DWORD *)buf = 141558786;
    uint64_t v39 = 1752392040;
    __int16 v40 = 2112;
    v41 = v10;
    __int16 v42 = 2112;
    id v43 = v6;
    __int16 v44 = 2112;
    id v45 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] _loadWithAssetViewController - assetVC=%@, helper=%@", buf, 0x2Au);
  }
  if (v6 && v7)
  {
    CGFloat v11 = [(BKBasePresentingViewController *)self placeholderViewController];
    if (objc_opt_respondsToSelector())
    {
      double v12 = [(BKBasePresentingViewController *)self placeholderViewController];
      CGFloat v13 = [v12 coverAnimationHostTopViewsToFadeOut];
    }
    else
    {
      CGFloat v13 = 0;
    }

    uint64_t v15 = [(BKBasePresentingViewController *)self placeholderViewController];
    __int16 v16 = [(BKBasePresentingViewController *)self assetIdentifier];
    double v17 = [v16 permanentOrTemporaryAssetID];
    __int16 v18 = [v15 coverAnimationHostSourceForItem:v17];

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000A31CC;
    v34[3] = &unk_100A44610;
    v34[4] = self;
    id v35 = v6;
    id v36 = v7;
    id v19 = v18;
    id v37 = v19;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000A372C;
    v32[3] = &unk_100A44120;
    v32[4] = self;
    double v20 = objc_retainBlock(v34);
    id v33 = v20;
    double v21 = objc_retainBlock(v32);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000A37F4;
    v29[3] = &unk_100A44120;
    id v14 = v13;
    id v30 = v14;
    double v22 = v21;
    id v31 = v22;
    double v23 = objc_retainBlock(v29);
    __int16 v24 = [(BKBasePresentingViewController *)self holdAnimationAssertion];
    id v25 = v24;
    if (v24)
    {
      __int16 v26 = [v24 future];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000A3A28;
      v27[3] = &unk_100A44660;
      __int16 v28 = v23;
      [v26 get:v27];
    }
    else
    {
      ((void (*)(void *))v23[2])(v23);
    }
  }
  else
  {
    id v14 = [(BKBasePresentingViewController *)self presentingViewController];
    [v14 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController viewDidAppear:](&v50, "viewDidAppear:");
  [(BKBasePresentingViewController *)self subscribeToLiveResize];
  if ([(BKBasePresentingViewController *)self stateShouldOpen])
  {
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = sub_100006F54;
    v48[4] = sub_100007194;
    id v5 = self;
    v49 = v5;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000A4070;
    v47[3] = &unk_100A446B0;
    v47[4] = v48;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000A4350;
    v44[3] = &unk_100A44700;
    v46 = v48;
    id v6 = objc_retainBlock(v47);
    id v45 = v6;
    id v7 = objc_retainBlock(v44);
    uint64_t v8 = [(BKBasePresentingViewController *)v5 libraryAssetProvider];
    id v9 = [(BKBasePresentingViewController *)v5 assetIdentifier];
    double v10 = [v8 libraryAssetOnMainQueueWithAssetIdentifier:v9];

    CGFloat v11 = sub_10009F878();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = [(BKBasePresentingViewController *)v5 assetIdentifier];
      *(_DWORD *)buf = 141558530;
      uint64_t v52 = 1752392040;
      __int16 v53 = 2112;
      v54 = v12;
      __int16 v55 = 2112;
      v56 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] libraryAsset: %@", buf, 0x20u);
    }
    CGFloat v13 = [(BKBasePresentingViewController *)v5 parentViewController];

    if (v13) {
      [(BKBasePresentingViewController *)v5 setStateShouldOpen:0];
    }
    id v14 = [(BKBasePresentingViewController *)v5 assetViewController];

    if (v14)
    {
      [(BKBasePresentingViewController *)v5 _didOpenBookAnimated:v3];
    }
    else if ([(BKBasePresentingViewController *)v5 autoOpen] {
           && (([v10 isLocal] & 1) != 0 || objc_msgSend(v10, "streamable")))
    }
    {
      if ([v10 isLocal]) {
        id v25 = v7;
      }
      else {
        id v25 = v6;
      }
      ((void (*)(void *, void *))v25[2])(v25, v10);
    }
    else if ([(BKBasePresentingViewController *)v5 autoDownload])
    {
      objc_initWeak(&location, v5);
      [(BKBasePresentingViewController *)v5 setStateFlags:[(BKBasePresentingViewController *)v5 stateFlags] | 8];
      __int16 v26 = [(BKBasePresentingViewController *)v5 assetIdentifier];
      v27 = [v26 permanentOrTemporaryAssetID];

      __int16 v28 = +[BKLibraryAssetStatusController sharedController];
      id v29 = [v28 statusForAssetID:v27];
      [(BKBasePresentingViewController *)v5 setProgressStatus:v29];

      id v30 = [(BKBasePresentingViewController *)v5 progressStatus];
      double v31 = 0.0;
      if ([v30 state] == (id)4)
      {
        CGRect v32 = [(BKBasePresentingViewController *)v5 progressStatus];
        [v32 progressValue];
        double v31 = v33;
      }
      uint64_t v34 = [(BKBasePresentingViewController *)v5 downloadProgressBlock];
      id v35 = (void *)v34;
      if (v34) {
        (*(void (**)(uint64_t, void, double))(v34 + 16))(v34, 0, v31);
      }

      id v36 = sub_10009F878();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 141558274;
        uint64_t v52 = 1752392040;
        __int16 v53 = 2112;
        v54 = v27;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] Attempt to resolve to local", buf, 0x16u);
      }

      id v37 = [(BKBasePresentingViewController *)v5 libraryAssetProvider];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000A4A38;
      v39[3] = &unk_100A44750;
      id v38 = v27;
      id v40 = v38;
      objc_copyWeak(&v42, &location);
      v41 = v7;
      [v37 resolveToLocalAssetWithAssetID:v38 completion:v39];

      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
    }
    uint64_t v15 = +[UIDevice currentDevice];
    __int16 v16 = (char *)[v15 orientation];

    double v17 = [(BKBasePresentingViewController *)v5 bc_windowForViewController];
    __int16 v18 = [v17 windowScene];
    id v19 = (char *)[v18 interfaceOrientation];

    int v20 = isPhone();
    if ((unint64_t)(v16 - 3) < 2) {
      int v21 = v20;
    }
    else {
      int v21 = 0;
    }
    if (v21 == 1 && (unint64_t)(v19 - 1) <= 1) {
      +[UIViewController attemptRotationToDeviceOrientation];
    }
    double v22 = +[BKAppDelegate sceneManager];
    double v23 = [v22 primarySceneController];
    __int16 v24 = [v23 primaryScenePresenting];

    [v24 presenterDidStartReadingExperienceWithAssetPresenter:v5];
    _Block_object_dispose(v48, 8);
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController willMoveToParentViewController:](&v5, "willMoveToParentViewController:");
  [(BKBasePresentingViewController *)self setStateShouldClose:a3 == 0];
}

- (BKMinifiedPresenting)minifiedPresenter
{
  p_minifiedPresenter = &self->_minifiedPresenter;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_minifiedPresenter);

  if (!WeakRetained)
  {
    objc_super v5 = [(BKBasePresentingViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKMinifiedPresenting];
    objc_storeWeak((id *)p_minifiedPresenter, v5);
  }
  id v6 = objc_loadWeakRetained((id *)p_minifiedPresenter);

  return (BKMinifiedPresenting *)v6;
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKBasePresentingViewController;
  [(BKBasePresentingViewController *)&v4 didMoveToParentViewController:a3];
  [(BKBasePresentingViewController *)self setStateShouldClose:0];
}

- (void)viewWillMoveToWindow:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKBasePresentingViewController;
  [(BKBasePresentingViewController *)&v12 viewWillMoveToWindow:v4];
  objc_super v5 = [(BKBasePresentingViewController *)self assetViewController];

  if (v4 && v5)
  {
    id v6 = [(BKBasePresentingViewController *)self assetViewController];
    id v7 = [v6 asset];
    uint64_t v8 = [v7 displayTitle];
    id v9 = [v4 windowScene];
    [v9 setTitle:v8];

    double v10 = [(BKBasePresentingViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKSceneHosting];
    [v10 updateAllAssetPresenterCloseStateTypes];
  }
  CGFloat v11 = [(BKBasePresentingViewController *)self frontmostTracker];
  [v11 setWindow:v4];
}

- (void)_handleClosingCleanup:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKBasePresentingViewController *)self unsubscribeFromFullScreenEvents];
  objc_super v5 = [(BKBasePresentingViewController *)self sessionID];

  if (v5)
  {
    id v6 = BCBookPromotionLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CGFloat v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Ending reading session due to another asset being opened.", v11, 2u);
    }

    [(BKBasePresentingViewController *)self _endReadingSessionForEventType:2 withCompletion:0];
  }
  [(BKBasePresentingViewController *)self setAssetState:3];
  if (([(BKBasePresentingViewController *)self stateFlags] & 0x100) == 0)
  {
    id v7 = [(BKBasePresentingViewController *)self assetViewController];
    uint64_t v8 = BUProtocolCast();

    [v8 saveStateClosing:1];
  }
  id v9 = [(BKBasePresentingViewController *)self assetViewController];
  [v9 close:v3];

  if (![(BKBasePresentingViewController *)self willTerminate]) {
    [(BKBasePresentingViewController *)self _updateLastOpenBookWithAssetID:0];
  }
  [(BCReadingStatisticsController *)self->_readingStatisticsController removeObserver:self];
  readingStatisticsController = self->_readingStatisticsController;
  self->_readingStatisticsController = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController viewWillDisappear:](&v9, "viewWillDisappear:");
  [(BKBasePresentingViewController *)self unsubscribeToLiveResize];
  objc_super v5 = +[UIApplication sharedApplication];
  id v6 = [v5 keyWindow];
  id v7 = [v6 rootViewController];

  if ([(BKBasePresentingViewController *)self shouldRestoreNavBar]
    && ([v7 isPerformingModalTransition] & 1) == 0)
  {
    uint64_t v8 = [(BKBasePresentingViewController *)self navigationController];
    [v8 setNavigationBarHidden:0 animated:0];
  }
  if ([(BKBasePresentingViewController *)self stateShouldClose]
    && !+[BKUIPFeatures useUIPFluidBookOpenTransition])
  {
    [(BKBasePresentingViewController *)self _handleClosingCleanup:v3];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BKBasePresentingViewController;
  -[BKBasePresentingViewController viewDidDisappear:](&v30, "viewDidDisappear:");
  if ([(BKBasePresentingViewController *)self stateShouldClose]
    && ![(BKBasePresentingViewController *)self preparingEndOfBookExperience])
  {
    if (+[BKUIPFeatures useUIPFluidBookOpenTransition]) {
      [(BKBasePresentingViewController *)self _handleClosingCleanup:v3];
    }
    objc_super v5 = [(BKBasePresentingViewController *)self assetIdentifier];
    id v6 = [v5 permanentAssetID];

    id v7 = +[BCProgressKitController sharedController];
    [v7 didCloseBookWithAssetID:v6 completion:0];

    objc_opt_class();
    uint64_t v8 = [(BKBasePresentingViewController *)self openOptions];
    objc_super v9 = [v8 objectForKeyedSubscript:@"BKBookPresentingSecure"];
    double v10 = BUDynamicCast();
    unsigned int v11 = [v10 BOOLValue];

    if (v11)
    {
      objc_super v12 = [(BKBasePresentingViewController *)self assetViewController];
      CGFloat v13 = [v12 asset];
      id v14 = [v13 url];

      [v14 stopAccessingSecurityScopedResource];
    }
    uint64_t v15 = [(BKBasePresentingViewController *)self assetViewController];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      double v17 = [(BKBasePresentingViewController *)self assetViewController];
      [v17 assetViewControllerDidCloseAnimated:v3];
    }
    __int16 v18 = +[BKUserActivityManager sharedInstance];
    [v18 stopReadingCurrentAsset];

    id v19 = [(BKBasePresentingViewController *)self libraryAssetProvider];
    int v20 = [(BKBasePresentingViewController *)self libraryAssetProvider];
    int v21 = [(BKBasePresentingViewController *)self assetIdentifier];
    double v22 = [v20 libraryAssetOnMainQueueWithAssetIdentifier:v21];
    [v19 didCloseLibraryAsset:v22];

    if (([(BKBasePresentingViewController *)self stateFlags] & 0x80) != 0)
    {
      +[BKBasePresentingViewController clearLastKnownSuccessfullyOpenBookID];
      +[BKBasePresentingViewController clearLastKnownSuccessfullyOpenedCurrentBookID];
      [(BKBasePresentingViewController *)self setStateFlags:[(BKBasePresentingViewController *)self stateFlags] | 0xFFFFFFFFFFFFFF7FLL];
    }
    double v23 = [(BKBasePresentingViewController *)self minifiedPresenter];
    [v23 minifiedPresenterUpdateCurrentBookWithCompletion:0];

    __int16 v24 = [(BKBasePresentingViewController *)self minifiedPresenter];
    [v24 minifiedPresenterDidCloseAssetID:v6 finishedConsuming:[self finishedConsuming]];

    [(BKBasePresentingViewController *)self setAssetState:4];
    [(BKBasePresentingViewController *)self _clearCacheForBook:0];
    id v25 = +[NSNotificationCenter defaultCenter];
    [v25 postNotificationName:@"BKBookDidCloseNotificationName" object:self];

    [(BKBasePresentingViewController *)self setUpSellData:0];
    [(BKBasePresentingViewController *)self setAppAnalyticsAdditionalData:0];
    [(BKBasePresentingViewController *)self setStateShouldOpen:1];
    __int16 v26 = [(BKBasePresentingViewController *)self assetViewController];
    [v26 setAssetViewControllerDelegate:0];
  }
  v27 = +[BKAppDelegate sceneManager];
  __int16 v28 = [v27 primarySceneController];
  id v29 = [v28 primaryScenePresenting];

  [v29 presenterDidEndReadingExperienceWithAssetPresenter:self];
}

- (BOOL)im_tabBarVisible
{
  return 0;
}

- (void)setAssetViewController:(id)a3
{
  p_assetViewController = &self->_assetViewController;
  objc_storeStrong((id *)&self->_assetViewController, a3);
  id v6 = a3;
  id v7 = [(BKBasePresentingViewController *)self ba_analyticsTracker];
  [(AEAssetViewController *)*p_assetViewController ba_setAnalyticsTracker:v7];
}

- (void)ba_setAnalyticsTracker:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKBasePresentingViewController;
  id v4 = a3;
  [(BKBasePresentingViewController *)&v6 ba_setAnalyticsTracker:v4];
  objc_super v5 = [(BKBasePresentingViewController *)self assetViewController];
  [v5 ba_setAnalyticsTracker:v4];
}

- (unint64_t)supportedInterfaceOrientations
{
  BOOL v3 = [(BKBasePresentingViewController *)self assetViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___BCOrientationControlling];

  if (v4)
  {
    objc_super v5 = [(BKBasePresentingViewController *)self assetViewController];
LABEL_5:
    uint64_t v8 = v5;
    id v9 = [v5 supportedInterfaceOrientations];

    return (unint64_t)v9;
  }
  objc_super v6 = [(BKBasePresentingViewController *)self childModalViewController];
  unsigned int v7 = [v6 conformsToProtocol:&OBJC_PROTOCOL___BCOrientationControlling];

  if (v7)
  {
    objc_super v5 = [(BKBasePresentingViewController *)self childModalViewController];
    goto LABEL_5;
  }
  v11.receiver = self;
  v11.super_class = (Class)BKBasePresentingViewController;
  return [(BKBasePresentingViewController *)&v11 supportedInterfaceOrientations];
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  [(BKBasePresentingViewController *)self setIsResigningActive:0];
  id v4 = [(BKBasePresentingViewController *)self filePresenter];
  [v4 activate];
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  [(BKBasePresentingViewController *)self setIsResigningActive:1];
  id v4 = [(BKBasePresentingViewController *)self filePresenter];
  [v4 deactivate];

  objc_super v5 = [(BKBasePresentingViewController *)self assetIdentifier];
  id v7 = [v5 permanentAssetID];

  +[BKLibraryIndexer establishBackgroundTaskForProgressUpdateOfAsset:v7];
  objc_super v6 = [(BKBasePresentingViewController *)self assetViewController];
  [v6 saveStateClosing:0 suspending:1];
}

- (void)assetPresenterPrepareForTermination
{
  [(BKBasePresentingViewController *)self setWillTerminate:1];
  BOOL v3 = BCBookPromotionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Ending reading session due to termination.", v4, 2u);
  }

  [(BKBasePresentingViewController *)self _endReadingSessionForEventType:2 withCompletion:0];
}

- (void)_startInteractionTimer
{
  BOOL v3 = +[BCJSConfiguration sharedInstance];
  id v4 = [v3 timeThresholdForOpenEvent];
  id v5 = [v4 longLongValue];

  objc_super v6 = [(BKBasePresentingViewController *)self assetIdentifier];
  id v7 = [v6 permanentAssetID];

  uint64_t v8 = [(BKBasePresentingViewController *)self sessionID];
  if (v8)
  {
    id v9 = (void *)v8;
    unsigned int v10 = [(BKBasePresentingViewController *)self _shouldTrackReadingSession];

    if (v10)
    {
      objc_super v11 = [(BKBasePresentingViewController *)self confirmActiveTimer];

      if (!v11)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1000A5984;
        v13[3] = &unk_100A44778;
        id v14 = v7;
        objc_super v12 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v13 block:(double)(uint64_t)v5];
        [(BKBasePresentingViewController *)self setConfirmActiveTimer:v12];
      }
    }
  }
}

- (void)_cancelInteractionTimerIfNeeded
{
  BOOL v3 = [(BKBasePresentingViewController *)self confirmActiveTimer];
  [v3 invalidate];

  [(BKBasePresentingViewController *)self setConfirmActiveTimer:0];
}

- (void)_assetPresenterWillEnterForeground
{
  [(BKBasePresentingViewController *)self assetPresenterUpdateCloseTypeState];
  [(BKBasePresentingViewController *)self _refreshReadingState];
  BOOL v3 = [(BKBasePresentingViewController *)self assetViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(BKBasePresentingViewController *)self assetViewController];
    [v5 assetViewControllerWillEnterForeground];
  }
  if ([(BKBasePresentingViewController *)self successfullyOpened])
  {
    objc_super v6 = BCCurrentBookLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Book entered foreground, resuming existing reading session", v10, 2u);
    }

    [(BKBasePresentingViewController *)self _beginReadingSessionForEventType:4];
    [(BKBasePresentingViewController *)self _startInteractionTimer];
  }
  else
  {
    id v7 = [(BKBasePresentingViewController *)self assetViewController];

    if (v7)
    {
      uint64_t v8 = BCCurrentBookLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Book entered foreground with no current reading session yet.", buf, 2u);
      }

      id v9 = [(BKBasePresentingViewController *)self sessionID];

      if (v9) {
        BCReportAssertionFailureWithMessage();
      }
      [(BKBasePresentingViewController *)self _startBookSuccessfullyOpenedTimer];
    }
  }
}

- (void)_assetPresenterDidEnterBackground
{
  [(BKBasePresentingViewController *)self _cancelInteractionTimerIfNeeded];
  [(BKBasePresentingViewController *)self _cancelSuccessfullyOpenedTimerIfNeeded];
  if ([(BKBasePresentingViewController *)self _shouldTrackReadingSession])
  {
    BOOL v3 = BCBookPromotionLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ending reading session due to scene backgrounding.", v7, 2u);
    }

    [(BKBasePresentingViewController *)self _endReadingSessionForEventType:3 withCompletion:0];
  }
  char v4 = [(BKBasePresentingViewController *)self assetViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    objc_super v6 = [(BKBasePresentingViewController *)self assetViewController];
    [v6 assetViewControllerDidEnterBackground];
  }
}

- (void)_refreshReadingState
{
  BOOL v3 = [(BKBasePresentingViewController *)self assetViewController];
  char v4 = [v3 asset];
  char v5 = [v4 url];

  if (v5)
  {
    if ([v5 isFileURL]
      && (+[NSFileManager defaultManager],
          objc_super v6 = objc_claimAutoreleasedReturnValue(),
          [v5 path],
          id v7 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v8 = [v6 fileExistsAtPath:v7],
          v7,
          v6,
          (v8 & 1) == 0))
    {
      [(BKBasePresentingViewController *)self im_dismissAnimated:1];
    }
    else
    {
      id v9 = BCCurrentBookLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned int v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No file path - doing nothing in _refreshReadingState ", v10, 2u);
      }
    }
  }
}

+ (id)animatorForAsset:(id)a3 isCurrentBook:(BOOL)a4 opening:(BOOL)a5 largeCover:(BOOL)a6 skipZoom:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  unsigned int v10 = [a3 assetType];
  objc_super v11 = +[AEAudiobookPlugin associatedAssetType];
  unsigned int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    if (v9 && v8)
    {
      id v13 = [(BKBookOpenAnimator *)[BKAudiobookSlideOpenAnimator alloc] initOpening:1];
    }
    else
    {
      id v13 = [(BKBookOpenAnimator *)[BKAudiobookOpenAnimator alloc] initOpening:v9];
      [v13 setUseLegacyTiming:0];
    }
  }
  else
  {
    id v13 = [[BKBookBloomOpenAnimator alloc] initOpening:v9];
    objc_opt_class();
    id v14 = BUDynamicCast();
    [v14 setUseShadowEffects:1];
  }
  objc_opt_class();
  uint64_t v15 = BUDynamicCast();
  [v15 setSkipZoomPhase:v7];

  return v13;
}

+ (id)defaultAnimatorForOpening:(BOOL)a3 skipReveal:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [[BKBookBloomOpenAnimator alloc] initOpening:a3];
  [v5 setSkipReveal:v4];
  [v5 setUseShadowEffects:1];

  return v5;
}

- (void)_reloadAssetCloseViewController:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [BKSnapshotViewController alloc];
  objc_super v6 = [(BKBasePresentingViewController *)self assetViewController];
  BOOL v7 = [(BKSnapshotViewController *)v5 initWithViewController:v6];

  BOOL v8 = sub_10009F878();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [(BKBasePresentingViewController *)self assetIdentifier];
    unsigned int v10 = [v9 permanentOrTemporaryAssetID];
    objc_super v11 = +[NSNumber numberWithBool:v3];
    *(_DWORD *)buf = 141558530;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2112;
    __int16 v24 = v10;
    __int16 v25 = 2112;
    __int16 v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] _reloadAssetCloseViewController close:%@", buf, 0x20u);
  }
  unsigned int v12 = [(BKBasePresentingViewController *)self assetViewController];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = [(BKBasePresentingViewController *)self assetViewController];
    [v14 assetViewControllerPrepareForReload];
  }
  if (v3)
  {
    uint64_t v15 = [(BKBasePresentingViewController *)self assetViewController];
    [v15 close:0];

    char v16 = [(BKBasePresentingViewController *)self assetViewController];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      __int16 v18 = [(BKBasePresentingViewController *)self assetViewController];
      [v18 assetViewControllerDidCloseAnimated:0];
    }
  }
  id v19 = [(BKBasePresentingViewController *)self transitioningViewController];
  [v19 setContentViewController:v7];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_1000A61A0;
  v20[3] = &unk_100A43D60;
  void v20[4] = self;
  [(BKBasePresentingViewController *)self _clearCacheForBook:v20];
}

- (void)dismissLibraryBookCoverViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(BKBasePresentingViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKSceneHosting];
  objc_super v6 = [(BKBasePresentingViewController *)self _sceneControllerCurrentlyHostingAssetPresenter];
  [v7 handleCloseAssetForSceneController:v6 assetPresentingViewController:self animated:v4];
}

- (void)assetViewController:(id)a3 willOpen:(BOOL)a4
{
  id v12 = a3;
  id v5 = [(BKBasePresentingViewController *)self viewIfLoaded];
  objc_super v6 = [v5 window];

  if (v6)
  {
    id v7 = [v12 asset];
    BOOL v8 = [v7 displayTitle];
    BOOL v9 = [(BKBasePresentingViewController *)self viewIfLoaded];
    unsigned int v10 = [v9 window];
    objc_super v11 = [v10 windowScene];
    [v11 setTitle:v8];
  }
}

- (void)assetViewController:(id)a3 willClose:(BOOL)a4
{
  id v5 = [(BKBasePresentingViewController *)self assetIdentifier];
  id v15 = [v5 permanentAssetID];

  if ([v15 length])
  {
    objc_super v6 = +[NSSet setWithObject:v15];
    objc_opt_class();
    id v7 = +[UIApplication sharedApplication];
    BOOL v8 = [v7 delegate];
    BOOL v9 = BUDynamicCast();

    unsigned int v10 = [v9 libraryAssetIsNewManager];
    objc_super v11 = [v6 allObjects];
    [v10 resetIsNewForAssetIDs:v11];

    id v12 = [v9 libraryAssetIsNewManager];
    char v13 = [v6 allObjects];
    [v12 resetProgressHighWaterMarkForAssetIDs:v13];
  }
  id v14 = [(BKBasePresentingViewController *)self minifiedPresenter];
  [v14 minifiedPresenterWillCloseAsset];
}

- (double)_transitionDurationForLiveResizeOfViewController:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    if ([v3 animateLiveResizeTransitions]) {
      double v4 = 0.2;
    }
    else {
      double v4 = 0.0;
    }
  }
  else
  {
    double v4 = 0.2;
  }

  return v4;
}

- (void)_clearLiveResizeViews
{
  id v3 = [(BKBasePresentingViewController *)self liveResizeWrapperView];
  [v3 removeFromSuperview];

  [(BKBasePresentingViewController *)self setLiveResizeWrapperView:0];
  [(BKBasePresentingViewController *)self setScrimLiveResizeView:0];
  [(BKBasePresentingViewController *)self setScrimLiveResizeBlurView:0];

  [(BKBasePresentingViewController *)self setOverlayView:0];
}

- (void)assetViewController:(id)a3 attemptClose:(BOOL)a4
{
  id v5 = +[BKAppDelegate sceneManager];
  objc_super v6 = [v5 primarySceneController];
  id v7 = [v6 primaryScenePresenting];

  [v7 presenterUpdateReadingNowAssetVisibility:0 assetPresenter:self];
}

- (void)assetViewController:(id)a3 cancelledClose:(BOOL)a4
{
  id v5 = +[BKAppDelegate sceneManager];
  objc_super v6 = [v5 primarySceneController];
  id v7 = [v6 primaryScenePresenting];

  [v7 presenterUpdateReadingNowAssetVisibility:1 assetPresenter:self];
}

- (void)didFinishUpdateForAssetViewController:(id)a3
{
  if ([(BKBasePresentingViewController *)self inLiveResize]
    || ![(BKBasePresentingViewController *)self scrimAppliedForLiveResize])
  {
    id v12 = [(BKBasePresentingViewController *)self transitioningViewController];
    objc_super v11 = [v12 view];
    [v11 setAlpha:1.0];
  }
  else
  {
    [(BKBasePresentingViewController *)self setScrimAppliedForLiveResize:0];
    double v4 = BCCurrentBookLiveResizeLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1007E7D34(self);
    }

    id v5 = [(BKBasePresentingViewController *)self assetViewController];
    [(BKBasePresentingViewController *)self _transitionDurationForLiveResizeOfViewController:v5];
    if (v6 == 0.0
      || (double v7 = v6, [(BKBasePresentingViewController *)self enteringFullScreen])
      || [(BKBasePresentingViewController *)self exitingFullScreen])
    {
      BOOL v8 = [(BKBasePresentingViewController *)self liveResizeWrapperView];
      [v8 setAlpha:0.0];

      BOOL v9 = [(BKBasePresentingViewController *)self transitioningViewController];
      unsigned int v10 = [v9 view];
      [v10 setAlpha:1.0];

      [(BKBasePresentingViewController *)self _clearLiveResizeViews];
      if (objc_opt_respondsToSelector()) {
        [v5 assetViewControllerDidFinishUpdateForLiveResize];
      }
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000A7210;
      v15[3] = &unk_100A43D60;
      void v15[4] = self;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000A7290;
      v13[3] = &unk_100A447C8;
      void v13[4] = self;
      id v14 = v5;
      +[UIView animateWithDuration:v15 animations:v13 completion:v7];
    }
  }
}

- (BOOL)assetViewControllerIsCurrentBook:(id)a3
{
  id v3 = a3;
  double v4 = +[BKBasePresentingViewController lastKnownOpenedCurrentBookID];
  id v5 = [v3 asset];

  double v6 = [v5 assetID];
  unsigned __int8 v7 = [v6 isEqualToString:v4];

  return v7;
}

- (id)_sceneControllerCurrentlyHostingAssetPresenter
{
  id v3 = [(BKBasePresentingViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKSceneHosting];
  double v4 = [v3 sceneControllerForViewController:self];

  return v4;
}

- (BOOL)_isHostedInAuxiliaryScene
{
  id v3 = +[BKAppDelegate sceneManager];
  double v4 = [(BKBasePresentingViewController *)self _sceneControllerCurrentlyHostingAssetPresenter];
  id v5 = [v3 primarySceneController];
  BOOL v6 = v4 != v5;

  return v6;
}

- (id)_closeBarButtonTitle
{
  id v2 = [(BKBasePresentingViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKSceneHosting];
  if ([v2 closeTypeForForegroundedScene])
  {
    id v3 = 0;
  }
  else
  {
    double v4 = +[NSBundle mainBundle];
    id v3 = [v4 localizedStringForKey:@"Library" value:&stru_100A70340 table:0];
  }

  return v3;
}

- (BOOL)assetViewController:(id)a3 requestOpenURL:(id)a4 likelyUserInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  deferredURLOpenRequests = self->_deferredURLOpenRequests;
  if (deferredURLOpenRequests)
  {
    id v7 = a4;
    BOOL v8 = +[NSNumber numberWithBool:v5];
    [(NSMutableDictionary *)deferredURLOpenRequests setObject:v8 forKey:v7];
  }
  else
  {
    id v10 = a4;
    BOOL v8 = +[BKAppDelegate sceneManager];
    id v7 = [v8 sceneControllerForViewController:self];
    objc_super v11 = +[NSNumber numberWithBool:v5];
    id v12 = [v7 newShowURLTransaction];
    [v8 handleApplicationURL:v10 sourceApplication:@"__self__" annotation:0 likelyUserInitiated:v11 transaction:v12];
  }
  return 1;
}

- (BOOL)assetViewController:(id)a3 requestClose:(BOOL)a4 error:(id)a5
{
  return [(BKBasePresentingViewController *)self assetViewController:a3 requestClose:a4 finishedConsuming:0 error:a5 withErrorBlock:0];
}

- (BOOL)assetViewController:(id)a3 requestClose:(BOOL)a4 finishedConsuming:(BOOL)a5 error:(id)a6 withErrorBlock:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (v13) {
    [(BKBasePresentingViewController *)self setStateFlags:[(BKBasePresentingViewController *)self stateFlags] | 0x80];
  }
  [(BKBasePresentingViewController *)self setFinishedConsuming:v9];
  if ([v12 conformsToProtocol:&OBJC_PROTOCOL___AEAssetViewController])
  {
    [(BKBasePresentingViewController *)self setStateFlags:[(BKBasePresentingViewController *)self stateFlags] | 0x100];
    [v12 saveStateClosing:1];
  }
  if ([(BKBasePresentingViewController *)self stateFlags])
  {
    char v17 = BCCurrentBookLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v22 = 134217984;
      unint64_t v23 = [(BKBasePresentingViewController *)self stateFlags];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Asset requested to close but delaying it due to state: %ld", (uint8_t *)&v22, 0xCu);
    }

    [(BKBasePresentingViewController *)self setStateFlags:[(BKBasePresentingViewController *)self stateFlags] | 2];
    [(BKBasePresentingViewController *)self setErrorCloseBlock:v14];
  }
  else
  {
    id v15 = [(BKBasePresentingViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKSceneHosting];
    char v16 = [(BKBasePresentingViewController *)self _sceneControllerCurrentlyHostingAssetPresenter];
    if (v16)
    {
      [v15 handleCloseAssetForSceneController:v16 assetPresentingViewController:self animated:v10];
    }
    else
    {
      __int16 v18 = sub_10009F878();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Don't need to close asset view controller because it is already disconnected from its scene controller", (uint8_t *)&v22, 2u);
      }
    }
    id v19 = objc_retainBlock(v14);
    int v20 = v19;
    if (v19) {
      (*((void (**)(id))v19 + 2))(v19);
    }
  }
  return 1;
}

- (void)requestToBuy:(id)a3
{
  double v4 = [(BKBasePresentingViewController *)self _buyButton];
  [v4 setDisableInteraction:1];
  [v4 setModeState:2];
  BOOL v5 = [(BKBasePresentingViewController *)self assetViewController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A7900;
  v7[3] = &unk_100A43E90;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  [(BKBasePresentingViewController *)self assetViewControllerRequestToBuy:v5 completion:v7];
}

- (void)assetViewController:(id)a3 handleFamilyChangeError:(id)a4
{
  id v6 = a4;
  id v7 = +[BKAppDelegate sceneControllerForViewController:a3];
  id v11 = v7;
  if (!v7)
  {
    BCReportAssertionFailureWithMessage();
    id v7 = 0;
  }
  id v8 = [v7 newShowAssetTransaction];
  BOOL v9 = [(BKBasePresentingViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKBookPresenting];
  BOOL v10 = [(BKBasePresentingViewController *)self assetIdentifier];
  [v9 handleFamilyChangeErrorWithTransaction:v8 error:v6 assetIdentifier:v10];
}

- (void)assetViewControllerSignificantReadingLocationChange:(id)a3
{
  [a3 saveStateClosing:0];
  double v4 = [(BKBasePresentingViewController *)self assetIdentifier];
  id v13 = [v4 permanentAssetID];

  if ([v13 length])
  {
    BOOL v5 = +[NSSet setWithObject:v13];
    objc_opt_class();
    id v6 = +[UIApplication sharedApplication];
    id v7 = [v6 delegate];
    id v8 = BUDynamicCast();

    BOOL v9 = [v8 libraryAssetIsNewManager];
    BOOL v10 = [v5 allObjects];
    [v9 resetIsNewForAssetIDs:v10];

    id v11 = [v8 libraryAssetIsNewManager];
    id v12 = [v5 allObjects];
    [v11 resetProgressHighWaterMarkForAssetIDs:v12];
  }
}

- (void)assetViewController:(id)a3 assetPropertyChanged:(id)a4
{
  if (+[BKLibraryAsset hasBookReachedReadThreshold:a4])
  {
    if (([(BKBasePresentingViewController *)self stateFlags] & 0x10) == 0)
    {
      BOOL v5 = [(BKBasePresentingViewController *)self libraryAssetProvider];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000A7DA8;
      v6[3] = &unk_100A44840;
      v6[4] = self;
      [v5 performBlockOnWorkerQueue:v6];
    }
  }
}

- (id)assetViewControllerMinifiedBarButtonItem:(id)a3
{
  id v3 = [(BKBasePresentingViewController *)self minifiedPresenter];
  double v4 = [v3 minifiedPresenterBarButtonItem];

  return v4;
}

- (id)_fetchSampleProfileFuture
{
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  id v3 = [(BKBasePresentingViewController *)self sampleProfileFuture];
  if (![(BKBasePresentingViewController *)self didFetchProfile])
  {
    [(BKBasePresentingViewController *)self setDidFetchProfile:1];
    double v4 = [(BKBasePresentingViewController *)self assetIdentifier];
    BOOL v5 = [v4 permanentAssetID];

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A7FD8;
    v7[3] = &unk_100A447F0;
    id v8 = v3;
    [(BKBasePresentingViewController *)self _fetchProfileForStoreID:v5 completion:v7];
  }

  return v3;
}

- (id)assetViewControllerBuyButtonItem:(id)a3 isSample:(BOOL)a4 isPreorder:(BOOL)a5 storeID:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = v11;
  id v13 = 0;
  if (v8 && !a5)
  {
    if ([v11 length])
    {
      id v14 = [(BKBasePresentingViewController *)self buyButtonItem];

      if (!v14)
      {
        id v15 = [(BKBasePresentingViewController *)self _newBarButtonItemWithBuyButton];
        [(BKBasePresentingViewController *)self setBuyButtonItem:v15];

        char v16 = [(BKBasePresentingViewController *)self _buyButton];
        [v16 setModeState:0];
        [v16 addTarget:self action:"requestToBuy:" forControlEvents:64];
        [(BKBasePresentingViewController *)self setStoreID:v12];
        objc_initWeak(&location, self);
        char v17 = [(BKBasePresentingViewController *)self sampleProfileFuture];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        void v21[2] = sub_1000A82B0;
        v21[3] = &unk_100A44868;
        objc_copyWeak(&v23, &location);
        id v18 = v16;
        id v22 = v18;
        [v17 get:v21];

        id v19 = [(BKBasePresentingViewController *)self _fetchSampleProfileFuture];
        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);
      }
      id v13 = [(BKBasePresentingViewController *)self buyButtonItem];
    }
    else
    {
      id v13 = 0;
    }
  }

  return v13;
}

- (void)assetViewController:(id)a3 didShowContentWithCFIs:(id)a4
{
  id v5 = a4;
  id v6 = [(BKBasePresentingViewController *)self readingStatisticsController];
  [v6 cfisDidAppear:v5];
}

- (void)assetViewController:(id)a3 willHideContentWithCFIs:(id)a4
{
  id v5 = a4;
  id v6 = [(BKBasePresentingViewController *)self readingStatisticsController];
  [v6 cfisWillDisappear:v5];
}

- (void)setFinishedForAssetID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[BKAppDelegate delegate];
    id v6 = [v5 serviceCenter];
    id v7 = [v6 readingActivityService];

    [(BKBasePresentingViewController *)self libraryAssetProvider];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A85AC;
    v10[3] = &unk_100A44890;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = v4;
    id v13 = v7;
    id v14 = self;
    id v8 = v7;
    id v9 = v11;
    [v9 performBlockOnWorkerQueue:v10];
  }
}

- (void)assetViewController:(id)a3 setFinishedAndCloseForAssetID:(id)a4
{
  id v6 = a3;
  [(BKBasePresentingViewController *)self setFinishedForAssetID:a4];
  if (a4) {
    [(BKBasePresentingViewController *)self assetViewController:v6 requestClose:1 error:0];
  }
}

- (BOOL)needTextNodeCharacterCountsForOrdinal:(int64_t)a3
{
  id v4 = [(BKBasePresentingViewController *)self readingStatisticsController];
  LOBYTE(a3) = [v4 needTextNodeCharacterCountsForOrdinal:a3];

  return a3;
}

- (void)addTextNodeCharacterCounts:(id)a3 ordinal:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(BKBasePresentingViewController *)self readingStatisticsController];
  [v10 addTextNodeCharacterCounts:v9 ordinal:a4 completion:v8];
}

- (BOOL)needTOCEntriesForOrdinal:(int64_t)a3
{
  id v4 = [(BKBasePresentingViewController *)self readingStatisticsController];
  LOBYTE(a3) = [v4 needTOCEntriesForOrdinal:a3];

  return a3;
}

- (void)addTOCEntries:(id)a3 ordinal:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(BKBasePresentingViewController *)self readingStatisticsController];
  [v10 addTOCEntries:v9 ordinal:a4 completion:v8];

  [(BKBasePresentingViewController *)self setNeedToRebuildContextTree:1];
}

- (void)assetViewControllerPaginationCompletedForBook:(id)a3
{
  id v4 = [(BKBasePresentingViewController *)self assetIdentifier];
  id v5 = [v4 permanentAssetID];

  id v6 = +[BCProgressKitController sharedController];
  if (![v6 isTrackingAssetID:v5]) {
    goto LABEL_4;
  }
  unsigned int v7 = [(BKBasePresentingViewController *)self needToRebuildContextTree];

  if (v7)
  {
    [(BKBasePresentingViewController *)self setNeedToRebuildContextTree:0];
    id v8 = [(BKBasePresentingViewController *)self assetViewController];
    id v9 = BUProtocolCast();

    id v10 = [(BKBasePresentingViewController *)self readingStatisticsController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A8C1C;
    v11[3] = &unk_100A43DB0;
    id v12 = v9;
    id v6 = v9;
    [v10 tocCFIMapWithCompletion:v11];

LABEL_4:
  }
}

- (void)assetViewController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[BKAppDelegate sceneManager];
  id v13 = [v12 sceneControllerForViewController:v11];

  [v13 presentViewController:v10 animated:v6 completion:v9];
}

- (void)assetViewController:(id)a3 presentModalViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[BKAppDelegate sceneManager];
  id v10 = [v9 sceneControllerForViewController:v8];

  [v10 presentModalViewController:v7 animated:v5];
}

- (id)libraryButtonItemForViewController:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  id v7 = [(BKBasePresentingViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKSceneHosting];
  id v8 = [(BKBasePresentingViewController *)self _sceneControllerCurrentlyHostingAssetPresenter];
  if ([v7 closeTypeForSceneController:v8] == (id)3)
  {
    id v9 = [(BKBasePresentingViewController *)self _closeBarButtonTitle];
    if ([v9 length]) {
      id v10 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v9 style:2 target:v6 action:a4];
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v9 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:3 scale:17.0];
    id v11 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:2 scale:17.0];
    id v12 = +[UIImage systemImageNamed:@"chevron.backward"];
    id v13 = [v12 imageWithConfiguration:v9];
    id v14 = [v12 imageWithConfiguration:v11];
    id v10 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v13 landscapeImagePhone:v14 style:0 target:v6 action:a4];
    [v10 setLargeContentSizeImageInsets:42.0, 0.0, 0.0, 0.0];
    [v10 setWidth:32.0];
  }

  return v10;
}

- (BOOL)canUpdateLibraryBarButtonItem:(id)a3 withOldString:(id)a4
{
  if (!a3 || !a4) {
    return (a3 != 0) ^ (a4 != 0);
  }
  id v5 = a4;
  id v6 = [a3 title];
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  return v7 ^ 1;
}

- (BOOL)readingStatisticsEnabled
{
  id v2 = [(BKBasePresentingViewController *)self readingStatisticsController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)contextMenuWithAssetViewController:(id)a3 sourceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_1000A925C;
  char v16 = &unk_100A448B8;
  objc_copyWeak(&v19, &location);
  char v17 = self;
  id v8 = v7;
  id v18 = v8;
  id v9 = +[UIDeferredMenuElement elementWithUncachedProvider:&v13];
  int v21 = v9;
  id v10 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1, v13, v14, v15, v16, v17);
  id v11 = +[UIMenu menuWithTitle:&stru_100A70340 children:v10];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v11;
}

- (id)analyticsAssetPropertyProviderForAssetViewController:(id)a3 fromSourceView:(id)a4
{
  id v5 = a4;
  id v6 = +[BKContextMenuProvider sharedProvider];
  id v7 = [(BKBasePresentingViewController *)self dataModelWithSourceView:v5];

  id v8 = [v6 analyticsAssetPropertyProviderForDataModel:v7];

  return v8;
}

- (id)dataModelWithSourceView:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)BSUIContextActionDataAssetModel);
  id v6 = [(BKBasePresentingViewController *)self assetIdentifier];
  id v7 = [v6 permanentOrTemporaryAssetID];
  id v8 = [v5 initWithAdamID:v7];

  id v9 = [objc_alloc((Class)BSUIContextActionDataModel) initWithAssetModel:v8 sourceView:v4];

  return v9;
}

- (void)assetViewController:(id)a3 openSupplementalAssetWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = +[BKLibraryManager defaultManager];
  id v7 = [v6 libraryAssetOnMainQueueWithAssetIdentifier:v5];

  id v8 = objc_opt_new();
  id v9 = +[BKAppDelegate sceneManager];
  id v10 = [v9 sceneControllerForViewController:self];
  id v11 = [v10 newShowAssetTransaction];
  id v12 = [(BKBasePresentingViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKBookPresenting];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000A95F8;
  v17[3] = &unk_100A44908;
  id v18 = v11;
  id v19 = v8;
  id v20 = v7;
  int v21 = self;
  id v22 = v5;
  id v13 = v5;
  id v14 = v7;
  id v15 = v8;
  id v16 = v11;
  [v12 preflightShowAssetWithTransaction:v16 assetIdentifier:v13 completion:v17];
}

- (id)assetViewController:(id)a3 supplementalContentPickerForAssetWithPlaylistID:(id)a4
{
  return +[BKLibraryBookshelfController supplementalContentPDFPickerWithPlaylistID:a4 fromActionMenu:1];
}

- (BOOL)assetViewControllerIsPresentingSupplementalContent:(id)a3
{
  BOOL v3 = [(BKBasePresentingViewController *)self bc_contextualPresentedViewController];
  objc_opt_class();
  id v4 = BUDynamicCast();
  unsigned __int8 v5 = [v4 isSupplementalContent];

  return v5;
}

- (void)readingStatisticsDidChangeOnController:(id)a3 changes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = BCReadingStatisticsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134218242;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Reading statistics changed on controller %p changes=%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)timeTracker:(id)a3 didPromoteAsset:(id)a4 deletedFromWantToRead:(BOOL)a5
{
  BOOL v5 = a5;
  +[BKBasePresentingViewController _markBookAsCurrent:a4];
  if (v5)
  {
    id v7 = [(BKBasePresentingViewController *)self ba_effectiveAnalyticsTracker];
    int v8 = [(BKBasePresentingViewController *)self libraryAssetProvider];
    id v9 = [(BKBasePresentingViewController *)self assetIdentifier];
    __int16 v10 = [v8 libraryAssetOnMainQueueWithAssetIdentifier:v9];

    if (v10 && v7)
    {
      id v11 = +[BAUtilities contentTypeFromAssetType:](BAUtilities, "contentTypeFromAssetType:", (int)[v10 contentType]);
      id v12 = +[BAEventReporter sharedReporter];
      id v13 = [v10 assetID];
      [v12 emitRemoveFromWantListEventWithTracker:v7 contentID:v13 contentType:v11];
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000A9ADC;
  v17[3] = &unk_100A43D60;
  void v17[4] = self;
  id v14 = objc_retainBlock(v17);
  if (v14)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v14[2])(v14);
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000A9C4C;
      v15[3] = &unk_100A442B8;
      id v16 = v14;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
    }
  }
}

- (void)_confirmBookSuccessfullyOpened
{
  BOOL v3 = BCCurrentBookLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Book was confirmed successfully open.", buf, 2u);
  }

  id v4 = [(BKBasePresentingViewController *)self assetIdentifier];
  BOOL v5 = [v4 permanentAssetID];

  [(BKBasePresentingViewController *)self _updateLastOpenBookWithAssetID:v5];
  [(BKBasePresentingViewController *)self _maybeUpdateSuccessfullyOpenedCurrentBook:v5];
  [(BKBasePresentingViewController *)self setSuccessfullyOpened:1];
  if (![(BKBasePresentingViewController *)self isSupplementalContent])
  {
    id v6 = +[BKLastOpenBookManager sharedInstance];
    [v6 updateSuccessfullyOpenedBookForAssetID:v5 successfullyOpenedBook:1];
  }
  id v7 = +[UIApplication sharedApplication];
  id v8 = [v7 applicationState];

  id v9 = BCCurrentBookLog();
  __int16 v10 = v9;
  if (v8 == (id)2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1007E7E28((uint64_t)v5, v10);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Book was confirmed successfully open, start tracking.", v11, 2u);
    }

    [(BKBasePresentingViewController *)self _beginReadingSessionForEventType:0];
  }
}

- (void)_startBookSuccessfullyOpenedTimer
{
  BOOL v3 = BCCurrentBookLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Scheduling successfully opened timer", (uint8_t *)buf, 2u);
  }

  id v4 = +[BCJSConfiguration sharedInstance];
  BOOL v5 = [v4 timeThresholdForOpenEvent];
  id v6 = [v5 longLongValue];

  objc_initWeak(buf, self);
  [(BKBasePresentingViewController *)self _cancelSuccessfullyOpenedTimerIfNeeded];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A9F64;
  v8[3] = &unk_100A44950;
  objc_copyWeak(&v9, buf);
  id v7 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v8 block:(double)(uint64_t)v6];
  [(BKBasePresentingViewController *)self setSuccessfullyOpenedTimer:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (void)_cancelSuccessfullyOpenedTimerIfNeeded
{
  uint64_t v3 = [(BKBasePresentingViewController *)self successfullyOpenedTimer];
  if (v3)
  {
    id v4 = (void *)v3;
    BOOL v5 = [(BKBasePresentingViewController *)self successfullyOpenedTimer];
    unsigned int v6 = [v5 isValid];

    if (v6)
    {
      id v7 = BCCurrentBookLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Cancelling successfully opened timer", v9, 2u);
      }

      id v8 = [(BKBasePresentingViewController *)self successfullyOpenedTimer];
      [v8 invalidate];

      [(BKBasePresentingViewController *)self setSuccessfullyOpenedTimer:0];
    }
  }
}

+ (void)startingOpenOfMinifedCurrentBook:(id)a3
{
  id v3 = a3;
  id v4 = BCCurrentBookLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting open of book as minified & current %@.", (uint8_t *)&v7, 0xCu);
  }

  BOOL v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setBool:0 forKey:@"kSuccessfullyOpenedCurrentBook"];

  unsigned int v6 = +[NSUserDefaults standardUserDefaults];
  [v6 synchronize];
}

+ (void)_markBookAsCurrent:(id)a3
{
  id v3 = a3;
  id v4 = BCCurrentBookLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Marking book as current %@.", (uint8_t *)&v6, 0xCu);
  }

  BOOL v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setObject:v3 forKey:@"kLastCurrentBookKey"];
  [v5 setBool:1 forKey:@"kSuccessfullyOpenedCurrentBook"];
  [v5 synchronize];
}

+ (void)markCarPlayBackgroundBookAsCurrent:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setObject:v4 forKey:@"BKMainViewControllerLastBook"];
  [v5 setBool:1 forKey:@"BKMainViewControllerSuccessfullyOpenedBook"];
  [a1 _markBookAsCurrent:v4];
}

- (void)_maybeUpdateSuccessfullyOpenedCurrentBook:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 stringForKey:@"kLastCurrentBookKey"];
  if ([v5 isEqualToString:v3])
  {
    int v6 = BCCurrentBookLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Current book successfully opened %@.", (uint8_t *)&v7, 0xCu);
    }

    [v4 setBool:1 forKey:@"kSuccessfullyOpenedCurrentBook"];
    [v4 synchronize];
  }
}

- (void)_updateLastOpenBookWithAssetID:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    if ([(BKBasePresentingViewController *)self willTerminate]
      || [(BKBasePresentingViewController *)self isResigningActive])
    {
      goto LABEL_11;
    }
    int v7 = [(BKBasePresentingViewController *)self assetIdentifier];
    id v5 = [v7 permanentAssetID];

    id v4 = 0;
  }
  if ([v4 length]
    && ![(BKBasePresentingViewController *)self isSupplementalContent])
  {
    id v6 = v9;
  }
  else
  {
    id v6 = 0;
  }
  id v8 = +[BKLastOpenBookManager sharedInstance];
  [v8 updateLastOpenBookByRemovingAssetID:v5 addingAssetID:v6];

LABEL_11:
}

+ (void)clearLastKnownSuccessfullyOpenBookID
{
  id v2 = BCCurrentBookLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Clearing last known book.", v4, 2u);
  }

  id v3 = +[BKLastOpenBookManager sharedInstance];
  [v3 clearAllLastOpenBooks];
}

+ (id)lastKnownOpenedCurrentBookID
{
  return [a1 _lastOpenedBookWithKey:@"kLastCurrentBookKey"];
}

+ (id)lastKnownSuccessfullyOpenedCurrentBookID
{
  return _[a1 _successfullyOpenedBookWithKey:@"kLastCurrentBookKey" successKey:@"kSuccessfullyOpenedCurrentBook" deleteOnFailure:0];
}

+ (void)clearLastKnownSuccessfullyOpenedCurrentBookID
{
  id v2 = BCCurrentBookLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Asked to clear current spread. Actually clearing Current Book.", v5, 2u);
  }

  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObjectForKey:@"kSuccessfullyOpenedCurrentBook"];

  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObjectForKey:@"kLastCurrentBookKey"];
}

+ (id)futureViewControllerWithAssetIdentifier:(id)a3 libraryAssetProvider:(id)a4 options:(id)a5
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000AA7CC;
  v17[3] = &unk_100A44978;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v7 = (id)objc_opt_new();
  id v21 = v7;
  id v8 = v20;
  id v9 = v19;
  id v10 = v18;
  +[BKAssetLookup assetLookupWithIdentifier:v10 options:v8 completion:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000AA890;
  v15[3] = &unk_100A449A0;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v16;
  [v7 get:v15];
  id v12 = v16;
  id v13 = v7;

  return v13;
}

- (NSString)assetPresenterAssetID
{
  id v2 = [(BKBasePresentingViewController *)self assetIdentifier];
  id v3 = [v2 permanentAssetID];

  return (NSString *)v3;
}

- (NSString)assetPresenterPermanentOrTemporaryAssetID
{
  id v2 = [(BKBasePresentingViewController *)self assetIdentifier];
  id v3 = [v2 permanentOrTemporaryAssetID];

  return (NSString *)v3;
}

- (void)assetPresenterOpenToLocation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BKBasePresentingViewController *)self assetViewController];
  [v7 openToLocation:v6 animated:v4];
}

- (void)assetPresenterJumpToBeginningAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BKBasePresentingViewController *)self assetViewController];
  [v4 jumpToBeginningAnimated:v3];
}

- (void)assetPresenterPrepareForDismissal
{
  [(BKBasePresentingViewController *)self setStateShouldClose:1];
  [(BKBasePresentingViewController *)self _cancelInteractionTimerIfNeeded];

  [(BKBasePresentingViewController *)self _cancelSuccessfullyOpenedTimerIfNeeded];
}

- (void)assetPresenterDismissalTransitionWillBegin
{
}

- (void)assetPresenterDismissalDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKBasePresentingViewController *)self setStateDismissInProgress:0];
  [(BKBasePresentingViewController *)self setStateShouldClose:0];
  if (v3)
  {
    [(BKBasePresentingViewController *)self _finalizeAssetVCState];
    id v5 = [(BKBasePresentingViewController *)self assetViewController];

    if (v5)
    {
      id v6 = [(BKBasePresentingViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKSceneHosting];
      [v6 updateAllAssetPresenterCloseStateTypes];
    }
  }
}

- (void)assetPresenterUpdateToolbars
{
  id v2 = [(BKBasePresentingViewController *)self assetViewController];
  [v2 assetViewControllerUpdateToolbars];
}

- (BOOL)assetPresenterKeepOpenWithoutBundle
{
  if (([(BKBasePresentingViewController *)self stateFlags] & 8) != 0) {
    LOBYTE(v3) = 1;
  }
  else {
    return ([(BKBasePresentingViewController *)self stateFlags] >> 2) & 1;
  }
  return v3;
}

- (id)assetPresenterCoverAnimationSource
{
  id v2 = [(BKBasePresentingViewController *)self openOptions];
  BOOL v3 = [v2 objectForKeyedSubscript:@"BKBookPresentingCoverAnimationSource"];
  id v4 = BUProtocolCast();

  return v4;
}

- (id)assetPresenterCoverImage
{
  objc_opt_class();
  BOOL v3 = [(BKBasePresentingViewController *)self openOptions];
  id v4 = [v3 objectForKeyedSubscript:@"BKBookPresentingCoverImage"];
  id v5 = BUDynamicCast();

  return v5;
}

- (id)assetPresenterCoverShadowImage
{
  objc_opt_class();
  BOOL v3 = [(BKBasePresentingViewController *)self openOptions];
  id v4 = [v3 objectForKeyedSubscript:@"BKBookPresentingCoverShadowImage"];
  id v5 = BUDynamicCast();

  return v5;
}

- (BOOL)minifiedBarVisibilityStyleIsHidden
{
  return [(BKBasePresentingViewController *)self minifiedBarHidden];
}

- (void)im_dismissAnimated:(BOOL)a3 immediate:(BOOL)a4
{
  if (([(BKBasePresentingViewController *)self stateFlags] & 1) != 0
    || [(BKBasePresentingViewController *)self stateShouldClose])
  {
    id v7 = BCCurrentBookLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v27 = [(BKBasePresentingViewController *)self stateFlags];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Ignored dismiss of asset due to state: %ld", buf, 0xCu);
    }
  }
  else
  {
    [(BKBasePresentingViewController *)self setAutoOpen:0];
    id v8 = [(BKBasePresentingViewController *)self assetLookup];
    [v8 cancel];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000AB07C;
    v23[3] = &unk_100A449C8;
    BOOL v24 = a3;
    BOOL v25 = a4;
    v23[4] = self;
    id v9 = objc_retainBlock(v23);
    objc_initWeak((id *)buf, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_1000AB0C0;
    v20[3] = &unk_100A449F0;
    objc_copyWeak(&v22, (id *)buf);
    id v10 = v9;
    id v21 = v10;
    id v11 = objc_retainBlock(v20);
    if ([(BKBasePresentingViewController *)self _shouldTrackReadingSession])
    {
      id v12 = BCBookPromotionLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Ending reading session due to being dismissed to current book.", v19, 2u);
      }
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000AB208;
    v15[3] = &unk_100A44AA8;
    void v15[4] = self;
    BOOL v18 = a4;
    id v13 = v10;
    id v16 = v13;
    id v14 = v11;
    id v17 = v14;
    [(BKBasePresentingViewController *)self _endReadingSessionForEventType:2 withCompletion:v15];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

- (void)updatePromotionStateWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(BKBasePresentingViewController *)self _shouldTrackReadingSession])
  {
    id v5 = BCBookPromotionLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Ending reading session due to another asset being promoted.", buf, 2u);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AB7A8;
  v7[3] = &unk_100A44AF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(BKBasePresentingViewController *)self _endReadingSessionForEventType:2 withCompletion:v7];
}

- (id)_buyButton
{
  objc_opt_class();
  BOOL v3 = [(BKBasePresentingViewController *)self buyButtonItem];
  id v4 = [v3 customView];
  id v5 = [v4 viewWithTag:7];
  id v6 = BUDynamicCast();

  return v6;
}

- (void)_updateBuyButtonProgressIfNeeded
{
  if ([(BKLibraryDownloadStatus *)self->_progressStatus state] == (id)4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000ABC78;
    v6[3] = &unk_100A43D60;
    v6[4] = self;
    BOOL v3 = objc_retainBlock(v6);
    if (v3)
    {
      if (+[NSThread isMainThread])
      {
        ((void (*)(void *))v3[2])(v3);
      }
      else
      {
        v4[0] = _NSConcreteStackBlock;
        v4[1] = 3221225472;
        v4[2] = sub_1000ABD60;
        v4[3] = &unk_100A442B8;
        id v5 = v3;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
      }
    }
  }
}

- (void)_configureBuyButton:(id)a3 color:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setTitleColor:v5 forState:0];
  id v7 = [v5 colorWithAlphaComponent:0.25];
  [v6 setTitleColor:v7 forState:1];

  id v8 = [v5 colorWithAlphaComponent:0.25];
  [v6 setTitleColor:v8 forState:2];

  v17.double width = 10.0;
  v17.double height = 10.0;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  [v5 setStroke];
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.double width = 10.0;
  v19.size.double height = 10.0;
  CGRect v20 = CGRectInset(v19, 1.0, 1.0);
  id v9 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, 2.0);
  [v9 stroke];

  UIGraphicsGetImageFromCurrentImageContext();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v18.double width = 10.0;
  v18.double height = 10.0;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  [v5 setStroke];

  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.double width = 10.0;
  v21.size.double height = 10.0;
  CGRect v22 = CGRectInset(v21, 1.0, 1.0);
  id v10 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height, 2.0);
  [v10 strokeWithBlendMode:0 alpha:0.25];

  id v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v12 = [v15 resizableImageWithCapInsets:4.0, 4.0, 4.0, 4.0];
  [v6 setBackgroundImage:v12 forState:0];

  id v13 = [v11 resizableImageWithCapInsets:4.0, 4.0, 4.0, 4.0];
  [v6 setBackgroundImage:v13 forState:1];

  id v14 = [v11 resizableImageWithCapInsets:4.0, 4.0, 4.0, 4.0];
  [v6 setBackgroundImage:v14 forState:2];
}

- (id)_newBarButtonItemWithBuyButton
{
  CGSize v18 = +[UIColor colorWithRed:0.0980392157 green:0.670588235 blue:0.125490196 alpha:1.0];
  id v3 = [objc_alloc((Class)IMButtonAndRadialProgress) initWithFrame:0.0, 0.0, 54.0, 26.0];
  [(BKBasePresentingViewController *)self _configureBuyButton:v3 color:v18];
  id v4 = [v3 titleLabel];
  id v5 = +[UIFont systemFontOfSize:14.0];
  [v4 setFont:v5];

  id v6 = [v3 titleLabel];
  [v6 setAdjustsFontSizeToFitWidth:1];

  id v7 = [v3 titleLabel];
  [v7 setMinimumScaleFactor:0.5];

  [v3 setTag:7];
  id v8 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 addSubview:v3];
  id v9 = [v3 centerXAnchor];
  id v10 = [v8 centerXAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  v19[0] = v11;
  id v12 = [v8 heightAnchor];
  id v13 = [v12 constraintEqualToConstant:26.0];
  v19[1] = v13;
  id v14 = +[NSArray arrayWithObjects:v19 count:2];
  +[NSLayoutConstraint activateConstraints:v14];

  [(BKBasePresentingViewController *)self _resizeBuyButton:v3];
  id v15 = [objc_alloc((Class)BCUIFullHeightNavWrapper) initWithView:v8];
  [v15 setCursorInsets:2.0, -8.0, 2.0, -8.0];
  id v16 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v15];

  return v16;
}

- (void)_resizeBuyButton:(id)a3
{
  id v19 = a3;
  [v19 sizeToFit];
  [v19 frame];
  double Width = CGRectGetWidth(v21);
  +[BCNavigationBar padding];
  double v6 = v5;
  double v7 = v5 * 0.5;
  double v8 = Width + v5;
  id v9 = [v19 superview];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  v22.origin.y = 0.0;
  v22.size.double height = 26.0;
  v22.origin.x = v6 * 0.5;
  v22.size.double width = Width + v6;
  double v14 = v6 + CGRectGetWidth(v22);
  if ([(BKBasePresentingViewController *)self im_isCompactWidth]) {
    double v15 = 100.0;
  }
  else {
    double v15 = 140.0;
  }
  double v16 = v14 - v15;
  if (v14 - v15 <= 0.0)
  {
    double v15 = v14;
LABEL_10:
    double v18 = Width + v6;
    goto LABEL_11;
  }
  if (v16 <= v7)
  {
    double v15 = v14 - v16;
    goto LABEL_10;
  }
  double v17 = v6 - (v16 - v7);
  if (v17 <= 0.0)
  {
    double v8 = v15 - v7;
    v23.size.double height = 26.0;
    v23.origin.x = v11;
    v23.origin.y = v13;
    v23.size.double width = v15 - v7;
    double v18 = CGRectGetWidth(v23);
    double v7 = 0.0;
  }
  else
  {
    double v15 = v14 - v7 - v17;
    double v7 = v17 * 0.5;
    double v18 = Width + v17;
  }
LABEL_11:
  [(UIBarButtonItem *)self->_buyButtonItem setWidth:v15];
  [v19 setFrame:v7, 0.0, v18, 26.0];
  [v9 setFrame:v11, v13, v8, 26.0];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [(BKBasePresentingViewController *)self _buyButton];
  [(BKBasePresentingViewController *)self _resizeBuyButton:v5];
}

- (id)traitCollection
{
  v6.receiver = self;
  v6.super_class = (Class)BKBasePresentingViewController;
  id v3 = [(BKBasePresentingViewController *)&v6 traitCollection];
  id v4 = [(BKBasePresentingViewController *)self im_traitCollectionAdjustedForMedusaLevels:v3];

  return v4;
}

- (void)_configureBuyButtonForPricing:(id)a3 profile:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  double v7 = [v6 actionTextWithType:0];
  [v15 setTitle:v7 forState:0];
  [(BKBasePresentingViewController *)self _resizeBuyButton:v15];
  if ([v6 isPreorder])
  {
    double v8 = +[UIColor systemOrangeColor];
    [(BKBasePresentingViewController *)self _configureBuyButton:v15 color:v8];
  }
  id v9 = [v6 buyParameters];
  id v10 = [v9 length];

  if (!v10)
  {
    uint64_t v12 = 0;
    goto LABEL_12;
  }
  double v11 = +[BUAccountsProvider sharedProvider];
  if ([v11 isStoreAccountManagedAppleID])
  {
  }
  else
  {
    double v13 = +[BURestrictionsProvider sharedInstance];
    unsigned __int8 v14 = [v13 isBookStoreAllowed];

    if (v14)
    {
      uint64_t v12 = 1;
      goto LABEL_12;
    }
  }
  uint64_t v12 = 3;
LABEL_12:
  [v15 setModeState:v12];
}

- (void)_fetchProfileForStoreID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = +[AEUserPublishing sharedInstance];
  id v14 = v5;
  double v8 = +[NSArray arrayWithObjects:&v14 count:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000AC76C;
  v11[3] = &unk_100A44B20;
  id v12 = v5;
  id v13 = v6;
  id v9 = v5;
  id v10 = v6;
  [v7 productProfilesForStoreIDs:v8 completion:v11];
}

- (void)_downloadStatusNotification:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  double v18 = v4;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:BKLibraryDownloadStatusKey];
  double v7 = BUDynamicCast();

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v14 = [v13 assetID];
        id v15 = [(BKBasePresentingViewController *)self assetIdentifier];
        double v16 = [v15 permanentOrTemporaryAssetID];

        if ([v16 isEqualToString:v14])
        {
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          void v21[2] = sub_1000ACB94;
          v21[3] = &unk_100A443C8;
          void v21[4] = self;
          id v22 = v16;
          CGRect v23 = v13;
          double v17 = objc_retainBlock(v21);
          if (v17)
          {
            if (+[NSThread isMainThread])
            {
              ((void (*)(void *))v17[2])(v17);
            }
            else
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_1000ACC24;
              block[3] = &unk_100A442B8;
              CGRect v20 = v17;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
            }
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }
}

- (void)_libraryOwnershipNotification:(id)a3
{
  [a3 userInfo];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v15 = v19 = 0u;
  id v4 = [v15 objectForKeyedSubscript:BKLibraryOwnershipAssetsKey];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    uint64_t v8 = BKLibraryOwnershipAssetIDKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) objectForKeyedSubscript:v8];
        uint64_t v11 = [(BKBasePresentingViewController *)self assetIdentifier];
        id v12 = [v11 permanentAssetID];

        if ([v10 isEqualToString:v12])
        {
          if (self->_progressStatus)
          {
            -[BKBasePresentingViewController _updateAssetStateAndDownloadStatus:](self, "_updateAssetStateAndDownloadStatus:");
            progressStatus = self->_progressStatus;
          }
          else
          {
            progressStatus = 0;
          }
          if ([(BKLibraryDownloadStatus *)progressStatus state] == (id)5)
          {
            [(BKLibraryDownloadStatus *)self->_progressStatus progressValue];
            if (v14 >= 1.0) {
              [(BKBasePresentingViewController *)self setProgressStatus:0];
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)_updateAssetStateAndDownloadStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(BKBasePresentingViewController *)self assetViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000ACEC8;
    v7[3] = &unk_100A43DD8;
    id v8 = v4;
    id v9 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (void)_sendDeferredURLOpenRequests
{
  id v13 = +[BKAppDelegate sceneManager];
  id v3 = [v13 sceneControllerForViewController:self];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [(NSMutableDictionary *)self->_deferredURLOpenRequests allKeys];
  id v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [(NSMutableDictionary *)self->_deferredURLOpenRequests objectForKeyedSubscript:v8];
        id v10 = [v3 newShowURLTransaction];
        [v13 handleApplicationURL:v8 sourceApplication:@"__self__" annotation:0 likelyUserInitiated:v9 transaction:v10];
      }
      id v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  deferredURLOpenRequests = self->_deferredURLOpenRequests;
  self->_deferredURLOpenRequests = 0;
}

- (id)analyticsContentDataForAssetViewController:(id)a3 contentSubType:(id)a4 tracker:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(BKBasePresentingViewController *)self libraryAssetProvider];
  id v10 = [(BKBasePresentingViewController *)self assetIdentifier];
  uint64_t v11 = [v9 libraryAssetOnMainQueueWithAssetIdentifier:v10];

  if (v11)
  {
    signed int v12 = [v11 contentType];
    id v44 = +[BAUtilities contentTypeFromAssetType:v12];
    id v13 = [v11 storeID];
    id v14 = [v13 length];
    uint64_t v15 = 1;
    if (!v14) {
      uint64_t v15 = 2;
    }
    uint64_t v43 = v15;

    long long v16 = [(BKBasePresentingViewController *)self assetIdentifier];
    long long v17 = [v16 permanentAssetID];

    uint64_t v18 = [v8 contentPrivateIDForContentID:v17];
    uint64_t v19 = [v8 contentUserIDForContentID:v17];
    CGRect v20 = +[BAEventReporter sharedReporter];
    id v42 = [v20 seriesTypeForContentID:v17];

    id v45 = v7;
    if ([v11 isAudiobook])
    {
      CGRect v21 = [v11 hasRACSupport];
      unsigned int v22 = [v21 BOOLValue];
      uint64_t v23 = 1;
      if (!v22) {
        uint64_t v23 = 2;
      }
      uint64_t v39 = v23;
    }
    else
    {
      uint64_t v39 = 0;
    }
    uint64_t v25 = [(BKBasePresentingViewController *)self appAnalyticsAdditionalData];
    v41 = (void *)v19;
    if (v25 && (long long v26 = (void *)v25, v27 = _os_feature_enabled_impl(), v26, v27))
    {
      __int16 v28 = [(BKBasePresentingViewController *)self appAnalyticsAdditionalData];
      id v29 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v28 supportsUnifiedProductPage]);

      objc_super v30 = [(BKBasePresentingViewController *)self appAnalyticsAdditionalData];
      double v31 = [v30 editionKind];
    }
    else
    {
      id v29 = 0;
      double v31 = 0;
    }
    id v32 = objc_alloc((Class)BAContentData);
    BOOL v33 = v12 == 3;
    signed int v40 = v12;
    uint64_t v34 = (void *)v18;
    if (v33)
    {
      id v35 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 pageCount]);
    }
    else
    {
      id v35 = 0;
    }
    id v36 = [v11 supplementalContentAssets];
    id v37 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v36 count]);
    id v24 = [v32 initWithContentID:v17 contentType:v44 contentPrivateID:v34 contentUserID:v41 contentAcquisitionType:v43 contentSubType:v45 contentLength:v35 supplementalContentCount:v37 seriesType:v42 productionType:v39 isUnified:v29 contentKind:v31];

    if (v40 == 3) {
    id v7 = v45;
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (BOOL)isTranslateAvailableForAssetViewController:(id)a3
{
  return +[LTUITranslationViewController isAvailable];
}

- (void)assetViewController:(id)a3 presentTranslationForText:(id)a4 fromRect:(CGRect)a5 onClose:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc_init((Class)LTUITranslationViewController);
  id v17 = [objc_alloc((Class)NSAttributedString) initWithString:v14];

  [v16 setText:v17];
  [v16 setIsSourceEditable:0];
  [v16 setOverrideUserInterfaceStyle:[v15 preferredUserInterfaceStyle]];
  [v16 setModalPresentationStyle:7];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_1000AD754;
  v21[3] = &unk_100A442B8;
  id v22 = v13;
  id v18 = v13;
  [v16 setDismissCompletionHandler:v21];
  uint64_t v19 = [v16 popoverPresentationController];
  CGRect v20 = [v15 view];
  [v19 setSourceView:v20];

  [v19 setSourceRect:x, y, width, height];
  [v19 setPermittedArrowDirections:15];
  [v19 bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:v15];
  [(BKBasePresentingViewController *)self assetViewController:v15 presentViewController:v16 animated:1 completion:0];
}

- (BOOL)_requiresCustomPresentationController
{
  return 1;
}

- (void)_beginReadingSessionForEventType:(unint64_t)a3
{
  id v5 = [(BKBasePresentingViewController *)self assetIdentifier];
  uint64_t v6 = [v5 permanentAssetID];

  if ((a3 | 4) == 4)
  {
    id v7 = [(BKBasePresentingViewController *)self sessionID];
    if (v7)
    {
    }
    else if ([(BKBasePresentingViewController *)self _shouldTrackReadingSession])
    {
      id v9 = +[NSUUID UUID];
      [(BKBasePresentingViewController *)self setSessionID:v9];

      id v10 = BCCurrentBookLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting reading session for book with assetID: %@", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v11 = [(BKBasePresentingViewController *)self assetViewController];
      if ([v11 readerType] == (id)6) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 1;
      }

      id v13 = +[BCBookReadingTimeTracker sharedInstance];
      id v14 = [(BKBasePresentingViewController *)self sessionID];
      [v13 trackReadingSessionBeganWithAssetID:v6 sessionID:v14 trackerEventType:a3 readingFeatureFlags:v12 completion:0];
    }
  }
  else
  {
    id v8 = BCCurrentBookLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1007E7EA0((uint64_t)v6, a3);
    }
  }
}

- (void)_endReadingSessionForEventType:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(BKBasePresentingViewController *)self assetIdentifier];
  id v8 = [v7 permanentAssetID];

  if (v8
    && ([(BKBasePresentingViewController *)self sessionID], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v10 = (void *)v9,
        unsigned int v11 = [(BKBasePresentingViewController *)self _shouldTrackReadingSession],
        v10,
        v11))
  {
    uint64_t v12 = BCCurrentBookLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ending reading session for book with assetID: %@", buf, 0xCu);
    }

    id v13 = [(BKBasePresentingViewController *)self assetViewController];
    if ([v13 readerType] == (id)6) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }

    int v15 = +[BCBookReadingTimeTracker sharedInstance];
    id v16 = [(BKBasePresentingViewController *)self sessionID];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    void v19[2] = sub_1000ADBB0;
    v19[3] = &unk_100A44B48;
    id v20 = v6;
    [v15 trackReadingSessionEndedWithAssetID:v8 sessionID:v16 trackerEventType:a3 readingFeatureFlags:v14 completion:v19];

    [(BKBasePresentingViewController *)self setSessionID:0];
  }
  else
  {
    id v17 = (void (**)(id, id))objc_retainBlock(v6);
    if (v17)
    {
      id v18 = +[BKBasePresentingViewController lastKnownSuccessfullyOpenedCurrentBookID];
      v17[2](v17, [v8 isEqualToString:v18]);
    }
  }
}

- (void)assetPresenterUpdateCloseTypeState
{
  id v2 = [(BKBasePresentingViewController *)self assetViewController];
  [v2 assetViewControllerUpdateCloseStateTypeIfNeeded];
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (id)bc_childCardPresentingViewController
{
  id v2 = [(BKBasePresentingViewController *)self presentedViewController];
  id v3 = BUProtocolCast();

  return v3;
}

- (void)_willEnterFullScreen:(id)a3
{
  id v4 = BCCurrentBookLiveResizeLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1007E7F10();
  }

  [(BKBasePresentingViewController *)self setEnteringFullScreen:1];
  id v5 = [(BKBasePresentingViewController *)self assetViewController];
  if (objc_opt_respondsToSelector()) {
    [v5 assetViewControllerWillEnterFullScreen];
  }
}

- (void)_didEnterFullScreen:(id)a3
{
  id v4 = BCCurrentBookLiveResizeLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1007E7F44();
  }

  [(BKBasePresentingViewController *)self setEnteringFullScreen:0];
  [(BKBasePresentingViewController *)self setInFullScreen:1];
  id v5 = +[UIMenuSystem mainSystem];
  [v5 setNeedsRebuild];

  id v6 = [(BKBasePresentingViewController *)self assetViewController];
  if (objc_opt_respondsToSelector()) {
    [v6 assetViewControllerDidEnterFullScreen];
  }
}

- (void)_willExitFullScreen:(id)a3
{
  id v4 = BCCurrentBookLiveResizeLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1007E7F78();
  }

  [(BKBasePresentingViewController *)self setExitingFullScreen:1];
  id v5 = [(BKBasePresentingViewController *)self assetViewController];
  if (objc_opt_respondsToSelector()) {
    [v5 assetViewControllerWillExitFullScreen];
  }
}

- (void)_didExitFullScreen:(id)a3
{
  id v4 = BCCurrentBookLiveResizeLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1007E7FAC();
  }

  [(BKBasePresentingViewController *)self setExitingFullScreen:0];
  [(BKBasePresentingViewController *)self setInFullScreen:0];
  id v5 = +[UIMenuSystem mainSystem];
  [v5 setNeedsRebuild];

  id v6 = [(BKBasePresentingViewController *)self assetViewController];
  if (objc_opt_respondsToSelector()) {
    [v6 assetViewControllerDidExitFullScreen];
  }
}

- (id)coordinatedViewControllersFor:(id)a3
{
  return &__NSArray0__struct;
}

- (id)donationItemFor:(id)a3 intent:(int64_t)a4
{
  return 0;
}

- (id)donationTargets
{
  return &__NSArray0__struct;
}

- (void)bkaxSetUpAccessibilityForPresentedBook
{
  id v13 = [(BKBasePresentingViewController *)self view];
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  unsigned __int8 v4 = [v3 isEqualToString:@"UITransitionView"];

  if (v4)
  {
    id v5 = v13;
LABEL_6:
    unsigned int v11 = +[BKBasePresentingViewController bkaxPresentedAssetTransitionViewIdentifier];
    [v5 setAccessibilityIdentifier:v11];

    uint64_t v12 = v5;
  }
  else
  {
    id v6 = v13;
    while (1)
    {
      id v14 = v6;
      id v7 = [v6 superview];

      if (!v7) {
        break;
      }
      id v5 = [v14 superview];

      id v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      unsigned int v10 = [v9 isEqualToString:@"UITransitionView"];

      id v6 = v5;
      if (v10) {
        goto LABEL_6;
      }
    }
    uint64_t v12 = v14;
  }
}

+ (id)bkaxPresentedAssetTransitionViewIdentifier
{
  return @"Presented Book Transition View";
}

- (BKContentOpenAnimating)assetPresenterAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetPresenterAnimator);

  return (BKContentOpenAnimating *)WeakRetained;
}

- (void)setAssetPresenterAnimator:(id)a3
{
}

- (double)assetPresenterCoverAspect
{
  return self->_assetPresenterCoverAspect;
}

- (void)setAssetPresenterCoverAspect:(double)a3
{
  self->_assetPresenterCoverAspect = a3;
}

- (NSDictionary)openOptions
{
  return self->_openOptions;
}

- (void)setOpenOptions:(id)a3
{
}

- (BOOL)inLiveResize
{
  return self->_inLiveResize;
}

- (void)setInLiveResize:(BOOL)a3
{
  self->_inLiveResize = a3;
}

- (BCCoverAnimatingHost)placeholderViewController
{
  return self->_placeholderViewController;
}

- (void)setPlaceholderViewController:(id)a3
{
}

- (BOOL)autoDownload
{
  return self->_autoDownload;
}

- (void)setAutoDownload:(BOOL)a3
{
  self->_autoDownload = a3;
}

- (BOOL)autoOpen
{
  return self->_autoOpen;
}

- (void)setAutoOpen:(BOOL)a3
{
  self->_autoOpen = a3;
}

- (NSArray)bk_previewActionItems
{
  return self->_bk_previewActionItems;
}

- (void)setBk_previewActionItems:(id)a3
{
}

- (int64_t)assetState
{
  return self->_assetState;
}

- (void)setAssetState:(int64_t)a3
{
  self->_assetState = a3;
}

- (BAUpSellData)upSellData
{
  return self->_upSellData;
}

- (void)setUpSellData:(id)a3
{
}

- (BAAppAnalyticsAdditionalData)appAnalyticsAdditionalData
{
  return self->_appAnalyticsAdditionalData;
}

- (void)setAppAnalyticsAdditionalData:(id)a3
{
}

- (BOOL)useLegacyAnimation
{
  return self->_useLegacyAnimation;
}

- (void)setUseLegacyAnimation:(BOOL)a3
{
  self->_useLegacyAnimation = a3;
}

- (id)downloadProgressBlock
{
  return self->_downloadProgressBlock;
}

- (void)setDownloadProgressBlock:(id)a3
{
}

- (BOOL)minifiedBarHidden
{
  return self->_minifiedBarHidden;
}

- (void)setMinifiedBarHidden:(BOOL)a3
{
  self->_minifiedBarHidden = a3;
}

- (BOOL)finishedConsuming
{
  return self->_finishedConsuming;
}

- (void)setFinishedConsuming:(BOOL)a3
{
  self->_finishedConsuming = a3;
}

- (BKTransitioningViewController)transitioningViewController
{
  return self->_transitioningViewController;
}

- (void)setTransitioningViewController:(id)a3
{
}

- (AEHelper)assetHelper
{
  return self->_assetHelper;
}

- (void)setAssetHelper:(id)a3
{
}

- (BKLibraryAssetIdentifier)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSTimer)confirmActiveTimer
{
  return self->_confirmActiveTimer;
}

- (void)setConfirmActiveTimer:(id)a3
{
}

- (BOOL)isSupplementalContent
{
  return self->_assetPresenterIsSupplementalContent;
}

- (void)setAssetPresenterIsSupplementalContent:(BOOL)a3
{
  self->_assetPresenterIsSupplementalContent = a3;
}

- (BOOL)isResigningActive
{
  return self->_isResigningActive;
}

- (void)setIsResigningActive:(BOOL)a3
{
  self->_isResigningActive = a3;
}

- (BOOL)preparingEndOfBookExperience
{
  return self->_preparingEndOfBookExperience;
}

- (void)setPreparingEndOfBookExperience:(BOOL)a3
{
  self->_preparingEndOfBookExperience = a3;
}

- (BOOL)successfullyOpened
{
  return self->_successfullyOpened;
}

- (void)setSuccessfullyOpened:(BOOL)a3
{
  self->_successfullyOpened = a3;
}

- (NSTimer)successfullyOpenedTimer
{
  return self->_successfullyOpenedTimer;
}

- (void)setSuccessfullyOpenedTimer:(id)a3
{
}

- (BKAssetPresentingFilePresenter)filePresenter
{
  return self->_filePresenter;
}

- (void)setFilePresenter:(id)a3
{
}

- (BKAssetLookup)assetLookup
{
  return self->_assetLookup;
}

- (void)setAssetLookup:(id)a3
{
}

- (unint64_t)stateFlags
{
  return self->_stateFlags;
}

- (void)setStateFlags:(unint64_t)a3
{
  self->_stateFlags = a3;
}

- (BOOL)willTerminate
{
  return self->_willTerminate;
}

- (void)setWillTerminate:(BOOL)a3
{
  self->_willTerminate = a3;
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryAssetProvider);

  return (BKLibraryAssetProvider *)WeakRetained;
}

- (void)setLibraryAssetProvider:(id)a3
{
}

- (id)errorCloseBlock
{
  return self->_errorCloseBlock;
}

- (void)setErrorCloseBlock:(id)a3
{
}

- (void)setMinifiedPresenter:(id)a3
{
}

- (BKLibraryDownloadStatus)progressStatus
{
  return self->_progressStatus;
}

- (BKSampleToPurchaseMonitor)sampleToPurchasedMonitor
{
  return self->_sampleToPurchasedMonitor;
}

- (void)setSampleToPurchasedMonitor:(id)a3
{
}

- (BKImportInPlaceMonitor)importInPlaceMonitor
{
  return self->_importInPlaceMonitor;
}

- (void)setImportInPlaceMonitor:(id)a3
{
}

- (id)loadAssetBlock
{
  return self->_loadAssetBlock;
}

- (void)setLoadAssetBlock:(id)a3
{
}

- (id)transitionCompletedBlock
{
  return self->_transitionCompletedBlock;
}

- (void)setTransitionCompletedBlock:(id)a3
{
}

- (BOOL)shouldRestoreNavBar
{
  return self->_shouldRestoreNavBar;
}

- (void)setShouldRestoreNavBar:(BOOL)a3
{
  self->_shouldRestoreNavBar = a3;
}

- (BKAssetPresentingViewControllerHoldAnimationAssertion)holdAnimationAssertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_holdAnimationAssertion);

  return (BKAssetPresentingViewControllerHoldAnimationAssertion *)WeakRetained;
}

- (void)setHoldAnimationAssertion:(id)a3
{
}

- (UIBarButtonItem)buyButtonItem
{
  return self->_buyButtonItem;
}

- (void)setBuyButtonItem:(id)a3
{
}

- (BOOL)didFetchProfile
{
  return self->_didFetchProfile;
}

- (void)setDidFetchProfile:(BOOL)a3
{
  self->_didFetchProfile = a3;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (BCReadingStatisticsController)readingStatisticsController
{
  return self->_readingStatisticsController;
}

- (void)setReadingStatisticsController:(id)a3
{
}

- (BOOL)needToRebuildContextTree
{
  return self->_needToRebuildContextTree;
}

- (void)setNeedToRebuildContextTree:(BOOL)a3
{
  self->_needToRebuildContextTree = a3;
}

- (BOOL)needToForcePagination
{
  return self->_needToForcePagination;
}

- (void)setNeedToForcePagination:(BOOL)a3
{
  self->_needToForcePagination = a3;
}

- (NSMutableDictionary)deferredURLOpenRequests
{
  return self->_deferredURLOpenRequests;
}

- (void)setDeferredURLOpenRequests:(id)a3
{
}

- (BOOL)stateShouldClose
{
  return self->_stateShouldClose;
}

- (void)setStateShouldClose:(BOOL)a3
{
  self->_stateShouldClose = a3;
}

- (BOOL)stateShouldOpen
{
  return self->_stateShouldOpen;
}

- (void)setStateShouldOpen:(BOOL)a3
{
  self->_stateShouldOpen = a3;
}

- (BOOL)stateDismissInProgress
{
  return self->_stateDismissInProgress;
}

- (void)setStateDismissInProgress:(BOOL)a3
{
  self->_stateDismissInProgress = a3;
}

- (BOOL)scrimAppliedForLiveResize
{
  return self->_scrimAppliedForLiveResize;
}

- (void)setScrimAppliedForLiveResize:(BOOL)a3
{
  self->_scrimAppliedForLiveResize = a3;
}

- (CGRect)liveResizeViewOriginalFrame
{
  double x = self->_liveResizeViewOriginalFrame.origin.x;
  double y = self->_liveResizeViewOriginalFrame.origin.y;
  double width = self->_liveResizeViewOriginalFrame.size.width;
  double height = self->_liveResizeViewOriginalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLiveResizeViewOriginalFrame:(CGRect)a3
{
  self->_liveResizeViewOriginalFrame = a3;
}

- (UIView)liveResizeWrapperView
{
  return self->_liveResizeWrapperView;
}

- (void)setLiveResizeWrapperView:(id)a3
{
}

- (UIView)scrimLiveResizeView
{
  return self->_scrimLiveResizeView;
}

- (void)setScrimLiveResizeView:(id)a3
{
}

- (UIVisualEffectView)scrimLiveResizeBlurView
{
  return self->_scrimLiveResizeBlurView;
}

- (void)setScrimLiveResizeBlurView:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (BOOL)enteringFullScreen
{
  return self->_enteringFullScreen;
}

- (void)setEnteringFullScreen:(BOOL)a3
{
  self->_enteringFullScreen = a3;
}

- (BOOL)exitingFullScreen
{
  return self->_exitingFullScreen;
}

- (void)setExitingFullScreen:(BOOL)a3
{
  self->_exitingFullScreen = a3;
}

- (BOOL)inFullScreen
{
  return self->_inFullScreen;
}

- (void)setInFullScreen:(BOOL)a3
{
  self->_inFullScreen = a3;
}

- (BOOL)aspectFitDuringResize
{
  return self->_aspectFitDuringResize;
}

- (void)setAspectFitDuringResize:(BOOL)a3
{
  self->_aspectFitDuringResize = a3;
}

- (BKFrontmostAssetTracker)frontmostTracker
{
  return self->_frontmostTracker;
}

- (BCMutableFutureValue)sampleProfileFuture
{
  return self->_sampleProfileFuture;
}

- (void)setSampleProfileFuture:(id)a3
{
}

- (AEAssetViewController)assetViewController
{
  return self->_assetViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetViewController, 0);
  objc_storeStrong((id *)&self->_sampleProfileFuture, 0);
  objc_storeStrong((id *)&self->_frontmostTracker, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_scrimLiveResizeBlurView, 0);
  objc_storeStrong((id *)&self->_scrimLiveResizeView, 0);
  objc_storeStrong((id *)&self->_liveResizeWrapperView, 0);
  objc_storeStrong((id *)&self->_deferredURLOpenRequests, 0);
  objc_storeStrong((id *)&self->_readingStatisticsController, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_buyButtonItem, 0);
  objc_destroyWeak((id *)&self->_holdAnimationAssertion);
  objc_storeStrong(&self->_transitionCompletedBlock, 0);
  objc_storeStrong(&self->_loadAssetBlock, 0);
  objc_storeStrong((id *)&self->_importInPlaceMonitor, 0);
  objc_storeStrong((id *)&self->_sampleToPurchasedMonitor, 0);
  objc_storeStrong((id *)&self->_progressStatus, 0);
  objc_destroyWeak((id *)&self->_minifiedPresenter);
  objc_storeStrong(&self->_errorCloseBlock, 0);
  objc_destroyWeak((id *)&self->_libraryAssetProvider);
  objc_storeStrong((id *)&self->_assetLookup, 0);
  objc_storeStrong((id *)&self->_filePresenter, 0);
  objc_storeStrong((id *)&self->_successfullyOpenedTimer, 0);
  objc_storeStrong((id *)&self->_confirmActiveTimer, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_assetHelper, 0);
  objc_storeStrong((id *)&self->_transitioningViewController, 0);
  objc_storeStrong(&self->_downloadProgressBlock, 0);
  objc_storeStrong((id *)&self->_appAnalyticsAdditionalData, 0);
  objc_storeStrong((id *)&self->_upSellData, 0);
  objc_storeStrong((id *)&self->_bk_previewActionItems, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_openOptions, 0);

  objc_destroyWeak((id *)&self->_assetPresenterAnimator);
}

@end