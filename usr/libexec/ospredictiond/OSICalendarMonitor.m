@interface OSICalendarMonitor
- (EKEventStore)calendar;
- (OSICalendarMonitor)init;
- (OS_os_log)log;
- (id)nextFlightEventWithEventIDs:(id)a3;
- (id)relevantEventDeadline;
- (id)upcomingEventIDs;
- (void)setCalendar:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation OSICalendarMonitor

- (OSICalendarMonitor)init
{
  v3 = (EKEventStore *)[objc_alloc((Class)EKEventStore) initWithEKOptions:128];
  calendar = self->_calendar;
  self->_calendar = v3;

  v5 = (OS_os_log *)os_log_create("com.apple.osintelligence", "calendarmonitor");
  log = self->_log;
  self->_log = v5;

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"relevantEventDeadline" name:EKEventStoreChangedNotification object:0];

  return self;
}

- (id)upcomingEventIDs
{
  v3 = +[NSDate date];
  v4 = [v3 dateByAddingTimeInterval:-86400.0];
  v5 = [v3 dateByAddingTimeInterval:86400.0];
  v6 = [(EKEventStore *)self->_calendar predicateForEventsWithStartDate:v4 endDate:v5 calendars:0 loadDefaultProperties:1];
  v7 = [(OSICalendarMonitor *)self calendar];
  v8 = [v7 eventObjectIDsMatchingPredicate:v6];

  return v8;
}

- (id)nextFlightEventWithEventIDs:(id)a3
{
  id v4 = a3;
  v5 = +[NSDate distantFuture];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    id v9 = v7;
    os_log_t log = 0;
    uint64_t v10 = *(void *)v32;
    *(void *)&long long v8 = 138412546;
    long long v25 = v8;
    id v28 = v6;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = -[EKEventStore publicObjectWithObjectID:](self->_calendar, "publicObjectWithObjectID:", *(void *)(*((void *)&v31 + 1) + 8 * i), v25);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          if (([v13 isAllDay] & 1) == 0)
          {
            v14 = [v13 suggestionInfo];

            if (v14)
            {
              v15 = +[SGEventMetadata eventMetadataFromEKEvent:v13];
              v16 = [v15 categoryDescription];
              unsigned int v17 = [v16 localizedCaseInsensitiveContainsString:@"flight"];

              if (v17
                && ([v13 startDate],
                    v18 = objc_claimAutoreleasedReturnValue(),
                    [v18 timeIntervalSinceDate:v5],
                    double v20 = v19,
                    v18,
                    v20 < 0.0))
              {
                os_log_t v21 = (os_log_t)v13;

                uint64_t v22 = [v21 startDate];

                v23 = self->_log;
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  loga = v23;
                  v27 = [v21 startDate];
                  v26 = [v21 endDate];
                  *(_DWORD *)buf = v25;
                  v36 = v27;
                  __int16 v37 = 2112;
                  v38 = v26;
                  _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "Found flight from %@-%@", buf, 0x16u);
                }
              }
              else
              {
                uint64_t v22 = (uint64_t)v5;
                os_log_t v21 = log;
              }

              v5 = (void *)v22;
              os_log_t log = v21;
              id v6 = v28;
            }
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v9);
  }
  else
  {
    os_log_t log = 0;
  }

  return log;
}

- (id)relevantEventDeadline
{
  v3 = [(OSICalendarMonitor *)self upcomingEventIDs];
  id v4 = [(OSICalendarMonitor *)self nextFlightEventWithEventIDs:v3];
  if (v4)
  {
    os_log_t log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Upcoming or recent flight; forcing immediate charge",
        v9,
        2u);
    }
    uint64_t v6 = [v4 startDate];
  }
  else
  {
    uint64_t v6 = +[NSDate distantFuture];
  }
  id v7 = (void *)v6;

  return v7;
}

- (EKEventStore)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end