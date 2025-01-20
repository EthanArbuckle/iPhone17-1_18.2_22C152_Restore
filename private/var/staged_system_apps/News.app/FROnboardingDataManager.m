@interface FROnboardingDataManager
- (FRFeldsparContext)feldsparContext;
- (FROnboardingDataManager)initWithFeldsparContext:(id)a3;
- (TSWelcomeDataManagerTypeDelegate)delegate;
- (void)beginFetchingUserType;
- (void)beginLoadingFeed;
- (void)completeOnboarding;
- (void)setDelegate:(id)a3;
- (void)setFeldsparContext:(id)a3;
- (void)suspendLoadingFeed;
@end

@implementation FROnboardingDataManager

- (FROnboardingDataManager)initWithFeldsparContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FROnboardingDataManager;
  v6 = [(FROnboardingDataManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_feldsparContext, a3);
  }

  return v7;
}

- (void)suspendLoadingFeed
{
  v2 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FROnboardingDataManager: suspendLoadingFeed", v3, 2u);
  }
}

- (void)beginFetchingUserType
{
  v3 = objc_alloc_init(FRUserOnboardingOperation);
  v4 = [(FROnboardingDataManager *)self feldsparContext];
  id v5 = [v4 cloudContext];
  [(FRUserOnboardingOperation *)v3 setCloudContext:v5];

  v6 = [(FROnboardingDataManager *)self feldsparContext];
  v7 = [v6 analyticsController];
  [(FRUserOnboardingOperation *)v3 setAnalyticsController:v7];

  v8 = [(FROnboardingDataManager *)self feldsparContext];
  objc_super v9 = [v8 presubscribeService];
  [(FRUserOnboardingOperation *)v3 setPresubscribeService:v9];

  [(FRUserOnboardingOperation *)v3 setQualityOfService:25];
  [(FRUserOnboardingOperation *)v3 setRelativePriority:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005A964;
  v11[3] = &unk_1000C9940;
  v11[4] = self;
  [(FRUserOnboardingOperation *)v3 setUserOnboardingCompletionHandler:v11];
  v10 = +[NSOperationQueue fc_sharedConcurrentQueue];
  [v10 addOperation:v3];
}

- (void)beginLoadingFeed
{
  v2 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FROnboardingDataManager: beginLoadingFeed", buf, 2u);
  }
  FCPerformBlockOnMainThread();
}

- (void)completeOnboarding
{
  v3 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FROnboardingDataManager: completedOnboarding", v7, 2u);
  }
  v4 = [(FROnboardingDataManager *)self feldsparContext];
  id v5 = [v4 cloudContext];
  v6 = [v5 userInfo];
  [v6 updateOnboardingVersion];
}

- (TSWelcomeDataManagerTypeDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (void)setFeldsparContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feldsparContext, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end