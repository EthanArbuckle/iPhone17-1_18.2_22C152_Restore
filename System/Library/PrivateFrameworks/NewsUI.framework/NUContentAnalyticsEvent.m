@interface NUContentAnalyticsEvent
- (NUContentAnalyticsEvent)initWithEvent:(id)a3;
- (SXAnalyticsEvent)event;
@end

@implementation NUContentAnalyticsEvent

- (NUContentAnalyticsEvent)initWithEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUContentAnalyticsEvent;
  v6 = [(NUContentAnalyticsEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_event, a3);
  }

  return v7;
}

- (SXAnalyticsEvent)event
{
  return self->_event;
}

- (void).cxx_destruct
{
}

@end