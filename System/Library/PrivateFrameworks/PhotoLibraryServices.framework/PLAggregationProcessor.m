@interface PLAggregationProcessor
+ (BOOL)isEnabled;
+ (BOOL)requireContiguousAggregation;
+ (BOOL)requireStartAtFirstDayOfWeek;
+ (BOOL)shouldAggregateMoment:(id)a3 numberOfAssetsEligibleForCuration:(unint64_t *)a4;
+ (NSDate)allowedStartDateToAggregate;
+ (double)timeIntervalOfRecentContentToIgnore;
+ (unint64_t)maximumNumberOfAssetsPerAggregation;
+ (unint64_t)maximumNumberOfAssetsPerMoment;
+ (unint64_t)maximumNumberOfAssetsPerShortMoment;
+ (unint64_t)maximumNumberOfDaysPerAggregation;
+ (void)initialize;
+ (void)restoreDefaultEnablement;
+ (void)setEnabled:(BOOL)a3;
- (NSCalendar)calendar;
- (NSMutableDictionary)curatedAssetCountByMomentUUID;
- (PLAggregationProcessor)init;
- (id)_aggregationMomentClustersForMomentClusters:(id)a3;
- (id)processAggregationsWithSortedMomentClusters:(id)a3 momentsContainedInOtherHighlights:(id)a4 progressBlock:(id)a5;
- (id)sortedNeighborMomentClustersOfMomentClusters:(id)a3 forAllMomentClusters:(id)a4;
- (void)setCalendar:(id)a3;
- (void)setCuratedAssetCountByMomentUUID:(id)a3;
@end

@implementation PLAggregationProcessor

+ (BOOL)shouldAggregateMoment:(id)a3 numberOfAssetsEligibleForCuration:(unint64_t *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = +[PLAggregationProcessor maximumNumberOfAssetsPerMoment];
  unint64_t v6 = +[PLAggregationProcessor maximumNumberOfAssetsPerShortMoment];
  unint64_t v7 = v6;
  long long v25 = 0u;
  long long v26 = 0u;
  if (v5 <= v6) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = v5;
  }
  long long v27 = 0uLL;
  long long v28 = 0uLL;
  v9 = [v4 assets];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v26;
LABEL_6:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(v9);
      }
      if (+[PLPhotosHighlightGenerator assetEligibleForCuration:*(void *)(*((void *)&v25 + 1) + 8 * v14)])
      {
        if (++v12 > v8) {
          break;
        }
      }
      if (v11 == ++v14)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
  else
  {
    unint64_t v12 = 0;
  }

  id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
  v16 = [v4 startDate];
  v17 = [v4 endDate];
  v18 = (void *)[v15 initWithStartDate:v16 endDate:v17];

  [v18 duration];
  BOOL v21 = v19 <= 120.0 && v12 <= v7;
  BOOL v22 = v12 <= v5 || v21;
  if (a4) {
    *a4 = v12;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedAssetCountByMomentUUID, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (void)setCuratedAssetCountByMomentUUID:(id)a3
{
}

- (NSMutableDictionary)curatedAssetCountByMomentUUID
{
  return self->_curatedAssetCountByMomentUUID;
}

- (void)setCalendar:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (id)_aggregationMomentClustersForMomentClusters:(id)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v5 localStartDate];

  unint64_t v7 = [v4 lastObject];
  uint64_t v8 = [v7 localEndDate];

  v63 = (void *)v8;
  v64 = (void *)v6;
  v62 = [(NSCalendar *)self->_calendar components:16 fromDate:v6 toDate:v8 options:0];
  unint64_t v78 = [v62 day];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v100 objects:v109 count:16];
  v77 = v9;
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = 0;
    uint64_t v80 = *(void *)v101;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v101 != v80) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v100 + 1) + 8 * i);
        long long v96 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        id v15 = [v14 moments];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v96 objects:v108 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v97;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v97 != v18) {
                objc_enumerationMutation(v15);
              }
              curatedAssetCountByMomentUUID = self->_curatedAssetCountByMomentUUID;
              BOOL v21 = [*(id *)(*((void *)&v96 + 1) + 8 * j) uuid];
              BOOL v22 = [(NSMutableDictionary *)curatedAssetCountByMomentUUID objectForKeyedSubscript:v21];
              v12 += [v22 unsignedIntegerValue];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v96 objects:v108 count:16];
          }
          while (v17);
        }

        id v9 = v77;
      }
      uint64_t v11 = [v77 countByEnumeratingWithState:&v100 objects:v109 count:16];
    }
    while (v11);
  }
  else
  {
    unint64_t v12 = 0;
  }

  unint64_t v23 = [(id)objc_opt_class() maximumNumberOfDaysPerAggregation];
  unint64_t v24 = [(id)objc_opt_class() maximumNumberOfAssetsPerAggregation];
  unint64_t v25 = vcvtpd_u64_f64((double)v78 / (double)v23);
  unint64_t v26 = vcvtpd_u64_f64((double)v12 / (double)v24);
  if (v25 <= v26) {
    unint64_t v27 = v26;
  }
  else {
    unint64_t v27 = v25;
  }
  unint64_t v66 = v27 - 1;
  if (v27 == 1)
  {
    id v28 = [MEMORY[0x1E4F1CA48] array];
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v29 = v9;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v92 objects:v107 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v93;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v93 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [*(id *)(*((void *)&v92 + 1) + 8 * k) moments];
          [v28 addObjectsFromArray:v34];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v92 objects:v107 count:16];
      }
      while (v31);
    }

    v35 = [[PLMomentCluster alloc] initWithMoments:v28];
    v106 = v35;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
  }
  else
  {
    if (v78 <= v23) {
      unint64_t v37 = v23;
    }
    else {
      unint64_t v37 = v78;
    }
    if (v12 <= v24) {
      unint64_t v38 = v24;
    }
    else {
      unint64_t v38 = v12;
    }
    v39 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v27];
    v35 = [MEMORY[0x1E4F1CA48] array];
    id v40 = v64;
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __70__PLAggregationProcessor__aggregationMomentClustersForMomentClusters___block_invoke;
    v90[3] = &unk_1E586AA58;
    id v65 = v39;
    id v91 = v65;
    v41 = (void (**)(void, void))MEMORY[0x19F38D650](v90);
    v72 = [v9 lastObject];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    obuint64_t j = v9;
    uint64_t v73 = [obj countByEnumeratingWithState:&v86 objects:v105 count:16];
    if (v73)
    {
      uint64_t v76 = 0;
      unint64_t v68 = vcvtpd_u64_f64((double)v38 / (double)v27);
      unint64_t v69 = vcvtpd_u64_f64((double)v37 / (double)v27);
      uint64_t v70 = *(void *)v87;
      v71 = v41;
      v42 = v40;
      do
      {
        uint64_t v43 = 0;
        v44 = v42;
        do
        {
          v79 = v44;
          if (*(void *)v87 != v70) {
            objc_enumerationMutation(obj);
          }
          v74 = v40;
          v75 = v35;
          v45 = *(void **)(*((void *)&v86 + 1) + 8 * v43);
          v81 = [v45 localStartDate];
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          v46 = [v45 moments];
          uint64_t v47 = [v46 countByEnumeratingWithState:&v82 objects:v104 count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            uint64_t v49 = 0;
            uint64_t v50 = *(void *)v83;
            do
            {
              for (uint64_t m = 0; m != v48; ++m)
              {
                if (*(void *)v83 != v50) {
                  objc_enumerationMutation(v46);
                }
                v52 = self->_curatedAssetCountByMomentUUID;
                v53 = [*(id *)(*((void *)&v82 + 1) + 8 * m) uuid];
                v54 = [(NSMutableDictionary *)v52 objectForKeyedSubscript:v53];
                v49 += [v54 unsignedIntegerValue];
              }
              uint64_t v48 = [v46 countByEnumeratingWithState:&v82 objects:v104 count:16];
            }
            while (v48);
          }
          else
          {
            uint64_t v49 = 0;
          }

          id v40 = v74;
          v42 = v81;
          v55 = [(NSCalendar *)self->_calendar components:16 fromDate:v74 toDate:v81 options:0];
          unint64_t v56 = [v55 day];
          v57 = v79;
          if (v45 == v72
            || (v56 <= v69 ? (BOOL v58 = v49 + v76 > v68) : (BOOL v58 = 1),
                !v58
             || [(NSCalendar *)self->_calendar isDate:v81 inSameDayAsDate:v79]
             || [v65 count] == v66))
          {
            v76 += v49;
            v35 = v75;
            [(PLMomentCluster *)v75 addObject:v45];
            v41 = v71;
          }
          else
          {
            ((void (**)(void, PLMomentCluster *))v71)[2](v71, v75);
            v35 = [MEMORY[0x1E4F1CA48] arrayWithObject:v45];

            v41 = v71;
            id v59 = v81;

            id v40 = v59;
            v57 = v79;
            v42 = v81;
            uint64_t v76 = v49;
          }

          ++v43;
          v44 = v42;
        }
        while (v43 != v73);
        uint64_t v60 = [obj countByEnumeratingWithState:&v86 objects:v105 count:16];
        uint64_t v73 = v60;
      }
      while (v60);
    }
    else
    {
      v42 = v40;
    }

    ((void (**)(void, PLMomentCluster *))v41)[2](v41, v35);
    id v28 = v65;

    v36 = v28;
  }

  return v36;
}

void __70__PLAggregationProcessor__aggregationMomentClustersForMomentClusters___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((unint64_t)[v4 count] >= 2)
  {
    v3 = [[PLMomentCluster alloc] initWithMomentClusters:v4];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)processAggregationsWithSortedMomentClusters:(id)a3 momentsContainedInOtherHighlights:(id)a4 progressBlock:(id)a5
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v85 = a4;
  id v9 = a5;
  if ([v8 count])
  {
    id v69 = v9;
    uint64_t v76 = (void (**)(void, void, double))MEMORY[0x19F38D650](v9);
    unint64_t v68 = [MEMORY[0x1E4F1C978] array];
    PLMomentGenerationGetLog();
    uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    unint64_t v12 = v10;
    uint64_t v13 = v12;
    unint64_t v66 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "AggregationsProcessing", "", buf, 2u);
    }
    os_signpost_id_t spid = v11;
    v71 = v13;

    uint64_t v65 = mach_absolute_time();
    unint64_t v67 = [v8 count];
    uint64_t v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v15 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
    v75 = v14;
    [v14 setTimeZone:v15];

    long long v86 = [(id)objc_opt_class() allowedStartDateToAggregate];
    v77 = [MEMORY[0x1E4F1CA80] set];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v70 = v8;
    obuint64_t j = v8;
    uint64_t v83 = [obj countByEnumeratingWithState:&v96 objects:v108 count:16];
    if (v83)
    {
      uint64_t v81 = *(void *)v97;
      do
      {
        for (uint64_t i = 0; i != v83; ++i)
        {
          if (*(void *)v97 != v81) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v96 + 1) + 8 * i);
          uint64_t v18 = [v17 moments];
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          id v19 = v18;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v92 objects:v107 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v93;
            uint64_t v80 = v17;
            while (2)
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v93 != v22) {
                  objc_enumerationMutation(v19);
                }
                unint64_t v24 = *(void **)(*((void *)&v92 + 1) + 8 * j);
                unint64_t v25 = (void *)MEMORY[0x19F38D3B0]();
                *(void *)buf = 0;
                unint64_t v26 = objc_msgSend(v24, "pl_startDate");
                if ([v26 compare:v86] == 1 || objc_msgSend(v85, "containsObject:", v24))
                {

LABEL_22:

                  goto LABEL_23;
                }
                int v27 = [(id)objc_opt_class() shouldAggregateMoment:v24 numberOfAssetsEligibleForCuration:buf];

                if (!v27) {
                  goto LABEL_22;
                }
                id v28 = [NSNumber numberWithUnsignedInteger:*(void *)buf];
                curatedAssetCountByMomentUUID = self->_curatedAssetCountByMomentUUID;
                uint64_t v30 = [v24 uuid];
                [(NSMutableDictionary *)curatedAssetCountByMomentUUID setObject:v28 forKeyedSubscript:v30];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v92 objects:v107 count:16];
              uint64_t v17 = v80;
              if (v21) {
                continue;
              }
              break;
            }
          }

          [v77 addObject:v17];
LABEL_23:
        }
        uint64_t v83 = [obj countByEnumeratingWithState:&v96 objects:v108 count:16];
      }
      while (v83);
    }

    v72 = [MEMORY[0x1E4F1CA48] array];
    char v73 = [(id)objc_opt_class() requireContiguousAggregation];
    int v82 = [(id)objc_opt_class() requireStartAtFirstDayOfWeek];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v31 = obj;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v88 objects:v106 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      v74 = 0;
      v34 = 0;
      v35 = 0;
      uint64_t v84 = *(void *)v89;
      obja = 0;
      double v36 = 0.0;
LABEL_27:
      uint64_t v37 = 0;
      while (1)
      {
        if (*(void *)v89 != v84) {
          objc_enumerationMutation(v31);
        }
        unint64_t v38 = *(void **)(*((void *)&v88 + 1) + 8 * v37);
        if (v76)
        {
          char v87 = 0;
          ((void (**)(void, char *, double))v76)[2](v76, &v87, v36);
          if (v87)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = 303;
              _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
            }
            v52 = v68;
            id v51 = v68;

            v53 = v72;
            goto LABEL_72;
          }
        }
        v39 = [v38 localStartDate];
        uint64_t v40 = [v34 count];
        int v41 = [v77 containsObject:v38];
        if (v41) {
          BOOL v42 = v40 == 0;
        }
        else {
          BOOL v42 = 0;
        }
        if (v42) {
          goto LABEL_50;
        }
        int v43 = v40 ? v41 : 0;
        if (v43 != 1) {
          break;
        }
        if (![(NSCalendar *)self->_calendar isDate:v39 equalToDate:v35 toUnitGranularity:8])
        {
          obja += v40;
          if (v40 == 1)
          {
            ++v74;
LABEL_50:
            uint64_t v46 = [MEMORY[0x1E4F1CA48] arrayWithObject:v38];

            if (v82)
            {
              objc_msgSend(v75, "pl_startOfWeekForDate:", v39);
              id v47 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v47 = v39;
            }
            id v48 = v47;

            v34 = (void *)v46;
            v35 = v48;
            goto LABEL_54;
          }
LABEL_49:
          v45 = [(PLAggregationProcessor *)self _aggregationMomentClustersForMomentClusters:v34];
          [v72 addObjectsFromArray:v45];

          if (v43) {
            goto LABEL_50;
          }
          goto LABEL_56;
        }
        [v34 addObject:v38];
LABEL_54:
        double v36 = 1.0 / (double)v67 + v36;

        if (v33 == ++v37)
        {
          uint64_t v50 = [v31 countByEnumeratingWithState:&v88 objects:v106 count:16];
          uint64_t v33 = v50;
          if (v50) {
            goto LABEL_27;
          }
          goto LABEL_64;
        }
      }
      char v44 = v73;
      if (!v40) {
        char v44 = 0;
      }
      if ((v44 & 1) == 0) {
        goto LABEL_54;
      }
      obja += v40;
      if (v40 != 1) {
        goto LABEL_49;
      }
      ++v74;
LABEL_56:
      uint64_t v49 = [MEMORY[0x1E4F1CA48] array];

      v35 = 0;
      v34 = (void *)v49;
      goto LABEL_54;
    }
    v74 = 0;
    obja = 0;
    v34 = 0;
    v35 = 0;
LABEL_64:

    v53 = v72;
    if ((unint64_t)[v34 count] >= 2)
    {
      v54 = [(PLAggregationProcessor *)self _aggregationMomentClustersForMomentClusters:v34];
      [v72 addObjectsFromArray:v54];
    }
    uint64_t v55 = [v72 count];
    uint64_t v56 = mach_absolute_time();
    uint32_t numer = info.numer;
    denouint64_t m = info.denom;
    id v59 = v71;
    uint64_t v60 = v59;
    if (v66 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&buf[4] = v55;
      __int16 v102 = 2048;
      long long v103 = v74;
      __int16 v104 = 2048;
      v105 = obja;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v60, OS_SIGNPOST_INTERVAL_END, spid, "AggregationsProcessing", "[HighlightsGeneration] Moment Aggregation statistics: %lu aggregations, %lu singletons, %lu moments contained", buf, 0x20u);
    }

    v61 = v60;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      v62 = [NSString stringWithFormat:@"[HighlightsGeneration] Moment Aggregation statistics: %lu aggregations, %lu singletons, %lu moments contained", v55, v74, obja];
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "AggregationsProcessing";
      __int16 v102 = 2112;
      long long v103 = v62;
      __int16 v104 = 2048;
      *(double *)&v105 = (float)((float)((float)((float)(v56 - v65) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
    }
    id v51 = v72;
    v52 = v68;
LABEL_72:

    id v9 = v69;
    id v8 = v70;
  }
  else
  {
    id v51 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v51;
}

- (id)sortedNeighborMomentClustersOfMomentClusters:(id)a3 forAllMomentClusters:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA80] set];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        calendar = self->_calendar;
        id v15 = [*(id *)(*((void *)&v37 + 1) + 8 * i) startDate];
        uint64_t v16 = [(NSCalendar *)calendar pl_startOfMonthForDate:v15];

        [v8 addObject:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v11);
  }

  uint64_t v32 = v9;
  uint64_t v17 = [MEMORY[0x1E4F1CA80] setWithArray:v9];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v18 = v7;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        unint64_t v23 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        unint64_t v24 = self->_calendar;
        unint64_t v25 = [v23 startDate];
        unint64_t v26 = [(NSCalendar *)v24 pl_startOfMonthForDate:v25];

        if ([v8 containsObject:v26]) {
          [v17 addObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v20);
  }

  int v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v41[0] = v27;
  id v28 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:1];
  v41[1] = v28;
  id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];

  uint64_t v30 = [v17 sortedArrayUsingDescriptors:v29];

  return v30;
}

- (PLAggregationProcessor)init
{
  v9.receiver = self;
  v9.super_class = (Class)PLAggregationProcessor;
  v2 = [(PLAggregationProcessor *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;

    unint64_t v5 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
    [(NSCalendar *)v2->_calendar setTimeZone:v5];

    uint64_t v6 = objc_opt_new();
    curatedAssetCountByMomentUUID = v2->_curatedAssetCountByMomentUUID;
    v2->_curatedAssetCountByMomentUUID = (NSMutableDictionary *)v6;
  }
  return v2;
}

+ (double)timeIntervalOfRecentContentToIgnore
{
  if (timeIntervalOfRecentContentToIgnore_onceToken != -1) {
    dispatch_once(&timeIntervalOfRecentContentToIgnore_onceToken, &__block_literal_global_49_48141);
  }
  return *(double *)&timeIntervalOfRecentContentToIgnore_timeIntervalOfRecentContentToIgnore;
}

double __61__PLAggregationProcessor_timeIntervalOfRecentContentToIgnore__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 integerForKey:@"PLAggregationProcessorNumberOfRecentDaysToIgnore"];

  double result = (double)v1 * 86400.0;
  *(double *)&timeIntervalOfRecentContentToIgnore_timeIntervalOfRecentContentToIgnore = result;
  return result;
}

+ (NSDate)allowedStartDateToAggregate
{
  [a1 timeIntervalOfRecentContentToIgnore];
  double v3 = v2;
  id v4 = +[PLMomentGenerationUtils today];
  unint64_t v5 = [v4 dateByAddingTimeInterval:-v3];

  return (NSDate *)v5;
}

+ (BOOL)requireStartAtFirstDayOfWeek
{
  if (requireStartAtFirstDayOfWeek_onceToken != -1) {
    dispatch_once(&requireStartAtFirstDayOfWeek_onceToken, &__block_literal_global_46_48148);
  }
  return requireStartAtFirstDayOfWeek_requireStartAtFirstDayOfWeek;
}

void __54__PLAggregationProcessor_requireStartAtFirstDayOfWeek__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  requireStartAtFirstDayOfWeek_requireStartAtFirstDayOfWeeuint64_t k = [v0 BOOLForKey:@"PLAggregationProcessorRequireStartAtFirstDayOfWeek"];
}

+ (BOOL)requireContiguousAggregation
{
  if (requireContiguousAggregation_onceToken != -1) {
    dispatch_once(&requireContiguousAggregation_onceToken, &__block_literal_global_44);
  }
  return requireContiguousAggregation_requireContiguousAggregation;
}

void __54__PLAggregationProcessor_requireContiguousAggregation__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  requireContiguousAggregation_requireContiguousAggregation = [v0 BOOLForKey:@"PLAggregationProcessorRequireContiguousAggregation"];
}

+ (unint64_t)maximumNumberOfAssetsPerAggregation
{
  if (maximumNumberOfAssetsPerAggregation_onceToken != -1) {
    dispatch_once(&maximumNumberOfAssetsPerAggregation_onceToken, &__block_literal_global_42);
  }
  return maximumNumberOfAssetsPerAggregation_maximumNumberOfAssetsPerAggregation;
}

void __61__PLAggregationProcessor_maximumNumberOfAssetsPerAggregation__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  maximumNumberOfAssetsPerAggregation_maximumNumberOfAssetsPerAggregation = [v0 integerForKey:@"PLAggregationProcessorMaximumNumberOfAssetsPerAggregation"];
}

+ (unint64_t)maximumNumberOfDaysPerAggregation
{
  if (maximumNumberOfDaysPerAggregation_onceToken != -1) {
    dispatch_once(&maximumNumberOfDaysPerAggregation_onceToken, &__block_literal_global_40_48159);
  }
  return maximumNumberOfDaysPerAggregation_maximumNumberOfDaysPerAggregation;
}

void __59__PLAggregationProcessor_maximumNumberOfDaysPerAggregation__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  maximumNumberOfDaysPerAggregation_maximumNumberOfDaysPerAggregation = [v0 integerForKey:@"PLAggregationProcessorMaximumNumberOfDaysPerAggregation"];
}

+ (unint64_t)maximumNumberOfAssetsPerShortMoment
{
  if (maximumNumberOfAssetsPerShortMoment_onceToken != -1) {
    dispatch_once(&maximumNumberOfAssetsPerShortMoment_onceToken, &__block_literal_global_38_48164);
  }
  return maximumNumberOfAssetsPerShortMoment_maximumNumberOfAssetsPerShortMoment;
}

void __61__PLAggregationProcessor_maximumNumberOfAssetsPerShortMoment__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  maximumNumberOfAssetsPerShortMoment_maximumNumberOfAssetsPerShortMoment = [v0 integerForKey:@"PLAggregationProcessorMaximumNumberOfAssetsPerShortMoment"];
}

+ (unint64_t)maximumNumberOfAssetsPerMoment
{
  if (maximumNumberOfAssetsPerMoment_onceToken != -1) {
    dispatch_once(&maximumNumberOfAssetsPerMoment_onceToken, &__block_literal_global_48169);
  }
  return maximumNumberOfAssetsPerMoment_maximumNumberOfAssetsPerMoment;
}

void __56__PLAggregationProcessor_maximumNumberOfAssetsPerMoment__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  maximumNumberOfAssetsPerMoment_maximumNumberOfAssetsPerMoment = [v0 integerForKey:@"PLAggregationProcessorMaximumNumberOfAssetsPerMoment"];
}

+ (void)restoreDefaultEnablement
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 removeObjectForKey:@"PLAggregationProcessorEnabled"];
}

+ (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PLAggregationProcessorEnabled"];
}

+ (BOOL)isEnabled
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PLAggregationProcessorEnabled"];

  return v3;
}

+ (void)initialize
{
  v8[8] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___PLAggregationProcessor;
  objc_msgSendSuper2(&v6, sel_initialize);
  uint64_t v2 = _os_feature_enabled_impl() ^ 1;
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v7[0] = @"PLAggregationProcessorEnabled";
  id v4 = [NSNumber numberWithBool:v2];
  v8[0] = v4;
  v8[1] = &unk_1EEBEE790;
  v7[1] = @"PLAggregationProcessorMaximumNumberOfAssetsPerMoment";
  v7[2] = @"PLAggregationProcessorMaximumNumberOfAssetsPerShortMoment";
  v8[2] = &unk_1EEBEE7A8;
  v8[3] = &unk_1EEBEE7C0;
  v7[3] = @"PLAggregationProcessorMaximumNumberOfDaysPerAggregation";
  v7[4] = @"PLAggregationProcessorMaximumNumberOfAssetsPerAggregation";
  v8[4] = &unk_1EEBEE7D8;
  v8[5] = MEMORY[0x1E4F1CC38];
  v7[5] = @"PLAggregationProcessorRequireContiguousAggregation";
  v7[6] = @"PLAggregationProcessorRequireStartAtFirstDayOfWeek";
  v7[7] = @"PLAggregationProcessorNumberOfRecentDaysToIgnore";
  v8[6] = MEMORY[0x1E4F1CC28];
  v8[7] = &unk_1EEBEE7F0;
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:8];
  [v3 registerDefaults:v5];
}

@end