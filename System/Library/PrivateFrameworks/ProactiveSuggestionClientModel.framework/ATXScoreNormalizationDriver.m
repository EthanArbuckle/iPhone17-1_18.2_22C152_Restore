@interface ATXScoreNormalizationDriver
+ (id)defaultArchivePath;
+ (void)deleteArchiveFile;
- (ATXBMBookmark)scoreHarvestingStreamBookmark;
- (ATXScoreNormalizationDriver)init;
- (BOOL)addScoreForModelWithClientModelId:(id)a3 clientModelVersion:(id)a4 score:(id)a5;
- (BOOL)registerModelWithClientModelId:(id)a3 clientModelVersion:(id)a4 normalizationParameters:(id)a5;
- (NSMutableDictionary)scoreNormalizationModelsDict;
- (id)_normalizeScoreHelper:(id)a3 modelKey:(id)a4;
- (id)getNormalizationModelWithClientModelId:(id)a3 clientModelVersion:(id)a4;
- (id)getOrMakeScoreNormalizationModelsDictionary;
- (id)getPayloadFromArchiveAtPath:(id)a3;
- (id)getUniqueModelKeyForClientModelId:(id)a3 clientModelVersion:(id)a4;
- (id)normalizeScore:(id)a3 clientModelId:(id)a4 clientModelVersion:(id)a5;
- (void)initStreamBookmark;
- (void)modelScoreHarvesting;
- (void)persistBookmark;
- (void)setScoreHarvestingStreamBookmark:(id)a3;
- (void)setScoreNormalizationModelsDict:(id)a3;
- (void)writeArchive:(id)a3 toFilePath:(id)a4;
- (void)writeArchiveFromDict:(id)a3;
@end

@implementation ATXScoreNormalizationDriver

- (ATXScoreNormalizationDriver)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXScoreNormalizationDriver;
  v2 = [(ATXScoreNormalizationDriver *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(ATXScoreNormalizationDriver *)v2 getOrMakeScoreNormalizationModelsDictionary];
    v5 = v4;
    if (v4) {
      uint64_t v6 = [v4 mutableCopy];
    }
    else {
      uint64_t v6 = objc_opt_new();
    }
    v7 = (void *)v6;
    [(ATXScoreNormalizationDriver *)v3 setScoreNormalizationModelsDict:v6];

    [(ATXScoreNormalizationDriver *)v3 setScoreHarvestingStreamBookmark:0];
  }
  return v3;
}

- (BOOL)registerModelWithClientModelId:(id)a3 clientModelVersion:(id)a4 normalizationParameters:(id)a5
{
  id v8 = a5;
  objc_super v9 = [(ATXScoreNormalizationDriver *)self getUniqueModelKeyForClientModelId:a3 clientModelVersion:a4];
  v10 = [(ATXScoreNormalizationDriver *)self scoreNormalizationModelsDict];
  v11 = [v10 objectForKey:v9];

  v12 = [(ATXScoreNormalizationDriver *)self scoreNormalizationModelsDict];
  v13 = v12;
  if (v11)
  {
    v14 = [v12 objectForKeyedSubscript:v9];
    [(ATXScoreNormalizationModel *)v14 setParameters:v8];
  }
  else
  {
    v14 = [[ATXScoreNormalizationModel alloc] initWithParameters:v8 circularBuffer:0 bufferHead:0 isBufferSorted:1];

    [v13 setValue:v14 forKey:v9];
  }

  return 1;
}

- (BOOL)addScoreForModelWithClientModelId:(id)a3 clientModelVersion:(id)a4 score:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ATXScoreNormalizationDriver *)self getUniqueModelKeyForClientModelId:v8 clientModelVersion:v9];
  v12 = [(ATXScoreNormalizationDriver *)self scoreNormalizationModelsDict];
  v13 = [v12 objectForKey:v11];

  if (v13)
  {
    v14 = [(ATXScoreNormalizationDriver *)self scoreNormalizationModelsDict];
    v15 = [v14 objectForKeyedSubscript:v11];

    [v15 addScore:v10];
  }
  else
  {
    v16 = __atxlog_handle_blending();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[ATXScoreNormalizationDriver addScoreForModelWithClientModelId:clientModelVersion:score:]((uint64_t)v8, (uint64_t)v9, v16);
    }
  }
  return v13 != 0;
}

- (id)normalizeScore:(id)a3 clientModelId:(id)a4 clientModelVersion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ATXScoreNormalizationDriver *)self getUniqueModelKeyForClientModelId:v9 clientModelVersion:v10];
  v12 = [(ATXScoreNormalizationDriver *)self _normalizeScoreHelper:v8 modelKey:v11];
  v13 = __atxlog_handle_blending();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138413058;
    id v16 = v8;
    __int16 v17 = 2112;
    v18 = v12;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_1AE67F000, v13, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: score normalized(score : %@, normalized: %@) with model %@ with version %@", (uint8_t *)&v15, 0x2Au);
  }

  return v12;
}

- (id)_normalizeScoreHelper:(id)a3 modelKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ATXScoreNormalizationDriver *)self scoreNormalizationModelsDict];
  id v9 = [v8 objectForKey:v7];

  if (v9)
  {
    id v10 = [(ATXScoreNormalizationDriver *)self scoreNormalizationModelsDict];
    v11 = [v10 objectForKeyedSubscript:v7];

    v12 = [v11 normalizeScore:v6];
  }
  else
  {
    v12 = &unk_1F0627F10;
  }

  return v12;
}

- (id)getNormalizationModelWithClientModelId:(id)a3 clientModelVersion:(id)a4
{
  v5 = [(ATXScoreNormalizationDriver *)self getUniqueModelKeyForClientModelId:a3 clientModelVersion:a4];
  id v6 = [(ATXScoreNormalizationDriver *)self scoreNormalizationModelsDict];
  id v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

- (id)getUniqueModelKeyForClientModelId:(id)a3 clientModelVersion:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@_%@", a3, a4];
}

+ (id)defaultArchivePath
{
  return (id)[MEMORY[0x1E4F4B650] scoreNormalizationModelFileWithFilename:@"ATXScoreNormalizationArtifacts.archive"];
}

- (id)getPayloadFromArchiveAtPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v14 = 0;
  v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3 options:2 error:&v14];
  id v5 = v14;
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    id v7 = v5;
    id v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_1AE67F000, v8, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: Error with reading from archived ATXScoreNormalizationArtifacts file with possible error %@", buf, 0xCu);
    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  id v9 = (void *)MEMORY[0x1B3E6F520](v5);
  id v13 = 0;
  id v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v13];
  id v7 = v13;
  if (v7)
  {
    id v10 = __atxlog_handle_blending();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE67F000, v10, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: Error with unarchiving ATXScoreNormalizationArtifacts file.", buf, 2u);
    }

    goto LABEL_11;
  }
  v11 = [v8 scoreNormalizationModelsDict];
LABEL_12:

  return v11;
}

- (id)getOrMakeScoreNormalizationModelsDictionary
{
  id v3 = +[ATXScoreNormalizationDriver defaultArchivePath];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = [(ATXScoreNormalizationDriver *)self getPayloadFromArchiveAtPath:v3];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    [(ATXScoreNormalizationDriver *)self writeArchiveFromDict:v6];
  }

  return v6;
}

- (void)writeArchiveFromDict:(id)a3
{
  id v4 = a3;
  id v6 = [[ATXScoreNormalizationArtifactsArchive alloc] initWithScoreNormalizationModelsDictionary:v4];

  int v5 = +[ATXScoreNormalizationDriver defaultArchivePath];
  [(ATXScoreNormalizationDriver *)self writeArchive:v6 toFilePath:v5];
}

- (void)writeArchive:(id)a3 toFilePath:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    id v8 = (void *)MEMORY[0x1B3E6F520]();
    id v18 = 0;
    id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v18];
    id v10 = v18;
    if (v10)
    {
LABEL_17:

      goto LABEL_18;
    }
    v11 = [v7 stringByDeletingLastPathComponent];
    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v17 = 0;
    [v12 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v10 = v17;

    if (v10)
    {
      id v13 = __atxlog_handle_blending();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v10;
        id v14 = "ATXScoreNormalizationDriver: Archiving fails with error %@";
LABEL_12:
        _os_log_impl(&dword_1AE67F000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
      }
    }
    else
    {
      id v16 = 0;
      [v9 writeToFile:v7 options:1 error:&v16];
      id v10 = v16;
      id v13 = __atxlog_handle_blending();
      BOOL v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (!v10)
      {
        if (v15)
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v7;
          _os_log_impl(&dword_1AE67F000, v13, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: Successfully persisted dictionary: %@", buf, 0xCu);
        }
        id v10 = 0;
        goto LABEL_16;
      }
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v10;
        id v14 = "ATXScoreNormalizationDriver: Persisting dictionary fails with error %@";
        goto LABEL_12;
      }
    }
LABEL_16:

    goto LABEL_17;
  }
  id v10 = __atxlog_handle_blending();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE67F000, v10, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: Empty archive or filePath when trying to persist ATXScoreNormalizationArtifactsArchive.", buf, 2u);
  }
LABEL_18:
}

+ (void)deleteArchiveFile
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = +[ATXScoreNormalizationDriver defaultArchivePath];
  if ([v2 fileExistsAtPath:v3])
  {
    id v10 = 0;
    [v2 removeItemAtPath:v3 error:&v10];
    id v4 = v10;
    id v5 = __atxlog_handle_blending();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412546;
        v12 = v3;
        __int16 v13 = 2112;
        id v14 = v4;
        id v7 = "ATXScoreNormalizationDriver: Error in deleting file %@: %@";
        id v8 = v5;
        uint32_t v9 = 22;
LABEL_7:
        _os_log_impl(&dword_1AE67F000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
    else if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      id v7 = "ATXScoreNormalizationDriver: File deleted: %@";
      id v8 = v5;
      uint32_t v9 = 12;
      goto LABEL_7;
    }
  }
}

- (void)initStreamBookmark
{
  id v7 = [MEMORY[0x1E4F4B650] scoreNormalizationModelFileWithFilename:@"clientModelStreamBookmark"];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v7];
  id v4 = [MEMORY[0x1E4F4B618] bookmarkFromURLPath:v3 maxFileSize:1000000 versionNumber:&unk_1F0627F28];
  [(ATXScoreNormalizationDriver *)self setScoreHarvestingStreamBookmark:v4];

  id v5 = [(ATXScoreNormalizationDriver *)self scoreHarvestingStreamBookmark];

  if (!v5)
  {
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F4B618]) initWithURLPath:v3 versionNumber:&unk_1F0627F28 bookmark:0 metadata:0];
    [(ATXScoreNormalizationDriver *)self setScoreHarvestingStreamBookmark:v6];
  }
}

- (void)modelScoreHarvesting
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  [(ATXScoreNormalizationDriver *)self initStreamBookmark];
  id v3 = __atxlog_handle_blending();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1AE67F000, v3, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: Model score harvesting, starting...", (uint8_t *)&buf, 2u);
  }

  id v4 = __atxlog_handle_blending();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(ATXScoreNormalizationDriver *)self scoreHarvestingStreamBookmark];
    BOOL v6 = [v5 bookmark];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1AE67F000, v4, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: scoreHarvestingStreamBookmark %@", (uint8_t *)&buf, 0xCu);
  }
  id v7 = objc_opt_new();
  v29 = [v7 publisherFromStartTime:0.0];

  id v8 = [[ATXScoreNormalizationParameters alloc] initWithBufferSize:&unk_1F0627F40];
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  objc_initWeak(&location, self);
  id v10 = [(ATXScoreNormalizationDriver *)self scoreHarvestingStreamBookmark];
  v11 = [v10 bookmark];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __51__ATXScoreNormalizationDriver_modelScoreHarvesting__block_invoke;
  v37[3] = &unk_1E5F01758;
  objc_copyWeak(&v40, &location);
  p_long long buf = &buf;
  v12 = v9;
  v38 = v12;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __51__ATXScoreNormalizationDriver_modelScoreHarvesting__block_invoke_62;
  v34[3] = &unk_1E5F01780;
  v34[4] = self;
  __int16 v13 = v8;
  v35 = v13;
  v36 = &buf;
  id v14 = (id)[v29 sinkWithBookmark:v11 completion:v37 receiveInput:v34];

  if ([MEMORY[0x1E4F93B18] waitForSemaphore:v12 timeoutSeconds:2.0] == 1)
  {
    uint64_t v15 = __atxlog_handle_blending();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      *(_DWORD *)v43 = 138412290;
      v44 = v17;
      _os_log_impl(&dword_1AE67F000, v15, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: %@ - event processing timeout", v43, 0xCu);
    }
  }
  else
  {
    id v18 = __atxlog_handle_blending();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v19);
      uint64_t v21 = *(void *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)v43 = 138412546;
      v44 = v20;
      __int16 v45 = 2048;
      uint64_t v46 = v21;
      _os_log_impl(&dword_1AE67F000, v18, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: %@ - processed %ld events", v43, 0x16u);
    }
    if (*(uint64_t *)(*((void *)&buf + 1) + 24) >= 1) {
      [(ATXScoreNormalizationDriver *)self persistBookmark];
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v22 = [(ATXScoreNormalizationDriver *)self scoreNormalizationModelsDict];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v31;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v30 + 1) + 8 * v25);
          v27 = [(ATXScoreNormalizationDriver *)self scoreNormalizationModelsDict];
          v28 = [v27 objectForKeyedSubscript:v26];

          [v28 getStateReadyForNormalization];
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v23);
    }

    uint64_t v15 = [(ATXScoreNormalizationDriver *)self scoreNormalizationModelsDict];
    [(ATXScoreNormalizationDriver *)self writeArchiveFromDict:v15];
  }

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

void __51__ATXScoreNormalizationDriver_modelScoreHarvesting__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 1)
    {
      id v8 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_semaphore_t v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        int v19 = 138412290;
        id v20 = v10;
        _os_log_impl(&dword_1AE67F000, v8, OS_LOG_TYPE_DEFAULT, "%@ - obtained new bookmark", (uint8_t *)&v19, 0xCu);
      }
      id v11 = objc_alloc(MEMORY[0x1E4F4B618]);
      v12 = [WeakRetained[2] urlPath];
      uint64_t v13 = [v11 initWithURLPath:v12 versionNumber:&unk_1F0627F28 bookmark:v6 metadata:0];
      id v14 = WeakRetained[2];
      WeakRetained[2] = (id)v13;
    }
    id v15 = v5;
    uint64_t v16 = [v15 state];
    id v17 = __atxlog_handle_blending();
    id v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __51__ATXScoreNormalizationDriver_modelScoreHarvesting__block_invoke_cold_1(v15, v18);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1AE67F000, v18, OS_LOG_TYPE_INFO, "ATXScoreNormalizationDriver: Model score harvesting, stream sink complete.", (uint8_t *)&v19, 2u);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __51__ATXScoreNormalizationDriver_modelScoreHarvesting__block_invoke_62(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = [a2 eventBody];
  id v4 = [v3 suggestions];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v23 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        dispatch_semaphore_t v9 = (void *)a1[4];
        id v10 = [v8 clientModelSpecification];
        id v11 = [v10 clientModelId];
        v12 = [v8 clientModelSpecification];
        uint64_t v13 = [v12 clientModelVersion];
        [v9 registerModelWithClientModelId:v11 clientModelVersion:v13 normalizationParameters:a1[5]];

        id v14 = (void *)a1[4];
        id v15 = [v8 clientModelSpecification];
        uint64_t v16 = [v15 clientModelId];
        id v17 = [v8 clientModelSpecification];
        id v18 = [v17 clientModelVersion];
        int v19 = NSNumber;
        id v20 = [v8 scoreSpecification];
        [v20 rawScore];
        uint64_t v21 = objc_msgSend(v19, "numberWithDouble:");
        [v14 addScoreForModelWithClientModelId:v16 clientModelVersion:v18 score:v21];

        ++*(void *)(*(void *)(a1[6] + 8) + 24);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }
}

- (void)persistBookmark
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(ATXScoreNormalizationDriver *)self scoreHarvestingStreamBookmark];
  id v10 = 0;
  [v3 saveBookmarkWithError:&v10];
  id v4 = v10;

  uint64_t v5 = __atxlog_handle_blending();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = [(ATXScoreNormalizationDriver *)self scoreHarvestingStreamBookmark];
    dispatch_semaphore_t v9 = [v8 urlPath];
    *(_DWORD *)long long buf = 138412802;
    v12 = v7;
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1AE67F000, v5, OS_LOG_TYPE_DEFAULT, "%@ - persisted score normalization bookmark to path %@ with error: %@", buf, 0x20u);
  }
}

- (NSMutableDictionary)scoreNormalizationModelsDict
{
  return self->_scoreNormalizationModelsDict;
}

- (void)setScoreNormalizationModelsDict:(id)a3
{
}

- (ATXBMBookmark)scoreHarvestingStreamBookmark
{
  return self->_scoreHarvestingStreamBookmark;
}

- (void)setScoreHarvestingStreamBookmark:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreHarvestingStreamBookmark, 0);
  objc_storeStrong((id *)&self->_scoreNormalizationModelsDict, 0);
}

- (void)addScoreForModelWithClientModelId:(uint64_t)a1 clientModelVersion:(uint64_t)a2 score:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "ATXScoreNormalizationDriver: addScoreForModelWithClientModelId called with model ID %@ and version %@ that does not map to a registered model key", (uint8_t *)&v3, 0x16u);
}

void __51__ATXScoreNormalizationDriver_modelScoreHarvesting__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 error];
  id v4 = [v3 description];
  int v5 = 136315138;
  uint64_t v6 = [v4 UTF8String];
  _os_log_error_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_ERROR, "ATXScoreNormalizationDriver: Model score harvesting, Error: %s", (uint8_t *)&v5, 0xCu);
}

@end