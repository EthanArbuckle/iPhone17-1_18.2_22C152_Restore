@interface APPCControllerRouter
- (APPCControllerRouter)init;
- (id)actionReceiverForConnection:(id)a3;
- (id)machServiceName;
@end

@implementation APPCControllerRouter

- (id)actionReceiverForConnection:(id)a3
{
  id v4 = a3;
  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 bundleID];
    int v9 = 136643587;
    v10 = "-[APPCControllerRouter actionReceiverForConnection:]";
    __int16 v11 = 2050;
    v12 = self;
    __int16 v13 = 2050;
    id v14 = v4;
    __int16 v15 = 2114;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{sensitive}s: controller router %{public}p connection %{public}p bundleID is %{public}@", (uint8_t *)&v9, 0x2Au);
  }
  v7 = sub_100004888((id *)[APPCControllerReceiver alloc], v4);

  return v7;
}

- (APPCControllerRouter)init
{
  v7.receiver = self;
  v7.super_class = (Class)APPCControllerRouter;
  v2 = [(APPCControllerRouter *)&v7 init];
  if (v2)
  {
    v3 = APLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      int v9 = v4;
      id v5 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{private}@] Initializing listener for PCController", buf, 0xCu);
    }
    +[APXPCListenerManager addDelegate:v2];
  }
  return v2;
}

- (id)machServiceName
{
  return @"com.apple.ap.promotedcontent.pcinterface";
}

@end