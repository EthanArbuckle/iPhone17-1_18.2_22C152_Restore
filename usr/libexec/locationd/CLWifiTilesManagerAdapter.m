@interface CLWifiTilesManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLWifiTilesManagerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)getNumberOfInputApsUsedInWifiTileForCoordinate:(id)a3 withReply:(id)a4;
- (void)requestTileDownloadForLat:(double)a3 lon:(double)a4 details:(CLTileFileDownloadDetails *)a5;
@end

@implementation CLWifiTilesManagerAdapter

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
  if (qword_102486990 != -1) {
    dispatch_once(&qword_102486990, &stru_10231AB00);
  }
  return (id)qword_102486988;
}

- (CLWifiTilesManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLWifiTilesManagerAdapter;
  return [(CLWifiTilesManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLWifiTilesManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLWifiTilesManagerClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_101272628((uint64_t)[(CLWifiTilesManagerAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v3 = sub_101AAA890();
    sub_101272628(v3);
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
  v4 = [(CLWifiTilesManagerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLWifiTilesManagerAdapter *)self adaptee]);
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
      dispatch_once(&qword_1024193A0, &stru_10231ADF0);
    }
    uint64_t v3 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLWifiTilesManager is not supported in diagnostics mode", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_10231ADF0);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "+[CLWifiTilesManagerAdapter isSupported]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  if (sub_1009469FC())
  {
    LOBYTE(v4) = v2 ^ 1;
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_10231ADF0);
    }
    unint64_t v5 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLWifiTilesManager is disabled by settings", buf, 2u);
    }
    int v4 = sub_10013D1A0(115, 2);
    if (v4)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_10231ADF0);
      }
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "+[CLWifiTilesManagerAdapter isSupported]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (void)requestTileDownloadForLat:(double)a3 lon:(double)a4 details:(CLTileFileDownloadDetails *)a5
{
  double Current = CFAbsoluteTimeGetCurrent();
  v10 = [(CLWifiTilesManagerAdapter *)self adaptee];
  sub_100134750(&__p, "");
  sub_100091818((uint64_t)v10, 0, &__p, (uint64_t)a5, a3, a4, Current);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)getNumberOfInputApsUsedInWifiTileForCoordinate:(id)a3 withReply:(id)a4
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v6 = a3;
  uint64_t v5 = sub_101452B6C(*((void *)[(CLWifiTilesManagerAdapter *)self adaptee] + 60), &v6.var0);
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v5);
}

@end