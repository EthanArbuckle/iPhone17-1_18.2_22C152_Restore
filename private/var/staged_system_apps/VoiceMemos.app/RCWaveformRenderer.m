@interface RCWaveformRenderer
- ($F24F406B2B787EFB06265DBA3D28CBD5)highlightTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange;
- (BOOL)_canShowWhileLocked;
- (BOOL)_needsWaveformRendering;
- (BOOL)calcBlockShouldRefreshAllSlices;
- (BOOL)failedFirstRenderCalculationAttempt;
- (BOOL)fitToWidthWaveformNeedsRefresh;
- (BOOL)frequentUpdatesSegmentUpdatesExpectedHint;
- (BOOL)isActiveDisplayLinkRequired;
- (BOOL)isLiveWaveform;
- (BOOL)isMuted;
- (BOOL)isPaused;
- (BOOL)isSelected;
- (BOOL)isTrimMode;
- (BOOL)renderDimmedUnprocessedSegments;
- (BOOL)renderReadyForDraw;
- (BOOL)renderingQueueIsBusy;
- (BOOL)syncRenderOnMainThread;
- (BOOL)useCenteredStyleColoring;
- (BOOL)waitForFinalCalc;
- (CGRect)visibleRect;
- (NSArray)waveformAmpSlicesForRendering;
- (NSMutableDictionary)waveformSlices;
- (NSMutableIndexSet)waveformSliceIndexes;
- (RCWaveformColorCalculator)waveformColorCalculator;
- (RCWaveformDataSource)dataSource;
- (RCWaveformRenderer)initWithNibName:(id)a3 bundle:(id)a4;
- (RCWaveformRendererDelegate)rendererDelegate;
- (double)_duration;
- (double)_nonCachedContentWidthWithDuration:(double)a3;
- (double)_pointOffsetForTime:(double)a3;
- (double)_pointsPerSecond;
- (double)_timeForPointOffset:(double)a3;
- (double)_timeForPointOffset:(double)a3 withVisibleTimeRange:(id)a4;
- (double)contentWidth;
- (double)dataPointWidth;
- (double)horizontalOffsetAtTime:(double)a3;
- (double)horizontalOffsetAtTime:(double)a3 withVisibleTimeRange:(id)a4;
- (double)maximumDecibelDisplayRange;
- (double)pointsPerSecondWithVisibleTimeRange:(id)a3;
- (double)spacingWidth;
- (double)timeAtHorizontalOffset:(double)a3;
- (double)timeAtHorizontalOffset:(double)a3 withVisibleTimeRange:(id)a4;
- (double)verticalWaveformPadding;
- (double)waveformHorizontalSpacing;
- (double)waveformWaveWidth;
- (id).cxx_construct;
- (id)nextRenderBlock;
- (id)rasterizeTimeRange:(id)a3 imageSize:(CGSize)a4 afterScreenUpdates:(BOOL)a5;
- (int64_t)displayMode;
- (void)_clearRenderingState;
- (void)_draw:(double)a3;
- (void)_performOrDispatchToMainThread:(id)a3;
- (void)_renderTimeRangeOfSegments:(id)a3 withDuration:(double)a4 needsWaveformCalculation:(BOOL)a5;
- (void)_renderVisibleTimeRangeWithDuration:(double)a3;
- (void)_setNeedsRendering;
- (void)_setNeedsVisibleTimeRangeRendering;
- (void)_setNeedsVisibleTimeRangeRenderingFromFrameChange;
- (void)_startRendering;
- (void)_startUpdating;
- (void)_stopRendering;
- (void)_stopUpdating;
- (void)_updateFitToWidthUnitsPerSecond;
- (void)dealloc;
- (void)displayLinkDidUpdate:(id)a3 withTimeController:(id)a4;
- (void)drawWaveform;
- (void)loadView;
- (void)setActiveDisplayLinkRequired:(BOOL)a3;
- (void)setCalcBlockShouldRefreshAllSlices:(BOOL)a3;
- (void)setDataPointWidth:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setFailedFirstRenderCalculationAttempt:(BOOL)a3;
- (void)setFitToWidthWaveformNeedsRefresh:(BOOL)a3;
- (void)setFrequentUpdatesSegmentUpdatesExpectedHint:(BOOL)a3;
- (void)setHighlightTimeRange:(id)a3;
- (void)setIsLiveWaveform:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setNextRenderBlock:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRenderReadyForDraw:(BOOL)a3;
- (void)setRendererDelegate:(id)a3;
- (void)setRenderingQueueIsBusy:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSpacingWidth:(double)a3;
- (void)setSyncRenderOnMainThread:(BOOL)a3;
- (void)setTrimMode:(BOOL)a3;
- (void)setVisibleTimeRange:(id)a3;
- (void)setWaitForFinalCalc:(BOOL)a3;
- (void)setWaveformAmpSlicesForRendering:(id)a3;
- (void)setWaveformColorCalculator:(id)a3;
- (void)setWaveformSliceIndexes:(id)a3;
- (void)setWaveformSlices:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4;
- (void)waveformDataSourceDidFinishLoading:(id)a3;
- (void)waveformDataSourceRequiresUpdate:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation RCWaveformRenderer

- (RCWaveformRenderer)initWithNibName:(id)a3 bundle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)RCWaveformRenderer;
  v4 = [(RCWaveformRenderer *)&v11 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_spacingWidth = 0.0;
    v4->_dataPointWidth = 2.0;
    RCTimeRangeMake();
    v5->_visibleTimeRange.beginTime = v6;
    v5->_visibleTimeRange.endTime = v7;
    v5->_cachedContentWidth = 0.0;
    v5->_renderedTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)RCTimeRangeZero;
    v5->_renderingQueueIsBusy = 0;
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.waveformRenderSegmentProcessing", 0);
    renderingQueue = v5->_renderingQueue;
    v5->_renderingQueue = (OS_dispatch_queue *)v8;

    v5->_lastVisibleTimeRange = v5->_visibleTimeRange;
    v5->_visibleTimeRangeVelocity = 0.0;
    v5->_isCompactView = 1;
    v5->_selected = 1;
  }
  return v5;
}

- (void)dealloc
{
  [(RCWaveformRenderer *)self _stopRendering];
  [(RCWaveformDataSource *)self->_dataSource removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)RCWaveformRenderer;
  [(RCWaveformRenderer *)&v3 dealloc];
}

- (void)loadView
{
  objc_super v3 = -[RCView initWithFrame:]([RCView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  -[RCWaveformRenderer setView:](self, "setView:");
  [(RCView *)v3 setRenderer:self];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)RCWaveformRenderer;
  [(RCWaveformRenderer *)&v4 viewDidLoad];
  objc_super v3 = [[RCWaveformColorCalculator alloc] initWithDataProvider:self];
  [(RCWaveformRenderer *)self setWaveformColorCalculator:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCWaveformRenderer;
  [(RCWaveformRenderer *)&v4 viewDidAppear:a3];
  if (self->_dataSource)
  {
    [(RCWaveformRenderer *)self _startUpdating];
    [(RCWaveformRenderer *)self _startRendering];
    if (![(RCWaveformRenderer *)self displayMode])
    {
      self->_fitToWidthWaveformNeedsRefresh = 1;
      [(RCWaveformRenderer *)self _setNeedsVisibleTimeRangeRendering];
      [(RCWaveformRenderer *)self _setNeedsRendering];
      [(RCWaveformRenderer *)self _duration];
      -[RCWaveformRenderer _draw:](self, "_draw:");
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  if (self->_dataSource)
  {
    [(RCWaveformRenderer *)self _stopUpdating];
    [(RCWaveformRenderer *)self _stopRendering];
  }
  v4.receiver = self;
  v4.super_class = (Class)RCWaveformRenderer;
  [(RCWaveformRenderer *)&v4 viewWillDisappear:0];
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)RCWaveformRenderer;
  [(RCWaveformRenderer *)&v5 willMoveToParentViewController:v4];
  if (!v4)
  {
    [(RCWaveformRenderer *)self _stopUpdating];
    [(RCWaveformRenderer *)self _stopRendering];
  }
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)RCWaveformRenderer;
  [(RCWaveformRenderer *)&v2 viewDidLayoutSubviews];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)waveformDataSourceRequiresUpdate:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100065260;
  v3[3] = &unk_100221CD8;
  v3[4] = self;
  [(RCWaveformRenderer *)self _performOrDispatchToMainThread:v3];
}

- (void)_updateFitToWidthUnitsPerSecond
{
  if ((id)[(RCWaveformRenderer *)self displayMode] == (id)1)
  {
    [(RCWaveformRenderer *)self _pointsPerSecond];
    double v4 = v3;
    id v5 = [(RCWaveformDataSource *)self->_dataSource waveformGenerator];
    [v5 setOverviewUnitsPerSecond:(uint64_t)v4];
  }
}

- (void)setDataSource:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100065400;
  v4[3] = &unk_100221880;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(RCWaveformRenderer *)v5 _performOrDispatchToMainThread:v4];
}

- (void)setIsLiveWaveform:(BOOL)a3
{
  if (self->_isLiveWaveform != a3)
  {
    self->_isLiveWaveform = a3;
    [(RCWaveformRenderer *)self _setNeedsVisibleTimeRangeRendering];
    [(RCWaveformRenderer *)self _setNeedsRendering];
  }
}

- (void)setVisibleTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  p_visibleTimeRange = &self->_visibleTimeRange;
  if ((RCTimeRangeEqualToTimeRange() & 1) == 0)
  {
    if (![(RCWaveformRenderer *)self displayMode]
      || (RCTimeRangeDelta(), double v8 = v7, RCTimeRangeDelta(), vabdd_f64(v8, v9) > 0.00000011920929))
    {
      self->_calcBlockShouldRefreshAllSlices = 1;
    }
    self->_needsVisibleRangeRendering = 1;
  }
  p_visibleTimeRange->beginTime = var0;
  p_visibleTimeRange->endTime = var1;
  if (self->_dataSource)
  {
    [(RCWaveformRenderer *)self _setNeedsVisibleTimeRangeRendering];
    [(RCWaveformRenderer *)self _setNeedsRendering];
    [(RCWaveformRenderer *)self _duration];
    -[RCWaveformRenderer _draw:](self, "_draw:");
  }
}

- (double)_duration
{
  [(RCWaveformDataSource *)self->_dataSource duration];
  double v4 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rendererDelegate);
  [WeakRetained duration];
  double v7 = v6;

  if (v4 >= v7) {
    return v4;
  }
  else {
    return v7;
  }
}

- (double)contentWidth
{
  return self->_cachedContentWidth;
}

- (double)horizontalOffsetAtTime:(double)a3
{
  -[RCWaveformRenderer horizontalOffsetAtTime:withVisibleTimeRange:](self, "horizontalOffsetAtTime:withVisibleTimeRange:", a3, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  return result;
}

- (double)horizontalOffsetAtTime:(double)a3 withVisibleTimeRange:(id)a4
{
  -[RCWaveformRenderer pointsPerSecondWithVisibleTimeRange:](self, "pointsPerSecondWithVisibleTimeRange:", a4.var0, a4.var1);
  return v5 * a3;
}

- (double)_pointsPerSecond
{
  -[RCWaveformRenderer pointsPerSecondWithVisibleTimeRange:](self, "pointsPerSecondWithVisibleTimeRange:", self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  return result;
}

- (double)pointsPerSecondWithVisibleTimeRange:(id)a3
{
  double v3 = 1.0;
  if (a3.var1 - a3.var0 >= 4.4408921e-16)
  {
    double v5 = [(RCWaveformRenderer *)self view];
    [v5 bounds];
    double v7 = v6;

    if (v7 >= 1.0)
    {
      double v8 = [(RCWaveformRenderer *)self view];
      [v8 bounds];
      double v10 = v9;
      objc_super v11 = [(RCWaveformRenderer *)self rendererDelegate];
      [v11 desiredTimeDeltaForVisibleTimeRange];
      double v3 = v10 / v12;
    }
  }
  return v3;
}

- (double)timeAtHorizontalOffset:(double)a3
{
  -[RCWaveformRenderer timeAtHorizontalOffset:withVisibleTimeRange:](self, "timeAtHorizontalOffset:withVisibleTimeRange:", a3, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  return result;
}

- (double)timeAtHorizontalOffset:(double)a3 withVisibleTimeRange:(id)a4
{
  -[RCWaveformRenderer _timeForPointOffset:withVisibleTimeRange:](self, "_timeForPointOffset:withVisibleTimeRange:", a3, a4.var0, a4.var1);
  return result;
}

- (CGRect)visibleRect
{
  p_visibleTimeRange = &self->_visibleTimeRange;
  [(RCWaveformRenderer *)self horizontalOffsetAtTime:self->_visibleTimeRange.beginTime];
  double v5 = v4;
  [(RCWaveformRenderer *)self horizontalOffsetAtTime:p_visibleTimeRange->endTime];
  double v7 = v6;
  double v8 = [(RCWaveformRenderer *)self view];
  [v8 bounds];
  double v10 = v9;

  double v11 = 0.0;
  double v12 = rint(v5);
  double v13 = rint(v7) - v12;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (id)rasterizeTimeRange:(id)a3 imageSize:(CGSize)a4 afterScreenUpdates:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  double var1 = a3.var1;
  double var0 = a3.var0;
  [(RCWaveformDataSource *)self->_dataSource duration];
  if (v11 >= var1) {
    double v12 = var1;
  }
  else {
    double v12 = v11;
  }
  double v13 = [(RCWaveformRenderer *)self view];
  double v14 = [v13 window];

  if (v14)
  {
    id v15 = 0;
  }
  else
  {
    v16 = +[UIScreen mainScreen];
    [v16 bounds];
    double v18 = v17;
    double v20 = v19;

    id v21 = objc_alloc((Class)UIWindow);
    if (v18 >= v20) {
      double v22 = v18;
    }
    else {
      double v22 = v20;
    }
    id v15 = [v21 initWithFrame:v22 + v22, v22 + v22, width, height];
    v23 = [(RCWaveformRenderer *)self view];
    [v15 addSubview:v23];

    [v15 setHidden:0];
  }
  v24 = [(RCWaveformRenderer *)self view];
  [v24 frame];
  double v52 = v26;
  double v53 = v25;
  double v28 = v27;
  double v30 = v29;

  [(RCWaveformRenderer *)self visibleTimeRange];
  double v50 = v32;
  double v51 = v31;
  double y = CGPointZero.y;
  v34 = [(RCWaveformRenderer *)self view];
  [v34 setFrame:CGPointZero.x, y, width, height];

  -[RCWaveformRenderer setVisibleTimeRange:](self, "setVisibleTimeRange:", fmax(var0, 0.0), v12);
  v35 = +[NSRunLoop mainRunLoop];
  [v35 rc_runUntilNextDisplayLinkEventWithTimeout:0.5];

  v36 = [(RCWaveformRenderer *)self view];
  [v36 bounds];
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  v41 = +[UIScreen mainScreen];
  [v41 scale];
  CGFloat v43 = v42;
  v55.double width = v38;
  v55.double height = v40;
  UIGraphicsBeginImageContextWithOptions(v55, 0, v43);

  v44 = [(RCWaveformRenderer *)self view];
  v45 = [(RCWaveformRenderer *)self view];
  [v45 bounds];
  [v44 drawViewHierarchyInRect:v5];

  v46 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v47 = [(RCWaveformRenderer *)self view];
  [v47 setFrame:v53, v52, v28, v30];

  -[RCWaveformRenderer setVisibleTimeRange:](self, "setVisibleTimeRange:", v51, v50);
  if (v15)
  {
    v48 = [(RCWaveformRenderer *)self view];
    [v48 removeFromSuperview];

    [v15 setHidden:1];
  }

  return v46;
}

- (void)drawWaveform
{
  self->_needsVisibleRangeRendering = 1;
  [(RCWaveformRenderer *)self _duration];

  -[RCWaveformRenderer _draw:](self, "_draw:");
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
  if (a3)
  {
    [(RCWaveformRenderer *)self _stopUpdating];
    [(RCWaveformRenderer *)self _stopRendering];
  }
  else
  {
    [(RCWaveformRenderer *)self _startUpdating];
    [(RCWaveformRenderer *)self _startRendering];
  }
}

- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100065D40;
  v5[3] = &unk_100221880;
  double v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(RCWaveformRenderer *)v6 _performOrDispatchToMainThread:v5];
}

- (void)waveformDataSourceDidFinishLoading:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100065E94;
  v3[3] = &unk_100221CD8;
  v3[4] = self;
  [(RCWaveformRenderer *)self _performOrDispatchToMainThread:v3];
}

- (double)_nonCachedContentWidthWithDuration:(double)a3
{
  [(RCWaveformRenderer *)self _pointsPerSecond];
  return ceil(v4 * a3);
}

- (void)_startUpdating
{
  if (![(RCWaveformRenderer *)self isPaused])
  {
    [(RCWaveformRenderer *)self _setNeedsVisibleTimeRangeRendering];
    dataSource = self->_dataSource;
    [(RCWaveformDataSource *)dataSource addObserver:self];
  }
}

- (void)_stopUpdating
{
}

- (void)_setNeedsRendering
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100065FCC;
  v2[3] = &unk_100221CD8;
  v2[4] = self;
  [(RCWaveformRenderer *)self _performOrDispatchToMainThread:v2];
}

- (void)_setNeedsVisibleTimeRangeRenderingFromFrameChange
{
  if (![(RCWaveformRenderer *)self displayMode])
  {
    if ([(RCWaveformRenderer *)self isLiveWaveform]) {
      self->_fitToWidthWaveformNeedsRefresh = 1;
    }
  }
}

- (void)_setNeedsVisibleTimeRangeRendering
{
  if (!self->_needsVisibleRangeRendering
    && [(RCWaveformRenderer *)self _needsWaveformRendering])
  {
    self->_needsVisibleRangeRendering = 1;
    [(RCWaveformRenderer *)self _startRendering];
  }
}

- (void)_startRendering
{
  if (!self->displayLinkConnected)
  {
    double v3 = +[RCDisplayLinkManager sharedManager];
    [v3 addDisplayLinkObserver:self];

    self->displayLinkConnected = 1;
  }
}

- (void)_stopRendering
{
  if (self->displayLinkConnected)
  {
    double v3 = +[RCDisplayLinkManager sharedManager];
    [v3 removeDisplayLinkObserver:self];

    self->displayLinkConnected = 0;
  }
}

- (void)setActiveDisplayLinkRequired:(BOOL)a3
{
  if (self->_activeDisplayLinkRequired != a3)
  {
    self->_activeDisplayLinkRequired = a3;
    if (a3) {
      [(RCWaveformRenderer *)self _startRendering];
    }
    else {
      [(RCWaveformRenderer *)self _stopRendering];
    }
  }
}

- (void)displayLinkDidUpdate:(id)a3 withTimeController:(id)a4
{
  BOOL v5 = [(RCWaveformRenderer *)self view];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(RCWaveformRenderer *)self view];
  double v11 = [v10 window];

  if (v11 && v7 != 0.0 && v9 != 0.0)
  {
    if ((id)[(RCWaveformRenderer *)self displayMode] == (id)1) {
      self->_visibleTimeRangeVelocitdouble y = (self->_visibleTimeRange.beginTime + self->_visibleTimeRange.endTime) * 0.5
    }
                                      - (self->_lastVisibleTimeRange.beginTime + self->_lastVisibleTimeRange.endTime)
                                      * 0.5;
    self->_lastVisibleTimeRange = self->_visibleTimeRange;
    [(RCWaveformRenderer *)self _duration];
    -[RCWaveformRenderer _draw:](self, "_draw:");
  }
}

- (void)_draw:(double)a3
{
  if (a3 > 0.0) {
    -[RCWaveformRenderer _renderVisibleTimeRangeWithDuration:](self, "_renderVisibleTimeRangeWithDuration:");
  }
}

- (void)_clearRenderingState
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100066370;
  v4[3] = &unk_100221CD8;
  void v4[4] = self;
  double v3 = objc_retainBlock(v4);
  dispatch_sync((dispatch_queue_t)self->_renderingQueue, v3);
}

- (void)_renderTimeRangeOfSegments:(id)a3 withDuration:(double)a4 needsWaveformCalculation:(BOOL)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  [(RCWaveformRenderer *)self waveformWaveWidth];
  double v11 = v10;
  [(RCWaveformRenderer *)self waveformHorizontalSpacing];
  double v13 = v12;
  [(RCWaveformRenderer *)self maximumDecibelDisplayRange];
  RCNormalizedDecibelValue();
  double v15 = v14;
  v16 = [(RCWaveformRenderer *)self view];
  [v16 bounds];
  double v108 = v17;
  double v19 = v18;

  RCTimeRangeDeltaWithUIPrecision();
  if (v20 <= 0.0) {
    return;
  }
  double v21 = v20;
  if (v19 == 100.0 && v108 == 100.0) {
    return;
  }
  if (self->_calcBlockShouldRefreshAllSlices)
  {
    double v22 = [(RCWaveformRenderer *)self waveformAmpSlicesForRendering];
    BOOL v23 = [v22 count] == 0;
  }
  else
  {
    BOOL v23 = 0;
  }
  double v105 = v15;
  double v107 = var0;
  v24 = [(RCWaveformRenderer *)self view];
  [v24 frame];
  double v103 = v25;
  double v100 = v11;

  [(RCWaveformRenderer *)self verticalWaveformPadding];
  double v101 = v26;
  double v102 = v13;
  double v106 = v19;
  double v27 = v19 / v13 / v21;
  double v28 = 1.0 / v27;
  [(RCWaveformRenderer *)self _duration];
  double v30 = v29;
  double v104 = var1;
  if ([(RCWaveformRenderer *)self displayMode])
  {
    double v31 = a4;
    double v32 = v107;
    if (v107 >= v30) {
      double v32 = v30;
    }
    if (v32 >= 0.0) {
      double v33 = v32;
    }
    else {
      double v33 = 0.0;
    }
    double v34 = var1 + v28;
    BOOL v35 = var1 + v28 < v30;
    double v36 = v30;
    if (!v35) {
      double v34 = v30;
    }
    if (v34 >= 0.0) {
      double v37 = v34;
    }
    else {
      double v37 = 0.0;
    }
    double v38 = 1.0 / v27;
    [(RCWaveformDataSource *)self->_dataSource setDurationPerWaveformSlice:1.0 / v27];
  }
  else
  {
    double v39 = var1;
    double v36 = v30;
    double v38 = 1.0 / v27;
    double v40 = v107;
    if (v107 >= a4) {
      double v40 = a4;
    }
    if (v40 >= 0.0) {
      double v33 = v40;
    }
    else {
      double v33 = 0.0;
    }
    double v31 = a4;
    if (v39 >= a4) {
      double v41 = a4;
    }
    else {
      double v41 = v39;
    }
    if (v41 >= 0.0) {
      double v37 = v41;
    }
    else {
      double v37 = 0.0;
    }
  }
  uint64_t v42 = (uint64_t)rint(v27 * v33);
  uint64_t v43 = (uint64_t)rint(v27 * v37);
  uint64_t v44 = v43 - v42;
  if (v43 != v42)
  {
    $93AB83F55FD8EAABF5C634313E89AB95 visibleTimeRange = self->_visibleTimeRange;
    LODWORD(v99) = self->_calcBlockShouldRefreshAllSlices;
    HIDWORD(v99) = self->_isLiveWaveform;
    self->_calcBlockShouldRefreshAllSlices = 0;
    int isLiveWaveform = self->_isLiveWaveform;
    int recordDidSwitch = self->_rendererState.recordDidSwitch;
    BOOL v48 = isLiveWaveform != recordDidSwitch;
    if (isLiveWaveform != recordDidSwitch) {
      self->_rendererState.int recordDidSwitch = isLiveWaveform;
    }
    double v49 = v38;
    double v50 = v36;
    if (self->_isLiveWaveform)
    {
      CFTimeInterval v51 = CACurrentMediaTime();
      if (v51 - self->_rendererState.lastRenderTime < v49
        && isLiveWaveform == recordDidSwitch
        && self->_lastVisibleTimeDuration == v21
        && !self->_fitToWidthWaveformNeedsRefresh)
      {
        if (![(RCWaveformRenderer *)self displayMode]
          && ![(RCWaveformRenderer *)self renderReadyForDraw])
        {
          return;
        }
        int64_t v52 = [(RCWaveformRenderer *)self displayMode];
        [(RCWaveformDataSource *)self->_dataSource timeRangeToHighlight];
        double v54 = v53;
        double v56 = v55;
        BOOL v48 = 0;
        if (v52 == 1)
        {
          v57 = "_TtC10VoiceMemos31ActivityManagerStateCoordinator" + 48;
          goto LABEL_48;
        }
      }
      else
      {
        self->_rendererState.lastRenderTime = v51;
        self->_lastVisibleTimeDuration = v21;
        self->_fitToWidthWaveformNeedsRefresh = 0;
        [(RCWaveformDataSource *)self->_dataSource timeRangeToHighlight];
        double v54 = v60;
        double v56 = v61;
        BOOL v48 = 1;
      }
    }
    else
    {
      [(RCWaveformDataSource *)self->_dataSource timeRangeToHighlight];
      double v54 = v58;
      double v56 = v59;
    }
    v57 = "r";
    if (a5)
    {
LABEL_49:
      v126[0] = _NSConcreteStackBlock;
      v126[1] = *((void *)v57 + 432);
      v126[2] = sub_100066FD0;
      v126[3] = &unk_100221EF8;
      v126[4] = self;
      *(double *)&v126[5] = v107;
      *(double *)&v126[6] = v104;
      v126[7] = v42;
      v126[8] = v44;
      char v128 = v99;
      *(double *)&v126[9] = v49;
      *(double *)&v126[10] = 2.0 / v108 * 0.5;
      char v129 = BYTE4(v99);
      BOOL v130 = v48;
      *(double *)&v126[11] = v54;
      *(double *)&v126[12] = v56;
      *(double *)&v126[13] = v105;
      *(double *)&v126[14] = 1.0 / v105;
      BOOL v131 = v23;
      $93AB83F55FD8EAABF5C634313E89AB95 v127 = visibleTimeRange;
      v62 = objc_retainBlock(v126);
      if (self->_syncRenderOnMainThread
        || (id WeakRetained = objc_loadWeakRetained((id *)&self->_rendererDelegate),
            unsigned int v64 = [WeakRetained isZooming],
            WeakRetained,
            v64))
      {
        -[RCWaveformRenderer setNextRenderBlock:](self, "setNextRenderBlock:", 0, v99);
        dispatch_sync((dispatch_queue_t)self->_renderingQueue, v62);
      }
      else if ([(RCWaveformRenderer *)self renderingQueueIsBusy])
      {
        [(RCWaveformRenderer *)self setNextRenderBlock:v62];
      }
      else
      {
        [(RCWaveformRenderer *)self setNextRenderBlock:0];
        dispatch_async((dispatch_queue_t)self->_renderingQueue, v62);
      }

LABEL_53:
      v65 = [(RCWaveformRenderer *)self view];
      v66 = [v65 waveformLayer];

      v67 = [(RCWaveformRenderer *)self waveformAmpSlicesForRendering];
      if ((id)[(RCWaveformRenderer *)self displayMode] == (id)1)
      {
        unsigned int v68 = 1;
        if (!v66) {
          goto LABEL_85;
        }
      }
      else if ([(RCWaveformRenderer *)self displayMode])
      {
        unsigned int v68 = 0;
        if (!v66) {
          goto LABEL_85;
        }
      }
      else
      {
        unsigned int v68 = [(RCWaveformRenderer *)self renderReadyForDraw];
        if (!v66)
        {
LABEL_85:

          return;
        }
      }
      if ([v67 count]) {
        unsigned int v69 = v68;
      }
      else {
        unsigned int v69 = 0;
      }
      if (v69 == 1)
      {
        v70 = [(RCWaveformRenderer *)self waveformColorCalculator];
        v71 = [v70 resolvedColorWithLiveWaveform:[self isLiveWaveform] selected:[self isSelected] muted:[self isMuted] trimMode:[self isTrimMode]];
        +[RCVisualWaveformAmpSlice setResolvedHighlightColor:v71];

        v72 = [(RCWaveformRenderer *)self waveformColorCalculator];
        v73 = [v72 resolvedColorWithLiveWaveform:0 selected:[self isSelected] muted:[self isMuted] trimMode:0];
        double v74 = v31;
        double v75 = v56;
        +[RCVisualWaveformAmpSlice setResolvedMainColor:v73];

        id v76 = objc_loadWeakRetained((id *)&self->_rendererDelegate);
        [v76 selectedTimeRange];
        double v78 = v77;
        double v80 = v79;

        $93AB83F55FD8EAABF5C634313E89AB95 waveformAmpSlicesForRenderingTimeRange = self->_waveformAmpSlicesForRenderingTimeRange;
        if (self->_isLiveWaveform)
        {
          id v81 = objc_loadWeakRetained((id *)&self->_rendererDelegate);
          [v81 currentTime];
          double v83 = v82;
          unint64_t v84 = vcvtmd_u64_f64(v54 / v49);

          if (v75 >= v83) {
            double v85 = v75;
          }
          else {
            double v85 = v83;
          }
          double v86 = ceil(v85 / v49);
        }
        else
        {
          unint64_t v87 = vcvtpd_u64_f64(v78 / v49);
          double v86 = ceil(v50 / v49);
          double v88 = floor(v80 / v49);
          if (self->_trimMode) {
            unint64_t v84 = v87;
          }
          else {
            unint64_t v84 = 0;
          }
          if (self->_trimMode) {
            double v86 = v88;
          }
        }
        uint64_t v121 = 0;
        v122 = &v121;
        uint64_t v123 = 0x2020000000;
        BOOL waveformAmpSlicesForRenderingRecordStateChanged = self->_waveformAmpSlicesForRenderingRecordStateChanged;
        v111[0] = _NSConcreteStackBlock;
        v111[1] = *((void *)v57 + 432);
        v111[2] = sub_100067730;
        v111[3] = &unk_100221F20;
        $93AB83F55FD8EAABF5C634313E89AB95 v112 = waveformAmpSlicesForRenderingTimeRange;
        double v113 = v106;
        double v114 = v102;
        double v115 = v103 * 0.5;
        double v116 = v103 * 0.5 - v101;
        v111[4] = self;
        v111[5] = &v121;
        double v117 = v54;
        double v118 = v75;
        unint64_t v119 = v84;
        unint64_t v120 = (unint64_t)v86;
        v89 = objc_retainBlock(v111);
        +[CATransaction begin];
        +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
        if (![(RCWaveformRenderer *)self displayMode])
        {
          [v66 transform];
          if (!CATransform3DIsIdentity(&v110))
          {
            long long v90 = *(_OWORD *)&CATransform3DIdentity.m33;
            v109[4] = *(_OWORD *)&CATransform3DIdentity.m31;
            v109[5] = v90;
            long long v91 = *(_OWORD *)&CATransform3DIdentity.m43;
            v109[6] = *(_OWORD *)&CATransform3DIdentity.m41;
            v109[7] = v91;
            long long v92 = *(_OWORD *)&CATransform3DIdentity.m13;
            v109[0] = *(_OWORD *)&CATransform3DIdentity.m11;
            v109[1] = v92;
            long long v93 = *(_OWORD *)&CATransform3DIdentity.m23;
            v109[2] = *(_OWORD *)&CATransform3DIdentity.m21;
            v109[3] = v93;
            [v66 setTransform:v109];
            v94 = [(RCWaveformRenderer *)self view];
            [v94 bounds];
            [v66 setFrame:];
          }
        }
        ((void (*)(void *, void *, void *, double))v89[2])(v89, v67, v66, v100);
        +[CATransaction commit];
        self->_renderedTimeRange = waveformAmpSlicesForRenderingTimeRange;
        if (*((unsigned char *)v122 + 24)) {
          self->_BOOL waveformAmpSlicesForRenderingRecordStateChanged = 0;
        }
        self->_calcBlockShouldRefreshAllSlices = 0;
        [(RCWaveformRenderer *)self setRenderReadyForDraw:0];
        [(RCWaveformRenderer *)self setWaitForFinalCalc:0];
        [(RCWaveformRenderer *)self _nonCachedContentWidthWithDuration:v74];
        if (self->_cachedContentWidth != v95)
        {
          self->_cachedContentWidth = v95;
          id v96 = objc_loadWeakRetained((id *)&self->_rendererDelegate);
          char v97 = objc_opt_respondsToSelector();

          if (v97)
          {
            id v98 = objc_loadWeakRetained((id *)&self->_rendererDelegate);
            [v98 waveformRenderer:self contentWidthDidChange:self->_cachedContentWidth];
          }
        }

        _Block_object_dispose(&v121, 8);
      }
      goto LABEL_85;
    }
LABEL_48:
    if (![(RCWaveformRenderer *)self failedFirstRenderCalculationAttempt]) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  v45 = OSLogForCategory();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
    sub_10016B540(v45);
  }
}

- (double)waveformWaveWidth
{
  [(RCWaveformRenderer *)self doesNotRecognizeSelector:a2];
  objc_super v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v2 waveformWaveWidth];
  double v4 = v3;

  return v4;
}

- (double)waveformHorizontalSpacing
{
  [(RCWaveformRenderer *)self doesNotRecognizeSelector:a2];
  objc_super v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v2 waveformHorizontalSpacing];
  double v4 = v3;

  return v4;
}

- (double)maximumDecibelDisplayRange
{
  [(RCWaveformRenderer *)self doesNotRecognizeSelector:a2];
  objc_super v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v2 maximumDecibelDisplayRange];
  double v4 = v3;

  return v4;
}

- (double)verticalWaveformPadding
{
  [(RCWaveformRenderer *)self doesNotRecognizeSelector:a2];
  objc_super v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v2 waveformWaveVerticalPadding];
  double v4 = v3;

  return v4;
}

- (BOOL)useCenteredStyleColoring
{
  return 0;
}

- (BOOL)renderDimmedUnprocessedSegments
{
  return 0;
}

- (BOOL)_needsWaveformRendering
{
  if (self->_calcBlockShouldRefreshAllSlices) {
    return 1;
  }
  BOOL waveformAmpSlicesForRenderingRecordStateChanged = self->_waveformAmpSlicesForRenderingRecordStateChanged;
  double v4 = [(RCWaveformRenderer *)self waveformAmpSlicesForRendering];
  id v5 = [v4 count];
  char v6 = v5 == 0;
  if (!waveformAmpSlicesForRenderingRecordStateChanged && v5 != 0) {
    char v6 = RCTimeRangeEqualToTimeRange();
  }
  char v2 = v6 ^ 1;

  return v2;
}

- (void)_renderVisibleTimeRangeWithDuration:(double)a3
{
  if ([(RCWaveformRenderer *)self _needsWaveformRendering]
    || self->_needsVisibleRangeRendering)
  {
    LOBYTE(v5) = 0;
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    unsigned int v5 = ![(RCWaveformRenderer *)self renderReadyForDraw];
  }
  if (self->_dataSource)
  {
    if (self->_paused) {
      LOBYTE(v5) = 1;
    }
    if ((v5 & 1) == 0)
    {
      [(RCWaveformRenderer *)self visibleTimeRange];
      double v8 = v7;
      double v10 = v9;
      if ((id)[(RCWaveformRenderer *)self displayMode] == (id)1)
      {
        [(RCWaveformRenderer *)self _updateFitToWidthUnitsPerSecond];
        visibleTimeRangeVelocitdouble y = self->_visibleTimeRangeVelocity;
        double v12 = fabs(visibleTimeRangeVelocity);
        if (v12 > 10.0) {
          double v12 = 10.0;
        }
        if (visibleTimeRangeVelocity <= 0.0)
        {
          if (visibleTimeRangeVelocity < 0.0) {
            double v8 = v8 - v12;
          }
        }
        else
        {
          double v10 = v10 + v12;
        }
      }
      -[RCWaveformRenderer _renderTimeRangeOfSegments:withDuration:needsWaveformCalculation:](self, "_renderTimeRangeOfSegments:withDuration:needsWaveformCalculation:", v6, v8, v10, a3);
      self->_needsVisibleRangeRendering = 0;
    }
  }
}

- (double)_pointOffsetForTime:(double)a3
{
  unsigned int v5 = [(RCWaveformRenderer *)self view];
  [v5 bounds];
  double v7 = v6;

  double v8 = [(RCWaveformRenderer *)self rendererDelegate];
  [v8 desiredTimeDeltaForVisibleTimeRange];
  double v10 = v9;

  double result = 0.0;
  if (v10 > 0.0) {
    return v7 / v10 * a3;
  }
  return result;
}

- (double)_timeForPointOffset:(double)a3 withVisibleTimeRange:(id)a4
{
  -[RCWaveformRenderer pointsPerSecondWithVisibleTimeRange:](self, "pointsPerSecondWithVisibleTimeRange:", a4.var0, a4.var1);
  double v6 = a3 / v5;
  BOOL v7 = v5 == 0.0;
  double result = 0.0;
  if (!v7) {
    return v6;
  }
  return result;
}

- (double)_timeForPointOffset:(double)a3
{
  -[RCWaveformRenderer _timeForPointOffset:withVisibleTimeRange:](self, "_timeForPointOffset:withVisibleTimeRange:", a3, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  return result;
}

- (void)_performOrDispatchToMainThread:(id)a3
{
  block = (void (**)(void))a3;
  if (+[NSThread isMainThread]) {
    block[2](block);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (RCWaveformDataSource)dataSource
{
  return self->_dataSource;
}

- (RCWaveformRendererDelegate)rendererDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rendererDelegate);

  return (RCWaveformRendererDelegate *)WeakRetained;
}

- (void)setRendererDelegate:(id)a3
{
}

- (BOOL)frequentUpdatesSegmentUpdatesExpectedHint
{
  return self->_frequentUpdatesSegmentUpdatesExpectedHint;
}

- (void)setFrequentUpdatesSegmentUpdatesExpectedHint:(BOOL)a3
{
  self->_frequentUpdatesSegmentUpdatesExpectedHint = a3;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(int64_t)a3
{
  self->_displayMode = a3;
}

- (BOOL)isLiveWaveform
{
  return self->_isLiveWaveform;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (BOOL)isTrimMode
{
  return self->_trimMode;
}

- (void)setTrimMode:(BOOL)a3
{
  self->_trimMode = a3;
}

- (BOOL)calcBlockShouldRefreshAllSlices
{
  return self->_calcBlockShouldRefreshAllSlices;
}

- (void)setCalcBlockShouldRefreshAllSlices:(BOOL)a3
{
  self->_calcBlockShouldRefreshAllSlices = a3;
}

- (BOOL)syncRenderOnMainThread
{
  return self->_syncRenderOnMainThread;
}

- (void)setSyncRenderOnMainThread:(BOOL)a3
{
  self->_syncRenderOnMainThread = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isActiveDisplayLinkRequired
{
  return self->_activeDisplayLinkRequired;
}

- (double)spacingWidth
{
  return self->_spacingWidth;
}

- (void)setSpacingWidth:(double)a3
{
  self->_spacingWidth = a3;
}

- (double)dataPointWidth
{
  return self->_dataPointWidth;
}

- (void)setDataPointWidth:(double)a3
{
  self->_dataPointWidth = a3;
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

- (void)setHighlightTimeRange:(id)a3
{
  self->_highlightTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
}

- (BOOL)fitToWidthWaveformNeedsRefresh
{
  return self->_fitToWidthWaveformNeedsRefresh;
}

- (void)setFitToWidthWaveformNeedsRefresh:(BOOL)a3
{
  self->_fitToWidthWaveformNeedsRefresh = a3;
}

- (BOOL)renderingQueueIsBusy
{
  return self->_renderingQueueIsBusy;
}

- (void)setRenderingQueueIsBusy:(BOOL)a3
{
  self->_renderingQueueIsBusdouble y = a3;
}

- (BOOL)renderReadyForDraw
{
  return self->_renderReadyForDraw;
}

- (void)setRenderReadyForDraw:(BOOL)a3
{
  self->_renderReadyForDraw = a3;
}

- (BOOL)failedFirstRenderCalculationAttempt
{
  return self->_failedFirstRenderCalculationAttempt;
}

- (void)setFailedFirstRenderCalculationAttempt:(BOOL)a3
{
  self->_failedFirstRenderCalculationAttempt = a3;
}

- (BOOL)waitForFinalCalc
{
  return self->_waitForFinalCalc;
}

- (void)setWaitForFinalCalc:(BOOL)a3
{
  self->_waitForFinalCalc = a3;
}

- (id)nextRenderBlock
{
  return objc_getProperty(self, a2, 200, 1);
}

- (void)setNextRenderBlock:(id)a3
{
}

- (NSArray)waveformAmpSlicesForRendering
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setWaveformAmpSlicesForRendering:(id)a3
{
}

- (NSMutableDictionary)waveformSlices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setWaveformSlices:(id)a3
{
}

- (NSMutableIndexSet)waveformSliceIndexes
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 224, 1);
}

- (void)setWaveformSliceIndexes:(id)a3
{
}

- (RCWaveformColorCalculator)waveformColorCalculator
{
  return (RCWaveformColorCalculator *)objc_getProperty(self, a2, 232, 1);
}

- (void)setWaveformColorCalculator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformColorCalculator, 0);
  objc_storeStrong((id *)&self->_waveformSliceIndexes, 0);
  objc_storeStrong((id *)&self->_waveformSlices, 0);
  objc_storeStrong((id *)&self->_waveformAmpSlicesForRendering, 0);
  objc_storeStrong(&self->_nextRenderBlock, 0);
  objc_destroyWeak((id *)&self->_rendererDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_renderingQueue, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 128) = 0;
  *((void *)self + 17) = 0;
  return self;
}

@end