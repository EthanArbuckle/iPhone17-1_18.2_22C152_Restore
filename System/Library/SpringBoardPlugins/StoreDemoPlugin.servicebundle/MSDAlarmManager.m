@interface MSDAlarmManager
+ (id)sharedInstance;
- (HKSPSleepStore)sleepStore;
- (MSDAlarmManager)init;
- (MTAlarmManager)mtAlarmManager;
- (id)getCurrentSleepAlarms;
- (void)disableAlarms;
- (void)disableSleepAlarm;
- (void)setMtAlarmManager:(id)a3;
- (void)setSleepStore:(id)a3;
@end

@implementation MSDAlarmManager

+ (id)sharedInstance
{
  if (qword_1E660 != -1) {
    dispatch_once(&qword_1E660, &stru_185E0);
  }
  v2 = (void *)qword_1E658;

  return v2;
}

- (MSDAlarmManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)MSDAlarmManager;
  v2 = [(MSDAlarmManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mtAlarmManager = v2->_mtAlarmManager;
    v2->_mtAlarmManager = (MTAlarmManager *)v3;

    uint64_t v5 = objc_opt_new();
    sleepStore = v2->_sleepStore;
    v2->_sleepStore = (HKSPSleepStore *)v5;

    if (!v2->_sleepStore)
    {
      v7 = sub_7CA4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_E748(v7);
      }
    }
    v8 = v2;
  }

  return v2;
}

- (id)getCurrentSleepAlarms
{
  uint64_t v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4)
  {
    uint64_t v5 = sub_7CA4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_E78C(v5);
    }

    v6 = 0;
  }
  else
  {
    v6 = [(MTAlarmManager *)self->_mtAlarmManager sleepAlarmsSync];
    if (!v6)
    {
      v6 = +[NSArray array];
    }
  }

  return v6;
}

- (void)disableSleepAlarm
{
  uint64_t v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4)
  {
    uint64_t v5 = sub_7CA4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_E8BC(v5);
    }
  }
  else
  {
    v6 = [(MSDAlarmManager *)self sleepStore];
    id v26 = 0;
    v7 = [v6 currentSleepScheduleWithError:&v26];
    uint64_t v5 = v26;

    id v8 = [v7 mutableCopy];
    v9 = v8;
    if (v7)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      objc_super v10 = [v8 occurrences];
      id v11 = [v10 countByEnumeratingWithState:&v22 objects:v29 count:16];
      if (v11)
      {
        id v12 = v11;
        v20 = v7;
        v21 = v5;
        uint64_t v13 = *(void *)v23;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "mutableCopy", v20, v21);
            v16 = [v15 alarmConfiguration];
            id v17 = [v16 mutableCopy];

            if ([v17 isEnabled])
            {
              [v17 setEnabled:0];
              v18 = sub_7CA4();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v28 = v17;
                _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, " Set mutableAlarmConfiguration enabled to NO : %{public}@", buf, 0xCu);
              }

              [v15 setAlarmConfiguration:v17];
              [v9 saveOccurrence:v15];
              v19 = [(MSDAlarmManager *)self sleepStore];
              [v19 saveCurrentSleepSchedule:v9 options:4 completion:&stru_18620];
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v22 objects:v29 count:16];
        }
        while (v12);
        v7 = v20;
        uint64_t v5 = v21;
      }
    }
    else
    {
      objc_super v10 = sub_7CA4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_E810(v5, v10);
      }
    }
  }
}

- (void)disableAlarms
{
  uint64_t v3 = [(MSDAlarmManager *)self mtAlarmManager];
  id v4 = [v3 alarmsSync];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    id v8 = v6;
    v9 = 0;
    uint64_t v10 = *(void *)v19;
    *(void *)&long long v7 = 138543362;
    long long v17 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEnabled", v17, (void)v18))
        {
          uint64_t v13 = sub_7CA4();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            long long v23 = v12;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Disabling alarm %{public}@", buf, 0xCu);
          }

          id v14 = [v12 mutableCopy];
          [v14 setEnabled:0];
          id v15 = [(MSDAlarmManager *)self mtAlarmManager];
          id v16 = [v15 updateAlarm:v14];

          v9 = v14;
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
}

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (void)setSleepStore:(id)a3
{
}

- (MTAlarmManager)mtAlarmManager
{
  return self->_mtAlarmManager;
}

- (void)setMtAlarmManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtAlarmManager, 0);

  objc_storeStrong((id *)&self->_sleepStore, 0);
}

@end