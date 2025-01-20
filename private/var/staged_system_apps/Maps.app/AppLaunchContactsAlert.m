@interface AppLaunchContactsAlert
- (BOOL)_shouldDisplayAlert;
- (void)_alertDidFinishProcessing;
- (void)_contactsAuthorizationDismissed;
- (void)_presentAlertUI;
- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3;
@end

@implementation AppLaunchContactsAlert

- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = [a3 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v4;

  unsigned int v6 = [(AppLaunchContactsAlert *)self _shouldDisplayAlert];
  v7 = sub_1000A930C();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AppLaunchContactsAlert: presenting alert", buf, 2u);
    }

    [(AppLaunchContactsAlert *)self _presentAlertUI];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AppLaunchContactsAlert: no need to be displayed", v9, 2u);
    }

    [(AppLaunchContactsAlert *)self _alertDidFinishProcessing];
  }
}

- (BOOL)_shouldDisplayAlert
{
  CNAuthorizationStatus v2 = +[CNContactStore authorizationStatusForEntityType:0];
  v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    CNAuthorizationStatus v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AppLaunchContactsAlert: status %ld", (uint8_t *)&v5, 0xCu);
  }

  return v2 == CNAuthorizationStatusNotDetermined;
}

- (void)_presentAlertUI
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init((Class)CNContactStore);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007677C4;
  v4[3] = &unk_1012F7AE8;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  [v3 requestAccessForEntityType:0 completionHandler:v4];
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

- (void)_contactsAuthorizationDismissed
{
  id v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AppLaunchContactsAlert: alert dismissed", v4, 2u);
  }

  [(AppLaunchContactsAlert *)self _alertDidFinishProcessing];
}

- (void)_alertDidFinishProcessing
{
  id completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    id v5 = (void (**)(void))objc_retainBlock(completionBlock);
    id v4 = self->_completionBlock;
    self->_id completionBlock = 0;

    v5[2]();
  }
}

- (void).cxx_destruct
{
}

@end