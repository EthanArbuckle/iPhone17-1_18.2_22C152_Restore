@interface CLUnifiedCellLocationProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLUnifiedCellLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLUnifiedCellLocationProviderAdapter

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
  if (qword_102481888 != -1) {
    dispatch_once(&qword_102481888, &stru_1022F9920);
  }
  return (id)qword_102481880;
}

- (CLUnifiedCellLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLUnifiedCellLocationProviderAdapter;
  return [(CLUnifiedCellLocationProviderAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLUnifiedCellLocationProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLUnifiedCellLocationProviderClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A8FA18();
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
  v4 = [(CLUnifiedCellLocationProviderAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLUnifiedCellLocationProviderAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_102481898 != -1) {
    dispatch_once(&qword_102481898, &stru_1022F9940);
  }
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022F9C68);
  }
  v2 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    int v6 = byte_102481890;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "@ClxCell, supported, %{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022F9C68);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "+[CLUnifiedCellLocationProviderAdapter(IsSupported) isSupported]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  return byte_102481890;
}

@end