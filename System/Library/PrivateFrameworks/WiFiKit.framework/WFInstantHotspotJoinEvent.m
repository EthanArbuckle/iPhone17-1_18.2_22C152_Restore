@interface WFInstantHotspotJoinEvent
+ (id)joinEventWithType:(int64_t)a3 latency:(double)a4 channel:(unint64_t)a5 error:(int64_t)a6;
- (NSDictionary)eventDictionary;
- (NSString)eventName;
- (WFInstantHotspotJoinEvent)initWithType:(int64_t)a3 latency:(double)a4 channel:(unint64_t)a5 error:(int64_t)a6;
- (id)_eventTypeStringForType:(int64_t)a3;
- (int64_t)_bandGHzForChannel:(unint64_t)a3;
@end

@implementation WFInstantHotspotJoinEvent

+ (id)joinEventWithType:(int64_t)a3 latency:(double)a4 channel:(unint64_t)a5 error:(int64_t)a6
{
  v6 = [[WFInstantHotspotJoinEvent alloc] initWithType:a3 latency:a5 channel:a6 error:a4];
  return v6;
}

- (WFInstantHotspotJoinEvent)initWithType:(int64_t)a3 latency:(double)a4 channel:(unint64_t)a5 error:(int64_t)a6
{
  v23[7] = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)WFInstantHotspotJoinEvent;
  v10 = [(WFInstantHotspotJoinEvent *)&v21 init];
  v11 = v10;
  if (v10)
  {
    v22[0] = @"latencyType";
    v12 = [(WFInstantHotspotJoinEvent *)v10 _eventTypeStringForType:a3];
    v23[0] = v12;
    v22[1] = @"latency";
    v13 = [NSNumber numberWithDouble:a4];
    v23[1] = v13;
    v22[2] = @"successfulJoinAttempt";
    v14 = [NSNumber numberWithBool:a6 == 0];
    v23[2] = v14;
    v23[3] = @"Settings";
    v22[3] = @"joinReason";
    v22[4] = @"failureReporter";
    v15 = @"wifi";
    if (a3 == 1) {
      v15 = @"sharing";
    }
    v23[4] = v15;
    v22[5] = @"joinFailureCode";
    v16 = [NSNumber numberWithInteger:a6];
    v23[5] = v16;
    v22[6] = @"band";
    v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFInstantHotspotJoinEvent _bandGHzForChannel:](v11, "_bandGHzForChannel:", a5));
    v23[6] = v17;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:7];
    eventDictionary = v11->_eventDictionary;
    v11->_eventDictionary = (NSDictionary *)v18;
  }
  return v11;
}

- (id)_eventTypeStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"unknown";
  }
  else {
    return off_26478E4D0[a3];
  }
}

- (int64_t)_bandGHzForChannel:(unint64_t)a3
{
  int64_t v3 = 2;
  if (a3 > 0x23) {
    int64_t v3 = 5;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.wifi.personalHotspotJoinAttempt";
}

- (NSDictionary)eventDictionary
{
  return self->_eventDictionary;
}

- (void).cxx_destruct
{
}

@end