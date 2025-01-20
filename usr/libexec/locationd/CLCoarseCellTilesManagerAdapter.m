@interface CLCoarseCellTilesManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLCoarseCellTilesManagerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)requestCellTileDownloadByType:(int)a3 lat:(double)a4 lon:(double)a5 seckey:(unint64_t)a6;
@end

@implementation CLCoarseCellTilesManagerAdapter

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
  if (qword_102481120 != -1) {
    dispatch_once(&qword_102481120, &stru_1022F2BF8);
  }
  return (id)qword_102481118;
}

- (CLCoarseCellTilesManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLCoarseCellTilesManagerAdapter;
  return [(CLCoarseCellTilesManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLCoarseCellTilesManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLCoarseCellTilesManagerClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_100D0CD28((uint64_t)[(CLCoarseCellTilesManagerAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v3 = sub_101A8A7AC();
    sub_100D0CD28(v3);
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
  v4 = [(CLCoarseCellTilesManagerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLCoarseCellTilesManagerAdapter *)self adaptee]);
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
      dispatch_once(&qword_1024193A0, &stru_1022F2E80);
    }
    uint64_t v3 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLCoarseCellTilesManager is not supported in diagnostics mode", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022F2E80);
      }
      unint64_t v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "+[CLCoarseCellTilesManagerAdapter isSupported]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
  return v2 ^ 1;
}

- (void)requestCellTileDownloadByType:(int)a3 lat:(double)a4 lon:(double)a5 seckey:(unint64_t)a6
{
  if ((a3 - 6) < 3 || a3 == 12)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v13 = [(CLCoarseCellTilesManagerAdapter *)self adaptee];
    unsigned int v14 = a3;
    double v16 = a4;
    double v17 = a5;
    unint64_t v15 = a6;
    double v18 = Current;
  }
  else
  {
    v13 = (void *)sub_101A8A938(self, a2, *(__n128 *)&a4, *(__n128 *)&a5);
  }
  sub_100D0D178((uint64_t)v13, v14, v15, v16, v17, v18);
}

@end