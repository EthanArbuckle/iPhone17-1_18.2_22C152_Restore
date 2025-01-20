@interface WGWidgetHostingViewController
+ (BOOL)_canWidgetHostCaptureSnapshotForSequence:(id)a3;
+ (BOOL)_canWidgetHostConnectRemoteViewControllerByCancellingDisappearanceForSequence:(id)a3;
+ (BOOL)_canWidgetHostConnectRemoteViewControllerByRequestingForSequence:(id)a3 disconnectionTimer:(id)a4 connectionState:(int64_t)a5;
+ (BOOL)_canWidgetHostDisconnectRemoteViewControllerForSequence:(id)a3 disconnectionTimer:(id)a4 coalesce:(BOOL)a5;
+ (BOOL)_canWidgetHostEndSequenceByDisconnectingRemoteViewControllerForSequence:(id)a3;
+ (BOOL)_canWidgetHostInsertRemoteViewForSequence:(id)a3;
+ (BOOL)_canWidgetHostRequestRemoteViewControllerForSequence:(id)a3;
+ (void)setWidgetSnapshotTimestampsEnabled:(BOOL)a3;
- (BOOL)_canInsertRemoteView:(id *)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_didRequestViewInset;
- (BOOL)_didUpdate;
- (BOOL)_hasOutstandingUpdateRequestForSequence:(id)a3;
- (BOOL)_isActiveSequence:(id)a3;
- (BOOL)_isBlacklisted;
- (BOOL)_isEncodingLayerTree;
- (BOOL)_isIgnoringParentAppearState;
- (BOOL)_managingContainerIsVisible;
- (BOOL)_shouldRemoveSnapshotWhenNotVisible;
- (BOOL)disconnectsImmediately;
- (BOOL)implementsPerformUpdate;
- (BOOL)isBrokenViewVisible;
- (BOOL)isLinkedOnOrAfterSystemVersion:(id)a3;
- (BOOL)isLockedOut;
- (BOOL)isRemoteViewVisible;
- (BOOL)isSnapshotLoaded;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BSAuditToken)auditToken;
- (CGRect)_snapshotViewBounds;
- (CGSize)_maxSizeForDisplayMode:(int64_t)a3;
- (NSCopying)_extensionRequest;
- (NSDate)_lastUnanticipatedDisconnectionDate;
- (NSMapTable)_openAppearanceTransactions;
- (NSMutableDictionary)_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
- (NSString)_containerIdentifier;
- (NSString)appBundleID;
- (NSString)displayName;
- (NSString)widgetIdentifier;
- (NSTimer)_disconnectionTimer;
- (OS_dispatch_queue)_diskWriteQueue;
- (OS_dispatch_queue)_proxyConnectionQueue;
- (OS_dispatch_queue)_proxyRequestQueue;
- (OS_dispatch_semaphore)_viewWillAppearSemaphore;
- (OS_dispatch_semaphore)_viewWillDisappearSemaphore;
- (UIEdgeInsets)_layoutMargins;
- (UIEdgeInsets)_marginInsets;
- (UIView)_contentProvidingView;
- (WGWidgetHostingViewController)initWithWidgetInfo:(id)a3 delegate:(id)a4 host:(id)a5;
- (WGWidgetHostingViewControllerDelegate)delegate;
- (WGWidgetHostingViewControllerHost)host;
- (WGWidgetInfo)widgetInfo;
- (WGWidgetLifeCycleSequence)_activeLifeCycleSequence;
- (_WGBrokenWidgetView)_brokenView;
- (_WGCAPackageView)_snapshotView;
- (_WGLockedOutWidgetView)_lockedOutView;
- (_WGWidgetRemoteViewController)_remoteViewController;
- (double)cornerRadius;
- (id)_cancelTouches;
- (id)_remoteViewControllerConnectionHandler;
- (id)_remoteViewControllerDisconnectionHandler;
- (id)_snapshotIdentifierForLayoutMode:(int64_t)a3;
- (id)_updateRequestForSequence:(id)a3;
- (id)_widgetSnapshotURLForLayoutMode:(int64_t)a3 ensuringDirectoryExists:(BOOL)a4;
- (id)_widgetSnapshotURLForSnapshotIdentifier:(id)a3;
- (id)_widgetSnapshotURLForSnapshotIdentifier:(id)a3 ensuringDirectoryExists:(BOOL)a4;
- (id)description;
- (int64_t)_connectionState;
- (int64_t)activeDisplayMode;
- (int64_t)largestAvailableDisplayMode;
- (int64_t)userSpecifiedDisplayMode;
- (unint64_t)maskedCorners;
- (void)_abortActiveSequence;
- (void)_attemptReconnectionAfterUnanticipatedDisconnection;
- (void)_beginRemoteViewControllerAppearanceTransitionIfNecessary:(BOOL)a3 semaphore:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_beginSequenceWithReason:(id)a3 completion:(id)a4 updateHandler:(id)a5;
- (void)_captureLayerTree:(id)a3;
- (void)_captureSnapshotAndBeginDisappearanceTransitionForSequence:(id)a3 completionHandler:(id)a4;
- (void)_connectRemoteViewControllerForReason:(id)a3 sequence:(id)a4 completionHandler:(id)a5;
- (void)_disconnectRemoteViewControllerForReason:(id)a3 sequence:(id)a4 coalesce:(BOOL)a5 completionHandler:(id)a6;
- (void)_disconnectRemoteViewControllerForSequence:(id)a3 completion:(id)a4;
- (void)_disconnectionTimerDidFire:(id)a3;
- (void)_endRemoteViewControllerAppearanceTransitionIfNecessary;
- (void)_endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion:(id)a3;
- (void)_endSequence:(id)a3 withReason:(id)a4 completion:(id)a5;
- (void)_enqueueDisconnectionRequestForSequence:(id)a3 endTransitionBlock:(id)a4 completion:(id)a5;
- (void)_enqueueRemoteServiceRequest:(id)a3 withDescription:(id)a4;
- (void)_enqueueRequest:(id)a3 inQueue:(id)a4 trampolinedToMainQueue:(BOOL)a5 withDescription:(id)a6;
- (void)_finishDisconnectingRemoteViewControllerForSequence:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_initiateNewSequenceIfNecessary;
- (void)_insertAppropriateContentView;
- (void)_insertBrokenView;
- (void)_insertContentProvidingSubview:(id)a3 sequence:(id)a4 completion:(id)a5;
- (void)_insertLockedOutViewWithExplanation:(id)a3;
- (void)_insertSnapshotViewIfAppropriate;
- (void)_insertSnapshotWithCompletionHandler:(id)a3;
- (void)_invalidateDisconnectionTimer;
- (void)_invalidateSnapshotWithForce:(BOOL)a3 removingSnapshotFilesForActiveDisplayMode:(BOOL)a4 completionHandler:(id)a5;
- (void)_invalidateVisibleFrame;
- (void)_layoutMarginsDidChange;
- (void)_loadSnapshotViewFromDiskIfNecessary:(id)a3;
- (void)_noteOutstandingUpdateRequestForSequence:(id)a3;
- (void)_packageViewFromURL:(id)a3 reply:(id)a4;
- (void)_packageViewWithBlock:(id)a3 reply:(id)a4;
- (void)_performUpdateForSequence:(id)a3 withCompletionHandler:(id)a4;
- (void)_purgeLegacySnapshotsIfNecessary;
- (void)_registerUpdateRequestCompletionHandler:(id)a3 forSequence:(id)a4;
- (void)_removeAllSnapshotFilesDueToIssue:(BOOL)a3;
- (void)_removeAllSnapshotFilesForActiveDisplayMode;
- (void)_removeAllSnapshotFilesInActiveDisplayModeForAllButActiveUserInterfaceStyle;
- (void)_removeAllSnapshotFilesInActiveDisplayModeForContentSizeCategory:(id)a3;
- (void)_removeAllSnapshotFilesMatchingPredicate:(id)a3 dueToIssue:(BOOL)a4;
- (void)_removeItemAsynchronouslyAtURL:(id)a3;
- (void)_removeItemAtURL:(id)a3;
- (void)_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:(id)a3 completionHandler:(id)a4;
- (void)_requestRemoteViewControllerForSequence:(id)a3 completionHander:(id)a4;
- (void)_requestVisibilityStateUpdateForPossiblyAppearing:(BOOL)a3 sequence:(id)a4;
- (void)_rowHeightDidChange:(id)a3;
- (void)_scheduleDisconnectionTimerForSequence:(id)a3 endTransitionBlock:(id)a4 completion:(id)a5;
- (void)_setBlacklisted:(BOOL)a3;
- (void)_setBrokenView:(id)a3;
- (void)_setConnectionState:(int64_t)a3;
- (void)_setContentProvidingView:(id)a3;
- (void)_setDidRequestViewInset:(BOOL)a3;
- (void)_setDidUpdate:(BOOL)a3;
- (void)_setDisconnectionTimer:(id)a3;
- (void)_setEncodingLayerTree:(BOOL)a3;
- (void)_setExtensionRequest:(id)a3;
- (void)_setIgnoringParentAppearState:(BOOL)a3;
- (void)_setImplementsPerformUpdate:(BOOL)a3;
- (void)_setLargestAvailableDisplayMode:(int64_t)a3;
- (void)_setLastUnanticipatedDisconnectionDate:(id)a3;
- (void)_setLockedOutView:(id)a3;
- (void)_setRemoteViewController:(id)a3;
- (void)_setRemoteViewControllerConnectionHandler:(id)a3;
- (void)_setRemoteViewControllerDisconnectionHandler:(id)a3;
- (void)_setSequenceIDsToOutstandingWidgetUpdateCompletionHandlers:(id)a3;
- (void)_setSnapshotBounds:(CGRect)a3;
- (void)_setSnapshotView:(id)a3;
- (void)_setViewWillAppearSemaphore:(id)a3;
- (void)_setViewWillDisappearSemaphore:(id)a3;
- (void)_setupRequestQueue;
- (void)_synchronizeGeometryWithSnapshot;
- (void)_updatePreferredContentSizeWithHeight:(double)a3;
- (void)_updateWidgetWithCompletionHandler:(id)a3;
- (void)_validateSnapshotViewForActiveLayoutMode;
- (void)dealloc;
- (void)handleReconnectionRequest:(id)a3;
- (void)invalidateCachedSnapshotWithCompletionHandler:(id)a3;
- (void)invalidateCachedSnapshotWithURL:(id)a3 completionHandler:(id)a4;
- (void)managingContainerDidDisappear:(id)a3;
- (void)managingContainerWillAppear:(id)a3;
- (void)maximumSizeDidChangeForDisplayMode:(int64_t)a3;
- (void)requestIconWithHandler:(id)a3;
- (void)requestSettingsIconWithHandler:(id)a3;
- (void)setActiveDisplayMode:(int64_t)a3;
- (void)setAppBundleID:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisconnectsImmediately:(BOOL)a3;
- (void)setHost:(id)a3;
- (void)setLockedOut:(BOOL)a3 withExplanation:(id)a4;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setUserSpecifiedDisplayMode:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)widget:(id)a3 didTerminateWithError:(id)a4;
@end

@implementation WGWidgetHostingViewController

+ (void)setWidgetSnapshotTimestampsEnabled:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  __WGWidgetSnapshotDebugLabelsEnabled = a3;
  v3 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    if (__WGWidgetSnapshotDebugLabelsEnabled) {
      v4 = @"enabled";
    }
    else {
      v4 = @"disabled";
    }
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_222E49000, v3, OS_LOG_TYPE_DEFAULT, "Widget snapshot timestamps %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_purgeLegacySnapshotsIfNecessary
{
}

- (WGWidgetHostingViewController)initWithWidgetInfo:(id)a3 delegate:(id)a4 host:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)WGWidgetHostingViewController;
  v12 = [(WGWidgetHostingViewController *)&v32 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    p_widgetInfo = (id *)&v12->_widgetInfo;
    objc_storeStrong((id *)&v12->_widgetInfo, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeWeak((id *)&v13->_host, v11);
    v15 = [(WGWidgetHostingViewController *)v13 widgetIdentifier];
    v16 = (char *)QueueName(@"com.apple.widgets.proxyconnectionqueue", v15);
    uint64_t v17 = NewSerialQueue(v16);
    proxyConnectionQueue = v13->_proxyConnectionQueue;
    v13->_proxyConnectionQueue = (OS_dispatch_queue *)v17;

    v19 = (char *)QueueName(@"com.apple.widgets.proxyrequestqueue", v15);
    uint64_t v20 = NewSerialQueue(v19);
    proxyRequestQueue = v13->_proxyRequestQueue;
    v13->_proxyRequestQueue = (OS_dispatch_queue *)v20;

    InvalidateQueue(v13->_proxyRequestQueue);
    v22 = (char *)QueueName(@"com.apple.widgets.diskqueue", v15);
    uint64_t v23 = NewSerialQueue(v22);
    diskWriteQueue = v13->_diskWriteQueue;
    v13->_diskWriteQueue = (OS_dispatch_queue *)v23;

    v25 = WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v15);
    [(WGWidgetHostingViewController *)v13 setAppBundleID:v25];

    uint64_t v26 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    openAppearanceTransactions = v13->_openAppearanceTransactions;
    v13->_openAppearanceTransactions = (NSMapTable *)v26;

    v13->_implementsPerformUpdate = 1;
    [*p_widgetInfo registerWidgetHost:v13];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v11 shouldPurgeArchivedSnapshotsForWidget:v13])
    {
      [(WGWidgetHostingViewController *)v13 _removeAllSnapshotFilesDueToIssue:1];
      [(WGWidgetHostingViewController *)v13 preferredContentSize];
      if (fabs(v28) < 2.22044605e-16)
      {
        [*p_widgetInfo initialHeight];
        -[WGWidgetHostingViewController _updatePreferredContentSizeWithHeight:](v13, "_updatePreferredContentSizeWithHeight:");
      }
    }
    else
    {
      [(WGWidgetHostingViewController *)v13 _purgeLegacySnapshotsIfNecessary];
      [(WGWidgetHostingViewController *)v13 _loadSnapshotViewFromDiskIfNecessary:&__block_literal_global_31];
    }
    if (([*p_widgetInfo isLinkedOnOrAfterSystemVersion:@"10.0"] & 1) == 0) {
      v13->_activeDisplayMode = 1;
    }
    if (![*p_widgetInfo largestAllowedDisplayMode])
    {
      [(WGWidgetHostingViewController *)v13 _maxSizeForDisplayMode:0];
      [(WGWidgetHostingViewController *)v13 _updatePreferredContentSizeWithHeight:v29];
    }
    v30 = [MEMORY[0x263F08A00] defaultCenter];
    [v30 addObserver:v13 selector:sel__rowHeightDidChange_ name:@"WGWidgetRowHeightDidChangeNotification" object:0];
  }
  return v13;
}

void __66__WGWidgetHostingViewController_initWithWidgetInfo_delegate_host___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v4 = a3;
  char v5 = [v8 _shouldRemoveSnapshotWhenNotVisible];
  if ((v5 & 1) == 0
    && (!v4
     || [v8 _isActiveSequence:v4]
     && [v4 isCurrentStateNotYet:4]))
  {
    [v8 _insertSnapshotWithCompletionHandler:0];
  }
  v6 = [v8 _snapshotView];

  char v7 = v5 ^ 1;
  if (!v6) {
    char v7 = 1;
  }
  if ((v7 & 1) == 0) {
    [v8 _synchronizeGeometryWithSnapshot];
  }
}

- (void)dealloc
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_222E49000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Remote view controller is still valid – this likely means viewWill/DidDisappear weren't called. Severing connection, but no snapshot will be taken. Please file a bug.", v0, 2u);
}

- (NSString)widgetIdentifier
{
  return [(WGWidgetInfo *)self->_widgetInfo widgetIdentifier];
}

- (NSString)displayName
{
  return [(WGWidgetInfo *)self->_widgetInfo displayName];
}

- (void)requestIconWithHandler:(id)a3
{
  if (a3) {
    -[WGWidgetInfo requestIconWithHandler:](self->_widgetInfo, "requestIconWithHandler:");
  }
}

- (void)requestSettingsIconWithHandler:(id)a3
{
  if (a3) {
    -[WGWidgetInfo requestSettingsIconWithHandler:](self->_widgetInfo, "requestSettingsIconWithHandler:");
  }
}

- (void)setActiveDisplayMode:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_activeDisplayMode != a3)
  {
    self->_activeDisplayMode = a3;
    id v4 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      char v5 = v4;
      v6 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      char v7 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      id v8 = NCStringFromWidgetDisplayMode();
      int v11 = 138544130;
      v12 = v6;
      __int16 v13 = 2050;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v7;
      __int16 v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_222E49000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Updated active display mode: %{public}@",
        (uint8_t *)&v11,
        0x2Au);
    }
    id v9 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
    int v10 = [v9 isCurrentStateNotYet:5];

    if (v10) {
      [(WGWidgetHostingViewController *)self _enqueueRemoteServiceRequest:&__block_literal_global_42 withDescription:@"Setting active display mode"];
    }
  }
}

void __54__WGWidgetHostingViewController_setActiveDisplayMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v4 = a3;
  if ([v14 _isActiveSequence:v4])
  {
    if ([v4 isCurrentStateNotYet:5])
    {
      char v5 = [v14 _remoteViewController];
      objc_msgSend(v5, "_setActiveDisplayMode:", objc_msgSend(v14, "activeDisplayMode"));

      v6 = [v14 parentViewController];
      char v7 = [v14 view];
      id v8 = [v7 superview];
      [v8 bounds];
      objc_msgSend(v6, "sizeForChildContentContainer:withParentContainerSize:", v14, v9, v10);
      double v12 = v11;

      [v14 preferredContentSize];
      if (v13 != v12) {
        [v14 _updatePreferredContentSizeWithHeight:v12];
      }
    }
  }
}

- (int64_t)userSpecifiedDisplayMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [WeakRetained userSpecifiedDisplayModeForWidget:self];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setUserSpecifiedDisplayMode:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained widget:self didChangeUserSpecifiedDisplayMode:a3];
  }
  int64_t v5 = [(WGWidgetHostingViewController *)self userSpecifiedDisplayMode];
  if (v5 <= [(WGWidgetHostingViewController *)self largestAvailableDisplayMode]) {
    [(WGWidgetHostingViewController *)self setActiveDisplayMode:v5];
  }
}

- (BOOL)isLinkedOnOrAfterSystemVersion:(id)a3
{
  return [(WGWidgetInfo *)self->_widgetInfo isLinkedOnOrAfterSystemVersion:a3];
}

- (BOOL)isRemoteViewVisible
{
  if ([(_WGWidgetRemoteViewController *)self->_remoteViewController isViewLoaded])
  {
    v3 = [(_WGWidgetRemoteViewController *)self->_remoteViewController view];
    int64_t v4 = v3;
    if (v3 == self->_contentProvidingView) {
      BOOL v5 = ![(UIView *)v3 isHidden];
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

- (BOOL)isSnapshotLoaded
{
  return self->_snapshotView != 0;
}

- (BOOL)isBrokenViewVisible
{
  brokenView = self->_brokenView;
  if (brokenView)
  {
    if (brokenView == (_WGBrokenWidgetView *)self->_contentProvidingView) {
      LOBYTE(brokenView) = [(_WGBrokenWidgetView *)brokenView isHidden] ^ 1;
    }
    else {
      LOBYTE(brokenView) = 0;
    }
  }
  return (char)brokenView;
}

- (void)invalidateCachedSnapshotWithCompletionHandler:(id)a3
{
}

- (void)invalidateCachedSnapshotWithURL:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  snapshotView = self->_snapshotView;
  if (snapshotView)
  {
    id v8 = [(_WGCAPackageView *)snapshotView snapshotIdentifier];
    double v9 = [(WGWidgetHostingViewController *)self _widgetSnapshotURLForSnapshotIdentifier:v8 ensuringDirectoryExists:0];
    if (v9 && [v10 isEqual:v9]) {
      [(WGWidgetHostingViewController *)self _invalidateSnapshotWithForce:1 removingSnapshotFilesForActiveDisplayMode:0 completionHandler:v6];
    }
  }
}

- (BSAuditToken)auditToken
{
  v2 = (void *)MEMORY[0x263F29BE0];
  remoteViewController = self->_remoteViewController;
  if (remoteViewController) {
    [(_UIRemoteViewController *)remoteViewController serviceAuditToken];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  int64_t v4 = [v2 tokenFromAuditToken:v6];
  return (BSAuditToken *)v4;
}

- (void)maximumSizeDidChangeForDisplayMode:(int64_t)a3
{
  BOOL v5 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
  int v6 = [v5 isCurrentState:4];

  if (v6)
  {
    char v7 = objc_msgSend(NSString, "stringWithFormat:", @"Updating max size for display mode '%ld'", a3, MEMORY[0x263EF8330], 3221225472, __68__WGWidgetHostingViewController_maximumSizeDidChangeForDisplayMode___block_invoke, &__block_descriptor_40_e72_v28__0__WGWidgetHostingViewController_8__WGWidgetLifeCycleSequence_16B24l, a3);
    [(WGWidgetHostingViewController *)self _enqueueRemoteServiceRequest:&v8 withDescription:v7];
  }
}

void __68__WGWidgetHostingViewController_maximumSizeDidChangeForDisplayMode___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = a2;
    [v6 _maxSizeForDisplayMode:v5];
    double v8 = v7;
    double v10 = v9;
    id v11 = [v6 _remoteViewController];

    objc_msgSend(v11, "_setMaximumSize:forDisplayMode:", *(void *)(a1 + 32), v8, v10);
  }
}

- (int64_t)largestAvailableDisplayMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [WeakRetained largestAvailableDisplayModeForWidget:self];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setLockedOut:(BOOL)a3 withExplanation:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_lockedOut != v4)
  {
    self->_lockedOut = v4;
    if (v4)
    {
      [(WGWidgetHostingViewController *)self _insertLockedOutViewWithExplanation:v6];
      double v7 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __62__WGWidgetHostingViewController_setLockedOut_withExplanation___block_invoke;
      v8[3] = &unk_2646775B0;
      v8[4] = self;
      [(WGWidgetHostingViewController *)self _endSequence:v7 withReason:@"lock out began" completion:v8];
    }
    else if ([(UIViewController *)self wg_isAppearingOrAppeared])
    {
      [(WGWidgetHostingViewController *)self _beginSequenceWithReason:@"lock out ended" completion:&__block_literal_global_64 updateHandler:0];
    }
  }
}

void __62__WGWidgetHostingViewController_setLockedOut_withExplanation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 _endRemoteViewControllerAppearanceTransitionIfNecessary];
  if (([v3 isLockedOut] & 1) == 0)
  {
    v2 = [v3 _lockedOutView];
    [v2 removeFromSuperview];

    [v3 _setLockedOutView:0];
  }
}

- (void)_beginRemoteViewControllerAppearanceTransitionIfNecessary:(BOOL)a3 semaphore:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a3;
  uint64_t v59 = *MEMORY[0x263EF8340];
  dsema = a4;
  double v9 = (void (**)(id, id, void *))a6;
  if (v7)
  {
    if ((self->_ignoringParentAppearState
       || [(UIViewController *)self wg_isAppearingOrAppeared])
      && [(_WGWidgetRemoteViewController *)self->_remoteViewController _isValid])
    {
      contentProvidingView = self->_contentProvidingView;
      id v11 = [(_WGWidgetRemoteViewController *)self->_remoteViewController view];
      BOOL v12 = contentProvidingView == v11
         && [(UIViewController *)self->_remoteViewController wg_isDisappearingOrDisappeared];

LABEL_14:
      BOOL v13 = 0;
      if (v12) {
        goto LABEL_21;
      }
      goto LABEL_15;
    }
LABEL_11:
    BOOL v12 = 0;
    goto LABEL_14;
  }
  if (!self->_ignoringParentAppearState
    && [(WGWidgetHostingViewController *)self _appearState] == 1
    || ![(_WGWidgetRemoteViewController *)self->_remoteViewController _isValid])
  {
    goto LABEL_11;
  }
  BOOL v13 = [(UIViewController *)self->_remoteViewController wg_isAppearingOrAppeared];
  BOOL v12 = 0;
LABEL_15:
  if (!v13)
  {
    if (dsema) {
      dispatch_semaphore_signal(dsema);
    }
    objc_initWeak((id *)location, self);
    if (v9)
    {
      id WeakRetained = objc_loadWeakRetained((id *)location);
      __int16 v15 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
      v9[2](v9, WeakRetained, v15);
    }
    objc_destroyWeak((id *)location);
    goto LABEL_43;
  }
LABEL_21:
  v16 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    log = v16;
    v34 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    __int16 v17 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    if (v7) {
      v18 = @"appearing";
    }
    else {
      v18 = @"disappearing";
    }
    remoteViewController = self->_remoteViewController;
    uint64_t v20 = WGStringForAppearState([(WGWidgetHostingViewController *)self _appearState]);
    v21 = WGStringForAppearState([(_WGWidgetRemoteViewController *)self->_remoteViewController _appearState]);
    *(_DWORD *)location = 138544898;
    *(void *)&location[4] = v34;
    __int16 v47 = 2050;
    v48 = self;
    __int16 v49 = 2114;
    uint64_t v50 = (uint64_t)v17;
    __int16 v51 = 2114;
    v52 = v18;
    __int16 v53 = 2114;
    v54 = remoteViewController;
    __int16 v55 = 2114;
    v56 = v20;
    __int16 v57 = 2114;
    v58 = v21;
    _os_log_impl(&dword_222E49000, log, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Begin appearance transition (%{public}@): _remoteViewController=%{"
      "public}@, [self _appearState]=%{public}@, [_remoteViewController _appearState]=%{public}@",
      location,
      0x48u);
  }
  if (v12
    && [(_WGWidgetRemoteViewController *)self->_remoteViewController _appearState] == 3
    || v13
    && [(_WGWidgetRemoteViewController *)self->_remoteViewController _appearState] == 1)
  {
    v22 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = v22;
      v24 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      uint64_t v25 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      uint64_t v26 = (void *)v25;
      v27 = @"Disappearing";
      *(_DWORD *)location = 138544386;
      *(void *)&location[4] = v24;
      if (v7) {
        v27 = @"Appearing";
      }
      double v28 = @"appearing";
      __int16 v47 = 2050;
      v48 = self;
      if (v7) {
        double v28 = @"disappearing";
      }
      __int16 v49 = 2114;
      uint64_t v50 = v25;
      __int16 v51 = 2114;
      v52 = v27;
      __int16 v53 = 2114;
      v54 = v28;
      _os_log_impl(&dword_222E49000, v23, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> %{public}@, but remote view controller is still %{public}@ - end"
        "ing previous transition.",
        location,
        0x34u);
    }
    [(_WGWidgetRemoteViewController *)self->_remoteViewController endAppearanceTransition];
  }
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __121__WGWidgetHostingViewController__beginRemoteViewControllerAppearanceTransitionIfNecessary_semaphore_animated_completion___block_invoke;
  v41[3] = &unk_2646775D8;
  BOOL v44 = v12;
  BOOL v45 = v13;
  v42 = dsema;
  v43 = v9;
  double v29 = (void *)MEMORY[0x223CAA850](v41);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __121__WGWidgetHostingViewController__beginRemoteViewControllerAppearanceTransitionIfNecessary_semaphore_animated_completion___block_invoke_83;
  v37[3] = &unk_264677628;
  id v30 = v29;
  id v38 = v30;
  BOOL v39 = v7;
  BOOL v40 = a5;
  [(WGWidgetHostingViewController *)self _enqueueRemoteServiceRequest:v37 withDescription:@"Opening begin appearance transaction"];
  if (v7) {
    uint64_t v31 = 1128;
  }
  else {
    uint64_t v31 = 1120;
  }
  objc_super v32 = *(NSObject **)((char *)&self->super.super.super.isa + v31);
  if (v32) {
    dispatch_semaphore_signal(v32);
  }

LABEL_43:
}

void __121__WGWidgetHostingViewController__beginRemoteViewControllerAppearanceTransitionIfNecessary_semaphore_animated_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ((*(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 49)) && *(void *)(a1 + 32))
  {
    BOOL v7 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = v7;
      double v9 = [v5 widgetIdentifier];
      uint64_t v10 = [v5 _containerIdentifier];
      id v11 = (void *)v10;
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = *(unsigned __int8 *)(a1 + 48);
      int v16 = 138544386;
      if (v13) {
        id v14 = @"appearance";
      }
      else {
        id v14 = @"disappearance";
      }
      __int16 v17 = v9;
      __int16 v18 = 2050;
      id v19 = v5;
      __int16 v20 = 2114;
      uint64_t v21 = v10;
      __int16 v22 = 2114;
      uint64_t v23 = v12;
      __int16 v24 = 2114;
      uint64_t v25 = v14;
      _os_log_impl(&dword_222E49000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Signaling semaphore '%{public}@' for %{public}@ transition",
        (uint8_t *)&v16,
        0x34u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
  }
}

void __121__WGWidgetHostingViewController__beginRemoteViewControllerAppearanceTransitionIfNecessary_semaphore_animated_completion___block_invoke_83(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v6 = a2;
  if (a4)
  {
    BOOL v7 = [MEMORY[0x263F08C38] UUID];
    double v8 = [v6 _openAppearanceTransactions];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __121__WGWidgetHostingViewController__beginRemoteViewControllerAppearanceTransitionIfNecessary_semaphore_animated_completion___block_invoke_2;
    v17[3] = &unk_264677600;
    id v9 = v6;
    id v18 = v9;
    id v10 = *(id *)(a1 + 32);
    id v19 = v7;
    id v20 = v10;
    id v11 = v7;
    uint64_t v12 = (void *)[v17 copy];
    [v8 setObject:v12 forKey:v11];

    int v13 = [v9 _remoteViewController];
    id v14 = v13;
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 3;
    }
    [v13 _openTransactionForAppearanceCallWithState:v15 withIdentifier:v11];

    int v16 = [v9 _remoteViewController];
    [v16 beginAppearanceTransition:*(unsigned __int8 *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 41)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __121__WGWidgetHostingViewController__beginRemoteViewControllerAppearanceTransitionIfNecessary_semaphore_animated_completion___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[6];
  v2 = (void *)a1[4];
  id v3 = [NSString stringWithFormat:@"Appearance completion for transactionID %@", a1[5]];
  [v2 _enqueueRemoteServiceRequest:v1 withDescription:v3];
}

- (void)_endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, id, void *))a3;
  if (self->_ignoringParentAppearState
    || [(WGWidgetHostingViewController *)self _appearState] == 2)
  {
    if ([(_WGWidgetRemoteViewController *)self->_remoteViewController _isValid]) {
      BOOL v5 = [(_WGWidgetRemoteViewController *)self->_remoteViewController _appearState] == 1
    }
        || [(_WGWidgetRemoteViewController *)self->_remoteViewController _appearState] == 3;
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  if ([(_WGWidgetRemoteViewController *)self->_remoteViewController _isValid])
  {
    BOOL v6 = [(_WGWidgetRemoteViewController *)self->_remoteViewController _appearState] == 3;
    if (v5) {
      goto LABEL_17;
    }
  }
  else
  {
    BOOL v6 = 0;
    if (v5) {
      goto LABEL_17;
    }
  }
  if (!v6)
  {
    objc_initWeak((id *)location, self);
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)location);
      double v8 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
      v4[2](v4, WeakRetained, v8);
    }
    goto LABEL_24;
  }
LABEL_17:
  if (self->_viewWillAppearSemaphore && v5) {
    goto LABEL_22;
  }
  if (!self->_viewWillDisappearSemaphore) {
    LOBYTE(v6) = 0;
  }
  if (v6)
  {
LABEL_22:
    objc_initWeak((id *)location, self);
    if (v4)
    {
      id v9 = objc_loadWeakRetained((id *)location);
      id v10 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
      v4[2](v4, v9, v10);
    }
LABEL_24:
    objc_destroyWeak((id *)location);
    goto LABEL_25;
  }
  id v11 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    int v13 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    id v14 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    remoteViewController = self->_remoteViewController;
    int v16 = WGStringForAppearState([(WGWidgetHostingViewController *)self _appearState]);
    __int16 v17 = WGStringForAppearState([(_WGWidgetRemoteViewController *)self->_remoteViewController _appearState]);
    *(_DWORD *)location = 138544642;
    *(void *)&location[4] = v13;
    __int16 v29 = 2050;
    id v30 = self;
    __int16 v31 = 2114;
    objc_super v32 = v14;
    __int16 v33 = 2114;
    v34 = remoteViewController;
    __int16 v35 = 2114;
    v36 = v16;
    __int16 v37 = 2114;
    id v38 = v17;
    _os_log_impl(&dword_222E49000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> End appearance transition: _remoteViewController=%{public}@, [self"
      " _appearState]=%{public}@, [_remoteViewController _appearState]=%{public}@",
      location,
      0x3Eu);
  }
  if (v4)
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __103__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion___block_invoke;
    v26[3] = &unk_264677650;
    id v18 = v4;
    v27 = v18;
    id v19 = (void *)MEMORY[0x223CAA850](v26);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __103__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion___block_invoke_2;
    v22[3] = &unk_264677678;
    id v23 = v19;
    BOOL v25 = v5;
    __int16 v24 = v18;
    id v20 = v19;
    [(WGWidgetHostingViewController *)self _enqueueRemoteServiceRequest:v22 withDescription:@"Opening end appearance transaction"];
  }
  else
  {
    uint64_t v21 = [(WGWidgetHostingViewController *)self _remoteViewController];
    [v21 endAppearanceTransition];
  }
LABEL_25:
}

uint64_t __103__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __103__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    id v9 = [MEMORY[0x263F08C38] UUID];
    id v10 = [v7 _openAppearanceTransactions];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __103__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion___block_invoke_3;
    v18[3] = &unk_264677600;
    id v11 = v7;
    id v19 = v11;
    id v12 = *(id *)(a1 + 32);
    id v20 = v9;
    id v21 = v12;
    id v13 = v9;
    id v14 = (void *)[v18 copy];
    [v10 setObject:v14 forKey:v13];

    uint64_t v15 = [v11 _remoteViewController];
    [v15 _openTransactionForAppearanceCallWithState:2 * *(unsigned __int8 *)(a1 + 48) withIdentifier:v13];

    int v16 = [v11 _remoteViewController];
    [v16 endAppearanceTransition];
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 40);
    if (v17) {
      (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v7, v8);
    }
  }
}

void __103__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion___block_invoke_3(void *a1)
{
  uint64_t v1 = a1[6];
  v2 = (void *)a1[4];
  id v3 = [NSString stringWithFormat:@"Appearance completion for transactionID %@", a1[5]];
  [v2 _enqueueRemoteServiceRequest:v1 withDescription:v3];
}

- (void)_endRemoteViewControllerAppearanceTransitionIfNecessary
{
  id v4 = [(WGWidgetHostingViewController *)self delegate];
  if ([(_WGWidgetRemoteViewController *)self->_remoteViewController _appearState] == 1)
  {
    if (objc_opt_respondsToSelector()) {
      id v3 = &__block_literal_global_98;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  [(WGWidgetHostingViewController *)self _endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion:v3];
}

void __88__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v2 = [v5 _remoteViewController];
  int v3 = [v2 _appearState];

  if (v3 == 2)
  {
    id v4 = [v5 delegate];
    [v4 remoteViewControllerViewDidAppearForWidget:v5];
  }
}

- (void)managingContainerWillAppear:(id)a3
{
  if ([(UIViewController *)self wg_isDisappearingOrDisappeared]
    && [(WGWidgetHostingViewController *)self _shouldRemoveSnapshotWhenNotVisible])
  {
    [(WGWidgetHostingViewController *)self _validateSnapshotViewForActiveLayoutMode];
    [(WGWidgetHostingViewController *)self _insertSnapshotViewIfAppropriate];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WGWidgetHostingViewController;
  [(WGWidgetHostingViewController *)&v7 viewWillAppear:a3];
  id v4 = [(WGWidgetHostingViewController *)self delegate];
  [v4 registerWidgetForRefreshEvents:self];

  [(WGWidgetHostingViewController *)self _validateSnapshotViewForActiveLayoutMode];
  [(WGWidgetHostingViewController *)self _insertSnapshotViewIfAppropriate];
  [(WGWidgetHostingViewController *)self _requestVisibilityStateUpdateForPossiblyAppearing:1 sequence:self->_activeLifeCycleSequence];
  if ([(WGWidgetLifeCycleSequence *)self->_activeLifeCycleSequence isCurrentStateAtLeast:4]&& [(WGWidgetLifeCycleSequence *)self->_activeLifeCycleSequence isCurrentStateAtMost:6]&& [(_WGWidgetRemoteViewController *)self->_remoteViewController _isValid])
  {
    contentProvidingView = self->_contentProvidingView;
    BOOL v6 = [(_WGWidgetRemoteViewController *)self->_remoteViewController view];

    if (contentProvidingView == v6) {
      [(WGWidgetHostingViewController *)self _beginSequenceWithReason:@"appearance transition" completion:&__block_literal_global_105 updateHandler:0];
    }
  }
}

uint64_t __48__WGWidgetHostingViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _endRemoteViewControllerAppearanceTransitionIfNecessary];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGWidgetHostingViewController;
  [(WGWidgetHostingViewController *)&v4 viewDidAppear:a3];
  [(WGWidgetHostingViewController *)self _beginSequenceWithReason:@"appearance transition" completion:&__block_literal_global_109 updateHandler:0];
}

uint64_t __47__WGWidgetHostingViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _endRemoteViewControllerAppearanceTransitionIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WGWidgetHostingViewController;
  [(WGWidgetHostingViewController *)&v6 viewWillDisappear:a3];
  objc_super v4 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__WGWidgetHostingViewController_viewWillDisappear___block_invoke;
  v5[3] = &unk_2646775B0;
  v5[4] = self;
  [(WGWidgetHostingViewController *)self _endSequence:v4 withReason:@"disappearance transition" completion:v5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WGWidgetHostingViewController;
  [(WGWidgetHostingViewController *)&v6 viewDidDisappear:a3];
  objc_super v4 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
  [(WGWidgetHostingViewController *)self _requestVisibilityStateUpdateForPossiblyAppearing:0 sequence:v4];

  id v5 = [(WGWidgetHostingViewController *)self delegate];
  [v5 unregisterWidgetForRefreshEvents:self];
}

- (void)managingContainerDidDisappear:(id)a3
{
  uint64_t v4 = [(WGWidgetHostingViewController *)self _snapshotView];
  if (v4)
  {
    id v8 = (id)v4;
    id v5 = [(WGWidgetHostingViewController *)self _contentProvidingView];
    objc_super v6 = [(WGWidgetHostingViewController *)self _snapshotView];
    if (v5 == v6)
    {
      BOOL v7 = [(WGWidgetHostingViewController *)self _shouldRemoveSnapshotWhenNotVisible];

      if (!v7) {
        return;
      }
      id v8 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
      -[WGWidgetHostingViewController _insertContentProvidingSubview:sequence:completion:](self, "_insertContentProvidingSubview:sequence:completion:", 0);
    }
    else
    {
    }
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)WGWidgetHostingViewController;
  [(WGWidgetHostingViewController *)&v4 viewDidLoad];
  int v3 = [(WGWidgetHostingViewController *)self view];
  [v3 setAutoresizesSubviews:1];

  [(WGWidgetHostingViewController *)self _insertAppropriateContentView];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v6 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = v6;
    id v8 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    id v9 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    v21.double width = width;
    v21.double height = height;
    id v10 = NSStringFromCGSize(v21);
    *(_DWORD *)buf = 138544130;
    id v13 = v8;
    __int16 v14 = 2050;
    uint64_t v15 = self;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    id v19 = v10;
    _os_log_impl(&dword_222E49000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Requested preferred content size: %{public}@",
      buf,
      0x2Au);
  }
  v11.receiver = self;
  v11.super_class = (Class)WGWidgetHostingViewController;
  -[WGWidgetHostingViewController setPreferredContentSize:](&v11, sel_setPreferredContentSize_, width, height);
  -[WGWidgetInfo updatePreferredContentSize:forWidgetHost:](self->_widgetInfo, "updatePreferredContentSize:forWidgetHost:", self, width, height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WGWidgetHostingViewController;
  [(WGWidgetHostingViewController *)&v12 traitCollectionDidChange:v4];
  id v5 = [v4 preferredContentSizeCategory];
  if (!v5
    || ([(WGWidgetHostingViewController *)self traitCollection],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        [v6 preferredContentSizeCategory],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7 == v5))
  {
    uint64_t v9 = [v4 userInterfaceStyle];
    id v10 = [(WGWidgetHostingViewController *)self traitCollection];
    uint64_t v11 = [v10 userInterfaceStyle];

    if (v9 != v11) {
      [(WGWidgetHostingViewController *)self _removeAllSnapshotFilesInActiveDisplayModeForAllButActiveUserInterfaceStyle];
    }
  }
  else
  {
    [(WGWidgetHostingViewController *)self _removeAllSnapshotFilesInActiveDisplayModeForContentSizeCategory:v5];
    [(WGWidgetHostingViewController *)self maximumSizeDidChangeForDisplayMode:0];
    [(WGWidgetHostingViewController *)self maximumSizeDidChangeForDisplayMode:1];
    if (![(WGWidgetHostingViewController *)self activeDisplayMode])
    {
      [(WGWidgetHostingViewController *)self preferredContentSize];
      [(WGWidgetHostingViewController *)self _updatePreferredContentSizeWithHeight:v8];
    }
    [(WGWidgetHostingViewController *)self _layoutMarginsDidChange];
  }
}

- (BOOL)_isActiveSequence:(id)a3
{
  id v4 = a3;
  id v5 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];

  return v5 == v4;
}

- (void)_initiateNewSequenceIfNecessary
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v3 = NSString;
  id v4 = [(WGWidgetHostingViewController *)self widgetIdentifier];
  id v5 = [(WGWidgetHostingViewController *)self _containerIdentifier];
  objc_super v6 = (void *)MEMORY[0x263F08790];
  BOOL v7 = [MEMORY[0x263EFF910] date];
  double v8 = [v6 localizedStringFromDate:v7 dateStyle:1 timeStyle:2];
  uint64_t v9 = [v3 stringWithFormat:@"%@.%@.%@", v4, v5, v8];

  activeLifeCycleSequence = self->_activeLifeCycleSequence;
  if (activeLifeCycleSequence)
  {
    if ([(WGWidgetLifeCycleSequence *)activeLifeCycleSequence isCurrentStateAtLeast:5])
    {
      uint64_t v11 = [(WGWidgetLifeCycleSequence *)self->_activeLifeCycleSequence sequenceWithIdentifier:v9];
      objc_super v12 = self->_activeLifeCycleSequence;
      self->_activeLifeCycleSequence = v11;

      id v13 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = v13;
        uint64_t v15 = [(WGWidgetHostingViewController *)self widgetIdentifier];
        __int16 v16 = [(WGWidgetHostingViewController *)self _containerIdentifier];
        uint64_t v17 = self->_activeLifeCycleSequence;
        *(_DWORD *)buf = 138544130;
        __int16 v24 = v15;
        __int16 v25 = 2050;
        uint64_t v26 = self;
        __int16 v27 = 2114;
        double v28 = v16;
        __int16 v29 = 2114;
        id v30 = v17;
        __int16 v18 = "<%{public}@: %{public}p; container: %{public}@> Initiating new life cycle sequence: %{public}@";
LABEL_7:
        _os_log_impl(&dword_222E49000, v14, OS_LOG_TYPE_DEFAULT, v18, buf, 0x2Au);
      }
    }
  }
  else
  {
    id v19 = [[WGWidgetLifeCycleSequence alloc] initWithSequenceIdentifier:v9];
    uint64_t v20 = self->_activeLifeCycleSequence;
    self->_activeLifeCycleSequence = v19;

    CGSize v21 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = v21;
      uint64_t v15 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      __int16 v16 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      __int16 v22 = self->_activeLifeCycleSequence;
      *(_DWORD *)buf = 138544130;
      __int16 v24 = v15;
      __int16 v25 = 2050;
      uint64_t v26 = self;
      __int16 v27 = 2114;
      double v28 = v16;
      __int16 v29 = 2114;
      id v30 = v22;
      __int16 v18 = "<%{public}@: %{public}p; container: %{public}@> Initiating new life cycle sequence: '%{public}@'";
      goto LABEL_7;
    }
  }
}

- (void)_abortActiveSequence
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v3 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    objc_super v6 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    activeLifeCycleSequence = self->_activeLifeCycleSequence;
    int v9 = 138544130;
    id v10 = v5;
    __int16 v11 = 2050;
    objc_super v12 = self;
    __int16 v13 = 2114;
    __int16 v14 = v6;
    __int16 v15 = 2114;
    __int16 v16 = activeLifeCycleSequence;
    _os_log_impl(&dword_222E49000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Aborting active life cycle sequence: %{public}@",
      (uint8_t *)&v9,
      0x2Au);
  }
  double v8 = self->_activeLifeCycleSequence;
  self->_activeLifeCycleSequence = 0;
}

- (void)_setupRequestQueue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!self->_proxyRequestQueue)
  {
    int v3 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    id v4 = (char *)QueueName(@"com.apple.widgets.proxyrequestqueue", v3);

    NewSerialQueue(v4);
    id v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    proxyRequestQueue = self->_proxyRequestQueue;
    self->_proxyRequestQueue = v5;

    BOOL v7 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = v7;
      int v9 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      id v10 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      int v11 = 138544130;
      objc_super v12 = v9;
      __int16 v13 = 2050;
      __int16 v14 = self;
      __int16 v15 = 2114;
      __int16 v16 = v10;
      __int16 v17 = 2082;
      __int16 v18 = v4;
      _os_log_impl(&dword_222E49000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Setup request queue (%{public}s)",
        (uint8_t *)&v11,
        0x2Au);
    }
  }
}

- (void)_enqueueRequest:(id)a3 inQueue:(id)a4 trampolinedToMainQueue:(BOOL)a5 withDescription:(id)a6
{
  BOOL v7 = a5;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v11)
  {
    id v13 = objc_initWeak(&location, self);
    __int16 v14 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
    objc_initWeak(&from, self);
    id v15 = v14;
    id v16 = v10;
    __int16 v17 = v11;
    id v28 = v12;
    id v18 = objc_loadWeakRetained(&from);
    if (v16) {
      BOOL v19 = v18 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    int v20 = !v19;

    if (!v20) {
      goto LABEL_13;
    }
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __DispatchBlockForRequest_block_invoke;
    v32[3] = &unk_264677D70;
    __int16 v33 = v17;
    objc_copyWeak(&v37, &from);
    id v36 = v16;
    id v34 = v28;
    id v35 = v15;
    CGSize v21 = (void *)MEMORY[0x223CAA850](v32);
    __int16 v22 = v21;
    if (v7)
    {
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __DispatchBlockForRequest_block_invoke_783;
      v30[3] = &unk_2646768C8;
      id v31 = v21;
      id v23 = (void *)[v30 copy];
    }
    else
    {
      id v23 = (void *)[v21 copy];
    }

    objc_destroyWeak(&v37);
    if (!v23)
    {
LABEL_13:
      __int16 v24 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = v24;
        __int16 v27 = (void *)MEMORY[0x223CAA850](v16);
        *(_DWORD *)buf = 138543874;
        BOOL v40 = v27;
        __int16 v41 = 2114;
        v42 = v17;
        __int16 v43 = 2114;
        id v44 = v28;
        _os_log_error_impl(&dword_222E49000, v26, OS_LOG_TYPE_ERROR, "Wrapped request is 'nil' (request:%{public}@, queue:%{public}@, description:%{public}@)", buf, 0x20u);
      }
      id v23 = 0;
    }
    __int16 v25 = (void *)MEMORY[0x223CAA850](v23);

    objc_destroyWeak(&from);
    dispatch_async(v17, v25);

    objc_destroyWeak(&location);
  }
}

- (void)_enqueueRemoteServiceRequest:(id)a3 withDescription:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WGWidgetHostingViewController *)self _proxyRequestQueue];
  [(WGWidgetHostingViewController *)self _enqueueRequest:v7 inQueue:v8 trampolinedToMainQueue:1 withDescription:v6];
}

- (void)_beginSequenceWithReason:(id)a3 completion:(id)a4 updateHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    __int16 v14 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    *(_DWORD *)buf = 138544130;
    __int16 v22 = v13;
    __int16 v23 = 2050;
    __int16 v24 = self;
    __int16 v25 = 2114;
    uint64_t v26 = v14;
    __int16 v27 = 2114;
    id v28 = v8;
    _os_log_impl(&dword_222E49000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Begin sequence with reason: %{public}@",
      buf,
      0x2Au);
  }
  [(WGWidgetHostingViewController *)self _initiateNewSequenceIfNecessary];
  [(WGWidgetHostingViewController *)self _validateSnapshotViewForActiveLayoutMode];
  id v15 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __83__WGWidgetHostingViewController__beginSequenceWithReason_completion_updateHandler___block_invoke;
  v18[3] = &unk_2646776C8;
  id v19 = v10;
  id v20 = v9;
  void v18[4] = self;
  id v16 = v9;
  id v17 = v10;
  [(WGWidgetHostingViewController *)self _connectRemoteViewControllerForReason:v8 sequence:v15 completionHandler:v18];
}

void __83__WGWidgetHostingViewController__beginSequenceWithReason_completion_updateHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 _isActiveSequence:v6];
  if ([(__CFString *)v6 isCurrentStateAtLeast:2])
  {
    int v8 = [(__CFString *)v6 isCurrentStateAtMost:4];
    char v9 = v8;
    if ((v7 & v8) == 1)
    {
      [v5 _noteOutstandingUpdateRequestForSequence:v6];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __83__WGWidgetHostingViewController__beginSequenceWithReason_completion_updateHandler___block_invoke_2;
      v27[3] = &unk_2646776A0;
      id v10 = v5;
      id v28 = v10;
      id v11 = v6;
      uint64_t v29 = v11;
      id v30 = *(id *)(a1 + 40);
      [v10 _performUpdateForSequence:v11 withCompletionHandler:v27];
      [v10 _requestInsertionOfRemoteViewAfterViewWillAppearForSequence:v11 completionHandler:*(void *)(a1 + 48)];

      goto LABEL_22;
    }
  }
  else
  {
    char v9 = 0;
  }
  int v12 = 0;
  if (v7 && (v9 & 1) == 0) {
    int v12 = [(__CFString *)v6 isCurrentStateNotYet:4];
  }
  if (v7)
  {
    if ((v9 & 1) == 0)
    {
      id v13 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = v13;
        id v15 = [v5 widgetIdentifier];
        id v16 = [v5 _containerIdentifier];
        if (v12) {
          id v17 = @"Aborting";
        }
        else {
          id v17 = @"Can't continue";
        }
        id v18 = WGStringFromWidgetLifeCycleSequenceState(2uLL);
        id v19 = WGStringFromWidgetLifeCycleSequenceState(4uLL);
        *(_DWORD *)buf = 138544898;
        objc_super v32 = v15;
        __int16 v33 = 2050;
        id v34 = v5;
        __int16 v35 = 2114;
        id v36 = v16;
        __int16 v37 = 2114;
        id v38 = v17;
        __int16 v39 = 2114;
        BOOL v40 = v6;
        __int16 v41 = 2114;
        v42 = v18;
        __int16 v43 = 2114;
        id v44 = v19;
        _os_log_impl(&dword_222E49000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> %{public}@ sequence as argument sequence (%{public}@) isn't in"
          " expected range (%{public}@ – %{public}@)",
          buf,
          0x48u);
      }
    }
  }
  else
  {
    id v20 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      CGSize v21 = v20;
      __int16 v22 = [v5 widgetIdentifier];
      __int16 v23 = [v5 _containerIdentifier];
      __int16 v24 = [v5 _activeLifeCycleSequence];
      *(_DWORD *)buf = 138544386;
      objc_super v32 = v22;
      __int16 v33 = 2050;
      id v34 = v5;
      __int16 v35 = 2114;
      id v36 = v23;
      __int16 v37 = 2114;
      id v38 = v6;
      __int16 v39 = 2114;
      BOOL v40 = v24;
      _os_log_impl(&dword_222E49000, v21, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't continue sequence as argument sequence (%{public}@) doesn'"
        "t match active sequence (%{public}@)",
        buf,
        0x34u);
    }
  }
  if (v12) {
    [v5 _abortActiveSequence];
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  uint64_t v25 = *(void *)(a1 + 48);
  if (v25)
  {
    id WeakRetained = objc_loadWeakRetained((id *)buf);
    (*(void (**)(uint64_t, id, __CFString *))(v25 + 16))(v25, WeakRetained, v6);
  }
  objc_destroyWeak((id *)buf);
LABEL_22:
}

uint64_t __83__WGWidgetHostingViewController__beginSequenceWithReason_completion_updateHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) _isActiveSequence:*(void *)(a1 + 40)])
  {
    uint64_t v6 = [*(id *)(a1 + 32) _updateRequestForSequence:*(void *)(a1 + 40)];
    int v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, *(void *)(a1 + 32), *(void *)(a1 + 40));
    }
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, a2, a3);
    }
  }
  char v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  return [v9 _registerUpdateRequestCompletionHandler:0 forSequence:v10];
}

- (void)_connectRemoteViewControllerForReason:(id)a3 sequence:(id)a4 completionHandler:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id, id))a5;
  BOOL v11 = [(WGWidgetHostingViewController *)self _isActiveSequence:v9];
  int v12 = (void *)WGLogWidgets;
  BOOL v13 = os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      __int16 v14 = v12;
      id v15 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      id v16 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      *(_DWORD *)buf = 138544130;
      v46 = v15;
      __int16 v47 = 2050;
      v48 = self;
      __int16 v49 = 2114;
      uint64_t v50 = v16;
      __int16 v51 = 2114;
      id v52 = v8;
      _os_log_impl(&dword_222E49000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Connection requested with reason: '%{public}@'",
        buf,
        0x2Au);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_disconnectionTimer);
    if ([(id)objc_opt_class() _canWidgetHostConnectRemoteViewControllerByRequestingForSequence:v9 disconnectionTimer:WeakRetained connectionState:self->_connectionState])
    {
      id v18 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = v18;
        id v20 = [(WGWidgetHostingViewController *)self widgetIdentifier];
        CGSize v21 = [(WGWidgetHostingViewController *)self _containerIdentifier];
        *(_DWORD *)buf = 138543874;
        v46 = v20;
        __int16 v47 = 2050;
        v48 = self;
        __int16 v49 = 2114;
        uint64_t v50 = v21;
        _os_log_impl(&dword_222E49000, v19, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Will request remote view controller",
          buf,
          0x20u);
      }
      __int16 v22 = [v9 transitionToState:1];
      if (v22)
      {
        __int16 v23 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
          -[WGWidgetHostingViewController _connectRemoteViewControllerForReason:sequence:completionHandler:](v23);
        }
        objc_initWeak((id *)buf, self);
        if (v10)
        {
          id v24 = objc_loadWeakRetained((id *)buf);
          v10[2](v10, v24, v9);
        }
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __98__WGWidgetHostingViewController__connectRemoteViewControllerForReason_sequence_completionHandler___block_invoke;
        v43[3] = &unk_2646776F0;
        id v44 = v10;
        [(WGWidgetHostingViewController *)self _requestRemoteViewControllerForSequence:v9 completionHander:v43];
      }
    }
    else if ([(id)objc_opt_class() _canWidgetHostConnectRemoteViewControllerByCancellingDisappearanceForSequence:v9])
    {
      if (WeakRetained)
      {
        id v30 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = v30;
          objc_super v32 = [(WGWidgetHostingViewController *)self widgetIdentifier];
          __int16 v33 = [(WGWidgetHostingViewController *)self _containerIdentifier];
          *(_DWORD *)buf = 138543874;
          v46 = v32;
          __int16 v47 = 2050;
          v48 = self;
          __int16 v49 = 2114;
          uint64_t v50 = v33;
          _os_log_impl(&dword_222E49000, v31, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Connection requested with pending disconnection - invalidati"
            "ng disconnection timer",
            buf,
            0x20u);
        }
        [(WGWidgetHostingViewController *)self _invalidateDisconnectionTimer];
      }
      id v34 = [v9 transitionToState:2];
      if (v34)
      {
        __int16 v35 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
          -[WGWidgetHostingViewController _connectRemoteViewControllerForReason:sequence:completionHandler:](v35);
        }
        objc_initWeak((id *)buf, self);
        if (v10)
        {
          id v36 = objc_loadWeakRetained((id *)buf);
          v10[2](v10, v36, v9);
        }
      }
      else
      {
        ValidateQueue(self->_proxyRequestQueue);
        objc_initWeak((id *)buf, self);
        if (v10)
        {
          id v42 = objc_loadWeakRetained((id *)buf);
          v10[2](v10, v42, v9);
        }
      }
      objc_destroyWeak((id *)buf);
    }
    else
    {
      __int16 v37 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = v37;
        __int16 v39 = [(WGWidgetHostingViewController *)self widgetIdentifier];
        BOOL v40 = [(WGWidgetHostingViewController *)self _containerIdentifier];
        *(_DWORD *)buf = 138544130;
        v46 = v39;
        __int16 v47 = 2050;
        v48 = self;
        __int16 v49 = 2114;
        uint64_t v50 = v40;
        __int16 v51 = 2114;
        id v52 = v9;
        _os_log_impl(&dword_222E49000, v38, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Sequence already at satisfactory state: %{public}@",
          buf,
          0x2Au);
      }
      objc_initWeak((id *)buf, self);
      if (v10)
      {
        id v41 = objc_loadWeakRetained((id *)buf);
        v10[2](v10, v41, v9);
      }
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (v13)
    {
      uint64_t v25 = v12;
      uint64_t v26 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      __int16 v27 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      id v28 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
      *(_DWORD *)buf = 138544386;
      v46 = v26;
      __int16 v47 = 2050;
      v48 = self;
      __int16 v49 = 2114;
      uint64_t v50 = v27;
      __int16 v51 = 2114;
      id v52 = v9;
      __int16 v53 = 2114;
      v54 = v28;
      _os_log_impl(&dword_222E49000, v25, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller as argument sequence (%{pub"
        "lic}@) doesn't match active sequence (%{public}@)",
        buf,
        0x34u);
    }
    objc_initWeak((id *)buf, self);
    if (v10)
    {
      id v29 = objc_loadWeakRetained((id *)buf);
      v10[2](v10, v29, v9);
    }
    objc_destroyWeak((id *)buf);
  }
}

void __98__WGWidgetHostingViewController__connectRemoteViewControllerForReason_sequence_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = [v10 _remoteViewController];
  int v7 = [v6 _isValid];

  if (v7)
  {
    id v8 = [v10 _proxyRequestQueue];
    ValidateQueue(v8);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v10, v5);
  }
}

- (void)_requestRemoteViewControllerForSequence:(id)a3 completionHander:(id)a4
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(id, id, id))a4;
  BOOL v9 = [(WGWidgetHostingViewController *)self _isActiveSequence:v7];
  int v10 = [(id)objc_opt_class() _canWidgetHostRequestRemoteViewControllerForSequence:v7];
  if (v9 && v10)
  {
    BOOL v11 = [(WGWidgetHostingViewController *)self _isBlacklisted];
    BOOL v12 = [(WGWidgetHostingViewController *)self isLockedOut];
    if (!v11 && !v12)
    {
      *(void *)v99 = 0;
      *(void *)&v99[8] = v99;
      *(void *)&v99[16] = 0x3032000000;
      v100 = __Block_byref_object_copy__5;
      *(void *)v101 = __Block_byref_object_dispose__5;
      *(void *)&v101[8] = 0;
      uint64_t v93 = 0;
      v94 = &v93;
      uint64_t v95 = 0x3032000000;
      v96 = __Block_byref_object_copy__5;
      v97 = __Block_byref_object_dispose__5;
      id v98 = (id)MEMORY[0x223CAA850](v8);
      BOOL v13 = [(WGWidgetHostingViewController *)self _remoteViewControllerConnectionHandler];
      v87[0] = MEMORY[0x263EF8330];
      v87[1] = 3221225472;
      v87[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke;
      v87[3] = &unk_264677718;
      id v70 = v13;
      id v89 = v70;
      id v14 = v7;
      id v88 = v14;
      v90 = v99;
      v91 = &v93;
      uint64_t v92 = 2;
      v71 = (void (**)(void))MEMORY[0x223CAA850](v87);
      if ([(WGWidgetHostingViewController *)self _connectionState] == 1)
      {
        id v15 = (id)WGLogWidgets;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = [(WGWidgetHostingViewController *)self widgetIdentifier];
          id v17 = [(WGWidgetHostingViewController *)self _containerIdentifier];
          *(_DWORD *)buf = 138543874;
          id v103 = v16;
          __int16 v104 = 2050;
          v105 = self;
          __int16 v106 = 2114;
          id v107 = v17;
          _os_log_impl(&dword_222E49000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Already have an outstanding request, so updating connection handler",
            buf,
            0x20u);
        }
        id v72 = 0;
        uint64_t v18 = [v14 beginTransitionToState:2 error:&v72];
        uint64_t v19 = (uint64_t)v72;
        id v20 = *(void **)(*(void *)&v99[8] + 40);
        *(void *)(*(void *)&v99[8] + 40) = v18;

        if (*(void *)(*(void *)&v99[8] + 40) | v19)
        {
          if (v19)
          {
            CGSize v21 = (id)WGLogWidgets;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              WGStringFromWidgetLifeCycleSequenceState(2uLL);
              objc_claimAutoreleasedReturnValue();
              -[WGWidgetHostingViewController _requestRemoteViewControllerForSequence:completionHander:]();
            }

            objc_initWeak(&location, self);
            if (v8)
            {
              id v22 = objc_loadWeakRetained(&location);
              v8[2](v8, v22, v14);
            }
            objc_destroyWeak(&location);
            goto LABEL_64;
          }
        }
        else
        {
          v63 = [MEMORY[0x263F08690] currentHandler];
          [v63 handleFailureInMethod:a2, self, @"WGWidgetHostingViewController.m", 982, @"Invalid parameter not satisfying: %@", @"endTransitionBlock || error" object file lineNumber description];
        }
        [(WGWidgetHostingViewController *)self _setRemoteViewControllerConnectionHandler:v71];
LABEL_64:

        _Block_object_dispose(&v93, 8);
        _Block_object_dispose(v99, 8);

        goto LABEL_65;
      }
      if ([(_WGWidgetRemoteViewController *)self->_remoteViewController _isValid])
      {
        id v86 = 0;
        uint64_t v43 = [v14 beginTransitionToState:2 error:&v86];
        uint64_t v19 = (uint64_t)v86;
        id v44 = *(void **)(*(void *)&v99[8] + 40);
        *(void *)(*(void *)&v99[8] + 40) = v43;

        if (*(void *)(*(void *)&v99[8] + 40) | v19)
        {
          if (v19)
          {
            uint64_t v45 = (id)WGLogWidgets;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              WGStringFromWidgetLifeCycleSequenceState(2uLL);
              objc_claimAutoreleasedReturnValue();
              -[WGWidgetHostingViewController _requestRemoteViewControllerForSequence:completionHander:]();
            }

            objc_initWeak(&location, self);
            if (v8)
            {
              id v46 = objc_loadWeakRetained(&location);
              v8[2](v8, v46, v14);
            }
            objc_destroyWeak(&location);
            goto LABEL_64;
          }
        }
        else
        {
          v64 = [MEMORY[0x263F08690] currentHandler];
          [v64 handleFailureInMethod:a2, self, @"WGWidgetHostingViewController.m", 849, @"Invalid parameter not satisfying: %@", @"endTransitionBlock || error" object file lineNumber description];
        }
        [(WGWidgetHostingViewController *)self _setRemoteViewControllerConnectionHandler:0];
        if (v71) {
          v71[2]();
        }
        goto LABEL_64;
      }
      uint64_t v19 = [(WGWidgetInfo *)self->_widgetInfo extension];
      __int16 v47 = (id)WGLogWidgets;
      BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
      if (!v19)
      {
        if (v48)
        {
          id v59 = [(WGWidgetHostingViewController *)self widgetIdentifier];
          id v60 = [(WGWidgetHostingViewController *)self _containerIdentifier];
          v61 = [(WGWidgetHostingViewController *)self widgetIdentifier];
          *(_DWORD *)buf = 138544130;
          id v103 = v59;
          __int16 v104 = 2050;
          v105 = self;
          __int16 v106 = 2114;
          id v107 = v60;
          __int16 v108 = 2114;
          v109 = v61;
          _os_log_impl(&dword_222E49000, v47, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> No extension found for identifier (%{public}@)",
            buf,
            0x2Au);
        }
        objc_initWeak((id *)buf, self);
        if (v8)
        {
          id WeakRetained = objc_loadWeakRetained((id *)buf);
          v8[2](v8, WeakRetained, v14);
        }
        objc_destroyWeak((id *)buf);
        goto LABEL_64;
      }
      if (v48)
      {
        id v69 = [(WGWidgetHostingViewController *)self widgetIdentifier];
        id v49 = [(WGWidgetHostingViewController *)self _containerIdentifier];
        uint64_t v50 = objc_msgSend((id)v19, "wg_description");
        *(_DWORD *)buf = 138544130;
        id v103 = v69;
        __int16 v104 = 2050;
        v105 = self;
        __int16 v106 = 2114;
        id v107 = v49;
        __int16 v108 = 2114;
        v109 = v50;
        _os_log_impl(&dword_222E49000, v47, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Will request remote view controller from extension %{public}@",
          buf,
          0x2Au);
      }
      SuspendQueueIfNecessary(self->_proxyRequestQueue);
      v83[0] = MEMORY[0x263EF8330];
      v83[1] = 3221225472;
      v83[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_147;
      v83[3] = &unk_2646776F0;
      __int16 v51 = v8;
      v84 = v51;
      uint64_t v52 = MEMORY[0x223CAA850](v83);
      __int16 v53 = (void *)v94[5];
      v94[5] = v52;

      id v82 = 0;
      uint64_t v54 = [v14 beginTransitionToState:2 error:&v82];
      unint64_t v55 = (unint64_t)v82;
      v56 = *(void **)(*(void *)&v99[8] + 40);
      *(void *)(*(void *)&v99[8] + 40) = v54;

      if (*(void *)(*(void *)&v99[8] + 40) | v55)
      {
        if (v55)
        {
          __int16 v57 = (id)WGLogWidgets;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            WGStringFromWidgetLifeCycleSequenceState(2uLL);
            objc_claimAutoreleasedReturnValue();
            -[WGWidgetHostingViewController _requestRemoteViewControllerForSequence:completionHander:]();
          }

          objc_initWeak(&location, self);
          if (v51)
          {
            id v58 = objc_loadWeakRetained(&location);
            v51[2](v51, v58, v14);
          }
          objc_destroyWeak(&location);
          goto LABEL_63;
        }
      }
      else
      {
        v65 = [MEMORY[0x263F08690] currentHandler];
        [v65 handleFailureInMethod:a2, self, @"WGWidgetHostingViewController.m", 871, @"Invalid parameter not satisfying: %@", @"endTransitionBlock || error" object file lineNumber description];
      }
      dispatch_semaphore_t v66 = dispatch_semaphore_create(0);
      v75[0] = MEMORY[0x263EF8330];
      v75[1] = 3221225472;
      v75[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_148;
      v75[3] = &unk_2646777B8;
      v79 = v71;
      id v76 = (id)v19;
      v67 = v66;
      v80 = &v93;
      SEL v81 = a2;
      v77 = v67;
      v78 = self;
      [(WGWidgetHostingViewController *)self _enqueueRequest:v75 inQueue:self->_proxyConnectionQueue trampolinedToMainQueue:1 withDescription:@"Requesting remote view controller"];
      v73[0] = MEMORY[0x263EF8330];
      v73[1] = 3221225472;
      v73[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_177;
      v73[3] = &unk_2646777E0;
      v68 = v67;
      v74 = v68;
      [(WGWidgetHostingViewController *)self _enqueueRequest:v73 inQueue:self->_proxyConnectionQueue trampolinedToMainQueue:0 withDescription:@"Blocking proxy connetion queue on connection semaphore"];

LABEL_63:
      goto LABEL_64;
    }
    if (v11)
    {
      id v28 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = v28;
        id v30 = [(WGWidgetHostingViewController *)self widgetIdentifier];
        id v31 = [(WGWidgetHostingViewController *)self _containerIdentifier];
        *(_DWORD *)v99 = 138543874;
        *(void *)&v99[4] = v30;
        *(_WORD *)&v99[12] = 2050;
        *(void *)&v99[14] = self;
        *(_WORD *)&v99[22] = 2114;
        v100 = v31;
        _os_log_impl(&dword_222E49000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller that is blacklisted",
          v99,
          0x20u);
      }
    }
    else if (v12)
    {
      id v38 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v39 = v38;
        BOOL v40 = [(WGWidgetHostingViewController *)self widgetIdentifier];
        id v41 = [(WGWidgetHostingViewController *)self _containerIdentifier];
        *(_DWORD *)v99 = 138543874;
        *(void *)&v99[4] = v40;
        *(_WORD *)&v99[12] = 2050;
        *(void *)&v99[14] = self;
        *(_WORD *)&v99[22] = 2114;
        v100 = v41;
        _os_log_impl(&dword_222E49000, v39, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller that is locked out",
          v99,
          0x20u);
      }
    }
    objc_initWeak((id *)v99, self);
    if (v8)
    {
      id v42 = objc_loadWeakRetained((id *)v99);
      v8[2](v8, v42, v7);
    }
  }
  else
  {
    if (v9)
    {
      if ((v10 & 1) == 0)
      {
        __int16 v23 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = v23;
          uint64_t v25 = [(WGWidgetHostingViewController *)self widgetIdentifier];
          uint64_t v26 = [(WGWidgetHostingViewController *)self _containerIdentifier];
          __int16 v27 = WGStringFromWidgetLifeCycleSequenceState(1uLL);
          *(_DWORD *)v99 = 138544386;
          *(void *)&v99[4] = v25;
          *(_WORD *)&v99[12] = 2050;
          *(void *)&v99[14] = self;
          *(_WORD *)&v99[22] = 2114;
          v100 = v26;
          *(_WORD *)v101 = 2114;
          *(void *)&v101[2] = v7;
          *(_WORD *)&v101[10] = 2114;
          *(void *)&v101[12] = v27;
          _os_log_impl(&dword_222E49000, v24, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller as argument sequence (%"
            "{public}@) isn't in expected state (%{public}@)",
            v99,
            0x34u);
        }
      }
    }
    else
    {
      objc_super v32 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v33 = v32;
        id v34 = [(WGWidgetHostingViewController *)self widgetIdentifier];
        __int16 v35 = [(WGWidgetHostingViewController *)self _containerIdentifier];
        id v36 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
        *(_DWORD *)v99 = 138544386;
        *(void *)&v99[4] = v34;
        *(_WORD *)&v99[12] = 2050;
        *(void *)&v99[14] = self;
        *(_WORD *)&v99[22] = 2114;
        v100 = v35;
        *(_WORD *)v101 = 2114;
        *(void *)&v101[2] = v7;
        *(_WORD *)&v101[10] = 2114;
        *(void *)&v101[12] = v36;
        _os_log_impl(&dword_222E49000, v33, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller as argument sequence (%{p"
          "ublic}@) doesn't match active sequence (%{public}@)",
          v99,
          0x34u);
      }
    }
    objc_initWeak((id *)v99, self);
    if (v8)
    {
      id v37 = objc_loadWeakRetained((id *)v99);
      v8[2](v8, v37, v7);
    }
  }
  objc_destroyWeak((id *)v99);
LABEL_65:
}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = v8;
    int v10 = [v5 widgetIdentifier];
    BOOL v11 = [v5 _containerIdentifier];
    BOOL v12 = *(void **)(a1 + 32);
    int v27 = 138544130;
    id v28 = v10;
    __int16 v29 = 2050;
    id v30 = v5;
    __int16 v31 = 2114;
    objc_super v32 = v11;
    __int16 v33 = 2114;
    id v34 = v12;
    _os_log_impl(&dword_222E49000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Handling connection for sequence '%{public}@'",
      (uint8_t *)&v27,
      0x2Au);
  }
  if (!v6)
  {
    int v13 = [v5 _isActiveSequence:*(void *)(a1 + 32)];
    int v14 = [*(id *)(a1 + 32) isCurrentStateAtLeast:1];
    if (v13 && v14)
    {
      id v15 = (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
      if (!v15) {
        goto LABEL_19;
      }
      id v16 = (void *)WGLogWidgets;
      if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      id v17 = v16;
      uint64_t v18 = [v5 widgetIdentifier];
      uint64_t v19 = [v5 _containerIdentifier];
      id v20 = WGStringFromWidgetLifeCycleSequenceState(*(void *)(a1 + 64));
      int v27 = 138544386;
      id v28 = v18;
      __int16 v29 = 2050;
      id v30 = v5;
      __int16 v31 = 2114;
      objc_super v32 = v19;
      __int16 v33 = 2114;
      id v34 = v20;
      __int16 v35 = 2114;
      id v36 = v15;
      _os_log_impl(&dword_222E49000, v17, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered error transitioning to target state '%{public}@': %{public}@",
        (uint8_t *)&v27,
        0x34u);
    }
    else
    {
      if (v13)
      {
        if ((v14 & 1) != 0
          || (CGSize v21 = (void *)WGLogWidgets, !os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)))
        {
LABEL_20:
          uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          if (v26) {
            (*(void (**)(uint64_t, id, void))(v26 + 16))(v26, v5, *(void *)(a1 + 32));
          }
          goto LABEL_22;
        }
        id v15 = v21;
        id v17 = [v5 widgetIdentifier];
        uint64_t v18 = [v5 _containerIdentifier];
        id v22 = *(void **)(a1 + 32);
        uint64_t v19 = WGStringFromWidgetLifeCycleSequenceState(1uLL);
        int v27 = 138544386;
        id v28 = v17;
        __int16 v29 = 2050;
        id v30 = v5;
        __int16 v31 = 2114;
        objc_super v32 = v18;
        __int16 v33 = 2114;
        id v34 = v22;
        __int16 v35 = 2114;
        id v36 = v19;
        __int16 v23 = "<%{public}@: %{public}p; container: %{public}@> Argument sequence (%{public}@) isn't in expected state (%{public}@)";
      }
      else
      {
        id v24 = (void *)WGLogWidgets;
        if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        id v15 = v24;
        id v17 = [v5 widgetIdentifier];
        uint64_t v18 = [v5 _containerIdentifier];
        uint64_t v25 = *(void **)(a1 + 32);
        uint64_t v19 = [v5 _activeLifeCycleSequence];
        int v27 = 138544386;
        id v28 = v17;
        __int16 v29 = 2050;
        id v30 = v5;
        __int16 v31 = 2114;
        objc_super v32 = v18;
        __int16 v33 = 2114;
        id v34 = v25;
        __int16 v35 = 2114;
        id v36 = v19;
        __int16 v23 = "<%{public}@: %{public}p; container: %{public}@> Argument sequence (%{public}@) doesn't match active sequence (%{public}@)";
      }
      _os_log_impl(&dword_222E49000, v15, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v27, 0x34u);
    }

LABEL_19:
    goto LABEL_20;
  }
LABEL_22:
}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v8 _proxyRequestQueue];
  ResumeQueueIfNecessary(v6);

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_148(uint64_t a1, void *a2, void *a3, int a4)
{
  v77[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  int v9 = [v7 _isActiveSequence:v8];
  int v10 = [v8 isCurrentState:1];
  if (a4 && v9 && v10)
  {
    BOOL v11 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = v11;
      int v13 = [v7 widgetIdentifier];
      int v14 = [v7 _containerIdentifier];
      *(_DWORD *)buf = 138543874;
      v68 = v13;
      __int16 v69 = 2050;
      id v70 = v7;
      __int16 v71 = 2114;
      id v72 = v14;
      _os_log_impl(&dword_222E49000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Establishing remote view controller connection...",
        buf,
        0x20u);
    }
    [v7 _setRemoteViewControllerConnectionHandler:*(void *)(a1 + 56)];
    [v7 _setConnectionState:1];
    id v15 = objc_alloc_init(MEMORY[0x263F08810]);
    id v16 = [MEMORY[0x263EFF9A0] dictionary];
    id v17 = [v7 widgetIdentifier];
    if (!v17)
    {
      uint64_t v18 = WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
        __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_148_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    if ([v17 length]) {
      [v16 setObject:v17 forKey:*MEMORY[0x263F146B0]];
    }
    uint64_t v26 = [v7 _containerIdentifier];
    if (![v26 length])
    {
      int v27 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = v27;
        __int16 v29 = [v7 widgetIdentifier];
        id v30 = [v7 _containerIdentifier];
        *(_DWORD *)buf = 138543874;
        v68 = v29;
        __int16 v69 = 2050;
        id v70 = v7;
        __int16 v71 = 2114;
        id v72 = v30;
        _os_log_impl(&dword_222E49000, v28, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> No container identifier",
          buf,
          0x20u);
      }
    }
    if ([v26 length]) {
      [v16 setObject:v26 forKey:*MEMORY[0x263F14668]];
    }
    __int16 v31 = [v7 widgetInfo];
    char v32 = [v31 isLinkedOnOrAfterSystemVersion:@"10.0"];

    if ((v32 & 1) == 0)
    {
      [v7 _marginInsets];
      __int16 v33 = NSStringFromUIEdgeInsets(v80);
      [v16 setObject:v33 forKey:*MEMORY[0x263F14670]];
    }
    [v7 _maxSizeForDisplayMode:0];
    id v34 = NSStringFromCGSize(v78);
    [v16 setObject:v34 forKey:*MEMORY[0x263F14690]];

    [v7 _maxSizeForDisplayMode:1];
    __int16 v35 = NSStringFromCGSize(v79);
    [v16 setObject:v35 forKey:*MEMORY[0x263F14698]];

    id v36 = [v7 view];
    [v36 bounds];
    uint64_t v37 = NSStringFromCGRect(v81);
    [v16 setObject:v37 forKey:*MEMORY[0x263F14680]];

    id v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "userSpecifiedDisplayMode"));
    [v16 setObject:v38 forKey:*MEMORY[0x263F14678]];

    BOOL v39 = [v7 _appearState] != 0;
    BOOL v40 = [NSNumber numberWithInteger:v39];
    [v16 setObject:v40 forKey:*MEMORY[0x263F146A0]];

    [v7 _layoutMargins];
    id v41 = NSStringFromUIEdgeInsets(v82);
    [v16 setObject:v41 forKey:*MEMORY[0x263F14688]];

    id v42 = [NSNumber numberWithBool:__WGWidgetSnapshotDebugLabelsEnabled];
    [v16 setObject:v42 forKey:*MEMORY[0x263F146A8]];

    [v15 setUserInfo:v16];
    v77[0] = v15;
    uint64_t v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:1];
    id v44 = *(void **)(a1 + 32);
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_156;
    v61[3] = &unk_264677790;
    id v62 = v7;
    id v63 = *(id *)(a1 + 40);
    id v45 = *(id *)(a1 + 32);
    long long v66 = *(_OWORD *)(a1 + 64);
    uint64_t v46 = *(void *)(a1 + 48);
    id v64 = v45;
    uint64_t v65 = v46;
    [v44 instantiateViewControllerWithInputItems:v43 connectionHandler:v61];

    goto LABEL_34;
  }
  if (a4)
  {
    if (v9)
    {
      if (v10) {
        goto LABEL_30;
      }
      __int16 v47 = (void *)WGLogWidgets;
      if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      BOOL v48 = v47;
      id v49 = [v7 widgetIdentifier];
      uint64_t v50 = [v7 _containerIdentifier];
      __int16 v51 = WGStringFromWidgetLifeCycleSequenceState(1uLL);
      *(_DWORD *)buf = 138544386;
      v68 = v49;
      __int16 v69 = 2050;
      id v70 = v7;
      __int16 v71 = 2114;
      id v72 = v50;
      __int16 v73 = 2114;
      id v74 = v8;
      __int16 v75 = 2114;
      id v76 = v51;
      uint64_t v52 = "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller as argument sequence (%"
            "{public}@) isn't in expected state (%{public}@)";
      goto LABEL_28;
    }
    uint64_t v54 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v48 = v54;
      id v49 = [v7 widgetIdentifier];
      uint64_t v50 = [v7 _containerIdentifier];
      __int16 v51 = [v7 _activeLifeCycleSequence];
      *(_DWORD *)buf = 138544386;
      v68 = v49;
      __int16 v69 = 2050;
      id v70 = v7;
      __int16 v71 = 2114;
      id v72 = v50;
      __int16 v73 = 2114;
      id v74 = v8;
      __int16 v75 = 2114;
      id v76 = v51;
      uint64_t v52 = "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller as argument sequence (%"
            "{public}@) doesn't match active sequence (%{public}@)";
LABEL_28:
      _os_log_impl(&dword_222E49000, v48, OS_LOG_TYPE_DEFAULT, v52, buf, 0x34u);

      goto LABEL_29;
    }
  }
  else
  {
    __int16 v53 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v48 = v53;
      id v49 = [v7 widgetIdentifier];
      uint64_t v50 = [v7 _containerIdentifier];
      *(_DWORD *)buf = 138543874;
      v68 = v49;
      __int16 v69 = 2050;
      id v70 = v7;
      __int16 v71 = 2114;
      id v72 = v50;
      _os_log_impl(&dword_222E49000, v48, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller as queue is no longer valid",
        buf,
        0x20u);
LABEL_29:
    }
  }
LABEL_30:
  unint64_t v55 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v56 = v55;
    __int16 v57 = [v7 widgetIdentifier];
    id v58 = [v7 _containerIdentifier];
    id v59 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v68 = v57;
    __int16 v69 = 2050;
    id v70 = v7;
    __int16 v71 = 2114;
    id v72 = v58;
    __int16 v73 = 2114;
    id v74 = v59;
    _os_log_impl(&dword_222E49000, v56, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Signaling connection semaphore (%{public}@)",
      buf,
      0x2Au);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  uint64_t v60 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v60) {
    (*(void (**)(uint64_t, id, id))(v60 + 16))(v60, v7, v8);
  }
LABEL_34:
}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_156(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = *(void **)(a1 + 32);
    BOOL v12 = v10;
    int v13 = [v11 widgetIdentifier];
    int v14 = *(void **)(a1 + 32);
    id v15 = [v14 _containerIdentifier];
    *(_DWORD *)buf = 138543874;
    __int16 v31 = v13;
    __int16 v32 = 2050;
    __int16 v33 = v14;
    __int16 v34 = 2114;
    __int16 v35 = v15;
    _os_log_impl(&dword_222E49000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Extension called handler",
      buf,
      0x20u);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_157;
  block[3] = &unk_264677768;
  id v22 = *(id *)(a1 + 32);
  id v23 = *(id *)(a1 + 40);
  id v24 = v7;
  id v25 = v9;
  id v16 = *(id *)(a1 + 48);
  long long v29 = *(_OWORD *)(a1 + 64);
  uint64_t v17 = *(void *)(a1 + 56);
  id v26 = v16;
  uint64_t v27 = v17;
  id v28 = v8;
  id v18 = v8;
  id v19 = v9;
  id v20 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_157(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  v2 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 widgetIdentifier];
    id v6 = *(void **)(a1 + 32);
    id v7 = [v6 _containerIdentifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v52 = v5;
    __int16 v53 = 2050;
    uint64_t v54 = v6;
    __int16 v55 = 2114;
    v56 = v7;
    _os_log_impl(&dword_222E49000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Handling new connection",
      buf,
      0x20u);
  }
  id v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *(void **)(a1 + 32);
    int v10 = v8;
    BOOL v11 = [v9 widgetIdentifier];
    BOOL v12 = *(void **)(a1 + 32);
    int v13 = [v12 _containerIdentifier];
    int v14 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v52 = v11;
    __int16 v53 = 2050;
    uint64_t v54 = v12;
    __int16 v55 = 2114;
    v56 = v13;
    __int16 v57 = 2114;
    id v58 = v14;
    _os_log_impl(&dword_222E49000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Signaling connection semaphore (%{public}@)",
      buf,
      0x2Au);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  [*(id *)(a1 + 32) _setExtensionRequest:*(void *)(a1 + 48)];
  if (*(void *)(a1 + 56))
  {
    id v15 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = *(void **)(a1 + 32);
      uint64_t v17 = v15;
      id v18 = [v16 widgetIdentifier];
      id v19 = *(void **)(a1 + 32);
      id v20 = [v19 _containerIdentifier];
      uint64_t v21 = [*(id *)(a1 + 64) identifier];
      id v22 = [*(id *)(a1 + 56) localizedDescription];
      *(_DWORD *)buf = 138544386;
      uint64_t v52 = v18;
      __int16 v53 = 2050;
      uint64_t v54 = v19;
      __int16 v55 = 2114;
      v56 = v20;
      __int16 v57 = 2114;
      id v58 = v21;
      __int16 v59 = 2114;
      uint64_t v60 = v22;
      _os_log_impl(&dword_222E49000, v17, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Unable to load widget view controller with service (%{public}@): %{public}@",
        buf,
        0x34u);
    }
    id v23 = *(void **)(a1 + 32);
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_158;
    v47[3] = &unk_264677740;
    id v24 = &v48;
    id v48 = *(id *)(a1 + 64);
    id v25 = *(id *)(a1 + 56);
    uint64_t v26 = *(void *)(a1 + 88);
    id v49 = (void (**)(void, void, void))v25;
    uint64_t v50 = v26;
    uint64_t v27 = [*(id *)(a1 + 32) _proxyConnectionQueue];
    [v23 _enqueueRequest:v47 inQueue:v27 trampolinedToMainQueue:1 withDescription:@"Finishing disconnection for failed connection"];

    id v28 = v49;
  }
  else
  {
    long long v29 = [*(id *)(a1 + 32) _extensionRequest];

    if (!v29)
    {
      id v41 = [MEMORY[0x263F08690] currentHandler];
      [v41 handleFailureInMethod:*(void *)(a1 + 96) object:*(void *)(a1 + 72) file:@"WGWidgetHostingViewController.m" lineNumber:926 description:@"Extension request is nil"];
    }
    id v30 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v31 = *(void **)(a1 + 32);
      __int16 v32 = v30;
      __int16 v33 = [v31 widgetIdentifier];
      __int16 v34 = *(void **)(a1 + 32);
      __int16 v35 = [v34 _containerIdentifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v52 = v33;
      __int16 v53 = 2050;
      uint64_t v54 = v34;
      __int16 v55 = 2114;
      v56 = v35;
      _os_log_impl(&dword_222E49000, v32, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Established remote view controller connection",
        buf,
        0x20u);
    }
    [*(id *)(a1 + 32) _setConnectionState:0];
    [*(id *)(a1 + 32) _setRemoteViewController:*(void *)(a1 + 80)];
    uint64_t v36 = [*(id *)(a1 + 32) _remoteViewController];
    [v36 setInheritsSecurity:1];

    uint64_t v37 = [*(id *)(a1 + 32) _remoteViewController];
    [v37 _setValid:1];

    id v38 = [*(id *)(a1 + 32) _remoteViewController];
    [v38 setManagingHost:*(void *)(a1 + 32)];

    BOOL v39 = [*(id *)(a1 + 32) _remoteViewController];
    [v39 setServiceViewShouldShareTouchesWithHost:1];

    BOOL v40 = [*(id *)(a1 + 32) _remoteViewController];
    [v40 _setShouldUpdateRemoteTextEffectsWindow:0];

    uint64_t v42 = MEMORY[0x263EF8330];
    uint64_t v43 = 3221225472;
    id v44 = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_170;
    id v45 = &unk_264676588;
    id v24 = &v46;
    id v46 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], &v42);
    objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerConnectionHandler", v42, v43, v44, v45);
    id v28 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) _setRemoteViewControllerConnectionHandler:0];
    if (v28) {
      v28[2](v28, *(void *)(a1 + 32), *(void *)(a1 + 56));
    }
  }
}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  v18[2] = *MEMORY[0x263EF8340];
  id v5 = NSString;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 identifier];
  int v10 = [*(id *)(a1 + 40) localizedDescription];
  BOOL v11 = [v5 stringWithFormat:@"Unable to load widget view controller with service (%@): %@", v9, v10];

  BOOL v12 = (void *)MEMORY[0x263F087E8];
  uint64_t v13 = *MEMORY[0x263F08608];
  v17[0] = *MEMORY[0x263F08320];
  v17[1] = v13;
  uint64_t v14 = *(void *)(a1 + 40);
  v18[0] = v11;
  v18[1] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v16 = [v12 errorWithDomain:@"WGWidgetHostingViewControllerErrorDomain" code:0 userInfo:v15];

  [v8 _finishDisconnectingRemoteViewControllerForSequence:v7 error:v16 completion:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_170(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 remoteViewControllerDidConnectForWidget:*(void *)(a1 + 32)];
  }
}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_177(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [v5 widgetIdentifier];
    int v10 = [v5 _containerIdentifier];
    uint64_t v11 = *(void *)(a1 + 32);
    int v17 = 138544130;
    id v18 = v9;
    __int16 v19 = 2050;
    id v20 = v5;
    __int16 v21 = 2114;
    id v22 = v10;
    __int16 v23 = 2114;
    uint64_t v24 = v11;
    _os_log_impl(&dword_222E49000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Waiting on connection semaphore (%{public}@)",
      (uint8_t *)&v17,
      0x2Au);
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  BOOL v12 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    uint64_t v14 = [v5 widgetIdentifier];
    id v15 = [v5 _containerIdentifier];
    uint64_t v16 = *(void *)(a1 + 32);
    int v17 = 138544130;
    id v18 = v14;
    __int16 v19 = 2050;
    id v20 = v5;
    __int16 v21 = 2114;
    id v22 = v15;
    __int16 v23 = 2114;
    uint64_t v24 = v16;
    _os_log_impl(&dword_222E49000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> No longer waiting on connection semaphore (%{public}@)",
      (uint8_t *)&v17,
      0x2Au);
  }
}

- (void)_setImplementsPerformUpdate:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_implementsPerformUpdate != a3)
  {
    self->_BOOL implementsPerformUpdate = a3;
    id v4 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      uint64_t v7 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      id v8 = (void *)v7;
      BOOL implementsPerformUpdate = self->_implementsPerformUpdate;
      int v11 = 138544130;
      BOOL v12 = v6;
      __int16 v13 = 2050;
      if (implementsPerformUpdate) {
        int v10 = @"does";
      }
      else {
        int v10 = @"does not";
      }
      uint64_t v14 = self;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl(&dword_222E49000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Recording that widget %{public}@ implement 'performUpdate...'",
        (uint8_t *)&v11,
        0x2Au);
    }
  }
}

- (void)_performUpdateForSequence:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([(WGWidgetHostingViewController *)self implementsPerformUpdate])
  {
    BOOL v6 = [(WGWidgetHostingViewController *)self _didUpdate];
    BOOL v7 = 1;
    if (v5)
    {
      if (!v6)
      {
        id v8 = [(WGWidgetHostingViewController *)self _remoteViewController];
        int v9 = [v8 _isValid];

        if (v9)
        {
          [(WGWidgetHostingViewController *)self _setDidUpdate:1];
          int v10 = (void *)WGLogWidgets;
          if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = v10;
            BOOL v12 = [(WGWidgetHostingViewController *)self widgetIdentifier];
            __int16 v13 = [(WGWidgetHostingViewController *)self _containerIdentifier];
            *(_DWORD *)buf = 138543874;
            __int16 v31 = v12;
            __int16 v32 = 2050;
            __int16 v33 = self;
            __int16 v34 = 2114;
            __int16 v35 = v13;
            _os_log_impl(&dword_222E49000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Performing update",
              buf,
              0x20u);
          }
          objc_initWeak((id *)buf, self);
          uint64_t v14 = dispatch_get_global_queue(25, 0);
          BOOL v7 = v14 == 0;
          if (v14)
          {
            dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
            v26[0] = MEMORY[0x263EF8330];
            v26[1] = 3221225472;
            v26[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke;
            v26[3] = &unk_264677830;
            objc_copyWeak(&v29, (id *)buf);
            uint64_t v16 = v15;
            uint64_t v27 = v16;
            id v17 = v5;
            id v28 = v17;
            id v18 = (void *)MEMORY[0x223CAA850](v26);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_2;
            block[3] = &unk_264677880;
            objc_copyWeak(&v25, (id *)buf);
            id v22 = v16;
            id v23 = v18;
            id v24 = v17;
            uint64_t v19 = v16;
            id v20 = v18;
            dispatch_async(v14, block);

            objc_destroyWeak(&v25);
            objc_destroyWeak(&v29);
          }

          objc_destroyWeak((id *)buf);
        }
      }
    }
  }
  else
  {
    BOOL v7 = 1;
  }
  if (v5 && v7) {
    (*((void (**)(id, uint64_t, BOOL))v5 + 2))(v5, 2, [(WGWidgetHostingViewController *)self implementsPerformUpdate]);
  }
}

void __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  intptr_t v7 = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  id v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    int v10 = [WeakRetained widgetIdentifier];
    uint64_t v11 = [WeakRetained _containerIdentifier];
    BOOL v12 = (void *)v11;
    __int16 v13 = @"did wake";
    *(_DWORD *)buf = 138544130;
    __int16 v19 = 2050;
    id v18 = v10;
    if (!v7) {
      __int16 v13 = @"didn't wake";
    }
    id v20 = WeakRetained;
    __int16 v21 = 2114;
    uint64_t v22 = v11;
    __int16 v23 = 2114;
    id v24 = v13;
    _os_log_impl(&dword_222E49000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Signaled update semaphore - %{public}@",
      buf,
      0x2Au);
  }
  if (v7)
  {
    [WeakRetained _setImplementsPerformUpdate:a3];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_193;
    block[3] = &unk_264677808;
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = a2;
    void block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_193(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) implementsPerformUpdate];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v1, v3);
}

void __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_3;
  block[3] = &unk_264676AA8;
  uint64_t v2 = (id *)(a1 + 56);
  objc_copyWeak(&v11, (id *)(a1 + 56));
  id v10 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v3 = *(NSObject **)(a1 + 32);
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    _OWORD v6[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_6;
    v6[3] = &unk_264676AA8;
    objc_copyWeak(&v8, v2);
    id v7 = *(id *)(a1 + 48);
    id v5 = (void *)MEMORY[0x263EF83A0];
    dispatch_async(MEMORY[0x263EF83A0], v6);

    objc_destroyWeak(&v8);
  }

  objc_destroyWeak(&v11);
}

void __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_4;
  v3[3] = &unk_264677650;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained _enqueueRemoteServiceRequest:v3 withDescription:@"Performing update"];
}

void __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    id v5 = [a2 _remoteViewController];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_5;
    v9[3] = &unk_264677858;
    id v10 = *(id *)(a1 + 32);
    [v5 _performUpdateWithReplyHandler:v9];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [a2 implementsPerformUpdate];
    id v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    v8(v6, 2, v7);
  }
}

uint64_t __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = [WeakRetained widgetIdentifier];
    uint64_t v6 = [WeakRetained _containerIdentifier];
    uint64_t v7 = (void *)MEMORY[0x223CAA850](*(void *)(a1 + 32));
    int v8 = 138544130;
    int v9 = v5;
    __int16 v10 = 2050;
    id v11 = WeakRetained;
    __int16 v12 = 2114;
    __int16 v13 = v6;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_222E49000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Update semaphore timed out - calling completion (%{public}@)",
      (uint8_t *)&v8,
      0x2Au);
  }
  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 2, [WeakRetained implementsPerformUpdate]);
}

- (void)_updateWidgetWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(WGWidgetHostingViewController *)self _setIgnoringParentAppearState:1];
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke;
  v21[3] = &unk_2646778A8;
  objc_copyWeak(&v23, &location);
  id v5 = v4;
  id v22 = v5;
  uint64_t v6 = (void (**)(void, void, void))MEMORY[0x223CAA850](v21);
  BOOL v7 = [(WGWidgetHostingViewController *)self implementsPerformUpdate];
  if (v7
    && ([(WGWidgetHostingViewController *)self _remoteViewController],
        int v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 _isValid],
        v8,
        (v9 & 1) == 0))
  {
    __int16 v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    dispatch_group_enter(v10);
    id v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_2;
    void v18[3] = &unk_2646778D0;
    __int16 v19 = v11;
    id v20 = v10;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_5;
    v14[3] = &unk_2646776A0;
    __int16 v12 = v19;
    id v15 = v12;
    __int16 v13 = v20;
    uint64_t v16 = v13;
    id v17 = v6;
    [(WGWidgetHostingViewController *)self _beginSequenceWithReason:@"requested update" completion:v18 updateHandler:v14];
  }
  else
  {
    v6[2](v6, 2, v7);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

uint64_t __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setIgnoringParentAppearState:0];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_3;
  block[3] = &unk_264676798;
  id v11 = v5;
  id v12 = v6;
  BOOL v7 = *(NSObject **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  dispatch_group_notify(v7, MEMORY[0x263EF83A0], block);
}

void __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "wg_isAppearingOrAppeared"))
  {
    uint64_t v2 = *(NSObject **)(a1 + 48);
    dispatch_group_leave(v2);
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_4;
    v5[3] = &unk_2646775B0;
    id v6 = *(id *)(a1 + 48);
    [v3 _endSequence:v4 withReason:@"requested update" completion:v5];
  }
}

void __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_4(uint64_t a1)
{
}

void __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2, char a3)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_6;
  block[3] = &unk_2646778F8;
  id v6 = *(NSObject **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = a2;
  char v10 = a3;
  dispatch_group_notify(v6, MEMORY[0x263EF83A0], block);
}

uint64_t __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (BOOL)_shouldRemoveSnapshotWhenNotVisible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained shouldRemoveSnapshotWhenNotVisibleForWidget:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)_captureSnapshotAndBeginDisappearanceTransitionForSequence:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (void (**)(id, id, id))a4;
  if (![(WGWidgetHostingViewController *)self _isActiveSequence:v6])
  {
    id v11 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      id v13 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      __int16 v14 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      id v15 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
      *(_DWORD *)id location = 138544386;
      *(void *)&location[4] = v13;
      __int16 v32 = 2050;
      __int16 v33 = self;
      __int16 v34 = 2114;
      __int16 v35 = v14;
      __int16 v36 = 2114;
      id v37 = v6;
      __int16 v38 = 2114;
      BOOL v39 = v15;
      _os_log_impl(&dword_222E49000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't begin disappearance transition as argument sequence (%{pub"
        "lic}@) doesn't match active sequence (%{public}@)",
        location,
        0x34u);
    }
    objc_initWeak((id *)location, self);
    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)location);
      v7[2](v7, WeakRetained, v6);
    }
    goto LABEL_13;
  }
  if (![(id)objc_opt_class() _canWidgetHostCaptureSnapshotForSequence:v6])
  {
    id v17 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      __int16 v19 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      id v20 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      *(_DWORD *)id location = 138544130;
      *(void *)&location[4] = v19;
      __int16 v32 = 2050;
      __int16 v33 = self;
      __int16 v34 = 2114;
      __int16 v35 = v20;
      __int16 v36 = 2114;
      id v37 = v6;
      _os_log_impl(&dword_222E49000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Sequence already at satisfactory state: %{public}@",
        location,
        0x2Au);
    }
    objc_initWeak((id *)location, self);
    if (v7)
    {
      id v21 = objc_loadWeakRetained((id *)location);
      v7[2](v7, v21, v6);
    }
LABEL_13:
    objc_destroyWeak((id *)location);
    goto LABEL_21;
  }
  id v8 = [v6 transitionToState:5];
  if (v8)
  {
    uint64_t v9 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
      -[WGWidgetHostingViewController _captureSnapshotAndBeginDisappearanceTransitionForSequence:completionHandler:](v9);
    }
    objc_initWeak((id *)location, self);
    if (v7)
    {
      id v10 = objc_loadWeakRetained((id *)location);
      v7[2](v7, v10, v6);
    }
    objc_destroyWeak((id *)location);
  }
  else
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke;
    v29[3] = &unk_264677650;
    id v22 = v7;
    id v30 = v22;
    id v23 = (void *)MEMORY[0x223CAA850](v29);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_5;
    v25[3] = &unk_2646779C0;
    uint64_t v28 = 5;
    id v26 = v23;
    uint64_t v27 = v22;
    id v24 = v23;
    [(WGWidgetHostingViewController *)self _enqueueRemoteServiceRequest:v25 withDescription:@"Requesting snapshot"];
  }
LABEL_21:
}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = [v7 widgetIdentifier];
    id v12 = [v7 _containerIdentifier];
    id v13 = [v7 _viewWillDisappearSemaphore];
    *(_DWORD *)buf = 138544130;
    id v20 = v11;
    __int16 v21 = 2050;
    id v22 = v7;
    __int16 v23 = 2114;
    id v24 = v12;
    __int16 v25 = 2114;
    id v26 = v13;
    _os_log_impl(&dword_222E49000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Releasing '_viewWillDisappearSemaphore' (%{public}@)",
      buf,
      0x2Au);
  }
  [v7 _setViewWillDisappearSemaphore:0];
  if (a4)
  {
    [v7 _removeAllSnapshotFilesForActiveDisplayMode];
    __int16 v14 = [v7 _diskWriteQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_202;
    v16[3] = &unk_2646770E8;
    id v17 = v7;
    id v18 = *(id *)(a1 + 32);
    dispatch_async(v14, v16);
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v7, v8);
    }
  }
}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_202(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_2;
  v3[3] = &unk_264677970;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  [v4 _captureLayerTree:v3];
}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_3;
  v11[3] = &unk_264677948;
  id v12 = v6;
  id v13 = v7;
  id v8 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v9 = v7;
  id v10 = v6;
  [v8 _enqueueRemoteServiceRequest:v11 withDescription:@"Snapshot completion"];
}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4 && (uint64_t v9 = *(void *)(a1 + 32)) != 0 && !*(void *)(a1 + 40))
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_4;
    v11[3] = &unk_264677920;
    id v12 = v7;
    id v14 = *(id *)(a1 + 48);
    id v13 = v8;
    [v12 _packageViewFromURL:v9 reply:v11];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v7, v8);
    }
  }
}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7 && !v5) {
    [*(id *)(a1 + 32) _setSnapshotView:v7];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (!a4
    || ([v7 _viewWillDisappearSemaphore],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
LABEL_3:
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v7, v8);
    }
    goto LABEL_5;
  }
  int v11 = [v7 _isActiveSequence:v8];
  int v12 = [v8 isCurrentState:*(void *)(a1 + 48)];
  if (!v11 || !v12)
  {
    if (v11)
    {
      if (v12) {
        goto LABEL_3;
      }
      uint64_t v15 = (void *)WGLogWidgets;
      if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_3;
      }
      uint64_t v16 = v15;
      id v17 = [v7 widgetIdentifier];
      id v18 = [v7 _containerIdentifier];
      __int16 v19 = WGStringFromWidgetLifeCycleSequenceState(*(void *)(a1 + 48));
      *(_DWORD *)buf = 138544386;
      __int16 v33 = v17;
      __int16 v34 = 2050;
      id v35 = v7;
      __int16 v36 = 2114;
      id v37 = v18;
      __int16 v38 = 2114;
      id v39 = v8;
      __int16 v40 = 2114;
      id v41 = v19;
      id v20 = "<%{public}@: %{public}p; container: %{public}@> Can't continue disappearance transition as argument sequence"
            " (%{public}@) isn't in expected state (%{public}@)";
    }
    else
    {
      __int16 v21 = (void *)WGLogWidgets;
      if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_3;
      }
      uint64_t v16 = v21;
      id v17 = [v7 widgetIdentifier];
      id v18 = [v7 _containerIdentifier];
      __int16 v19 = [v7 _activeLifeCycleSequence];
      *(_DWORD *)buf = 138544386;
      __int16 v33 = v17;
      __int16 v34 = 2050;
      id v35 = v7;
      __int16 v36 = 2114;
      id v37 = v18;
      __int16 v38 = 2114;
      id v39 = v8;
      __int16 v40 = 2114;
      id v41 = v19;
      id v20 = "<%{public}@: %{public}p; container: %{public}@> Can't continue disappearance transition as argument sequence"
            " (%{public}@) doesn't match active sequence (%{public}@)";
    }
    _os_log_impl(&dword_222E49000, v16, OS_LOG_TYPE_DEFAULT, v20, buf, 0x34u);

    goto LABEL_3;
  }
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  [v7 _setViewWillDisappearSemaphore:v13];
  id v14 = dispatch_get_global_queue(25, 0);
  if (v14)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_6;
    v27[3] = &unk_264677998;
    id v28 = v7;
    id v29 = v13;
    id v31 = *(id *)(a1 + 32);
    id v30 = v8;
    dispatch_async(v14, v27);
  }
  else
  {
    id v22 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = v22;
      id v24 = [v7 widgetIdentifier];
      __int16 v25 = [v7 _containerIdentifier];
      *(_DWORD *)buf = 138543874;
      __int16 v33 = v24;
      __int16 v34 = 2050;
      id v35 = v7;
      __int16 v36 = 2114;
      id v37 = v25;
      _os_log_impl(&dword_222E49000, v23, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Failed to obtain a queue",
        buf,
        0x20u);
    }
    uint64_t v26 = *(void *)(a1 + 32);
    if (v26) {
      (*(void (**)(uint64_t, id, id, void))(v26 + 16))(v26, v7, v8, 0);
    }
  }

LABEL_5:
}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_6(id *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_7;
  block[3] = &unk_264676680;
  id v24 = a1[4];
  id v25 = a1[5];
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v2 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = v2;
    id v5 = [v3 widgetIdentifier];
    id v6 = a1[4];
    id v7 = [v6 _containerIdentifier];
    id v8 = a1[5];
    *(_DWORD *)buf = 138544130;
    uint64_t v27 = v5;
    __int16 v28 = 2050;
    id v29 = v6;
    __int16 v30 = 2114;
    id v31 = v7;
    __int16 v32 = 2114;
    id v33 = v8;
    _os_log_impl(&dword_222E49000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> About to wait on '_viewWillDisappearSemaphore' (%{public}@)",
      buf,
      0x2Au);
  }
  uint64_t v9 = a1[5];
  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    int v11 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = a1[4];
      dispatch_semaphore_t v13 = v11;
      id v14 = [v12 widgetIdentifier];
      id v15 = a1[4];
      uint64_t v16 = [v15 _containerIdentifier];
      id v17 = a1[5];
      *(_DWORD *)buf = 138544130;
      uint64_t v27 = v14;
      __int16 v28 = 2050;
      id v29 = v15;
      __int16 v30 = 2114;
      id v31 = v16;
      __int16 v32 = 2114;
      id v33 = v17;
      _os_log_impl(&dword_222E49000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> _viewWillDisappearSemaphore (%{public}@) timed out!",
        buf,
        0x2Au);
    }
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_208;
  v19[3] = &unk_264677600;
  id v20 = a1[4];
  id v22 = a1[7];
  id v21 = a1[6];
  id v18 = (void *)MEMORY[0x263EF83A0];
  dispatch_async(MEMORY[0x263EF83A0], v19);
}

uint64_t __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginRemoteViewControllerAppearanceTransitionIfNecessary:0 semaphore:*(void *)(a1 + 40) animated:0 completion:0];
}

uint64_t __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_208(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];

  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 window];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)_snapshotIdentifierForLayoutMode:(int64_t)a3
{
  [(WGWidgetHostingViewController *)self _maxSizeForDisplayMode:[(WGWidgetHostingViewController *)self activeDisplayMode]];
  double v6 = v5;
  id v7 = NSString;
  id v8 = [(WGWidgetHostingViewController *)self widgetIdentifier];
  uint64_t v9 = WGShortStringFromLayoutMode(a3);
  dispatch_time_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)v6);
  int v11 = [MEMORY[0x263EFF960] currentLocale];
  id v12 = [v11 localeIdentifier];
  dispatch_semaphore_t v13 = [(id)*MEMORY[0x263F1D020] preferredContentSizeCategory];
  id v14 = NCStringFromWidgetDisplayMode();
  id v15 = [(WGWidgetHostingViewController *)self traitCollection];
  uint64_t v16 = WGStringFromUserInterfaceStyle([v15 userInterfaceStyle]);
  id v17 = [v7 stringWithFormat:@"%@-%@-%@-%@-%@-%@-%@", v8, v9, v10, v12, v13, v14, v16];

  return v17;
}

- (id)_widgetSnapshotURLForSnapshotIdentifier:(id)a3 ensuringDirectoryExists:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [a3 stringByAppendingPathExtension:@"ca"];
  id v7 = NSURL;
  id v8 = [(WGWidgetHostingViewController *)self widgetIdentifier];
  uint64_t v9 = WGWidgetCachePathForWidgetWithBundleIdentifier((uint64_t)v8, @"Snapshots", v4);
  dispatch_time_t v10 = [v7 fileURLWithPath:v9 isDirectory:1];
  int v11 = [v10 URLByAppendingPathComponent:v6 isDirectory:1];

  return v11;
}

- (id)_widgetSnapshotURLForSnapshotIdentifier:(id)a3
{
  return [(WGWidgetHostingViewController *)self _widgetSnapshotURLForSnapshotIdentifier:a3 ensuringDirectoryExists:0];
}

- (id)_widgetSnapshotURLForLayoutMode:(int64_t)a3 ensuringDirectoryExists:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [(WGWidgetHostingViewController *)self _snapshotIdentifierForLayoutMode:a3];
  id v7 = [(WGWidgetHostingViewController *)self _widgetSnapshotURLForSnapshotIdentifier:v6 ensuringDirectoryExists:v4];

  return v7;
}

- (void)_removeItemAtURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    double v5 = [MEMORY[0x263F08850] defaultManager];
    id v16 = 0;
    int v6 = [v5 removeItemAtURL:v4 error:&v16];
    id v7 = v16;

    id v8 = (void *)WGLogWidgets;
    BOOL v9 = os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        dispatch_time_t v10 = v8;
        int v11 = [(WGWidgetHostingViewController *)self widgetIdentifier];
        id v12 = [(WGWidgetHostingViewController *)self _containerIdentifier];
        *(_DWORD *)buf = 138544130;
        id v18 = v11;
        __int16 v19 = 2050;
        id v20 = self;
        __int16 v21 = 2114;
        id v22 = v12;
        __int16 v23 = 2114;
        id v24 = v4;
        dispatch_semaphore_t v13 = "<%{public}@: %{public}p; container: %{public}@> Removed item at %{public}@";
        id v14 = v10;
        uint32_t v15 = 42;
LABEL_7:
        _os_log_impl(&dword_222E49000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
    else if (v9)
    {
      dispatch_time_t v10 = v8;
      int v11 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      id v12 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      *(_DWORD *)buf = 138544386;
      id v18 = v11;
      __int16 v19 = 2050;
      id v20 = self;
      __int16 v21 = 2114;
      id v22 = v12;
      __int16 v23 = 2114;
      id v24 = v4;
      __int16 v25 = 2114;
      id v26 = v7;
      dispatch_semaphore_t v13 = "<%{public}@: %{public}p; container: %{public}@> Failed to remove item at %{public}@: %{public}@";
      id v14 = v10;
      uint32_t v15 = 52;
      goto LABEL_7;
    }
  }
}

- (void)_removeItemAsynchronouslyAtURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    double v5 = [(WGWidgetHostingViewController *)self _diskWriteQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__WGWidgetHostingViewController__removeItemAsynchronouslyAtURL___block_invoke;
    block[3] = &unk_264676630;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __64__WGWidgetHostingViewController__removeItemAsynchronouslyAtURL___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeItemAtURL:*(void *)(a1 + 32)];
}

- (void)_removeAllSnapshotFilesMatchingPredicate:(id)a3 dueToIssue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    BOOL v9 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    uint64_t v10 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    int v11 = (void *)v10;
    id v12 = &stru_26D5C79B8;
    *(_DWORD *)buf = 138544130;
    __int16 v30 = 2050;
    id v29 = v9;
    if (v4) {
      id v12 = @" due to issue";
    }
    id v31 = self;
    __int16 v32 = 2114;
    uint64_t v33 = v10;
    __int16 v34 = 2114;
    id v35 = v12;
    _os_log_impl(&dword_222E49000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Removing snapshots matching predicate%{public}@",
      buf,
      0x2Au);
  }
  dispatch_semaphore_t v13 = NSURL;
  id v14 = [(WGWidgetHostingViewController *)self widgetIdentifier];
  uint32_t v15 = WGWidgetCachePathForWidgetWithBundleIdentifier((uint64_t)v14, @"Snapshots", 0);
  id v16 = [v13 fileURLWithPath:v15 isDirectory:1];

  id v17 = [MEMORY[0x263F08850] defaultManager];
  objc_initWeak((id *)buf, self);
  id v18 = [(WGWidgetHostingViewController *)self _diskWriteQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke;
  block[3] = &unk_2646779E8;
  objc_copyWeak(&v26, (id *)buf);
  id v23 = v17;
  id v24 = v16;
  id v25 = v6;
  BOOL v27 = v4;
  id v19 = v6;
  id v20 = v16;
  id v21 = v17;
  dispatch_async(v18, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

void __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = *(void **)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  id v39 = 0;
  id v5 = [v3 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:0 error:&v39];
  id v6 = v39;
  if (v6)
  {
    id v7 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      [WeakRetained widgetIdentifier];
      v10 = uint64_t v9 = v1;
      int v11 = [WeakRetained _containerIdentifier];
      uint64_t v12 = *(void *)(v9 + 40);
      *(_DWORD *)buf = 138544386;
      id v41 = v10;
      __int16 v42 = 2050;
      id v43 = WeakRetained;
      __int16 v44 = 2114;
      id v45 = v11;
      __int16 v46 = 2114;
      uint64_t v47 = v12;
      __int16 v48 = 2114;
      id v49 = v6;
      _os_log_impl(&dword_222E49000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered error obtaining contents of directory at URL '%{publ"
        "ic}@': %{public}@",
        buf,
        0x34u);
    }
  }
  else
  {
    if (*(void *)(v1 + 48))
    {
      uint64_t v13 = objc_msgSend(v5, "filteredArrayUsingPredicate:");

      id v5 = (id)v13;
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v5 = v5;
    uint64_t v14 = [v5 countByEnumeratingWithState:&v35 objects:v50 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v36;
      id obj = v5;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v19 = [WeakRetained _snapshotView];
          id v20 = v19;
          if (v19)
          {
            uint64_t v21 = v1;
            id v22 = [v19 snapshotIdentifier];
            id v23 = [WeakRetained _widgetSnapshotURLForSnapshotIdentifier:v22 ensuringDirectoryExists:0];
            if (v23 && [v18 isEqual:v23])
            {
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke_2;
              block[3] = &unk_264676588;
              void block[4] = WeakRetained;
              dispatch_async(MEMORY[0x263EF83A0], block);
            }

            uint64_t v1 = v21;
          }
          id v24 = [WeakRetained host];
          if (*(unsigned char *)(v1 + 64) && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v30[0] = MEMORY[0x263EF8330];
            v30[1] = 3221225472;
            v30[2] = __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke_3;
            v30[3] = &unk_264676798;
            id v31 = v24;
            id v32 = WeakRetained;
            uint64_t v33 = v18;
            dispatch_async(MEMORY[0x263EF83A0], v30);
          }
          [WeakRetained _removeItemAtURL:v18];
          if (objc_opt_respondsToSelector())
          {
            v26[0] = MEMORY[0x263EF8330];
            v26[1] = 3221225472;
            v26[2] = __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke_4;
            v26[3] = &unk_264676798;
            id v27 = v24;
            id v28 = WeakRetained;
            id v29 = v18;
            dispatch_async(MEMORY[0x263EF83A0], v26);
          }
        }
        id v5 = obj;
        uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v50 count:16];
      }
      while (v15);
    }

    id v6 = 0;
  }
}

uint64_t __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateSnapshotWithForce:1 removingSnapshotFilesForActiveDisplayMode:0 completionHandler:0];
}

uint64_t __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) widget:*(void *)(a1 + 40) didEncounterProblematicSnapshotAtURL:*(void *)(a1 + 48)];
}

uint64_t __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) widget:*(void *)(a1 + 40) didRemoveSnapshotAtURL:*(void *)(a1 + 48)];
}

- (void)_removeAllSnapshotFilesDueToIssue:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WGWidgetHostingViewController *)self widgetIdentifier];
  id v6 = (void *)MEMORY[0x263F08A98];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__WGWidgetHostingViewController__removeAllSnapshotFilesDueToIssue___block_invoke;
  v9[3] = &unk_264677A10;
  id v10 = v5;
  id v7 = v5;
  id v8 = [v6 predicateWithBlock:v9];
  [(WGWidgetHostingViewController *)self _removeAllSnapshotFilesMatchingPredicate:v8 dueToIssue:v3];
}

uint64_t __67__WGWidgetHostingViewController__removeAllSnapshotFilesDueToIssue___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 lastPathComponent];
  uint64_t v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

- (void)_removeAllSnapshotFilesForActiveDisplayMode
{
  BOOL v3 = [(WGWidgetHostingViewController *)self widgetIdentifier];
  int64_t v4 = [(WGWidgetHostingViewController *)self activeDisplayMode];
  BOOL v5 = v4 == 0;
  [(WGWidgetHostingViewController *)self _maxSizeForDisplayMode:v4];
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)v6);
  id v8 = (void *)MEMORY[0x263F08A98];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__WGWidgetHostingViewController__removeAllSnapshotFilesForActiveDisplayMode__block_invoke;
  v12[3] = &unk_264677A38;
  id v13 = v3;
  id v14 = v7;
  BOOL v15 = v5;
  id v9 = v7;
  id v10 = v3;
  int v11 = [v8 predicateWithBlock:v12];
  [(WGWidgetHostingViewController *)self _removeAllSnapshotFilesMatchingPredicate:v11 dueToIssue:0];
}

uint64_t __76__WGWidgetHostingViewController__removeAllSnapshotFilesForActiveDisplayMode__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 lastPathComponent];
  if ([v3 hasPrefix:*(void *)(a1 + 32)]
    && [v3 containsString:*(void *)(a1 + 40)])
  {
    int64_t v4 = NCStringFromWidgetDisplayMode();
    uint64_t v5 = [v3 containsString:v4] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_removeAllSnapshotFilesInActiveDisplayModeForContentSizeCategory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WGWidgetHostingViewController *)self widgetIdentifier];
  int64_t v6 = [(WGWidgetHostingViewController *)self activeDisplayMode];
  id v7 = (void *)MEMORY[0x263F08A98];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __98__WGWidgetHostingViewController__removeAllSnapshotFilesInActiveDisplayModeForContentSizeCategory___block_invoke;
  v11[3] = &unk_264677A38;
  id v13 = v4;
  int64_t v14 = v6;
  id v12 = v5;
  id v8 = v4;
  id v9 = v5;
  id v10 = [v7 predicateWithBlock:v11];
  [(WGWidgetHostingViewController *)self _removeAllSnapshotFilesMatchingPredicate:v10 dueToIssue:0];
}

uint64_t __98__WGWidgetHostingViewController__removeAllSnapshotFilesInActiveDisplayModeForContentSizeCategory___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 lastPathComponent];
  if ([v3 hasPrefix:*(void *)(a1 + 32)])
  {
    id v4 = NCStringFromWidgetDisplayMode();
    if ([v3 containsString:v4]) {
      uint64_t v5 = [v3 containsString:*(void *)(a1 + 40)];
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_removeAllSnapshotFilesInActiveDisplayModeForAllButActiveUserInterfaceStyle
{
  BOOL v3 = [(WGWidgetHostingViewController *)self widgetIdentifier];
  int64_t v4 = [(WGWidgetHostingViewController *)self activeDisplayMode];
  uint64_t v5 = [(WGWidgetHostingViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  id v7 = (void *)MEMORY[0x263F08A98];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __108__WGWidgetHostingViewController__removeAllSnapshotFilesInActiveDisplayModeForAllButActiveUserInterfaceStyle__block_invoke;
  v10[3] = &unk_264677A60;
  id v11 = v3;
  int64_t v12 = v4;
  uint64_t v13 = v6;
  id v8 = v3;
  id v9 = [v7 predicateWithBlock:v10];
  [(WGWidgetHostingViewController *)self _removeAllSnapshotFilesMatchingPredicate:v9 dueToIssue:0];
}

uint64_t __108__WGWidgetHostingViewController__removeAllSnapshotFilesInActiveDisplayModeForAllButActiveUserInterfaceStyle__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 lastPathComponent];
  if ([v3 hasPrefix:*(void *)(a1 + 32)])
  {
    int64_t v4 = NCStringFromWidgetDisplayMode();
    if ([v3 containsString:v4])
    {
      uint64_t v5 = WGStringFromUserInterfaceStyle(*(void *)(a1 + 48));
      uint64_t v6 = [v3 containsString:v5] ^ 1;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_setSnapshotView:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = (_WGCAPackageView *)a3;
  p_snapshotView = &self->_snapshotView;
  if (self->_snapshotView != v5)
  {
    objc_storeStrong((id *)&self->_snapshotView, a3);
    p_snapshotViewBounds = &self->_snapshotViewBounds;
    if (*p_snapshotView)
    {
      [(_WGCAPackageView *)*p_snapshotView bounds];
      p_snapshotViewBounds->origin.x = v8;
      self->_snapshotViewBounds.origin.y = v9;
      self->_snapshotViewBounds.size.double width = v10;
      self->_snapshotViewBounds.size.double height = v11;
    }
    else
    {
      CGSize v12 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
      p_snapshotViewBounds->origin = (CGPoint)*MEMORY[0x263F001A8];
      self->_snapshotViewBounds.size = v12;
    }
    uint64_t v13 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v14 = v13;
      BOOL v15 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      uint64_t v16 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      id v17 = *p_snapshotView;
      int v18 = 138544130;
      id v19 = v15;
      __int16 v20 = 2050;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = v16;
      __int16 v24 = 2114;
      id v25 = v17;
      _os_log_impl(&dword_222E49000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Set snapshot view: %{public}@",
        (uint8_t *)&v18,
        0x2Au);
    }
  }
}

- (void)_invalidateSnapshotWithForce:(BOOL)a3 removingSnapshotFilesForActiveDisplayMode:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  CGFloat v9 = v8;
  snapshotView = self->_snapshotView;
  if (!a3 && snapshotView && snapshotView == (_WGCAPackageView *)self->_contentProvidingView)
  {
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
  else
  {
    CGFloat v11 = snapshotView;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __122__WGWidgetHostingViewController__invalidateSnapshotWithForce_removingSnapshotFilesForActiveDisplayMode_completionHandler___block_invoke;
    void v18[3] = &unk_264677A88;
    CGSize v12 = v11;
    id v19 = v12;
    BOOL v21 = a3;
    BOOL v22 = a4;
    id v20 = v9;
    uint64_t v13 = (void (**)(void, void, void))MEMORY[0x223CAA850](v18);
    if (v12 == self->_contentProvidingView)
    {
      uint64_t v16 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
      [(WGWidgetHostingViewController *)self _insertContentProvidingSubview:0 sequence:v16 completion:v13];
    }
    else
    {
      objc_initWeak(&v17, self);
      if (v13)
      {
        id v14 = objc_loadWeakRetained(&v17);
        BOOL v15 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
        ((void (**)(void, id, void *))v13)[2](v13, v14, v15);
      }
      objc_destroyWeak(&v17);
    }
  }
}

void __122__WGWidgetHostingViewController__invalidateSnapshotWithForce_removingSnapshotFilesForActiveDisplayMode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 _contentProvidingView];

  if (v4 != v5 || *(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [v3 widgetIdentifier];
      CGFloat v9 = [v3 _containerIdentifier];
      CGFloat v10 = NSStringFromBOOL();
      uint64_t v11 = *(void *)(a1 + 32);
      int v13 = 138544386;
      id v14 = v8;
      __int16 v15 = 2050;
      id v16 = v3;
      __int16 v17 = 2114;
      int v18 = v9;
      __int16 v19 = 2114;
      id v20 = v10;
      __int16 v21 = 2114;
      uint64_t v22 = v11;
      _os_log_impl(&dword_222E49000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Invalidating snapshot (force=%{public}@): %{public}@",
        (uint8_t *)&v13,
        0x34u);
    }
    objc_removeAssociatedObjects(*(id *)(a1 + 32));
    [*(id *)(a1 + 32) removeFromSuperview];
    [v3 _setSnapshotView:0];
    if (*(unsigned char *)(a1 + 49)) {
      [v3 _removeAllSnapshotFilesForActiveDisplayMode];
    }
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, BOOL))(v12 + 16))(v12, v4 != v5);
  }
}

- (void)_captureLayerTree:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WGWidgetHostingViewController *)self isRemoteViewVisible])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__WGWidgetHostingViewController__captureLayerTree___block_invoke;
    v8[3] = &unk_264677650;
    id v9 = v4;
    [(WGWidgetHostingViewController *)self _enqueueRemoteServiceRequest:v8 withDescription:@"Encoding layer tree"];
    uint64_t v5 = v9;
LABEL_5:

    goto LABEL_6;
  }
  if (v4)
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = @"No visible remote view";
    id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v5 = [v6 errorWithDomain:@"WGWidgetHostingViewControllerErrorDomain" code:1 userInfo:v7];

    (*((void (**)(id, void, uint64_t, void *))v4 + 2))(v4, 0, -1, v5);
    goto LABEL_5;
  }
LABEL_6:
}

void __51__WGWidgetHostingViewController__captureLayerTree___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  v32[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (!a4 || ([v7 _isEncodingLayerTree] & 1) != 0)
  {
    if (!*(void *)(a1 + 32))
    {
LABEL_8:
      [v7 _setEncodingLayerTree:0];
      goto LABEL_9;
    }
    id v9 = @"Encoding request no longer valid";
    if (a4) {
      id v9 = @"Already encoding snapshot";
    }
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    __int16 v30 = v9;
    uint64_t v11 = NSDictionary;
    uint64_t v12 = v9;
    int v13 = [v11 dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v14 = [v10 errorWithDomain:@"WGWidgetHostingViewControllerErrorDomain" code:1 userInfo:v13];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_7:

    goto LABEL_8;
  }
  [v7 _setEncodingLayerTree:1];
  if (![v7 isRemoteViewVisible])
  {
    if (!*(void *)(a1 + 32)) {
      goto LABEL_8;
    }
    __int16 v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08320];
    v32[0] = @"No visible remote view";
    int v18 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v14 = [v17 errorWithDomain:@"WGWidgetHostingViewControllerErrorDomain" code:1 userInfo:v18];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_7;
  }
  ADClientAddValueForScalarKey();
  __int16 v15 = [v7 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v16 = [v15 activeLayoutModeForWidget:v7];
  }
  else
  {
    __int16 v19 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v20 = [v19 userInterfaceIdiom];

    uint64_t v16 = 2 * ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  }
  __int16 v21 = [v7 _widgetSnapshotURLForLayoutMode:v16 ensuringDirectoryExists:1];
  uint64_t v22 = [v7 _remoteViewController];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __51__WGWidgetHostingViewController__captureLayerTree___block_invoke_2;
  v24[3] = &unk_264677AD8;
  id v25 = v7;
  id v26 = v21;
  id v27 = *(id *)(a1 + 32);
  uint64_t v28 = v16;
  id v23 = v21;
  [v22 _requestEncodedLayerTreeAtURL:v23 withReplyHandler:v24];

LABEL_9:
}

void __51__WGWidgetHostingViewController__captureLayerTree___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__WGWidgetHostingViewController__captureLayerTree___block_invoke_3;
  v8[3] = &unk_264677AB0;
  id v9 = v3;
  id v4 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = v3;
  [v4 _enqueueRemoteServiceRequest:v8 withDescription:@"Handling layer tree encoding reply"];
}

void __51__WGWidgetHostingViewController__captureLayerTree___block_invoke_3(void *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  id v8 = (void *)WGLogWidgets;
  BOOL v9 = os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      id v10 = v8;
      id v11 = [v5 widgetIdentifier];
      uint64_t v12 = [v5 _containerIdentifier];
      int v23 = 138543874;
      __int16 v24 = v11;
      __int16 v25 = 2050;
      id v26 = v5;
      __int16 v27 = 2114;
      uint64_t v28 = v12;
      _os_log_impl(&dword_222E49000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Failed to capture a snapshot",
        (uint8_t *)&v23,
        0x20u);
    }
    ADClientAddValueForScalarKey();
  }
  else if (v9)
  {
    int v13 = v8;
    id v14 = [v5 widgetIdentifier];
    __int16 v15 = [v5 _containerIdentifier];
    uint64_t v16 = a1[5];
    int v23 = 138544130;
    __int16 v24 = v14;
    __int16 v25 = 2050;
    id v26 = v5;
    __int16 v27 = 2114;
    uint64_t v28 = v15;
    __int16 v29 = 2114;
    uint64_t v30 = v16;
    _os_log_impl(&dword_222E49000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Saved snapshot to %{public}@",
      (uint8_t *)&v23,
      0x2Au);
  }
  if (a1[4])
  {
    __int16 v17 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = v17;
      __int16 v19 = [v5 widgetIdentifier];
      uint64_t v20 = [v5 _containerIdentifier];
      uint64_t v21 = a1[4];
      int v23 = 138544130;
      __int16 v24 = v19;
      __int16 v25 = 2050;
      id v26 = v5;
      __int16 v27 = 2114;
      uint64_t v28 = v20;
      __int16 v29 = 2114;
      uint64_t v30 = v21;
      _os_log_impl(&dword_222E49000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered an error while attempting to encode layer tree: %{public}@",
        (uint8_t *)&v23,
        0x2Au);
    }
  }
  uint64_t v22 = a1[6];
  if (v22) {
    (*(void (**)(uint64_t, void, void, void))(v22 + 16))(v22, a1[5], a1[7], a1[4]);
  }
  [v5 _setEncodingLayerTree:0];
}

- (void)_packageViewWithBlock:(id)a3 reply:(id)a4
{
  uint64_t v7 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (!v7 || !v8)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WGWidgetHostingViewController.m", 1429, @"Invalid parameter not satisfying: %@", @"loadPackageViewBlock && reply" object file lineNumber description];
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__WGWidgetHostingViewController__packageViewWithBlock_reply___block_invoke;
  v13[3] = &unk_264677B00;
  id v14 = v9;
  id v10 = (void (*)(void *, void *))v7[2];
  id v11 = v9;
  v10(v7, v13);
}

void __61__WGWidgetHostingViewController__packageViewWithBlock_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (!v5) {
    [v6 setClipsToBounds:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_packageViewFromURL:(id)a3 reply:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  if (!v8)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WGWidgetHostingViewController.m", 1439, @"Invalid parameter not satisfying: %@", @"reply" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = @"No URL";
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    BOOL v9 = [v11 errorWithDomain:@"WGWidgetHostingViewControllerErrorDomain" code:2 userInfo:v12];

    v8[2](v8, 0, v9);
    goto LABEL_6;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__WGWidgetHostingViewController__packageViewFromURL_reply___block_invoke;
  v13[3] = &unk_264677B28;
  id v14 = v7;
  [(WGWidgetHostingViewController *)self _packageViewWithBlock:v13 reply:v8];
  BOOL v9 = v14;
LABEL_6:
}

uint64_t __59__WGWidgetHostingViewController__packageViewFromURL_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[_WGCAPackageView loadPackageViewWithContentsOfURL:*(void *)(a1 + 32) publishedObjectViewClassMap:0 completion:a2];
}

- (void)_loadSnapshotViewFromDiskIfNecessary:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  if (!self->_snapshotView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [WeakRetained activeLayoutModeForWidget:self];
    }
    else
    {
      id v8 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v9 = [v8 userInterfaceIdiom];

      uint64_t v7 = 2 * ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1);
    }
    id v10 = [(WGWidgetHostingViewController *)self _widgetSnapshotURLForLayoutMode:v7 ensuringDirectoryExists:0];
    id v11 = (id)WGLogWidgets;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      int v13 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      *(_DWORD *)buf = 138544130;
      id v20 = v12;
      __int16 v21 = 2050;
      uint64_t v22 = self;
      __int16 v23 = 2114;
      __int16 v24 = v13;
      __int16 v25 = 2114;
      id v26 = v10;
      _os_log_impl(&dword_222E49000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Attempting to load snapshot at URL: %{public}@",
        buf,
        0x2Au);
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __70__WGWidgetHostingViewController__loadSnapshotViewFromDiskIfNecessary___block_invoke;
    v14[3] = &unk_264677B50;
    objc_copyWeak(&v17, &location);
    id v16 = v4;
    id v6 = v10;
    id v15 = v6;
    [(WGWidgetHostingViewController *)self _packageViewFromURL:v6 reply:v14];

    objc_destroyWeak(&v17);
    goto LABEL_10;
  }
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained(&location);
    id v6 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
    (*((void (**)(id, id, id))v4 + 2))(v4, WeakRetained, v6);
LABEL_10:
  }
  objc_destroyWeak(&location);
}

void __70__WGWidgetHostingViewController__loadSnapshotViewFromDiskIfNecessary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (v6)
  {
    uint64_t v9 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = [v8 widgetIdentifier];
      id v12 = [v8 _containerIdentifier];
      int v13 = *(void **)(a1 + 32);
      int v20 = 138544386;
      __int16 v21 = v11;
      __int16 v22 = 2050;
      __int16 v23 = v8;
      __int16 v24 = 2114;
      __int16 v25 = v12;
      __int16 v26 = 2114;
      id v27 = v13;
      __int16 v28 = 2114;
      id v29 = v6;
      _os_log_impl(&dword_222E49000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Remove snapshots at %{public}@ due to error: %{public}@",
        (uint8_t *)&v20,
        0x34u);
    }
    [v8 _removeItemAsynchronouslyAtURL:*(void *)(a1 + 32)];
  }
  else
  {
    [WeakRetained _setSnapshotView:v5];
    id v14 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      id v16 = [v8 widgetIdentifier];
      id v17 = [v8 _containerIdentifier];
      int v20 = 138544130;
      __int16 v21 = v16;
      __int16 v22 = 2050;
      __int16 v23 = v8;
      __int16 v24 = 2114;
      __int16 v25 = v17;
      __int16 v26 = 2114;
      id v27 = v5;
      _os_log_impl(&dword_222E49000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Loaded snapshot from disk: %{public}@",
        (uint8_t *)&v20,
        0x2Au);
    }
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18)
  {
    __int16 v19 = [v8 _activeLifeCycleSequence];
    (*(void (**)(uint64_t, void *, void *))(v18 + 16))(v18, v8, v19);
  }
}

- (void)_validateSnapshotViewForActiveLayoutMode
{
  snapshotView = self->_snapshotView;
  if (snapshotView)
  {
    id v4 = [(_WGCAPackageView *)snapshotView snapshotIdentifier];
    if (v4)
    {
      id v10 = v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v6 = [WeakRetained activeLayoutModeForWidget:self];
      }
      else
      {
        uint64_t v7 = [MEMORY[0x263F1C5C0] currentDevice];
        uint64_t v8 = [v7 userInterfaceIdiom];

        uint64_t v6 = 2 * ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1);
      }
      uint64_t v9 = [(WGWidgetHostingViewController *)self _snapshotIdentifierForLayoutMode:v6];
      if (([v10 isEqual:v9] & 1) == 0) {
        [(WGWidgetHostingViewController *)self _invalidateSnapshotWithForce:1 removingSnapshotFilesForActiveDisplayMode:1 completionHandler:0];
      }

      id v4 = v10;
    }
  }
}

- (void)_requestVisibilityStateUpdateForPossiblyAppearing:(BOOL)a3 sequence:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(_WGWidgetRemoteViewController *)self->_remoteViewController _isValid];
  if (!v7 || !v4)
  {
    if (v7)
    {
LABEL_7:
      uint64_t v9 = [v6 currentState];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __92__WGWidgetHostingViewController__requestVisibilityStateUpdateForPossiblyAppearing_sequence___block_invoke;
      v12[3] = &__block_descriptor_41_e72_v28__0__WGWidgetHostingViewController_8__WGWidgetLifeCycleSequence_16B24l;
      void v12[4] = v9;
      BOOL v13 = v4;
      [(WGWidgetHostingViewController *)self _enqueueRemoteServiceRequest:v12 withDescription:@"Updating visibility state"];
    }
  }
  else
  {
    contentProvidingView = self->_contentProvidingView;
    id v11 = [(_WGWidgetRemoteViewController *)self->_remoteViewController view];

    if (contentProvidingView == v11) {
      goto LABEL_7;
    }
  }
}

void __92__WGWidgetHostingViewController__requestVisibilityStateUpdateForPossiblyAppearing_sequence___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v14 = a2;
  id v7 = a3;
  if (a4)
  {
    int v8 = [v14 _isActiveSequence:v7];
    if ([v7 isCurrentStateAtLeast:*(void *)(a1 + 32)])
    {
      char v9 = 0;
      if (!v8) {
        goto LABEL_14;
      }
    }
    else
    {
      if (*(unsigned char *)(a1 + 40)) {
        goto LABEL_14;
      }
      char v9 = [v7 isCurrentState:0] ^ 1;
      if (!v8) {
        goto LABEL_14;
      }
    }
    if ((v9 & 1) == 0)
    {
      if (*(unsigned char *)(a1 + 40))
      {
        BOOL v10 = [v14 _appearState] == 0;
        id v11 = v14;
        uint64_t v12 = !v10;
      }
      else
      {
        uint64_t v12 = 0;
        id v11 = v14;
      }
      BOOL v13 = [v11 _remoteViewController];
      [v13 _updateVisibilityState:v12];
    }
  }
LABEL_14:
}

- (void)_insertContentProvidingSubview:(id)a3 sequence:(id)a4 completion:(id)a5
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  int v8 = (UIView *)a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, id, id))a5;
  if ([(WGWidgetHostingViewController *)self _isActiveSequence:v9])
  {
    if ([(_WGWidgetRemoteViewController *)self->_remoteViewController isViewLoaded])
    {
      uint64_t v60 = [(_WGWidgetRemoteViewController *)self->_remoteViewController view];
      if (!v8) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v60 = 0;
      if (!v8)
      {
LABEL_16:
        if (self->_contentProvidingView == v8)
        {
          __int16 v59 = 0;
        }
        else
        {
          __int16 v59 = [(WGWidgetHostingViewController *)self _contentProvidingView];
        }
        BOOL v22 = self->_contentProvidingView == v8;
        [(WGWidgetHostingViewController *)self _setContentProvidingView:v8];
        char v23 = v60 != v8 || v22;
        if ((v23 & 1) == 0) {
          [(UIView *)v8 setHidden:1];
        }
        if (v8)
        {
          __int16 v24 = [(WGWidgetHostingViewController *)self view];
          [v24 addSubview:v8];
        }
        __int16 v25 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = v25;
          id v27 = [(WGWidgetHostingViewController *)self widgetIdentifier];
          __int16 v28 = [(WGWidgetHostingViewController *)self _containerIdentifier];
          id v29 = [(WGWidgetHostingViewController *)self view];
          uint64_t v30 = [v29 subviews];
          *(_DWORD *)buf = 138544386;
          __int16 v73 = v27;
          __int16 v74 = 2050;
          __int16 v75 = self;
          __int16 v76 = 2114;
          v77 = v28;
          __int16 v78 = 2114;
          CGSize v79 = v8;
          __int16 v80 = 2114;
          id v81 = v30;
          _os_log_impl(&dword_222E49000, v26, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Inserted content providing subview: %{public}@ (subviews=%{public}@)",
            buf,
            0x34u);
        }
        uint64_t v31 = [(WGWidgetHostingViewController *)self view];
        [v31 bounds];
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        double v39 = v38;

        -[UIView setFrame:](v8, "setFrame:", v33, v35, v37, v39);
        [(UIView *)v8 setAutoresizingMask:18];
        uint64_t v40 = [v9 currentState];
        if (v8 == 0 || v60 != v8)
        {
          if (v59 == v60)
          {
            [(UIView *)v60 setHidden:1];
            [(WGWidgetHostingViewController *)self _requestVisibilityStateUpdateForPossiblyAppearing:0 sequence:v9];
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            if (objc_opt_respondsToSelector()) {
              [WeakRetained remoteViewControllerViewDidHideForWidget:self];
            }
          }
          else
          {
            [(UIView *)v59 removeFromSuperview];
          }
          objc_initWeak((id *)buf, self);
          if (v10)
          {
            id v53 = objc_loadWeakRetained((id *)buf);
            v10[2](v10, v53, v9);
          }
          objc_destroyWeak((id *)buf);
        }
        else
        {
          uint64_t v41 = v40;
          __int16 v42 = dispatch_get_global_queue(25, 0);
          if (v42)
          {
            if (self->_viewWillAppearSemaphore)
            {
              id v43 = (void *)WGLogWidgets;
              if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v44 = v43;
                id v45 = [(WGWidgetHostingViewController *)self widgetIdentifier];
                __int16 v46 = [(WGWidgetHostingViewController *)self _containerIdentifier];
                *(_DWORD *)buf = 138543874;
                __int16 v73 = v45;
                __int16 v74 = 2050;
                __int16 v75 = self;
                __int16 v76 = 2114;
                v77 = v46;
                _os_log_impl(&dword_222E49000, v44, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> '_viewWillAppearSemaphore' already exists",
                  buf,
                  0x20u);
              }
            }
            dispatch_semaphore_t v47 = dispatch_semaphore_create(0);
            [(WGWidgetHostingViewController *)self _setViewWillAppearSemaphore:v47];
            v66[0] = MEMORY[0x263EF8330];
            v66[1] = 3221225472;
            v66[2] = __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke;
            v66[3] = &unk_264677B98;
            __int16 v48 = v47;
            v67 = v48;
            uint64_t v71 = v41;
            v68 = v8;
            __int16 v69 = v59;
            id v70 = v10;
            id v49 = (void *)MEMORY[0x223CAA850](v66);
            objc_initWeak((id *)buf, self);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke_277;
            block[3] = &unk_264677BC0;
            objc_copyWeak(&v65, (id *)buf);
            id v62 = v48;
            id v64 = v49;
            id v63 = v9;
            id v50 = v49;
            uint64_t v51 = v48;
            dispatch_async(v42, block);

            objc_destroyWeak(&v65);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            uint64_t v54 = (void *)WGLogWidgets;
            if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v55 = v54;
              v56 = [(WGWidgetHostingViewController *)self widgetIdentifier];
              __int16 v57 = [(WGWidgetHostingViewController *)self _containerIdentifier];
              *(_DWORD *)buf = 138543874;
              __int16 v73 = v56;
              __int16 v74 = 2050;
              __int16 v75 = self;
              __int16 v76 = 2114;
              v77 = v57;
              _os_log_impl(&dword_222E49000, v55, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Failed to obtain a queue",
                buf,
                0x20u);
            }
            objc_initWeak((id *)buf, self);
            if (v10)
            {
              id v58 = objc_loadWeakRetained((id *)buf);
              v10[2](v10, v58, v9);
            }
            objc_destroyWeak((id *)buf);
          }
        }
        goto LABEL_49;
      }
    }
    id v17 = [(WGWidgetHostingViewController *)self view];
    uint64_t v18 = [v17 subviews];
    if ((unint64_t)[v18 count] > 1)
    {
      __int16 v19 = [(UIView *)v8 superview];
      int v20 = [(WGWidgetHostingViewController *)self view];

      if (v19 != v20)
      {
        __int16 v21 = WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
          -[WGWidgetHostingViewController _insertContentProvidingSubview:sequence:completion:](v21);
        }
      }
    }
    else
    {
    }
    goto LABEL_16;
  }
  id v11 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    BOOL v13 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    id v14 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    id v15 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
    *(_DWORD *)buf = 138544642;
    __int16 v73 = v13;
    __int16 v74 = 2050;
    __int16 v75 = self;
    __int16 v76 = 2114;
    v77 = v14;
    __int16 v78 = 2114;
    CGSize v79 = v8;
    __int16 v80 = 2114;
    id v81 = v9;
    __int16 v82 = 2114;
    v83 = v15;
    _os_log_impl(&dword_222E49000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't insert view '%{public}@' as argument sequence (%{public}@) d"
      "oesn't match active sequence (%{public}@)",
      buf,
      0x3Eu);
  }
  objc_initWeak((id *)buf, self);
  if (v10)
  {
    id v16 = objc_loadWeakRetained((id *)buf);
    v10[2](v10, v16, v9);
  }
  objc_destroyWeak((id *)buf);
LABEL_49:
}

void __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 _viewWillAppearSemaphore];
  int v8 = *(void **)(a1 + 32);

  if (v7 == v8) {
    [v5 _setViewWillAppearSemaphore:0];
  }
  int v9 = [v5 _isActiveSequence:v6];
  int v10 = [v6 isCurrentState:*(void *)(a1 + 64)];
  if (v9 && v10)
  {
    [*(id *)(a1 + 40) setHidden:0];
    id v11 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      BOOL v13 = [v5 widgetIdentifier];
      id v14 = [v5 _containerIdentifier];
      *(_DWORD *)buf = 138543874;
      double v34 = v13;
      __int16 v35 = 2050;
      id v36 = v5;
      __int16 v37 = 2114;
      double v38 = v14;
      _os_log_impl(&dword_222E49000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Unhid remote view",
        buf,
        0x20u);
    }
    [v5 _endRemoteViewControllerAppearanceTransitionIfNecessary];
    [*(id *)(a1 + 48) removeFromSuperview];
    [v5 _requestVisibilityStateUpdateForPossiblyAppearing:1 sequence:v6];
  }
  else
  {
    id v15 = NSString;
    if (v9)
    {
      id v16 = WGStringFromWidgetLifeCycleSequenceState(*(void *)(a1 + 64));
      [v15 stringWithFormat:@"isn't in expected state (%@)", v16];
    }
    else
    {
      id v16 = [v5 _activeLifeCycleSequence];
      [v15 stringWithFormat:@"doesn't match active sequence (%@)", v16];
    id v17 = };

    uint64_t v18 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = v18;
      int v20 = [v5 widgetIdentifier];
      __int16 v21 = [v5 _containerIdentifier];
      uint64_t v22 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544642;
      double v34 = v20;
      __int16 v35 = 2050;
      id v36 = v5;
      __int16 v37 = 2114;
      double v38 = v21;
      __int16 v39 = 2114;
      uint64_t v40 = v22;
      __int16 v41 = 2114;
      id v42 = v6;
      __int16 v43 = 2114;
      __int16 v44 = v17;
      _os_log_impl(&dword_222E49000, v19, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't insert view '%{public}@' as argument sequence (%{public}@) %{public}@",
        buf,
        0x3Eu);
    }
    char v23 = *(void **)(a1 + 40);
    __int16 v24 = [v5 _contentProvidingView];

    if (v23 == v24)
    {
      [*(id *)(a1 + 40) removeFromSuperview];
      [v5 _setContentProvidingView:*(void *)(a1 + 48)];
      __int16 v25 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = v25;
        id v27 = [v5 widgetIdentifier];
        __int16 v28 = [v5 _containerIdentifier];
        uint64_t v29 = *(void *)(a1 + 40);
        uint64_t v30 = [v5 view];
        uint64_t v31 = [v30 subviews];
        *(_DWORD *)buf = 138544386;
        double v34 = v27;
        __int16 v35 = 2050;
        id v36 = v5;
        __int16 v37 = 2114;
        double v38 = v28;
        __int16 v39 = 2114;
        uint64_t v40 = v29;
        __int16 v41 = 2114;
        id v42 = v31;
        _os_log_impl(&dword_222E49000, v26, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Aborted insertion of view: %{public}@ (subviews=%{public}@)",
          buf,
          0x34u);
      }
    }
  }
  uint64_t v32 = *(void *)(a1 + 56);
  if (v32) {
    (*(void (**)(uint64_t, id, id))(v32 + 16))(v32, v5, v6);
  }
}

void __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke_277(id *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke_2;
  block[3] = &unk_264676630;
  uint64_t v2 = a1 + 7;
  objc_copyWeak(&v21, a1 + 7);
  id v20 = a1[4];
  dispatch_async(MEMORY[0x263EF83A0], block);
  id WeakRetained = objc_loadWeakRetained(v2);
  BOOL v4 = (id)WGLogWidgets;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [WeakRetained widgetIdentifier];
    id v6 = [WeakRetained _containerIdentifier];
    id v7 = a1[4];
    *(_DWORD *)buf = 138544130;
    id v23 = v5;
    __int16 v24 = 2050;
    id v25 = WeakRetained;
    __int16 v26 = 2114;
    id v27 = v6;
    __int16 v28 = 2114;
    id v29 = v7;
    _os_log_impl(&dword_222E49000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> About to wait on '_viewWillAppearSemaphore' (%{public}@)",
      buf,
      0x2Au);
  }
  int v8 = a1[4];
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    int v10 = (id)WGLogWidgets;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [WeakRetained widgetIdentifier];
      uint64_t v12 = [WeakRetained _containerIdentifier];
      id v13 = a1[4];
      *(_DWORD *)buf = 138544130;
      id v23 = v11;
      __int16 v24 = 2050;
      id v25 = WeakRetained;
      __int16 v26 = 2114;
      id v27 = v12;
      __int16 v28 = 2114;
      id v29 = v13;
      _os_log_impl(&dword_222E49000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> _viewWillAppearSemaphore (%{public}@) timed out!",
        buf,
        0x2Au);
    }
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke_278;
  v15[3] = &unk_2646774F8;
  id v17 = a1[6];
  objc_copyWeak(&v18, v2);
  id v16 = a1[5];
  id v14 = (void *)MEMORY[0x263EF83A0];
  dispatch_async(MEMORY[0x263EF83A0], v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
}

void __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _beginRemoteViewControllerAppearanceTransitionIfNecessary:1 semaphore:*(void *)(a1 + 32) animated:0 completion:0];
}

void __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke_278(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, WeakRetained, *(void *)(a1 + 32));
}

- (BOOL)_canInsertRemoteView:(id *)a3
{
  if ([(WGWidgetHostingViewController *)self isViewLoaded])
  {
    BOOL v5 = [(_WGWidgetRemoteViewController *)self->_remoteViewController _isValid];
    if (!a3) {
      return v5;
    }
  }
  else
  {
    BOOL v5 = 0;
    if (!a3) {
      return v5;
    }
  }
  if (!v5)
  {
    id v6 = NSString;
    [(WGWidgetHostingViewController *)self isViewLoaded];
    id v7 = NSStringFromBOOL();
    [(_WGWidgetRemoteViewController *)self->_remoteViewController _isValid];
    int v8 = NSStringFromBOOL();
    objc_msgSend(v6, "stringWithFormat:", @"Can't insert remote view: isViewLoaded: %@; _remoteViewController isValid: %@",
      v7,
      v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_insertAppropriateContentView
{
  if ([(_WGWidgetRemoteViewController *)self->_remoteViewController _isValid])
  {
    id v3 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
    [(WGWidgetHostingViewController *)self _requestInsertionOfRemoteViewAfterViewWillAppearForSequence:v3 completionHandler:0];
  }
  else if (self->_snapshotView)
  {
    [(WGWidgetHostingViewController *)self _insertSnapshotWithCompletionHandler:0];
  }
}

- (void)_insertSnapshotViewIfAppropriate
{
  if (![(WGWidgetHostingViewController *)self _isBlacklisted]
    && ![(WGWidgetHostingViewController *)self isLockedOut])
  {
    activeLifeCycleSequence = self->_activeLifeCycleSequence;
    if (!activeLifeCycleSequence
      || [(WGWidgetLifeCycleSequence *)activeLifeCycleSequence isCurrentStateNotYet:4])
    {
      [(WGWidgetHostingViewController *)self _loadSnapshotViewFromDiskIfNecessary:&__block_literal_global_285];
    }
  }
}

void __65__WGWidgetHostingViewController__insertSnapshotViewIfAppropriate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v4 = a3;
  BOOL v5 = [v10 _contentProvidingView];
  if (v5)
  {

    goto LABEL_8;
  }
  uint64_t v6 = [v10 _activeLifeCycleSequence];
  if (!v6)
  {
LABEL_6:
    [v10 _insertSnapshotWithCompletionHandler:0];
    goto LABEL_8;
  }
  id v7 = (void *)v6;
  if ([v10 _isActiveSequence:v4])
  {
    int v8 = [v10 _activeLifeCycleSequence];
    char v9 = [v8 isCurrentStateNotYet:4];

    if ((v9 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }

LABEL_8:
}

- (void)_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:(id)a3 completionHandler:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v7 = a3;
  int v8 = (void (**)(id, id, id))a4;
  if ([(WGWidgetHostingViewController *)self _isActiveSequence:v7])
  {
    id v46 = 0;
    BOOL v9 = [(WGWidgetHostingViewController *)self _canInsertRemoteView:&v46];
    id v10 = v46;
    if (v9)
    {
      if ([(id)objc_opt_class() _canWidgetHostInsertRemoteViewForSequence:v7])
      {
        if (([v7 isCurrentStateNotYet:3] & 1) != 0
          || [v7 isCurrentStateAtLeast:5])
        {
          id v11 = [v7 transitionToState:3];
          if (v11)
          {
            uint64_t v12 = (void *)WGLogWidgets;
            if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
              -[WGWidgetHostingViewController _requestInsertionOfRemoteViewAfterViewWillAppearForSequence:completionHandler:](v12);
            }
            objc_initWeak((id *)location, self);
            if (v8)
            {
              id WeakRetained = objc_loadWeakRetained((id *)location);
              v8[2](v8, WeakRetained, v7);
            }
            objc_destroyWeak((id *)location);
            goto LABEL_42;
          }
          id v45 = 0;
          uint64_t v30 = [v7 beginTransitionToState:4 error:&v45];
          unint64_t v31 = (unint64_t)v45;
          uint64_t v32 = (void *)v31;
          if (v30 | v31)
          {
            if (v31)
            {
              double v33 = (void *)WGLogWidgets;
              if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
                -[WGWidgetHostingViewController _requestInsertionOfRemoteViewAfterViewWillAppearForSequence:completionHandler:](v33);
              }
              objc_initWeak((id *)location, self);
              if (v8)
              {
                id v34 = objc_loadWeakRetained((id *)location);
                v8[2](v8, v34, v7);
              }
              objc_destroyWeak((id *)location);
              goto LABEL_41;
            }
          }
          else
          {
            uint64_t v40 = [MEMORY[0x263F08690] currentHandler];
            [v40 handleFailureInMethod:a2, self, @"WGWidgetHostingViewController.m", 1638, @"Invalid parameter not satisfying: %@", @"endTransitionBlock || error" object file lineNumber description];
          }
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __111__WGWidgetHostingViewController__requestInsertionOfRemoteViewAfterViewWillAppearForSequence_completionHandler___block_invoke;
          v41[3] = &unk_264677C10;
          void v41[4] = self;
          id v42 = (id)v30;
          uint64_t v44 = 4;
          __int16 v43 = v8;
          [(WGWidgetHostingViewController *)self _enqueueRemoteServiceRequest:v41 withDescription:@"Inserting remote view"];

LABEL_41:
LABEL_42:

          goto LABEL_43;
        }
        __int16 v35 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          id v36 = v35;
          __int16 v37 = [(WGWidgetHostingViewController *)self widgetIdentifier];
          double v38 = [(WGWidgetHostingViewController *)self _containerIdentifier];
          *(_DWORD *)id location = 138544130;
          *(void *)&location[4] = v37;
          __int16 v48 = 2050;
          id v49 = self;
          __int16 v50 = 2114;
          uint64_t v51 = v38;
          __int16 v52 = 2114;
          id v53 = v7;
          _os_log_impl(&dword_222E49000, v36, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Sequence already at satisfactory state: %{public}@",
            location,
            0x2Au);
        }
        objc_initWeak((id *)location, self);
        if (v8)
        {
          id v39 = objc_loadWeakRetained((id *)location);
          v8[2](v8, v39, v7);
        }
      }
      else
      {
        id v25 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = v25;
          id v27 = [(WGWidgetHostingViewController *)self widgetIdentifier];
          __int16 v28 = [(WGWidgetHostingViewController *)self _containerIdentifier];
          *(_DWORD *)id location = 138544130;
          *(void *)&location[4] = v27;
          __int16 v48 = 2050;
          id v49 = self;
          __int16 v50 = 2114;
          uint64_t v51 = v28;
          __int16 v52 = 2114;
          id v53 = v7;
          _os_log_impl(&dword_222E49000, v26, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Sequence state where insertion of remote view isn't possible: %{public}@",
            location,
            0x2Au);
        }
        objc_initWeak((id *)location, self);
        if (v8)
        {
          id v29 = objc_loadWeakRetained((id *)location);
          v8[2](v8, v29, v7);
        }
      }
    }
    else
    {
      id v20 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = v20;
        uint64_t v22 = [(WGWidgetHostingViewController *)self widgetIdentifier];
        id v23 = [(WGWidgetHostingViewController *)self _containerIdentifier];
        *(_DWORD *)id location = 138544130;
        *(void *)&location[4] = v22;
        __int16 v48 = 2050;
        id v49 = self;
        __int16 v50 = 2114;
        uint64_t v51 = v23;
        __int16 v52 = 2114;
        id v53 = v10;
        _os_log_impl(&dword_222E49000, v21, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> %{public}@",
          location,
          0x2Au);
      }
      objc_initWeak((id *)location, self);
      if (v8)
      {
        id v24 = objc_loadWeakRetained((id *)location);
        v8[2](v8, v24, v7);
      }
    }
    objc_destroyWeak((id *)location);
LABEL_43:

    goto LABEL_44;
  }
  id v14 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    id v16 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    id v17 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    id v18 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
    *(_DWORD *)id location = 138544386;
    *(void *)&location[4] = v16;
    __int16 v48 = 2050;
    id v49 = self;
    __int16 v50 = 2114;
    uint64_t v51 = v17;
    __int16 v52 = 2114;
    id v53 = v7;
    __int16 v54 = 2114;
    __int16 v55 = v18;
    _os_log_impl(&dword_222E49000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't insert remote view as argument sequence (%{public}@) doesn't"
      " match active sequence (%{public}@)",
      location,
      0x34u);
  }
  objc_initWeak((id *)location, self);
  if (v8)
  {
    id v19 = objc_loadWeakRetained((id *)location);
    v8[2](v8, v19, v7);
  }
  objc_destroyWeak((id *)location);
LABEL_44:
}

void __111__WGWidgetHostingViewController__requestInsertionOfRemoteViewAfterViewWillAppearForSequence_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  int v9 = [v7 _isActiveSequence:v8];
  int v10 = [v8 isCurrentState:3];
  if (a4 && v9 && v10)
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v7 _remoteViewController];
    id v13 = [v12 view];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __111__WGWidgetHostingViewController__requestInsertionOfRemoteViewAfterViewWillAppearForSequence_completionHandler___block_invoke_2;
    v26[3] = &unk_264677BE8;
    id v14 = *(id *)(a1 + 40);
    id v16 = *(void **)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    id v27 = v14;
    uint64_t v29 = v15;
    id v28 = v16;
    [v11 _insertContentProvidingSubview:v13 sequence:v8 completion:v26];

    goto LABEL_18;
  }
  if ((a4 & 1) == 0)
  {
    id v23 = (void *)WGLogWidgets;
    if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    id v18 = v23;
    id v19 = [v7 widgetIdentifier];
    id v20 = [v7 _containerIdentifier];
    *(_DWORD *)buf = 138543874;
    unint64_t v31 = v19;
    __int16 v32 = 2050;
    id v33 = v7;
    __int16 v34 = 2114;
    __int16 v35 = v20;
    _os_log_impl(&dword_222E49000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't insert remote view as queue is no longer valid",
      buf,
      0x20u);
    goto LABEL_15;
  }
  if ((v9 & 1) == 0)
  {
    id v24 = (void *)WGLogWidgets;
    if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    id v18 = v24;
    id v19 = [v7 widgetIdentifier];
    id v20 = [v7 _containerIdentifier];
    id v21 = [v7 _activeLifeCycleSequence];
    *(_DWORD *)buf = 138544386;
    unint64_t v31 = v19;
    __int16 v32 = 2050;
    id v33 = v7;
    __int16 v34 = 2114;
    __int16 v35 = v20;
    __int16 v36 = 2114;
    id v37 = v8;
    __int16 v38 = 2114;
    id v39 = v21;
    uint64_t v22 = "<%{public}@: %{public}p; container: %{public}@> Can't insert remote view as argument sequence (%{public}@) doe"
          "sn't match active sequence (%{public}@)";
    goto LABEL_14;
  }
  if ((v10 & 1) == 0)
  {
    id v17 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      id v19 = [v7 widgetIdentifier];
      id v20 = [v7 _containerIdentifier];
      id v21 = WGStringFromWidgetLifeCycleSequenceState(3uLL);
      *(_DWORD *)buf = 138544386;
      unint64_t v31 = v19;
      __int16 v32 = 2050;
      id v33 = v7;
      __int16 v34 = 2114;
      __int16 v35 = v20;
      __int16 v36 = 2114;
      id v37 = v8;
      __int16 v38 = 2114;
      id v39 = v21;
      uint64_t v22 = "<%{public}@: %{public}p; container: %{public}@> Can't insert remote view as argument sequence (%{public}@) i"
            "sn't in expected state (%{public}@)";
LABEL_14:
      _os_log_impl(&dword_222E49000, v18, OS_LOG_TYPE_DEFAULT, v22, buf, 0x34u);

LABEL_15:
    }
  }
LABEL_16:
  uint64_t v25 = *(void *)(a1 + 48);
  if (v25) {
    (*(void (**)(uint64_t, id, id))(v25 + 16))(v25, v7, v8);
  }
LABEL_18:
}

void __111__WGWidgetHostingViewController__requestInsertionOfRemoteViewAfterViewWillAppearForSequence_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (*(void (**)(void))(a1[4] + 16))();
  if (v7)
  {
    id v8 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = v8;
      int v10 = [v5 widgetIdentifier];
      id v11 = [v5 _containerIdentifier];
      uint64_t v12 = WGStringFromWidgetLifeCycleSequenceState(a1[6]);
      int v14 = 138544386;
      uint64_t v15 = v10;
      __int16 v16 = 2050;
      id v17 = v5;
      __int16 v18 = 2114;
      id v19 = v11;
      __int16 v20 = 2114;
      id v21 = v12;
      __int16 v22 = 2114;
      id v23 = v7;
      _os_log_impl(&dword_222E49000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered error transitioning to target state '%{public}@': %{public}@",
        (uint8_t *)&v14,
        0x34u);
    }
  }
  uint64_t v13 = a1[5];
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  }
}

- (void)_synchronizeGeometryWithSnapshot
{
  uint64_t v3 = [(WGWidgetHostingViewController *)self _snapshotView];
  if (v3)
  {
    id v4 = (void *)v3;
    BOOL v5 = [(WGWidgetHostingViewController *)self isRemoteViewVisible];

    if (!v5)
    {
      [(WGWidgetHostingViewController *)self _snapshotViewBounds];
      double Height = CGRectGetHeight(v8);
      [(WGWidgetHostingViewController *)self _updatePreferredContentSizeWithHeight:Height];
    }
  }
}

- (void)_insertSnapshotWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(WGWidgetHostingViewController *)self isViewLoaded]
    && (snapshotView = self->_snapshotView) != 0
    && ([(WGWidgetHostingViewController *)self _contentProvidingView],
        id v6 = (_WGCAPackageView *)objc_claimAutoreleasedReturnValue(),
        v6,
        snapshotView != v6))
  {
    [(WGWidgetHostingViewController *)self _beginRemoteViewControllerAppearanceTransitionIfNecessary:0 semaphore:0 animated:0 completion:0];
    id v7 = [(_WGCAPackageView *)self->_snapshotView layer];
    [v7 setSecurityMode:*MEMORY[0x263F15E60]];

    CGRect v8 = [(WGWidgetHostingViewController *)self _snapshotView];
    int v9 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __70__WGWidgetHostingViewController__insertSnapshotWithCompletionHandler___block_invoke;
    v13[3] = &unk_2646776F0;
    id v14 = v4;
    [(WGWidgetHostingViewController *)self _insertContentProvidingSubview:v8 sequence:v9 completion:v13];
  }
  else
  {
    objc_initWeak(&v12, self);
    if (v4)
    {
      id v10 = objc_loadWeakRetained(&v12);
      id v11 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
      (*((void (**)(id, id, void *))v4 + 2))(v4, v10, v11);
    }
    objc_destroyWeak(&v12);
  }
}

void __70__WGWidgetHostingViewController__insertSnapshotWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v9 _snapshotView];
  id v7 = [v9 _contentProvidingView];

  if (v6 == v7)
  {
    [v9 _endRemoteViewControllerAppearanceTransitionIfNecessary];
    [v9 _synchronizeGeometryWithSnapshot];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

- (BOOL)_managingContainerIsVisible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    char v4 = [WeakRetained managingContainerIsVisibleForWidget:self];
  }
  else
  {
    id v5 = [(WGWidgetHostingViewController *)self parentViewController];
    char v4 = objc_msgSend(v5, "wg_isAppearingOrAppeared");
  }
  return v4;
}

- (void)_endSequence:(id)a3 withReason:(id)a4 completion:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, id))a5;
  id v11 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    uint64_t v13 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    id v14 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    *(_DWORD *)buf = 138544386;
    __int16 v32 = v13;
    __int16 v33 = 2050;
    __int16 v34 = self;
    __int16 v35 = 2114;
    __int16 v36 = v14;
    __int16 v37 = 2114;
    id v38 = v8;
    __int16 v39 = 2114;
    id v40 = v9;
    _os_log_impl(&dword_222E49000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> End sequence '%{public}@' with reason: %{public}@",
      buf,
      0x34u);
  }
  int v15 = ![(WGWidgetHostingViewController *)self _isActiveSequence:v8];
  if (!v8) {
    LOBYTE(v15) = 1;
  }
  if (v15)
  {
    id v17 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = v17;
      id v19 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      __int16 v20 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      id v21 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
      *(_DWORD *)buf = 138544386;
      __int16 v32 = v19;
      __int16 v33 = 2050;
      __int16 v34 = self;
      __int16 v35 = 2114;
      __int16 v36 = v20;
      __int16 v37 = 2114;
      id v38 = v8;
      __int16 v39 = 2114;
      id v40 = v21;
      _os_log_impl(&dword_222E49000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't end sequence as argument sequence (%{public}@) doesn't mat"
        "ch active sequence (%{public}@), or there's no active sequence",
        buf,
        0x34u);
    }
    objc_initWeak((id *)buf, self);
    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)buf);
      v10[2](v10, WeakRetained, v8);
    }
    goto LABEL_13;
  }
  if (![(id)objc_opt_class() _canWidgetHostEndSequenceByDisconnectingRemoteViewControllerForSequence:v8])
  {
    id v23 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = v23;
      uint64_t v25 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      __int16 v26 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      *(_DWORD *)buf = 138544130;
      __int16 v32 = v25;
      __int16 v33 = 2050;
      __int16 v34 = self;
      __int16 v35 = 2114;
      __int16 v36 = v26;
      __int16 v37 = 2114;
      id v38 = v8;
      _os_log_impl(&dword_222E49000, v24, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Sequence already at satisfactory state: %{public}@",
        buf,
        0x2Au);
    }
    objc_initWeak((id *)buf, self);
    if (v10)
    {
      id v27 = objc_loadWeakRetained((id *)buf);
      v10[2](v10, v27, v8);
    }
LABEL_13:
    objc_destroyWeak((id *)buf);
    goto LABEL_21;
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __68__WGWidgetHostingViewController__endSequence_withReason_completion___block_invoke;
  v28[3] = &unk_264677C60;
  v28[4] = self;
  id v29 = v9;
  uint64_t v30 = v10;
  __int16 v16 = (void (**)(void, void, void))MEMORY[0x223CAA850](v28);
  if ([(WGWidgetHostingViewController *)self _hasOutstandingUpdateRequestForSequence:v8])
  {
    [(WGWidgetHostingViewController *)self _registerUpdateRequestCompletionHandler:v16 forSequence:v8];
  }
  else
  {
    ((void (**)(void, WGWidgetHostingViewController *, id))v16)[2](v16, self, v8);
  }

LABEL_21:
}

void __68__WGWidgetHostingViewController__endSequence_withReason_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _OWORD v6[2] = __68__WGWidgetHostingViewController__endSequence_withReason_completion___block_invoke_2;
  v6[3] = &unk_264677C38;
  id v5 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [v5 _captureSnapshotAndBeginDisappearanceTransitionForSequence:a3 completionHandler:v6];
}

void __68__WGWidgetHostingViewController__endSequence_withReason_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 _isActiveSequence:v6];
  int v8 = [v6 isCurrentState:5];
  if (v7 && v8)
  {
    [v5 _endRemoteViewControllerAppearanceTransitionIfNecessary];
    if (([v5 _managingContainerIsVisible] & 1) != 0
      || ([v5 _shouldRemoveSnapshotWhenNotVisible] & 1) == 0)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      void v17[2] = __68__WGWidgetHostingViewController__endSequence_withReason_completion___block_invoke_3;
      v17[3] = &unk_264677C38;
      id v18 = *(id *)(a1 + 32);
      id v19 = *(id *)(a1 + 40);
      [v5 _insertSnapshotWithCompletionHandler:v17];
    }
    else
    {
      objc_msgSend(v5, "_disconnectRemoteViewControllerForReason:sequence:coalesce:completionHandler:", *(void *)(a1 + 32), v6, objc_msgSend(v5, "disconnectsImmediately") ^ 1, *(void *)(a1 + 40));
    }
    goto LABEL_16;
  }
  if ((v7 & 1) == 0)
  {
    int v15 = (void *)WGLogWidgets;
    if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    id v10 = v15;
    id v11 = [v5 widgetIdentifier];
    id v12 = [v5 _containerIdentifier];
    uint64_t v13 = [v5 _activeLifeCycleSequence];
    *(_DWORD *)buf = 138544386;
    id v21 = v11;
    __int16 v22 = 2050;
    id v23 = v5;
    __int16 v24 = 2114;
    uint64_t v25 = v12;
    __int16 v26 = 2114;
    id v27 = v6;
    __int16 v28 = 2114;
    id v29 = v13;
    id v14 = "<%{public}@: %{public}p; container: %{public}@> Can't disconnect remote view controller as argument sequence ("
          "%{public}@) doesn't match active sequence (%{public}@)";
    goto LABEL_13;
  }
  if ((v8 & 1) == 0)
  {
    id v9 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = [v5 widgetIdentifier];
      id v12 = [v5 _containerIdentifier];
      uint64_t v13 = WGStringFromWidgetLifeCycleSequenceState(5uLL);
      *(_DWORD *)buf = 138544386;
      id v21 = v11;
      __int16 v22 = 2050;
      id v23 = v5;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      __int16 v26 = 2114;
      id v27 = v6;
      __int16 v28 = 2114;
      id v29 = v13;
      id v14 = "<%{public}@: %{public}p; container: %{public}@> Can't disconnect remote view controller as argument sequence"
            " (%{public}@) isn't in expected state (%{public}@)";
LABEL_13:
      _os_log_impl(&dword_222E49000, v10, OS_LOG_TYPE_DEFAULT, v14, buf, 0x34u);
    }
  }
LABEL_14:
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  }
LABEL_16:
}

void __68__WGWidgetHostingViewController__endSequence_withReason_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 _isActiveSequence:v6];
  int v8 = [v6 isCurrentState:5];
  if (v7 && v8)
  {
    objc_msgSend(v5, "_disconnectRemoteViewControllerForReason:sequence:coalesce:completionHandler:", *(void *)(a1 + 32), v6, objc_msgSend(v5, "disconnectsImmediately") ^ 1, *(void *)(a1 + 40));
    goto LABEL_13;
  }
  if ((v7 & 1) == 0)
  {
    int v15 = (void *)WGLogWidgets;
    if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    id v10 = v15;
    id v11 = [v5 widgetIdentifier];
    id v12 = [v5 _containerIdentifier];
    uint64_t v13 = [v5 _activeLifeCycleSequence];
    int v17 = 138544386;
    id v18 = v11;
    __int16 v19 = 2050;
    id v20 = v5;
    __int16 v21 = 2114;
    __int16 v22 = v12;
    __int16 v23 = 2114;
    id v24 = v6;
    __int16 v25 = 2114;
    __int16 v26 = v13;
    id v14 = "<%{public}@: %{public}p; container: %{public}@> Can't disconnect remote view controller as argument sequence ("
          "%{public}@) doesn't match active sequence (%{public}@)";
    goto LABEL_10;
  }
  if ((v8 & 1) == 0)
  {
    id v9 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = [v5 widgetIdentifier];
      id v12 = [v5 _containerIdentifier];
      uint64_t v13 = WGStringFromWidgetLifeCycleSequenceState(5uLL);
      int v17 = 138544386;
      id v18 = v11;
      __int16 v19 = 2050;
      id v20 = v5;
      __int16 v21 = 2114;
      __int16 v22 = v12;
      __int16 v23 = 2114;
      id v24 = v6;
      __int16 v25 = 2114;
      __int16 v26 = v13;
      id v14 = "<%{public}@: %{public}p; container: %{public}@> Can't disconnect remote view controller as argument sequence"
            " (%{public}@) isn't in expected state (%{public}@)";
LABEL_10:
      _os_log_impl(&dword_222E49000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, 0x34u);
    }
  }
LABEL_11:
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  }
LABEL_13:
}

- (void)_disconnectRemoteViewControllerForReason:(id)a3 sequence:(id)a4 coalesce:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v62 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, id, id))a6;
  BOOL v13 = [(WGWidgetHostingViewController *)self _isActiveSequence:v11];
  id v14 = (void *)WGLogWidgets;
  BOOL v15 = os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      uint64_t v16 = v14;
      int v17 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      id v18 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      __int16 v19 = NSStringFromBOOL();
      *(_DWORD *)buf = 138544386;
      id v65 = v17;
      __int16 v66 = 2050;
      v67 = self;
      __int16 v68 = 2114;
      __int16 v69 = v18;
      __int16 v70 = 2114;
      id v71 = v62;
      __int16 v72 = 2114;
      __int16 v73 = v19;
      _os_log_impl(&dword_222E49000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Disconnection requested with reason: '%{public}@'; shouldCoalesce: %{public}@",
        buf,
        0x34u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_disconnectionTimer);
    if (![(id)objc_opt_class() _canWidgetHostDisconnectRemoteViewControllerForSequence:v11 disconnectionTimer:WeakRetained coalesce:v7])
    {
      __int16 v34 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v35 = v34;
        __int16 v36 = [(WGWidgetHostingViewController *)self widgetIdentifier];
        __int16 v37 = [(WGWidgetHostingViewController *)self _containerIdentifier];
        *(_DWORD *)buf = 138544130;
        id v65 = v36;
        __int16 v66 = 2050;
        v67 = self;
        __int16 v68 = 2114;
        __int16 v69 = v37;
        __int16 v70 = 2114;
        id v71 = v11;
        _os_log_impl(&dword_222E49000, v35, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Sequence already at satisfactory state: %{public}@",
          buf,
          0x2Au);
      }
      objc_initWeak((id *)buf, self);
      if (v12)
      {
        id v38 = objc_loadWeakRetained((id *)buf);
        v12[2](v12, v38, v11);
      }
      objc_destroyWeak((id *)buf);
      goto LABEL_43;
    }
    __int16 v21 = [v11 transitionToState:6];
    if (v21)
    {
      __int16 v22 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
        -[WGWidgetHostingViewController _disconnectRemoteViewControllerForReason:sequence:coalesce:completionHandler:](v22);
      }
      __int16 v23 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = v23;
        __int16 v25 = [(WGWidgetHostingViewController *)self widgetIdentifier];
        __int16 v26 = [(WGWidgetHostingViewController *)self _containerIdentifier];
        uint64_t v27 = WGStringFromWidgetLifeCycleSequenceState(6uLL);
        *(_DWORD *)buf = 138544386;
        id v65 = v25;
        __int16 v66 = 2050;
        v67 = self;
        __int16 v68 = 2114;
        __int16 v69 = v26;
        __int16 v70 = 2112;
        id v71 = v27;
        __int16 v72 = 2112;
        __int16 v73 = v21;
        _os_log_impl(&dword_222E49000, v24, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered error transitioning to target state '%@': %@",
          buf,
          0x34u);
      }
      objc_initWeak((id *)buf, self);
      if (v12)
      {
        id v28 = objc_loadWeakRetained((id *)buf);
        v12[2](v12, v28, v11);
      }
      objc_destroyWeak((id *)buf);
      goto LABEL_42;
    }
    id v63 = 0;
    uint64_t v61 = [v11 beginTransitionToState:0 error:&v63];
    unint64_t v39 = (unint64_t)v63;
    id v40 = (void *)v39;
    if (v61 | v39)
    {
      if (v39)
      {
        uint64_t v41 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
          -[WGWidgetHostingViewController _disconnectRemoteViewControllerForReason:sequence:coalesce:completionHandler:](v41);
        }
        id v42 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v43 = v42;
          uint64_t v44 = [(WGWidgetHostingViewController *)self widgetIdentifier];
          id v45 = [(WGWidgetHostingViewController *)self _containerIdentifier];
          id v46 = WGStringFromWidgetLifeCycleSequenceState(0);
          *(_DWORD *)buf = 138544386;
          id v65 = v44;
          __int16 v66 = 2050;
          v67 = self;
          __int16 v68 = 2114;
          __int16 v69 = v45;
          __int16 v70 = 2112;
          id v71 = v46;
          __int16 v72 = 2112;
          __int16 v73 = v40;
          _os_log_impl(&dword_222E49000, v43, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered error transitioning to target state '%@': %@",
            buf,
            0x34u);
        }
        objc_initWeak((id *)buf, self);
        if (v12)
        {
          id v47 = objc_loadWeakRetained((id *)buf);
          v12[2](v12, v47, v11);
        }
        objc_destroyWeak((id *)buf);
LABEL_41:

LABEL_42:
LABEL_43:

        goto LABEL_44;
      }
    }
    else
    {
      __int16 v48 = [MEMORY[0x263F08690] currentHandler];
      [v48 handleFailureInMethod:a2, self, @"WGWidgetHostingViewController.m", 1797, @"Invalid parameter not satisfying: %@", @"endTransitionBlock || error" object file lineNumber description];
    }
    if (v7)
    {
      if (WeakRetained)
      {
        id v49 = WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
          -[WGWidgetHostingViewController _disconnectRemoteViewControllerForReason:sequence:coalesce:completionHandler:](v49, v50, v51, v52, v53, v54, v55, v56);
        }
      }
      __int16 v57 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        id v58 = v57;
        __int16 v59 = [(WGWidgetHostingViewController *)self widgetIdentifier];
        uint64_t v60 = [(WGWidgetHostingViewController *)self _containerIdentifier];
        *(_DWORD *)buf = 138543874;
        id v65 = v59;
        __int16 v66 = 2050;
        v67 = self;
        __int16 v68 = 2114;
        __int16 v69 = v60;
        _os_log_impl(&dword_222E49000, v58, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Disconnection requested - scheduling disconnection timer",
          buf,
          0x20u);
      }
      [(WGWidgetHostingViewController *)self _scheduleDisconnectionTimerForSequence:v11 endTransitionBlock:v61 completion:v12];
    }
    else
    {
      [(WGWidgetHostingViewController *)self _invalidateDisconnectionTimer];
      [(WGWidgetHostingViewController *)self _enqueueDisconnectionRequestForSequence:v11 endTransitionBlock:v61 completion:v12];
    }
    goto LABEL_41;
  }
  if (v15)
  {
    id v29 = v14;
    uint64_t v30 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    unint64_t v31 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    __int16 v32 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
    *(_DWORD *)buf = 138544386;
    id v65 = v30;
    __int16 v66 = 2050;
    v67 = self;
    __int16 v68 = 2114;
    __int16 v69 = v31;
    __int16 v70 = 2114;
    id v71 = v11;
    __int16 v72 = 2114;
    __int16 v73 = v32;
    _os_log_impl(&dword_222E49000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't disconnect remote view controller as argument sequence (%{pu"
      "blic}@) doesn't match active sequence (%{public}@)",
      buf,
      0x34u);
  }
  objc_initWeak((id *)buf, self);
  if (v12)
  {
    id v33 = objc_loadWeakRetained((id *)buf);
    v12[2](v12, v33, v11);
  }
  objc_destroyWeak((id *)buf);
LABEL_44:
}

- (void)_enqueueDisconnectionRequestForSequence:(id)a3 endTransitionBlock:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v12 = MEMORY[0x263EF8330];
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = [(WGWidgetHostingViewController *)self _proxyConnectionQueue];
  [(WGWidgetHostingViewController *)self _enqueueRequest:&v12 inQueue:v11 trampolinedToMainQueue:1 withDescription:@"Disconnecting remote view controller"];
}

void __103__WGWidgetHostingViewController__enqueueDisconnectionRequestForSequence_endTransitionBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  int v9 = [v7 _isActiveSequence:v8];
  int v10 = [v8 isCurrentState:6];
  if (a4 && v9 && v10)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11
      && ((*(void (**)(uint64_t, void))(v11 + 16))(v11, 0),
          (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v13 = (void *)v12;
      id v14 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v15 = v14;
        uint64_t v16 = [v7 widgetIdentifier];
        int v17 = [v7 _containerIdentifier];
        id v18 = WGStringFromWidgetLifeCycleSequenceState(0);
        int v29 = 138544386;
        uint64_t v30 = v16;
        __int16 v31 = 2050;
        id v32 = v7;
        __int16 v33 = 2114;
        __int16 v34 = v17;
        __int16 v35 = 2112;
        id v36 = v18;
        __int16 v37 = 2112;
        id v38 = v13;
        _os_log_impl(&dword_222E49000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered error transitioning to target state '%@': %@",
          (uint8_t *)&v29,
          0x34u);
      }
      uint64_t v19 = *(void *)(a1 + 40);
      if (v19) {
        (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v7, v8);
      }
    }
    else
    {
      [v7 _disconnectRemoteViewControllerForSequence:v8 completion:*(void *)(a1 + 40)];
      id v13 = 0;
    }

    goto LABEL_25;
  }
  if ((a4 & 1) == 0)
  {
    __int16 v26 = (void *)WGLogWidgets;
    if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    __int16 v21 = v26;
    __int16 v22 = [v7 widgetIdentifier];
    __int16 v23 = [v7 _containerIdentifier];
    int v29 = 138543874;
    uint64_t v30 = v22;
    __int16 v31 = 2050;
    id v32 = v7;
    __int16 v33 = 2114;
    __int16 v34 = v23;
    _os_log_impl(&dword_222E49000, v21, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Remote view controller instantiation request no longer valid",
      (uint8_t *)&v29,
      0x20u);
    goto LABEL_22;
  }
  if ((v9 & 1) == 0)
  {
    uint64_t v27 = (void *)WGLogWidgets;
    if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    __int16 v21 = v27;
    __int16 v22 = [v7 widgetIdentifier];
    __int16 v23 = [v7 _containerIdentifier];
    id v24 = [v7 _activeLifeCycleSequence];
    int v29 = 138544386;
    uint64_t v30 = v22;
    __int16 v31 = 2050;
    id v32 = v7;
    __int16 v33 = 2114;
    __int16 v34 = v23;
    __int16 v35 = 2112;
    id v36 = v8;
    __int16 v37 = 2112;
    id v38 = v24;
    __int16 v25 = "<%{public}@: %{public}p; container: %{public}@> Disconnecting remote view controller as argument sequence (%@)"
          " doesn't match active sequence (%@)";
    goto LABEL_21;
  }
  if ((v10 & 1) == 0)
  {
    id v20 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = v20;
      __int16 v22 = [v7 widgetIdentifier];
      __int16 v23 = [v7 _containerIdentifier];
      id v24 = WGStringFromWidgetLifeCycleSequenceState(1uLL);
      int v29 = 138544386;
      uint64_t v30 = v22;
      __int16 v31 = 2050;
      id v32 = v7;
      __int16 v33 = 2114;
      __int16 v34 = v23;
      __int16 v35 = 2112;
      id v36 = v8;
      __int16 v37 = 2112;
      id v38 = v24;
      __int16 v25 = "<%{public}@: %{public}p; container: %{public}@> Disconnecting remote view controller as argument sequence (%"
            "@) isn't in expected state (%@)";
LABEL_21:
      _os_log_impl(&dword_222E49000, v21, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v29, 0x34u);

LABEL_22:
    }
  }
LABEL_23:
  uint64_t v28 = *(void *)(a1 + 40);
  if (v28) {
    (*(void (**)(uint64_t, id, id))(v28 + 16))(v28, v7, v8);
  }
LABEL_25:
}

- (void)_disconnectRemoteViewControllerForSequence:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    int v10 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    uint64_t v11 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    *(_DWORD *)buf = 138543874;
    __int16 v35 = v10;
    __int16 v36 = 2050;
    __int16 v37 = self;
    __int16 v38 = 2114;
    uint64_t v39 = v11;
    _os_log_impl(&dword_222E49000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Severing remote view controller connection...",
      buf,
      0x20u);
  }
  if (self->_remoteViewControllerDisconnectionHandler)
  {
    uint64_t v12 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      id v14 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      BOOL v15 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      *(_DWORD *)buf = 138543874;
      __int16 v35 = v14;
      __int16 v36 = 2050;
      __int16 v37 = self;
      __int16 v38 = 2114;
      uint64_t v39 = v15;
      _os_log_impl(&dword_222E49000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Already had a remote view controller disconnection handler",
        buf,
        0x20u);
    }
    objc_initWeak((id *)buf, self);
    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    __int16 v33 = @"Already had a remote view controller disconnection handler";
    int v17 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v18 = [v16 errorWithDomain:@"WGWidgetHostingViewControllerErrorDomain" code:0 userInfo:v17];

    remoteViewControllerDisconnectionHandler = (void (**)(id, id, id, void *))self->_remoteViewControllerDisconnectionHandler;
    id WeakRetained = objc_loadWeakRetained((id *)buf);
    remoteViewControllerDisconnectionHandler[2](remoteViewControllerDisconnectionHandler, WeakRetained, v6, v18);

    objc_destroyWeak((id *)buf);
  }
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  __int16 v22 = self->_remoteViewController;
  [(_WGWidgetRemoteViewController *)v22 _setValid:0];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __87__WGWidgetHostingViewController__disconnectRemoteViewControllerForSequence_completion___block_invoke;
  v29[3] = &unk_264677CB0;
  __int16 v23 = v21;
  uint64_t v30 = v23;
  id v24 = v7;
  id v31 = v24;
  [(WGWidgetHostingViewController *)self _setRemoteViewControllerDisconnectionHandler:v29];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __87__WGWidgetHostingViewController__disconnectRemoteViewControllerForSequence_completion___block_invoke_301;
  v27[3] = &unk_2646777E0;
  __int16 v25 = v23;
  uint64_t v28 = v25;
  [(WGWidgetHostingViewController *)self _enqueueRequest:v27 inQueue:self->_proxyConnectionQueue trampolinedToMainQueue:0 withDescription:@"Blocking proxy connection queue on connection semaphore"];
  [(WGWidgetHostingViewController *)self _setConnectionState:2];
  if (v22) {
    id v26 = [(_WGWidgetRemoteViewController *)v22 disconnect];
  }
  else {
    [(WGWidgetHostingViewController *)self widget:0 didTerminateWithError:0];
  }
}

void __87__WGWidgetHostingViewController__disconnectRemoteViewControllerForSequence_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__WGWidgetHostingViewController__disconnectRemoteViewControllerForSequence_completion___block_invoke_2;
  v8[3] = &unk_264677C38;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  [a2 _finishDisconnectingRemoteViewControllerForSequence:a3 error:a4 completion:v8];
}

void __87__WGWidgetHostingViewController__disconnectRemoteViewControllerForSequence_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [v5 widgetIdentifier];
    id v10 = [v5 _containerIdentifier];
    uint64_t v11 = *(void *)(a1 + 32);
    int v13 = 138544130;
    id v14 = v9;
    __int16 v15 = 2050;
    id v16 = v5;
    __int16 v17 = 2114;
    id v18 = v10;
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    _os_log_impl(&dword_222E49000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Signaling disconnection semaphore (%{public}@)",
      (uint8_t *)&v13,
      0x2Au);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v5, v6);
  }
}

void __87__WGWidgetHostingViewController__disconnectRemoteViewControllerForSequence_completion___block_invoke_301(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [v5 widgetIdentifier];
    id v10 = [v5 _containerIdentifier];
    uint64_t v11 = *(void *)(a1 + 32);
    int v17 = 138544130;
    id v18 = v9;
    __int16 v19 = 2050;
    id v20 = v5;
    __int16 v21 = 2114;
    __int16 v22 = v10;
    __int16 v23 = 2114;
    uint64_t v24 = v11;
    _os_log_impl(&dword_222E49000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Waiting on disconnection semaphore (%{public}@)",
      (uint8_t *)&v17,
      0x2Au);
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v12 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = v12;
    id v14 = [v5 widgetIdentifier];
    __int16 v15 = [v5 _containerIdentifier];
    uint64_t v16 = *(void *)(a1 + 32);
    int v17 = 138544130;
    id v18 = v14;
    __int16 v19 = 2050;
    id v20 = v5;
    __int16 v21 = 2114;
    __int16 v22 = v15;
    __int16 v23 = 2114;
    uint64_t v24 = v16;
    _os_log_impl(&dword_222E49000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> No longer waiting on disconnection semaphore (%{public}@)",
      (uint8_t *)&v17,
      0x2Au);
  }
}

- (void)_finishDisconnectingRemoteViewControllerForSequence:(id)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, WGWidgetHostingViewController *, id))a5;
  uint64_t v11 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    int v13 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    id v14 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    int v25 = 138543874;
    id v26 = v13;
    __int16 v27 = 2050;
    uint64_t v28 = self;
    __int16 v29 = 2114;
    uint64_t v30 = v14;
    _os_log_impl(&dword_222E49000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Severed remote view controller connection",
      (uint8_t *)&v25,
      0x20u);
  }
  [(WGWidgetHostingViewController *)self _setConnectionState:0];
  __int16 v15 = [(WGWidgetHostingViewController *)self _viewWillAppearSemaphore];

  if (v15)
  {
    uint64_t v16 = [(WGWidgetHostingViewController *)self _viewWillAppearSemaphore];
    dispatch_semaphore_signal(v16);
  }
  [(WGWidgetHostingViewController *)self _setRemoteViewController:0];
  [(WGWidgetHostingViewController *)self _setDidUpdate:0];
  if (([v8 isCurrentState:0] & 1) == 0)
  {
    int v17 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      __int16 v19 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      id v20 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      int v25 = 138543874;
      id v26 = v19;
      __int16 v27 = 2050;
      uint64_t v28 = self;
      __int16 v29 = 2114;
      uint64_t v30 = v20;
      _os_log_impl(&dword_222E49000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Widget disconnected unexpectedly",
        (uint8_t *)&v25,
        0x20u);
    }
    [(WGWidgetHostingViewController *)self _invalidateDisconnectionTimer];
    [(WGWidgetHostingViewController *)self _abortActiveSequence];
    if ([(UIViewController *)self wg_isAppearingOrAppeared]) {
      [(WGWidgetHostingViewController *)self _attemptReconnectionAfterUnanticipatedDisconnection];
    }
  }
  __int16 v21 = [(WGWidgetHostingViewController *)self _extensionRequest];
  [(WGWidgetHostingViewController *)self _setExtensionRequest:0];
  if (v21)
  {
    __int16 v22 = [(WGWidgetHostingViewController *)self widgetInfo];
    __int16 v23 = [v22 extension];

    [v23 cancelExtensionRequestWithIdentifier:v21];
  }
  if (v10) {
    v10[2](v10, self, v8);
  }
  uint64_t v24 = [(WGWidgetHostingViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v24 remoteViewControllerDidDisconnectForWidget:self];
  }
}

- (void)_scheduleDisconnectionTimerForSequence:(id)a3 endTransitionBlock:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x263F08B88];
  id v12 = a3;
  if (([v11 isMainThread] & 1) == 0
    && (int v13 = (void *)WGLogWidgets, os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)))
  {
    -[WGWidgetHostingViewController _scheduleDisconnectionTimerForSequence:endTransitionBlock:completion:](v13, self);
    if (v12) {
      goto LABEL_4;
    }
  }
  else if (v12)
  {
    goto LABEL_4;
  }
  id v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WGWidgetHostingViewController.m", 1924, @"Invalid parameter not satisfying: %@", @"sequence" object file lineNumber description];

LABEL_4:
  id v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v12, @"WGWidgetHostingViewControllerDisconnectionTimerSequenceKey", 0);

  if (v9)
  {
    __int16 v15 = (void *)[v9 copy];
    [v14 setObject:v15 forKey:@"WGWidgetHostingViewControllerDisconnectionTimerEndTransitionBlockKey"];
  }
  if (v10)
  {
    uint64_t v16 = (void *)[v10 copy];
    [v14 setObject:v16 forKey:@"WGWidgetHostingViewControllerDisconnectionTimerCompletionKey"];
  }
  int v17 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__disconnectionTimerDidFire_ selector:v14 userInfo:0 repeats:1.0];
  objc_storeWeak((id *)&self->_disconnectionTimer, v17);
}

- (void)_disconnectionTimerDidFire:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v5 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
      -[WGWidgetHostingViewController _disconnectionTimerDidFire:](v5, self);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disconnectionTimer);

  if (WeakRetained == v4)
  {
    id v7 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      id v9 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      id v10 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      int v17 = 138543874;
      id v18 = v9;
      __int16 v19 = 2050;
      id v20 = self;
      __int16 v21 = 2114;
      __int16 v22 = v10;
      _os_log_impl(&dword_222E49000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Disconnection timer fired",
        (uint8_t *)&v17,
        0x20u);
    }
    uint64_t v11 = objc_opt_class();
    id v12 = [v4 userInfo];
    int v13 = WGSafeCast(v11, v12);

    id v14 = [v13 objectForKey:@"WGWidgetHostingViewControllerDisconnectionTimerSequenceKey"];
    __int16 v15 = [v13 objectForKey:@"WGWidgetHostingViewControllerDisconnectionTimerEndTransitionBlockKey"];
    uint64_t v16 = [v13 objectForKey:@"WGWidgetHostingViewControllerDisconnectionTimerCompletionKey"];
    [(WGWidgetHostingViewController *)self _enqueueDisconnectionRequestForSequence:v14 endTransitionBlock:v15 completion:v16];
  }
}

- (void)_invalidateDisconnectionTimer
{
  id v3 = a1;
  id v4 = [a2 widgetIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_222E49000, v5, v6, "%{public}@: Attempting to invalidate disconnection timer on non-main thread!", v7, v8, v9, v10, v11);
}

- (void)_attemptReconnectionAfterUnanticipatedDisconnection
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    uint64_t v5 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    uint64_t v6 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    int v19 = 138543874;
    id v20 = v5;
    __int16 v21 = 2050;
    __int16 v22 = self;
    __int16 v23 = 2114;
    uint64_t v24 = v6;
    _os_log_impl(&dword_222E49000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Remote view controller disconnected unexpectedly",
      (uint8_t *)&v19,
      0x20u);
  }
  uint64_t v7 = [MEMORY[0x263EFF910] date];
  if (self->_lastUnanticipatedDisconnectionDate
    && ([MEMORY[0x263EFF910] date],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 timeIntervalSinceDate:self->_lastUnanticipatedDisconnectionDate],
        double v10 = v9,
        v8,
        v10 < 8.0))
  {
    uint8_t v11 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      int v13 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      id v14 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      int v19 = 138544130;
      id v20 = v13;
      __int16 v21 = 2050;
      __int16 v22 = self;
      __int16 v23 = 2114;
      uint64_t v24 = v14;
      __int16 v25 = 2050;
      uint64_t v26 = 8;
      _os_log_impl(&dword_222E49000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Two crashes within interval (%{public}ld) - we're done",
        (uint8_t *)&v19,
        0x2Au);
    }
    [(WGWidgetHostingViewController *)self _setBlacklisted:1];
    [(WGWidgetHostingViewController *)self invalidateCachedSnapshotWithCompletionHandler:0];
    [(WGWidgetHostingViewController *)self _setLargestAvailableDisplayMode:[(WGWidgetInfo *)self->_widgetInfo isLinkedOnOrAfterSystemVersion:@"10.0"] ^ 1];
    [(WGWidgetHostingViewController *)self _insertBrokenView];
  }
  else
  {
    __int16 v15 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      int v17 = [(WGWidgetHostingViewController *)self widgetIdentifier];
      id v18 = [(WGWidgetHostingViewController *)self _containerIdentifier];
      int v19 = 138543874;
      id v20 = v17;
      __int16 v21 = 2050;
      __int16 v22 = self;
      __int16 v23 = 2114;
      uint64_t v24 = v18;
      _os_log_impl(&dword_222E49000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Attempting to reconnect to remote view controller",
        (uint8_t *)&v19,
        0x20u);
    }
    [(WGWidgetHostingViewController *)self _beginSequenceWithReason:@"reconnection attempt" completion:0 updateHandler:0];
  }
  [(WGWidgetHostingViewController *)self _setLastUnanticipatedDisconnectionDate:v7];
}

- (void)_insertBrokenView
{
  id v3 = [(WGWidgetHostingViewController *)self _brokenView];
  id v4 = v3;
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = objc_alloc_init(_WGBrokenWidgetView);
  }
  uint64_t v7 = v5;

  [(WGWidgetHostingViewController *)self _setBrokenView:v7];
  uint64_t v6 = [(WGWidgetHostingViewController *)self _brokenView];
  [(WGWidgetHostingViewController *)self _insertContentProvidingSubview:v6 sequence:self->_activeLifeCycleSequence completion:&__block_literal_global_328];
}

void __50__WGWidgetHostingViewController__insertBrokenView__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v2 = [v7 _brokenView];
  id v3 = [v7 _contentProvidingView];

  id v4 = v7;
  if (v2 == v3)
  {
    uint64_t v5 = [v7 _brokenView];
    [v5 addTarget:v7 action:sel_handleReconnectionRequest_];

    uint64_t v6 = [v7 delegate];
    if (objc_opt_respondsToSelector()) {
      [v6 brokenViewDidAppearForWidget:v7];
    }

    id v4 = v7;
  }
}

- (void)handleReconnectionRequest:(id)a3
{
  [(WGWidgetHostingViewController *)self _setBlacklisted:0];
  [(WGWidgetHostingViewController *)self _beginSequenceWithReason:@"reconnection attempt" completion:0 updateHandler:0];
}

- (CGSize)_maxSizeForDisplayMode:(int64_t)a3
{
  +[WGWidgetInfo maximumContentHeightForCompactDisplayMode];
  double v6 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v8 = [(WGWidgetHostingViewController *)self delegate];
    [v8 maxSizeForWidget:self forDisplayMode:a3];
    double v10 = v9;
    double v6 = v11;
  }
  else
  {
    double v10 = 0.0;
  }

  double v12 = v10;
  double v13 = v6;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (UIEdgeInsets)_marginInsets
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained marginInsetsForWidget:self];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v5 = *MEMORY[0x263F1D1C0];
    double v7 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v9 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }

  double v10 = 39.0;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.right = v13;
  result.bottom = v10;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)_layoutMargins
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained layoutMarginForWidget:self];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = *MEMORY[0x263F146D8];
    double v7 = *(double *)(MEMORY[0x263F146D8] + 8);
    double v9 = *(double *)(MEMORY[0x263F146D8] + 16);
    double v11 = *(double *)(MEMORY[0x263F146D8] + 24);
  }

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)_layoutMarginsDidChange
{
  id v3 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
  int v4 = [v3 isCurrentState:4];

  if (v4)
  {
    [(WGWidgetHostingViewController *)self _layoutMargins];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__WGWidgetHostingViewController__layoutMarginsDidChange__block_invoke;
    v8[3] = &__block_descriptor_64_e72_v28__0__WGWidgetHostingViewController_8__WGWidgetLifeCycleSequence_16B24l;
    UIEdgeInsets v9 = v10;
    double v5 = NSString;
    double v6 = NSStringFromUIEdgeInsets(v10);
    double v7 = [v5 stringWithFormat:@"Updating layout margins: '%@'", v6];
    [(WGWidgetHostingViewController *)self _enqueueRemoteServiceRequest:v8 withDescription:v7];
  }
}

void __56__WGWidgetHostingViewController__layoutMarginsDidChange__block_invoke(double *a1, void *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    id v5 = [a2 _remoteViewController];
    objc_msgSend(v5, "_updateLayoutMargins:", a1[4], a1[5], a1[6], a1[7]);
  }
}

- (void)_updatePreferredContentSizeWithHeight:(double)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    double v7 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    double v8 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    int v9 = 138544130;
    UIEdgeInsets v10 = v7;
    __int16 v11 = 2050;
    double v12 = self;
    __int16 v13 = 2114;
    double v14 = v8;
    __int16 v15 = 2050;
    uint64_t v16 = (uint64_t)a3;
    _os_log_impl(&dword_222E49000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Requested preferred height: %{public}ld",
      (uint8_t *)&v9,
      0x2Au);
  }
  [(WGWidgetHostingViewController *)self preferredContentSize];
  -[WGWidgetHostingViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_setLargestAvailableDisplayMode:(int64_t)a3
{
  if ([(WGWidgetHostingViewController *)self largestAvailableDisplayMode] != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained widget:self didChangeLargestAvailableDisplayMode:a3];
    }
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [v6 widget:self didChangeLargestSupportedDisplayMode:a3];
    }
  }
  if ([(WGWidgetHostingViewController *)self userSpecifiedDisplayMode] >= a3)
  {
    [(WGWidgetHostingViewController *)self setActiveDisplayMode:a3];
  }
}

- (void)_noteOutstandingUpdateRequestForSequence:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
    if (!sequenceIDsToOutstandingWidgetUpdateCompletionHandlers)
    {
      id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      double v7 = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
      self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = v6;

      sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
    }
    double v8 = [v4 sequenceIdentifier];
    int v9 = [(NSMutableDictionary *)sequenceIDsToOutstandingWidgetUpdateCompletionHandlers objectForKey:v8];

    if (v9 && os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG)) {
      -[WGWidgetHostingViewController _noteOutstandingUpdateRequestForSequence:]();
    }
    UIEdgeInsets v10 = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
    __int16 v11 = [v4 sequenceIdentifier];
    [(NSMutableDictionary *)v10 setObject:&__block_literal_global_10 forKey:v11];
  }
  else
  {
    double v12 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG)) {
      -[WGWidgetHostingViewController _noteOutstandingUpdateRequestForSequence:](v12);
    }
  }
}

- (BOOL)_hasOutstandingUpdateRequestForSequence:(id)a3
{
  sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
  id v4 = [a3 sequenceIdentifier];
  id v5 = [(NSMutableDictionary *)sequenceIDsToOutstandingWidgetUpdateCompletionHandlers objectForKey:v4];
  LOBYTE(sequenceIDsToOutstandingWidgetUpdateCompletionHandlers) = v5 == &__block_literal_global_10;

  return (char)sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
}

- (void)_registerUpdateRequestCompletionHandler:(id)a3 forSequence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (!self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers)
    {
      double v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
      self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = v8;
    }
    UIEdgeInsets v10 = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
    __int16 v11 = [v7 sequenceIdentifier];
    if (v6)
    {
      double v12 = [(NSMutableDictionary *)v10 objectForKey:v11];

      if (v12) {
        BOOL v13 = v12 == &__block_literal_global_10;
      }
      else {
        BOOL v13 = 1;
      }
      if (!v13 && os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG)) {
        -[WGWidgetHostingViewController _noteOutstandingUpdateRequestForSequence:]();
      }
      double v14 = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
      __int16 v15 = (void *)MEMORY[0x223CAA850](v6);
      uint64_t v16 = [v7 sequenceIdentifier];
      [(NSMutableDictionary *)v14 setObject:v15 forKey:v16];
    }
    else
    {
      [(NSMutableDictionary *)v10 removeObjectForKey:v11];
    }
  }
  else
  {
    uint64_t v17 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG)) {
      -[WGWidgetHostingViewController _noteOutstandingUpdateRequestForSequence:](v17);
    }
  }
}

- (id)_updateRequestForSequence:(id)a3
{
  if (a3)
  {
    sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
    id v4 = [a3 sequenceIdentifier];
    id v5 = [(NSMutableDictionary *)sequenceIDsToOutstandingWidgetUpdateCompletionHandlers objectForKey:v4];
    id v6 = (void *)MEMORY[0x223CAA850]();
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)_setRemoteViewController:(id)a3
{
  id v5 = (_WGWidgetRemoteViewController *)a3;
  p_remoteViewController = &self->_remoteViewController;
  remoteViewController = self->_remoteViewController;
  UIEdgeInsets v10 = v5;
  if (remoteViewController != v5)
  {
    [(_WGWidgetRemoteViewController *)remoteViewController willMoveToParentViewController:0];
    BOOL v8 = [(WGWidgetHostingViewController *)self isRemoteViewVisible];
    [(WGWidgetHostingViewController *)self _beginRemoteViewControllerAppearanceTransitionIfNecessary:0 semaphore:0 animated:0 completion:0];
    int v9 = [(_WGWidgetRemoteViewController *)*p_remoteViewController view];
    [v9 removeFromSuperview];

    if (v8) {
      [(WGWidgetHostingViewController *)self _setContentProvidingView:0];
    }
    [(WGWidgetHostingViewController *)self _endRemoteViewControllerAppearanceTransitionIfNecessary];
    [(_WGWidgetRemoteViewController *)*p_remoteViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    if (*p_remoteViewController)
    {
      -[WGWidgetHostingViewController addChildViewController:](self, "addChildViewController:");
      [(_UIRemoteViewController *)*p_remoteViewController didMoveToParentViewController:self];
    }
  }
}

- (void)widget:(id)a3 didTerminateWithError:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    UIEdgeInsets v10 = [(WGWidgetHostingViewController *)self widgetIdentifier];
    __int16 v11 = [(WGWidgetHostingViewController *)self _containerIdentifier];
    int v15 = 138544130;
    uint64_t v16 = v10;
    __int16 v17 = 2050;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v11;
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_impl(&dword_222E49000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Remote view controller did terminate with error: %{public}@",
      (uint8_t *)&v15,
      0x2Au);
  }
  id v12 = [(WGWidgetHostingViewController *)self _remoteViewController];

  if (v12 == v6)
  {
    BOOL v13 = [(WGWidgetHostingViewController *)self _remoteViewControllerDisconnectionHandler];
    if (v13)
    {
      [(WGWidgetHostingViewController *)self _setRemoteViewControllerDisconnectionHandler:0];
      double v14 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
      ((void (**)(void, WGWidgetHostingViewController *, void *, id))v13)[2](v13, self, v14, v7);
    }
    else
    {
      double v14 = [(WGWidgetHostingViewController *)self _activeLifeCycleSequence];
      [(WGWidgetHostingViewController *)self _finishDisconnectingRemoteViewControllerForSequence:v14 error:v7 completion:0];
    }
  }
}

- (id)_cancelTouches
{
  return [(_UIRemoteViewController *)self->_remoteViewController _cancelTouchesForCurrentEventInHostedContent];
}

- (void)_rowHeightDidChange:(id)a3
{
  [(WGWidgetHostingViewController *)self preferredContentSize];
  [(WGWidgetHostingViewController *)self _updatePreferredContentSizeWithHeight:v4];
}

- (NSString)_containerIdentifier
{
  uint64_t v2 = [(WGWidgetHostingViewController *)self parentViewController];
  if (v2)
  {
    id v3 = (objc_class *)objc_opt_class();
    double v4 = NSStringFromClass(v3);
  }
  else
  {
    double v4 = 0;
  }

  return (NSString *)v4;
}

- (void)_invalidateVisibleFrame
{
  if ([(WGWidgetInfo *)self->_widgetInfo wantsVisibleFrame]
    && [(UIViewController *)self->_remoteViewController wg_isAppearingOrAppeared])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      [WeakRetained visibleFrameForWidget:self];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __56__WGWidgetHostingViewController__invalidateVisibleFrame__block_invoke;
      v8[3] = &__block_descriptor_64_e72_v28__0__WGWidgetHostingViewController_8__WGWidgetLifeCycleSequence_16B24l;
      void v8[4] = v4;
      void v8[5] = v5;
      v8[6] = v6;
      v8[7] = v7;
      [(WGWidgetHostingViewController *)self _enqueueRemoteServiceRequest:v8 withDescription:@"Requesting visible frame"];
    }
  }
}

void __56__WGWidgetHostingViewController__invalidateVisibleFrame__block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 _remoteViewController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__WGWidgetHostingViewController__invalidateVisibleFrame__block_invoke_2;
  v10[3] = &unk_2646773E0;
  id v11 = v3;
  double v5 = a1[4];
  double v6 = a1[5];
  double v7 = a1[6];
  double v8 = a1[7];
  id v9 = v3;
  objc_msgSend(v4, "_updateVisibleFrame:withReplyHandler:", v10, v5, v6, v7, v8);
}

void __56__WGWidgetHostingViewController__invalidateVisibleFrame__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) widgetInfo];
  [v3 _setWantsVisibleFrame:a2];
}

- (void)_insertLockedOutViewWithExplanation:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(WGWidgetHostingViewController *)self _lockedOutView];
  double v5 = v4;
  if (v4) {
    double v6 = v4;
  }
  else {
    double v6 = [[_WGLockedOutWidgetView alloc] initWithExplanation:v8];
  }
  double v7 = v6;

  [(WGWidgetHostingViewController *)self _setLockedOutView:v7];
  [(WGWidgetHostingViewController *)self _insertContentProvidingSubview:v7 sequence:self->_activeLifeCycleSequence completion:0];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(WGWidgetHostingViewController *)self widgetIdentifier];
  double v6 = [(WGWidgetHostingViewController *)self _remoteViewController];
  double v7 = [(WGWidgetHostingViewController *)self _contentProvidingView];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; widgetIdentifier = %@; _remoteViewController = %@; _contentProvidingView = %@>",
    v4,
    self,
    v5,
    v6,
  id v8 = v7);

  return v8;
}

- (WGWidgetInfo)widgetInfo
{
  return self->_widgetInfo;
}

- (WGWidgetHostingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WGWidgetHostingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WGWidgetHostingViewControllerHost)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  return (WGWidgetHostingViewControllerHost *)WeakRetained;
}

- (void)setHost:(id)a3
{
}

- (int64_t)activeDisplayMode
{
  return self->_activeDisplayMode;
}

- (BOOL)implementsPerformUpdate
{
  return self->_implementsPerformUpdate;
}

- (BOOL)isLockedOut
{
  return self->_lockedOut;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
}

- (BOOL)disconnectsImmediately
{
  return self->_disconnectsImmediately;
}

- (void)setDisconnectsImmediately:(BOOL)a3
{
  self->_disconnectsImmediately = a3;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
}

- (WGWidgetLifeCycleSequence)_activeLifeCycleSequence
{
  return self->_activeLifeCycleSequence;
}

- (int64_t)_connectionState
{
  return self->_connectionState;
}

- (void)_setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (OS_dispatch_queue)_proxyConnectionQueue
{
  return self->_proxyConnectionQueue;
}

- (OS_dispatch_queue)_proxyRequestQueue
{
  return self->_proxyRequestQueue;
}

- (OS_dispatch_queue)_diskWriteQueue
{
  return self->_diskWriteQueue;
}

- (_WGWidgetRemoteViewController)_remoteViewController
{
  return self->_remoteViewController;
}

- (NSCopying)_extensionRequest
{
  return self->_extensionRequest;
}

- (void)_setExtensionRequest:(id)a3
{
}

- (UIView)_contentProvidingView
{
  return self->_contentProvidingView;
}

- (void)_setContentProvidingView:(id)a3
{
}

- (_WGCAPackageView)_snapshotView
{
  return self->_snapshotView;
}

- (CGRect)_snapshotViewBounds
{
  double x = self->_snapshotViewBounds.origin.x;
  double y = self->_snapshotViewBounds.origin.y;
  double width = self->_snapshotViewBounds.size.width;
  double height = self->_snapshotViewBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setSnapshotBounds:(CGRect)a3
{
  self->_snapshotViewBounds = a3;
}

- (BOOL)_isEncodingLayerTree
{
  return self->_encodingLayerTree;
}

- (void)_setEncodingLayerTree:(BOOL)a3
{
  self->_encodingLayerTree = a3;
}

- (BOOL)_didRequestViewInset
{
  return self->_didRequestViewInset;
}

- (void)_setDidRequestViewInset:(BOOL)a3
{
  self->_didRequestViewInset = a3;
}

- (NSTimer)_disconnectionTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disconnectionTimer);
  return (NSTimer *)WeakRetained;
}

- (void)_setDisconnectionTimer:(id)a3
{
}

- (OS_dispatch_semaphore)_viewWillAppearSemaphore
{
  return self->_viewWillAppearSemaphore;
}

- (void)_setViewWillAppearSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)_viewWillDisappearSemaphore
{
  return self->_viewWillDisappearSemaphore;
}

- (void)_setViewWillDisappearSemaphore:(id)a3
{
}

- (id)_remoteViewControllerConnectionHandler
{
  return self->_remoteViewControllerConnectionHandler;
}

- (void)_setRemoteViewControllerConnectionHandler:(id)a3
{
}

- (id)_remoteViewControllerDisconnectionHandler
{
  return self->_remoteViewControllerDisconnectionHandler;
}

- (void)_setRemoteViewControllerDisconnectionHandler:(id)a3
{
}

- (NSDate)_lastUnanticipatedDisconnectionDate
{
  return self->_lastUnanticipatedDisconnectionDate;
}

- (void)_setLastUnanticipatedDisconnectionDate:(id)a3
{
}

- (NSMapTable)_openAppearanceTransactions
{
  return self->_openAppearanceTransactions;
}

- (BOOL)_didUpdate
{
  return self->_didUpdate;
}

- (void)_setDidUpdate:(BOOL)a3
{
  self->_didUpdate = a3;
}

- (BOOL)_isBlacklisted
{
  return self->_blacklisted;
}

- (void)_setBlacklisted:(BOOL)a3
{
  self->_blacklisted = a3;
}

- (_WGBrokenWidgetView)_brokenView
{
  return self->_brokenView;
}

- (void)_setBrokenView:(id)a3
{
}

- (_WGLockedOutWidgetView)_lockedOutView
{
  return self->_lockedOutView;
}

- (void)_setLockedOutView:(id)a3
{
}

- (NSMutableDictionary)_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers
{
  return self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
}

- (void)_setSequenceIDsToOutstandingWidgetUpdateCompletionHandlers:(id)a3
{
}

- (BOOL)_isIgnoringParentAppearState
{
  return self->_ignoringParentAppearState;
}

- (void)_setIgnoringParentAppearState:(BOOL)a3
{
  self->_ignoringParentAppearState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_lockedOutView, 0);
  objc_storeStrong((id *)&self->_brokenView, 0);
  objc_storeStrong((id *)&self->_openAppearanceTransactions, 0);
  objc_storeStrong((id *)&self->_lastUnanticipatedDisconnectionDate, 0);
  objc_storeStrong(&self->_remoteViewControllerDisconnectionHandler, 0);
  objc_storeStrong(&self->_remoteViewControllerConnectionHandler, 0);
  objc_storeStrong((id *)&self->_viewWillDisappearSemaphore, 0);
  objc_storeStrong((id *)&self->_viewWillAppearSemaphore, 0);
  objc_destroyWeak((id *)&self->_disconnectionTimer);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_contentProvidingView, 0);
  objc_storeStrong((id *)&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_diskWriteQueue, 0);
  objc_storeStrong((id *)&self->_proxyRequestQueue, 0);
  objc_storeStrong((id *)&self->_proxyConnectionQueue, 0);
  objc_storeStrong((id *)&self->_activeLifeCycleSequence, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_destroyWeak((id *)&self->_host);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetInfo, 0);
}

+ (BOOL)_canWidgetHostConnectRemoteViewControllerByRequestingForSequence:(id)a3 disconnectionTimer:(id)a4 connectionState:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    int v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"WGWidgetHostingViewController.m", 2177, @"Invalid parameter not satisfying: %@", @"sequence" object file lineNumber description];
  }
  BOOL v11 = 1;
  if (([v9 isCurrentStateNotYet:1] & 1) == 0)
  {
    char v12 = [v9 isCurrentState:6];
    if (v10) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v12;
    }
    BOOL v11 = a5 == 1 || v13;
  }

  return v11;
}

+ (BOOL)_canWidgetHostConnectRemoteViewControllerByCancellingDisappearanceForSequence:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WGWidgetHostingViewController.m", 2182, @"Invalid parameter not satisfying: %@", @"sequence" object file lineNumber description];
  }
  char v6 = [v5 isCurrentStateAtLeast:5];

  return v6;
}

+ (BOOL)_canWidgetHostRequestRemoteViewControllerForSequence:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WGWidgetHostingViewController.m", 2187, @"Invalid parameter not satisfying: %@", @"sequence" object file lineNumber description];
  }
  char v6 = [v5 isCurrentState:1];

  return v6;
}

+ (BOOL)_canWidgetHostCaptureSnapshotForSequence:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WGWidgetHostingViewController.m", 2192, @"Invalid parameter not satisfying: %@", @"sequence" object file lineNumber description];
  }
  char v6 = [v5 isCurrentStateNotYet:5];

  return v6;
}

+ (BOOL)_canWidgetHostInsertRemoteViewForSequence:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WGWidgetHostingViewController.m", 2197, @"Invalid parameter not satisfying: %@", @"sequence" object file lineNumber description];
  }
  if ([v5 isCurrentStateAtLeast:2]) {
    char v6 = [v5 isCurrentStateNotYet:6];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)_canWidgetHostEndSequenceByDisconnectingRemoteViewControllerForSequence:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WGWidgetHostingViewController.m", 2202, @"Invalid parameter not satisfying: %@", @"sequence" object file lineNumber description];
  }
  if ([v5 isCurrentState:0]) {
    char v6 = 0;
  }
  else {
    char v6 = [v5 isCurrentStateNotYet:6];
  }

  return v6;
}

+ (BOOL)_canWidgetHostDisconnectRemoteViewControllerForSequence:(id)a3 disconnectionTimer:(id)a4 coalesce:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    int v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"WGWidgetHostingViewController.m", 2207, @"Invalid parameter not satisfying: %@", @"sequence" object file lineNumber description];
  }
  char v11 = [v9 isCurrentStateNotYet:6];
  BOOL v12 = !a5;
  if (!v10) {
    BOOL v12 = 0;
  }
  BOOL v13 = (v11 & 1) != 0 || v12;

  return v13;
}

- (void)_connectRemoteViewControllerForReason:(void *)a1 sequence:completionHandler:.cold.1(void *a1)
{
  id v1 = a1;
  uint64_t v2 = WGStringFromWidgetLifeCycleSequenceState(1uLL);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_222E49000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);
}

- (void)_connectRemoteViewControllerForReason:(void *)a1 sequence:completionHandler:.cold.2(void *a1)
{
  id v1 = a1;
  uint64_t v2 = WGStringFromWidgetLifeCycleSequenceState(2uLL);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_222E49000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);
}

- (void)_requestRemoteViewControllerForSequence:completionHander:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_7(&dword_222E49000, "Encountered error transitioning to target state '%{public}@': %{public}@", v4, v5);
}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_148_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_captureSnapshotAndBeginDisappearanceTransitionForSequence:(void *)a1 completionHandler:.cold.1(void *a1)
{
  id v1 = a1;
  uint64_t v2 = WGStringFromWidgetLifeCycleSequenceState(5uLL);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_222E49000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);
}

- (void)_insertContentProvidingSubview:(os_log_t)log sequence:completion:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_222E49000, log, OS_LOG_TYPE_ERROR, "Attempt to add too many content providing subviews", v1, 2u);
}

- (void)_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:(void *)a1 completionHandler:.cold.1(void *a1)
{
  id v1 = a1;
  uint64_t v2 = WGStringFromWidgetLifeCycleSequenceState(4uLL);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_222E49000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);
}

- (void)_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:(void *)a1 completionHandler:.cold.2(void *a1)
{
  id v1 = a1;
  uint64_t v2 = WGStringFromWidgetLifeCycleSequenceState(3uLL);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_222E49000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);
}

- (void)_disconnectRemoteViewControllerForReason:(uint64_t)a3 sequence:(uint64_t)a4 coalesce:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_disconnectRemoteViewControllerForReason:(void *)a1 sequence:coalesce:completionHandler:.cold.2(void *a1)
{
  id v1 = a1;
  uint64_t v2 = WGStringFromWidgetLifeCycleSequenceState(0);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_222E49000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);
}

- (void)_disconnectRemoteViewControllerForReason:(void *)a1 sequence:coalesce:completionHandler:.cold.3(void *a1)
{
  id v1 = a1;
  uint64_t v2 = WGStringFromWidgetLifeCycleSequenceState(6uLL);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_222E49000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);
}

- (void)_scheduleDisconnectionTimerForSequence:(void *)a1 endTransitionBlock:(void *)a2 completion:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 widgetIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_222E49000, v5, v6, "%{public}@: Attempting to schedule disconnection timer on non-main thread!", v7, v8, v9, v10, v11);
}

- (void)_disconnectionTimerDidFire:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 widgetIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_222E49000, v5, v6, "%{public}@: Timer fired on non-main thread!", v7, v8, v9, v10, v11);
}

- (void)_noteOutstandingUpdateRequestForSequence:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_222E49000, log, OS_LOG_TYPE_DEBUG, "No sequence", v1, 2u);
}

- (void)_noteOutstandingUpdateRequestForSequence:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_222E49000, v0, OS_LOG_TYPE_DEBUG, "Overwriting existing update request completion handler for sequence %{public}@", v1, 0xCu);
}

@end