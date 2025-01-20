@interface PCSupportRouter
- (PCSupportRouter)init;
- (id)actionReceiverForConnection:(id)a3;
- (id)machServiceName;
@end

@implementation PCSupportRouter

- (id)actionReceiverForConnection:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 hasEntitlement:@"com.apple.developer.healthkit"];
  unsigned int v5 = [v3 hasEntitlement:@"com.apple.developer.homekit"];
  if ((v4 & 1) != 0 || v5)
  {
    v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Apps using HealthKit or HomeKit are not permitted to use PromotedContent segment APIs. This request will be ignored.", v9, 2u);
    }

    v6 = 0;
  }
  else
  {
    v6 = [[PCSupportReceiver alloc] initWithConnection:v3];
  }

  return v6;
}

- (PCSupportRouter)init
{
  v7.receiver = self;
  v7.super_class = (Class)PCSupportRouter;
  v2 = [(PCSupportRouter *)&v7 init];
  if (v2)
  {
    id v3 = APLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v4 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v9 = v4;
      id v5 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{private}@] Initializing listener for PromotedContentSupport ", buf, 0xCu);
    }
    +[APXPCListenerManager addDelegate:v2];
  }
  return v2;
}

- (id)machServiceName
{
  return @"com.apple.ap.promotedcontent.supportinterface";
}

@end