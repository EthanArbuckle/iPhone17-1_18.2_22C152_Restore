@interface WFUserConfigureEvent
+ (id)configureEventWithType:(int64_t)a3 new:(int64_t)a4 old:(int64_t)a5;
- (NSDictionary)eventDictionary;
- (NSString)eventName;
- (WFUserConfigureEvent)initWithType:(int64_t)a3 new:(int64_t)a4 old:(int64_t)a5;
- (id)_configureValueStringForType:(int64_t)a3;
- (id)_eventTypeStringForType:(int64_t)a3;
@end

@implementation WFUserConfigureEvent

+ (id)configureEventWithType:(int64_t)a3 new:(int64_t)a4 old:(int64_t)a5
{
  v5 = [[WFUserConfigureEvent alloc] initWithType:a3 new:a4 old:a5];
  return v5;
}

- (WFUserConfigureEvent)initWithType:(int64_t)a3 new:(int64_t)a4 old:(int64_t)a5
{
  v18[3] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)WFUserConfigureEvent;
  v8 = [(WFUserConfigureEvent *)&v16 init];
  v9 = v8;
  if (v8)
  {
    v17[0] = @"type";
    v10 = [(WFUserConfigureEvent *)v8 _eventTypeStringForType:a3];
    v18[0] = v10;
    v17[1] = @"value";
    v11 = [(WFUserConfigureEvent *)v9 _configureValueStringForType:a4];
    v18[1] = v11;
    v17[2] = @"previousValue";
    v12 = [(WFUserConfigureEvent *)v9 _configureValueStringForType:a5];
    v18[2] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    eventDictionary = v9->_eventDictionary;
    v9->_eventDictionary = (NSDictionary *)v13;
  }
  return v9;
}

- (id)_configureValueStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA) {
    return @"unknown";
  }
  else {
    return off_26478E290[a3];
  }
}

- (id)_eventTypeStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"unknown";
  }
  else {
    return off_26478E2E8[a3];
  }
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.wifi.ui.event";
}

- (NSDictionary)eventDictionary
{
  return self->_eventDictionary;
}

- (void).cxx_destruct
{
}

@end