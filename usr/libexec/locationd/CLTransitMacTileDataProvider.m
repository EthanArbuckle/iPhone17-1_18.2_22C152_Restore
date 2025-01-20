@interface CLTransitMacTileDataProvider
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLTransitMacTileDataProvider)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)fetchMacAddressesAmong:(id)a3 nearLatitude:(double)a4 longitude:(double)a5 withReply:(id)a6;
- (void)onDarwinNotifierNotification:(int)a3 data:(id)a4;
@end

@implementation CLTransitMacTileDataProvider

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
  if (qword_10247F0E8 != -1) {
    dispatch_once(&qword_10247F0E8, &stru_1022D4E78);
  }
  return (id)qword_10247F0E0;
}

- (CLTransitMacTileDataProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLTransitMacTileDataProvider;
  return [(CLTransitMacTileDataProvider *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLTransitMacTileDataProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLAppTileDataProviderClientProtocol];
}

- (void)beginService
{
  [self.universe silo];
  if (qword_102419630 != -1) {
    dispatch_once(&qword_102419630, &stru_1022D4EB8);
  }
  objc_super v3 = qword_102419638;
  if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "TransitMac: service begin", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_1022D4EB8);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTransitMacTileDataProvider beginService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLTransitMacTileDataProvider *)self universe];
  sub_101389C2C();
}

- (void)endService
{
  [self universe].silo
  if (qword_102419630 != -1) {
    dispatch_once(&qword_102419630, &stru_1022D4EB8);
  }
  v2 = qword_102419638;
  if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "TransitMac: service end", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_1022D4EB8);
    }
    objc_super v3 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTransitMacTileDataProvider endService]", "%s\n", v3);
    if (v3 != (char *)buf) {
      free(v3);
    }
  }
}

- (void)fetchMacAddressesAmong:(id)a3 nearLatitude:(double)a4 longitude:(double)a5 withReply:(id)a6
{
  [self universe].silo
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v16, a3);
  __p = 0;
  v14 = 0;
  uint64_t v15 = 0;
  [objc_msgSend(-[CLTransitMacTileDataProvider universe](self, "universe"), "vendor") syncgetTransitMacAddressesAmong:v16 nearLatitude:a4 longitude:a5 resultMacAddresses:&__p];
  id v11 = (id)objc_opt_new();
  v12 = __p;
  if (__p != v14)
  {
    do
      [v11 addObject:[[CLTransitMacTileDataProviderResult alloc] initWithMacAddress:*v12++]];
    while (v12 != v14);
  }
  (*((void (**)(id, id, void))a6 + 2))(a6, v11, 0);
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }
  if (v16[0])
  {
    v16[1] = v16[0];
    operator delete(v16[0]);
  }
}

- (void)onDarwinNotifierNotification:(int)a3 data:(id)a4
{
  [self universe:a3 :a4.var0].silo;
  if (!a3)
  {
    sub_1000E9354(v18);
    sub_1000C7F88(buf);
    BOOL v6 = sub_100012960((uint64_t)buf[0].__r_.__value_.__l.__data_, "SpoofTransitMacQuery", v18);
    if (buf[0].__r_.__value_.__l.__size_) {
      sub_1000DB0A0((std::__shared_weak_count *)buf[0].__r_.__value_.__l.__size_);
    }
    if (v6)
    {
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_1022D4EB8);
      }
      v7 = qword_102419638;
      if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "TransitMac: spoofing a query", (uint8_t *)buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419630 != -1) {
          dispatch_once(&qword_102419630, &stru_1022D4EB8);
        }
        LOWORD(v17[0]) = 0;
        v12 = (std::string *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTransitMacTileDataProvider onDarwinNotifierNotification:data:]", "%s\n", (const char *)v12);
        if (v12 != buf) {
          free(v12);
        }
      }
      v17[0] = 0.0;
      if (sub_1000A699C((uint64_t)v18, "Latitude", v17)) {
        double v8 = v17[0];
      }
      else {
        double v8 = 37.332862;
      }
      if (sub_1000A699C((uint64_t)v18, "Longitude", v17)) {
        double v9 = v17[0];
      }
      else {
        double v9 = -122.030238;
      }
      memset(buf, 0, 24);
      if (sub_1004D1284((uint64_t)v18, "MacAddress", buf))
      {
        uint64_t v16 = sub_100B38F04((uint64_t)buf);
        uint64_t v10 = sub_1000D8908((uint64_t)&v16);
      }
      else
      {
        uint64_t v10 = 567;
      }
      id v11 = operator new(8uLL);
      *id v11 = v10;
      v14 = 0;
      uint64_t v15 = 0;
      __p = 0;
      sub_1001DD364(&__p, v11, (uint64_t)(v11 + 1), 1uLL);
      [(CLTransitMacTileDataProvider *)self fetchMacAddressesAmong:sub_10096852C((uint64_t)&__p) nearLatitude:&stru_1022D4E98 longitude:v8 withReply:v9];
      if (__p)
      {
        v14 = __p;
        operator delete(__p);
      }
      operator delete(v11);
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
    }
    sub_10013F3C4(v18);
  }
}

- (void).cxx_destruct
{
  value = self->_darwinNotifierClient.__ptr_.__value_;
  self->_darwinNotifierClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end