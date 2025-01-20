@interface DPCTelemetry
+ (DPCTelemetry)sharedInstance;
- (DPCTelemetry)init;
- (void)registerError:(unint64_t)a3;
- (void)registerWatchConnectivity:(BOOL)a3;
- (void)registerWatchEvent:(unint64_t)a3 rssiValue:(int64_t)a4;
- (void)registerWatchSwitch;
- (void)registerWatchWristEvent:(int64_t)a3;
@end

@implementation DPCTelemetry

+ (DPCTelemetry)sharedInstance
{
  if (qword_100016EB8 != -1) {
    dispatch_once(&qword_100016EB8, &stru_100010540);
  }
  v2 = (void *)qword_100016EC0;

  return (DPCTelemetry *)v2;
}

- (DPCTelemetry)init
{
  v3.receiver = self;
  v3.super_class = (Class)DPCTelemetry;
  result = [(DPCTelemetry *)&v3 init];
  if (result)
  {
    result->_plClientID = 120;
    result->_plEventName = @"WatchPresence";
  }
  return result;
}

- (void)registerWatchEvent:(unint64_t)a3 rssiValue:(int64_t)a4
{
  v11[0] = @"Timestamp";
  uint64_t v6 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  v7 = (void *)v6;
  CFStringRef v8 = @"WatchPresence";
  if (a3 == 2) {
    CFStringRef v8 = @"WatchAbsence";
  }
  v12[0] = v6;
  v12[1] = v8;
  v11[1] = @"Event";
  v11[2] = @"RSSI";
  v9 = +[NSNumber numberWithInteger:a4];
  v12[2] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  PLLogRegisteredEvent();
}

- (void)registerWatchConnectivity:(BOOL)a3
{
  BOOL v3 = a3;
  v7[0] = @"Timestamp";
  v4 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  v7[1] = @"Event";
  v8[0] = v4;
  CFStringRef v5 = @"WatchDisconnected";
  if (v3) {
    CFStringRef v5 = @"WatchConnected";
  }
  v8[1] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  PLLogRegisteredEvent();
}

- (void)registerError:(unint64_t)a3
{
  if (a3 == 4) {
    BOOL v3 = @"WatchUnreachable";
  }
  else {
    BOOL v3 = @"Unknown";
  }
  if (a3 == 2) {
    BOOL v3 = @"WatchUnavailable";
  }
  v7[0] = @"Timestamp";
  v4 = v3;
  CFStringRef v5 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  v7[1] = @"Event";
  v8[0] = v5;
  v8[1] = v4;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  PLLogRegisteredEvent();
}

- (void)registerWatchWristEvent:(int64_t)a3
{
  if (a3 == 3) {
    BOOL v3 = @"WatchWristStatusOnWrist";
  }
  else {
    BOOL v3 = @"WatchWristStatusUnknown";
  }
  if (a3 == 2) {
    BOOL v3 = @"WatchWristStatusOffWrist";
  }
  if (a3 == 1) {
    BOOL v3 = @"WatchWristStatusDisabled";
  }
  v7[0] = @"Timestamp";
  v4 = v3;
  CFStringRef v5 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  v7[1] = @"Event";
  v8[0] = v5;
  v8[1] = v4;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  PLLogRegisteredEvent();
}

- (void)registerWatchSwitch
{
  v4[0] = @"Timestamp";
  v2 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  v4[1] = @"Event";
  v5[0] = v2;
  v5[1] = @"WatchSwitched";
  BOOL v3 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  PLLogRegisteredEvent();
}

@end