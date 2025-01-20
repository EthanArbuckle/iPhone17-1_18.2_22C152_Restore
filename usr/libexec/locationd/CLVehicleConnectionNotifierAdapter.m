@interface CLVehicleConnectionNotifierAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLVehicleConnectionNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)deliverAndReleaseNotification:(__CFUserNotification *)a3 withFlags:(unint64_t)a4;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchIsDeviceVehicle:(id)a3 deviceType:(unint64_t)a4 withReply:(id)a5;
- (void)fetchMostRecentConnectionWithReply:(id)a3;
- (void)fetchMostRecentInVehicleStartAndExitTimesWithReply:(id)a3;
@end

@implementation CLVehicleConnectionNotifierAdapter

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
  if (qword_102485A78 != -1) {
    dispatch_once(&qword_102485A78, &stru_102314880);
  }
  return (id)qword_102485A70;
}

- (CLVehicleConnectionNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLVehicleConnectionNotifierAdapter;
  return [(CLVehicleConnectionNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLVehicleConnectionNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLVehicleConnectionNotifierClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AA3EC8();
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
  v4 = [(CLVehicleConnectionNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLVehicleConnectionNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)fetchMostRecentConnectionWithReply:(id)a3
{
  memcpy(v4, (char *)[(CLVehicleConnectionNotifierAdapter *)self adaptee] + 976, sizeof(v4));
  (*((void (**)(id, unsigned char *))a3 + 2))(a3, v4);
}

- (void)fetchIsDeviceVehicle:(id)a3 deviceType:(unint64_t)a4 withReply:(id)a5
{
  int v6 = a4;
  sub_100134750(__p, (char *)[a3 UTF8String]);
  v8 = [(CLVehicleConnectionNotifierAdapter *)self adaptee];
  int v9 = v8[944];
  BOOL v10 = (v6 == 22 || v6 == 17) && (sub_101169B88((uint64_t)v8, (uint64_t)__p) & 1) != 0 || v6 == 16 && v9 != 0;
  (*((void (**)(id, BOOL))a5 + 2))(a5, v10);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

- (void)deliverAndReleaseNotification:(__CFUserNotification *)a3 withFlags:(unint64_t)a4
{
  sub_101165274((uint64_t)[(CLVehicleConnectionNotifierAdapter *)self adaptee], a4);

  CFRelease(a3);
}

- (void)fetchMostRecentInVehicleStartAndExitTimesWithReply:(id)a3
{
  unint64_t v5 = *((void *)[(CLVehicleConnectionNotifierAdapter *)self adaptee] + 122);
  v6.n128_u64[0] = *((void *)[(CLVehicleConnectionNotifierAdapter *)self adaptee] + 220);
  v7 = (void (*)(id, __n128, __n128))*((void *)a3 + 2);
  v8.n128_u64[0] = v5;

  v7(a3, v8, v6);
}

@end