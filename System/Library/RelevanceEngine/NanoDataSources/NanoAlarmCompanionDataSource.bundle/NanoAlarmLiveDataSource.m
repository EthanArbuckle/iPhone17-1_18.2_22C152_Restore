@interface NanoAlarmLiveDataSource
+ (id)relevanceProviderForDate:(id)a3;
- (id)todaysAlarms;
- (id)tomorrowAlarms;
- (void)_alarmStoreChangedNotification:(id)a3;
- (void)pause;
- (void)resume;
- (void)sensitiveUIStateChanged;
@end

@implementation NanoAlarmLiveDataSource

+ (id)relevanceProviderForDate:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)REDateRelevanceProvider) initWithEventDate:v3];

  return v4;
}

- (void)resume
{
  id v3 = (MTAlarmManager *)objc_alloc_init((Class)MTAlarmManager);
  alarmManager = self->_alarmManager;
  self->_alarmManager = v3;

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_alarmStoreChangedNotification:" name:MTAlarmManagerAlarmsChanged object:self->_alarmManager];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_alarmStoreChangedNotification:" name:MTAlarmManagerStateReset object:self->_alarmManager];

  id v7 = +[HKSPSensitiveUIMonitor sharedMonitor];
  [v7 addObserver:self];
}

- (void)pause
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[HKSPSensitiveUIMonitor sharedMonitor];
  [v4 removeObserver:self];

  alarmManager = self->_alarmManager;
  self->_alarmManager = 0;
}

- (void)_alarmStoreChangedNotification:(id)a3
{
  id v3 = [(NanoAlarmLiveDataSource *)self delegate];
  [v3 invalidateElements];
}

- (id)todaysAlarms
{
  id v3 = +[NSDate date];
  id v4 = objc_alloc((Class)NSDateInterval);
  v5 = CLKStartOfDayForDate();
  v6 = CLKEndOfDayForDate();
  id v7 = [v4 initWithStartDate:v5 endDate:v6];

  v8 = [(MTAlarmManager *)self->_alarmManager nextAlarmsForDate:v3 maxCount:20 includeSleepAlarm:0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5940;
  v12[3] = &unk_8300;
  id v13 = v7;
  char v14 = 0;
  id v9 = v7;
  v10 = [v8 flatMap:v12];

  return v10;
}

- (id)tomorrowAlarms
{
  id v3 = +[NSCalendar currentCalendar];
  id v4 = +[NSDate date];
  v5 = [v3 dateByAddingUnit:16 value:1 toDate:v4 options:1];

  id v6 = objc_alloc((Class)NSDateInterval);
  id v7 = CLKStartOfDayForDate();
  v8 = CLKEndOfDayForDate();
  id v9 = [v6 initWithStartDate:v7 endDate:v8];

  v10 = [(MTAlarmManager *)self->_alarmManager nextAlarmsInRange:v9 maxCount:20 includeSleepAlarm:0];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_5D00;
  v14[3] = &unk_8300;
  id v15 = v9;
  char v16 = 0;
  id v11 = v9;
  v12 = [v10 flatMap:v14];

  return v12;
}

- (void)sensitiveUIStateChanged
{
  id v2 = [(NanoAlarmLiveDataSource *)self delegate];
  [v2 invalidateElements];
}

- (void).cxx_destruct
{
}

@end