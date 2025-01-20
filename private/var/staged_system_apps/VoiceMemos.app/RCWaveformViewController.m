@interface RCWaveformViewController
- ($F24F406B2B787EFB06265DBA3D28CBD5)_visibleTimeRangeForCurrentSelectionTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)highlightTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)setHighlightTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeByInsettingVisibleTimeRange:(id)a3 inset:(double)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)waveformSelectionOverlay:(id)a3 willChangeSelectedTimeRange:(id)a4 isTrackingMin:(BOOL)a5 isTrackingMax:(BOOL)a6;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isScrubbing;
- (BOOL)_isScrubbingSelectionTimeRange;
- (BOOL)capturing;
- (BOOL)clipTimeMarkersToDuration;
- (BOOL)editing;
- (BOOL)isBlurred;
- (BOOL)isCompactView;
- (BOOL)isOverview;
- (BOOL)isPlayback;
- (BOOL)isScrubbing;
- (BOOL)isSelectedTimeRangeEditingEnabled;
- (BOOL)isSelectionOverlayCurrentlyTracking;
- (BOOL)isZooming;
- (BOOL)playing;
- (BOOL)scrubbingEnabled;
- (BOOL)selectionOverlayShouldUseInsertMode;
- (BOOL)showPlayBarOnly;
- (BOOL)waveformSelectionOverlayNeedsExplicitAnimations;
- (CGRect)_frameForTimeMarkerView:(id)a3;
- (CGRect)waveformRectForLayoutBounds:(CGRect)a3;
- (RCTimeController)activeTimeController;
- (RCWaveformDataSource)dataSource;
- (RCWaveformViewController)initWithDisplayStyle:(unint64_t)a3 isOverview:(BOOL)a4 isCompact:(BOOL)a5 duration:(double)a6;
- (RCWaveformViewDelegate)delegate;
- (RCWaveformZoomingDelegate)zoomingDelegate;
- (double)currentTime;
- (double)currentTimeIndicatorCoordinate;
- (double)desiredTimeDeltaForVisibleTimeRange;
- (double)duration;
- (double)maximumSelectionDuration;
- (double)pointsPerSecond;
- (double)waveformSelectionOverlay:(id)a3 offsetForTime:(double)a4;
- (double)waveformSelectionOverlay:(id)a3 timeForOffset:(double)a4;
- (double)waveformSelectionOverlay:(id)a3 willChangeAssetCurrentTime:(double)a4 isTracking:(BOOL)a5;
- (double)waveformSelectionOverlayGetCurrentTime:(id)a3;
- (double)zoomScale;
- (id)applicationWaveformRenderer;
- (id)rasterizeCurrentTimeRangeIntoImageWithSize:(CGSize)a3;
- (id)scrollView;
- (unint64_t)currentTimeDisplayOptions;
- (unint64_t)displayStyle;
- (void)_addWaveformViewToHostingView:(id)a3;
- (void)_autoscrollOverlayIfNecessary;
- (void)_forceRenderingForBlurredStateChange;
- (void)_layoutTimeMarkerViewsForCurrentlyVisibleTimeRange;
- (void)_refreshRenderController;
- (void)_scrollViewPanGestureRecognized:(id)a3;
- (void)_scrubbingDidFinish;
- (void)_setSelectedTimeRange:(id)a3 updateVisibleTimeRange:(BOOL)a4 updateWaveformViewContentSizeAndOffset:(BOOL)a5 notifyDelegate:(BOOL)a6 animationDuration:(double)a7;
- (void)_setTimeMarkerViewUpdatesDisabled:(BOOL)a3;
- (void)_setTimeMarkerViewsNeedInitialLayout:(BOOL)a3;
- (void)_setVisibleTimeRange:(id)a3 animationDuration:(double)a4 completionBlock:(id)a5;
- (void)_setupViewsForApplicationDisplayStyle;
- (void)_setupViewsForWaveformOnlyDisplayStyle;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateAnnotationViews;
- (void)_updateBackgroundWaveformHighlight;
- (void)_updateCurrentTimeDisplay;
- (void)_updateSelectionOverlayWithAnimationDuration:(double)a3;
- (void)_updateVisibleAreaWithAnimationDuration:(double)a3;
- (void)_updateWaveformViewContentSizeAndOffset;
- (void)_updateWaveformViewContentSizeAndOffsetToSize:(double)a3;
- (void)addAuxWaveformViewController:(id)a3;
- (void)addBlurEffect;
- (void)bounceWaveform;
- (void)bringAuxWaveformViewControllerToFront:(id)a3;
- (void)dealloc;
- (void)enableWaveformScrolling:(BOOL)a3;
- (void)enableZooming:(BOOL)a3;
- (void)fixupScrollPositionToMatchIndicatorPositionTime;
- (void)reloadOverlayOffsets;
- (void)removeBlurEffect;
- (void)resetZoomScale;
- (void)scaleWaveform:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBlurred:(BOOL)a3;
- (void)setCapturing:(BOOL)a3;
- (void)setClipTimeMarkersToDuration:(BOOL)a3;
- (void)setCurrentTime:(double)a3;
- (void)setCurrentTimeDisplayOptions:(unint64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredTimeDeltaForVisibleTimeRange:(double)a3;
- (void)setDisplayStyle:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setEditing:(BOOL)a3;
- (void)setHighlightTimeRange:(id)a3;
- (void)setIsCompactView:(BOOL)a3;
- (void)setIsOverview:(BOOL)a3;
- (void)setIsPlayback:(BOOL)a3;
- (void)setMaximumSelectionDuration:(double)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setScrubbingEnabled:(BOOL)a3;
- (void)setSelectedTimeRange:(id)a3;
- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4;
- (void)setSelectedTimeRangeEditingEnabled:(BOOL)a3;
- (void)setSelectedTimeRangeScrubbingEnabled:(BOOL)a3;
- (void)setSelectionOverlayShouldUseInsertMode:(BOOL)a3;
- (void)setShowPlayBarOnly:(BOOL)a3;
- (void)setVisibleTimeRange:(id)a3;
- (void)setVisibleTimeRange:(id)a3 animationDuration:(double)a4;
- (void)setZoomScale:(double)a3;
- (void)setZoomingDelegate:(id)a3;
- (void)stopScrolling;
- (void)updateBackgroundColor;
- (void)updateColorStatesSelected:(BOOL)a3 muted:(BOOL)a4 trimMode:(BOOL)a5;
- (void)updateVisibleTimeRangeToFullDuration;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)waveformRenderer:(id)a3 contentWidthDidChange:(double)a4;
- (void)waveformSelectionOverlay:(id)a3 didFinishTrackingSelectionBeginTime:(BOOL)a4 endTime:(BOOL)a5 assetCurrentTime:(BOOL)a6;
- (void)waveformSelectionOverlay:(id)a3 willBeginTrackingSelectionBeginTime:(BOOL)a4 endTime:(BOOL)a5 assetCurrentTime:(BOOL)a6;
@end

@implementation RCWaveformViewController

- (RCWaveformViewController)initWithDisplayStyle:(unint64_t)a3 isOverview:(BOOL)a4 isCompact:(BOOL)a5 duration:(double)a6
{
  BOOL v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)RCWaveformViewController;
  v9 = [(RCWaveformViewController *)&v24 init];
  v10 = v9;
  if (v9)
  {
    v9->_displayStyle = a3;
    v11 = objc_alloc_init(RCApplicationWaveformRenderer);
    rendererController = v10->_rendererController;
    v10->_rendererController = &v11->super;

    [(RCWaveformRenderer *)v10->_rendererController setRendererDelegate:v10];
    uint64_t v13 = objc_opt_new();
    waveformHostingView = v10->_waveformHostingView;
    v10->_waveformHostingView = (UIView *)v13;

    v10->_isOverview = v7;
    RCTimeRangeMake();
    v10->_visibleTimeRange.beginTime = v15;
    v10->_visibleTimeRange.endTime = v16;
    [(RCWaveformRenderer *)v10->_rendererController setDisplayMode:!v7];
    v10->_highlightTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)RCTimeRangeInvalid;
    v10->_currentTimeDisplayOptions = 0;
    v10->_clipTimeMarkersToDuration = 1;
    uint64_t v17 = objc_opt_new();
    timeMarkerView = v10->_timeMarkerView;
    v10->_timeMarkerView = (UIView *)v17;

    v10->_isCompactView = a5;
    v10->_desiredTimeDeltaForVisibleTimeRange = 6.0;
    if (!v10->_isOverview && v10->_displayStyle != 1)
    {
      int v19 = 3;
      v20 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
      timeMarkerViews = v10->_timeMarkerViews;
      v10->_timeMarkerViews = v20;

      do
      {
        v22 = objc_alloc_init(RCChronologicalAnnotationView);
        [(NSMutableArray *)v10->_timeMarkerViews addObject:v22];

        --v19;
      }
      while (v19);
    }
    [(RCWaveformViewController *)v10 addChildViewController:v10->_rendererController];
    [(RCWaveformRenderer *)v10->_rendererController didMoveToParentViewController:v10];
    v10->_baselinePointsPerSecond = 100.0;
    v10->_pointsPerSecondScale = 1.0;
  }
  return v10;
}

- (void)dealloc
{
  [(RCWaveformScrollView *)self->_scrollView setDelegate:0];
  [(RCWaveformRenderer *)self->_rendererController setRendererDelegate:0];
  [(NSTimer *)self->_overlayAutoscrollTimer invalidate];
  overlayAutoscrollTimer = self->_overlayAutoscrollTimer;
  self->_overlayAutoscrollTimer = 0;

  rendererController = self->_rendererController;
  self->_rendererController = 0;

  v5.receiver = self;
  v5.super_class = (Class)RCWaveformViewController;
  [(RCWaveformViewController *)&v5 dealloc];
}

- (id)scrollView
{
  return self->_scrollView;
}

- (RCWaveformDataSource)dataSource
{
  return [(RCWaveformRenderer *)self->_rendererController dataSource];
}

- (void)setDataSource:(id)a3
{
  id v4 = a3;
  [(RCWaveformViewController *)self stopScrolling];
  [(RCWaveformRenderer *)self->_rendererController setDataSource:v4];

  [(RCWaveformViewController *)self _updateWaveformViewContentSizeAndOffset];

  [(RCWaveformViewController *)self _updateAnnotationViews];
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RCWaveformViewController *)self isOverview])
  {
    self->_BOOL scrubbingEnabled = 0;
    scrollView = self->_scrollView;
    [(RCWaveformScrollView *)scrollView setScrollEnabled:0];
  }
  else
  {
    self->_BOOL scrubbingEnabled = v3;
    [(RCWaveformScrollView *)self->_scrollView setScrollEnabled:v3];
    BOOL scrubbingEnabled = self->_scrubbingEnabled;
    [(RCWaveformViewController *)self enableZooming:scrubbingEnabled];
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    [(RCWaveformRenderer *)self->_rendererController setFrequentUpdatesSegmentUpdatesExpectedHint:0];
    [(RCWaveformViewController *)self _updateSelectionOverlayWithAnimationDuration:0.0];
    [(RCWaveformViewController *)self _updateBackgroundWaveformHighlight];
  }
}

- (void)setCapturing:(BOOL)a3
{
  if (self->_capturing != a3)
  {
    BOOL v3 = a3;
    self->_capturing = a3;
    [(RCWaveformRenderer *)self->_rendererController setCalcBlockShouldRefreshAllSlices:1];
    [(RCWaveformRenderer *)self->_rendererController setIsLiveWaveform:v3];
    [(RCWaveformRenderer *)self->_rendererController setFrequentUpdatesSegmentUpdatesExpectedHint:v3];
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setIsRecording:v3];
    [(RCWaveformViewController *)self _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange];
    [(RCWaveformViewController *)self _updateBackgroundWaveformHighlight];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    BOOL v3 = a3;
    self->_editing = a3;
    id v4 = [(RCWaveformViewController *)self applicationWaveformRenderer];
    if (v4)
    {
      id v5 = v4;
      [v4 setIsEditMode:v3];
      id v4 = v5;
    }
  }
}

- (void)setIsPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isPlayback = a3;
  id v5 = [(RCWaveformViewController *)self applicationWaveformRenderer];
  if (v5) {
    [v5 setIsPlayback:v3];
  }
  [(RCWaveformViewController *)self updateBackgroundColor];
}

- (void)setCurrentTimeDisplayOptions:(unint64_t)a3
{
  if (self->_currentTimeDisplayOptions != a3)
  {
    self->_currentTimeDisplayOptions = a3;
    [(RCWaveformViewController *)self _updateCurrentTimeDisplay];
  }
}

- (void)setClipTimeMarkersToDuration:(BOOL)a3
{
  if (self->_clipTimeMarkersToDuration != a3) {
    self->_clipTimeMarkersToDuration = a3;
  }
  [(RCWaveformViewController *)self _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange];
}

- (void)setBlurred:(BOOL)a3
{
  if (self->_blurred != a3)
  {
    if (a3)
    {
      [(RCWaveformViewController *)self _forceRenderingForBlurredStateChange];
      [(RCWaveformViewController *)self addBlurEffect];
    }
    else
    {
      [(RCWaveformViewController *)self removeBlurEffect];
    }
    self->_blurred = a3;
  }
}

- (void)_refreshRenderController
{
  [(RCWaveformRenderer *)self->_rendererController setSyncRenderOnMainThread:1];
  [(RCWaveformRenderer *)self->_rendererController setCalcBlockShouldRefreshAllSlices:1];
  rendererController = self->_rendererController;
  [(RCWaveformRenderer *)rendererController visibleTimeRange];
  -[RCWaveformRenderer setVisibleTimeRange:](rendererController, "setVisibleTimeRange:");
  id v4 = self->_rendererController;

  [(RCWaveformRenderer *)v4 setSyncRenderOnMainThread:0];
}

- (void)updateColorStatesSelected:(BOOL)a3 muted:(BOOL)a4 trimMode:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [(RCWaveformRenderer *)self->_rendererController setSelected:a3];
  [(RCWaveformRenderer *)self->_rendererController setMuted:v6];
  [(RCWaveformRenderer *)self->_rendererController setTrimMode:v5];
  rendererController = self->_rendererController;

  [(RCWaveformRenderer *)rendererController drawWaveform];
}

- (void)_forceRenderingForBlurredStateChange
{
  BOOL v3 = [(RCWaveformViewController *)self view];
  [v3 setNeedsLayout];

  id v4 = [(RCWaveformViewController *)self view];
  [v4 layoutIfNeeded];

  [(RCWaveformViewController *)self _refreshRenderController];
}

- (void)addBlurEffect
{
  [(UIVisualEffectView *)self->_blurEffectView setAlpha:1.0];
  [(UIVisualEffectView *)self->_waveformExtraBlurEffectView setAlpha:1.0];
  id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v5 waveformViewBlurEffectRadius];
  BOOL v3 = +[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:");
  [(UIVisualEffectView *)self->_blurEffectView setEffect:v3];
  [v5 waveformExtraBlurEffectRadius];
  id v4 = +[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:");
  [(UIVisualEffectView *)self->_waveformExtraBlurEffectView setEffect:v4];
}

- (void)removeBlurEffect
{
  blurEffectView = self->_blurEffectView;
  if (blurEffectView)
  {
    [(UIVisualEffectView *)blurEffectView setAlpha:0.0];
    [(UIVisualEffectView *)self->_waveformExtraBlurEffectView setAlpha:0.0];
    id v4 = +[UIBlurEffect effectWithBlurRadius:0.1];
    [(UIVisualEffectView *)self->_blurEffectView setEffect:v4];

    id v5 = +[UIBlurEffect effectWithBlurRadius:0.1];
    [(UIVisualEffectView *)self->_waveformExtraBlurEffectView setEffect:v5];
  }
}

- (CGRect)waveformRectForLayoutBounds:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  BOOL v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v7 annotationViewHeight];
  double v9 = height - v8;

  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = v9;
  result.size.double height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (double)currentTimeIndicatorCoordinate
{
  [(RCWaveformSelectionOverlay *)self->_selectionOverlay currentTimeIndicatorCoordinate];
  return result;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
  [(RCWaveformViewController *)self _updateCurrentTimeDisplay];
}

- (void)setIsOverview:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_isOverview != a3) {
    self->_isOverview = a3;
  }
  if (a3)
  {
    [(RCWaveformRenderer *)self->_rendererController setDisplayMode:0];
    id v5 = [(RCWaveformViewController *)self applicationWaveformRenderer];
    BOOL v6 = v5;
    if (v5) {
      [v5 setIsCompactView:0];
    }
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setHidden:0];
    [(UIView *)self->_selectionBackgroundView setHidden:0];
    BOOL v7 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v8 = [v7 shouldShowOverviewWaveform];

    if (v8)
    {
      double v9 = RCLocalizedFrameworkString();
      [(RCWaveformSelectionOverlay *)self->_selectionOverlay setAccessibilityLabel:v9];
    }
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setAxSegment:20.0];
  }
  else
  {
    double v10 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v10 shouldShowOverviewWaveform];

    double v11 = RCLocalizedFrameworkString();
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setAccessibilityLabel:v11];

    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setAxSegment:30.0];
  }
  selectionOverlaCGFloat y = self->_selectionOverlay;

  [(RCWaveformSelectionOverlay *)selectionOverlay setIsOverView:v3];
}

- (void)setDuration:(double)a3
{
  if (self->_duration == a3) {
    return;
  }
  self->_duration = a3;
  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setAssetDuration:a3];
  if ([(RCWaveformSelectionOverlay *)self->_selectionOverlay isEditingEnabled])
  {
    double beginTime = self->_selectedTimeRange.beginTime;
    double endTime = self->_selectedTimeRange.endTime;
    if (endTime <= beginTime)
    {
      if (endTime <= a3 && beginTime <= a3)
      {
LABEL_12:
        if ((RCTimeRangeEqualToTimeRange() & 1) == 0) {
          -[RCWaveformViewController _setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:](self, "_setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:", 0, 1, 0, beginTime, endTime, 0.0);
        }
        goto LABEL_14;
      }
    }
    else if (beginTime < a3)
    {
      if (endTime > a3) {
        self->_selectedTimeRange.double endTime = a3;
      }
      goto LABEL_12;
    }
    RCTimeRangeMake();
    double beginTime = v8;
    double endTime = v9;
    goto LABEL_12;
  }
LABEL_14:
  if (self->_clipTimeMarkersToDuration) {
    [(RCWaveformViewController *)self _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v10 = self->_timeMarkerViews;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) setContentDuration:self->_duration v15];
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  [(RCWaveformViewController *)self _updateBackgroundWaveformHighlight];
}

- (void)updateVisibleTimeRangeToFullDuration
{
  BOOL v3 = [(RCWaveformViewController *)self dataSource];
  [v3 duration];

  id v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v4 overviewWaveformMinimumDurationToDisplayWhenRecording];

  [(RCWaveformViewController *)self isPlayback];
  RCTimeRangeMake();
  double v6 = v5;
  double v8 = v7;
  RCTimeRangeDelta();
  -[RCWaveformViewController setDesiredTimeDeltaForVisibleTimeRange:](self, "setDesiredTimeDeltaForVisibleTimeRange:");

  -[RCWaveformViewController setVisibleTimeRange:animationDuration:](self, "setVisibleTimeRange:animationDuration:", v6, v8, 0.0);
}

- (void)setVisibleTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if ([(RCWaveformViewController *)self isOverview])
  {
    [(RCWaveformViewController *)self updateVisibleTimeRangeToFullDuration];
  }
  else
  {
    -[RCWaveformViewController setVisibleTimeRange:animationDuration:](self, "setVisibleTimeRange:animationDuration:", var0, var1, 0.0);
  }
}

- (void)setVisibleTimeRange:(id)a3 animationDuration:(double)a4
{
}

- (void)setHighlightTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  p_highlightTimeRange = &self->_highlightTimeRange;
  if ((RCTimeRangeEqualToTimeRange() & 1) == 0)
  {
    p_highlightTimeRange->double beginTime = var0;
    p_highlightTimeRange->double endTime = var1;
    rendererController = self->_rendererController;
    -[RCWaveformRenderer setHighlightTimeRange:](rendererController, "setHighlightTimeRange:", var0, var1);
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)setHighlightTimeRange
{
  if (self->_rendererController)
  {
    [(RCWaveformRenderer *)self->_rendererController highlightTimeRange];
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

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeByInsettingVisibleTimeRange:(id)a3 inset:(double)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  -[RCWaveformRenderer pointsPerSecondWithVisibleTimeRange:](self->_rendererController, "pointsPerSecondWithVisibleTimeRange:");
  double v8 = 1.0 / v7 * a4;
  double v9 = var0 - v8;
  double v10 = var1 + v8;
  result.double var1 = v10;
  result.double var0 = v9;
  return result;
}

- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4
{
}

- (void)setSelectedTimeRange:(id)a3
{
}

- (void)setMaximumSelectionDuration:(double)a3
{
  self->_maximumSelectionDuration = a3;
  [(RCWaveformViewController *)self maximumSelectionDuration];
  selectionOverlaCGFloat y = self->_selectionOverlay;

  -[RCWaveformSelectionOverlay setSelectedTimeRangeMaximumDuration:](selectionOverlay, "setSelectedTimeRangeMaximumDuration:");
}

- (void)setSelectedTimeRangeEditingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_selectedTimeRangeEditingEnabled = a3;
  [(RCWaveformViewController *)self _updateWaveformViewContentSizeAndOffset];
  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setInsertMode:[(RCWaveformViewController *)self selectionOverlayShouldUseInsertMode]];
  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setEditingEnabled:v3];

  [(RCWaveformViewController *)self _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange];
}

- (BOOL)isSelectionOverlayCurrentlyTracking
{
  return [(RCWaveformSelectionOverlay *)self->_selectionOverlay isCurrentlyTracking];
}

- (void)bounceWaveform
{
  v2 = [(RCWaveformRenderer *)self->_rendererController view];
  BOOL v3 = [v2 layer];

  long long v4 = *(_OWORD *)&CATransform3DIdentity.m33;
  v15[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v15[5] = v4;
  long long v5 = *(_OWORD *)&CATransform3DIdentity.m43;
  v15[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v15[7] = v5;
  long long v6 = *(_OWORD *)&CATransform3DIdentity.m13;
  v15[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v15[1] = v6;
  long long v7 = *(_OWORD *)&CATransform3DIdentity.m23;
  v15[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v15[3] = v7;
  double v8 = +[NSValue valueWithBytes:v15 objCType:"{CATransform3D=dddddddddddddddd}"];
  CATransform3DMakeScale(&v14, 1.0, 1.333, 1.0);
  double v9 = +[NSValue valueWithBytes:&v14 objCType:"{CATransform3D=dddddddddddddddd}"];
  id v10 = [objc_alloc((Class)CASpringAnimation) initWithPerceptualDuration:0.2 bounce:0.3];
  [v10 setKeyPath:@"sublayerTransform"];
  [v10 setFromValue:v8];
  [v10 setToValue:v9];
  id v11 = [objc_alloc((Class)CASpringAnimation) initWithPerceptualDuration:0.5 bounce:0.5];
  [v11 setKeyPath:@"sublayerTransform"];
  [v11 setFromValue:v9];
  [v11 setToValue:v8];
  [v11 setBeginTime:0.2];
  id v12 = objc_alloc_init((Class)CAAnimationGroup);
  [v12 setDuration:0.7];
  v16[0] = v10;
  v16[1] = v11;
  uint64_t v13 = +[NSArray arrayWithObjects:v16 count:2];
  [v12 setAnimations:v13];

  [v3 addAnimation:v12 forKey:0];
}

- (void)addAuxWaveformViewController:(id)a3
{
  id v4 = a3;
  [(RCWaveformViewController *)self addChildViewController:v4];
  [v4 didMoveToParentViewController:self];
  id v5 = [v4 view];

  [(RCWaveformViewController *)self _addWaveformViewToHostingView:v5];
}

- (void)bringAuxWaveformViewControllerToFront:(id)a3
{
  long long v7 = (RCWaveformRenderer *)a3;
  if (!v7
    || ([(RCWaveformRenderer *)v7 parentViewController],
        id v4 = (RCWaveformViewController *)objc_claimAutoreleasedReturnValue(),
        v4,
        rendererController = v7,
        v4 != self))
  {
    rendererController = self->_rendererController;
  }
  long long v6 = [(RCWaveformRenderer *)rendererController view];
  [(UIView *)self->_waveformHostingView bringSubviewToFront:v6];
}

- (void)enableWaveformScrolling:(BOOL)a3
{
}

- (double)zoomScale
{
  return self->_pointsPerSecondScale;
}

- (void)setZoomScale:(double)a3
{
  double v3 = fmin(a3, 4.0);
  if (v3 < 0.01) {
    double v3 = 0.01;
  }
  if (self->_pointsPerSecondScale != v3)
  {
    self->_pointsPerSecondScale = v3;
    double layoutWidth = self->_layoutWidth;
    [(RCWaveformViewController *)self pointsPerSecond];
    [(RCWaveformViewController *)self setDesiredTimeDeltaForVisibleTimeRange:layoutWidth / v6];
    [(RCWaveformViewController *)self fixupScrollPositionToMatchIndicatorPositionTime];
  }
}

- (void)resetZoomScale
{
  self->_baselinePointsPerSecond = 100.0;
  [(RCWaveformViewController *)self setZoomScale:1.0];
}

- (double)pointsPerSecond
{
  double result = self->_baselinePointsPerSecond * self->_pointsPerSecondScale;
  if (result <= 0.0) {
    return 1.0;
  }
  return result;
}

- (void)scaleWaveform:(id)a3
{
  id v9 = a3;
  [v9 scale];
  if ([v9 state] == (id)1 || objc_msgSend(v9, "state") == (id)2)
  {
    [(RCWaveformViewController *)self zoomScale];
    double v6 = v5;
    [v9 scale];
    double v8 = v6 * v7;
    [v9 setScale:1.0];
    [(RCWaveformViewController *)self setZoomScale:v8];
  }
}

- (void)enableZooming:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(RCWaveformViewController *)self isOverview])
  {
    pinchGesture = self->_pinchGesture;
    if (!pinchGesture)
    {
      [(RCWaveformScrollView *)self->_scrollView setBouncesZoom:0];
      [(RCWaveformScrollView *)self->_scrollView setMaximumZoomScale:2.0];
      [(RCWaveformScrollView *)self->_scrollView setMinimumZoomScale:0.5];
      double v6 = [(RCWaveformScrollView *)self->_scrollView pinchGestureRecognizer];
      double v7 = self->_pinchGesture;
      self->_pinchGesture = v6;

      [(UIPinchGestureRecognizer *)self->_pinchGesture addTarget:self action:"scaleWaveform:"];
      pinchGesture = self->_pinchGesture;
    }
    [(UIPinchGestureRecognizer *)pinchGesture setEnabled:v3];
  }
}

- (void)viewDidLayoutSubviews
{
  BOOL v3 = [(RCWaveformViewController *)self view];
  [v3 frame];
  CGFloat Width = CGRectGetWidth(v23);

  double v5 = [(RCWaveformViewController *)self view];
  [v5 frame];
  CGFloat Height = CGRectGetHeight(v24);

  if (self->_layoutWidth != Width || self->_layoutHeight != Height)
  {
    self->_double layoutWidth = Width;
    self->_layoutCGFloat Height = Height;
    [(RCWaveformScrollView *)self->_scrollView bounds];
    double v8 = v7;
    id v9 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v9 annotationViewHeight];
    double v11 = v8 - v10;
    [(RCWaveformScrollView *)self->_scrollView bounds];
    double v13 = v12;
    CATransform3D v14 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v14 annotationViewHeight];
    -[UIView setFrame:](self->_timeMarkerView, "setFrame:", 0.0, v11, v13, v15);

    [(RCWaveformViewController *)self selectedTimeRange];
    RCTimeRangeDeltaWithUIPrecision();
    if (v16 < 4.4408921e-16) {
      [(RCWaveformViewController *)self fixupScrollPositionToMatchIndicatorPositionTime];
    }
    long long v17 = [(RCWaveformViewController *)self view];
    [v17 frame];
    double v19 = v18;

    double v20 = 6.0;
    if (v19 > 0.0)
    {
      [(RCWaveformViewController *)self pointsPerSecond];
      double v20 = Width / v21;
    }
    [(RCWaveformViewController *)self setDesiredTimeDeltaForVisibleTimeRange:v20];
    [(UIView *)self->_waveformHostingView layoutSubviews];
    [(RCWaveformViewController *)self _updateCurrentTimeDisplay];
    [(RCWaveformViewController *)self reloadOverlayOffsets];
  }
}

- (void)reloadOverlayOffsets
{
}

- (void)setIsCompactView:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isCompactView = a3;
  -[UIView setHidden:](self->_timeMarkerView, "setHidden:");
  BOOL v5 = v3 && !self->_showPlayBarOnly;
  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setHidden:v5];
  [(UIView *)self->_selectionBackgroundView setHidden:v3];
  [(UIView *)self->_backgroundWaveFormHighlightView setHidden:v3];
  id v7 = [(RCWaveformViewController *)self applicationWaveformRenderer];
  if (v7) {
    [v7 setIsCompactView:v3];
  }
  [(RCWaveformViewController *)self updateBackgroundColor];
  double v6 = [(RCWaveformViewController *)self view];
  [v6 setNeedsLayout];
}

- (BOOL)isCompactView
{
  return self->_isCompactView;
}

- (void)setShowPlayBarOnly:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showPlayBarOnlCGFloat y = a3;
  -[RCWaveformSelectionOverlay setPlayBarOnly:](self->_selectionOverlay, "setPlayBarOnly:");
  if (self->_isCompactView && v3) {
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setHidden:0];
  }
  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setSelectionMode:v3];
  double v6 = [(RCWaveformViewController *)self applicationWaveformRenderer];
  if (v6)
  {
    id v7 = v6;
    [v6 setIsPlayBarOnlyMode:v3];
    double v6 = v7;
  }
}

- (void)_addWaveformViewToHostingView:(id)a3
{
  id v4 = a3;
  [v4 setUserInteractionEnabled:0];
  [(UIView *)self->_waveformHostingView addSubview:v4];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v17 = (id)objc_opt_new();
  BOOL v5 = [(UIView *)self->_waveformHostingView leadingAnchor];
  double v6 = [v4 leadingAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  [v17 addObject:v7];

  double v8 = [(UIView *)self->_waveformHostingView trailingAnchor];
  id v9 = [v4 trailingAnchor];
  double v10 = [v8 constraintEqualToAnchor:v9];
  [v17 addObject:v10];

  double v11 = [(UIView *)self->_waveformHostingView topAnchor];
  double v12 = [v4 topAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12];
  [v17 addObject:v13];

  CATransform3D v14 = [(UIView *)self->_waveformHostingView bottomAnchor];
  double v15 = [v4 bottomAnchor];

  double v16 = [v14 constraintEqualToAnchor:v15];
  [v17 addObject:v16];

  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)_setupViewsForWaveformOnlyDisplayStyle
{
  id v21 = [(RCWaveformRenderer *)self->_rendererController view];
  [v21 setUserInteractionEnabled:0];
  BOOL v3 = [(RCWaveformViewController *)self view];
  [v3 addSubview:v21];

  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = objc_opt_new();
  BOOL v5 = [(RCWaveformViewController *)self view];
  double v6 = [v5 leadingAnchor];
  id v7 = [v21 leadingAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7];
  [v4 addObject:v8];

  id v9 = [(RCWaveformViewController *)self view];
  double v10 = [v9 trailingAnchor];
  double v11 = [v21 trailingAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  [v4 addObject:v12];

  double v13 = [(RCWaveformViewController *)self view];
  CATransform3D v14 = [v13 topAnchor];
  double v15 = [v21 topAnchor];
  double v16 = [v14 constraintEqualToAnchor:v15];
  [v4 addObject:v16];

  id v17 = [(RCWaveformViewController *)self view];
  double v18 = [v17 bottomAnchor];
  double v19 = [v21 bottomAnchor];
  double v20 = [v18 constraintEqualToAnchor:v19];
  [v4 addObject:v20];

  +[NSLayoutConstraint activateConstraints:v4];
}

- (void)_setupViewsForApplicationDisplayStyle
{
  BOOL v3 = [RCWaveformScrollView alloc];
  id v4 = [(RCWaveformViewController *)self view];
  [v4 bounds];
  BOOL v5 = -[RCWaveformScrollView initWithFrame:](v3, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  [(RCWaveformScrollView *)self->_scrollView setAlwaysBounceHorizontal:1];
  [(RCWaveformScrollView *)self->_scrollView setDirectionalLockEnabled:1];
  id v7 = +[UIColor clearColor];
  [(RCWaveformScrollView *)self->_scrollView setBackgroundColor:v7];

  [(RCWaveformScrollView *)self->_scrollView setBounces:1];
  double v8 = [(RCWaveformViewController *)self view];
  [v8 bounds];
  -[RCWaveformScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, v9 * 0.5, 0.0, 0.0);

  [(RCWaveformScrollView *)self->_scrollView setDelegate:self];
  [(RCWaveformScrollView *)self->_scrollView setOpaque:0];
  [(RCWaveformScrollView *)self->_scrollView setScrollEnabled:1];
  [(RCWaveformScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(RCWaveformScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  objc_storeWeak((id *)&self->_zoomingDelegate, self->_scrollView);
  double v10 = [(RCWaveformScrollView *)self->_scrollView panGestureRecognizer];
  [v10 addTarget:self action:"_scrollViewPanGestureRecognized:"];

  [(RCWaveformScrollView *)self->_scrollView addSubview:self->_timeMarkerView];
  [(UIView *)self->_timeMarkerView setHidden:[(RCWaveformViewController *)self isCompactView]];
  long long v211 = 0u;
  long long v212 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  double v11 = self->_timeMarkerViews;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v209 objects:v220 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v210;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v210 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v209 + 1) + 8 * i);
        id v17 = +[RCRecorderStyleProvider sharedStyleProvider];
        [v17 annotationViewHeight];
        [v16 setFrame:0.0, 0.0, 0.0, v18];

        [(UIView *)self->_timeMarkerView addSubview:v16];
      }
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v209 objects:v220 count:16];
    }
    while (v13);
  }

  [(RCWaveformViewController *)self _setTimeMarkerViewsNeedInitialLayout:1];
  double left = UIEdgeInsetsZero.left;
  double right = UIEdgeInsetsZero.right;
  if ([(RCWaveformViewController *)self isOverview])
  {
    double bottom = UIEdgeInsetsZero.bottom;
  }
  else
  {
    v22 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v22 annotationViewHeight];
    double bottom = v23;
  }
  CGRect v24 = [RCWaveformSelectionOverlay alloc];
  [(RCWaveformScrollView *)self->_scrollView bounds];
  v26 = -[RCWaveformSelectionOverlay initWithDelegate:height:selectionAreaInsets:](v24, "initWithDelegate:height:selectionAreaInsets:", self, v25, UIEdgeInsetsZero.top, left, bottom, right);
  selectionOverlaCGFloat y = self->_selectionOverlay;
  self->_selectionOverlaCGFloat y = v26;

  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setSelectedTimeRangeMinimumDuration:1.0];
  BOOL v28 = [(RCWaveformViewController *)self isOverview];
  v29 = self->_selectionOverlay;
  if (v28)
  {
    [(RCWaveformSelectionOverlay *)v29 setOverviewTrimHandleStyle:1];
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setBarMatchesKnobRadius:1];
    v30 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v30 overviewKnobWidthMultiplier];
    -[RCWaveformSelectionOverlay setKnobWidthMultiplier:](self->_selectionOverlay, "setKnobWidthMultiplier:");

    v31 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v31 overviewPlayheadWidthMultiplier];
  }
  else
  {
    [(RCWaveformSelectionOverlay *)v29 setOverviewTrimHandleStyle:0];
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setBarMatchesKnobRadius:0];
    v32 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v32 knobWidthMultiplier];
    -[RCWaveformSelectionOverlay setKnobWidthMultiplier:](self->_selectionOverlay, "setKnobWidthMultiplier:");

    v31 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v31 playheadWidthMultiplier];
  }
  -[RCWaveformSelectionOverlay setPlayWidthMultiplier:](self->_selectionOverlay, "setPlayWidthMultiplier:");

  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setEnableTimeTrackingInView:v28];
  double v33 = 0.0;
  v34 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  selectionBackgroundView = self->_selectionBackgroundView;
  self->_selectionBackgroundView = v34;

  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setSelectionBackgroundView:self->_selectionBackgroundView];
  v36 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v36;

  v38 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  backgroundWaveFormHighlightView = self->_backgroundWaveFormHighlightView;
  self->_backgroundWaveFormHighlightView = v38;

  if ([(RCWaveformViewController *)self isOverview])
  {
    v40 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v40 overviewWaveformCornerRadius];
    double v42 = v41;
    v43 = [(UIView *)self->_backgroundView layer];
    [v43 setCornerRadius:v42];

    v44 = [(UIView *)self->_backgroundView layer];
    [v44 setMasksToBounds:1];

    v45 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v45 overviewWaveformCornerRadius];
    double v47 = v46;
    v48 = [(UIView *)self->_backgroundWaveFormHighlightView layer];
    [v48 setCornerRadius:v47];

    v49 = [(UIView *)self->_backgroundWaveFormHighlightView layer];
    [v49 setMasksToBounds:1];

    v50 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v50 overviewWaveformCornerRadius];
    double v52 = v51;
    v53 = [(RCWaveformRenderer *)self->_rendererController view];
    v54 = [v53 layer];
    [v54 setCornerRadius:v52];

    v55 = [(RCWaveformRenderer *)self->_rendererController view];
    v56 = [v55 layer];
    [v56 setMasksToBounds:1];
  }
  v57 = [(RCWaveformViewController *)self view];
  [v57 addSubview:self->_backgroundView];

  if ([(RCWaveformViewController *)self isOverview])
  {
    v58 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v58 selectionOverlayBorderWidth];
    double v33 = v59;
  }
  double v60 = -v33;
  if (![(RCWaveformViewController *)self isCompactView])
  {
    v61 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v61 annotationViewHeight];
    double v60 = v60 - v62;
  }
  [(UIView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  v63 = self->_backgroundView;
  v64 = [(RCWaveformViewController *)self view];
  v65 = +[NSLayoutConstraint constraintWithItem:v63 attribute:1 relatedBy:0 toItem:v64 attribute:1 multiplier:1.0 constant:0.0];

  v66 = v65;
  v207 = v65;
  LODWORD(v67) = 1144750080;
  [v65 setPriority:v67];
  v68 = self->_backgroundView;
  v69 = [(RCWaveformViewController *)self view];
  v70 = +[NSLayoutConstraint constraintWithItem:v68 attribute:2 relatedBy:0 toItem:v69 attribute:2 multiplier:1.0 constant:0.0];

  v206 = v70;
  LODWORD(v71) = 1144750080;
  [v70 setPriority:v71];
  v72 = self->_backgroundView;
  v73 = [(RCWaveformViewController *)self view];
  v74 = +[NSLayoutConstraint constraintWithItem:v72 attribute:3 relatedBy:0 toItem:v73 attribute:3 multiplier:1.0 constant:v33];

  v205 = v74;
  LODWORD(v75) = 1144750080;
  [v74 setPriority:v75];
  v76 = self->_backgroundView;
  v77 = [(RCWaveformViewController *)self view];
  v78 = +[NSLayoutConstraint constraintWithItem:v76 attribute:4 relatedBy:0 toItem:v77 attribute:4 multiplier:1.0 constant:v60];
  backgroundBottomToBottomConstraint = self->_backgroundBottomToBottomConstraint;
  self->_backgroundBottomToBottomConstraint = v78;

  LODWORD(v80) = 1144750080;
  [(NSLayoutConstraint *)self->_backgroundBottomToBottomConstraint setPriority:v80];
  v219[0] = v66;
  v219[1] = v70;
  v81 = self->_backgroundBottomToBottomConstraint;
  v219[2] = v74;
  v219[3] = v81;
  v82 = +[NSArray arrayWithObjects:v219 count:4];
  +[NSLayoutConstraint activateConstraints:v82];

  [(UIView *)self->_waveformHostingView setUserInteractionEnabled:0];
  [(UIView *)self->_waveformHostingView setClipsToBounds:1];
  v83 = [(RCWaveformViewController *)self view];
  [v83 addSubview:self->_waveformHostingView];

  [(UIView *)self->_waveformHostingView setTranslatesAutoresizingMaskIntoConstraints:0];
  waveformHostingView = self->_waveformHostingView;
  v85 = [(RCWaveformViewController *)self view];
  v86 = +[NSLayoutConstraint constraintWithItem:waveformHostingView attribute:1 relatedBy:0 toItem:v85 attribute:1 multiplier:1.0 constant:0.0];

  v87 = v86;
  v203 = v86;
  LODWORD(v88) = 1144750080;
  [v86 setPriority:v88];
  v89 = self->_waveformHostingView;
  v90 = [(RCWaveformViewController *)self view];
  v91 = +[NSLayoutConstraint constraintWithItem:v89 attribute:2 relatedBy:0 toItem:v90 attribute:2 multiplier:1.0 constant:0.0];

  v202 = v91;
  LODWORD(v92) = 1144750080;
  [v91 setPriority:v92];
  v93 = self->_waveformHostingView;
  v94 = [(RCWaveformViewController *)self view];
  v95 = +[NSLayoutConstraint constraintWithItem:v93 attribute:3 relatedBy:0 toItem:v94 attribute:3 multiplier:1.0 constant:v33];

  v201 = v95;
  LODWORD(v96) = 1144750080;
  [v95 setPriority:v96];
  v97 = self->_waveformHostingView;
  v98 = [(RCWaveformViewController *)self view];
  v99 = +[NSLayoutConstraint constraintWithItem:v97 attribute:4 relatedBy:0 toItem:v98 attribute:4 multiplier:1.0 constant:0.0];
  renderViewBottomInsetConstraint = self->_renderViewBottomInsetConstraint;
  self->_renderViewBottomInsetConstraint = v99;

  [(NSLayoutConstraint *)self->_renderViewBottomInsetConstraint setConstant:v60];
  LODWORD(v101) = 1144750080;
  [(NSLayoutConstraint *)self->_renderViewBottomInsetConstraint setPriority:v101];
  v218[0] = v87;
  v218[1] = v91;
  v102 = self->_renderViewBottomInsetConstraint;
  v218[2] = v95;
  v218[3] = v102;
  v103 = +[NSArray arrayWithObjects:v218 count:4];
  +[NSLayoutConstraint activateConstraints:v103];

  v104 = [(RCWaveformRenderer *)self->_rendererController view];
  [(RCWaveformViewController *)self _addWaveformViewToHostingView:v104];

  v105 = [(RCWaveformViewController *)self view];
  [v105 addSubview:self->_scrollView];

  [(RCWaveformScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  v106 = self->_scrollView;
  v107 = [(RCWaveformViewController *)self view];
  v108 = +[NSLayoutConstraint constraintWithItem:v106 attribute:1 relatedBy:0 toItem:v107 attribute:1 multiplier:1.0 constant:0.0];

  v109 = v108;
  v199 = v108;
  LODWORD(v110) = 1144750080;
  [v108 setPriority:v110];
  v111 = self->_scrollView;
  v112 = [(RCWaveformViewController *)self view];
  v113 = +[NSLayoutConstraint constraintWithItem:v111 attribute:2 relatedBy:0 toItem:v112 attribute:2 multiplier:1.0 constant:0.0];

  v114 = v113;
  v198 = v113;
  LODWORD(v115) = 1144750080;
  [v113 setPriority:v115];
  v116 = self->_scrollView;
  v117 = [(RCWaveformViewController *)self view];
  v118 = +[NSLayoutConstraint constraintWithItem:v116 attribute:3 relatedBy:0 toItem:v117 attribute:3 multiplier:1.0 constant:0.0];

  v197 = v118;
  LODWORD(v119) = 1144750080;
  [v118 setPriority:v119];
  v120 = self->_scrollView;
  v121 = [(RCWaveformViewController *)self view];
  v196 = +[NSLayoutConstraint constraintWithItem:v120 attribute:4 relatedBy:0 toItem:v121 attribute:4 multiplier:1.0 constant:0.0];

  LODWORD(v122) = 1144750080;
  [v196 setPriority:v122];
  v217[0] = v109;
  v217[1] = v114;
  v217[2] = v118;
  v217[3] = v196;
  v123 = +[NSArray arrayWithObjects:v217 count:4];
  +[NSLayoutConstraint activateConstraints:v123];

  v124 = [(RCWaveformViewController *)self view];
  [v124 sendSubviewToBack:self->_backgroundView];

  v125 = [(RCWaveformViewController *)self view];
  [v125 insertSubview:self->_backgroundWaveFormHighlightView aboveSubview:self->_backgroundView];

  [(UIView *)self->_backgroundWaveFormHighlightView setTranslatesAutoresizingMaskIntoConstraints:0];
  v126 = self->_backgroundWaveFormHighlightView;
  v127 = [(RCWaveformViewController *)self view];
  v128 = +[NSLayoutConstraint constraintWithItem:v126 attribute:1 relatedBy:0 toItem:v127 attribute:1 multiplier:1.0 constant:0.0];
  backgroundWaveFormHighlightViewLeftAlignment = self->_backgroundWaveFormHighlightViewLeftAlignment;
  self->_backgroundWaveFormHighlightViewLeftAlignment = v128;

  LODWORD(v130) = 1144750080;
  [(NSLayoutConstraint *)self->_backgroundWaveFormHighlightViewLeftAlignment setPriority:v130];
  v131 = self->_backgroundWaveFormHighlightView;
  v132 = [(RCWaveformViewController *)self view];
  v133 = +[NSLayoutConstraint constraintWithItem:v131 attribute:2 relatedBy:0 toItem:v132 attribute:2 multiplier:1.0 constant:0.0];
  backgroundWaveFormHighlightViewRightAlignment = self->_backgroundWaveFormHighlightViewRightAlignment;
  self->_backgroundWaveFormHighlightViewRightAlignment = v133;

  LODWORD(v135) = 1144750080;
  [(NSLayoutConstraint *)self->_backgroundWaveFormHighlightViewRightAlignment setPriority:v135];
  v136 = self->_backgroundWaveFormHighlightView;
  v137 = [(RCWaveformViewController *)self view];
  v138 = +[NSLayoutConstraint constraintWithItem:v136 attribute:3 relatedBy:0 toItem:v137 attribute:3 multiplier:1.0 constant:v33];

  LODWORD(v139) = 1144750080;
  [v138 setPriority:v139];
  v140 = self->_backgroundWaveFormHighlightView;
  v141 = [(RCWaveformViewController *)self view];
  v142 = +[NSLayoutConstraint constraintWithItem:v140 attribute:4 relatedBy:0 toItem:v141 attribute:4 multiplier:1.0 constant:v60];
  backgroundWaveformHighlightViewBottomToBottom = self->_backgroundWaveformHighlightViewBottomToBottom;
  self->_backgroundWaveformHighlightViewBottomToBottom = v142;

  LODWORD(v144) = 1144750080;
  [(NSLayoutConstraint *)self->_backgroundWaveformHighlightViewBottomToBottom setPriority:v144];
  v145 = self->_backgroundWaveFormHighlightViewRightAlignment;
  v216[0] = self->_backgroundWaveFormHighlightViewLeftAlignment;
  v216[1] = v145;
  v146 = self->_backgroundWaveformHighlightViewBottomToBottom;
  v216[2] = v138;
  v216[3] = v146;
  v147 = +[NSArray arrayWithObjects:v216 count:4];
  +[NSLayoutConstraint activateConstraints:v147];

  [(UIView *)self->_selectionBackgroundView setHidden:self->_isCompactView];
  v148 = [(RCWaveformViewController *)self view];
  [v148 insertSubview:self->_selectionBackgroundView aboveSubview:self->_backgroundWaveFormHighlightView];

  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setHidden:self->_isCompactView];
  v149 = [(RCWaveformViewController *)self view];
  [v149 addSubview:self->_selectionOverlay];

  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setTranslatesAutoresizingMaskIntoConstraints:0];
  v204 = +[NSLayoutConstraint constraintWithItem:self->_selectionOverlay attribute:1 relatedBy:0 toItem:self->_scrollView attribute:1 multiplier:1.0 constant:0.0];
  LODWORD(v150) = 1144750080;
  [v204 setPriority:v150];
  v200 = +[NSLayoutConstraint constraintWithItem:self->_selectionOverlay attribute:2 relatedBy:0 toItem:self->_scrollView attribute:2 multiplier:1.0 constant:0.0];
  LODWORD(v151) = 1144750080;
  [v200 setPriority:v151];
  v195 = +[NSLayoutConstraint constraintWithItem:self->_selectionOverlay attribute:3 relatedBy:0 toItem:self->_scrollView attribute:3 multiplier:1.0 constant:0.0];
  LODWORD(v152) = 1144750080;
  [v195 setPriority:v152];
  v194 = +[NSLayoutConstraint constraintWithItem:self->_selectionOverlay attribute:4 relatedBy:0 toItem:self->_scrollView attribute:4 multiplier:1.0 constant:0.0];
  LODWORD(v153) = 1144750080;
  [v194 setPriority:v153];
  v215[0] = v204;
  v215[1] = v200;
  v215[2] = v195;
  v215[3] = v194;
  v154 = +[NSArray arrayWithObjects:v215 count:4];
  +[NSLayoutConstraint activateConstraints:v154];

  v193 = +[UIBlurEffect effectWithBlurRadius:0.1];
  v155 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v193];
  [(UIVisualEffectView *)v155 setAlpha:0.0];
  blurEffectView = self->_blurEffectView;
  self->_blurEffectView = v155;
  v157 = v155;

  v158 = [(RCWaveformViewController *)self view];
  v192 = v157;
  [v158 addSubview:v157];

  v159 = [(RCWaveformViewController *)self view];
  [v159 bringSubviewToFront:v157];

  v160 = [(RCWaveformViewController *)self view];
  [v160 bringSubviewToFront:self->_selectionOverlay];

  [(UIVisualEffectView *)self->_blurEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  v161 = self->_blurEffectView;
  v162 = [(RCWaveformViewController *)self view];
  v163 = +[NSLayoutConstraint constraintWithItem:v161 attribute:1 relatedBy:0 toItem:v162 attribute:1 multiplier:1.0 constant:0.0];

  v208 = v163;
  LODWORD(v164) = 1144750080;
  [v163 setPriority:v164];
  v165 = self->_blurEffectView;
  v166 = [(RCWaveformViewController *)self view];
  v167 = +[NSLayoutConstraint constraintWithItem:v165 attribute:2 relatedBy:0 toItem:v166 attribute:2 multiplier:1.0 constant:0.0];

  LODWORD(v168) = 1144750080;
  [v167 setPriority:v168];
  v169 = self->_blurEffectView;
  v170 = [(RCWaveformViewController *)self view];
  v171 = +[NSLayoutConstraint constraintWithItem:v169 attribute:3 relatedBy:0 toItem:v170 attribute:3 multiplier:1.0 constant:0.0];

  v191 = v171;
  LODWORD(v172) = 1144750080;
  [v171 setPriority:v172];
  v173 = self->_blurEffectView;
  v174 = [(RCWaveformViewController *)self view];
  v190 = +[NSLayoutConstraint constraintWithItem:v173 attribute:4 relatedBy:0 toItem:v174 attribute:4 multiplier:1.0 constant:0.0];

  LODWORD(v175) = 1144750080;
  [v190 setPriority:v175];
  v214[0] = v163;
  v214[1] = v167;
  v214[2] = v171;
  v214[3] = v190;
  v176 = +[NSArray arrayWithObjects:v214 count:4];
  +[NSLayoutConstraint activateConstraints:v176];

  v177 = +[UIBlurEffect effectWithBlurRadius:0.1];
  v178 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v177];
  [(UIVisualEffectView *)v178 setAlpha:0.0];
  waveformExtraBlurEffectView = self->_waveformExtraBlurEffectView;
  self->_waveformExtraBlurEffectView = v178;
  v180 = v178;

  [(UIView *)self->_waveformHostingView addSubview:v180];
  [(UIView *)self->_waveformHostingView bringSubviewToFront:v180];
  [(UIVisualEffectView *)self->_waveformExtraBlurEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  v181 = +[NSLayoutConstraint constraintWithItem:self->_waveformExtraBlurEffectView attribute:1 relatedBy:0 toItem:self->_waveformHostingView attribute:1 multiplier:1.0 constant:0.0];
  LODWORD(v182) = 1144750080;
  [v181 setPriority:v182];
  v183 = +[NSLayoutConstraint constraintWithItem:self->_waveformExtraBlurEffectView attribute:2 relatedBy:0 toItem:self->_waveformHostingView attribute:2 multiplier:1.0 constant:0.0];
  LODWORD(v184) = 1144750080;
  [v183 setPriority:v184];
  v185 = +[NSLayoutConstraint constraintWithItem:self->_waveformExtraBlurEffectView attribute:3 relatedBy:0 toItem:self->_waveformHostingView attribute:3 multiplier:1.0 constant:0.0];
  LODWORD(v186) = 1144750080;
  [v185 setPriority:v186];
  v187 = +[NSLayoutConstraint constraintWithItem:self->_waveformExtraBlurEffectView attribute:4 relatedBy:0 toItem:self->_waveformHostingView attribute:4 multiplier:1.0 constant:0.0];
  LODWORD(v188) = 1144750080;
  [v187 setPriority:v188];
  v213[0] = v181;
  v213[1] = v183;
  v213[2] = v185;
  v213[3] = v187;
  v189 = +[NSArray arrayWithObjects:v213 count:4];
  +[NSLayoutConstraint activateConstraints:v189];

  [(RCWaveformViewController *)self setScrubbingEnabled:1];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)RCWaveformViewController;
  [(RCWaveformViewController *)&v7 viewDidLoad];
  if (self->_displayStyle == 1) {
    [(RCWaveformViewController *)self _setupViewsForWaveformOnlyDisplayStyle];
  }
  else {
    [(RCWaveformViewController *)self _setupViewsForApplicationDisplayStyle];
  }
  [(RCWaveformViewController *)self updateColors];
  [(RCWaveformViewController *)self _updateVisibleAreaWithAnimationDuration:0.0];
  [(RCWaveformViewController *)self _updateWaveformViewContentSizeAndOffset];
  BOOL v3 = [(RCWaveformViewController *)self view];
  [v3 setNeedsLayout];

  id v4 = self;
  double v8 = v4;
  BOOL v5 = +[NSArray arrayWithObjects:&v8 count:1];
  id v6 = [(RCWaveformViewController *)self registerForTraitChanges:v5 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
}

- (void)viewWillLayoutSubviews
{
  double v3 = 0.0;
  if ([(RCWaveformViewController *)self isOverview])
  {
    id v4 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v4 selectionOverlayBorderWidth];
    double v3 = -v5;
  }
  if (![(RCWaveformViewController *)self isCompactView])
  {
    id v6 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v6 annotationViewHeight];
    double v3 = v3 - v7;
  }
  [(NSLayoutConstraint *)self->_renderViewBottomInsetConstraint constant];
  if (v8 != v3) {
    [(NSLayoutConstraint *)self->_renderViewBottomInsetConstraint setConstant:v3];
  }
  [(NSLayoutConstraint *)self->_backgroundBottomToBottomConstraint constant];
  if (v9 != v3) {
    [(NSLayoutConstraint *)self->_backgroundBottomToBottomConstraint setConstant:v3];
  }
  [(NSLayoutConstraint *)self->_backgroundWaveformHighlightViewBottomToBottom constant];
  if (v10 != v3) {
    [(NSLayoutConstraint *)self->_backgroundWaveformHighlightViewBottomToBottom setConstant:v3];
  }
  [(RCWaveformViewController *)self _updateWaveformViewContentSizeAndOffset];
  [(RCWaveformViewController *)self _updateAnnotationViews];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B46AC;
  v11[3] = &unk_100221278;
  v11[4] = self;
  +[UIView performWithoutAnimation:v11];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_isScrubbingSelectionTimeRange
{
  if (self->_scrubbing)
  {
    BOOL v3 = [(RCWaveformViewController *)self isSelectedTimeRangeEditingEnabled];
    if (v3)
    {
      [(RCWaveformViewController *)self selectedTimeRange];
      RCTimeRangeDeltaWithUIPrecision();
      LOBYTE(v3) = v4 != 0.0;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_isScrubbing
{
  return self->_scrubbing;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v16 = a3;
  unsigned __int8 v4 = [v16 isZooming];
  double v5 = v16;
  if ((v4 & 1) == 0)
  {
    id v6 = v16;
    [v6 beginIgnoringContentOffsetChanges];
    if (self->_scrubbing)
    {
      [v6 contentOffsetInPresentationLayer:0];
      double v8 = v7;
      [(RCWaveformRenderer *)self->_rendererController setFrequentUpdatesSegmentUpdatesExpectedHint:self->_scrubbing];
      [(RCWaveformRenderer *)self->_rendererController timeAtHorizontalOffset:v8];
      double v10 = v9;
      [(RCWaveformViewController *)self desiredTimeDeltaForVisibleTimeRange];
      double v12 = v11;
      RCTimeRangeMake();
      -[RCWaveformViewController setVisibleTimeRange:](self, "setVisibleTimeRange:");
      if (self->_scrubbing)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v14 = objc_opt_respondsToSelector();

        if (v14)
        {
          id v15 = objc_loadWeakRetained((id *)&self->_delegate);
          [v15 waveformViewController:self didScrubToTime:0 finished:v10 + v12 * 0.5];
        }
      }
    }
    [v6 endIgnoringContentOffsetChanges];

    double v5 = v16;
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a5->x;
  [(RCWaveformViewController *)self desiredTimeDeltaForVisibleTimeRange];
  double v9 = v8;
  [(RCWaveformScrollView *)self->_scrollView bounds];
  CGFloat v10 = CGRectGetWidth(v17) * 0.5;
  [(RCWaveformViewController *)self currentTimeIndicatorCoordinate];
  double v12 = v10 - v11;
  double v13 = v9 * -0.5;
  [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:v13];
  double v15 = v12 + v14;
  if (x >= v15)
  {
    [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:self->_duration + v13];
    double v15 = v12 + v16;
    if (x <= v15) {
      double v15 = x;
    }
  }
  a5->double x = v15;
}

- (void)_scrubbingDidFinish
{
  self->_scrubbing = 0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(RCWaveformViewController *)self _scrubbingDidFinish];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)stopScrolling
{
  self->_scrubbing = 0;
  [(RCWaveformScrollView *)self->_scrollView setScrollEnabled:0];
  scrollView = self->_scrollView;
  [(RCWaveformScrollView *)scrollView contentOffset];
  -[RCWaveformScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 0);
  [(RCWaveformScrollView *)self->_scrollView setScrollEnabled:self->_scrubbingEnabled];

  [(RCWaveformViewController *)self fixupScrollPositionToMatchIndicatorPositionTime];
}

- (void)waveformSelectionOverlay:(id)a3 willBeginTrackingSelectionBeginTime:(BOOL)a4 endTime:(BOOL)a5 assetCurrentTime:(BOOL)a6
{
  if (a4 || a5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained waveformViewControllerWillBeginEditingSelectedTimeRange:self];
  }
}

- (void)waveformSelectionOverlay:(id)a3 didFinishTrackingSelectionBeginTime:(BOOL)a4 endTime:(BOOL)a5 assetCurrentTime:(BOOL)a6
{
  BOOL v6 = a5;
  [(NSTimer *)self->_overlayAutoscrollTimer invalidate];
  overlayAutoscrollTimer = self->_overlayAutoscrollTimer;
  self->_overlayAutoscrollTimer = 0;

  if (a4 || v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained waveformViewControllerDidEndEditingSelectedTimeRange:self];
  }

  [(RCWaveformViewController *)self _updateWaveformViewContentSizeAndOffset];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)waveformSelectionOverlay:(id)a3 willChangeSelectedTimeRange:(id)a4 isTrackingMin:(BOOL)a5 isTrackingMax:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  -[RCWaveformViewController _setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:](self, "_setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:", 0, 0, 1, a4.var0, a4.var1, 0.0);
  if (!self->_overlayAutoscrollTimer && !self->_isOverview)
  {
    double v9 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_autoscrollOverlayIfNecessary" selector:0 userInfo:1 repeats:0.1];
    overlayAutoscrollTimer = self->_overlayAutoscrollTimer;
    self->_overlayAutoscrollTimer = v9;

    self->_overlayAutoscrollRateForSelectionTracking = 1.0;
    [(RCWaveformViewController *)self desiredTimeDeltaForVisibleTimeRange];
    self->_overlayAutoscrollBaseDuration = v11;
  }
  if (self->_selectedTimeRangeEditingEnabled && self->_isOverview && !self->_playing && !self->_scrubbing)
  {
    if (!v7 || v6)
    {
      if (!v6 || v7)
      {
        if (v7 && v6)
        {
          RCTimeRangeGetMidTime();
          double v19 = v18;
          if (self->_currentTime != v18)
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            double v13 = WeakRetained;
            double v15 = self;
            double endTime = v19;
            goto LABEL_17;
          }
        }
      }
      else if (self->_currentTime != self->_selectedTimeRange.endTime)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        double v13 = WeakRetained;
        double endTime = self->_selectedTimeRange.endTime;
        goto LABEL_16;
      }
    }
    else if (self->_currentTime != self->_selectedTimeRange.beginTime)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      double v13 = WeakRetained;
      double endTime = self->_selectedTimeRange.beginTime;
LABEL_16:
      double v15 = self;
LABEL_17:
      [WeakRetained waveformViewController:v15 didScrubToTime:1 finished:endTime];
    }
  }
  double beginTime = self->_selectedTimeRange.beginTime;
  double v17 = self->_selectedTimeRange.endTime;
  result.double var1 = v17;
  result.double var0 = beginTime;
  return result;
}

- (double)waveformSelectionOverlay:(id)a3 willChangeAssetCurrentTime:(double)a4 isTracking:(BOOL)a5
{
  if (self->_selectedTimeRangeEditingEnabled)
  {
    id v7 = a3;
    [v7 selectedTimeRange];
    double v9 = v8;
    [v7 selectedTimeRange];
    double v11 = v10;

    if (v11 <= a4) {
      double v12 = v11;
    }
    else {
      double v12 = a4;
    }
    if (v12 >= v9) {
      a4 = v12;
    }
    else {
      a4 = v9;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained waveformViewController:self didScrubToTime:0 finished:a4];

  return a4;
}

- (double)waveformSelectionOverlay:(id)a3 offsetForTime:(double)a4
{
  -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", a3, self->_visibleTimeRange.beginTime);
  double v7 = v6;
  [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:a4];
  return v8 - v7;
}

- (double)waveformSelectionOverlay:(id)a3 timeForOffset:(double)a4
{
  -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", a3, self->_visibleTimeRange.beginTime);
  rendererController = self->_rendererController;
  double v8 = v7 + a4;

  [(RCWaveformRenderer *)rendererController timeAtHorizontalOffset:v8];
  return result;
}

- (double)waveformSelectionOverlayGetCurrentTime:(id)a3
{
  return self->_currentTime;
}

- (BOOL)waveformSelectionOverlayNeedsExplicitAnimations
{
  v2 = [(RCWaveformViewController *)self splitViewController];
  unsigned __int8 v3 = [v2 isTransitioningBetweenVisibleColumnStates];

  return v3;
}

- (BOOL)isZooming
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zoomingDelegate);
  unsigned __int8 v3 = [WeakRetained isZooming];

  return v3;
}

- (void)waveformRenderer:(id)a3 contentWidthDidChange:(double)a4
{
  id v6 = a3;
  if (self->_displayStyle != 1)
  {
    id v7 = v6;
    [(RCWaveformViewController *)self _updateWaveformViewContentSizeAndOffsetToSize:a4];
    [(RCWaveformViewController *)self _updateSelectionOverlayWithAnimationDuration:0.0];
    [(RCWaveformViewController *)self _updateBackgroundWaveformHighlight];
    id v6 = v7;
    if (!self->_isOverview)
    {
      [(RCWaveformViewController *)self _updateCurrentTimeDisplay];
      [(RCWaveformViewController *)self fixupScrollPositionToMatchIndicatorPositionTime];
      id v6 = v7;
    }
  }
}

- (RCTimeController)activeTimeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v3 = [WeakRetained activeTimeController];

  return (RCTimeController *)v3;
}

- (double)desiredTimeDeltaForVisibleTimeRange
{
  return self->_desiredTimeDeltaForVisibleTimeRange;
}

- (void)setDesiredTimeDeltaForVisibleTimeRange:(double)a3
{
  if (a3 <= 0.0) {
    a3 = 6.0;
  }
  if (self->_desiredTimeDeltaForVisibleTimeRange != a3)
  {
    self->_desiredTimeDeltaForVisibleTimeRange = a3;
    [(RCWaveformViewController *)self pointsPerSecond];
    double v5 = 100.0 / v4;
    if (v5 > 2.0) {
      double v5 = 2.0;
    }
    selectionOverlaCGFloat y = self->_selectionOverlay;
    [(RCWaveformSelectionOverlay *)selectionOverlay setSelectedTimeRangeMinimumDuration:v5];
  }
}

- (id)applicationWaveformRenderer
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v3 = self->_rendererController;
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [a4 userInterfaceStyle:a3];
  id v6 = [(RCWaveformViewController *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    [(RCWaveformViewController *)self updateColors];
    rendererController = self->_rendererController;
    [(RCWaveformRenderer *)rendererController setCalcBlockShouldRefreshAllSlices:1];
  }
}

- (void)updateBackgroundColor
{
  if (self->_displayStyle == 1)
  {
    id v9 = [(RCWaveformViewController *)self view];
    [v9 setBackgroundColor:0];
  }
  else
  {
    id v9 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned __int8 v3 = [v9 timelinePlaybackBackgroundColor];
    double v4 = [(RCWaveformViewController *)self view];
    [v4 setBackgroundColor:v3];

    if ([(RCWaveformViewController *)self isCompactView]
      && ![(RCWaveformViewController *)self isOverview])
    {
      id v7 = [v9 waveformCompactBackgroundColor];
      [(UIView *)self->_backgroundView setBackgroundColor:v7];

      uint64_t v6 = [v9 waveformCompactHighlightedBackgroundColor];
    }
    else
    {
      id v5 = [v9 waveformPlaybackBackgroundColor];
      [(UIView *)self->_backgroundView setBackgroundColor:v5];

      uint64_t v6 = [v9 waveformPlaybackHighlightedBackgroundColor];
    }
    double v8 = (void *)v6;
    [(UIView *)self->_backgroundWaveFormHighlightView setBackgroundColor:v6];
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_visibleTimeRangeForCurrentSelectionTimeRange
{
  if ([(RCWaveformViewController *)self isOverview])
  {
    RCTimeRangeMake();
  }
  else
  {
    double beginTime = self->_visibleTimeRange.beginTime;
    double endTime = self->_visibleTimeRange.endTime;
  }
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (void)_setVisibleTimeRange:(id)a3 animationDuration:(double)a4 completionBlock:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = (void (**)(id, uint64_t))a5;
  RCTimeRangeDeltaWithUIPrecision();
  if (v10 < 2.22044605e-16) {
    double var1 = var0 + 2.22044605e-16;
  }
  if (RCTimeRangeEqualToTimeRange())
  {
    [(RCWaveformViewController *)self _updateVisibleAreaWithAnimationDuration:0.0];
  }
  else
  {
    uint64_t v27 = 0;
    BOOL v28 = &v27;
    uint64_t v29 = 0x2020000000;
    BOOL v30 = 0;
    RCTimeRangeDeltaWithUIPrecision();
    double v12 = v11;
    RCTimeRangeDeltaWithUIPrecision();
    BOOL v30 = vabdd_f64(v12, v13) > 0.00000011920929;
    self->_visibleTimeRange.double beginTime = var0;
    self->_visibleTimeRange.double endTime = var1;
    if (*((unsigned char *)v28 + 24)) {
      [(RCWaveformViewController *)self _setTimeMarkerViewsNeedInitialLayout:1];
    }
    double v14 = [(RCWaveformViewController *)self view];
    id v15 = [v14 viewWithTag:92314];

    if (!v15)
    {
      id v15 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      [v15 setTag:92314];
      double v16 = +[UIColor clearColor];
      [v15 setBackgroundColor:v16];

      double v17 = [(RCWaveformViewController *)self view];
      [v17 addSubview:v15];
    }
    [v15 setAlpha:1.0];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000B5698;
    v23[3] = &unk_100223180;
    double v26 = a4;
    v23[4] = self;
    double v25 = &v27;
    id v18 = v15;
    id v24 = v18;
    double v19 = objc_retainBlock(v23);
    double v20 = v19;
    if (a4 <= 0.0)
    {
      ((void (*)(void *))v19[2])(v19);
      if (v9) {
        v9[2](v9, 1);
      }
    }
    else
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000B573C;
      v21[3] = &unk_100221DE0;
      v22 = v9;
      +[UIView animateWithDuration:0x20000 delay:v20 options:v21 animations:a4 completion:0.0];
    }
    _Block_object_dispose(&v27, 8);
  }
}

- (void)_setSelectedTimeRange:(id)a3 updateVisibleTimeRange:(BOOL)a4 updateWaveformViewContentSizeAndOffset:(BOOL)a5 notifyDelegate:(BOOL)a6 animationDuration:(double)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v10 = a4;
  double v12 = fmax(a3.var0, 0.0);
  if (self->_duration >= a3.var1) {
    double var1 = a3.var1;
  }
  else {
    double var1 = self->_duration;
  }
  p_selectedTimeRange = &self->_selectedTimeRange;
  if ((RCTimeRangeEqualToTimeRange() & 1) == 0)
  {
    p_selectedTimeRange->double beginTime = v12;
    p_selectedTimeRange->double endTime = var1;
    if (v8) {
      [(RCWaveformViewController *)self _updateWaveformViewContentSizeAndOffset];
    }
    if (v10)
    {
      if (self->_isOverview)
      {
        [(RCWaveformViewController *)self updateVisibleTimeRangeToFullDuration];
      }
      else
      {
        [(RCWaveformViewController *)self _visibleTimeRangeForCurrentSelectionTimeRange];
        double v16 = v15;
        double v18 = v17;
        if ((RCTimeRangeEqualToTimeRange() & 1) == 0) {
          -[RCWaveformViewController setVisibleTimeRange:animationDuration:](self, "setVisibleTimeRange:animationDuration:", v16, v18, a7);
        }
      }
    }
    [(RCWaveformViewController *)self _updateSelectionOverlayWithAnimationDuration:a7];
    [(RCWaveformViewController *)self _updateBackgroundWaveformHighlight];
    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained waveformViewController:self didChangeToSelectedTimeRange:p_selectedTimeRange->beginTime p_selectedTimeRange->endTime];
    }
    rendererController = self->_rendererController;
    [(RCWaveformRenderer *)rendererController drawWaveform];
  }
}

- (void)_autoscrollOverlayIfNecessary
{
  int64_t v3 = [(RCWaveformSelectionOverlay *)self->_selectionOverlay beginTimeIndicatorSelectionAffinity];
  int64_t v4 = [(RCWaveformSelectionOverlay *)self->_selectionOverlay endTimeIndicatorSelectionAffinity];
  [(RCWaveformViewController *)self desiredTimeDeltaForVisibleTimeRange];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B5A7C;
  v9[3] = &unk_1002231A8;
  v9[5] = v5;
  v9[4] = self;
  uint64_t v6 = objc_retainBlock(v9);
  p_visibleTimeRange = &self->_visibleTimeRange;
  if ((((uint64_t (*)(void *, const __CFString *, int64_t, void, uint64_t, double))v6[2])(v6, @"[min-marker, max]", v3, 0, 1, self->_visibleTimeRange.endTime - self->_selectedTimeRange.beginTime) & 1) == 0&& (((uint64_t (*)(void *, const __CFString *, int64_t, void, uint64_t, double))v6[2])(v6, @"[min-marker, min]", v3, 0, 0xFFFFFFFFLL, self->_selectedTimeRange.beginTime - p_visibleTimeRange->beginTime) & 1) == 0&& (((uint64_t (*)(void *, const __CFString *, int64_t, uint64_t, uint64_t, double))v6[2])(v6, @"[max-marker, max]", v4, 1, 1,
          self->_visibleTimeRange.endTime - self->_selectedTimeRange.endTime) & 1) == 0
    && (((uint64_t (*)(void *, const __CFString *, int64_t, uint64_t, uint64_t, double))v6[2])(v6, @"[max-marker, min]", v4, 1, 0xFFFFFFFFLL, self->_selectedTimeRange.endTime - p_visibleTimeRange->beginTime) & 1) == 0)
  {
    [(NSTimer *)self->_overlayAutoscrollTimer invalidate];
    overlayAutoscrollTimer = self->_overlayAutoscrollTimer;
    self->_overlayAutoscrollTimer = 0;
  }
}

- (void)_setTimeMarkerViewUpdatesDisabled:(BOOL)a3
{
  self->_timeMarkerViewsUpdatesDisabled = a3;
  if (a3)
  {
    int64_t v4 = [(RCWaveformViewController *)self view];
    double v5 = 0.200000003;
  }
  else
  {
    int64_t v4 = self->_timeMarkerView;
    double v5 = 1.0;
  }
  timeMarkerViews = self->_timeMarkerViews;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B5E84;
  v9[3] = &unk_1002231D0;
  BOOL v10 = v4;
  BOOL v7 = v4;
  [(NSMutableArray *)timeMarkerViews enumerateObjectsUsingBlock:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B5F14;
  v8[3] = &unk_100221D90;
  v8[4] = self;
  *(double *)&v8[5] = v5;
  +[UIView animateWithDuration:v8 animations:0.5];
}

- (void)_updateBackgroundWaveformHighlight
{
  [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:self->_visibleTimeRange.beginTime];
  double v4 = v3;
  [(UIView *)self->_backgroundView bounds];
  double v9 = 0.0;
  double v10 = 0.0;
  if (v7 > 0.0)
  {
    double v11 = v5;
    CGFloat v12 = v6;
    double v13 = v7;
    CGFloat v14 = v8;
    [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:0.0];
    double v10 = v15 - v4;
    v27.origin.double x = v11;
    v27.origin.CGFloat y = v12;
    v27.size.CGFloat width = v13;
    v27.size.double height = v14;
    double MinX = CGRectGetMinX(v27);
    if (v10 < MinX) {
      double v10 = MinX;
    }
    v28.origin.double x = v11;
    v28.origin.CGFloat y = v12;
    v28.size.CGFloat width = v13;
    v28.size.double height = v14;
    double MaxX = CGRectGetMaxX(v28);
    if (v10 >= MaxX) {
      double v10 = MaxX;
    }
    [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:self->_duration];
    double v19 = v18;
    v29.origin.double x = v11;
    v29.origin.CGFloat y = v12;
    v29.size.CGFloat width = v13;
    v29.size.double height = v14;
    double v20 = CGRectGetMaxX(v29);
    v30.origin.double x = v11;
    v30.origin.CGFloat y = v12;
    v30.size.CGFloat width = v13;
    v30.size.double height = v14;
    double v5 = CGRectGetMinX(v30);
    double v21 = 0.0;
    if (!self->_capturing)
    {
      double v22 = v19 - v4;
      if (v19 - v4 >= v20) {
        double v22 = v20;
      }
      if (v22 >= v5) {
        double v5 = v22;
      }
      double v21 = v11 + v13 - v5;
    }
    double v9 = -v21;
  }
  [(NSLayoutConstraint *)self->_backgroundWaveFormHighlightViewLeftAlignment constant];
  if (v10 != v23) {
    [(NSLayoutConstraint *)self->_backgroundWaveFormHighlightViewLeftAlignment setConstant:v10];
  }
  [(NSLayoutConstraint *)self->_backgroundWaveFormHighlightViewRightAlignment constant];
  if (v9 != v24)
  {
    backgroundWaveFormHighlightViewRightAlignment = self->_backgroundWaveFormHighlightViewRightAlignment;
    [(NSLayoutConstraint *)backgroundWaveFormHighlightViewRightAlignment setConstant:v9];
  }
}

- (void)_updateWaveformViewContentSizeAndOffsetToSize:(double)a3
{
  double v5 = [(RCWaveformViewController *)self view];
  [v5 bounds];
  double v7 = v6 * 0.5 + a3;

  if (self->_isPlayback
    || self->_isOverview
    || !self->_selectedTimeRangeEditingEnabled
    || [(RCWaveformSelectionOverlay *)self->_selectionOverlay isCurrentlyTracking])
  {
    double v8 = [(RCWaveformViewController *)self view];
    [v8 bounds];
    double v10 = v9;

    if (v7 >= v10) {
      double v10 = v7;
    }
    p_scrollView = &self->_scrollView;
    [(RCWaveformScrollView *)self->_scrollView bounds];
    -[RCWaveformScrollView setContentSize:](self->_scrollView, "setContentSize:", v10, v12);
    id v22 = [(RCWaveformViewController *)self view];
    [v22 bounds];
    double v14 = v13 * 0.5;
    double v15 = 0.0;
  }
  else
  {
    [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:self->_selectedTimeRange.beginTime];
    double v17 = v16;
    [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:self->_selectedTimeRange.endTime];
    double v19 = v18;
    p_scrollView = &self->_scrollView;
    [(RCWaveformScrollView *)self->_scrollView bounds];
    -[RCWaveformScrollView setContentSize:](self->_scrollView, "setContentSize:", v7, v20);
    id v22 = [(RCWaveformViewController *)self view];
    [v22 bounds];
    double v14 = v21 * 0.5 - v17;
    double v15 = -(a3 - v19);
  }
  -[RCWaveformScrollView setContentInset:](*p_scrollView, "setContentInset:", 0.0, v14, 0.0, v15);
}

- (void)_updateWaveformViewContentSizeAndOffset
{
  [(RCWaveformRenderer *)self->_rendererController contentWidth];

  -[RCWaveformViewController _updateWaveformViewContentSizeAndOffsetToSize:](self, "_updateWaveformViewContentSizeAndOffsetToSize:");
}

- (void)_updateAnnotationViews
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000B63D4;
  v2[3] = &unk_100221278;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)fixupScrollPositionToMatchIndicatorPositionTime
{
  if (self->_displayStyle == 1)
  {
    [(RCWaveformViewController *)self _updateCurrentTimeDisplay];
  }
  else
  {
    -[RCWaveformRenderer horizontalOffsetAtTime:withVisibleTimeRange:](self->_rendererController, "horizontalOffsetAtTime:withVisibleTimeRange:", self->_visibleTimeRange.beginTime, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
    double v4 = v3;
    [(RCWaveformScrollView *)self->_scrollView contentOffsetInPresentationLayer:1];
    if (vabdd_f64(v5, v4) > 0.00000011920929)
    {
      [(RCWaveformScrollView *)self->_scrollView visibleBounds];
      if (v6 > 0.00000011920929)
      {
        -[RCWaveformScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v4, 0.0);
        [(RCWaveformViewController *)self _updateCurrentTimeDisplay];
        [(RCWaveformViewController *)self _updateVisibleAreaWithAnimationDuration:0.0];
      }
    }
  }
}

- (void)_updateVisibleAreaWithAnimationDuration:(double)a3
{
  -[RCWaveformRenderer setVisibleTimeRange:](self->_rendererController, "setVisibleTimeRange:", self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  if (self->_displayStyle != 1)
  {
    if (!self->_scrubbing)
    {
      [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:self->_visibleTimeRange.beginTime];
      double v6 = RCRoundCoord(v5);
      [(RCWaveformScrollView *)self->_scrollView visibleBounds];
      v10.origin.double x = v6;
      v10.origin.CGFloat y = v9.origin.y;
      v10.size.CGFloat width = v6;
      v10.size.double height = v9.size.height;
      BOOL v7 = CGRectIntersectsRect(v9, v10);
      if (a3 == 0.0 || !v7)
      {
        -[RCWaveformScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 0, v6, 0.0);
      }
      else
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_1000B69F0;
        v8[3] = &unk_100221D68;
        v8[4] = self;
        *(double *)&v8[5] = v6;
        void v8[6] = 0;
        +[UIView animateWithDuration:131076 delay:v8 options:0 animations:a3 completion:0.0];
      }
    }
    [(RCWaveformViewController *)self _updateAnnotationViews];
  }
}

- (void)_updateSelectionOverlayWithAnimationDuration:(double)a3
{
  if (!self->_scrubbing
    || [(RCWaveformViewController *)self _isScrubbingSelectionTimeRange])
  {
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay selectedTimeRange];
    RCTimeRangeDeltaWithUIPrecision();
    if (v5 == 0.0)
    {
      RCTimeRangeMake();
      double beginTime = v8;
      double endTime = v9;
    }
    else
    {
      double beginTime = self->_selectedTimeRange.beginTime;
      double endTime = self->_selectedTimeRange.endTime;
    }
    if (RCTimeRangeEqualToTimeRange())
    {
      [(RCWaveformViewController *)self reloadOverlayOffsets];
      [(RCWaveformSelectionOverlay *)self->_selectionOverlay setNeedsLayout];
    }
    else
    {
      -[RCWaveformSelectionOverlay setSelectedTimeRange:withAnimationDuration:](self->_selectionOverlay, "setSelectedTimeRange:withAnimationDuration:", beginTime, endTime, a3);
    }
    double currentTime = -1.0;
    if (self->_currentTimeDisplayOptions == 2) {
      double currentTime = self->_currentTime;
    }
    selectionOverlaCGFloat y = self->_selectionOverlay;
    [(RCWaveformSelectionOverlay *)selectionOverlay setAssetCurrentTime:currentTime];
  }
}

- (void)_updateCurrentTimeDisplay
{
  if ([(RCWaveformViewController *)self isOverview])
  {
    [(RCWaveformViewController *)self updateVisibleTimeRangeToFullDuration];
    [(RCWaveformViewController *)self _updateSelectionOverlayWithAnimationDuration:0.0];
    [(RCWaveformViewController *)self _updateBackgroundWaveformHighlight];
  }
  else
  {
    [(RCWaveformViewController *)self desiredTimeDeltaForVisibleTimeRange];
    double v3 = [(RCWaveformViewController *)self applicationWaveformRenderer];
    id v4 = v3;
    if (v3) {
      [v3 isPlayBarOnlyMode];
    }
    if (self->_isCompactView) {
      [(RCWaveformRenderer *)self->_rendererController isLiveWaveform];
    }
    RCTimeRangeMake();
    -[RCWaveformViewController setVisibleTimeRange:](self, "setVisibleTimeRange:");
  }
}

- (CGRect)_frameForTimeMarkerView:(id)a3
{
  rendererController = self->_rendererController;
  id v5 = a3;
  [v5 visibleTimeRange];
  -[RCWaveformRenderer horizontalOffsetAtTime:](rendererController, "horizontalOffsetAtTime:");
  double v7 = RCRoundCoord(v6);
  double v8 = self->_rendererController;
  [v5 visibleTimeRange];
  double v10 = v9;

  [(RCWaveformRenderer *)v8 horizontalOffsetAtTime:v10];
  double v12 = RCRoundCoord(v11) - v7;
  if (v12 >= 1.0) {
    double v13 = v12;
  }
  else {
    double v13 = 1.0;
  }
  double v14 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v14 annotationViewHeight];
  double v16 = v15;

  double v17 = 0.0;
  double v18 = v7;
  double v19 = v13;
  double v20 = v16;
  result.size.double height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v17;
  result.origin.double x = v18;
  return result;
}

- (void)_setTimeMarkerViewsNeedInitialLayout:(BOOL)a3
{
  if (self->_timeMarkerViewsNeedInitialLayout) {
    a3 = 1;
  }
  self->_timeMarkerViewsNeedInitialLayout = a3;
}

- (void)_layoutTimeMarkerViewsForCurrentlyVisibleTimeRange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000B6DD4;
  v2[3] = &unk_100221278;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)_scrollViewPanGestureRecognized:(id)a3
{
  if ([a3 state] == (id)1) {
    self->_scrubbing = 1;
  }
}

- (id)rasterizeCurrentTimeRangeIntoImageWithSize:(CGSize)a3
{
  rendererController = self->_rendererController;
  [(RCWaveformViewController *)self visibleTimeRange];

  return -[RCWaveformRenderer rasterizeTimeRange:imageSize:afterScreenUpdates:](rendererController, "rasterizeTimeRange:imageSize:afterScreenUpdates:", 0);
}

- (RCWaveformViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCWaveformViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RCWaveformZoomingDelegate)zoomingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zoomingDelegate);

  return (RCWaveformZoomingDelegate *)WeakRetained;
}

- (void)setZoomingDelegate:(id)a3
{
}

- (BOOL)isPlayback
{
  return self->_isPlayback;
}

- (BOOL)scrubbingEnabled
{
  return self->_scrubbingEnabled;
}

- (BOOL)playing
{
  return self->_playing;
}

- (BOOL)capturing
{
  return self->_capturing;
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)isOverview
{
  return self->_isOverview;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
}

- (unint64_t)currentTimeDisplayOptions
{
  return self->_currentTimeDisplayOptions;
}

- (BOOL)clipTimeMarkersToDuration
{
  return self->_clipTimeMarkersToDuration;
}

- (BOOL)isBlurred
{
  return self->_blurred;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (double)duration
{
  return self->_duration;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange
{
  double beginTime = self->_visibleTimeRange.beginTime;
  double endTime = self->_visibleTimeRange.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)highlightTimeRange
{
  double beginTime = self->_highlightTimeRange.beginTime;
  double endTime = self->_highlightTimeRange.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange
{
  double beginTime = self->_selectedTimeRange.beginTime;
  double endTime = self->_selectedTimeRange.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (double)maximumSelectionDuration
{
  return self->_maximumSelectionDuration;
}

- (BOOL)isSelectedTimeRangeEditingEnabled
{
  return self->_selectedTimeRangeEditingEnabled;
}

- (void)setSelectedTimeRangeScrubbingEnabled:(BOOL)a3
{
  self->_selectedTimeRangeScrubbingEnabled = a3;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (BOOL)selectionOverlayShouldUseInsertMode
{
  return self->_selectionOverlayShouldUseInsertMode;
}

- (void)setSelectionOverlayShouldUseInsertMode:(BOOL)a3
{
  self->_selectionOverlayShouldUseInsertMode = a3;
}

- (BOOL)showPlayBarOnly
{
  return self->_showPlayBarOnly;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_zoomingDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_backgroundWaveformHighlightViewBottomToBottom, 0);
  objc_storeStrong((id *)&self->_backgroundBottomToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_renderViewBottomInsetConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundWaveFormHighlightViewRightAlignment, 0);
  objc_storeStrong((id *)&self->_backgroundWaveFormHighlightViewLeftAlignment, 0);
  objc_storeStrong((id *)&self->_overlayAutoscrollTimer, 0);
  objc_storeStrong((id *)&self->_timeMarkerViews, 0);
  objc_storeStrong((id *)&self->_waveformHostingView, 0);
  objc_storeStrong((id *)&self->_waveformExtraBlurEffectView, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_selectionBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundWaveFormHighlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_timeMarkerView, 0);
  objc_storeStrong((id *)&self->_selectionOverlay, 0);
  objc_storeStrong((id *)&self->_rendererController, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end