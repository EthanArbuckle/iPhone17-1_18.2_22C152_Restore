@interface CLBTLEBeaconProviderMockAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLBTLEBeaconProviderMockAdapter)init;
- (void)adaptee;
- (void)addProximityScanEvent:(id)a3;
- (void)addProximityZoneEvent:(id)a3;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)requestScan:(double)a3;
@end

@implementation CLBTLEBeaconProviderMockAdapter

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
  if (qword_102487090 != -1) {
    dispatch_once(&qword_102487090, &stru_102320458);
  }
  return (id)qword_102487088;
}

- (CLBTLEBeaconProviderMockAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLBTLEBeaconProviderMockAdapter;
  return [(CLBTLEBeaconProviderMockAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLBTLEBeaconProviderMockProtocol outboundProtocol:&OBJC_PROTOCOL___CLBTLEBeaconProviderMockClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AAE9A0();
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
  v4 = [(CLBTLEBeaconProviderMockAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLBTLEBeaconProviderMockAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)addProximityZoneEvent:(id)a3
{
  v4 = [(CLBTLEBeaconProviderMockAdapter *)self adaptee];
  (*((void (**)(void *__return_ptr, id))a3 + 2))(v5, a3);
  sub_1013238D8((uint64_t)v4, (uint64_t)v5);
  v7 = off_1022B3DE8;
  if (v9 < 0) {
    operator delete(__p);
  }
  v5[0] = off_1022B3DE8;
  if (v6 < 0) {
    operator delete((void *)v5[1]);
  }
}

- (void)addProximityScanEvent:(id)a3
{
  v4 = [(CLBTLEBeaconProviderMockAdapter *)self adaptee];
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v5, a3);
  sub_101323A48((uint64_t)v4, (uint64_t)v5);
  sub_1007898E8(v5);
}

- (void)requestScan:(double)a3
{
  v4 = *(void (**)(__n128))(*(void *)[(CLBTLEBeaconProviderMockAdapter *)self adaptee] + 232);
  v5.n128_f64[0] = a3;

  v4(v5);
}

@end