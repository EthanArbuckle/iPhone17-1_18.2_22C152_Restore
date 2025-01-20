@interface PLFrequentLocationManager
- (BOOL)frequentLocationsDidChangeFromUpdateWithMoments:(id)a3;
- (NSSet)currentFrequentLocations;
- (PLFrequentLocationManager)initWithMomentGenerationDataManager:(id)a3;
- (PLMomentGenerationDataManagement)momentGenerationDataManager;
- (id)_createFrequentLocationsWithMoments:(id)a3;
- (void)invalidateCurrentFrequentLocations;
- (void)setCurrentFrequentLocations:(id)a3;
- (void)setMomentGenerationDataManager:(id)a3;
@end

@implementation PLFrequentLocationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFrequentLocations, 0);
  objc_destroyWeak((id *)&self->_momentGenerationDataManager);
}

- (void)setCurrentFrequentLocations:(id)a3
{
}

- (NSSet)currentFrequentLocations
{
  return self->_currentFrequentLocations;
}

- (void)setMomentGenerationDataManager:(id)a3
{
}

- (PLMomentGenerationDataManagement)momentGenerationDataManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  return (PLMomentGenerationDataManagement *)WeakRetained;
}

- (id)_createFrequentLocationsWithMoments:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PLMomentGenerationGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CreateFrequentLocations", "", buf, 2u);
  }

  uint64_t v9 = mach_absolute_time();
  v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  v12 = [WeakRetained locationsOfInterest];
  v13 = +[PLFrequentLocationProcessor processFrequentLocationsWithItems:v10 locationsOfInterest:v12 progressBlock:0];

  uint64_t v14 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v17 = v8;
  v18 = v17;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    uint64_t v19 = [v4 count];
    *(_DWORD *)buf = 134217984;
    v26 = (const char *)v19;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v6, "CreateFrequentLocations", "[FrequentLocationGeneration] Creating Frequent Locations for %lu moments", buf, 0xCu);
  }

  v20 = v18;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    float v21 = (float)((float)((float)(v14 - v9) * (float)numer) / (float)denom) / 1000000.0;
    v22 = objc_msgSend(NSString, "stringWithFormat:", @"[FrequentLocationGeneration] Creating Frequent Locations for %lu moments", objc_msgSend(v4, "count"));
    *(_DWORD *)buf = 136315650;
    v26 = "CreateFrequentLocations";
    __int16 v27 = 2112;
    v28 = v22;
    __int16 v29 = 2048;
    double v30 = v21;
    _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  return v13;
}

- (void)invalidateCurrentFrequentLocations
{
  self->_invalidateCurrentFrequentLocations = 1;
}

- (BOOL)frequentLocationsDidChangeFromUpdateWithMoments:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLFrequentLocationManager *)self currentFrequentLocations];
  if ([v5 count])
  {
    BOOL invalidateCurrentFrequentLocations = self->_invalidateCurrentFrequentLocations;

    if (!invalidateCurrentFrequentLocations)
    {
      BOOL v7 = 0;
      goto LABEL_28;
    }
  }
  else
  {
  }
  v8 = [(PLFrequentLocationManager *)self currentFrequentLocations];
  uint64_t v9 = (void *)[v8 copy];

  v10 = [(PLFrequentLocationManager *)self _createFrequentLocationsWithMoments:v4];
  [(PLFrequentLocationManager *)self setCurrentFrequentLocations:v10];

  self->_BOOL invalidateCurrentFrequentLocations = 0;
  uint64_t v11 = [v9 count];
  v12 = [(PLFrequentLocationManager *)self currentFrequentLocations];
  uint64_t v13 = [v12 count];

  if (v11 == v13)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v14 = [(PLFrequentLocationManager *)self currentFrequentLocations];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      id v26 = v4;
      while (1)
      {
        uint64_t v18 = 0;
LABEL_9:
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * v18);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v20 = v9;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (!v21) {
          break;
        }
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v28;
LABEL_13:
        uint64_t v24 = 0;
        while (1)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v20);
          }
          if ([*(id *)(*((void *)&v27 + 1) + 8 * v24) isSimilarToFrequentLocation:v19]) {
            break;
          }
          if (v22 == ++v24)
          {
            uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v22) {
              goto LABEL_13;
            }
            goto LABEL_24;
          }
        }

        if (++v18 != v16) {
          goto LABEL_9;
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
        BOOL v7 = 0;
        id v4 = v26;
        if (!v16) {
          goto LABEL_26;
        }
      }
LABEL_24:

      BOOL v7 = 1;
      id v4 = v26;
    }
    else
    {
      BOOL v7 = 0;
    }
LABEL_26:
  }
  else
  {
    BOOL v7 = 1;
  }

LABEL_28:
  return v7;
}

- (PLFrequentLocationManager)initWithMomentGenerationDataManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLFrequentLocationManager;
  v5 = [(PLFrequentLocationManager *)&v9 init];
  os_signpost_id_t v6 = v5;
  if (v5)
  {
    v5->_BOOL invalidateCurrentFrequentLocations = 0;
    objc_storeWeak((id *)&v5->_momentGenerationDataManager, v4);
    BOOL v7 = [MEMORY[0x1E4F1CAD0] set];
    [(PLFrequentLocationManager *)v6 setCurrentFrequentLocations:v7];
  }
  return v6;
}

@end