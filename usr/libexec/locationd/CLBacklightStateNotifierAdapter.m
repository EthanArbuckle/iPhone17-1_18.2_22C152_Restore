@interface CLBacklightStateNotifierAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLBacklightStateNotifierAdapter)init;
- (CLBacklightStateNotifierAdapter)initWithCLBacklightStateNotifier:(void *)a3;
- (void)adaptee;
- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLBacklightStateNotifierAdapter

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
  if (qword_10247E5A0 != -1) {
    dispatch_once(&qword_10247E5A0, &stru_1022CD300);
  }
  return (id)qword_10247E598;
}

- (CLBacklightStateNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLBacklightStateNotifierAdapter;
  return [(CLBacklightStateNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLBacklightStateNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLBacklightStateNotifierClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A71CD8();
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
  v4 = [(CLBacklightStateNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLBacklightStateNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (CLBacklightStateNotifierAdapter)initWithCLBacklightStateNotifier:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLBacklightStateNotifierAdapter;
  result = [(CLNotifierServiceAdapter *)&v5 init];
  if (result) {
    result->_backlightStateNotifier = a3;
  }
  return result;
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  int v6 = a4;
  id v8 = [objc_msgSend(a5, "changeRequest", a3) sourceEventMetadata];
  if (objc_opt_class())
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  [objc_msgSend(a5, "changeRequest") sourceEvent];
  v9 = NSStringFromBLSBacklightChangeSourceEvent();
  if (v8 && ([v8 type] == (id)1 || objc_msgSend(v8, "type") == (id)2))
  {
    [v8 reason];
    v10 = (__CFString *)NSStringFromBLSAlwaysOnSuppressionReason();
  }
  else
  {
    v10 = &stru_10234F018;
  }
  backlightStateNotifier = self->_backlightStateNotifier;
  sub_100134750(v14, (char *)[v9 UTF8String]);
  sub_100134750(__p, (char *)[(__CFString *)v10 UTF8String]);
  sub_10085F0B0((uint64_t)backlightStateNotifier, v6, (long long *)v14, (uint64_t)__p);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (v15 < 0) {
    operator delete(v14[0]);
  }
}

- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4
{
  backlightStateNotifier = self->_backlightStateNotifier;
  objc_super v5 = (void *)backlightStateNotifier[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10085F9A4;
  v6[3] = &unk_1022BBA18;
  v6[4] = backlightStateNotifier;
  BOOL v7 = a4;
  [v5 async:v6];
}

@end