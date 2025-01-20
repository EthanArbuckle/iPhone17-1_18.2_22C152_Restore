@interface CLLocationControllerAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetActiveTechs:(void *)a3;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetMetric:(void *)a3;
- (BOOL)syncgetZaxisStats:(void *)a3;
- (CLLocationControllerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)emergencyStateChange:(id)a3;
- (void)endService;
- (void)onOutdoorUpdate:(id)a3;
- (void)setGpsAssistantHasClients:(BOOL)a3 forNotification:(int)a4;
- (void)setRealTimeHarvestTriggered:(double)a3;
- (void)setTrackRunHint:(id)a3;
@end

@implementation CLLocationControllerAdapter

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

- (BOOL)syncgetActiveTechs:(void *)a3
{
  return 1;
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

- (void)onOutdoorUpdate:(id)a3
{
  v4 = [(CLLocationControllerAdapter *)self adaptee];
  (*((void (**)(void *__return_ptr, id))a3 + 2))(v5, a3);
  sub_1001A5208((uint64_t)v4, (uint64_t)v5);
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
  if (qword_10247C8F0 != -1) {
    dispatch_once(&qword_10247C8F0, &stru_1022C1488);
  }
  return (id)qword_10247C8E8;
}

- (CLLocationControllerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocationControllerAdapter;
  return [(CLLocationControllerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLLocationControllerProtocol outboundProtocol:&OBJC_PROTOCOL___CLLocationControllerClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A6986C();
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  v4 = [(CLLocationControllerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLLocationControllerAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (BOOL)syncgetMetric:(void *)a3
{
  v4 = [(CLLocationControllerAdapter *)self adaptee];
  (*(void (**)(void *, void *))(*v4[36] + 208))(v4[36], a3);
  return 1;
}

- (BOOL)syncgetZaxisStats:(void *)a3
{
  return 1;
}

- (void)setTrackRunHint:(id)a3
{
  v4 = [a3 bytes];
  if (qword_102418FB0 != -1) {
    dispatch_once(&qword_102418FB0, &stru_1022C1780);
  }
  unint64_t v5 = qword_102418FB8;
  if (os_log_type_enabled((os_log_t)qword_102418FB8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)v4;
    int v7 = v4[2];
    int v8 = v4[3];
    *(_DWORD *)buf = 134349569;
    uint64_t v12 = v6;
    __int16 v13 = 1025;
    int v14 = v7;
    __int16 v15 = 1025;
    int v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLTR,Daemon,syncsetTrackRunHint,received,mctime,%{public}.1lf,lane,%{private}d,notification,%{private}d", buf, 0x18u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FB0 != -1) {
      dispatch_once(&qword_102418FB0, &stru_1022C1780);
    }
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationControllerAdapter setTrackRunHint:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  v9 = [(CLLocationControllerAdapter *)self adaptee];
  (*(void (**)(void *, _DWORD *))(*v9[36] + 424))(v9[36], v4);
}

- (void)setGpsAssistantHasClients:(BOOL)a3 forNotification:(int)a4
{
  BOOL v4 = a3;
  int v6 = a4;
  unint64_t v5 = [(CLLocationControllerAdapter *)self adaptee];
  (*(void (**)(void *, int *, BOOL))(*v5[36] + 304))(v5[36], &v6, v4);
}

- (void)emergencyStateChange:(id)a3
{
  (*((void (**)(long long *__return_ptr, id, SEL))a3 + 2))(&v11, a3, a2);
  if (qword_102419380 != -1) {
    dispatch_once(&qword_102419380, &stru_1022C17A0);
  }
  BOOL v4 = qword_102419388;
  if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEFAULT))
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
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C17A0);
    }
    sub_100D335B8(&v11, &buf);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    int v14 = 136315138;
    __int16 v15 = p_buf;
    int v8 = (std::string *)_os_log_send_and_compose_impl();
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationControllerAdapter emergencyStateChange:]", "%s\n", (const char *)v8);
    if (v8 != __p) {
      free(v8);
    }
  }
  int v6 = [(CLLocationControllerAdapter *)self adaptee];
  long long v9 = v11;
  int v10 = v12;
  sub_10066CDBC((uint64_t)v6, (uint64_t)&v9);
}

- (void)setRealTimeHarvestTriggered:(double)a3
{
  BOOL v4 = [(CLLocationControllerAdapter *)self adaptee];
  (*(void (**)(void *, double))(*v4[36] + 256))(v4[36], a3);
  if (qword_102419380 != -1) {
    dispatch_once(&qword_102419380, &stru_1022C17A0);
  }
  unint64_t v5 = qword_102419388;
  if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 134349056;
    double v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BaroAlt,Realtime harvest,received,%{public}.3f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C17A0);
    }
    int v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationControllerAdapter setRealTimeHarvestTriggered:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

@end