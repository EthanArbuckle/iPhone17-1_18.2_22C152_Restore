@interface CLMetricEventBins
- (BOOL)createAggPeriodIfApplicable:(double)a3;
- (CLMetricEventBins)initWithAnalyticsEvent:(id)a3 binPeriod:(int)a4 atCurrentTime:(double)a5;
- (CLMetricEventBins)initWithIdentifier:(id)a3 asExternal:(BOOL)a4 binPeriod:(int)a5 aggregationPeriod:(int)a6 atCurrentTime:(double)a7 andSubmit:(BOOL)a8;
- (CLMetricEventBins)initWithInternalName:(id)a3 binPeriod:(int)a4 aggregationPeriod:(int)a5 atCurrentTime:(double)a6 andSubmit:(BOOL)a7;
- (NSString)dimensionStr;
- (id)testGetCurrentMode;
- (id)testGetSubmissions;
- (int)binIndex:(double)a3;
- (int)countMatchesInA:(id)a3 andB:(id)a4;
- (int)dimensionInt;
- (int)fuzzPrivacyHours:(int)a3;
- (int)localSecondsIntoDay:(double)a3;
- (int)periodIndex:(double)a3;
- (int)testGetCountForMode:(id)a3 andPeriod:(int)a4;
- (int)testGetDailyCount;
- (int)testGetDailyTotal;
- (int)testGetDistributionBinAnchor;
- (int)testGetModeReferenceBin;
- (int)testModeCountAtPeriod:(int)a3;
- (void)checkSubmissionAtPeriod:(int)a3;
- (void)computeIntervalDistributionsForPeriod:(int)a3;
- (void)computeModeSubmissionForPeriod:(int)a3;
- (void)computePercentageAndSubmit:(int)a3;
- (void)dealloc;
- (void)fillModesUptoTime:(double)a3 atChange:(BOOL)a4;
- (void)processEventTime:(double)a3;
- (void)processEventTimeRangeFrom:(double)a3 to:(double)a4;
- (void)processEventTimes:(id)a3;
- (void)removeLingeringEntriesAtPeriod:(int)a3;
- (void)reset:(double)a3;
- (void)setDimensionInt:(int)a3;
- (void)setDimensionStr:(id)a3;
- (void)setHourAmbiguity:(int)a3;
- (void)setIndependentMode:(id)a3 atTime:(double)a4 startingWith:(id)a5;
- (void)setIntervalDistributions:(id)a3;
- (void)setMetricDimensions:(id)a3;
- (void)setRelatedModes:(id)a3 atTime:(double)a4 startingWith:(id)a5 andTransitions:(BOOL)a6;
- (void)submitIntervalMetricsForEvent:(id)a3;
- (void)submitModeMetricsForEvent:(id)a3;
- (void)submitPercentageMetricsForEvent:(id)a3;
- (void)testClearSubmissions;
- (void)testSkipSumbission;
- (void)updateIndependentMode:(id)a3 toState:(id)a4 atTime:(double)a5;
- (void)updateRelatedModesTo:(id)a3 atTime:(double)a4;
- (void)updateToCurrentTime:(double)a3;
@end

@implementation CLMetricEventBins

- (CLMetricEventBins)initWithInternalName:(id)a3 binPeriod:(int)a4 aggregationPeriod:(int)a5 atCurrentTime:(double)a6 andSubmit:(BOOL)a7
{
  return [(CLMetricEventBins *)self initWithIdentifier:a3 asExternal:0 binPeriod:*(void *)&a4 aggregationPeriod:*(void *)&a5 atCurrentTime:a7 andSubmit:a6];
}

- (CLMetricEventBins)initWithAnalyticsEvent:(id)a3 binPeriod:(int)a4 atCurrentTime:(double)a5
{
  return [(CLMetricEventBins *)self initWithIdentifier:a3 asExternal:1 binPeriod:*(void *)&a4 aggregationPeriod:3600 atCurrentTime:1 andSubmit:a5];
}

- (CLMetricEventBins)initWithIdentifier:(id)a3 asExternal:(BOOL)a4 binPeriod:(int)a5 aggregationPeriod:(int)a6 atCurrentTime:(double)a7 andSubmit:(BOOL)a8
{
  if (a6 > 86400 || (int v11 = a6 / a5, a6 % a5) || a6 < 300 || 86400 % a6)
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    v24 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289795;
      int v30 = 0;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2081;
      v34 = (const char *)[a3 UTF8String];
      __int16 v35 = 1026;
      int v36 = a5;
      __int16 v37 = 1026;
      int v38 = a6;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#cabin init, invalid bin/aggregation periods, returning nil\", \"id\":%{private, location:escape_only}s, \"bin\":%{public}d, \"aggregation\":%{public}d}", buf, 0x28u);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022FA0C8);
      }
    }
    v25 = qword_102419558;
    if (os_signpost_enabled((os_log_t)qword_102419558))
    {
      v26 = (const char *)[a3 UTF8String];
      *(_DWORD *)buf = 68289795;
      int v30 = 0;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2081;
      v34 = v26;
      __int16 v35 = 1026;
      int v36 = a5;
      __int16 v37 = 1026;
      int v38 = a6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#cabin init, invalid bin/aggregation periods, returning nil", "{\"msg%{public}.0s\":\"#cabin init, invalid bin/aggregation periods, returning nil\", \"id\":%{private, location:escape_only}s, \"bin\":%{public}d, \"aggregation\":%{public}d}", buf, 0x28u);
    }
    return 0;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)CLMetricEventBins;
    v15 = [(CLMetricEventBins *)&v28 init];
    v16 = v15;
    if (v15)
    {
      v15->_isExternal = a4;
      v15->_metricId = (NSString *)a3;
      v15->_int binPeriod = a5;
      v15->_int aggregationPeriod = a6;
      v15->_int periodsInDay = 0x15180u / a6;
      v15->_int nBins = v11;
      v15->_BOOL submitMetrics = a8;
      v15->_aggregationDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v16->_percentMetrics = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v16->_privacyHours = -1;
      v16->_intervalDistributions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v16->_intervalDistributionStrings = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v16->_intervalMetrics = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      *(void *)&v16->_modeRefBin = -1;
      v16->_modeAggregation = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v16->_modeDailyMatch = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v16->_modeDailyTotal = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v16->_modeMetrics = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v16->_testSubmissions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022FA0C8);
      }
      v17 = qword_102419558;
      if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [(NSString *)v16->_metricId UTF8String];
        int binPeriod = v16->_binPeriod;
        int aggregationPeriod = v16->_aggregationPeriod;
        int periodsInDay = v16->_periodsInDay;
        int nBins = v16->_nBins;
        BOOL submitMetrics = v16->_submitMetrics;
        *(_DWORD *)buf = 68290819;
        __int16 v31 = 2082;
        int v30 = 0;
        v32 = "";
        __int16 v33 = 2081;
        v34 = v18;
        __int16 v35 = 1026;
        int v36 = binPeriod;
        __int16 v37 = 1026;
        int v38 = aggregationPeriod;
        __int16 v39 = 1026;
        int v40 = (int)a7;
        __int16 v41 = 1026;
        int v42 = periodsInDay;
        __int16 v43 = 1026;
        int v44 = nBins;
        __int16 v45 = 1026;
        BOOL v46 = submitMetrics;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin init\", \"id\":%{private, location:escape_only}s, \"bin\":%{public}d, \"aggregate\":%{public}d, \"now\":%{public}d, \"periods\":%{public}d, \"bins\":%{public}d, \"submit\":%{public}d}", buf, 0x40u);
      }
      [(CLMetricEventBins *)v16 reset:a7];
    }
  }
  return v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMetricEventBins;
  [(CLMetricEventBins *)&v3 dealloc];
}

- (void)setHourAmbiguity:(int)a3
{
  if (self->_isExternal) {
    self->_privacyHours = a3;
  }
}

- (void)setMetricDimensions:(id)a3
{
  if (self->_isExternal)
  {
    [(NSMutableDictionary *)self->_dimensionDict removeAllObjects];

    self->_dimensionDict = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:a3];
    [(NSMutableDictionary *)self->_percentMetrics removeAllObjects];
    [(NSMutableDictionary *)self->_percentMetrics addEntriesFromDictionary:a3];
    [(NSMutableDictionary *)self->_intervalMetrics removeAllObjects];
    [(NSMutableDictionary *)self->_intervalMetrics addEntriesFromDictionary:a3];
    [(NSMutableDictionary *)self->_modeMetrics removeAllObjects];
    modeMetrics = self->_modeMetrics;
    [(NSMutableDictionary *)modeMetrics addEntriesFromDictionary:a3];
  }
  else
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    v6 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_ERROR))
    {
      v7 = [(NSString *)self->_metricId UTF8String];
      int v10 = 68289283;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2081;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#cabin setMetricDimensions only for external events\", \"id\":%{private, location:escape_only}s}", (uint8_t *)&v10, 0x1Cu);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022FA0C8);
      }
    }
    v8 = qword_102419558;
    if (os_signpost_enabled((os_log_t)qword_102419558))
    {
      v9 = [(NSString *)self->_metricId UTF8String];
      int v10 = 68289283;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2081;
      v15 = v9;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#cabin setMetricDimensions only for external events", "{\"msg%{public}.0s\":\"#cabin setMetricDimensions only for external events\", \"id\":%{private, location:escape_only}s}", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)setIntervalDistributions:(id)a3
{
  [(NSMutableArray *)self->_intervalDistributions removeAllObjects];
  [(NSMutableDictionary *)self->_intervalMetrics removeAllObjects];
  [(NSMutableDictionary *)self->_intervalMetrics addEntriesFromDictionary:self->_dimensionDict];
  id v22 = a3;
  v5 = [(NSArray *)[+[NSSet setWithArray:a3] allObjects] sortedArrayUsingSelector:"compare:"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = -1;
    uint64_t v9 = *(void *)v24;
    do
    {
      int v10 = 0;
      int v11 = v8;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(id *)(*((void *)&v23 + 1) + 8 * (void)v10);
        int v8 = (int)[v12 intValue] / self->_binPeriod;
        [(NSMutableArray *)self->_intervalDistributions addObject:+[NSNumber numberWithInt:(v8 + 1)]];
        id v13 = [(NSArray *)v5 firstObject];
        intervalDistributionStrings = self->_intervalDistributionStrings;
        int binPeriod = self->_binPeriod;
        if (v12 == v13) {
          v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(0 - %d]"), (binPeriod * v8), v21;
        }
        else {
          v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(%d - %d]"), (binPeriod * v11), (binPeriod * v8);
        }
        [(NSMutableArray *)intervalDistributionStrings addObject:v16];
        if (v12 == [(NSArray *)v5 lastObject]) {
          [(NSMutableArray *)self->_intervalDistributionStrings addObject:+[NSString stringWithFormat:@"> %d", (self->_binPeriod * v8)]];
        }
        int v10 = (char *)v10 + 1;
        int v11 = v8;
      }
      while (v7 != v10);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v39 count:16];
    }
    while (v7);
  }
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022FA0C8);
  }
  v17 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(NSString *)self->_metricId UTF8String];
    intervalDistributions = self->_intervalDistributions;
    v20 = self->_intervalDistributionStrings;
    *(_DWORD *)buf = 68290050;
    int v28 = 0;
    __int16 v29 = 2082;
    int v30 = "";
    __int16 v31 = 2082;
    v32 = v18;
    __int16 v33 = 2114;
    id v34 = v22;
    __int16 v35 = 2114;
    int v36 = intervalDistributions;
    __int16 v37 = 2114;
    int v38 = v20;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin provide dist\", \"id\":%{public, location:escape_only}s, \"in\":%{public, location:escape_only}@, \"dist\":%{public, location:escape_only}@, \"str\":%{public, location:escape_only}@}", buf, 0x3Au);
  }
}

- (void)setRelatedModes:(id)a3 atTime:(double)a4 startingWith:(id)a5 andTransitions:(BOOL)a6
{
  BOOL v6 = a6;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  modeAggregation = self->_modeAggregation;
  id v12 = [(NSMutableDictionary *)modeAggregation countByEnumeratingWithState:&v33 objects:v56 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(modeAggregation);
        }
        uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        [[self->_modeAggregation objectForKeyedSubscript:v16] removeAllObjects];
        [self->_modeDailyMatch[v16] removeAllObjects];
        [self->_modeDailyTotal[v16] removeAllObjects];
      }
      id v13 = [(NSMutableDictionary *)modeAggregation countByEnumeratingWithState:&v33 objects:v56 count:16];
    }
    while (v13);
  }
  [(NSMutableDictionary *)self->_modeAggregation removeAllObjects];
  [(NSMutableDictionary *)self->_modeDailyMatch removeAllObjects];
  [(NSMutableDictionary *)self->_modeDailyTotal removeAllObjects];
  [(NSMutableDictionary *)self->_modeMetrics removeAllObjects];
  [(NSMutableDictionary *)self->_modeMetrics addEntriesFromDictionary:self->_dimensionDict];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = [a3 countByEnumeratingWithState:&v29 objects:v55 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(a3);
        }
        uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
        [(NSMutableDictionary *)self->_modeAggregation setObject:objc_alloc_init((Class)NSMutableDictionary) forKey:v21];
        [(NSMutableDictionary *)self->_modeDailyMatch setObject:&off_1023934D0 forKey:v21];
        [(NSMutableDictionary *)self->_modeDailyTotal setObject:&off_1023934D0 forKey:v21];
      }
      id v18 = [a3 countByEnumeratingWithState:&v29 objects:v55 count:16];
    }
    while (v18);
  }
  if (v6)
  {
    [(NSMutableDictionary *)self->_modeAggregation setObject:objc_alloc_init((Class)NSMutableDictionary) forKey:@"transition"];
    [(NSMutableDictionary *)self->_modeDailyMatch setObject:&off_1023934D0 forKey:@"transition"];
    [(NSMutableDictionary *)self->_modeDailyTotal setObject:&off_1023934D0 forKey:@"transition"];
  }
  self->_int initModePeriod = [(CLMetricEventBins *)self periodIndex:a4];
  self->_int modeRefBin = [(CLMetricEventBins *)self binIndex:a4];
  self->_BOOL modeTransitions = v6;
  self->_currentMode = (NSMutableString *)[objc_alloc((Class)NSMutableString) initWithString:a5];
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022FA0C8);
  }
  id v22 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    long long v23 = [(NSString *)self->_metricId UTF8String];
    int modeRefBin = self->_modeRefBin;
    int initModePeriod = self->_initModePeriod;
    BOOL modeTransitions = self->_modeTransitions;
    id v27 = [(NSMutableString *)self->_currentMode UTF8String];
    dimensionDict = self->_dimensionDict;
    *(_DWORD *)buf = 68290819;
    int v38 = 0;
    __int16 v39 = 2082;
    int v40 = "";
    __int16 v41 = 2081;
    int v42 = v23;
    __int16 v43 = 1026;
    int v44 = initModePeriod;
    __int16 v45 = 1026;
    int v46 = modeRefBin;
    __int16 v47 = 1026;
    BOOL v48 = modeTransitions;
    __int16 v49 = 2114;
    id v50 = a3;
    __int16 v51 = 2082;
    id v52 = v27;
    __int16 v53 = 2114;
    v54 = dimensionDict;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin related modes\", \"id\":%{private, location:escape_only}s, \"period\":%{public}d, \"refbin\":%{public}d, \"transitions\":%{public}d, \"modes\":%{public, location:escape_only}@, \"start\":%{public, location:escape_only}s, \"dimdict\":%{public, location:escape_only}@}", buf, 0x4Cu);
  }
}

- (void)fillModesUptoTime:(double)a3 atChange:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(NSMutableDictionary *)self->_modeAggregation count])
  {
    if ([(CLMetricEventBins *)self periodIndex:a3] > self->_initModePeriod)
    {
      unsigned int v7 = [(CLMetricEventBins *)self binIndex:a3];
      signed int v8 = v7;
      if (v4)
      {
        BOOL modeTransitions = self->_modeTransitions;
        signed int v10 = v7 - modeTransitions;
        signed int v11 = v7 + modeTransitions;
      }
      else
      {
        signed int v10 = v7 - 1;
        signed int v11 = v7;
      }
      uint64_t v14 = self;
      int v15 = v11 - self->_modeRefBin;
      v57 = v14;
      p_int binPeriod = &v14->_binPeriod;
      LODWORD(v14) = v14->_binPeriod;
      int v17 = 3 * (p_binPeriod[1] / (int)v14);
      if (v15 <= 6 * (p_binPeriod[1] / (int)v14))
      {
        if (qword_102419550 != -1) {
          dispatch_once(&qword_102419550, &stru_1022FA0C8);
        }
        long long v23 = qword_102419558;
        if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
        {
          long long v24 = [(NSString *)v57->_metricId UTF8String];
          id v25 = [(NSMutableString *)v57->_currentMode UTF8String];
          unsigned int modeRefBin = v57->_modeRefBin;
          uint64_t buf = 68291075;
          __int16 v66 = 2082;
          v67 = "";
          __int16 v68 = 2081;
          v69 = v24;
          __int16 v70 = 2082;
          *(void *)v71 = v25;
          *(_WORD *)&v71[8] = 1026;
          *(_DWORD *)v72 = (int)a3;
          *(_WORD *)&v72[4] = 1026;
          *(_DWORD *)&v72[6] = v4;
          __int16 v73 = 1026;
          unsigned int v74 = modeRefBin;
          __int16 v75 = 1026;
          *(_DWORD *)v76 = v8;
          *(_WORD *)&v76[4] = 1026;
          *(_DWORD *)&v76[6] = v10;
          __int16 v77 = 1026;
          signed int v78 = v11;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin mode fill\", \"id\":%{private, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"time\":%{public}d, \"change\":%{public}d, \"ref\":%{public}d, \"bin\":%{public}d, \"end\":%{public}d, \"newref\":%{public}d}", (uint8_t *)&buf, 0x4Au);
        }
        id obj = objc_alloc_init((Class)NSMutableSet);
        signed int v27 = v57->_modeRefBin;
        int v28 = 0;
        if (v27 <= v10)
        {
          do
          {
            id v29 = (id)[(CLMetricEventBins *)v57 periodIndex:(double)(v57->_binPeriod * v27)];
            if ((int)v29 > v57->_initModePeriod)
            {
              id v30 = v29;
              if (!objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](v57->_modeAggregation, "objectForKeyedSubscript:", v57->_currentMode), "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v29)))
              {
                [objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](v57->_modeAggregation, "objectForKeyedSubscript:", v57->_currentMode), "setObject:forKey:", objc_alloc_init((Class)NSMutableSet), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v30));
                ++v28;
              }
              [objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](v57->_modeAggregation, "objectForKeyedSubscript:", v57->_currentMode), "objectForKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v30)) addObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v27 % v57->_nBins))];
              [obj addObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v30)];
            }
            ++v27;
          }
          while (v10 + 1 != v27);
        }
        if (v57->_modeTransitions)
        {
          long long v31 = &qword_102419000;
          if (v4)
          {
            id v32 = (id)[(CLMetricEventBins *)v57 periodIndex:a3];
            if ((int)v32 > v57->_initModePeriod)
            {
              id v33 = v32;
              if (!objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](v57->_modeAggregation, "objectForKeyedSubscript:", @"transition"), "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v32)))
              {
                [v57->_modeAggregation objectForKeyedSubscript:@"transition"][@"transition"] = [objc_alloc_init((Class)NSMutableSet) setObject:objc_alloc_init((Class)NSMutableSet) forKey:[NSNumber numberWithInt:v33]];
                ++v28;
              }
              [objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](v57->_modeAggregation, "objectForKeyedSubscript:", @"transition"), "objectForKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v33)) addObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v8 % v57->_nBins))];
              if (qword_102419550 != -1) {
                dispatch_once(&qword_102419550, &stru_1022FA0C8);
              }
              long long v34 = qword_102419558;
              if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
              {
                long long v35 = [(NSString *)v57->_metricId UTF8String];
                id v36 = [[-[NSMutableDictionary objectForKeyedSubscript:](v57->_modeAggregation, "objectForKeyedSubscript:", @"transition") objectForKeyedSubscript:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v33)];
                unsigned int v37 = [[objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](v57->_modeAggregation, "objectForKeyedSubscript:", @"transition")) objectForKeyedSubscript:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v33)] count];
                unsigned int v38 = [[v57->_modeAggregation objectForKeyedSubscript:@"transition"] count];
                uint64_t buf = 68290051;
                __int16 v66 = 2082;
                v67 = "";
                __int16 v68 = 2081;
                v69 = v35;
                __int16 v70 = 2114;
                *(void *)v71 = v36;
                *(_WORD *)&v71[8] = 1026;
                *(_DWORD *)v72 = v37;
                *(_WORD *)&v72[4] = 1026;
                *(_DWORD *)&v72[6] = v38;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#cabin mode fill trans\", \"id\":%{private, location:escape_only}s, \"agg\":%{public, location:escape_only}@, \"count\":%{public}d, \"totalbins\":%{public}d}", (uint8_t *)&buf, 0x32u);
              }
              long long v31 = &qword_102419000;
            }
          }
        }
        else
        {
          long long v31 = &qword_102419000;
        }
        if (v57->_modeRefBin < v11) {
          v57->_unsigned int modeRefBin = v11;
        }
        if (v31[170] != -1) {
          dispatch_once(&qword_102419550, &stru_1022FA0C8);
        }
        __int16 v39 = qword_102419558;
        if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
        {
          int v40 = [(NSString *)v57->_metricId UTF8String];
          int v41 = v57->_modeRefBin;
          uint64_t buf = 68290051;
          __int16 v66 = 2082;
          v67 = "";
          __int16 v68 = 2081;
          v69 = v40;
          __int16 v70 = 1026;
          *(_DWORD *)v71 = v41;
          *(_WORD *)&v71[4] = 1026;
          *(_DWORD *)&v71[6] = v28;
          *(_WORD *)v72 = 2114;
          *(void *)&v72[2] = obj;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin mode fill period\", \"id\":%{private, location:escape_only}s, \"moderef\":%{public}d, \"alloc\":%{public}d, \"modified\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x32u);
        }
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v42 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
        if (v42)
        {
          id v44 = v42;
          uint64_t v45 = *(void *)v61;
          *(void *)&long long v43 = 68290563;
          long long v56 = v43;
          do
          {
            for (i = 0; i != v44; i = (char *)i + 1)
            {
              if (*(void *)v61 != v45) {
                objc_enumerationMutation(obj);
              }
              __int16 v47 = *(void **)(*((void *)&v60 + 1) + 8 * i);
              if (v31[170] != -1) {
                dispatch_once(&qword_102419550, &stru_1022FA0C8);
              }
              BOOL v48 = qword_102419558;
              if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
              {
                __int16 v49 = v57;
                v59 = [(NSString *)v57->_metricId UTF8String];
                id v50 = [(NSMutableString *)v57->_currentMode UTF8String];
                unsigned int v51 = [v47 intValue];
                uint64_t v52 = v45;
                unsigned int v53 = [[v49->_modeAggregation objectForKeyedSubscript:v49->_currentMode] count];
                unsigned int v54 = [[[v49->_modeAggregation objectForKeyedSubscript:v49->_currentMode] objectForKeyedSubscript:v47] count];
                id v55 = [[-[NSMutableDictionary objectForKeyedSubscript:](v49->_modeAggregation, "objectForKeyedSubscript:", v49->_currentMode) objectForKeyedSubscript:v47];
                uint64_t buf = v56;
                __int16 v66 = 2082;
                v67 = "";
                __int16 v68 = 2081;
                v69 = v59;
                long long v31 = &qword_102419000;
                __int16 v70 = 2082;
                *(void *)v71 = v50;
                *(_WORD *)&v71[8] = 1026;
                *(_DWORD *)v72 = v51;
                *(_WORD *)&v72[4] = 1026;
                *(_DWORD *)&v72[6] = v53;
                uint64_t v45 = v52;
                __int16 v73 = 1026;
                unsigned int v74 = v54;
                __int16 v75 = 2114;
                *(void *)v76 = v55;
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#cabin mode fill iter\", \"id\":%{private, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"period\":%{public}d, \"totalbins\":%{public}d, \"n\":%{public}d, \"catdict\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x42u);
              }
            }
            id v44 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
          }
          while (v44);
        }
        -[CLMetricEventBins removeLingeringEntriesAtPeriod:](v57, "removeLingeringEntriesAtPeriod:", -[CLMetricEventBins periodIndex:](v57, "periodIndex:", a3, v56));
      }
      else
      {
        if (qword_102419550 != -1) {
          dispatch_once(&qword_102419550, &stru_1022FA0C8);
        }
        id v18 = qword_102419558;
        if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 2 * v17;
          v20 = [(NSString *)v57->_metricId UTF8String];
          id v21 = [(NSMutableString *)v57->_currentMode UTF8String];
          unsigned int v22 = v57->_modeRefBin;
          uint64_t buf = 68291587;
          __int16 v66 = 2082;
          v67 = "";
          __int16 v68 = 2081;
          v69 = v20;
          __int16 v70 = 2082;
          *(void *)v71 = v21;
          *(_WORD *)&v71[8] = 1026;
          *(_DWORD *)v72 = (int)a3;
          *(_WORD *)&v72[4] = 1026;
          *(_DWORD *)&v72[6] = v4;
          __int16 v73 = 1026;
          unsigned int v74 = v22;
          __int16 v75 = 1026;
          *(_DWORD *)v76 = v8;
          *(_WORD *)&v76[4] = 1026;
          *(_DWORD *)&v76[6] = v10;
          __int16 v77 = 1026;
          signed int v78 = v11;
          __int16 v79 = 1026;
          int v80 = v15;
          __int16 v81 = 1026;
          int v82 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin mode fill forceref\", \"id\":%{private, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"time\":%{public}d, \"change\":%{public}d, \"ref\":%{public}d, \"bin\":%{public}d, \"end\":%{public}d, \"newref\":%{public}d, \"delta\":%{public}d, \"thresh\":%{public}d}", (uint8_t *)&buf, 0x56u);
        }
        v57->_unsigned int modeRefBin = v11;
      }
      return;
    }
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    id v12 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v66 = 2082;
      v67 = "";
      id v13 = "{\"msg%{public}.0s\":\"#cabin mode submit notinit\"}";
      goto LABEL_13;
    }
  }
  else
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    id v12 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v66 = 2082;
      v67 = "";
      id v13 = "{\"msg%{public}.0s\":\"#cabin mode fill empty\"}";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&buf, 0x12u);
    }
  }
}

- (int)countMatchesInA:(id)a3 andB:(id)a4
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  int v7 = 0;
  uint64_t v18 = *(void *)v24;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v24 != v18) {
        objc_enumerationMutation(a3);
      }
      uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = [a4 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v20;
        while (2)
        {
          for (j = 0; j != v11; j = (char *)j + 1)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(a4);
            }
            uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
            unsigned int v15 = [v9 intValue];
            if (v15 == [v14 intValue])
            {
              ++v7;
              goto LABEL_16;
            }
          }
          id v11 = [a4 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_16:
      ;
    }
    id v6 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  }
  while (v6);
  return v7;
}

- (void)computeModeSubmissionForPeriod:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  id v6 = &qword_102419000;
  if ([(NSMutableDictionary *)self->_modeAggregation count])
  {
    if (self->_initModePeriod < (int)v4)
    {
      ++self->_modeDailyCount;
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022FA0C8);
      }
      int v7 = qword_102419558;
      if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
      {
        signed int v8 = [(NSString *)self->_metricId UTF8String];
        id v9 = [(NSMutableDictionary *)self->_aggregationDict objectForKeyedSubscript:+[NSNumber numberWithInt:v4]];
        int modeDailyCount = self->_modeDailyCount;
        *(_DWORD *)uint64_t buf = 68290051;
        int v60 = 0;
        __int16 v61 = 2082;
        long long v62 = "";
        __int16 v63 = 2081;
        v64 = v8;
        __int16 v65 = 1026;
        *(_DWORD *)__int16 v66 = v4;
        *(_WORD *)&v66[4] = 2114;
        *(void *)&v66[6] = v9;
        __int16 v67 = 1026;
        int v68 = modeDailyCount;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin mode submit\", \"id\":%{private, location:escape_only}s, \"period\":%{public}d, \"aggdict\":%{public, location:escape_only}@, \"daily\":%{public}d}", buf, 0x32u);
      }
      signed int v11 = [(CLMetricEventBins *)self localSecondsIntoDay:(double)(self->_aggregationPeriod * (int)v4)];
      uint64_t aggregationPeriod = self->_aggregationPeriod;
      unint64_t v13 = (v11 / (int)aggregationPeriod);
      if (self->_isExternal)
      {
        unint64_t v13 = [(CLMetricEventBins *)self fuzzPrivacyHours:v13];
        CFStringRef v49 = [(NSString *)self->_metricId stringByAppendingString:@".modes"];
        int v42 = v13;
        [(NSMutableDictionary *)self->_modeMetrics setObject:+[NSNumber numberWithInt:v13] forKeyedSubscript:@"hour"];
      }
      else
      {
        if (aggregationPeriod != 3600) {
          unint64_t v13 = ((int)v4 % self->_periodsInDay);
        }
        [(NSMutableDictionary *)self->_modeMetrics setObject:+[NSString stringWithFormat:@"%@.%dx%d", self->_metricId, self->_binPeriod, aggregationPeriod] forKeyedSubscript:@"name"];
        int v42 = v13;
        [(NSMutableDictionary *)self->_modeMetrics setObject:+[NSNumber numberWithInt:v13] forKeyedSubscript:@"aggPeriod"];
        [(NSMutableDictionary *)self->_modeMetrics setObject:+[NSNumber numberWithInt:self->_dimensionInt] forKeyedSubscript:@"dimensionInt"];
        [(NSMutableDictionary *)self->_modeMetrics setObject:self->_dimensionStr forKeyedSubscript:@"dimensionStr"];
        CFStringRef v49 = @"com.apple.locationd.metricbins.modes";
      }
      id v16 = [[-[NSMutableDictionary allKeys](self->_modeAggregation) sortedArrayUsingSelector:@"compare:"];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id obj = v16;
      id v47 = [v16 countByEnumeratingWithState:&v54 objects:v73 count:16];
      if (v47)
      {
        uint64_t v46 = *(void *)v55;
        do
        {
          for (i = 0; i != v47; i = (char *)i + 1)
          {
            if (*(void *)v55 != v46) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            int v19 = [[self _aggregationDict][@"objectForKeyedSubscript:"][v18][@"objectForKey:"][v4] countMatchesInA:[[self _modeAggregation][@"objectForKeyedSubscript:"][v18][@"objectForKey:"][v4]];
            int v20 = [[[self->_modeAggregation objectForKeyedSubscript:v18] objectForKey:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4)]] count];
            LODWORD(v3) = llround((double)v20 * 100.0 / (double)self->_nBins);
            [(NSMutableDictionary *)self->_modeMetrics setObject:v18 forKeyedSubscript:@"mode"];
            [(NSMutableDictionary *)self->_modeMetrics setObject:+[NSNumber numberWithInt:v3] forKeyedSubscript:@"modepct"];
            if (v20)
            {
              LODWORD(v21) = llround((double)v19 * 100.0 / (double)v20);
              [(NSMutableDictionary *)self->_modeMetrics setObject:+[NSNumber numberWithInt:v21] forKeyedSubscript:@"percentage"];
            }
            else
            {
              [(NSMutableDictionary *)self->_modeMetrics removeObjectForKey:@"percentage"];
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_modeDailyMatch, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_modeDailyMatch, "objectForKeyedSubscript:", v18), "intValue")+ v19]), v18);
            -[self->_modeDailyTotal setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [self->_modeDailyTotal objectForKeyedSubscript:v18].intValue+ v20) forKeyedSubscript:v18];
            if (v6[170] != -1) {
              dispatch_once(&qword_102419550, &stru_1022FA0C8);
            }
            objc_super v3 = qword_102419558;
            if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
            {
              long long v22 = [(NSString *)self->_metricId UTF8String];
              id v44 = [v18 UTF8String];
              id v45 = [(NSMutableDictionary *)self->_modeAggregation objectForKeyedSubscript:v18];
              int v23 = v19;
              long long v24 = v6;
              aggregationDict = self->_aggregationDict;
              long long v26 = +[NSNumber numberWithInt:v4];
              signed int v27 = aggregationDict;
              id v6 = v24;
              unsigned int v28 = [[-[NSMutableDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v26) count];
              *(_DWORD *)uint64_t buf = 68290819;
              int v60 = 0;
              __int16 v61 = 2082;
              long long v62 = "";
              __int16 v63 = 2081;
              v64 = v22;
              __int16 v65 = 2082;
              *(void *)__int16 v66 = v44;
              *(_WORD *)&v66[8] = 1026;
              *(_DWORD *)&v66[10] = v23;
              __int16 v67 = 1026;
              int v68 = v20;
              __int16 v69 = 1026;
              *(_DWORD *)__int16 v70 = v42;
              *(_WORD *)&v70[4] = 2114;
              *(void *)&v70[6] = v45;
              __int16 v71 = 1026;
              unsigned int v72 = v28;
              _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#cabin mode submit iter\", \"id\":%{private, location:escape_only}s, \"mode\":%{public, location:escape_only}s, \"match\":%{public}d, \"count\":%{public}d, \"local\":%{public}d, \"modeagg\":%{public, location:escape_only}@, \"aggcount\":%{public}d}", buf, 0x48u);
            }
            [(CLMetricEventBins *)self submitModeMetricsForEvent:v49];
            [[self->_modeAggregation objectForKeyedSubscript:v18] removeObjectForKey:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4)]];
            HIDWORD(v13) = 1079574528;
          }
          id v47 = [obj countByEnumeratingWithState:&v54 objects:v73 count:16];
        }
        while (v47);
      }
      if (self->_modeDailyCount == self->_periodsInDay)
      {
        [(NSMutableDictionary *)self->_modeMetrics setObject:&off_1023934E8 forKeyedSubscript:@"hour"];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v29 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v29)
        {
          id v30 = v29;
          CFStringRef v31 = @"mode";
          uint64_t v48 = *(void *)v51;
          do
          {
            id v32 = 0;
            do
            {
              if (*(void *)v51 != v48) {
                objc_enumerationMutation(obj);
              }
              id v33 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v32);
              int v34 = [[self->_modeDailyMatch objectForKeyedSubscript:v33] intValue];
              int v35 = [[self->_modeDailyTotal objectForKeyedSubscript:v33] intValue];
              LODWORD(v13) = llround((double)v35 * 100.0 / (double)(24 * self->_nBins));
              [(NSMutableDictionary *)self->_modeMetrics setObject:v33 forKeyedSubscript:v31];
              [(NSMutableDictionary *)self->_modeMetrics setObject:+[NSNumber numberWithInt:v13] forKeyedSubscript:@"modepct"];
              if (v35)
              {
                LODWORD(v36) = llround((double)v34 * 100.0 / (double)v35);
                [(NSMutableDictionary *)self->_modeMetrics setObject:+[NSNumber numberWithInt:v36] forKeyedSubscript:@"percentage"];
              }
              else
              {
                [(NSMutableDictionary *)self->_modeMetrics removeObjectForKey:@"percentage"];
              }
              if (qword_102419550 != -1) {
                dispatch_once(&qword_102419550, &stru_1022FA0C8);
              }
              unsigned int v37 = qword_102419558;
              if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
              {
                unsigned int v38 = [(NSString *)self->_metricId UTF8String];
                CFStringRef v39 = v31;
                id v40 = [v33 UTF8String];
                id v41 = [(NSMutableDictionary *)self->_modeAggregation objectForKeyedSubscript:v33];
                *(_DWORD *)uint64_t buf = 68290307;
                int v60 = 0;
                __int16 v61 = 2082;
                long long v62 = "";
                __int16 v63 = 2081;
                v64 = v38;
                __int16 v65 = 2082;
                *(void *)__int16 v66 = v40;
                CFStringRef v31 = v39;
                *(_WORD *)&v66[8] = 1026;
                *(_DWORD *)&v66[10] = v34;
                __int16 v67 = 1026;
                int v68 = v35;
                __int16 v69 = 2114;
                *(void *)__int16 v70 = v41;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#cabin mode submit daily\", \"id\":%{private, location:escape_only}s, \"mode\":%{public, location:escape_only}s, \"match\":%{public}d, \"count\":%{public}d, \"agg\":%{public, location:escape_only}@}", buf, 0x3Cu);
              }
              [(CLMetricEventBins *)self submitModeMetricsForEvent:v49];
              unint64_t v13 = (unint64_t)&off_1023934D0;
              [(NSMutableDictionary *)self->_modeDailyMatch setObject:&off_1023934D0 forKeyedSubscript:v33];
              [(NSMutableDictionary *)self->_modeDailyTotal setObject:&off_1023934D0 forKeyedSubscript:v33];
              id v32 = (char *)v32 + 1;
            }
            while (v30 != v32);
            id v30 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
          }
          while (v30);
        }
        self->_int modeDailyCount = 0;
      }
      return;
    }
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    uint64_t v14 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v60 = 0;
      __int16 v61 = 2082;
      long long v62 = "";
      unsigned int v15 = "{\"msg%{public}.0s\":\"#cabin mode submit notinit\"}";
      goto LABEL_17;
    }
  }
  else
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    uint64_t v14 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v60 = 0;
      __int16 v61 = 2082;
      long long v62 = "";
      unsigned int v15 = "{\"msg%{public}.0s\":\"#cabin mode submit empty\"}";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0x12u);
    }
  }
}

- (void)updateRelatedModesTo:(id)a3 atTime:(double)a4
{
  if ([(NSMutableDictionary *)self->_modeAggregation count])
  {
    uint64_t v7 = [(NSMutableString *)self->_currentMode isEqualToString:a3] ^ 1;
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    signed int v8 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(NSString *)self->_metricId UTF8String];
      id v10 = [a3 UTF8String];
      id v11 = [(NSMutableString *)self->_currentMode UTF8String];
      int v13 = 68290563;
      int v14 = 0;
      __int16 v15 = 2082;
      id v16 = "";
      __int16 v17 = 2081;
      uint64_t v18 = v9;
      __int16 v19 = 2082;
      id v20 = v10;
      __int16 v21 = 1026;
      int v22 = v7;
      __int16 v23 = 2082;
      id v24 = v11;
      __int16 v25 = 1026;
      int v26 = (int)a4;
      __int16 v27 = 2113;
      unsigned int v28 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a4];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin mode update\", \"id\":%{private, location:escape_only}s, \"new\":%{public, location:escape_only}s, \"changed\":%{public}hhd, \"prior\":%{public, location:escape_only}s, \"time\":%{public}d, \"date\":%{private, location:escape_only}@}", (uint8_t *)&v13, 0x46u);
    }
    [(CLMetricEventBins *)self fillModesUptoTime:v7 atChange:a4];

    self->_currentMode = (NSMutableString *)[objc_alloc((Class)NSMutableString) initWithString:a3];
  }
  else
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    uint64_t v12 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      id v16 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin mode update empty\"}", (uint8_t *)&v13, 0x12u);
    }
  }
}

- (void)setIndependentMode:(id)a3 atTime:(double)a4 startingWith:(id)a5
{
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022FA0C8);
  }
  signed int v8 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(NSString *)self->_metricId UTF8String];
    v10[0] = 68289795;
    v10[1] = 0;
    __int16 v11 = 2082;
    uint64_t v12 = "";
    __int16 v13 = 2081;
    int v14 = v9;
    __int16 v15 = 2081;
    id v16 = [a3 UTF8String];
    __int16 v17 = 2081;
    id v18 = [a5 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin independent mode -- tbd\", \"id\":%{private, location:escape_only}s, \"mode\":%{private, location:escape_only}s, \"start\":%{private, location:escape_only}s}", (uint8_t *)v10, 0x30u);
  }
}

- (void)updateIndependentMode:(id)a3 toState:(id)a4 atTime:(double)a5
{
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022FA0C8);
  }
  signed int v8 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(NSString *)self->_metricId UTF8String];
    v10[0] = 68289795;
    v10[1] = 0;
    __int16 v11 = 2082;
    uint64_t v12 = "";
    __int16 v13 = 2081;
    int v14 = v9;
    __int16 v15 = 2081;
    id v16 = [a3 UTF8String];
    __int16 v17 = 2081;
    id v18 = [a4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin independent mode update -- tbd\", \"id\":%{private, location:escape_only}s, \"mode\":%{private, location:escape_only}s, \"state\":%{private, location:escape_only}s}", (uint8_t *)v10, 0x30u);
  }
}

- (int)periodIndex:(double)a3
{
  return (int)(a3 / (double)self->_aggregationPeriod);
}

- (int)binIndex:(double)a3
{
  return (int)(a3 / (double)self->_binPeriod);
}

- (int)localSecondsIntoDay:(double)a3
{
  objc_super v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") components:224 fromDate:+[NSDate dateWithTimeIntervalSinceReferenceDate:a3]];
  unsigned int v4 = [(NSDateComponents *)v3 hour];
  unsigned int v5 = [(NSDateComponents *)v3 minute] + 60 * v4;
  return [(NSDateComponents *)v3 second] + 60 * v5;
}

- (int)fuzzPrivacyHours:(int)a3
{
  int privacyHours = self->_privacyHours;
  if (privacyHours != -1) {
    return a3 / privacyHours * privacyHours;
  }
  return a3;
}

- (BOOL)createAggPeriodIfApplicable:(double)a3
{
  if (a3 == 0.0)
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    unsigned int v4 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_ERROR))
    {
      unsigned int v5 = [(NSString *)self->_metricId UTF8String];
      int v14 = 68289282;
      int v15 = 0;
      __int16 v16 = 2082;
      __int16 v17 = "";
      __int16 v18 = 2082;
      __int16 v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#cabin error, time zero\", \"id\":%{public, location:escape_only}s}", (uint8_t *)&v14, 0x1Cu);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022FA0C8);
      }
    }
    id v6 = qword_102419558;
    BOOL v7 = os_signpost_enabled((os_log_t)qword_102419558);
    if (v7)
    {
      signed int v8 = [(NSString *)self->_metricId UTF8String];
      int v14 = 68289282;
      int v15 = 0;
      __int16 v16 = 2082;
      __int16 v17 = "";
      __int16 v18 = 2082;
      __int16 v19 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#cabin error, time zero", "{\"msg%{public}.0s\":\"#cabin error, time zero\", \"id\":%{public, location:escape_only}s}", (uint8_t *)&v14, 0x1Cu);
LABEL_10:
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    uint64_t v10 = -[CLMetricEventBins periodIndex:](self, "periodIndex:");
    if ([(CLMetricEventBins *)self periodIndex:a3] == self->_initAggPeriod) {
      goto LABEL_10;
    }
    if (![(NSMutableDictionary *)self->_aggregationDict objectForKey:+[NSNumber numberWithInt:v10]])
    {
      [(NSMutableDictionary *)self->_aggregationDict setObject:objc_alloc_init((Class)NSMutableSet) forKey:+[NSNumber numberWithInt:v10]];
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022FA0C8);
      }
      __int16 v11 = qword_102419558;
      if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(NSString *)self->_metricId UTF8String];
        int v14 = 68289539;
        int v15 = 0;
        __int16 v16 = 2082;
        __int16 v17 = "";
        __int16 v18 = 2081;
        __int16 v19 = v12;
        __int16 v20 = 1026;
        int v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin new period\", \"id\":%{private, location:escape_only}s, \"period\":%{public}d}", (uint8_t *)&v14, 0x22u);
      }
    }
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)computePercentageAndSubmit:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  if (self->_isExternal) {
    id v6 = [(NSString *)self->_metricId stringByAppendingString:@".percentages"];
  }
  else {
    id v6 = @"com.apple.locationd.metricbins";
  }
  int v7 = [[self->_aggregationDict objectForKeyedSubscript:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4)] count];
  LODWORD(v3) = llround((double)v7 * 100.0 / (double)self->_nBins);
  signed int v8 = &qword_102419000;
  if ((int)v3 >= 101)
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    id v9 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289538;
      int v39 = 0;
      __int16 v40 = 2082;
      id v41 = "";
      __int16 v42 = 2082;
      id v43 = [(__CFString *)v6 UTF8String];
      __int16 v44 = 1026;
      int v45 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#cabin error, percentage\", \"event\":%{public, location:escape_only}s, \"pct\":%{public}d}", buf, 0x22u);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022FA0C8);
      }
    }
    uint64_t v10 = qword_102419558;
    if (os_signpost_enabled((os_log_t)qword_102419558))
    {
      id v11 = [(__CFString *)v6 UTF8String];
      *(_DWORD *)uint64_t buf = 68289538;
      int v39 = 0;
      __int16 v40 = 2082;
      id v41 = "";
      __int16 v42 = 2082;
      id v43 = v11;
      __int16 v44 = 1026;
      int v45 = v3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#cabin error, percentage", "{\"msg%{public}.0s\":\"#cabin error, percentage\", \"event\":%{public, location:escape_only}s, \"pct\":%{public}d}", buf, 0x22u);
    }
    uint64_t v3 = 100;
  }
  *(int32x2_t *)&self->_int dailyTotal = vadd_s32(*(int32x2_t *)&self->_dailyTotal, (int32x2_t)(v7 | 0x100000000));
  signed int v12 = [(CLMetricEventBins *)self localSecondsIntoDay:(double)(self->_aggregationPeriod * (int)v4)];
  int aggregationPeriod = self->_aggregationPeriod;
  uint64_t v14 = (v12 / aggregationPeriod);
  if (self->_isExternal)
  {
    uint64_t v14 = [(CLMetricEventBins *)self fuzzPrivacyHours:v14];
    [(NSMutableDictionary *)self->_percentMetrics setObject:+[NSNumber numberWithInt:v3] forKeyedSubscript:@"percentage"];
    dimensionStr = +[NSNumber numberWithInt:v14];
    percentMetrics = self->_percentMetrics;
    CFStringRef v17 = @"hour";
  }
  else
  {
    if (aggregationPeriod != 3600) {
      uint64_t v14 = ((int)v4 % self->_periodsInDay);
    }
    [(NSMutableDictionary *)self->_percentMetrics setObject:+[NSNumber numberWithInt:v3] forKeyedSubscript:@"percentage"];
    [(NSMutableDictionary *)self->_percentMetrics setObject:+[NSNumber numberWithInt:v14] forKeyedSubscript:@"aggPeriod"];
    [(NSMutableDictionary *)self->_percentMetrics setObject:+[NSString stringWithFormat:@"%@.%dx%d", self->_metricId, self->_binPeriod, self->_aggregationPeriod] forKeyedSubscript:@"name"];
    [(NSMutableDictionary *)self->_percentMetrics setObject:+[NSNumber numberWithInt:self->_dimensionInt] forKeyedSubscript:@"dimensionInt"];
    dimensionStr = (NSNumber *)self->_dimensionStr;
    percentMetrics = self->_percentMetrics;
    CFStringRef v17 = @"dimensionStr";
  }
  [(NSMutableDictionary *)percentMetrics setObject:dimensionStr forKeyedSubscript:v17];
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022FA0C8);
  }
  __int16 v18 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = [(__CFString *)v6 UTF8String];
    BOOL submitMetrics = self->_submitMetrics;
    int dailyTotal = self->_dailyTotal;
    int dailyCount = self->_dailyCount;
    int periodsInDay = self->_periodsInDay;
    unsigned int v19 = [[self->_aggregationDict objectForKey:[NSNumber numberWithInt:v4]] count];
    signed int v8 = &qword_102419000;
    __int16 v20 = v6;
    aggregationDict = self->_aggregationDict;
    int v22 = +[NSNumber numberWithInt:v4];
    __int16 v23 = aggregationDict;
    id v6 = v20;
    id v24 = [(NSMutableDictionary *)v23 objectForKey:v22];
    *(_DWORD *)uint64_t buf = 68291331;
    __int16 v40 = 2082;
    int v39 = 0;
    id v41 = "";
    __int16 v42 = 2081;
    id v43 = v33;
    __int16 v44 = 1026;
    int v45 = submitMetrics;
    __int16 v46 = 1026;
    int v47 = v4;
    __int16 v48 = 1026;
    *(_DWORD *)CFStringRef v49 = v14;
    *(_WORD *)&v49[4] = 1026;
    *(_DWORD *)&v49[6] = dailyTotal;
    __int16 v50 = 1026;
    int v51 = dailyCount;
    __int16 v52 = 1026;
    int v53 = periodsInDay;
    __int16 v54 = 1025;
    unsigned int v55 = v19;
    __int16 v56 = 2113;
    id v57 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin submit\", \"event\":%{private, location:escape_only}s, \"submit\":%{public}d, \"period\":%{public}d, \"local\":%{public}d, \"dailytotal\":%{public}d, \"dailycount\":%{public}d, \"periods\":%{public}d, \"n\":%{private}d, \"aggbin\":%{private, location:escape_only}@}", buf, 0x50u);
  }
  [(CLMetricEventBins *)self submitPercentageMetricsForEvent:v6];
  int v25 = self->_dailyCount;
  if (v25 == self->_periodsInDay)
  {
    LODWORD(v8) = llround((double)self->_dailyTotal * 100.0 / (double)(self->_nBins * v25));
    BOOL isExternal = self->_isExternal;
    [(NSMutableDictionary *)self->_percentMetrics setObject:+[NSNumber numberWithInt:v8] forKeyedSubscript:@"percentage"];
    __int16 v27 = +[NSNumber numberWithInt:self->_periodsInDay];
    if (isExternal) {
      CFStringRef v28 = @"hour";
    }
    else {
      CFStringRef v28 = @"aggPeriod";
    }
    [(NSMutableDictionary *)self->_percentMetrics setObject:v27 forKeyedSubscript:v28];
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    id v29 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [(__CFString *)v6 UTF8String];
      int v31 = self->_dailyTotal;
      id v32 = self->_percentMetrics;
      *(_DWORD *)uint64_t buf = 68290051;
      int v39 = 0;
      __int16 v40 = 2082;
      id v41 = "";
      __int16 v42 = 2081;
      id v43 = v30;
      __int16 v44 = 1026;
      int v45 = (int)v8;
      __int16 v46 = 1026;
      int v47 = v31;
      __int16 v48 = 2113;
      *(void *)CFStringRef v49 = v32;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin submit daily\", \"event\":%{private, location:escape_only}s, \"dailypct\":%{public}d, \"dailytotal\":%{public}d, \"ca\":%{private, location:escape_only}@}", buf, 0x32u);
    }
    [(CLMetricEventBins *)self submitPercentageMetricsForEvent:v6];
    self->_int dailyTotal = 0;
    self->_int dailyCount = 0;
  }
}

- (void)computeIntervalDistributionsForPeriod:(int)a3
{
  id v5 = [[objc_msgSend(-[NSMutableDictionary objectForKey:](self->_aggregationDict, "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:")), "allObjects") sortedArrayUsingSelector:@"compare:"];
  int nBins = self->_nBins;
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022FA0C8);
  }
  int v7 = nBins * a3;
  signed int v8 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(NSString *)self->_metricId UTF8String];
    intervalDistributions = self->_intervalDistributions;
    int priorDistributionBin = self->_priorDistributionBin;
    uint64_t buf = 68290562;
    __int16 v61 = 2082;
    long long v62 = "";
    __int16 v63 = 2082;
    v64 = v9;
    __int16 v65 = 1026;
    *(_DWORD *)__int16 v66 = a3;
    *(_WORD *)&v66[4] = 2114;
    *(void *)&v66[6] = intervalDistributions;
    __int16 v67 = 1026;
    *(_DWORD *)int v68 = priorDistributionBin;
    *(_WORD *)&v68[4] = 1026;
    *(_DWORD *)&v68[6] = v7;
    __int16 v69 = 2114;
    id v70 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin intdist\", \"id\":%{public, location:escape_only}s, \"period\":%{public}d, \"buckets\":%{public, location:escape_only}@, \"priorBin\":%{public}d, \"binstart\":%{public}d, \"arr\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x42u);
  }
  if ([v5 count])
  {
    if (self->_isExternal)
    {
      CFStringRef v43 = [(NSString *)self->_metricId stringByAppendingString:@".intervals"];
    }
    else
    {
      [(NSMutableDictionary *)self->_intervalMetrics setObject:+[NSString stringWithFormat:@"%@.%dx%d", self->_metricId, self->_binPeriod, self->_aggregationPeriod] forKeyedSubscript:@"name"];
      [(NSMutableDictionary *)self->_intervalMetrics setObject:+[NSNumber numberWithInt:self->_dimensionInt] forKeyedSubscript:@"dimensionInt"];
      [(NSMutableDictionary *)self->_intervalMetrics setObject:self->_dimensionStr forKeyedSubscript:@"dimensionStr"];
      CFStringRef v43 = @"com.apple.locationd.metricbins.intervals";
    }
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    id v13 = objc_alloc_init((Class)NSMutableArray);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v14 = [v5 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v54;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v54 != v16) {
            objc_enumerationMutation(v5);
          }
          int v18 = [*(id *)(*((void *)&v53 + 1) + 8 * i) intValue] + v7;
          int v19 = self->_priorDistributionBin;
          if (v19 != -1)
          {
            uint64_t v20 = (v18 - v19);
            if (v18 - v19 < 0) {
              uint64_t v20 = (v20 + self->_nBins * self->_periodsInDay);
            }
            [v13 addObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20)];
          }
          self->_int priorDistributionBin = v18;
        }
        id v15 = [v5 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v15);
    }
    [v13 setArray:[v13 sortedArrayUsingSelector:@selector(compare:)]];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = self->_intervalDistributions;
    int v21 = "ds";
    id v44 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v44)
    {
      id v40 = v12;
      LODWORD(v22) = 0;
      uint64_t v42 = *(void *)v50;
      do
      {
        __int16 v23 = 0;
        uint64_t v22 = (int)v22;
        do
        {
          if (*(void *)v50 != v42) {
            objc_enumerationMutation(obj);
          }
          int v24 = [*(id *)(*((void *)&v49 + 1) + 8 * (void)v23) intValue];
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v25 = [v13 countByEnumeratingWithState:&v45 objects:v57 count:16];
          if (v25)
          {
            id v26 = v25;
            int v27 = 0;
            uint64_t v28 = *(void *)v46;
            while (2)
            {
              id v29 = 0;
              uint64_t v30 = (v27 + v26);
              do
              {
                if (*(void *)v46 != v28) {
                  objc_enumerationMutation(v13);
                }
                if ((int)[*(id *)(*((void *)&v45 + 1) + 8 * (void)v29) intValue] >= v24)
                {
                  uint64_t v30 = (v27 + v29);
                  goto LABEL_36;
                }
                id v29 = (char *)v29 + 1;
              }
              while (v26 != v29);
              id v26 = [v13 countByEnumeratingWithState:&v45 objects:v57 count:16];
              int v27 = v30;
              if (v26) {
                continue;
              }
              break;
            }
          }
          else
          {
            uint64_t v30 = 0;
          }
LABEL_36:
          if (qword_102419550 != -1) {
            dispatch_once(&qword_102419550, &stru_1022FA0C8);
          }
          int v31 = qword_102419558;
          if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
          {
            id v32 = [(NSString *)self->_metricId UTF8String];
            uint64_t buf = 68290051;
            __int16 v61 = 2082;
            long long v62 = "";
            __int16 v63 = 2081;
            v64 = v32;
            __int16 v65 = 2114;
            *(void *)__int16 v66 = v13;
            *(_WORD *)&v66[8] = 1026;
            *(_DWORD *)&v66[10] = v24;
            __int16 v67 = 1026;
            *(_DWORD *)int v68 = v30;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#cabin intdist edgeiter\", \"id\":%{private, location:escape_only}s, \"deltas\":%{public, location:escape_only}@, \"edge\":%{public}d, \"n\":%{public}d}", (uint8_t *)&buf, 0x32u);
          }
          [(NSMutableDictionary *)self->_intervalMetrics setObject:[(NSMutableArray *)self->_intervalDistributionStrings objectAtIndexedSubscript:v22] forKeyedSubscript:@"interval"];
          [(NSMutableDictionary *)self->_intervalMetrics setObject:+[NSNumber numberWithInt:v30] forKeyedSubscript:@"total"];
          [(CLMetricEventBins *)self submitIntervalMetricsForEvent:v43];
          [v13 removeObjectsInRange:0, (int)v30];
          ++v22;
          __int16 v23 = (char *)v23 + 1;
        }
        while (v23 != v44);
        id v44 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v44);
      uint64_t v33 = (int)v22;
      id v12 = v40;
      int v21 = "kWorkoutRecorderMinimumPowerAssertionTimeSeconds" + 46;
    }
    else
    {
      uint64_t v33 = 0;
    }
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    int v34 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
    {
      int v35 = [(NSString *)self->_metricId UTF8String];
      unsigned int v36 = [v13 count];
      uint64_t buf = 68289795;
      __int16 v61 = 2082;
      long long v62 = "";
      __int16 v63 = 2081;
      v64 = v35;
      __int16 v65 = 2114;
      *(void *)__int16 v66 = v13;
      *(_WORD *)&v66[8] = 1026;
      *(_DWORD *)&v66[10] = v36;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#cabin intdist edgeend\", \"id\":%{private, location:escape_only}s, \"deltas\":%{public, location:escape_only}@, \"n\":%{public}d}", (uint8_t *)&buf, 0x2Cu);
    }
    [(NSMutableDictionary *)self->_intervalMetrics setObject:[(NSMutableArray *)self->_intervalDistributionStrings objectAtIndexedSubscript:v33] forKeyedSubscript:@"interval"];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_intervalMetrics, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 count]), @"total");
    [(CLMetricEventBins *)self submitIntervalMetricsForEvent:v43];
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    unsigned int v37 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v38 = [(NSString *)self->_metricId UTF8String];
      int v39 = self->_priorDistributionBin;
      uint64_t buf = *((void *)v21 + 279);
      __int16 v61 = 2082;
      long long v62 = "";
      __int16 v63 = 2081;
      v64 = v38;
      __int16 v65 = 2114;
      *(void *)__int16 v66 = v13;
      *(_WORD *)&v66[8] = 1026;
      *(_DWORD *)&v66[10] = v39;
      __int16 v67 = 2114;
      *(void *)int v68 = v12;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin intdist edgeend\", \"id\":%{private, location:escape_only}s, \"deltas\":%{public, location:escape_only}@, \"priorBin\":%{public}d, \"ca\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x36u);
    }
  }
}

- (void)processEventTime:(double)a3
{
  uint64_t v4 = +[NSNumber numberWithDouble:a3];
  [(CLMetricEventBins *)self processEventTimes:+[NSArray arrayWithObjects:&v4 count:1]];
}

- (void)processEventTimeRangeFrom:(double)a3 to:(double)a4
{
  id v7 = objc_alloc_init((Class)NSMutableArray);
  double v8 = (double)(int)a3;
  if (v8 < a4)
  {
    uint64_t v9 = (int)a3;
    do
    {
      [v7 addObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9, v8)]];
      uint64_t v9 = (self->_binPeriod + v9);
      double v8 = (double)(int)v9;
    }
    while ((double)(int)v9 < a4);
  }
  [v7 addObject:[NSNumber numberWithDouble:a4]];
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022FA0C8);
  }
  uint64_t v10 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
  {
    id v11 = [(NSString *)self->_metricId UTF8String];
    v12[0] = 68290051;
    __int16 v13 = 2082;
    v12[1] = 0;
    id v14 = "";
    __int16 v15 = 2081;
    uint64_t v16 = v11;
    __int16 v17 = 1026;
    int v18 = (int)a3;
    __int16 v19 = 1026;
    int v20 = (int)a4;
    __int16 v21 = 1026;
    unsigned int v22 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#cabin event range -- tbd\", \"id\":%{private, location:escape_only}s, \"start\":%{public}d, \"end\":%{public}d, \"count\":%{public}d}", (uint8_t *)v12, 0x2Eu);
  }
  [(CLMetricEventBins *)self processEventTimes:v7];
}

- (void)processEventTimes:(id)a3
{
  uint64_t v4 = [(NSArray *)[+[NSSet setWithArray:](NSSet, "setWithArray:") allObjects] sortedArrayUsingSelector:"compare:"];
  id obj = objc_alloc_init((Class)NSMutableSet);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v41 objects:v60 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v42;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = (double)(int)[*(id *)(*((void *)&v41 + 1) + 8 * i) intValue];
        uint64_t v10 = [(CLMetricEventBins *)self periodIndex:v9];
        int v11 = [(CLMetricEventBins *)self binIndex:v9];
        if ([(CLMetricEventBins *)self createAggPeriodIfApplicable:v9])
        {
          [[self->_aggregationDict objectForKeyedSubscript:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10)] addObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v11 % self->_nBins));
          [obj addObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10)];
        }
        else
        {
          self->_int priorDistributionBin = v11;
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v41 objects:v60 count:16];
    }
    while (v6);
  }
  else
  {
    LODWORD(v10) = 0;
  }
  int v35 = self;
  unsigned int v32 = v10;
  uint64_t v33 = v4;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v12 = [obj countByEnumeratingWithState:&v37 objects:v59 count:16];
  __int16 v13 = &qword_102419000;
  id v14 = &qword_102419000;
  if (v12)
  {
    id v15 = v12;
    uint64_t v16 = *(void *)v38;
    uint64_t v34 = *(void *)v38;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(obj);
        }
        int v18 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        if (v13[170] != -1) {
          dispatch_once(&qword_102419550, &stru_1022FA0C8);
        }
        __int16 v19 = v14[171];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          int v20 = v13;
          __int16 v21 = [(NSString *)v35->_metricId UTF8String];
          unsigned int v22 = v14;
          unsigned int v23 = [v18 intValue];
          unsigned int v24 = [[v35->_aggregationDict objectForKeyedSubscript:v18] count];
          id v25 = [(NSMutableDictionary *)v35->_aggregationDict objectForKeyedSubscript:v18];
          *(_DWORD *)uint64_t buf = 68290051;
          int v46 = 0;
          __int16 v47 = 2082;
          long long v48 = "";
          __int16 v49 = 2081;
          long long v50 = v21;
          __int16 v13 = v20;
          uint64_t v16 = v34;
          __int16 v51 = 1026;
          unsigned int v52 = v23;
          id v14 = v22;
          __int16 v53 = 1026;
          unsigned int v54 = v24;
          __int16 v55 = 2114;
          *(void *)long long v56 = v25;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#cabin iter\", \"id\":%{private, location:escape_only}s, \"period\":%{public}d, \"n\":%{public}d, \"aggdict\":%{public, location:escape_only}@}", buf, 0x32u);
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v37 objects:v59 count:16];
    }
    while (v15);
  }
  if (v13[170] != -1) {
    dispatch_once(&qword_102419550, &stru_1022FA0C8);
  }
  id v26 = v14[171];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    int v27 = [(NSString *)v35->_metricId UTF8String];
    unsigned int v28 = [a3 count];
    unsigned int v29 = [(NSArray *)v33 count];
    int submissionRefPeriod = v35->_submissionRefPeriod;
    *(_DWORD *)uint64_t buf = 68290563;
    int v46 = 0;
    __int16 v47 = 2082;
    long long v48 = "";
    __int16 v49 = 2081;
    long long v50 = v27;
    __int16 v51 = 1026;
    unsigned int v52 = v28;
    __int16 v53 = 1026;
    unsigned int v54 = v29;
    __int16 v55 = 1026;
    *(_DWORD *)long long v56 = submissionRefPeriod;
    *(_WORD *)&v56[4] = 2114;
    *(void *)&v56[6] = v33;
    __int16 v57 = 2114;
    id v58 = obj;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#cabin events\", \"id\":%{private, location:escape_only}s, \"events\":%{public}d, \"proc\":%{public}d, \"subref\":%{public}d, \"times\":%{public, location:escape_only}@, \"modified\":%{public, location:escape_only}@}", buf, 0x42u);
  }
  [(CLMetricEventBins *)v35 checkSubmissionAtPeriod:v32];
}

- (void)checkSubmissionAtPeriod:(int)a3
{
  int v5 = a3 - 2;
  uint64_t submissionRefPeriod = self->_submissionRefPeriod;
  if ((int)submissionRefPeriod < a3 - 2)
  {
    *(void *)&long long v3 = 68290051;
    long long v13 = v3;
    do
    {
      self->_uint64_t submissionRefPeriod = submissionRefPeriod + 1;
      int aggregationPeriod = self->_aggregationPeriod;
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022FA0C8);
      }
      int v9 = aggregationPeriod * (submissionRefPeriod + 2);
      uint64_t v10 = qword_102419558;
      if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = [(NSString *)self->_metricId UTF8String];
        int v12 = self->_submissionRefPeriod;
        *(_DWORD *)uint64_t buf = v13;
        int v15 = 0;
        __int16 v16 = 2082;
        __int16 v17 = "";
        __int16 v18 = 2081;
        __int16 v19 = v11;
        __int16 v20 = 1026;
        int v21 = a3;
        __int16 v22 = 1026;
        int v23 = v12;
        __int16 v24 = 1026;
        int v25 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin closing\", \"id\":%{private, location:escape_only}s, \"period\":%{public}d, \"subref\":%{public}d, \"filltime\":%{public}d}", buf, 0x2Eu);
      }
      -[CLMetricEventBins computePercentageAndSubmit:](self, "computePercentageAndSubmit:", self->_submissionRefPeriod, v13);
      if ([(NSMutableArray *)self->_intervalDistributions count]) {
        [(CLMetricEventBins *)self computeIntervalDistributionsForPeriod:self->_submissionRefPeriod];
      }
      if ([(NSMutableDictionary *)self->_modeAggregation count])
      {
        [(CLMetricEventBins *)self fillModesUptoTime:0 atChange:(double)v9];
        [(CLMetricEventBins *)self computeModeSubmissionForPeriod:self->_submissionRefPeriod];
      }
      [(NSMutableDictionary *)self->_aggregationDict removeObjectForKey:+[NSNumber numberWithInt:self->_submissionRefPeriod]];
      uint64_t submissionRefPeriod = self->_submissionRefPeriod;
    }
    while ((int)submissionRefPeriod < v5);
  }
  [(CLMetricEventBins *)self removeLingeringEntriesAtPeriod:submissionRefPeriod];
}

- (void)removeLingeringEntriesAtPeriod:(int)a3
{
  int v4 = a3 - 6;
  id v5 = [(NSMutableDictionary *)self->_aggregationDict allKeys];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v53 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ((int)[v11 intValue] < v4)
        {
          [(NSMutableDictionary *)self->_aggregationDict removeObjectForKey:v11];
          ++v8;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v35 objects:v53 count:16];
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
  }
  int v23 = v8;
  if ([(NSMutableDictionary *)self->_modeAggregation count]
    && (long long v33 = 0u,
        long long v34 = 0u,
        long long v31 = 0u,
        long long v32 = 0u,
        id obj = self->_modeAggregation,
        (id v26 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v52 count:16]) != 0))
  {
    int v12 = 0;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
        id v15 = [[-[NSMutableDictionary objectForKeyedSubscript:](self->_modeAggregation, "objectForKeyedSubscript:", v14) allKeys];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v16 = [v15 countByEnumeratingWithState:&v27 objects:v51 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v28;
          do
          {
            for (k = 0; k != v17; k = (char *)k + 1)
            {
              if (*(void *)v28 != v18) {
                objc_enumerationMutation(v15);
              }
              __int16 v20 = *(void **)(*((void *)&v27 + 1) + 8 * (void)k);
              if ((int)[v20 intValue] < v4)
              {
                [self->_modeAggregation[v14] removeObjectForKey:v20];
                ++v12;
              }
            }
            id v17 = [v15 countByEnumeratingWithState:&v27 objects:v51 count:16];
          }
          while (v17);
        }
      }
      id v26 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v52 count:16];
    }
    while (v26);
  }
  else
  {
    int v12 = 0;
  }
  if (v12 + v23 >= 1)
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    int v21 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = [(NSString *)self->_metricId UTF8String];
      *(_DWORD *)uint64_t buf = 68290051;
      __int16 v41 = 2082;
      int v40 = 0;
      long long v42 = "";
      __int16 v43 = 2081;
      long long v44 = v22;
      __int16 v45 = 1026;
      int v46 = v4;
      __int16 v47 = 1026;
      int v48 = v23;
      __int16 v49 = 1026;
      int v50 = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin lingered\", \"id\":%{private, location:escape_only}s, \"period\":%{public}d, \"agg\":%{public}d, \"mode\":%{public}d}", buf, 0x2Eu);
    }
  }
}

- (void)updateToCurrentTime:(double)a3
{
  uint64_t v5 = -[CLMetricEventBins periodIndex:](self, "periodIndex:");
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022FA0C8);
  }
  id v6 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [(NSString *)self->_metricId UTF8String];
    int submissionRefPeriod = self->_submissionRefPeriod;
    v9[0] = 68290051;
    __int16 v10 = 2082;
    v9[1] = 0;
    int v11 = "";
    __int16 v12 = 2081;
    long long v13 = v7;
    __int16 v14 = 1026;
    int v15 = (int)a3;
    __int16 v16 = 1026;
    int v17 = v5;
    __int16 v18 = 1026;
    int v19 = submissionRefPeriod;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#cabin uptick\", \"id\":%{private, location:escape_only}s, \"time\":%{public}d, \"period\":%{public}d, \"subref\":%{public}d}", (uint8_t *)v9, 0x2Eu);
  }
  [(CLMetricEventBins *)self checkSubmissionAtPeriod:v5];
}

- (void)submitPercentageMetricsForEvent:(id)a3
{
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022FA0C8);
  }
  uint64_t v5 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [a3 UTF8String];
    BOOL submitMetrics = self->_submitMetrics;
    percentMetrics = self->_percentMetrics;
    *(_DWORD *)uint64_t buf = 68289795;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2081;
    id v14 = v6;
    __int16 v15 = 1025;
    BOOL v16 = submitMetrics;
    __int16 v17 = 2113;
    __int16 v18 = percentMetrics;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin percentage submission\", \"event\":%{private, location:escape_only}s, \"submit\":%{private}hhd, \"dict\":%{private, location:escape_only}@}", buf, 0x2Cu);
  }
  if (self->_submitMetrics) {
    AnalyticsSendEventLazy();
  }
  [(NSMutableArray *)self->_testSubmissions addObject:[(NSMutableDictionary *)self->_percentMetrics mutableCopy]];
}

- (void)submitIntervalMetricsForEvent:(id)a3
{
  if (objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_intervalMetrics, "objectForKeyedSubscript:", @"total"), "intValue"))
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022FA0C8);
    }
    uint64_t v5 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [a3 UTF8String];
      BOOL submitMetrics = self->_submitMetrics;
      intervalMetrics = self->_intervalMetrics;
      *(_DWORD *)uint64_t buf = 68289795;
      int v10 = 0;
      __int16 v11 = 2082;
      __int16 v12 = "";
      __int16 v13 = 2081;
      id v14 = v6;
      __int16 v15 = 1025;
      BOOL v16 = submitMetrics;
      __int16 v17 = 2113;
      __int16 v18 = intervalMetrics;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin interval submission\", \"event\":%{private, location:escape_only}s, \"submit\":%{private}hhd, \"dict\":%{private, location:escape_only}@}", buf, 0x2Cu);
    }
    if (self->_submitMetrics) {
      AnalyticsSendEventLazy();
    }
    [(NSMutableArray *)self->_testSubmissions addObject:[(NSMutableDictionary *)self->_intervalMetrics mutableCopy]];
  }
}

- (void)submitModeMetricsForEvent:(id)a3
{
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022FA0C8);
  }
  uint64_t v5 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [a3 UTF8String];
    BOOL submitMetrics = self->_submitMetrics;
    modeMetrics = self->_modeMetrics;
    *(_DWORD *)uint64_t buf = 68289795;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2081;
    id v14 = v6;
    __int16 v15 = 1025;
    BOOL v16 = submitMetrics;
    __int16 v17 = 2113;
    __int16 v18 = modeMetrics;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin mode submission\", \"event\":%{private, location:escape_only}s, \"submit\":%{private}hhd, \"dict\":%{private, location:escape_only}@}", buf, 0x2Cu);
  }
  if (self->_submitMetrics) {
    AnalyticsSendEventLazy();
  }
  [(NSMutableArray *)self->_testSubmissions addObject:[(NSMutableDictionary *)self->_modeMetrics mutableCopy]];
}

- (void)reset:(double)a3
{
  self->_int initAggPeriod = -[CLMetricEventBins periodIndex:](self, "periodIndex:");
  int v5 = [(CLMetricEventBins *)self binIndex:a3];
  int initAggPeriod = self->_initAggPeriod;
  self->_int initAggBin = v5;
  self->_int submissionRefPeriod = initAggPeriod;
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022FA0C8);
  }
  id v7 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(NSString *)self->_metricId UTF8String];
    int v9 = self->_initAggPeriod;
    int initAggBin = self->_initAggBin;
    uint64_t buf = 68290050;
    __int16 v23 = 2082;
    __int16 v24 = "";
    __int16 v25 = 2082;
    id v26 = v8;
    __int16 v27 = 1026;
    int v28 = (int)a3;
    __int16 v29 = 1026;
    int v30 = v9;
    __int16 v31 = 1026;
    int v32 = initAggBin;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin reset\", \"id\":%{public, location:escape_only}s, \"now\":%{public}d, \"period\":%{public}d, \"bin\":%{public}d}", (uint8_t *)&buf, 0x2Eu);
  }
  self->_int dailyTotal = 0;
  self->_int dailyCount = 0;
  [(NSMutableDictionary *)self->_aggregationDict removeAllObjects];
  [(NSMutableArray *)self->_intervalDistributions removeAllObjects];
  [(NSMutableArray *)self->_intervalDistributionStrings removeAllObjects];
  self->_int priorDistributionBin = -1;
  if (self->_initModePeriod != -1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    modeAggregation = self->_modeAggregation;
    id v12 = [(NSMutableDictionary *)modeAggregation countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(modeAggregation);
          }
          uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          [[self->_modeAggregation objectForKeyedSubscript:v16] removeAllObjects];
          [self->_modeDailyMatch[v16] removeAllObjects];
          [[self->_modeDailyTotal objectForKeyedSubscript:v16] removeAllObjects];
        }
        id v13 = [(NSMutableDictionary *)modeAggregation countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
    *(int32x2_t *)&self->_unsigned int modeRefBin = vrev64_s32(*(int32x2_t *)&self->_initAggPeriod);
    self->_int modeDailyCount = 0;
  }
  self->_dimensionInt = -1;
  self->_dimensionStr = (NSString *)&stru_10234F018;
}

- (int)dimensionInt
{
  return self->_dimensionInt;
}

- (void)setDimensionInt:(int)a3
{
  self->_dimensionInt = a3;
}

- (NSString)dimensionStr
{
  return self->_dimensionStr;
}

- (void)setDimensionStr:(id)a3
{
  self->_dimensionStr = (NSString *)a3;
}

- (id)testGetSubmissions
{
  return self->_testSubmissions;
}

- (void)testClearSubmissions
{
}

- (int)testGetDistributionBinAnchor
{
  return self->_priorDistributionBin;
}

- (int)testGetDailyCount
{
  return self->_dailyCount;
}

- (int)testGetDailyTotal
{
  return self->_dailyTotal;
}

- (int)testGetCountForMode:(id)a3 andPeriod:(int)a4
{
  return [[[self->_modeAggregation objectForKeyedSubscript:a3] objectForKeyedSubscript:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(void *)&a4)]] count];
}

- (int)testModeCountAtPeriod:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  modeAggregation = self->_modeAggregation;
  id v6 = [(NSMutableDictionary *)modeAggregation countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  int v8 = 0;
  uint64_t v9 = *(void *)v13;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(modeAggregation);
      }
      if (objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_modeAggregation, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i)), "objectForKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3)))
      {
        ++v8;
      }
    }
    id v7 = [(NSMutableDictionary *)modeAggregation countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v7);
  return v8;
}

- (id)testGetCurrentMode
{
  return self->_currentMode;
}

- (int)testGetModeReferenceBin
{
  return self->_modeRefBin;
}

- (void)testSkipSumbission
{
  self->_BOOL submitMetrics = 0;
}

@end