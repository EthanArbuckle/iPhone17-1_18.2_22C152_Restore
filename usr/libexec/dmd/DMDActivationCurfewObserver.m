@interface DMDActivationCurfewObserver
- (BOOL)_extractComponentsFromPredicate:(id)a3;
- (DMDActivationCurfewObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 curfewPredicate:(id)a5;
- (NSMutableArray)expiredNotificationTimes;
- (NSMutableArray)scheduledAlarmIdentifiers;
- (NSSet)notificationTimes;
- (NSString)calendarIdentifier;
- (id)_datesForNextCurfewBoundary;
- (id)_nextDateAfter:(id)a3 matchingWeekday:(int64_t)a4 hour:(int64_t)a5 minute:(int64_t)a6 second:(int64_t)a7 inCalendar:(id)a8;
- (id)evaluatePredicateWithError:(id *)a3;
- (id)metadata;
- (int64_t)endDay;
- (int64_t)endHour;
- (int64_t)endMinute;
- (int64_t)endSecond;
- (int64_t)startDay;
- (int64_t)startHour;
- (int64_t)startMinute;
- (int64_t)startSecond;
- (void)_registerPredicateObserver;
- (void)invalidate;
- (void)setCalendarIdentifier:(id)a3;
- (void)setEndDay:(int64_t)a3;
- (void)setEndHour:(int64_t)a3;
- (void)setEndMinute:(int64_t)a3;
- (void)setEndSecond:(int64_t)a3;
- (void)setExpiredNotificationTimes:(id)a3;
- (void)setNotificationTimes:(id)a3;
- (void)setScheduledAlarmIdentifiers:(id)a3;
- (void)setStartDay:(int64_t)a3;
- (void)setStartHour:(int64_t)a3;
- (void)setStartMinute:(int64_t)a3;
- (void)setStartSecond:(int64_t)a3;
@end

@implementation DMDActivationCurfewObserver

- (DMDActivationCurfewObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 curfewPredicate:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DMDActivationCurfewObserver;
  v9 = [(DMDActivationPredicateObserver *)&v16 initWithDelegate:a3 uniqueIdentifier:a4 predicate:v8];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    expiredNotificationTimes = v9->_expiredNotificationTimes;
    v9->_expiredNotificationTimes = (NSMutableArray *)v10;

    uint64_t v12 = objc_opt_new();
    scheduledAlarmIdentifiers = v9->_scheduledAlarmIdentifiers;
    v9->_scheduledAlarmIdentifiers = (NSMutableArray *)v12;

    if (![(DMDActivationCurfewObserver *)v9 _extractComponentsFromPredicate:v8])
    {
      v14 = 0;
      goto LABEL_6;
    }
    [(DMDActivationCurfewObserver *)v9 _registerPredicateObserver];
  }
  v14 = v9;
LABEL_6:

  return v14;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  v4 = objc_opt_new();
  v5 = [(DMDActivationCurfewObserver *)self calendarIdentifier];
  uint64_t v6 = [(DMDActivationPredicateObserver *)self calendarForIdentifier:v5];

  v7 = [(DMDActivationCurfewObserver *)self _nextDateAfter:v4 matchingWeekday:[(DMDActivationCurfewObserver *)self startDay] hour:[(DMDActivationCurfewObserver *)self startHour] minute:[(DMDActivationCurfewObserver *)self startMinute] second:[(DMDActivationCurfewObserver *)self startSecond] inCalendar:v6];
  v26 = (void *)v6;
  v25 = [(DMDActivationCurfewObserver *)self _nextDateAfter:v4 matchingWeekday:[(DMDActivationCurfewObserver *)self endDay] hour:[(DMDActivationCurfewObserver *)self endHour] minute:[(DMDActivationCurfewObserver *)self endMinute] second:[(DMDActivationCurfewObserver *)self endSecond] inCalendar:v6];
  id v8 = [(DMDActivationCurfewObserver *)self expiredNotificationTimes];
  [v8 removeAllObjects];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v9 = [(DMDActivationCurfewObserver *)self notificationTimes];
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v45 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v14 doubleValue];
        objc_super v16 = [v7 dateByAddingTimeInterval:-v15];
        if ([v16 compare:v4] == (id)-1)
        {
          v17 = [(DMDActivationCurfewObserver *)self expiredNotificationTimes];
          [v17 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v45 count:16];
    }
    while (v11);
  }

  -[DMDActivationPredicateObserver setLastPredicateEvaluationValue:](self, "setLastPredicateEvaluationValue:", [v25 compare:v7] == (id)-1);
  v18 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(DMDActivationPredicateObserver *)self predicateType];
    v20 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
    unsigned int v21 = [(DMDActivationPredicateObserver *)self lastPredicateEvaluationValue];
    v22 = [(DMDActivationCurfewObserver *)self expiredNotificationTimes];
    *(_DWORD *)buf = 138544898;
    v32 = v19;
    __int16 v33 = 2114;
    v34 = v20;
    __int16 v35 = 1024;
    unsigned int v36 = v21;
    __int16 v37 = 2114;
    v38 = v22;
    __int16 v39 = 2114;
    v40 = v7;
    __int16 v41 = 2114;
    v42 = v25;
    __int16 v43 = 2114;
    v44 = v4;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d, expired notification times: %{public}@, next start date: %{public}@, next end date: %{public}@, now: %{public}@", buf, 0x44u);
  }
  v23 = +[NSNumber numberWithBool:[(DMDActivationPredicateObserver *)self lastPredicateEvaluationValue]];

  return v23;
}

- (void)invalidate
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(DMDActivationCurfewObserver *)self scheduledAlarmIdentifiers];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        [@"com.apple.alarm" UTF8String];
        [v8 UTF8String];
        xpc_set_event();
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)DMDActivationCurfewObserver;
  [(DMDActivationPredicateObserver *)&v9 invalidate];
}

- (id)metadata
{
  v8.receiver = self;
  v8.super_class = (Class)DMDActivationCurfewObserver;
  v3 = [(DMDActivationPredicateObserver *)&v8 metadata];
  id v4 = [(DMDActivationCurfewObserver *)self expiredNotificationTimes];
  id v5 = [v4 sortedArrayUsingSelector:"compare:"];

  if ([v5 count])
  {
    uint64_t v9 = DMFDeclarationStatePredicatePayloadStatusExpiredNotificationTimesKey;
    long long v10 = v5;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v3 setObject:v6 forKeyedSubscript:DMFDeclarationStatePredicatePayloadStatusKey];
  }

  return v3;
}

- (BOOL)_extractComponentsFromPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 payloadCalendarIdentifier];
  [(DMDActivationCurfewObserver *)self setCalendarIdentifier:v5];

  uint64_t v6 = [(DMDActivationCurfewObserver *)self calendarIdentifier];
  v7 = [(DMDActivationPredicateObserver *)self calendarForIdentifier:v6];

  uint64_t v8 = [v4 payloadNotificationTimes];
  if (v8)
  {
    uint64_t v9 = +[NSSet setWithArray:v8];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  long long v10 = (void *)v9;
  [(DMDActivationCurfewObserver *)self setNotificationTimes:v9];

  long long v11 = objc_opt_new();
  [v11 setFormatOptions:544];
  long long v12 = [v7 timeZone];
  [v11 setTimeZone:v12];

  long long v13 = [v4 payloadStartTime];
  v14 = [v11 dateFromString:v13];

  if (v14)
  {
    double v15 = [v7 components:224 fromDate:v14];
    -[DMDActivationCurfewObserver setStartHour:](self, "setStartHour:", [v15 hour]);
    -[DMDActivationCurfewObserver setStartMinute:](self, "setStartMinute:", [v15 minute]);
    -[DMDActivationCurfewObserver setStartSecond:](self, "setStartSecond:", [v15 second]);
  }
  else
  {
    double v15 = 0;
  }
  objc_super v16 = [v4 payloadEndTime];
  v17 = [v11 dateFromString:v16];

  if (v17)
  {
    v18 = [v7 components:224 fromDate:v17];

    -[DMDActivationCurfewObserver setEndHour:](self, "setEndHour:", [v18 hour]);
    -[DMDActivationCurfewObserver setEndMinute:](self, "setEndMinute:", [v18 minute]);
    -[DMDActivationCurfewObserver setEndSecond:](self, "setEndSecond:", [v18 second]);
    double v15 = v18;
  }
  v19 = [v4 payloadStartDay];
  -[DMDActivationCurfewObserver setStartDay:](self, "setStartDay:", [v19 integerValue]);

  v20 = [v4 payloadEndDay];
  -[DMDActivationCurfewObserver setEndDay:](self, "setEndDay:", [v20 integerValue]);

  unsigned int v36 = v7;
  id v21 = [v7 maximumRangeOfUnit:512];
  unint64_t v23 = (unint64_t)v21 + v22 - 1;
  BOOL v24 = (id)[(DMDActivationCurfewObserver *)self startDay] < v21
     && [(DMDActivationCurfewObserver *)self startDay] > v23;
  BOOL v25 = (id)[(DMDActivationCurfewObserver *)self endDay] < v21
     && [(DMDActivationCurfewObserver *)self endDay] > v23;
  if (v14) {
    BOOL v26 = v17 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  char v27 = v26 || v24;
  if ((v27 & 1) != 0 || v25 || ![v14 compare:v17])
  {
    long long v28 = DMFConfigurationEngineLog();
    long long v30 = (void *)v8;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10007EE40(self, v4, v28);
    }
    BOOL v29 = 0;
  }
  else
  {
    long long v28 = DMFConfigurationEngineLog();
    BOOL v29 = 1;
    long long v30 = (void *)v8;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      __int16 v35 = [(DMDActivationPredicateObserver *)self predicateType];
      v34 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
      v31 = [(DMDActivationCurfewObserver *)self calendarIdentifier];
      __int16 v33 = [(DMDActivationCurfewObserver *)self notificationTimes];
      *(_DWORD *)buf = 138546178;
      v38 = v35;
      __int16 v39 = 2114;
      v40 = v34;
      __int16 v41 = 2114;
      v42 = v31;
      __int16 v43 = 2114;
      v44 = v33;
      __int16 v45 = 2048;
      int64_t v46 = [(DMDActivationCurfewObserver *)self startDay];
      __int16 v47 = 2048;
      int64_t v48 = [(DMDActivationCurfewObserver *)self startHour];
      __int16 v49 = 2048;
      int64_t v50 = [(DMDActivationCurfewObserver *)self startMinute];
      __int16 v51 = 2048;
      int64_t v52 = [(DMDActivationCurfewObserver *)self startSecond];
      __int16 v53 = 2048;
      int64_t v54 = [(DMDActivationCurfewObserver *)self endDay];
      __int16 v55 = 2048;
      int64_t v56 = [(DMDActivationCurfewObserver *)self endHour];
      __int16 v57 = 2048;
      int64_t v58 = [(DMDActivationCurfewObserver *)self endMinute];
      __int16 v59 = 2048;
      int64_t v60 = [(DMDActivationCurfewObserver *)self endSecond];
      BOOL v29 = 1;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Predicate type: %{public}@ with unique identifier: %{public}@ extracted calendar identifier: %{public}@, notifications times: %{public}@, start day: %ld, start hour: %ld, start minute: %ld, start second: %ld, end day: %ld, end hour: %ld, end minute: %ld, end second: %ld", buf, 0x7Au);
    }
  }

  return v29;
}

- (void)_registerPredicateObserver
{
  v3 = [(DMDActivationCurfewObserver *)self _datesForNextCurfewBoundary];
  id v4 = [(DMDActivationCurfewObserver *)self scheduledAlarmIdentifiers];
  [v4 removeAllObjects];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v36 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v21 = *(void *)v23;
    uint64_t v7 = 1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v10 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
        long long v11 = +[NSString stringWithFormat:@"%@.%@-%ld", @"com.apple.dmd.alarm", v10, (char *)i + v7];

        [v9 timeIntervalSince1970];
        int64_t v13 = (uint64_t)(v12 * 1000000000.0);
        v14 = [(DMDActivationCurfewObserver *)self scheduledAlarmIdentifiers];
        [v14 addObject:v11];

        double v15 = DMFConfigurationEngineLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v16 = [(DMDActivationPredicateObserver *)self predicateType];
          v17 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
          *(_DWORD *)buf = 138544386;
          char v27 = v16;
          __int16 v28 = 2114;
          BOOL v29 = v17;
          __int16 v30 = 2114;
          v31 = v11;
          __int16 v32 = 2114;
          __int16 v33 = v9;
          __int16 v34 = 2048;
          int64_t v35 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ will schedule alarm with identifier: %{public}@ to fire at date: %{public}@, epoch time in nano seconds: %lld", buf, 0x34u);
        }
        xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v18, (const char *)[@"ShouldWake" UTF8String], 0);
        xpc_dictionary_set_date(v18, (const char *)[@"Date" UTF8String], v13);
        [@"com.apple.alarm" UTF8String];
        id v19 = v11;
        [v19 UTF8String];
        xpc_set_event();
      }
      id v6 = [obj countByEnumeratingWithState:&v22 objects:v36 count:16];
      v7 += (uint64_t)i;
    }
    while (v6);
  }
}

- (id)_datesForNextCurfewBoundary
{
  v3 = objc_opt_new();
  id v4 = [(DMDActivationCurfewObserver *)self calendarIdentifier];
  id v5 = [(DMDActivationPredicateObserver *)self calendarForIdentifier:v4];

  id v6 = [(DMDActivationCurfewObserver *)self _nextDateAfter:v3 matchingWeekday:[(DMDActivationCurfewObserver *)self startDay] hour:[(DMDActivationCurfewObserver *)self startHour] minute:[(DMDActivationCurfewObserver *)self startMinute] second:[(DMDActivationCurfewObserver *)self startSecond] inCalendar:v5];
  uint64_t v7 = [(DMDActivationCurfewObserver *)self _nextDateAfter:v3 matchingWeekday:[(DMDActivationCurfewObserver *)self endDay] hour:[(DMDActivationCurfewObserver *)self endHour] minute:[(DMDActivationCurfewObserver *)self endMinute] second:[(DMDActivationCurfewObserver *)self endSecond] inCalendar:v5];
  uint64_t v8 = objc_opt_new();
  id v9 = [v6 compare:v7];
  if (v9 == (id)1)
  {
    [v8 addObject:v7];
LABEL_14:
    id v17 = [v8 copy];
    goto LABEL_18;
  }
  if (v9 == (id)-1)
  {
    [v8 addObject:v6];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v10 = [(DMDActivationCurfewObserver *)self notificationTimes];
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * i) doubleValue];
          objc_super v16 = [v6 dateByAddingTimeInterval:-v15];
          if ([v3 compare:v16] == (id)-1) {
            [v8 addObject:v16];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v12);
    }

    goto LABEL_14;
  }
  xpc_object_t v18 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v20 = [(DMDActivationPredicateObserver *)self predicateType];
    uint64_t v21 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
    *(_DWORD *)buf = 138544130;
    char v27 = v20;
    __int16 v28 = 2114;
    BOOL v29 = v21;
    __int16 v30 = 2114;
    v31 = v6;
    __int16 v32 = 2114;
    __int16 v33 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Predicate type: %{public}@ with unique identifier: %{public}@ failed to calculate the next curfew boundary date for next start date: %{public}@, next end date: %{public}@", buf, 0x2Au);
  }
  id v17 = 0;
LABEL_18:

  return v17;
}

- (id)_nextDateAfter:(id)a3 matchingWeekday:(int64_t)a4 hour:(int64_t)a5 minute:(int64_t)a6 second:(int64_t)a7 inCalendar:(id)a8
{
  id v13 = a8;
  id v14 = a3;
  double v15 = objc_opt_new();
  [v15 setWeekday:a4];
  [v15 setHour:a5];
  [v15 setMinute:a6];
  [v15 setSecond:a7];
  objc_super v16 = [v13 nextDateAfterDate:v14 matchingComponents:v15 options:1024];

  return v16;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (NSSet)notificationTimes
{
  return self->_notificationTimes;
}

- (void)setNotificationTimes:(id)a3
{
}

- (NSMutableArray)expiredNotificationTimes
{
  return self->_expiredNotificationTimes;
}

- (void)setExpiredNotificationTimes:(id)a3
{
}

- (NSMutableArray)scheduledAlarmIdentifiers
{
  return self->_scheduledAlarmIdentifiers;
}

- (void)setScheduledAlarmIdentifiers:(id)a3
{
}

- (int64_t)startDay
{
  return self->_startDay;
}

- (void)setStartDay:(int64_t)a3
{
  self->_startDay = a3;
}

- (int64_t)startHour
{
  return self->_startHour;
}

- (void)setStartHour:(int64_t)a3
{
  self->_startHour = a3;
}

- (int64_t)startMinute
{
  return self->_startMinute;
}

- (void)setStartMinute:(int64_t)a3
{
  self->_startMinute = a3;
}

- (int64_t)startSecond
{
  return self->_startSecond;
}

- (void)setStartSecond:(int64_t)a3
{
  self->_startSecond = a3;
}

- (int64_t)endDay
{
  return self->_endDay;
}

- (void)setEndDay:(int64_t)a3
{
  self->_endDay = a3;
}

- (int64_t)endHour
{
  return self->_endHour;
}

- (void)setEndHour:(int64_t)a3
{
  self->_endHour = a3;
}

- (int64_t)endMinute
{
  return self->_endMinute;
}

- (void)setEndMinute:(int64_t)a3
{
  self->_endMinute = a3;
}

- (int64_t)endSecond
{
  return self->_endSecond;
}

- (void)setEndSecond:(int64_t)a3
{
  self->_endSecond = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledAlarmIdentifiers, 0);
  objc_storeStrong((id *)&self->_expiredNotificationTimes, 0);
  objc_storeStrong((id *)&self->_notificationTimes, 0);

  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

@end