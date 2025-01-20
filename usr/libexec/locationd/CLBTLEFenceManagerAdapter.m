@interface CLBTLEFenceManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetHasMonitoredRegions:(id)a3;
- (BOOL)syncgetMonitoredRegions:(void *)a3 forClient:(id)a4;
- (CLBTLEFenceManagerAdapter)init;
- (void)adaptee;
- (void)addMonitoredRegion:(id)a3;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)queryBundleIdentifiersWithEnteredRegionsWithReply:(id)a3;
- (void)removeMonitoredRegion:(id)a3;
- (void)requestRegionState:(id)a3;
- (void)simulateBeaconWithProximityUUID:(id)a3 major:(int64_t)a4 minor:(int64_t)a5 eventType:(unsigned __int8)a6;
@end

@implementation CLBTLEFenceManagerAdapter

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
  if (qword_1024870B0 != -1) {
    dispatch_once(&qword_1024870B0, &stru_102320870);
  }
  return (id)qword_1024870A8;
}

- (CLBTLEFenceManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLBTLEFenceManagerAdapter;
  return [(CLBTLEFenceManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLBTLEFenceManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLBTLEFenceManagerClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AAF1D0();
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
  v4 = [(CLBTLEFenceManagerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLBTLEFenceManagerAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_1024870C0 != -1) {
    dispatch_once(&qword_1024870C0, &stru_102320890);
  }
  return byte_1024870B8;
}

- (void)queryBundleIdentifiersWithEnteredRegionsWithReply:(id)a3
{
  objc_super v3 = *(void (**)(void))(*(void *)[(CLBTLEFenceManagerAdapter *)self adaptee] + 256);

  v3();
}

- (void)addMonitoredRegion:(id)a3
{
  v4 = [(CLBTLEFenceManagerAdapter *)self adaptee];
  (*((void (**)(void *__return_ptr, id))a3 + 2))(v5, a3);
  (*(void (**)(void *, void *))(*(void *)v4 + 216))(v4, v5);
  sub_100111F40((uint64_t)v5);
}

- (void)removeMonitoredRegion:(id)a3
{
  v4 = [(CLBTLEFenceManagerAdapter *)self adaptee];
  (*((void (**)(void *__return_ptr, id))a3 + 2))(v5, a3);
  (*(void (**)(void *, void *))(*(void *)v4 + 240))(v4, v5);
  sub_100111F40((uint64_t)v5);
}

- (void)requestRegionState:(id)a3
{
  v4 = [(CLBTLEFenceManagerAdapter *)self adaptee];
  (*((void (**)(void *__return_ptr, id))a3 + 2))(v5, a3);
  (*(void (**)(void *, void *))(*(void *)v4 + 248))(v4, v5);
  sub_100111F40((uint64_t)v5);
}

- (BOOL)syncgetHasMonitoredRegions:(id)a3
{
  v4 = [(CLBTLEFenceManagerAdapter *)self adaptee];
  sub_100134750(__p, (char *)[a3 UTF8String]);
  char v5 = (*(uint64_t (**)(void *, void **))(*(void *)v4 + 232))(v4, __p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  return v5;
}

- (BOOL)syncgetMonitoredRegions:(void *)a3 forClient:(id)a4
{
  v6 = [(CLBTLEFenceManagerAdapter *)self adaptee];
  sub_100134750(__p, (char *)[a4 UTF8String]);
  (*(void (**)(void *, void **, void *))(*(void *)v6 + 224))(v6, __p, a3);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  return 1;
}

- (void)simulateBeaconWithProximityUUID:(id)a3 major:(int64_t)a4 minor:(int64_t)a5 eventType:(unsigned __int8)a6
{
  if (a6 == 1) {
    unsigned int v9 = 4;
  }
  else {
    unsigned int v9 = 1;
  }
  if (a6) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 2;
  }
  v11 = [(CLBTLEFenceManagerAdapter *)self adaptee];
  sub_100134750(__p, (char *)[a3 UTF8String]);
  (*(void (**)(void *, void **, int64_t, int64_t, uint64_t))(*(void *)v11 + 208))(v11, __p, a4, a5, v10);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

@end