@interface CLApplicationLifecycleManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLApplicationLifecycleManagerAdapter)init;
- (void)beginService;
- (void)endService;
- (void)launchApplication:(id)a3 requiringAuthForServiceMask:(unint64_t)a4;
- (void)launchDaemon:(id)a3;
- (void)manager;
- (void)setManager:(void *)a3;
@end

@implementation CLApplicationLifecycleManagerAdapter

- (void)launchApplication:(id)a3 requiringAuthForServiceMask:(unint64_t)a4
{
  manager = self->_manager;
  if (manager)
  {
    sub_100134750(__p, (char *)[a3 UTF8String]);
    sub_100052434((uint64_t)manager, (unsigned __int8 *)__p, a4);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }
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
  if (qword_102481028 != -1) {
    dispatch_once(&qword_102481028, &stru_1022F20B8);
  }
  return (id)qword_102481020;
}

+ (BOOL)isSupported
{
  if (qword_102481038 != -1) {
    dispatch_once(&qword_102481038, &stru_1022F20D8);
  }
  return (byte_102481030 & 1) == 0;
}

- (CLApplicationLifecycleManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLApplicationLifecycleManagerAdapter;
  return [(CLApplicationLifecycleManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLApplicationLifecycleManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLApplicationLifecycleManagerClientProtocol];
}

- (void)beginService
{
}

- (void)endService
{
  manager = self->_manager;
  if (manager)
  {
    sub_100CF8C94((uint64_t)manager);
    operator delete();
  }
  self->_manager = 0;
}

- (void)launchDaemon:(id)a3
{
  manager = (id *)self->_manager;
  if (manager)
  {
    sub_100134750(__p, (char *)[a3 UTF8String]);
    id v4 = [[[*manager vendor] proxyForService:@"CLClientManager"];
    if (v7 >= 0) {
      unint64_t v5 = __p;
    }
    else {
      unint64_t v5 = (void **)__p[0];
    }
    [v4 wakeUpLaunchdManagedClient:[+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5)]];
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }
}

- (void)manager
{
  return self->_manager;
}

- (void)setManager:(void *)a3
{
  self->_manager = a3;
}

@end