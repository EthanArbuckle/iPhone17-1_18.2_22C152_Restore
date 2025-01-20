@interface _PXStoryAnalyticsSessionInfo
- (CPAnalyticsEventProtocol)endEvent;
- (CPAnalyticsEventProtocol)startEvent;
- (_PXStoryAnalyticsSessionInfo)initWithEvent:(id)a3;
- (int64_t)appSuspensionCount;
- (int64_t)pauseCount;
- (void)didPauseWithEvent:(id)a3;
- (void)didSuspendAppWithEvent:(id)a3;
- (void)finalizeWithEvent:(id)a3;
- (void)setEndEvent:(id)a3;
- (void)setStartEvent:(id)a3;
@end

@implementation _PXStoryAnalyticsSessionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEvent, 0);
  objc_storeStrong((id *)&self->_startEvent, 0);
}

- (void)setEndEvent:(id)a3
{
}

- (CPAnalyticsEventProtocol)endEvent
{
  return self->_endEvent;
}

- (int64_t)appSuspensionCount
{
  return self->_appSuspensionCount;
}

- (int64_t)pauseCount
{
  return self->_pauseCount;
}

- (void)setStartEvent:(id)a3
{
}

- (CPAnalyticsEventProtocol)startEvent
{
  return self->_startEvent;
}

- (void)finalizeWithEvent:(id)a3
{
}

- (void)didSuspendAppWithEvent:(id)a3
{
}

- (void)didPauseWithEvent:(id)a3
{
}

- (_PXStoryAnalyticsSessionInfo)initWithEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryAnalyticsSessionInfo;
  v6 = [(_PXStoryAnalyticsSessionInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_startEvent, a3);
  }

  return v7;
}

@end