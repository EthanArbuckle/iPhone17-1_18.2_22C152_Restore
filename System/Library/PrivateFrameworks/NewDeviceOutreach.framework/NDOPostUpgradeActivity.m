@interface NDOPostUpgradeActivity
- (BOOL)requiresNetwork;
- (BOOL)shouldTriggerWarrantyDownload;
- (NSString)identifier;
- (NSString)uuid;
- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation NDOPostUpgradeActivity

- (NSString)uuid
{
  return 0;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.ndoagent.upgrade";
}

- (BOOL)requiresNetwork
{
  return 1;
}

- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4
{
  v5 = (void (**)(id, uint64_t))a4;
  v6 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v7 = [v6 BOOLForKey:@"PostUpgradeActivityCompleted"];

  if ((v7 & 1) == 0)
  {
    v19 = _NDOLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v42) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "post upgrade activity hasn't yet been performed, perform upgrade activity", (uint8_t *)&v42, 2u);
    }

    v20 = objc_opt_new();
    v21 = [v20 aida_accountForPrimaryiCloudAccount];
    +[NDOScheduler clearScheduledActivities];
    v22 = +[NSUserDefaults standardUserDefaults];
    v23 = [v22 objectForKey:@"DefaultDeviceActivationDate"];

    if (v23)
    {
      if (v21) {
        goto LABEL_11;
      }
    }
    else
    {
      v29 = +[NSUserDefaults standardUserDefaults];
      v30 = +[NSDate date];
      [v29 setObject:v30 forKey:@"DefaultDeviceActivationDate"];

      if (v21)
      {
LABEL_11:
        v24 = objc_opt_new();
        v25 = +[NSDate date];
        +[NDOScheduler scheduleActivityWithDelegate:v24 forDate:v25];

        v26 = +[NSUserDefaults standardUserDefaults];
        [v26 setBool:1 forKey:@"InitialOutreachActivityScheduled"];

        v27 = +[NSUserDefaults standardUserDefaults];
        [v27 setBool:1 forKey:@"PostUpgradeActivityCompleted"];

        v28 = _NDOLogSystem();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v42) = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Primary account detected. Executing upgrade activity and scheduled outreach", (uint8_t *)&v42, 2u);
        }
LABEL_19:

        goto LABEL_24;
      }
    }
    v31 = +[NSUserDefaults standardUserDefaults];
    [v31 doubleForKey:@"PostUpgradeActivityDelay"];
    double v33 = v32;

    v34 = +[NSDate date];
    v28 = [v34 dateByAddingTimeInterval:v33];

    +[NDOScheduler scheduleActivityWithDelegate:self forDate:v28];
    v35 = _NDOLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      int v42 = 138412290;
      v43 = (const char *)v28;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "No primary account detected. Rescheduling upgrade activity to %@ without scheduling outreach", (uint8_t *)&v42, 0xCu);
    }

    goto LABEL_19;
  }
  if ([(NDOPostUpgradeActivity *)self shouldTriggerWarrantyDownload])
  {
    v8 = +[NSUserDefaults standardUserDefaults];
    v9 = [v8 objectForKey:@"DefaultDeviceActivationDate"];

    if (!v9)
    {
      v10 = +[NSUserDefaults standardUserDefaults];
      v11 = +[NSDate date];
      [v10 setObject:v11 forKey:@"DefaultDeviceActivationDate"];
    }
    v12 = +[NSUserDefaults standardUserDefaults];
    [v12 doubleForKey:@"UpgradeOutreachDelayMaxRange"];
    double v14 = v13;

    if (v14 == 0.0)
    {
      uint32_t v18 = 120;
    }
    else
    {
      v15 = +[NSUserDefaults standardUserDefaults];
      [v15 doubleForKey:@"UpgradeOutreachDelayMaxRange"];
      double v17 = v16;

      uint32_t v18 = v17;
    }
    double v36 = (double)(60 * arc4random_uniform(v18));
    v37 = _NDOLogSystem();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      int v42 = 136446466;
      v43 = "-[NDOPostUpgradeActivity performActivityForScheduler:withCompletionHandler:]";
      __int16 v44 = 2048;
      double v45 = v36;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}s: Firing upgrade outreach after %f seconds", (uint8_t *)&v42, 0x16u);
    }

    v20 = objc_opt_new();
    v38 = +[NSDate date];
    v39 = [v38 dateByAddingTimeInterval:v36];
    +[NDOScheduler scheduleActivityWithDelegate:v20 forDate:v39];
  }
  else
  {
    v20 = _NDOLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v42) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "post upgrade activity already performed", (uint8_t *)&v42, 2u);
    }
  }
LABEL_24:

  v40 = (void *)MGCopyAnswer();
  if (v40)
  {
    v41 = +[NSUserDefaults standardUserDefaults];
    [v41 setObject:v40 forKey:@"PostUpgradeOSVersionKey"];
  }
  else
  {
    v41 = _NDOLogSystem();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100011654(v41);
    }
  }

  v5[2](v5, 1);
}

- (BOOL)shouldTriggerWarrantyDownload
{
  v2 = objc_opt_new();
  id v3 = +[NDOScheduler newSchedulerWithActivityDelegate:v2];

  v4 = (void *)MGCopyAnswer();
  v5 = +[NSUserDefaults standardUserDefaults];
  v6 = [v5 stringForKey:@"PostUpgradeOSVersionKey"];

  if (v6) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (v6) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v4 == 0;
    }
    if (v8) {
      goto LABEL_12;
    }
LABEL_10:
    v9 = [v3 scheduledActivityDate];
    BOOL v10 = v9 == 0;

    goto LABEL_13;
  }
  if ([v4 compare:v6 options:64] == (id)1) {
    goto LABEL_10;
  }
LABEL_12:
  BOOL v10 = 0;
LABEL_13:
  v11 = +[NSUserDefaults standardUserDefaults];
  [v11 doubleForKey:@"UpgradeOutreachDelayMaxRange"];
  double v13 = v12;

  BOOL v14 = v13 != 0.0 || v10;
  return v14;
}

@end