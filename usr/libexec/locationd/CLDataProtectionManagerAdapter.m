@interface CLDataProtectionManagerAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDeviceUnlockedSinceFirstBoot;
- (BOOL)syncgetDoSync:(id)a3;
- (CLDataProtectionManagerAdapter)init;
- (int)syncgetDataAvailability;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchDataAvailabilityWithReply:(id)a3;
- (void)postDataAvailability;
@end

@implementation CLDataProtectionManagerAdapter

- (void)fetchDataAvailabilityWithReply:(id)a3
{
  uint64_t v4 = *((unsigned int *)[(CLDataProtectionManagerAdapter *)self adaptee] + 28);
  v5 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
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
  if (qword_102482068 != -1) {
    dispatch_once(&qword_102482068, &stru_102300570);
  }
  return (id)qword_102482060;
}

- (CLDataProtectionManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLDataProtectionManagerAdapter;
  return [(CLDataProtectionManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLDataProtectionManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLDataProtectionManagerClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A94118();
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  uint64_t v4 = [(CLDataProtectionManagerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLDataProtectionManagerAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)postDataAvailability
{
  if (qword_102419630 != -1) {
    dispatch_once(&qword_102419630, &stru_102300718);
  }
  objc_super v3 = qword_102419638;
  if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "client of CLDataProtectionManager is requesting a re-broadcast of data availability", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_102300718);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDataProtectionManagerAdapter postDataAvailability]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  sub_100EB13B4([(CLDataProtectionManagerAdapter *)self adaptee]);
}

- (int)syncgetDataAvailability
{
  return *((_DWORD *)[(CLDataProtectionManagerAdapter *)self adaptee] + 28);
}

- (BOOL)syncgetDeviceUnlockedSinceFirstBoot
{
  [(CLDataProtectionManagerAdapter *)self adaptee];

  return sub_100EB15F4();
}

@end