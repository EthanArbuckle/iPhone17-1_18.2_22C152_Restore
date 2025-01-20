@interface FRNotificationAutoEnableHelper
- (FRFeldsparContext)feldsparContext;
- (FRNotificationAutoEnableHelper)initWithFeldsparContext:(id)a3;
- (void)_fetchPreSubscribedChannelsWithCompletion:(id)a3;
- (void)autoEnableNotificationsForPreSubscribedChannels;
- (void)setFeldsparContext:(id)a3;
@end

@implementation FRNotificationAutoEnableHelper

- (FRNotificationAutoEnableHelper)initWithFeldsparContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FRNotificationAutoEnableHelper;
  v6 = [(FRNotificationAutoEnableHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_feldsparContext, a3);
  }

  return v7;
}

- (void)autoEnableNotificationsForPreSubscribedChannels
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002EAB4;
  v2[3] = &unk_1000C6390;
  v2[4] = self;
  [(FRNotificationAutoEnableHelper *)self _fetchPreSubscribedChannelsWithCompletion:v2];
}

- (void)_fetchPreSubscribedChannelsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FRNotificationAutoEnableHelper *)self feldsparContext];
  v6 = [v5 cloudContext];
  v7 = [v6 networkReachability];

  if ([v7 isCloudKitReachable])
  {
    v8 = [(FRNotificationAutoEnableHelper *)self feldsparContext];
    objc_super v9 = [v8 cloudContext];
    v10 = [v9 appConfigurationManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002ED74;
    v12[3] = &unk_1000C63E0;
    v12[4] = self;
    id v13 = v4;
    [v10 fetchAppConfigurationIfNeededWithCompletion:v12];
  }
  else
  {
    v11 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
      sub_100072B5C(v11);
    }
  }
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
}

@end