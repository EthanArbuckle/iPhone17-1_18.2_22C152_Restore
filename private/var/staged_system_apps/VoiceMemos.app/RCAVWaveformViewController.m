@interface RCAVWaveformViewController
- ($F24F406B2B787EFB06265DBA3D28CBD5)highlightTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)nextPreviewTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)setHighlightTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange;
- (BOOL)_canShowWhileLocked;
- (BOOL)autocenterCurrentTimeIndicatorAlways;
- (BOOL)clipsTimeMarkersToDuration;
- (BOOL)currentTimeTracksCapturedEndPoint;
- (BOOL)isBlurred;
- (BOOL)isEditMode;
- (BOOL)isOverview;
- (BOOL)isSelectionOverlayVisible;
- (BOOL)isUserInteractionEnabled;
- (CGRect)waveformRectForLayoutBounds:(CGRect)a3;
- (RCAVWaveformViewController)initWithCoder:(id)a3;
- (RCAVWaveformViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (RCAVWaveformViewController)initWithWaveformDataSource:(id)a3 displayStyle:(unint64_t)a4 isOverview:(BOOL)a5 isCompact:(BOOL)a6 delegate:(id)a7;
- (RCAVWaveformViewControllerDelegate)delegate;
- (RCTimeController)activeTimeController;
- (RCWaveformDataSource)waveformDataSource;
- (RCWaveformViewController)waveformViewController;
- (double)currentTime;
- (double)currentTimeIndicatorCoordinate;
- (double)duration;
- (double)maximumSelectionDuration;
- (double)nextPreviewStartTime;
- (double)waveformBottomLineInset;
- (id)_selectionOverlay;
- (unint64_t)_currentTimeDisplayOptions;
- (unint64_t)_currentTimeDisplayOptionsIgnoringSelectionOverlayState:(BOOL)a3;
- (void)_beginShowingSelectionOverlayAndEnableInsertMode:(BOOL)a3;
- (void)_didUpdateDisplayableTime;
- (void)_endShowingSelectionOverlayWithCompletionBlock:(id)a3;
- (void)_forceUpdateCurrentTimeAndDuration;
- (void)_setSelectionOverlayEnabled:(BOOL)a3;
- (void)_setWaveformDataSource:(id)a3 initialTime:(double)a4;
- (void)_updateCurrentTimeForCapturedInputAtTime:(double)a3;
- (void)_updateDisplayableTimesWithBlock:(id)a3;
- (void)_updateInterfaceForTimeControllerState:(int64_t)a3;
- (void)dealloc;
- (void)hidSelectionOverlayWithCompletionBlock:(id)a3;
- (void)reloadWaveformDataSource:(id)a3 withActiveTimeController:(id)a4;
- (void)resetSelectedTimeRangeToFullDuration;
- (void)setActiveTimeController:(id)a3;
- (void)setAutocenterCurrentTimeIndicatorAlways:(BOOL)a3;
- (void)setBlurred:(BOOL)a3;
- (void)setClipsTimeMarkersToDuration:(BOOL)a3;
- (void)setCurrentTime:(double)a3;
- (void)setCurrentTimeTracksCapturedEndPoint:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHighlightTimeRange:(id)a3;
- (void)setIsEditMode:(BOOL)a3;
- (void)setIsOverview:(BOOL)a3;
- (void)setMaximumSelectionDuration:(double)a3;
- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setVisibleTimeRange:(id)a3;
- (void)setWaveformDataSource:(id)a3;
- (void)setWaveformViewController:(id)a3;
- (void)showSelectionOverlayAndEnableInsertMode:(BOOL)a3;
- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5;
- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didJumpTime:(BOOL)a5;
- (void)timeController:(id)a3 didChangeState:(int64_t)a4;
- (void)updateColorStatesSelected:(BOOL)a3 muted:(BOOL)a4 trimMode:(BOOL)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)waveformViewController:(id)a3 didChangeToVisibleTimeRange:(id)a4;
- (void)waveformViewController:(id)a3 didScrubToTime:(double)a4 finished:(BOOL)a5;
- (void)waveformViewControllerDidEndEditingSelectedTimeRange:(id)a3;
@end

@implementation RCAVWaveformViewController

- (RCAVWaveformViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = +[NSAssertionHandler currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"RCAVWaveformViewController.m" lineNumber:54 description:@"initWithNibName:bundle: is not the designated initializer"];

  return self;
}

- (RCAVWaveformViewController)initWithCoder:(id)a3
{
  v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2 object:self file:@"RCAVWaveformViewController.m" lineNumber:60 description:@"this view controller does not support keyed coding.  use the other designated initializer"];

  return [(RCAVWaveformViewController *)self init];
}

- (RCAVWaveformViewController)initWithWaveformDataSource:(id)a3 displayStyle:(unint64_t)a4 isOverview:(BOOL)a5 isCompact:(BOOL)a6 delegate:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a7;
  v28.receiver = self;
  v28.super_class = (Class)RCAVWaveformViewController;
  v14 = [(RCAVWaveformViewController *)&v28 initWithNibName:0 bundle:0];
  v15 = v14;
  if (v14)
  {
    v14->_isOverview = v9;
    v14->_userInteractionEnabled = 1;
    v14->_autocenterCurrentTimeIndicatorAlways = !v14->_isOverview;
    v14->_clipsTimeMarkersToDuration = 1;
    v14->_currentTimeTracksCapturedEndPoint = 1;
    [v12 duration];
    v15->_duration = v16;
    v17 = [[RCWaveformViewController alloc] initWithDisplayStyle:a4 isOverview:v9 isCompact:v8 duration:v15->_duration];
    waveformViewController = v15->_waveformViewController;
    v15->_waveformViewController = v17;

    [(RCWaveformViewController *)v15->_waveformViewController setCurrentTime:0.0];
    [(RCWaveformViewController *)v15->_waveformViewController setCurrentTimeDisplayOptions:v15->_duration > 0.0];
    [(RCWaveformViewController *)v15->_waveformViewController setDelegate:v15];
    [(RCAVWaveformViewController *)v15 addChildViewController:v15->_waveformViewController];
    [(RCAVWaveformViewController *)v15 _setWaveformDataSource:v12 initialTime:0.0];
    [(RCWaveformViewController *)v15->_waveformViewController didMoveToParentViewController:v15];
    objc_storeWeak((id *)&v15->_delegate, v13);
    if (v15->_isOverview)
    {
      v19 = [RCHitTestForwardingView alloc];
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      v23 = -[RCHitTestForwardingView initWithFrame:](v19, "initWithFrame:", CGRectZero.origin.x, y, width, height);
      leftForwardingView = v15->_leftForwardingView;
      v15->_leftForwardingView = v23;

      v25 = -[RCHitTestForwardingView initWithFrame:]([RCHitTestForwardingView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      rightForwardingView = v15->_rightForwardingView;
      v15->_rightForwardingView = v25;
    }
  }

  return v15;
}

- (void)dealloc
{
  [(RCTimeController *)self->_activeTimeController removeTimeObserver:self];
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v8 viewDidLoad];
  v3 = [(RCAVWaveformViewController *)self view];
  objc_super v4 = [(RCAVWaveformViewController *)self waveformViewController];
  v5 = [v4 view];
  [v3 addSubview:v5];

  if (self->_isOverview)
  {
    [(RCHitTestForwardingView *)self->_leftForwardingView setUserInteractionEnabled:1];
    v6 = [(RCAVWaveformViewController *)self _selectionOverlay];
    [(RCHitTestForwardingView *)self->_leftForwardingView setTargetView:v6];

    [(RCHitTestForwardingView *)self->_rightForwardingView setUserInteractionEnabled:1];
    v7 = [(RCAVWaveformViewController *)self _selectionOverlay];
    [(RCHitTestForwardingView *)self->_rightForwardingView setTargetView:v7];
  }
}

- (void)viewDidLayoutSubviews
{
  v3 = [(RCAVWaveformViewController *)self waveformViewController];
  objc_super v4 = [v3 view];
  v5 = [(RCAVWaveformViewController *)self view];
  [v5 bounds];
  [(RCAVWaveformViewController *)self annotatedWaveformRectForLayoutBounds:"annotatedWaveformRectForLayoutBounds:"];
  [v4 setFrame:];

  v20.receiver = self;
  v20.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v20 viewDidLayoutSubviews];
  if (self->_isOverview)
  {
    v6 = [(RCAVWaveformViewController *)self view];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    v15 = [(RCAVWaveformViewController *)self view];
    double v16 = [v15 superview];
    [v16 frame];
    double v18 = v17;

    double v19 = (v18 - v12) * 0.5;
    -[RCHitTestForwardingView setFrame:](self->_leftForwardingView, "setFrame:", v8 - v19, v10, v19, v14);
    -[RCHitTestForwardingView setFrame:](self->_rightForwardingView, "setFrame:", v8 + v12, v10, v19, v14);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v5 viewWillAppear:a3];
  [(RCTimeController *)self->_activeTimeController currentTime];
  -[RCAVWaveformViewController setCurrentTime:](self, "setCurrentTime:");
  [(RCAVWaveformViewController *)self _updateCurrentTimeForCapturedInputAtTime:self->_currentTime];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005F628;
  v4[3] = &unk_100221278;
  v4[4] = self;
  [(RCAVWaveformViewController *)self _updateDisplayableTimesWithBlock:v4];
  [(RCAVWaveformViewController *)self _updateInterfaceForTimeControllerState:[(RCTimeController *)self->_activeTimeController timeControllerState]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v8 viewDidAppear:a3];
  [(RCTimeController *)self->_activeTimeController addTimeObserver:self];
  if (self->_isOverview)
  {
    objc_super v4 = [(RCAVWaveformViewController *)self view];
    objc_super v5 = [v4 superview];
    [v5 addSubview:self->_leftForwardingView];

    v6 = [(RCAVWaveformViewController *)self view];
    double v7 = [v6 superview];
    [v7 addSubview:self->_rightForwardingView];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v4 viewWillDisappear:a3];
  if (self->_isOverview)
  {
    [(RCHitTestForwardingView *)self->_leftForwardingView removeFromSuperview];
    [(RCHitTestForwardingView *)self->_rightForwardingView removeFromSuperview];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v3 viewDidDisappear:a3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)reloadWaveformDataSource:(id)a3 withActiveTimeController:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  [v7 currentTime];
  -[RCAVWaveformViewController _setWaveformDataSource:initialTime:](self, "_setWaveformDataSource:initialTime:", v6);

  [(RCAVWaveformViewController *)self setActiveTimeController:v7];
}

- (void)setActiveTimeController:(id)a3
{
  objc_super v5 = (RCTimeController *)a3;
  p_activeTimeController = &self->_activeTimeController;
  activeTimeController = self->_activeTimeController;
  if (activeTimeController != v5)
  {
    double v11 = v5;
    [(RCTimeController *)activeTimeController removeTimeObserver:self];
    objc_storeStrong((id *)&self->_activeTimeController, a3);
    [(RCTimeController *)*p_activeTimeController addTimeObserver:self];
    objc_super v5 = v11;
    if (v11)
    {
      [(RCTimeController *)v11 currentTime];
      double v9 = v8;
      [(RCAVWaveformViewController *)self currentTime];
      if (v9 != v10) {
        [(RCAVWaveformViewController *)self setCurrentTime:v9];
      }
      [(RCAVWaveformViewController *)self _updateInterfaceForTimeControllerState:[(RCTimeController *)*p_activeTimeController timeControllerState]];
      objc_super v5 = v11;
    }
  }
}

- (void)setIsEditMode:(BOOL)a3
{
  if (self->_isEditMode != a3)
  {
    BOOL v3 = a3;
    self->_isEditMode = a3;
    id v4 = [(RCAVWaveformViewController *)self waveformViewController];
    [v4 setEditing:v3];
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)nextPreviewTimeRange
{
  if (self->_selectionOverlayVisible)
  {
    [(RCAVWaveformViewController *)self selectedTimeRange];
  }
  else
  {
    double v2 = RCTimeRangeEverything[0];
    double v3 = RCTimeRangeEverything[1];
  }
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setVisibleTimeRange:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange
{
  [(RCWaveformViewController *)self->_waveformViewController visibleTimeRange];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setHighlightTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  p_highlightTimeRange = &self->_highlightTimeRange;
  if ((RCTimeRangeEqualToTimeRange() & 1) == 0)
  {
    p_highlightTimeRange->beginTime = var0;
    p_highlightTimeRange->endTime = var1;
    waveformViewController = self->_waveformViewController;
    -[RCWaveformViewController setHighlightTimeRange:](waveformViewController, "setHighlightTimeRange:", var0, var1);
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)setHighlightTimeRange
{
  if (self->_waveformViewController)
  {
    [(RCWaveformViewController *)self->_waveformViewController highlightTimeRange];
  }
  else
  {
    double beginTime = self->_highlightTimeRange.beginTime;
    double endTime = self->_highlightTimeRange.endTime;
  }
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (void)setCurrentTime:(double)a3
{
  if (self->_currentTime != a3)
  {
    self->_currentTime = a3;
    self->_nextPreviewStartTime = a3;
    [(RCAVWaveformViewController *)self _didUpdateDisplayableTime];
    if (self->_didJumpTime)
    {
      [(RCTimeController *)self->_activeTimeController currentRate];
      if (v4 > 0.0) {
        self->_didJumpTime = 0;
      }
    }
  }
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    -[RCWaveformViewController setDuration:](self->_waveformViewController, "setDuration:");
    [(RCAVWaveformViewController *)self _didUpdateDisplayableTime];
  }
}

- (CGRect)waveformRectForLayoutBounds:(CGRect)a3
{
  -[RCWaveformViewController waveformRectForLayoutBounds:](self->_waveformViewController, "waveformRectForLayoutBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.x = v3;
  return result;
}

- (double)waveformBottomLineInset
{
  -[RCWaveformViewController waveformRectForLayoutBounds:](self->_waveformViewController, "waveformRectForLayoutBounds:", 0.0, 0.0, 320.0, 1000.0);
  return 1000.0 - CGRectGetMaxY(v3);
}

- (double)currentTimeIndicatorCoordinate
{
  if ([(RCAVWaveformViewController *)self _currentTimeDisplayOptionsIgnoringSelectionOverlayState:1])
  {
    double v5 = [(RCAVWaveformViewController *)self view];
    [v5 bounds];
    double MidX = CGRectGetMidX(v8);

    return MidX;
  }
  else
  {
    waveformViewController = self->_waveformViewController;
    [(RCWaveformViewController *)waveformViewController currentTimeIndicatorCoordinate];
  }
  return result;
}

- (void)setAutocenterCurrentTimeIndicatorAlways:(BOOL)a3
{
  if (self->_autocenterCurrentTimeIndicatorAlways != a3)
  {
    self->_autocenterCurrentTimeIndicatorAlways = a3;
    waveformViewController = self->_waveformViewController;
    unint64_t v4 = [(RCAVWaveformViewController *)self _currentTimeDisplayOptions];
    [(RCWaveformViewController *)waveformViewController setCurrentTimeDisplayOptions:v4];
  }
}

- (void)setClipsTimeMarkersToDuration:(BOOL)a3
{
  if (self->_clipsTimeMarkersToDuration != a3)
  {
    self->_clipsTimeMarkersToDuration = a3;
    -[RCWaveformViewController setClipTimeMarkersToDuration:](self->_waveformViewController, "setClipTimeMarkersToDuration:");
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (void)setBlurred:(BOOL)a3
{
  if (self->_blurred != a3)
  {
    BOOL v3 = a3;
    self->_blurred = a3;
    self->_shouldPauseTimeControllerUpdates = a3;
    if (!a3) {
      [(RCAVWaveformViewController *)self _forceUpdateCurrentTimeAndDuration];
    }
    id v5 = [(RCAVWaveformViewController *)self waveformViewController];
    [v5 setBlurred:v3];
  }
}

- (void)updateColorStatesSelected:(BOOL)a3 muted:(BOOL)a4 trimMode:(BOOL)a5
{
}

- (void)showSelectionOverlayAndEnableInsertMode:(BOOL)a3
{
}

- (void)hidSelectionOverlayWithCompletionBlock:(id)a3
{
}

- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange
{
  [(RCWaveformViewController *)self->_waveformViewController selectedTimeRange];
  result.double var1 = v3;
  result.double var0 = v2;
  return result;
}

- (void)resetSelectedTimeRangeToFullDuration
{
  [(RCAVWaveformViewController *)self maximumSelectionDuration];
  double v4 = v3;
  if (v3 == 0.0)
  {
    [(RCAVWaveformViewController *)self duration];
    double v4 = v5;
  }
  if (v4 >= 0.0)
  {
    if ([(RCAVWaveformViewController *)self isViewLoaded])
    {
      double v6 = [(RCAVWaveformViewController *)self view];
      [v6 window];
    }
    id v7 = [(RCAVWaveformViewController *)self waveformViewController];
    [v7 duration];
    RCTimeRangeMake();
    [v7 setSelectedTimeRange:animationDuration:];
  }
}

- (void)setMaximumSelectionDuration:(double)a3
{
  if (self->_maximumSelectionDuration != a3)
  {
    self->_maximumSelectionDuration = a3;
    -[RCWaveformViewController setMaximumSelectionDuration:](self->_waveformViewController, "setMaximumSelectionDuration:");
  }
}

- (void)waveformViewController:(id)a3 didScrubToTime:(double)a4 finished:(BOOL)a5
{
  BOOL v5 = a5;
  if (UIAccessibilityIsVoiceOverRunning() && (CFAbsoluteTimeGetCurrent() - *(double *)&qword_10026A788 > 2.0 || v5))
  {
    UIAccessibilityNotifications v9 = UIAccessibilityAnnouncementNotification;
    double v10 = UIAXTimeStringForDuration();
    UIAccessibilityPostNotification(v9, v10);

    qword_10026A788 = CFAbsoluteTimeGetCurrent();
  }
  activeTimeController = self->_activeTimeController;

  [(RCTimeController *)activeTimeController setTargetTime:a4];
}

- (void)waveformViewControllerDidEndEditingSelectedTimeRange:(id)a3
{
  [(RCAVWaveformViewController *)self selectedTimeRange];
  double v5 = v4;
  double v7 = v6;
  [(RCTimeController *)self->_activeTimeController currentTime];
  double v9 = v8;
  if ((RCTimeRangeContainsTime() & 1) == 0)
  {
    RCTimeRangeConstrainTime();
    double v9 = v10;
    -[RCTimeController setTargetTime:](self->_activeTimeController, "setTargetTime:");
  }
  self->_nextPreviewStartTime = v9;
  activeTimeController = self->_activeTimeController;

  -[RCTimeController setAllowedTimeRange:](activeTimeController, "setAllowedTimeRange:", v5, v7);
}

- (void)waveformViewController:(id)a3 didChangeToVisibleTimeRange:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained audioWaveformControllerDidChangeAVTimes:self];
}

- (void)timeController:(id)a3 didChangeState:(int64_t)a4
{
  if (!a4)
  {
    [a3 currentTime];
    self->_nextPreviewStartTime = v6;
  }

  [(RCAVWaveformViewController *)self _updateInterfaceForTimeControllerState:a4];
}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didJumpTime:(BOOL)a5
{
  self->_didJumpTime = a5;
  -[RCAVWaveformViewController setCurrentTime:](self, "setCurrentTime:", a3, a4);
}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5
{
  if (!self->_shouldPauseTimeControllerUpdates)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100060200;
    v5[3] = &unk_100221D68;
    v5[4] = self;
    *(double *)&v5[5] = a5;
    *(double *)&v5[6] = a4;
    [(RCAVWaveformViewController *)self _updateDisplayableTimesWithBlock:v5];
  }
}

- (void)_forceUpdateCurrentTimeAndDuration
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000602BC;
  v2[3] = &unk_100221278;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)_setWaveformDataSource:(id)a3 initialTime:(double)a4
{
  double v7 = (RCWaveformDataSource *)a3;
  p_waveformDataSource = &self->_waveformDataSource;
  if (self->_waveformDataSource != v7)
  {
    objc_storeStrong((id *)&self->_waveformDataSource, a3);
    if (*p_waveformDataSource) {
      [(RCWaveformDataSource *)*p_waveformDataSource beginLoading];
    }
    [(RCWaveformViewController *)self->_waveformViewController setDataSource:v7];
    [(RCWaveformViewController *)self->_waveformViewController setCurrentTime:a4];
    waveformViewController = self->_waveformViewController;
    [(RCWaveformDataSource *)v7 duration];
    -[RCWaveformViewController setDuration:](waveformViewController, "setDuration:");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000604C4;
    v11[3] = &unk_100221D90;
    v11[4] = self;
    *(double *)&v11[5] = a4;
    [(RCAVWaveformViewController *)self _updateDisplayableTimesWithBlock:v11];
    self->_nextPreviewStartTime = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained audioWaveformControllerDidChangeWaveformDataSource:self];
  }
}

- (void)_updateCurrentTimeForCapturedInputAtTime:(double)a3
{
  if (self->_currentTimeTracksCapturedEndPoint) {
    [(RCAVWaveformViewController *)self setCurrentTime:a3];
  }
}

- (void)_didUpdateDisplayableTime
{
  if (self->_batchUpdatingDisplayableTimesCount < 1)
  {
    [(RCAVWaveformViewController *)self currentTime];
    double v4 = v3;
    [(RCAVWaveformViewController *)self visibleTimeRange];
    RCTimeRangeGetMidTime();
    if (v4 > v5) {
      [(RCWaveformViewController *)self->_waveformViewController setCurrentTimeDisplayOptions:[(RCAVWaveformViewController *)self _currentTimeDisplayOptions]];
    }
    [(RCWaveformViewController *)self->_waveformViewController setCurrentTime:v4];
    waveformViewController = self->_waveformViewController;
    [(RCAVWaveformViewController *)self duration];
    -[RCWaveformViewController setDuration:](waveformViewController, "setDuration:");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained audioWaveformControllerDidChangeAVTimes:self];

    if (self->_isOverview)
    {
      double v8 = self->_waveformViewController;
      [(RCWaveformViewController *)v8 updateVisibleTimeRangeToFullDuration];
    }
  }
  else
  {
    self->_needsUpdateDisplayableTime = 1;
  }
}

- (void)_updateDisplayableTimesWithBlock:(id)a3
{
  ++self->_batchUpdatingDisplayableTimesCount;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  int64_t v4 = self->_batchUpdatingDisplayableTimesCount - 1;
  self->_batchUpdatingDisplayableTimesCount = v4;
  if (!v4 && self->_needsUpdateDisplayableTime)
  {
    [(RCAVWaveformViewController *)self _didUpdateDisplayableTime];
  }
}

- (void)_setSelectionOverlayEnabled:(BOOL)a3
{
  if (self->_showingSelectionOverlayEnabled != a3)
  {
    self->_showingSelectionOverlayEnabled = a3;
    [(RCAVWaveformViewController *)self _didUpdateDisplayableTime];
  }
}

- (unint64_t)_currentTimeDisplayOptions
{
  return [(RCAVWaveformViewController *)self _currentTimeDisplayOptionsIgnoringSelectionOverlayState:0];
}

- (unint64_t)_currentTimeDisplayOptionsIgnoringSelectionOverlayState:(BOOL)a3
{
  if (self->_selectionOverlayVisible && !a3) {
    return 2;
  }
  else {
    return self->_autocenterCurrentTimeIndicatorAlways;
  }
}

- (void)_updateInterfaceForTimeControllerState:(int64_t)a3
{
  uint64_t v5 = a3 == 1;
  double v6 = [(RCAVWaveformViewController *)self waveformViewController];
  [v6 setPlaying:v5];

  if (a3 == 2)
  {
    uint64_t v5 = [(RCAVWaveformViewController *)self waveformDataSource];
    id v7 = [(id)v5 supportsLiveInput];
  }
  else
  {
    id v7 = 0;
  }
  double v8 = [(RCAVWaveformViewController *)self waveformViewController];
  [v8 setCapturing:v7];

  if (a3 == 2) {
  BOOL selectionOverlayVisible = self->_selectionOverlayVisible;
  }
  double v10 = [(RCAVWaveformViewController *)self waveformViewController];
  [v10 setSelectedTimeRangeEditingEnabled:selectionOverlayVisible];

  double v11 = [(RCAVWaveformViewController *)self waveformViewController];
  [v11 setScrubbingEnabled:(unint64_t)(a3 - 3) < 0xFFFFFFFFFFFFFFFELL];

  double v12 = [(RCAVWaveformViewController *)self waveformViewController];
  -[RCAVWaveformViewController _setSelectionOverlayEnabled:](self, "_setSelectionOverlayEnabled:", [v12 showPlayBarOnly]);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained audioWaveformControllerDidChangeAVState:self];
}

- (void)_beginShowingSelectionOverlayAndEnableInsertMode:(BOOL)a3
{
  [(RCAVWaveformViewController *)self maximumSelectionDuration];
  if (v5 == 0.0) {
    [(RCAVWaveformViewController *)self duration];
  }
  if (v5 >= 0.0)
  {
    [(RCAVWaveformViewController *)self resetSelectedTimeRangeToFullDuration];
    double v6 = 0.0;
    if ([(RCAVWaveformViewController *)self isViewLoaded])
    {
      id v7 = [(RCAVWaveformViewController *)self view];
      double v8 = [v7 window];
      if (v8) {
        double v6 = 0.5;
      }
      else {
        double v6 = 0.0;
      }
    }
    double v9 = [(RCAVWaveformViewController *)self waveformViewController];
    self->_BOOL selectionOverlayVisible = 1;
    [(RCAVWaveformViewController *)self currentTime];
    self->_nextPreviewStartTime = v10;
    [v9 visibleTimeRange];
    RCTimeRangeDeltaWithUIPrecision();
    self->_defaultVisibleDuration = v11;
    [v9 setCurrentTimeDisplayOptions:[self _currentTimeDisplayOptions]];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100060A2C;
    v14[3] = &unk_100221830;
    id v15 = v9;
    BOOL v16 = a3;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100060A70;
    v13[3] = &unk_100221DB8;
    v13[4] = self;
    id v12 = v9;
    +[UIView animateWithDuration:0x20000 delay:v14 options:v13 animations:v6 completion:0.0];
  }
}

- (void)_endShowingSelectionOverlayWithCompletionBlock:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if ([(RCAVWaveformViewController *)self isViewLoaded])
  {
    double v6 = [(RCAVWaveformViewController *)self view];
    id v7 = [v6 window];
    if (v7) {
      double v5 = 0.5;
    }
    else {
      double v5 = 0.0;
    }
  }
  double v8 = [(RCAVWaveformViewController *)self waveformViewController];
  [(RCAVWaveformViewController *)self nextPreviewStartTime];
  uint64_t v10 = v9;
  self->_BOOL selectionOverlayVisible = 0;
  [v8 setCurrentTimeDisplayOptions:[self _currentTimeDisplayOptions]];
  [v8 setSelectionOverlayShouldUseInsertMode:0];
  [v8 setSelectedTimeRangeEditingEnabled:0];
  [v8 setScrubbingEnabled:1];
  double v11 = [(RCAVWaveformViewController *)self activeTimeController];
  [v11 currentDuration];
  RCTimeRangeMake();
  [v11 setAllowedTimeRange:];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100060CE4;
  v16[3] = &unk_100221D68;
  id v17 = v8;
  uint64_t v18 = v10;
  double v19 = v5;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100060D40;
  v14[3] = &unk_100221DE0;
  id v15 = v4;
  id v12 = v4;
  id v13 = v8;
  +[UIView animateWithDuration:0x20000 delay:v16 options:v14 animations:v5 completion:0.0];
}

- (id)_selectionOverlay
{
  double v2 = [(RCAVWaveformViewController *)self waveformViewController];
  double v3 = [v2 valueForKey:@"_selectionOverlay"];

  return v3;
}

- (RCWaveformDataSource)waveformDataSource
{
  return self->_waveformDataSource;
}

- (void)setWaveformDataSource:(id)a3
{
}

- (RCAVWaveformViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCAVWaveformViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RCWaveformViewController)waveformViewController
{
  return self->_waveformViewController;
}

- (void)setWaveformViewController:(id)a3
{
}

- (RCTimeController)activeTimeController
{
  return self->_activeTimeController;
}

- (double)nextPreviewStartTime
{
  return self->_nextPreviewStartTime;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)highlightTimeRange
{
  double beginTime = self->_highlightTimeRange.beginTime;
  double endTime = self->_highlightTimeRange.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (BOOL)currentTimeTracksCapturedEndPoint
{
  return self->_currentTimeTracksCapturedEndPoint;
}

- (void)setCurrentTimeTracksCapturedEndPoint:(BOOL)a3
{
  self->_currentTimeTracksCapturedEndPoint = a3;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)autocenterCurrentTimeIndicatorAlways
{
  return self->_autocenterCurrentTimeIndicatorAlways;
}

- (BOOL)clipsTimeMarkersToDuration
{
  return self->_clipsTimeMarkersToDuration;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (BOOL)isBlurred
{
  return self->_blurred;
}

- (BOOL)isSelectionOverlayVisible
{
  return self->_selectionOverlayVisible;
}

- (double)maximumSelectionDuration
{
  return self->_maximumSelectionDuration;
}

- (BOOL)isEditMode
{
  return self->_isEditMode;
}

- (BOOL)isOverview
{
  return self->_isOverview;
}

- (void)setIsOverview:(BOOL)a3
{
  self->_isOverview = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_waveformDataSource, 0);
  objc_storeStrong((id *)&self->_rightForwardingView, 0);
  objc_storeStrong((id *)&self->_leftForwardingView, 0);

  objc_storeStrong((id *)&self->_activeTimeController, 0);
}

@end