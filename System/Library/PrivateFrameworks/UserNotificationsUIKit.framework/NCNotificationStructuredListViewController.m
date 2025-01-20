@interface NCNotificationStructuredListViewController
- (ATXDigestOnboardingSuggestion)digestOnboardingSuggestion;
- (ATXDigestOnboardingSuggestionClient)digestOnboardingSuggestionClient;
- (ATXDigestOnboardingSuggestionLogging)digestOnboardingSuggestionLogging;
- (BOOL)_canShowWhileLocked;
- (BOOL)_forwarNotificationRequestToLongLookIfNecessary:(id)a3;
- (BOOL)_isPresentingDigestOnboardingSuggestion;
- (BOOL)_shouldPresentDigestOnboardingSuggestion;
- (BOOL)backgroundBlurred;
- (BOOL)dismissModalFullScreenAnimated:(BOOL)a3;
- (BOOL)hasVisibleContent;
- (BOOL)hasVisibleContentToReveal;
- (BOOL)hasVisibleUrgentBreakthroughContent;
- (BOOL)interpretsViewAsContent:(id)a3;
- (BOOL)isContentExtensionVisible:(id)a3;
- (BOOL)isDeviceAuthenticated;
- (BOOL)isHomeAffordanceVisible;
- (BOOL)isOverlayFooterContentVisible;
- (BOOL)isPresentingNotificationInLongLook;
- (BOOL)isScrollingListContent;
- (BOOL)notificationListComponent:(id)a3 isClockNotificationRequest:(id)a4;
- (BOOL)notificationListComponent:(id)a3 shouldAllowInteractionsForNotificationRequest:(id)a4;
- (BOOL)notificationListComponentShouldAllowLongPressGesture:(id)a3;
- (BOOL)notificationListExpandsVisibleRegionOnSignificantScroll;
- (BOOL)notificationOptionsMenu:(id)a3 isDisplayingStackSummaryForNotificationRequest:(id)a4;
- (BOOL)notificationRootList:(id)a3 shouldFilterNotificationRequest:(id)a4;
- (BOOL)notificationRootListAreHighlightsEnabled:(id)a3;
- (BOOL)notificationRootListShouldAllowNotificationHistoryReveal:(id)a3;
- (BOOL)requiresPushOffManagementForNotificationRootList:(id)a3;
- (BOOL)shouldHintDefaultActionForNotificationListBaseComponent:(id)a3;
- (BOOL)showNotificationsInAlwaysOn;
- (CGPoint)scrollViewVisibleContentLayoutOffset;
- (CGRect)visibleContentExtent;
- (CGSize)effectiveContentSize;
- (Class)notificationRootListNotificationViewControllerClass:(id)a3;
- (NCInternalToolsOverlayView)internalToolsOverlayView;
- (NCMaterialDisplayingCaptureOnlyViewController)captureOnlyMaterialViewController;
- (NCModalNavigationController)modalNavigationController;
- (NCModeManager)modeManager;
- (NCNotificationListCoalescingControlsHandler)coalescingControlsHandlerInForceTouchState;
- (NCNotificationListComponent)notificationListComponentPresentingOptionsMenu;
- (NCNotificationListCountIndicatorViewController)countIndicatorViewController;
- (NCNotificationListSectionHeaderView)headerViewInForceTouchState;
- (NCNotificationListSupplementaryViewsContaining)testRecipeSupplementaryViewsContainer;
- (NCNotificationListTouchEaterManager)touchEaterManager;
- (NCNotificationListViewProtocol)listView;
- (NCNotificationManagementViewPresenter)managementViewPresenter;
- (NCNotificationOptionsMenu)optionsMenu;
- (NCNotificationRequest)notificationRequestRemovedWhilePresentingLongLook;
- (NCNotificationRootList)listModel;
- (NCNotificationStructuredListViewController)init;
- (NCNotificationStructuredListViewControllerDelegate)delegate;
- (NCNotificationViewController)notificationViewControllerPresentingLongLook;
- (NSArray)digestOnboardingLastBundleIdentifiersSelection;
- (NSArray)digestOnboardingLastScheduledDeliveryTimesSelection;
- (NSDate)digestOnboardingSuggestionPresentationTime;
- (NSHashTable)observers;
- (NSMutableDictionary)allNotificationRequests;
- (UIEdgeInsets)_overlayFooterViewEdgeInsetsForSize:(CGSize)a3;
- (UIEdgeInsets)insetMargins;
- (UIPanGestureRecognizer)homeAffordancePanGesture;
- (UIScrollView)scrollView;
- (double)cutoffOffsetForNotificationRootList:(id)a3;
- (double)itemSpacing;
- (id)_logDescription;
- (id)_notificationSystemSettings;
- (id)_sectionSettingsForSectionIdentifier:(id)a3;
- (id)containerViewForPreviewInteractionPresentedContentForNotificationListBaseComponent:(id)a3;
- (id)hideHomeAffordanceAnimationSettingsForNotificationListComponent:(id)a3;
- (id)insertSupplementaryViewsContainerAtListPosition:(unint64_t)a3 identifier:(id)a4 withDescription:(id)a5;
- (id)legibilitySettingsForNotificationListBaseComponent:(id)a3;
- (id)newCaptureOnlyMaterialViewController;
- (id)notificationListComponent:(id)a3 containerViewProviderForExpandedContentForViewController:(id)a4;
- (id)notificationListComponent:(id)a3 keyboardAssertionForGestureWindow:(id)a4;
- (id)notificationListComponent:(id)a3 notificationRequestForUUID:(id)a4;
- (id)notificationListComponent:(id)a3 sectionSettingsForSectionIdentifier:(id)a4;
- (id)notificationListComponentRequestsCurrentModeConfiguration:(id)a3;
- (id)notificationManagementViewPresenter:(id)a3 sectionSettingsForSectionIdentifier:(id)a4;
- (id)notificationOptionsMenu:(id)a3 sectionSettingsForSectionIdentifier:(id)a4;
- (id)notificationOptionsMenuRequestsCurrentModeConfiguration:(id)a3;
- (id)notificationRequestWithNotificationIdentifier:(id)a3 sectionIdentifier:(id)a4;
- (id)notificationUsageTrackingStateForNotificationListComponent:(id)a3;
- (id)settleHomeAffordanceAnimationBehaviorDescriptionForNotificationListComponent:(id)a3;
- (id)unhideHomeAffordanceAnimationSettingsForNotificationListComponent:(id)a3;
- (unint64_t)requestsUnrevealedCountForNotificationStructuredListView:(id)a3;
- (unint64_t)visibleNotificationCount;
- (void)_contentSizeCategoryDidChange;
- (void)_didExitAlwaysOn;
- (void)_handleDeviceUnauthenticated;
- (void)_listenToUserDefaultsToSwitchListViewAndModelIfNecessary;
- (void)_loadListViewAndModelIfNecessary;
- (void)_presentNavigationControllerAndBeginModalInteraction:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_presentOptionsMenuForNotificationRequest:(id)a3 withPresentingView:(id)a4 optionsForSection:(BOOL)a5;
- (void)_requestAuthenticationAndPerformBlock:(id)a3;
- (void)_resetListStateBeforeUIAppears;
- (void)_resetSwipeInteractionWithRevealedActionsAnimated:(BOOL)a3;
- (void)_scheduleDigestOnboardingSuggestion;
- (void)_setDigestOnboardingSuggestionVisible:(BOOL)a3;
- (void)_setScheduledDeliveryEnabledForSectionIdentifier:(id)a3;
- (void)_setSystemScheduledDeliveryEnabled:(BOOL)a3 scheduledDeliveryTimes:(id)a4;
- (void)_toggleDigestOnboardingSuggestionIfNecessary;
- (void)_updateDebugHUD;
- (void)_updateListEdgeInsetsForSize:(CGSize)a3;
- (void)_updateListVisibleAreaForSize:(CGSize)a3;
- (void)addContentObserver:(id)a3;
- (void)adjustForLegibilitySettingsChange:(id)a3;
- (void)collapseGroupForNotificationRequest:(id)a3 withCompletion:(id)a4;
- (void)createContactNavigationControllerDidComplete:(id)a3;
- (void)digestOnboardingNavigationController:(id)a3 didChangeDeliveryTimesActiveSelection:(id)a4 appBundleIdentifiersActiveSelection:(id)a5;
- (void)digestOnboardingNavigationController:(id)a3 didScheduleDigestDeliveryTimes:(id)a4 forAppBundleIdentifiers:(id)a5;
- (void)digestOnboardingNavigationControllerDidDeferSetup:(id)a3;
- (void)digestOnboardingSuggestionClient:(id)a3 didSuggestOnboarding:(id)a4;
- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4;
- (void)handleWake:(BOOL)a3;
- (void)insertNotificationRequest:(id)a3;
- (void)listViewControllerPresentedByUserAction;
- (void)loadView;
- (void)migrateNotifications;
- (void)modalNavigationControllerDidDismiss:(id)a3;
- (void)modeManager:(id)a3 didUpdateCurrentModeConfiguration:(id)a4 previousModeConfiguration:(id)a5;
- (void)modifyNotificationRequest:(id)a3;
- (void)notificationListBaseComponent:(id)a3 closeSwipeInteractions:(BOOL)a4;
- (void)notificationListBaseComponent:(id)a3 didAddViewController:(id)a4;
- (void)notificationListBaseComponent:(id)a3 didBeginUserInteractionWithViewController:(id)a4;
- (void)notificationListBaseComponent:(id)a3 didEndUserInteractionWithViewController:(id)a4;
- (void)notificationListBaseComponent:(id)a3 didPresentCoalescingControlsHandler:(id)a4 inForceTouchState:(BOOL)a5;
- (void)notificationListBaseComponent:(id)a3 didRemoveViewController:(id)a4;
- (void)notificationListBaseComponent:(id)a3 didTransitionActionsForSwipeInteraction:(id)a4 revealed:(BOOL)a5;
- (void)notificationListBaseComponent:(id)a3 didTransitionCoalescingControlsHandler:(id)a4 toClearState:(BOOL)a5;
- (void)notificationListBaseComponent:(id)a3 didUpdateViewController:(id)a4;
- (void)notificationListBaseComponent:(id)a3 requestsClearingPresentables:(id)a4;
- (void)notificationListBaseComponent:(id)a3 requestsModalPresentationOfNavigationController:(id)a4 sender:(id)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)notificationListBaseComponent:(id)a3 willUpdateViewController:(id)a4;
- (void)notificationListBaseComponentDidSignificantUserInteraction:(id)a3;
- (void)notificationListComponent:(id)a3 acceptedSummaryOnboarding:(BOOL)a4;
- (void)notificationListComponent:(id)a3 didPresentSectionHeaderView:(id)a4 inForceTouchState:(BOOL)a5;
- (void)notificationListComponent:(id)a3 didTransitionSectionHeaderView:(id)a4 toClearState:(BOOL)a5;
- (void)notificationListComponent:(id)a3 isPresentingLongLookForViewController:(id)a4;
- (void)notificationListComponent:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotificationRequest:(id)a5 withParameters:(id)a6 completion:(id)a7;
- (void)notificationListComponent:(id)a3 requestsAuthenticationAndPerformBlock:(id)a4;
- (void)notificationListComponent:(id)a3 requestsClearingNotificationRequestsInSections:(id)a4;
- (void)notificationListComponent:(id)a3 requestsExecuteAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8;
- (void)notificationListComponent:(id)a3 requestsPresentingManagementViewForNotificationRequest:(id)a4 managementViewType:(unint64_t)a5 withPresentingView:(id)a6 completion:(id)a7;
- (void)notificationListComponent:(id)a3 requestsPresentingOptionsMenuForNotificationRequest:(id)a4 presentingViewProvider:(id)a5 optionsForSection:(BOOL)a6 completion:(id)a7;
- (void)notificationListComponent:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)notificationListComponent:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)notificationListComponent:(id)a3 setModeConfiguration:(id)a4;
- (void)notificationListComponent:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7;
- (void)notificationListComponent:(id)a3 setNotificationSystemSettings:(id)a4;
- (void)notificationListComponent:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)notificationListComponent:(id)a3 shouldFinishLongLookTransitionForNotificationRequest:(id)a4 trigger:(int64_t)a5 withCompletionBlock:(id)a6;
- (void)notificationListComponent:(id)a3 willDismissLongLookForCancelActionForViewController:(id)a4;
- (void)notificationListCountIndicatorViewController:(id)a3 didChangeVisibility:(BOOL)a4;
- (void)notificationListCountIndicatorViewControllerDidUpdate:(id)a3;
- (void)notificationListCountIndicatorViewControllerLongPressed:(id)a3 presentingView:(id)a4;
- (void)notificationListCountIndicatorViewControllerTapped:(id)a3;
- (void)notificationManagementViewPresenter:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8;
- (void)notificationManagementViewPresenter:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7;
- (void)notificationManagementViewPresenter:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenterDidDismissManagementView:(id)a3;
- (void)notificationManagementViewPresenterWillPresentManagementView:(id)a3;
- (void)notificationOptionsMenu:(id)a3 addSenderToContactsForNotificationRequest:(id)a4 withSectionIdentifier:(id)a5;
- (void)notificationOptionsMenu:(id)a3 requestsClearingSectionWithIdentifier:(id)a4;
- (void)notificationOptionsMenu:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationOptionsMenu:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationOptionsMenu:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationOptionsMenu:(id)a3 setModeConfiguration:(id)a4;
- (void)notificationOptionsMenu:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8;
- (void)notificationOptionsMenu:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationOptionsMenuWillDismiss:(id)a3;
- (void)notificationRootList:(id)a3 displayStyleSettingChanged:(int64_t)a4;
- (void)notificationRootList:(id)a3 requestsClearingFromIncomingSectionNotificationRequests:(id)a4;
- (void)notificationRootList:(id)a3 scrollViewDidScroll:(id)a4;
- (void)notificationRootList:(id)a3 scrollViewWillBeginDragging:(id)a4;
- (void)notificationRootList:(id)a3 scrollViewWillEndDragging:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6;
- (void)notificationRootListDidScrollToRevealNotificationHistory:(id)a3;
- (void)notificationRootListDidUpdateVisibleContentExtent:(id)a3;
- (void)notificationRootListWillExpandNotificationListCount:(id)a3;
- (void)notificationStructuredListView:(id)a3 didChangeFooterCenterY:(double)a4;
- (void)notificationsLoadedForSectionIdentifier:(id)a3;
- (void)notifyContentObservers;
- (void)removeContentObserver:(id)a3;
- (void)removeNotificationRequest:(id)a3;
- (void)removeOverrideNotificationListDisplayStyleSettingForReason:(id)a3;
- (void)revealNotificationHistory:(BOOL)a3 animated:(BOOL)a4;
- (void)setAllNotificationRequests:(id)a3;
- (void)setBackgroundBlurred:(BOOL)a3;
- (void)setCaptureOnlyMaterialViewController:(id)a3;
- (void)setCoalescingControlsHandlerInForceTouchState:(id)a3;
- (void)setCountIndicatorViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setDigestOnboardingLastBundleIdentifiersSelection:(id)a3;
- (void)setDigestOnboardingLastScheduledDeliveryTimesSelection:(id)a3;
- (void)setDigestOnboardingSuggestion:(id)a3;
- (void)setDigestOnboardingSuggestionClient:(id)a3;
- (void)setDigestOnboardingSuggestionLogging:(id)a3;
- (void)setDigestOnboardingSuggestionPresentationTime:(id)a3;
- (void)setHeaderViewInForceTouchState:(id)a3;
- (void)setHomeAffordancePanGesture:(id)a3;
- (void)setHomeAffordanceVisible:(BOOL)a3;
- (void)setInternalToolsOverlayView:(id)a3;
- (void)setListModel:(id)a3;
- (void)setListView:(id)a3;
- (void)setManagementViewPresenter:(id)a3;
- (void)setModalNavigationController:(id)a3;
- (void)setModeManager:(id)a3;
- (void)setNotificationListComponentPresentingOptionsMenu:(id)a3;
- (void)setNotificationListExpandsVisibleRegionOnSignificantScroll:(BOOL)a3;
- (void)setNotificationRequestRemovedWhilePresentingLongLook:(id)a3;
- (void)setNotificationViewControllerPresentingLongLook:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOptionsMenu:(id)a3;
- (void)setOverrideNotificationListDisplayStyleSetting:(int64_t)a3 forReason:(id)a4 hideNotificationCount:(BOOL)a5;
- (void)setShowNotificationsInAlwaysOn:(BOOL)a3;
- (void)setTestRecipeSupplementaryViewsContainer:(id)a3;
- (void)setTouchEaterManager:(id)a3;
- (void)switchViews;
- (void)toggleFilteringForSectionIdentifier:(id)a3 shouldFilter:(BOOL)a4;
- (void)toolsOverlayViewRequestsBeginUserInteraction:(id)a3;
- (void)toolsOverlayViewRequestsEndUserInteraction:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4;
- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillMoveToWindow:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation NCNotificationStructuredListViewController

- (NCNotificationStructuredListViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationStructuredListViewController;
  v2 = [(NCNotificationStructuredListViewController *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_backgroundBlurred = 1;
    v2->_itemSpacing = 8.0;
    double v4 = _NCNotificationListInsetMarginHorizontal();
    v3->_insetMargins.top = 0.0;
    v3->_insetMargins.left = v4;
    v3->_insetMargins.bottom = 0.0;
    v3->_insetMargins.right = v4;
    v5 = objc_alloc_init(NCNotificationManagementViewPresenter);
    managementViewPresenter = v3->_managementViewPresenter;
    v3->_managementViewPresenter = v5;

    [(NCNotificationManagementViewPresenter *)v3->_managementViewPresenter setDelegate:v3];
    v7 = objc_alloc_init(NCModeManager);
    modeManager = v3->_modeManager;
    v3->_modeManager = v7;
  }
  return v3;
}

- (void)loadView
{
  v3 = [NCNotificationStructuredListView alloc];
  double v4 = -[NCNotificationStructuredListView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NCNotificationStructuredListView *)v4 setDelegate:self];
  [(NCNotificationStructuredListViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationStructuredListViewController;
  [(NCNotificationStructuredListViewController *)&v11 viewDidLoad];
  +[NCSupplementaryViewPrototypeRecipe registerRecipeWithDelegate:self];
  v3 = objc_alloc_init(NCNotificationListCountIndicatorViewController);
  countIndicatorViewController = self->_countIndicatorViewController;
  self->_countIndicatorViewController = v3;

  [(NCNotificationListCountIndicatorViewController *)self->_countIndicatorViewController setDelegate:self];
  [(NCNotificationStructuredListViewController *)self addChildViewController:self->_countIndicatorViewController];
  [(NCNotificationListCountIndicatorViewController *)self->_countIndicatorViewController didMoveToParentViewController:self];
  v5 = [(NCNotificationStructuredListViewController *)self _listViewContainer];
  v6 = [(NCNotificationListCountIndicatorViewController *)self->_countIndicatorViewController view];
  [v5 setFooterView:v6];

  [(NCNotificationStructuredListViewController *)self _loadListViewAndModelIfNecessary];
  [(NCNotificationStructuredListViewController *)self _listenToUserDefaultsToSwitchListViewAndModelIfNecessary];
  v7 = objc_alloc_init(NCMaterialDisplayingCaptureOnlyViewController);
  captureOnlyMaterialViewController = self->_captureOnlyMaterialViewController;
  self->_captureOnlyMaterialViewController = v7;

  v9 = [(NCMaterialDisplayingCaptureOnlyViewController *)self->_captureOnlyMaterialViewController traitOverrides];
  objc_super v10 = self;
  [v9 setNSIntegerValue:1 forTrait:v10];

  [(NCModeManager *)self->_modeManager addObserver:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationStructuredListViewController;
  [(NCNotificationStructuredListViewController *)&v4 viewWillAppear:a3];
  [(NCNotificationStructuredListViewController *)self _resetListStateBeforeUIAppears];
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationStructuredListViewController;
  [(NCNotificationStructuredListViewController *)&v13 viewDidAppear:a3];
  objc_super v4 = [(NCNotificationStructuredListViewController *)self view];
  [v4 frame];
  -[NCNotificationStructuredListViewController _updateListVisibleAreaForSize:](self, "_updateListVisibleAreaForSize:", v5, v6);

  if (!self->_touchEaterManager)
  {
    v7 = [(NCNotificationStructuredListViewController *)self view];
    v8 = [v7 window];

    if (v8)
    {
      v9 = [NCNotificationListTouchEaterManager alloc];
      objc_super v10 = [(NCNotificationStructuredListViewController *)self view];
      objc_super v11 = [(NCNotificationListTouchEaterManager *)v9 initForView:v10];
      touchEaterManager = self->_touchEaterManager;
      self->_touchEaterManager = v11;
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationStructuredListViewController;
  -[NCNotificationStructuredListViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  double v5 = [(NCNotificationStructuredListViewController *)self managementViewPresenter];
  [v5 dismissManagementViewIfPresentedAnimated:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(NCModalNavigationController *)self->_modalNavigationController dismissViewControllerAnimated:v3 completion:0];
  }
  double v6 = [(NCNotificationStructuredListViewController *)self optionsMenu];
  [v6 dismissMenu];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationStructuredListViewController;
  [(NCNotificationStructuredListViewController *)&v5 viewDidDisappear:a3];
  [(NCNotificationStructuredListViewController *)self _resetSwipeInteractionWithRevealedActionsAnimated:0];
  [(NCNotificationListTouchEaterManager *)self->_touchEaterManager removeTouchGestureRecognizer];
  touchEaterManager = self->_touchEaterManager;
  self->_touchEaterManager = 0;
}

- (void)viewWillMoveToWindow:(id)a3
{
  if (!a3)
  {
    id v8 = [(NCNotificationStructuredListViewController *)self view];
    objc_super v5 = [v8 window];
    double v6 = [v5 windowScene];
    objc_super v7 = [v6 _alwaysOnEnvironment];
    [v7 removeObserver:self];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationStructuredListViewController;
  [(NCNotificationStructuredListViewController *)&v15 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (!self->_touchEaterManager)
  {
    objc_super v7 = [(NCNotificationStructuredListViewController *)self view];
    id v8 = [v7 window];

    if (v8)
    {
      v9 = [NCNotificationListTouchEaterManager alloc];
      objc_super v10 = [(NCNotificationStructuredListViewController *)self view];
      objc_super v11 = [(NCNotificationListTouchEaterManager *)v9 initForView:v10];
      touchEaterManager = self->_touchEaterManager;
      self->_touchEaterManager = v11;
    }
  }
  if (v6)
  {
    objc_super v13 = [v6 windowScene];
    v14 = [v13 _alwaysOnEnvironment];
    [v14 addObserver:self];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NCNotificationRootList)listModel
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = self->_listModel;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationStructuredListViewController;
  -[NCNotificationStructuredListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  -[NCNotificationStructuredListViewController _updateListVisibleAreaForSize:](self, "_updateListVisibleAreaForSize:", width, height);
}

- (void)insertNotificationRequest:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = (os_log_t *)MEMORY[0x1E4FB3778];
  id v6 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = v6;
    id v8 = [(NCNotificationStructuredListViewController *)self _logDescription];
    v9 = [v4 notificationIdentifier];
    objc_super v10 = objc_msgSend(v9, "un_logDigest");
    int v28 = 138543618;
    v29 = v8;
    __int16 v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting notification request %{public}@", (uint8_t *)&v28, 0x16u);
  }
  allNotificationRequests = self->_allNotificationRequests;
  if (allNotificationRequests)
  {
    v12 = [v4 sectionIdentifier];
    objc_super v13 = [(NSMutableDictionary *)allNotificationRequests objectForKey:v12];

    if (!v13)
    {
      v14 = self->_allNotificationRequests;
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v16 = [v4 sectionIdentifier];
      [(NSMutableDictionary *)v14 setObject:v15 forKey:v16];
    }
    v17 = self->_allNotificationRequests;
    v18 = [v4 sectionIdentifier];
    v19 = [(NSMutableDictionary *)v17 objectForKey:v18];
    v20 = [v4 notificationIdentifier];
    [v19 setObject:v4 forKey:v20];

    [(NCNotificationStructuredListViewController *)self _updateDebugHUD];
  }
  if ([(NCNotificationStructuredListViewController *)self _forwarNotificationRequestToLongLookIfNecessary:v4])
  {
    os_log_t v21 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v22 = v21;
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      v25 = [v4 notificationIdentifier];
      v26 = objc_msgSend(v25, "un_logDigest");
      int v28 = 138543618;
      v29 = v24;
      __int16 v30 = 2114;
      v31 = v26;
      _os_log_impl(&dword_1D7C04000, v22, OS_LOG_TYPE_INFO, "%{public}@ forwarded insert notification request %{public}@ to long look", (uint8_t *)&v28, 0x16u);
    }
  }
  else
  {
    v27 = [(NCNotificationStructuredListViewController *)self listModel];
    [v27 insertNotificationRequest:v4];
  }
}

- (void)removeNotificationRequest:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = (os_log_t *)MEMORY[0x1E4FB3778];
  id v6 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = v6;
    id v8 = [(NCNotificationStructuredListViewController *)self _logDescription];
    v9 = [v4 notificationIdentifier];
    objc_super v10 = objc_msgSend(v9, "un_logDigest");
    int v35 = 138543618;
    v36 = v8;
    __int16 v37 = 2114;
    v38 = v10;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@", (uint8_t *)&v35, 0x16u);
  }
  allNotificationRequests = self->_allNotificationRequests;
  if (allNotificationRequests)
  {
    v12 = [v4 sectionIdentifier];
    objc_super v13 = [(NSMutableDictionary *)allNotificationRequests objectForKey:v12];
    v14 = [v4 notificationIdentifier];
    id v15 = [v13 objectForKey:v14];

    if (v15)
    {
      v16 = self->_allNotificationRequests;
      v17 = [v4 sectionIdentifier];
      v18 = [(NSMutableDictionary *)v16 objectForKey:v17];
      v19 = [v4 notificationIdentifier];
      [v18 removeObjectForKey:v19];

      v20 = self->_allNotificationRequests;
      os_log_t v21 = [v4 sectionIdentifier];
      v22 = [(NSMutableDictionary *)v20 objectForKey:v21];
      uint64_t v23 = [v22 count];

      if (!v23)
      {
        v24 = self->_allNotificationRequests;
        v25 = [v4 sectionIdentifier];
        [(NSMutableDictionary *)v24 removeObjectForKey:v25];
      }
      [(NCNotificationStructuredListViewController *)self _updateDebugHUD];
    }
  }
  v26 = [(NCNotificationStructuredListViewController *)self notificationViewControllerPresentingLongLook];
  v27 = [v26 notificationRequest];
  int v28 = [v27 matchesRequest:v4];

  if (v28)
  {
    os_log_t v29 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v30 = v29;
      v31 = [(NCNotificationStructuredListViewController *)self _logDescription];
      uint64_t v32 = [v4 notificationIdentifier];
      v33 = objc_msgSend(v32, "un_logDigest");
      int v35 = 138543618;
      v36 = v31;
      __int16 v37 = 2114;
      v38 = v33;
      _os_log_impl(&dword_1D7C04000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring removal of notification request %{public}@ since it is presented in long look", (uint8_t *)&v35, 0x16u);
    }
    [(NCNotificationStructuredListViewController *)self setNotificationRequestRemovedWhilePresentingLongLook:v4];
  }
  else
  {
    v34 = [(NCNotificationStructuredListViewController *)self listModel];
    [v34 removeNotificationRequest:v4];
  }
}

- (void)modifyNotificationRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = (os_log_t *)MEMORY[0x1E4FB3778];
  id v6 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = v6;
    id v8 = [(NCNotificationStructuredListViewController *)self _logDescription];
    v9 = [v4 notificationIdentifier];
    objc_super v10 = objc_msgSend(v9, "un_logDigest");
    int v21 = 138543618;
    v22 = v8;
    __int16 v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying notification request %{public}@", (uint8_t *)&v21, 0x16u);
  }
  allNotificationRequests = self->_allNotificationRequests;
  if (allNotificationRequests)
  {
    v12 = [v4 sectionIdentifier];
    objc_super v13 = [(NSMutableDictionary *)allNotificationRequests objectForKey:v12];
    v14 = [v4 notificationIdentifier];
    [v13 setObject:v4 forKey:v14];
  }
  if ([(NCNotificationStructuredListViewController *)self _forwarNotificationRequestToLongLookIfNecessary:v4])
  {
    os_log_t v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      v17 = [(NCNotificationStructuredListViewController *)self _logDescription];
      v18 = [v4 notificationIdentifier];
      v19 = objc_msgSend(v18, "un_logDigest");
      int v21 = 138543618;
      v22 = v17;
      __int16 v23 = 2114;
      v24 = v19;
      _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_INFO, "%{public}@ forwarded modify notification request %{public}@ to long look", (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    v20 = [(NCNotificationStructuredListViewController *)self listModel];
    [v20 modifyNotificationRequest:v4];
  }
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_super v10 = [(NCNotificationStructuredListViewController *)self _logDescription];
    objc_super v11 = [v6 sectionIdentifier];
    int v13 = 138543618;
    v14 = v10;
    __int16 v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ updating notification section settings for section %{public}@", (uint8_t *)&v13, 0x16u);
  }
  v12 = [(NCNotificationStructuredListViewController *)self listModel];
  [v12 updateNotificationSectionSettings:v6 previousSectionSettings:v7];
}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_super v10 = [(NCNotificationStructuredListViewController *)self _logDescription];
    int v12 = 138543618;
    int v13 = v10;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ updating notification system settings = %@", (uint8_t *)&v12, 0x16u);
  }
  objc_super v11 = [(NCNotificationStructuredListViewController *)self listModel];
  [v11 updateNotificationSystemSettings:v6 previousSystemSettings:v7];

  [(NCNotificationStructuredListViewController *)self _toggleDigestOnboardingSuggestionIfNecessary];
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(NCNotificationStructuredListViewController *)self _logDescription];
    int v9 = 138543618;
    objc_super v10 = v7;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notifications loaded for section %{public}@", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [(NCNotificationStructuredListViewController *)self listModel];
  [v8 notificationsLoadedForSectionIdentifier:v4];
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_deviceAuthenticated != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = [(NCNotificationStructuredListViewController *)self _logDescription];
      int v9 = 138543618;
      objc_super v10 = v7;
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting device authenticated to %{BOOL}d", (uint8_t *)&v9, 0x12u);
    }
    self->_deviceAuthenticated = v3;
    if (!v3) {
      [(NCNotificationStructuredListViewController *)self _handleDeviceUnauthenticated];
    }
    id v8 = [(NCNotificationStructuredListViewController *)self listModel];
    [v8 setDeviceAuthenticated:v3];

    [(NCNotificationStructuredListViewController *)self _resetSwipeInteractionWithRevealedActionsAnimated:1];
  }
}

- (void)_handleDeviceUnauthenticated
{
  if ([(NCNotificationStructuredListViewController *)self isPresentingNotificationInLongLook])
  {
    BOOL v3 = [(NCNotificationStructuredListViewController *)self notificationViewControllerPresentingLongLook];
    id v6 = [v3 notificationRequest];

    id v4 = [v6 options];
    uint64_t v5 = [v4 contentPreviewSetting];

    if (v5) {
      [(NCNotificationStructuredListViewController *)self dismissModalFullScreenAnimated:0];
    }
  }
}

- (UIScrollView)scrollView
{
  [(NCNotificationStructuredListViewController *)self loadViewIfNeeded];
  listView = self->_listView;

  return (UIScrollView *)listView;
}

- (BOOL)hasVisibleContent
{
  v2 = [(NCNotificationStructuredListViewController *)self listModel];
  BOOL v3 = [v2 notificationCount] != 0;

  return v3;
}

- (BOOL)hasVisibleContentToReveal
{
  v2 = [(NCNotificationStructuredListViewController *)self listModel];
  char v3 = [v2 hasVisibleContentToReveal];

  return v3;
}

- (BOOL)hasVisibleUrgentBreakthroughContent
{
  v2 = [(NCNotificationStructuredListViewController *)self listModel];
  char v3 = [v2 hasVisibleUrgentBreakthroughContent];

  return v3;
}

- (void)migrateNotifications
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    uint64_t v5 = [(NCNotificationStructuredListViewController *)self _logDescription];
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating notification requests", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(NCNotificationStructuredListViewController *)self listModel];
  [v6 migrateNotificationsFromIncomingSectionToHistorySection];
}

- (void)toggleFilteringForSectionIdentifier:(id)a3 shouldFilter:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    uint64_t v9 = [(NCNotificationStructuredListViewController *)self _logDescription];
    objc_super v10 = @"OFF";
    *(_DWORD *)BOOL v12 = 138543874;
    *(void *)&v12[4] = v9;
    if (v4) {
      objc_super v10 = @"ON";
    }
    *(_WORD *)&v12[12] = 2112;
    *(void *)&v12[14] = v10;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ turning filtering %@ for section %{public}@", v12, 0x20u);
  }
  __int16 v11 = [(NCNotificationStructuredListViewController *)self listModel];
  [v11 toggleFilteringForSectionIdentifier:v6 shouldFilter:v4];
}

- (CGSize)effectiveContentSize
{
  v2 = [(NCNotificationStructuredListViewController *)self scrollView];
  [v2 contentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)dismissModalFullScreenAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  double v5 = [(NCNotificationStructuredListViewController *)self notificationViewControllerPresentingLongLook];
  double v6 = [(NCNotificationStructuredListViewController *)self headerViewInForceTouchState];
  uint64_t v7 = [(NCNotificationStructuredListViewController *)self coalescingControlsHandlerInForceTouchState];
  double v8 = (void *)v7;
  if (v5)
  {
    uint64_t v9 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = v9;
      __int16 v11 = [(NCNotificationStructuredListViewController *)self _logDescription];
      BOOL v12 = [v5 notificationRequest];
      __int16 v13 = [v12 notificationIdentifier];
      id v14 = objc_msgSend(v13, "un_logDigest");
      int v33 = 138543618;
      v34 = v11;
      __int16 v35 = 2114;
      v36 = v14;
      _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing presented long look for notification request %{public}@", (uint8_t *)&v33, 0x16u);
    }
    char v15 = [v5 dismissPresentedViewControllerAnimated:v3];
    goto LABEL_14;
  }
  if (v6)
  {
    uint64_t v16 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v16;
      v18 = [(NCNotificationStructuredListViewController *)self _logDescription];
      v19 = [v6 sectionIdentifier];
      int v33 = 138543618;
      v34 = v18;
      __int16 v35 = 2114;
      v36 = v19;
      _os_log_impl(&dword_1D7C04000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing header view in force touch state for section %{public}@", (uint8_t *)&v33, 0x16u);
    }
    v20 = v6;
LABEL_13:
    char v15 = [v20 dismissModalFullScreenIfNeeded];
LABEL_14:
    BOOL v24 = v15;
    goto LABEL_15;
  }
  if (v7)
  {
    int v21 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      __int16 v23 = [(NCNotificationStructuredListViewController *)self _logDescription];
      int v33 = 138543362;
      v34 = v23;
      _os_log_impl(&dword_1D7C04000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing coalescing controls in force touch state", (uint8_t *)&v33, 0xCu);
    }
    v20 = v8;
    goto LABEL_13;
  }
  if (self->_modalNavigationController
    && ([(NCNotificationStructuredListViewController *)self presentedViewController],
        v26 = (NCModalNavigationController *)objc_claimAutoreleasedReturnValue(),
        modalNavigationController = self->_modalNavigationController,
        v26,
        v26 == modalNavigationController))
  {
    int v28 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v29 = v28;
      __int16 v30 = [(NCNotificationStructuredListViewController *)self _logDescription];
      v31 = (objc_class *)objc_opt_class();
      uint64_t v32 = NSStringFromClass(v31);
      int v33 = 138543618;
      v34 = v30;
      __int16 v35 = 2114;
      v36 = v32;
      _os_log_impl(&dword_1D7C04000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing navigation controller of type '%{public}@'.", (uint8_t *)&v33, 0x16u);
    }
    [(NCNotificationStructuredListViewController *)self dismissViewControllerAnimated:v3 completion:0];
    BOOL v24 = 1;
  }
  else
  {
    BOOL v24 = 0;
  }
LABEL_15:

  return v24;
}

- (BOOL)isContentExtensionVisible:(id)a3
{
  id v4 = a3;
  double v5 = [(NCNotificationStructuredListViewController *)self notificationViewControllerPresentingLongLook];
  char v6 = [v5 isContentExtensionVisible:v4];

  return v6;
}

- (BOOL)isPresentingNotificationInLongLook
{
  v2 = [(NCNotificationStructuredListViewController *)self notificationViewControllerPresentingLongLook];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)revealNotificationHistory:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    double v8 = v7;
    uint64_t v9 = [(NCNotificationStructuredListViewController *)self _logDescription];
    objc_super v10 = (void *)v9;
    __int16 v11 = @"HIDING";
    if (v5) {
      __int16 v11 = @"REVEALING";
    }
    int v15 = 138543618;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %@ notification history", (uint8_t *)&v15, 0x16u);
  }
  BOOL v12 = [(NCNotificationStructuredListViewController *)self listModel];
  [v12 setNotificationHistoryRevealed:v5];

  if (!v5)
  {
    __int16 v13 = [(NCNotificationStructuredListViewController *)self managementViewPresenter];
    [v13 dismissManagementViewIfPresentedAnimated:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NCModalNavigationController *)self->_modalNavigationController dismissViewControllerAnimated:v4 completion:0];
    }
    id v14 = [(NCNotificationStructuredListViewController *)self optionsMenu];
    [v14 dismissMenu];

    [(NCNotificationStructuredListViewController *)self _resetSwipeInteractionWithRevealedActionsAnimated:0];
  }
  [(NCNotificationStructuredListViewController *)self notifyContentObservers];
}

- (BOOL)isHomeAffordanceVisible
{
  v2 = [(NCNotificationStructuredListViewController *)self notificationViewControllerPresentingLongLook];
  char v3 = [v2 isCustomContentHomeAffordanceVisible];

  return v3;
}

- (void)setHomeAffordanceVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationStructuredListViewController *)self notificationViewControllerPresentingLongLook];
  [v4 setCustomContentHomeAffordanceVisible:v3];
}

- (UIPanGestureRecognizer)homeAffordancePanGesture
{
  v2 = [(NCNotificationStructuredListViewController *)self notificationViewControllerPresentingLongLook];
  BOOL v3 = [v2 customContentHomeAffordanceGestureRecognizer];

  return (UIPanGestureRecognizer *)v3;
}

- (void)setHomeAffordancePanGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredListViewController *)self notificationViewControllerPresentingLongLook];
  [v5 setCustomContentHomeAffordanceGestureRecognizer:v4];
}

- (void)listViewControllerPresentedByUserAction
{
  id v2 = [(NCNotificationStructuredListViewController *)self listModel];
  [v2 listViewControllerPresentedByUserAction];
}

- (void)handleWake:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationStructuredListViewController *)self listModel];
  [v4 handleWake:v3];
}

- (id)newCaptureOnlyMaterialViewController
{
  return self->_captureOnlyMaterialViewController;
}

- (BOOL)interpretsViewAsContent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (NCNotificationListViewProtocol *)a3;
  if (v4
    && ([(NCNotificationStructuredListViewController *)self view],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [(NCNotificationListViewProtocol *)v4 isDescendantOfView:v5],
        v5,
        v6)
    && self->_listView != v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [(NCNotificationStructuredListViewController *)self listModel];
    double v8 = [v7 notificationSections];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) listView];

          if (v13 == v4)
          {
            BOOL v14 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 1;
LABEL_16:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)insertSupplementaryViewsContainerAtListPosition:(unint64_t)a3 identifier:(id)a4 withDescription:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(NCNotificationStructuredListViewController *)self loadViewIfNeeded];
  uint64_t v10 = [(NCNotificationStructuredListViewController *)self listModel];
  uint64_t v11 = [v10 insertSupplementaryViewsContainerAtListPosition:a3 identifier:v9 withDescription:v8];

  return v11;
}

- (void)setOverrideNotificationListDisplayStyleSetting:(int64_t)a3 forReason:(id)a4 hideNotificationCount:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [(NCNotificationStructuredListViewController *)self listModel];
  [v9 setOverrideNotificationListDisplayStyleSetting:a3 forReason:v8 hideNotificationCount:v5];
}

- (void)removeOverrideNotificationListDisplayStyleSettingForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredListViewController *)self listModel];
  [v5 removeOverrideNotificationListDisplayStyleSettingForReason:v4];
}

- (CGPoint)scrollViewVisibleContentLayoutOffset
{
  [(NCNotificationRootList *)self->_listModel scrollViewVisibleContentLayoutOffsetY];
  double v3 = v2;
  double v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (BOOL)isScrollingListContent
{
  double v2 = [(NCNotificationStructuredListViewController *)self listModel];
  char v3 = [v2 isScrollingListContent];

  return v3;
}

- (BOOL)isOverlayFooterContentVisible
{
  return 0;
}

- (BOOL)notificationListExpandsVisibleRegionOnSignificantScroll
{
  double v2 = [(NCNotificationStructuredListViewController *)self listModel];
  char v3 = [v2 expandsVisibleRegionOnSignificantScroll];

  return v3;
}

- (void)setNotificationListExpandsVisibleRegionOnSignificantScroll:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NCNotificationStructuredListViewController *)self listModel];
  [v5 setExpandsVisibleRegionOnSignificantScroll:v3];

  listModel = self->_listModel;
  id v9 = [(NCNotificationStructuredListViewController *)self view];
  [v9 frame];
  -[NCNotificationRootList updateListViewVisibleRectForSize:](listModel, "updateListViewVisibleRectForSize:", v7, v8);
}

- (unint64_t)visibleNotificationCount
{
  double v2 = [(NCNotificationStructuredListViewController *)self listModel];
  unint64_t v3 = [v2 visibleNotificationCount];

  return v3;
}

- (CGRect)visibleContentExtent
{
  double v2 = [(NCNotificationStructuredListViewController *)self listModel];
  [v2 aggregatedVisibleContentExtent];
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
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)addContentObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    double v6 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
    double v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeContentObserver:(id)a3
{
  id v4 = a3;
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:")) {
    [(NSHashTable *)self->_observers removeObject:v4];
  }
}

- (void)notifyContentObservers
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v3 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    double v5 = [(NCNotificationStructuredListViewController *)self _logDescription];
    double v6 = [(NCNotificationStructuredListViewController *)self listModel];
    uint64_t v7 = [v6 incomingCount];
    id v8 = [(NCNotificationStructuredListViewController *)self listModel];
    double v9 = [v8 incomingTitle];
    *(_DWORD *)buf = 138543874;
    v26 = v5;
    __int16 v27 = 2048;
    uint64_t v28 = v7;
    __int16 v29 = 2114;
    __int16 v30 = v9;
    _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ notifyContentObservers; incomingCount %lu; incomingTitle: %{public}@",
      buf,
      0x20u);
  }
  double v10 = [(NCNotificationStructuredListViewController *)self countIndicatorViewController];
  double v11 = [(NCNotificationStructuredListViewController *)self listModel];
  objc_msgSend(v10, "setCount:", objc_msgSend(v11, "incomingCount"));

  double v12 = [(NCNotificationStructuredListViewController *)self countIndicatorViewController];
  double v13 = [(NCNotificationStructuredListViewController *)self listModel];
  double v14 = [v13 incomingTitle];
  [v12 setIncomingTitle:v14];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v15 = [(NCNotificationStructuredListViewController *)self observers];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v19++), "structuredListContentChanged:", -[NCNotificationStructuredListViewController hasVisibleContent](self, "hasVisibleContent"));
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }
}

- (unint64_t)requestsUnrevealedCountForNotificationStructuredListView:(id)a3
{
  double v3 = [(NCNotificationStructuredListViewController *)self listModel];
  unint64_t v4 = [v3 historyCount];

  return v4;
}

- (void)notificationStructuredListView:(id)a3 didChangeFooterCenterY:(double)a4
{
  id v7 = [(NCNotificationStructuredListViewController *)self listView];
  *(float *)&double v5 = a4;
  double v6 = [NSNumber numberWithFloat:v5];
  [v7 setFooterCenterY:v6];
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4 = a3;
  double v5 = [(NCNotificationStructuredListViewController *)self listModel];
  [v5 adjustForLegibilitySettingsChange:v4];

  double v6 = [(NCNotificationStructuredListViewController *)self countIndicatorViewController];
  [v6 adjustForLegibilitySettingsChange:v4];

  id v7 = [(NCNotificationStructuredListViewController *)self _listViewContainer];
  [v7 adjustForLegibilitySettingsChange:v4];
}

- (id)containerViewForPreviewInteractionPresentedContentForNotificationListBaseComponent:(id)a3
{
  double v3 = [(UIViewController *)self nc_presentationContextDefiningViewController];
  id v4 = [v3 view];
  double v5 = [v4 superview];

  return v5;
}

- (BOOL)shouldHintDefaultActionForNotificationListBaseComponent:(id)a3
{
  id v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v5 = [v4 notificationStructuredListViewControllerShouldHintForDefaultAction:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)legibilitySettingsForNotificationListBaseComponent:(id)a3
{
  id v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v5 = [v4 legibilitySettingsForNotificationStructuredListViewController:self];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)notificationListBaseComponentDidSignificantUserInteraction:(id)a3
{
  uint64_t v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v4)
  {
    char v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 notificationStructuredListViewControllerDidSignificantUserInteraction:self];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)notificationListBaseComponent:(id)a3 didBeginUserInteractionWithViewController:(id)a4
{
  id v6 = a4;
  char v5 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 notificationStructuredListViewController:self didBeginUserInteractionWithViewController:v6];
  }
}

- (void)notificationListBaseComponent:(id)a3 didEndUserInteractionWithViewController:(id)a4
{
  id v6 = a4;
  char v5 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 notificationStructuredListViewController:self didEndUserInteractionWithViewController:v6];
  }
}

- (void)notificationListBaseComponent:(id)a3 didAddViewController:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v6 parentViewController];

  if (v7 != self)
  {
    captureOnlyMaterialViewController = self->_captureOnlyMaterialViewController;
    double v9 = [(id)objc_opt_class() presentableTypes];
    -[NCMaterialDisplayingCaptureOnlyViewController registerMaterialDisplaying:persistent:](captureOnlyMaterialViewController, "registerMaterialDisplaying:persistent:", v6, [v9 containsObject:objc_opt_class()]);

    [(NCNotificationStructuredListViewController *)self addChildViewController:v6];
    [v6 didMoveToParentViewController:self];
  }
}

- (void)notificationListBaseComponent:(id)a3 didRemoveViewController:(id)a4
{
  id v6 = a4;
  char v5 = [v6 parentViewController];

  if (v5 == self)
  {
    [v6 removeFromParentViewController];
    [v6 didMoveToParentViewController:0];
    [(NCMaterialDisplayingCaptureOnlyViewController *)self->_captureOnlyMaterialViewController unregisterMaterialDisplaying:v6];
  }
}

- (void)notificationListBaseComponent:(id)a3 requestsModalPresentationOfNavigationController:(id)a4 sender:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  [v13 setPresenterDelegate:self];
  [(NCNotificationStructuredListViewController *)self _presentNavigationControllerAndBeginModalInteraction:v13 sender:v12 animated:v7 completion:v11];
}

- (void)notificationListBaseComponent:(id)a3 willUpdateViewController:(id)a4
{
  id v6 = a4;
  char v5 = [v6 parentViewController];

  if (v5 == self) {
    [(NCMaterialDisplayingCaptureOnlyViewController *)self->_captureOnlyMaterialViewController unregisterMaterialDisplaying:v6];
  }
}

- (void)notificationListBaseComponent:(id)a3 didUpdateViewController:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  BOOL v7 = [v6 parentViewController];

  if (v7 == self)
  {
    captureOnlyMaterialViewController = self->_captureOnlyMaterialViewController;
    double v9 = [(id)objc_opt_class() presentableTypes];
    -[NCMaterialDisplayingCaptureOnlyViewController registerMaterialDisplaying:persistent:](captureOnlyMaterialViewController, "registerMaterialDisplaying:persistent:", v6, [v9 containsObject:objc_opt_class()]);
  }
}

- (void)notificationListBaseComponent:(id)a3 requestsClearingPresentables:(id)a4
{
  char v5 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  double v14 = __105__NCNotificationStructuredListViewController_notificationListBaseComponent_requestsClearingPresentables___block_invoke;
  int v15 = &unk_1E6A94400;
  id v9 = v7;
  id v16 = v9;
  id v10 = v8;
  id v17 = v10;
  [v6 enumerateObjectsUsingBlock:&v12];

  id v11 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v11)
  {
    if ([v9 count] && (objc_opt_respondsToSelector() & 1) != 0) {
      [v11 notificationStructuredListViewController:self requestsClearingNotificationRequests:v9];
    }
    if ([v10 count] && (objc_opt_respondsToSelector() & 1) != 0) {
      [v11 notificationStructuredListViewController:self requestsClearingSupplementaryViewControllers:v10];
    }
  }
}

void __105__NCNotificationStructuredListViewController_notificationListBaseComponent_requestsClearingPresentables___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v3 = *(void **)(a1 + 40);
      uint64_t v4 = [v5 hostedViewController];
      [v3 addObject:v4];
    }
  }
}

- (void)notificationListBaseComponent:(id)a3 didTransitionActionsForSwipeInteraction:(id)a4 revealed:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(NCNotificationStructuredListViewController *)self touchEaterManager];
  id v10 = v8;
  if (v5) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  [v8 setSwipeInteractionInRevealedState:v9];
}

- (void)notificationListBaseComponent:(id)a3 closeSwipeInteractions:(BOOL)a4
{
}

- (void)notificationListBaseComponent:(id)a3 didTransitionCoalescingControlsHandler:(id)a4 toClearState:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(NCNotificationStructuredListViewController *)self touchEaterManager];
  id v10 = v8;
  if (v5) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  [v8 setCoalescingControlsHandlerInClearState:v9];
}

- (void)notificationListBaseComponent:(id)a3 didPresentCoalescingControlsHandler:(id)a4 inForceTouchState:(BOOL)a5
{
  if (!a5) {
    a4 = 0;
  }
  objc_storeWeak((id *)&self->_coalescingControlsHandlerInForceTouchState, a4);
}

- (void)notificationListComponent:(id)a3 requestsClearingNotificationRequestsInSections:(id)a4
{
  id v6 = a4;
  BOOL v5 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 notificationStructuredListViewController:self requestsClearingNotificationRequestsInSections:v6];
  }
}

- (void)notificationListComponent:(id)a3 didTransitionSectionHeaderView:(id)a4 toClearState:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(NCNotificationStructuredListViewController *)self touchEaterManager];
  id v10 = v8;
  if (v5) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  [v8 setHeaderViewInClearState:v9];
}

- (void)notificationListComponent:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotificationRequest:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  int v15 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    id v17 = [(NCNotificationStructuredListViewController *)self _logDescription];
    uint64_t v18 = [v11 identifier];
    uint64_t v19 = [v12 notificationIdentifier];
    long long v20 = objc_msgSend(v19, "un_logDigest");
    int v22 = 138543874;
    long long v23 = v17;
    __int16 v24 = 2114;
    uint64_t v25 = v18;
    __int16 v26 = 2114;
    __int16 v27 = v20;
    _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ requests permission to execute action %{public}@ for notification request %{public}@", (uint8_t *)&v22, 0x20u);
  }
  long long v21 = [(NCNotificationStructuredListViewController *)self delegate];
  [v21 notificationStructuredListViewController:self requestPermissionToExecuteAction:v11 forNotificationRequest:v12 withParameters:v13 completion:v14];
}

- (void)notificationListComponent:(id)a3 requestsExecuteAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8
{
  uint64_t v10 = a6;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = v17;
    [(NCNotificationStructuredListViewController *)self _logDescription];
    v19 = unsigned int v24 = v10;
    long long v20 = [v13 identifier];
    long long v21 = [v14 notificationIdentifier];
    int v22 = objc_msgSend(v21, "un_logDigest");
    *(_DWORD *)buf = 138543874;
    __int16 v26 = v19;
    __int16 v27 = 2114;
    uint64_t v28 = v20;
    __int16 v29 = 2114;
    __int16 v30 = v22;
    _os_log_impl(&dword_1D7C04000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ requests executing action %{public}@ for notification request %{public}@", buf, 0x20u);

    uint64_t v10 = v24;
  }
  [(NCNotificationManagementViewPresenter *)self->_managementViewPresenter dismissManagementViewIfPresentedAnimated:1];
  long long v23 = [(NCNotificationStructuredListViewController *)self delegate];
  [v23 notificationStructuredListViewController:self requestsExecuteAction:v13 forNotificationRequest:v14 requestAuthentication:v10 withParameters:v15 completion:v16];
}

- (void)notificationListComponent:(id)a3 willDismissLongLookForCancelActionForViewController:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [(NCNotificationStructuredListViewController *)self _logDescription];
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will dismiss long look for cancel action for view controller %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(NCNotificationManagementViewPresenter *)self->_managementViewPresenter dismissManagementViewIfPresentedAnimated:1];
}

- (id)notificationListComponent:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  return [(NCNotificationStructuredListViewController *)self _sectionSettingsForSectionIdentifier:a4];
}

- (BOOL)notificationListComponent:(id)a3 shouldAllowInteractionsForNotificationRequest:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v7 = [v6 notificationStructuredListViewController:self shouldAllowInteractionsForNotificationRequest:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (id)notificationListComponent:(id)a3 containerViewProviderForExpandedContentForViewController:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    char v7 = [WeakRetained notificationStructuredListViewController:self containerViewProviderForExpandedContentForViewController:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)notificationListComponent:(id)a3 shouldFinishLongLookTransitionForNotificationRequest:(id)a4 trigger:(int64_t)a5 withCompletionBlock:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = [(NCNotificationStructuredListViewController *)self delegate];
  [v11 notificationStructuredListViewController:self shouldFinishLongLookTransitionForNotificationRequest:v10 trigger:a5 withCompletionBlock:v9];
}

- (void)notificationListComponent:(id)a3 isPresentingLongLookForViewController:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(NCNotificationStructuredListViewController *)self notificationViewControllerPresentingLongLook];
  if (v6 == v5) {
    goto LABEL_17;
  }
  char v7 = (os_log_t *)MEMORY[0x1E4FB3778];
  id v8 = (void *)*MEMORY[0x1E4FB3778];
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v9) {
      goto LABEL_8;
    }
    id v10 = v8;
    id v11 = [(NCNotificationStructuredListViewController *)self _logDescription];
    id v12 = [v5 notificationRequest];
    uint64_t v13 = [v12 notificationIdentifier];
    id v14 = objc_msgSend(v13, "un_logDigest");
    *(_DWORD *)unsigned int v24 = 138543618;
    *(void *)&v24[4] = v11;
    *(_WORD *)&v24[12] = 2114;
    *(void *)&v24[14] = v14;
    id v15 = "%{public}@ presenting long look for notification request %{public}@";
  }
  else
  {
    if (!v9) {
      goto LABEL_8;
    }
    id v10 = v8;
    id v11 = [(NCNotificationStructuredListViewController *)self _logDescription];
    id v12 = [v6 notificationRequest];
    uint64_t v13 = [v12 notificationIdentifier];
    id v14 = objc_msgSend(v13, "un_logDigest");
    *(_DWORD *)unsigned int v24 = 138543618;
    *(void *)&v24[4] = v11;
    *(_WORD *)&v24[12] = 2114;
    *(void *)&v24[14] = v14;
    id v15 = "%{public}@ dismissed long look for notification request %{public}@";
  }
  _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, v15, v24, 0x16u);

LABEL_8:
  -[NCNotificationStructuredListViewController setNotificationViewControllerPresentingLongLook:](self, "setNotificationViewControllerPresentingLongLook:", v5, *(_OWORD *)v24, *(void *)&v24[16], v25);
  id v16 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v16 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v16 notificationStructuredListViewController:self isPresentingLongLookForViewController:v5];
  }
  uint64_t v17 = [(NCNotificationStructuredListViewController *)self notificationRequestRemovedWhilePresentingLongLook];
  uint64_t v18 = (void *)v17;
  if (!v5 && v17)
  {
    os_log_t v19 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = v19;
      long long v21 = [(NCNotificationStructuredListViewController *)self _logDescription];
      int v22 = [v18 notificationIdentifier];
      long long v23 = objc_msgSend(v22, "un_logDigest");
      *(_DWORD *)unsigned int v24 = 138543618;
      *(void *)&v24[4] = v21;
      *(_WORD *)&v24[12] = 2114;
      *(void *)&v24[14] = v23;
      _os_log_impl(&dword_1D7C04000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ on long look dismissal", v24, 0x16u);
    }
    [(NCNotificationStructuredListViewController *)self removeNotificationRequest:v18];
    [(NCNotificationStructuredListViewController *)self setNotificationRequestRemovedWhilePresentingLongLook:0];
  }

LABEL_17:
}

- (void)notificationListComponent:(id)a3 didPresentSectionHeaderView:(id)a4 inForceTouchState:(BOOL)a5
{
  if (!a5) {
    a4 = 0;
  }
  objc_storeWeak((id *)&self->_headerViewInForceTouchState, a4);
}

- (void)notificationListComponent:(id)a3 requestsPresentingManagementViewForNotificationRequest:(id)a4 managementViewType:(unint64_t)a5 withPresentingView:(id)a6 completion:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    uint64_t v17 = [(NCNotificationStructuredListViewController *)self _logDescription];
    uint64_t v18 = [v12 notificationIdentifier];
    os_log_t v19 = objc_msgSend(v18, "un_logDigest");
    long long v20 = [v12 sectionIdentifier];
    *(_DWORD *)buf = 138544130;
    __int16 v30 = v17;
    __int16 v31 = 2114;
    uint64_t v32 = v19;
    __int16 v33 = 2114;
    v34 = v20;
    __int16 v35 = 2048;
    unint64_t v36 = a5;
    _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ requests presenting management view for notification request %{public}@ for section %{public}@ with type %ld", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __176__NCNotificationStructuredListViewController_notificationListComponent_requestsPresentingManagementViewForNotificationRequest_managementViewType_withPresentingView_completion___block_invoke;
  v25[3] = &unk_1E6A94428;
  objc_copyWeak(v28, (id *)buf);
  v28[1] = (id)a5;
  id v21 = v12;
  id v26 = v21;
  id v22 = v13;
  id v27 = v22;
  [(NCNotificationStructuredListViewController *)self _requestAuthenticationAndPerformBlock:v25];
  long long v23 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v23 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v23 notificationStructuredListViewControllerDidSignificantUserInteraction:self];
  }

  objc_destroyWeak(v28);
  objc_destroyWeak((id *)buf);
}

void __176__NCNotificationStructuredListViewController_notificationListComponent_requestsPresentingManagementViewForNotificationRequest_managementViewType_withPresentingView_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    double v3 = [WeakRetained managementViewPresenter];
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = objc_msgSend(WeakRetained, "bs_topPresentedViewController");
    [v3 presentNotificationManagementViewType:v4 forNotificationRequest:v5 withPresentingViewController:v6 withPresentingView:*(void *)(a1 + 40)];
  }
}

- (void)notificationListComponent:(id)a3 requestsPresentingOptionsMenuForNotificationRequest:(id)a4 presentingViewProvider:(id)a5 optionsForSection:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v26 = a7;
  id v15 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    uint64_t v17 = [(NCNotificationStructuredListViewController *)self _logDescription];
    uint64_t v18 = [v13 notificationIdentifier];
    os_log_t v19 = objc_msgSend(v18, "un_logDigest");
    long long v20 = [v13 sectionIdentifier];
    *(_DWORD *)buf = 138544130;
    __int16 v35 = v17;
    __int16 v36 = 2114;
    uint64_t v37 = v19;
    __int16 v38 = 2114;
    uint64_t v39 = v20;
    __int16 v40 = 1024;
    BOOL v41 = v8;
    _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ requests presenting options menu for notification request %{public}@ for section %{public}@ [optionsForSection=%{BOOL}d]", buf, 0x26u);
  }
  objc_initWeak((id *)buf, self);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __176__NCNotificationStructuredListViewController_notificationListComponent_requestsPresentingOptionsMenuForNotificationRequest_presentingViewProvider_optionsForSection_completion___block_invoke;
  v27[3] = &unk_1E6A94478;
  objc_copyWeak(&v32, (id *)buf);
  BOOL v33 = v8;
  id v21 = v12;
  id v28 = v21;
  id v22 = v14;
  id v30 = v22;
  id v23 = v13;
  id v29 = v23;
  id v24 = v26;
  id v31 = v24;
  [(NCNotificationStructuredListViewController *)self _requestAuthenticationAndPerformBlock:v27];
  uint64_t v25 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v25 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v25 notificationStructuredListViewControllerDidSignificantUserInteraction:self];
  }

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);
}

uint64_t __176__NCNotificationStructuredListViewController_notificationListComponent_requestsPresentingOptionsMenuForNotificationRequest_presentingViewProvider_optionsForSection_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v5 = WeakRetained;
    if (*(unsigned char *)(a1 + 72)) {
      [WeakRetained setNotificationListComponentPresentingOptionsMenu:*(void *)(a1 + 32)];
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __176__NCNotificationStructuredListViewController_notificationListComponent_requestsPresentingOptionsMenuForNotificationRequest_presentingViewProvider_optionsForSection_completion___block_invoke_2;
    v8[3] = &unk_1E6A94450;
    v8[4] = v5;
    uint64_t v6 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    char v10 = *(unsigned char *)(a1 + 72);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void __176__NCNotificationStructuredListViewController_notificationListComponent_requestsPresentingOptionsMenuForNotificationRequest_presentingViewProvider_optionsForSection_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 48);
  id v8 = a2;
  [v5 _presentOptionsMenuForNotificationRequest:v6 withPresentingView:a3 optionsForSection:v7];
  id v9 = [*(id *)(a1 + 32) touchEaterManager];
  char v10 = [v8 swipeInteraction];

  [v9 setSwipeInteractionInRevealedState:v10];
  id v11 = [*(id *)(a1 + 32) touchEaterManager];
  [v11 setEnabled:0];
}

- (void)notificationListComponent:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  BOOL v9 = a4;
  id v14 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v13 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v13 notificationStructuredListViewController:self setMuted:v9 untilDate:v14 forSectionIdentifier:v11 threadIdentifier:v12];
  }
}

- (void)notificationListComponent:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v7 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 notificationStructuredListViewController:self setScheduledDelivery:v5 forSectionIdentifier:v8];
  }
}

- (void)notificationListComponent:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v7 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 notificationStructuredListViewController:self setAllowsTimeSensitive:v5 forSectionIdentifier:v8];
  }
}

- (void)notificationListComponent:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v7 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 notificationStructuredListViewController:self setAllowsDirectMessages:v5 forSectionIdentifier:v8];
  }
}

- (id)notificationListComponent:(id)a3 notificationRequestForUUID:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v7 = [v6 notificationStructuredListViewController:self notificationRequestForUUID:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)notificationListComponentRequestsCurrentModeConfiguration:(id)a3
{
  return [(NCModeManager *)self->_modeManager currentModeConfiguration];
}

- (void)notificationListComponent:(id)a3 setModeConfiguration:(id)a4
{
}

- (BOOL)notificationListComponent:(id)a3 isClockNotificationRequest:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v7 = [v6 notificationStructuredListViewController:self isClockNotificationRequest:v5];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)notificationListComponent:(id)a3 requestsAuthenticationAndPerformBlock:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationStructuredListViewController *)self delegate];
  [v6 notificationStructuredListViewController:self requestsAuthenticationAndPerformBlock:v5];
}

- (id)notificationUsageTrackingStateForNotificationListComponent:(id)a3
{
  uint64_t v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = [v4 notificationUsageTrackingStateForNotificationStructuredListViewController:self];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

- (id)notificationListComponent:(id)a3 keyboardAssertionForGestureWindow:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v7 = [v6 notificationStructuredListViewController:self keyboardAssertionForGestureWindow:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)hideHomeAffordanceAnimationSettingsForNotificationListComponent:(id)a3
{
  uint64_t v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = [v4 hideHomeAffordanceAnimationSettingsForNotificationStructuredListViewController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)unhideHomeAffordanceAnimationSettingsForNotificationListComponent:(id)a3
{
  uint64_t v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = [v4 unhideHomeAffordanceAnimationSettingsForNotificationStructuredListViewController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)settleHomeAffordanceAnimationBehaviorDescriptionForNotificationListComponent:(id)a3
{
  uint64_t v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = [v4 settleHomeAffordanceAnimationBehaviorDescriptionForNotificationStructuredListViewController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)notificationListComponentShouldAllowLongPressGesture:(id)a3
{
  uint64_t v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 notificationStructuredListViewControllerShouldAllowLongPressGesture:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)notificationListComponent:(id)a3 acceptedSummaryOnboarding:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = (void *)*MEMORY[0x1E4FB3778];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      BOOL v9 = v7;
      char v10 = [(NCNotificationStructuredListViewController *)self _logDescription];
      int v24 = 138543362;
      uint64_t v25 = v10;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ presenting digest onboarding flow", (uint8_t *)&v24, 0xCu);
    }
    id v11 = [(NCNotificationStructuredListViewController *)self digestOnboardingSuggestionClient];
    id v12 = [(NCNotificationStructuredListViewController *)self digestOnboardingSuggestion];
    [v11 userAcceptedDigestOnboardingSuggestion:v12];

    id v13 = [(NCNotificationStructuredListViewController *)self digestOnboardingSuggestionLogging];
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    id v15 = [(NCNotificationStructuredListViewController *)self digestOnboardingSuggestionPresentationTime];
    [v14 timeIntervalSinceDate:v15];
    objc_msgSend(v13, "logDigestOnboardingSuggestionWithOutcome:timeToResolution:", 1);

    id v16 = NCUserNotificationsUIKitFrameworkBundle();
    uint64_t v17 = [v16 localizedStringForKey:@"NOTIFICATION_DIGEST_ONBOARDING_INTRODUCTION_DISMISS_BUTTON" value:&stru_1F2F516F8 table:0];
    uint64_t v18 = +[NCDigestOnboardingNavigationController navigationControllerWithOnboardingDelegate:self deferButtonText:v17 previousBundleIdentifiersSelection:self->_digestOnboardingLastBundleIdentifiersSelection previousDeliveryTimesSelection:self->_digestOnboardingLastScheduledDeliveryTimesSelection];

    [(NCNotificationStructuredListViewController *)self _presentNavigationControllerAndBeginModalInteraction:v18 sender:v6 animated:1 completion:0];
  }
  else
  {
    if (v8)
    {
      os_log_t v19 = v7;
      long long v20 = [(NCNotificationStructuredListViewController *)self _logDescription];
      int v24 = 138543362;
      uint64_t v25 = v20;
      _os_log_impl(&dword_1D7C04000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing digest onboarding suggestion", (uint8_t *)&v24, 0xCu);
    }
    id v21 = [(NCNotificationStructuredListViewController *)self digestOnboardingSuggestionLogging];
    id v22 = [MEMORY[0x1E4F1C9C8] date];
    id v23 = [(NCNotificationStructuredListViewController *)self digestOnboardingSuggestionPresentationTime];
    [v22 timeIntervalSinceDate:v23];
    objc_msgSend(v21, "logDigestOnboardingSuggestionWithOutcome:timeToResolution:", 0);

    uint64_t v18 = [(NCNotificationStructuredListViewController *)self listModel];
    [v18 setOnboardingSummaryVisible:0];
  }
}

- (void)notificationRootList:(id)a3 displayStyleSettingChanged:(int64_t)a4
{
}

- (Class)notificationRootListNotificationViewControllerClass:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = (void *)[WeakRetained notificationStructuredListViewControllerNotificationViewControllerClass:self];
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)notificationRootList:(id)a3 requestsClearingFromIncomingSectionNotificationRequests:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationStructuredListViewController *)self delegate];
  [v6 notificationStructuredListViewController:self requestsClearingFromIncomingSectionNotificationRequests:v5];
}

- (void)notificationRootListDidUpdateVisibleContentExtent:(id)a3
{
  BOOL v4 = [(NCNotificationStructuredListViewController *)self listModel];
  [v4 aggregatedVisibleContentExtent];
  +[NCListDebugHUDModelBridge plotRect:label:](NCListDebugHUDModelBridge, "plotRect:label:", @"aggregatedVisibleContentExtent");

  uint64_t v5 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v5)
  {
    id v6 = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      [v6 notificationStructuredListViewControllerDidUpdateVisibleContentExtent:self];
    }
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)notificationRootListShouldAllowNotificationHistoryReveal:(id)a3
{
  BOOL v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v5 = [v4 notificationStructuredListViewControllerShouldAllowNotificationHistoryReveal:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)notificationRootListDidScrollToRevealNotificationHistory:(id)a3
{
  uint64_t v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v4)
  {
    char v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 notificationStructuredListViewControllerDidScrollToRevealNotificationHistory:self];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)notificationRootList:(id)a3 scrollViewWillBeginDragging:(id)a4
{
  id v6 = a4;
  char v5 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 scrollViewWillBeginDragging:v6];
  }
}

- (void)notificationRootList:(id)a3 scrollViewDidScroll:(id)a4
{
  id v11 = a4;
  char v5 = [(NCNotificationStructuredListViewController *)self delegate];
  if ([v11 isTracking] && v5)
  {
    if (objc_opt_respondsToSelector()) {
      [v5 notificationStructuredListViewControllerDidSignificantUserInteraction:self];
    }
  }
  else if (!v5)
  {
    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector()) {
    [v5 scrollViewDidScroll:v11];
  }
LABEL_8:
  int v6 = [v11 isTracking];
  char v7 = [(NCNotificationStructuredListViewController *)self _listViewContainer];
  BOOL v8 = v7;
  if (v6)
  {
    BOOL v9 = [(NCNotificationStructuredListViewController *)self listView];
    char v10 = [v9 distanceScrolledBeyondBottomOfContent];
    [v8 setDistanceScrolledBeyondBottomOfContent:v10];
  }
  else
  {
    [v7 setDistanceScrolledBeyondBottomOfContent:0];
  }
}

- (void)notificationRootList:(id)a3 scrollViewWillEndDragging:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6
{
  double y = a5.y;
  double x = a5.x;
  id v12 = a4;
  char v10 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v10, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a6, x, y);
  }
  id v11 = [(NCNotificationStructuredListViewController *)self _listViewContainer];
  [v11 setDistanceScrolledBeyondBottomOfContent:0];
}

- (BOOL)requiresPushOffManagementForNotificationRootList:(id)a3
{
  double v3 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", a3);
  uint64_t v4 = [v3 userInterfaceIdiom];

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || (unint64_t)([(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] - 1) < 2;
}

- (double)cutoffOffsetForNotificationRootList:(id)a3
{
  double v3 = 0.0;
  if (self->_listModel == a3)
  {
    char v5 = [(NCNotificationStructuredListViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      [v5 clippingOffsetForNotificationStructuredListViewController:self];
      double v3 = v6;
    }
  }
  return v3;
}

- (BOOL)notificationRootList:(id)a3 shouldFilterNotificationRequest:(id)a4
{
  id v5 = a4;
  double v6 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v7 = [v6 notificationStructuredListViewController:self shouldFilterNotificationRequest:v5];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)notificationRootListAreHighlightsEnabled:(id)a3
{
  double v3 = [(NCNotificationStructuredListViewController *)self _notificationSystemSettings];
  char v4 = [v3 areHighlightsEnabled];

  return v4;
}

- (void)notificationListComponent:(id)a3 setNotificationSystemSettings:(id)a4
{
  id v6 = a4;
  id v5 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 notificationStructuredListViewController:self setNotificationSystemSettings:v6];
  }
}

- (void)notificationRootListWillExpandNotificationListCount:(id)a3
{
  uint64_t v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 notificationStructuredListViewControllerWillExpandNotificationListCount:self];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)notificationOptionsMenuWillDismiss:(id)a3
{
  [(NCNotificationListTouchEaterManager *)self->_touchEaterManager setEnabled:1];

  [(NCNotificationStructuredListViewController *)self _resetSwipeInteractionWithRevealedActionsAnimated:1];
}

- (id)notificationOptionsMenu:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  return [(NCNotificationStructuredListViewController *)self _sectionSettingsForSectionIdentifier:a4];
}

- (void)notificationOptionsMenu:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    id v15 = [(NCNotificationStructuredListViewController *)self _logDescription];
    id v16 = [v11 notificationIdentifier];
    uint64_t v17 = objc_msgSend(v16, "un_logDigest");
    int v21 = 138544130;
    id v22 = v15;
    __int16 v23 = 1024;
    BOOL v24 = v8;
    __int16 v25 = 2114;
    uint64_t v26 = v17;
    __int16 v27 = 2114;
    id v28 = v12;
    _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set allows notifications = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v21, 0x26u);
  }
  uint64_t v18 = [(NCNotificationStructuredListViewController *)self listModel];
  os_log_t v19 = [v18 suggestionManager];
  [v19 logResponseForNotificationRequest:v11 allowsNotifications:v8];

  long long v20 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v20 notificationStructuredListViewController:self setAllowsNotifications:v8 forSectionIdentifier:v12];
  }
}

- (void)notificationOptionsMenu:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v8 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    id v15 = [(NCNotificationStructuredListViewController *)self _logDescription];
    id v16 = [v11 notificationIdentifier];
    uint64_t v17 = objc_msgSend(v16, "un_logDigest");
    int v19 = 138544130;
    long long v20 = v15;
    __int16 v21 = 1024;
    BOOL v22 = v8;
    __int16 v23 = 2114;
    BOOL v24 = v17;
    __int16 v25 = 2114;
    id v26 = v12;
    _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set allows critical alerts = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v19, 0x26u);
  }
  uint64_t v18 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v18 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v18 notificationStructuredListViewController:self setAllowsCriticalAlerts:v8 forSectionIdentifier:v12];
  }
}

- (void)notificationOptionsMenu:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8
{
  BOOL v10 = a4;
  id v15 = a5;
  id v12 = a7;
  id v13 = a8;
  id v14 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v14 notificationStructuredListViewController:self setMuted:v10 untilDate:v15 forSectionIdentifier:v12 threadIdentifier:v13];
  }
}

- (void)notificationOptionsMenu:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    id v15 = [(NCNotificationStructuredListViewController *)self _logDescription];
    id v16 = [v11 notificationIdentifier];
    uint64_t v17 = objc_msgSend(v16, "un_logDigest");
    int v21 = 138544130;
    BOOL v22 = v15;
    __int16 v23 = 1024;
    BOOL v24 = v8;
    __int16 v25 = 2114;
    id v26 = v17;
    __int16 v27 = 2114;
    id v28 = v12;
    _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set allows time sensitive notifications = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v21, 0x26u);
  }
  uint64_t v18 = [(NCNotificationStructuredListViewController *)self listModel];
  int v19 = [v18 suggestionManager];
  [v19 logResponseForNotificationRequest:v11 allowsTimeSensitive:v8];

  long long v20 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v20 notificationStructuredListViewController:self setAllowsTimeSensitive:v8 forSectionIdentifier:v12];
  }
}

- (void)notificationOptionsMenu:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v6 = a4;
  id v9 = a6;
  BOOL v8 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 notificationStructuredListViewController:self setScheduledDelivery:v6 forSectionIdentifier:v9];
  }
}

- (void)notificationOptionsMenu:(id)a3 addSenderToContactsForNotificationRequest:(id)a4 withSectionIdentifier:(id)a5
{
  id v13 = a4;
  BOOL v6 = [v13 content];
  char v7 = [v6 communicationContext];

  BOOL v8 = [v7 sender];
  if (v8)
  {
    id v9 = [v7 contentURL];
    if (v9)
    {
      id v10 = [MEMORY[0x1E4FB3818] imageDataForContentURL:v9];
    }
    else
    {
      id v10 = 0;
    }
    id v11 = [v13 topLevelSectionIdentifier];
    id v12 = +[NCCreateContactNavigationViewController navigationControllerWithContact:v8 bundleIdentifier:v11 imageData:v10 presenterDelegate:self];

    [(NCNotificationStructuredListViewController *)self _presentNavigationControllerAndBeginModalInteraction:v12 sender:v8 animated:1 completion:0];
  }
}

- (id)notificationOptionsMenuRequestsCurrentModeConfiguration:(id)a3
{
  return [(NCModeManager *)self->_modeManager currentModeConfiguration];
}

- (void)notificationOptionsMenu:(id)a3 setModeConfiguration:(id)a4
{
}

- (void)notificationOptionsMenu:(id)a3 requestsClearingSectionWithIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = [(NCNotificationStructuredListViewController *)self notificationListComponentPresentingOptionsMenu];
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v10 = v9;

    id v11 = [v10 sectionIdentifier];
    int v12 = [v5 isEqualToString:v11];

    if (v12)
    {
      id v13 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v13;
        id v15 = [(NCNotificationStructuredListViewController *)self _logDescription];
        id v16 = [v10 logDescription];
        int v17 = 138543618;
        uint64_t v18 = v15;
        __int16 v19 = 2114;
        long long v20 = v16;
        _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing all notifications for app section %{public}@ triggered from options menu", (uint8_t *)&v17, 0x16u);
      }
      [v10 clearAll];
      [(NCNotificationStructuredListViewController *)self setNotificationListComponentPresentingOptionsMenu:0];
    }
  }
}

- (BOOL)notificationOptionsMenu:(id)a3 isDisplayingStackSummaryForNotificationRequest:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(NCNotificationStructuredListViewController *)self listModel];
  uint64_t v7 = [v6 _sectionContainsNotificationRequest:v5];

  LOBYTE(v6) = [v7 isShowingSummarizedStackForNotificationRequest:v5];
  return (char)v6;
}

- (void)modalNavigationControllerDidDismiss:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NCModalNavigationController *)a3;
  if (self->_modalNavigationController == v4)
  {
    id v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = v5;
      uint64_t v7 = [(NCNotificationStructuredListViewController *)self _logDescription];
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int v12 = 138543618;
      id v13 = v7;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ ending lock screen interaction for dismissed navigation navigation controller of type '%{public}@'.", (uint8_t *)&v12, 0x16u);
    }
    id v10 = [(NCNotificationStructuredListViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v10 notificationStructuredListViewControllerDidEndUserInteraction:self];
    }
    modalNavigationController = self->_modalNavigationController;
    self->_modalNavigationController = 0;
  }
}

- (void)createContactNavigationControllerDidComplete:(id)a3
{
  id v4 = [(NCNotificationStructuredListViewController *)self listModel];
  double v3 = [v4 suggestionManager];
  [v3 reloadContactSuggestions];
}

- (id)notificationManagementViewPresenter:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  return [(NCNotificationStructuredListViewController *)self _sectionSettingsForSectionIdentifier:a4];
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = v13;
    id v15 = [(NCNotificationStructuredListViewController *)self _logDescription];
    uint64_t v16 = [v11 notificationIdentifier];
    int v17 = objc_msgSend(v16, "un_logDigest");
    int v21 = 138544130;
    BOOL v22 = v15;
    __int16 v23 = 1024;
    BOOL v24 = v8;
    __int16 v25 = 2114;
    id v26 = v17;
    __int16 v27 = 2114;
    id v28 = v12;
    _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set allows notifications = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v21, 0x26u);
  }
  uint64_t v18 = [(NCNotificationStructuredListViewController *)self listModel];
  __int16 v19 = [v18 suggestionManager];
  [v19 logResponseForNotificationRequest:v11 allowsNotifications:v8];

  long long v20 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v20 notificationStructuredListViewController:self setAllowsNotifications:v8 forSectionIdentifier:v12];
  }
}

- (void)notificationManagementViewPresenter:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = v13;
    id v15 = [(NCNotificationStructuredListViewController *)self _logDescription];
    uint64_t v16 = [v11 notificationIdentifier];
    int v17 = objc_msgSend(v16, "un_logDigest");
    int v21 = 138544130;
    BOOL v22 = v15;
    __int16 v23 = 1024;
    BOOL v24 = v8;
    __int16 v25 = 2114;
    id v26 = v17;
    __int16 v27 = 2114;
    id v28 = v12;
    _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set deliver quietldouble y = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v21, 0x26u);
  }
  uint64_t v18 = [(NCNotificationStructuredListViewController *)self listModel];
  __int16 v19 = [v18 suggestionManager];
  [v19 logResponseForNotificationRequest:v11 deliveryQuietly:v8];

  long long v20 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v20 notificationStructuredListViewController:self setDeliverQuietly:v8 forSectionIdentifier:v12];
  }
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v8 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = v13;
    id v15 = [(NCNotificationStructuredListViewController *)self _logDescription];
    uint64_t v16 = [v11 notificationIdentifier];
    int v17 = objc_msgSend(v16, "un_logDigest");
    int v19 = 138544130;
    long long v20 = v15;
    __int16 v21 = 1024;
    BOOL v22 = v8;
    __int16 v23 = 2114;
    BOOL v24 = v17;
    __int16 v25 = 2114;
    id v26 = v12;
    _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set allows critical alerts = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v19, 0x26u);
  }
  uint64_t v18 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v18 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v18 notificationStructuredListViewController:self setAllowsCriticalAlerts:v8 forSectionIdentifier:v12];
  }
}

- (void)notificationManagementViewPresenter:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  BOOL v9 = a4;
  id v14 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v13 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v13 notificationStructuredListViewController:self setMuted:v9 untilDate:v14 forSectionIdentifier:v11 threadIdentifier:v12];
  }
}

- (void)notificationManagementViewPresenter:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v7 = a4;
  id v13 = a6;
  id v9 = a5;
  id v10 = [(NCNotificationStructuredListViewController *)self listModel];
  id v11 = [v10 suggestionManager];
  [v11 logResponseForNotificationRequest:v9 scheduledDelivery:v7];

  id v12 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v12 notificationStructuredListViewController:self setScheduledDelivery:v7 forSectionIdentifier:v13];
  }
}

- (void)notificationManagementViewPresenterWillPresentManagementView:(id)a3
{
  id v5 = [(NCNotificationStructuredListViewController *)self bs_topPresentedViewController];
  if (objc_opt_respondsToSelector()) {
    [v5 preserveInputViews];
  }
  id v4 = [(NCNotificationStructuredListViewController *)self touchEaterManager];
  [v4 setEnabled:0];
}

- (void)notificationManagementViewPresenterDidDismissManagementView:(id)a3
{
  id v5 = [(NCNotificationStructuredListViewController *)self bs_topPresentedViewController];
  if (objc_opt_respondsToSelector()) {
    [v5 restoreInputViews];
  }
  id v4 = [(NCNotificationStructuredListViewController *)self touchEaterManager];
  [v4 setEnabled:1];
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    id v15 = [(NCNotificationStructuredListViewController *)self _logDescription];
    uint64_t v16 = [v11 notificationIdentifier];
    int v17 = objc_msgSend(v16, "un_logDigest");
    int v21 = 138544130;
    BOOL v22 = v15;
    __int16 v23 = 1024;
    BOOL v24 = v8;
    __int16 v25 = 2114;
    id v26 = v17;
    __int16 v27 = 2114;
    id v28 = v12;
    _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set allows time sensitive notifications = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v21, 0x26u);
  }
  uint64_t v18 = [(NCNotificationStructuredListViewController *)self listModel];
  int v19 = [v18 suggestionManager];
  [v19 logResponseForNotificationRequest:v11 allowsTimeSensitive:v8];

  long long v20 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v20 notificationStructuredListViewController:self setAllowsTimeSensitive:v8 forSectionIdentifier:v12];
  }
}

- (void)notificationManagementViewPresenter:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8
{
  uint64_t v12 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  int v19 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    long long v20 = v19;
    [(NCNotificationStructuredListViewController *)self _logDescription];
    unsigned int v29 = v12;
    id v21 = v15;
    __int16 v23 = v22 = v14;
    BOOL v24 = [v16 notificationIdentifier];
    __int16 v25 = objc_msgSend(v24, "un_logDigest");
    *(_DWORD *)buf = 138544130;
    id v31 = v23;
    __int16 v32 = 2114;
    BOOL v33 = v25;
    __int16 v34 = 2114;
    id v35 = v17;
    __int16 v36 = 2114;
    id v37 = v18;
    _os_log_impl(&dword_1D7C04000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ mute notifications for request %{public}@, section identifier %{public}@, thread identifier %{public}@", buf, 0x2Au);

    id v14 = v22;
    id v15 = v21;
    uint64_t v12 = v29;
  }
  id v26 = [(NCNotificationStructuredListViewController *)self listModel];
  __int16 v27 = [v26 suggestionManager];
  [v27 logResponseForNotificationRequest:v16 muted:v12];

  id v28 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v28 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v28 notificationStructuredListViewController:self setMuted:v12 untilDate:v15 forSectionIdentifier:v17 threadIdentifier:v18];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NCNotificationStructuredListViewController;
  [(NCNotificationStructuredListViewController *)&v27 traitCollectionDidChange:v4];
  id v5 = [(NCNotificationStructuredListViewController *)self traitCollection];
  BOOL v6 = [v5 preferredContentSizeCategory];
  BOOL v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(NCNotificationStructuredListViewController *)self _contentSizeCategoryDidChange];
  }
  BOOL v8 = [v4 _backlightLuminance] != 1;
  id v9 = [(NCNotificationStructuredListViewController *)self traitCollection];
  uint64_t v10 = [v9 _backlightLuminance];

  if (((v8 ^ (v10 == 1)) & 1) == 0)
  {
    id v11 = *MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = @"on";
      if (v10 == 1) {
        uint64_t v12 = @"off";
      }
      *(_DWORD *)buf = 138412290;
      unsigned int v29 = v12;
      _os_log_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_DEFAULT, "AOD traitsDidChange. display: %@", buf, 0xCu);
    }
    if (v10 == 1)
    {
      if ([(NCNotificationStructuredListViewController *)self showNotificationsInAlwaysOn])
      {
        id v13 = [(NCNotificationStructuredListViewController *)self _notificationSystemSettings];
        uint64_t v14 = [v13 listDisplayStyleSetting];

        if (v14) {
          goto LABEL_14;
        }
        id v15 = [(NCNotificationStructuredListViewController *)self listModel];
        id v16 = v15;
        uint64_t v17 = 1;
        uint64_t v18 = 0;
      }
      else
      {
        id v15 = [(NCNotificationStructuredListViewController *)self listModel];
        id v16 = v15;
        uint64_t v17 = 2;
        uint64_t v18 = 1;
      }
      [v15 setOverrideNotificationListDisplayStyleSetting:v17 forReason:@"NCNotificationListDisplayStyleReasonOverrideDeviceLocked" hideNotificationCount:v18];
    }
  }
LABEL_14:
  uint64_t v19 = [v4 _backlightLuminance];
  long long v20 = [(NCNotificationStructuredListViewController *)self traitCollection];
  uint64_t v21 = [v20 _backlightLuminance];

  if (v19 != v21)
  {
    id v22 = [(NCNotificationStructuredListViewController *)self traitCollection];
    uint64_t v23 = [v22 _backlightLuminance];

    if ((unint64_t)(v23 + 1) < 2)
    {
      BOOL v24 = [(NCNotificationStructuredListViewController *)self listModel];
      __int16 v25 = v24;
      uint64_t v26 = 0;
      goto LABEL_21;
    }
    if (v23 == 1)
    {
      BOOL v24 = [(NCNotificationStructuredListViewController *)self listModel];
      __int16 v25 = v24;
      uint64_t v26 = 1;
      goto LABEL_21;
    }
    if (v23 == 2)
    {
      BOOL v24 = [(NCNotificationStructuredListViewController *)self listModel];
      __int16 v25 = v24;
      uint64_t v26 = 2;
LABEL_21:
      [v24 _backlightChangedToBacklightLuminance:v26];
    }
  }
}

- (void)_didExitAlwaysOn
{
  double v3 = *MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1D7C04000, v3, OS_LOG_TYPE_DEFAULT, "NCStructuredListVC didExitAlwaysOn", v9, 2u);
  }
  id v4 = [(NCNotificationStructuredListViewController *)self listModel];
  [v4 removeOverrideNotificationListDisplayStyleSettingForReason:@"NCNotificationListDisplayStyleReasonOverrideDeviceLocked"];

  id v5 = [(NCNotificationStructuredListViewController *)self listModel];
  BOOL v6 = [v5 notificationSections];
  [v6 enumerateObjectsUsingBlock:&__block_literal_global_33];

  BOOL v7 = [(NCNotificationStructuredListViewController *)self _listViewContainer];
  [v7 didExitAlwaysOn];

  BOOL v8 = [(NCNotificationStructuredListViewController *)self listModel];
  [v8 _backlightChangedToBacklightLuminance:2];
}

uint64_t __62__NCNotificationStructuredListViewController__didExitAlwaysOn__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didExitAlwaysOn];
}

- (void)toolsOverlayViewRequestsBeginUserInteraction:(id)a3
{
  id v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationStructuredListViewControllerDidBeginUserInteraction:self];
  }
}

- (void)toolsOverlayViewRequestsEndUserInteraction:(id)a3
{
  id v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationStructuredListViewControllerDidEndUserInteraction:self];
  }
}

- (void)notificationListCountIndicatorViewControllerTapped:(id)a3
{
  id v3 = [(NCNotificationStructuredListViewController *)self listModel];
  [v3 didTapCountIndicator];
}

- (void)notificationListCountIndicatorViewControllerLongPressed:(id)a3 presentingView:(id)a4
{
  id v6 = a4;
  id v5 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 notificationStructuredListViewController:self requestsPresentingFocusActivityPickerFromView:v6];
  }
}

- (void)notificationListCountIndicatorViewController:(id)a3 didChangeVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    BOOL v7 = WeakRetained;
    if (objc_opt_respondsToSelector()) {
      [v7 notificationStructuredListViewController:self didUpdateOverlayFooterContentVisibility:v4];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)notificationListCountIndicatorViewControllerDidUpdate:(id)a3
{
  id v3 = [(NCNotificationStructuredListViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)digestOnboardingSuggestionClient:(id)a3 didSuggestOnboarding:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    uint64_t v10 = [(NCNotificationStructuredListViewController *)self _logDescription];
    int v11 = 138543362;
    uint64_t v12 = v10;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ digest onboarding suggestion client did suggest onboarding", (uint8_t *)&v11, 0xCu);
  }
  if ([(NCNotificationStructuredListViewController *)self _shouldPresentDigestOnboardingSuggestion])
  {
    [(NCNotificationStructuredListViewController *)self _setDigestOnboardingSuggestionVisible:1];
    [(NCNotificationStructuredListViewController *)self setDigestOnboardingSuggestion:v7];
  }
}

- (void)modeManager:(id)a3 didUpdateCurrentModeConfiguration:(id)a4 previousModeConfiguration:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 mode];
  uint64_t v10 = [v8 mode];
  int v11 = v9;
  uint64_t v12 = [v9 modeIdentifier];
  uint64_t v13 = v10;
  uint64_t v14 = [v10 modeIdentifier];
  id v15 = [v7 configuration];
  uint64_t v16 = [v15 suppressionType];

  uint64_t v17 = [v8 configuration];

  uint64_t v18 = [v17 suppressionType];
  uint64_t v19 = (void *)*MEMORY[0x1E4FB3778];
  v46 = (void *)v14;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    long long v20 = v19;
    uint64_t v21 = [(NCNotificationStructuredListViewController *)self _logDescription];
    *(_DWORD *)buf = 138543874;
    v48 = v21;
    __int16 v49 = 2114;
    v50 = v12;
    __int16 v51 = 2114;
    v52 = v46;
    _os_log_impl(&dword_1D7C04000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ received DND mode update with current mode %{public}@ and previous mode %{public}@", buf, 0x20u);

    uint64_t v14 = (uint64_t)v46;
  }
  if ([v12 isEqualToString:v14])
  {
    id v22 = v11;
    if (v16 == 2 && v18 != 2)
    {
      uint64_t v23 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v24 = v23;
        __int16 v25 = [(NCNotificationStructuredListViewController *)self _logDescription];
        *(_DWORD *)buf = 138543618;
        v48 = v25;
        __int16 v49 = 2114;
        v50 = v12;
        _os_log_impl(&dword_1D7C04000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ setting missed section active for DND mode %{public}@ on suppression type changed to delay delivery", buf, 0x16u);
      }
      uint64_t v26 = [(NCNotificationStructuredListViewController *)self listModel];
      objc_super v27 = v26;
      uint64_t v28 = 1;
      unsigned int v29 = v11;
      uint64_t v30 = 1;
LABEL_27:
      [v26 toggleMissedSectionActive:v28 forDNDMode:v29 hideVisibleNotifications:v30];

      goto LABEL_28;
    }
    if (v16 != 2 && v18 == 2)
    {
      __int16 v36 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        id v37 = v36;
        uint64_t v38 = [(NCNotificationStructuredListViewController *)self _logDescription];
        *(_DWORD *)buf = 138543618;
        v48 = v38;
        __int16 v49 = 2114;
        v50 = v46;
        _os_log_impl(&dword_1D7C04000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ setting missed section inactive for DND mode %{public}@ on suppression type changed from delay delivery", buf, 0x16u);
      }
      uint64_t v26 = [(NCNotificationStructuredListViewController *)self listModel];
      objc_super v27 = v26;
      uint64_t v28 = 0;
      unsigned int v29 = v13;
      uint64_t v30 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    id v22 = v11;
    if (v8 && v18 == 2)
    {
      id v31 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v32 = v31;
        BOOL v33 = [(NCNotificationStructuredListViewController *)self _logDescription];
        *(_DWORD *)buf = 138543874;
        v48 = v33;
        __int16 v49 = 2114;
        v50 = v46;
        __int16 v51 = 2114;
        v52 = v12;
        _os_log_impl(&dword_1D7C04000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ setting missed section inactive for DND mode %{public}@ on mode change to %{public}@", buf, 0x20u);
      }
      __int16 v34 = [(NCNotificationStructuredListViewController *)self listModel];
      [v34 toggleMissedSectionActive:0 forDNDMode:v13 hideVisibleNotifications:0];
    }
    if (v7 && v16 == 2)
    {
      if (v8) {
        BOOL v35 = [v7 dimsLockScreen] != 0;
      }
      else {
        BOOL v35 = 1;
      }
      uint64_t v39 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v40 = v39;
        BOOL v41 = [(NCNotificationStructuredListViewController *)self _logDescription];
        *(_DWORD *)buf = 138543874;
        v48 = v41;
        __int16 v49 = 2114;
        v50 = v12;
        __int16 v51 = 1024;
        LODWORD(v52) = v35;
        _os_log_impl(&dword_1D7C04000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ setting missed section active for DND mode %{public}@ and hiding visible notifications = %{BOOL}d", buf, 0x1Cu);
      }
      uint64_t v26 = [(NCNotificationStructuredListViewController *)self listModel];
      objc_super v27 = v26;
      uint64_t v28 = 1;
      unsigned int v29 = v11;
      uint64_t v30 = v35;
      goto LABEL_27;
    }
  }
LABEL_28:
  uint64_t v42 = [(NCNotificationStructuredListViewController *)self listModel];
  [v42 reloadRemoteSuggestions];

  v43 = [(NCNotificationStructuredListViewController *)self listModel];
  [v43 setActiveDNDModeConfiguration:v7];

  v44 = [(NCNotificationStructuredListViewController *)self countIndicatorViewController];
  [v44 setActiveDNDModeConfiguration:v7];

  v45 = [(NCNotificationStructuredListViewController *)self _listViewContainer];
  [v45 setNeedsLayout];
}

- (void)digestOnboardingNavigationController:(id)a3 didScheduleDigestDeliveryTimes:(id)a4 forAppBundleIdentifiers:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = [(NCNotificationStructuredListViewController *)self _logDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v13;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_1D7C04000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ received updated scheduled delivery settings from onboarding view controller with delivery times %@", buf, 0x16u);
  }
  [(NCNotificationStructuredListViewController *)self _setDigestOnboardingSuggestionVisible:0];
  uint64_t v14 = (void *)[v9 copy];
  [(NCNotificationStructuredListViewController *)self _setSystemScheduledDeliveryEnabled:1 scheduledDeliveryTimes:v14];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        -[NCNotificationStructuredListViewController _setScheduledDeliveryEnabledForSectionIdentifier:](self, "_setScheduledDeliveryEnabledForSectionIdentifier:", *(void *)(*((void *)&v22 + 1) + 8 * v19++), (void)v22);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }

  digestOnboardingLastBundleIdentifiersSelection = self->_digestOnboardingLastBundleIdentifiersSelection;
  self->_digestOnboardingLastBundleIdentifiersSelection = 0;

  digestOnboardingLastScheduledDeliveryTimesSelection = self->_digestOnboardingLastScheduledDeliveryTimesSelection;
  self->_digestOnboardingLastScheduledDeliveryTimesSelection = 0;
}

- (void)digestOnboardingNavigationController:(id)a3 didChangeDeliveryTimesActiveSelection:(id)a4 appBundleIdentifiersActiveSelection:(id)a5
{
  id v7 = (NSArray *)a4;
  objc_storeStrong((id *)&self->_digestOnboardingLastBundleIdentifiersSelection, a5);
  id v9 = a5;
  digestOnboardingLastScheduledDeliveryTimesSelection = self->_digestOnboardingLastScheduledDeliveryTimesSelection;
  self->_digestOnboardingLastScheduledDeliveryTimesSelection = v7;
}

- (void)digestOnboardingNavigationControllerDidDeferSetup:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(NCNotificationStructuredListViewController *)self _setDigestOnboardingSuggestionVisible:0];
  BOOL v4 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [(NCNotificationStructuredListViewController *)self _logDescription];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ User deferred digest setup. Onboarding navigation controller dismissed", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)_isPresentingDigestOnboardingSuggestion
{
  double v2 = [(NCNotificationStructuredListViewController *)self listModel];
  char v3 = [v2 isOnboardingSummaryVisible];

  return v3;
}

- (void)_toggleDigestOnboardingSuggestionIfNecessary
{
  if ([(NCNotificationStructuredListViewController *)self _shouldPresentDigestOnboardingSuggestion])
  {
    if (!self->_digestOnboardingSuggestionClient)
    {
      [(NCNotificationStructuredListViewController *)self _scheduleDigestOnboardingSuggestion];
    }
  }
  else if ([(NCNotificationStructuredListViewController *)self _isPresentingDigestOnboardingSuggestion])
  {
    [(NCNotificationStructuredListViewController *)self _setDigestOnboardingSuggestionVisible:0];
  }
}

- (void)_presentNavigationControllerAndBeginModalInteraction:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = v12;
  if (self->_modalNavigationController)
  {
    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
  else
  {
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = @"<null>";
    }
    uint64_t v16 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v16;
      uint64_t v18 = [(NCNotificationStructuredListViewController *)self _logDescription];
      uint64_t v19 = (objc_class *)objc_opt_class();
      long long v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v18;
      __int16 v27 = 2114;
      uint64_t v28 = v20;
      __int16 v29 = 2114;
      id v30 = v15;
      _os_log_impl(&dword_1D7C04000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ presenting navigation controller of type '%{public}@' from sender of type: '%{public}@'", buf, 0x20u);
    }
    uint64_t v21 = [(NCNotificationStructuredListViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v21 notificationStructuredListViewControllerDidBeginUserInteraction:self];
    }
    objc_storeStrong((id *)&self->_modalNavigationController, a3);
    modalNavigationController = self->_modalNavigationController;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __126__NCNotificationStructuredListViewController__presentNavigationControllerAndBeginModalInteraction_sender_animated_completion___block_invoke;
    v23[3] = &unk_1E6A91DF0;
    id v24 = v13;
    [(NCNotificationStructuredListViewController *)self presentViewController:modalNavigationController animated:1 completion:v23];
  }
}

uint64_t __126__NCNotificationStructuredListViewController__presentNavigationControllerAndBeginModalInteraction_sender_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)_setDigestOnboardingSuggestionVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(NCNotificationStructuredListViewController *)self _isPresentingDigestOnboardingSuggestion];
  if (v3)
  {
    if (v5) {
      return;
    }
    id v6 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = v6;
      id v8 = [(NCNotificationStructuredListViewController *)self _logDescription];
      int v18 = 138543362;
      uint64_t v19 = v8;
      _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ presenting digest onboarding suggestion on lock screen", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v9 = (ATXDigestOnboardingSuggestionLogging *)objc_opt_new();
    digestOnboardingSuggestionLogging = self->_digestOnboardingSuggestionLogging;
    self->_digestOnboardingSuggestionLogging = v9;

    id v11 = [MEMORY[0x1E4F1C9C8] date];
    digestOnboardingSuggestionPresentationTime = self->_digestOnboardingSuggestionPresentationTime;
    self->_digestOnboardingSuggestionPresentationTime = v11;

    uint64_t v13 = [(NCNotificationStructuredListViewController *)self listModel];
    [v13 setOnboardingSummaryVisible:1];
  }
  else
  {
    if (!v5) {
      return;
    }
    uint64_t v14 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      uint64_t v16 = [(NCNotificationStructuredListViewController *)self _logDescription];
      int v18 = 138543362;
      uint64_t v19 = v16;
      _os_log_impl(&dword_1D7C04000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ removing digest onboarding suggestion from lock screen", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v17 = [(NCNotificationStructuredListViewController *)self listModel];
    [v17 setOnboardingSummaryVisible:0];

    uint64_t v13 = self->_digestOnboardingSuggestionLogging;
    self->_digestOnboardingSuggestionLogging = 0;
  }
}

- (BOOL)_shouldPresentDigestOnboardingSuggestion
{
  double v2 = [(NCNotificationStructuredListViewController *)self _notificationSystemSettings];
  char v3 = [v2 isScheduledDeliveryUninitialized];

  return v3;
}

- (void)_scheduleDigestOnboardingSuggestion
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_digestOnboardingSuggestionClient)
  {
    char v3 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v4 = v3;
      BOOL v5 = [(NCNotificationStructuredListViewController *)self _logDescription];
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling digest onboarding suggestion", (uint8_t *)&v8, 0xCu);
    }
    id v6 = [MEMORY[0x1E4F4AFE0] sharedInstance];
    digestOnboardingSuggestionClient = self->_digestOnboardingSuggestionClient;
    self->_digestOnboardingSuggestionClient = v6;

    [(ATXDigestOnboardingSuggestionClient *)self->_digestOnboardingSuggestionClient registerObserver:self];
    [(ATXDigestOnboardingSuggestionClient *)self->_digestOnboardingSuggestionClient registerForOnboardingSuggestions];
  }
}

- (void)_setSystemScheduledDeliveryEnabled:(BOOL)a3 scheduledDeliveryTimes:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 notificationStructuredListViewController:self setSystemScheduledDeliveryEnabled:v4 scheduledDeliveryTimes:v7];
  }
}

- (void)_setScheduledDeliveryEnabledForSectionIdentifier:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(NCNotificationStructuredListViewController *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 notificationStructuredListViewController:self setScheduledDelivery:1 forSectionIdentifier:v5];
  }
}

- (void)_presentOptionsMenuForNotificationRequest:(id)a3 withPresentingView:(id)a4 optionsForSection:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[NCNotificationOptionsMenu alloc] initWithNotificationRequest:v9 presentingView:v8 settingsDelegate:self optionsForSection:v5];

  optionsMenu = self->_optionsMenu;
  self->_optionsMenu = v10;

  id v12 = self->_optionsMenu;

  [(NCNotificationOptionsMenu *)v12 presentMenu];
}

- (id)_logDescription
{
  double v2 = NSString;
  char v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  BOOL v5 = [v2 stringWithFormat:@"Notification List [%@]", v4];

  return v5;
}

- (id)_sectionSettingsForSectionIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCNotificationStructuredListViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 notificationStructuredListViewController:self requestsSectionSettingsForSectionIdentifier:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_notificationSystemSettings
{
  char v3 = [(NCNotificationStructuredListViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 notificationStructuredListViewControllerRequestsSystemSettings:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_requestAuthenticationAndPerformBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredListViewController *)self delegate];
  [v5 notificationStructuredListViewController:self requestsAuthenticationAndPerformBlock:v4];
}

- (void)_contentSizeCategoryDidChange
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = [(NCNotificationStructuredListViewController *)self _logDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v5;
    _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ adjusting for content size change", buf, 0xCu);
  }
  id v6 = [(NCNotificationStructuredListViewController *)self listModel];
  [v6 adjustForContentSizeCategoryChange];

  [(NCNotificationListViewProtocol *)self->_listView updateBottomViewsRollUnder];
  [(NCNotificationListCountIndicatorViewController *)self->_countIndicatorViewController adjustForContentSizeCategoryChange];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(NCNotificationStructuredListViewController *)self childViewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 adjustForContentSizeCategoryChange];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)_forwarNotificationRequestToLongLookIfNecessary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NCNotificationStructuredListViewController *)self notificationViewControllerPresentingLongLook];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 notificationRequest];
    if (![v4 isUniqueThreadIdentifier]
      || ![v7 isUniqueThreadIdentifier]
      || ![v4 matchesThreadForRequest:v7])
    {
      goto LABEL_13;
    }
    uint64_t v8 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = v8;
      uint64_t v10 = [(NCNotificationStructuredListViewController *)self _logDescription];
      uint64_t v11 = [v4 notificationIdentifier];
      id v12 = objc_msgSend(v11, "un_logDigest");
      int v20 = 138543618;
      uint64_t v21 = v10;
      __int16 v22 = 2114;
      long long v23 = v12;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_INFO, "%{public}@ forwarding request %{public}@ to a presented long look", (uint8_t *)&v20, 0x16u);
    }
    if ([v6 didForwardNotificationRequestToCustomContent:v4])
    {
      if ([v4 matchesRequest:v7])
      {
        long long v13 = (void *)*MEMORY[0x1E4FB3778];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
        {
          long long v14 = v13;
          long long v15 = [(NCNotificationStructuredListViewController *)self _logDescription];
          long long v16 = [v4 notificationIdentifier];
          uint64_t v17 = objc_msgSend(v16, "un_logDigest");
          int v20 = 138543618;
          uint64_t v21 = v15;
          __int16 v22 = 2114;
          long long v23 = v17;
          _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ updating notification view presenting long look on receiving forwarded request %{public}@", (uint8_t *)&v20, 0x16u);
        }
        [v6 setNotificationRequest:v4];
      }
      BOOL v18 = 1;
    }
    else
    {
LABEL_13:
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)_resetSwipeInteractionWithRevealedActionsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NCNotificationListTouchEaterManager *)self->_touchEaterManager swipeInteractionInRevealedState];
  if (v5)
  {
    id v6 = v5;
    [v5 hideActionsAnimated:v3 fastAnimation:1 completion:0];
    [(NCNotificationListTouchEaterManager *)self->_touchEaterManager setSwipeInteractionInRevealedState:0];
    id v5 = v6;
  }
}

- (void)_loadListViewAndModelIfNecessary
{
  if (_NCReactiveListUI())
  {
    if (!self->_listView)
    {
      _NCReactiveListUI();
      id v5 = [NCNotificationListView alloc];
      goto LABEL_14;
    }
    objc_opt_class();
    int v3 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    int v3 = 0;
  }
  int isKindOfClass = _NCReactiveListUI() ^ 1;
  if ((isKindOfClass & 1) == 0 && (v3 & 1) == 0)
  {
    if (!self->_listModel)
    {
      id v5 = [NCNotificationListView alloc];
LABEL_16:
      id v7 = [(NCNotificationListView *)v5 initWithModelType:objc_opt_class() purpose:@"TopLevel"];
      uint64_t v8 = [(NCNotificationListView *)v7 traitOverrides];
      uint64_t v9 = self;
      [v8 setNSIntegerValue:1 forTrait:v9];
      id v6 = off_1E6A90EC0;
      goto LABEL_17;
    }
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
  }
  if (((v3 | isKindOfClass) & 1) == 0) {
    return;
  }
  id v5 = [NCNotificationListView alloc];
  if ((v3 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_14:
  id v6 = off_1E6A90ED0;
  id v7 = [(NCNotificationListView *)v5 initWithModelType:objc_opt_class() purpose:@"TopLevel"];
  [(NCNotificationListView *)v7 setSupportsBottomViewsRollUnder:0];
  uint64_t v8 = [(NCNotificationListView *)v7 traitOverrides];
  uint64_t v9 = self;
  [v8 setNSIntegerValue:1 forTrait:v9];
LABEL_17:

  uint64_t v10 = (NCNotificationRootList *)[objc_alloc(*v6) initWithListView:v7];
  [(NCNotificationRootList *)v10 setDelegate:self];
  id v16 = [(NCNotificationStructuredListViewController *)self _notificationSystemSettings];
  if (v16) {
    [(NCNotificationRootList *)v10 updateNotificationSystemSettings:v16 previousSystemSettings:0];
  }
  listView = self->_listView;
  self->_listView = (NCNotificationListViewProtocol *)v7;
  id v12 = v7;

  listModel = self->_listModel;
  self->_listModel = v10;
  long long v14 = v10;

  [(NCNotificationListViewProtocol *)self->_listView setScrollEnabled:1];
  [(NCNotificationListViewProtocol *)self->_listView setContentInsetAdjustmentBehavior:2];
  +[NCListDebugHUDModelBridge trackListView:self->_listView];
  long long v15 = [(NCNotificationStructuredListViewController *)self _listViewContainer];
  [v15 setListView:self->_listView];
}

- (void)_updateDebugHUD
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  allNotificationRequests = self->_allNotificationRequests;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__NCNotificationStructuredListViewController__updateDebugHUD__block_invoke;
  v3[3] = &unk_1E6A944A0;
  v3[4] = &v4;
  [(NSMutableDictionary *)allNotificationRequests enumerateKeysAndObjectsUsingBlock:v3];
  +[NCListDebugHUDModelBridge updateNotificationCount:v5[3]];
  _Block_object_dispose(&v4, 8);
}

uint64_t __61__NCNotificationStructuredListViewController__updateDebugHUD__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)_listenToUserDefaultsToSwitchListViewAndModelIfNecessary
{
  if (_NCReactiveListUI())
  {
    if (os_variant_has_internal_content())
    {
      int v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      allNotificationRequests = self->_allNotificationRequests;
      self->_allNotificationRequests = v3;

      objc_initWeak(&location, self);
      id v5 = +[NCUserNotificationsUIKitDefaults standardDefaults];
      uint64_t v6 = MEMORY[0x1E4F14428];
      id v7 = MEMORY[0x1E4F14428];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __102__NCNotificationStructuredListViewController__listenToUserDefaultsToSwitchListViewAndModelIfNecessary__block_invoke;
      v9[3] = &unk_1E6A919A0;
      objc_copyWeak(&v10, &location);
      id v8 = (id)[v5 observeDefault:@"shouldUseReactiveList" onQueue:v6 withBlock:v9];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __102__NCNotificationStructuredListViewController__listenToUserDefaultsToSwitchListViewAndModelIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained switchViews];
    id WeakRetained = v2;
  }
}

- (void)switchViews
{
  [(NCNotificationListViewProtocol *)self->_listView frame];
  double v4 = v3;
  double v6 = v5;
  [(NCNotificationStructuredListViewController *)self _loadListViewAndModelIfNecessary];
  [(NCNotificationStructuredListViewController *)self _resetListStateBeforeUIAppears];
  -[NCNotificationStructuredListViewController _updateListVisibleAreaForSize:](self, "_updateListVisibleAreaForSize:", v4, v6);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  allNotificationRequests = self->_allNotificationRequests;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__NCNotificationStructuredListViewController_switchViews__block_invoke;
  v11[3] = &unk_1E6A944F0;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  [(NSMutableDictionary *)allNotificationRequests enumerateKeysAndObjectsUsingBlock:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__NCNotificationStructuredListViewController_switchViews__block_invoke_3;
  v10[3] = &unk_1E6A94518;
  v10[4] = self;
  [v9 enumerateObjectsUsingBlock:v10];
}

void __57__NCNotificationStructuredListViewController_switchViews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__NCNotificationStructuredListViewController_switchViews__block_invoke_2;
  v5[3] = &unk_1E6A944C8;
  double v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [a3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __57__NCNotificationStructuredListViewController_switchViews__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = *(void **)(*(void *)(a1 + 32) + 1008);
  id v5 = a3;
  [v4 insertNotificationRequest:v5];
  id v6 = *(void **)(a1 + 40);
  id v7 = [v5 sectionIdentifier];

  [v6 addObject:v7];
}

uint64_t __57__NCNotificationStructuredListViewController_switchViews__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 1008) notificationsLoadedForSectionIdentifier:a2];
}

- (void)_resetListStateBeforeUIAppears
{
  [(NCNotificationStructuredListViewController *)self _resetSwipeInteractionWithRevealedActionsAnimated:0];
  double v3 = [(NCNotificationStructuredListViewController *)self listModel];
  id v8 = [(NCNotificationStructuredListViewController *)self legibilitySettingsForNotificationListBaseComponent:v3];

  [(NCNotificationStructuredListViewController *)self adjustForLegibilitySettingsChange:v8];
  double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1
    || (unint64_t)([(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] - 3) > 1)
  {
    id v6 = [(NCNotificationStructuredListViewController *)self listModel];
    [v6 removeOverrideNotificationListDisplayStyleSettingForReason:@"NCNotificationListDisplayStyleReasonOverrideLandscapeOrientation"];
  }
  else
  {
    id v6 = [(NCNotificationStructuredListViewController *)self listModel];
    [v6 setOverrideNotificationListDisplayStyleSetting:0 forReason:@"NCNotificationListDisplayStyleReasonOverrideLandscapeOrientation" hideNotificationCount:0];
  }

  [(NCNotificationListViewProtocol *)self->_listView updateBottomViewsRollUnder];
  id v7 = [(NCNotificationStructuredListViewController *)self listModel];
  [v7 prepareForUIAppear];
}

- (void)_updateListVisibleAreaForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[NCNotificationRootList updateListViewVisibleRectForSize:](self->_listModel, "updateListViewVisibleRectForSize:");

  -[NCNotificationStructuredListViewController _updateListEdgeInsetsForSize:](self, "_updateListEdgeInsetsForSize:", width, height);
}

- (UIEdgeInsets)_overlayFooterViewEdgeInsetsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(NCNotificationStructuredListViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (width <= height) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 3;
    }
    [v6 notificationStructuredListViewControllerRequestsEdgeInsetsForOverlayFooterView:self forOrientation:v7];
    uint64_t v9 = v8;
    double v11 = v10;
    uint64_t v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v11 = 0.0;
    *(double *)&uint64_t v13 = 55.0;
    *(double *)&uint64_t v9 = 110.0;
    double v15 = 0.0;
  }

  double v16 = *(double *)&v9;
  double v17 = v11;
  double v18 = *(double *)&v13;
  double v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)_updateListEdgeInsetsForSize:(CGSize)a3
{
  -[NCNotificationStructuredListViewController _overlayFooterViewEdgeInsetsForSize:](self, "_overlayFooterViewEdgeInsetsForSize:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(NCNotificationStructuredListViewController *)self _listViewContainer];
  objc_msgSend(v12, "setFooterInsets:", v5, v7, v9, v11);

  id v13 = [(NCNotificationStructuredListViewController *)self listModel];
  [v13 setVisibleRectBottomMarginForRollUnder:v5 + 20.0];
}

- (NCNotificationListSupplementaryViewsContaining)testRecipeSupplementaryViewsContainer
{
  testRecipeSupplementaryViewsContainer = self->_testRecipeSupplementaryViewsContainer;
  if (!testRecipeSupplementaryViewsContainer)
  {
    double v4 = [(NCNotificationStructuredListViewController *)self insertSupplementaryViewsContainerAtListPosition:0 identifier:@"prototype-section" withDescription:@"Test Recipe Supplementary Views Section"];
    [(NCNotificationStructuredListViewController *)self setTestRecipeSupplementaryViewsContainer:v4];

    testRecipeSupplementaryViewsContainer = self->_testRecipeSupplementaryViewsContainer;
  }

  return testRecipeSupplementaryViewsContainer;
}

- (NCNotificationStructuredListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationStructuredListViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDeviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (UIEdgeInsets)insetMargins
{
  double top = self->_insetMargins.top;
  double left = self->_insetMargins.left;
  double bottom = self->_insetMargins.bottom;
  double right = self->_insetMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (NCMaterialDisplayingCaptureOnlyViewController)captureOnlyMaterialViewController
{
  return self->_captureOnlyMaterialViewController;
}

- (void)setCaptureOnlyMaterialViewController:(id)a3
{
}

- (BOOL)showNotificationsInAlwaysOn
{
  return self->_showNotificationsInAlwaysOn;
}

- (void)setShowNotificationsInAlwaysOn:(BOOL)a3
{
  self->_showNotificationsInAlwaysOn = a3;
}

- (void)setListModel:(id)a3
{
}

- (NCNotificationListViewProtocol)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
}

- (NCNotificationListTouchEaterManager)touchEaterManager
{
  return self->_touchEaterManager;
}

- (void)setTouchEaterManager:(id)a3
{
}

- (NCNotificationManagementViewPresenter)managementViewPresenter
{
  return self->_managementViewPresenter;
}

- (void)setManagementViewPresenter:(id)a3
{
}

- (NCNotificationOptionsMenu)optionsMenu
{
  return self->_optionsMenu;
}

- (void)setOptionsMenu:(id)a3
{
}

- (NCModeManager)modeManager
{
  return self->_modeManager;
}

- (void)setModeManager:(id)a3
{
}

- (NCModalNavigationController)modalNavigationController
{
  return self->_modalNavigationController;
}

- (void)setModalNavigationController:(id)a3
{
}

- (BOOL)backgroundBlurred
{
  return self->_backgroundBlurred;
}

- (void)setBackgroundBlurred:(BOOL)a3
{
  self->_backgroundBlurred = a3;
}

- (NCNotificationRequest)notificationRequestRemovedWhilePresentingLongLook
{
  return self->_notificationRequestRemovedWhilePresentingLongLook;
}

- (void)setNotificationRequestRemovedWhilePresentingLongLook:(id)a3
{
}

- (NCNotificationViewController)notificationViewControllerPresentingLongLook
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationViewControllerPresentingLongLook);

  return (NCNotificationViewController *)WeakRetained;
}

- (void)setNotificationViewControllerPresentingLongLook:(id)a3
{
}

- (NCNotificationListSectionHeaderView)headerViewInForceTouchState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerViewInForceTouchState);

  return (NCNotificationListSectionHeaderView *)WeakRetained;
}

- (void)setHeaderViewInForceTouchState:(id)a3
{
}

- (NCNotificationListCoalescingControlsHandler)coalescingControlsHandlerInForceTouchState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coalescingControlsHandlerInForceTouchState);

  return (NCNotificationListCoalescingControlsHandler *)WeakRetained;
}

- (void)setCoalescingControlsHandlerInForceTouchState:(id)a3
{
}

- (NCNotificationListComponent)notificationListComponentPresentingOptionsMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationListComponentPresentingOptionsMenu);

  return (NCNotificationListComponent *)WeakRetained;
}

- (void)setNotificationListComponentPresentingOptionsMenu:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (ATXDigestOnboardingSuggestionClient)digestOnboardingSuggestionClient
{
  return self->_digestOnboardingSuggestionClient;
}

- (void)setDigestOnboardingSuggestionClient:(id)a3
{
}

- (ATXDigestOnboardingSuggestion)digestOnboardingSuggestion
{
  return self->_digestOnboardingSuggestion;
}

- (void)setDigestOnboardingSuggestion:(id)a3
{
}

- (ATXDigestOnboardingSuggestionLogging)digestOnboardingSuggestionLogging
{
  return self->_digestOnboardingSuggestionLogging;
}

- (void)setDigestOnboardingSuggestionLogging:(id)a3
{
}

- (NSDate)digestOnboardingSuggestionPresentationTime
{
  return self->_digestOnboardingSuggestionPresentationTime;
}

- (void)setDigestOnboardingSuggestionPresentationTime:(id)a3
{
}

- (NSArray)digestOnboardingLastBundleIdentifiersSelection
{
  return self->_digestOnboardingLastBundleIdentifiersSelection;
}

- (void)setDigestOnboardingLastBundleIdentifiersSelection:(id)a3
{
}

- (NSArray)digestOnboardingLastScheduledDeliveryTimesSelection
{
  return self->_digestOnboardingLastScheduledDeliveryTimesSelection;
}

- (void)setDigestOnboardingLastScheduledDeliveryTimesSelection:(id)a3
{
}

- (NCNotificationListCountIndicatorViewController)countIndicatorViewController
{
  return self->_countIndicatorViewController;
}

- (void)setCountIndicatorViewController:(id)a3
{
}

- (void)setTestRecipeSupplementaryViewsContainer:(id)a3
{
}

- (NCInternalToolsOverlayView)internalToolsOverlayView
{
  return self->_internalToolsOverlayView;
}

- (void)setInternalToolsOverlayView:(id)a3
{
}

- (NSMutableDictionary)allNotificationRequests
{
  return self->_allNotificationRequests;
}

- (void)setAllNotificationRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allNotificationRequests, 0);
  objc_storeStrong((id *)&self->_internalToolsOverlayView, 0);
  objc_storeStrong((id *)&self->_testRecipeSupplementaryViewsContainer, 0);
  objc_storeStrong((id *)&self->_countIndicatorViewController, 0);
  objc_storeStrong((id *)&self->_digestOnboardingLastScheduledDeliveryTimesSelection, 0);
  objc_storeStrong((id *)&self->_digestOnboardingLastBundleIdentifiersSelection, 0);
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionPresentationTime, 0);
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionLogging, 0);
  objc_storeStrong((id *)&self->_digestOnboardingSuggestion, 0);
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionClient, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_notificationListComponentPresentingOptionsMenu);
  objc_destroyWeak((id *)&self->_coalescingControlsHandlerInForceTouchState);
  objc_destroyWeak((id *)&self->_headerViewInForceTouchState);
  objc_destroyWeak((id *)&self->_notificationViewControllerPresentingLongLook);
  objc_storeStrong((id *)&self->_notificationRequestRemovedWhilePresentingLongLook, 0);
  objc_storeStrong((id *)&self->_modalNavigationController, 0);
  objc_storeStrong((id *)&self->_modeManager, 0);
  objc_storeStrong((id *)&self->_optionsMenu, 0);
  objc_storeStrong((id *)&self->_managementViewPresenter, 0);
  objc_storeStrong((id *)&self->_touchEaterManager, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_listModel, 0);
  objc_storeStrong((id *)&self->_captureOnlyMaterialViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)notificationRequestWithNotificationIdentifier:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(NCNotificationStructuredListViewController *)self listModel];
  double v9 = [v8 notificationRequestWithNotificationIdentifier:v7 sectionIdentifier:v6];

  return v9;
}

- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NCNotificationStructuredListViewController *)self listModel];
  [v8 expandGroupForNotificationRequest:v7 withCompletion:v6];
}

- (void)collapseGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NCNotificationStructuredListViewController *)self listModel];
  [v8 collapseGroupForNotificationRequest:v7 withCompletion:v6];
}

@end