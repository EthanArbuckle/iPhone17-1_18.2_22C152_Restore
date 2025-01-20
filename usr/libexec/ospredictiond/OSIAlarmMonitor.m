@interface OSIAlarmMonitor
- (MTAlarmManager)alarmManager;
- (OSIAlarmMonitor)init;
- (id)nextAlarmFireDateBetweenDate:(id)a3 andDate:(id)a4;
- (void)setAlarmManager:(id)a3;
@end

@implementation OSIAlarmMonitor

- (OSIAlarmMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)OSIAlarmMonitor;
  v2 = [(OSIAlarmMonitor *)&v6 init];
  if (v2)
  {
    v3 = (MTAlarmManager *)objc_alloc_init((Class)MTAlarmManager);
    alarmManager = v2->_alarmManager;
    v2->_alarmManager = v3;
  }
  return v2;
}

- (id)nextAlarmFireDateBetweenDate:(id)a3 andDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    [v7 timeIntervalSinceDate:v6];
    if (v10 <= 0.0)
    {
      id v9 = 0;
    }
    else
    {
      id v11 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v6 endDate:v8];
      v12 = [(MTAlarmManager *)self->_alarmManager nextAlarmsInRange:v11 maxCount:64 includeSleepAlarm:1];
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x3032000000;
      v22 = sub_10000FF10;
      v23 = sub_10000FF20;
      id v24 = 0;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000FF28;
      v16[3] = &unk_100064BC0;
      v18 = &v19;
      v13 = dispatch_semaphore_create(0);
      v17 = v13;
      id v14 = [v12 addCompletionBlock:v16];
      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      id v9 = (id)v20[5];

      _Block_object_dispose(&v19, 8);
    }
  }

  return v9;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end