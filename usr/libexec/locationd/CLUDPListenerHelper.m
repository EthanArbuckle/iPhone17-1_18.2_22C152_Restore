@interface CLUDPListenerHelper
- (BOOL)conformanceMode;
- (BOOL)startService:(__CFDictionary *)a3 interface:(__CFString *)a4;
- (CLUDPListenerHelper)initWith:(int)a3 conformanceMode:(BOOL)a4;
- (NSMutableSet)allSessions;
- (NWPathEvaluator)evaluator;
- (NWUDPListener)listener;
- (__CFDictionary)optionsDictCreate:(__CFDictionary *)a3 mtu:(int)a4 perform_nud:(BOOL)a5 ipv6_ll:(__CFString *)a6 enable_dad:(BOOL)a7;
- (__IPConfigurationService)service;
- (id)readHandler;
- (id)statusHandler;
- (int)port;
- (void)callStatusHandler:(int)a3;
- (void)dealloc;
- (void)dictAddIntAsArray:(__CFDictionary *)a3 ofProp:(__CFString *)a4 withInt:(int)a5;
- (void)dictAddStringAsArray:(__CFDictionary *)a3 ofProp:(__CFString *)a4 withStr:(const char *)a5;
- (void)handleSession:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAllSessions:(id)a3;
- (void)setConformanceMode:(BOOL)a3;
- (void)setEvaluator:(id)a3;
- (void)setListener:(id)a3;
- (void)setPort:(int)a3;
- (void)setReadHandler:(id)a3;
- (void)setService:(__IPConfigurationService *)a3;
- (void)setStatusHandler:(id)a3;
- (void)start:()basic_string<char;
- (void)startUDPListner;
- (void)stop;
- (void)stopListener;
- (void)stopService;
@end

@implementation CLUDPListenerHelper

- (CLUDPListenerHelper)initWith:(int)a3 conformanceMode:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)CLUDPListenerHelper;
  v6 = [(CLUDPListenerHelper *)&v10 init];
  if (v6)
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    v7 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v16 = v5;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,startListener,port,%d,isConformanceMode,%d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022EF748);
      }
      int v11 = 67109376;
      int v12 = v5;
      __int16 v13 = 1024;
      BOOL v14 = v4;
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLUDPListenerHelper initWith:conformanceMode:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    [(CLUDPListenerHelper *)v6 setPort:v5];
    [(CLUDPListenerHelper *)v6 setAllSessions:+[NSMutableSet set]];
    [(CLUDPListenerHelper *)v6 setConformanceMode:v4];
  }
  return v6;
}

- (void)stopListener
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022EF748);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,stopListener", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    __int16 v15 = 0;
    objc_super v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLUDPListenerHelper stopListener]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  if ([(CLUDPListenerHelper *)self listener])
  {
    [(NWUDPListener *)self->_listener removeObserver:self forKeyPath:@"error"];
    [(NWUDPListener *)self->_listener removeObserver:self forKeyPath:@"localEndpoint"];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v4 = [(CLUDPListenerHelper *)self allSessions];
    id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          [v9 removeObserver:self forKeyPath:@"state"];
          [v9 cancel];
        }
        id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v6);
    }
    [(NSMutableSet *)[(CLUDPListenerHelper *)self allSessions] removeAllObjects];

    [(CLUDPListenerHelper *)self setListener:0];
  }
}

- (void)dealloc
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022EF748);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,server dealloc", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    __int16 v6 = 0;
    BOOL v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLUDPListenerHelper dealloc]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLUDPListenerHelper *)self stop];
  v5.receiver = self;
  v5.super_class = (Class)CLUDPListenerHelper;
  [(CLUDPListenerHelper *)&v5 dealloc];
}

- (void)callStatusHandler:(int)a3
{
  if ([(CLUDPListenerHelper *)self statusHandler])
  {
    id v5 = [objc_alloc((Class)NSError) initWithDomain:@"CLUDPListenerHelper" code:a3 userInfo:0];
    __int16 v6 = [(CLUDPListenerHelper *)self statusHandler];
    v6[2](v6, v5);
    CFRelease(v5);
  }
}

- (void)start:()basic_string<char
{
  id v6 = objc_alloc_init((Class)NWParameters);
  if (v6)
  {
    v3 = v6;
    if (qword_1024193E0 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_101A87604(qword_1024193E0 == -1);
  }
  dispatch_once(&qword_1024193E0, &stru_1022EF748);
LABEL_3:
  uint64_t v7 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,start", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    LODWORD(v12) = 2;
    objc_super v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLUDPListenerHelper start:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  if (*((char *)&data->__r_.__value_.var0.var1 + 23) < 0) {
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
  }
  v8 = +[NSString stringWithFormat:@"%s", data, v12];
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022EF748);
  }
  v9 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,UDPListener UUID %@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    long long v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLUDPListenerHelper start:]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  [v3 requireNetworkAgentWithDomain:@"Cellular" type:@"Em"];
  [v3 setAccount:v8];
  self->_evaluator = (NWPathEvaluator *)[objc_alloc((Class)NWPathEvaluator) initWithEndpoint:0 parameters:v3];
  if (![(CLUDPListenerHelper *)self evaluator]) {
    sub_101A8778C();
  }
  [(NWPathEvaluator *)self->_evaluator addObserver:self forKeyPath:@"path" options:5 context:0];
  CFRelease(v3);
}

- (void)stop
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022EF748);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,stop", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    BOOL v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLUDPListenerHelper stop]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  if ([(CLUDPListenerHelper *)self evaluator])
  {
    [(NWPathEvaluator *)[(CLUDPListenerHelper *)self evaluator] removeObserver:self forKeyPath:@"path"];

    [(CLUDPListenerHelper *)self setEvaluator:0];
  }
  [(CLUDPListenerHelper *)self stopListener];
}

- (void)handleSession:(id)a3
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022EF748);
  }
  id v5 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,handleSession", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    id v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLUDPListenerHelper handleSession:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  [a3 addObserver:self forKeyPath:@"state" options:5 context:0];
  [(NSMutableSet *)[(CLUDPListenerHelper *)self allSessions] addObject:a3];
}

- (void)dictAddStringAsArray:(__CFDictionary *)a3 ofProp:(__CFString *)a4 withStr:(const char *)a5
{
  if (a5)
  {
    values = (void *)CFStringCreateWithCString(0, a5, 0x600u);
    if (values)
    {
      CFArrayRef v7 = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
      if (v7)
      {
        CFArrayRef v8 = v7;
        CFRelease(values);
        CFDictionarySetValue(a3, a4, v8);
        CFRelease(v8);
        return;
      }
    }
    else
    {
      CFArrayRef v7 = (CFArrayRef)sub_101A878F4();
    }
    v9 = (CLUDPListenerHelper *)sub_101A87A5C(v7);
    [(CLUDPListenerHelper *)v9 dictAddIntAsArray:v11 ofProp:v12 withInt:v13];
  }
}

- (void)dictAddIntAsArray:(__CFDictionary *)a3 ofProp:(__CFString *)a4 withInt:(int)a5
{
  int valuePtr = a5;
  CFTypeRef cf = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (cf)
  {
    CFArrayRef v7 = CFArrayCreate(0, &cf, 1, &kCFTypeArrayCallBacks);
    if (v7)
    {
      CFArrayRef v8 = v7;
      CFRelease(cf);
      CFDictionarySetValue(a3, a4, v8);
      CFRelease(v8);
      return;
    }
  }
  else
  {
    CFArrayRef v7 = (CFArrayRef)sub_101A87BC4(0);
  }
  v9 = (CLUDPListenerHelper *)sub_101A87D2C(v7);
  [(CLUDPListenerHelper *)v9 stopService];
}

- (void)stopService
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022EF748);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,stopService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    id v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLUDPListenerHelper stopService]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  if ([(CLUDPListenerHelper *)self service])
  {
    CFRelease([(CLUDPListenerHelper *)self service]);
    [(CLUDPListenerHelper *)self setService:0];
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    BOOL v4 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,Service stopped\"}", buf, 0x12u);
    }
  }
}

- (BOOL)startService:(__CFDictionary *)a3 interface:(__CFString *)a4
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022EF748);
  }
  id v5 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,startService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    SEL v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLUDPListenerHelper startService:interface:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  [(CLUDPListenerHelper *)self setService:IPConfigurationServiceCreate()];
  id v6 = [(CLUDPListenerHelper *)self service];
  if (v6)
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    int v7 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      long long v14 = "";
      __int16 v8 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,startService,success\"}";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0x12u);
    }
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    int v7 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      long long v14 = "";
      __int16 v8 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,startService,fail\"}";
      goto LABEL_15;
    }
  }
  return v6 != 0;
}

- (__CFDictionary)optionsDictCreate:(__CFDictionary *)a3 mtu:(int)a4 perform_nud:(BOOL)a5 ipv6_ll:(__CFString *)a6 enable_dad:(BOOL)a7
{
  int valuePtr = a4;
  uint64_t v22 = 0;
  *(_OWORD *)keys = 0u;
  long long v21 = 0u;
  uint64_t v19 = 0;
  *(_OWORD *)values = 0u;
  long long v18 = 0u;
  if (a4)
  {
    CFNumberRef v11 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    keys[0] = (void *)kIPConfigurationServiceOptionMTU;
    values[0] = v11;
    unsigned int v12 = 1;
  }
  else
  {
    unsigned int v12 = 0;
    CFNumberRef v11 = 0;
  }
  if (a5)
  {
    if (a7) {
      goto LABEL_6;
    }
  }
  else
  {
    *(void *)((unint64_t)keys | (8 * v12)) = kIPConfigurationServiceOptionPerformNUD;
    *(void *)((unint64_t)values & 0xFFFFFFFFFFFFFFF7 | (8 * (v12++ & 1))) = kCFBooleanFalse;
    if (a7)
    {
LABEL_6:
      if (!a3) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  keys[v12] = (void *)kIPConfigurationServiceOptionEnableDAD;
  values[v12++] = kCFBooleanFalse;
  if (a3)
  {
LABEL_7:
    keys[v12] = (void *)kIPConfigurationServiceOptionIPv6Entity;
    values[v12++] = a3;
  }
LABEL_8:
  if (a6)
  {
    keys[v12] = (void *)kIPConfigurationServiceOptionIPv6LinkLocalAddress;
    values[v12++] = a6;
  }
  CFDictionaryRef v13 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v12, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v13) {
    sub_101A87E94();
  }
  long long v14 = v13;
  if (v11) {
    CFRelease(v11);
  }
  return v14;
}

- (void)startUDPListner
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022EF748);
  }
  BOOL v4 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v11 = 0;
    __int16 v12 = 2082;
    CFDictionaryRef v13 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"startUDPListner\"}", buf, 0x12u);
  }
  id v5 = objc_alloc_init((Class)NWParameters);
  if (v5)
  {
    BOOL v4 = v5;
    [v5 setLocalAddress:+[NWAddressEndpoint endpointWithHostname:port:](NWAddressEndpoint, "endpointWithHostname:port:", @"::", +[NSString stringWithFormat:@"%d", self->_port])];
    id v2 = [0 path];
    if (qword_1024193E0 == -1) {
      goto LABEL_7;
    }
  }
  else
  {
    sub_101A87FFC();
  }
  dispatch_once(&qword_1024193E0, &stru_1022EF748);
LABEL_7:
  id v6 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [v2 status];
    *(_DWORD *)buf = 68289282;
    int v11 = 0;
    __int16 v12 = 2082;
    CFDictionaryRef v13 = "";
    __int16 v14 = 1026;
    unsigned int v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#supl\", \"path.status\":%{public}d}", buf, 0x18u);
  }
  -[CLUDPListenerHelper setListener:](self, "setListener:", [objc_alloc((Class)NWUDPListener) initWithParameters:v4 delegate:self]);
  if (![(CLUDPListenerHelper *)self listener])
  {
    sub_101A88164();
LABEL_25:
    dispatch_once(&qword_1024193E0, &stru_1022EF748);
LABEL_12:
    __int16 v8 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      CFDictionaryRef v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,listener already in progress\"}", buf, 0x12u);
    }
    return;
  }
  if ([(CLUDPListenerHelper *)self listener])
  {
    if (qword_1024193E0 == -1) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
  if ([(CLUDPListenerHelper *)self service])
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    v9 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      CFDictionaryRef v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,service already up\"}", buf, 0x12u);
    }
    [(CLUDPListenerHelper *)self stopService];
  }
  [(NWUDPListener *)[(CLUDPListenerHelper *)self listener] addObserver:self forKeyPath:@"error" options:5 context:0];
  [(NWUDPListener *)[(CLUDPListenerHelper *)self listener] addObserver:self forKeyPath:@"localEndpoint" options:5 context:0];
  [(CLUDPListenerHelper *)self callStatusHandler:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [a4 path];
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022EF748);
    }
    SEL v10 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)v43 = 2082;
      *(void *)&v43[2] = "";
      __int16 v44 = 1026;
      LODWORD(v45) = [v9 status];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#supl\", \"path.status\":%{public}d}", buf, 0x18u);
    }
    if ([v9 status] == (id)1 && -[CLUDPListenerHelper conformanceMode](self, "conformanceMode"))
    {
      sub_100134750(&__p, "fd00::1");
      sub_1000C7F88(buf);
      sub_1004D1284(*(uint64_t *)buf, "SuplUdpPushDeviceIP", &__p);
      if (*(void *)v43) {
        sub_1000DB0A0(*(std::__shared_weak_count **)v43);
      }
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      a4 = Mutable;
      if (Mutable)
      {
        CFDictionarySetValue(Mutable, kSCPropNetIPv6ConfigMethod, kSCValNetIPv6ConfigMethodManual);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        [(CLUDPListenerHelper *)self dictAddStringAsArray:a4 ofProp:kSCPropNetIPv6Addresses withStr:p_p];
        [(CLUDPListenerHelper *)self dictAddIntAsArray:a4 ofProp:kSCPropNetIPv6PrefixLength withInt:64];
        CFDictionaryRef v13 = [(CLUDPListenerHelper *)self optionsDictCreate:a4 mtu:0 perform_nud:1 ipv6_ll:0 enable_dad:1];
        CFRelease(a4);
        a4 = (id)[self startService:v13 interface:[objc_msgSend(objc_msgSend(v9, "interface"), "interfaceName")]];
        CFRelease(v13);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022EF748);
        }
        __int16 v14 = qword_1024193E8;
        if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v15 = &__p;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            unsigned int v15 = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)buf = 68289538;
          *(_DWORD *)&uint8_t buf[4] = 0;
          *(_WORD *)v43 = 2082;
          *(void *)&v43[2] = "";
          __int16 v44 = 2082;
          v45 = v15;
          __int16 v46 = 1026;
          int v47 = (int)a4;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,In Conformance Mode. Attempting to start additional service.\", \"IP\":%{public, location:escape_only}s, \"Started\":%{public}hhd}", buf, 0x22u);
        }
        if (objc_alloc_init((Class)NWParameters))
        {
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          return;
        }
        sub_101A8842C();
        abort_report_np();
      }
      else
      {
        sub_101A882CC();
        abort_report_np();
      }
      __break(1u);
      goto LABEL_75;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a3 isEqualToString:@"error"])
    {
      if ([a4 error])
      {
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022EF748);
        }
        int v16 = qword_1024193E8;
        if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
        {
          __int16 v17 = (std::string *)[objc_msgSend(objc_msgSend(objc_msgSend(a4, "error"), "description"), "UTF8String");
          *(_DWORD *)buf = 68289282;
          *(_DWORD *)&uint8_t buf[4] = 0;
          *(_WORD *)v43 = 2082;
          *(void *)&v43[2] = "";
          __int16 v44 = 2082;
          v45 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#supl\", \"listenerError\":%{public, location:escape_only}s}", buf, 0x1Cu);
          if (qword_1024193E0 != -1) {
            dispatch_once(&qword_1024193E0, &stru_1022EF748);
          }
        }
        uint64_t v18 = qword_1024193E8;
        if (os_signpost_enabled((os_log_t)qword_1024193E8))
        {
          uint64_t v19 = (std::string *)[objc_msgSend(objc_msgSend(objc_msgSend(a4, "error"), "description"), "UTF8String");
          *(_DWORD *)buf = 68289282;
          *(_DWORD *)&uint8_t buf[4] = 0;
          *(_WORD *)v43 = 2082;
          *(void *)&v43[2] = "";
          __int16 v44 = 2082;
          v45 = v19;
          v20 = "#supl";
          long long v21 = "{\"msg%{public}.0s\":\"#supl\", \"listenerError\":%{public, location:escape_only}s}";
          uint64_t v22 = v18;
LABEL_60:
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v20, v21, buf, 0x1Cu);
        }
      }
    }
    else
    {
      if ([a3 isEqualToString:@"localEndpoint"])
      {
        if (qword_1024193E0 == -1)
        {
LABEL_47:
          uint64_t v26 = qword_1024193E8;
          if (!os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG)) {
            return;
          }
          v27 = (std::string *)[a4 localEndpoint].port.UTF8String;
          *(_DWORD *)buf = 68289282;
          *(_DWORD *)&uint8_t buf[4] = 0;
          *(_WORD *)v43 = 2082;
          *(void *)&v43[2] = "";
          __int16 v44 = 2082;
          v45 = v27;
          v28 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,Listening\", \"NWAddressEndpoint\":%{public, location:escape_only}s}";
          v29 = v26;
          goto LABEL_65;
        }
LABEL_75:
        dispatch_once(&qword_1024193E0, &stru_1022EF748);
        goto LABEL_47;
      }
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022EF748);
      }
      v32 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
      {
        v33 = (std::string *)[a3 UTF8String];
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)v43 = 2082;
        *(void *)&v43[2] = "";
        __int16 v44 = 2082;
        v45 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,unhandled listener\", \"keyPath\":%{public, location:escape_only}s}", buf, 0x1Cu);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022EF748);
        }
      }
      uint64_t v34 = qword_1024193E8;
      if (os_signpost_enabled((os_log_t)qword_1024193E8))
      {
        v35 = (std::string *)[a3 UTF8String];
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)v43 = 2082;
        *(void *)&v43[2] = "";
        __int16 v44 = 2082;
        v45 = v35;
        v20 = "#nilr,#supl,#udp,unhandled listener";
        long long v21 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,unhandled listener\", \"keyPath\":%{public, location:escape_only}s}";
        uint64_t v22 = v34;
        goto LABEL_60;
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([a3 isEqualToString:@"state"])
      {
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022EF748);
        }
        v23 = qword_1024193E8;
        if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v24 = [a4 state];
          *(_DWORD *)buf = 68289282;
          *(_DWORD *)&uint8_t buf[4] = 0;
          *(_WORD *)v43 = 2082;
          *(void *)&v43[2] = "";
          __int16 v44 = 1026;
          LODWORD(v45) = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,processing session state\", \"state\":%{public}d}", buf, 0x18u);
        }
        if ([a4 state] == (id)3)
        {
          if (qword_1024193E0 != -1) {
            dispatch_once(&qword_1024193E0, &stru_1022EF748);
          }
          v25 = qword_1024193E8;
          if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 68289026;
            *(_DWORD *)&uint8_t buf[4] = 0;
            *(_WORD *)v43 = 2082;
            *(void *)&v43[2] = "";
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,processing state NWUDPSessionStateReady\"}", buf, 0x12u);
          }
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100C5F618;
          v40[3] = &unk_10229FF00;
          v40[4] = self;
          [a4 setReadHandler:v40 maxDatagrams:10];
        }
        else
        {
          if (qword_1024193E0 != -1) {
            dispatch_once(&qword_1024193E0, &stru_1022EF748);
          }
          uint64_t v38 = qword_1024193E8;
          if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v39 = [a4 state];
            *(_DWORD *)buf = 68289282;
            *(_DWORD *)&uint8_t buf[4] = 0;
            *(_WORD *)v43 = 2082;
            *(void *)&v43[2] = "";
            __int16 v44 = 1026;
            LODWORD(v45) = v39;
            v28 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,unhandled state\", \"state\":%{public}d}";
            v29 = v38;
            uint32_t v31 = 24;
            goto LABEL_66;
          }
        }
      }
      else
      {
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022EF748);
        }
        uint64_t v36 = qword_1024193E8;
        if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
        {
          v37 = (std::string *)[a3 UTF8String];
          *(_DWORD *)buf = 68289282;
          *(_DWORD *)&uint8_t buf[4] = 0;
          *(_WORD *)v43 = 2082;
          *(void *)&v43[2] = "";
          __int16 v44 = 2082;
          v45 = v37;
          v28 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,don't handle keypath\", \"keyPath\":%{public, location:escape_only}s}";
          v29 = v36;
LABEL_65:
          uint32_t v31 = 28;
          goto LABEL_66;
        }
      }
    }
    else
    {
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022EF748);
      }
      uint64_t v30 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)v43 = 2082;
        *(void *)&v43[2] = "";
        v28 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,skipping non session object\"}";
        v29 = v30;
        uint32_t v31 = 18;
LABEL_66:
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, v28, buf, v31);
      }
    }
  }
}

- (NWUDPListener)listener
{
  return (NWUDPListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
}

- (NSMutableSet)allSessions
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAllSessions:(id)a3
{
}

- (id)readHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setReadHandler:(id)a3
{
}

- (int)port
{
  return self->_port;
}

- (void)setPort:(int)a3
{
  self->_port = a3;
}

- (BOOL)conformanceMode
{
  return self->_conformanceMode;
}

- (void)setConformanceMode:(BOOL)a3
{
  self->_conformanceMode = a3;
}

- (id)statusHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setStatusHandler:(id)a3
{
}

- (NWPathEvaluator)evaluator
{
  return (NWPathEvaluator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEvaluator:(id)a3
{
}

- (__IPConfigurationService)service
{
  return self->_service;
}

- (void)setService:(__IPConfigurationService *)a3
{
  self->_service = a3;
}

@end