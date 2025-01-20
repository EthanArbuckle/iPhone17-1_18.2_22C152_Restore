@interface CLSuggestedActionManager
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLSuggestedActionManager)init;
- (void)beginService;
- (void)dealloc;
- (void)endService;
@end

@implementation CLSuggestedActionManager

+ (BOOL)isSupported
{
  if (qword_102480100 != -1) {
    dispatch_once(&qword_102480100, &stru_1022DDAA0);
  }
  return byte_1024800F8;
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
  if (qword_102480110 != -1) {
    dispatch_once(&qword_102480110, &stru_1022DDAC0);
  }
  return (id)qword_102480108;
}

- (CLSuggestedActionManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSuggestedActionManager;
  return [(CLSuggestedActionManager *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSuggestedActionServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLSuggestedActionClientProtocol];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLSuggestedActionManager;
  [(CLSuggestedActionManager *)&v2 dealloc];
}

- (void)beginService
{
  id v2 = [(CLSuggestedActionManager *)self universe];

  [v2 silo];
}

- (void)endService
{
  id v2 = [(CLSuggestedActionManager *)self universe];

  [v2 silo];
}

@end