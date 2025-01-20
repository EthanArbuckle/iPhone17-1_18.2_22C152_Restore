@interface _PXAnalyticsSlideshowInfo
- (CPAnalyticsEventProtocol)endEvent;
- (CPAnalyticsEventProtocol)lastPauseEvent;
- (CPAnalyticsEventProtocol)startEvent;
- (double)timePaused;
- (int64_t)appSuspensionCount;
- (int64_t)pauseCount;
- (int64_t)signpostID;
- (void)pauseWithEvent:(id)a3;
- (void)setAppSuspensionCount:(int64_t)a3;
- (void)setEndEvent:(id)a3;
- (void)setSignpostID:(int64_t)a3;
- (void)setStartEvent:(id)a3;
- (void)unpauseWithEvent:(id)a3;
@end

@implementation _PXAnalyticsSlideshowInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPauseEvent, 0);
  objc_storeStrong((id *)&self->_endEvent, 0);
  objc_storeStrong((id *)&self->_startEvent, 0);
}

- (void)setAppSuspensionCount:(int64_t)a3
{
  self->_appSuspensionCount = a3;
}

- (int64_t)appSuspensionCount
{
  return self->_appSuspensionCount;
}

- (void)setSignpostID:(int64_t)a3
{
  self->_signpostID = a3;
}

- (int64_t)signpostID
{
  return self->_signpostID;
}

- (int64_t)pauseCount
{
  return self->_pauseCount;
}

- (double)timePaused
{
  return self->_timePaused;
}

- (CPAnalyticsEventProtocol)lastPauseEvent
{
  return self->_lastPauseEvent;
}

- (void)setEndEvent:(id)a3
{
}

- (CPAnalyticsEventProtocol)endEvent
{
  return self->_endEvent;
}

- (void)setStartEvent:(id)a3
{
}

- (CPAnalyticsEventProtocol)startEvent
{
  return self->_startEvent;
}

- (void)unpauseWithEvent:(id)a3
{
  if (self->_lastPauseEvent)
  {
    v4 = [a3 timestamp];
    v5 = [(CPAnalyticsEventProtocol *)self->_lastPauseEvent timestamp];
    [v4 timeIntervalSinceDate:v5];
    self->_timePaused = v6 + self->_timePaused;

    lastPauseEvent = self->_lastPauseEvent;
    self->_lastPauseEvent = 0;
  }
}

- (void)pauseWithEvent:(id)a3
{
  v5 = (CPAnalyticsEventProtocol *)a3;
  if (self->_lastPauseEvent != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_lastPauseEvent, a3);
    v5 = v6;
    ++self->_pauseCount;
  }
}

@end