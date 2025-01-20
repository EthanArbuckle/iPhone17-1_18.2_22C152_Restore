@interface CLStreamedLocationProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLStreamedLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)pairedDeviceIsNearby:(BOOL)a3;
- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4;
- (void)releaseDisablementAssertion;
- (void)releaseEmergencyEnablementAssertion;
- (void)takeDisablementAssertion;
- (void)takeEmergencyEnablementAssertion;
@end

@implementation CLStreamedLocationProviderAdapter

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
  if (qword_10247AAD0 != -1) {
    dispatch_once(&qword_10247AAD0, &stru_1022B2DC8);
  }
  return (id)qword_10247AAC8;
}

- (CLStreamedLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLStreamedLocationProviderAdapter;
  return [(CLStreamedLocationProviderAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLStreamedLocationProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLStreamedLocationProviderClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A60588();
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
  v4 = [(CLStreamedLocationProviderAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLStreamedLocationProviderAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_10247AAE0 != -1) {
    dispatch_once(&qword_10247AAE0, &stru_1022B2DE8);
  }
  return byte_10247AAD8;
}

- (void)takeDisablementAssertion
{
  v2 = [(CLStreamedLocationProviderAdapter *)self adaptee];

  sub_100452EF8(v2);
}

- (void)releaseDisablementAssertion
{
  v2 = [(CLStreamedLocationProviderAdapter *)self adaptee];

  sub_1004532A8(v2);
}

- (void)takeEmergencyEnablementAssertion
{
  v2 = [(CLStreamedLocationProviderAdapter *)self adaptee];

  sub_100453658((uint64_t)v2);
}

- (void)releaseEmergencyEnablementAssertion
{
  v2 = [(CLStreamedLocationProviderAdapter *)self adaptee];

  sub_1004539D4((uint64_t)v2);
}

- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4
{
  v6 = [(CLStreamedLocationProviderAdapter *)self adaptee];

  sub_100453D70((uint64_t)v6, a3, a4);
}

- (void)pairedDeviceIsNearby:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(CLStreamedLocationProviderAdapter *)self adaptee];

  sub_100453E64((uint64_t)v4, v3);
}

@end