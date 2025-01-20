@interface CLNetworkLocationProviderAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetIsBroadConnection;
- (BOOL)syncgetMetric:(void *)a3;
- (CLNetworkLocationProviderAdapter)init;
- (int)syncgetBestMatchLocation:(CLDaemonLocation *)a3 forCell:(const void *)a4;
- (int)syncgetQueryLocationsForCells:(const void *)a3 useCache:(BOOL)a4;
- (int)syncgetQueryLocationsForWifis:(const void *)a3 useCache:(BOOL)a4 piggyback:(BOOL)a5 config:(const CLNetworkLocationRequestConfig *)a6;
- (int)syncgetQueryNearbys:(const CLDaemonLocation *)a3 forFenceKeys:(const void *)a4;
- (void)adaptee;
- (void)addResponseListener:(CLNetworkLocationServerResponseListener *)a3;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchQueryLocationsForWifis:(id)a3 useCache:(BOOL)a4 piggyback:(BOOL)a5 config:(id)a6 withReply:(id)a7;
- (void)removeResponseListener:(CLNetworkLocationServerResponseListener *)a3;
- (void)resetRetryCounters:(id)a3;
- (void)setCurrentReachability:(int)a3;
- (void)setLocation_CDMA:(id)a3 forCell:(id)a4;
- (void)setLocation_GSM:(id)a3 forCell:(id)a4;
- (void)setLocation_LTE:(id)a3 forCell:(id)a4;
- (void)setLocation_NR:(id)a3 forCell:(id)a4;
- (void)setLocation_SCDMA:(id)a3 forCell:(id)a4;
- (void)setPrivateMode:(BOOL)a3;
@end

@implementation CLNetworkLocationProviderAdapter

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

- (BOOL)syncgetIsBroadConnection
{
  v2 = [(CLNetworkLocationProviderAdapter *)self adaptee];

  return sub_10002CD60(v2);
}

- (int)syncgetBestMatchLocation:(CLDaemonLocation *)a3 forCell:(const void *)a4
{
  v6 = [(CLNetworkLocationProviderAdapter *)self adaptee];

  return sub_1000A9174((uint64_t)v6, (uint64_t)a4, (uint64_t)a3);
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

- (void)resetRetryCounters:(id)a3
{
  v4 = [(CLNetworkLocationProviderAdapter *)self adaptee];
  id v5 = [a3 UTF8String];

  sub_10000EE38((uint64_t)v4, (uint64_t)v5);
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (id)getSilo
{
  if (qword_10247D1D8 != -1) {
    dispatch_once(&qword_10247D1D8, &stru_1022C4FA8);
  }
  return (id)qword_10247D1D0;
}

- (CLNetworkLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLNetworkLocationProviderAdapter;
  return [(CLNetworkLocationProviderAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLNetworkLocationProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLNetworkLocationProviderClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_1006DA6D0((uint64_t)[(CLNetworkLocationProviderAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v3 = sub_101A6B134();
    sub_1006DA6D0(v3);
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  v4 = [(CLNetworkLocationProviderAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLNetworkLocationProviderAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)setLocation_GSM:(id)a3 forCell:(id)a4
{
  if (a3)
  {
    [a3 clientLocation];
  }
  else
  {
    long long v14 = 0u;
    memset(v15, 0, 28);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
  }
  LODWORD(v16[1]) = DWORD2(v15[0]);
  *(_OWORD *)((char *)&v16[1] + 4) = *(_OWORD *)((char *)v15 + 12);
  v6 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee", v7, v8, v9, v10, v11, v12, v13, v14, v15[0], *(void *)&v15[1], *((void *)&v15[1] + 1), v7, v8, v9, v10, v11, v12,
         v13,
         v14,
         *(void *)&v15[0],
         v16[1],
         (unint64_t)(*(_OWORD *)((char *)v15 + 12) >> 32),
         v16[3]);
  (*((void (**)(long long *__return_ptr, id))a4 + 2))(&v7, a4);
  sub_1006DA94C((uint64_t)v6);
}

- (void)setLocation_SCDMA:(id)a3 forCell:(id)a4
{
  if (a3)
  {
    [a3 clientLocation];
  }
  else
  {
    long long v14 = 0u;
    memset(v15, 0, 28);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
  }
  LODWORD(v16[1]) = DWORD2(v15[0]);
  *(_OWORD *)((char *)&v16[1] + 4) = *(_OWORD *)((char *)v15 + 12);
  v6 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee", v7, v8, v9, v10, v11, v12, v13, v14, v15[0], *(void *)&v15[1], *((void *)&v15[1] + 1), v7, v8, v9, v10, v11, v12,
         v13,
         v14,
         *(void *)&v15[0],
         v16[1],
         (unint64_t)(*(_OWORD *)((char *)v15 + 12) >> 32),
         v16[3]);
  (*((void (**)(long long *__return_ptr, id))a4 + 2))(&v7, a4);
  sub_1006DB08C((uint64_t)v6);
}

- (void)setLocation_CDMA:(id)a3 forCell:(id)a4
{
  if (a3)
  {
    [a3 clientLocation];
  }
  else
  {
    long long v14 = 0u;
    memset(v15, 0, 28);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    *(_OWORD *)long long v7 = 0u;
  }
  long long v22 = v13;
  long long v23 = v14;
  v24[0] = v15[0];
  *(_OWORD *)((char *)v24 + 12) = *(_OWORD *)((char *)v15 + 12);
  long long v18 = v9;
  long long v19 = v10;
  long long v20 = v11;
  long long v21 = v12;
  long long v16 = *(_OWORD *)v7;
  long long v17 = v8;
  v6 = [(CLNetworkLocationProviderAdapter *)self adaptee];
  (*((void (**)(void **__return_ptr, id))a4 + 2))(v7, a4);
  sub_1006DB7FC((uint64_t)v6, (int *)v7);
}

- (void)setLocation_LTE:(id)a3 forCell:(id)a4
{
  if (a3)
  {
    [a3 clientLocation];
  }
  else
  {
    long long v14 = 0u;
    memset(v15, 0, 28);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
  }
  LODWORD(v16[1]) = DWORD2(v15[0]);
  *(_OWORD *)((char *)&v16[1] + 4) = *(_OWORD *)((char *)v15 + 12);
  v6 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee", v7, v8, v9, v10, v11, v12, v13, v14, v15[0], *(void *)&v15[1], *((void *)&v15[1] + 1), v7, v8, v9, v10, v11, v12,
         v13,
         v14,
         *(void *)&v15[0],
         v16[1],
         (unint64_t)(*(_OWORD *)((char *)v15 + 12) >> 32),
         v16[3]);
  (*((void (**)(long long *__return_ptr, id))a4 + 2))(&v7, a4);
  sub_1006DC0B0((uint64_t)v6);
}

- (void)setLocation_NR:(id)a3 forCell:(id)a4
{
  if (a3)
  {
    [a3 clientLocation];
  }
  else
  {
    long long v14 = 0u;
    memset(v15, 0, 28);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
  }
  LODWORD(v16[1]) = DWORD2(v15[0]);
  *(_OWORD *)((char *)&v16[1] + 4) = *(_OWORD *)((char *)v15 + 12);
  v6 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee", v7, v8, v9, v10, v11, v12, v13, v14, v15[0], *(void *)&v15[1], *((void *)&v15[1] + 1), v7, v8, v9, v10, v11, v12,
         v13,
         v14,
         *(void *)&v15[0],
         v16[1],
         (unint64_t)(*(_OWORD *)((char *)v15 + 12) >> 32),
         v16[3]);
  (*((void (**)(long long *__return_ptr, id))a4 + 2))(&v7, a4);
  sub_1006DC90C((uint64_t)v6);
}

- (void)setPrivateMode:(BOOL)a3
{
  *((unsigned char *)[(CLNetworkLocationProviderAdapter *)self adaptee] + 456) = a3;
}

- (BOOL)syncgetMetric:(void *)a3
{
  return 1;
}

- (int)syncgetQueryNearbys:(const CLDaemonLocation *)a3 forFenceKeys:(const void *)a4
{
  v6 = [(CLNetworkLocationProviderAdapter *)self adaptee];

  return sub_1006DD360((uint64_t)v6, (uint64_t)a3, (uint64_t)a4);
}

- (void)setCurrentReachability:(int)a3
{
  uint64_t v3 = *(void (**)(void))(**((void **)[(CLNetworkLocationProviderAdapter *)self adaptee] + 56) + 32);

  v3();
}

- (void)addResponseListener:(CLNetworkLocationServerResponseListener *)a3
{
  uint64_t v3 = a3;
  sub_1002F9B84((uint64_t **)[(CLNetworkLocationProviderAdapter *)self adaptee] + 73, (unint64_t *)&v3, (uint64_t *)&v3);
}

- (void)removeResponseListener:(CLNetworkLocationServerResponseListener *)a3
{
  uint64_t v3 = a3;
  sub_100700910((uint64_t)[(CLNetworkLocationProviderAdapter *)self adaptee] + 584, (unint64_t *)&v3);
}

- (int)syncgetQueryLocationsForCells:(const void *)a3 useCache:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(CLNetworkLocationProviderAdapter *)self adaptee];

  return sub_1006DD9A0((uint64_t)v6, (uint64_t *)a3, v4);
}

- (int)syncgetQueryLocationsForWifis:(const void *)a3 useCache:(BOOL)a4 piggyback:(BOOL)a5 config:(const CLNetworkLocationRequestConfig *)a6
{
  return sub_1006E9F20((uint64_t)[(CLNetworkLocationProviderAdapter *)self adaptee], &qword_10248A270, &qword_10248A2A0, &qword_10248A288, &qword_10248A2B8, &qword_10248A2D0, (uint64_t **)a3, a4, a5, (uint64_t)a6);
}

- (void)fetchQueryLocationsForWifis:(id)a3 useCache:(BOOL)a4 piggyback:(BOOL)a5 config:(id)a6 withReply:(id)a7
{
  BOOL v10 = a4;
  long long v12 = [(CLNetworkLocationProviderAdapter *)self adaptee];
  (*((void (**)(void **__return_ptr, id))a3 + 2))(__p, a3);
  int v14 = (*((uint64_t (**)(id))a6 + 2))(a6);
  uint64_t v13 = sub_1006E9F20((uint64_t)v12, &qword_10248A270, &qword_10248A2A0, &qword_10248A288, &qword_10248A2B8, &qword_10248A2D0, (uint64_t **)__p, v10, a5, (uint64_t)&v14);
  (*((void (**)(id, uint64_t))a7 + 2))(a7, v13);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

@end