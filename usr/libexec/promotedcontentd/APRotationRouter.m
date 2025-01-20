@interface APRotationRouter
- (APRotationRouter)init;
- (Protocol)exportedInterface;
- (id)machServiceName;
- (id)requiredEntitlements;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)rotate:(id)a3;
@end

@implementation APRotationRouter

- (APRotationRouter)init
{
  v4.receiver = self;
  v4.super_class = (Class)APRotationRouter;
  v2 = [(APRotationRouter *)&v4 init];
  if (v2) {
    +[APXPCListenerManager addDelegate:v2];
  }
  return v2;
}

- (id)machServiceName
{
  return kPromotedContentXPCMachServiceName;
}

- (void)rotate:(id)a3
{
  v3 = (void (**)(id, id))a3;
  objc_super v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "XPC Request to rotate promotedcontentd pool manager sessions.", buf, 2u);
  }

  v5 = +[APSigningAuthorityPoolManager sharedInstance];
  id v8 = 0;
  [v5 rotateWithError:&v8];
  id v6 = v8;

  if (v3) {
    v3[2](v3, v6);
  }
  v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"com.apple.ap.promotedcontend.rotationRouter.clientRotated" object:0];
}

- (Protocol)exportedInterface
{
  return (Protocol *)&OBJC_PROTOCOL___APRotateXPC;
}

- (void)connectionInterrupted
{
  v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection to client for Rotation was interrupted.", v3, 2u);
  }
}

- (void)connectionInvalidated
{
  v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Connection to client for Rotation was invalidated.", v3, 2u);
  }
}

- (id)requiredEntitlements
{
  return +[NSArray arrayWithObject:kPromotedContentClientEntitlement];
}

@end