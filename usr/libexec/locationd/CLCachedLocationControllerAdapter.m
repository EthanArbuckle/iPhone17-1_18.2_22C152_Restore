@interface CLCachedLocationControllerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLCachedLocationControllerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLCachedLocationControllerAdapter

+ (BOOL)isSupported
{
  if (qword_10247E718 != -1) {
    dispatch_once(&qword_10247E718, &stru_1022CE640);
  }
  return (byte_10247E710 & 1) == 0;
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
  if (qword_10247E728 != -1) {
    dispatch_once(&qword_10247E728, &stru_1022CE660);
  }
  return (id)qword_10247E720;
}

- (CLCachedLocationControllerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLCachedLocationControllerAdapter;
  return [(CLCachedLocationControllerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLCachedLocationControllerProtocol outboundProtocol:&OBJC_PROTOCOL___CLCachedLocationControllerClientProtocol];
}

- (void)beginService
{
  uint64_t v3 = sub_10088C3DC((uint64_t)[(CLCachedLocationControllerAdapter *)self universe]);
  if (v3) {
    uint64_t v4 = v3 + 8;
  }
  else {
    uint64_t v4 = 0;
  }
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:v4];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v5 = sub_101A7254C();
    sub_10088C3DC(v5);
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
  uint64_t v4 = [(CLCachedLocationControllerAdapter *)self adaptee];
  uint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLCachedLocationControllerAdapter *)self adaptee]);
  uint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

@end