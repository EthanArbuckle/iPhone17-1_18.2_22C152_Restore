@interface AppLaunchHikingAlert
- (BOOL)_shouldDisplayAlert;
- (void)_alertDidFinishProcessing;
- (void)_presentAlertUI;
- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3;
@end

@implementation AppLaunchHikingAlert

- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = [a3 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v4;

  unsigned int v6 = [(AppLaunchHikingAlert *)self _shouldDisplayAlert];
  v7 = sub_1000A930C();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AppLaunchHikingAlert: presenting alert", buf, 2u);
    }

    [(AppLaunchHikingAlert *)self _presentAlertUI];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AppLaunchHikingAlert: no need to be displayed", v9, 2u);
    }

    [(AppLaunchHikingAlert *)self _alertDidFinishProcessing];
  }
}

- (BOOL)_shouldDisplayAlert
{
  int IsEnabled_HikingiOS = MapsFeature_IsEnabled_HikingiOS();
  if (IsEnabled_HikingiOS)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 BOOLForKey:@"HikingWelcomeScreenDisplayed"];

    if (v4)
    {
      v5 = sub_1000A930C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = 0;
        unsigned int v6 = "AppLaunchHikingAlert: Welcome screen has already been shown";
        v7 = (uint8_t *)&v13;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
    if (+[UIApplication _maps_isAnySceneConnectedForRole:_UIWindowSceneSessionRoleCarPlay])
    {
      v5 = sub_1000A930C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __int16 v12 = 0;
        unsigned int v6 = "AppLaunchHikingAlert: Not displaying because connected to CarPlay";
        v7 = (uint8_t *)&v12;
        goto LABEL_12;
      }
LABEL_13:

      LOBYTE(IsEnabled_HikingiOS) = 0;
      return IsEnabled_HikingiOS;
    }
    BOOL v8 = +[GEOCountryConfiguration sharedConfiguration];
    unsigned __int8 v9 = [v8 currentCountrySupportsCustomRouteCreation];

    if ((v9 & 1) == 0)
    {
      v5 = sub_1000A930C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = 0;
        unsigned int v6 = "AppLaunchHikingAlert: Current country doesn't support custom route creation";
        v7 = (uint8_t *)&v11;
        goto LABEL_12;
      }
      goto LABEL_13;
    }
    LOBYTE(IsEnabled_HikingiOS) = 1;
  }
  return IsEnabled_HikingiOS;
}

- (void)_presentAlertUI
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003D0988;
  v7[3] = &unk_1012E5D08;
  v7[4] = self;
  v3 = [[_TtC4Maps27HikingWelcomeViewController alloc] initWithCompletionHandler:v7];
  hikingWelcomeViewController = self->_hikingWelcomeViewController;
  self->_hikingWelcomeViewController = v3;

  v5 = +[UIApplication sharedMapsDelegate];
  unsigned int v6 = [v5 chromeViewController];
  [v6 _maps_topMostPresentViewController:self->_hikingWelcomeViewController animated:1 completion:0];
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
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_hikingWelcomeViewController, 0);
}

@end