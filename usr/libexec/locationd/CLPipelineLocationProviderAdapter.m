@interface CLPipelineLocationProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLPipelineLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)handleARSessionState:(unint64_t)a3 fromClient:(id)a4;
- (void)handleVIOEstimation:(id)a3 fromClient:(id)a4;
- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4;
- (void)onOutdoorUpdate:(id)a3;
@end

@implementation CLPipelineLocationProviderAdapter

- (void)onOutdoorUpdate:(id)a3
{
  v4 = [(CLPipelineLocationProviderAdapter *)self adaptee];
  (*((void (**)(void *__return_ptr, id))a3 + 2))(v5, a3);
  std::chrono::steady_clock::now();
  sub_1001BE85C(v4[18]);
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
  if (qword_102486890 != -1) {
    dispatch_once(&qword_102486890, &stru_10231A110);
  }
  return (id)qword_102486888;
}

+ (BOOL)isSupported
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1024868A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1024868A0))
  {
    int v3 = sub_101257F18();
    if (v3) {
      LOBYTE(v3) = sub_100743580();
    }
    byte_102486898 = v3;
    __cxa_guard_release(&qword_1024868A0);
  }
  return byte_102486898;
}

- (CLPipelineLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLPipelineLocationProviderAdapter;
  return [(CLPipelineLocationProviderAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLPipelineLocationProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLPipelineLocationProviderClientProtocol];
}

- (void)beginService
{
  uint64_t v3 = sub_10124B6EC((uint64_t)[(CLPipelineLocationProviderAdapter *)self universe], (uint64_t)self);

  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:v3];
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  v4 = [(CLPipelineLocationProviderAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLPipelineLocationProviderAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)handleARSessionState:(unint64_t)a3 fromClient:(id)a4
{
  v4 = [(CLPipelineLocationProviderAdapter *)self adaptee];
  std::chrono::steady_clock::now();
  uint64_t v5 = v4[18];

  sub_1001D15EC(v5);
}

- (void)handleVIOEstimation:(id)a3 fromClient:(id)a4
{
  v4 = [(CLPipelineLocationProviderAdapter *)self adaptee];
  std::chrono::steady_clock::now();
  uint64_t v5 = v4[18];

  sub_1001D1670(v5);
}

- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4
{
  v4 = [(CLPipelineLocationProviderAdapter *)self adaptee];
  std::chrono::steady_clock::now();
  uint64_t v5 = v4[18];

  sub_1001D16E4(v5);
}

@end