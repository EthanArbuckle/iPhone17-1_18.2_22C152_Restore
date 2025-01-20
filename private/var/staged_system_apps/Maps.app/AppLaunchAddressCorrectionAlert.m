@interface AppLaunchAddressCorrectionAlert
- (id)_actionsForPromptOptions:(id)a3;
- (id)_localizedStringForAddressCorrectionOutcome:(unint64_t)a3;
- (void)_alertDidFinishProcessing;
- (void)_displayAlert;
- (void)_fetchShouldDisplayAlertWithHandler:(id)a3;
- (void)cancelAlertIfNecessary;
- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3;
@end

@implementation AppLaunchAddressCorrectionAlert

- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = [a3 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v4;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1008FE104;
  v6[3] = &unk_1012E7D28;
  v6[4] = self;
  [(AppLaunchAddressCorrectionAlert *)self _fetchShouldDisplayAlertWithHandler:v6];
}

- (void)cancelAlertIfNecessary
{
  if (self->_isDisplayingAlert)
  {
    uint64_t Integer = GEOConfigGetInteger();
    id v4 = +[NSUserDefaults standardUserDefaults];
    unsigned int v5 = [v4 BOOLForKey:@"HasAcknowledgedAddressCorrectionAlert2021"];

    if (Integer) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      v7 = +[UIApplication sharedMapsDelegate];
      [v7 dismissCurrentInterruptionOfKind:17];

      [(AppLaunchAddressCorrectionAlert *)self _alertDidFinishProcessing];
    }
  }
}

- (id)_actionsForPromptOptions:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[AppLaunchAddressCorrectionAlert _localizedStringForAddressCorrectionOutcome:](self, "_localizedStringForAddressCorrectionOutcome:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "unsignedIntegerValue", (void)v14));
        v12 = +[MapsInterruptionAction actionWithTitle:v11 cancels:0 handler:0];
        [v5 addObject:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_localizedStringForAddressCorrectionOutcome:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"AddressCorrection_Permission_LearnMore";
      goto LABEL_7;
    case 2uLL:
      v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"AddressCorrection_Permission_DontAllow";
      goto LABEL_7;
    case 1uLL:
      v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"AddressCorrection_Permission_Allow";
LABEL_7:
      id v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      goto LABEL_9;
  }
  id v6 = 0;
LABEL_9:

  return v6;
}

- (void)_fetchShouldDisplayAlertWithHandler:(id)a3
{
  v3 = (void (**)(id, void))a3;
  id v4 = +[MKLocationManager sharedLocationManager];
  unsigned int v5 = [v4 isLocationServicesAuthorizationNeeded];

  id v6 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v7 = [v6 isLocationServicesApproved];

  if (v5 || (v7 & 1) == 0 || [UIApp launchedToTest])
  {
    v3[2](v3, 0);
  }
  else
  {
    id v8 = +[MCProfileConnection sharedConnection];
    if ([v8 userMode] == 1
      || [v8 isEphemeralMultiUser]
      || (uint64_t Integer = GEOConfigGetInteger(),
          +[NSUserDefaults standardUserDefaults],
          v10 = objc_claimAutoreleasedReturnValue(),
          unsigned int v11 = [v10 BOOLForKey:@"HasAcknowledgedAddressCorrectionAlert2021"],
          v10,
          Integer)
      && v11
      || (MGGetBoolAnswer() & 1) == 0)
    {
      v3[2](v3, 0);
    }
    else
    {
      v12 = v3;
      GEORegisterNetworkDefaults();
    }
  }
}

- (void)_displayAlert
{
  v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  unsigned int v5 = +[NSBundle mainBundle];
  id v6 = v5;
  BOOL v7 = v4 != (id)5;
  if (v4 == (id)5) {
    CFStringRef v8 = @"AddressCorrection_Permission_Message (macOS)";
  }
  else {
    CFStringRef v8 = @"AddressCorrection_Permission_Message (iOS)";
  }
  if (v4 == (id)5) {
    uint64_t v9 = &off_1013AE268;
  }
  else {
    uint64_t v9 = &off_1013AE280;
  }
  v10 = [v5 localizedStringForKey:v8 value:@"localized string not found" table:0];

  v20[0] = @"kMapsInterruptionTitle";
  unsigned int v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"AddressCorrection_Permission_Title" value:@"localized string not found" table:0];
  v21[0] = v12;
  v21[1] = v10;
  v20[1] = @"kMapsInterruptionMessage";
  v20[2] = @"kMapsInterruptionActions";
  v13 = [(AppLaunchAddressCorrectionAlert *)self _actionsForPromptOptions:v9];
  v21[2] = v13;
  long long v14 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

  long long v15 = +[UIApplication sharedMapsDelegate];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1008FEAA0;
  v16[3] = &unk_101300558;
  BOOL v19 = v7;
  id v17 = v9;
  v18 = self;
  [v15 interruptApplicationWithKind:17 userInfo:v14 completionHandler:v16];
}

- (void)_alertDidFinishProcessing
{
  v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AppLaunchAddressCorrectionAlert: alert dismissed", v7, 2u);
  }

  self->_isDisplayingAlert = 0;
  id completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    unsigned int v5 = (void (**)(void))objc_retainBlock(completionBlock);
    id v6 = self->_completionBlock;
    self->_id completionBlock = 0;

    v5[2](v5);
  }
}

- (void).cxx_destruct
{
}

@end