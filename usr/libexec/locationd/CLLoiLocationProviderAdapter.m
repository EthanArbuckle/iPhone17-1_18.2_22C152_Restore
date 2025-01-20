@interface CLLoiLocationProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLLoiLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLLoiLocationProviderAdapter

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
  if (qword_1024823E8 != -1) {
    dispatch_once(&qword_1024823E8, &stru_1023059F8);
  }
  return (id)qword_1024823E0;
}

- (CLLoiLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLLoiLocationProviderAdapter;
  return [(CLLoiLocationProviderAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLLoiLocationProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLLoiLocationProviderClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A96B24();
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
  v4 = [(CLLoiLocationProviderAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLLoiLocationProviderAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (_os_feature_enabled_impl()) {
    BOOL v2 = &RTVisitConfidenceHigh == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2) {
    byte_1024823F0 = 1;
  }
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_102305C00);
  }
  objc_super v3 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    int v7 = byte_1024823F0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "@ClxLoi, supported, %{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_102305C00);
    }
    unint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "+[CLLoiLocationProviderAdapter(IsSupported) isSupported]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  return byte_1024823F0;
}

@end