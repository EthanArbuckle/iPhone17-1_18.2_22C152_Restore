@interface CLWifiServiceAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetAssociatedNetwork:(void *)a3;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetHostedNetwork:(void *)a3;
- (BOOL)syncgetIsAssociated;
- (BOOL)syncgetIsAvailable;
- (BOOL)syncgetIsSimulationEnabled;
- (BOOL)syncgetIsWifiPowered;
- (BOOL)syncgetIsWifiPoweredWithStatus:(BOOL *)a3;
- (BOOL)syncgetIsWifiTrackingAvailable;
- (BOOL)syncgetSetAutoJoin:(BOOL)a3;
- (BOOL)syncgetStartScanWithParameters:(id)a3;
- (BOOL)syncgetStartScanWithType:(char)a3 lowPriority:(BOOL)a4 lowLatency:(BOOL)a5 passive:(BOOL)a6 requester:(const char *)a7 channels:(const void *)a8;
- (BOOL)syncgetStartScanWithType:(char)a3 lowPriority:(BOOL)a4 passive:(BOOL)a5 requester:(const char *)a6;
- (BOOL)syncgetSupportedChannelsAdd2GhzChannels:(BOOL)a3 andAdd5GhzChannels:(BOOL)a4 result:(void *)a5;
- (CLWifiServiceAdapter)init;
- (id)syncgetBackgroundScanCacheResult;
- (id)syncgetScanResult;
- (id)syncgetScanStats;
- (void)adaptee;
- (void)clearExitAndEntryScanNetworks:(BOOL)a3;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchIsAssociatedWithReply:(id)a3;
- (void)fetchIsWifiAvailableWithReply:(id)a3;
- (void)fetchScanResultWithReply:(id)a3;
- (void)programEntryScanNetworks:(id)a3 andExitScanNetworks:(id)a4;
- (void)setBackgroundExitScanCount:(int)a3;
- (void)setEntryScanNetworks:(id)a3 andExitScanNetworks:(id)a4;
- (void)setQuiesceWifi:(BOOL)a3;
- (void)setScannerEntryScanNetworks:(id)a3;
- (void)setScannerExitScanNetworks:(id)a3;
- (void)setWifiPower:(BOOL)a3;
@end

@implementation CLWifiServiceAdapter

- (void)fetchIsAssociatedWithReply:(id)a3
{
  uint64_t v4 = sub_10006DB54((uint64_t)[(CLWifiServiceAdapter *)self adaptee]);
  v5 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)fetchIsWifiAvailableWithReply:(id)a3
{
  char v7 = 0;
  uint64_t v4 = [(CLWifiServiceAdapter *)self adaptee];
  unsigned int v5 = (*(uint64_t (**)(void *, char *))(*(void *)v4 + 216))(v4, &v7);
  if (v7) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
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
  if (qword_10247B3B8 != -1) {
    dispatch_once(&qword_10247B3B8, &stru_1022BB7C0);
  }
  return (id)qword_10247B3B0;
}

- (CLWifiServiceAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLWifiServiceAdapter;
  return [(CLWifiServiceAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLWifiServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLWifiServiceClientProtocol];
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  uint64_t v4 = [(CLWifiServiceAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLWifiServiceAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (BOOL)syncgetIsAssociated
{
  v2 = [(CLWifiServiceAdapter *)self adaptee];

  return sub_10006DB54((uint64_t)v2);
}

- (BOOL)syncgetIsWifiTrackingAvailable
{
  return *((unsigned char *)[(CLWifiServiceAdapter *)self adaptee] + 376);
}

- (BOOL)syncgetIsWifiPowered
{
  char v4 = 0;
  v2 = [(CLWifiServiceAdapter *)self adaptee];
  BOOL result = (*(uint64_t (**)(void *, char *))(*(void *)v2 + 216))(v2, &v4);
  if (!v4) {
    return 0;
  }
  return result;
}

- (BOOL)syncgetIsWifiPoweredWithStatus:(BOOL *)a3
{
  BOOL v6 = 0;
  char v4 = [(CLWifiServiceAdapter *)self adaptee];
  *a3 = (*(uint64_t (**)(void *, BOOL *))(*(void *)v4 + 216))(v4, &v6);
  return v6;
}

- (BOOL)syncgetIsAvailable
{
  v2 = [(CLWifiServiceAdapter *)self adaptee];

  return sub_10056535C((uint64_t)v2);
}

- (BOOL)syncgetIsSimulationEnabled
{
  v2 = *(uint64_t (**)(void))(*(void *)[(CLWifiServiceAdapter *)self adaptee] + 208);

  return v2();
}

- (void)programEntryScanNetworks:(id)a3 andExitScanNetworks:(id)a4
{
  BOOL v6 = [(CLWifiServiceAdapter *)self adaptee];
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v8, a3);
  (*((void (**)(void ***__return_ptr, id))a4 + 2))(v7, a4);
  sub_1005654F4((uint64_t)v6, v8, (uint64_t *)v7);
  v9 = v7;
  sub_1000D7F78((void ***)&v9);
  v7[0] = (void **)v8;
  sub_1000D7F78(v7);
}

- (void)setEntryScanNetworks:(id)a3 andExitScanNetworks:(id)a4
{
  char v7 = [(CLWifiServiceAdapter *)self adaptee];
  (*((void (**)(uint64_t *__return_ptr, id))a4 + 2))(v9, a4);
  sub_100565794((uint64_t)v7, v9);
  v10 = (void **)v9;
  sub_1000D7F78(&v10);
  v8 = [(CLWifiServiceAdapter *)self adaptee];
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v9, a3);
  sub_100565874((uint64_t)v8, v9);
  v10 = (void **)v9;
  sub_1000D7F78(&v10);
}

- (void)setScannerEntryScanNetworks:(id)a3
{
  char v4 = [(CLWifiServiceAdapter *)self adaptee];
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v5, a3);
  sub_100565874((uint64_t)v4, v5);
  BOOL v6 = (void **)v5;
  sub_1000D7F78(&v6);
}

- (void)setScannerExitScanNetworks:(id)a3
{
  char v4 = [(CLWifiServiceAdapter *)self adaptee];
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v5, a3);
  sub_100565794((uint64_t)v4, v5);
  BOOL v6 = (void **)v5;
  sub_1000D7F78(&v6);
}

- (id)syncgetScanStats
{
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  sub_100565AEC((uint64_t)[(CLWifiServiceAdapter *)self adaptee], &v3, 1);
  long long v8 = v3;
  long long v9 = v4;
  long long v10 = v5;
  long long v11 = v6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100588264;
  v7[3] = &unk_1022BBBB8;
  return [v7 copy];
}

- (id)syncgetScanResult
{
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = [(CLWifiServiceAdapter *)self adaptee];
  (*(void (**)(void *, char *, long long *))(*(void *)v2 + 224))(v2, (char *)&v7 + 8, &v7);
  uint64_t v5 = v7;
  memset(v6, 0, sizeof(v6));
  sub_1000DA6E8(v6, *((uint64_t *)&v7 + 1), v8, 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v8 - *((void *)&v7 + 1)) >> 3));
  id v3 = sub_100565CA0(&v5);
  long long v9 = (void **)v6;
  sub_1000D7F78(&v9);
  long long v9 = (void **)&v7 + 1;
  sub_1000D7F78(&v9);
  return v3;
}

- (id)syncgetBackgroundScanCacheResult
{
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = [(CLWifiServiceAdapter *)self adaptee];
  (*(void (**)(void *, char *, long long *))(*(void *)v2 + 240))(v2, (char *)&v7 + 8, &v7);
  uint64_t v5 = v7;
  memset(v6, 0, sizeof(v6));
  sub_1000DA6E8(v6, *((uint64_t *)&v7 + 1), v8, 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v8 - *((void *)&v7 + 1)) >> 3));
  id v3 = sub_100565CA0(&v5);
  long long v9 = (void **)v6;
  sub_1000D7F78(&v9);
  long long v9 = (void **)&v7 + 1;
  sub_1000D7F78(&v9);
  return v3;
}

- (void)fetchScanResultWithReply:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v4 = [(CLWifiServiceAdapter *)self adaptee];
  (*(void (**)(void *, char *, long long *))(*(void *)v4 + 224))(v4, (char *)&v8 + 8, &v8);
  uint64_t v6 = v8;
  memset(v7, 0, sizeof(v7));
  sub_1000DA6E8(v7, *((uint64_t *)&v8 + 1), v9, 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v9 - *((void *)&v8 + 1)) >> 3));
  id v5 = sub_100565CA0(&v6);
  (*((void (**)(id, id))a3 + 2))(a3, v5);
  long long v10 = (void **)v7;
  sub_1000D7F78(&v10);
  long long v10 = (void **)&v8 + 1;
  sub_1000D7F78(&v10);
}

- (BOOL)syncgetAssociatedNetwork:(void *)a3
{
  sub_100566054((uint64_t)[(CLWifiServiceAdapter *)self adaptee], (uint64_t)&v7);
  int v4 = v13;
  if (v13)
  {
    *(void *)a3 = v7;
    std::string::operator=((std::string *)((char *)a3 + 8), &__p);
    long long v5 = v10;
    *((_OWORD *)a3 + 2) = v9;
    *((_OWORD *)a3 + 3) = v5;
    *((_OWORD *)a3 + 4) = v11;
    *((void *)a3 + 10) = v12;
    if (v13)
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
  return v4 != 0;
}

- (BOOL)syncgetHostedNetwork:(void *)a3
{
  sub_100566280([(CLWifiServiceAdapter *)self adaptee], (uint64_t)&__p);
  int v4 = v8;
  if (v8)
  {
    std::string::operator=((std::string *)a3, &__p);
    *(_OWORD *)((char *)a3 + 24) = v7;
    if (v8)
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
  return v4 != 0;
}

- (void)clearExitAndEntryScanNetworks:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [(CLWifiServiceAdapter *)self adaptee];

  sub_10056642C((uint64_t)v4, v3);
}

- (BOOL)syncgetStartScanWithType:(char)a3 lowPriority:(BOOL)a4 passive:(BOOL)a5 requester:(const char *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v9 = a3;
  long long v10 = [(CLWifiServiceAdapter *)self adaptee];
  sub_100134750(v15, (char *)a6);
  LOBYTE(__p[0]) = 0;
  char v14 = 0;
  char v11 = (*(uint64_t (**)(void *, uint64_t, BOOL, void, BOOL, void **, void **))(*(void *)v10 + 256))(v10, v9, v8, 0, v7, v15, __p);
  if (v14 && __p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  return v11;
}

- (BOOL)syncgetStartScanWithType:(char)a3 lowPriority:(BOOL)a4 lowLatency:(BOOL)a5 passive:(BOOL)a6 requester:(const char *)a7 channels:(const void *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  uint64_t v13 = a3;
  char v14 = [(CLWifiServiceAdapter *)self adaptee];
  sub_100134750(__p, (char *)a7);
  char v15 = (*(uint64_t (**)(void *, uint64_t, BOOL, BOOL, BOOL, void **, const void *))(*(void *)v14
                                                                                                  + 256))(v14, v13, v12, v11, v10, __p, a8);
  if (v18 < 0) {
    operator delete(__p[0]);
  }
  return v15;
}

- (BOOL)syncgetStartScanWithParameters:(id)a3
{
  int v4 = [(CLWifiServiceAdapter *)self adaptee];
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v7, a3);
  char v5 = sub_1005667D4((uint64_t)v4, v7);
  if (v11 < 0) {
    operator delete(__p);
  }
  if (v8)
  {
    uint64_t v9 = v8;
    operator delete(v8);
  }
  return v5;
}

- (void)setQuiesceWifi:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [(CLWifiServiceAdapter *)self adaptee];

  sub_100567628(v4, v3);
}

- (BOOL)syncgetSupportedChannelsAdd2GhzChannels:(BOOL)a3 andAdd5GhzChannels:(BOOL)a4 result:(void *)a5
{
  return 1;
}

- (void)setWifiPower:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [(CLWifiServiceAdapter *)self adaptee];

  sub_100568208((uint64_t)v4, v3);
}

- (void)setBackgroundExitScanCount:(int)a3
{
  int v4 = [(CLWifiServiceAdapter *)self adaptee];

  sub_100568634((uint64_t)v4, a3);
}

- (BOOL)syncgetSetAutoJoin:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [(CLWifiServiceAdapter *)self adaptee];

  return sub_100568910((uint64_t)v4, v3);
}

@end