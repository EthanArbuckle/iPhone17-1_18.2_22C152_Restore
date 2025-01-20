@interface CLWatchOrientationSettingsNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLWatchOrientationSettingsNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLWatchOrientationSettingsNotifierAdapter

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
  if (qword_10247E5F8 != -1) {
    dispatch_once(&qword_10247E5F8, &stru_1022CDA50);
  }
  return (id)qword_10247E5F0;
}

- (CLWatchOrientationSettingsNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLWatchOrientationSettingsNotifierAdapter;
  return [(CLWatchOrientationSettingsNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLWatchOrientationSettingsNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLWatchOrientationSettingsNotifierClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A71E6C();
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
  v4 = [(CLWatchOrientationSettingsNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLWatchOrientationSettingsNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_10247E608 != -1) {
    dispatch_once(&qword_10247E608, &stru_1022CDA70);
  }
  return byte_10247E600;
}

@end