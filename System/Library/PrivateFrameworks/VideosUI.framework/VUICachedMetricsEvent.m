@interface VUICachedMetricsEvent
- (NSDictionary)eventData;
- (NSString)eventType;
- (VUICachedMetricsEvent)initWithEventType:(id)a3 eventData:(id)a4;
- (void)setEventData:(id)a3;
- (void)setEventType:(id)a3;
@end

@implementation VUICachedMetricsEvent

- (VUICachedMetricsEvent)initWithEventType:(id)a3 eventData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VUICachedMetricsEvent;
  v8 = [(VUICachedMetricsEvent *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    eventType = v8->_eventType;
    v8->_eventType = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    eventData = v8->_eventData;
    v8->_eventData = (NSDictionary *)v11;
  }
  return v8;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
}

- (NSDictionary)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

@end