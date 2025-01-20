@interface CLGeomagneticModelProviderLocationdAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLGeomagneticModelProviderLocationdAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchGeomagneticModelData:(id)a3;
@end

@implementation CLGeomagneticModelProviderLocationdAdapter

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
  if (qword_102481780 != -1) {
    dispatch_once(&qword_102481780, &stru_1022F8A10);
  }
  return (id)qword_102481778;
}

- (CLGeomagneticModelProviderLocationdAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLGeomagneticModelProviderLocationdAdapter;
  return [(CLGeomagneticModelProviderLocationdAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLGeomagneticModelProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLGeomagneticModelProviderClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A8F528();
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
  v4 = [(CLGeomagneticModelProviderLocationdAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLGeomagneticModelProviderLocationdAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)fetchGeomagneticModelData:(id)a3
{
  (*(void (**)(void *__return_ptr))(*(void *)[(CLGeomagneticModelProviderLocationdAdapter *)self adaptee]+ 208))(v4);
  (*((void (**)(id, void *))a3 + 2))(a3, v4);
}

@end