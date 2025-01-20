@interface PageLoadTestStatistics
+ (void)setRestInterval:(double)a3;
- (BOOL)_pageLoadEventsAreStillPending;
- (NSDate)allSubresourcesLoadedDate;
- (NSDate)domContentLoadedDate;
- (NSDate)firstMeaningfulPaintDate;
- (NSDate)firstVisualLayoutDate;
- (NSDate)lastOnloadEventDate;
- (NSDate)lastPageLoadEventDate;
- (NSDate)lastResourceLoadDate;
- (NSDate)loadStartDate;
- (NSDate)mainFrameLoadDate;
- (NSError)loadError;
- (PageLoadTestStatistics)initWithInjectedBundle:(BOOL)a3 withCallback:(id)a4;
- (WKNavigation)navigation;
- (double)pageLoadingTimeoutInterval;
- (id)callbackBlock;
- (unint64_t)memoryAfterWarning;
- (unint64_t)memoryBeforeWarning;
- (void)_cancelPageLoadingTimeoutTimerIfNeeded;
- (void)_cancelWaitForNewPageLoadEventsTimer;
- (void)_maybePageLoadFinishedForTests;
- (void)_pageLoadFinishedForTests;
- (void)_pageLoadTimeoutTimerFired:(id)a3;
- (void)_scheduleWaitForNewPageLoadEventsTimer;
- (void)_waitForNewPageLoadEventsTimerFired:(id)a3;
- (void)dealloc;
- (void)didGeneratePageLoadTiming:(id)a3;
- (void)failedNavigation:(id)a3 withError:(id)a4;
- (void)finishedFirstVisualLayout;
- (void)finishedLoadingResources;
- (void)finishedNavigation:(id)a3;
- (void)handledOnloadEvents;
- (void)pageLoadFinishedForTestsWK2WithLoadData:(id)a3;
- (void)setAllSubresourcesLoadedDate:(id)a3;
- (void)setCallbackBlock:(id)a3;
- (void)setDomContentLoadedDate:(id)a3;
- (void)setFirstMeaningfulPaintDate:(id)a3;
- (void)setFirstVisualLayoutDate:(id)a3;
- (void)setLastOnloadEventDate:(id)a3;
- (void)setLastPageLoadEventDate:(id)a3;
- (void)setLastResourceLoadDate:(id)a3;
- (void)setLoadError:(id)a3;
- (void)setLoadStartDate:(id)a3;
- (void)setMainFrameLoadDate:(id)a3;
- (void)setMemoryAfterWarning:(unint64_t)a3;
- (void)setMemoryBeforeWarning:(unint64_t)a3;
- (void)setNavigation:(id)a3;
- (void)setPageLoadingTimeoutInterval:(double)a3;
- (void)startedLoadingResources;
- (void)startedNavigation:(id)a3;
- (void)startedPageLoad;
@end

@implementation PageLoadTestStatistics

+ (void)setRestInterval:(double)a3
{
  s_pageLoadRestInterval = *(void *)&a3;
}

- (PageLoadTestStatistics)initWithInjectedBundle:(BOOL)a3 withCallback:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PageLoadTestStatistics;
  v7 = [(PageLoadTestStatistics *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_useInjectedBundle = a3;
    if (v6)
    {
      uint64_t v9 = [v6 copy];
      id callbackBlock = v8->_callbackBlock;
      v8->_id callbackBlock = (id)v9;
    }
  }

  return v8;
}

- (void)dealloc
{
  [(PageLoadTestStatistics *)self _cancelWaitForNewPageLoadEventsTimer];
  [(PageLoadTestStatistics *)self _cancelPageLoadingTimeoutTimerIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)PageLoadTestStatistics;
  [(PageLoadTestStatistics *)&v3 dealloc];
}

- (void)handledOnloadEvents
{
  ++self->_onloadEventsHandled;
  objc_super v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  lastOnloadEventDate = self->_lastOnloadEventDate;
  self->_lastOnloadEventDate = v3;

  [(PageLoadTestStatistics *)self _maybePageLoadFinishedForTests];
}

- (void)startedPageLoad
{
  objc_super v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  loadStartDate = self->_loadStartDate;
  self->_loadStartDate = v3;
}

- (void)startedNavigation:(id)a3
{
  navigation = self->_navigation;
  if (navigation) {
    BOOL v4 = navigation == a3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    ++self->_framesToLoad;
  }
}

- (void)finishedLoadingResources
{
  self->_pendingResourceLoad = 0;
  if (!self->_lastPageLoadEventDate)
  {
    objc_super v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    lastResourceLoadDate = self->_lastResourceLoadDate;
    self->_lastResourceLoadDate = v3;

    [(PageLoadTestStatistics *)self _maybePageLoadFinishedForTests];
  }
}

- (void)startedLoadingResources
{
  self->_pendingResourceLoad = 1;
  if (self->_waitForNewPageLoadEventsTimer) {
    [(PageLoadTestStatistics *)self _cancelWaitForNewPageLoadEventsTimer];
  }
}

- (void)finishedFirstVisualLayout
{
  objc_super v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  firstVisualLayoutDate = self->_firstVisualLayoutDate;
  self->_firstVisualLayoutDate = v3;

  [(PageLoadTestStatistics *)self _maybePageLoadFinishedForTests];
}

- (void)failedNavigation:(id)a3 withError:(id)a4
{
  id v14 = a4;
  navigation = self->_navigation;
  if (navigation) {
    BOOL v8 = navigation == a3;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:self->_loadStartDate];
    double v11 = v10;

    if (v11 >= 0.05)
    {
      objc_super v12 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
      lastPageLoadEventDate = self->_lastPageLoadEventDate;
      self->_lastPageLoadEventDate = v12;

      objc_storeStrong((id *)&self->_loadError, a4);
      [(PageLoadTestStatistics *)self _pageLoadFinishedForTests];
    }
    else
    {
      NSLog((NSString *)@"PageLoadTestStatistics ignoring error due to 'load duration < 50ms' heuristic: %@", v14);
    }
  }
}

- (void)finishedNavigation:(id)a3
{
  navigation = self->_navigation;
  if (navigation) {
    BOOL v4 = navigation == a3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    id v6 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    mainFrameLoadDate = self->_mainFrameLoadDate;
    self->_mainFrameLoadDate = v6;

    [(PageLoadTestStatistics *)self _maybePageLoadFinishedForTests];
  }
}

- (void)pageLoadFinishedForTestsWK2WithLoadData:(id)a3
{
  id v4 = a3;
  if (self->_useInjectedBundle)
  {
    v5 = (void *)MEMORY[0x1E4F1C9C8];
    id v30 = v4;
    id v6 = [v4 objectForKey:@"PageLoadStartTime"];
    [v6 doubleValue];
    v7 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");

    BOOL v8 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v9 = [v30 objectForKey:@"PageLoadEndTime"];
    [v9 doubleValue];
    double v10 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");

    double v11 = (void *)MEMORY[0x1E4F1C9C8];
    objc_super v12 = [v30 objectForKey:@"PageLoadFirstVisuallyNonEmptyLayoutTime"];
    [v12 doubleValue];
    v13 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");

    self->_framesToLoad = 0;
    self->_onloadEventsHandled = 0;
    self->_pendingResourceLoad = 0;
    objc_storeStrong((id *)&self->_firstVisualLayoutDate, v13);
    objc_storeStrong((id *)&self->_loadStartDate, v7);
    objc_storeStrong((id *)&self->_lastOnloadEventDate, v10);
    objc_storeStrong((id *)&self->_mainFrameLoadDate, v10);
    objc_storeStrong((id *)&self->_lastResourceLoadDate, v10);
    objc_storeStrong((id *)&self->_lastPageLoadEventDate, v10);
    loadError = self->_loadError;
    self->_loadError = 0;

    v15 = [v30 objectForKey:@"PageMemoryBeforeWarning"];
    self->_memoryBeforeWarning = [v15 unsignedLongLongValue];

    v16 = [v30 objectForKey:@"PageMemoryAfterWarning"];
    self->_memoryAfterWarning = [v16 unsignedLongLongValue];

    v17 = (void *)MEMORY[0x1E4F1C9C8];
    v18 = [v30 objectForKey:@"PageLoadDOMContentLoadedTime"];
    [v18 doubleValue];
    objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
    v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
    domContentLoadedDate = self->_domContentLoadedDate;
    self->_domContentLoadedDate = v19;

    v21 = (void *)MEMORY[0x1E4F1C9C8];
    v22 = [v30 objectForKey:@"PageLoadFirstMeaningfulPaintTime"];
    [v22 doubleValue];
    objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
    v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
    firstMeaningfulPaintDate = self->_firstMeaningfulPaintDate;
    self->_firstMeaningfulPaintDate = v23;

    v25 = (void *)MEMORY[0x1E4F1C9C8];
    v26 = [v30 objectForKey:@"PageLoadAllSubresourcesLoadedTime"];
    [v26 doubleValue];
    objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
    v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
    allSubresourcesLoadedDate = self->_allSubresourcesLoadedDate;
    self->_allSubresourcesLoadedDate = v27;

    id callbackBlock = (void (**)(id, PageLoadTestStatistics *))self->_callbackBlock;
    if (callbackBlock) {
      callbackBlock[2](callbackBlock, self);
    }

    id v4 = v30;
  }
}

- (void)didGeneratePageLoadTiming:(id)a3
{
  id v4 = a3;
  if (!self->_useInjectedBundle)
  {
    id v24 = v4;
    v5 = [v4 firstVisualLayout];
    id v6 = [v24 firstMeaningfulPaint];
    v7 = [v5 laterDate:v6];
    BOOL v8 = [v24 documentFinishedLoading];
    uint64_t v9 = [v7 laterDate:v8];
    double v10 = [v24 allSubresourcesFinishedLoading];
    double v11 = [v9 laterDate:v10];

    self->_framesToLoad = 0;
    self->_onloadEventsHandled = 0;
    self->_pendingResourceLoad = 0;
    objc_super v12 = [v24 firstVisualLayout];
    firstVisualLayoutDate = self->_firstVisualLayoutDate;
    self->_firstVisualLayoutDate = v12;

    id v14 = [v24 navigationStart];
    loadStartDate = self->_loadStartDate;
    self->_loadStartDate = v14;

    objc_storeStrong((id *)&self->_lastOnloadEventDate, v11);
    objc_storeStrong((id *)&self->_mainFrameLoadDate, v11);
    objc_storeStrong((id *)&self->_lastResourceLoadDate, v11);
    objc_storeStrong((id *)&self->_lastPageLoadEventDate, v11);
    loadError = self->_loadError;
    self->_loadError = 0;

    self->_memoryBeforeWarning = 0;
    self->_memoryAfterWarning = 0;
    v17 = [v24 documentFinishedLoading];
    domContentLoadedDate = self->_domContentLoadedDate;
    self->_domContentLoadedDate = v17;

    v19 = [v24 firstMeaningfulPaint];
    firstMeaningfulPaintDate = self->_firstMeaningfulPaintDate;
    self->_firstMeaningfulPaintDate = v19;

    v21 = [v24 allSubresourcesFinishedLoading];
    allSubresourcesLoadedDate = self->_allSubresourcesLoadedDate;
    self->_allSubresourcesLoadedDate = v21;

    id callbackBlock = (void (**)(id, PageLoadTestStatistics *))self->_callbackBlock;
    if (callbackBlock) {
      callbackBlock[2](callbackBlock, self);
    }

    id v4 = v24;
  }
}

- (void)_maybePageLoadFinishedForTests
{
  [(PageLoadTestStatistics *)self _cancelPageLoadingTimeoutTimerIfNeeded];
  if (![(PageLoadTestStatistics *)self _pageLoadEventsAreStillPending])
  {
    [(PageLoadTestStatistics *)self _scheduleWaitForNewPageLoadEventsTimer];
  }
}

- (void)_waitForNewPageLoadEventsTimerFired:(id)a3
{
  [(PageLoadTestStatistics *)self _cancelWaitForNewPageLoadEventsTimer];
  if (![(PageLoadTestStatistics *)self _pageLoadEventsAreStillPending]
    && !self->_lastPageLoadEventDate)
  {
    [(PageLoadTestStatistics *)self _pageLoadFinishedForTests];
  }
}

- (void)_pageLoadFinishedForTests
{
  [(PageLoadTestStatistics *)self _cancelWaitForNewPageLoadEventsTimer];
  if (!self->_lastPageLoadEventDate)
  {
    objc_super v3 = [(NSDate *)self->_mainFrameLoadDate laterDate:self->_firstVisualLayoutDate];
    id v4 = [v3 laterDate:self->_lastOnloadEventDate];
    v5 = [v4 laterDate:self->_lastResourceLoadDate];
    lastPageLoadEventDate = self->_lastPageLoadEventDate;
    self->_lastPageLoadEventDate = v5;
  }
  id callbackBlock = self->_callbackBlock;
  if (callbackBlock)
  {
    BOOL v8 = (void (*)(void))*((void *)callbackBlock + 2);
    v8();
  }
}

- (BOOL)_pageLoadEventsAreStillPending
{
  mainFrameLoadDate = self->_mainFrameLoadDate;
  if (mainFrameLoadDate
    && !self->_pendingResourceLoad
    && self->_firstVisualLayoutDate
    && self->_onloadEventsHandled == self->_framesToLoad)
  {
    return 0;
  }
  return *(double *)&s_pageLoadRestInterval != 0.0 || mainFrameLoadDate == 0;
}

- (void)_cancelWaitForNewPageLoadEventsTimer
{
  [(NSTimer *)self->_waitForNewPageLoadEventsTimer invalidate];
  waitForNewPageLoadEventsTimer = self->_waitForNewPageLoadEventsTimer;
  self->_waitForNewPageLoadEventsTimer = 0;
}

- (void)_scheduleWaitForNewPageLoadEventsTimer
{
  [(PageLoadTestStatistics *)self _cancelWaitForNewPageLoadEventsTimer];
  objc_super v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__waitForNewPageLoadEventsTimerFired_ selector:0 userInfo:0 repeats:*(double *)&s_pageLoadRestInterval];
  waitForNewPageLoadEventsTimer = self->_waitForNewPageLoadEventsTimer;
  self->_waitForNewPageLoadEventsTimer = v3;
}

- (void)_cancelPageLoadingTimeoutTimerIfNeeded
{
  [(NSTimer *)self->_pageLoadingTimeoutTimer invalidate];
  pageLoadingTimeoutTimer = self->_pageLoadingTimeoutTimer;
  self->_pageLoadingTimeoutTimer = 0;
}

- (void)_pageLoadTimeoutTimerFired:(id)a3
{
  navigation = self->_navigation;
  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:kPageLoadStatsErrorDomain code:-1 userInfo:0];
  -[PageLoadTestStatistics failedNavigation:withError:](self, "failedNavigation:withError:", navigation);
}

- (void)setPageLoadingTimeoutInterval:(double)a3
{
  if (self->_pageLoadingTimeoutInterval != a3)
  {
    self->_pageLoadingTimeoutInterval = a3;
    [(PageLoadTestStatistics *)self _cancelPageLoadingTimeoutTimerIfNeeded];
    if (self->_pageLoadingTimeoutInterval > 0.0)
    {
      objc_msgSend(MEMORY[0x1E4F1CB00], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__pageLoadTimeoutTimerFired_, 0, 0);
      id v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      pageLoadingTimeoutTimer = self->_pageLoadingTimeoutTimer;
      self->_pageLoadingTimeoutTimer = v4;
    }
  }
}

- (WKNavigation)navigation
{
  return self->_navigation;
}

- (void)setNavigation:(id)a3
{
}

- (NSDate)firstVisualLayoutDate
{
  return self->_firstVisualLayoutDate;
}

- (void)setFirstVisualLayoutDate:(id)a3
{
}

- (NSDate)loadStartDate
{
  return self->_loadStartDate;
}

- (void)setLoadStartDate:(id)a3
{
}

- (NSDate)lastOnloadEventDate
{
  return self->_lastOnloadEventDate;
}

- (void)setLastOnloadEventDate:(id)a3
{
}

- (NSDate)mainFrameLoadDate
{
  return self->_mainFrameLoadDate;
}

- (void)setMainFrameLoadDate:(id)a3
{
}

- (NSDate)lastResourceLoadDate
{
  return self->_lastResourceLoadDate;
}

- (void)setLastResourceLoadDate:(id)a3
{
}

- (NSDate)lastPageLoadEventDate
{
  return self->_lastPageLoadEventDate;
}

- (void)setLastPageLoadEventDate:(id)a3
{
}

- (NSDate)domContentLoadedDate
{
  return self->_domContentLoadedDate;
}

- (void)setDomContentLoadedDate:(id)a3
{
}

- (NSDate)firstMeaningfulPaintDate
{
  return self->_firstMeaningfulPaintDate;
}

- (void)setFirstMeaningfulPaintDate:(id)a3
{
}

- (NSDate)allSubresourcesLoadedDate
{
  return self->_allSubresourcesLoadedDate;
}

- (void)setAllSubresourcesLoadedDate:(id)a3
{
}

- (NSError)loadError
{
  return self->_loadError;
}

- (void)setLoadError:(id)a3
{
}

- (id)callbackBlock
{
  return self->_callbackBlock;
}

- (void)setCallbackBlock:(id)a3
{
}

- (unint64_t)memoryBeforeWarning
{
  return self->_memoryBeforeWarning;
}

- (void)setMemoryBeforeWarning:(unint64_t)a3
{
  self->_memoryBeforeWarning = a3;
}

- (unint64_t)memoryAfterWarning
{
  return self->_memoryAfterWarning;
}

- (void)setMemoryAfterWarning:(unint64_t)a3
{
  self->_memoryAfterWarning = a3;
}

- (double)pageLoadingTimeoutInterval
{
  return self->_pageLoadingTimeoutInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callbackBlock, 0);
  objc_storeStrong((id *)&self->_loadError, 0);
  objc_storeStrong((id *)&self->_allSubresourcesLoadedDate, 0);
  objc_storeStrong((id *)&self->_firstMeaningfulPaintDate, 0);
  objc_storeStrong((id *)&self->_domContentLoadedDate, 0);
  objc_storeStrong((id *)&self->_lastPageLoadEventDate, 0);
  objc_storeStrong((id *)&self->_lastResourceLoadDate, 0);
  objc_storeStrong((id *)&self->_mainFrameLoadDate, 0);
  objc_storeStrong((id *)&self->_lastOnloadEventDate, 0);
  objc_storeStrong((id *)&self->_loadStartDate, 0);
  objc_storeStrong((id *)&self->_firstVisualLayoutDate, 0);
  objc_storeStrong((id *)&self->_navigation, 0);
  objc_storeStrong((id *)&self->_pageLoadingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_waitForNewPageLoadEventsTimer, 0);
}

@end