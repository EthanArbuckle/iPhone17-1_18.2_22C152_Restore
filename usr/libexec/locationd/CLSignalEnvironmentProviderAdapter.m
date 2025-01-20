@interface CLSignalEnvironmentProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLSignalEnvironmentProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchCoarseSignalEnvironmentForLatitude:(double)a3 longitude:(double)a4 withReply:(id)a5;
@end

@implementation CLSignalEnvironmentProviderAdapter

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
  if (qword_102481790 != -1) {
    dispatch_once(&qword_102481790, &stru_1022F8E60);
  }
  return (id)qword_102481788;
}

- (CLSignalEnvironmentProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSignalEnvironmentProviderAdapter;
  return [(CLSignalEnvironmentProviderAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSignalEnvironmentProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLSignalEnvironmentProviderClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A8F6BC();
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
  v4 = [(CLSignalEnvironmentProviderAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLSignalEnvironmentProviderAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)fetchCoarseSignalEnvironmentForLatitude:(double)a3 longitude:(double)a4 withReply:(id)a5
{
  uint64_t v6 = sub_100DE782C((uint64_t)[(CLSignalEnvironmentProviderAdapter *)self adaptee], a3, a4);
  v7 = (void (*)(id, uint64_t))*((void *)a5 + 2);

  v7(a5, v6);
}

+ (BOOL)isSupported
{
  if (qword_102481798 != -1) {
    dispatch_once(&qword_102481798, &stru_1022F8E80);
  }
  return 1;
}

@end