@interface CLSensorRecorderNotifierAdapter
+ (BOOL)isSupportedForType:(int)a3;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLSensorRecorderNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLSensorRecorderNotifierAdapter

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
  if (qword_102487038 != -1) {
    dispatch_once(&qword_102487038, &stru_1023200A8);
  }
  return (id)qword_102487030;
}

- (CLSensorRecorderNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSensorRecorderNotifierAdapter;
  return [(CLSensorRecorderNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSensorRecorderNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLSensorRecorderNotifierClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AAE688();
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
  v4 = [(CLSensorRecorderNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLSensorRecorderNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupportedForType:(int)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10131C310;
  block[3] = &unk_1023200C8;
  int v5 = a3;
  if (qword_102487048 != -1) {
    dispatch_once(&qword_102487048, block);
  }
  return byte_102487040;
}

@end