@interface NTPBPersonalizationAggregateDelta(FCAdditions)
- (uint64_t)addAction:()FCAdditions count:;
- (uint64_t)applyToAggregate:()FCAdditions withTreatment:;
- (void)applyToDelta:()FCAdditions;
@end

@implementation NTPBPersonalizationAggregateDelta(FCAdditions)

- (uint64_t)addAction:()FCAdditions count:
{
  uint64_t v7 = [a1 eventsCount];
  uint64_t result = [a1 events];
  if (v7 && (unsigned int v9 = *(_DWORD *)(result + 4 * (v7 - 1)), (v9 & 0x3F) == a3))
  {
    *(_DWORD *)(result + 4 * (v7 - 1)) = a3 | ((a4 + (v9 >> 6)) << 6);
  }
  else
  {
    return [a1 addEvents:a3 | (a4 << 6)];
  }
  return result;
}

- (uint64_t)applyToAggregate:()FCAdditions withTreatment:
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v60 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "treatment");
    *(_DWORD *)buf = 136315906;
    v73 = "-[NTPBPersonalizationAggregateDelta(FCAdditions) applyToAggregate:withTreatment:]";
    __int16 v74 = 2080;
    v75 = "NTPBPersonalizationAggregateDelta+FCAdditions.m";
    __int16 v76 = 1024;
    *(_DWORD *)v77 = 42;
    *(_WORD *)&v77[4] = 2114;
    *(void *)&v77[6] = v60;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v8 = [v6 featureKey];
  int v9 = [v8 isEqualToString:@"f0"];

  if (![v6 eventCount])
  {
    [a1 defaultClicks];
    objc_msgSend(v6, "setClicks:");
    [a1 defaultImpressions];
    objc_msgSend(v6, "setImpressions:");
  }
  if (v9)
  {
    os_log_t v69 = (os_log_t)[v7 baselineClicksByAction];
    uint64_t v10 = [v7 baselineImpressionsByAction];
  }
  else
  {
    os_log_t v69 = (os_log_t)[v7 featureClicksByAction];
    uint64_t v10 = [v7 featureImpressionsByAction];
  }
  uint64_t v11 = v10;
  [v6 clicks];
  double v13 = v12;
  [v6 impressions];
  double v15 = v14;
  uint64_t v71 = [v6 eventCount];
  uint64_t v16 = [a1 events];
  [a1 impressionBias];
  if (v17 == 0.0) {
    double v18 = 1.0;
  }
  else {
    double v18 = v17;
  }
  [a1 groupBias];
  double v20 = v19;
  v21 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v48 = v21;
    v49 = [v6 featureKey];
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "eventsCount"));
    v50 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v73 = v49;
    __int16 v74 = 2112;
    v75 = v50;
    _os_log_debug_impl(&dword_1A460D000, v48, OS_LOG_TYPE_DEBUG, "%@ - Applying %@ events to aggregate", buf, 0x16u);
  }
  v65 = v6;
  v62 = a1;
  uint64_t v22 = [a1 eventsCount];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    double v66 = v20;
    double v67 = v18;
    uint64_t v61 = v11;
    do
    {
      unint64_t v26 = *(unsigned int *)(v16 + 4 * v25);
      double v27 = v20 * *(double *)&v69[v26 & 0x3F].isa;
      double v28 = v20 * (v18 * *(double *)(v11 + 8 * (v26 & 0x3F)));
      v29 = (void *)FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
      {
        log = v29;
        v42 = [v65 featureKey];
        NSStringFromFCPersonalizationAction(v26 & 0x3F);
        v63 = (char *)objc_claimAutoreleasedReturnValue();
        v43 = [NSNumber numberWithDouble:v27];
        [NSNumber numberWithDouble:v28];
        v45 = uint64_t v44 = v24;
        *(_DWORD *)buf = 138413058;
        v73 = v42;
        __int16 v74 = 2112;
        v75 = v63;
        __int16 v76 = 2112;
        *(void *)v77 = v43;
        *(_WORD *)&v77[8] = 2112;
        *(void *)&v77[10] = v45;
        _os_log_debug_impl(&dword_1A460D000, log, OS_LOG_TYPE_DEBUG, "%@ - Applying action %@ C : %@, I : %@", buf, 0x2Au);

        uint64_t v24 = v44;
        uint64_t v11 = v61;
      }
      if (v27 != 0.0 || v28 != 0.0)
      {
        unint64_t v30 = v26 >> 6;
        if (v26 >= 0x40)
        {
          if (v30 <= 1) {
            uint64_t v31 = 1;
          }
          else {
            uint64_t v31 = v26 >> 6;
          }
          do
          {
            v32 = [v7 defaultScoringConfig];
            [v32 decayFactor];
            long double v34 = v33;
            double v35 = v27;
            if (v33 != 1.0) {
              double v35 = (1.0 - pow(v33, v27)) / (1.0 - v33);
            }
            double v36 = pow(v34, v28);

            v37 = [v7 defaultScoringConfig];
            [v37 decayFactor];
            double v39 = v38;
            double v40 = pow(v38, v28);
            double v41 = v28;
            if (v39 != 1.0) {
              double v41 = (1.0 - v40) / (1.0 - v39);
            }
            double v13 = v35 + v13 * v36;
            double v15 = v41 + v15 * v40;

            --v31;
          }
          while (v31);
        }
        v71 += v30;
        uint64_t v24 = 1;
        double v20 = v66;
        double v18 = v67;
      }
      ++v25;
    }
    while (v25 != v23);
  }
  else
  {
    LOBYTE(v24) = 0;
  }
  v46 = (void *)FCProgressivePersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v70 = v46;
    v68 = [v65 featureKey];
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v62, "timestamp"));
    v51 = (char *)objc_claimAutoreleasedReturnValue();
    v52 = NSNumber;
    [v65 clicks];
    v53 = objc_msgSend(v52, "numberWithDouble:");
    v54 = NSNumber;
    [v65 impressions];
    v55 = objc_msgSend(v54, "numberWithDouble:");
    v56 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v65, "eventCount"));
    v57 = [NSNumber numberWithDouble:v13];
    v58 = [NSNumber numberWithDouble:v15];
    v59 = [NSNumber numberWithUnsignedLongLong:v71];
    *(_DWORD *)buf = 138414082;
    v73 = v68;
    __int16 v74 = 2112;
    v75 = v51;
    __int16 v76 = 2112;
    *(void *)v77 = v53;
    *(_WORD *)&v77[8] = 2112;
    *(void *)&v77[10] = v55;
    __int16 v78 = 2112;
    v79 = v56;
    __int16 v80 = 2112;
    v81 = v57;
    __int16 v82 = 2112;
    v83 = v58;
    __int16 v84 = 2112;
    v85 = v59;
    _os_log_debug_impl(&dword_1A460D000, v70, OS_LOG_TYPE_DEBUG, "%@ - Updating aggregate at %@ from C : %@ I : %@ EC : %@ to C : %@ I : %@ EC : %@", buf, 0x52u);
  }
  [v65 setClicks:v13];
  [v65 setImpressions:v15];
  [v65 setEventCount:v71];
  objc_msgSend(v65, "setTimestamp:", objc_msgSend(v62, "timestamp"));

  return v24 & 1;
}

- (void)applyToDelta:()FCAdditions
{
  id v8 = a3;
  if (![v8 eventsCount])
  {
    [a1 defaultClicks];
    objc_msgSend(v8, "setDefaultClicks:");
    [a1 defaultImpressions];
    objc_msgSend(v8, "setDefaultImpressions:");
    [a1 impressionBias];
    objc_msgSend(v8, "setImpressionBias:");
    [a1 groupBias];
    objc_msgSend(v8, "setGroupBias:");
  }
  v4 = (unsigned int *)[a1 events];
  uint64_t v5 = [a1 eventsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      unsigned int v7 = *v4++;
      [v8 addAction:v7 & 0x3F count:(unint64_t)v7 >> 6];
      --v6;
    }
    while (v6);
  }
  objc_msgSend(v8, "setTimestamp:", objc_msgSend(a1, "timestamp"));
}

@end