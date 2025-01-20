@interface CLScheduledEventTracker
- (BOOL)didUpdateFireTime;
- (BOOL)getAndClearUpdateNextFireTimeHasFired;
- (CLDispatchSilo)silo;
- (CLTimer)timer;
- (double)nextFireDelay;
- (id)initOnSilo:(id)a3 hour:(int64_t)a4 minute:(int64_t)a5 second:(int64_t)a6 block:(id)a7;
- (int64_t)hour;
- (int64_t)minute;
- (int64_t)second;
- (void)dealloc;
- (void)handleSysTimeChanged;
- (void)invalidate;
- (void)setDidUpdateFireTime:(BOOL)a3;
- (void)setSilo:(id)a3;
- (void)setTimer:(id)a3;
- (void)updateDesiredFireTimeToHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5;
- (void)updateNextFireTime;
@end

@implementation CLScheduledEventTracker

- (id)initOnSilo:(id)a3 hour:(int64_t)a4 minute:(int64_t)a5 second:(int64_t)a6 block:(id)a7
{
  v16.receiver = self;
  v16.super_class = (Class)CLScheduledEventTracker;
  v12 = [(CLScheduledEventTracker *)&v16 init];
  if (v12)
  {
    v12->_silo = (CLDispatchSilo *)a3;
    v13 = (CLTimer *)[a3 newTimer];
    v12->_timer = v13;
    [(CLTimer *)v13 setHandler:a7];
    [(CLScheduledEventTracker *)v12 updateDesiredFireTimeToHour:a4 minute:a5 second:a6];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v12, (CFNotificationCallback)sub_100E47688, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v12;
}

- (void)invalidate
{
  [(CLTimer *)[(CLScheduledEventTracker *)self timer] invalidate];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
}

- (void)dealloc
{
  [(CLScheduledEventTracker *)self invalidate];

  v3.receiver = self;
  v3.super_class = (Class)CLScheduledEventTracker;
  [(CLScheduledEventTracker *)&v3 dealloc];
}

- (BOOL)getAndClearUpdateNextFireTimeHasFired
{
  BOOL v3 = [(CLScheduledEventTracker *)self didUpdateFireTime];
  [(CLScheduledEventTracker *)self setDidUpdateFireTime:0];
  return v3;
}

- (void)handleSysTimeChanged
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022FBFB0);
  }
  BOOL v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"system time changed!\"}", (uint8_t *)v4, 0x12u);
  }
  [(CLScheduledEventTracker *)self updateNextFireTime];
}

- (void)updateDesiredFireTimeToHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5
{
  self->_hour = a3;
  self->_minute = a4;
  self->_second = a5;
  [(CLScheduledEventTracker *)self updateNextFireTime];
}

- (void)updateNextFireTime
{
  BOOL v3 = +[NSCalendar currentCalendar];
  [(CLDispatchSilo *)[(CLScheduledEventTracker *)self silo] currentLatchedAbsoluteTimestamp];
  v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v5 = [(NSDateComponents *)[(NSCalendar *)v3 components:252 fromDate:v4] copy];
  [v5 setHour:-[CLScheduledEventTracker hour](self, "hour")];
  [v5 setMinute:-[CLScheduledEventTracker minute](self, "minute")];
  [v5 setSecond:-[CLScheduledEventTracker second](self, "second")];
  v6 = [(NSCalendar *)v3 dateFromComponents:v5];
  [(NSDate *)v4 timeIntervalSinceReferenceDate];
  double v8 = v7;
  [(NSDate *)v6 timeIntervalSinceReferenceDate];
  if (v8 > v9)
  {
    id v10 = objc_alloc_init((Class)NSDateComponents);
    [v10 setDay:1];
    v6 = [(NSCalendar *)v3 dateByAddingComponents:v10 toDate:v6 options:0];
  }
  [(NSDate *)v6 timeIntervalSinceDate:v4];
  self->_nextFireDelay = v11;
  v12 = [(CLScheduledEventTracker *)self timer];
  [(CLScheduledEventTracker *)self nextFireDelay];
  -[CLTimer setNextFireDelay:interval:](v12, "setNextFireDelay:interval:");
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022FBFB0);
  }
  v13 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
  {
    [(CLScheduledEventTracker *)self nextFireDelay];
    v15[0] = 68289282;
    v15[1] = 0;
    __int16 v16 = 2082;
    v17 = "";
    __int16 v18 = 2050;
    uint64_t v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"updated scheduled event timer\", \"nextFireDelay\":\"%{public}f\"}", (uint8_t *)v15, 0x1Cu);
  }
  [(CLScheduledEventTracker *)self setDidUpdateFireTime:1];
}

- (int64_t)hour
{
  return self->_hour;
}

- (int64_t)minute
{
  return self->_minute;
}

- (int64_t)second
{
  return self->_second;
}

- (double)nextFireDelay
{
  return self->_nextFireDelay;
}

- (CLTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (CLDispatchSilo)silo
{
  return self->_silo;
}

- (void)setSilo:(id)a3
{
}

- (BOOL)didUpdateFireTime
{
  return self->_didUpdateFireTime;
}

- (void)setDidUpdateFireTime:(BOOL)a3
{
  self->_didUpdateFireTime = a3;
}

@end