@interface _OSActivityHistory
+ (BOOL)isValidBMStoreEventForInactivity:(id)a3;
+ (id)sharedInstance;
- (NSArray)intervalsRecentFromQuery;
- (NSArray)intervalsSameDayOfWeekAsQuery;
- (NSArray)intervalsSameWorkOrOffAsQuery;
- (double)hoursUntilNextActivityAtDate:(id)a3;
- (double)recommendedDecayDegree;
- (id)getDailyAnchorsForDate:(id)a3 whichStrata:(int64_t)a4;
- (id)getHistoryStrata:(int64_t)a3 endsBefore:(id)a4;
- (id)getPastSliceTimewiseNearDate:(id)a3 whichStrata:(int64_t)a4 earlyBoundaryInSeconds:(double)a5 laterBoundaryInSeconds:(double)a6 clipIntervals:(BOOL)a7;
- (id)historicalSecondsSinceInactiveAtDate:(id)a3 whichStrata:(int64_t)a4;
- (id)historicalTimesUntilNextActivityAtDate:(id)a3 whichStrata:(int64_t)a4 useDecay:(BOOL)a5;
- (void)clearActivityHistory;
- (void)loadHistoryFromUnderlyingDataSource;
- (void)setIntervalsRecentFromQuery:(id)a3;
- (void)setIntervalsSameDayOfWeekAsQuery:(id)a3;
- (void)setIntervalsSameWorkOrOffAsQuery:(id)a3;
- (void)updateStratasWithQueryDate:(id)a3;
@end

@implementation _OSActivityHistory

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C2E8;
  block[3] = &unk_100064720;
  block[4] = a1;
  if (qword_10007A840 != -1) {
    dispatch_once(&qword_10007A840, block);
  }
  v2 = (void *)qword_10007A838;

  return v2;
}

- (void)loadHistoryFromUnderlyingDataSource
{
  v3 = (void *)os_transaction_create();
  v4 = BiomeLibrary();
  v5 = [v4 Activity];
  v33 = [v5 Level];

  id v6 = objc_alloc((Class)BMPublisherOptions);
  v7 = +[NSDate dateWithTimeIntervalSinceNow:-5184000.0];
  v8 = +[NSDate now];
  id v9 = [v6 initWithStartDate:v7 endDate:v8 maxEvents:8000 lastN:0 reversed:0];

  v28 = v9;
  v32 = [v33 publisherWithOptions:v9];
  v10 = BiomeLibrary();
  v11 = [v10 Device];
  v12 = [v11 TimeZone];
  v31 = [v12 publisher];

  v30 = [v31 orderedMergeWithOther:v32 comparator:&stru_100064998];
  v29 = [v30 filterWithIsIncluded:&stru_1000649D8];
  id v13 = [objc_alloc((Class)BPSTuple) initWithFirst:0 second:0];
  v14 = [v29 scanWithInitial:v13 nextPartialResult:&stru_100064A18];

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10000CA48;
  v44[3] = &unk_100064A40;
  v44[4] = self;
  v15 = [v14 filterWithIsIncluded:v44];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_10000CAB4;
  v42 = sub_10000CAC4;
  id v43 = (id)objc_opt_new();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_10000CAB4;
  v36[4] = sub_10000CAC4;
  id v37 = 0;
  v16 = [v15 filterWithIsIncluded:&stru_100064A80];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000CB20;
  v35[3] = &unk_100064AA8;
  v35[4] = self;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000CB84;
  v34[3] = &unk_100064AD0;
  v34[4] = self;
  v34[5] = v36;
  v34[6] = &v38;
  id v17 = [v16 sinkWithCompletion:v35 receiveInput:v34];

  [(_OSIntervalHistory *)self setAllIntervalsSortByStartAsc:v39[5]];
  v18 = [(_OSIntervalHistory *)self log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
    id v20 = [v19 count];
    *(_DWORD *)buf = 134217984;
    id v46 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Constructed %lu active interval(s) from Biome", buf, 0xCu);
  }
  v21 = +[NSDate now];
  [(_OSIntervalHistory *)self setLastRefreshDate:v21];

  v22 = [(_OSIntervalHistory *)self log];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [(_OSIntervalHistory *)self lastRefreshDate];
    v24 = [(_OSIntervalHistory *)self oldestIntervalInHistory];
    v25 = [v24 startDate];
    v26 = [(_OSIntervalHistory *)self newestIntervalInHistory];
    v27 = [v26 endDate];
    *(_DWORD *)buf = 138412802;
    id v46 = v23;
    __int16 v47 = 2112;
    v48 = v25;
    __int16 v49 = 2112;
    v50 = v27;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Reloaded from Biome at %@ with activities ranging from %@ to %@", buf, 0x20u);
  }
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(&v38, 8);
}

- (void)updateStratasWithQueryDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_OSIntervalHistory *)self lastQueryDate];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(_OSIntervalHistory *)self lastQueryDate];
    if (v7 == v4)
    {
      v15 = [(_OSActivityHistory *)self intervalsSameDayOfWeekAsQuery];
      id v7 = v4;
      if (v15)
      {
        uint64_t v16 = [(_OSActivityHistory *)self intervalsSameWorkOrOffAsQuery];
        if (v16)
        {
          id v17 = (void *)v16;
          v18 = [(_OSActivityHistory *)self intervalsRecentFromQuery];

          if (v18) {
            goto LABEL_7;
          }
          goto LABEL_4;
        }

        id v7 = v4;
      }
    }
  }
LABEL_4:
  v8 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
  id v9 = +[OSIntelligenceUtilities filterEvents:v8 withDateDistance:7 fromDate:v4];
  [(_OSActivityHistory *)self setIntervalsSameDayOfWeekAsQuery:v9];

  v10 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
  v11 = +[OSIntelligenceUtilities filterEvents:v10 withSameWorkOrOffStatusAs:v4];
  [(_OSActivityHistory *)self setIntervalsSameWorkOrOffAsQuery:v11];

  v12 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
  id v13 = +[OSIntelligenceUtilities filterEvents:v12 isRecentForDate:v4 goingDaysBack:3 useEndDate:1];
  [(_OSActivityHistory *)self setIntervalsRecentFromQuery:v13];

  v14 = [(_OSIntervalHistory *)self log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1000419F0((uint64_t)v4, self, v14);
  }

  [(_OSIntervalHistory *)self setLastQueryDate:v4];
LABEL_7:
}

- (double)recommendedDecayDegree
{
  return 0.04;
}

- (double)hoursUntilNextActivityAtDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000D14C;
  v15[3] = &unk_100064AF8;
  id v6 = v4;
  id v16 = v6;
  id v7 = [v5 indexOfObjectPassingTest:v15];

  double v8 = 24.0;
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
    v10 = [v9 objectAtIndexedSubscript:v7];
    v11 = [v10 startDate];
    [v11 timeIntervalSinceDate:v6];
    double v13 = v12 / 3600.0;

    double v8 = fmin(v13, 24.0);
  }

  return v8;
}

- (id)historicalTimesUntilNextActivityAtDate:(id)a3 whichStrata:(int64_t)a4 useDecay:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(_OSIntervalHistory *)self refreshCacheIfStaleWithQueryDate:v8];
  id v9 = objc_opt_new();
  [(_OSActivityHistory *)self getDailyAnchorsForDate:v8 whichStrata:a4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v15 = +[OSIntelligenceUtilities datewiseDistanceBetweenDate:v8 andDate:v14];
        double v16 = 1.0;
        if (v5)
        {
          +[OSIntelligenceUtilities exponentialDecayByDateDistance:v15 withDegree:0.04];
          double v16 = v17;
        }
        [(_OSActivityHistory *)self hoursUntilNextActivityAtDate:v14];
        v19 = +[NSNumber numberWithDouble:v16 * v18];
        [v9 addObject:v19];
      }
      id v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  return v9;
}

- (id)historicalSecondsSinceInactiveAtDate:(id)a3 whichStrata:(int64_t)a4
{
  id v6 = a3;
  [(_OSIntervalHistory *)self refreshCacheIfStaleWithQueryDate:v6];
  id v7 = objc_opt_new();
  id v20 = v6;
  id v8 = [(_OSActivityHistory *)self getDailyAnchorsForDate:v6 whichStrata:a4];
  id v9 = [(_OSIntervalHistory *)self newestIntervalInHistory];
  id v10 = [v9 endDate];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        double v17 = [v16 laterDate:v10];

        if (v17 != v16)
        {
          +[OSIntelligenceUtilities secondsSinceBecomingInactiveAtDate:v16];
          double v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v7 addObject:v18];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  return v7;
}

+ (BOOL)isValidBMStoreEventForInactivity:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  BOOL v5 = [v3 eventBody];

  if (!v5) {
    goto LABEL_8;
  }
  id v6 = [v4 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v8 = [v4 eventBody];
  id v9 = v8;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      id v9 = [v4 eventBody];
      unsigned __int8 v10 = [v9 hasStarting];
      goto LABEL_7;
    }
LABEL_8:
    BOOL v12 = 0;
    goto LABEL_9;
  }
  unsigned __int8 v10 = [v8 hasInUseStatus];
LABEL_7:
  BOOL v12 = v10;

LABEL_9:
  return v12;
}

- (id)getHistoryStrata:(int64_t)a3 endsBefore:(id)a4
{
  id v6 = a4;
  [(_OSIntervalHistory *)self refreshCacheIfStaleWithQueryDate:v6];
  switch(a3)
  {
    case 0:
      goto LABEL_6;
    case 1:
      uint64_t v7 = 40;
      goto LABEL_9;
    case 2:
      uint64_t v7 = 48;
      goto LABEL_9;
    case 3:
      uint64_t v7 = 56;
LABEL_9:
      id v9 = *(id *)((char *)&self->super.super.isa + v7);
      break;
    default:
      id v8 = [(_OSIntervalHistory *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100041B30(a3, v8);
      }

LABEL_6:
      id v9 = [(_OSIntervalHistory *)self allIntervalsSortByStartAsc];
      break;
  }
  unsigned __int8 v10 = v9;
  char v11 = +[NSPredicate predicateWithFormat:@"endDate <= %@", v6];
  BOOL v12 = [v10 filteredArrayUsingPredicate:v11];

  return v12;
}

- (id)getPastSliceTimewiseNearDate:(id)a3 whichStrata:(int64_t)a4 earlyBoundaryInSeconds:(double)a5 laterBoundaryInSeconds:(double)a6 clipIntervals:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  [(_OSIntervalHistory *)self refreshCacheIfStaleWithQueryDate:v12];
  id v13 = objc_opt_new();
  if (a5 >= a6)
  {
    v29 = [(_OSIntervalHistory *)self log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100041BA8(v29, a5, a6);
    }

    id v18 = v13;
    id v40 = v18;
  }
  else
  {
    uint64_t v14 = [(_OSActivityHistory *)self getHistoryStrata:a4 endsBefore:v12];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10000DBB8;
    v46[3] = &unk_100064B20;
    id v15 = v12;
    id v47 = v15;
    double v48 = a5;
    double v49 = a6;
    double v16 = v14;
    double v17 = +[NSPredicate predicateWithBlock:v46];
    id v18 = [v14 filteredArrayUsingPredicate:v17];

    if ([v18 count])
    {
      v39 = self;
      if (v7)
      {
        int64_t v34 = a4;
        v35 = v17;
        id v37 = v16;
        id v38 = v12;
        id v40 = (id)objc_opt_new();
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v36 = v18;
        id obj = v18;
        id v19 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v43;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v43 != v21) {
                objc_enumerationMutation(obj);
              }
              long long v23 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              long long v24 = +[OSIntelligenceUtilities clipInterval:withTimewiseSliceDefineBy:leftBoundary:rightBoundary:](OSIntelligenceUtilities, "clipInterval:withTimewiseSliceDefineBy:leftBoundary:rightBoundary:", v23, v15, a5, a6, v34);
              long long v25 = [_OSActivityInterval alloc];
              v26 = [v24 startDate];
              v27 = [v24 endDate];
              v28 = -[_OSActivityInterval initWithStartDate:andEndDate:andActiveStatus:](v25, "initWithStartDate:andEndDate:andActiveStatus:", v26, v27, [v23 isActive]);

              if ([(_OSIInterval *)v28 isValidInterval]
                && [(_OSActivityInterval *)v28 hasReasonableDuration])
              {
                [v40 addObject:v28];
              }
            }
            id v20 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v20);
        }

        if ([v40 count])
        {
          double v16 = v37;
          id v12 = v38;
          double v17 = v35;
          id v18 = v36;
        }
        else
        {
          v32 = [(_OSIntervalHistory *)v39 log];
          id v12 = v38;
          double v17 = v35;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138413058;
            id v52 = v15;
            __int16 v53 = 2048;
            int64_t v54 = v34;
            __int16 v55 = 2048;
            double v56 = a5;
            __int16 v57 = 2048;
            double v58 = a6;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "WARNING: no interval left after clipping at %@ for strata=%lu and bounds=(%.2f, %.2f)", buf, 0x2Au);
          }

          id v18 = v36;
          double v16 = v37;
        }
      }
      else
      {
        id v40 = v18;
      }
    }
    else
    {
      v30 = v16;
      v31 = [(_OSIntervalHistory *)self log];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        id v52 = v15;
        __int16 v53 = 2048;
        int64_t v54 = a4;
        __int16 v55 = 2048;
        double v56 = a5;
        __int16 v57 = 2048;
        double v58 = a6;
        _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "WARNING: vertical slice is empty for at %@ strata=%lu and bounds=(%.2f, %.2f)", buf, 0x2Au);
      }

      id v40 = v18;
      double v16 = v30;
    }
  }

  return v40;
}

- (id)getDailyAnchorsForDate:(id)a3 whichStrata:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = objc_opt_new();
  id v8 = [(_OSIntervalHistory *)self oldestIntervalInHistory];
  id v9 = [v8 startDate];
  unsigned int v10 = +[OSIntelligenceUtilities datewiseDistanceBetweenDate:v6 andDate:v9];

  if ((v10 & 0x80000000) == 0)
  {
    int v11 = v10 + 1;
    int v12 = -v10;
    do
    {
      id v13 = +[NSDate dateWithTimeInterval:v6 sinceDate:(double)v12 * 86400.0];
      switch(a4)
      {
        case 1:
          unsigned int v14 = +[OSIntelligenceUtilities pandasWeekdayOf:v6];
          unsigned int v15 = +[OSIntelligenceUtilities pandasWeekdayOf:v13];
          break;
        case 3:
          [v6 timeIntervalSinceDate:v13];
          if (v16 > 259200.0) {
            goto LABEL_12;
          }
LABEL_11:
          [v7 addObject:v13];
          goto LABEL_12;
        case 2:
          unsigned int v14 = +[OSIntelligenceUtilities isRestDay:v6];
          unsigned int v15 = +[OSIntelligenceUtilities isRestDay:v13];
          break;
        default:
          goto LABEL_11;
      }
      if (v14 == v15) {
        goto LABEL_11;
      }
LABEL_12:

      --v11;
      ++v12;
    }
    while (v11 > 0);
  }

  return v7;
}

- (void)clearActivityHistory
{
  id v3 = (id)objc_opt_new();
  [(_OSIntervalHistory *)self setAllIntervalsSortByStartAsc:v3];
}

- (NSArray)intervalsSameDayOfWeekAsQuery
{
  return self->_intervalsSameDayOfWeekAsQuery;
}

- (void)setIntervalsSameDayOfWeekAsQuery:(id)a3
{
}

- (NSArray)intervalsSameWorkOrOffAsQuery
{
  return self->_intervalsSameWorkOrOffAsQuery;
}

- (void)setIntervalsSameWorkOrOffAsQuery:(id)a3
{
}

- (NSArray)intervalsRecentFromQuery
{
  return self->_intervalsRecentFromQuery;
}

- (void)setIntervalsRecentFromQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalsRecentFromQuery, 0);
  objc_storeStrong((id *)&self->_intervalsSameWorkOrOffAsQuery, 0);

  objc_storeStrong((id *)&self->_intervalsSameDayOfWeekAsQuery, 0);
}

@end