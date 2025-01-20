@interface MSLoggingEvent
- (NSDate)timestamp;
- (NSString)eventType;
- (id)initForEventType:(id)a3 atTimestamp:(id)a4;
@end

@implementation MSLoggingEvent

- (id)initForEventType:(id)a3 atTimestamp:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSLoggingEvent;
  v9 = [(MSLoggingEvent *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventType, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (NSString)eventType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_eventType, 0);
}

@end