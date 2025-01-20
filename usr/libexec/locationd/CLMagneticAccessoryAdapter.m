@interface CLMagneticAccessoryAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLMagneticAccessoryAdapter)init;
- (CLMagneticAccessoryAdapter)initWithMagneticAccessory:(void *)a3;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLMagneticAccessoryAdapter

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
  if (qword_1024811B0 != -1) {
    dispatch_once(&qword_1024811B0, &stru_1022F3EE8);
  }
  return (id)qword_1024811A8;
}

- (CLMagneticAccessoryAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLMagneticAccessoryAdapter;
  return [(CLMagneticAccessoryAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLMagneticAccessoryProtocol outboundProtocol:&OBJC_PROTOCOL___CLMagneticAccessoryClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A8B4EC();
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
  v4 = [(CLMagneticAccessoryAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLMagneticAccessoryAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_1024811C0 != -1) {
    dispatch_once(&qword_1024811C0, &stru_1022F3F08);
  }
  return byte_1024811B8;
}

- (CLMagneticAccessoryAdapter)initWithMagneticAccessory:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMagneticAccessoryAdapter;
  result = [(CLNotifierServiceAdapter *)&v5 init];
  if (result) {
    result->_magneticAccessory = a3;
  }
  return result;
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
}

@end