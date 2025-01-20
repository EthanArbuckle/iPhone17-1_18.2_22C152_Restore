@interface PGSharedLibraryAssetPropertiesMetricEvent
- (NSArray)payloads;
- (NSDictionary)resultsByAssetIdentifier;
- (NSString)description;
- (NSString)identifier;
- (PGSharedLibraryAssetPropertiesMetricEvent)initWithWorkingContext:(id)a3 questionMetricType:(unsigned __int16)a4 metricEventFetchHelper:(id)a5;
- (void)gatherMetricsWithProgressBlock:(id)a3;
- (void)setResultsByAssetIdentifier:(id)a3;
@end

@implementation PGSharedLibraryAssetPropertiesMetricEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

- (void)setResultsByAssetIdentifier:(id)a3
{
}

- (NSDictionary)resultsByAssetIdentifier
{
  return self->_resultsByAssetIdentifier;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [(PGSharedLibraryAssetPropertiesMetricEvent *)self identifier];
  v8 = [(PGSharedLibraryAssetPropertiesMetricEvent *)self payloads];
  v9 = [v3 stringWithFormat:@"<%@: %p> %@:\nIdentifier:%@\nPayloads:%@", v4, self, v6, v7, v8];

  return (NSString *)v9;
}

- (void)gatherMetricsWithProgressBlock:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void *, unsigned char *, double))_Block_copy(a3);
  double v5 = 0.0;
  if (v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v24 = 0;
      v4[2](v4, &v24, 0.0);
      if (v24)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v29 = 62;
          __int16 v30 = 2080;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGSharedLibraryAssetPropertiesMetricEvent.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_30;
      }
      double v5 = Current;
    }
  }
  v7 = [(NSDictionary *)self->_resultsByAssetIdentifier allKeys];
  v8 = (void *)[v7 mutableCopy];

  if ([v8 count])
  {
    objc_msgSend(v8, "pha_shuffle");
    v17 = v8;
    v18 = v4;
    if ((unint64_t)[v8 count] <= 0x64)
    {
      id v9 = v8;
    }
    else
    {
      objc_msgSend(v8, "subarrayWithRange:", 0, 100);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v25 = @"result";
          v15 = [(NSDictionary *)self->_resultsByAssetIdentifier objectForKeyedSubscript:v14];
          v26 = v15;
          v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          [(NSMutableDictionary *)self->_payloadByAssetIdentifier setObject:v16 forKeyedSubscript:v14];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
      }
      while (v11);
    }

    v8 = v17;
    uint64_t v4 = v18;
    if (v18)
    {
      if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
      {
        char v24 = 0;
        v18[2](v18, &v24, 1.0);
        if (v24)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v29 = 79;
            __int16 v30 = 2080;
            v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGSharedLibraryAssetPropertiesMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
  }
  else if (v4)
  {
    if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
    {
      char v24 = 0;
      v4[2](v4, &v24, 1.0);
      if (v24)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v29 = 66;
          __int16 v30 = 2080;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGSharedLibraryAssetPropertiesMetricEvent.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_30:
}

- (NSArray)payloads
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_payloadByAssetIdentifier count])
  {
    v3 = [(NSMutableDictionary *)self->_payloadByAssetIdentifier allKeys];
    uint64_t v4 = [v3 mutableCopy];

    double v5 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
    uint64_t v6 = [v5 librarySpecificFetchOptions];

    long long v21 = (void *)v6;
    long long v22 = (void *)v4;
    v7 = [MEMORY[0x1E4F38EB8] fetchAssetsWithUUIDs:v4 options:v6];
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v9 = self;
    v28.receiver = self;
    v28.super_class = (Class)PGSharedLibraryAssetPropertiesMetricEvent;
    uint64_t v10 = [(PGPhotosChallengeMetricEvent *)&v28 payload];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v7;
    uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v16 = (void *)[v10 mutableCopy];
          payloadByAssetIdentifier = v9->_payloadByAssetIdentifier;
          v18 = [v15 uuid];
          v19 = [(NSMutableDictionary *)payloadByAssetIdentifier objectForKeyedSubscript:v18];
          [v16 addEntriesFromDictionary:v19];

          [v16 setObject:v15 forKeyedSubscript:@"assets"];
          [v8 addObject:v16];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v12);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v8;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.Photos.Intelligence.PhotosChallenge.SharedLibraryAssets";
}

- (PGSharedLibraryAssetPropertiesMetricEvent)initWithWorkingContext:(id)a3 questionMetricType:(unsigned __int16)a4 metricEventFetchHelper:(id)a5
{
  uint64_t v6 = a4;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGSharedLibraryAssetPropertiesMetricEvent;
  uint64_t v10 = [(PGPhotosChallengeMetricEvent *)&v15 initWithWorkingContext:v9 questionMetricType:v6 metricEventFetchHelper:a5];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workingContext, a3);
    uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    payloadByAssetIdentifier = v11->_payloadByAssetIdentifier;
    v11->_payloadByAssetIdentifier = v12;
  }
  return v11;
}

@end