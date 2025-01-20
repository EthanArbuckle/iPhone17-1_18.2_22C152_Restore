@interface APAttributionRouter
- (APAttributionRouter)init;
- (id)actionReceiverForConnection:(id)a3;
- (id)machServiceName;
@end

@implementation APAttributionRouter

- (APAttributionRouter)init
{
  v7.receiver = self;
  v7.super_class = (Class)APAttributionRouter;
  v2 = [(APAttributionRouter *)&v7 init];
  if (v2)
  {
    v3 = APLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v9 = v4;
      id v5 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{private}@] Initializing listener for Attribution", buf, 0xCu);
    }
    +[APXPCListenerManager addDelegate:v2];
  }
  return v2;
}

- (id)actionReceiverForConnection:(id)a3
{
  id v3 = a3;
  v4 = [[APAttributionReceiver alloc] initWithConnection:v3];

  return v4;
}

- (id)machServiceName
{
  return @"com.apple.ap.promotedcontent.attributionservice";
}

@end