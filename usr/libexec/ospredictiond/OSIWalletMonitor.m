@interface OSIWalletMonitor
+ (id)wallet;
- (OSIWalletMonitor)init;
- (OS_os_log)log;
- (id)relevantEventDeadline;
- (void)passLibraryDidChange:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation OSIWalletMonitor

+ (id)wallet
{
  v2 = (void *)qword_10007A848;
  if (!qword_10007A848)
  {
    id v3 = objc_alloc_init((Class)PKPassLibrary);
    v4 = (void *)qword_10007A848;
    qword_10007A848 = (uint64_t)v3;

    v2 = (void *)qword_10007A848;
  }

  return v2;
}

- (OSIWalletMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)OSIWalletMonitor;
  v2 = [(OSIWalletMonitor *)&v8 init];
  os_log_t v3 = os_log_create("com.apple.osintelligence", "walletmonitor");
  log = v2->_log;
  v2->_log = (OS_os_log *)v3;

  id v5 = +[OSIWalletMonitor wallet];
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:v2 selector:"passLibraryDidChange:" name:PKPassLibraryDidChangeNotification object:0];

  return v2;
}

- (void)passLibraryDidChange:(id)a3
{
  v4 = [(OSIWalletMonitor *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Boarding pass has changed", buf, 2u);
  }

  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EE7C;
  block[3] = &unk_100064B48;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)relevantEventDeadline
{
  v2 = +[OSIWalletMonitor wallet];
  os_log_t v3 = [v2 passesOfType:0];

  v4 = +[NSDate date];
  dispatch_time_t v5 = [v4 dateByAddingTimeInterval:-10800.0];
  v6 = [v4 dateByAddingTimeInterval:86400.0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v12 style] == (id)4)
        {
          v13 = [v12 relevantDate];

          if (v13)
          {
            v14 = [v12 relevantDate];
            [v14 timeIntervalSinceDate:v5];
            if (v15 < 0.0)
            {
            }
            else
            {
              v16 = [v12 relevantDate];
              [v16 timeIntervalSinceDate:v6];
              double v18 = v17;

              if (v18 <= 0.0)
              {
                log = self->_log;
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  v22 = log;
                  v23 = [v12 localizedName];
                  v24 = [v12 relevantDate];
                  *(_DWORD *)buf = 138412546;
                  v32 = v23;
                  __int16 v33 = 2112;
                  v34 = v24;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found pass, forcing immediate charge: %@, %@", buf, 0x16u);
                }
                v19 = [v12 relevantDate];

                goto LABEL_18;
              }
            }
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v19 = +[NSDate distantFuture];
LABEL_18:

  return v19;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end