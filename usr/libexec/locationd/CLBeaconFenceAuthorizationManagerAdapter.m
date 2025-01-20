@interface CLBeaconFenceAuthorizationManagerAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetAddFence:(const void *)a3;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetFences:(void *)a3 forBundle:(id)a4;
- (BOOL)syncgetFences:(void *)a3 forBundle:(id)a4 onBehalfOf:(id)a5;
- (BOOL)syncgetRemoveFence:(const void *)a3;
- (CLBeaconFenceAuthorizationManagerAdapter)init;
- (int)syncgetCanBundle:(id)a3 performFenceOperationFor:(id)a4;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchAllFencesCountWithReply:(id)a3;
@end

@implementation CLBeaconFenceAuthorizationManagerAdapter

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
  if (qword_102487760 != -1) {
    dispatch_once(&qword_102487760, &stru_1023233A8);
  }
  return (id)qword_102487758;
}

- (CLBeaconFenceAuthorizationManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLBeaconFenceAuthorizationManagerAdapter;
  return [(CLBeaconFenceAuthorizationManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLBeaconFenceAuthorizationManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLBeaconFenceAuthorizationManagerClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AB2F2C();
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
  v4 = [(CLBeaconFenceAuthorizationManagerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLBeaconFenceAuthorizationManagerAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (BOOL)syncgetAddFence:(const void *)a3
{
  v4 = [(CLBeaconFenceAuthorizationManagerAdapter *)self adaptee];

  sub_1013BB89C((uint64_t)v4, (uint64_t)a3);
}

- (BOOL)syncgetRemoveFence:(const void *)a3
{
  v4 = [(CLBeaconFenceAuthorizationManagerAdapter *)self adaptee];

  sub_1013BC3C4((uint64_t)v4, (uint64_t)a3);
}

- (void)fetchAllFencesCountWithReply:(id)a3
{
}

- (BOOL)syncgetFences:(void *)a3 forBundle:(id)a4
{
  v6 = [(CLBeaconFenceAuthorizationManagerAdapter *)self adaptee];
  sub_100134750(__p, (char *)[a4 UTF8String]);
  sub_1013B8A34((uint64_t)v6 + 128, (uint64_t *)__p, (uint64_t *)a3);
}

- (BOOL)syncgetFences:(void *)a3 forBundle:(id)a4 onBehalfOf:(id)a5
{
  v8 = [(CLBeaconFenceAuthorizationManagerAdapter *)self adaptee];
  sub_100134750(v11, (char *)[a4 UTF8String]);
  sub_100134750(__p, (char *)[a5 UTF8String]);
  sub_1013B95E8((uint64_t)v8 + 128, (uint64_t *)v11, (uint64_t)__p, (uint64_t *)a3);
}

- (int)syncgetCanBundle:(id)a3 performFenceOperationFor:(id)a4
{
  v6 = [(CLBeaconFenceAuthorizationManagerAdapter *)self adaptee];
  sub_100134750(v11, (char *)[a3 UTF8String]);
  sub_100134750(__p, (char *)[a4 UTF8String]);
  int v7 = sub_1013BCCC8((uint64_t)v6, (uint64_t)v11, (uint64_t)__p);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (v12 < 0) {
    operator delete(v11[0]);
  }
  return v7;
}

@end