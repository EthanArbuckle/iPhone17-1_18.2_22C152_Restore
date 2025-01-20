@interface PGShareBackLocationSource
+ (id)suggesterInputsByDateIntervalForInputs:(id)a3;
- (BOOL)prepareSourceWithGraph:(id)a3;
- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6;
@end

@implementation PGShareBackLocationSource

+ (id)suggesterInputsByDateIntervalForInputs:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v3;
  uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v32)
  {
    v30 = v4;
    uint64_t v31 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v8 = [v7 creationDate];
        if (v8)
        {
          uint64_t v9 = [v7 location];
          uint64_t v10 = [v7 timeZone];
          v35 = (void *)v9;
          v36 = v8;
          v33 = (void *)v10;
          v34 = v7;
          if (v10)
          {
            uint64_t v11 = [MEMORY[0x1E4F76C68] localDateFromUniversalDate:v8 inTimeZone:v10];
          }
          else
          {
            if (v9) {
              [MEMORY[0x1E4F76C68] localDateFromUniversalDate:v8 atLocation:v9];
            }
            else {
            uint64_t v11 = [MEMORY[0x1E4F76C68] localDateFromUniversalDate:v8];
            }
          }
          v12 = (void *)v11;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          v13 = [v4 allKeys];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v38;
LABEL_15:
            uint64_t v17 = 0;
            while (1)
            {
              if (*(void *)v38 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v37 + 1) + 8 * v17);
              v19 = [v18 startDate];
              char v20 = [v5 isDate:v12 inSameDayAsDate:v19];

              if (v20) {
                break;
              }
              if (v15 == ++v17)
              {
                uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
                if (v15) {
                  goto LABEL_15;
                }
                goto LABEL_21;
              }
            }
            id v21 = v18;

            if (!v21) {
              goto LABEL_24;
            }
            v22 = [v21 startDate];
            id v23 = [v22 earlierDate:v12];

            v24 = [v21 endDate];
            v25 = [v24 laterDate:v12];

            v4 = v30;
            v26 = [v30 objectForKeyedSubscript:v21];
            [v30 removeObjectForKey:v21];
          }
          else
          {
LABEL_21:

LABEL_24:
            id v23 = v12;
            v26 = objc_opt_new();
            v25 = v23;
            v4 = v30;
          }
          v27 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v23 endDate:v25];
          [v4 setObject:v26 forKeyedSubscript:v27];
          [v26 addObject:v34];

          v8 = v36;
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v32);
  }

  return v4;
}

- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v38 = a4;
  id v33 = a5;
  long long v41 = [(PGShareBackSource *)self loggingConnection];
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  __int16 v75 = 0;
  long long v42 = objc_opt_new();
  if (![v38 count]) {
    goto LABEL_32;
  }
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 0;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 0;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v34;
  uint64_t v37 = [obj countByEnumeratingWithState:&v60 objects:v81 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v61;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v61 != v36) {
        objc_enumerationMutation(obj);
      }
      long long v44 = *(void **)(*((void *)&v60 + 1) + 8 * v9);
      v45 = [v44 location];
      uint64_t v39 = v9;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v40 = v38;
      uint64_t v10 = [v40 countByEnumeratingWithState:&v56 objects:v80 count:16];
      if (v10)
      {
        uint64_t v43 = *(void *)v57;
LABEL_9:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v57 != v43) {
            objc_enumerationMutation(v40);
          }
          v12 = *(void **)(*((void *)&v56 + 1) + 8 * v11);
          v13 = [v12 collection];
          uint64_t v14 = [v13 urbanRoiNodes];
          if ([v14 isEmpty])
          {
            uint64_t v15 = [v13 addressNodes];
            uint64_t v16 = [v15 cityNodes];
            uint64_t v17 = [v16 momentNodes];
            v18 = [v17 urbanRoiNodes];
            char v19 = [v18 isEmpty];

            char v20 = v19 ^ 1;
          }
          else
          {
            char v20 = 1;
          }

          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __81__PGShareBackLocationSource_suggesterResultsForInputs_momentNodes_inGraph_error___block_invoke;
          v46[3] = &unk_1E68F0598;
          v52 = &v68;
          id v21 = v45;
          v53 = &v64;
          id v47 = v21;
          v48 = v44;
          char v55 = v20;
          id v49 = v41;
          v50 = v12;
          v54 = &v72;
          id v51 = v42;
          [v12 enumerateAddressEdgesAndNodesUsingBlock:v46];
          BOOL v22 = *((unsigned __int16 *)v73 + 12) == 16;

          if (v22) {
            break;
          }
          if (v10 == ++v11)
          {
            uint64_t v10 = [v40 countByEnumeratingWithState:&v56 objects:v80 count:16];
            if (v10) {
              goto LABEL_9;
            }
            break;
          }
        }
      }

      BOOL v23 = *((unsigned __int16 *)v73 + 12) == 16;
      if (v23) {
        break;
      }
      uint64_t v9 = v39 + 1;
      if (v39 + 1 == v37)
      {
        uint64_t v37 = [obj countByEnumeratingWithState:&v60 objects:v81 count:16];
        if (v37) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  if (!*((unsigned char *)v69 + 24))
  {
    *((_WORD *)v73 + 12) = 2;
    [v42 unionSet:v38];
    v25 = v41;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
      *(_DWORD *)buf = 138412547;
      v77 = v26;
      __int16 v78 = 2113;
      v79 = v42;
      _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_DEFAULT, "[PGShareBackLocationSource] Moment nodes in interval has no location, processingValue: %@, possible contributions: %{private}@", buf, 0x16u);
    }
    goto LABEL_31;
  }
  if (*((unsigned char *)v65 + 24))
  {
    if ([v42 count]) {
      goto LABEL_29;
    }
    __int16 v24 = 8;
  }
  else
  {
    __int16 v24 = 4;
  }
  *((_WORD *)v73 + 12) = v24;
LABEL_29:
  v27 = v41;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
    *(_DWORD *)buf = 138412547;
    v77 = v28;
    __int16 v78 = 2113;
    v79 = v42;
    _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_DEFAULT, "[PGShareBackLocationSource] Moment nodes in interval has location, processingValue: %@, possible contributions: %{private}@", buf, 0x16u);
  }
LABEL_31:

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
LABEL_32:
  if (*((_WORD *)v73 + 12))
  {
    v29 = [PGShareBackSuggesterResult alloc];
    v30 = [(PGShareBackSuggesterResult *)v29 initWithInputs:v34 processingValue:*((unsigned __int16 *)v73 + 12) momentNodes:v42];
    uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObject:v30];
  }
  else
  {
    uint64_t v31 = (void *)MEMORY[0x1E4F1CBF0];
  }

  _Block_object_dispose(&v72, 8);
  return v31;
}

void __81__PGShareBackLocationSource_suggesterResultsForInputs_momentNodes_inGraph_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  if (*(void *)(a1 + 32))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    uint64_t v9 = [*(id *)(a1 + 40) creationDate];
    uint64_t v10 = [v7 universalStartDate];
    uint64_t v11 = [v7 universalEndDate];
    v12 = (void *)v11;
    if (!v10 || !v11) {
      goto LABEL_23;
    }
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v10 endDate:v11];
    if ([v13 containsDate:v9])
    {

      double v14 = 0.0;
    }
    else
    {
      [v9 timeIntervalSinceDate:v10];
      double v16 = fabs(v15);
      [v9 timeIntervalSinceDate:v12];
      double v14 = fmin(v16, fabs(v17));

      if (v14 >= 7200.0)
      {
LABEL_23:

        goto LABEL_24;
      }
    }
    v18 = [v8 location];
    if (v18)
    {
      [*(id *)(a1 + 32) distanceFromLocation:v18];
      double v20 = v19;
    }
    else
    {
      double v20 = 1.79769313e308;
    }
    id v21 = [v7 photoLocation];
    if (v21)
    {
      [*(id *)(a1 + 32) distanceFromLocation:v21];
      double v20 = fmin(v20, v22);
    }
    char v23 = [MEMORY[0x1E4F8A930] locationIsCoarse:*(void *)(a1 + 32)];
    uint64_t v24 = 0x408F400000000000;
    double v25 = 1800.0;
    if (*(unsigned char *)(a1 + 96) && (v23 & 1) == 0 && ([v8 isCoarse] & 1) == 0)
    {
      if (v20 > 1000.0)
      {
LABEL_22:

        goto LABEL_23;
      }
      uint64_t v24 = 0x405F400000000000;
      double v25 = 300.0;
    }
    if (v20 <= 125.0 || v20 / 1.4 <= v25)
    {
      uint64_t v31 = a4;
      v26 = *(NSObject **)(a1 + 48);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v29 = *(void **)(a1 + 56);
        log = v26;
        v27 = [v29 uuid];
        int v28 = *(unsigned __int8 *)(a1 + 96);
        *(_DWORD *)buf = 138413826;
        id v33 = v27;
        __int16 v34 = 2048;
        double v35 = v20;
        __int16 v36 = 2048;
        uint64_t v37 = v24;
        __int16 v38 = 1024;
        int v39 = v28;
        __int16 v40 = 2048;
        double v41 = v20 / 1.4;
        __int16 v42 = 2048;
        double v43 = v14;
        __int16 v44 = 2048;
        double v45 = v25;
        _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_INFO, "[PGShareBackLocationSource] Moment node %@ matched with distance %.0f location threshold %.0f (urban: %d), timeToWalkToDestination %.0f, timeDistance %.0f, walking threshold %.0f", buf, 0x44u);
      }
      *(_WORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 16;
      [*(id *)(a1 + 64) addObject:*(void *)(a1 + 56)];
      *uint64_t v31 = 1;
    }
    goto LABEL_22;
  }
LABEL_24:
}

- (BOOL)prepareSourceWithGraph:(id)a3
{
  return 1;
}

@end