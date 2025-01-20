@interface CLFenceManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetFences:(void *)a3 forKey:(id)a4;
- (BOOL)syncgetHasMonitoredFences:(id)a3;
- (CLFenceManagerAdapter)init;
- (void)adaptee;
- (void)addFence:(id)a3;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)getFencesForBundleID:(id)a3 withReply:(id)a4;
- (void)removeFence:(id)a3;
- (void)requestChangeFencesStateMatchingHandoffTags:(id)a3 forDeviceID:(id)a4;
- (void)requestRegionState:(id)a3;
- (void)setIsSimulatingLocation:(BOOL)a3;
- (void)simulateFenceWithBundleID:(id)a3 andFenceID:(id)a4 eventType:(unsigned __int8)a5 atLocation:(id)a6;
@end

@implementation CLFenceManagerAdapter

+ (BOOL)isSupported
{
  if (qword_10247EE90 != -1) {
    dispatch_once(&qword_10247EE90, &stru_1022D3988);
  }
  return byte_10247EE88;
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
  if (qword_10247EE80 != -1) {
    dispatch_once(&qword_10247EE80, &stru_1022D3968);
  }
  return (id)qword_10247EE78;
}

- (CLFenceManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLFenceManagerAdapter;
  return [(CLFenceManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLFenceManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLFenceManagerClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A73D50();
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
  v4 = [(CLFenceManagerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLFenceManagerAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)addFence:(id)a3
{
  v4 = [(CLFenceManagerAdapter *)self adaptee];
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v5, a3);
  sub_1009119EC(v4, (uint64_t)v5);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }

  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7);
  }
  if (v6 < 0) {
    operator delete(v5[0]);
  }
}

- (void)removeFence:(id)a3
{
  v4 = [(CLFenceManagerAdapter *)self adaptee];
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v5, a3);
  sub_1009136D0((uint64_t)v4, (long long *)v5);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }

  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7);
  }
  if (v6 < 0) {
    operator delete(v5[0]);
  }
}

- (void)requestRegionState:(id)a3
{
  v4 = [(CLFenceManagerAdapter *)self adaptee];
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v5, a3);
  sub_1009139F4((uint64_t)v4, (uint64_t)v5);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }

  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7);
  }
  if (v6 < 0) {
    operator delete(v5[0]);
  }
}

- (void)requestChangeFencesStateMatchingHandoffTags:(id)a3 forDeviceID:(id)a4
{
  char v6 = (char *)[(CLFenceManagerAdapter *)self adaptee] + 112;

  sub_100DABB18((uint64_t)v6, a3, a4);
}

- (BOOL)syncgetHasMonitoredFences:(id)a3
{
  v4 = [(CLFenceManagerAdapter *)self adaptee];
  sub_100134750(&__p, (char *)[a3 UTF8String]);
  char v5 = sub_100DACA68((uint64_t)v4 + 112);
  if (v8 < 0) {
    operator delete(__p);
  }
  return v5;
}

- (BOOL)syncgetFences:(void *)a3 forKey:(id)a4
{
  char v6 = [(CLFenceManagerAdapter *)self adaptee];
  sub_100134750(__p, (char *)[a4 UTF8String]);
  sub_100DAB084((uint64_t)v6 + 112, (uint64_t)__p, (uint64_t *)a3);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  return 1;
}

- (void)simulateFenceWithBundleID:(id)a3 andFenceID:(id)a4 eventType:(unsigned __int8)a5 atLocation:(id)a6
{
  if (a5 == 1) {
    int v9 = 1;
  }
  else {
    int v9 = -1;
  }
  if (a5) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  v11 = [(CLFenceManagerAdapter *)self adaptee];
  sub_100134750(v25, (char *)[a3 UTF8String]);
  sub_100134750(v23, (char *)[a4 UTF8String]);
  if (a6)
  {
    [a6 clientLocation];
  }
  else
  {
    long long v19 = 0u;
    memset(v20, 0, 28);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
  }
  v21[6] = v18;
  v21[7] = v19;
  v22[0] = v20[0];
  *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)((char *)v20 + 12);
  v21[2] = v14;
  v21[3] = v15;
  v21[4] = v16;
  v21[5] = v17;
  v21[0] = v12;
  v21[1] = v13;
  sub_10091461C((uint64_t)v11, (uint64_t)v25, v23, v10, v21);
  if (v24 < 0) {
    operator delete((void *)v23[0]);
  }
  if (v26 < 0) {
    operator delete(v25[0]);
  }
}

- (void)setIsSimulatingLocation:(BOOL)a3
{
  v4 = [(CLFenceManagerAdapter *)self adaptee];
  v4[3850] = a3;
  uint64_t v5 = (uint64_t)(v4 + 344);

  sub_100D7FAFC(v5, a3);
}

- (void)getFencesForBundleID:(id)a3 withReply:(id)a4
{
  char v6 = [(CLFenceManagerAdapter *)self adaptee];
  sub_100134750(__p, (char *)[a3 UTF8String]);
  sub_100914ADC((uint64_t)v6, (uint64_t)__p, (uint64_t)a4);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

@end