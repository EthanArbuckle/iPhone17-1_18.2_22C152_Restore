@interface CLSensorCalibrationControllerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLSensorCalibrationControllerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)start:(BOOL)a3;
@end

@implementation CLSensorCalibrationControllerAdapter

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
  if (qword_1024826B8 != -1) {
    dispatch_once(&qword_1024826B8, &stru_102306BD0);
  }
  return (id)qword_1024826B0;
}

- (CLSensorCalibrationControllerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSensorCalibrationControllerAdapter;
  return [(CLSensorCalibrationControllerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSensorCalibrationControllerProtocol outboundProtocol:&OBJC_PROTOCOL___CLSensorCalibrationControllerClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_100F74CC8((uint64_t)[(CLSensorCalibrationControllerAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v3 = sub_101A96F70();
    sub_100F74CC8(v3);
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
  v4 = [(CLSensorCalibrationControllerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLSensorCalibrationControllerAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)start:(BOOL)a3
{
  v4 = [(CLSensorCalibrationControllerAdapter *)self adaptee];

  sub_100F74F20((uint64_t)v4, a3);
}

+ (BOOL)isSupported
{
  return ((unint64_t)sub_1000A16E8() >> 13) & 1;
}

@end