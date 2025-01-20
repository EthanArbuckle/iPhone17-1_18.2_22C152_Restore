@interface CLSignificantChangeManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLSignificantChangeManagerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchLastSignificantLocationDistanceAndLatencyWithReply:(id)a3;
- (void)simulateSignificantLocationChange:(id)a3;
@end

@implementation CLSignificantChangeManagerAdapter

- (void)fetchLastSignificantLocationDistanceAndLatencyWithReply:(id)a3
{
  v4 = [(CLSignificantChangeManagerAdapter *)self adaptee];
  v5.n128_u64[0] = v4[23];
  v6.n128_u64[0] = v4[24];
  v7 = (void (*)(id, __n128, __n128))*((void *)a3 + 2);

  v7(a3, v5, v6);
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

+ (BOOL)isSupported
{
  return 1;
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
  if (qword_102480FD0 != -1) {
    dispatch_once(&qword_102480FD0, &stru_1022F1E38);
  }
  return (id)qword_102480FC8;
}

- (CLSignificantChangeManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSignificantChangeManagerAdapter;
  return [(CLSignificantChangeManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSignificantChangeManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLSignificantChangeManagerClientProtocol];
}

- (void)beginService
{
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  v4 = [(CLSignificantChangeManagerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLSignificantChangeManagerAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)simulateSignificantLocationChange:(id)a3
{
  v4 = [(CLSignificantChangeManagerAdapter *)self adaptee];

  sub_100CF2928((uint64_t)v4, a3);
}

@end