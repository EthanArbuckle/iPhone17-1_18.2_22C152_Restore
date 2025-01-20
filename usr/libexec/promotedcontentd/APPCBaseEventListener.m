@interface APPCBaseEventListener
+ (BOOL)_isEventDatabaseStorageEnabled;
+ (void)startListeners;
- (APPCBaseEventListener)init;
- (OS_dispatch_queue)queue;
- (int64_t)token;
- (void)dealloc;
- (void)setToken:(int64_t)a3;
- (void)start;
- (void)stop;
@end

@implementation APPCBaseEventListener

+ (void)startListeners
{
  id v3 = +[APPCIntegrityReportEventListener sharedInstance];
  if ([a1 _isEventDatabaseStorageEnabled]) {
    id v4 = +[APPCEventStorageListener sharedInstance];
  }
}

- (APPCBaseEventListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)APPCBaseEventListener;
  v2 = [(APPCBaseEventListener *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ap.promotedcontent.eventlisteners", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    [(APPCBaseEventListener *)v2 start];
  }
  return v2;
}

- (void)start
{
  dispatch_queue_t v3 = NSStringFromSelector(a2);
  id v4 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v3];
  APSimulateCrash();

  v5 = NSStringFromSelector(a2);
  objc_super v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)stop
{
  id v4 = +[MetricsModule storage];
  dispatch_queue_t v3 = [v4 notificationRegistrar];
  [v3 removeHandlerWithIdentifier:-[APPCBaseEventListener token](self, "token")];
}

- (void)dealloc
{
  [(APPCBaseEventListener *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)APPCBaseEventListener;
  [(APPCBaseEventListener *)&v3 dealloc];
}

+ (BOOL)_isEventDatabaseStorageEnabled
{
  v2 = +[APConfigurationMediator configurationForClass:objc_opt_class()];
  objc_super v3 = [v2 isEventDatabaseStorageEnabled];

  if (v3)
  {
    id v4 = [v2 isEventDatabaseStorageEnabled];
    unsigned int v5 = [v4 BOOLValue];
  }
  else
  {
    unsigned int v5 = 1;
  }
  objc_super v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v7 = @"DISABLED";
    if (v5) {
      CFStringRef v7 = @"ENABLED";
    }
    int v9 = 138543362;
    CFStringRef v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[Event Database] Event storage is: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)token
{
  return self->_token;
}

- (void)setToken:(int64_t)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
}

@end