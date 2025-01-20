@interface CLWifiLocationProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLWifiLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)emergencyStateChange:(id)a3;
- (void)endService;
- (void)requestLocationUpdateWithParameters:(id)a3;
@end

@implementation CLWifiLocationProviderAdapter

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
  if (qword_10247C928 != -1) {
    dispatch_once(&qword_10247C928, &stru_1022C1DD0);
  }
  return (id)qword_10247C920;
}

- (CLWifiLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLWifiLocationProviderAdapter;
  return [(CLWifiLocationProviderAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLWifiLocationProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLWifiLocationProviderClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A69A70();
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
  v4 = [(CLWifiLocationProviderAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLWifiLocationProviderAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)emergencyStateChange:(id)a3
{
  (*((void (**)(long long *__return_ptr, id, SEL))a3 + 2))(&v11, a3, a2);
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022C1FD0);
  }
  v4 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_DEFAULT))
  {
    sub_100D335B8(&v11, __p);
    unint64_t v5 = (__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
       ? __p
       : (std::string *)__p[0].__r_.__value_.__r.__words[0];
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "notifier adapter received emergency state %s", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022C1FD0);
    }
    sub_100D335B8(&v11, &buf);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    int v14 = 136315138;
    v15 = p_buf;
    v8 = (std::string *)_os_log_send_and_compose_impl();
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiLocationProviderAdapter emergencyStateChange:]", "%s\n", (const char *)v8);
    if (v8 != __p) {
      free(v8);
    }
  }
  v6 = [(CLWifiLocationProviderAdapter *)self adaptee];
  long long v9 = v11;
  int v10 = v12;
  sub_100683FAC((uint64_t)v6, (uint64_t)&v9);
}

- (void)requestLocationUpdateWithParameters:(id)a3
{
  v4 = [(CLWifiLocationProviderAdapter *)self adaptee];
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v5, a3);
  sub_100684214((uint64_t)v4, v5);
  if (v8 < 0) {
    operator delete(__p);
  }
  if (v6 < 0) {
    operator delete((void *)v5[2]);
  }
}

+ (BOOL)isSupported
{
  if (qword_10247C938 != -1) {
    dispatch_once(&qword_10247C938, &stru_1022C1DF0);
  }
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022C1FF0);
  }
  v2 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 67240192;
    int v6 = byte_10247C930;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "@ClxWifi, supported, %{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022C1FF0);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "+[CLWifiLocationProviderAdapter isSupported]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  return byte_10247C930;
}

@end