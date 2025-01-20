@interface CLDaemonStatusAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetAirplaneMode:(BOOL *)a3;
- (BOOL)syncgetBatterySaverMode;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetHasLingerClients;
- (BOOL)syncgetIsSleeping;
- (BOOL)syncgetRegisterPowerKeepAlive:(BOOL)a3 client:(unint64_t)a4 dbgMessage:(id)a5;
- (CLDaemonStatusAdapter)init;
- (int)syncgetReachability;
- (int)syncgetThermalLevel;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchIsAirplaneModeEnabledWithReply:(id)a3;
- (void)fetchIsBatteryConnectedWithReply:(id)a3;
- (void)fetchReachabilityWithReply:(id)a3;
- (void)fetchWirelessModemClientCountWithReply:(id)a3;
- (void)notifyMigrationPerformed;
- (void)triggerMetricHeartbeatNotification;
@end

@implementation CLDaemonStatusAdapter

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

- (BOOL)syncgetIsSleeping
{
  return *((unsigned char *)[(CLDaemonStatusAdapter *)self adaptee] + 248);
}

- (void)fetchIsAirplaneModeEnabledWithReply:(id)a3
{
  id v4 = [*((id *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 14) airplaneMode];
  v5 = (void (*)(id, id))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)fetchIsBatteryConnectedWithReply:(id)a3
{
  int v9 = 7;
  id v4 = [(CLDaemonStatusAdapter *)self adaptee];
  unsigned int v5 = (*(uint64_t (**)(void *, int *, uint64_t *))(*(void *)v4 + 128))(v4, &v9, &v7);
  if (BYTE1(v8)) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
}

- (void)fetchWirelessModemClientCountWithReply:(id)a3
{
  int v7 = 12;
  LOBYTE(v6[0]) = 0;
  id v4 = [(CLDaemonStatusAdapter *)self adaptee];
  if ((*(unsigned int (**)(void *, int *, _DWORD *))(*(void *)v4 + 128))(v4, &v7, v6)) {
    uint64_t v5 = v6[0];
  }
  else {
    uint64_t v5 = 0;
  }
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v5);
}

- (void)fetchReachabilityWithReply:(id)a3
{
  id v4 = [*((id *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 14) reachability];
  uint64_t v5 = (void (*)(id, id))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (id)getSilo
{
  if (qword_10247C778 != -1) {
    dispatch_once(&qword_10247C778, &stru_1022BE568);
  }
  return (id)qword_10247C770;
}

- (CLDaemonStatusAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLDaemonStatusAdapter;
  return [(CLDaemonStatusAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLDaemonStatusProtocol outboundProtocol:&OBJC_PROTOCOL___CLDaemonStatusClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_1006081CC((uint64_t)[(CLDaemonStatusAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v3 = sub_101A67D10();
    sub_1006081CC(v3);
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  id v4 = [(CLDaemonStatusAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLDaemonStatusAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (BOOL)syncgetAirplaneMode:(BOOL *)a3
{
  *a3 = [[-[CLDaemonStatusAdapter adaptee](self, "adaptee") stringByAppendingPathComponent:@"DBCShutdownCookie"];
  return 1;
}

- (int)syncgetReachability
{
  v2 = (void *)*((void *)[(CLDaemonStatusAdapter *)self adaptee] + 14);

  return [v2 reachability];
}

- (BOOL)syncgetHasLingerClients
{
  int v3 = 19;
  return sub_1001072EC((uint64_t)[(CLDaemonStatusAdapter *)self adaptee], &v3, 1) != 0;
}

- (void)notifyMigrationPerformed
{
  v2 = [(CLDaemonStatusAdapter *)self adaptee];

  sub_100608440((uint64_t)v2);
}

- (BOOL)syncgetRegisterPowerKeepAlive:(BOOL)a3 client:(unint64_t)a4 dbgMessage:(id)a5
{
  BOOL v7 = a3;
  uint64_t v8 = [(CLDaemonStatusAdapter *)self adaptee];
  id v9 = [a5 UTF8String];

  return sub_100608670((uint64_t)v8, v7, a4, (uint64_t)v9);
}

- (void)triggerMetricHeartbeatNotification
{
  v2 = [(CLDaemonStatusAdapter *)self adaptee];

  sub_100608864((uint64_t)v2);
}

- (int)syncgetThermalLevel
{
  v2 = (void *)*((void *)[(CLDaemonStatusAdapter *)self adaptee] + 14);

  return [v2 thermalLevel];
}

- (BOOL)syncgetBatterySaverMode
{
  v2 = (void *)*((void *)[(CLDaemonStatusAdapter *)self adaptee] + 14);

  return [v2 batterySaverModeEnabled];
}

@end