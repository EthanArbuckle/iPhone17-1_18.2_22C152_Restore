@interface CLTimeManagerAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetReferenceTime:(double *)a3;
- (BOOL)syncgetReferenceTime:(double *)a3 andError:(double *)a4;
- (CLTimeManagerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)setGpsTime:(unint64_t)a3;
@end

@implementation CLTimeManagerAdapter

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
  if (qword_10247C8A0 != -1) {
    dispatch_once(&qword_10247C8A0, &stru_1022C10E8);
  }
  return (id)qword_10247C898;
}

- (CLTimeManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLTimeManagerAdapter;
  return [(CLTimeManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLTimeManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLTimeManagerClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_100665AB4((uint64_t)[(CLTimeManagerAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v3 = sub_101A6927C();
    sub_100665AB4(v3);
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
  v4 = [(CLTimeManagerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLTimeManagerAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (BOOL)syncgetReferenceTime:(double *)a3
{
  return TMGetReferenceTime() != 0;
}

- (BOOL)syncgetReferenceTime:(double *)a3 andError:(double *)a4
{
  return TMGetReferenceTime() != 0;
}

- (void)setGpsTime:(unint64_t)a3
{
  v4 = [(CLTimeManagerAdapter *)self adaptee];

  sub_100665DA4((uint64_t)v4, a3);
}

@end