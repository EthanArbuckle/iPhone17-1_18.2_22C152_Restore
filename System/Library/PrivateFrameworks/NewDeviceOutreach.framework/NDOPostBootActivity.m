@interface NDOPostBootActivity
- (BOOL)requiresNetwork;
- (NSString)identifier;
- (NSString)uuid;
- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation NDOPostBootActivity

- (NSString)uuid
{
  return 0;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.ndoagent.boot";
}

- (BOOL)requiresNetwork
{
  return 0;
}

- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4
{
  v4 = (void (**)(id, uint64_t))a4;
  v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"PostUpgradeActivityCompleted"];

  v7 = _NDOLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(v38) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Running post boot activity", (uint8_t *)&v38, 2u);
    }

    v9 = objc_opt_new();
    v7 = +[NDOScheduler newSchedulerWithActivityDelegate:v9];

    v10 = [v7 scheduledActivityDate];

    if (v10)
    {
      v11 = _NDOLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [v7 identifier];
        int v38 = 138412290;
        v39 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "'%@' not complete, rescheduling", (uint8_t *)&v38, 0xCu);
      }
      v13 = [v7 scheduledActivityDate];
      [v7 scheduleActivityForDate:v13];
    }
    v14 = objc_opt_new();
    id v15 = +[NDOScheduler newSchedulerWithActivityDelegate:v14];

    v16 = [v15 scheduledActivityDate];

    if (v16)
    {
      v17 = _NDOLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v15 identifier];
        int v38 = 138412290;
        v39 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "'%@' not complete, rescheduling", (uint8_t *)&v38, 0xCu);
      }
      v19 = [v15 scheduledActivityDate];
      [v15 scheduleActivityForDate:v19];
    }
    v20 = objc_opt_new();
    id v21 = +[NDOScheduler newSchedulerWithActivityDelegate:v20];

    v22 = [v21 scheduledActivityDate];

    if (v22)
    {
      v23 = _NDOLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [v21 identifier];
        int v38 = 138412290;
        v39 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "'%@' not complete, rescheduling", (uint8_t *)&v38, 0xCu);
      }
      v25 = [v21 scheduledActivityDate];
      [v21 scheduleActivityForDate:v25];
    }
    v26 = objc_opt_new();
    id v27 = +[NDOScheduler newSchedulerWithActivityDelegate:v26];

    v28 = [v27 scheduledActivityDate];

    if (v28)
    {
      v29 = _NDOLogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = [v27 identifier];
        int v38 = 138412290;
        v39 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "'%@' not complete, rescheduling", (uint8_t *)&v38, 0xCu);
      }
      v31 = [v27 scheduledActivityDate];
      [v27 scheduleActivityForDate:v31];
    }
    v32 = objc_opt_new();
    id v33 = +[NDOScheduler newSchedulerWithActivityDelegate:v32];

    v34 = [v33 scheduledActivityDate];

    if (v34)
    {
      v35 = _NDOLogSystem();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [v33 identifier];
        int v38 = 138412290;
        v39 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "'%@' not complete, rescheduling", (uint8_t *)&v38, 0xCu);
      }
      v37 = [v33 scheduledActivityDate];
      [v33 scheduleActivityForDate:v37];
    }
  }
  else if (v8)
  {
    LOWORD(v38) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "post upgrade activity hasn't yet been performed, skip boot activity", (uint8_t *)&v38, 2u);
  }

  v4[2](v4, 1);
}

@end