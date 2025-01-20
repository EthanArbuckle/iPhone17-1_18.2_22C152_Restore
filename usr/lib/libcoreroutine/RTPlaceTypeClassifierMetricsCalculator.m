@interface RTPlaceTypeClassifierMetricsCalculator
+ (BOOL)inferredAddressComponent:(id)a3 consistentWithTrueComponent:(id)a4;
+ (id)anySourceMetricKeys;
+ (id)cacheMetricsKeyToString:(unint64_t)a3;
+ (id)collectPlaceVersionsFromInferredPlaces:(id)a3 contactsPlaces:(id)a4 rottedPlaces:(id)a5;
+ (id)durationsForCacheMetrics;
+ (id)genericOnlyMetricKeys;
+ (id)ignoredMetricKeys;
+ (id)keyForMetricType:(unint64_t)a3 placeType:(unint64_t)a4 source:(unint64_t)a5 metricKey:(unint64_t)a6;
+ (id)keyForMetricType:(unint64_t)a3 sourcePlaceType:(unint64_t)a4 source:(unint64_t)a5 referenceSourcePlaceType:(unint64_t)a6 referenceSource:(unint64_t)a7 metricKey:(unint64_t)a8;
+ (id)keyForSourceType:(unint64_t)a3 placeType:(unint64_t)a4;
+ (id)metricsKeyToString:(unint64_t)a3;
+ (id)metricsSourceToString:(unint64_t)a3;
+ (id)metricsTypeToString:(unint64_t)a3;
+ (id)modelDictionaryMetricKeys;
+ (id)modelNonDictionaryMetricKeys;
+ (id)modelSources;
+ (id)newAlgorithmInstanceWithInference:(id)a3 distanceCalculator:(id)a4;
+ (id)nonModelSources;
+ (id)normalize:(id)a3;
+ (id)notHomeEligibleSources;
+ (id)notWorkEligibleSources;
+ (id)placeTypesForCacheMetrics;
+ (id)schoolEligibleSources;
+ (id)shownToEndUserOnlyMetricKeys;
+ (unint64_t)addressComponentMatchesBetweenInferredAddress:(id)a3 trueAddress:(id)a4;
+ (void)submitMetricsForInferredPlaces:(id)a3 contactsPlaces:(id)a4 rottedPlaces:(id)a5 distanceCalculator:(id)a6 metricManager:(id)a7;
+ (void)updateAlgorithmInstance:(id)a3 byComparingInferredMapItem:(id)a4 withTruthfulMapItem:(id)a5 withDistanceCalculator:(id)a6;
- (NSMutableArray)learnedPlaceTypeInferences;
- (NSMutableDictionary)metricsData;
- (NSUUID)sessionId;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLearnedPlaceTypeInferenceStore)learnedPlaceTypeInferenceStore;
- (RTMetricManager)metricManager;
- (RTPlaceTypeClassifierMetricsCalculator)init;
- (RTPlaceTypeClassifierMetricsCalculator)initWithDistanceCalculator:(id)a3 learnedLocationStore:(id)a4 learnedPlaceTypeInferenceStore:(id)a5 metricManager:(id)a6;
- (id)_computeCountOfLOIsForCacheMetricsFromLOIs:(id)a3;
- (id)_computeCountOfNonNillLearnedPlaceTypeInferences:(id)a3;
- (id)_computeCountOfTotalLearnedPlaceTypeInferences:(id)a3;
- (id)_computeCountOfUniqueLearnedPlaceTypeInferences:(id)a3;
- (id)_computeDurationOfGraphForCacheMetricsFromLOIs:(id)a3;
- (id)_computeFlipFlopCountLearnedPlaceTypeInferences:(id)a3;
- (id)_computeLengthOfLatestClassificationForLearnedPlaceTypeInferences:(id)a3;
- (id)_computeLengthOfLatestClassificationSinceChangedForLearnedPlaceTypeInferences:(id)a3;
- (id)_computeOverAllMetricsForCacheMetrics;
- (id)_filterLearnedPlaceTypeInferencesWithPlaceType:(unint64_t)a3 dateInterval:(id)a4 metricsSource:(unint64_t)a5 learnedPlaceTypeInferences:(id)a6;
- (id)_getLearnedLocationOfInterests;
- (id)_getLearnedPlaceTypeInferencesWithDateInterval:(id)a3;
- (id)_retrieveMetricsFromCacheStore;
- (id)computeDistanceMetricForSourcePlaces:(id)a3 referencePlaces:(id)a4 bins:(id)a5;
- (id)computeMetricsForSourcePlaceType:(unint64_t)a3 source:(unint64_t)a4 referenceSourcePlaceType:(unint64_t)a5 referenceSource:(unint64_t)a6 metricType:(unint64_t)a7 bins:(id)a8;
- (id)filterLearnedPlacesOfType:(unint64_t)a3 places:(id)a4;
- (id)retrieveComputedMetricsForSourcePlaceType:(unint64_t)a3 source:(unint64_t)a4;
- (id)retrieveMetrics;
- (void)_storeLearnedPlaceTypeInferencesToCacheStore;
- (void)ensureMetricsDataHasKeysForSource:(unint64_t)a3 placeType:(unint64_t)a4 metricKey:(unint64_t)a5;
- (void)onDailyMetricNotification:(id)a3;
- (void)resetStates;
- (void)setSessionId:(id)a3;
- (void)setup;
- (void)storeMetricsData:(id)a3 source:(unint64_t)a4;
- (void)storeMetricsData:(id)a3 source:(unint64_t)a4 placeType:(unint64_t)a5;
- (void)storeMetricsData:(id)a3 source:(unint64_t)a4 placeType:(unint64_t)a5 metricKey:(unint64_t)a6;
- (void)submitMetrics;
@end

@implementation RTPlaceTypeClassifierMetricsCalculator

- (RTPlaceTypeClassifierMetricsCalculator)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_learnedLocationStore_learnedPlaceTypeInferenceStore_metricManager_);
}

- (RTPlaceTypeClassifierMetricsCalculator)initWithDistanceCalculator:(id)a3 learnedLocationStore:(id)a4 learnedPlaceTypeInferenceStore:(id)a5 metricManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (!v11)
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_17;
  }
  if (!v12)
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_16;
  }
  if (!v13)
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: learnedPlaceTypeInferenceStore";
    goto LABEL_16;
  }
  if (!v14)
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: metricManager";
      goto LABEL_16;
    }
LABEL_17:

    v22 = 0;
    goto LABEL_18;
  }
  v26.receiver = self;
  v26.super_class = (Class)RTPlaceTypeClassifierMetricsCalculator;
  v16 = [(RTPlaceTypeClassifierMetricsCalculator *)&v26 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_distanceCalculator, a3);
    objc_storeStrong((id *)&v17->_learnedLocationStore, a4);
    objc_storeStrong((id *)&v17->_learnedPlaceTypeInferenceStore, a5);
    objc_storeStrong((id *)&v17->_metricManager, a6);
    uint64_t v18 = objc_opt_new();
    metricsData = v17->_metricsData;
    v17->_metricsData = (NSMutableDictionary *)v18;

    uint64_t v20 = objc_opt_new();
    learnedPlaceTypeInferences = v17->_learnedPlaceTypeInferences;
    v17->_learnedPlaceTypeInferences = (NSMutableArray *)v20;

    [(RTPlaceTypeClassifierMetricsCalculator *)v17 setup];
  }
  self = v17;
  v22 = self;
LABEL_18:

  return v22;
}

- (void)setup
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_onDailyMetricNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];
}

+ (id)metricsSourceToString:(unint64_t)a3
{
  if (a3 - 1 > 0xF) {
    return @"Unknown";
  }
  else {
    return off_1E6B96150[a3 - 1];
  }
}

+ (id)metricsKeyToString:(unint64_t)a3
{
  if (a3 - 1 > 0xA) {
    return @"Unknown";
  }
  else {
    return off_1E6B961D0[a3 - 1];
  }
}

+ (id)cacheMetricsKeyToString:(unint64_t)a3
{
  if (a3 > 0xB) {
    return @"NonNilCount";
  }
  else {
    return off_1E6B96228[a3];
  }
}

+ (id)placeTypesForCacheMetrics
{
  return &unk_1F3452D78;
}

+ (id)durationsForCacheMetrics
{
  return &unk_1F3452D90;
}

- (void)resetStates
{
  id v3 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];

  if (v3)
  {
    v4 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
    [v4 removeAllObjects];
  }
  v5 = [(RTPlaceTypeClassifierMetricsCalculator *)self learnedPlaceTypeInferences];

  if (v5)
  {
    v6 = [(RTPlaceTypeClassifierMetricsCalculator *)self learnedPlaceTypeInferences];
    [v6 removeAllObjects];
  }

  [(RTPlaceTypeClassifierMetricsCalculator *)self setSessionId:0];
}

- (void)storeMetricsData:(id)a3 source:(unint64_t)a4 placeType:(unint64_t)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__RTPlaceTypeClassifierMetricsCalculator_storeMetricsData_source_placeType___block_invoke;
  v5[3] = &unk_1E6B96050;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  [a3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __76__RTPlaceTypeClassifierMetricsCalculator_storeMetricsData_source_placeType___block_invoke(void *a1, void *a2, void *a3)
{
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  id v7 = a3;
  [v4 storeMetricsData:v7 source:v5 placeType:v6 metricKey:[a2 unsignedIntValue]];
}

- (void)storeMetricsData:(id)a3 source:(unint64_t)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(a2);
    id v11 = [(id)objc_opt_class() metricsSourceToString:a4];
    *(_DWORD *)buf = 138413058;
    v95 = v9;
    __int16 v96 = 2112;
    v97 = v10;
    __int16 v98 = 2112;
    uint64_t v99 = (uint64_t)v11;
    __int16 v100 = 2048;
    uint64_t v101 = [v6 count];
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, source, %@, number of inferred places, %lu", buf, 0x2Au);
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v12 = [&unk_1F3452DA8 countByEnumeratingWithState:&v90 objects:v107 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v91;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v91 != v14) {
          objc_enumerationMutation(&unk_1F3452DA8);
        }
        v16 = *(void **)(*((void *)&v90 + 1) + 8 * v15);
        if ([v16 unsignedIntValue] == 1
          || [v16 unsignedIntValue] == 2
          || a4 == 2 && [v16 unsignedIntValue] == 3)
        {
          -[RTPlaceTypeClassifierMetricsCalculator ensureMetricsDataHasKeysForSource:placeType:metricKey:](self, "ensureMetricsDataHasKeysForSource:placeType:metricKey:", a4, [v16 unsignedIntValue], 1);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v17 = [&unk_1F3452DA8 countByEnumeratingWithState:&v90 objects:v107 count:16];
      uint64_t v13 = v17;
    }
    while (v17);
  }
  unint64_t v76 = a4;
  v77 = objc_opt_new();
  v75 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v18 = [(RTPlaceTypeClassifierMetricsCalculator *)self sessionId];

  if (!v18)
  {
    v19 = [MEMORY[0x1E4F29128] UUID];
    [(RTPlaceTypeClassifierMetricsCalculator *)self setSessionId:v19];
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obuint64_t j = v6;
  uint64_t v20 = [obj countByEnumeratingWithState:&v86 objects:v106 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v87 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        v25 = (void *)MEMORY[0x1E016D870]();
        objc_super v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "type"));
        [v77 setObject:v24 forKeyedSubscript:v26];

        v27 = [RTLearnedPlaceTypeInference alloc];
        v28 = [MEMORY[0x1E4F29128] UUID];
        v29 = [(RTPlaceTypeClassifierMetricsCalculator *)self sessionId];
        v30 = [v24 identifier];
        v31 = -[RTLearnedPlaceTypeInference initWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:](v27, "initWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:", v28, v29, v30, [v24 type], v76, v75);

        if (v31)
        {
          v32 = [(RTPlaceTypeClassifierMetricsCalculator *)self learnedPlaceTypeInferences];
          [v32 addObject:v31];
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v86 objects:v106 count:16];
    }
    while (v21);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v33 = [(id)objc_opt_class() placeTypesForCacheMetrics];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v82 objects:v105 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v83;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v83 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v82 + 1) + 8 * j);
        v39 = (void *)MEMORY[0x1E016D870]();
        v40 = [v77 objectForKeyedSubscript:v38];

        if (!v40)
        {
          v41 = [RTLearnedPlaceTypeInference alloc];
          v42 = [MEMORY[0x1E4F29128] UUID];
          v43 = [(RTPlaceTypeClassifierMetricsCalculator *)self sessionId];
          v44 = -[RTLearnedPlaceTypeInference initWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:](v41, "initWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:", v42, v43, 0, [v38 unsignedIntValue], v76, v75);

          if (v44)
          {
            v45 = [(RTPlaceTypeClassifierMetricsCalculator *)self learnedPlaceTypeInferences];
            [v45 addObject:v44];
          }
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v82 objects:v105 count:16];
    }
    while (v35);
  }

  v46 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    v47 = (objc_class *)objc_opt_class();
    v48 = NSStringFromClass(v47);
    v49 = NSStringFromSelector(a2);
    v50 = [(RTPlaceTypeClassifierMetricsCalculator *)self learnedPlaceTypeInferences];
    uint64_t v51 = [v50 count];
    *(_DWORD *)buf = 138412802;
    v95 = v48;
    __int16 v96 = 2112;
    v97 = v49;
    __int16 v98 = 2048;
    uint64_t v99 = v51;
    _os_log_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_INFO, "%@, %@, learnedPlaceTypeInference count, %lu", buf, 0x20u);
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v72 = obj;
  uint64_t v52 = [v72 countByEnumeratingWithState:&v78 objects:v104 count:16];
  unint64_t v53 = v76;
  if (v52)
  {
    uint64_t v54 = v52;
    v55 = 0;
    id obja = *(id *)v79;
    do
    {
      uint64_t v56 = 0;
      v57 = v55;
      do
      {
        if (*(id *)v79 != obja) {
          objc_enumerationMutation(v72);
        }
        v58 = *(void **)(*((void *)&v78 + 1) + 8 * v56);
        v59 = (void *)MEMORY[0x1E016D870]();
        v55 = [objc_opt_class() keyForSourceType:v53 placeType:[v58 type]];

        v60 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
        v61 = [v60 objectForKeyedSubscript:v55];
        v62 = [v61 objectForKeyedSubscript:&unk_1F3450FD8];

        if (v62)
        {
          v63 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
          v64 = [v63 objectForKeyedSubscript:v55];
          v65 = [v64 objectForKeyedSubscript:&unk_1F3450FD8];
          [v65 addObject:v58];

          v66 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            v67 = (objc_class *)objc_opt_class();
            v68 = NSStringFromClass(v67);
            v69 = NSStringFromSelector(a2);
            v70 = [(id)objc_opt_class() metricsKeyToString:1];
            *(_DWORD *)buf = 138413314;
            v95 = v68;
            __int16 v96 = 2112;
            v97 = v69;
            __int16 v98 = 2112;
            uint64_t v99 = (uint64_t)v55;
            __int16 v100 = 2112;
            uint64_t v101 = (uint64_t)v70;
            __int16 v102 = 2112;
            v103 = v58;
            _os_log_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_DEFAULT, "%@, %@, metricsDataMainKey, %@, metricKey, %@, learnedPlace, %@", buf, 0x34u);

            unint64_t v53 = v76;
          }
        }
        ++v56;
        v57 = v55;
      }
      while (v54 != v56);
      uint64_t v54 = [v72 countByEnumeratingWithState:&v78 objects:v104 count:16];
    }
    while (v54);
  }
}

- (void)storeMetricsData:(id)a3 source:(unint64_t)a4 placeType:(unint64_t)a5 metricKey:(unint64_t)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (a6 == 1) {
    [(RTPlaceTypeClassifierMetricsCalculator *)self storeMetricsData:v11 source:a4];
  }
  [(RTPlaceTypeClassifierMetricsCalculator *)self ensureMetricsDataHasKeysForSource:a4 placeType:a5 metricKey:a6];
  uint64_t v12 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
  uint64_t v13 = [(id)objc_opt_class() keyForSourceType:a4 placeType:a5];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];
  uint64_t v15 = [NSNumber numberWithUnsignedInteger:a6];
  [v14 setObject:v11 forKeyedSubscript:v15];

  v16 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __86__RTPlaceTypeClassifierMetricsCalculator_storeMetricsData_source_placeType_metricKey___block_invoke;
    v25[3] = &unk_1E6B96078;
    id v26 = v16;
    [v11 enumerateKeysAndObjectsUsingBlock:v25];
  }
  uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    uint64_t v20 = NSStringFromSelector(a2);
    uint64_t v21 = [(id)objc_opt_class() keyForSourceType:a4 placeType:a5];
    uint64_t v22 = [(id)objc_opt_class() metricsKeyToString:a6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    *(_DWORD *)buf = 138413314;
    if (isKindOfClass) {
      id v24 = v16;
    }
    else {
      id v24 = v11;
    }
    v28 = v19;
    __int16 v29 = 2112;
    v30 = v20;
    __int16 v31 = 2112;
    v32 = v21;
    __int16 v33 = 2112;
    uint64_t v34 = v22;
    __int16 v35 = 2112;
    id v36 = v24;
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEFAULT, "%@, %@, mainMetricsDataKey, %@, metricKey, %@, metricsData, %@", buf, 0x34u);
  }
}

void __86__RTPlaceTypeClassifierMetricsCalculator_storeMetricsData_source_placeType_metricKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 stringValue];
  [v4 appendFormat:@"%@, %@, ", v5, v6];
}

- (void)ensureMetricsDataHasKeysForSource:(unint64_t)a3 placeType:(unint64_t)a4 metricKey:(unint64_t)a5
{
  id v19 = [(id)objc_opt_class() keyForSourceType:a3 placeType:a4];
  id v7 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
  v8 = [v7 objectForKeyedSubscript:v19];

  if (!v8)
  {
    v9 = objc_opt_new();
    v10 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
    [v10 setObject:v9 forKeyedSubscript:v19];
  }
  id v11 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
  uint64_t v12 = [v11 objectForKeyedSubscript:v19];
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:a5];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];

  if (!v14)
  {
    uint64_t v15 = objc_opt_new();
    v16 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
    uint64_t v17 = [v16 objectForKeyedSubscript:v19];
    uint64_t v18 = [NSNumber numberWithUnsignedInteger:a5];
    [v17 setObject:v15 forKeyedSubscript:v18];
  }
}

- (void)onDailyMetricNotification:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  char v7 = [v6 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if ((v7 & 1) == 0)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v5 name];
      *(_DWORD *)buf = 138412802;
      v23 = v19;
      __int16 v24 = 2080;
      v25 = "-[RTPlaceTypeClassifierMetricsCalculator onDailyMetricNotification:]";
      __int16 v26 = 1024;
      LODWORD(v27) = 481;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
  v9 = [v5 name];
  char v10 = [v9 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E016D870]();
    uint64_t v12 = [(RTPlaceTypeClassifierMetricsCalculator *)self _retrieveMetricsFromCacheStore];
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      NSStringFromSelector(a2);
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v12 count];
      *(_DWORD *)buf = 138412802;
      v23 = v15;
      __int16 v24 = 2112;
      v25 = v16;
      __int16 v26 = 2048;
      uint64_t v27 = v17;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, %@, cacheMetricsDictionary count, %lu", buf, 0x20u);
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68__RTPlaceTypeClassifierMetricsCalculator_onDailyMetricNotification___block_invoke;
    v21[3] = &unk_1E6B960A0;
    v21[4] = self;
    v21[5] = a2;
    [v12 enumerateObjectsUsingBlock:v21];
  }
  else
  {
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v5 name];
      *(_DWORD *)buf = 138412290;
      v23 = v20;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);
    }
  }
}

void __68__RTPlaceTypeClassifierMetricsCalculator_onDailyMetricNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    char v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138413058;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    __int16 v17 = 2048;
    uint64_t v18 = a3 + 1;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@, %@, idx, %lu, cacheMetricDictionary, %@", buf, 0x2Au);
  }
  id v7 = [NSString alloc];
  v8 = (void *)[v7 initWithCString:RTAnalyticsEventPlaceTypeClassificationRobustness encoding:1];
  log_analytics_submission(v8, v5);
  v9 = [NSString stringWithFormat:@"com.apple.%@", v8];
  AnalyticsSendEvent();
}

- (void)submitMetrics
{
  uint64_t v2 = self;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = (void *)MEMORY[0x1E016D870](self, a2);
  id v3 = [(RTPlaceTypeClassifierMetricsCalculator *)v2 retrieveMetrics];
  id v4 = [NSString alloc];
  id v5 = (void *)[v4 initWithCString:RTAnalyticsEventPlaceTypeClassification encoding:1];
  log_analytics_submission(v5, v3);
  id v6 = [NSString stringWithFormat:@"com.apple.%@", v5];
  AnalyticsSendEvent();

  [(RTPlaceTypeClassifierMetricsCalculator *)v2 _storeLearnedPlaceTypeInferencesToCacheStore];
  id v7 = objc_opt_new();
  v8 = objc_opt_new();
  [v7 setObject:v8 forKeyedSubscript:&unk_1F3451020];

  v9 = objc_opt_new();
  [v7 setObject:v9 forKeyedSubscript:&unk_1F3450FF0];

  char v10 = objc_opt_new();
  v39 = v7;
  [v7 setObject:v10 forKeyedSubscript:&unk_1F3451038];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  long long v50 = 0u;
  uint64_t v36 = [&unk_1F3452DC0 countByEnumeratingWithState:&v50 objects:v55 count:16];
  id v11 = 0;
  if (v36)
  {
    uint64_t v35 = *(void *)v51;
    uint64_t v12 = &unk_1F3450FD8;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v51 != v35) {
          objc_enumerationMutation(&unk_1F3452DC0);
        }
        uint64_t v38 = v13;
        uint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * v13);
        context = (void *)MEMORY[0x1E016D870]();
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v41 = [&unk_1F3452DD8 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v41)
        {
          uint64_t v40 = *(void *)v47;
          do
          {
            uint64_t v15 = 0;
            v16 = v11;
            do
            {
              if (*(void *)v47 != v40) {
                objc_enumerationMutation(&unk_1F3452DD8);
              }
              __int16 v17 = *(void **)(*((void *)&v46 + 1) + 8 * v15);
              uint64_t v18 = (void *)MEMORY[0x1E016D870]();
              id v11 = [objc_opt_class() keyForSourceType:[v14 unsignedIntValue] placeType:[v17 unsignedIntValue]];

              __int16 v19 = [(RTPlaceTypeClassifierMetricsCalculator *)v2 metricsData];
              id v20 = [v19 objectForKeyedSubscript:v11];
              [v20 objectForKeyedSubscript:v12];
              uint64_t v21 = v2;
              v23 = uint64_t v22 = v12;

              if (v23)
              {
                __int16 v24 = [v39 objectForKeyedSubscript:v14];
                v25 = [(RTPlaceTypeClassifierMetricsCalculator *)v21 metricsData];
                __int16 v26 = [v25 objectForKeyedSubscript:v11];
                uint64_t v27 = [v26 objectForKeyedSubscript:v22];
                [v24 addObjectsFromArray:v27];
              }
              ++v15;
              v16 = v11;
              uint64_t v12 = v22;
              uint64_t v2 = v21;
            }
            while (v41 != v15);
            uint64_t v41 = [&unk_1F3452DD8 countByEnumeratingWithState:&v46 objects:v54 count:16];
          }
          while (v41);
        }
        uint64_t v13 = v38 + 1;
      }
      while (v38 + 1 != v36);
      uint64_t v36 = [&unk_1F3452DC0 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v36);
  }
  uint64_t v28 = [(RTPlaceTypeClassifierMetricsCalculator *)v2 distanceCalculator];
  __int16 v29 = [(RTPlaceTypeClassifierMetricsCalculator *)v2 metricManager];
  v30 = [(RTPlaceTypeClassifierMetricsCalculator *)v2 metricManager];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __55__RTPlaceTypeClassifierMetricsCalculator_submitMetrics__block_invoke;
  v42[3] = &unk_1E6B95D50;
  id v43 = v39;
  id v44 = v28;
  id v45 = v29;
  id v31 = v29;
  id v32 = v28;
  [v30 fetchDiagnosticsEnabled:v42];

  __int16 v33 = [(RTPlaceTypeClassifierMetricsCalculator *)v2 metricsData];
  [v33 removeAllObjects];
}

void __55__RTPlaceTypeClassifierMetricsCalculator_submitMetrics__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1F3451020];
    id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1F3450FF0];
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1F3451038];
    +[RTPlaceTypeClassifierMetricsCalculator submitMetricsForInferredPlaces:v5 contactsPlaces:v3 rottedPlaces:v4 distanceCalculator:*(void *)(a1 + 40) metricManager:*(void *)(a1 + 48)];
  }
}

- (void)_storeLearnedPlaceTypeInferencesToCacheStore
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E016D870]();
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__66;
  v39 = __Block_byref_object_dispose__66;
  id v40 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(RTPlaceTypeClassifierMetricsCalculator *)self learnedPlaceTypeInferenceStore];
  id v6 = [(RTPlaceTypeClassifierMetricsCalculator *)self learnedPlaceTypeInferences];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __86__RTPlaceTypeClassifierMetricsCalculator__storeLearnedPlaceTypeInferencesToCacheStore__block_invoke;
  v32[3] = &unk_1E6B90728;
  uint64_t v34 = &v35;
  id v7 = v4;
  __int16 v33 = v7;
  [v5 storeLearnedPlaceTypeInferences:v6 handler:v32];

  v8 = v7;
  v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10)) {
    goto LABEL_6;
  }
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  uint64_t v14 = objc_opt_new();
  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_508];
  v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  __int16 v17 = [v16 filteredArrayUsingPredicate:v15];
  uint64_t v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: [inferredVersion.identifier isEqual:self.existingVersion.identifier] || inferredVersion == nil || self.existingVersion == nil (in %s:%d)", buf, 2u);
  }

  id v20 = (void *)MEMORY[0x1E4F28C58];
  v48[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v48 count:1];
  uint64_t v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

  if (v22)
  {
    id v23 = v22;
  }
  else
  {
LABEL_6:
    id v23 = 0;
  }

  id v24 = v23;
  v25 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    __int16 v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = NSStringFromSelector(a2);
    uint64_t v29 = v36[5];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v27;
    __int16 v42 = 2112;
    id v43 = v28;
    __int16 v44 = 2112;
    uint64_t v45 = v29;
    __int16 v46 = 2112;
    id v47 = v24;
    _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, %@, error, %@, semaError, %@", buf, 0x2Au);
  }
  v30 = [(RTPlaceTypeClassifierMetricsCalculator *)self learnedPlaceTypeInferences];
  [v30 removeAllObjects];

  [(RTPlaceTypeClassifierMetricsCalculator *)self setSessionId:0];
  _Block_object_dispose(&v35, 8);
}

void __86__RTPlaceTypeClassifierMetricsCalculator__storeLearnedPlaceTypeInferencesToCacheStore__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_retrieveMetricsFromCacheStore
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v5 = [v3 dateByAddingTimeInterval:-2419200.0];
  v59 = v3;
  id v6 = (void *)[v4 initWithStartDate:v5 endDate:v3];
  v58 = [(RTPlaceTypeClassifierMetricsCalculator *)self _getLearnedPlaceTypeInferencesWithDateInterval:v6];

  id v57 = (id)objc_opt_new();
  id v7 = objc_opt_new();
  v8 = [(id)objc_opt_class() modelSources];
  [v7 addObjectsFromArray:v8];

  v9 = [(id)objc_opt_class() nonModelSources];
  [v7 addObjectsFromArray:v9];

  v63 = self;
  uint64_t v56 = [(RTPlaceTypeClassifierMetricsCalculator *)self _computeOverAllMetricsForCacheMetrics];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obuint64_t j = v7;
  uint64_t v47 = [obj countByEnumeratingWithState:&v76 objects:v94 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v77 != v46) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        double v12 = (void *)MEMORY[0x1E016D870]();
        v60 = v11;
        if ([v11 unsignedIntValue])
        {
          long long v48 = v12;
          uint64_t v49 = i;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v50 = [(id)objc_opt_class() placeTypesForCacheMetrics];
          uint64_t v52 = [v50 countByEnumeratingWithState:&v72 objects:v93 count:16];
          if (v52)
          {
            uint64_t v51 = *(void *)v73;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v73 != v51) {
                  objc_enumerationMutation(v50);
                }
                uint64_t v54 = v13;
                v62 = *(void **)(*((void *)&v72 + 1) + 8 * v13);
                long long v53 = (void *)MEMORY[0x1E016D870]();
                long long v68 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                long long v71 = 0u;
                id v55 = [(id)objc_opt_class() durationsForCacheMetrics];
                uint64_t v64 = [v55 countByEnumeratingWithState:&v68 objects:v92 count:16];
                if (v64)
                {
                  uint64_t v61 = *(void *)v69;
                  do
                  {
                    uint64_t v14 = 0;
                    do
                    {
                      if (*(void *)v69 != v61) {
                        objc_enumerationMutation(v55);
                      }
                      uint64_t v15 = *(void **)(*((void *)&v68 + 1) + 8 * v14);
                      context = (void *)MEMORY[0x1E016D870]();
                      id v16 = objc_alloc(MEMORY[0x1E4F28C18]);
                      [v15 doubleValue];
                      uint64_t v67 = v14;
                      uint64_t v18 = [v59 dateByAddingTimeInterval:-v17];
                      v65 = (void *)[v16 initWithStartDate:v18 endDate:v59];

                      __int16 v19 = [[RTPlaceTypeClassifierMetricsCalculator _filterLearnedPlaceTypeInferencesWithPlaceType:dateInterval:metricsSource:learnedPlaceTypeInferences:][v62 unsignedIntValue], v65, objc_msgSend(v60, "unsignedIntValue"), v58];
                      id v20 = objc_opt_new();
                      uint64_t v21 = [(id)objc_opt_class() cacheMetricsKeyToString:9];
                      long long v90 = v21;
                      uint64_t v22 = [NSNumber numberWithUnsignedInt:[v62 unsignedIntValue]];
                      long long v91 = v22;
                      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
                      [v20 addEntriesFromDictionary:v23];

                      id v24 = [(id)objc_opt_class() cacheMetricsKeyToString:10];
                      long long v88 = v24;
                      v25 = [NSNumber numberWithUnsignedInt:[v60 unsignedIntValue]];
                      long long v89 = v25;
                      __int16 v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
                      [v20 addEntriesFromDictionary:v26];

                      id v27 = [(id)objc_opt_class() cacheMetricsKeyToString:11];
                      long long v86 = v27;
                      uint64_t v28 = NSNumber;
                      [v15 doubleValue];
                      v30 = [v28 numberWithUnsignedLong:(unint64_t)(v29 / 86400.0)];
                      long long v87 = v30;
                      id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
                      [v20 addEntriesFromDictionary:v31];

                      id v32 = [(RTPlaceTypeClassifierMetricsCalculator *)v63 _computeCountOfNonNillLearnedPlaceTypeInferences:v19];
                      [v20 addEntriesFromDictionary:v32];

                      __int16 v33 = [(RTPlaceTypeClassifierMetricsCalculator *)v63 _computeCountOfUniqueLearnedPlaceTypeInferences:v19];
                      [v20 addEntriesFromDictionary:v33];

                      uint64_t v34 = [(RTPlaceTypeClassifierMetricsCalculator *)v63 _computeCountOfTotalLearnedPlaceTypeInferences:v19];
                      [v20 addEntriesFromDictionary:v34];

                      uint64_t v35 = [(RTPlaceTypeClassifierMetricsCalculator *)v63 _computeFlipFlopCountLearnedPlaceTypeInferences:v19];
                      [v20 addEntriesFromDictionary:v35];

                      uint64_t v36 = [(RTPlaceTypeClassifierMetricsCalculator *)v63 _computeLengthOfLatestClassificationForLearnedPlaceTypeInferences:v19];
                      [v20 addEntriesFromDictionary:v36];

                      uint64_t v37 = [(RTPlaceTypeClassifierMetricsCalculator *)v63 _computeLengthOfLatestClassificationSinceChangedForLearnedPlaceTypeInferences:v19];
                      [v20 addEntriesFromDictionary:v37];

                      [v20 addEntriesFromDictionary:v56];
                      [v57 addObject:v20];

                      uint64_t v14 = v67 + 1;
                    }
                    while (v64 != v67 + 1);
                    uint64_t v64 = [v55 countByEnumeratingWithState:&v68 objects:v92 count:16];
                  }
                  while (v64);
                }

                uint64_t v13 = v54 + 1;
              }
              while (v54 + 1 != v52);
              uint64_t v52 = [v50 countByEnumeratingWithState:&v72 objects:v93 count:16];
            }
            while (v52);
          }

          double v12 = v48;
          uint64_t i = v49;
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v76 objects:v94 count:16];
    }
    while (v47);
  }

  uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = (objc_class *)objc_opt_class();
    id v40 = NSStringFromClass(v39);
    uint64_t v41 = NSStringFromSelector(a2);
    uint64_t v42 = [v57 count];
    *(_DWORD *)buf = 138412802;
    long long v81 = v40;
    __int16 v82 = 2112;
    long long v83 = v41;
    __int16 v84 = 2048;
    uint64_t v85 = v42;
    _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, %@, metricsFromCacheStore count, %lu", buf, 0x20u);
  }

  return v57;
}

- (id)_computeOverAllMetricsForCacheMetrics
{
  id v3 = [(RTPlaceTypeClassifierMetricsCalculator *)self _getLearnedLocationOfInterests];
  id v4 = objc_opt_new();
  id v5 = [(RTPlaceTypeClassifierMetricsCalculator *)self _computeCountOfLOIsForCacheMetricsFromLOIs:v3];
  [v4 addEntriesFromDictionary:v5];

  id v6 = [(RTPlaceTypeClassifierMetricsCalculator *)self _computeDurationOfGraphForCacheMetricsFromLOIs:v3];
  [v4 addEntriesFromDictionary:v6];

  return v4;
}

- (id)_computeCountOfLOIsForCacheMetricsFromLOIs:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [(id)objc_opt_class() cacheMetricsKeyToString:7];
  dispatch_time_t v10 = v4;
  id v5 = NSNumber;
  uint64_t v6 = [v3 count];

  id v7 = [v5 numberWithUnsignedInteger:v6];
  v11[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v8;
}

- (id)_computeDurationOfGraphForCacheMetricsFromLOIs:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (!v3)
  {
    uint64_t v6 = 0;
    id v5 = 0;
    __int16 v26 = &unk_1F3451050;
    goto LABEL_21;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = 0;
  uint64_t v36 = *(void *)v38;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v38 != v36) {
        objc_enumerationMutation(obj);
      }
      v8 = *(void **)(*((void *)&v37 + 1) + 8 * v7);
      if (v6)
      {
        if (v5) {
          goto LABEL_8;
        }
      }
      else
      {
        id v23 = [*(id *)(*((void *)&v37 + 1) + 8 * v7) visits];
        uint64_t v6 = [v23 firstObject];

        if (v5) {
          goto LABEL_8;
        }
      }
      id v24 = [v8 visits];
      id v5 = [v24 lastObject];

LABEL_8:
      v9 = [v6 entryDate];
      dispatch_time_t v10 = [v8 visits];
      id v11 = [v10 firstObject];
      double v12 = [v11 entryDate];
      uint64_t v13 = [v9 compare:v12];

      if (v13 == 1)
      {
        uint64_t v14 = [v8 visits];
        uint64_t v15 = [v14 firstObject];

        uint64_t v6 = (void *)v15;
      }
      id v16 = [v5 entryDate];
      double v17 = [v8 visits];
      uint64_t v18 = [v17 lastObject];
      __int16 v19 = [v18 entryDate];
      uint64_t v20 = [v16 compare:v19];

      if (v20 == -1)
      {
        uint64_t v21 = [v8 visits];
        uint64_t v22 = [v21 lastObject];

        id v5 = (void *)v22;
      }
      ++v7;
    }
    while (v4 != v7);
    uint64_t v25 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    uint64_t v4 = v25;
  }
  while (v25);
  __int16 v26 = &unk_1F3451050;
  if (v6 && v5)
  {
    id v27 = NSNumber;
    uint64_t v28 = [v5 entryDate];
    double v29 = [v6 entryDate];
    [v28 timeIntervalSinceDate:v29];
    double v31 = v30 / 86400.0;
    *(float *)&double v31 = v31;
    *(float *)&double v31 = roundf(*(float *)&v31);
    __int16 v26 = [v27 numberWithFloat:v31];
  }
LABEL_21:
  id v32 = [(id)objc_opt_class() cacheMetricsKeyToString:8];
  uint64_t v41 = v32;
  uint64_t v42 = v26;
  __int16 v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];

  return v33;
}

- (id)_getLearnedLocationOfInterests
{
  v57[1] = *MEMORY[0x1E4F143B8];
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy__66;
  uint64_t v46 = __Block_byref_object_dispose__66;
  id v47 = 0;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x3032000000;
  long long v39 = __Block_byref_object_copy__66;
  long long v40 = __Block_byref_object_dispose__66;
  id v41 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(RTPlaceTypeClassifierMetricsCalculator *)self learnedLocationStore];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __72__RTPlaceTypeClassifierMetricsCalculator__getLearnedLocationOfInterests__block_invoke;
  v32[3] = &unk_1E6B905F0;
  uint64_t v34 = &v36;
  uint64_t v35 = &v42;
  uint64_t v6 = v4;
  __int16 v33 = v6;
  [v5 fetchRecentLocationsOfInterestWithHandler:v32];

  uint64_t v7 = v6;
  v8 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9)) {
    goto LABEL_6;
  }
  dispatch_time_t v10 = [MEMORY[0x1E4F1C9C8] now];
  [v10 timeIntervalSinceDate:v8];
  double v12 = v11;
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_508];
  uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v16 = [v15 filteredArrayUsingPredicate:v14];
  double v17 = [v16 firstObject];

  [v13 submitToCoreAnalytics:v17 type:1 duration:v12];
  uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: [inferredVersion.identifier isEqual:self.existingVersion.identifier] || inferredVersion == nil || self.existingVersion == nil (in %s:%d)", buf, 2u);
  }

  __int16 v19 = (void *)MEMORY[0x1E4F28C58];
  v57[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v57 count:1];
  uint64_t v21 = [v19 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v20];

  if (v21)
  {
    id v22 = v21;
  }
  else
  {
LABEL_6:
    id v22 = 0;
  }

  id v23 = v22;
  id v24 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [(id)v37[5] count];
    uint64_t v29 = v43[5];
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v26;
    __int16 v49 = 2112;
    id v50 = v27;
    __int16 v51 = 2048;
    uint64_t v52 = v28;
    __int16 v53 = 2112;
    uint64_t v54 = v29;
    __int16 v55 = 2112;
    id v56 = v23;
    _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, %@, locationsOfInterest count, %lu, error, %@, semaError, %@", buf, 0x34u);
  }
  id v30 = (id)v37[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v30;
}

void __72__RTPlaceTypeClassifierMetricsCalculator__getLearnedLocationOfInterests__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getLearnedPlaceTypeInferencesWithDateInterval:(id)a3
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  long long v48 = __Block_byref_object_copy__66;
  __int16 v49 = __Block_byref_object_dispose__66;
  id v50 = 0;
  uint64_t v39 = 0;
  long long v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__66;
  id v43 = __Block_byref_object_dispose__66;
  id v44 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [[RTLearnedPlaceTypeInferenceEnumerationOptions alloc] initWithDateInterval:v34 sortByCreationDate:1 ascending:1 filteredToPlaceTypes:0 filteredToIdentifiers:0 filteredToSessionIds:0 filteredToLearnedPlaceIdentifiers:0];
  id v6 = [(RTPlaceTypeClassifierMetricsCalculator *)self learnedPlaceTypeInferenceStore];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __89__RTPlaceTypeClassifierMetricsCalculator__getLearnedPlaceTypeInferencesWithDateInterval___block_invoke;
  v35[3] = &unk_1E6B905F0;
  long long v37 = &v39;
  uint64_t v38 = &v45;
  uint64_t v7 = v4;
  uint64_t v36 = v7;
  [v6 fetchLearnedPlaceTypeInferencesWithOptions:v5 handler:v35];

  v8 = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10)) {
    goto LABEL_6;
  }
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  uint64_t v14 = objc_opt_new();
  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_508];
  id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  double v17 = [v16 filteredArrayUsingPredicate:v15];
  uint64_t v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: [inferredVersion.identifier isEqual:self.existingVersion.identifier] || inferredVersion == nil || self.existingVersion == nil (in %s:%d)", buf, 2u);
  }

  uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
  v60[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v60 count:1];
  id v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

  if (v22)
  {
    id v23 = v22;
  }
  else
  {
LABEL_6:
    id v23 = 0;
  }

  id v24 = v23;
  uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    id v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [(id)v40[5] count];
    uint64_t v30 = v46[5];
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v27;
    __int16 v52 = 2112;
    id v53 = v28;
    __int16 v54 = 2048;
    uint64_t v55 = v29;
    __int16 v56 = 2112;
    uint64_t v57 = v30;
    __int16 v58 = 2112;
    id v59 = v24;
    _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, %@, learnedPlaceTypeInferences count, %lu, error, %@, semaError, %@", buf, 0x34u);
  }
  id v31 = (id)v40[5];

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v31;
}

void __89__RTPlaceTypeClassifierMetricsCalculator__getLearnedPlaceTypeInferencesWithDateInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_filterLearnedPlaceTypeInferencesWithPlaceType:(unint64_t)a3 dateInterval:(id)a4 metricsSource:(unint64_t)a5 learnedPlaceTypeInferences:(id)a6
{
  id v9 = a4;
  dispatch_time_t v10 = (void *)MEMORY[0x1E4F28F60];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __143__RTPlaceTypeClassifierMetricsCalculator__filterLearnedPlaceTypeInferencesWithPlaceType_dateInterval_metricsSource_learnedPlaceTypeInferences___block_invoke;
  v17[3] = &unk_1E6B960C8;
  id v18 = v9;
  unint64_t v19 = a3;
  unint64_t v20 = a5;
  id v11 = v9;
  id v12 = a6;
  double v13 = [v10 predicateWithBlock:v17];
  uint64_t v14 = [v12 filteredArrayUsingPredicate:v13];

  uint64_t v15 = [v14 sortedArrayUsingComparator:&__block_literal_global_50];

  return v15;
}

BOOL __143__RTPlaceTypeClassifierMetricsCalculator__filterLearnedPlaceTypeInferencesWithPlaceType_dateInterval_metricsSource_learnedPlaceTypeInferences___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 placeType] == a1[5])
  {
    dispatch_semaphore_t v4 = (void *)a1[4];
    id v5 = [v3 creationDate];
    if ([v4 containsDate:v5]) {
      BOOL v6 = [v3 metricSource] == a1[6];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __143__RTPlaceTypeClassifierMetricsCalculator__filterLearnedPlaceTypeInferencesWithPlaceType_dateInterval_metricsSource_learnedPlaceTypeInferences___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 creationDate];
  BOOL v6 = [v4 creationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_computeFlipFlopCountLearnedPlaceTypeInferences:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(id)objc_opt_class() cacheMetricsKeyToString:4];
  if (![v5 count])
  {
    id v28 = v6;
    v29[0] = &unk_1F3451050;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    goto LABEL_25;
  }
  uint64_t v21 = v6;
  if ([v5 count] != 1)
  {
    uint64_t v9 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      dispatch_time_t v10 = [v5 objectAtIndexedSubscript:v9];
      if (v10)
      {
        id v3 = [v5 objectAtIndexedSubscript:v9 + 1];
        if (!v3)
        {
          unsigned int v18 = 1;
          goto LABEL_22;
        }
      }
      id v11 = [v5 objectAtIndexedSubscript:v9];
      if (!v11)
      {
        id v4 = [v5 objectAtIndexedSubscript:v9 + 1];
        if (v4)
        {
          unsigned int v18 = 1;
          goto LABEL_21;
        }
      }
      uint64_t v12 = [v5 objectAtIndexedSubscript:v9];
      if (!v12) {
        goto LABEL_17;
      }
      double v13 = (void *)v12;
      uint64_t v14 = [v5 objectAtIndexedSubscript:v9 + 1];
      if (!v14) {
        break;
      }
      id v24 = v4;
      uint64_t v25 = v3;
      id v23 = (void *)v14;
      id v22 = [v5 objectAtIndexedSubscript:v9];
      uint64_t v15 = [v22 learnedPlaceIdentifier];
      id v16 = [v5 objectAtIndexedSubscript:v9 + 1];
      double v17 = [v16 learnedPlaceIdentifier];
      unsigned int v18 = [v15 isEqual:v17] ^ 1;

      if (v11)
      {
        id v4 = v24;
        id v3 = v25;
LABEL_18:

        if (!v10) {
          goto LABEL_23;
        }
LABEL_22:

        goto LABEL_23;
      }
      id v4 = v24;
      id v3 = v25;
LABEL_21:

      if (v10) {
        goto LABEL_22;
      }
LABEL_23:

      v7 += v18;
      if ([v5 count] - 1 <= (unint64_t)++v9) {
        goto LABEL_24;
      }
    }

LABEL_17:
    unsigned int v18 = 0;
    if (v11) {
      goto LABEL_18;
    }
    goto LABEL_21;
  }
  uint64_t v7 = 0;
LABEL_24:
  BOOL v6 = v21;
  id v26 = v21;
  unint64_t v19 = [NSNumber numberWithUnsignedInteger:v7];
  id v27 = v19;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];

LABEL_25:

  return v8;
}

- (id)_computeCountOfNonNillLearnedPlaceTypeInferences:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = [v3 predicateWithFormat:@"%K != nil", @"learnedPlaceIdentifier"];
  BOOL v6 = [v4 filteredArrayUsingPredicate:v5];

  uint64_t v7 = [(id)objc_opt_class() cacheMetricsKeyToString:1];
  id v11 = v7;
  v8 = [NSNumber numberWithUnsignedInteger:[v6 count]];
  v12[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  return v9;
}

- (id)_computeCountOfUniqueLearnedPlaceTypeInferences:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        dispatch_time_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x1E016D870](v6);
        uint64_t v12 = [v10 learnedPlaceIdentifier:v18];

        if (v12)
        {
          double v13 = [v10 learnedPlaceIdentifier];
          [v4 addObject:v13];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  uint64_t v14 = [(id)objc_opt_class() cacheMetricsKeyToString:2];
  id v22 = v14;
  uint64_t v15 = [NSNumber numberWithUnsignedInteger:[v4 count]];
  id v23 = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  return v16;
}

- (id)_computeCountOfTotalLearnedPlaceTypeInferences:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [(id)objc_opt_class() cacheMetricsKeyToString:3];
  dispatch_time_t v10 = v4;
  id v5 = NSNumber;
  uint64_t v6 = [v3 count];

  uint64_t v7 = [v5 numberWithUnsignedInteger:v6];
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v8;
}

- (id)_computeLengthOfLatestClassificationForLearnedPlaceTypeInferences:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 lastObject];

  if (v4)
  {
    id v5 = NSNumber;
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v7 = [v3 lastObject];
    uint64_t v8 = [v7 creationDate];
    [v6 timeIntervalSinceDate:v8];
    double v10 = v9 / 3600.0;
    *(float *)&double v10 = v10;
    *(float *)&double v10 = roundf(*(float *)&v10);
    id v11 = [v5 numberWithFloat:v10];
  }
  else
  {
    id v11 = &unk_1F3451050;
  }
  uint64_t v12 = [(id)objc_opt_class() cacheMetricsKeyToString:5];
  uint64_t v15 = v12;
  v16[0] = v11;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  return v13;
}

- (id)_computeLengthOfLatestClassificationSinceChangedForLearnedPlaceTypeInferences:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 lastObject];

  if (!v4)
  {
    id v22 = &unk_1F3451050;
    goto LABEL_17;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = [v3 reverseObjectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (!v6)
  {
    id v4 = 0;
    id v22 = &unk_1F3451050;
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  obuint64_t j = v5;
  id v27 = 0;
  uint64_t v8 = *(void *)v29;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(obj);
      }
      double v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      id v11 = (void *)MEMORY[0x1E016D870]();
      uint64_t v12 = [v10 learnedPlaceIdentifier];
      id v13 = v3;
      uint64_t v14 = [v3 lastObject];
      uint64_t v15 = [v14 learnedPlaceIdentifier];
      int v16 = [v12 isEqual:v15];

      if (v16)
      {
        id v17 = v10;

        id v27 = v17;
      }
      id v3 = v13;
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  }
  while (v7);

  id v4 = v27;
  if (v27)
  {
    long long v18 = NSNumber;
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    long long v19 = [v27 creationDate];
    [v5 timeIntervalSinceDate:v19];
    double v21 = v20 / 3600.0;
    *(float *)&double v21 = v21;
    *(float *)&double v21 = roundf(*(float *)&v21);
    id v22 = [v18 numberWithFloat:v21];

LABEL_15:
    goto LABEL_17;
  }
  id v22 = &unk_1F3451050;
LABEL_17:
  id v23 = [(id)objc_opt_class() cacheMetricsKeyToString:6];
  id v32 = v23;
  __int16 v33 = v22;
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  return v24;
}

+ (void)submitMetricsForInferredPlaces:(id)a3 contactsPlaces:(id)a4 rottedPlaces:(id)a5 distanceCalculator:(id)a6 metricManager:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [a1 collectPlaceVersionsFromInferredPlaces:a3 contactsPlaces:a4 rottedPlaces:a5];
  uint64_t v15 = +[RTMetricManager metricForType:18];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = [a1 newAlgorithmInstanceWithInference:*(void *)(*((void *)&v23 + 1) + 8 * v20) distanceCalculator:v12];
        if (v21) {
          [v15 addInstance:v21];
        }

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  if (![v15 instancesCount])
  {
    id v22 = +[RTMetricManager metricForType:17];
    [v15 addInstance:v22];
  }
  [v13 submitMetric:v15 withHandler:&__block_literal_global_216, v23];
}

void __134__RTPlaceTypeClassifierMetricsCalculator_submitMetricsForInferredPlaces_contactsPlaces_rottedPlaces_distanceCalculator_metricManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Failed to submit AWDCoreRoutineModelAlgorithmSet, error, %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

+ (id)newAlgorithmInstanceWithInference:(id)a3 distanceCalculator:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[RTMetricManager metricForType:17];
  double v9 = [v6 inferredVersion];
  uint64_t v10 = [v9 type];
  if ((unint64_t)(v10 - 1) >= 3)
  {
  }
  else
  {
    uint64_t v11 = v10;

    [v8 setType:v11];
  }
  id v12 = [v6 inferredVersion];
  char v13 = [v12 typeSource];
  uint64_t v14 = ((v13 & 6) != 0) | (2 * (v13 & 1u));

  if (v14) {
    [v8 setSource:v14];
  }
  uint64_t v15 = [v6 existingVersion];
  uint64_t v16 = [v15 type];
  if ((unint64_t)(v16 - 1) >= 3)
  {
  }
  else
  {
    uint64_t v17 = v16;

    [v8 setPreviousType:v17];
  }
  uint64_t v18 = [v6 trueVersion];
  uint64_t v19 = [v18 type];
  if ((unint64_t)(v19 - 1) <= 2) {
    [v8 setTruthType:v19];
  }
  char v20 = [v18 typeSource];
  if (((v20 & 6) != 0) | (2 * (v20 & 1))) {
    [v8 setTruthSource:];
  }
  double v21 = [v6 inferredVersion];

  if (v21)
  {
    id v22 = [v6 truthfulCounterpart];

    if (v22)
    {
      long long v23 = [v6 inferredVersion];
      long long v24 = [v23 mapItem];
      long long v25 = [v6 truthfulCounterpart];
      long long v26 = [v25 mapItem];
      [a1 updateAlgorithmInstance:v8 byComparingInferredMapItem:v24 withTruthfulMapItem:v26 withDistanceCalculator:v7];
    }
  }
  [v8 setIsRotted:[v6 isRotted]];
  id v27 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = [v8 type];
    uint64_t v30 = [v8 source];
    uint64_t v31 = [v8 previousType];
    uint64_t v32 = [v8 truthType];
    uint64_t v33 = [v8 truthSource];
    [v8 distanceFromTruth];
    uint64_t v35 = v34;
    int v36 = [v8 isRotted];
    int v38 = 134219522;
    long long v37 = "false";
    uint64_t v39 = v29;
    __int16 v40 = 2048;
    if (v36) {
      long long v37 = "true";
    }
    uint64_t v41 = v30;
    __int16 v42 = 2048;
    uint64_t v43 = v31;
    __int16 v44 = 2048;
    uint64_t v45 = v32;
    __int16 v46 = 2048;
    uint64_t v47 = v33;
    __int16 v48 = 2048;
    uint64_t v49 = v35;
    __int16 v50 = 2080;
    __int16 v51 = v37;
    _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "AWDCoreRoutineModelAlgorithmInstance, type, %lu, source, %lu, previousType, %lu, truthSource, %lu, truthType, %lu, distanceFromTruth, %g, isRotted, %s", (uint8_t *)&v38, 0x48u);
  }

  return v8;
}

+ (void)updateAlgorithmInstance:(id)a3 byComparingInferredMapItem:(id)a4 withTruthfulMapItem:(id)a5 withDistanceCalculator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v11 location];
  uint64_t v15 = [v12 location];
  uint64_t v25 = 0;
  [v13 distanceFromLocation:v14 toLocation:v15 error:&v25];
  double v17 = v16;

  uint64_t v18 = v25;
  if (!v18) {
    [v10 setDistanceFromTruth:(double)(uint64_t)(10 * llround(v17 / 10.0))];
  }
  uint64_t v19 = [v11 address];
  char v20 = [v12 address];
  int v21 = [v19 isEqual:v20];

  if (v21)
  {
    [v10 setAddressComponentMatches:-1];
  }
  else
  {
    id v22 = [v11 address];
    long long v23 = [v12 address];
    uint64_t v24 = [a1 addressComponentMatchesBetweenInferredAddress:v22 trueAddress:v23];
    if (v24) {
      [v10 setAddressComponentMatches:v24];
    }
  }
}

+ (unint64_t)addressComponentMatchesBetweenInferredAddress:(id)a3 trueAddress:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 subThoroughfare];
  double v9 = [v7 subThoroughfare];
  unsigned int v10 = [a1 inferredAddressComponent:v8 consistentWithTrueComponent:v9];

  uint64_t v11 = v10;
  id v12 = [v6 thoroughfare];
  id v13 = [v7 thoroughfare];
  int v14 = [a1 inferredAddressComponent:v12 consistentWithTrueComponent:v13];

  if (v14) {
    v11 |= 2uLL;
  }
  uint64_t v15 = [v6 subLocality];
  double v16 = [v7 subLocality];
  int v17 = [a1 inferredAddressComponent:v15 consistentWithTrueComponent:v16];

  if (v17) {
    v11 |= 4uLL;
  }
  uint64_t v18 = [v6 locality];
  uint64_t v19 = [v7 locality];
  int v20 = [a1 inferredAddressComponent:v18 consistentWithTrueComponent:v19];

  if (v20) {
    v11 |= 8uLL;
  }
  int v21 = [v6 subAdministrativeArea];
  id v22 = [v7 subAdministrativeArea];
  int v23 = [a1 inferredAddressComponent:v21 consistentWithTrueComponent:v22];

  if (v23) {
    v11 |= 0x10uLL;
  }
  uint64_t v24 = [v6 administrativeArea];
  uint64_t v25 = [v7 administrativeArea];
  int v26 = [a1 inferredAddressComponent:v24 consistentWithTrueComponent:v25];

  if (v26) {
    v11 |= 0x20uLL;
  }
  id v27 = [v6 administrativeAreaCode];
  uint64_t v28 = [v7 administrativeAreaCode];
  int v29 = [a1 inferredAddressComponent:v27 consistentWithTrueComponent:v28];

  if (v29) {
    v11 |= 0x40uLL;
  }
  uint64_t v30 = [v6 postalCode];
  uint64_t v31 = [v7 postalCode];
  int v32 = [a1 inferredAddressComponent:v30 consistentWithTrueComponent:v31];

  if (v32) {
    v11 |= 0x80uLL;
  }
  uint64_t v33 = [v6 country];
  uint64_t v34 = [v7 country];
  int v35 = [a1 inferredAddressComponent:v33 consistentWithTrueComponent:v34];

  if (v35) {
    v11 |= 0x100uLL;
  }
  int v36 = [v6 countryCode];
  long long v37 = [v7 countryCode];
  int v38 = [a1 inferredAddressComponent:v36 consistentWithTrueComponent:v37];

  if (v38) {
    v11 |= 0x200uLL;
  }
  uint64_t v39 = [v6 inlandWater];
  __int16 v40 = [v7 inlandWater];
  int v41 = [a1 inferredAddressComponent:v39 consistentWithTrueComponent:v40];

  if (v41) {
    uint64_t v42 = v11 | 0x400;
  }
  else {
    uint64_t v42 = v11;
  }
  uint64_t v43 = [v6 ocean];
  __int16 v44 = [v7 ocean];
  int v45 = [a1 inferredAddressComponent:v43 consistentWithTrueComponent:v44];

  if (v45) {
    uint64_t v46 = v42 | 0x800;
  }
  else {
    uint64_t v46 = v42;
  }
  int v47 = [v6 isIsland];
  long long v58 = 0u;
  long long v59 = 0u;
  if (v47 != [v7 isIsland]) {
    uint64_t v48 = v46;
  }
  else {
    uint64_t v48 = v46 | 0x2000;
  }
  unint64_t v49 = v48 | 0x1000;
  long long v60 = 0uLL;
  long long v61 = 0uLL;
  __int16 v50 = [v6 areasOfInterest:v58];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v59;
    while (2)
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v59 != v53) {
          objc_enumerationMutation(v50);
        }
        uint64_t v55 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        __int16 v56 = [v7 areasOfInterest];
        LOBYTE(v55) = [v56 containsObject:v55];

        if ((v55 & 1) == 0)
        {
          unint64_t v49 = v48 & 0xFFFFFFFFFFFFEFFFLL;
          goto LABEL_38;
        }
      }
      uint64_t v52 = [v50 countByEnumeratingWithState:&v58 objects:v62 count:16];
      if (v52) {
        continue;
      }
      break;
    }
  }
LABEL_38:

  return v49;
}

+ (BOOL)inferredAddressComponent:(id)a3 consistentWithTrueComponent:(id)a4
{
  id v6 = a4;
  id v7 = [a1 normalize:a3];
  if (v7)
  {
    uint64_t v8 = [a1 normalize:v6];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

+ (id)normalize:(id)a3
{
  id v3 = [a3 lowercaseString];
  int v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

+ (id)collectPlaceVersionsFromInferredPlaces:(id)a3 contactsPlaces:(id)a4 rottedPlaces:(id)a5
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  obuint64_t j = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v87 objects:v95 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v88 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        double v16 = objc_opt_new();
        [v16 setInferredVersion:v15];
        int v17 = [v15 identifier];
        [v10 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v87 objects:v95 count:16];
    }
    while (v12);
  }

  long long v70 = [MEMORY[0x1E4F1CA48] array];
  long long v69 = [MEMORY[0x1E4F1CA48] array];
  v62 = [MEMORY[0x1E4F1CA48] array];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v67 = v8;
  uint64_t v18 = [v67 countByEnumeratingWithState:&v83 objects:v94 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v84;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v84 != v20) {
          objc_enumerationMutation(v67);
        }
        id v22 = *(void **)(*((void *)&v83 + 1) + 8 * j);
        int v23 = [v22 identifier];
        uint64_t v24 = [v10 objectForKeyedSubscript:v23];

        if (!v24)
        {
          uint64_t v24 = objc_opt_new();
          uint64_t v25 = [v22 identifier];
          [v10 setObject:v24 forKeyedSubscript:v25];
        }
        [v24 setExistingVersion:v22];
        if (([v22 typeSource] & 6) != 0)
        {
          uint64_t v26 = [v22 type];
          id v27 = v70;
          if (v26 == 1
            || (v28 = [v22 type], id v27 = v69, v28 == 2)
            || (uint64_t v29 = [v22 type], v27 = v62, v29 == 3))
          {
            [v27 addObject:v22];
          }
        }
      }
      uint64_t v19 = [v67 countByEnumeratingWithState:&v83 objects:v94 count:16];
    }
    while (v19);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v30 = v9;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v79 objects:v93 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v80;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v80 != v33) {
          objc_enumerationMutation(v30);
        }
        int v35 = [*(id *)(*((void *)&v79 + 1) + 8 * k) identifier];
        int v36 = [v10 objectForKeyedSubscript:v35];

        if (v36) {
          [v36 setIsRotted:1];
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v79 objects:v93 count:16];
    }
    while (v32);
  }
  long long v61 = v30;

  long long v37 = [MEMORY[0x1E4F1CA48] array];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v66 = [v10 allValues];
  uint64_t v38 = [v66 countByEnumeratingWithState:&v75 objects:v92 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v76;
    uint64_t v63 = *(void *)v76;
    uint64_t v64 = v10;
    do
    {
      uint64_t v41 = 0;
      uint64_t v65 = v39;
      do
      {
        if (*(void *)v76 != v40) {
          objc_enumerationMutation(v66);
        }
        uint64_t v42 = *(void **)(*((void *)&v75 + 1) + 8 * v41);
        uint64_t v43 = [v42 inferredVersion:v61];
        uint64_t v44 = [v43 type];

        int v45 = v70;
        if (v44 == 1) {
          goto LABEL_39;
        }
        uint64_t v46 = [v42 inferredVersion];
        uint64_t v47 = [v46 type];

        int v45 = v69;
        if (v47 == 2
          || ([v42 inferredVersion],
              uint64_t v48 = objc_claimAutoreleasedReturnValue(),
              uint64_t v49 = [v48 type],
              v48,
              int v45 = v62,
              v49 == 3))
        {
LABEL_39:
          id v50 = v45;
        }
        else
        {
          id v50 = 0;
        }
        if ((unint64_t)[v50 count] > 1)
        {
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v52 = v50;
          uint64_t v53 = [v52 countByEnumeratingWithState:&v71 objects:v91 count:16];
          if (v53)
          {
            uint64_t v54 = v53;
            uint64_t v55 = *(void *)v72;
            do
            {
              for (uint64_t m = 0; m != v54; ++m)
              {
                if (*(void *)v72 != v55) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v57 = *(void *)(*((void *)&v71 + 1) + 8 * m);
                long long v58 = (void *)[v42 copy];
                [v58 setTruthfulCounterpart:v57];
                [v37 addObject:v58];
              }
              uint64_t v54 = [v52 countByEnumeratingWithState:&v71 objects:v91 count:16];
            }
            while (v54);
          }

          uint64_t v40 = v63;
          unsigned int v10 = v64;
          uint64_t v39 = v65;
        }
        else
        {
          uint64_t v51 = [v50 firstObject];
          [v42 setTruthfulCounterpart:v51];

          [v37 addObject:v42];
        }

        ++v41;
      }
      while (v41 != v39);
      uint64_t v59 = [v66 countByEnumeratingWithState:&v75 objects:v92 count:16];
      uint64_t v39 = v59;
    }
    while (v59);
  }

  return v37;
}

- (id)retrieveMetrics
{
  uint64_t v272 = *MEMORY[0x1E4F143B8];
  id v171 = (id)objc_opt_new();
  v170 = +[RTMetric binsFromStart:&unk_1F3451068 toEnd:&unk_1F3451080 gap:&unk_1F3451098];
  long long v251 = 0u;
  long long v250 = 0u;
  long long v249 = 0u;
  long long v248 = 0u;
  uint64_t v161 = [&unk_1F3452E08 countByEnumeratingWithState:&v248 objects:v269 count:16];
  if (v161)
  {
    uint64_t v158 = *(void *)v249;
    do
    {
      for (uint64_t i = 0; i != v161; ++i)
      {
        if (*(void *)v249 != v158) {
          objc_enumerationMutation(&unk_1F3452E08);
        }
        id v3 = *(void **)(*((void *)&v248 + 1) + 8 * i);
        context = (void *)MEMORY[0x1E016D870]();
        long long v247 = 0u;
        long long v246 = 0u;
        long long v245 = 0u;
        long long v244 = 0u;
        uint64_t v4 = [&unk_1F3452DF0 countByEnumeratingWithState:&v244 objects:v268 count:16];
        if (v4)
        {
          uint64_t v5 = *(void *)v245;
          do
          {
            for (uint64_t j = 0; j != v4; ++j)
            {
              if (*(void *)v245 != v5) {
                objc_enumerationMutation(&unk_1F3452DF0);
              }
              id v7 = *(void **)(*((void *)&v244 + 1) + 8 * j);
              id v8 = (void *)MEMORY[0x1E016D870]();
              id v9 = [[self computeMetricsForSourcePlaceType:[v7 unsignedIntValue] source:objc_msgSend(v3, "unsignedIntValue") referenceSourcePlaceType:0 referenceSource:0 metricType:1 bins:0];
              [v171 addEntriesFromDictionary:v9];

              unsigned int v10 = [[self computeMetricsForSourcePlaceType:[v7 unsignedIntValue] source:[v3 unsignedIntValue] referenceSourcePlaceType:[v7 unsignedIntValue] referenceSource:[v7 unsignedIntValue] metricType:2 bins:2] unsignedIntValue];
              [v171 addEntriesFromDictionary:v10];

              uint64_t v11 = [[self computeMetricsForSourcePlaceType:[v7 unsignedIntValue] source:objc_msgSend(v3, "unsignedIntValue") referenceSourcePlaceType:objc_msgSend(v7, "unsignedIntValue") referenceSource:1 metricType:2 bins:v170];
              [v171 addEntriesFromDictionary:v11];

              uint64_t v12 = [[self computeMetricsForSourcePlaceType:[v7 unsignedIntValue] source:objc_msgSend(v3, "unsignedIntValue") referenceSourcePlaceType:objc_msgSend(v7, "unsignedIntValue") referenceSource:14 metricType:2 bins:v170];
              [v171 addEntriesFromDictionary:v12];
            }
            uint64_t v4 = [&unk_1F3452DF0 countByEnumeratingWithState:&v244 objects:v268 count:16];
          }
          while (v4);
        }
      }
      uint64_t v161 = [&unk_1F3452E08 countByEnumeratingWithState:&v248 objects:v269 count:16];
    }
    while (v161);
  }
  long long v243 = 0u;
  long long v242 = 0u;
  long long v241 = 0u;
  long long v240 = 0u;
  uint64_t v13 = [(id)objc_opt_class() schoolEligibleSources];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v240 objects:v267 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v241;
    do
    {
      for (uint64_t k = 0; k != v14; ++k)
      {
        if (*(void *)v241 != v15) {
          objc_enumerationMutation(v13);
        }
        int v17 = -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 3, [*(id *)(*((void *)&v240 + 1) + 8 * k) unsignedIntValue], 0, 0, 1, 0);
        [v171 addEntriesFromDictionary:v17];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v240 objects:v267 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(RTPlaceTypeClassifierMetricsCalculator *)self computeMetricsForSourcePlaceType:3 source:2 referenceSourcePlaceType:3 referenceSource:1 metricType:2 bins:v170];
  [v171 addEntriesFromDictionary:v18];

  uint64_t v19 = [(RTPlaceTypeClassifierMetricsCalculator *)self computeMetricsForSourcePlaceType:3 source:2 referenceSourcePlaceType:3 referenceSource:14 metricType:2 bins:v170];
  [v171 addEntriesFromDictionary:v19];

  uint64_t v20 = [(RTPlaceTypeClassifierMetricsCalculator *)self computeMetricsForSourcePlaceType:3 source:1 referenceSourcePlaceType:3 referenceSource:14 metricType:2 bins:v170];
  [v171 addEntriesFromDictionary:v20];

  long long v239 = 0u;
  long long v238 = 0u;
  long long v237 = 0u;
  long long v236 = 0u;
  uint64_t v21 = [&unk_1F3452DF0 countByEnumeratingWithState:&v236 objects:v266 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v237;
    do
    {
      for (uint64_t m = 0; m != v21; ++m)
      {
        if (*(void *)v237 != v22) {
          objc_enumerationMutation(&unk_1F3452DF0);
        }
        uint64_t v24 = *(void **)(*((void *)&v236 + 1) + 8 * m);
        uint64_t v25 = [[self computeMetricsForSourcePlaceType:[v24 unsignedIntValue] source:11 referenceSourcePlaceType:objc_msgSend(v24, "unsignedIntValue") referenceSource:6 metricType:2 bins:v170];
        [v171 addEntriesFromDictionary:v25];

        uint64_t v26 = [[self computeMetricsForSourcePlaceType:[v24 unsignedIntValue] source:11 referenceSourcePlaceType:[v24 unsignedIntValue] referenceSource:7 metricType:2 bins:v170];
        [v171 addEntriesFromDictionary:v26];

        id v27 = [[self computeMetricsForSourcePlaceType:[v24 unsignedIntValue] source:11 referenceSourcePlaceType:[v24 unsignedIntValue] referenceSource:8 metricType:2 bins:v170];
        [v171 addEntriesFromDictionary:v27];

        uint64_t v28 = [[self computeMetricsForSourcePlaceType:[v24 unsignedIntValue] source:11 referenceSourcePlaceType:[v24 unsignedIntValue] referenceSource:9 metricType:2 bins:v170];
        [v171 addEntriesFromDictionary:v28];

        uint64_t v29 = [[self computeMetricsForSourcePlaceType:[v24 unsignedIntValue] source:11 referenceSourcePlaceType:objc_msgSend(v24, "unsignedIntValue") referenceSource:13 metricType:13 bins:v170];
        [v171 addEntriesFromDictionary:v29];

        id v30 = [[self computeMetricsForSourcePlaceType:[v24 unsignedIntValue] source:11 referenceSourcePlaceType:[v24 unsignedIntValue] referenceSource:12 metricType:2 bins:v170];
        [v171 addEntriesFromDictionary:v30];

        uint64_t v31 = [[self computeMetricsForSourcePlaceType:[v24 unsignedIntValue] source:12 referenceSourcePlaceType:objc_msgSend(v24, "unsignedIntValue") referenceSource:13 metricType:2 bins:v170];
        [v171 addEntriesFromDictionary:v31];
      }
      uint64_t v21 = [&unk_1F3452DF0 countByEnumeratingWithState:&v236 objects:v266 count:16];
    }
    while (v21);
  }
  long long v235 = 0u;
  long long v234 = 0u;
  long long v233 = 0u;
  long long v232 = 0u;
  uint64_t v162 = [&unk_1F3452DF0 countByEnumeratingWithState:&v232 objects:v265 count:16];
  if (v162)
  {
    uint64_t v159 = *(void *)v233;
    do
    {
      for (uint64_t n = 0; n != v162; ++n)
      {
        if (*(void *)v233 != v159) {
          objc_enumerationMutation(&unk_1F3452DF0);
        }
        uint64_t v33 = *(void **)(*((void *)&v232 + 1) + 8 * n);
        contexta = (void *)MEMORY[0x1E016D870]();
        uint64_t v34 = [[self computeMetricsForSourcePlaceType:[v33 unsignedIntValue] source:6 referenceSourcePlaceType:objc_msgSend(v33, "unsignedIntValue") referenceSource:7 metricType:2 bins:v170];
        [v171 addEntriesFromDictionary:v34];

        int v35 = [[self computeMetricsForSourcePlaceType:[v33 unsignedIntValue] source:6 referenceSourcePlaceType:[v33 unsignedIntValue] referenceSource:8 metricType:2 bins:v170];
        [v171 addEntriesFromDictionary:v35];

        int v36 = [[self computeMetricsForSourcePlaceType:[v33 unsignedIntValue] source:7 referenceSourcePlaceType:[v33 unsignedIntValue] referenceSource:9 metricType:2 bins:v170];
        [v171 addEntriesFromDictionary:v36];

        long long v37 = [[self computeMetricsForSourcePlaceType:[v33 unsignedIntValue] source:8 referenceSourcePlaceType:[v33 unsignedIntValue] referenceSource:9 metricType:2 bins:v170];
        [v171 addEntriesFromDictionary:v37];

        uint64_t v38 = [[self computeMetricsForSourcePlaceType:[v33 unsignedIntValue] source:8 referenceSourcePlaceType:objc_msgSend(v33, "unsignedIntValue") referenceSource:15 metricType:2 bins:v170];
        [v171 addEntriesFromDictionary:v38];

        uint64_t v39 = [[self computeMetricsForSourcePlaceType:[v33 unsignedIntValue] source:9 referenceSourcePlaceType:objc_msgSend(v33, "unsignedIntValue") referenceSource:16 metricType:2 bins:v170];
        [v171 addEntriesFromDictionary:v39];

        uint64_t v40 = [[self computeMetricsForSourcePlaceType:[v33 unsignedIntValue] source:15 referenceSourcePlaceType:objc_msgSend(v33, "unsignedIntValue") referenceSource:16 metricType:16 bins:v170];
        [v171 addEntriesFromDictionary:v40];

        long long v231 = 0u;
        long long v230 = 0u;
        long long v228 = 0u;
        long long v229 = 0u;
        uint64_t v41 = [&unk_1F3452E20 countByEnumeratingWithState:&v228 objects:v264 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v229;
          do
          {
            for (iuint64_t i = 0; ii != v41; ++ii)
            {
              if (*(void *)v229 != v42) {
                objc_enumerationMutation(&unk_1F3452E20);
              }
              uint64_t v44 = *(void **)(*((void *)&v228 + 1) + 8 * ii);
              int v45 = (void *)MEMORY[0x1E016D870]();
              uint64_t v46 = [[self computeMetricsForSourcePlaceType:[v33 unsignedIntValue] source:10 referenceSourcePlaceType:[v33 unsignedIntValue] referenceSource:[v44 unsignedIntValue] metricType:2 bins:v170];
              [v171 addEntriesFromDictionary:v46];

              uint64_t v47 = [[self computeMetricsForSourcePlaceType:[v33 unsignedIntValue] source:5 referenceSourcePlaceType:[v44 unsignedIntValue] referenceSource:objc_msgSend(v33, "unsignedIntValue") metricType:objc_msgSend(v44, "unsignedIntValue") bins:2 v170];
              [v171 addEntriesFromDictionary:v47];

              uint64_t v48 = [[self computeMetricsForSourcePlaceType:[v33 unsignedIntValue] source:4 referenceSourcePlaceType:[v44 unsignedIntValue] referenceSource:objc_msgSend(v33, "unsignedIntValue") metricType:objc_msgSend(v44, "unsignedIntValue") bins:v170];
              [v171 addEntriesFromDictionary:v48];
            }
            uint64_t v41 = [&unk_1F3452E20 countByEnumeratingWithState:&v228 objects:v264 count:16];
          }
          while (v41);
        }
      }
      uint64_t v162 = [&unk_1F3452DF0 countByEnumeratingWithState:&v232 objects:v265 count:16];
    }
    while (v162);
  }
  long long v226 = 0u;
  long long v227 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  uint64_t v49 = [&unk_1F3452E20 arrayByAddingObjectsFromArray:&unk_1F3452E38];
  uint64_t v50 = [v49 countByEnumeratingWithState:&v224 objects:v263 count:16];
  if (v50)
  {
    uint64_t v51 = *(void *)v225;
    do
    {
      for (juint64_t j = 0; jj != v50; ++jj)
      {
        if (*(void *)v225 != v51) {
          objc_enumerationMutation(v49);
        }
        uint64_t v53 = *(void **)(*((void *)&v224 + 1) + 8 * jj);
        uint64_t v54 = (void *)MEMORY[0x1E016D870]();
        uint64_t v55 = [[self computeMetricsForSourcePlaceType:1 source:[v53 unsignedIntValue] referenceSourcePlaceType:2 referenceSource:[v53 unsignedIntValue] metricType:2 bins:v170];
        [v171 addEntriesFromDictionary:v55];
      }
      uint64_t v50 = [v49 countByEnumeratingWithState:&v224 objects:v263 count:16];
    }
    while (v50);
  }

  long long v222 = 0u;
  long long v223 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  __int16 v56 = [&unk_1F3452E20 arrayByAddingObjectsFromArray:&unk_1F3452E50];
  uint64_t v57 = [v56 countByEnumeratingWithState:&v220 objects:v262 count:16];
  if (v57)
  {
    uint64_t v58 = *(void *)v221;
    do
    {
      for (kuint64_t k = 0; kk != v57; ++kk)
      {
        if (*(void *)v221 != v58) {
          objc_enumerationMutation(v56);
        }
        long long v60 = *(void **)(*((void *)&v220 + 1) + 8 * kk);
        long long v61 = (void *)MEMORY[0x1E016D870]();
        v62 = -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 1, [v60 unsignedIntValue], 2, 5, 2, v170);
        [v171 addEntriesFromDictionary:v62];

        uint64_t v63 = -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 2, [v60 unsignedIntValue], 1, 5, 2, v170);
        [v171 addEntriesFromDictionary:v63];
      }
      uint64_t v57 = [v56 countByEnumeratingWithState:&v220 objects:v262 count:16];
    }
    while (v57);
  }

  long long v218 = 0u;
  long long v219 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  uint64_t v64 = [&unk_1F3452E20 arrayByAddingObjectsFromArray:&unk_1F3452E68];
  uint64_t v65 = [v64 countByEnumeratingWithState:&v216 objects:v261 count:16];
  if (v65)
  {
    uint64_t v66 = *(void *)v217;
    do
    {
      for (muint64_t m = 0; mm != v65; ++mm)
      {
        if (*(void *)v217 != v66) {
          objc_enumerationMutation(v64);
        }
        long long v68 = *(void **)(*((void *)&v216 + 1) + 8 * mm);
        long long v69 = (void *)MEMORY[0x1E016D870]();
        long long v70 = -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 1, [v68 unsignedIntValue], 2, 14, 2, v170);
        [v171 addEntriesFromDictionary:v70];

        long long v71 = -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 2, [v68 unsignedIntValue], 1, 14, 2, v170);
        [v171 addEntriesFromDictionary:v71];
      }
      uint64_t v65 = [v64 countByEnumeratingWithState:&v216 objects:v261 count:16];
    }
    while (v65);
  }

  long long v214 = 0u;
  long long v215 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  uint64_t v139 = [&unk_1F3452E08 countByEnumeratingWithState:&v212 objects:v260 count:16];
  if (v139)
  {
    uint64_t v138 = *(void *)v213;
    uint64_t v154 = *MEMORY[0x1E4F5CFE8];
    uint64_t v156 = *MEMORY[0x1E4F28568];
    do
    {
      for (nuint64_t n = 0; nn != v139; ++nn)
      {
        if (*(void *)v213 != v138) {
          objc_enumerationMutation(&unk_1F3452E08);
        }
        v144 = *(void **)(*((void *)&v212 + 1) + 8 * nn);
        v137 = (void *)MEMORY[0x1E016D870]();
        long long v210 = 0u;
        long long v211 = 0u;
        long long v208 = 0u;
        long long v209 = 0u;
        uint64_t v142 = [&unk_1F3452E80 countByEnumeratingWithState:&v208 objects:v259 count:16];
        if (v142)
        {
          uint64_t v141 = *(void *)v209;
          do
          {
            for (uint64_t i1 = 0; i1 != v142; ++i1)
            {
              if (*(void *)v209 != v141) {
                objc_enumerationMutation(&unk_1F3452E80);
              }
              id v150 = *(id *)(*((void *)&v208 + 1) + 8 * i1);
              v146 = (void *)MEMORY[0x1E016D870]();
              if ([v150 unsignedIntValue] != 3
                || ([(id)objc_opt_class() schoolEligibleSources],
                    long long v72 = objc_claimAutoreleasedReturnValue(),
                    int v73 = [v72 containsObject:v144],
                    v72,
                    v73))
              {
                uint64_t v204 = 0;
                v205 = &v204;
                uint64_t v206 = 0x2020000000;
                uint64_t v207 = -1;
                long long v200 = 0u;
                long long v201 = 0u;
                long long v202 = 0u;
                long long v203 = 0u;
                long long v74 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
                long long v75 = [objc_opt_class() keyForSourceType:[v144 unsignedIntValue] placeType:[v150 unsignedIntValue]];
                long long v76 = [v74 objectForKeyedSubscript:v75];
                obuint64_t j = [v76 objectForKeyedSubscript:&unk_1F3450FD8];

                uint64_t v77 = [obj countByEnumeratingWithState:&v200 objects:v258 count:16];
                if (v77)
                {
                  uint64_t v163 = *(void *)v201;
                  do
                  {
                    long long v78 = 0;
                    contextb = (void *)v77;
                    do
                    {
                      if (*(void *)v201 != v163) {
                        objc_enumerationMutation(obj);
                      }
                      long long v79 = *(void **)(*((void *)&v200 + 1) + 8 * (void)v78);
                      long long v80 = (void *)MEMORY[0x1E016D870]();
                      dispatch_semaphore_t v81 = dispatch_semaphore_create(0);
                      long long v82 = [(RTPlaceTypeClassifierMetricsCalculator *)self learnedLocationStore];
                      long long v83 = [v79 identifier];
                      v197[0] = MEMORY[0x1E4F143A8];
                      v197[1] = 3221225472;
                      v197[2] = __57__RTPlaceTypeClassifierMetricsCalculator_retrieveMetrics__block_invoke;
                      v197[3] = &unk_1E6B96110;
                      v199 = &v204;
                      long long v84 = v81;
                      v198 = v84;
                      [v82 fetchLastVisitToPlaceWithIdentifier:v83 handler:v197];

                      long long v85 = v84;
                      long long v86 = [MEMORY[0x1E4F1C9C8] now];
                      dispatch_time_t v87 = dispatch_time(0, 3600000000000);
                      if (dispatch_semaphore_wait(v85, v87))
                      {
                        long long v88 = [MEMORY[0x1E4F1C9C8] now];
                        [v88 timeIntervalSinceDate:v86];
                        double v90 = v89;
                        long long v91 = objc_opt_new();
                        long long v92 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_508];
                        long long v93 = [MEMORY[0x1E4F29060] callStackSymbols];
                        v94 = [v93 filteredArrayUsingPredicate:v92];
                        uint64_t v95 = [v94 firstObject];

                        [v91 submitToCoreAnalytics:v95 type:1 duration:v90];
                        uint64_t v96 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                        if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_fault_impl(&dword_1D9BFA000, v96, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: [inferredVersion.identifier isEqual:self.existingVersion.identifier] || inferredVersion == nil || self.existingVersion == nil (in %s:%d)", buf, 2u);
                        }

                        v97 = (void *)MEMORY[0x1E4F28C58];
                        uint64_t v270 = v156;
                        *(void *)buf = @"semaphore wait timeout";
                        __int16 v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v270 count:1];
                        uint64_t v99 = [v97 errorWithDomain:v154 code:15 userInfo:v98];

                        if (v99) {
                      }
                        }

                      long long v78 = (char *)v78 + 1;
                    }
                    while (contextb != v78);
                    uint64_t v77 = [obj countByEnumeratingWithState:&v200 objects:v258 count:16];
                  }
                  while (v77);
                }

                if ((v205[3] & 0x8000000000000000) == 0)
                {
                  __int16 v100 = [NSNumber numberWithInteger:];
                  -[RTPlaceTypeClassifierMetricsCalculator storeMetricsData:source:placeType:metricKey:](self, "storeMetricsData:source:placeType:metricKey:", v100, [v144 unsignedIntValue], [v150 unsignedIntValue], 4);
                }
                _Block_object_dispose(&v204, 8);
              }
            }
            uint64_t v142 = [&unk_1F3452E80 countByEnumeratingWithState:&v208 objects:v259 count:16];
          }
          while (v142);
        }
      }
      uint64_t v139 = [&unk_1F3452E08 countByEnumeratingWithState:&v212 objects:v260 count:16];
    }
    while (v139);
  }
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  uint64_t v145 = [&unk_1F3452E98 countByEnumeratingWithState:&v193 objects:v257 count:16];
  if (v145)
  {
    uint64_t v143 = *(void *)v194;
    do
    {
      for (uint64_t i2 = 0; i2 != v145; ++i2)
      {
        if (*(void *)v194 != v143) {
          objc_enumerationMutation(&unk_1F3452E98);
        }
        v164 = *(void **)(*((void *)&v193 + 1) + 8 * i2);
        v147 = (void *)MEMORY[0x1E016D870]();
        uint64_t v101 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
        __int16 v102 = [objc_opt_class() keyForSourceType:14 placeType:[v164 unsignedIntValue]];
        v103 = [v101 objectForKeyedSubscript:v102];
        id obja = [v103 objectForKeyedSubscript:&unk_1F3450FD8];

        v104 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
        v105 = [objc_opt_class() keyForSourceType:3 placeType:[v164 unsignedIntValue]];
        v106 = [v104 objectForKeyedSubscript:v105];
        v160 = [v106 objectForKeyedSubscript:&unk_1F3450FD8];

        uint64_t v107 = [obja count];
        if (v107 == [v160 count])
        {
          long long v191 = 0u;
          long long v192 = 0u;
          long long v189 = 0u;
          long long v190 = 0u;
          id v151 = obja;
          uint64_t v157 = [v151 countByEnumeratingWithState:&v189 objects:v256 count:16];
          if (v157)
          {
            uint64_t v155 = *(void *)v190;
            while (2)
            {
              for (uint64_t i3 = 0; i3 != v157; ++i3)
              {
                if (*(void *)v190 != v155) {
                  objc_enumerationMutation(v151);
                }
                v109 = *(void **)(*((void *)&v189 + 1) + 8 * i3);
                contextc = (void *)MEMORY[0x1E016D870]();
                long long v187 = 0u;
                long long v188 = 0u;
                long long v185 = 0u;
                long long v186 = 0u;
                id v110 = v160;
                uint64_t v111 = [v110 countByEnumeratingWithState:&v185 objects:v255 count:16];
                if (!v111)
                {

LABEL_122:
                  -[RTPlaceTypeClassifierMetricsCalculator storeMetricsData:source:placeType:metricKey:](self, "storeMetricsData:source:placeType:metricKey:", &unk_1F3451098, 14, [v164 unsignedIntValue], 5);
                  goto LABEL_123;
                }
                char v112 = 0;
                uint64_t v113 = *(void *)v186;
                do
                {
                  for (uint64_t i4 = 0; i4 != v111; ++i4)
                  {
                    if (*(void *)v186 != v113) {
                      objc_enumerationMutation(v110);
                    }
                    v115 = *(void **)(*((void *)&v185 + 1) + 8 * i4);
                    uint64_t v116 = [v115 type];
                    if (v116 == [v109 type])
                    {
                      v117 = [v115 mapItem];
                      v118 = [v109 mapItem];
                      char v119 = [v117 isEqualToMapItem:v118];
                    }
                    else
                    {
                      char v119 = 0;
                    }
                    v112 |= v119;
                  }
                  uint64_t v111 = [v110 countByEnumeratingWithState:&v185 objects:v255 count:16];
                }
                while (v111);

                if ((v112 & 1) == 0) {
                  goto LABEL_122;
                }
                -[RTPlaceTypeClassifierMetricsCalculator storeMetricsData:source:placeType:metricKey:](self, "storeMetricsData:source:placeType:metricKey:", &unk_1F3451068, 14, [v164 unsignedIntValue], 5);
              }
              uint64_t v157 = [v151 countByEnumeratingWithState:&v189 objects:v256 count:16];
              if (v157) {
                continue;
              }
              break;
            }
          }
LABEL_123:
        }
        else
        {
          -[RTPlaceTypeClassifierMetricsCalculator storeMetricsData:source:placeType:metricKey:](self, "storeMetricsData:source:placeType:metricKey:", &unk_1F3451098, 14, [v164 unsignedIntValue], 5);
        }
      }
      uint64_t v145 = [&unk_1F3452E98 countByEnumeratingWithState:&v193 objects:v257 count:16];
    }
    while (v145);
  }
  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  uint64_t v120 = [&unk_1F3452E08 countByEnumeratingWithState:&v181 objects:v254 count:16];
  if (v120)
  {
    contextd = *(void **)v182;
    do
    {
      for (uint64_t i5 = 0; i5 != v120; ++i5)
      {
        if (*(void **)v182 != contextd) {
          objc_enumerationMutation(&unk_1F3452E08);
        }
        v122 = *(void **)(*((void *)&v181 + 1) + 8 * i5);
        v123 = (void *)MEMORY[0x1E016D870]();
        long long v179 = 0u;
        long long v180 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        uint64_t v124 = [&unk_1F3452DF0 countByEnumeratingWithState:&v177 objects:v253 count:16];
        if (v124)
        {
          uint64_t v125 = *(void *)v178;
          do
          {
            for (uint64_t i6 = 0; i6 != v124; ++i6)
            {
              if (*(void *)v178 != v125) {
                objc_enumerationMutation(&unk_1F3452DF0);
              }
              v127 = *(void **)(*((void *)&v177 + 1) + 8 * i6);
              v128 = (void *)MEMORY[0x1E016D870]();
              v129 = [-[RTPlaceTypeClassifierMetricsCalculator retrieveComputedMetricsForSourcePlaceType:source:](self, "retrieveComputedMetricsForSourcePlaceType:source:", [v127 unsignedIntValue], [v122 unsignedIntValue]);
              [v171 addEntriesFromDictionary:v129];
            }
            uint64_t v124 = [&unk_1F3452DF0 countByEnumeratingWithState:&v177 objects:v253 count:16];
          }
          while (v124);
        }
      }
      uint64_t v120 = [&unk_1F3452E08 countByEnumeratingWithState:&v181 objects:v254 count:16];
    }
    while (v120);
  }
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  v130 = [(id)objc_opt_class() schoolEligibleSources];
  uint64_t v131 = [v130 countByEnumeratingWithState:&v173 objects:v252 count:16];
  if (v131)
  {
    uint64_t v132 = *(void *)v174;
    do
    {
      for (uint64_t i7 = 0; i7 != v131; ++i7)
      {
        if (*(void *)v174 != v132) {
          objc_enumerationMutation(v130);
        }
        v134 = -[RTPlaceTypeClassifierMetricsCalculator retrieveComputedMetricsForSourcePlaceType:source:](self, "retrieveComputedMetricsForSourcePlaceType:source:", 3, [*(id *)(*((void *)&v173 + 1) + 8 * i7) unsignedIntValue]);
        [v171 addEntriesFromDictionary:v134];
      }
      uint64_t v131 = [v130 countByEnumeratingWithState:&v173 objects:v252 count:16];
    }
    while (v131);
  }

  v135 = [(RTPlaceTypeClassifierMetricsCalculator *)self retrieveComputedMetricsForSourcePlaceType:0 source:0];
  [v171 addEntriesFromDictionary:v135];

  return v171;
}

void __57__RTPlaceTypeClassifierMetricsCalculator_retrieveMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 exitDate];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v5 = [v8 exitDate];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    id v7 = [v4 components:16 fromDate:v5 toDate:v6 options:0];

    if ([v7 day] > *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 day];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)modelSources
{
  return &unk_1F3452EB0;
}

+ (id)nonModelSources
{
  return &unk_1F3452EC8;
}

+ (id)notHomeEligibleSources
{
  return &unk_1F3452EE0;
}

+ (id)notWorkEligibleSources
{
  return &unk_1F3452EF8;
}

+ (id)schoolEligibleSources
{
  return &unk_1F3452F10;
}

+ (id)modelDictionaryMetricKeys
{
  return &unk_1F3452F28;
}

+ (id)modelNonDictionaryMetricKeys
{
  return &unk_1F3452F40;
}

+ (id)anySourceMetricKeys
{
  return &unk_1F3452F58;
}

+ (id)genericOnlyMetricKeys
{
  return &unk_1F3452F70;
}

+ (id)ignoredMetricKeys
{
  return &unk_1F3452F88;
}

+ (id)shownToEndUserOnlyMetricKeys
{
  return &unk_1F3452FA0;
}

- (id)computeMetricsForSourcePlaceType:(unint64_t)a3 source:(unint64_t)a4 referenceSourcePlaceType:(unint64_t)a5 referenceSource:(unint64_t)a6 metricType:(unint64_t)a7 bins:(id)a8
{
  id v13 = a8;
  uint64_t v14 = objc_opt_new();
  uint64_t v15 = (void *)MEMORY[0x1E016D870]();
  if (a3 == a5 && a4 == a6) {
    goto LABEL_21;
  }
  double v16 = [NSNumber numberWithUnsignedInteger:a7];
  int v17 = [&unk_1F3452FB8 containsObject:v16];

  if (!v17) {
    goto LABEL_21;
  }
  if (a3 == 1)
  {
    double v16 = [(id)objc_opt_class() notHomeEligibleSources];
    uint64_t v43 = [NSNumber numberWithUnsignedInteger:a4];
    if ((objc_msgSend(v16, "containsObject:") & 1) == 0)
    {
      int v18 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    double v16 = [(id)objc_opt_class() notWorkEligibleSources];
    uint64_t v43 = [NSNumber numberWithUnsignedInteger:a4];
    if (objc_msgSend(v16, "containsObject:"))
    {
LABEL_9:

LABEL_21:
      id v24 = v14;
      goto LABEL_22;
    }
    int v18 = 1;
  }
  else
  {
    int v18 = 0;
  }
LABEL_12:
  uint64_t v40 = v16;
  if (a5 == 2)
  {
    char v38 = v18;
    uint64_t v19 = [(id)objc_opt_class() notWorkEligibleSources];
LABEL_16:
    uint64_t v20 = (void *)v19;
    long long v37 = (void *)v19;
    uint64_t v21 = [NSNumber numberWithUnsignedInteger:a6];
    char v22 = [v20 containsObject:v21];

    int v23 = v43;
    if ((v38 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (a5 == 1)
  {
    char v38 = v18;
    uint64_t v19 = [(id)objc_opt_class() notHomeEligibleSources];
    goto LABEL_16;
  }
  char v22 = 0;
  int v23 = v43;
  if (v18)
  {
LABEL_17:
  }
LABEL_18:
  if (a3 == 1)
  {
  }
  if (v22) {
    goto LABEL_21;
  }
  uint64_t v41 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
  uint64_t v26 = [(id)objc_opt_class() keyForSourceType:a4 placeType:a3];
  id v27 = [v41 objectForKeyedSubscript:v26];
  uint64_t v44 = [v27 objectForKeyedSubscript:&unk_1F3450FD8];

  uint64_t v42 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
  uint64_t v28 = [(id)objc_opt_class() keyForSourceType:a6 placeType:a5];
  uint64_t v29 = [v42 objectForKeyedSubscript:v28];
  uint64_t v39 = [v29 objectForKeyedSubscript:&unk_1F3450FD8];

  id v30 = [(id)objc_opt_class() keyForMetricType:a7 sourcePlaceType:a3 source:a4 referenceSourcePlaceType:a5 referenceSource:a6 metricKey:0];
  [v14 setObject:&unk_1F3451050 forKeyedSubscript:v30];
  if (v44)
  {
    if (a7 == 2)
    {
      uint64_t v34 = self;
      uint64_t v31 = (void *)v39;
      uint64_t v32 = [(RTPlaceTypeClassifierMetricsCalculator *)v34 computeDistanceMetricForSourcePlaces:v44 referencePlaces:v39 bins:v13];
    }
    else
    {
      uint64_t v31 = (void *)v39;
      if (a7 != 1) {
        goto LABEL_34;
      }
      uint64_t v32 = [NSNumber numberWithUnsignedInteger:[v44 count]];
    }
    int v35 = (void *)v32;
    [v14 setObject:v32 forKeyedSubscript:v30];
  }
  else
  {
    id v33 = v14;
    uint64_t v31 = (void *)v39;
  }
LABEL_34:

  if (v44) {
    id v36 = v14;
  }
LABEL_22:

  return v14;
}

- (id)retrieveComputedMetricsForSourcePlaceType:(unint64_t)a3 source:(unint64_t)a4
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v109 = (id)objc_opt_new();
  unint64_t v104 = a3;
  if (a3 == 1)
  {
    uint64_t v7 = [(id)objc_opt_class() notHomeEligibleSources];
    goto LABEL_6;
  }
  if (a3 != 3)
  {
    if (a3 == 2)
    {
      uint64_t v7 = [(id)objc_opt_class() notWorkEligibleSources];
LABEL_6:
      id v8 = (void *)v7;
      id v9 = [NSNumber numberWithUnsignedInteger:a4];
      char v10 = [v8 containsObject:v9];

      if (v10) {
        goto LABEL_72;
      }
    }
LABEL_7:
    unint64_t v11 = a3;
    uint64_t v12 = [(id)objc_opt_class() keyForSourceType:a4 placeType:a3];
    id v13 = 0;
    unint64_t v100 = a4 | a3;
    uint64_t v14 = 1;
    unint64_t v15 = 0x1E4F28000uLL;
    unint64_t v105 = a4;
    uint64_t v108 = self;
    while (1)
    {
      double v16 = [*(id *)(v15 + 3792) numberWithUnsignedInteger:a4];
      if ([&unk_1F3452FD0 containsObject:v16])
      {
        int v17 = [*(id *)(v15 + 3792) numberWithUnsignedInteger:v11];
        if ([&unk_1F3453000 containsObject:v17])
        {
          [(id)objc_opt_class() modelDictionaryMetricKeys];
          int v18 = v112 = v17;
          uint64_t v19 = [*(id *)(v15 + 3792) numberWithInt:v14];
          int v116 = [v18 containsObject:v19];

          int v17 = v112;
        }
        else
        {
          int v116 = 0;
        }
      }
      else
      {
        int v116 = 0;
      }

      uint64_t v20 = [*(id *)(v15 + 3792) numberWithUnsignedInteger:a4];
      if ([&unk_1F3452FD0 containsObject:v20])
      {
        uint64_t v21 = [*(id *)(v15 + 3792) numberWithUnsignedInteger:v11];
        if ([&unk_1F3453000 containsObject:v21])
        {
          [(id)objc_opt_class() modelNonDictionaryMetricKeys];
          char v22 = v113 = v21;
          int v23 = [*(id *)(v15 + 3792) numberWithInt:v14];
          int v101 = [v22 containsObject:v23];

          uint64_t v21 = v113;
        }
        else
        {
          int v101 = 0;
        }
      }
      else
      {
        int v101 = 0;
      }

      if (v100)
      {
        int v114 = 0;
      }
      else
      {
        id v24 = [(id)objc_opt_class() genericOnlyMetricKeys];
        uint64_t v25 = [*(id *)(v15 + 3792) numberWithInt:v14];
        int v114 = [v24 containsObject:v25];
      }
      int v26 = 0;
      if (a4)
      {
        if (a4 == 14)
        {
          id v27 = [*(id *)(v15 + 3792) numberWithUnsignedInteger:v11];
          if ([&unk_1F3452FE8 containsObject:v27])
          {
            id v110 = [(id)objc_opt_class() shownToEndUserOnlyMetricKeys];
            uint64_t v28 = [*(id *)(v15 + 3792) numberWithInt:v14];
            int v26 = [v110 containsObject:v28];
          }
          else
          {
            int v26 = 0;
          }
        }
        int v106 = v26;
        uint64_t v29 = [*(id *)(v15 + 3792) numberWithUnsignedInteger:v11];
        if ([&unk_1F3452FE8 containsObject:v29])
        {
          id v30 = [(id)objc_opt_class() anySourceMetricKeys];
          uint64_t v31 = [*(id *)(v15 + 3792) numberWithInt:v14];
          obuint64_t j = [v30 containsObject:v31];
        }
        else
        {
          obuint64_t j = 0;
        }
      }
      else
      {
        int v106 = 0;
        obuint64_t j = 0;
      }
      uint64_t v32 = [(id)objc_opt_class() ignoredMetricKeys];
      id v33 = [*(id *)(v15 + 3792) numberWithInt:v14];
      char v34 = [v32 containsObject:v33];

      if (v34) {
        goto LABEL_65;
      }
      uint64_t v111 = v14;
      if (v116)
      {
        int v35 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F3453018];
        if (v11 == 1 || v11 == 2)
        {
          v117 = objc_opt_new();
          uint64_t v54 = +[RTRuntime objToDictionary:filterProperties:](RTRuntime, "objToDictionary:filterProperties:");
          uint64_t v55 = [v54 allKeys];
          [v35 addObjectsFromArray:v55];
        }
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        id obja = v35;
        uint64_t v115 = [obja countByEnumeratingWithState:&v119 objects:v123 count:16];
        if (v115)
        {
          uint64_t v107 = *(void *)v120;
          do
          {
            uint64_t v56 = 0;
            do
            {
              if (*(void *)v120 != v107) {
                objc_enumerationMutation(obja);
              }
              uint64_t v57 = *(void *)(*((void *)&v119 + 1) + 8 * v56);
              uint64_t v58 = [(id)objc_opt_class() keyForMetricType:3 placeType:v11 source:a4 metricKey:v14];

              uint64_t v118 = [NSString stringWithFormat:@"%@_%@", v58, v57];

              uint64_t v59 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
              [v59 objectForKeyedSubscript:v12];
              long long v61 = v60 = self;
              v62 = [*(id *)(v15 + 3792) numberWithInt:v14];
              uint64_t v63 = [v61 objectForKeyedSubscript:v62];
              [v63 objectForKeyedSubscript:v57];
              v65 = uint64_t v64 = v14;

              if (v65)
              {
                uint64_t v66 = [(RTPlaceTypeClassifierMetricsCalculator *)v60 metricsData];
                id v67 = [v66 objectForKeyedSubscript:v12];
                long long v68 = [NSNumber numberWithInt:v64];
                long long v69 = [v67 objectForKeyedSubscript:v68];
                long long v70 = [v69 objectForKeyedSubscript:v57];
                id v13 = (void *)v118;
                [v109 setObject:v70 forKeyedSubscript:v118];
              }
              else
              {
                id v13 = (void *)v118;
                [v109 setObject:&unk_1F3451050 forKeyedSubscript:v118];
              }
              ++v56;
              uint64_t v14 = v111;
              unint64_t v11 = v104;
              a4 = v105;
              self = v108;
              unint64_t v15 = 0x1E4F28000;
            }
            while (v115 != v56);
            uint64_t v115 = [obja countByEnumeratingWithState:&v119 objects:v123 count:16];
          }
          while (v115);
        }

        goto LABEL_65;
      }
      if ((v101 | v114 | obj | v106) == 1)
      {
        uint64_t v36 = [(id)objc_opt_class() keyForMetricType:3 placeType:v11 source:a4 metricKey:v14];

        long long v37 = [(RTPlaceTypeClassifierMetricsCalculator *)self metricsData];
        uint64_t v38 = [v37 objectForKeyedSubscript:v12];
        unint64_t v39 = v15;
        uint64_t v40 = (void *)v38;
        uint64_t v41 = [*(id *)(v39 + 3792) numberWithInt:v14];
        [v40 objectForKeyedSubscript:v41];
        uint64_t v43 = v42 = v14;

        if (v43)
        {
          uint64_t v44 = v42;
          if ((v42 - 3) <= 1)
          {
            int v45 = objc_opt_new();
            uint64_t v46 = +[RTMetric binsFromStart:&unk_1F3451068 toEnd:&unk_1F34511D0 gap:&unk_1F3451098];
            [v45 addObjectsFromArray:v46];

            uint64_t v47 = +[RTMetric binsFromStart:&unk_1F34511E8 toEnd:&unk_1F3451200 gap:&unk_1F3451218];
            [v45 addObjectsFromArray:v47];

            uint64_t v48 = +[RTMetric binsFromStart:&unk_1F3451230 toEnd:&unk_1F3451248 gap:&unk_1F3451260];
            [v45 addObjectsFromArray:v48];

            uint64_t v49 = [(RTPlaceTypeClassifierMetricsCalculator *)v108 metricsData];
            uint64_t v50 = [v49 objectForKeyedSubscript:v12];
            uint64_t v51 = [NSNumber numberWithInt:v42];
            id v52 = [v50 objectForKeyedSubscript:v51];
            uint64_t v53 = +[RTMetric binForNumber:v52 bins:v45];
            [v109 setObject:v53 forKeyedSubscript:v36];

            unint64_t v11 = v104;
            uint64_t v14 = v111;

            self = v108;
            unint64_t v15 = 0x1E4F28000uLL;
            goto LABEL_62;
          }
          if (v42 == 11 || (v42 & 0x7FFFFFFB) == 2)
          {
            int v45 = objc_opt_new();
            long long v79 = +[RTMetric binsFromStart:&unk_1F3451068 toEnd:&unk_1F3451260 gap:&unk_1F3451098];
            [v45 addObjectsFromArray:v79];

            long long v80 = +[RTMetric binsFromStart:&unk_1F34511D0 toEnd:&unk_1F3451278 gap:&unk_1F3451218];
            [v45 addObjectsFromArray:v80];

            dispatch_semaphore_t v81 = +[RTMetric binsFromStart:&unk_1F3451200 toEnd:&unk_1F3451080 gap:&unk_1F3451260];
            [v45 addObjectsFromArray:v81];

            [(RTPlaceTypeClassifierMetricsCalculator *)v108 metricsData];
            v83 = long long v82 = v12;
            long long v84 = [v83 objectForKeyedSubscript:v82];
            long long v85 = [NSNumber numberWithInt:v44];
            long long v86 = [v84 objectForKeyedSubscript:v85];
            dispatch_time_t v87 = +[RTMetric binsFromStart:&unk_1F3451068 toEnd:&unk_1F3451230 gap:&unk_1F3451098];
            long long v88 = +[RTMetric binForNumber:v86 bins:v87];
            [v109 setObject:v88 forKeyedSubscript:v36];

            uint64_t v14 = v111;
            self = v108;

            unint64_t v15 = 0x1E4F28000;
            uint64_t v12 = v82;
LABEL_62:
          }
          else
          {
            unsigned int v71 = v42 - 9;
            if (v11 == 1 && v71 <= 1)
            {
              id v13 = (void *)v36;
              long long v72 = [(RTPlaceTypeClassifierMetricsCalculator *)v108 metricsData];
              [v72 objectForKeyedSubscript:v12];
              v74 = int v73 = v12;
              long long v75 = [NSNumber numberWithInt:v44];
              long long v76 = [v74 objectForKeyedSubscript:v75];
              uint64_t v77 = &unk_1F34538E8;
              long long v78 = &unk_1F34538F8;
              goto LABEL_70;
            }
            if (v11 == 2 && v71 <= 1)
            {
              id v13 = (void *)v36;
              long long v72 = [(RTPlaceTypeClassifierMetricsCalculator *)v108 metricsData];
              [v72 objectForKeyedSubscript:v12];
              v74 = int v73 = v12;
              long long v75 = [NSNumber numberWithInt:v44];
              long long v76 = [v74 objectForKeyedSubscript:v75];
              uint64_t v77 = &unk_1F3451068;
              long long v78 = &unk_1F3451098;
LABEL_70:
              double v89 = +[RTMetric binsFromStart:v77 toEnd:v78 gap:&unk_1F3453908];
              double v90 = +[RTMetric binForNumber:v76 bins:v89];
              [v109 setObject:v90 forKeyedSubscript:v13];

              uint64_t v14 = v111;
              self = v108;

              unint64_t v15 = 0x1E4F28000;
              uint64_t v12 = v73;

LABEL_64:
              a4 = v105;
              goto LABEL_65;
            }
            long long v91 = [(RTPlaceTypeClassifierMetricsCalculator *)v108 metricsData];
            long long v92 = [v91 objectForKeyedSubscript:v12];
            long long v93 = [NSNumber numberWithInt:v42];
            v94 = [v92 objectForKeyedSubscript:v93];
            [v109 setObject:v94 forKeyedSubscript:v36];

            uint64_t v14 = v111;
            self = v108;

            unint64_t v15 = 0x1E4F28000uLL;
          }
          id v13 = (void *)v36;
          goto LABEL_64;
        }
        [v109 setObject:&unk_1F3451050 forKeyedSubscript:v36];
        a4 = v105;
        self = v108;
        uint64_t v14 = v42;
        id v13 = (void *)v36;
        unint64_t v15 = 0x1E4F28000;
      }
LABEL_65:
      if (++v14 == 12)
      {
        id v95 = v109;

        goto LABEL_72;
      }
    }
  }
  v97 = [(id)objc_opt_class() schoolEligibleSources];
  __int16 v98 = [NSNumber numberWithUnsignedInteger:a4];
  int v99 = [v97 containsObject:v98];

  if (v99) {
    goto LABEL_7;
  }
LABEL_72:

  return v109;
}

+ (id)keyForMetricType:(unint64_t)a3 sourcePlaceType:(unint64_t)a4 source:(unint64_t)a5 referenceSourcePlaceType:(unint64_t)a6 referenceSource:(unint64_t)a7 metricKey:(unint64_t)a8
{
  id v8 = &stru_1F33EAD88;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_9;
    case 1uLL:
      uint64_t v9 = 1;
      goto LABEL_8;
    case 2uLL:
      id v8 = [a1 keyForMetricType:2 placeType:a4 source:a5 metricKey:a8];
      if (a6)
      {
        uint64_t v12 = NSString;
        id v13 = +[RTLearnedPlace placeTypeToString:a6];
        uint64_t v14 = [v12 stringWithFormat:@"%@_%@", v8, v13];

        id v8 = (__CFString *)v14;
      }
      if (a7)
      {
        unint64_t v15 = NSString;
        double v16 = [(id)objc_opt_class() metricsSourceToString:a7];
        uint64_t v17 = [v15 stringWithFormat:@"%@_%@", v8, v16];

        id v8 = (__CFString *)v17;
      }
      goto LABEL_9;
    case 3uLL:
      uint64_t v9 = 3;
LABEL_8:
      [a1 keyForMetricType:v9 placeType:a4 source:a5 metricKey:a8];
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      id v8 = v8;
      break;
    default:
      break;
  }

  return v8;
}

+ (id)keyForMetricType:(unint64_t)a3 placeType:(unint64_t)a4 source:(unint64_t)a5 metricKey:(unint64_t)a6
{
  uint64_t v9 = [(id)objc_opt_class() metricsTypeToString:a3];
  if (a4)
  {
    char v10 = NSString;
    unint64_t v11 = +[RTLearnedPlace placeTypeToString:a4];
    uint64_t v12 = [v10 stringWithFormat:@"%@_%@", v9, v11];

    uint64_t v9 = (void *)v12;
  }
  if (a5)
  {
    id v13 = NSString;
    uint64_t v14 = [(id)objc_opt_class() metricsSourceToString:a5];
    uint64_t v15 = [v13 stringWithFormat:@"%@_%@", v9, v14];

    uint64_t v9 = (void *)v15;
  }
  if (a6)
  {
    double v16 = NSString;
    uint64_t v17 = [(id)objc_opt_class() metricsKeyToString:a6];
    uint64_t v18 = [v16 stringWithFormat:@"%@_%@", v9, v17];

    uint64_t v9 = (void *)v18;
  }

  return v9;
}

+ (id)keyForSourceType:(unint64_t)a3 placeType:(unint64_t)a4
{
  uint64_t v5 = [(id)objc_opt_class() metricsSourceToString:a3];
  id v6 = NSString;
  uint64_t v7 = +[RTLearnedPlace placeTypeToString:a4];
  id v8 = [v6 stringWithFormat:@"%@_%@", v5, v7];

  return v8;
}

+ (id)metricsTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return off_1E6B96288[a3 - 1];
  }
}

- (id)filterLearnedPlacesOfType:(unint64_t)a3 places:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28F60];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__RTPlaceTypeClassifierMetricsCalculator_filterLearnedPlacesOfType_places___block_invoke;
  v9[3] = &__block_descriptor_40_e41_B24__0__RTLearnedPlace_8__NSDictionary_16l;
  v9[4] = a3;
  id v5 = a4;
  id v6 = [v4 predicateWithBlock:v9];
  uint64_t v7 = [v5 filteredArrayUsingPredicate:v6];

  return v7;
}

BOOL __75__RTPlaceTypeClassifierMetricsCalculator_filterLearnedPlacesOfType_places___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (id)computeDistanceMetricForSourcePlaces:(id)a3 referencePlaces:(id)a4 bins:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count] && objc_msgSend(v8, "count"))
  {
    id v29 = v9;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v7;
    uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    id v30 = v7;
    if (v34)
    {
      uint64_t v32 = *(void *)v42;
      id v33 = v8;
      double v10 = INFINITY;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = v11;
          uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v13 = v8;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v38 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                distanceCalculator = self->_distanceCalculator;
                uint64_t v20 = [v12 mapItem:v29];
                uint64_t v21 = [v20 location];
                char v22 = [v18 mapItem];
                int v23 = [v22 location];
                [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v21 toLocation:v23 error:0];
                double v25 = v24;

                if (v10 > v25) {
                  double v10 = v25;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v15);
          }

          uint64_t v11 = v35 + 1;
          id v8 = v33;
        }
        while (v35 + 1 != v34);
        uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v34);
    }
    else
    {
      double v10 = INFINITY;
    }

    id v27 = [NSNumber numberWithDouble:v10];
    id v9 = v29;
    int v26 = +[RTMetric binForNumber:v27 bins:v29];

    id v7 = v30;
  }
  else
  {
    int v26 = &unk_1F3451050;
  }

  return v26;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTLearnedPlaceTypeInferenceStore)learnedPlaceTypeInferenceStore
{
  return self->_learnedPlaceTypeInferenceStore;
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (NSMutableDictionary)metricsData
{
  return self->_metricsData;
}

- (NSMutableArray)learnedPlaceTypeInferences
{
  return self->_learnedPlaceTypeInferences;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_learnedPlaceTypeInferences, 0);
  objc_storeStrong((id *)&self->_metricsData, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_learnedPlaceTypeInferenceStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);

  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end