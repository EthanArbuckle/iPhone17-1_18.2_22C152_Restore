@interface CLCorrectiveCompensatedLocationProviderAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLCorrectiveCompensatedLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchLocationWithReply:(id)a3;
@end

@implementation CLCorrectiveCompensatedLocationProviderAdapter

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
  if (qword_10247E6E8 != -1) {
    dispatch_once(&qword_10247E6E8, &stru_1022CE3B8);
  }
  return (id)qword_10247E6E0;
}

- (CLCorrectiveCompensatedLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLCorrectiveCompensatedLocationProviderAdapter;
  return [(CLCorrectiveCompensatedLocationProviderAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLCorrectiveCompensatedLocationProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLCorrectiveCompensatedLocationProviderClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A72224();
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
  v4 = [(CLCorrectiveCompensatedLocationProviderAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLCorrectiveCompensatedLocationProviderAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)fetchLocationWithReply:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100887D4C;
  v3[3] = &unk_1022CE3E0;
  v3[4] = a3;
  sub_100887AE4((id *)[(CLCorrectiveCompensatedLocationProviderAdapter *)self adaptee], (uint64_t)v3);
}

@end