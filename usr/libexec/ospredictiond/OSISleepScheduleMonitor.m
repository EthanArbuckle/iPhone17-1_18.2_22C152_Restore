@interface OSISleepScheduleMonitor
- (BOOL)date:(id)a3 coveredByAnyWeekdayWithOccurrences:(unint64_t)a4;
- (BOOL)date:(id)a3 inSleepWindowWithSecondsBeforeStart:(double)a4 secondsBeforeEnd:(double)a5;
- (BOOL)date:(id)a3 inSleepWindowWithSecondsBeforeStart:(double)a4 secondsBeforeEnd:(double)a5 withSleepStore:(id)a6;
- (HKSPSleepStore)sleepStore;
- (OSISleepScheduleMonitor)init;
- (void)setSleepStore:(id)a3;
@end

@implementation OSISleepScheduleMonitor

- (OSISleepScheduleMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)OSISleepScheduleMonitor;
  v2 = [(OSISleepScheduleMonitor *)&v6 init];
  if (v2)
  {
    v3 = (HKSPSleepStore *)[objc_alloc((Class)HKSPSleepStore) initWithIdentifier:@"com.apple.osintelligence.spn"];
    sleepStore = v2->_sleepStore;
    v2->_sleepStore = v3;
  }
  return v2;
}

- (BOOL)date:(id)a3 inSleepWindowWithSecondsBeforeStart:(double)a4 secondsBeforeEnd:(double)a5
{
  return [(OSISleepScheduleMonitor *)self date:a3 inSleepWindowWithSecondsBeforeStart:self->_sleepStore secondsBeforeEnd:a4 withSleepStore:a5];
}

- (BOOL)date:(id)a3 inSleepWindowWithSecondsBeforeStart:(double)a4 secondsBeforeEnd:(double)a5 withSleepStore:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = (void *)os_transaction_create();
  v14 = os_log_create("com.apple.osintelligence", "inactivity.sleepschedule");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100041E30((uint64_t)v10, v14);
  }
  v15 = [v11 currentSleepScheduleWithError:0];
  v16 = v15;
  if (v15)
  {
    if ([v15 isEnabled])
    {
      id v17 = [v11 currentSleepScheduleStateWithError:0];
      v18 = [v11 nextEventDueAfterDate:v10 error:0];
      v19 = v18;
      if (v17 == (id)3) {
        goto LABEL_22;
      }
      if (v17 == (id)2)
      {
        if (!v18)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_100041DEC(v14);
          }
          goto LABEL_39;
        }
        v20 = [v18 identifier];
        if ([v20 isEqual:HKSPSleepEventIdentifierWakeUp])
        {
          v21 = [v19 dueDate];
          v22 = [v21 dateByAddingTimeInterval:-a5];
          [v22 timeIntervalSinceDate:v10];
          double v24 = v23;

          if (v24 < 0.0)
          {
            v25 = v14;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v26 = [v19 dueDate];
              *(_DWORD *)buf = 138412290;
              id v43 = v26;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, " Wake upcoming at %@. Do not engage", buf, 0xCu);
            }
LABEL_34:
            BOOL v28 = 0;
LABEL_40:

            goto LABEL_41;
          }
        }
        else
        {
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v33 = " In schedule and far from wakeup -> in sleep window";
          goto LABEL_37;
        }
        goto LABEL_39;
      }
      if (v18)
      {
        v29 = [v18 identifier];
        if ([v29 isEqual:HKSPSleepEventIdentifierBedtime])
        {
          v40 = [v19 dueDate];
          [v40 dateByAddingTimeInterval:-a4];
          v30 = v41 = v19;
          [v30 timeIntervalSinceDate:v10];
          double v32 = v31;

          v19 = v41;
          if (v32 < 0.0)
          {
LABEL_22:
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v33 = " Sleep upcoming or already in wind-down -> in sleep window";
LABEL_37:
              v37 = v14;
              uint32_t v38 = 2;
LABEL_38:
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v33, buf, v38);
            }
LABEL_39:
            BOOL v28 = 1;
            goto LABEL_40;
          }
        }
        else
        {
        }
      }
      if (v17)
      {
        v34 = v19;
        unsigned __int8 v35 = -[OSISleepScheduleMonitor date:coveredByAnyWeekdayWithOccurrences:](self, "date:coveredByAnyWeekdayWithOccurrences:", v10, [v16 weekdaysWithOccurrences]);
        BOOL v36 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v35)
        {
          v19 = v34;
          if (v36)
          {
            *(_DWORD *)buf = 138412290;
            id v43 = v10;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ NOT in sleep window", buf, 0xCu);
          }
          goto LABEL_34;
        }
        v19 = v34;
        if (v36)
        {
          *(_DWORD *)buf = 138412290;
          id v43 = v10;
          v33 = " Date %@ not covered by any occurrences -> in sleep window";
          v37 = v14;
          uint32_t v38 = 12;
          goto LABEL_38;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v33 = " Sleep schedule is set but disabled -> always in sleep window";
        goto LABEL_37;
      }
      goto LABEL_39;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v27 = "Sleep schedule exists but disabled -> always in sleep window";
      goto LABEL_17;
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v27 = "No sleep schedule found -> always in sleep window";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
  }
  BOOL v28 = 1;
LABEL_41:

  return v28;
}

- (BOOL)date:(id)a3 coveredByAnyWeekdayWithOccurrences:(unint64_t)a4
{
  id v5 = a3;
  +[OSIntelligenceUtilities hourFromDate:v5];
  int v7 = (int)v6;
  unsigned int v8 = +[OSIntelligenceUtilities pandasWeekdayOf:v5];

  if (v7 >= 21) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 1 << v8;
  }
  uint64_t v10 = v9 | (1 << ((int)(v8 + 1) % 7));
  if (v7 < 5) {
    uint64_t v10 = 1 << v8;
  }
  return (v10 & a4) != 0;
}

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (void)setSleepStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end