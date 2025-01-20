@interface CLAppMonitorAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetForegroundApp:(void *)a3;
- (BOOL)syncgetIsApplicationInstalledLocally:(__CFString *)a3;
- (CLAppMonitorAdapter)init;
- (int)syncgetAppType:(id)a3;
- (void)adaptee;
- (void)beginService;
- (void)checkApplications:(id)a3 withReply:(id)a4;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)isApplicationInstalledIncludingPairedDevices:(id)a3 withReply:(id)a4;
- (void)onApplicationStateChange:(id)a3;
- (void)onApplicationStateMonitor:(id)a3 didUpdate:(id)a4 forProcess:(id)a5;
- (void)onApplicationsInstalled:(id)a3;
- (void)onApplicationsProtectionStatusChanged:(id)a3;
- (void)onApplicationsUninstalled:(id)a3;
@end

@implementation CLAppMonitorAdapter

- (void)onApplicationStateChange:(id)a3
{
  v4 = [(CLAppMonitorAdapter *)self adaptee];

  sub_1000A7130((uint64_t)v4, (const __CFDictionary *)a3);
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

- (void)onApplicationStateMonitor:(id)a3 didUpdate:(id)a4 forProcess:(id)a5
{
  v8 = [(CLAppMonitorAdapter *)self adaptee];

  sub_1000B75E4((uint64_t)v8, a4, a5, (uint64_t)a3);
}

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
  if (qword_102486410 != -1) {
    dispatch_once(&qword_102486410, &stru_102318228);
  }
  return (id)qword_102486408;
}

- (CLAppMonitorAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLAppMonitorAdapter;
  return [(CLAppMonitorAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLAppMonitorProtocol outboundProtocol:&OBJC_PROTOCOL___CLAppMonitorClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_101202808((uint64_t)[(CLAppMonitorAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v3 = sub_101AA7140();
    sub_101202808(v3);
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  v4 = [(CLAppMonitorAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLAppMonitorAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (BOOL)syncgetForegroundApp:(void *)a3
{
  v4 = [(CLAppMonitorAdapter *)self adaptee];

  return sub_1012029F0((uint64_t)v4, (uint64_t)a3);
}

- (BOOL)syncgetIsApplicationInstalledLocally:(__CFString *)a3
{
  [(CLAppMonitorAdapter *)self adaptee];

  return sub_101202AA8(a3);
}

- (void)isApplicationInstalledIncludingPairedDevices:(id)a3 withReply:(id)a4
{
  v6 = [(CLAppMonitorAdapter *)self adaptee];

  sub_101202EB4((uint64_t)v6, a3, (uint64_t)a4);
}

- (int)syncgetAppType:(id)a3
{
  [(CLAppMonitorAdapter *)self adaptee];

  return sub_101202FBC(a3);
}

- (void)onApplicationsInstalled:(id)a3
{
  v4 = [(CLAppMonitorAdapter *)self adaptee];

  sub_101203254((uint64_t)v4, a3);
}

- (void)onApplicationsUninstalled:(id)a3
{
  v4 = [(CLAppMonitorAdapter *)self adaptee];

  sub_10120361C((uint64_t)v4, a3);
}

- (void)onApplicationsProtectionStatusChanged:(id)a3
{
  v4 = [(CLAppMonitorAdapter *)self adaptee];

  sub_101203988(v4, a3);
}

- (void)checkApplications:(id)a3 withReply:(id)a4
{
  v6 = [(CLAppMonitorAdapter *)self adaptee];

  sub_101203CDC((uint64_t)v6, a3, (uint64_t)a4);
}

@end