@interface AppLaunchLocationAlert
- (BOOL)_shouldDisplayAlert;
- (void)_alertDidFinishProcessing;
- (void)_presentAlertUI;
- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3;
@end

@implementation AppLaunchLocationAlert

- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = [a3 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v4;

  unsigned int v6 = [(AppLaunchLocationAlert *)self _shouldDisplayAlert];
  v7 = sub_1000A930C();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AppLaunchLocationAlert: presenting alert", buf, 2u);
    }

    [(AppLaunchLocationAlert *)self _presentAlertUI];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AppLaunchLocationAlert: no need to be displayed", v9, 2u);
    }

    [(AppLaunchLocationAlert *)self _alertDidFinishProcessing];
  }
}

- (BOOL)_shouldDisplayAlert
{
  v2 = sub_1000A930C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = +[MKLocationManager sharedLocationManager];
    id v4 = [v3 locationProvider];
    v5 = +[MKLocationManager sharedLocationManager];
    unsigned int v6 = [v5 locationProvider];
    int v11 = 138412546;
    v12 = v4;
    __int16 v13 = 1024;
    unsigned int v14 = [v6 authorizationStatus];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "AppLaunchLocationAlert: location provider %@ status %d", (uint8_t *)&v11, 0x12u);
  }
  if (+[UIApplication _maps_isAnyCarPlayApplicationSceneForeground])
  {
    v7 = +[MKLocationManager sharedLocationManager];
    [v7 stopWaitingForAuthCallback];
  }
  BOOL v8 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v9 = [v8 isLocationServicesAuthorizationNeeded];

  return v9;
}

- (void)_presentAlertUI
{
  v3 = +[MKLocationManager sharedLocationManager];
  [v3 resetAfterResumeIfNecessary];

  id v4 = +[UIApplication sharedMapsDelegate];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100498EF0;
  v5[3] = &unk_1012E7D28;
  v5[4] = self;
  [v4 promptLocationServicesAuthorizationWithHandler:v5];
}

- (void)_alertDidFinishProcessing
{
  id completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    v5 = (void (**)(void))objc_retainBlock(completionBlock);
    id v4 = self->_completionBlock;
    self->_id completionBlock = 0;

    v5[2]();
  }
}

- (void).cxx_destruct
{
}

@end