@interface FRUserOnboardingOperation
- (BOOL)validateOperation;
- (FCCloudContext)cloudContext;
- (FRAnalyticsController)analyticsController;
- (FRPresubscribeService)presubscribeService;
- (NSNumber)onboardingVersion;
- (id)_determineUserID;
- (id)_presubscribe;
- (id)_refreshAppConfig;
- (id)_refreshOnboardingVersion;
- (id)userOnboardingCompletionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setAnalyticsController:(id)a3;
- (void)setCloudContext:(id)a3;
- (void)setOnboardingVersion:(id)a3;
- (void)setPresubscribeService:(id)a3;
- (void)setUserOnboardingCompletionHandler:(id)a3;
@end

@implementation FRUserOnboardingOperation

- (BOOL)validateOperation
{
  v3 = [(FRUserOnboardingOperation *)self cloudContext];

  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100074A5C();
  }
  v4 = [(FRUserOnboardingOperation *)self analyticsController];

  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000749A4();
  }
  v5 = [(FRUserOnboardingOperation *)self presubscribeService];

  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000748EC();
  }
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6 && v5 != 0;
}

- (void)performOperation
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100039778;
  v19[3] = &unk_1000C7610;
  v19[4] = self;
  v13 = +[NFPromise firstly:v19];
  v3 = zalgo();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100039780;
  v18[3] = &unk_1000C7638;
  v18[4] = self;
  v4 = [v13 thenOn:v3 then:v18];
  v5 = zalgo();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100039788;
  v17[3] = &unk_1000C7638;
  v17[4] = self;
  BOOL v6 = [v4 thenOn:v5 then:v17];
  v7 = zalgo();
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100039790;
  v16[3] = &unk_1000C7660;
  v16[4] = self;
  v8 = [v6 thenOn:v7 then:v16];
  v9 = zalgo();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000397D0;
  v15[3] = &unk_1000C7638;
  v15[4] = self;
  v10 = [v8 thenOn:v9 then:v15];
  v11 = zalgo();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000397F4;
  v14[3] = &unk_1000C7688;
  v14[4] = self;
  id v12 = [v10 errorOn:v11 error:v14];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  v4 = [(FRUserOnboardingOperation *)self userOnboardingCompletionHandler];

  if (v4)
  {
    v5 = [(FRUserOnboardingOperation *)self userOnboardingCompletionHandler];
    BOOL v6 = [(FRUserOnboardingOperation *)self onboardingVersion];
    ((void (**)(void, id, id))v5)[2](v5, [v6 integerValue], v7);
  }
}

- (id)_determineUserID
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100039934;
  v4[3] = &unk_1000C76B0;
  v4[4] = self;
  id v2 = [objc_alloc((Class)NFPromise) initWithResolver:v4];

  return v2;
}

- (id)_refreshAppConfig
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100039B30;
  v4[3] = &unk_1000C76B0;
  v4[4] = self;
  id v2 = [objc_alloc((Class)NFPromise) initWithResolver:v4];

  return v2;
}

- (id)_refreshOnboardingVersion
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100039D84;
  v4[3] = &unk_1000C76B0;
  v4[4] = self;
  id v2 = [objc_alloc((Class)NFPromise) initWithResolver:v4];

  return v2;
}

- (id)_presubscribe
{
  v3 = [(FRUserOnboardingOperation *)self cloudContext];
  v4 = [v3 userInfo];
  v5 = [v4 onboardingVersionNumber];
  id v6 = [v5 integerValue];

  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003A070;
    v10[3] = &unk_1000C7610;
    v10[4] = self;
    sub_10003A070((uint64_t)v10);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003A158;
    v9[3] = &unk_1000C76B0;
    v9[4] = self;
    id v7 = [objc_alloc((Class)NFPromise) initWithResolver:v9];
  }

  return v7;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
}

- (FRAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (void)setAnalyticsController:(id)a3
{
}

- (FRPresubscribeService)presubscribeService
{
  return self->_presubscribeService;
}

- (void)setPresubscribeService:(id)a3
{
}

- (id)userOnboardingCompletionHandler
{
  return self->_userOnboardingCompletionHandler;
}

- (void)setUserOnboardingCompletionHandler:(id)a3
{
}

- (NSNumber)onboardingVersion
{
  return self->_onboardingVersion;
}

- (void)setOnboardingVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingVersion, 0);
  objc_storeStrong(&self->_userOnboardingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_presubscribeService, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);

  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end