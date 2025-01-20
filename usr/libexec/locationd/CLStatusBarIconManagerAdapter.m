@interface CLStatusBarIconManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetStatusBarIconForEntityClass:(int)a3;
- (CLStatusBarIconManagerAdapter)init;
- (int)syncgetIconState;
- (void)adaptee;
- (void)beginService;
- (void)endService;
- (void)entityClass:(unsigned int)a3 didChangeArrowState:(unint64_t)a4 dueToDeauthorization:(BOOL)a5;
- (void)setE911Active:(BOOL)a3;
- (void)setStatusBarIconForEntityClass:(int)a3 visible:(BOOL)a4;
@end

@implementation CLStatusBarIconManagerAdapter

- (void)entityClass:(unsigned int)a3 didChangeArrowState:(unint64_t)a4 dueToDeauthorization:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = [(CLStatusBarIconManagerAdapter *)self adaptee];

  sub_10006EFF8((uint64_t)v8, a3, a4, v5);
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
  if (qword_102482198 != -1) {
    dispatch_once(&qword_102482198, &stru_102300B20);
  }
  return (id)qword_102482190;
}

- (CLStatusBarIconManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLStatusBarIconManagerAdapter;
  return [(CLStatusBarIconManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLStatusBarIconManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLStatusBarIconManagerClientProtocol];
}

- (void)beginService
{
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

+ (BOOL)isSupported
{
  return 1;
}

- (int)syncgetIconState
{
  v2 = [(CLStatusBarIconManagerAdapter *)self adaptee];

  return sub_100EC0C6C((uint64_t)v2);
}

- (BOOL)syncgetStatusBarIconForEntityClass:(int)a3
{
  v4 = [(CLStatusBarIconManagerAdapter *)self adaptee];

  return sub_100EC0F98((uint64_t)v4, a3);
}

- (void)setStatusBarIconForEntityClass:(int)a3 visible:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(CLStatusBarIconManagerAdapter *)self adaptee];

  sub_100EC106C((uint64_t)v6, a3, v4);
}

- (void)setE911Active:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(CLStatusBarIconManagerAdapter *)self adaptee];

  sub_100EC1100((uint64_t)v4, v3);
}

@end