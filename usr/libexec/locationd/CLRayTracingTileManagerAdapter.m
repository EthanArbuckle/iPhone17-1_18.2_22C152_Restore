@interface CLRayTracingTileManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLRayTracingTileManagerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)cancelRequest;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)requestRTTiles:(double)a3 longitude:(double)a4 numberOfTiles:(int)a5;
- (void)triggerPreCaching;
@end

@implementation CLRayTracingTileManagerAdapter

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
  if (qword_102485A38 != -1) {
    dispatch_once(&qword_102485A38, &stru_102314050);
  }
  return (id)qword_102485A30;
}

- (CLRayTracingTileManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLRayTracingTileManagerAdapter;
  return [(CLRayTracingTileManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLRayTracingTileManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLRayTracingTileManagerClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AA3D34();
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
  v4 = [(CLRayTracingTileManagerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLRayTracingTileManagerAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_102485A48 != -1) {
    dispatch_once(&qword_102485A48, &stru_102314070);
  }
  return byte_102485A40;
}

- (void)requestRTTiles:(double)a3 longitude:(double)a4 numberOfTiles:(int)a5
{
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_102314218);
  }
  v9 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLRayTracingTileManager,requestRTTiles", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_102314218);
    }
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRayTracingTileManagerAdapter requestRTTiles:longitude:numberOfTiles:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  sub_10114B518((uint64_t)[(CLRayTracingTileManagerAdapter *)self adaptee], a5, a3, a4);
}

- (void)triggerPreCaching
{
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_102314218);
  }
  objc_super v3 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLRayTracingTileManager,triggerPreCaching", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_102314218);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRayTracingTileManagerAdapter triggerPreCaching]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  sub_10114BA14((uint64_t)[(CLRayTracingTileManagerAdapter *)self adaptee]);
}

- (void)cancelRequest
{
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_102314218);
  }
  objc_super v3 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLRayTracingTileManager,cancelRequest", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_102314218);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRayTracingTileManagerAdapter cancelRequest]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  sub_10114BD98((uint64_t)[(CLRayTracingTileManagerAdapter *)self adaptee]);
}

@end