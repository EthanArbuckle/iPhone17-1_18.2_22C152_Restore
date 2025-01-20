@interface CLCellTilesManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLCellTilesManagerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)requestCellTileDownloadByType:(int)a3 lat:(double)a4 lon:(double)a5 seckey:(unint64_t)a6;
@end

@implementation CLCellTilesManagerAdapter

- (void)requestCellTileDownloadByType:(int)a3 lat:(double)a4 lon:(double)a5 seckey:(unint64_t)a6
{
  if ((a3 - 3) >= 3)
  {
    v13 = (CLCellTilesManagerAdapter *)sub_101AA8C08(self, a2, a4, a5);
    [(CLCellTilesManagerAdapter *)v13 adaptee];
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    v12 = [(CLCellTilesManagerAdapter *)self adaptee];
    sub_100145C50((uint64_t)v12, a3, a6, a4, a5, Current);
  }
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
  if (qword_1024867D0 != -1) {
    dispatch_once(&qword_1024867D0, &stru_102319568);
  }
  return (id)qword_1024867C8;
}

- (CLCellTilesManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLCellTilesManagerAdapter;
  return [(CLCellTilesManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLCellTilesManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLCellTilesManagerClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_10122FD90((uint64_t)[(CLCellTilesManagerAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v3 = sub_101AA8A7C();
    sub_10122FD90(v3);
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  v4 = [(CLCellTilesManagerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLCellTilesManagerAdapter *)self adaptee]);
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
      dispatch_once(&qword_1024193A0, &stru_1023197C0);
    }
    uint64_t v3 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLCellTilesManager is not supported in diagnostics mode", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1023197C0);
      }
      unint64_t v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "+[CLCellTilesManagerAdapter isSupported]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
  return v2 ^ 1;
}

@end