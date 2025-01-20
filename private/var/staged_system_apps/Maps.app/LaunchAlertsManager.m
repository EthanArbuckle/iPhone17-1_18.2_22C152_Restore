@interface LaunchAlertsManager
- (BOOL)currentlyShowingAlert;
- (LaunchAlertsManager)init;
- (LaunchAlertsManagerDelegate)delegate;
- (id)_getAlertObjectOfType:(int64_t)a3;
- (void)_currentAlertDidFinish;
- (void)_executeNextAlert;
- (void)cancelVisibleAlertIfNecessary;
- (void)enqueueAlert:(int64_t)a3;
- (void)executeAlertsIfNecessary;
- (void)setDelegate:(id)a3;
@end

@implementation LaunchAlertsManager

- (LaunchAlertsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)LaunchAlertsManager;
  v2 = [(LaunchAlertsManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableOrderedSet orderedSet];
    alerts = v2->_alerts;
    v2->_alerts = (NSMutableOrderedSet *)v3;
  }
  return v2;
}

- (void)enqueueAlert:(int64_t)a3
{
  if (([UIApp launchedToTest] & 1) == 0 && (GEOConfigGetBOOL() & 1) == 0)
  {
    alerts = self->_alerts;
    objc_super v6 = +[NSNumber numberWithInteger:a3];
    LOBYTE(alerts) = [(NSMutableOrderedSet *)alerts containsObject:v6];

    if ((alerts & 1) == 0)
    {
      v7 = self->_alerts;
      v8 = +[NSNumber numberWithInteger:a3];
      [(NSMutableOrderedSet *)v7 addObject:v8];

      v9 = sub_1000A930C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = +[NSNumber numberWithInteger:a3];
        int v11 = 138412290;
        v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "LaunchAlertsManager: enqueueAlert %@", (uint8_t *)&v11, 0xCu);
      }
    }
    [(LaunchAlertsManager *)self executeAlertsIfNecessary];
  }
}

- (void)executeAlertsIfNecessary
{
  uint64_t v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "LaunchAlertsManager: executeAlertsIfNecessary", buf, 2u);
  }

  if (!self->_processingAlert)
  {
    self->_processingAlert = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D66608;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)cancelVisibleAlertIfNecessary
{
  if (objc_opt_respondsToSelector())
  {
    currentAlert = self->_currentAlert;
    [(DisplayAlert *)currentAlert cancelAlertIfNecessary];
  }
}

- (BOOL)currentlyShowingAlert
{
  return self->_processingAlert;
}

- (void)_executeNextAlert
{
  if ([(NSMutableOrderedSet *)self->_alerts count])
  {
    uint64_t v3 = [(NSMutableOrderedSet *)self->_alerts firstObject];
    id v4 = [v3 integerValue];

    [(NSMutableOrderedSet *)self->_alerts removeObjectAtIndex:0];
    v5 = [(LaunchAlertsManager *)self _getAlertObjectOfType:v4];
    currentAlert = self->_currentAlert;
    self->_currentAlert = v5;

    v7 = sub_1000A930C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "LaunchAlertsManager: handling %@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v10 = self->_currentAlert;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100D66890;
    v13[3] = &unk_1012E6708;
    objc_copyWeak(&v14, (id *)buf);
    [(DisplayAlert *)v10 displayAlertIfNecessaryWithCompletionHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    int v11 = sub_1000A930C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "LaunchAlertsManager: alerts processed", buf, 2u);
    }

    *(_WORD *)&self->_alertsProcessed = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained launchAlertsManagerDidFinishProcessingAlert:self];
  }
}

- (void)_currentAlertDidFinish
{
  currentAlert = self->_currentAlert;
  self->_currentAlert = 0;

  [(LaunchAlertsManager *)self _executeNextAlert];
}

- (id)_getAlertObjectOfType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v3 = AppLaunchLocationAlert;
      goto LABEL_12;
    case 1:
      uint64_t v3 = AppLaunchPreciseLocationDisabledAlert;
      goto LABEL_12;
    case 2:
      uint64_t v3 = AppLaunchAddressCorrectionAlert;
      goto LABEL_12;
    case 3:
      uint64_t v3 = AppLaunchNavTraceAlert;
      goto LABEL_12;
    case 4:
      uint64_t v3 = AppLaunchContactsAlert;
      goto LABEL_12;
    case 5:
      uint64_t v3 = AppLaunchNotifcationPrewarmAlert;
      goto LABEL_12;
    case 6:
      uint64_t v3 = AppLaunchHikingAlert;
LABEL_12:
      id v5 = objc_alloc_init(v3);
      break;
    default:
      id v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Unknown Launch Alert Type passed!", v7, 2u);
      }

      id v5 = 0;
      break;
  }

  return v5;
}

- (LaunchAlertsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LaunchAlertsManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentAlert, 0);

  objc_storeStrong((id *)&self->_alerts, 0);
}

@end