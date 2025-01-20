@interface CLBTLEBeaconProviderAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetAddProximityZone:(const void *)a3;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetRemoveProximityZone:(const void *)a3;
- (BOOL)syncgetadvertiseSelfAsBeaconForRegion:(id)a3 power:(int)a4;
- (CLBTLEBeaconProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)startScan;
- (void)stopScan;
@end

@implementation CLBTLEBeaconProviderAdapter

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
  if (qword_1024875C8 != -1) {
    dispatch_once(&qword_1024875C8, &stru_1023225A0);
  }
  return (id)qword_1024875C0;
}

- (CLBTLEBeaconProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLBTLEBeaconProviderAdapter;
  return [(CLBTLEBeaconProviderAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLBTLEBeaconProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLBTLEBeaconProviderClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AB1CA8();
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
  v4 = [(CLBTLEBeaconProviderAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLBTLEBeaconProviderAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)startScan
{
  v2 = *(void (**)(void))(*(void *)[(CLBTLEBeaconProviderAdapter *)self adaptee] + 240);

  v2();
}

- (void)stopScan
{
  v2 = *(void (**)(void))(*(void *)[(CLBTLEBeaconProviderAdapter *)self adaptee] + 248);

  v2();
}

- (BOOL)syncgetAddProximityZone:(const void *)a3
{
  objc_super v3 = *(uint64_t (**)(void))(*(void *)[(CLBTLEBeaconProviderAdapter *)self adaptee] + 208);

  return v3();
}

- (BOOL)syncgetRemoveProximityZone:(const void *)a3
{
  objc_super v3 = *(uint64_t (**)(void))(*(void *)[(CLBTLEBeaconProviderAdapter *)self adaptee] + 216);

  return v3();
}

- (BOOL)syncgetadvertiseSelfAsBeaconForRegion:(id)a3 power:(int)a4
{
  v4 = *(uint64_t (**)(void))(*(void *)[(CLBTLEBeaconProviderAdapter *)self adaptee] + 256);

  return v4();
}

@end