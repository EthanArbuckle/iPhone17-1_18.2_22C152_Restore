@interface CLKappaNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLKappaNotifierAdapter)init;
- (int)syncgetKappaState;
- (void)adaptee;
- (void)beginService;
- (void)collect:(OverrideClient)a3 isLocal:(BOOL)a4;
- (void)companionHeartbeat:(id)a3;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)dontcollect:(OverrideClient)a3 isLocal:(BOOL)a4;
- (void)emergencyStateChange:(id)a3;
- (void)endService;
- (void)forceCompanionHeartbeat;
- (void)forceTrigger;
- (void)forceTriggerIgneous:(id)a3;
- (void)remoteTimeout;
- (void)simulateTriggerWithDelay:(int)a3;
- (void)simulateTriggerWithDelay:(int)a3 forMode:(unsigned __int8)a4;
- (void)startDem;
- (void)stopDem;
@end

@implementation CLKappaNotifierAdapter

- (void)simulateTriggerWithDelay:(int)a3
{
}

- (void)simulateTriggerWithDelay:(int)a3 forMode:(unsigned __int8)a4
{
  int v6 = 0;
  uint64_t v7 = 0;
  v4[0] = 8 * (a4 == 1);
  v4[1] = 8 * (a4 == 2);
  v4[2] = 8 * (a4 == 4);
  v4[3] = 0;
  uint64_t v5 = (1000000 * a3);
  sub_101531628((uint64_t)[(CLKappaNotifierAdapter *)self adaptee], v4);
}

- (void)collect:(OverrideClient)a3 isLocal:(BOOL)a4
{
  BOOL v4 = a4;
  OverrideClient v15 = a3;
  unint64_t v6 = *(unint64_t *)&a3 >> 8;
  unint64_t v7 = *(unint64_t *)&a3 >> 16;
  unint64_t v8 = *(unint64_t *)&a3 >> 24;
  BOOL var4 = a3.var4;
  BOOL var7 = a3.var7;
  unint64_t v11 = *(unint64_t *)&a3 >> 40;
  BOOL var6 = a3.var6;
  if (qword_102419100 != -1) {
    dispatch_once(&qword_102419100, &stru_10232C638);
  }
  v13 = qword_102419108;
  if (os_log_type_enabled((os_log_t)qword_102419108, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110912;
    int v33 = v6;
    __int16 v34 = 1024;
    int v35 = v7;
    __int16 v36 = 1024;
    int v37 = v8;
    __int16 v38 = 1024;
    BOOL v39 = var4;
    __int16 v40 = 1024;
    BOOL v41 = var7;
    __int16 v42 = 1024;
    int v43 = v11;
    __int16 v44 = 1024;
    BOOL v45 = var6;
    __int16 v46 = 1024;
    BOOL v47 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "collect %d %d %d %d %d %d %d %d", buf, 0x32u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419100 != -1) {
      dispatch_once(&qword_102419100, &stru_10232C638);
    }
    int v16 = 67110912;
    int v17 = v6;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 1024;
    int v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = var4;
    __int16 v24 = 1024;
    BOOL v25 = var7;
    __int16 v26 = 1024;
    int v27 = v11;
    __int16 v28 = 1024;
    BOOL v29 = var6;
    __int16 v30 = 1024;
    BOOL v31 = v4;
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter collect:isLocal:]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  sub_101530A2C((uint64_t)[(CLKappaNotifierAdapter *)self adaptee], (uint64_t)&v15, v4);
}

- (void)dontcollect:(OverrideClient)a3 isLocal:(BOOL)a4
{
  BOOL v4 = a4;
  OverrideClient v15 = a3;
  unint64_t v6 = *(unint64_t *)&a3 >> 8;
  unint64_t v7 = *(unint64_t *)&a3 >> 16;
  unint64_t v8 = *(unint64_t *)&a3 >> 24;
  BOOL var4 = a3.var4;
  BOOL var7 = a3.var7;
  unint64_t v11 = *(unint64_t *)&a3 >> 40;
  BOOL var6 = a3.var6;
  if (qword_102419100 != -1) {
    dispatch_once(&qword_102419100, &stru_10232C638);
  }
  v13 = qword_102419108;
  if (os_log_type_enabled((os_log_t)qword_102419108, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110912;
    int v33 = v6;
    __int16 v34 = 1024;
    int v35 = v7;
    __int16 v36 = 1024;
    int v37 = v8;
    __int16 v38 = 1024;
    BOOL v39 = var4;
    __int16 v40 = 1024;
    BOOL v41 = var7;
    __int16 v42 = 1024;
    int v43 = v11;
    __int16 v44 = 1024;
    BOOL v45 = var6;
    __int16 v46 = 1024;
    BOOL v47 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "dontcollect %d %d %d %d %d %d %d %d", buf, 0x32u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419100 != -1) {
      dispatch_once(&qword_102419100, &stru_10232C638);
    }
    int v16 = 67110912;
    int v17 = v6;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 1024;
    int v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = var4;
    __int16 v24 = 1024;
    BOOL v25 = var7;
    __int16 v26 = 1024;
    int v27 = v11;
    __int16 v28 = 1024;
    BOOL v29 = var6;
    __int16 v30 = 1024;
    BOOL v31 = v4;
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter dontcollect:isLocal:]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  sub_101530604((uint64_t)[(CLKappaNotifierAdapter *)self adaptee], (unint64_t *)&v15, v4);
}

- (void)remoteTimeout
{
  v2 = [(CLKappaNotifierAdapter *)self adaptee];

  sub_10152BA04((uint64_t)v2);
}

- (void)companionHeartbeat:(id)a3
{
  if (qword_102419100 != -1) {
    dispatch_once(&qword_102419100, &stru_10232C638);
  }
  uint64_t v5 = qword_102419108;
  if (os_log_type_enabled((os_log_t)qword_102419108, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "received heartbeat from companion", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419100 != -1) {
      dispatch_once(&qword_102419100, &stru_10232C638);
    }
    unint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter companionHeartbeat:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  sub_10152C2E0((uint64_t)[(CLKappaNotifierAdapter *)self adaptee], (uint64_t)a3);
}

- (void)forceCompanionHeartbeat
{
  v2 = [(CLKappaNotifierAdapter *)self adaptee];

  sub_10152CA20((uint64_t)v2);
}

- (void)startDem
{
  if (qword_102419100 != -1) {
    dispatch_once(&qword_102419100, &stru_10232C638);
  }
  v3 = qword_102419108;
  if (os_log_type_enabled((os_log_t)qword_102419108, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "start DEM", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419100 != -1) {
      dispatch_once(&qword_102419100, &stru_10232C638);
    }
    BOOL v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter startDem]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  sub_1015313A8((uint64_t)[(CLKappaNotifierAdapter *)self adaptee], 1);
}

- (void)stopDem
{
  if (qword_102419100 != -1) {
    dispatch_once(&qword_102419100, &stru_10232C638);
  }
  v3 = qword_102419108;
  if (os_log_type_enabled((os_log_t)qword_102419108, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stop DEM", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419100 != -1) {
      dispatch_once(&qword_102419100, &stru_10232C638);
    }
    BOOL v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter stopDem]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  sub_1015313A8((uint64_t)[(CLKappaNotifierAdapter *)self adaptee], 0);
}

- (void)forceTrigger
{
  long long v4 = 0uLL;
  uint64_t v2 = 4;
  long long v3 = 0uLL;
  sub_101531628((uint64_t)[(CLKappaNotifierAdapter *)self adaptee], (unsigned __int8 *)&v2);
}

- (int)syncgetKappaState
{
  uint64_t v2 = [(CLKappaNotifierAdapter *)self adaptee];

  return sub_10153234C((uint64_t)v2);
}

- (void)emergencyStateChange:(id)a3
{
  (*((void (**)(long long *__return_ptr, id, SEL))a3 + 2))(&v11, a3, a2);
  if (qword_102419100 != -1) {
    dispatch_once(&qword_102419100, &stru_10232C638);
  }
  long long v4 = qword_102419108;
  if (os_log_type_enabled((os_log_t)qword_102419108, OS_LOG_TYPE_DEFAULT))
  {
    sub_100D335B8(&v11, __p);
    uint64_t v5 = (__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
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
    if (qword_102419100 != -1) {
      dispatch_once(&qword_102419100, &stru_10232C638);
    }
    sub_100D335B8(&v11, &buf);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    int v14 = 136315138;
    OverrideClient v15 = p_buf;
    unint64_t v8 = (std::string *)_os_log_send_and_compose_impl();
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter emergencyStateChange:]", "%s\n", (const char *)v8);
    if (v8 != __p) {
      free(v8);
    }
  }
  unint64_t v6 = [(CLKappaNotifierAdapter *)self adaptee];
  long long v9 = v11;
  int v10 = v12;
  sub_10152AD80((uint64_t)v6, (uint64_t)&v9);
}

- (void)forceTriggerIgneous:(id)a3
{
  uint64_t v22 = 0;
  long long v21 = 0x40000uLL;
  if (a3)
  {
    strncpy((char *)&v21 + 8, (const char *)[a3 UTF8String], 0xFuLL);
    if ((unint64_t)[a3 length] < 0x10) {
      goto LABEL_17;
    }
    if (qword_102419320 != -1) {
      dispatch_once(&qword_102419320, &stru_10232C798);
    }
    uint64_t v5 = qword_102419328;
    if (os_log_type_enabled((os_log_t)qword_102419328, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 136315394;
      __int16 v18 = (char *)[a3 UTF8String];
      __int16 v19 = 2080;
      __int16 v20 = (char *)&v21 + 8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "truncated force trigger uid from %s to %s", buf, 0x16u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_17;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419320 != -1) {
      dispatch_once(&qword_102419320, &stru_10232C798);
    }
    int v13 = 136315394;
    int v14 = (char *)[a3 UTF8String];
    __int16 v15 = 2080;
    int v16 = (char *)&v21 + 8;
    unint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter forceTriggerIgneous:]", "%s\n", v6);
    if (v6 == (char *)buf) {
      goto LABEL_17;
    }
LABEL_32:
    free(v6);
    goto LABEL_17;
  }
  if (qword_102419320 != -1) {
    dispatch_once(&qword_102419320, &stru_10232C798);
  }
  unint64_t v7 = qword_102419328;
  if (os_log_type_enabled((os_log_t)qword_102419328, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received nil GUID, setting to empty", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419320 != -1) {
      dispatch_once(&qword_102419320, &stru_10232C798);
    }
    LOWORD(v13) = 0;
    unint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter forceTriggerIgneous:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      goto LABEL_32;
    }
  }
LABEL_17:
  if (qword_102419320 != -1) {
    dispatch_once(&qword_102419320, &stru_10232C798);
  }
  unint64_t v8 = qword_102419328;
  if (os_log_type_enabled((os_log_t)qword_102419328, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    __int16 v18 = (char *)&v21 + 8;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "received force trigger,uid,%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419320 != -1) {
      dispatch_once(&qword_102419320, &stru_10232C798);
    }
    int v13 = 136315138;
    int v14 = (char *)&v21 + 8;
    int v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter forceTriggerIgneous:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  [(CLKappaNotifierAdapter *)self adaptee];
  if (sub_101532AA8())
  {
    long long v9 = [(CLKappaNotifierAdapter *)self adaptee];
    long long v11 = v21;
    uint64_t v12 = v22;
    sub_101531628((uint64_t)v9, (unsigned __int8 *)&v11);
  }
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
  if (qword_1024887A0 != -1) {
    dispatch_once(&qword_1024887A0, &stru_10232C598);
  }
  return (id)qword_102488798;
}

- (CLKappaNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLKappaNotifierAdapter;
  return [(CLKappaNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLKappaNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLKappaNotifierClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_101523740((uint64_t)[(CLKappaNotifierAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    objc_super v3 = (CLKappaNotifierAdapter *)sub_101ABB6BC();
    [(CLKappaNotifierAdapter *)v3 endService];
  }
}

- (void)endService
{
  uint64_t v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

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
  SEL v4 = [(CLKappaNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLKappaNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_1024887B0 != -1) {
    dispatch_once(&qword_1024887B0, &stru_10232C618);
  }
  return byte_1024887A8;
}

@end