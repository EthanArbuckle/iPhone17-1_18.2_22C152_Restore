@interface CLTilesManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetAppAvailabilityForLocation:(id *)a3 radius:(float)a4 searchContext:(void *)a5 availabilityList:(void *)a6 includeRegionalApps:(BOOL)a7;
- (BOOL)syncgetDeleteTileFile:(int)a3 atPath:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetListTilesDirectory:(id)a3 type:(int)a4 time:(double)a5;
- (BOOL)syncgetRegionPreloadManifest:(void *)a3;
- (BOOL)syncgetTileStats:(void *)a3;
- (BOOL)syncgetTransitMacAddressesAmong:(void *)a3 nearLatitude:(double)a4 longitude:(double)a5 resultMacAddresses:(void *)a6;
- (CLTilesManagerAdapter)init;
- (id)syncgetTileFilePath:(int)a3 latitude:(double)a4 longitude:(double)a5 isFileAccessible:(BOOL *)a6 isTileNotExistingOnServer:(BOOL *)a7;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)enableAppTilesDownload:(BOOL)a3;
- (void)endService;
- (void)requestTileDownloadByType:(int)a3 lat:(double)a4 lon:(double)a5 seckey:(unint64_t)a6 details:(CLTileFileDownloadDetails *)a7;
- (void)requestTileDownloadByType:(int)a3 path:(id)a4 details:(CLTileFileDownloadDetails *)a5;
@end

@implementation CLTilesManagerAdapter

- (BOOL)syncgetRegionPreloadManifest:(void *)a3
{
  v4 = [(CLTilesManagerAdapter *)self adaptee];

  return sub_100031BD0((uint64_t)v4, (uint64_t *)a3);
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
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
  if (qword_102482AC0 != -1) {
    dispatch_once(&qword_102482AC0, &stru_10230CBE8);
  }
  return (id)qword_102482AB8;
}

- (CLTilesManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLTilesManagerAdapter;
  return [(CLTilesManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLTilesManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLTilesManagerClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_101050D84((uint64_t)[(CLTilesManagerAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v3 = sub_101A9D5C0();
    sub_101050D84(v3);
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  v4 = [(CLTilesManagerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLTilesManagerAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  int v2 = sub_10074339C();
  if (v2)
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_10230CFE0);
    }
    uint64_t v3 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLTilesManager is not supported in diagnostics mode", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_10230CFE0);
      }
      unint64_t v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "+[CLTilesManagerAdapter isSupported]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
  return v2 ^ 1;
}

- (void)requestTileDownloadByType:(int)a3 lat:(double)a4 lon:(double)a5 seckey:(unint64_t)a6 details:(CLTileFileDownloadDetails *)a7
{
  if ((a3 & 0xFFFFFFF7) - 1 >= 2)
  {
    v15 = (_Unwind_Exception *)sub_101A9D74C(self, a2, a4, a5);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    _Unwind_Resume(v15);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  v14 = [(CLTilesManagerAdapter *)self adaptee];
  sub_100134750(&__p, "");
  sub_1001392EC((uint64_t)v14, a3, a6, &__p, (uint64_t)a7, a4, a5, Current);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)requestTileDownloadByType:(int)a3 path:(id)a4 details:(CLTileFileDownloadDetails *)a5
{
  if ((a3 & 0xFFFFFFF7) - 1 >= 2)
  {
    v9 = (_Unwind_Exception *)sub_101A9DA58(self, a2);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    _Unwind_Resume(v9);
  }
  sub_100134750(&__p, (char *)[a4 UTF8String]);
  double Current = CFAbsoluteTimeGetCurrent();
  sub_1001392EC((uint64_t)[(CLTilesManagerAdapter *)self adaptee], a3, -1, &__p, (uint64_t)a5, 0.0, 0.0, Current);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)enableAppTilesDownload:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(CLTilesManagerAdapter *)self adaptee];

  sub_1010512AC((uint64_t)v4, v3);
}

- (BOOL)syncgetTileStats:(void *)a3
{
  return 1;
}

- (id)syncgetTileFilePath:(int)a3 latitude:(double)a4 longitude:(double)a5 isFileAccessible:(BOOL *)a6 isTileNotExistingOnServer:(BOOL *)a7
{
  int v17 = a3;
  double v16 = a4;
  double v15 = a5;
  __int16 v14 = 0;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v13 = 0;
  if (sub_101062ACC((uint64_t)[(CLTilesManagerAdapter *)self adaptee], &v17, &v16, &v15, (uint64_t)__p, (unsigned char *)&v14 + 1, &v14))
  {
    *a6 = HIBYTE(v14);
    *a7 = v14;
    if (v13 >= 0) {
      v9 = __p;
    }
    else {
      v9 = (void **)__p[0];
    }
    v10 = +[NSString stringWithUTF8String:v9];
  }
  else
  {
    v10 = 0;
  }
  if (SHIBYTE(v13) < 0) {
    operator delete(__p[0]);
  }
  return v10;
}

- (BOOL)syncgetDeleteTileFile:(int)a3 atPath:(id)a4
{
  int v5 = a3;
  return sub_10105194C((uint64_t)-[CLTilesManagerAdapter adaptee](self, "adaptee"), (unsigned int *)&v5, (const char *)[a4 UTF8String]);
}

- (BOOL)syncgetAppAvailabilityForLocation:(id *)a3 radius:(float)a4 searchContext:(void *)a5 availabilityList:(void *)a6 includeRegionalApps:(BOOL)a7
{
  BOOL v7 = a7;
  v11 = [(CLTilesManagerAdapter *)self adaptee];
  double v13 = *(double *)(&a3->var0 + 1);
  double v14 = *(double *)((char *)&a3->var1.var0 + 4);

  return sub_101051EF0((uint64_t)v11, v13, v14, a4, v12, (uint64_t *)a6, v7);
}

- (BOOL)syncgetTransitMacAddressesAmong:(void *)a3 nearLatitude:(double)a4 longitude:(double)a5 resultMacAddresses:(void *)a6
{
  v10 = [(CLTilesManagerAdapter *)self adaptee];

  return sub_1010534E0((uint64_t)v10, (id **)a3, (uint64_t)a6, a4, a5);
}

- (BOOL)syncgetListTilesDirectory:(id)a3 type:(int)a4 time:(double)a5
{
  v8 = [(CLTilesManagerAdapter *)self adaptee];
  sub_100134750(__p, (char *)[a3 UTF8String]);
  BOOL v9 = sub_1010538F0((uint64_t)v8, (uint64_t)__p, a4, a5);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  return v9;
}

@end