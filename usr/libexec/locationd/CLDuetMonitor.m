@interface CLDuetMonitor
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLDuetMonitor)init;
- (int64_t)eventTypeFromNSNumber:(id)a3;
- (void)beginService;
- (void)dealloc;
- (void)endService;
@end

@implementation CLDuetMonitor

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10247FFF8 != -1) {
    dispatch_once(&qword_10247FFF8, &stru_1022DCB98);
  }
  return (id)qword_10247FFF0;
}

+ (BOOL)isSupported
{
  if (qword_102480008 != -1) {
    dispatch_once(&qword_102480008, &stru_1022DCBB8);
  }
  return (byte_102480000 & 1) == 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLDuetMonitor;
  [(CLDuetMonitor *)&v2 dealloc];
}

- (void)beginService
{
  id v2 = [(CLDuetMonitor *)self universe];

  [v2 silo];
}

- (void)endService
{
  id v2 = [(CLDuetMonitor *)self universe];

  [v2 silo];
}

- (CLDuetMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLDuetMonitor;
  return [(CLDuetMonitor *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLDuetMonitorServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLDuetMonitorClientProtocol];
}

- (int64_t)eventTypeFromNSNumber:(id)a3
{
  if (!a3) {
    sub_101A7E9F4();
  }
  int64_t result = (int)[a3 intValue];
  if (result >= 0xA) {
    sub_101A7EBC4();
  }
  return result;
}

@end