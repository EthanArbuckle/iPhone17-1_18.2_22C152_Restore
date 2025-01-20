@interface CLOdometerNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLOdometerNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)querySignificantElevationDeltaFromDate:(id)a3 toDate:(id)a4 withReply:(id)a5;
- (void)registerForCyclingWorkoutDistanceUpdates:(id)a3;
- (void)unregisterForCyclingWorkoutDistanceUpdates:(id)a3;
- (void)updatePhoneWorkoutElevationSubscription:(BOOL)a3;
@end

@implementation CLOdometerNotifierAdapter

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
  if (qword_10247ACA0 != -1) {
    dispatch_once(&qword_10247ACA0, &stru_1022B4DE0);
  }
  return (id)qword_10247AC98;
}

- (CLOdometerNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLOdometerNotifierAdapter;
  return [(CLOdometerNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLOdometerNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLOdometerNotifierClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A6177C();
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
  v4 = [(CLOdometerNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLOdometerNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_10247ACB0 != -1) {
    dispatch_once(&qword_10247ACB0, &stru_1022B4E00);
  }
  return byte_10247ACA8;
}

- (void)querySignificantElevationDeltaFromDate:(id)a3 toDate:(id)a4 withReply:(id)a5
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  v8 = [(CLOdometerNotifierAdapter *)self adaptee];
  [a3 timeIntervalSinceReferenceDate];
  double v10 = v9;
  [a4 timeIntervalSinceReferenceDate];
  sub_10049F2D8((uint64_t)v8, (uint64_t)&v15, v10, v11);
  v12.n128_u64[0] = *((void *)&v16 + 1);
  if (*((double *)&v16 + 1) == -1.0)
  {
    v13 = (void (*)(id, void, __n128))*((void *)a5 + 2);
    v13(a5, 0, v12);
  }
  else
  {
    id v14 = [objc_alloc((Class)CMSignificantElevationSample) initWithSignificantElevation:&v15];
    (*((void (**)(id, id))a5 + 2))(a5, v14);
  }
}

- (void)updatePhoneWorkoutElevationSubscription:(BOOL)a3
{
  objc_super v3 = *(void (**)(void))(*(void *)[(CLOdometerNotifierAdapter *)self adaptee] + 208);

  v3();
}

- (void)registerForCyclingWorkoutDistanceUpdates:(id)a3
{
  objc_super v3 = *(void (**)(void))(*(void *)[(CLOdometerNotifierAdapter *)self adaptee] + 216);

  v3();
}

- (void)unregisterForCyclingWorkoutDistanceUpdates:(id)a3
{
  objc_super v3 = *(void (**)(void))(*(void *)[(CLOdometerNotifierAdapter *)self adaptee] + 224);

  v3();
}

@end