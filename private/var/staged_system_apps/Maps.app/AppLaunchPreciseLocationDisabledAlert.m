@interface AppLaunchPreciseLocationDisabledAlert
- (BOOL)_shouldDisplayAlert;
- (void)_alertDidFinishProcessing;
- (void)_presentAlertUI;
- (void)cancelAlertIfNecessary;
- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3;
@end

@implementation AppLaunchPreciseLocationDisabledAlert

- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = [a3 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v4;

  unsigned int v6 = [(AppLaunchPreciseLocationDisabledAlert *)self _shouldDisplayAlert];
  v7 = sub_1000A930C();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AppLaunchPreciseLocationDisabledAlert: presenting alert", buf, 2u);
    }

    [(AppLaunchPreciseLocationDisabledAlert *)self _presentAlertUI];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AppLaunchPreciseLocationDisabledAlert: no need to be displayed", v9, 2u);
    }

    [(AppLaunchPreciseLocationDisabledAlert *)self _alertDidFinishProcessing];
  }
}

- (void)cancelAlertIfNecessary
{
  id v2 = +[UIApplication sharedMapsDelegate];
  [v2 dismissCurrentInterruptionOfKind:15];
}

- (BOOL)_shouldDisplayAlert
{
  if (GEOConfigGetBOOL()) {
    return 0;
  }
  v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = +[MKLocationManager sharedLocationManager];
    v5 = [v4 locationProvider];
    unsigned int v6 = +[MKLocationManager sharedLocationManager];
    int v11 = 138412546;
    v12 = v5;
    __int16 v13 = 2048;
    uint64_t v14 = [v6 isAuthorizedForPreciseLocation];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AppLaunchPreciseLocationDisabledAlert: location provider %@ is authorized for precise location: %lu", (uint8_t *)&v11, 0x16u);
  }
  v7 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v8 = [v7 isLocationServicesApproved];

  v9 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v10 = [v9 isAuthorizedForPreciseLocation];

  return v8 & (v10 ^ 1);
}

- (void)_presentAlertUI
{
  v3 = +[UIApplication sharedMapsDelegate];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10057EFF8;
  v4[3] = &unk_1012E8E50;
  v4[4] = self;
  [v3 interruptApplicationWithKind:15 userInfo:0 completionHandler:v4];
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