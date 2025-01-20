@interface CLFallNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLFallNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)onClientAnomalyEventSubscriptionRequest:(id)a3;
- (void)setHgalCaptureMode:(unsigned __int8)a3;
- (void)simulateEvent:(unint64_t)a3;
@end

@implementation CLFallNotifierAdapter

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
  if (qword_10247FA48 != -1) {
    dispatch_once(&qword_10247FA48, &stru_1022DAC78);
  }
  return (id)qword_10247FA40;
}

- (CLFallNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLFallNotifierAdapter;
  return [(CLFallNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLFallNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLFallNotifierClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A7C3E0();
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
  v4 = [(CLFallNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLFallNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_10247FA58 != -1) {
    dispatch_once(&qword_10247FA58, &stru_1022DAC98);
  }
  return byte_10247FA50;
}

- (void)simulateEvent:(unint64_t)a3
{
  v4 = [(CLFallNotifierAdapter *)self adaptee];

  sub_100A35830((uint64_t)v4, a3);
}

- (void)setHgalCaptureMode:(unsigned __int8)a3
{
  int v3 = a3;
  v4 = [(CLFallNotifierAdapter *)self adaptee];

  sub_100A35A24((uint64_t)v4, v3);
}

- (void)onClientAnomalyEventSubscriptionRequest:(id)a3
{
  if (a3)
  {
    *(_DWORD *)v8 = 0;
    long long v9 = xmmword_101D6F590;
    unint64_t v10 = 0xFF7FFFFF7F7FFFFFLL;
    int v11 = -8388609;
    uint64_t v12 = 0;
    uint64_t v13 = 0x7F7FFFFF00000000;
    int v14 = 2139095039;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v18 = 0;
    int32x4_t v19 = vdupq_n_s32(0x7F7FFFFFu);
    int v20 = -8388609;
    __int16 v21 = 1;
    uint64_t v28 = 0;
    uint64_t v27 = 0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    [a3 absoluteTimestamp];
    uint64_t v26 = v5;
    *(void *)&v8[3] = [a3 identifier];
    BYTE5(v7) = [a3 state];
    unsigned __int8 v23 = [a3 response];
    unsigned __int8 v24 = [a3 resolution];
    unsigned __int8 v29 = [a3 sosState];
    unsigned __int8 v22 = [a3 operatingMode];
    sub_100A35D00((uint64_t)[(CLFallNotifierAdapter *)self adaptee], (uint64_t)&v6);
  }
}

@end