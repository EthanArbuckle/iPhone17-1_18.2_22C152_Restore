@interface CLVDRNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLVDRNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)registerForVdr2DofMeasurements:(id)a3;
- (void)unregisterForVdr2DofMeasurements:(id)a3;
@end

@implementation CLVDRNotifierAdapter

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
  if (qword_102480128 != -1) {
    dispatch_once(&qword_102480128, &stru_1022DE1F0);
  }
  return (id)qword_102480120;
}

- (CLVDRNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLVDRNotifierAdapter;
  return [(CLVDRNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLVDRNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLVDRNotifierClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A7EEF0();
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
  v4 = [(CLVDRNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLVDRNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_102480138 != -1) {
    dispatch_once(&qword_102480138, &stru_1022DE210);
  }
  return byte_102480130;
}

- (void)registerForVdr2DofMeasurements:(id)a3
{
  objc_super v3 = *(void (**)(void))(*(void *)[(CLVDRNotifierAdapter *)self adaptee] + 208);

  v3();
}

- (void)unregisterForVdr2DofMeasurements:(id)a3
{
  objc_super v3 = *(void (**)(void))(*(void *)[(CLVDRNotifierAdapter *)self adaptee] + 216);

  v3();
}

@end