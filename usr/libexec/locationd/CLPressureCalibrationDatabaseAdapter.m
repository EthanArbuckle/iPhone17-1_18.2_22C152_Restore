@interface CLPressureCalibrationDatabaseAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLPressureCalibrationDatabaseAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLPressureCalibrationDatabaseAdapter

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
  if (qword_102480A58 != -1) {
    dispatch_once(&qword_102480A58, &stru_1022F0DC8);
  }
  return (id)qword_102480A50;
}

- (CLPressureCalibrationDatabaseAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLPressureCalibrationDatabaseAdapter;
  return [(CLPressureCalibrationDatabaseAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLPressureCalibrationDatabaseProtocol outboundProtocol:&OBJC_PROTOCOL___CLPressureCalibrationDatabaseClientProtocol];
}

- (void)beginService
{
  uint64_t v3 = sub_100CA2EC4((uint64_t)[(CLPressureCalibrationDatabaseAdapter *)self universe]);
  if (v3) {
    uint64_t v4 = v3 + 16;
  }
  else {
    uint64_t v4 = 0;
  }
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:v4];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v5 = sub_101A89618();
    sub_100CA2EC4(v5);
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
  uint64_t v4 = [(CLPressureCalibrationDatabaseAdapter *)self adaptee];
  uint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLPressureCalibrationDatabaseAdapter *)self adaptee]);
  uint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_102480A68 != -1) {
    dispatch_once(&qword_102480A68, &stru_1022F0DE8);
  }
  return byte_102480A60;
}

@end