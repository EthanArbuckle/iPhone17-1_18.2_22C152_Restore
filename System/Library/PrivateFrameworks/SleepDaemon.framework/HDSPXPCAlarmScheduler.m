@interface HDSPXPCAlarmScheduler
- (HDSPEventScheduleDelegate)delegate;
- (HDSPXPCAlarmScheduler)initWithCurrentDateProvider:(id)a3;
- (id)currentDateProvider;
- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4;
- (void)scheduleEventForDate:(id)a3 options:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)unschedule;
@end

@implementation HDSPXPCAlarmScheduler

- (HDSPXPCAlarmScheduler)initWithCurrentDateProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPXPCAlarmScheduler;
  v5 = [(HDSPXPCAlarmScheduler *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id currentDateProvider = v5->_currentDateProvider;
    v5->_id currentDateProvider = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)scheduleEventForDate:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  v7 = (*((void (**)(void))self->_currentDateProvider + 2))();
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  objc_super v10 = (const char *)[@"Date" UTF8String];
  time_t v11 = time(0);
  xpc_dictionary_set_date(xdict, v10, 1000000000 * (unint64_t)(ceil(v9) + (double)v11));
  xpc_dictionary_set_BOOL(xdict, (const char *)[@"UserVisible" UTF8String], v4 & 1);
  [@"com.apple.alarm" UTF8String];
  [@"com.apple.sleepd.NextAlarm" UTF8String];
  xpc_set_event();
}

- (void)unschedule
{
  [@"com.apple.alarm" UTF8String];
  [@"com.apple.sleepd.NextAlarm" UTF8String];

  xpc_set_event();
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 isEqualToString:@"com.apple.sleepd.NextAlarm"])
  {
    [(HDSPXPCAlarmScheduler *)self unschedule];
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)time_t v11 = 138543618;
      *(void *)&v11[4] = objc_opt_class();
      *(_WORD *)&v11[12] = 2114;
      *(void *)&v11[14] = v5;
      id v7 = *(id *)&v11[4];
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", v11, 0x16u);
    }
    double v8 = [(HDSPXPCAlarmScheduler *)self delegate];
    [v8 scheduledEventIsDue];
  }
  double v9 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", *(_OWORD *)v11, *(void *)&v11[16], v12);

  return v9;
}

- (HDSPEventScheduleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (HDSPEventScheduleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end