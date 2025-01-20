@interface RTRelabelerPersisterMetrics
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)BOOLeanKeys;
+ (id)bucketedKeys;
+ (id)doubleKeys;
+ (id)supportedMetricKeys;
+ (id)unsignedIntegerKeys;
- (BOOL)submitMetricsWithError:(id *)a3;
- (RTRelabelerPersisterMetrics)initWithLoggingEnabled:(BOOL)a3;
- (double)safeFraction:(double)a3 denominator:(double)a4;
- (void)setBucketedPercentageMetricsWithMappings:(id)a3 sharedDenominator:(double)a4 sharedBins:(id)a5;
- (void)setDerivedMetrics;
- (void)setErrorKey:(id)a3;
- (void)tallyError:(id)a3;
- (void)tallyKey:(id)a3;
@end

@implementation RTRelabelerPersisterMetrics

- (RTRelabelerPersisterMetrics)initWithLoggingEnabled:(BOOL)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)RTRelabelerPersisterMetrics;
  v3 = [(RTMetric *)&v50 initWithLoggingEnabled:a3];
  if (v3)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v4 = [(id)objc_opt_class() BOOLeanKeys];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v47;
      uint64_t v8 = MEMORY[0x1E4F1CC28];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v47 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v46 + 1) + 8 * v9);
          v11 = [(RTMetric *)v3 metrics];
          [v11 setObject:v8 forKeyedSubscript:v10];

          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v6);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v12 = [(id)objc_opt_class() unsignedIntegerKeys];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v53 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v43;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v43 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v42 + 1) + 8 * v16);
          v18 = [(RTMetric *)v3 metrics];
          [v18 setObject:&unk_1F3451F80 forKeyedSubscript:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v53 count:16];
      }
      while (v14);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v19 = [(id)objc_opt_class() doubleKeys];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v52 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v39;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v38 + 1) + 8 * v23);
          v25 = [(RTMetric *)v3 metrics];
          [v25 setObject:&unk_1F3453CA8 forKeyedSubscript:v24];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v52 count:16];
      }
      while (v21);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v26 = [objc_opt_class() bucketedKeys];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v51 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v34 + 1) + 8 * v30);
          v32 = [(RTMetric *)v3 metrics];
          [v32 setObject:&unk_1F3451F98 forKeyedSubscript:v31];

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v51 count:16];
      }
      while (v28);
    }
  }
  return v3;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventRelabelerPersisterRun;
}

+ (id)BOOLeanKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"relabelerWasNil", @"persisterWasNil", @"resnappingErroredOut", @"cleanUpErroredOut", @"combineErroredOut", @"mergingSequentialVisitsErroredOut", @"fixingUnconcreteErroredOut", @"saveErroredOut", 0];
}

+ (id)unsignedIntegerKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"numberOfStartingLOIs", @"numberOfStartingVisits", @"numberUnassociated", @"numberUnassociatedError", @"numberOfNonPlaceholderSame", @"numberOfNonPlaceholderDifferent", @"numberOfNonPlaceholderError", @"numberOfPlaceholderCollapsed", @"numberOfPlaceholderIntendedRestored", @"numberOfPlaceholderUnintendedRestored", @"numberOfPlaceholderNotCollapsedRevGeoQuery", @"numberOfPlaceholderError", @"numberOfLOIsCollapsed", @"numberOfCombineIterations", @"numberOfLOIsCleanedUp", @"numberOfBrokenLOIErrors", @"numberOfUnknownErrors",
               @"numberOfInvalidParameterErrors",
               @"numberOfDistanceCalculatorErrors",
               @"numberOfFetchRequestErrors",
               @"numberOfNilVisitMOErrors",
               @"numberOfNilLOIMOErrors",
               @"numberOfNilPlaceMOErrors",
               @"numberOfRevGeoQueryErrors",
               @"numberOfNoSingularTranstiionErrors",
               @"totalNumberOfErrors",
               0);
}

+ (id)doubleKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"startingVisitDensity", @"percentageOfUnassociatedError", @"percentageOfLOIsCollapsed", @"errorRate", @"visitDensityRatioIncrease", @"runTime", 0];
}

+ (id)bucketedKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"bucketedNumberOfStartingVisits", @"bucketedPercentageOfNonPlaceholderSame", @"bucketedPercentageOfNonPlaceholderDifferent", @"bucketedPercentageOfNonPlaceholderError", @"bucketedPercentageOfPlaceholderCollapsed", @"bucketedPercentageOfPlaceholderIntendedRestored", @"bucketedPercentageOfPlaceholderUnintendedRestored", @"bucketedPercentageOfPlaceholderRevGeoQuery", @"bucketedPercentageOfPlaceholderError", @"bucketedPercentageOfNonPlaceholder", @"bucketedPercentageOfPlaceholder", @"bucketedPercentageOfLOIsCleanedUp", @"bucketedPercentageOfLOIsBroken", @"bucketedPercentageOfLOIsDeleted", @"bucketedPercentageOfUnknownErrors", @"bucketedPercentageOfInvalidParameterErrors", @"bucketedPercentageOfDistanceCalculatorErrors",
               @"bucketedPercentageOfFetchRequestErrors",
               @"bucketedPercentageOfNilVisitMOErrors",
               @"bucketedPercentageOfNilLOIMOErrors",
               @"bucketedPercentageOfNilPlaceMOErrors",
               @"bucketedPercentageOfRevGeoQueryErrors",
               @"bucketedPercentageOfNoSingularTransitionErrors",
               0);
}

+ (id)supportedMetricKeys
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  v3 = [(id)objc_opt_class() BOOLeanKeys];
  v4 = [v2 setWithSet:v3];

  uint64_t v5 = [(id)objc_opt_class() unsignedIntegerKeys];
  uint64_t v6 = [v5 allObjects];
  [v4 addObjectsFromArray:v6];

  uint64_t v7 = [(id)objc_opt_class() doubleKeys];
  uint64_t v8 = [v7 allObjects];
  [v4 addObjectsFromArray:v8];

  uint64_t v9 = [(id)objc_opt_class() bucketedKeys];
  uint64_t v10 = [v9 allObjects];
  [v4 addObjectsFromArray:v10];

  return v4;
}

- (void)tallyKey:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(RTMetric *)self metrics];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[RTRelabelerPersisterMetrics tallyKey:]";
      __int16 v12 = 1024;
      int v13 = 77;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Called tallyKey on a non-NSNumber value (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }
  }
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:[v6 unsignedIntegerValue] + 1];
  uint64_t v9 = [(RTMetric *)self metrics];
  [v9 setObject:v8 forKeyedSubscript:v4];
}

- (void)tallyError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v11 = v4;
    uint64_t v5 = [v4 domain];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F5CFE8]];

    if (v6)
    {
      if ([v11 code] != 7) {
        goto LABEL_10;
      }
      uint64_t v7 = @"numberOfInvalidParameterErrors";
    }
    else
    {
      uint64_t v8 = [v11 domain];
      int v9 = [v8 isEqualToString:@"RTRelabelerPersisterErrorDomain"];

      if (v9)
      {
        unint64_t v10 = [v11 code];
        if (v10 > 8) {
          goto LABEL_10;
        }
        uint64_t v7 = off_1E6B9ADE8[v10];
      }
      else
      {
        uint64_t v7 = @"numberOfUnknownErrors";
      }
    }
    [(RTRelabelerPersisterMetrics *)self tallyKey:v7];
  }
LABEL_10:

  MEMORY[0x1F41817F8]();
}

- (void)setErrorKey:(id)a3
{
  id v4 = a3;
  id v5 = [(RTMetric *)self metrics];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v4];
}

- (double)safeFraction:(double)a3 denominator:(double)a4
{
  double result = a3 / a4;
  if (a4 <= 0.0) {
    return -1.0;
  }
  return result;
}

- (void)setBucketedPercentageMetricsWithMappings:(id)a3 sharedDenominator:(double)a4 sharedBins:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  int v9 = v8;
  id obj = v7;
  if (!v7)
  {
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
LABEL_18:

      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: mappings";
LABEL_21:
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_18;
  }
  if (!v8)
  {
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: sharedBins";
    goto LABEL_21;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v29;
    *(void *)&long long v11 = 136315394;
    long long v26 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v16 = [(RTMetric *)self metrics];
        uint64_t v17 = [v15 firstObject];
        v18 = [v16 objectForKeyedSubscript:v17];

        if (v18)
        {
          [v18 doubleValue];
          -[RTRelabelerPersisterMetrics safeFraction:denominator:](self, "safeFraction:denominator:");
          uint64_t v20 = [NSNumber numberWithDouble:v19 * 100.0];
          uint64_t v21 = +[RTMetric binForNumber:v20 bins:v9];
          uint64_t v22 = [(RTMetric *)self metrics];
          uint64_t v23 = [v15 secondObject];
          [v22 setObject:v21 forKeyedSubscript:v23];
        }
        else
        {
          uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            v33 = "-[RTRelabelerPersisterMetrics setBucketedPercentageMetricsWithMappings:sharedDenominator:sharedBins:]";
            __int16 v34 = 1024;
            int v35 = 152;
            _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromValue (in %s:%d)", buf, 0x12u);
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v12);
  }
LABEL_19:
}

- (void)setDerivedMetrics
{
  v188[3] = *MEMORY[0x1E4F143B8];
  v180 = +[RTMetric binsFromStart:&unk_1F3451F80 toEnd:&unk_1F3451FB0 gap:&unk_1F3451FC8];
  v179 = +[RTMetric binsFromStart:&unk_1F3451F80 toEnd:&unk_1F3451FB0 gap:&unk_1F3451FF8];
  v3 = [(RTMetric *)self metrics];
  id v4 = [v3 objectForKeyedSubscript:@"numberOfStartingVisits"];
  id v5 = +[RTMetric binForNumber:v4 bins:&unk_1F3453318];
  int v6 = [(RTMetric *)self metrics];
  [v6 setObject:v5 forKeyedSubscript:@"bucketedNumberOfStartingVisits"];

  id v7 = NSNumber;
  id v8 = [(RTMetric *)self metrics];
  int v9 = [v8 objectForKeyedSubscript:@"numberOfStartingVisits"];
  [v9 doubleValue];
  double v11 = v10;
  uint64_t v12 = [(RTMetric *)self metrics];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"numberOfStartingLOIs"];
  [v13 doubleValue];
  [(RTRelabelerPersisterMetrics *)self safeFraction:v11 denominator:v14];
  uint64_t v15 = [v7 numberWithDouble:];
  uint64_t v16 = [(RTMetric *)self metrics];
  [v16 setObject:v15 forKeyedSubscript:@"startingVisitDensity"];

  uint64_t v17 = NSNumber;
  v18 = [(RTMetric *)self metrics];
  double v19 = [v18 objectForKeyedSubscript:@"numberUnassociatedError"];
  [v19 doubleValue];
  double v21 = v20;
  uint64_t v22 = [(RTMetric *)self metrics];
  uint64_t v23 = [v22 objectForKeyedSubscript:@"numberUnassociated"];
  [v23 doubleValue];
  double v25 = v24;
  long long v26 = [(RTMetric *)self metrics];
  uint64_t v27 = [v26 objectForKeyedSubscript:@"numberUnassociatedError"];
  [v27 doubleValue];
  [(RTRelabelerPersisterMetrics *)self safeFraction:v21 denominator:v25 + v28];
  long long v30 = [v17 numberWithDouble:v29 * 100.0];
  long long v31 = [(RTMetric *)self metrics];
  [v31 setObject:v30 forKeyedSubscript:@"percentageOfUnassociatedError"];

  v32 = [(RTMetric *)self metrics];
  v33 = [v32 objectForKeyedSubscript:@"numberOfNonPlaceholderSame"];
  [v33 doubleValue];
  double v35 = v34;
  long long v36 = [(RTMetric *)self metrics];
  uint64_t v37 = [v36 objectForKeyedSubscript:@"numberOfNonPlaceholderDifferent"];
  [v37 doubleValue];
  double v39 = v35 + v38;
  long long v40 = [(RTMetric *)self metrics];
  long long v41 = [v40 objectForKeyedSubscript:@"numberOfNonPlaceholderError"];
  [v41 doubleValue];
  double v43 = v39 + v42;

  v188[0] = @"numberOfNonPlaceholderSame";
  v188[1] = @"numberOfNonPlaceholderDifferent";
  v188[2] = @"numberOfNonPlaceholderError";
  v178 = [MEMORY[0x1E4F1C978] arrayWithObjects:v188 count:3];
  v187[0] = @"bucketedPercentageOfNonPlaceholderSame";
  v187[1] = @"bucketedPercentageOfNonPlaceholderDifferent";
  v187[2] = @"bucketedPercentageOfNonPlaceholderError";
  v177 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:3];
  long long v44 = [[_RTZip alloc] initWithFirstInput:v178 secondInput:v177];
  long long v45 = [(_RTZip *)v44 zippedArray];
  [(RTRelabelerPersisterMetrics *)self setBucketedPercentageMetricsWithMappings:v45 sharedDenominator:v180 sharedBins:v43];

  v175 = [(RTMetric *)self metrics];
  long long v46 = [v175 objectForKeyedSubscript:@"numberOfPlaceholderCollapsed"];
  [v46 doubleValue];
  double v48 = v47;
  long long v49 = [(RTMetric *)self metrics];
  objc_super v50 = [v49 objectForKeyedSubscript:@"numberOfPlaceholderIntendedRestored"];
  [v50 doubleValue];
  double v52 = v48 + v51;
  v53 = [(RTMetric *)self metrics];
  v54 = [v53 objectForKeyedSubscript:@"numberOfPlaceholderUnintendedRestored"];
  [v54 doubleValue];
  double v56 = v52 + v55;
  v57 = [(RTMetric *)self metrics];
  v58 = [v57 objectForKeyedSubscript:@"numberOfPlaceholderNotCollapsedRevGeoQuery"];
  [v58 doubleValue];
  double v60 = v56 + v59;
  v61 = [(RTMetric *)self metrics];
  v62 = [v61 objectForKeyedSubscript:@"numberOfPlaceholderError"];
  [v62 doubleValue];
  double v64 = v60 + v63;

  v186[0] = @"numberOfPlaceholderCollapsed";
  v186[1] = @"numberOfPlaceholderIntendedRestored";
  v186[2] = @"numberOfPlaceholderUnintendedRestored";
  v186[3] = @"numberOfPlaceholderNotCollapsedRevGeoQuery";
  v186[4] = @"numberOfPlaceholderError";
  v176 = [MEMORY[0x1E4F1C978] arrayWithObjects:v186 count:5];
  v185[0] = @"bucketedPercentageOfPlaceholderCollapsed";
  v185[1] = @"bucketedPercentageOfPlaceholderIntendedRestored";
  v185[2] = @"bucketedPercentageOfPlaceholderUnintendedRestored";
  v185[3] = @"bucketedPercentageOfPlaceholderRevGeoQuery";
  v185[4] = @"bucketedPercentageOfPlaceholderError";
  v174 = [MEMORY[0x1E4F1C978] arrayWithObjects:v185 count:5];
  v65 = [[_RTZip alloc] initWithFirstInput:v176 secondInput:v174];
  v66 = [(_RTZip *)v65 zippedArray];
  [(RTRelabelerPersisterMetrics *)self setBucketedPercentageMetricsWithMappings:v66 sharedDenominator:v180 sharedBins:v64];

  v67 = [(RTMetric *)self metrics];
  v68 = [v67 objectForKeyedSubscript:@"numberOfStartingVisits"];
  [v68 doubleValue];
  [(RTRelabelerPersisterMetrics *)self safeFraction:v43 denominator:v69];
  double v71 = v70 * 100.0;

  v72 = [(RTMetric *)self metrics];
  v73 = [v72 objectForKeyedSubscript:@"numberOfStartingVisits"];
  [v73 doubleValue];
  [(RTRelabelerPersisterMetrics *)self safeFraction:v64 denominator:v74];
  double v76 = v75 * 100.0;

  v77 = [NSNumber numberWithDouble:v71];
  v78 = +[RTMetric binForNumber:v77 bins:v180];
  v79 = [(RTMetric *)self metrics];
  [v79 setObject:v78 forKeyedSubscript:@"bucketedPercentageOfNonPlaceholder"];

  v80 = [NSNumber numberWithDouble:v76];
  v81 = +[RTMetric binForNumber:v80 bins:v180];
  v82 = [(RTMetric *)self metrics];
  [v82 setObject:v81 forKeyedSubscript:@"bucketedPercentageOfPlaceholder"];

  v83 = NSNumber;
  v84 = [(RTMetric *)self metrics];
  v85 = [v84 objectForKeyedSubscript:@"numberOfLOIsCollapsed"];
  [v85 doubleValue];
  double v87 = v86;
  v88 = [(RTMetric *)self metrics];
  v89 = [v88 objectForKeyedSubscript:@"numberOfStartingLOIs"];
  [v89 doubleValue];
  [(RTRelabelerPersisterMetrics *)self safeFraction:v87 denominator:v90];
  v92 = [v83 numberWithDouble:v91 * 100.0];
  v93 = [(RTMetric *)self metrics];
  [v93 setObject:v92 forKeyedSubscript:@"percentageOfLOIsCollapsed"];

  v184[0] = @"numberOfLOIsCleanedUp";
  v184[1] = @"numberOfBrokenLOIErrors";
  v173 = [MEMORY[0x1E4F1C978] arrayWithObjects:v184 count:2];
  v183[0] = @"bucketedPercentageOfLOIsCleanedUp";
  v183[1] = @"bucketedPercentageOfLOIsBroken";
  v172 = [MEMORY[0x1E4F1C978] arrayWithObjects:v183 count:2];
  v94 = [[_RTZip alloc] initWithFirstInput:v173 secondInput:v172];
  v95 = [(_RTZip *)v94 zippedArray];
  v96 = [(RTMetric *)self metrics];
  v97 = [v96 objectForKeyedSubscript:@"numberOfStartingLOIs"];
  [v97 doubleValue];
  -[RTRelabelerPersisterMetrics setBucketedPercentageMetricsWithMappings:sharedDenominator:sharedBins:](self, "setBucketedPercentageMetricsWithMappings:sharedDenominator:sharedBins:", v95, &unk_1F3453300);

  v98 = [(RTMetric *)self metrics];
  v99 = [v98 objectForKeyedSubscript:@"numberOfLOIsCleanedUp"];
  [v99 doubleValue];
  double v101 = v100;
  v102 = [(RTMetric *)self metrics];
  v103 = [v102 objectForKeyedSubscript:@"numberOfBrokenLOIErrors"];
  [v103 doubleValue];
  double v105 = v101 + v104;

  v106 = [(RTMetric *)self metrics];
  v107 = [v106 objectForKeyedSubscript:@"numberOfStartingLOIs"];
  [v107 doubleValue];
  [(RTRelabelerPersisterMetrics *)self safeFraction:v105 denominator:v108];
  double v110 = v109 * 100.0;

  v111 = [NSNumber numberWithDouble:v110];
  v112 = +[RTMetric binForNumber:v111 bins:&unk_1F3453300];
  v113 = [(RTMetric *)self metrics];
  [v113 setObject:v112 forKeyedSubscript:@"bucketedPercentageOfLOIsDeleted"];

  v171 = [(RTMetric *)self metrics];
  v170 = [v171 objectForKeyedSubscript:@"numberOfUnknownErrors"];
  [v170 doubleValue];
  double v115 = v114;
  v169 = [(RTMetric *)self metrics];
  v168 = [v169 objectForKeyedSubscript:@"numberOfInvalidParameterErrors"];
  [v168 doubleValue];
  double v117 = v115 + v116;
  v167 = [(RTMetric *)self metrics];
  v166 = [v167 objectForKeyedSubscript:@"numberOfDistanceCalculatorErrors"];
  [v166 doubleValue];
  double v119 = v117 + v118;
  v165 = [(RTMetric *)self metrics];
  v164 = [v165 objectForKeyedSubscript:@"numberOfFetchRequestErrors"];
  [v164 doubleValue];
  double v121 = v119 + v120;
  v163 = [(RTMetric *)self metrics];
  v122 = [v163 objectForKeyedSubscript:@"numberOfNilVisitMOErrors"];
  [v122 doubleValue];
  double v124 = v121 + v123;
  v125 = [(RTMetric *)self metrics];
  v126 = [v125 objectForKeyedSubscript:@"numberOfNilLOIMOErrors"];
  [v126 doubleValue];
  double v128 = v124 + v127;
  v129 = [(RTMetric *)self metrics];
  v130 = [v129 objectForKeyedSubscript:@"numberOfNilPlaceMOErrors"];
  [v130 doubleValue];
  double v132 = v128 + v131;
  v133 = [(RTMetric *)self metrics];
  v134 = [v133 objectForKeyedSubscript:@"numberOfRevGeoQueryErrors"];
  [v134 doubleValue];
  double v136 = v132 + v135;
  v137 = [(RTMetric *)self metrics];
  v138 = [v137 objectForKeyedSubscript:@"numberOfNoSingularTranstiionErrors"];
  [v138 doubleValue];
  double v140 = v136 + v139;

  v141 = [NSNumber numberWithDouble:v140];
  v142 = [(RTMetric *)self metrics];
  [v142 setObject:v141 forKeyedSubscript:@"totalNumberOfErrors"];

  v143 = NSNumber;
  v144 = [(RTMetric *)self metrics];
  v145 = [v144 objectForKeyedSubscript:@"numberOfStartingVisits"];
  [v145 doubleValue];
  [(RTRelabelerPersisterMetrics *)self safeFraction:v140 denominator:v146];
  v147 = [v143 numberWithDouble:x0];
  v148 = [(RTMetric *)self metrics];
  [v148 setObject:v147 forKeyedSubscript:@"errorRate"];

  v182[0] = @"numberOfUnknownErrors";
  v182[1] = @"numberOfInvalidParameterErrors";
  v182[2] = @"numberOfDistanceCalculatorErrors";
  v182[3] = @"numberOfFetchRequestErrors";
  v182[4] = @"numberOfNilVisitMOErrors";
  v182[5] = @"numberOfNilLOIMOErrors";
  v182[6] = @"numberOfNilPlaceMOErrors";
  v182[7] = @"numberOfRevGeoQueryErrors";
  v182[8] = @"numberOfNoSingularTranstiionErrors";
  v149 = [MEMORY[0x1E4F1C978] arrayWithObjects:v182 count:9];
  v181[0] = @"bucketedPercentageOfUnknownErrors";
  v181[1] = @"bucketedPercentageOfInvalidParameterErrors";
  v181[2] = @"bucketedPercentageOfDistanceCalculatorErrors";
  v181[3] = @"bucketedPercentageOfFetchRequestErrors";
  v181[4] = @"bucketedPercentageOfNilVisitMOErrors";
  v181[5] = @"bucketedPercentageOfNilLOIMOErrors";
  v181[6] = @"bucketedPercentageOfNilPlaceMOErrors";
  v181[7] = @"bucketedPercentageOfRevGeoQueryErrors";
  v181[8] = @"bucketedPercentageOfNoSingularTransitionErrors";
  v150 = [MEMORY[0x1E4F1C978] arrayWithObjects:v181 count:9];
  v151 = [[_RTZip alloc] initWithFirstInput:v149 secondInput:v150];
  v152 = [(_RTZip *)v151 zippedArray];
  [(RTRelabelerPersisterMetrics *)self setBucketedPercentageMetricsWithMappings:v152 sharedDenominator:v179 sharedBins:v140];

  v153 = NSNumber;
  v154 = [(RTMetric *)self metrics];
  v155 = [v154 objectForKeyedSubscript:@"numberOfStartingLOIs"];
  [v155 doubleValue];
  double v157 = v156;
  v158 = [(RTMetric *)self metrics];
  v159 = [v158 objectForKeyedSubscript:@"numberOfStartingLOIs"];
  [v159 doubleValue];
  [(RTRelabelerPersisterMetrics *)self safeFraction:v157 denominator:v160 - v105];
  v161 = [v153 numberWithDouble:x0];
  v162 = [(RTMetric *)self metrics];
  [v162 setObject:v161 forKeyedSubscript:@"visitDensityRatioIncrease"];
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  [(RTRelabelerPersisterMetrics *)self setDerivedMetrics];
  v6.receiver = self;
  v6.super_class = (Class)RTRelabelerPersisterMetrics;
  return [(RTMetric *)&v6 submitMetricsWithError:a3];
}

@end