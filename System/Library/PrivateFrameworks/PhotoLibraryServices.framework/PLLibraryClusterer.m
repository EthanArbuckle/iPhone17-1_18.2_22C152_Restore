@interface PLLibraryClusterer
+ (BOOL)_momentEligibleForSplit:(id)a3;
+ (BOOL)highlightSplitBasedOnLocationTypeEnabled;
+ (BOOL)highlightSplitBasedOnOriginatorsEnabled;
+ (BOOL)highlightSplitBasedOnTimeAndLocationEnabled;
+ (void)initialize;
- (BOOL)_shouldSplitMomentsWithTimeDistance:(double)a3 locationDistance:(double)a4;
- (NSCalendar)calendar;
- (PLFrequentLocationManager)frequentLocationManager;
- (PLLibraryClusterer)initWithLocalCreationDateCreator:(id)a3 frequentLocationManager:(id)a4;
- (PLLibraryClustererDelegate)delegate;
- (PLLocalCreationDateCreator)localCreationDateCreator;
- (id)_eligibleClusterForMoment:(id)a3 inMomentsByLocationType:(id)a4;
- (id)_momentsGroupedByDayWithMomentsSortedByDate:(id)a3;
- (id)_momentsSplitBetweenOriginatorsWithMoments:(id)a3;
- (id)_momentsSplitOnLocationTypeWithMoments:(id)a3;
- (id)_momentsSplitWithinDayWithMoments:(id)a3;
- (id)_startDateComponentsForMomentCluster:(id)a3;
- (id)locationBasedMomentClustersForMomentsSortedByDate:(id)a3;
- (id)momentClustersForMomentsSortedByDate:(id)a3 allowLocationSplits:(BOOL)a4 allowExternalSplits:(BOOL)a5;
- (void)_createMomentsForDailyAssets:(id)a3 currentMomentExistingMomentData:(id)a4;
- (void)_mergeMomentsIntoClustersBasedOnTimeWithMoments:(id)a3 clusters:(id)a4;
- (void)processMomentsWithAssets:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PLLibraryClusterer

+ (BOOL)_momentEligibleForSplit:(id)a3
{
  id v3 = a3;
  v4 = [v3 localStartDate];
  v5 = [v3 localEndDate];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;
  unint64_t v8 = objc_msgSend(v3, "pl_numberOfAssets");
  int v9 = [v3 processedLocation];

  BOOL v10 = v9 == 4 || v7 >= 1800.0 && v8 > 6;
  return v10;
}

+ (BOOL)highlightSplitBasedOnOriginatorsEnabled
{
  if (highlightSplitBasedOnOriginatorsEnabled_onceToken != -1) {
    dispatch_once(&highlightSplitBasedOnOriginatorsEnabled_onceToken, &__block_literal_global_12_111323);
  }
  return highlightSplitBasedOnOriginatorsEnabled_highlightSplitBasedOnOriginatorsEnabled;
}

void __61__PLLibraryClusterer_highlightSplitBasedOnOriginatorsEnabled__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  highlightSplitBasedOnOriginatorsEnabled_highlightSplitBasedOnOriginatorsEnabled = [v0 BOOLForKey:@"PLLibraryClustererEnableHighlightSplitBasedOnOriginators"];
}

+ (BOOL)highlightSplitBasedOnLocationTypeEnabled
{
  if (highlightSplitBasedOnLocationTypeEnabled_onceToken != -1) {
    dispatch_once(&highlightSplitBasedOnLocationTypeEnabled_onceToken, &__block_literal_global_10);
  }
  return highlightSplitBasedOnLocationTypeEnabled_highlightSplitBasedOnLocationTypeEnabled;
}

void __62__PLLibraryClusterer_highlightSplitBasedOnLocationTypeEnabled__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  highlightSplitBasedOnLocationTypeEnabled_highlightSplitBasedOnLocationTypeEnabled = [v0 BOOLForKey:@"PLLibraryClustererEnableHighlightSplitBasedOnLocationType"];
}

+ (BOOL)highlightSplitBasedOnTimeAndLocationEnabled
{
  if (highlightSplitBasedOnTimeAndLocationEnabled_onceToken != -1) {
    dispatch_once(&highlightSplitBasedOnTimeAndLocationEnabled_onceToken, &__block_literal_global_111332);
  }
  return highlightSplitBasedOnTimeAndLocationEnabled_highlightSplitBasedOnTimeAndLocationEnabled;
}

void __65__PLLibraryClusterer_highlightSplitBasedOnTimeAndLocationEnabled__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  highlightSplitBasedOnTimeAndLocationEnabled_highlightSplitBasedOnTimeAndLocationEnabled = [v0 BOOLForKey:@"PLLibraryClustererEnableHighlightSplitBasedOnTimeAndLocation"];
}

+ (void)initialize
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PLLibraryClusterer;
  objc_msgSendSuper2(&v4, sel_initialize);
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5[0] = @"PLLibraryClustererEnableHighlightSplitBasedOnTimeAndLocation";
  v5[1] = @"PLLibraryClustererEnableHighlightSplitBasedOnLocationType";
  v6[0] = MEMORY[0x1E4F1CC38];
  v6[1] = MEMORY[0x1E4F1CC38];
  v5[2] = @"PLLibraryClustererEnableHighlightSplitBasedOnOriginators";
  v6[2] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v2 registerDefaults:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequentLocationManager, 0);
  objc_storeStrong((id *)&self->_localCreationDateCreator, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (PLFrequentLocationManager)frequentLocationManager
{
  return self->_frequentLocationManager;
}

- (PLLocalCreationDateCreator)localCreationDateCreator
{
  return self->_localCreationDateCreator;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setDelegate:(id)a3
{
}

- (PLLibraryClustererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLLibraryClustererDelegate *)WeakRetained;
}

- (id)_momentsGroupedByDayWithMomentsSortedByDate:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v39 = [MEMORY[0x1E4F1CA48] array];
  v5 = [MEMORY[0x1E4F1CA48] array];
  double v6 = [[PLClusterTimeInfo alloc] initWithCalendar:self->_calendar];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v51 objects:v64 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v52;
    *(void *)&long long v8 = 138543362;
    long long v38 = v8;
    v41 = v6;
    v42 = v5;
    uint64_t v40 = *(void *)v52;
    do
    {
      uint64_t v11 = 0;
      uint64_t v43 = v9;
      do
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v51 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x19F38D3B0]();
        v14 = [v12 startDate];
        if (v14) {
          goto LABEL_26;
        }
        v46 = v13;
        v15 = [MEMORY[0x1E4F1C9C8] distantFuture];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        v45 = v12;
        v16 = [v12 assets];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v63 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          v19 = 0;
          uint64_t v20 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v48 != v20) {
                objc_enumerationMutation(v16);
              }
              v22 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              v23 = objc_msgSend(v22, "dateCreated", v38);
              uint64_t v24 = [v15 compare:v23];

              if (v24 == 1)
              {
                uint64_t v25 = [v22 dateCreated];

                id v26 = v22;
                v15 = (void *)v25;
                v19 = v26;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v47 objects:v63 count:16];
          }
          while (v18);
        }
        else
        {
          v19 = 0;
        }

        v27 = [v19 uuid];
        v14 = objc_msgSend(v19, "pl_date");
        v28 = PLMomentsGetLog();
        v12 = v45;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          v29 = [v45 uuid];
          int v30 = [v45 isDeleted];
          *(_DWORD *)buf = 138544130;
          v56 = v29;
          __int16 v57 = 1026;
          int v58 = v30;
          __int16 v59 = 2112;
          v60 = v14;
          __int16 v61 = 2114;
          v62 = v27;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_FAULT, "[MomentsGeneration] Moment start date unexpectedly nil. uuid %{public}@, isDeleted %{public}d. Taking asset date %@ %{public}@", buf, 0x26u);
        }
        if (v14)
        {
          id v31 = v14;
        }
        else
        {
          v32 = PLMomentsGetLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v38;
            v56 = v27;
            _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Fallback asset start date nil %{public}@.", buf, 0xCu);
          }
        }
        double v6 = v41;
        v5 = v42;
        uint64_t v10 = v40;
        uint64_t v9 = v43;
        v13 = v46;
        if (v14)
        {
LABEL_26:
          if (!-[PLClusterTimeInfo utcDateBelongsInCluster:](v6, "utcDateBelongsInCluster:", v14, v38))
          {
            if ([v5 count])
            {
              v33 = (void *)[v5 copy];
              [v39 addObject:v33];

              [v5 removeAllObjects];
            }
            [(PLClusterTimeInfo *)v6 reset];
          }
          [v5 addObject:v12];
          v34 = [v12 localStartDate];
          [(PLClusterTimeInfo *)v6 updateWithUTCDate:v14 localDate:v34];
        }
        else
        {
          [v42 addObject:v45];
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v35 = [obj countByEnumeratingWithState:&v51 objects:v64 count:16];
      uint64_t v9 = v35;
    }
    while (v35);
  }

  if ([v5 count])
  {
    v36 = (void *)[v5 copy];
    [v39 addObject:v36];
  }
  return v39;
}

- (id)_startDateComponentsForMomentCluster:(id)a3
{
  calendar = self->_calendar;
  id v4 = [a3 startDate];
  v5 = [(NSCalendar *)calendar components:12 fromDate:v4];

  return v5;
}

- (id)_momentsSplitBetweenOriginatorsWithMoments:(id)a3
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([(id)objc_opt_class() highlightSplitBasedOnOriginatorsEnabled])
  {
    if ((unint64_t)[v3 count] > 1)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
      long long v8 = [MEMORY[0x1E4F1CA48] array];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v9 = v3;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v64 objects:v70 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v65 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            char v15 = [v14 originatorState];
            if ((v15 & 0x1C) != 0 && (v15 & 3) == 0) {
              uint64_t v17 = v8;
            }
            else {
              uint64_t v17 = v7;
            }
            [v17 addObject:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v64 objects:v70 count:16];
        }
        while (v11);
      }

      id v4 = [MEMORY[0x1E4F1CA48] array];
      if ([v8 count] && objc_msgSend(v7, "count"))
      {
        uint64_t v43 = v4;
        id v44 = v9;
        id v46 = v3;
        uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
        long long v47 = [MEMORY[0x1E4F1CA48] array];
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        v45 = v8;
        id obj = v8;
        uint64_t v52 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
        if (v52)
        {
          uint64_t v50 = *(void *)v61;
          long long v51 = v7;
          long long v49 = v18;
          do
          {
            for (uint64_t j = 0; j != v52; ++j)
            {
              if (*(void *)v61 != v50) {
                objc_enumerationMutation(obj);
              }
              uint64_t v20 = *(void **)(*((void *)&v60 + 1) + 8 * j);
              *(void *)buf = 0;
              uint64_t v59 = 0;
              objc_msgSend(v20, "pl_coordinate");
              *(void *)buf = v21;
              uint64_t v59 = v22;
              long long v54 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              id v23 = v7;
              uint64_t v24 = [v23 countByEnumeratingWithState:&v54 objects:v68 count:16];
              if (v24)
              {
                uint64_t v25 = v24;
                uint64_t v53 = j;
                uint64_t v26 = *(void *)v55;
                double v27 = 1.79769313e308;
                while (2)
                {
                  for (uint64_t k = 0; k != v25; ++k)
                  {
                    if (*(void *)v55 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    v29 = *(void **)(*((void *)&v54 + 1) + 8 * k);
                    int v30 = [v20 startDate];
                    id v31 = [v20 endDate];
                    v32 = [v29 startDate];
                    v33 = [v29 endDate];
                    id v34 = v30;
                    [v32 timeIntervalSinceDate:v31];
                    double v36 = v35;
                    if (v35 < 0.0)
                    {
                      [v34 timeIntervalSinceDate:v33];
                      if (v37 >= 0.0) {
                        double v36 = v37;
                      }
                      else {
                        double v36 = 0.0;
                      }
                    }

                    objc_msgSend(v29, "pl_coordinate");
                    CLLocationCoordinate2DGetDistanceFrom();
                    if (v36 <= 300.0)
                    {
                      if (v38 > 10000.0)
                      {

                        uint64_t v18 = v49;
                        id v39 = v49;
                        uint64_t j = v53;
                        goto LABEL_45;
                      }
                    }
                    else
                    {
                      double v27 = fmin(fmax(v38, 1.0) / fmax(v36, 1.0), v27);
                    }
                  }
                  uint64_t v25 = [v23 countByEnumeratingWithState:&v54 objects:v68 count:16];
                  if (v25) {
                    continue;
                  }
                  break;
                }

                uint64_t v18 = v49;
                id v39 = v49;
                uint64_t j = v53;
                if (v27 <= 60.0) {
                  id v39 = v47;
                }
              }
              else
              {

                id v39 = v18;
              }
LABEL_45:
              [v39 addObject:v20];
              uint64_t v7 = v51;
            }
            uint64_t v52 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
          }
          while (v52);
        }

        id v4 = v43;
        if ([v18 count])
        {
          uint64_t v40 = (void *)[v7 mutableCopy];
          [v40 addObjectsFromArray:v47];
          [v43 addObject:v40];
          [v43 addObject:v18];
        }
        long long v8 = v45;
        id v3 = v46;
        id v9 = v44;
      }
      if (![v4 count])
      {
        v41 = [MEMORY[0x1E4F1CA48] arrayWithArray:v9];
        [v4 addObject:v41];
      }
    }
    else
    {
      id v71 = v3;
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
    }
  }
  else
  {
    v5 = PLMomentsGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "[MomentsGeneration] Moments split between originators is disabled", buf, 2u);
    }

    double v6 = (void *)[v3 mutableCopy];
    v72[0] = v6;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
  }
  return v4;
}

- (id)_eligibleClusterForMoment:(id)a3 inMomentsByLocationType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__111420;
  uint64_t v17 = __Block_byref_object_dispose__111421;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__PLLibraryClusterer__eligibleClusterForMoment_inMomentsByLocationType___block_invoke;
  v10[3] = &unk_1E5874B50;
  id v7 = v5;
  id v11 = v7;
  uint64_t v12 = &v13;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __72__PLLibraryClusterer__eligibleClusterForMoment_inMomentsByLocationType___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v11 = objc_msgSend(*(id *)(a1 + 32), "startDate", obj);
        uint64_t v12 = [*(id *)(a1 + 32) endDate];
        uint64_t v13 = [v10 startDate];
        v14 = [v10 endDate];
        id v15 = v11;
        [v13 timeIntervalSinceDate:v12];
        double v17 = v16;
        if (v16 < 0.0)
        {
          [v15 timeIntervalSinceDate:v14];
          if (v18 < 0.0) {
            double v17 = 0.0;
          }
          else {
            double v17 = v18;
          }
        }

        if (v17 >= 1800.0)
        {
          objc_msgSend(*(id *)(a1 + 32), "pl_coordinate");
          objc_msgSend(v10, "pl_coordinate");
          CLLocationCoordinate2DGetDistanceFrom();
          if (v19 >= 500.0) {
            continue;
          }
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
        *a4 = 1;
        goto LABEL_16;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

- (id)_momentsSplitOnLocationTypeWithMoments:(id)a3
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(id)objc_opt_class() highlightSplitBasedOnLocationTypeEnabled])
  {
    if ((unint64_t)[v4 count] > 1)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      id v9 = [MEMORY[0x1E4F1CA60] dictionary];
      double v37 = [MEMORY[0x1E4F1CA60] dictionary];
      id v39 = [(PLFrequentLocationManager *)self->_frequentLocationManager currentFrequentLocations];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __61__PLLibraryClusterer__momentsSplitOnLocationTypeWithMoments___block_invoke;
      v46[3] = &unk_1E5874B28;
      id v10 = v9;
      id v47 = v10;
      v41 = (void *)MEMORY[0x19F38D650](v46);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v35 = v4;
      id v11 = v4;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v43;
        double v36 = v8;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v43 != v14) {
              objc_enumerationMutation(v11);
            }
            double v16 = *(void **)(*((void *)&v42 + 1) + 8 * v15);
            double v17 = (void *)MEMORY[0x19F38D3B0]();
            if ([(id)objc_opt_class() _momentEligibleForSplit:v16])
            {
              double v18 = [(PLLibraryClusterer *)self _eligibleClusterForMoment:v16 inMomentsByLocationType:v10];
              if (!v18)
              {
                switch([v16 processedLocation])
                {
                  case 0u:
                  case 8u:
                  case 9u:
                  case 0xAu:
                    double v19 = (void (*)(void))v41[2];
                    goto LABEL_18;
                  case 1u:
                  case 5u:
                    uint64_t v21 = +[PLMomentGenerationUtils frequentLocationNearMoment:v16 withFrequentLocations:v39];
                    uint64_t v40 = v21;
                    if (v21)
                    {
                      long long v22 = [v21 centroid];
                      long long v23 = objc_msgSend(v22, "pl_location");

                      if (v23)
                      {
                        long long v24 = [v40 centroid];
                        long long v25 = objc_msgSend(v24, "pl_location");

                        double v18 = [v37 objectForKeyedSubscript:v25];
                        if (!v18)
                        {
                          double v18 = [MEMORY[0x1E4F1CA48] array];
                          [v37 setObject:v18 forKeyedSubscript:v25];
                        }
                      }
                      else
                      {
                        uint64_t v26 = PLMomentsGetLog();
                        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                        {
                          uint64_t v27 = [v40 centroid];
                          *(_DWORD *)buf = 138412546;
                          long long v49 = v40;
                          __int16 v50 = 2112;
                          uint64_t v51 = v27;
                          v28 = (void *)v27;
                          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "[MomentsGeneration] matchedFrequentLocation (%@) centroid (%@) pl_location found to be nil.", buf, 0x16u);
                        }
                        double v18 = ((void (*)(void *, uint64_t))v41[2])(v41, 5);
                      }
                      uint64_t v8 = v36;
                    }
                    else
                    {
                      double v18 = ((void (*)(void *, uint64_t))v41[2])(v41, 5);
                    }

                    if (!v18) {
                      goto LABEL_35;
                    }
                    break;
                  case 2u:
                  case 7u:
                    id v20 = v8;
                    goto LABEL_25;
                  case 3u:
                  case 4u:
                  case 6u:
                    double v19 = (void (*)(void))v41[2];
LABEL_18:
                    v19();
                    id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
                    double v18 = v20;
                    if (v20) {
                      break;
                    }
                    goto LABEL_35;
                  default:
LABEL_35:
                    v29 = [MEMORY[0x1E4F28B00] currentHandler];
                    [v29 handleFailureInMethod:a2 object:self file:@"PLLibraryClusterer.m" lineNumber:593 description:@"Each moments need a target array"];

                    double v18 = 0;
                    break;
                }
              }
              [v18 addObject:v16];
            }
            else
            {
              [v8 addObject:v16];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v30 = [v11 countByEnumeratingWithState:&v42 objects:v52 count:16];
          uint64_t v13 = v30;
        }
        while (v30);
      }

      id v31 = (void *)MEMORY[0x19F38D3B0]();
      v32 = [v10 allValues];
      id v5 = (void *)[v32 mutableCopy];

      v33 = [v37 allValues];
      [v5 addObjectsFromArray:v33];

      if ([v8 count]) {
        [(PLLibraryClusterer *)self _mergeMomentsIntoClustersBasedOnTimeWithMoments:v8 clusters:v5];
      }

      id v4 = v35;
    }
    else
    {
      id v53 = v4;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    }
  }
  else
  {
    uint64_t v6 = PLMomentsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "[MomentsGeneration] Moments split on location type is disabled", buf, 2u);
    }

    uint64_t v7 = (void *)[v4 mutableCopy];
    v54[0] = v7;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
  }
  return v5;
}

id __61__PLLibraryClusterer__momentsSplitOnLocationTypeWithMoments___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [NSNumber numberWithUnsignedShort:a2];
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }

  return v4;
}

- (id)_momentsSplitWithinDayWithMoments:(id)a3
{
  v107[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v65 = self;
  long long v55 = v4;
  if ([(id)objc_opt_class() highlightSplitBasedOnTimeAndLocationEnabled])
  {
    if ((unint64_t)[v4 count] > 1)
    {
      uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localStartDate" ascending:1];
      v105 = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
      [v55 sortUsingDescriptors:v9];

      id v10 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v86 = 0;
      v87 = &v86;
      uint64_t v88 = 0x3032000000;
      v89 = __Block_byref_object_copy__111420;
      v90 = __Block_byref_object_dispose__111421;
      id v91 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v82 = 0;
      v83 = &v82;
      uint64_t v84 = 0x2020000000;
      char v85 = 0;
      uint64_t v76 = 0;
      v77 = &v76;
      uint64_t v78 = 0x3032000000;
      v79 = __Block_byref_object_copy__111420;
      v80 = __Block_byref_object_dispose__111421;
      id v81 = 0;
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __56__PLLibraryClusterer__momentsSplitWithinDayWithMoments___block_invoke;
      v75[3] = &unk_1E5874AD8;
      v75[4] = &v86;
      v75[5] = &v76;
      v75[6] = &v82;
      id v11 = (void *)MEMORY[0x19F38D650](v75);
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __56__PLLibraryClusterer__momentsSplitWithinDayWithMoments___block_invoke_2;
      v71[3] = &unk_1E5874B00;
      id v54 = v10;
      id v72 = v54;
      v74 = &v86;
      id v61 = v11;
      id v73 = v61;
      int v58 = (void (**)(void, void))MEMORY[0x19F38D650](v71);
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id obj = v55;
      uint64_t v12 = [obj countByEnumeratingWithState:&v67 objects:v104 count:16];
      if (v12)
      {
        uint64_t v62 = *(void *)v68;
        do
        {
          uint64_t v13 = 0;
          uint64_t v63 = v12;
          do
          {
            if (*(void *)v68 != v62) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v67 + 1) + 8 * v13);
            uint64_t v15 = (void *)MEMORY[0x19F38D3B0]();
            double v16 = [v14 localStartDate];
            double v17 = [v14 localEndDate];
            int v18 = [(id)objc_opt_class() _momentEligibleForSplit:v14];
            double v19 = (void *)v77[5];
            if (v19) {
              int v20 = v18;
            }
            else {
              int v20 = 0;
            }
            if (v20 == 1 && *((unsigned char *)v83 + 24))
            {
              uint64_t v21 = [v19 localStartDate];
              long long v22 = [(id)v77[5] localEndDate];
              id v66 = v21;
              id v23 = v22;
              id v24 = v16;
              id v25 = v17;
              long long v64 = v23;
              [v24 timeIntervalSinceDate:v23];
              double v27 = v26;
              if (v26 < 0.0)
              {
                [v66 timeIntervalSinceDate:v25];
                double v27 = v28;
                if (v28 < 0.0) {
                  double v27 = 0.0;
                }
              }

              if (v27 >= 10800.0)
              {
                if (v27 >= 21600.0)
                {
                  long long v44 = NSString;
                  long long v45 = [v66 description];
                  id v46 = [v64 description];
                  uint64_t v59 = [v44 stringWithFormat:@"[%@ - %@]", v45, v46];

                  id v47 = NSString;
                  long long v48 = [v24 description];
                  long long v49 = [v25 description];
                  uint64_t v30 = [v47 stringWithFormat:@"[%@ - %@]", v48, v49];

                  __int16 v50 = PLMomentsGetLog();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v51 = [v14 uuid];
                    uint64_t v52 = [(id)v77[5] uuid];
                    *(_DWORD *)buf = 138413058;
                    v93 = v51;
                    __int16 v94 = 2112;
                    v95 = v30;
                    __int16 v96 = 2112;
                    v97 = v52;
                    __int16 v98 = 2112;
                    v99 = v59;
                    _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_DEBUG, "[MomentsGeneration] Separated moment %@ %@ from moment %@ %@, 6 or more hours apart", buf, 0x2Au);
                  }
                  ((void (**)(void, void *))v58)[2](v58, v14);
                }
                else
                {
                  uint64_t v59 = [(id)v77[5] approximateLocation];
                  uint64_t v29 = [v14 approximateLocation];
                  uint64_t v30 = (void *)v29;
                  if (v59
                    && v29
                    && ([v59 coordinate],
                        [v30 coordinate],
                        CLLocationCoordinate2DGetDistanceFrom(),
                        double v32 = v31,
                        [(PLLibraryClusterer *)v65 _shouldSplitMomentsWithTimeDistance:v27 locationDistance:v31]))
                  {
                    v33 = NSString;
                    long long v56 = [v66 description];
                    id v34 = [v64 description];
                    uint64_t v35 = [v33 stringWithFormat:@"[%@ - %@]", v56, v34];

                    double v36 = (void *)v35;
                    double v37 = NSString;
                    double v38 = [v24 description];
                    id v39 = [v25 description];
                    long long v57 = [v37 stringWithFormat:@"[%@ - %@]", v38, v39];

                    uint64_t v40 = v36;
                    v41 = PLMomentsGetLog();
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                    {
                      long long v42 = [v14 uuid];
                      long long v43 = [(id)v77[5] uuid];
                      *(_DWORD *)buf = 138413570;
                      v93 = v42;
                      __int16 v94 = 2112;
                      v95 = v57;
                      __int16 v96 = 2112;
                      v97 = v43;
                      __int16 v98 = 2112;
                      v99 = v40;
                      __int16 v100 = 2048;
                      double v101 = v27 / 3600.0;
                      __int16 v102 = 2048;
                      double v103 = v32 / 1000.0;
                      _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEBUG, "[MomentsGeneration] Separated moment %@ %@ from moment %@ %@, %.1f hours and %.0f km apart", buf, 0x3Eu);
                    }
                    ((void (**)(void, void *))v58)[2](v58, v14);
                  }
                  else
                  {
                    (*((void (**)(id, void *, uint64_t))v61 + 2))(v61, v14, 1);
                  }
                }
              }
              else
              {
                (*((void (**)(id, void *, uint64_t))v61 + 2))(v61, v14, 1);
              }
            }
            else
            {
              (*((void (**)(id, void *))v61 + 2))(v61, v14);
            }

            ++v13;
          }
          while (v63 != v13);
          uint64_t v12 = [obj countByEnumeratingWithState:&v67 objects:v104 count:16];
        }
        while (v12);
      }

      [v54 addObject:v87[5]];
      id v5 = v54;

      _Block_object_dispose(&v76, 8);
      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(&v86, 8);
    }
    else
    {
      id v106 = v4;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
    }
  }
  else
  {
    uint64_t v6 = PLMomentsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "[MomentsGeneration] Moments split within day is disabled", buf, 2u);
    }

    uint64_t v7 = (void *)[v55 mutableCopy];
    v107[0] = v7;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:1];
  }
  return v5;
}

void __56__PLLibraryClusterer__momentsSplitWithinDayWithMoments___block_invoke(void *a1, void *a2, char a3)
{
  id v5 = a2;
  [*(id *)(*(void *)(a1[4] + 8) + 40) addObject:v5];
  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) |= a3;
}

void __56__PLLibraryClusterer__momentsSplitWithinDayWithMoments___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id v8 = a2;
  [v3 addObject:v4];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  (*(void (**)(void))(a1[5] + 16))();
}

- (BOOL)_shouldSplitMomentsWithTimeDistance:(double)a3 locationDistance:(double)a4
{
  return a3 >= 10800.0 && a3 * -80.0 / 9.0 + 192000.0 <= a4;
}

- (void)_mergeMomentsIntoClustersBasedOnTimeWithMoments:(id)a3 clusters:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v37 = v5;
    id v8 = v5;
    uint64_t v41 = [v8 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v41)
    {
      id v39 = v7;
      uint64_t v40 = *(void *)v54;
      long long v44 = v6;
      id v38 = v8;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v54 != v40) {
            objc_enumerationMutation(v8);
          }
          id v10 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          id v11 = (void *)MEMORY[0x19F38D3B0]();
          id v47 = [v10 startDate];
          uint64_t v12 = [v10 endDate];
          if (![v6 count]) {
            goto LABEL_24;
          }
          long long v42 = v11;
          uint64_t v43 = i;
          unint64_t v13 = 0;
          uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
          double v15 = INFINITY;
          do
          {
            context = (void *)MEMORY[0x19F38D3B0]();
            double v16 = [v6 objectAtIndexedSubscript:v13];
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            id obj = v16;
            uint64_t v17 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v50;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v50 != v19) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v21 = *(void **)(*((void *)&v49 + 1) + 8 * j);
                  long long v22 = (void *)MEMORY[0x19F38D3B0]();
                  id v23 = [v21 startDate];
                  id v24 = [v21 endDate];
                  id v25 = v47;
                  [v23 timeIntervalSinceDate:v12];
                  double v27 = v26;
                  if (v26 < 0.0)
                  {
                    [v25 timeIntervalSinceDate:v24];
                    if (v28 < 0.0) {
                      double v27 = 0.0;
                    }
                    else {
                      double v27 = v28;
                    }
                  }

                  if (v27 < v15)
                  {
                    double v15 = v27;
                    uint64_t v14 = v13;
                  }
                }
                uint64_t v18 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
              }
              while (v18);
            }

            ++v13;
            id v6 = v44;
          }
          while (v13 < [v44 count]);
          id v8 = v38;
          uint64_t v7 = v39;
          id v11 = v42;
          uint64_t i = v43;
          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_24:
            uint64_t v29 = PLBackendGetLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Best index not found in moment cluster generation", buf, 2u);
            }

            uint64_t v14 = 0;
          }
          uint64_t v30 = [NSNumber numberWithUnsignedInteger:v14];
          [v7 addObject:v30];
        }
        uint64_t v41 = [v8 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v41);
    }

    if ([v8 count])
    {
      unint64_t v31 = 0;
      do
      {
        double v32 = (void *)MEMORY[0x19F38D3B0]();
        v33 = [v8 objectAtIndexedSubscript:v31];
        id v34 = [v7 objectAtIndexedSubscript:v31];
        uint64_t v35 = [v34 unsignedIntegerValue];

        double v36 = [v6 objectAtIndexedSubscript:v35];
        [v36 addObject:v33];

        ++v31;
      }
      while (v31 < [v8 count]);
    }

    id v5 = v37;
  }
  else
  {
    [v6 addObject:v5];
  }
}

- (void)_createMomentsForDailyAssets:(id)a3 currentMomentExistingMomentData:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if ([v16 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = [WeakRetained dataManager];

    id v9 = [PLCompactMomentClustering alloc];
    id v10 = [(PLLibraryClusterer *)self frequentLocationManager];
    id v11 = [v10 currentFrequentLocations];
    uint64_t v12 = [(PLCompactMomentClustering *)v9 initWithDataManager:v8 frequentLocations:v11];

    unint64_t v13 = [(PLCompactMomentClustering *)v12 createAssetClustersForAssetsInDay:v16];
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    id v15 = (id)[v14 libraryClusterer:self createMomentClustersForAssetClusters:v13 existingMomentDataForAssets:v6];
  }
}

- (id)momentClustersForMomentsSortedByDate:(id)a3 allowLocationSplits:(BOOL)a4 allowExternalSplits:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v28 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 count])
  {
    id v25 = v7;
    double v26 = self;
    id v8 = [(PLLibraryClusterer *)self _momentsGroupedByDayWithMomentsSortedByDate:v7];
    id v31 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v8;
    uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v30)
    {
      uint64_t v29 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v11 = (void *)MEMORY[0x19F38D3B0]();
          id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v14 = v10;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v33;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v33 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * j);
                if (!v5
                  || (char v20 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * j), "pl_originatorState"),
                      uint64_t v21 = v12,
                      (v20 & 8) == 0))
                {
                  uint64_t v21 = v13;
                }
                [v21 addObject:v19];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v16);
          }

          if ([v12 count])
          {
            long long v22 = [[PLMomentCluster alloc] initWithMoments:v12];
            [v31 addObject:v22];
          }
          if ([v13 count])
          {
            if (v28)
            {
              id v23 = [(PLLibraryClusterer *)v26 locationBasedMomentClustersForMomentsSortedByDate:v13];
              [v31 addObjectsFromArray:v23];
            }
            else
            {
              id v23 = [[PLMomentCluster alloc] initWithMoments:v13];
              [v31 addObject:v23];
            }
          }
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v30);
    }

    id v7 = v25;
  }
  else
  {
    id v31 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v31;
}

- (id)locationBasedMomentClustersForMomentsSortedByDate:(id)a3
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    if ([v4 count] == 1)
    {
      BOOL v5 = [[PLMomentCluster alloc] initWithMoments:v4];
      v70[0] = v5;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
    }
    else
    {
      BOOL v5 = [MEMORY[0x1E4F1CA48] array];
      id v7 = [MEMORY[0x1E4F1CA48] array];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v61 objects:v69 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v62 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            id v14 = [v13 approximateLocation];

            if (v14) {
              uint64_t v15 = v5;
            }
            else {
              uint64_t v15 = v7;
            }
            [(PLMomentCluster *)v15 addObject:v13];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v61 objects:v69 count:16];
        }
        while (v10);
      }

      if ((unint64_t)[(PLMomentCluster *)v5 count] > 1)
      {
        uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
        id v46 = [(PLLibraryClusterer *)self _momentsSplitOnLocationTypeWithMoments:v5];
        objc_msgSend(v17, "addObjectsFromArray:");
        uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        uint64_t v19 = v17;
        uint64_t v20 = [(PLMomentCluster *)v19 countByEnumeratingWithState:&v57 objects:v67 count:16];
        id obj = v19;
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v58;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v58 != v22) {
                objc_enumerationMutation(obj);
              }
              uint64_t v24 = *(void *)(*((void *)&v57 + 1) + 8 * j);
              id v25 = (void *)MEMORY[0x19F38D3B0]();
              double v26 = [(PLLibraryClusterer *)self _momentsSplitBetweenOriginatorsWithMoments:v24];
              [v18 addObjectsFromArray:v26];
            }
            uint64_t v19 = obj;
            uint64_t v21 = [(PLMomentCluster *)obj countByEnumeratingWithState:&v57 objects:v67 count:16];
          }
          while (v21);
        }
        id v47 = v4;

        [(PLLibraryClusterer *)self _mergeMomentsIntoClustersBasedOnTimeWithMoments:v7 clusters:v18];
        double v27 = [MEMORY[0x1E4F1CA48] array];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v28 = v18;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v53 objects:v66 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v54;
          do
          {
            for (uint64_t k = 0; k != v30; ++k)
            {
              if (*(void *)v54 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v53 + 1) + 8 * k);
              long long v34 = (void *)MEMORY[0x19F38D3B0]();
              long long v35 = [(PLLibraryClusterer *)self _momentsSplitWithinDayWithMoments:v33];
              [v27 addObjectsFromArray:v35];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v53 objects:v66 count:16];
          }
          while (v30);
        }
        long long v45 = v28;

        id v6 = [MEMORY[0x1E4F1CA48] array];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v36 = v27;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v49 objects:v65 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v50;
          do
          {
            uint64_t v40 = 0;
            do
            {
              if (*(void *)v50 != v39) {
                objc_enumerationMutation(v36);
              }
              uint64_t v41 = *(void *)(*((void *)&v49 + 1) + 8 * v40);
              uint64_t v42 = (void *)MEMORY[0x19F38D3B0](v37);
              uint64_t v43 = -[PLMomentCluster initWithMoments:]([PLMomentCluster alloc], "initWithMoments:", v41, v45);
              if (v43) {
                [v6 addObject:v43];
              }

              ++v40;
            }
            while (v38 != v40);
            uint64_t v37 = [v36 countByEnumeratingWithState:&v49 objects:v65 count:16];
            uint64_t v38 = v37;
          }
          while (v37);
        }

        id v4 = v47;
        uint64_t v16 = obj;
      }
      else
      {
        uint64_t v16 = [[PLMomentCluster alloc] initWithMoments:v8];
        long long v68 = v16;
        id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
      }
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)processMomentsWithAssets:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained logRoutineInformation];

    id v6 = [v4 anyObject];
    uint64_t v7 = [v6 assetComparisonSortDescriptors];
    id v8 = (void *)v7;
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
    if (v7) {
      uint64_t v9 = (void *)v7;
    }
    id v10 = v9;

    id v34 = v10;
    id v35 = v4;
    uint64_t v11 = [v4 sortedArrayUsingDescriptors:v10];
    id v12 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v40 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v39 = [[PLClusterTimeInfo alloc] initWithCalendar:self->_calendar];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v42;
      uint64_t v36 = *(void *)v42;
      id v37 = v13;
      while (2)
      {
        uint64_t v17 = 0;
        uint64_t v38 = v15;
        do
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v41 + 1) + 8 * v17);
          uint64_t v19 = (void *)MEMORY[0x19F38D3B0]();
          if (([v18 isDeleted] & 1) == 0)
          {
            uint64_t v20 = objc_msgSend(v18, "pl_date");
            uint64_t v21 = [v18 localDateAndCreateIfNeededWithLocalDateCreator:self->_localCreationDateCreator];
            if (!v21)
            {
              long long v32 = PLMomentsGetLog();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
              {
                uint64_t v33 = [v18 uuid];
                *(_DWORD *)buf = 138543362;
                id v46 = v33;
                _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_FAULT, "Asset dateCreated unexpectedly nil. %{public}@", buf, 0xCu);
              }

              uint64_t v31 = v34;
              id v4 = v35;
              uint64_t v30 = v40;
              goto LABEL_24;
            }
            uint64_t v22 = (void *)v21;
            if (![(PLClusterTimeInfo *)v39 utcDateBelongsInCluster:v20])
            {
              [(PLLibraryClusterer *)self _createMomentsForDailyAssets:v12 currentMomentExistingMomentData:v40];
              [v12 removeAllObjects];
              [v40 removeAllObjects];
              [(PLClusterTimeInfo *)v39 reset];
            }
            id v23 = self;
            uint64_t v24 = v12;
            [v12 addObject:v18];
            [(PLClusterTimeInfo *)v39 updateWithUTCDate:v20 localDate:v22];
            id v25 = [PLExistingMomentData alloc];
            double v26 = [v18 moment];
            double v27 = [(PLExistingMomentData *)v25 initWithMoment:v26];

            if (v27)
            {
              id v28 = [v40 member:v27];
              uint64_t v29 = v28;
              if (!v28)
              {
                [v40 addObject:v27];
                id v28 = v27;
              }
              [v28 registerAsset:v18];
            }
            id v12 = v24;
            self = v23;
            uint64_t v16 = v36;
            id v13 = v37;
            uint64_t v15 = v38;
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    uint64_t v30 = v40;
    [(PLLibraryClusterer *)self _createMomentsForDailyAssets:v12 currentMomentExistingMomentData:v40];
    uint64_t v31 = v34;
    id v4 = v35;
LABEL_24:
  }
}

- (PLLibraryClusterer)initWithLocalCreationDateCreator:(id)a3 frequentLocationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PLLibraryClusterer;
  uint64_t v9 = [(PLLibraryClusterer *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localCreationDateCreator, a3);
    objc_storeStrong((id *)&v10->_frequentLocationManager, a4);
    uint64_t v11 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    id v12 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
    [(NSCalendar *)v11 setTimeZone:v12];

    calendar = v10->_calendar;
    v10->_calendar = v11;
  }
  return v10;
}

@end