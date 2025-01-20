@interface NDOScheduler
+ (id)newSchedulerWithActivityDelegate:(id)a3;
+ (void)clearScheduledActivities;
+ (void)scheduleActivityWithDelegate:(id)a3 forDate:(id)a4;
- ($334330880F6F150C3C7EE8C53B00592A)getScheduledActivityDateAndKey;
- (NDOSchedulerActivityDelegate)activityDelegate;
- (id)scheduledActivityDate;
- (void)_scheduleActivityWithDelay:(double)a3 forDate:(id)a4;
- (void)monitorForScheduledActivity;
- (void)performScheduledOutreachWithBlock:(id)a3;
- (void)scheduleActivityForDate:(id)a3;
- (void)scheduleActivityWithDelay:(double)a3;
- (void)setActivityDelegate:(id)a3;
@end

@implementation NDOScheduler

+ (id)newSchedulerWithActivityDelegate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 identifier];
  id v7 = [v5 initWithIdentifier:v6];

  [v7 setActivityDelegate:v4];
  return v7;
}

+ (void)scheduleActivityWithDelegate:(id)a3 forDate:(id)a4
{
  id v5 = a4;
  id v6 = +[NDOScheduler newSchedulerWithActivityDelegate:a3];
  [v6 scheduleActivityForDate:v5];
}

+ (void)clearScheduledActivities
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 dictionaryRepresentation];
  id v4 = [v3 allKeys];

  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v15;
    *(void *)&long long v6 = 138412290;
    long long v13 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasSuffix:", @".TargetDate", v13))
        {
          v11 = _NDOLogSystem();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v19 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Clearing %@", buf, 0xCu);
          }

          v12 = +[NSUserDefaults standardUserDefaults];
          [v12 removeObjectForKey:v10];
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)monitorForScheduledActivity
{
  v3 = _NDOLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NDOScheduler *)self identifier];
    *(_DWORD *)buf = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "monitorForScheduledActivity for '%@'", buf, 0xCu);
  }
  [(NDOScheduler *)self setPreregistered:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003340;
  v5[3] = &unk_10001C5E0;
  v5[4] = self;
  [(NDOScheduler *)self scheduleWithBlock:v5];
}

- (void)scheduleActivityWithDelay:(double)a3
{
  +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(NDOScheduler *)self _scheduleActivityWithDelay:v5 forDate:a3];
}

- (void)scheduleActivityForDate:(id)a3
{
  id v4 = a3;
  [v4 timeIntervalSinceNow];
  -[NDOScheduler _scheduleActivityWithDelay:forDate:](self, "_scheduleActivityWithDelay:forDate:", v4);
}

- (void)_scheduleActivityWithDelay:(double)a3 forDate:(id)a4
{
  id v6 = a4;
  id v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(NDOScheduler *)self identifier];
    v9 = [(NDOScheduler *)self activityDelegate];
    v10 = [v9 uuid];
    *(_DWORD *)buf = 138413058;
    v29 = v8;
    __int16 v30 = 2112;
    v31 = v10;
    __int16 v32 = 2048;
    double v33 = a3;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "scheduled '%@ (%@)' with delay: %.02f (%@)", buf, 0x2Au);
  }
  [(NDOScheduler *)self setPreregistered:0];
  [(NDOScheduler *)self setRepeats:0];
  [(NDOScheduler *)self setQualityOfService:9];
  if (a3 < 0.0)
  {
    v11 = _NDOLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(NDOScheduler *)self identifier];
      *(_DWORD *)buf = 138412290;
      v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "XPC activity delay is negative. Scheduling with zero delay (%@)", buf, 0xCu);
    }
    a3 = 0.0;
  }
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  long long v14 = v13;
  uint64_t v15 = 600;
  if ((uint64_t)a3 > 600) {
    uint64_t v15 = (uint64_t)a3;
  }
  if (v15 >= 14400) {
    int64_t v16 = 14400;
  }
  else {
    int64_t v16 = v15;
  }
  xpc_dictionary_set_int64(v13, XPC_ACTIVITY_GRACE_PERIOD, v16);
  xpc_dictionary_set_int64(v14, XPC_ACTIVITY_DELAY, (uint64_t)a3);
  long long v17 = (const char *)XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY;
  v18 = [(NDOScheduler *)self activityDelegate];
  xpc_dictionary_set_BOOL(v14, v17, (BOOL)[v18 requiresNetwork]);

  xpc_dictionary_set_string(v14, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  [(NDOScheduler *)self _setAdditionalXPCActivityProperties:v14];
  v19 = [(NDOScheduler *)self identifier];
  v20 = [(NDOScheduler *)self activityDelegate];
  v21 = [v20 uuid];

  if (v21)
  {
    v22 = [(NDOScheduler *)self activityDelegate];
    v23 = [v22 uuid];
    uint64_t v24 = [v19 stringByAppendingFormat:@"-%@", v23];

    v19 = (void *)v24;
  }
  v25 = +[NSUserDefaults standardUserDefaults];
  v26 = [v19 stringByAppendingString:@".TargetDate"];
  [v25 setObject:v6 forKey:v26];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000037A4;
  v27[3] = &unk_10001C5E0;
  v27[4] = self;
  [(NDOScheduler *)self scheduleWithBlock:v27];
}

- (id)scheduledActivityDate
{
  id v2 = [(NDOScheduler *)self getScheduledActivityDateAndKey];

  return v2;
}

- ($334330880F6F150C3C7EE8C53B00592A)getScheduledActivityDateAndKey
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 dictionaryRepresentation];
  id v5 = [v4 allKeys];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    v9 = 0;
    v10 = 0;
    uint64_t v11 = *(void *)v23;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v6);
        }
        xpc_object_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v14 = [(NDOScheduler *)self identifier];
        if (![v13 hasPrefix:v14]) {
          goto LABEL_13;
        }
        unsigned int v15 = [v13 hasSuffix:@".TargetDate"];

        if (!v15) {
          continue;
        }
        int64_t v16 = +[NSUserDefaults standardUserDefaults];
        long long v14 = [v16 objectForKey:v13];

        if (!v10)
        {
          id v18 = v14;
          goto LABEL_12;
        }
        if ([v14 compare:v10] == (id)-1)
        {
          id v17 = v14;

LABEL_12:
          id v19 = v13;

          v9 = v19;
          v10 = v14;
        }
LABEL_13:
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (!v8) {
        goto LABEL_18;
      }
    }
  }
  v9 = 0;
  v10 = 0;
LABEL_18:

  v20 = v10;
  v21 = v9;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (void)performScheduledOutreachWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(NDOScheduler *)self scheduledActivityDate];
  id v6 = _NDOLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(NDOScheduler *)self identifier];
    *(_DWORD *)buf = 138412546;
    long long v25 = v7;
    __int16 v26 = 2112;
    double v27 = *(double *)&v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "activity for '%@' should occur on: %@", buf, 0x16u);
  }
  [v5 timeIntervalSinceNow];
  double v9 = v8;
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_100003D74;
  v21 = &unk_10001C630;
  long long v22 = self;
  id v10 = v4;
  id v23 = v10;
  uint64_t v11 = objc_retainBlock(&v18);
  v12 = _NDOLogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9 <= 0.0)
  {
    if (v13)
    {
      int64_t v16 = [(NDOScheduler *)self identifier];
      *(_DWORD *)buf = 138412290;
      long long v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "target reached for '%@', trigger activity", buf, 0xCu);
    }
    id v17 = [(NDOScheduler *)self activityDelegate];
    [v17 performActivityForScheduler:self withCompletionHandler:v11];
  }
  else
  {
    if (v13)
    {
      long long v14 = [(NDOScheduler *)self identifier];
      *(_DWORD *)buf = 138412546;
      long long v25 = v14;
      __int16 v26 = 2048;
      double v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "target not past for '%@', reschedule for: %.02f", buf, 0x16u);
    }
    unsigned int v15 = [(NDOScheduler *)self activityDelegate];
    +[NDOScheduler scheduleActivityWithDelegate:v15 forDate:v5];

    ((void (*)(void ***, uint64_t))v11[2])(v11, 1);
  }
}

- (NDOSchedulerActivityDelegate)activityDelegate
{
  return (NDOSchedulerActivityDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setActivityDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end