@interface RTFusionMetrics
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)BOOLeanKeys;
+ (id)bucketedKeys;
+ (id)doubleKeys;
+ (id)integerKeys;
+ (id)supportedMetricKeys;
+ (id)unsignedIntegerKeys;
- (BOOL)submitMetricsWithError:(id *)a3;
- (NSArray)bluePOICandidates;
- (NSArray)learnedPlaceCandidatesExcludingHomeWork;
- (NSArray)learnedPlaceHomeWorkCandidates;
- (NSArray)localHintCandidates;
- (RTFusionMetrics)initWithLoggingEnabled:(BOOL)a3;
- (void)setBluePOICandidates:(id)a3;
- (void)setDerivedMetrics;
- (void)setInputMetrics:(id)a3;
- (void)setLearnedPlaceCandidatesExcludingHomeWork:(id)a3;
- (void)setLearnedPlaceHomeWorkCandidates:(id)a3;
- (void)setLocalHintCandidates:(id)a3;
- (void)setMetricsUsingInputCandidates:(id)a3 outputFusedInferredMapItems:(id)a4 bestFusedInferredMapItem:(id)a5 outputError:(id)a6;
- (void)setOutputMetrics:(id)a3 bestFusedInferredMapItem:(id)a4 outputError:(id)a5;
@end

@implementation RTFusionMetrics

- (RTFusionMetrics)initWithLoggingEnabled:(BOOL)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v61.receiver = self;
  v61.super_class = (Class)RTFusionMetrics;
  v3 = [(RTMetric *)&v61 initWithLoggingEnabled:a3];
  if (v3)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v4 = [(id)objc_opt_class() BOOLeanKeys];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v58;
      uint64_t v8 = MEMORY[0x1E4F1CC28];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v58 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v57 + 1) + 8 * v9);
          v11 = [(RTMetric *)v3 metrics];
          [v11 setObject:v8 forKeyedSubscript:v10];

          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v6);
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v12 = [(id)objc_opt_class() unsignedIntegerKeys];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v54;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v54 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v53 + 1) + 8 * v16);
          v18 = [(RTMetric *)v3 metrics];
          [v18 setObject:&unk_1F3452160 forKeyedSubscript:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v53 objects:v65 count:16];
      }
      while (v14);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v19 = [(id)objc_opt_class() integerKeys];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v64 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v50;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v50 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v49 + 1) + 8 * v23);
          v25 = [(RTMetric *)v3 metrics];
          [v25 setObject:&unk_1F3452178 forKeyedSubscript:v24];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v64 count:16];
      }
      while (v21);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v26 = [(id)objc_opt_class() doubleKeys];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v63 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v46;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v45 + 1) + 8 * v30);
          v32 = [(RTMetric *)v3 metrics];
          [v32 setObject:&unk_1F3453CC8 forKeyedSubscript:v31];

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v63 count:16];
      }
      while (v28);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v33 = [objc_opt_class() bucketedKeys];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v41 objects:v62 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v42;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v42 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v41 + 1) + 8 * v37);
          v39 = [(RTMetric *)v3 metrics];
          [v39 setObject:&unk_1F3453CC8 forKeyedSubscript:v38];

          ++v37;
        }
        while (v35 != v37);
        uint64_t v35 = [v33 countByEnumeratingWithState:&v41 objects:v62 count:16];
      }
      while (v35);
    }
  }
  return v3;
}

+ (id)BOOLeanKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"bestAgreedWithBluePOI", @"bestAgreedWithLocalHint", @"usedAOIBasedOnThreshold", 0];
}

+ (id)unsignedIntegerKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"errorDomain", @"numberOfCandidates", @"numberOfLearnedPlaceKnownTypeCandidates", @"numberOfLearnedPlaceUnknownTypeCandidates", @"numberOfBluePOICandidates", @"numberOfLocalHints", @"numberOfAOICandidates", @"numberOfNonAOICandidates", @"numberOfFusedCandidates", @"fuserAction", 0];
}

+ (id)integerKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"errorCode", 0];
}

+ (id)doubleKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"confidenceOfBest", @"confidenceOfSecondBest", @"logMax2ConfidenceRatio", 0];
}

+ (id)bucketedKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"bucketedNumberOfLearnedPlaceKnownTypeCandidates", @"bucketedNumberOfLearnedPlaceUnknownTypeCandidates", @"bucketedNumberOfBluePOICandidates", @"bucketedNumberOfLocalHints", @"bucketedNumberOfAOICandidates", @"bucketedNumberOfNonAOICandidates", @"bucketedNumberOfFusedCandidates", @"bucketedConfidenceOfBest", @"bucketedConfidenceOfSecondBest", @"bucketedLogMax2ConfidenceRatio", 0];
}

+ (id)supportedMetricKeys
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  v3 = [(id)objc_opt_class() BOOLeanKeys];
  v4 = [v3 allObjects];
  uint64_t v5 = [v2 setWithArray:v4];

  uint64_t v6 = [(id)objc_opt_class() unsignedIntegerKeys];
  uint64_t v7 = [v6 allObjects];
  [v5 addObjectsFromArray:v7];

  uint64_t v8 = [(id)objc_opt_class() integerKeys];
  uint64_t v9 = [v8 allObjects];
  [v5 addObjectsFromArray:v9];

  uint64_t v10 = [(id)objc_opt_class() doubleKeys];
  v11 = [v10 allObjects];
  [v5 addObjectsFromArray:v11];

  v12 = [(id)objc_opt_class() bucketedKeys];
  uint64_t v13 = [v12 allObjects];
  [v5 addObjectsFromArray:v13];

  return v5;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventFusionQuery;
}

- (void)setInputMetrics:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:[v4 count]];
  long long v52 = self;
  uint64_t v6 = [(RTMetric *)self metrics];
  [v6 setObject:v5 forKeyedSubscript:@"numberOfCandidates"];

  long long v57 = [MEMORY[0x1E4F1CA48] array];
  long long v53 = [MEMORY[0x1E4F1CA48] array];
  long long v54 = [MEMORY[0x1E4F1CA48] array];
  long long v55 = [MEMORY[0x1E4F1CA48] array];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (!v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_33;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v58 = *(void *)v60;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v60 != v58) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v59 + 1) + 8 * v11);
      uint64_t v13 = [v12 firstObject];
      if ([v13 source] == 0x4000)
      {

LABEL_9:
        uint64_t v16 = v57;
        goto LABEL_10;
      }
      uint64_t v14 = [v12 firstObject];
      uint64_t v15 = [v14 source];

      if (v15 == 0x80000) {
        goto LABEL_9;
      }
      uint64_t v21 = [v12 firstObject];
      uint64_t v22 = [v21 source];

      if (v22 == 0x2000)
      {
        uint64_t v23 = [v12 secondObject];
        if ([v23 unsignedIntegerValue] == 1)
        {

          goto LABEL_26;
        }
        uint64_t v27 = [v12 secondObject];
        uint64_t v28 = [v27 unsignedIntegerValue];

        if (v28 == 2) {
LABEL_26:
        }
          uint64_t v16 = v55;
        else {
          uint64_t v16 = v54;
        }
LABEL_10:
        [(NSArray *)v16 addObject:v12];
        goto LABEL_11;
      }
      uint64_t v24 = [v12 firstObject];
      if (![v24 source]) {
        goto LABEL_24;
      }
      v25 = [v12 firstObject];
      if ([v25 source] == 1) {
        goto LABEL_23;
      }
      v26 = [v12 firstObject];
      if ([v26 source] == 0x40000)
      {

LABEL_23:
LABEL_24:

        goto LABEL_11;
      }
      uint64_t v29 = [v12 firstObject];
      uint64_t v30 = [v29 source];

      if (v30 != 2)
      {
        uint64_t v16 = v53;
        goto LABEL_10;
      }
LABEL_11:
      uint64_t v17 = [v12 firstObject];
      v18 = [v17 mapItem];
      v19 = [v18 extendedAttributes];
      uint64_t v20 = [v19 wifiFingerprintLabelType];

      if (v20 == 2) {
        ++v10;
      }
      else {
        ++v9;
      }
      ++v11;
    }
    while (v8 != v11);
    uint64_t v31 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
    uint64_t v8 = v31;
  }
  while (v31);
LABEL_33:

  bluePOICandidates = v52->_bluePOICandidates;
  v52->_bluePOICandidates = v57;
  v33 = v57;

  localHintCandidates = v52->_localHintCandidates;
  v52->_localHintCandidates = v53;
  uint64_t v35 = v53;

  learnedPlaceCandidatesExcludingHomeWork = v52->_learnedPlaceCandidatesExcludingHomeWork;
  v52->_learnedPlaceCandidatesExcludingHomeWork = v54;
  uint64_t v37 = v54;

  learnedPlaceHomeWorkCandidates = v52->_learnedPlaceHomeWorkCandidates;
  v52->_learnedPlaceHomeWorkCandidates = v55;
  v39 = v55;

  v40 = [NSNumber numberWithUnsignedInteger:-[NSArray count](v33, "count")];
  long long v41 = [(RTMetric *)v52 metrics];
  [v41 setObject:v40 forKeyedSubscript:@"numberOfBluePOICandidates"];

  long long v42 = [[NSNumber numberWithUnsignedInteger:-[NSArray count](v35, "count")];
  long long v43 = [(RTMetric *)v52 metrics];
  [v43 setObject:v42 forKeyedSubscript:@"numberOfLocalHints"];

  long long v44 = [[NSNumber numberWithUnsignedInteger:-[NSArray count](v37, "count")];
  long long v45 = [(RTMetric *)v52 metrics];
  [v45 setObject:v44 forKeyedSubscript:@"numberOfLearnedPlaceUnknownTypeCandidates"];

  long long v46 = [[NSNumber numberWithUnsignedInteger:-[NSArray count](v39, "count")];
  long long v47 = [(RTMetric *)v52 metrics];
  [v47 setObject:v46 forKeyedSubscript:@"numberOfLearnedPlaceKnownTypeCandidates"];

  long long v48 = [NSNumber numberWithUnsignedInteger:v10];
  long long v49 = [(RTMetric *)v52 metrics];
  [v49 setObject:v48 forKeyedSubscript:@"numberOfAOICandidates"];

  long long v50 = [NSNumber numberWithUnsignedInteger:v9];

  long long v51 = [(RTMetric *)v52 metrics];
  [v51 setObject:v50 forKeyedSubscript:@"numberOfNonAOICandidates"];
}

- (void)setOutputMetrics:(id)a3 bestFusedInferredMapItem:(id)a4 outputError:(id)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = 0x1E4F28000uLL;
  if (v10)
  {
    v12 = [(RTMetric *)self metrics];
    [v12 setObject:&unk_1F3452190 forKeyedSubscript:@"fuserAction"];

    uint64_t v13 = [v10 domain];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4F5CFE8]];

    if (v14)
    {
      uint64_t v15 = [(RTMetric *)self metrics];
      uint64_t v16 = v15;
      uint64_t v17 = &unk_1F34521A8;
    }
    else
    {
      v25 = [v10 domain];
      int v26 = [v25 isEqualToString:@"RTInferredMapItemFuserErrorDomain"];

      uint64_t v15 = [(RTMetric *)self metrics];
      uint64_t v16 = v15;
      if (v26) {
        uint64_t v17 = &unk_1F34521C0;
      }
      else {
        uint64_t v17 = &unk_1F3452190;
      }
    }
    [v15 setObject:v17 forKeyedSubscript:@"errorDomain"];

    uint64_t v27 = [NSNumber numberWithInteger:[v10 code]];
    uint64_t v28 = [(RTMetric *)self metrics];
    [v28 setObject:v27 forKeyedSubscript:@"errorCode"];

    goto LABEL_63;
  }
  if (!v9)
  {
    uint64_t v22 = [(RTMetric *)self metrics];
    uint64_t v23 = v22;
    uint64_t v24 = &unk_1F34521A8;
    goto LABEL_18;
  }
  v18 = [v9 mapItem];

  if (!v18)
  {
    uint64_t v22 = [(RTMetric *)self metrics];
    uint64_t v23 = v22;
    uint64_t v24 = &unk_1F34521C0;
    goto LABEL_18;
  }
  v19 = [v9 mapItem];
  uint64_t v20 = [v19 extendedAttributes];
  uint64_t v21 = [v20 wifiFingerprintLabelType];

  switch(v21)
  {
    case 2:
      uint64_t v22 = [(RTMetric *)self metrics];
      uint64_t v23 = v22;
      uint64_t v24 = &unk_1F3452208;
      goto LABEL_18;
    case 1:
      uint64_t v22 = [(RTMetric *)self metrics];
      uint64_t v23 = v22;
      uint64_t v24 = &unk_1F34521F0;
      goto LABEL_18;
    case 0:
      uint64_t v22 = [(RTMetric *)self metrics];
      uint64_t v23 = v22;
      uint64_t v24 = &unk_1F34521D8;
LABEL_18:
      [v22 setObject:v24 forKeyedSubscript:@"fuserAction"];

      break;
  }
  uint64_t v29 = [NSNumber numberWithUnsignedInteger:[v8 count]];
  uint64_t v30 = [(RTMetric *)self metrics];
  [v30 setObject:v29 forKeyedSubscript:@"numberOfFusedCandidates"];

  uint64_t v31 = [v9 mapItem];

  if (v31)
  {
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    v32 = self->_bluePOICandidates;
    uint64_t v31 = [(NSArray *)v32 countByEnumeratingWithState:&v87 objects:v92 count:16];
    id v82 = v8;
    if (v31)
    {
      uint64_t v33 = *(void *)v88;
      while (2)
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v88 != v33) {
            objc_enumerationMutation(v32);
          }
          uint64_t v35 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          uint64_t v36 = [v9 mapItem];
          uint64_t v37 = [v35 firstObject];
          uint64_t v38 = [v37 mapItem];
          char v39 = [v36 isEqualToMapItem:v38];

          if (v39)
          {
            uint64_t v31 = 1;
            goto LABEL_30;
          }
        }
        uint64_t v31 = [(NSArray *)v32 countByEnumeratingWithState:&v87 objects:v92 count:16];
        if (v31) {
          continue;
        }
        break;
      }
LABEL_30:
      id v10 = 0;
      id v8 = v82;
      unint64_t v11 = 0x1E4F28000;
    }

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v40 = self->_localHintCandidates;
    uint64_t v41 = [(NSArray *)v40 countByEnumeratingWithState:&v83 objects:v91 count:16];
    if (v41)
    {
      unsigned int v81 = v31;
      uint64_t v42 = *(void *)v84;
      while (2)
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v84 != v42) {
            objc_enumerationMutation(v40);
          }
          long long v44 = *(void **)(*((void *)&v83 + 1) + 8 * j);
          long long v45 = [v9 mapItem];
          long long v46 = [v44 firstObject];
          long long v47 = [v46 mapItem];
          char v48 = [v45 isEqualToMapItem:v47];

          if (v48)
          {
            uint64_t v41 = 1;
            goto LABEL_41;
          }
        }
        uint64_t v41 = [(NSArray *)v40 countByEnumeratingWithState:&v83 objects:v91 count:16];
        if (v41) {
          continue;
        }
        break;
      }
LABEL_41:
      id v10 = 0;
      id v8 = v82;
      unint64_t v11 = 0x1E4F28000;
      uint64_t v31 = v81;
    }
  }
  else
  {
    uint64_t v41 = 0;
  }
  long long v49 = [*(id *)(v11 + 3792) numberWithBool:v31];
  long long v50 = [(RTMetric *)self metrics];
  [v50 setObject:v49 forKeyedSubscript:@"bestAgreedWithBluePOI"];

  long long v51 = [*(id *)(v11 + 3792) numberWithBool:v41];
  long long v52 = [(RTMetric *)self metrics];
  [v52 setObject:v51 forKeyedSubscript:@"bestAgreedWithLocalHint"];

  long long v53 = [v8 firstObject];
  if (v53)
  {
    long long v54 = *(void **)(v11 + 3792);
    long long v52 = [v8 firstObject];
    [v52 confidence];
    long long v55 = [v54 numberWithDouble:x0];
  }
  else
  {
    long long v55 = &unk_1F3453CC8;
  }
  long long v56 = [(RTMetric *)self metrics];
  [v56 setObject:v55 forKeyedSubscript:@"confidenceOfBest"];

  if (v53)
  {
  }
  unint64_t v57 = [v8 count];
  if (v57 < 2)
  {
    long long v59 = &unk_1F3453CC8;
  }
  else
  {
    uint64_t v58 = *(void **)(v11 + 3792);
    long long v52 = [v8 objectAtIndexedSubscript:1];
    [v52 confidence];
    long long v59 = [v58 numberWithDouble:];
  }
  long long v60 = [(RTMetric *)self metrics];
  [v60 setObject:v59 forKeyedSubscript:@"confidenceOfSecondBest"];

  if (v57 >= 2)
  {
  }
  uint64_t v27 = [v8 firstObject];
  if (v27)
  {
    uint64_t v61 = [v9 mapItem];
    if (v61)
    {
      long long v62 = (void *)v61;
      v63 = [v9 mapItem];
      uint64_t v64 = [v63 extendedAttributes];
      uint64_t v65 = [v64 wifiFingerprintLabelType];

      if (v65 == 2)
      {
        v66 = [v8 firstObject];
        uint64_t v67 = [v66 mapItem];

        if (v67)
        {
          v68 = *(void **)(v11 + 3792);
          v69 = [v9 mapItem];
          v70 = [v27 mapItem];
          v71 = [v68 numberWithInt:[v69 isEqualToMapItem:v70] ^ 1];
          v72 = [(RTMetric *)self metrics];
          [v72 setObject:v71 forKeyedSubscript:@"usedAOIBasedOnThreshold"];
        }
        else
        {
          v69 = [(RTMetric *)self metrics];
          [v69 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"usedAOIBasedOnThreshold"];
        }
      }
    }
  }
  if ((unint64_t)[v8 count] >= 2)
  {
    v73 = *(void **)(v11 + 3792);
    v74 = [v8 objectAtIndexedSubscript:0];
    [v74 confidence];
    RTCommonSafeLog();
    double v76 = v75;
    v77 = [v8 objectAtIndexedSubscript:1];
    [v77 confidence];
    RTCommonSafeLog();
    v79 = [v73 numberWithDouble:v76 - v78];
    v80 = [(RTMetric *)self metrics];
    [v80 setObject:v79 forKeyedSubscript:@"logMax2ConfidenceRatio"];
  }
LABEL_63:
}

- (void)setMetricsUsingInputCandidates:(id)a3 outputFusedInferredMapItems:(id)a4 bestFusedInferredMapItem:(id)a5 outputError:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  [(RTFusionMetrics *)self setInputMetrics:a3];
  [(RTFusionMetrics *)self setOutputMetrics:v12 bestFusedInferredMapItem:v11 outputError:v10];
}

- (void)setDerivedMetrics
{
  id v39 = +[RTMetric binsFromStart:&unk_1F3453CD8 toEnd:&unk_1F3453CE8 gap:&unk_1F3453CF8];
  v3 = [(RTMetric *)self metrics];
  id v4 = [v3 objectForKeyedSubscript:@"numberOfLearnedPlaceKnownTypeCandidates"];
  uint64_t v5 = +[RTMetric binForNumber:v4 bins:&unk_1F3453390];
  uint64_t v6 = [(RTMetric *)self metrics];
  [v6 setObject:v5 forKeyedSubscript:@"bucketedNumberOfLearnedPlaceKnownTypeCandidates"];

  uint64_t v7 = [(RTMetric *)self metrics];
  id v8 = [v7 objectForKeyedSubscript:@"numberOfLearnedPlaceUnknownTypeCandidates"];
  id v9 = +[RTMetric binForNumber:v8 bins:&unk_1F3453390];
  id v10 = [(RTMetric *)self metrics];
  [v10 setObject:v9 forKeyedSubscript:@"bucketedNumberOfLearnedPlaceUnknownTypeCandidates"];

  id v11 = [(RTMetric *)self metrics];
  id v12 = [v11 objectForKeyedSubscript:@"numberOfLocalHints"];
  uint64_t v13 = +[RTMetric binForNumber:v12 bins:&unk_1F3453390];
  int v14 = [(RTMetric *)self metrics];
  [v14 setObject:v13 forKeyedSubscript:@"bucketedNumberOfLocalHints"];

  uint64_t v15 = [(RTMetric *)self metrics];
  uint64_t v16 = [v15 objectForKeyedSubscript:@"numberOfAOICandidates"];
  uint64_t v17 = +[RTMetric binForNumber:v16 bins:&unk_1F3453390];
  v18 = [(RTMetric *)self metrics];
  [v18 setObject:v17 forKeyedSubscript:@"bucketedNumberOfAOICandidates"];

  v19 = [(RTMetric *)self metrics];
  uint64_t v20 = [v19 objectForKeyedSubscript:@"numberOfNonAOICandidates"];
  uint64_t v21 = +[RTMetric binForNumber:v20 bins:&unk_1F3453390];
  uint64_t v22 = [(RTMetric *)self metrics];
  [v22 setObject:v21 forKeyedSubscript:@"bucketedNumberOfNonAOICandidates"];

  uint64_t v23 = [(RTMetric *)self metrics];
  uint64_t v24 = [v23 objectForKeyedSubscript:@"numberOfFusedCandidates"];
  v25 = +[RTMetric binForNumber:v24 bins:&unk_1F3453390];
  int v26 = [(RTMetric *)self metrics];
  [v26 setObject:v25 forKeyedSubscript:@"bucketedNumberOfFusedCandidates"];

  uint64_t v27 = [(RTMetric *)self metrics];
  uint64_t v28 = [v27 objectForKeyedSubscript:@"confidenceOfBest"];
  uint64_t v29 = +[RTMetric binForNumber:v28 bins:v39];
  uint64_t v30 = [(RTMetric *)self metrics];
  [v30 setObject:v29 forKeyedSubscript:@"bucketedConfidenceOfBest"];

  uint64_t v31 = [(RTMetric *)self metrics];
  v32 = [v31 objectForKeyedSubscript:@"confidenceOfSecondBest"];
  uint64_t v33 = +[RTMetric binForNumber:v32 bins:v39];
  uint64_t v34 = [(RTMetric *)self metrics];
  [v34 setObject:v33 forKeyedSubscript:@"bucketedConfidenceOfSecondBest"];

  uint64_t v35 = [(RTMetric *)self metrics];
  uint64_t v36 = [v35 objectForKeyedSubscript:@"logMax2ConfidenceRatio"];
  uint64_t v37 = +[RTMetric binForNumber:v36 bins:&unk_1F34533A8];
  uint64_t v38 = [(RTMetric *)self metrics];
  [v38 setObject:v37 forKeyedSubscript:@"bucketedLogMax2ConfidenceRatio"];
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  [(RTFusionMetrics *)self setDerivedMetrics];
  v6.receiver = self;
  v6.super_class = (Class)RTFusionMetrics;
  return [(RTMetric *)&v6 submitMetricsWithError:a3];
}

- (NSArray)bluePOICandidates
{
  return self->_bluePOICandidates;
}

- (void)setBluePOICandidates:(id)a3
{
}

- (NSArray)localHintCandidates
{
  return self->_localHintCandidates;
}

- (void)setLocalHintCandidates:(id)a3
{
}

- (NSArray)learnedPlaceCandidatesExcludingHomeWork
{
  return self->_learnedPlaceCandidatesExcludingHomeWork;
}

- (void)setLearnedPlaceCandidatesExcludingHomeWork:(id)a3
{
}

- (NSArray)learnedPlaceHomeWorkCandidates
{
  return self->_learnedPlaceHomeWorkCandidates;
}

- (void)setLearnedPlaceHomeWorkCandidates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnedPlaceHomeWorkCandidates, 0);
  objc_storeStrong((id *)&self->_learnedPlaceCandidatesExcludingHomeWork, 0);
  objc_storeStrong((id *)&self->_localHintCandidates, 0);

  objc_storeStrong((id *)&self->_bluePOICandidates, 0);
}

@end