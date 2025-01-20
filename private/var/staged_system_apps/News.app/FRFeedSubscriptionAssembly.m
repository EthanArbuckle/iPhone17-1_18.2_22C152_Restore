@interface FRFeedSubscriptionAssembly
- (FRFeedSubscriptionAssembly)init;
- (FRFeedSubscriptionAssembly)initWithWindow:(id)a3;
- (UIWindow)window;
- (void)loadInRegistry:(id)a3;
@end

@implementation FRFeedSubscriptionAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  v5 = [v4 registerProtocol:&OBJC_PROTOCOL___FREnableNotificationsAlertPresenter factory:&stru_1000C7FB8];
  id v6 = [v5 inScope:2];

  id v8 = [v3 privateContainer];

  id v7 = [v8 registerClass:objc_opt_class() factory:&stru_1000C7FF8];
}

- (FRFeedSubscriptionAssembly)init
{
  v3.receiver = self;
  v3.super_class = (Class)FRFeedSubscriptionAssembly;
  return [(FRFeedSubscriptionAssembly *)&v3 init];
}

- (FRFeedSubscriptionAssembly)initWithWindow:(id)a3
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100076660();
  }
  v9.receiver = self;
  v9.super_class = (Class)FRFeedSubscriptionAssembly;
  id v6 = [(FRFeedSubscriptionAssembly *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_window, a3);
  }

  return v7;
}

- (UIWindow)window
{
  return self->_window;
}

- (void).cxx_destruct
{
}

@end