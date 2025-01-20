@interface SiriAnalyticsDerivativeClock
- (NSUUID)isolatedStreamUUID;
- (SiriAnalyticsDerivativeClock)init;
- (SiriAnalyticsDerivativeClock)initWithClockIdentifier:(id)a3 isolatedStreamUUID:(id)a4 timestampOffset:(unint64_t)a5 rootClock:(id)a6;
@end

@implementation SiriAnalyticsDerivativeClock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolatedStreamUUID, 0);
  objc_destroyWeak((id *)&self->_rootClock);
}

- (NSUUID)isolatedStreamUUID
{
  return self->_isolatedStreamUUID;
}

- (SiriAnalyticsDerivativeClock)initWithClockIdentifier:(id)a3 isolatedStreamUUID:(id)a4 timestampOffset:(unint64_t)a5 rootClock:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = mach_absolute_time();
  v17.receiver = self;
  v17.super_class = (Class)SiriAnalyticsDerivativeClock;
  v15 = [(SiriAnalyticsLogicalClock *)&v17 initWithClockIdentifier:v13 timestampOffset:a5 startedOn:v14];

  if (v15)
  {
    objc_storeWeak((id *)&v15->_rootClock, v12);
    objc_storeStrong((id *)&v15->_isolatedStreamUUID, a4);
  }

  return v15;
}

- (SiriAnalyticsDerivativeClock)init
{
  return 0;
}

@end