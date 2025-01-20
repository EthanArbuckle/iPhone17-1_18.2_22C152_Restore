@interface FenceScheduler
+ (const)alarmStream;
+ (const)timerIdentifier;
+ (id)_nextStartOrEndDateFrom:(id)a3 forSchedules:(id)a4;
+ (id)firstDateFromDates:(id)a3 order:(int64_t)a4;
- (FenceScheduler)initWithDelegate:(id)a3;
- (FenceSchedulerDelegate)delegate;
- (NSArray)currentSchedules;
- (NSArray)schedules;
- (void)_registerForSignificantTimeChangeNotifications;
- (void)_significantTimeChange:(id)a3;
- (void)_updateScheduleTimer;
- (void)notifyDelegateThatCurrentSchedulesDidChange;
- (void)setSchedules:(id)a3;
@end

@implementation FenceScheduler

- (FenceScheduler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(FenceScheduler *)self init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    [(FenceScheduler *)v6 _registerForSignificantTimeChangeNotifications];
  }

  return v6;
}

- (void)setSchedules:(id)a3
{
  objc_storeStrong((id *)&self->_schedules, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained fenceSchedulerCurrentSchedulesDidChange:self];

  [(FenceScheduler *)self _updateScheduleTimer];
}

- (NSArray)currentSchedules
{
  v2 = [(FenceScheduler *)self schedules];
  v3 = [v2 fm_filter:&stru_10005A640];

  return (NSArray *)v3;
}

+ (const)timerIdentifier
{
  id v2 = +[FindMyLocateSession scheduleTimerIdentifier];
  v3 = (const char *)[v2 cStringUsingEncoding:4];

  return v3;
}

+ (const)alarmStream
{
  id v2 = +[FindMyLocateSession scheduleAlarmStream];
  v3 = (const char *)[v2 cStringUsingEncoding:4];

  return v3;
}

- (void)notifyDelegateThatCurrentSchedulesDidChange
{
  id v3 = [(FenceScheduler *)self delegate];
  [v3 fenceSchedulerCurrentSchedulesDidChange:self];
}

- (void)_updateScheduleTimer
{
  id v3 = objc_opt_class();
  id v4 = +[NSDate date];
  v5 = [(FenceScheduler *)self schedules];
  v6 = [v3 _nextStartOrEndDateFrom:v4 forSchedules:v5];

  if (v6)
  {
    +[FenceScheduler alarmStream];
    +[FenceScheduler timerIdentifier];
    xpc_set_event();
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    [v6 timeIntervalSinceNow];
    double v9 = v8;
    time_t v10 = time(0);
    xpc_dictionary_set_date(v7, "Date", (uint64_t)((ceil(v9) + (double)v10) * 1000000000.0));
    xpc_dictionary_set_BOOL(v7, "UserVisible", 1);
    +[FenceScheduler alarmStream];
    +[FenceScheduler timerIdentifier];
    xpc_set_event();
  }
  v11 = sub_10001B934();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(FenceScheduler *)self schedules];
    int v13 = 136315906;
    v14 = "-[FenceScheduler _updateScheduleTimer]";
    __int16 v15 = 2112;
    v16 = self;
    __int16 v17 = 2112;
    v18 = v6;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: %@ fireDate: %@ schedules: %@", (uint8_t *)&v13, 0x2Au);
  }
}

+ (id)_nextStartOrEndDateFrom:(id)a3 forSchedules:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002AA40;
  v9[3] = &unk_10005A678;
  id v10 = a3;
  id v5 = v10;
  v6 = [a4 fm_map:v9];
  xpc_object_t v7 = [(id)objc_opt_class() firstDateFromDates:v6 order:-1];

  return v7;
}

- (void)_registerForSignificantTimeChangeNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_significantTimeChange:" name:@"FMFLocatorSchedulerSignificantTimeChangeNotification" object:0];
  [v3 addObserver:self selector:"_significantTimeChange:" name:NSSystemClockDidChangeNotification object:0];
  [v3 addObserver:self selector:"_significantTimeChange:" name:NSSystemTimeZoneDidChangeNotification object:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AB60;
  block[3] = &unk_100059350;
  block[4] = self;
  if (qword_10006D638 != -1) {
    dispatch_once(&qword_10006D638, block);
  }
}

- (void)_significantTimeChange:(id)a3
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_updateScheduleTimer" object:0];

  [(FenceScheduler *)self performSelector:"_updateScheduleTimer" withObject:0 afterDelay:0.2];
}

+ (id)firstDateFromDates:(id)a3 order:(int64_t)a4
{
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    double v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!v8 || [*(id *)(*((void *)&v14 + 1) + 8 * i) compare:v8] == (id)a4)
        {
          id v12 = v11;

          double v8 = v12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (FenceSchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FenceSchedulerDelegate *)WeakRetained;
}

- (NSArray)schedules
{
  return self->_schedules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedules, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end