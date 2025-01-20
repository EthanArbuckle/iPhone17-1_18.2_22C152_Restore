@interface _OSLockHistory
+ (BOOL)isLockedBiomeScreenLockedEvent:(id)a3;
+ (id)sharedInstance;
- (BOOL)didDateTakePlaceDuringRecentLongLocks:(id)a3;
- (BOOL)hasEnoughHistoryForInactivityPrediction;
- (NSArray)allUnlocks;
- (NSArray)hourBinsOfLongestLocks;
- (id)getAllLockIntervalsEndingBefore:(id)a3;
- (id)lockedIntervalsQueryWithPredicate:(id)a3;
- (id)projectedDateOfHistorySufficiency;
- (id)unlockEventsIntersectingDateRangeFrom:(id)a3 to:(id)a4;
- (id)unlockedIntervalsQueryWithPredicate:(id)a3;
- (id)userHistoryDiagnosis;
- (id)visualizationFromLongLockHourBinsAtDate:(id)a3;
- (void)addLockIntervalAndSortAscendingByStartDate:(id)a3;
- (void)addLockIntervalsAndSortAscendingByStartDate:(id)a3;
- (void)clearLockAndUnlockHistory;
- (void)loadHistoryFromUnderlyingDataSource;
- (void)setAllUnlocks:(id)a3;
- (void)setHourBinsOfLongestLocks:(id)a3;
- (void)updateStratasWithQueryDate:(id)a3;
@end

@implementation _OSLockHistory

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030C7C;
  block[3] = &unk_100064720;
  block[4] = a1;
  if (qword_10007A8C0 != -1) {
    dispatch_once(&qword_10007A8C0, block);
  }
  v2 = (void *)qword_10007A8B8;

  return v2;
}

- (void)loadHistoryFromUnderlyingDataSource
{
  v31 = (void *)os_transaction_create();
  v3 = BiomeLibrary();
  v4 = [v3 Device];
  v35 = [v4 ScreenLocked];

  id v5 = objc_alloc((Class)BMPublisherOptions);
  v6 = +[NSDate dateWithTimeIntervalSinceNow:-5184000.0];
  v7 = +[NSDate now];
  id v8 = [v5 initWithStartDate:v6 endDate:v7 maxEvents:15000 lastN:0 reversed:0];

  v30 = v8;
  v34 = [v35 publisherWithOptions:v8];
  v9 = BiomeLibrary();
  v10 = [v9 Device];
  v11 = [v10 TimeZone];
  v33 = [v11 publisher];

  v32 = [v33 orderedMergeWithOther:v34 comparator:&stru_1000651E0];
  v12 = [v32 filterWithIsIncluded:&stru_100065200];
  id v13 = [objc_alloc((Class)BPSTuple) initWithFirst:0 second:0];
  v14 = [v12 scanWithInitial:v13 nextPartialResult:&stru_100065220];

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100031480;
  v52[3] = &unk_100064A40;
  v52[4] = self;
  v15 = [v14 filterWithIsIncluded:v52];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_1000314EC;
  v50 = sub_1000314FC;
  id v51 = (id)objc_opt_new();
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_1000314EC;
  v44 = sub_1000314FC;
  id v45 = (id)objc_opt_new();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_1000314EC;
  v38[4] = sub_1000314FC;
  id v39 = 0;
  v16 = [v15 filterWithIsIncluded:&stru_100065240];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100031558;
  v37[3] = &unk_100064AA8;
  v37[4] = self;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000315BC;
  v36[3] = &unk_100065268;
  v36[4] = self;
  v36[5] = v38;
  v36[6] = &v46;
  v36[7] = &v40;
  id v17 = [v16 sinkWithCompletion:v37 receiveInput:v36];

  [(_OSIntervalHistory *)self setAllIntervalsSortByStartAsc:v47[5]];
  [(_OSLockHistory *)self setAllUnlocks:v41[5]];
  v18 = [(_OSIntervalHistory *)self log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
    id v20 = [v19 count];
    v21 = [(_OSLockHistory *)self allUnlocks];
    id v22 = [v21 count];
    *(_DWORD *)buf = 134218240;
    id v54 = v20;
    __int16 v55 = 2048;
    id v56 = v22;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Constructed %lu lock interval(s) and %lu unlock intervals from Biome", buf, 0x16u);
  }
  v23 = +[NSDate now];
  [(_OSIntervalHistory *)self setLastRefreshDate:v23];

  v24 = [(_OSIntervalHistory *)self log];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = [(_OSIntervalHistory *)self lastRefreshDate];
    v26 = [(_OSIntervalHistory *)self oldestIntervalInHistory];
    v27 = [v26 startDate];
    v28 = [(_OSIntervalHistory *)self newestIntervalInHistory];
    v29 = [v28 endDate];
    *(_DWORD *)buf = 138412802;
    id v54 = v25;
    __int16 v55 = 2112;
    id v56 = v27;
    __int16 v57 = 2112;
    v58 = v29;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Reloaded from Biome at %@ with lock events ranging from %@ to %@", buf, 0x20u);
  }
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
}

- (void)updateStratasWithQueryDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_OSIntervalHistory *)self lastQueryDate];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = [(_OSIntervalHistory *)self lastQueryDate];
    if (v7 == v4)
    {
      id v17 = [(_OSLockHistory *)self hourBinsOfLongestLocks];

      if (v17) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v8 = +[NSDate dateWithTimeInterval:v4 sinceDate:-864000.0];
  v9 = [(_OSIntervalHistory *)self oldestIntervalInHistory];
  v10 = [v9 startDate];
  v11 = [v8 laterDate:v10];

  [v4 timeIntervalSinceDate:v11];
  unint64_t v13 = vcvtpd_s64_f64(v12 / 86400.0);
  v14 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
  v15 = +[OSIntelligenceUtilities accumulativelyBinKLongestIntervals:v13 endAfter:v11 startBefore:v4 longerThan:v14 fromIntervals:7200.0];
  [(_OSLockHistory *)self setHourBinsOfLongestLocks:v15];

  v16 = [(_OSIntervalHistory *)self log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134218498;
    unint64_t v19 = v13;
    __int16 v20 = 2112;
    v21 = v11;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Updated hour bins of %ld longest locks ending after %@ & starting before date %@", (uint8_t *)&v18, 0x20u);
  }

  [(_OSIntervalHistory *)self setLastQueryDate:v4];
LABEL_7:
}

- (id)getAllLockIntervalsEndingBefore:(id)a3
{
  id v4 = a3;
  [(_OSIntervalHistory *)self refreshCacheIfStaleWithQueryDate:v4];
  uint64_t v5 = +[NSPredicate predicateWithFormat:@"endDate <= %@", v4];

  v6 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
  id v7 = [v6 filteredArrayUsingPredicate:v5];

  return v7;
}

- (id)unlockEventsIntersectingDateRangeFrom:(id)a3 to:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_OSIntervalHistory *)self refreshCacheIfStaleWithQueryDate:v6];
  id v8 = +[NSPredicate predicateWithFormat:@"((startDate <= %@) AND (endDate >= %@))", v7, v6];

  v9 = [(_OSLockHistory *)self allUnlocks];
  v10 = [v9 filteredArrayUsingPredicate:v8];

  return v10;
}

- (BOOL)didDateTakePlaceDuringRecentLongLocks:(id)a3
{
  id v4 = a3;
  [(_OSIntervalHistory *)self refreshCacheIfStaleWithQueryDate:v4];
  +[OSIntelligenceUtilities hourFromDate:v4];
  double v6 = v5;

  id v7 = [(_OSLockHistory *)self hourBinsOfLongestLocks];
  id v8 = [v7 objectAtIndexedSubscript:(uint64_t)v6];
  BOOL v9 = (int)[v8 intValue] > 0;

  return v9;
}

- (id)visualizationFromLongLockHourBinsAtDate:(id)a3
{
  [(_OSIntervalHistory *)self refreshCacheIfStaleWithQueryDate:a3];
  id v4 = +[NSMutableString string];
  double v5 = [(_OSLockHistory *)self hourBinsOfLongestLocks];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      [v4 appendFormat:@"%02ld: ", v7];
      id v8 = [(_OSLockHistory *)self hourBinsOfLongestLocks];
      BOOL v9 = [v8 objectAtIndexedSubscript:v7];
      uint64_t v10 = (uint64_t)[v9 integerValue];

      if (v10 >= 1)
      {
        do
        {
          [v4 appendString:@"*"];
          --v10;
        }
        while (v10);
      }
      [v4 appendString:@"\n"];
      ++v7;
      v11 = [(_OSLockHistory *)self hourBinsOfLongestLocks];
      id v12 = [v11 count];
    }
    while ((unint64_t)v12 > v7);
  }

  return v4;
}

- (BOOL)hasEnoughHistoryForInactivityPrediction
{
  v3 = +[NSDate now];
  [(_OSIntervalHistory *)self refreshCacheIfStaleWithQueryDate:v3];
  id v4 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
  id v5 = [v4 count];

  if ((unint64_t)v5 < 0x40)
  {
    BOOL v10 = 0;
  }
  else
  {
    id v6 = [(_OSIntervalHistory *)self oldestIntervalInHistory];
    unint64_t v7 = [v6 startDate];
    [v3 timeIntervalSinceDate:v7];
    double v9 = v8;

    BOOL v10 = v9 >= 691200.0;
  }

  return v10;
}

- (id)userHistoryDiagnosis
{
  v3 = +[NSDate now];
  [(_OSIntervalHistory *)self refreshCacheIfStaleWithQueryDate:v3];

  id v4 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
  id v5 = [v4 count];

  id v6 = [(_OSIntervalHistory *)self oldestIntervalInHistory];
  v21 = [(_OSIntervalHistory *)self newestIntervalInHistory];
  unint64_t v7 = +[NSDate date];
  double v8 = [v6 startDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  v11 = +[NSString stringWithFormat:@"[Amount of History] min required: %d days | actual: %f days", 8, v10 / 86400.0];
  id v12 = +[NSString stringWithFormat:@"[Number of Inactive Events] required: %d | actual: %lu", 64, v5];
  unint64_t v13 = [(_OSLockHistory *)self projectedDateOfHistorySufficiency];
  v14 = +[NSLocale currentLocale];
  v15 = [v13 descriptionWithLocale:v14];
  v16 = +[NSString stringWithFormat:@"<Projection> user should reach history sufficiency by %@", v15];

  id v17 = +[NSDate now];
  int v18 = [(_OSLockHistory *)self visualizationFromLongLockHourBinsAtDate:v17];

  unint64_t v19 = +[NSString stringWithFormat:@"%@\n%@\n\n%@\n\n<Oldest lock>\n%@\n<Newest lock>\n%@\nLock count: %lu (need at least %d)\n<Recent Longest Locks>\n%@", v11, v12, v16, v6, v21, v5, 64, v18];

  return v19;
}

- (id)projectedDateOfHistorySufficiency
{
  v3 = +[NSDate now];
  [(_OSIntervalHistory *)self refreshCacheIfStaleWithQueryDate:v3];

  id v4 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
  id v5 = [v4 count];

  id v6 = [(_OSIntervalHistory *)self oldestIntervalInHistory];
  unint64_t v7 = [(_OSIntervalHistory *)self newestIntervalInHistory];
  double v8 = [v6 startDate];
  double v9 = +[NSDate dateWithTimeInterval:v8 sinceDate:691200.0];

  if ((unint64_t)v5 >= 2 && v6 && v7)
  {
    uint64_t v10 = 64 - (void)v5;
    double v11 = (double)(unint64_t)v5;
    id v12 = [v7 endDate];
    unint64_t v13 = [v6 startDate];
    [v12 timeIntervalSinceDate:v13];
    v15 = +[NSNumber numberWithDouble:v11 / v14];

    [v15 doubleValue];
    double v17 = (double)v10 / v16;
    int v18 = [v7 endDate];
    unint64_t v19 = +[NSDate dateWithTimeInterval:v18 sinceDate:v17];

    id v20 = [v9 laterDate:v19];
  }
  else
  {
    id v20 = v9;
  }

  return v20;
}

- (id)lockedIntervalsQueryWithPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
  id v6 = [v5 filteredArrayUsingPredicate:v4];

  return v6;
}

- (id)unlockedIntervalsQueryWithPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [(_OSLockHistory *)self allUnlocks];
  id v6 = [v5 filteredArrayUsingPredicate:v4];

  return v6;
}

- (void)addLockIntervalAndSortAscendingByStartDate:(id)a3
{
  id v6 = a3;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];

  -[_OSLockHistory addLockIntervalsAndSortAscendingByStartDate:](self, "addLockIntervalsAndSortAscendingByStartDate:", v5, v6);
}

- (void)addLockIntervalsAndSortAscendingByStartDate:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_opt_new();
    id v6 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        double v11 = 0;
        do
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v11);
          if (v12
            && objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * (void)v11), "isValidInterval", (void)v23)&& objc_msgSend(v12, "hasReasonableDuration"))
          {
            if ([v12 isLocked]) {
              unint64_t v13 = v5;
            }
            else {
              unint64_t v13 = v6;
            }
            [v13 addObject:v12];
          }
          double v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v9);
    }

    id v14 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    if ([v5 count])
    {
      v15 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
      id v16 = [v15 mutableCopy];

      [v16 addObjectsFromArray:v5];
      id v28 = v14;
      double v17 = +[NSArray arrayWithObjects:&v28 count:1];
      [v16 sortUsingDescriptors:v17];

      id v18 = [v16 copy];
      [(_OSIntervalHistory *)self setAllIntervalsSortByStartAsc:v18];
    }
    else
    {
      id v16 = 0;
    }
    if (objc_msgSend(v6, "count", (void)v23))
    {
      unint64_t v19 = [(_OSLockHistory *)self allUnlocks];
      id v20 = [v19 mutableCopy];

      [v20 addObjectsFromArray:v6];
      id v27 = v14;
      v21 = +[NSArray arrayWithObjects:&v27 count:1];
      [v20 sortUsingDescriptors:v21];

      id v22 = [v20 copy];
      [(_OSLockHistory *)self setAllUnlocks:v22];

      id v16 = v20;
    }
  }
}

- (void)clearLockAndUnlockHistory
{
  v3 = objc_opt_new();
  [(_OSIntervalHistory *)self setAllIntervalsSortByStartAsc:v3];

  id v4 = (id)objc_opt_new();
  [(_OSLockHistory *)self setAllUnlocks:v4];
}

+ (BOOL)isLockedBiomeScreenLockedEvent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  uint64_t v5 = [v3 eventBody];
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = (void *)v5;
  id v7 = [v4 eventBody];
  unsigned int v8 = [v7 hasStarting];

  if (v8)
  {
    id v9 = [v4 eventBody];
    unsigned __int8 v10 = [v9 starting];
  }
  else
  {
LABEL_5:
    unsigned __int8 v10 = 1;
  }

  return v10;
}

- (NSArray)allUnlocks
{
  return self->_allUnlocks;
}

- (void)setAllUnlocks:(id)a3
{
}

- (NSArray)hourBinsOfLongestLocks
{
  return self->_hourBinsOfLongestLocks;
}

- (void)setHourBinsOfLongestLocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hourBinsOfLongestLocks, 0);

  objc_storeStrong((id *)&self->_allUnlocks, 0);
}

@end