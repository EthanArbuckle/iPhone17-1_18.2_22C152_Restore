@interface CLFitnessMachineNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLFitnessMachineNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)feedFitnessMachineData:(id)a3;
@end

@implementation CLFitnessMachineNotifierAdapter

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
  if (qword_102485B40 != -1) {
    dispatch_once(&qword_102485B40, &stru_1023153D8);
  }
  return (id)qword_102485B38;
}

- (CLFitnessMachineNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLFitnessMachineNotifierAdapter;
  return [(CLFitnessMachineNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLFitnessMachineNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLFitnessMachineNotifierClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AA4618();
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
  v4 = [(CLFitnessMachineNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLFitnessMachineNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)feedFitnessMachineData:(id)a3
{
  [a3 convertToCLFitnessMachineData:v7 deviceId:0];
  v4 = [(CLFitnessMachineNotifierAdapter *)self adaptee];
  v5[8] = v7[8];
  v5[9] = v7[9];
  uint64_t v6 = v8;
  v5[4] = v7[4];
  v5[5] = v7[5];
  v5[6] = v7[6];
  v5[7] = v7[7];
  v5[0] = v7[0];
  v5[1] = v7[1];
  v5[2] = v7[2];
  v5[3] = v7[3];
  sub_10117D850((uint64_t)v4, (uint64_t)v5);
}

+ (BOOL)isSupported
{
  if (qword_102485B50 != -1) {
    dispatch_once(&qword_102485B50, &stru_1023153F8);
  }
  return byte_102485B48;
}

@end