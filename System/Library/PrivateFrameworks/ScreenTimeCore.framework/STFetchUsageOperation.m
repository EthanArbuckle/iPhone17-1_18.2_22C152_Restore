@interface STFetchUsageOperation
+ (id)boundaryDateForDuration:(int64_t)a3 referenceDate:(id)a4;
- (BOOL)forceRemoteDeviceSync;
- (BOOL)includeAggregateUsage;
- (BOOL)includeRemoteUsage;
- (BOOL)isAsynchronous;
- (NSDate)genesisDate;
- (NSDate)lastStartDate;
- (NSDate)referenceDate;
- (NSDateInterval)dateInterval;
- (NSMutableArray)aggregateUsageReports;
- (NSMutableArray)localUsageReports;
- (NSMutableArray)queryIntervals;
- (NSMutableDictionary)usageReportsByCoreDuetIdentifier;
- (STFetchUsageOperation)initWithGenesisDate:(id)a3 lastStartDate:(id)a4 referenceDate:(id)a5 includeAggregateUsage:(BOOL)a6 includeRemoteUsage:(BOOL)a7 forceRemoteDeviceSync:(BOOL)a8 duration:(int64_t)a9;
- (USUsageReporter)usageReporter;
- (id)_computeStartDate;
- (id)_queryIntervalsStartingAtDate:(id)a3;
- (int64_t)duration;
- (void)_fetchNextReportAndEndWhenDone;
- (void)_recordLocalUsageReports:(id)a3 usageReportsByCoreDuetIdentifier:(id)a4 aggregateUsageReports:(id)a5;
- (void)main;
- (void)setAggregateUsageReports:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setLocalUsageReports:(id)a3;
- (void)setQueryIntervals:(id)a3;
- (void)setReferenceDate:(id)a3;
- (void)setUsageReporter:(id)a3;
- (void)setUsageReportsByCoreDuetIdentifier:(id)a3;
@end

@implementation STFetchUsageOperation

- (STFetchUsageOperation)initWithGenesisDate:(id)a3 lastStartDate:(id)a4 referenceDate:(id)a5 includeAggregateUsage:(BOOL)a6 includeRemoteUsage:(BOOL)a7 forceRemoteDeviceSync:(BOOL)a8 duration:(int64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v26.receiver = self;
  v26.super_class = (Class)STFetchUsageOperation;
  v18 = [(STOperation *)&v26 init];
  if (v18)
  {
    v19 = (NSDate *)[v15 copy];
    genesisDate = v18->_genesisDate;
    v18->_genesisDate = v19;

    v21 = (NSDate *)[v16 copy];
    lastStartDate = v18->_lastStartDate;
    v18->_lastStartDate = v21;

    v23 = (NSDate *)[v17 copy];
    referenceDate = v18->_referenceDate;
    v18->_referenceDate = v23;

    v18->_includeAggregateUsage = a6;
    v18->_includeRemoteUsage = a7;
    v18->_forceRemoteDeviceSync = a8;
    v18->_duration = a9;
  }

  return v18;
}

+ (id)boundaryDateForDuration:(int64_t)a3 referenceDate:(id)a4
{
  id v5 = a4;
  v6 = +[NSCalendar currentCalendar];
  v7 = [v6 startOfDayForDate:v5];
  if (a3 == 1440)
  {
    v10 = [v6 dateByAddingUnit:16 value:-120 toDate:v7 options:260];
  }
  else if (a3 == 60)
  {
    v8 = [v6 dateByAddingUnit:0x2000 value:-4 toDate:v5 options:4];
    v9 = [v6 startOfDayForDate:v8];

    v10 = objc_msgSend(v6, "nextDateAfterDate:matchingUnit:value:options:", v9, 512, objc_msgSend(v6, "minimumRangeOfUnit:", 512), 260);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  os_activity_t v3 = _os_activity_create((void *)&_mh_execute_header, "STFetchUsageOperation start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  [(STOperation *)self setActivity:v3];

  v4 = [(STOperation *)self activity];
  os_activity_scope_enter(v4, &v23);

  id v5 = [(STFetchUsageOperation *)self referenceDate];
  if (!v5)
  {
    id v5 = objc_opt_new();
    [(STFetchUsageOperation *)self setReferenceDate:v5];
  }
  v6 = [(STFetchUsageOperation *)self _computeStartDate];
  v7 = [(STFetchUsageOperation *)self _queryIntervalsStartingAtDate:v6];
  v8 = objc_opt_new();
  [(STFetchUsageOperation *)self setUsageReporter:v8];

  [(STFetchUsageOperation *)self setQueryIntervals:v7];
  if ([v7 count])
  {
    v9 = [v7 firstObject];
    v10 = [v9 dateInterval];
    id v11 = [v10 startDate];

    v12 = [v7 lastObject];
    v13 = [v12 dateInterval];
    v14 = [v13 endDate];

    id v15 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v11 endDate:v14];
    [(STFetchUsageOperation *)self setDateInterval:v15];
  }
  else
  {
    id v16 = +[STLog persistence];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = [(STFetchUsageOperation *)self genesisDate];
      v21 = [(STFetchUsageOperation *)self lastStartDate];
      v22 = [(STFetchUsageOperation *)self referenceDate];
      *(_DWORD *)buf = 138543874;
      v25 = v20;
      __int16 v26 = 2114;
      v27 = v21;
      __int16 v28 = 2114;
      v29 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Can't figure out query intervals. genesisDate = %{public}@, lastStartDate = %{public}@, referenceDate = %{public}@", buf, 0x20u);
    }
    id v11 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v5 duration:0.0];
    [(STFetchUsageOperation *)self setDateInterval:v11];
  }

  id v17 = objc_opt_new();
  [(STFetchUsageOperation *)self setLocalUsageReports:v17];

  v18 = objc_opt_new();
  [(STFetchUsageOperation *)self setAggregateUsageReports:v18];

  v19 = objc_opt_new();
  [(STFetchUsageOperation *)self setUsageReportsByCoreDuetIdentifier:v19];

  [(STFetchUsageOperation *)self _fetchNextReportAndEndWhenDone];
  os_activity_scope_leave(&v23);
}

- (id)_computeStartDate
{
  os_activity_t v3 = [(STFetchUsageOperation *)self referenceDate];
  v4 = [(STFetchUsageOperation *)self genesisDate];
  if ([v4 compare:v3] != (id)1)
  {
    int64_t v7 = [(STFetchUsageOperation *)self duration];
    uint64_t v8 = [(id)objc_opt_class() boundaryDateForDuration:v7 referenceDate:v3];
    id v5 = v8;
    if (v4 && v8)
    {
      id v9 = [v4 laterDate:v8];
    }
    else
    {
      if (v4) {
        v10 = v4;
      }
      else {
        v10 = (void *)v8;
      }
      id v9 = v10;
    }
    id v11 = v9;
    v12 = [(STFetchUsageOperation *)self lastStartDate];
    if (!v12)
    {
LABEL_17:
      id v6 = v11;
LABEL_46:

      goto LABEL_47;
    }
    v13 = v12;
    if ([v12 compare:v3] == (id)1)
    {
      v14 = +[STLog usage];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10025FFF8();
      }

      goto LABEL_17;
    }
    id v15 = +[STCoreDuetUsageQuery earliestUsageEventStartDateCreatedSince:v13 whereStartDateIsOnOrAfter:v4 andEndDateOnOrBefore:v3];
    id v16 = v15;
    if (v15 && [v15 compare:v3] == (id)1)
    {
      id v17 = +[STLog usage];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100260060();
      }

      id v16 = 0;
    }
    if (v7 == 1440)
    {
      v21 = +[NSCalendar currentCalendar];
      id v22 = v13;
      os_activity_scope_state_s v23 = v22;
      if (v16)
      {
        id v24 = [v16 earlierDate:v22];
      }
      else
      {
        id v24 = v22;
      }
      id v27 = v24;

      v25 = [v21 startOfDayForDate:v27];
    }
    else
    {
      if (v7 != 60)
      {
        v25 = 0;
        if (!v11) {
          goto LABEL_41;
        }
LABEL_39:
        if (v25)
        {
          id v30 = [v25 laterDate:v11];
LABEL_45:
          id v6 = v30;

          goto LABEL_46;
        }
LABEL_41:
        if (v25) {
          v31 = v25;
        }
        else {
          v31 = v11;
        }
        id v30 = v31;
        goto LABEL_45;
      }
      id v18 = v13;
      v19 = v18;
      if (v16)
      {
        id v20 = [v16 earlierDate:v18];
      }
      else
      {
        id v20 = v18;
      }
      __int16 v26 = v20;

      id v27 = v26;
      if (v27)
      {
        __int16 v28 = +[NSCalendar currentCalendar];
        v29 = [v28 components:60 fromDate:v27];
        v25 = [v28 dateFromComponents:v29];
      }
      else
      {
        v25 = 0;
      }
      v21 = v27;
    }

    if (!v11) {
      goto LABEL_41;
    }
    goto LABEL_39;
  }
  id v5 = +[STLog usage];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10025FF90();
  }
  id v6 = 0;
LABEL_47:

  return v6;
}

- (id)_queryIntervalsStartingAtDate:(id)a3
{
  id v4 = a3;
  id v5 = +[NSCalendar currentCalendar];
  id v6 = v4;
  int64_t v7 = [(STFetchUsageOperation *)self referenceDate];
  int64_t v8 = [(STFetchUsageOperation *)self duration];
  if (v8 == 60) {
    uint64_t v9 = 64;
  }
  else {
    uint64_t v9 = 32 * (v8 == 1440);
  }
  v10 = objc_opt_new();
  id v11 = v6;
  if ([v6 compare:v7] == (id)-1)
  {
    v12 = v6;
    do
    {
      id v11 = [v5 nextDateAfterDate:v12 matchingUnit:v9 value:0 options:1024];
      if ([v11 compare:v7] == (id)1)
      {
        id v13 = v7;

        id v11 = v13;
      }
      v14 = [v10 lastObject];
      [v11 timeIntervalSinceDate:v12];
      double v16 = v15;
      if (!v14 || ([v14 partitionTimeInterval], v17 != v16))
      {
        id v18 = [[STQueryInterval alloc] initWithStartDate:v12 partitionTimeInterval:v16];

        [v10 addObject:v18];
        v14 = v18;
      }
      objc_msgSend(v14, "setNumberOfPartitions:", (char *)objc_msgSend(v14, "numberOfPartitions") + 1);

      v12 = v11;
    }
    while ([v11 compare:v7] == (id)-1);
  }

  return v10;
}

- (void)_fetchNextReportAndEndWhenDone
{
  if ([(STFetchUsageOperation *)self isCanceled])
  {
    id v28 = +[NSError errorWithDomain:CATErrorDomain code:404 userInfo:0];
    -[STFetchUsageOperation endOperationWithError:](self, "endOperationWithError:");
  }
  else
  {
    id v4 = [(STFetchUsageOperation *)self queryIntervals];
    if ([v4 count])
    {
      if ([(STFetchUsageOperation *)self forceRemoteDeviceSync]
        && ([(STFetchUsageOperation *)self includeAggregateUsage]
         || [(STFetchUsageOperation *)self includeRemoteUsage]))
      {
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10003EB2C;
        v31[3] = &unk_1002FC888;
        id v32 = (id)os_transaction_create();
        id v5 = v32;
        +[USUsageReporter synchronizeUsageWithCompletionHandler:v31];
      }
      id v6 = [v4 firstObject];
      [v4 removeObjectAtIndex:0];
      [(STFetchedUsageResults *)v6 partitionTimeInterval];
      double v8 = v7;
      uint64_t v9 = [(STFetchedUsageResults *)v6 dateInterval];
      v10 = [(STFetchUsageOperation *)self usageReporter];
      if (!v10)
      {
        v25 = +[NSAssertionHandler currentHandler];
        [v25 handleFailureInMethod:a2, self, @"STFetchUsageOperation.m", 275, @"Invalid parameter not satisfying: %@", @"reporter" object file lineNumber description];
      }
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10003EB8C;
      v30[3] = &unk_1002FC8B0;
      v30[4] = self;
      [v10 fetchReportsDuringInterval:v9 partitionInterval:v30 completionHandler:v8];
    }
    else
    {
      id v11 = [STFetchedUsageResults alloc];
      v12 = [(STFetchUsageOperation *)self dateInterval];
      int64_t v13 = [(STFetchUsageOperation *)self duration];
      v14 = [(STFetchUsageOperation *)self localUsageReports];
      double v15 = [(STFetchUsageOperation *)self usageReportsByCoreDuetIdentifier];
      double v16 = [(STFetchUsageOperation *)self aggregateUsageReports];
      id v6 = [(STFetchedUsageResults *)v11 initWithDateInterval:v12 partitionDurationInMinutes:v13 localUsageReports:v14 usageReportsByCoreDuetIdentifier:v15 aggregateUsageReports:v16];

      double v17 = +[STLog usage];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = [(STFetchUsageOperation *)self localUsageReports];
        id v18 = (char *)[v29 count];
        id v27 = [(STFetchUsageOperation *)self aggregateUsageReports];
        v19 = &v18[(void)[v27 count]];
        __int16 v26 = [(STFetchUsageOperation *)self aggregateUsageReports];
        if ([v26 count]) {
          CFStringRef v20 = @"YES";
        }
        else {
          CFStringRef v20 = @"NO";
        }
        v21 = [(STFetchUsageOperation *)self dateInterval];
        id v22 = [v21 startDate];
        os_activity_scope_state_s v23 = [(STFetchUsageOperation *)self dateInterval];
        id v24 = [v23 endDate];
        *(_DWORD *)buf = 134218754;
        v34 = v19;
        __int16 v35 = 2112;
        CFStringRef v36 = v20;
        __int16 v37 = 2112;
        v38 = v22;
        __int16 v39 = 2112;
        v40 = v24;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Fetched %lu reports - contains aggregate: %@ - start date: %@ - end date: %@", buf, 0x2Au);
      }
      [(STFetchUsageOperation *)self endOperationWithResultObject:v6];
    }
  }
}

- (void)_recordLocalUsageReports:(id)a3 usageReportsByCoreDuetIdentifier:(id)a4 aggregateUsageReports:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(STFetchUsageOperation *)self localUsageReports];
  [v11 addObjectsFromArray:v10];

  if ([(STFetchUsageOperation *)self includeAggregateUsage])
  {
    v12 = [(STFetchUsageOperation *)self aggregateUsageReports];
    [v12 addObjectsFromArray:v9];
  }
  if ([(STFetchUsageOperation *)self includeRemoteUsage])
  {
    [(STFetchUsageOperation *)self usageReportsByCoreDuetIdentifier];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003ED24;
    v14[3] = &unk_1002FC8D8;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v15;
    [v8 enumerateKeysAndObjectsUsingBlock:v14];
  }
}

- (NSDate)genesisDate
{
  return self->_genesisDate;
}

- (NSDate)lastStartDate
{
  return self->_lastStartDate;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
}

- (USUsageReporter)usageReporter
{
  return self->_usageReporter;
}

- (void)setUsageReporter:(id)a3
{
}

- (NSMutableArray)queryIntervals
{
  return self->_queryIntervals;
}

- (void)setQueryIntervals:(id)a3
{
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (NSMutableArray)localUsageReports
{
  return self->_localUsageReports;
}

- (void)setLocalUsageReports:(id)a3
{
}

- (NSMutableArray)aggregateUsageReports
{
  return self->_aggregateUsageReports;
}

- (void)setAggregateUsageReports:(id)a3
{
}

- (NSMutableDictionary)usageReportsByCoreDuetIdentifier
{
  return self->_usageReportsByCoreDuetIdentifier;
}

- (void)setUsageReportsByCoreDuetIdentifier:(id)a3
{
}

- (BOOL)includeAggregateUsage
{
  return self->_includeAggregateUsage;
}

- (BOOL)includeRemoteUsage
{
  return self->_includeRemoteUsage;
}

- (BOOL)forceRemoteDeviceSync
{
  return self->_forceRemoteDeviceSync;
}

- (int64_t)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageReportsByCoreDuetIdentifier, 0);
  objc_storeStrong((id *)&self->_aggregateUsageReports, 0);
  objc_storeStrong((id *)&self->_localUsageReports, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_queryIntervals, 0);
  objc_storeStrong((id *)&self->_usageReporter, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_lastStartDate, 0);
  objc_storeStrong((id *)&self->_genesisDate, 0);
}

@end