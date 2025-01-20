@interface CLCompanionNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLCompanionNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)setSilo:(id)a3;
@end

@implementation CLCompanionNotifierAdapter

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
  if (qword_10247C738 != -1) {
    dispatch_once(&qword_10247C738, &stru_1022BDD18);
  }
  return (id)qword_10247C730;
}

- (CLCompanionNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLCompanionNotifierAdapter;
  return [(CLCompanionNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLCompanionNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLCompanionNotifierClientProtocol];
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
  v4 = [(CLCompanionNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLCompanionNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)beginService
{
  objc_super v3 = self;
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_1005E0B88((uint64_t)[(CLCompanionNotifierAdapter *)self universe])];
  if (![v3 notifier])
  {
    sub_101A66FBC();
LABEL_11:
    dispatch_once(&qword_102418FD0, &stru_1022BDF68);
    goto LABEL_6;
  }
  id v4 = [v3 notifier];
  if (v4) {
  else
  }
    objc_super v3 = 0;
  p_cache = CLAvengerScannerClientController.cache;
  if (qword_102418FD0 != -1) {
    goto LABEL_11;
  }
LABEL_6:
  unint64_t v5 = qword_102418FD8;
  if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = qword_10247C748;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "companion idsService (beginService) %p", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (p_cache[506] != (void *)-1) {
      dispatch_once(&qword_102418FD0, &stru_1022BDF68);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionNotifierAdapter(isSupported) beginService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  sub_1005E1980((uint64_t)v3, qword_10247C748);
}

- (void)endService
{
  v2 = [(CLNotifierServiceAdapter *)self notifier];
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);

  qword_10247C748 = 0;
}

- (void)setSilo:(id)a3
{
  if (qword_102418FD0 != -1) {
    dispatch_once(&qword_102418FD0, &stru_1022BDF68);
  }
  unint64_t v5 = qword_102418FD8;
  if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLCompanionNotifier suspending silo until IDS becomes available (CLCompanionTransport)\"}", buf, 0x12u);
  }
  [a3 suspend];
  v8.receiver = self;
  v8.super_class = (Class)CLCompanionNotifierAdapter;
  [(CLCompanionNotifierAdapter *)&v8 setSilo:a3];
  if (qword_102418FD0 != -1) {
    dispatch_once(&qword_102418FD0, &stru_1022BDF68);
  }
  v6 = qword_102418FD8;
  if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLCompanionNotifier waiting on IDS to become available (CLCompanionTransport)\"}", buf, 0x12u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1005E316C;
  v7[3] = &unk_1022BDEB0;
  v7[4] = a3;
  +[IDSService serviceWithIdentifier:@"com.apple.private.alloy.location.motion" completion:v7];
}

@end