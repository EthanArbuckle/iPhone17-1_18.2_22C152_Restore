@interface TRIExternalParameterManager
- (NSDate)siriDeviceAggregationIdRotationDate;
- (TRIExternalParameterManager)init;
- (TRIExternalParameterManager)initWithProvider:(id)a3 paths:(id)a4;
- (id)_readParametersFromFile;
- (id)_readSiriDeviceAggregationIdRotationDateFromEvent:(id)a3;
- (id)dictionary;
- (void)_fetchSiriDeviceAggregationIdRotationDate;
- (void)_updateSystemInfo;
- (void)_writeParametersToFile;
@end

@implementation TRIExternalParameterManager

- (TRIExternalParameterManager)init
{
  v3 = objc_alloc_init(TRIBiomeDataStreamProvider);
  v4 = +[TRIStandardPaths sharedSystemPaths];
  v5 = [(TRIExternalParameterManager *)self initWithProvider:v3 paths:v4];

  return v5;
}

- (TRIExternalParameterManager)initWithProvider:(id)a3 paths:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TRIExternalParameterManager;
  v9 = [(TRIExternalParameterManager *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paramProvider, a3);
    uint64_t v11 = [v8 externalParametersFile];
    plistPath = v10->_plistPath;
    v10->_plistPath = (NSString *)v11;

    v13 = objc_opt_new();
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v13];
    lock = v10->_lock;
    v10->_lock = (_PASLock *)v14;

    v16 = [(TRIExternalParameterManager *)v10 _readParametersFromFile];
    v17 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v16;
      _os_log_debug_impl(&dword_19D909000, v17, OS_LOG_TYPE_DEBUG, "Reading params from cache: %@", buf, 0xCu);
    }

    v18 = v10->_lock;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __54__TRIExternalParameterManager_initWithProvider_paths___block_invoke;
    v21[3] = &unk_1E596B4B8;
    id v22 = v16;
    id v19 = v16;
    [(_PASLock *)v18 runWithLockAcquired:v21];
    [(TRIExternalParameterManager *)v10 _fetchSiriDeviceAggregationIdRotationDate];
  }
  return v10;
}

void __54__TRIExternalParameterManager_initWithProvider_paths___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"SiriDeviceAggregationIdRotationDate"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = (void *)MEMORY[0x1E4F1C9C8];
      [v3 doubleValue];
      uint64_t v5 = objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
      v6 = (void *)v7[1];
      v7[1] = v5;
    }
  }
}

- (id)dictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__TRIExternalParameterManager_dictionary__block_invoke;
  v7[3] = &unk_1E596B4B8;
  id v5 = v3;
  id v8 = v5;
  [(_PASLock *)lock runWithLockAcquired:v7];

  return v5;
}

void __41__TRIExternalParameterManager_dictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a2 + 8);
  if (v3)
  {
    v4 = NSNumber;
    [v3 timeIntervalSince1970];
    objc_msgSend(v4, "numberWithDouble:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"SiriDeviceAggregationIdRotationDate"];
  }
}

- (NSDate)siriDeviceAggregationIdRotationDate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__TRIExternalParameterManager_siriDeviceAggregationIdRotationDate__block_invoke;
  v5[3] = &unk_1E596B4E0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __66__TRIExternalParameterManager_siriDeviceAggregationIdRotationDate__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)_fetchSiriDeviceAggregationIdRotationDate
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__TRIExternalParameterManager__fetchSiriDeviceAggregationIdRotationDate__block_invoke;
  v6[3] = &unk_1E596B530;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  id v3 = (void *)MEMORY[0x19F3AD290](v6);
  paramProvider = self->_paramProvider;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__TRIExternalParameterManager__fetchSiriDeviceAggregationIdRotationDate__block_invoke_27;
  v5[3] = &unk_1E596B558;
  v5[4] = self;
  [(TRIExternalParameterProviding *)paramProvider readLastDataStreamEventForIdentifier:@"Siri.AnalyticsIdentifiers.UserAggregationId" withFilter:v5 eventHandler:v3];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __72__TRIExternalParameterManager__fetchSiriDeviceAggregationIdRotationDate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if (v6)
  {
    v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v6;
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "Error reading Siri.AnalyticsIdentifiers.UserAggregationId data stream %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v10 = (void *)*((void *)WeakRetained + 2);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__TRIExternalParameterManager__fetchSiriDeviceAggregationIdRotationDate__block_invoke_25;
    v11[3] = &unk_1E596B508;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    v13 = &v14;
    [v10 runWithLockAcquired:v11];
    if (*((unsigned char *)v15 + 24))
    {
      [v8 _writeParametersToFile];
      [v8 _updateSystemInfo];
    }
  }
  _Block_object_dispose(&v14, 8);
}

void __72__TRIExternalParameterManager__fetchSiriDeviceAggregationIdRotationDate__block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3[1];
  id v5 = [*(id *)(a1 + 32) _readSiriDeviceAggregationIdRotationDateFromEvent:*(void *)(a1 + 40)];
  if (v5)
  {
    objc_storeStrong(v3 + 1, v5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 isEqualToDate:v5] ^ 1;
  }
  else
  {
    id v6 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19D909000, v6, OS_LOG_TYPE_DEFAULT, "UserAggregationId rotation date is null, eventBody: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

BOOL __72__TRIExternalParameterManager__fetchSiriDeviceAggregationIdRotationDate__block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  id v5 = [v3 objectForKeyedSubscript:@"effectiveFrom"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  id v6 = [v4 objectForKeyedSubscript:@"validityDays"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_8:
    BOOL v17 = 0;
    goto LABEL_9;
  }
  int v8 = [MEMORY[0x1E4F1C9C8] now];
  [v8 timeIntervalSince1970];
  double v10 = v9;

  id v11 = [v4 objectForKeyedSubscript:@"effectiveFrom"];
  [v11 doubleValue];
  double v13 = v12;

  uint64_t v14 = [*(id *)(a1 + 32) _readSiriDeviceAggregationIdRotationDateFromEvent:v4];
  [v14 timeIntervalSince1970];
  double v16 = v15;

  BOOL v17 = v10 < v16 && v10 >= v13;
LABEL_9:

  return v17;
}

- (id)_readSiriDeviceAggregationIdRotationDateFromEvent:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    BOOL v17 = TRILogCategory_ClientFramework();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v22) = 0;
    v18 = "Invalid event body for Siri.AnalyticsIdentifiers.UserAggregationId data stream";
    id v19 = v17;
    uint32_t v20 = 2;
LABEL_14:
    _os_log_error_impl(&dword_19D909000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v22, v20);
    goto LABEL_9;
  }
  id v5 = [v3 objectForKeyedSubscript:@"effectiveFrom"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 objectForKeyedSubscript:@"validityDays"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v8 = [v4 objectForKeyedSubscript:@"effectiveFrom"];
      [v8 doubleValue];
      double v10 = v9;

      id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v10];
      double v12 = [v4 objectForKeyedSubscript:@"validityDays"];
      uint64_t v13 = [v12 integerValue];
      uint64_t v14 = objc_opt_new();
      [v14 setDay:v13];
      double v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      double v16 = [v15 dateByAddingComponents:v14 toDate:v11 options:0];

      goto LABEL_10;
    }
  }
  else
  {
  }
  BOOL v17 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v22 = 138412290;
    objc_super v23 = v4;
    v18 = "Invalid type for Siri.AnalyticsIdentifiers.UserAggregationId event %@";
    id v19 = v17;
    uint32_t v20 = 12;
    goto LABEL_14;
  }
LABEL_9:

  double v16 = 0;
LABEL_10:

  return v16;
}

- (id)_readParametersFromFile
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_plistPath isDirectory:0];
  id v11 = 0;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v2 error:&v11];
  id v4 = v11;
  id v5 = v4;
  if (!v4)
  {
    id v9 = v3;
    goto LABEL_11;
  }
  id v6 = [v4 domain];
  if (![v6 isEqualToString:*MEMORY[0x1E4F281F8]])
  {

LABEL_8:
    int v8 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v2;
      __int16 v14 = 2112;
      double v15 = v5;
      _os_log_error_impl(&dword_19D909000, v8, OS_LOG_TYPE_ERROR, "failed to parse external parameter dictionary from file: %@ (%@)", buf, 0x16u);
    }
    goto LABEL_10;
  }
  uint64_t v7 = [v5 code];

  if (v7 != 260) {
    goto LABEL_8;
  }
  int v8 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D909000, v8, OS_LOG_TYPE_DEFAULT, "No cached external parameters.", buf, 2u);
  }
LABEL_10:

  id v9 = 0;
LABEL_11:

  return v9;
}

- (void)_writeParametersToFile
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  id v4 = (void *)MEMORY[0x1E4F28F98];
  id v5 = [(TRIExternalParameterManager *)self dictionary];
  id v6 = [v4 dataWithPropertyList:v5 format:100 options:0 error:0];

  plistPath = self->_plistPath;
  id v12 = 0;
  char v8 = [v6 writeToFile:plistPath options:1 error:&v12];
  id v9 = v12;
  if ((v8 & 1) == 0)
  {
    double v10 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = self->_plistPath;
      *(_DWORD *)buf = 138412546;
      __int16 v14 = v11;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "unable to write external parameters to file %@ -- %@", buf, 0x16u);
    }
  }
}

- (void)_updateSystemInfo
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistPath, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_paramProvider, 0);
}

@end