@interface CLSpringTrackingNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetIsTracking;
- (CLSpringTrackingNotifierAdapter)init;
- (int)syncgetStartTracking;
- (int)syncgetStopTracking;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)querySinceRecord:(CLSpringTrackerEntry *)a3 withReply:(id)a4;
@end

@implementation CLSpringTrackingNotifierAdapter

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
  if (qword_1024870E8 != -1) {
    dispatch_once(&qword_1024870E8, &stru_102320DD0);
  }
  return (id)qword_1024870E0;
}

- (CLSpringTrackingNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSpringTrackingNotifierAdapter;
  return [(CLSpringTrackingNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSpringTrackingNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLSpringTrackingNotifierClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_10133A498((uint64_t)[(CLSpringTrackingNotifierAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v3 = sub_101AAF3A0();
    sub_10133A498(v3);
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
  v4 = [(CLSpringTrackingNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLSpringTrackingNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (BOOL)syncgetIsTracking
{
  return *((void *)[(CLSpringTrackingNotifierAdapter *)self adaptee] + 26) != 0;
}

- (int)syncgetStartTracking
{
  v2 = [(CLSpringTrackingNotifierAdapter *)self adaptee];

  return sub_10133A704((uint64_t)v2);
}

- (int)syncgetStopTracking
{
  return 100;
}

- (void)querySinceRecord:(CLSpringTrackerEntry *)a3 withReply:(id)a4
{
  if (!a4)
  {
    sub_101AAF51C(self, a2, a3);
    __break(1u);
  }
  sub_10133AC90((uint64_t)[(CLSpringTrackingNotifierAdapter *)self adaptee], (uint64_t)a3, &__p);
  unint64_t v5 = +[NSMutableArray arrayWithCapacity:0x6DB6DB6DB6DB6DB7 * ((v13 - (unsigned char *)__p) >> 3)];
  v6 = __p;
  v7 = v13;
  if (__p != v13)
  {
    do
    {
      long long v8 = *v6;
      long long v9 = v6[1];
      long long v10 = v6[2];
      uint64_t v15 = *((void *)v6 + 6);
      v14[1] = v9;
      v14[2] = v10;
      v14[0] = v8;
      id v11 = [objc_alloc((Class)CMSleepData) initWithSpringEntry:v14];
      [(NSMutableArray *)v5 addObject:v11];

      v6 = (_OWORD *)((char *)v6 + 56);
    }
    while (v6 != (_OWORD *)v7);
  }
  (*((void (**)(id, NSMutableArray *))a4 + 2))(a4, v5);
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }
}

+ (BOOL)isSupported
{
  if (qword_1024870F8 != -1) {
    dispatch_once(&qword_1024870F8, &stru_102320DF0);
  }
  return byte_1024870F0;
}

@end