@interface RTMapItemProviderBluePOIPerformanceMetrics
+ (id)_bestMapItemForQuery:(id)a3 wifiFingerprintLabelType:(int64_t)a4;
+ (id)_mapItemDictionaryforResults:(id)a3 wifiFingerprintLabelType:(int64_t)a4;
+ (void)_getDominantStreakForResults:(id)a3 dominantKey:(id *)a4 largestSameResultCount:(unint64_t *)a5 hasDominantResult:(BOOL *)a6;
+ (void)submitMetricsWithNonZeroAccessPointsFingerprintsCount:(unint64_t)a3 zeroAccessPointsFingerprintsCount:(unint64_t)a4 fingerprintsCount:(unint64_t)a5 queryCount:(unint64_t)a6 firstResultQueryCount:(unint64_t)a7 results:(id)a8 earlyStopQueryCount:(unint64_t)a9 earlyStopQueryResult:(id)a10 bestQueryResult:(id)a11 error:(id)a12 visitInterval:(double)a13 visitSource:(int64_t)a14;
- (NSMutableDictionary)metrics;
- (RTMapItemProviderBluePOIPerformanceMetrics)init;
- (RTMapItemProviderBluePOIPerformanceMetrics)initWithNonZeroAccessPointsFingerprintsCount:(unint64_t)a3 zeroAccessPointsFingerprintsCount:(unint64_t)a4 fingerprintsCount:(unint64_t)a5 queryCount:(unint64_t)a6 firstResultQueryCount:(unint64_t)a7 results:(id)a8 earlyStopQueryCount:(unint64_t)a9 earlyStopQueryResult:(id)a10 bestQueryResult:(id)a11 error:(id)a12 visitInterval:(double)a13 visitSource:(int64_t)a14;
- (void)submitMetrics;
@end

@implementation RTMapItemProviderBluePOIPerformanceMetrics

- (RTMapItemProviderBluePOIPerformanceMetrics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithNonZeroAccessPointsFingerprintsCount_zeroAccessPointsFingerprintsCount_fingerprintsCount_queryCount_firstResultQueryCount_results_earlyStopQueryCount_earlyStopQueryResult_bestQueryResult_error_visitInterval_visitSource_);
}

+ (id)_bestMapItemForQuery:(id)a3 wifiFingerprintLabelType:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!v5
    || (long long v22 = 0u,
        long long v23 = 0u,
        long long v20 = 0u,
        long long v21 = 0u,
        (uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16]) == 0))
  {
    id v9 = 0;
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      v13 = [v12 mapItem];
      v14 = [v13 extendedAttributes];
      if ([v14 wifiFingerprintLabelType] != a4)
      {

        goto LABEL_14;
      }
      if (!v9)
      {

LABEL_13:
        v13 = v9;
        id v9 = v12;
LABEL_14:

        continue;
      }
      [v9 confidence];
      double v16 = v15;
      [v12 confidence];
      double v18 = v17;

      if (v16 < v18) {
        goto LABEL_13;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v8);
LABEL_19:

  return v9;
}

+ (id)_mapItemDictionaryforResults:(id)a3 wifiFingerprintLabelType:(int64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v5 count])
  {
    uint64_t v7 = 0;
    v33 = v5;
    do
    {
      uint64_t v34 = v7;
      uint64_t v8 = [v5 objectAtIndexedSubscript:v7];
      id v9 = [v8 firstObject];

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id obj = v9;
      uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v37 != v12) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            double v15 = [v14 mapItem];
            double v16 = [v15 extendedAttributes];
            uint64_t v17 = [v16 wifiFingerprintLabelType];

            if (v17 == a4)
            {
              double v18 = NSNumber;
              v19 = [v14 mapItem];
              long long v20 = [v18 numberWithUnsignedInteger:[v19 muid]];
              long long v21 = [v6 objectForKeyedSubscript:v20];

              if (!v21)
              {
                long long v22 = [MEMORY[0x1E4F1CA48] array];
                long long v23 = NSNumber;
                v24 = [v14 mapItem];
                uint64_t v25 = [v23 numberWithUnsignedInteger:[v24 muid]];
                [v6 setObject:v22 forKeyedSubscript:v25];
              }
              v26 = NSNumber;
              v27 = [v14 mapItem];
              v28 = [v26 numberWithUnsignedInteger:[v27 muid]];
              v29 = [v6 objectForKeyedSubscript:v28];
              v30 = NSNumber;
              [v14 confidence];
              v31 = [v30 numberWithDouble:x0];
              [v29 addObject:v31];
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v11);
      }

      id v5 = v33;
      uint64_t v7 = v34 + 1;
    }
    while ([v33 count] > (unint64_t)(v34 + 1));
  }

  return v6;
}

+ (void)_getDominantStreakForResults:(id)a3 dominantKey:(id *)a4 largestSameResultCount:(unint64_t *)a5 hasDominantResult:(BOOL *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = [v6 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if (!v10)
        {
          uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithObject:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          double v15 = [v6 objectForKeyedSubscript:v14];
          unint64_t v11 = [v15 count];
        }
        double v16 = [v6 objectForKeyedSubscript:v14];
        if (v11 == [v16 count])
        {
          char v17 = [v10 containsObject:v14];

          if ((v17 & 1) == 0) {
            [v10 addObject:v14];
          }
        }
        else
        {
        }
        double v18 = [v6 objectForKeyedSubscript:v14];
        unint64_t v19 = [v18 count];

        if (v11 < v19)
        {
          uint64_t v20 = [MEMORY[0x1E4F1CA48] arrayWithObject:v14];

          long long v21 = [v6 objectForKeyedSubscript:v14];
          unint64_t v11 = [v21 count];

          uint64_t v10 = (void *)v20;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
  }

  if ([v10 count])
  {
    *a4 = [v10 firstObject];
    *a5 = v11;
    BOOL v22 = [v10 count] == 1;
  }
  else
  {
    BOOL v22 = 0;
    *a4 = 0;
    *a5 = 0;
  }
  *a6 = v22;
}

- (RTMapItemProviderBluePOIPerformanceMetrics)initWithNonZeroAccessPointsFingerprintsCount:(unint64_t)a3 zeroAccessPointsFingerprintsCount:(unint64_t)a4 fingerprintsCount:(unint64_t)a5 queryCount:(unint64_t)a6 firstResultQueryCount:(unint64_t)a7 results:(id)a8 earlyStopQueryCount:(unint64_t)a9 earlyStopQueryResult:(id)a10 bestQueryResult:(id)a11 error:(id)a12 visitInterval:(double)a13 visitSource:(int64_t)a14
{
  id v20 = a8;
  id v21 = a10;
  id v22 = a11;
  id v116 = a12;
  v123.receiver = self;
  v123.super_class = (Class)RTMapItemProviderBluePOIPerformanceMetrics;
  long long v23 = [(RTMapItemProviderBluePOIPerformanceMetrics *)&v123 init];
  if (v23)
  {
    id v113 = v22;
    id v114 = v21;
    if ([v20 count])
    {
      v24 = [v20 firstObject];
      v112 = [v24 firstObject];
    }
    else
    {
      v112 = 0;
    }
    v115 = [(id)objc_opt_class() _mapItemDictionaryforResults:v20 wifiFingerprintLabelType:1];
    v111 = [(id)objc_opt_class() _mapItemDictionaryforResults:v20 wifiFingerprintLabelType:2];
    id v108 = v20;
    uint64_t v25 = [v20 count];
    uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
    metrics = v23->_metrics;
    v23->_metrics = (NSMutableDictionary *)v26;

    long long v28 = [NSNumber numberWithUnsignedInteger:a5];
    [(NSMutableDictionary *)v23->_metrics setObject:v28 forKeyedSubscript:@"fingerprintsCount"];

    long long v29 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v23->_metrics setObject:v29 forKeyedSubscript:@"zeroAccessPointsFingerprintsCount"];

    v30 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v23->_metrics setObject:v30 forKeyedSubscript:@"nonZeroAccessPointsFingerprintsCount"];

    uint64_t v31 = [NSNumber numberWithInteger:a14];
    [(NSMutableDictionary *)v23->_metrics setObject:v31 forKeyedSubscript:@"visitSource"];

    v32 = [NSNumber numberWithDouble:a13];
    [(NSMutableDictionary *)v23->_metrics setObject:v32 forKeyedSubscript:@"visitDuration"];

    v33 = [NSNumber numberWithUnsignedInteger:a6];
    [(NSMutableDictionary *)v23->_metrics setObject:v33 forKeyedSubscript:@"queryCount"];

    uint64_t v34 = [NSNumber numberWithUnsignedInteger:v25];
    [(NSMutableDictionary *)v23->_metrics setObject:v34 forKeyedSubscript:@"resultCount"];

    v35 = [NSNumber numberWithUnsignedInteger:a7];
    [(NSMutableDictionary *)v23->_metrics setObject:v35 forKeyedSubscript:@"firstResultQueryCount"];

    long long v36 = [NSNumber numberWithUnsignedInteger:a9];
    [(NSMutableDictionary *)v23->_metrics setObject:v36 forKeyedSubscript:@"earlyStopQueryCount"];

    long long v37 = [(id)objc_opt_class() _bestMapItemForQuery:v114 wifiFingerprintLabelType:1];
    long long v38 = NSNumber;
    [v37 confidence];
    long long v39 = [v38 numberWithDouble:];
    [(NSMutableDictionary *)v23->_metrics setObject:v39 forKeyedSubscript:@"earlyStopPOIConfidence"];

    v40 = [(id)objc_opt_class() _bestMapItemForQuery:v114 wifiFingerprintLabelType:2];
    uint64_t v41 = NSNumber;
    [v40 confidence];
    v42 = [v41 numberWithDouble:x0];
    [(NSMutableDictionary *)v23->_metrics setObject:v42 forKeyedSubscript:@"earlyStopAOIConfidence"];

    v43 = [(id)objc_opt_class() _bestMapItemForQuery:v113 wifiFingerprintLabelType:1];
    v44 = NSNumber;
    [v43 confidence];
    v45 = [v44 numberWithDouble:x0];
    [(NSMutableDictionary *)v23->_metrics setObject:v45 forKeyedSubscript:@"bestPOIConfidence"];

    v46 = [(id)objc_opt_class() _bestMapItemForQuery:v113 wifiFingerprintLabelType:2];
    v47 = NSNumber;
    [v46 confidence];
    v48 = [v47 numberWithDouble:x0];
    [(NSMutableDictionary *)v23->_metrics setObject:v48 forKeyedSubscript:@"bestAOIConfidence"];

    v49 = [(id)objc_opt_class() _bestMapItemForQuery:v112 wifiFingerprintLabelType:1];
    v50 = NSNumber;
    v106 = v49;
    [v49 confidence];
    v51 = [v50 numberWithDouble:];
    [(NSMutableDictionary *)v23->_metrics setObject:v51 forKeyedSubscript:@"firstResultPOIConfidence"];

    v52 = [(id)objc_opt_class() _bestMapItemForQuery:v112 wifiFingerprintLabelType:2];
    v53 = NSNumber;
    v105 = v52;
    [v52 confidence];
    v54 = [v53 numberWithDouble:];
    [(NSMutableDictionary *)v23->_metrics setObject:v54 forKeyedSubscript:@"firstResultAOIConfidence"];

    v55 = [NSNumber numberWithInt:v46 != 0];
    [(NSMutableDictionary *)v23->_metrics setObject:v55 forKeyedSubscript:@"hasAOIResult"];

    v56 = [NSNumber numberWithInt:v43 != 0];
    [(NSMutableDictionary *)v23->_metrics setObject:v56 forKeyedSubscript:@"hasPOIResult"];

    if (v40 && v46)
    {
      [v46 confidence];
      double v58 = v57;
      [v40 confidence];
      double v60 = v58 - v59;
      v61 = [NSNumber numberWithDouble:v60];
      [(NSMutableDictionary *)v23->_metrics setObject:v61 forKeyedSubscript:@"bestEarlyStopAOIConfidenceDiference"];

      v62 = [NSNumber numberWithInt:v60 < 0.001];
      [(NSMutableDictionary *)v23->_metrics setObject:v62 forKeyedSubscript:@"earlyStopConfidenceEqualsBestConfidenceAOI"];
    }
    if (v37 && v43)
    {
      [v43 confidence];
      double v64 = v63;
      [v37 confidence];
      double v66 = v64 - v65;
      v67 = [NSNumber numberWithDouble:v66];
      [(NSMutableDictionary *)v23->_metrics setObject:v67 forKeyedSubscript:@"bestEarlyStopPOIConfidenceDiference"];

      v68 = [NSNumber numberWithInt:v66 < 0.001];
      [(NSMutableDictionary *)v23->_metrics setObject:v68 forKeyedSubscript:@"earlyStopConfidenceEqualsBestConfidencePOI"];
    }
    v110 = v37;
    v69 = [NSNumber numberWithUnsignedInteger:[v111 count]];
    [(NSMutableDictionary *)v23->_metrics setObject:v69 forKeyedSubscript:@"uniqueAOIResultCount"];

    v70 = [NSNumber numberWithUnsignedInteger:[v115 count]];
    [(NSMutableDictionary *)v23->_metrics setObject:v70 forKeyedSubscript:@"uniquePOIResultCount"];

    uint64_t v122 = 0;
    unsigned __int8 v121 = 0;
    id v120 = 0;
    [(id)objc_opt_class() _getDominantStreakForResults:v111 dominantKey:&v120 largestSameResultCount:&v122 hasDominantResult:&v121];
    id v71 = v120;
    v72 = [NSNumber numberWithUnsignedInteger:v122];
    [(NSMutableDictionary *)v23->_metrics setObject:v72 forKeyedSubscript:@"largestSameResultAOICount"];

    v73 = [NSNumber numberWithBool:v121];
    [(NSMutableDictionary *)v23->_metrics setObject:v73 forKeyedSubscript:@"hasDominantAOIResult"];

    v74 = NSNumber;
    int v75 = v121;
    if (v121)
    {
      v73 = [v40 mapItem];
      uint64_t v76 = [v73 muid];
      BOOL v77 = v76 == [v71 unsignedIntegerValue];
    }
    else
    {
      BOOL v77 = 0;
    }
    v78 = [v74 numberWithInt:v77];
    [(NSMutableDictionary *)v23->_metrics setObject:v78 forKeyedSubscript:@"isEarlyStopDominantAOIResult"];

    if (v75) {
    v79 = NSNumber;
    }
    int v80 = v121;
    if (v121)
    {
      v73 = [v46 mapItem];
      uint64_t v81 = [v73 muid];
      BOOL v82 = v81 == [v71 unsignedIntegerValue];
    }
    else
    {
      BOOL v82 = 0;
    }
    v107 = v40;
    v83 = [v79 numberWithInt:v82];
    [(NSMutableDictionary *)v23->_metrics setObject:v83 forKeyedSubscript:@"isBestResultDominantAOIResult"];

    if (v80) {
    uint64_t v119 = 0;
    }
    unsigned __int8 v118 = 0;
    id v117 = 0;
    [(id)objc_opt_class() _getDominantStreakForResults:v115 dominantKey:&v117 largestSameResultCount:&v119 hasDominantResult:&v118];
    id v84 = v117;
    v85 = [NSNumber numberWithUnsignedInteger:v119];
    [(NSMutableDictionary *)v23->_metrics setObject:v85 forKeyedSubscript:@"largestSameResultPOICount"];

    v86 = [NSNumber numberWithBool:v118];
    [(NSMutableDictionary *)v23->_metrics setObject:v86 forKeyedSubscript:@"hasDominantPOIResult"];

    v87 = NSNumber;
    int v88 = v118;
    if (v118)
    {
      v86 = [v110 mapItem];
      uint64_t v89 = [v86 muid];
      BOOL v90 = v89 == [v84 unsignedIntegerValue];
    }
    else
    {
      BOOL v90 = 0;
    }
    v91 = [v87 numberWithInt:v90];
    [(NSMutableDictionary *)v23->_metrics setObject:v91 forKeyedSubscript:@"isEarlyStopDominantPOIResult"];

    if (v88) {
    v92 = NSNumber;
    }
    int v93 = v118;
    if (v118)
    {
      v86 = [v43 mapItem];
      uint64_t v94 = [v86 muid];
      BOOL v95 = v94 == [v84 unsignedIntegerValue];
    }
    else
    {
      BOOL v95 = 0;
    }
    v96 = [v92 numberWithInt:v95];
    [(NSMutableDictionary *)v23->_metrics setObject:v96 forKeyedSubscript:@"isBestResultDominantPOIResult"];

    if (v93) {
    if (v116)
    }
    {
      v97 = [v116 domain];
      [(NSMutableDictionary *)v23->_metrics setObject:v97 forKeyedSubscript:@"errorDomain"];

      v98 = [NSNumber numberWithInteger:[v116 code]];
      [(NSMutableDictionary *)v23->_metrics setObject:v98 forKeyedSubscript:@"errorCode"];

      v99 = [v116 userInfo];
      uint64_t v100 = *MEMORY[0x1E4F63EB0];
      v101 = [v99 objectForKeyedSubscript:*MEMORY[0x1E4F63EB0]];

      if (v101)
      {
        v102 = [v116 userInfo];
        v103 = [v102 objectForKeyedSubscript:v100];
        [(NSMutableDictionary *)v23->_metrics setObject:v103 forKeyedSubscript:@"httpCode"];
      }
    }

    id v20 = v108;
    id v22 = v113;
    id v21 = v114;
  }

  return v23;
}

- (void)submitMetrics
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__RTMapItemProviderBluePOIPerformanceMetrics_submitMetrics__block_invoke;
  v17[3] = &unk_1E6B97620;
  objc_copyWeak(&v18, &location);
  v4 = (void *)MEMORY[0x1E016DB00](v17);
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = NSStringFromSelector(a2);
    metrics = self->_metrics;
    *(_DWORD *)buf = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    long long v23 = metrics;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, submitting, BluePOIPerformanceMetrics, %@", buf, 0x16u);
  }
  id v8 = [NSString alloc];
  uint64_t v9 = (void *)[v8 initWithCString:RTAnalyticsEventBluePOIPerformanceMetrics encoding:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__RTMapItemProviderBluePOIPerformanceMetrics_submitMetrics__block_invoke_118;
  v14[3] = &unk_1E6B943B0;
  id v10 = v4;
  id v16 = v10;
  id v11 = v9;
  id v15 = v11;
  uint64_t v12 = (void *)MEMORY[0x1E016DB00](v14);
  v13 = [NSString stringWithFormat:@"com.apple.%@", v11];
  AnalyticsSendEventLazy();

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

id __59__RTMapItemProviderBluePOIPerformanceMetrics_submitMetrics__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained metrics];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __59__RTMapItemProviderBluePOIPerformanceMetrics_submitMetrics__block_invoke_118(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  log_analytics_submission(*(void **)(a1 + 32), v2);

  return v2;
}

+ (void)submitMetricsWithNonZeroAccessPointsFingerprintsCount:(unint64_t)a3 zeroAccessPointsFingerprintsCount:(unint64_t)a4 fingerprintsCount:(unint64_t)a5 queryCount:(unint64_t)a6 firstResultQueryCount:(unint64_t)a7 results:(id)a8 earlyStopQueryCount:(unint64_t)a9 earlyStopQueryResult:(id)a10 bestQueryResult:(id)a11 error:(id)a12 visitInterval:(double)a13 visitSource:(int64_t)a14
{
  id v19 = a12;
  id v20 = a11;
  id v21 = a10;
  id v22 = a8;
  uint64_t v25 = [[RTMapItemProviderBluePOIPerformanceMetrics alloc] initWithNonZeroAccessPointsFingerprintsCount:a3 zeroAccessPointsFingerprintsCount:a4 fingerprintsCount:a5 queryCount:a6 firstResultQueryCount:a7 results:v22 earlyStopQueryCount:a13 earlyStopQueryResult:a9 bestQueryResult:v21 error:v20 visitInterval:v19 visitSource:a14];

  [(RTMapItemProviderBluePOIPerformanceMetrics *)v25 submitMetrics];
}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
}

@end