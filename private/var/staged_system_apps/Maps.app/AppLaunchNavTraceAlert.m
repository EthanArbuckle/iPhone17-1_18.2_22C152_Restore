@interface AppLaunchNavTraceAlert
- (BOOL)_shouldDisplayAlert;
- (void)_alertDidFinishProcessing;
- (void)_displayAlert;
- (void)cancelAlertIfNecessary;
- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3;
@end

@implementation AppLaunchNavTraceAlert

- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = [a3 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v4;

  unsigned int v6 = [(AppLaunchNavTraceAlert *)self _shouldDisplayAlert];
  v7 = sub_1000A930C();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AppLaunchNavTraceAlert: presenting alert", buf, 2u);
    }

    self->_isDisplayingAlert = 1;
    [(AppLaunchNavTraceAlert *)self _displayAlert];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AppLaunchNavTraceAlert: no need to be displayed", v9, 2u);
    }

    [(AppLaunchNavTraceAlert *)self _alertDidFinishProcessing];
  }
}

- (void)cancelAlertIfNecessary
{
  if (self->_isDisplayingAlert && GEOConfigGetInteger() != 2)
  {
    v3 = +[UIApplication sharedMapsDelegate];
    [v3 dismissCurrentInterruptionOfKind:16];

    [(AppLaunchNavTraceAlert *)self _alertDidFinishProcessing];
  }
}

- (BOOL)_shouldDisplayAlert
{
  BOOL result = ([UIApp launchedToTest] & 1) == 0
        && (+[GEOPlatform sharedPlatform],
            v2 = objc_claimAutoreleasedReturnValue(),
            unsigned int v3 = [v2 isInternalInstall],
            v2,
            v3)
        && GEOConfigGetInteger() == 2;
  return result;
}

- (void)_displayAlert
{
  v10[0] = @"kMapsInterruptionTitle";
  v10[1] = @"kMapsInterruptionMessage";
  v11[0] = @"Automatically send your navigation trace logs to Apple?";
  v11[1] = @"These detailed logs will include timestamps and your device's approximate location as it travels along a requested route start and end points. You can disable the sending of these logs from Settings > Internal Settings > Maps.";
  v10[2] = @"kMapsInterruptionActions";
  unsigned int v3 = +[MapsInterruptionAction actionWithTitle:@"Accept" cancels:0 handler:0];
  v9[0] = v3;
  id v4 = +[MapsInterruptionAction actionWithTitle:@"Decline" cancels:1 handler:0];
  v9[1] = v4;
  v5 = +[NSArray arrayWithObjects:v9 count:2];
  v11[2] = v5;
  unsigned int v6 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  v7 = +[UIApplication sharedMapsDelegate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008865B0;
  v8[3] = &unk_1012E8E50;
  v8[4] = self;
  [v7 interruptApplicationWithKind:16 userInfo:v6 completionHandler:v8];
}

- (void)_alertDidFinishProcessing
{
  unsigned int v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AppLaunchNavTraceAlert: alert dismissed", v7, 2u);
  }

  self->_isDisplayingAlert = 0;
  id completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    v5 = (void (**)(void))objc_retainBlock(completionBlock);
    id v6 = self->_completionBlock;
    self->_id completionBlock = 0;

    v5[2](v5);
  }
}

- (void).cxx_destruct
{
}

@end