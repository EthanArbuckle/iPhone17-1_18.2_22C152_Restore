@interface WFUserEvent
+ (id)eventWithType:(int64_t)a3;
+ (id)eventWithType:(int64_t)a3 state:(BOOL)a4;
+ (id)eventWithType:(int64_t)a3 stateEnum:(unsigned int)a4;
- (NSDictionary)eventDictionary;
- (NSString)eventName;
- (WFUserEvent)initWithType:(int64_t)a3 state:(BOOL)a4 stateEnum:(unsigned int)a5;
- (id)_eventTypeStringForType:(int64_t)a3;
@end

@implementation WFUserEvent

+ (id)eventWithType:(int64_t)a3
{
  v3 = [[WFUserEvent alloc] initWithType:a3 state:0 stateEnum:0];
  return v3;
}

+ (id)eventWithType:(int64_t)a3 state:(BOOL)a4
{
  v4 = [[WFUserEvent alloc] initWithType:a3 state:a4 stateEnum:0];
  return v4;
}

- (WFUserEvent)initWithType:(int64_t)a3 state:(BOOL)a4 stateEnum:(unsigned int)a5
{
  BOOL v6 = a4;
  v20[3] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)WFUserEvent;
  v8 = [(WFUserEvent *)&v18 init];
  if (v8)
  {
    v9 = @"false";
    if (v6) {
      v9 = @"true";
    }
    v10 = v9;
    v11 = v10;
    if (a3 == 2)
    {

      if (a5 > 2) {
        v11 = @"unknown";
      }
      else {
        v11 = off_26478FA00[a5];
      }
    }
    v19[0] = @"type";
    v12 = [(WFUserEvent *)v8 _eventTypeStringForType:a3];
    v20[0] = v12;
    v20[1] = v11;
    v19[1] = @"value";
    v19[2] = @"process";
    v13 = +[WFMetricsManager sharedManager];
    v14 = [v13 processName];
    v20[2] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
    eventDictionary = v8->_eventDictionary;
    v8->_eventDictionary = (NSDictionary *)v15;
  }
  return v8;
}

+ (id)eventWithType:(int64_t)a3 stateEnum:(unsigned int)a4
{
  v4 = [[WFUserEvent alloc] initWithType:a3 state:0 stateEnum:*(void *)&a4];
  return v4;
}

- (id)_eventTypeStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xD) {
    return @"unknown";
  }
  else {
    return off_26478FA18[a3];
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