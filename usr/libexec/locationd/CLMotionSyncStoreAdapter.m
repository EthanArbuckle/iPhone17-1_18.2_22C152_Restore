@interface CLMotionSyncStoreAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLMotionSyncStoreAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)resetStoredCalibrations;
@end

@implementation CLMotionSyncStoreAdapter

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
  if (qword_102485AD0 != -1) {
    dispatch_once(&qword_102485AD0, &stru_102314CF8);
  }
  return (id)qword_102485AC8;
}

- (CLMotionSyncStoreAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLMotionSyncStoreAdapter;
  return [(CLMotionSyncStoreAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLMotionSyncStoreProtocol outboundProtocol:&OBJC_PROTOCOL___CLMotionSyncStoreClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AA41E0();
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
  v4 = [(CLMotionSyncStoreAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLMotionSyncStoreAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  sub_100103240();

  return sub_10016CCBC();
}

- (void)resetStoredCalibrations
{
  v2 = [(CLMotionSyncStoreAdapter *)self adaptee];
  (*(void (**)(void *))(*(void *)v2 + 232))(v2);
  if (qword_102418FF0 != -1) {
    dispatch_once(&qword_102418FF0, &stru_102314E88);
  }
  objc_super v3 = qword_102418FF8;
  if (os_log_type_enabled((os_log_t)qword_102418FF8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#Notice Calibrations were successfully cleared.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FF0 != -1) {
      dispatch_once(&qword_102418FF0, &stru_102314E88);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMotionSyncStoreAdapter resetStoredCalibrations]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

@end