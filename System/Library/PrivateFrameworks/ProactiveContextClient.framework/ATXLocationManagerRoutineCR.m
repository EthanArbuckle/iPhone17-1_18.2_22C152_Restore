@interface ATXLocationManagerRoutineCR
+ (id)closestLOI:(id)a3 toLocation:(id)a4;
- (ATXLocationManagerRoutineCR)init;
- (ATXLocationManagerRoutineCR)initWithRoutineManager:(id)a3;
- (unint64_t)fetchRoutineModeFromLocation:(id)a3;
- (void)fetchClosestLOIWithinDistance:(double)a3 ofLocation:(id)a4 reply:(id)a5;
- (void)fetchLOILocationOfType:(int64_t)a3 reply:(id)a4;
- (void)fetchLOIVisitedDuring:(id)a3 reply:(id)a4;
- (void)fetchNextPredictedLOIFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 requireHighConfidence:(BOOL)a6 reply:(id)a7;
- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 requireHighConfidence:(BOOL)a5 reply:(id)a6;
@end

@implementation ATXLocationManagerRoutineCR

- (ATXLocationManagerRoutineCR)init
{
  v3 = objc_opt_new();
  v4 = [(ATXLocationManagerRoutineCR *)self initWithRoutineManager:v3];

  return v4;
}

- (ATXLocationManagerRoutineCR)initWithRoutineManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXLocationManagerRoutineCR;
  v6 = [(ATXLocationManagerRoutineCR *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_routineManager, a3);
  }

  return v7;
}

- (void)fetchClosestLOIWithinDistance:(double)a3 ofLocation:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  routineManager = self->_routineManager;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__ATXLocationManagerRoutineCR_fetchClosestLOIWithinDistance_ofLocation_reply___block_invoke;
  v13[3] = &unk_1E6BE6B80;
  id v14 = v8;
  id v15 = v9;
  id v11 = v8;
  id v12 = v9;
  [(RTRoutineManager *)routineManager fetchLocationsOfInterestWithinDistance:v11 ofLocation:v13 withHandler:a3];
}

void __78__ATXLocationManagerRoutineCR_fetchClosestLOIWithinDistance_ofLocation_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    id v6 = +[ATXLocationManagerRoutineCR closestLOI:a2 toLocation:*(void *)(a1 + 32)];
    id v5 = createLOIFromRTLOI(v6);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchLOILocationOfType:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  routineManager = self->_routineManager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__ATXLocationManagerRoutineCR_fetchLOILocationOfType_reply___block_invoke;
  v9[3] = &unk_1E6BE6BA8;
  id v10 = v6;
  id v8 = v6;
  [(RTRoutineManager *)routineManager fetchLocationsOfInterestOfType:a3 withHandler:v9];
}

void __60__ATXLocationManagerRoutineCR_fetchLOILocationOfType_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v12 = [a2 firstObject];
    if (v12)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      id v6 = [v12 location];
      [v6 latitude];
      double v8 = v7;
      id v9 = [v12 location];
      [v9 longitude];
      id v11 = (void *)[v5 initWithLatitude:v8 longitude:v10];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)fetchLOIVisitedDuring:(id)a3 reply:(id)a4
{
  id v6 = a4;
  routineManager = self->_routineManager;
  id v8 = a3;
  id v9 = [v8 startDate];
  double v10 = [v8 endDate];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__ATXLocationManagerRoutineCR_fetchLOIVisitedDuring_reply___block_invoke;
  v12[3] = &unk_1E6BE6BA8;
  id v13 = v6;
  id v11 = v6;
  [(RTRoutineManager *)routineManager fetchLocationsOfInterestVisitedBetweenStartDate:v9 endDate:v10 withHandler:v12];
}

void __59__ATXLocationManagerRoutineCR_fetchLOIVisitedDuring_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    double v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
          id v14 = (void *)MEMORY[0x1E0187360](v9);
          id v15 = createLOIFromRTLOI(v13);
          objc_msgSend(v7, "addObject:", v15, (void)v16);

          ++v12;
        }
        while (v10 != v12);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v10 = v9;
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)fetchNextPredictedLOIFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 requireHighConfidence:(BOOL)a6 reply:(id)a7
{
  id v12 = a7;
  routineManager = self->_routineManager;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __116__ATXLocationManagerRoutineCR_fetchNextPredictedLOIFromLocation_startDate_timeInterval_requireHighConfidence_reply___block_invoke;
  v15[3] = &unk_1E6BE6BF8;
  id v16 = v12;
  BOOL v17 = a6;
  id v14 = v12;
  [(RTRoutineManager *)routineManager fetchNextPredictedLocationsOfInterestFromLocation:a3 startDate:a4 timeInterval:v15 withHandler:a5];
}

void __116__ATXLocationManagerRoutineCR_fetchNextPredictedLOIFromLocation_startDate_timeInterval_requireHighConfidence_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v22 = v5;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v7)
    {
      uint64_t v25 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v10 = (void *)MEMORY[0x1E0187360]();
          uint64_t v11 = [v9 locationOfInterest];
          uint64_t v12 = [v11 type];

          id v13 = __atxlog_handle_dailyroutines();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            id v14 = [v9 locationOfInterest];
            uint64_t v15 = [v14 type];
            [v9 confidence];
            *(_DWORD *)buf = 134218240;
            *(void *)&buf[4] = v15;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v16;
            _os_log_impl(&dword_1DAFF9000, v13, OS_LOG_TYPE_INFO, "Predicted next loi type: %ld, confidence: %lf", buf, 0x16u);
          }
          if (*(unsigned char *)(a1 + 40))
          {
            [v9 confidence];
            BOOL v18 = v17 >= 1.0;
          }
          else
          {
            BOOL v18 = 1;
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          char v32 = 1;
          long long v19 = [v9 sources];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __116__ATXLocationManagerRoutineCR_fetchNextPredictedLOIFromLocation_startDate_timeInterval_requireHighConfidence_reply___block_invoke_4;
          v26[3] = &unk_1E6BE6BD0;
          v26[4] = buf;
          [v19 enumerateObjectsUsingBlock:v26];

          if (v18 && *(unsigned char *)(*(void *)&buf[8] + 24))
          {
            v20 = [v9 locationOfInterest];
            uint64_t v21 = createLOIFromRTLOIAndType(v20, v12);
            [v23 addObject:v21];
          }
          _Block_object_dispose(buf, 8);
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v7);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v6 = 0;
  }
}

void __116__ATXLocationManagerRoutineCR_fetchNextPredictedLOIFromLocation_startDate_timeInterval_requireHighConfidence_reply___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 requireHighConfidence:(BOOL)a5 reply:(id)a6
{
  id v10 = a6;
  routineManager = self->_routineManager;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__ATXLocationManagerRoutineCR_fetchPredictedExitDatesFromLocation_onDate_requireHighConfidence_reply___block_invoke;
  v13[3] = &unk_1E6BE6BF8;
  id v14 = v10;
  BOOL v15 = a5;
  id v12 = v10;
  [(RTRoutineManager *)routineManager fetchPredictedExitDatesFromLocation:a3 onDate:a4 withHandler:v13];
}

void __102__ATXLocationManagerRoutineCR_fetchPredictedExitDatesFromLocation_onDate_requireHighConfidence_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v13 = __atxlog_handle_dailyroutines();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            id v14 = [v12 date];
            [v12 uncertainty];
            uint64_t v16 = v15;
            [v12 confidence];
            *(_DWORD *)buf = 138412802;
            v26 = v14;
            __int16 v27 = 2048;
            uint64_t v28 = v16;
            __int16 v29 = 2048;
            uint64_t v30 = v17;
            _os_log_impl(&dword_1DAFF9000, v13, OS_LOG_TYPE_INFO, "Predicted Exit Time: %@, uncertainty: %lf, confidence %lf", buf, 0x20u);
          }
          if (*(unsigned char *)(a1 + 40))
          {
            [v12 confidence];
            if (v18 < 0.75) {
              continue;
            }
          }
          long long v19 = [v12 date];
          [v6 addObject:v19];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v5 = v20;
  }
}

- (unint64_t)fetchRoutineModeFromLocation:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  routineManager = self->_routineManager;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke;
  id v13 = &unk_1E6BE6C20;
  uint64_t v15 = &v16;
  id v7 = v5;
  id v14 = v7;
  [(RTRoutineManager *)routineManager fetchRoutineModeFromLocation:v4 withHandler:&v10];
  objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v7, 0, &__block_literal_global_5, 1.0, v10, v11, v12, v13);
  unint64_t v8 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    switch(a2)
    {
      case 0:
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        goto LABEL_12;
      case 2:
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v8 = 1;
        break;
      case 1:
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v8 = 2;
        break;
      default:
        goto LABEL_12;
    }
    *(void *)(v7 + 24) = v8;
    goto LABEL_12;
  }
  id v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke_cold_1((uint64_t)v5, v6);
  }

LABEL_12:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke_9()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke_9_cold_1(v0);
  }
}

+ (id)closestLOI:(id)a3 toLocation:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v27;
    double v11 = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v14 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        uint64_t v15 = [v13 location];
        [v15 latitude];
        double v17 = v16;
        uint64_t v18 = [v13 location];
        [v18 longitude];
        id v20 = (void *)[v14 initWithLatitude:v17 longitude:v19];

        [v6 distanceFromLocation:v20];
        if (v21 < v11)
        {
          double v22 = v21;
          id v23 = v13;

          double v11 = v22;
          uint64_t v9 = v23;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
}

void __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_ERROR, "Error while fetching routine mode from CoreRoutine. Error: %@", (uint8_t *)&v2, 0xCu);
}

void __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke_9_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_ERROR, "CoreRoutine did not return any routine mode. Returning ATXRoutineModeUnknown.", v1, 2u);
}

@end