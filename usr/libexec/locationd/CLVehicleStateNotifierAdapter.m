@interface CLVehicleStateNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLVehicleStateNotifierAdapter)init;
- (unint64_t)syncgetVehicularDndHints;
- (unint64_t)syncgetVehicularDndOperatorState;
- (unint64_t)syncgetVehicularDndState;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchVehicularDndOperatorStateWithReply:(id)a3;
- (void)fetchVehicularDndStateAndHintsAndOperatorStateWithReply:(id)a3;
- (void)fetchVehicularDndStateAndHintsWithReply:(id)a3;
- (void)fetchVehicularFalsePositiveSuppressionStatusWithReply:(id)a3;
- (void)resetVehicularFalsePositiveSuppressionDnd;
@end

@implementation CLVehicleStateNotifierAdapter

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
  if (qword_1024887F8 != -1) {
    dispatch_once(&qword_1024887F8, &stru_10232CAC8);
  }
  return (id)qword_1024887F0;
}

- (CLVehicleStateNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLVehicleStateNotifierAdapter;
  return [(CLVehicleStateNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLVehicleStateNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLVehicleStateNotifierClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101ABBDBC();
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
  v4 = [(CLVehicleStateNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLVehicleStateNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  return !sub_10073D24C();
}

- (unint64_t)syncgetVehicularDndState
{
  return *((void *)[(CLVehicleStateNotifierAdapter *)self adaptee] + 143);
}

- (unint64_t)syncgetVehicularDndHints
{
  return *((void *)[(CLVehicleStateNotifierAdapter *)self adaptee] + 145);
}

- (unint64_t)syncgetVehicularDndOperatorState
{
  return *((void *)[(CLVehicleStateNotifierAdapter *)self adaptee] + 146);
}

- (void)resetVehicularFalsePositiveSuppressionDnd
{
  v2 = [(CLVehicleStateNotifierAdapter *)self adaptee];

  sub_10153DE50((uint64_t)v2);
}

- (void)fetchVehicularFalsePositiveSuppressionStatusWithReply:(id)a3
{
  uint64_t v4 = sub_1000A387C((uint64_t)[(CLVehicleStateNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)fetchVehicularDndStateAndHintsWithReply:(id)a3
{
  uint64_t v5 = *((void *)[(CLVehicleStateNotifierAdapter *)self adaptee] + 143);
  uint64_t v6 = *((void *)[(CLVehicleStateNotifierAdapter *)self adaptee] + 145);
  v7 = (void (*)(id, uint64_t, uint64_t))*((void *)a3 + 2);

  v7(a3, v5, v6);
}

- (void)fetchVehicularDndOperatorStateWithReply:(id)a3
{
  uint64_t v4 = *((void *)[(CLVehicleStateNotifierAdapter *)self adaptee] + 146);
  uint64_t v5 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)fetchVehicularDndStateAndHintsAndOperatorStateWithReply:(id)a3
{
  uint64_t v5 = *((void *)[(CLVehicleStateNotifierAdapter *)self adaptee] + 143);
  uint64_t v6 = *((void *)[(CLVehicleStateNotifierAdapter *)self adaptee] + 145);
  uint64_t v7 = *((void *)[(CLVehicleStateNotifierAdapter *)self adaptee] + 146);
  v8 = (void (*)(id, uint64_t, uint64_t, uint64_t))*((void *)a3 + 2);

  v8(a3, v5, v6, v7);
}

@end