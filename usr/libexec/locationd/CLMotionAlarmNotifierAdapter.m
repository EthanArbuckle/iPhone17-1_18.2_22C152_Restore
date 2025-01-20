@interface CLMotionAlarmNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLMotionAlarmNotifierAdapter)init;
- (void)acknowledgeAlarm:(id)a3 withReply:(id)a4;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fireEventAlarm:(unsigned int)a3;
- (void)launchRemoteApplication:(id)a3 withReply:(id)a4;
- (void)onCardioChangeEvent;
- (void)onClassATimerActivity:(id)a3 withAlarmId:(unint64_t)a4;
- (void)registerAlarm:(id)a3 withReply:(id)a4;
- (void)registerClient:(id)a3 adapter:(id)a4 systemClient:(BOOL)a5;
- (void)unregisterAlarm:(id)a3 withReply:(id)a4;
- (void)unregisterClient:(id)a3 systemClient:(BOOL)a4;
@end

@implementation CLMotionAlarmNotifierAdapter

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
  if (qword_10247F208 != -1) {
    dispatch_once(&qword_10247F208, &stru_1022D6A18);
  }
  return (id)qword_10247F200;
}

- (CLMotionAlarmNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLMotionAlarmNotifierAdapter;
  return [(CLMotionAlarmNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLMotionAlarmNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLMotionAlarmNotifierClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A75D94();
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

- (void)doAsync:(id)a3
{
  v4 = [(CLMotionAlarmNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLMotionAlarmNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  return ((unint64_t)sub_1000A16E8() >> 1) & 1;
}

- (void)registerClient:(id)a3 adapter:(id)a4 systemClient:(BOOL)a5
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  sub_1009A4F64((uint64_t)[(CLMotionAlarmNotifierAdapter *)self adaptee], (long long *)v7, (uint64_t)a4);
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
}

- (void)unregisterClient:(id)a3 systemClient:(BOOL)a4
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v5, a3, a2);
  sub_1009A565C((uint64_t)[(CLMotionAlarmNotifierAdapter *)self adaptee], (long long *)v5);
  if (v18 < 0) {
    operator delete(__p);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7);
  }
  if (v6 < 0) {
    operator delete(v5[0]);
  }
}

- (void)registerAlarm:(id)a3 withReply:(id)a4
{
  char v6 = [(CLMotionAlarmNotifierAdapter *)self adaptee];

  sub_1009A5B68((uint64_t)v6, a3, (uint64_t)a4);
}

- (void)unregisterAlarm:(id)a3 withReply:(id)a4
{
  char v6 = [(CLMotionAlarmNotifierAdapter *)self adaptee];

  sub_1009A6B0C((uint64_t)v6, a3, (uint64_t)a4);
}

- (void)acknowledgeAlarm:(id)a3 withReply:(id)a4
{
  char v6 = [(CLMotionAlarmNotifierAdapter *)self adaptee];

  sub_1009A7298((uint64_t)v6, a3, (uint64_t)a4);
}

- (void)launchRemoteApplication:(id)a3 withReply:(id)a4
{
  char v6 = [(CLMotionAlarmNotifierAdapter *)self adaptee];

  sub_1009A7D34((uint64_t)v6, a3, (uint64_t)a4);
}

- (void)onClassATimerActivity:(id)a3 withAlarmId:(unint64_t)a4
{
  char v6 = [(CLMotionAlarmNotifierAdapter *)self adaptee];

  sub_1009A7FF8((uint64_t)v6, (xpc_activity_t)a3, a4);
}

- (void)onCardioChangeEvent
{
  v2 = [(CLMotionAlarmNotifierAdapter *)self adaptee];

  sub_1009A8678((uint64_t)v2);
}

- (void)fireEventAlarm:(unsigned int)a3
{
  v4 = [(CLMotionAlarmNotifierAdapter *)self adaptee];

  sub_1009A8BE4((uint64_t)v4, a3);
}

@end