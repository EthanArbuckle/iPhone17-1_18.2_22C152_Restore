@interface ScrollPerfTestRunner
- (BOOL)isPageTooShortToScroll;
- (BOOL)performActionForPage:(id)a3;
- (BOOL)startPageAction:(id)a3;
- (CGPoint)touchPointForMoveIndex:(unint64_t)a3;
- (ScrollPerfTestRunner)initWithTestName:(id)a3 browserController:(id)a4;
- (id)finalStatusForPage:(id)a3;
- (id)machineConfigInfo;
- (id)outputDataForPage:(id)a3;
- (id)pageScrollView;
- (id)pageWebView;
- (void)advanceGesture;
- (void)appendToFramerateHistory;
- (void)determineScrollDirection;
- (void)finishPage:(id)a3 stats:(id)a4 error:(id)a5;
- (void)finishedTestPage:(id)a3;
- (void)finishedTestRunner;
- (void)startingTestPage:(id)a3;
- (void)writeOutputData;
@end

@implementation ScrollPerfTestRunner

- (ScrollPerfTestRunner)initWithTestName:(id)a3 browserController:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)ScrollPerfTestRunner;
  v4 = [(PurplePageLoadTestRunner *)&v11 initWithTestName:a3 browserController:a4];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mobilesafari.EventGenerator", 0);
    eventGeneratorQueue = v4->_eventGeneratorQueue;
    v4->_eventGeneratorQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    outputData = v4->_outputData;
    v4->_outputData = (NSMutableDictionary *)v7;

    [(PageLoadTestRunner *)v4 setFailFast:0];
    [(PageLoadTestRunner *)v4 setResetsZoomBetweenPages:0];
    v9 = v4;
  }

  return v4;
}

- (id)pageWebView
{
  v2 = [(PageLoadTestRunner *)self browserController];
  v3 = [v2 tabController];
  v4 = [v3 activeTabDocument];
  dispatch_queue_t v5 = [v4 webView];

  return v5;
}

- (id)pageScrollView
{
  v2 = [(ScrollPerfTestRunner *)self pageWebView];
  v3 = [v2 scrollView];

  return v3;
}

- (void)writeOutputData
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v3 = [(ScrollPerfTestRunner *)self pageScrollView];
  v26[0] = self->_outputData;
  v25[0] = @"runs";
  v25[1] = @"suiteName";
  v4 = [(PageLoadTestRunner *)self suiteName];
  if (v4)
  {
    dispatch_queue_t v5 = [(PageLoadTestRunner *)self suiteName];
  }
  else
  {
    dispatch_queue_t v5 = @"<no suite name>";
  }
  v26[1] = v5;
  v25[2] = @"frameWidth";
  v6 = (void *)MEMORY[0x1E4F28ED0];
  [v3 bounds];
  v8 = [v6 numberWithDouble:v7];
  v26[2] = v8;
  v25[3] = @"frameHeight";
  v9 = (void *)MEMORY[0x1E4F28ED0];
  [v3 bounds];
  objc_super v11 = [v9 numberWithDouble:v10];
  v26[3] = v11;
  v25[4] = @"scrollViewDecelerationRate";
  v12 = (void *)MEMORY[0x1E4F28ED0];
  [v3 decelerationRate];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v26[4] = v13;
  v25[5] = @"machineConfiguration";
  v14 = [(ScrollPerfTestRunner *)self machineConfigInfo];
  v26[5] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:6];
  v27[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];

  if (v4) {
  v17 = [(PageLoadTestRunner *)self outputFilename];
  }

  if (v17)
  {
    id v24 = 0;
    v18 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v16 options:0 error:&v24];
    id v19 = v24;
    if (v19)
    {
      id v20 = v19;
      NSLog((NSString *)@"Error while serializing Scrolling Performance Test results: %@", v19);
    }
    else
    {
      v21 = [(PageLoadTestRunner *)self outputFilename];
      id v23 = 0;
      [v18 writeToFile:v21 options:0 error:&v23];
      id v20 = v23;

      if (!v20)
      {

        goto LABEL_13;
      }
      v22 = [(PageLoadTestRunner *)self outputFilename];
      NSLog((NSString *)@"Error writing output to file %@: %@", v22, v20);
    }
  }
  else
  {
    NSLog((NSString *)@"%@", v16);
  }
LABEL_13:
}

- (void)finishedTestRunner
{
  v4.receiver = self;
  v4.super_class = (Class)ScrollPerfTestRunner;
  [(PurplePageLoadTestRunner *)&v4 finishedTestRunner];
  v3 = [(PageLoadTestRunner *)self outputFilename];
  [(PageLoadTestRunner *)self log:@"ScrollPerf Complete. Wrote data to %@", v3];
}

- (void)startingTestPage:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(ScrollPerfTestRunner *)self pageWebView];
  [v5 _setScrollPerformanceDataCollectionEnabled:1];

  v6.receiver = self;
  v6.super_class = (Class)ScrollPerfTestRunner;
  [(PageLoadTestRunner *)&v6 startingTestPage:v4];

  ++self->_pageIndex;
  self->_startLoadTime = CFAbsoluteTimeGetCurrent();
}

- (BOOL)performActionForPage:(id)a3
{
  id v4 = a3;
  unsigned int scrollGestureCount = self->_scrollGestureCount;
  if (!scrollGestureCount)
  {
    if (!self->_gestureState) {
      self->_startScrollingTime = CFAbsoluteTimeGetCurrent();
    }
    goto LABEL_7;
  }
  if (scrollGestureCount != 20 || self->_gestureState)
  {
LABEL_7:
    [(ScrollPerfTestRunner *)self appendToFramerateHistory];
    [(ScrollPerfTestRunner *)self advanceGesture];
    BOOL v6 = 1;
    goto LABEL_8;
  }
  BOOL v6 = 0;
  self->_endScrollingTime = CFAbsoluteTimeGetCurrent();
LABEL_8:

  return v6;
}

- (void)appendToFramerateHistory
{
  v11[2] = *MEMORY[0x1E4F143B8];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double lastFramerateTime = self->_lastFramerateTime;
  if (lastFramerateTime == 0.0)
  {
    self->_double lastFramerateTime = Current;
    self->_lastunsigned int FrameCounter = CARenderServerGetFrameCounter();
  }
  else if (Current - lastFramerateTime >= 0.0666666667)
  {
    unsigned int FrameCounter = CARenderServerGetFrameCounter();
    double v6 = (double)(FrameCounter - self->_lastFrameCounter) / (Current - self->_lastFramerateTime);
    framerateHistory = self->_framerateHistory;
    v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:Current];
    v11[0] = v8;
    v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:v6];
    v11[1] = v9;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [(NSMutableArray *)framerateHistory addObject:v10];

    self->_lastunsigned int FrameCounter = FrameCounter;
    self->_double lastFramerateTime = Current;
  }
}

- (CGPoint)touchPointForMoveIndex:(unint64_t)a3
{
  double v3 = gestureOffsets[a3];
  int64_t scrollDirection = self->_scrollDirection;
  if (scrollDirection == 1)
  {
    double v5 = v3 + 80.0;
  }
  else
  {
    double v5 = 0.0;
    if (!scrollDirection) {
      double v5 = 500.0 - v3;
    }
  }
  double v6 = 100.0;
  result.y = v5;
  result.x = v6;
  return result;
}

- (void)advanceGesture
{
  switch(self->_gestureState)
  {
    case 0:
      int64_t v3 = 1;
      goto LABEL_9;
    case 1:
      [(ScrollPerfTestRunner *)self determineScrollDirection];
      id v4 = [(ScrollPerfTestRunner *)self pageScrollView];
      [v4 contentOffset];
      self->_scrollOffsetAtGestureStart.x = v5;
      self->_scrollOffsetAtGestureStart.y = v6;

      self->_double gestureStartTime = CFAbsoluteTimeGetCurrent();
      eventGeneratorQueue = self->_eventGeneratorQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__ScrollPerfTestRunner_advanceGesture__block_invoke;
      block[3] = &unk_1E6D77E20;
      block[4] = self;
      dispatch_async(eventGeneratorQueue, block);
      int64_t v3 = 2;
      goto LABEL_9;
    case 3:
      double Current = CFAbsoluteTimeGetCurrent();
      double gestureStartTime = self->_gestureStartTime;
      int IsPad = _SFDeviceIsPad();
      double v11 = 0.95;
      if (!IsPad) {
        double v11 = 0.5;
      }
      if (Current <= gestureStartTime + v11) {
        return;
      }
      self->_gestureState = 0;
      unsigned int v12 = self->_scrollGestureCount + 1;
      self->_unsigned int scrollGestureCount = v12;
      if (v12 != 20) {
        return;
      }
      int64_t v3 = 4;
LABEL_9:
      self->_gestureState = v3;
      return;
    case 4:
      v13 = [(ScrollPerfTestRunner *)self pageScrollView];
      char v14 = [v13 isDecelerating];

      if ((v14 & 1) == 0) {
        self->_gestureState = 0;
      }
      return;
    default:
      return;
  }
}

void __38__ScrollPerfTestRunner_advanceGesture__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) touchPointForMoveIndex:0];
  double v3 = v2;
  double v5 = v4;
  double v17 = v2;
  double v18 = v4;
  CGFloat v6 = +[TouchEventGenerator sharedTouchEventGenerator];
  objc_msgSend(v6, "touchDown:", v3, v5);

  for (uint64_t i = 1; i != 7; ++i)
  {
    [*(id *)(a1 + 32) touchPointForMoveIndex:i];
    double v17 = v8;
    double v18 = v9;
    double v10 = +[TouchEventGenerator sharedTouchEventGenerator];
    double v11 = v10;
    if (i == 1) {
      double v12 = 0.0;
    }
    else {
      double v12 = 0.017;
    }
    [v10 moveToPoints:&v17 touchCount:1 duration:v12];
  }
  [*(id *)(a1 + 32) touchPointForMoveIndex:6];
  double v17 = v13;
  double v18 = v14;
  v15 = +[TouchEventGenerator sharedTouchEventGenerator];
  objc_msgSend(v15, "liftUp:", v17, v18);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ScrollPerfTestRunner_advanceGesture__block_invoke_2;
  block[3] = &unk_1E6D77E20;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __38__ScrollPerfTestRunner_advanceGesture__block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 216) = 3;
  return result;
}

- (void)determineScrollDirection
{
  id v11 = [(ScrollPerfTestRunner *)self pageScrollView];
  [v11 contentOffset];
  double v4 = v3;
  [v11 bounds];
  double v6 = v5;
  [v11 contentInset];
  double v8 = v6 - v7;
  [v11 contentSize];
  if (v4 >= v8)
  {
    if (v4 <= v9 + v6 * -2.0) {
      goto LABEL_6;
    }
    int64_t v10 = 1;
  }
  else
  {
    int64_t v10 = 0;
  }
  self->_int64_t scrollDirection = v10;
LABEL_6:
}

- (BOOL)isPageTooShortToScroll
{
  double v2 = [(ScrollPerfTestRunner *)self pageScrollView];
  [v2 bounds];
  double v4 = v3;
  [v2 contentSize];
  BOOL v6 = v5 / v4 < 2.5;

  return v6;
}

- (BOOL)startPageAction:(id)a3
{
  id v4 = a3;
  double v5 = [(ScrollPerfTestRunner *)self pageScrollView];
  [v5 contentSize];
  objc_msgSend(v4, "setContentSizeAtPageLoad:");

  BOOL v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:142];
  framerateHistory = self->_framerateHistory;
  self->_framerateHistory = v6;

  self->_double lastFramerateTime = 0.0;
  if ([(ScrollPerfTestRunner *)self isPageTooShortToScroll])
  {
    [v4 setTooShortToScroll:1];
    double v8 = [(ScrollPerfTestRunner *)self outputDataForPage:v4];
    outputData = self->_outputData;
    int64_t v10 = [v4 URL];
    id v11 = [v10 absoluteString];
    [(NSMutableDictionary *)outputData setObject:v8 forKeyedSubscript:v11];

    BOOL v12 = 0;
  }
  else
  {
    self->_unsigned int scrollGestureCount = 0;
    v14.receiver = self;
    v14.super_class = (Class)ScrollPerfTestRunner;
    BOOL v12 = [(PageLoadTestRunner *)&v14 startPageAction:v4];
  }

  return v12;
}

- (void)finishPage:(id)a3 stats:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  self->_endLoadTime = CFAbsoluteTimeGetCurrent();
  v11.receiver = self;
  v11.super_class = (Class)ScrollPerfTestRunner;
  [(PageLoadTestRunner *)&v11 finishPage:v10 stats:v9 error:v8];
}

- (void)finishedTestPage:(id)a3
{
  id v4 = a3;
  double v5 = [(ScrollPerfTestRunner *)self outputDataForPage:v4];
  outputData = self->_outputData;
  double v7 = [v4 URL];
  id v8 = [v7 absoluteString];
  [(NSMutableDictionary *)outputData setObject:v5 forKeyedSubscript:v8];

  [(ScrollPerfTestRunner *)self writeOutputData];
  id v9 = [(ScrollPerfTestRunner *)self pageWebView];
  [v9 _setScrollPerformanceDataCollectionEnabled:0];

  v10.receiver = self;
  v10.super_class = (Class)ScrollPerfTestRunner;
  [(PageLoadTestRunner *)&v10 finishedTestPage:v4];
}

- (id)finalStatusForPage:(id)a3
{
  id v4 = a3;
  if ([v4 isTooShortToScroll])
  {
    double v5 = @"PageTooShortToScroll";
  }
  else
  {
    unsigned int v6 = [v4 status];
    if (v6 < 7 && ((0x4Fu >> v6) & 1) != 0)
    {
      double v5 = off_1E6D7B3F0[v6];
    }
    else
    {
      [v4 contentSizeAtPageLoad];
      double v8 = v7;
      double v10 = v9;
      objc_super v11 = [(ScrollPerfTestRunner *)self pageScrollView];
      [v11 contentSize];
      double v13 = v12;
      double v15 = v14;

      if (v15 < v10 || v13 < v8) {
        double v5 = @"PageChangedSizeDuringScroll";
      }
      else {
        double v5 = @"FinishedScrolling";
      }
    }
  }

  return v5;
}

- (id)machineConfigInfo
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"model";
  double v2 = mobileGestaltStringForQuery();
  v8[0] = v2;
  v7[1] = @"device";
  double v3 = mobileGestaltStringForQuery();
  v8[1] = v3;
  v7[2] = @"operatingSystem";
  id v4 = mobileGestaltStringForQuery();
  v8[2] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (id)outputDataForPage:(id)a3
{
  v31[13] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26 = [(ScrollPerfTestRunner *)self pageScrollView];
  double v5 = [(ScrollPerfTestRunner *)self pageWebView];
  unsigned int v6 = [v5 _scrollPerformanceData];

  v30[0] = @"url";
  v29 = [v4 URL];
  v28 = [v29 absoluteString];
  v31[0] = v28;
  v30[1] = @"order";
  v27 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_pageIndex];
  v31[1] = v27;
  v30[2] = @"contentHeight";
  double v7 = (void *)MEMORY[0x1E4F28ED0];
  [v26 contentSize];
  v25 = [v7 numberWithDouble:v8];
  v31[2] = v25;
  v30[3] = @"visibleContentHeight";
  double v9 = (void *)MEMORY[0x1E4F28ED0];
  [v26 bounds];
  objc_super v11 = [v9 numberWithDouble:v10];
  v31[3] = v11;
  v30[4] = @"state";
  double v12 = [(ScrollPerfTestRunner *)self finalStatusForPage:v4];
  v31[4] = v12;
  v30[5] = @"startLoadTime";
  double v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_startLoadTime];
  v31[5] = v13;
  v30[6] = @"endLoadTime";
  double v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_endLoadTime];
  v31[6] = v14;
  v30[7] = @"startScrollingTime";
  double v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_startScrollingTime];
  v31[7] = v15;
  v30[8] = @"endScrollingTime";
  v16 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_endScrollingTime];
  v31[8] = v16;
  v30[9] = @"framerate";
  double v17 = (void *)MEMORY[0x1E4F28ED0];
  [v4 framesPerSecond];
  double v19 = v18;

  id v20 = [v17 numberWithDouble:v19];
  v31[9] = v20;
  v31[10] = MEMORY[0x1E4F1CC28];
  v30[10] = @"watchdogTimerFired";
  v30[11] = @"scrollingEvents";
  framerateHistory = (NSMutableArray *)MEMORY[0x1E4F1CBF0];
  v30[12] = @"framerateHistory";
  if (v6) {
    v22 = v6;
  }
  else {
    v22 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (self->_framerateHistory) {
    framerateHistory = self->_framerateHistory;
  }
  v31[11] = v22;
  v31[12] = framerateHistory;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:13];

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_framerateHistory, 0);
  objc_storeStrong((id *)&self->_eventGeneratorQueue, 0);
}

@end