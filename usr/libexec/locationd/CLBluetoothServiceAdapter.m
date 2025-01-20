@interface CLBluetoothServiceAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetHasConnectedDevices;
- (CLBluetoothServiceAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)clearAFHSettings;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchHasConnectedDevicesWithReply:(id)a3;
- (void)fetchIsBluetoothPoweredWithReply:(id)a3;
- (void)scan;
- (void)setAFHChannelAvoidance:(id)a3;
@end

@implementation CLBluetoothServiceAdapter

- (void)fetchHasConnectedDevicesWithReply:(id)a3
{
  BOOL v4 = *((void *)[(CLBluetoothServiceAdapter *)self adaptee] + 19) != 0;
  v5 = (void (*)(id, BOOL))*((void *)a3 + 2);

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
  if (qword_102480990 != -1) {
    dispatch_once(&qword_102480990, &stru_1022EF160);
  }
  return (id)qword_102480988;
}

- (CLBluetoothServiceAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLBluetoothServiceAdapter;
  return [(CLBluetoothServiceAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLBluetoothServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLBluetoothServiceClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A87470();
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  BOOL v4 = [(CLBluetoothServiceAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLBluetoothServiceAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_1024809A0 != -1) {
    dispatch_once(&qword_1024809A0, &stru_1022EF180);
  }
  return byte_102480998;
}

- (void)clearAFHSettings
{
  v2 = [(CLBluetoothServiceAdapter *)self adaptee];

  sub_100C4C884((uint64_t)v2);
}

- (void)setAFHChannelAvoidance:(id)a3
{
  BOOL v4 = [(CLBluetoothServiceAdapter *)self adaptee];
  unint64_t v5 = (int *)[a3 bytes];
  unint64_t v6 = (unint64_t)[a3 length] >> 2;

  sub_100C4CA9C((uint64_t)v4, v5, v6);
}

- (BOOL)syncgetHasConnectedDevices
{
  return *((void *)[(CLBluetoothServiceAdapter *)self adaptee] + 19) != 0;
}

- (void)scan
{
  v2 = [(CLBluetoothServiceAdapter *)self adaptee];

  sub_100C4CB54((uint64_t)v2);
}

- (void)fetchIsBluetoothPoweredWithReply:(id)a3
{
  uint64_t v4 = *((unsigned __int8 *)[(CLBluetoothServiceAdapter *)self adaptee] + 109);
  unint64_t v5 = (void (*)(id, uint64_t, uint64_t))*((void *)a3 + 2);

  v5(a3, 1, v4);
}

@end