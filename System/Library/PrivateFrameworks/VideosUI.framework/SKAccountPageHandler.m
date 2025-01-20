@interface SKAccountPageHandler
+ (id)sharedInstance;
- (void)accountPageViewControllerDidFinish:(id)a3;
@end

@implementation SKAccountPageHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_sSharedInstance;
  return v2;
}

void __38__SKAccountPageHandler_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SKAccountPageHandler);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
  id v3 = a3;
  v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIApplicationRouter - VUIApplicationRouter: SKAccountPageViewController finished", v7, 2u);
  }

  v5 = +[VUIInterfaceFactory sharedInstance];
  v6 = [v5 openURLHandler];
  [v6 setIsFinished:1];

  [v3 dismissViewControllerAnimated:1 completion:0];
}

@end