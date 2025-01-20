@interface CLSedentaryTimerNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetIsTimerArmed;
- (CLSedentaryTimerNotifierAdapter)init;
- (int)syncgetSedentaryAlarmData:(void *)a3 since:(double)a4;
- (int)syncgetStartTimerForClient:(id)a3 andOptions:(id)a4;
- (int)syncgetStopTimerForClient:(id)a3;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)timeZoneDidChange:(id)a3;
@end

@implementation CLSedentaryTimerNotifierAdapter

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
  if (qword_10247AE90 != -1) {
    dispatch_once(&qword_10247AE90, &stru_1022B7128);
  }
  return (id)qword_10247AE88;
}

- (CLSedentaryTimerNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSedentaryTimerNotifierAdapter;
  return [(CLSedentaryTimerNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSedentaryTimerNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLSedentaryTimerNotifierClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A627B4();
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
  v4 = [(CLSedentaryTimerNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLSedentaryTimerNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (BOOL)syncgetIsTimerArmed
{
  return *((unsigned char *)[(CLSedentaryTimerNotifierAdapter *)self adaptee] + 176);
}

- (int)syncgetStartTimerForClient:(id)a3 andOptions:(id)a4
{
  if (qword_102418FD0 != -1) {
    dispatch_once(&qword_102418FD0, &stru_1022B7400);
  }
  v7 = qword_102418FD8;
  if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm, syncgetStartTimerForClient starting timer for client,%{public}@!", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_1022B7400);
    }
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSedentaryTimerNotifierAdapter syncgetStartTimerForClient:andOptions:]", "%s\n", v10);
    if (v10 != buf) {
      free(v10);
    }
  }
  sub_100134750(buf, (char *)[a3 UTF8String]);
  int v8 = sub_1004E50D8((uint64_t)[(CLSedentaryTimerNotifierAdapter *)self adaptee], (uint64_t)buf, a4);
  if (v12 < 0) {
    operator delete(*(void **)buf);
  }
  return v8;
}

- (int)syncgetStopTimerForClient:(id)a3
{
  if (qword_102418FD0 != -1) {
    dispatch_once(&qword_102418FD0, &stru_1022B7400);
  }
  unint64_t v5 = qword_102418FD8;
  if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm, syncgetStopTimerForClient stopping timer for client,%{public}@!", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_1022B7400);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSedentaryTimerNotifierAdapter syncgetStopTimerForClient:]", "%s\n", v7);
    if (v7 != buf) {
      free(v7);
    }
  }
  sub_100134750(buf, (char *)[a3 UTF8String]);
  sub_1004E5B34((uint64_t)[(CLSedentaryTimerNotifierAdapter *)self adaptee]);
  if (v9 < 0) {
    operator delete(*(void **)buf);
  }
  return 100;
}

- (int)syncgetSedentaryAlarmData:(void *)a3 since:(double)a4
{
  if (qword_102418FD0 != -1) {
    dispatch_once(&qword_102418FD0, &stru_1022B7400);
  }
  v7 = qword_102418FD8;
  if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    double v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm, syncgetSedentaryAlarmData with start time,%{public}f!", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_1022B7400);
    }
    char v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSedentaryTimerNotifierAdapter syncgetSedentaryAlarmData:since:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  return sub_10143AEE8(*((void *)[(CLSedentaryTimerNotifierAdapter *)self adaptee] + 23), (void **)a3, a4);
}

- (void)timeZoneDidChange:(id)a3
{
  uint64_t v3 = *((void *)[(CLSedentaryTimerNotifierAdapter *)self adaptee] + 47);
  if (v3)
  {
    sub_100470100(v3);
  }
}

+ (BOOL)isSupported
{
  if (qword_10247AEA0 != -1) {
    dispatch_once(&qword_10247AEA0, &stru_1022B7148);
  }
  return byte_10247AE98;
}

@end