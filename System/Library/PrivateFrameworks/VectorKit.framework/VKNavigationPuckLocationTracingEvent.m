@interface VKNavigationPuckLocationTracingEvent
- (NSUUID)locationUUID;
- (VKNavigationPuckLocationTracingEvent)initWithEventType:(int64_t)a3 timestamp:(double)a4 locationUUID:(id)a5;
- (double)timestamp;
- (int64_t)type;
@end

@implementation VKNavigationPuckLocationTracingEvent

- (void).cxx_destruct
{
}

- (NSUUID)locationUUID
{
  return self->_locationUUID;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)type
{
  return self->_eventType;
}

- (VKNavigationPuckLocationTracingEvent)initWithEventType:(int64_t)a3 timestamp:(double)a4 locationUUID:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)VKNavigationPuckLocationTracingEvent;
  v10 = [(VKNavigationPuckLocationTracingEvent *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_eventType = a3;
    v10->_timestamp = a4;
    objc_storeStrong((id *)&v10->_locationUUID, a5);
    v12 = v11;
  }

  return v11;
}

@end