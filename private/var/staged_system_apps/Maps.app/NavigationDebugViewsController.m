@interface NavigationDebugViewsController
- (BOOL)_isSimulating;
- (BOOL)automaticallyHideTraceControls;
- (BOOL)isShowingTraceControls;
- (BOOL)showTraceControlsForStaleLocations;
- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5;
- (MKMapView)mapView;
- (MNTracePlayer)tracePlayer;
- (NSString)tracePath;
- (NSTimer)hideTraceControlTimer;
- (NavigationDebugViewsController)init;
- (NavigationDebugViewsController)initWithDelegate:(id)a3;
- (UIView)debugControlsView;
- (double)debugViewHeight;
- (id)primaryViewControllerForCollapsingSplitViewController:(id)a3;
- (id)primaryViewControllerForExpandingSplitViewController:(id)a3;
- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4;
- (unint64_t)splitViewControllerSupportedInterfaceOrientations:(id)a3;
- (void)_addTraceBookmark;
- (void)_dismissModalCameraSnapshotPickerIfNeededAnimated:(BOOL)a3;
- (void)_done;
- (void)_longPressBookmarkGesture:(id)a3;
- (void)_presentCameraSnapshotPickerModallyIfNeededAnimated:(BOOL)a3;
- (void)_setUpCameraSnapshotPickerVCFromWindow:(id)a3;
- (void)_sliderDidEndEditing;
- (void)_threeFingerTapBookmarkGesture:(id)a3;
- (void)addDebugViewsToView:(id)a3 layoutGuide:(id)a4 mapView:(id)a5 modalPresentingViewController:(id)a6;
- (void)cameraSnapshotPicker:(id)a3 didSelectCameraSnapshot:(id)a4;
- (void)dealloc;
- (void)didManuallyAddDebugViews;
- (void)didManuallyRemoveDebugViews;
- (void)hideTraceControls;
- (void)hideTraceControlsAnimated:(BOOL)a3;
- (void)navigationService:(id)a3 didFinishLoadingTrace:(id)a4;
- (void)navigationService:(id)a3 didPlayTracePosition:(double)a4;
- (void)navigationService:(id)a3 didRecordTraceBookmarkWithID:(unint64_t)a4;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didSeekToTracePosition:(double)a4;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationServiceDidPauseTrace:(id)a3;
- (void)navigationServiceDidResumeTrace:(id)a3;
- (void)prepareToRunNavigation;
- (void)removeDebugViewsFromView:(id)a3;
- (void)resetHideTraceControlsTimer;
- (void)resetTracePlayer;
- (void)setAutomaticallyHideTraceControls:(BOOL)a3;
- (void)setDebugControlsView:(id)a3;
- (void)setHideTraceControlTimer:(id)a3;
- (void)setMapView:(id)a3;
- (void)setShowTraceControlsForStaleLocations:(BOOL)a3;
- (void)setUpCameraSnapshotPickerVCFromViewController:(id)a3;
- (void)showTraceControls;
- (void)toggleCameraSnapshotPickerVisibility;
- (void)traceControlView:(id)a3 setPlaySpeed:(double)a4;
- (void)traceControlView:(id)a3 setPlaying:(BOOL)a4;
- (void)traceControlViewJumpedBack:(id)a3;
- (void)traceControlViewPressedBookmarksButton:(id)a3;
- (void)traceControlViewPressedSaveCameraSnapshotButton:(id)a3;
- (void)traceControlViewPressedViewCameraSnapshotsButton:(id)a3;
- (void)tracePlayer:(id)a3 didPlayAtTime:(double)a4;
- (void)tracePlayer:(id)a3 didSeekToTime:(double)a4 fromTime:(double)a5 location:(id)a6;
- (void)tracePlayerDidPause:(id)a3;
- (void)tracePlayerDidResume:(id)a3;
- (void)tracePlayerDidStart:(id)a3;
- (void)tracePlayerDidStop:(id)a3;
- (void)traceSliderView:(id)a3 editingEndedAtTime:(double)a4;
- (void)traceSliderViewEditingDidBegin:(id)a3;
@end

@implementation NavigationDebugViewsController

- (NavigationDebugViewsController)init
{
  return [(NavigationDebugViewsController *)self initWithDelegate:0];
}

- (NavigationDebugViewsController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NavigationDebugViewsController;
  v5 = [(NavigationDebugViewsController *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    [(MNTracePlayer *)v6->_tracePlayer registerObserver:v6];
    uint64_t v7 = [(MNTracePlayer *)v6->_tracePlayer trace];
    trace = v6->_trace;
    v6->_trace = (MNTrace *)v7;

    v9 = (MNTraceBookmarkRecorder *)[objc_alloc((Class)MNTraceBookmarkRecorder) initWithTrace:v6->_trace];
    bookmarkRecorder = v6->_bookmarkRecorder;
    v6->_bookmarkRecorder = v9;

    [(NavigationDebugViewsController *)v6 setAutomaticallyHideTraceControls:1];
    v6->_showTraceControlsForStaleLocations = 1;
    v11 = +[MNNavigationService sharedService];
    [v11 registerObserver:v6];
    v12 = v6;
  }
  return v6;
}

- (void)dealloc
{
  [(NavigationDebugViewsController *)self resetTracePlayer];
  [(TraceControlView *)self->_traceControlView setDelegate:0];
  [(TraceSliderView *)self->_traceSliderView setDelegate:0];
  [(UILongPressGestureRecognizer *)self->_bookmarkGestureRecognizer setDelegate:0];
  [(NSTimer *)self->_hideTraceControlTimer invalidate];
  v3 = +[MNNavigationService sharedService];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NavigationDebugViewsController;
  [(NavigationDebugViewsController *)&v4 dealloc];
}

- (void)prepareToRunNavigation
{
  [(TraceControlView *)self->_traceControlView setIsPlaying:1];
  traceControlView = self->_traceControlView;

  [(TraceControlView *)traceControlView setPlaySpeed:1.0];
}

- (void)showTraceControls
{
  if (!self->_traceControlsAreShowing)
  {
    self->_traceControlsAreShowing = 1;
    traceSliderView = self->_traceSliderView;
    objc_super v4 = +[MNNavigationService sharedService];
    [v4 tracePosition];
    -[TraceSliderView setTraceTime:](traceSliderView, "setTraceTime:");

    v5[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100D15348;
    v6[3] = &unk_1012E5D08;
    v6[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100D15358;
    v5[3] = &unk_1012E7D28;
    +[UIView animateWithDuration:v6 animations:v5 completion:0.3];
  }
}

- (void)resetTracePlayer
{
  [(MNTracePlayer *)self->_tracePlayer unregisterObserver:self];
  tracePlayer = self->_tracePlayer;
  self->_tracePlayer = 0;
}

- (MNTracePlayer)tracePlayer
{
  return self->_tracePlayer;
}

- (void)setAutomaticallyHideTraceControls:(BOOL)a3
{
  if (self->_automaticallyHideTraceControls != a3)
  {
    self->_automaticallyHideTraceControls = a3;
    [(NavigationDebugViewsController *)self resetHideTraceControlsTimer];
  }
}

- (void)resetHideTraceControlsTimer
{
  hideTraceControlTimer = self->_hideTraceControlTimer;
  if (hideTraceControlTimer) {
    [(NSTimer *)hideTraceControlTimer invalidate];
  }
  if (self->_automaticallyHideTraceControls && self->_traceControlsAreShowing)
  {
    id v4 = +[NSTimer scheduledTimerWithTimeInterval:self target:"hideTraceControls" selector:0 userInfo:0 repeats:5.0];
    [(NavigationDebugViewsController *)self setHideTraceControlTimer:v4];
  }
}

- (void)hideTraceControls
{
}

- (void)hideTraceControlsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  hideTraceControlTimer = self->_hideTraceControlTimer;
  if (hideTraceControlTimer)
  {
    [(NSTimer *)hideTraceControlTimer invalidate];
    [(NavigationDebugViewsController *)self setHideTraceControlTimer:0];
  }
  if (![(TraceSliderView *)self->_traceSliderView isSliderEditing] && self->_traceControlsAreShowing)
  {
    self->_traceControlsAreShowing = 0;
    double v6 = 0.3;
    if (!v3) {
      double v6 = 0.0;
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100D15534;
    v7[3] = &unk_1012E5D08;
    v7[4] = self;
    +[UIView animateWithDuration:v7 animations:v6];
  }
}

- (BOOL)_isSimulating
{
  v2 = +[MNNavigationService sharedService];
  BOOL v3 = ([v2 isNavigatingFromTrace] & 1) == 0
    && [v2 simulationType]
    && [v2 simulationType] != (id)-1;

  return v3;
}

- (double)debugViewHeight
{
  if (!self->_debugViewsWereAdded) {
    return 0.0;
  }
  -[UIView systemLayoutSizeFittingSize:](self->_debugControlsView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  return v2;
}

- (UIView)debugControlsView
{
  debugControlsView = self->_debugControlsView;
  if (!debugControlsView)
  {
    id v4 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
    v9 = self->_debugControlsView;
    self->_debugControlsView = v8;

    v10 = +[UIColor colorWithWhite:0.0 alpha:0.5];
    [(UIView *)self->_debugControlsView setBackgroundColor:v10];

    v11 = [(UIView *)self->_debugControlsView layer];
    [v11 setCornerRadius:10.0];

    BOOL v12 = [(NavigationDebugViewsController *)self _isSimulating];
    v13 = +[MNNavigationService sharedService];
    if (([v13 isNavigatingFromTrace] & 1) != 0 || v12)
    {
      objc_super v14 = -[TraceControlView initWithFrame:]([TraceControlView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      traceControlView = self->_traceControlView;
      self->_traceControlView = v14;

      [(TraceControlView *)self->_traceControlView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(TraceControlView *)self->_traceControlView setDelegate:self];
      GEOConfigGetDouble();
      if (v16 > 0.0) {
        -[TraceControlView setPlaySpeed:](self->_traceControlView, "setPlaySpeed:");
      }
      [(TraceControlView *)self->_traceControlView setIsPlaying:1];
      self->_isSimulationPlaying = v12;
      [(TraceControlView *)self->_traceControlView setUseDistanceAsPosition:v12];
      [(TraceControlView *)self->_traceControlView setPosition:0.0];
      [(UIView *)self->_debugControlsView addSubview:self->_traceControlView];
      v17 = -[TraceSliderView initWithFrame:]([TraceSliderView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      traceSliderView = self->_traceSliderView;
      self->_traceSliderView = v17;

      if (v12)
      {
        v19 = [v13 route];
        [v19 distance];
        -[TraceSliderView setTraceLength:](self->_traceSliderView, "setTraceLength:");
      }
      else
      {
        [v13 traceDuration];
        -[TraceSliderView setTraceLength:](self->_traceSliderView, "setTraceLength:");
      }
      [(TraceControlView *)self->_traceControlView playSpeed];
      -[TraceSliderView setPlaySpeed:](self->_traceSliderView, "setPlaySpeed:");
      [(TraceSliderView *)self->_traceSliderView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(TraceSliderView *)self->_traceSliderView setDelegate:self];
      LODWORD(v20) = 1148846080;
      [(TraceSliderView *)self->_traceSliderView setContentHuggingPriority:1 forAxis:v20];
      LODWORD(v21) = 1148846080;
      [(TraceSliderView *)self->_traceSliderView setContentCompressionResistancePriority:1 forAxis:v21];
      v22 = self->_traceSliderView;
      [v13 tracePosition];
      -[TraceSliderView setTraceTime:](v22, "setTraceTime:");
      [(UIView *)self->_debugControlsView addSubview:self->_traceSliderView];
      v45 = [(TraceSliderView *)self->_traceSliderView topAnchor];
      v44 = [(UIView *)self->_debugControlsView topAnchor];
      v43 = [v45 constraintEqualToAnchor:v44 constant:8.0];
      v46[0] = v43;
      v42 = [(TraceSliderView *)self->_traceSliderView leadingAnchor];
      v41 = [(UIView *)self->_debugControlsView leadingAnchor];
      v40 = [v42 constraintEqualToAnchor:v41];
      v46[1] = v40;
      v39 = [(TraceSliderView *)self->_traceSliderView trailingAnchor];
      v38 = [(UIView *)self->_debugControlsView trailingAnchor];
      v37 = [v39 constraintEqualToAnchor:v38];
      v46[2] = v37;
      v36 = [(TraceControlView *)self->_traceControlView bottomAnchor];
      v35 = [(UIView *)self->_debugControlsView bottomAnchor];
      v34 = [v36 constraintEqualToAnchor:v35 constant:-8.0];
      v46[3] = v34;
      v33 = [(TraceControlView *)self->_traceControlView leadingAnchor];
      v32 = [(UIView *)self->_debugControlsView leadingAnchor];
      v23 = [v33 constraintEqualToAnchor:v32];
      v46[4] = v23;
      v24 = [(TraceControlView *)self->_traceControlView trailingAnchor];
      v25 = [(UIView *)self->_debugControlsView trailingAnchor];
      v26 = [v24 constraintEqualToAnchor:v25];
      v46[5] = v26;
      v27 = [(TraceSliderView *)self->_traceSliderView bottomAnchor];
      v28 = [(TraceControlView *)self->_traceControlView topAnchor];
      v29 = [v27 constraintEqualToAnchor:v28 constant:-4.0];
      v46[6] = v29;
      v30 = +[NSArray arrayWithObjects:v46 count:7];
      +[NSLayoutConstraint activateConstraints:v30];
    }
    debugControlsView = self->_debugControlsView;
  }

  return debugControlsView;
}

- (void)addDebugViewsToView:(id)a3 layoutGuide:(id)a4 mapView:(id)a5 modalPresentingViewController:(id)a6
{
  id v10 = a3;
  id v29 = a6;
  id v28 = a5;
  id v11 = a4;
  BOOL v12 = [(NavigationDebugViewsController *)self debugControlsView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v30 = v12;
  v31 = v10;
  [v10 addSubview:v12];
  v27 = [(UIView *)self->_debugControlsView leadingAnchor];
  v13 = [v11 leadingAnchor];
  objc_super v14 = [v27 constraintEqualToAnchor:v13];
  v32[0] = v14;
  v15 = [(UIView *)self->_debugControlsView trailingAnchor];
  double v16 = [v11 trailingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v32[1] = v17;
  v18 = [(UIView *)self->_debugControlsView bottomAnchor];
  v19 = [v11 bottomAnchor];

  double v20 = [v18 constraintEqualToAnchor:v19];
  v32[2] = v20;
  double v21 = +[NSArray arrayWithObjects:v32 count:3];
  +[NSLayoutConstraint activateConstraints:v21];

  bookmarkGestureRecognizer = self->_bookmarkGestureRecognizer;
  if (!bookmarkGestureRecognizer)
  {
    v23 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_longPressBookmarkGesture:"];
    v24 = self->_bookmarkGestureRecognizer;
    self->_bookmarkGestureRecognizer = v23;

    [(UILongPressGestureRecognizer *)self->_bookmarkGestureRecognizer setAllowableMovement:100.0];
    [(UILongPressGestureRecognizer *)self->_bookmarkGestureRecognizer setDelegate:self];
    [(UILongPressGestureRecognizer *)self->_bookmarkGestureRecognizer setMinimumPressDuration:2.0];
    v25 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_threeFingerTapBookmarkGesture:"];
    oldBookmarkGestureRecognizer = self->_oldBookmarkGestureRecognizer;
    self->_oldBookmarkGestureRecognizer = v25;

    [(UITapGestureRecognizer *)self->_oldBookmarkGestureRecognizer setNumberOfTouchesRequired:3];
    bookmarkGestureRecognizer = self->_bookmarkGestureRecognizer;
  }
  [v31 addGestureRecognizer:bookmarkGestureRecognizer];
  [v31 addGestureRecognizer:self->_oldBookmarkGestureRecognizer];
  [(NavigationDebugViewsController *)self setMapView:v28];

  [(NavigationDebugViewsController *)self setUpCameraSnapshotPickerVCFromViewController:v29];
  [(NavigationDebugViewsController *)self didManuallyAddDebugViews];
  if ([(NavigationDebugViewsController *)self automaticallyHideTraceControls]) {
    [(NavigationDebugViewsController *)self hideTraceControls];
  }
}

- (void)didManuallyAddDebugViews
{
  *(_WORD *)&self->_traceControlsAreShowing = 257;
}

- (void)setUpCameraSnapshotPickerVCFromViewController:(id)a3
{
  id obj = a3;
  id v4 = [[NavigationCameraSnapshotPickerViewController alloc] initWithDelegate:self];
  cameraSnapshotPickerVC = self->_cameraSnapshotPickerVC;
  self->_cameraSnapshotPickerVC = v4;

  objc_storeWeak((id *)&self->_modalPresentingViewController, obj);
}

- (void)_setUpCameraSnapshotPickerVCFromWindow:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    double v6 = [v4 rootViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 rootViewController];
      nonsplitRootViewController = self->_nonsplitRootViewController;
      self->_nonsplitRootViewController = v8;

      id v10 = objc_alloc_init(NavigationDebugSplitViewController);
      splitViewController = self->_splitViewController;
      self->_splitViewController = v10;

      BOOL v12 = [[NavigationCameraSnapshotPickerViewController alloc] initWithDelegate:self];
      cameraSnapshotPickerVC = self->_cameraSnapshotPickerVC;
      self->_cameraSnapshotPickerVC = v12;

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v14 = [(UINavigationController *)self->_nonsplitRootViewController topViewController];
        p_mainViewController = &self->_mainViewController;
        objc_storeWeak((id *)&self->_mainViewController, v14);
      }
      else
      {
        p_mainViewController = &self->_mainViewController;
        objc_storeWeak((id *)&self->_mainViewController, self->_nonsplitRootViewController);
      }
      v18[0] = self->_cameraSnapshotPickerVC;
      id WeakRetained = objc_loadWeakRetained((id *)p_mainViewController);
      v18[1] = WeakRetained;
      v17 = +[NSArray arrayWithObjects:v18 count:2];
      [(NavigationDebugSplitViewController *)self->_splitViewController setViewControllers:v17];

      [(NavigationDebugSplitViewController *)self->_splitViewController setDelegate:self];
      [(NavigationDebugSplitViewController *)self->_splitViewController setPresentsWithGesture:0];
      [(NavigationDebugSplitViewController *)self->_splitViewController setPreferredDisplayMode:1];
      [(NavigationDebugSplitViewController *)self->_splitViewController setPreferredPrimaryColumnWidthFraction:0.370000005];
      [v5 setRootViewController:self->_splitViewController];
      objc_storeWeak((id *)&self->_window, v5);
    }
  }
}

- (void)removeDebugViewsFromView:(id)a3
{
  id v4 = a3;
  [(NavigationDebugViewsController *)self hideTraceControls];
  [(UIView *)self->_debugControlsView removeFromSuperview];
  [v4 removeGestureRecognizer:self->_bookmarkGestureRecognizer];
  [v4 removeGestureRecognizer:self->_oldBookmarkGestureRecognizer];

  [(NavigationDebugViewsController *)self didManuallyRemoveDebugViews];
}

- (void)didManuallyRemoveDebugViews
{
  [(NSTimer *)self->_hideTraceControlTimer invalidate];
  [(NavigationDebugViewsController *)self setHideTraceControlTimer:0];
  if (self->_nonsplitRootViewController)
  {
    if (self->_splitViewController)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_window);

      if (WeakRetained)
      {
        nonsplitRootViewController = self->_nonsplitRootViewController;
        id v5 = objc_loadWeakRetained((id *)&self->_mainViewController);
        [(UINavigationController *)nonsplitRootViewController pushViewController:v5 animated:0];

        double v6 = self->_nonsplitRootViewController;
        id v7 = objc_loadWeakRetained((id *)&self->_window);
        [v7 setRootViewController:v6];

        v8 = self->_nonsplitRootViewController;
        self->_nonsplitRootViewController = 0;

        splitViewController = self->_splitViewController;
        self->_splitViewController = 0;

        objc_storeWeak((id *)&self->_mainViewController, 0);
        cameraSnapshotPickerVC = self->_cameraSnapshotPickerVC;
        self->_cameraSnapshotPickerVC = 0;
      }
    }
  }
  traceControlView = self->_traceControlView;
  self->_traceControlView = 0;

  traceSliderView = self->_traceSliderView;
  self->_traceSliderView = 0;

  debugControlsView = self->_debugControlsView;
  self->_debugControlsView = 0;

  [(TraceBookmarkSelector *)self->_traceBookmarkSelector setDelegate:0];
  traceBookmarkSelector = self->_traceBookmarkSelector;
  self->_traceBookmarkSelector = 0;

  [(NavigationDebugViewsController *)self setMapView:0];
  *(_WORD *)&self->_traceControlsAreShowing = 0;
}

- (void)_longPressBookmarkGesture:(id)a3
{
  if ([a3 state] == (id)1)
  {
    [(NavigationDebugViewsController *)self _addTraceBookmark];
  }
}

- (void)_threeFingerTapBookmarkGesture:(id)a3
{
}

- (void)_addTraceBookmark
{
  id v4 = +[MNNavigationService sharedService];
  if (+[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground])
  {
    double v2 = (UIImage *)_UICreateScreenUIImage();
    BOOL v3 = UIImagePNGRepresentation(v2);
    [v4 recordTraceBookmarkAtCurrentPositionWthScreenshotData:v3];
  }
}

- (void)tracePlayerDidStart:(id)a3
{
  if (self->_debugViewsWereAdded) {
    [(NavigationDebugViewsController *)self showTraceControls];
  }
}

- (void)tracePlayerDidStop:(id)a3
{
  if (self->_debugViewsWereAdded) {
    [(NavigationDebugViewsController *)self hideTraceControls];
  }
}

- (void)tracePlayerDidPause:(id)a3
{
  id v4 = a3;
  if (self->_debugViewsWereAdded)
  {
    id v11 = v4;
    traceControlView = self->_traceControlView;
    double v6 = [(NavigationDebugViewsController *)self tracePlayer];
    if ([v6 isPlaying])
    {
      id v7 = [(NavigationDebugViewsController *)self tracePlayer];
      -[TraceControlView setIsPlaying:](traceControlView, "setIsPlaying:", [v7 isPaused] ^ 1);
    }
    else
    {
      [(TraceControlView *)traceControlView setIsPlaying:0];
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    id v4 = v11;
    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 navigationDebugViewsTracePlaybackDidPause:self];

      id v4 = v11;
    }
  }
}

- (void)tracePlayerDidResume:(id)a3
{
  id v4 = a3;
  if (self->_debugViewsWereAdded)
  {
    id v11 = v4;
    traceControlView = self->_traceControlView;
    double v6 = [(NavigationDebugViewsController *)self tracePlayer];
    if ([v6 isPlaying])
    {
      id v7 = [(NavigationDebugViewsController *)self tracePlayer];
      -[TraceControlView setIsPlaying:](traceControlView, "setIsPlaying:", [v7 isPaused] ^ 1);
    }
    else
    {
      [(TraceControlView *)traceControlView setIsPlaying:0];
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    id v4 = v11;
    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 navigationDebugViewsTracePlaybackDidResume:self];

      id v4 = v11;
    }
  }
}

- (void)tracePlayer:(id)a3 didSeekToTime:(double)a4 fromTime:(double)a5 location:(id)a6
{
  id v13 = a3;
  id v9 = a6;
  if (self->_debugViewsWereAdded)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained navigationDebugViewsTracePlaybackDidSeek:self];

    if (self->_shouldUpdateLocationPuck)
    {
      puckLocation = self->_puckLocation;
      [(TraceControlView *)self->_traceControlView setPosition:a4];
      [(TraceSliderView *)self->_traceSliderView setTraceTime:0 animated:a4];
      if (puckLocation)
      {
        BOOL v12 = +[MKLocationManager sharedLocationManager];
        [v12 pushLocation:self->_puckLocation];

        self->_shouldUpdateLocationPuck = 0;
      }
    }
    else
    {
      [(TraceControlView *)self->_traceControlView setPosition:a4];
      [(TraceSliderView *)self->_traceSliderView setTraceTime:0 animated:a4];
    }
  }
}

- (void)tracePlayer:(id)a3 didPlayAtTime:(double)a4
{
  if (self->_debugViewsWereAdded)
  {
    -[TraceSliderView setTraceTime:animated:](self->_traceSliderView, "setTraceTime:animated:", 1);
    traceControlView = self->_traceControlView;
    [(TraceControlView *)traceControlView setPosition:a4];
  }
}

- (void)traceControlView:(id)a3 setPlaying:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = +[MNNavigationService sharedService];
  if ([(NavigationDebugViewsController *)self _isSimulating])
  {
    self->_isSimulationPlaying = v4;
    double v6 = 0.0;
    if (v4) {
      [(TraceSliderView *)self->_traceSliderView playSpeed];
    }
    [v7 setSimulationSpeedMultiplier:v6];
  }
  else
  {
    [v7 setTraceIsPlaying:v4];
  }
  [(NavigationDebugViewsController *)self resetHideTraceControlsTimer];
}

- (void)traceControlViewJumpedBack:(id)a3
{
  BOOL v4 = [(NavigationDebugViewsController *)self tracePlayer];
  [v4 skipByTimeInterval:-30.0];

  [(NavigationDebugViewsController *)self resetHideTraceControlsTimer];
}

- (void)traceControlView:(id)a3 setPlaySpeed:(double)a4
{
  id v7 = +[MNNavigationService sharedService];
  if ([(NavigationDebugViewsController *)self _isSimulating]) {
    [v7 setSimulationSpeedMultiplier:a4];
  }
  else {
    [v7 setTracePlaybackSpeed:a4];
  }
  [(TraceSliderView *)self->_traceSliderView setPlaySpeed:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationDebugViewsTracePlaybackSpeedDidChange:self speedMultiplier:a4];

  [(NavigationDebugViewsController *)self resetHideTraceControlsTimer];
}

- (void)traceControlViewPressedBookmarksButton:(id)a3
{
  id v12 = a3;
  traceBookmarkSelector = self->_traceBookmarkSelector;
  if (!traceBookmarkSelector)
  {
    id v5 = [[TraceBookmarkSelector alloc] initWithStyle:0];
    double v6 = self->_traceBookmarkSelector;
    self->_traceBookmarkSelector = v5;

    [(TraceBookmarkSelector *)self->_traceBookmarkSelector setModalPresentationStyle:2];
    [(TraceBookmarkSelector *)self->_traceBookmarkSelector setDelegate:self];
    traceBookmarkSelector = self->_traceBookmarkSelector;
  }
  [(TraceBookmarkSelector *)traceBookmarkSelector reloadBookmarks];
  id v7 = [objc_alloc((Class)UINavigationController) initWithRootViewController:self->_traceBookmarkSelector];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modalPresentingViewController);
  id v9 = WeakRetained;
  if (WeakRetained) {
    id v10 = WeakRetained;
  }
  else {
    id v10 = objc_loadWeakRetained((id *)&self->_mainViewController);
  }
  id v11 = v10;

  [v11 _maps_topMostPresentViewController:v7 animated:1 completion:0];
  [(NavigationDebugViewsController *)self resetHideTraceControlsTimer];
}

- (void)traceControlViewPressedSaveCameraSnapshotButton:(id)a3
{
  id v4 = a3;
  id v5 = [(NavigationDebugViewsController *)self tracePath];

  if (!v5) {
    goto LABEL_25;
  }
  double v6 = [(NavigationDebugViewsController *)self mapView];
  id v7 = [v6 _mapLayer];

  if (!v7) {
    goto LABEL_25;
  }
  v8 = [(NavigationDebugViewsController *)self mapView];
  id v9 = [v8 _mapLayer];

  if (!v9) {
    goto LABEL_25;
  }
  id v10 = +[MKMapCamera camera];
  id v11 = [(NavigationDebugViewsController *)self mapView];
  [v11 centerCoordinate];
  [v10 setCenterCoordinate:];

  id v12 = [(NavigationDebugViewsController *)self mapView];
  id v13 = [v12 _mapLayer];
  [v13 yaw];
  [v10 setHeading:];

  objc_super v14 = [(NavigationDebugViewsController *)self mapView];
  v15 = [v14 _mapLayer];
  [v15 pitch];
  [v10 setPitch:];

  double v16 = [(NavigationDebugViewsController *)self mapView];
  v17 = [v16 _mapLayer];
  [v17 altitude];
  [v10 setAltitude:];

  v18 = [(NavigationDebugViewsController *)self tracePlayer];
  [v18 duration];
  double v19 = 0.0;
  double v20 = 0.0;
  if (v21 > 0.0)
  {
    v22 = [(NavigationDebugViewsController *)self tracePlayer];
    [v22 position];
    double v24 = v23;
    v25 = [(NavigationDebugViewsController *)self tracePlayer];
    [v25 duration];
    double v20 = v24 / v26;
  }
  double v27 = fmin(v20, 1.0);
  if (v20 <= 0.0) {
    double v28 = 0.0;
  }
  else {
    double v28 = v27;
  }
  id v29 = objc_alloc((Class)MNLocation);
  v30 = [(NavigationDebugViewsController *)self mapView];
  v31 = [v30 userLocation];
  v32 = [v31 location];
  id v33 = [v29 initWithRawLocation:v32];

  v34 = [[NavigationCameraSnapshot alloc] initWithCamera:v10 tracePlaybackTimeFraction:v33 puckLocation:v28];
  v35 = [(NavigationDebugViewsController *)self mapView];
  v36 = [v35 snapshotViewAfterScreenUpdates:0];

  v37 = [(NavigationDebugViewsController *)self mapView];
  v38 = [v37 window];

  v39 = [(NavigationDebugViewsController *)self mapView];
  [v39 bounds];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  v48 = [(NavigationDebugViewsController *)self mapView];
  [v38 convertRect:v48 fromView:v41, v43, v45, v47];
  [v36 setFrame:];

  [v38 addSubview:v36];
  [v36 bounds];
  double v50 = v49;
  if (v49 > 0.0)
  {
    v39 = [v4 viewCameraSnapshotsButton];
    [v39 bounds];
    double v52 = v51;
    [v36 bounds];
    double v19 = v52 / (v53 + v53);
  }
  [v36 bounds];
  double v55 = v54;
  if (v54 <= 0.0)
  {
    double v59 = 0.0;
  }
  else
  {
    v48 = [v4 viewCameraSnapshotsButton];
    [v48 bounds];
    double v57 = v56;
    [v36 bounds];
    double v59 = v57 / (v58 + v58);
  }
  [v36 bounds];
  if (v19 >= v59)
  {
    double v62 = 0.0;
    if (v60 > 0.0)
    {
      v63 = [v4 viewCameraSnapshotsButton];
      [v63 bounds];
      double v65 = v67;
      [v36 bounds];
      double v66 = v68;
      goto LABEL_19;
    }
  }
  else
  {
    double v62 = 0.0;
    if (v61 > 0.0)
    {
      v63 = [v4 viewCameraSnapshotsButton];
      [v63 bounds];
      double v65 = v64;
      [v36 bounds];
LABEL_19:
      double v62 = v65 / (v66 + v66);
    }
  }
  if (v55 > 0.0) {

  }
  if (v50 > 0.0) {
  v76[0] = _NSConcreteStackBlock;
  }
  v76[1] = 3221225472;
  v76[2] = sub_100D16E1C;
  v76[3] = &unk_1012EB038;
  id v77 = v36;
  id v78 = v38;
  id v79 = v4;
  double v80 = v62;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100D16F4C;
  v72[3] = &unk_101319950;
  id v73 = v77;
  v74 = v34;
  v75 = self;
  v69 = v34;
  id v70 = v77;
  id v71 = v38;
  +[UIView animateWithDuration:0x20000 delay:v76 options:v72 animations:0.3 completion:0.0];

LABEL_25:
}

- (void)traceControlViewPressedViewCameraSnapshotsButton:(id)a3
{
}

- (void)traceSliderViewEditingDidBegin:(id)a3
{
  id v6 = +[MNNavigationService sharedService];
  if ([v6 traceIsPlaying])
  {
    self->_shouldResumeTracePlayer = 1;
  }
  else
  {
    BOOL isSimulationPlaying = self->_isSimulationPlaying;
    self->_shouldResumeTracePlayer = isSimulationPlaying;
    id v5 = v6;
    if (!isSimulationPlaying) {
      goto LABEL_5;
    }
  }
  [v6 setTraceIsPlaying:0];
  id v5 = v6;
LABEL_5:
}

- (void)_sliderDidEndEditing
{
  if (self->_shouldResumeTracePlayer)
  {
    BOOL v3 = +[MNNavigationService sharedService];
    [v3 setTraceIsPlaying:1];
  }

  [(NavigationDebugViewsController *)self resetHideTraceControlsTimer];
}

- (void)traceSliderView:(id)a3 editingEndedAtTime:(double)a4
{
  id v17 = +[MNNavigationService sharedService];
  if ([(NavigationDebugViewsController *)self _isSimulating])
  {
    id v7 = [v17 route];
    [v7 distance];
    double v9 = a4 / v8;
    double v10 = 1.0;
    if (a4 / v8 < 1.0)
    {
      id v4 = [v17 route];
      [v4 distance];
      double v12 = 0.0;
      if (a4 / v11 < 0.0) {
        goto LABEL_7;
      }
    }
    id v13 = [v17 route];
    [v13 distance];
    if (a4 / v14 < 1.0)
    {
      v15 = [v17 route];
      [v15 distance];
      double v10 = a4 / v16;
    }
    double v12 = v10;
    if (v9 < 1.0)
    {
LABEL_7:

      double v10 = v12;
    }

    [v17 setSimulationPosition:v10];
  }
  else
  {
    [v17 setTracePosition:a4];
  }
  [(NavigationDebugViewsController *)self _sliderDidEndEditing];
}

- (void)toggleCameraSnapshotPickerVisibility
{
  if ([(NavigationDebugSplitViewController *)self->_splitViewController preferredDisplayMode] == (id)1) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(NavigationDebugSplitViewController *)self->_splitViewController setPreferredDisplayMode:v3];

  [(NavigationDebugViewsController *)self _presentCameraSnapshotPickerModallyIfNeededAnimated:1];
}

- (id)primaryViewControllerForExpandingSplitViewController:(id)a3
{
  id v4 = objc_alloc_init((Class)UIViewController);
  id v9 = v4;
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  [(UINavigationController *)self->_modalCameraSnapshotPickerVC setViewControllers:v5];

  id v6 = [(NavigationCameraSnapshotPickerViewController *)self->_cameraSnapshotPickerVC navigationItem];
  [v6 setLeftBarButtonItem:0];

  cameraSnapshotPickerVC = self->_cameraSnapshotPickerVC;

  return cameraSnapshotPickerVC;
}

- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5
{
  return 1;
}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  -[NavigationDebugViewsController _dismissModalCameraSnapshotPickerIfNeededAnimated:](self, "_dismissModalCameraSnapshotPickerIfNeededAnimated:", 0, a4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);

  return WeakRetained;
}

- (id)primaryViewControllerForCollapsingSplitViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);

  return WeakRetained;
}

- (void)_done
{
  [(NavigationDebugViewsController *)self _dismissModalCameraSnapshotPickerIfNeededAnimated:1];
  splitViewController = self->_splitViewController;

  [(NavigationDebugSplitViewController *)splitViewController setPreferredDisplayMode:1];
}

- (void)_presentCameraSnapshotPickerModallyIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(NavigationDebugViewsController *)self _dismissModalCameraSnapshotPickerIfNeededAnimated:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  if (WeakRetained)
  {
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_modalPresentingViewController);

    if (!v6) {
      return;
    }
  }
  self->_isPresentingModallyPickerVC = 1;
  id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_done"];
  double v8 = [(NavigationCameraSnapshotPickerViewController *)self->_cameraSnapshotPickerVC navigationItem];
  [v8 setLeftBarButtonItem:v7];

  id v9 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_cameraSnapshotPickerVC];
  modalCameraSnapshotPickerVC = self->_modalCameraSnapshotPickerVC;
  self->_modalCameraSnapshotPickerVC = v9;

  double v11 = [(NavigationDebugViewsController *)self tracePlayer];
  [v11 pause];

  id v12 = objc_loadWeakRetained((id *)&self->_modalPresentingViewController);
  id v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = objc_loadWeakRetained((id *)&self->_mainViewController);
  }
  id v18 = v14;

  id v15 = objc_loadWeakRetained((id *)&self->_modalPresentingViewController);
  if (v18 == v15)
  {

    id v17 = v18;
  }
  else
  {
    if (![(NavigationDebugSplitViewController *)self->_splitViewController isCollapsed])
    {

      goto LABEL_14;
    }
    id v16 = [(NavigationDebugSplitViewController *)self->_splitViewController preferredDisplayMode];

    id v17 = v18;
    if (v16 == (id)1) {
      goto LABEL_15;
    }
  }
  id v18 = v17;
  [v17 presentViewController:self->_modalCameraSnapshotPickerVC animated:v3 completion:0];
LABEL_14:
  id v17 = v18;
LABEL_15:
}

- (void)_dismissModalCameraSnapshotPickerIfNeededAnimated:(BOOL)a3
{
  if (self->_isPresentingModallyPickerVC)
  {
    modalCameraSnapshotPickerVC = self->_modalCameraSnapshotPickerVC;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100D17624;
    v4[3] = &unk_1012E5D08;
    v4[4] = self;
    [(UINavigationController *)modalCameraSnapshotPickerVC dismissViewControllerAnimated:a3 completion:v4];
  }
}

- (unint64_t)splitViewControllerSupportedInterfaceOrientations:(id)a3
{
  return 30;
}

- (NSString)tracePath
{
  trace = self->_trace;
  if (trace)
  {
    BOOL v3 = [(MNTrace *)trace tracePath];
  }
  else
  {
    id v4 = +[MNNavigationService sharedService];
    BOOL v3 = [v4 tracePath];
  }

  return (NSString *)v3;
}

- (void)cameraSnapshotPicker:(id)a3 didSelectCameraSnapshot:(id)a4
{
  id v5 = a4;
  id v6 = [(NavigationDebugViewsController *)self tracePlayer];
  [v6 pause];

  id v7 = [v5 puckLocation];
  puckLocation = self->_puckLocation;
  self->_puckLocation = v7;

  if (self->_puckLocation) {
    self->_shouldUpdateLocationPuck = 1;
  }
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_100D1784C;
  id v18 = &unk_1012E5D58;
  double v19 = self;
  id v9 = v5;
  id v20 = v9;
  +[UIView animateWithDuration:0x20000 delay:&v15 options:0 animations:0.33 completion:0.0];
  double v10 = [(NavigationDebugViewsController *)self tracePlayer];
  [v9 tracePlaybackTimeFraction];
  double v12 = v11;
  id v13 = [(NavigationDebugViewsController *)self tracePlayer];
  [v13 duration];
  [v10 jumpToTime:v12 * v14];

  if (self->_isPresentingModallyPickerVC) {
    [(NavigationDebugViewsController *)self _done];
  }
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v10 = a4;
  if ([(NavigationDebugViewsController *)self _isSimulating])
  {
    id v5 = [v10 routeMatch];
    id v6 = [v5 route];
    id v7 = [v10 routeMatch];
    [v6 distanceFromStartToRouteCoordinate:[v7 routeCoordinate]];
    double v9 = v8;

    [(TraceControlView *)self->_traceControlView setPosition:v9];
    [(TraceSliderView *)self->_traceSliderView setTraceTime:0 animated:v9];
  }
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v6 = a4;
  if ([(NavigationDebugViewsController *)self _isSimulating])
  {
    [v6 distance];
    -[TraceSliderView setTraceLength:](self->_traceSliderView, "setTraceLength:");
  }
}

- (void)navigationService:(id)a3 didFinishLoadingTrace:(id)a4
{
  id v5 = +[MNNavigationService sharedService];
  [v5 traceDuration];
  -[TraceSliderView setTraceLength:](self->_traceSliderView, "setTraceLength:");
}

- (void)navigationServiceDidPauseTrace:(id)a3
{
  id v4 = a3;
  if (self->_debugViewsWereAdded)
  {
    traceControlView = self->_traceControlView;
    id v10 = v4;
    id v6 = +[MNNavigationService sharedService];
    -[TraceControlView setIsPlaying:](traceControlView, "setIsPlaying:", [v6 traceIsPlaying]);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    id v4 = v10;
    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 navigationDebugViewsTracePlaybackDidPause:self];

      id v4 = v10;
    }
  }
}

- (void)navigationServiceDidResumeTrace:(id)a3
{
  id v4 = a3;
  if (self->_debugViewsWereAdded)
  {
    traceControlView = self->_traceControlView;
    id v10 = v4;
    id v6 = +[MNNavigationService sharedService];
    -[TraceControlView setIsPlaying:](traceControlView, "setIsPlaying:", [v6 traceIsPlaying]);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    id v4 = v10;
    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 navigationDebugViewsTracePlaybackDidResume:self];

      id v4 = v10;
    }
  }
}

- (void)navigationService:(id)a3 didPlayTracePosition:(double)a4
{
  if (self->_traceControlsAreShowing && self->_debugViewsWereAdded)
  {
    -[TraceSliderView setTraceTime:animated:](self->_traceSliderView, "setTraceTime:animated:", 0);
    traceControlView = self->_traceControlView;
    [(TraceControlView *)traceControlView setPosition:a4];
  }
}

- (void)navigationService:(id)a3 didSeekToTracePosition:(double)a4
{
  id v6 = a3;
  if (self->_traceControlsAreShowing && self->_debugViewsWereAdded)
  {
    id v10 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained navigationDebugViewsTracePlaybackDidSeek:self];

    if (self->_shouldUpdateLocationPuck)
    {
      puckLocation = self->_puckLocation;
      [(TraceControlView *)self->_traceControlView setPosition:a4];
      [(TraceSliderView *)self->_traceSliderView setTraceTime:1 animated:a4];
      id v6 = v10;
      if (puckLocation)
      {
        id v9 = +[MKLocationManager sharedLocationManager];
        [v9 pushLocation:self->_puckLocation];

        id v6 = v10;
        self->_shouldUpdateLocationPuck = 0;
      }
    }
    else
    {
      [(TraceControlView *)self->_traceControlView setPosition:a4];
      [(TraceSliderView *)self->_traceSliderView setTraceTime:1 animated:a4];
      id v6 = v10;
    }
  }
}

- (void)navigationService:(id)a3 didRecordTraceBookmarkWithID:(unint64_t)a4
{
  [(TraceBookmarkSelector *)self->_traceBookmarkSelector reloadBookmarks];
  id v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"TraceBookmarksAlert"];

  if (v6)
  {
    id v8 = +[NSString stringWithFormat:@"Bookmark #%lu saved to trace.", a4];
    id v7 = sub_1003E8104();
    [v7 _maps_presentSimpleAlertWithTitle:@"Bookmark Added" message:v8 dismissalActionTitle:@"OK"];
  }
}

- (NSTimer)hideTraceControlTimer
{
  return self->_hideTraceControlTimer;
}

- (void)setHideTraceControlTimer:(id)a3
{
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (BOOL)automaticallyHideTraceControls
{
  return self->_automaticallyHideTraceControls;
}

- (BOOL)isShowingTraceControls
{
  return self->_traceControlsAreShowing;
}

- (BOOL)showTraceControlsForStaleLocations
{
  return self->_showTraceControlsForStaleLocations;
}

- (void)setShowTraceControlsForStaleLocations:(BOOL)a3
{
  self->_showTraceControlsForStaleLocations = a3;
}

- (void)setDebugControlsView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_puckLocation, 0);
  objc_storeStrong((id *)&self->_modalCameraSnapshotPickerVC, 0);
  objc_destroyWeak((id *)&self->_modalPresentingViewController);
  objc_destroyWeak((id *)&self->_mainViewController);
  objc_storeStrong((id *)&self->_nonsplitRootViewController, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_cameraSnapshotPickerVC, 0);
  objc_storeStrong((id *)&self->_bookmarkRecorder, 0);
  objc_storeStrong((id *)&self->_trace, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_bookmarkGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_oldBookmarkGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_traceBookmarkSelector, 0);
  objc_storeStrong((id *)&self->_debugControlsView, 0);
  objc_storeStrong((id *)&self->_traceSliderView, 0);
  objc_storeStrong((id *)&self->_traceControlView, 0);
  objc_storeStrong((id *)&self->_hideTraceControlTimer, 0);
  objc_storeStrong((id *)&self->_tracePlayer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end