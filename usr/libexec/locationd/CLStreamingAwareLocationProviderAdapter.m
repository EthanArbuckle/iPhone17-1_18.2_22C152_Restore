@interface CLStreamingAwareLocationProviderAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLStreamingAwareLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)releaseAccuracyEnablementAssertionForClient:(id)a3;
- (void)remoteDeviceMotionUpdate:(int)a3 atTime:(double)a4;
- (void)takeAccuracyEnablementAssertionForClient:(id)a3 withDesiredAccuracy:(double)a4;
@end

@implementation CLStreamingAwareLocationProviderAdapter

- (void)takeAccuracyEnablementAssertionForClient:(id)a3 withDesiredAccuracy:(double)a4
{
  v6 = [(CLStreamingAwareLocationProviderAdapter *)self adaptee];

  sub_10001FFE4((uint64_t)v6, a3, a4);
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
  if (qword_102482250 != -1) {
    dispatch_once(&qword_102482250, &stru_102301278);
  }
  return (id)qword_102482248;
}

- (CLStreamingAwareLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLStreamingAwareLocationProviderAdapter;
  return [(CLStreamingAwareLocationProviderAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLStreamingAwareLocationProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLStreamingAwareLocationProviderClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A94C20();
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  v4 = [(CLStreamingAwareLocationProviderAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLStreamingAwareLocationProviderAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)releaseAccuracyEnablementAssertionForClient:(id)a3
{
  v4 = [(CLStreamingAwareLocationProviderAdapter *)self adaptee];

  sub_100EC90B8(v4, a3);
}

- (void)remoteDeviceMotionUpdate:(int)a3 atTime:(double)a4
{
  uint64_t v5 = *((void *)[(CLStreamingAwareLocationProviderAdapter *)self adaptee] + 16);

  sub_100EB0B7C(v5, a4);
}

@end