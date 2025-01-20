@interface CLSkiNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLSkiNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)queryUsingRecord:(CLSkiEntry *)a3 withReply:(id)a4;
@end

@implementation CLSkiNotifierAdapter

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
  if (qword_102481F80 != -1) {
    dispatch_once(&qword_102481F80, &stru_1022FDCF0);
  }
  return (id)qword_102481F78;
}

- (CLSkiNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSkiNotifierAdapter;
  return [(CLSkiNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSkiNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLSkiNotifierClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A91138();
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
  v4 = [(CLSkiNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLSkiNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)queryUsingRecord:(CLSkiEntry *)a3 withReply:(id)a4
{
  sub_100D5ED58((uint64_t)[(CLSkiNotifierAdapter *)self adaptee], (uint64_t)a3, (uint64_t)&__p);
  unint64_t v5 = +[NSMutableArray arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((v10 - (unsigned char *)__p) >> 5)];
  v6 = (char *)__p;
  v7 = v10;
  if (__p != v10)
  {
    do
    {
      id v8 = [objc_alloc((Class)CMSkiData) initWithSkiEntry:v6];
      [(NSMutableArray *)v5 addObject:v8];

      v6 += 96;
    }
    while (v6 != v7);
  }
  (*((void (**)(id, NSMutableArray *))a4 + 2))(a4, v5);
  if (__p)
  {
    v10 = (char *)__p;
    operator delete(__p);
  }
}

+ (BOOL)isSupported
{
  if (qword_102481F90 != -1) {
    dispatch_once(&qword_102481F90, &stru_1022FDD10);
  }
  return byte_102481F88;
}

@end