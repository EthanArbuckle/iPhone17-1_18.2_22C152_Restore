@interface PGShareBackCoreRoutineSource
- (BOOL)prepareSourceWithGraph:(id)a3;
- (BOOL)suggesterInput:(id)a3 isCloseEnoughToLocation:(id)a4 inDateInterval:(id)a5;
- (PGShareBackCoreRoutineSource)initWithRoutineService:(id)a3 loggingConnection:(id)a4;
- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6;
@end

@implementation PGShareBackCoreRoutineSource

- (void).cxx_destruct
{
}

- (BOOL)suggesterInput:(id)a3 isCloseEnoughToLocation:(id)a4 inDateInterval:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v9 startDate];
  v11 = [v9 endDate];
  v12 = [v7 creationDate];
  [v12 timeIntervalSinceDate:v10];
  double v14 = fabs(v13);
  [v12 timeIntervalSinceDate:v11];
  double v16 = fmin(v14, fabs(v15));
  char v17 = [v9 containsDate:v12];

  if ((v17 & 1) == 0 && v16 > 7200.0) {
    goto LABEL_6;
  }
  v18 = [v7 location];
  [v8 distanceFromLocation:v18];
  double v20 = v19;

  int v21 = [MEMORY[0x1E4F8A930] locationIsCoarse:v8];
  double v22 = 125.0;
  if (v21) {
    double v22 = 250.0;
  }
  if (v20 <= v22)
  {
    double v24 = v16 / 3600.0;
    if (v16 < 300.0) {
      double v24 = 2.0;
    }
    BOOL v23 = v20 * 0.001 / v24 <= 7.0;
  }
  else
  {
LABEL_6:
    BOOL v23 = 0;
  }

  return v23;
}

- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v54 = self;
  v10 = [(PGShareBackSource *)self loggingConnection];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v63 objects:v73 count:16];
  oslog = v10;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v64;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v64 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        char v17 = [v16 asset];
        v18 = v17;
        if (v17)
        {
          double v19 = [v17 mediaAnalysisProperties];
          __int16 v20 = [v19 syndicationProcessingValue];

          if ((v20 & 0x400) != 0)
          {
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              v68 = v16;
              _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_DEFAULT, "[PGShareBackCoreRoutineSource] Suggester input %{private}@ previously matched with CoreRoutine visit", buf, 0xCu);
            }
            v38 = [PGShareBackSuggesterResult alloc];
            v39 = [MEMORY[0x1E4F1CAD0] set];
            v40 = [(PGShareBackSuggesterResult *)v38 initWithInputs:v11 processingValue:1024 momentNodes:v39];

            v41 = [MEMORY[0x1E4F1C978] arrayWithObject:v40];

            goto LABEL_46;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v63 objects:v73 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  if ([(CLSRoutineService *)v54->_routineService hasLocationsOfInterestInformation])
  {
    int v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_46683];
    double v22 = [v11 filteredArrayUsingPredicate:v21];

    if ([v22 count])
    {
      BOOL v23 = +[PGShareBackSuggesterInput universalDateIntervalForSuggesterInputs:v11 withTimeIntervalPadding:7200.0];
      double v24 = [(CLSRoutineService *)v54->_routineService locationOfInterestVisitsInDateInterval:v23];
      if ([v24 count])
      {
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v25 = v24;
        uint64_t v45 = [v25 countByEnumeratingWithState:&v59 objects:v72 count:16];
        if (v45)
        {
          uint64_t v26 = *(void *)v60;
          v50 = v22;
          id v51 = v9;
          v48 = v24;
          v49 = v23;
          v47 = v25;
          uint64_t v44 = *(void *)v60;
          do
          {
            uint64_t v27 = 0;
            do
            {
              if (*(void *)v60 != v26) {
                objc_enumerationMutation(v25);
              }
              uint64_t v46 = v27;
              v28 = *(void **)(*((void *)&v59 + 1) + 8 * v27);
              long long v55 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              obuint64_t j = v22;
              uint64_t v29 = [obj countByEnumeratingWithState:&v55 objects:v71 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = *(void *)v56;
                while (2)
                {
                  for (uint64_t j = 0; j != v30; ++j)
                  {
                    if (*(void *)v56 != v31) {
                      objc_enumerationMutation(obj);
                    }
                    v33 = *(void **)(*((void *)&v55 + 1) + 8 * j);
                    v34 = [v28 locationOfInterest];
                    v35 = [v34 location];
                    v36 = [v28 visitInterval];
                    BOOL v37 = [(PGShareBackCoreRoutineSource *)v54 suggesterInput:v33 isCloseEnoughToLocation:v35 inDateInterval:v36];

                    if (v37)
                    {
                      BOOL v23 = v49;
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138478083;
                        v68 = v33;
                        __int16 v69 = 2113;
                        v70 = v28;
                        _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "[PGShareBackCoreRoutineSource] Suggester input %{private}@ matched with CoreRoutine visit %{private}@", buf, 0x16u);
                      }

                      id v9 = v51;
                      v42 = [[PGShareBackSuggesterResult alloc] initWithInputs:v11 processingValue:1024 momentNodes:v51];
                      v41 = [MEMORY[0x1E4F1C978] arrayWithObject:v42];

                      double v22 = v50;
                      double v24 = v48;
                      goto LABEL_44;
                    }
                  }
                  uint64_t v30 = [obj countByEnumeratingWithState:&v55 objects:v71 count:16];
                  if (v30) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v27 = v46 + 1;
              double v22 = v50;
              id v9 = v51;
              double v24 = v48;
              BOOL v23 = v49;
              id v25 = v47;
              uint64_t v26 = v44;
            }
            while (v46 + 1 != v45);
            uint64_t v45 = [v47 countByEnumeratingWithState:&v59 objects:v72 count:16];
          }
          while (v45);
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v23;
        _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "[PGShareBackCoreRoutineSource] Can't find core routine visits in date interval: %@", buf, 0xCu);
      }
      v41 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_44:
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D1805000, v10, OS_LOG_TYPE_DEBUG, "[PGShareBackCoreRoutineSource] No inputs with valid location", buf, 2u);
      }
      v41 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "[PGShareBackCoreRoutineSource] Can't find any recent core routine visits", buf, 2u);
    }
    v41 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_46:

  return v41;
}

BOOL __84__PGShareBackCoreRoutineSource_suggesterResultsForInputs_momentNodes_inGraph_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 location];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)prepareSourceWithGraph:(id)a3
{
  return 1;
}

- (PGShareBackCoreRoutineSource)initWithRoutineService:(id)a3 loggingConnection:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGShareBackCoreRoutineSource;
  id v8 = [(PGShareBackSource *)&v11 initWithLoggingConnection:a4];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_routineService, a3);
  }

  return v9;
}

@end