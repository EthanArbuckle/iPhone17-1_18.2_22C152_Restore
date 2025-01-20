@interface SREMusicRetrievalModel
+ (id)sharedInstance;
+ (void)sharedInstance;
- (BOOL)_loadModelWithError:(id *)a3;
- (MMapStruct)modelMMap;
- (SREMusicRetrievalModel)initWithError:(id *)a3;
- (SRResources)resources;
- (id)inferenceWithSequence:(id)a3 query:(id)a4 error:(id *)a5;
- (void)setModelMMap:(id)a3;
- (void)setResources:(id)a3;
@end

@implementation SREMusicRetrievalModel

+ (id)sharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)sharedInstance_sharedInstance;
  if (!sharedInstance_sharedInstance)
  {
    id v11 = 0;
    v4 = [[SREMusicRetrievalModel alloc] initWithError:&v11];
    id v5 = v11;
    v6 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v4;

    if (sharedInstance_sharedInstance)
    {
      v7 = logForCSLogCategoryRecs();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_25E363000, v7, OS_LOG_TYPE_DEFAULT, "Created shared SREMusicRetrievalModel instance.", v10, 2u);
      }
    }
    else
    {
      v7 = logForCSLogCategoryRecs();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[SREMusicRetrievalModel sharedInstance];
      }
    }

    v3 = (void *)sharedInstance_sharedInstance;
  }
  id v8 = v3;
  objc_sync_exit(v2);

  return v8;
}

- (SREMusicRetrievalModel)initWithError:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SREMusicRetrievalModel;
  v3 = [(SREMusicRetrievalModel *)&v10 init];
  v4 = v3;
  if (v3)
  {
    [(SREMusicRetrievalModel *)v3 setModelMMap:0];
    id v5 = [MEMORY[0x263F78D00] sharedResourcesManager];
    v6 = [MEMORY[0x263EFF960] currentLocale];
    [v5 loadAllParametersForClient:@"Spotlight" locale:v6];

    v7 = [MEMORY[0x263EFF960] currentLocale];
    id v8 = [v5 resourcesForClient:@"Spotlight" locale:v7 options:&unk_270B178A0];
    [(SREMusicRetrievalModel *)v4 setResources:v8];
  }
  return v4;
}

- (id)inferenceWithSequence:(id)a3 query:(id)a4 error:(id *)a5
{
  v52[100] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (![(SREMusicRetrievalModel *)self _loadModelWithError:a5])
  {
    v17 = 0;
    goto LABEL_31;
  }
  bzero(v52, 0x320uLL);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v13 = 0;
    uint64_t v14 = *(void *)v39;
    while (2)
    {
      uint64_t v15 = 0;
      if (v13 <= 0x64) {
        unint64_t v16 = 100 - v13;
      }
      else {
        unint64_t v16 = 0;
      }
      do
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v10);
        }
        if (v16 == v15)
        {
          v13 += v15;
          goto LABEL_15;
        }
        v52[v13 + v15] = [*(id *)(*((void *)&v38 + 1) + 8 * v15) adamID];
        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v51 count:16];
      v13 += v15;
      if (v12) {
        continue;
      }
      break;
    }
LABEL_15:

    if (v13 > 0x63) {
      goto LABEL_19;
    }
  }
  else
  {

    unint64_t v13 = 0;
  }
  bzero(&v52[v13], 800 - 8 * v13);
LABEL_19:
  bzero(v50, 0x320uLL);
  long long v34 = 0u;
  uint64_t v35 = 0;
  DWORD1(v34) = 15;
  uint64_t v33 = 0x2000000019;
  id v18 = [v9 genreID];
  uint64_t v19 = [v18 UTF8String];
  uint64_t v36 = v19;

  id v20 = [v9 genreID];
  uint64_t v37 = strlen((const char *)[v20 UTF8String]);

  v21 = logForCSLogCategoryRecs();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v19;
    _os_log_impl(&dword_25E363000, v21, OS_LOG_TYPE_DEFAULT, "Calling music retrieval model. input_len=%zu preferred_genre_name=%s", buf, 0x16u);
  }

  memset(buf, 0, sizeof(buf));
  int v49 = 0;
  v22 = [(SREMusicRetrievalModel *)self modelMMap];
  unsigned int v23 = retrieval_flatbuffer(v52, v13, 100, v50, (unsigned int *)[v22 buffer], (uint64_t)&v33, (uint64_t)buf);

  if (v23)
  {
    v24 = logForCSLogCategoryRecs();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[SREMusicRetrievalModel inferenceWithSequence:query:error:](v23, v24);
    }

    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.SREMusicRetrievalModel" code:v23 userInfo:0];
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
    v25 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
    for (uint64_t i = 0; i != 100; ++i)
    {
      if (i >= *(int *)&buf[4] + (uint64_t)*(int *)buf) {
        break;
      }
      v27 = [NSNumber numberWithLongLong:v50[i]];
      [v17 addObject:v27];

      v28 = [NSNumber numberWithLongLong:v50[i]];
      v29 = [v28 stringValue];
      [v25 addObject:v29];
    }
    v30 = [v25 componentsJoinedByString:@","];
    v31 = logForCSLogCategoryRecs();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v42 = 67109634;
      int v43 = *(_DWORD *)buf;
      __int16 v44 = 1024;
      int v45 = *(_DWORD *)&buf[4];
      __int16 v46 = 2112;
      v47 = v30;
      _os_log_impl(&dword_25E363000, v31, OS_LOG_TYPE_DEFAULT, "Music retrieval output (genre:%d, ann:%d):%@", v42, 0x18u);
    }
  }
LABEL_31:

  return v17;
}

- (BOOL)_loadModelWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = [(SREMusicRetrievalModel *)self resources];
  if ([v5 hasUpdates])
  {
  }
  else
  {
    v6 = [(SREMusicRetrievalModel *)self modelMMap];

    if (v6) {
      return 1;
    }
  }
  id v8 = [(SREMusicRetrievalModel *)self resources];
  id v9 = [v8 filePathArrayForKey:@"MusicRetrieval" didFailWithError:a3];

  if (v9 && [v9 count])
  {
    id v10 = [v9 objectAtIndexedSubscript:0];
    uint64_t v11 = logForCSLogCategoryRecs();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      uint64_t v20 = (uint64_t)v10;
      _os_log_impl(&dword_25E363000, v11, OS_LOG_TYPE_DEFAULT, "Loading music retrieval model file:%@", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v12 = +[MMapStruct mMapStructWithFilepath:v10];
    [(SREMusicRetrievalModel *)self setModelMMap:v12];

    unint64_t v13 = [(SREMusicRetrievalModel *)self modelMMap];

    uint64_t v14 = logForCSLogCategoryRecs();
    uint64_t v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v16 = [(SREMusicRetrievalModel *)self modelMMap];
        uint64_t v17 = [v16 size];
        int v19 = 134217984;
        uint64_t v20 = v17;
        _os_log_impl(&dword_25E363000, v15, OS_LOG_TYPE_DEFAULT, "Music Retrieval LSH model mmap done. mmap size: %ld", (uint8_t *)&v19, 0xCu);
      }
      BOOL v7 = 1;
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SREMusicRetrievalModel _loadModelWithError:](v15);
      }

      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.SREMusicRetrievalModel" code:-3001 userInfo:0];
      BOOL v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v10 = logForCSLogCategoryRecs();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SREMusicRetrievalModel _loadModelWithError:]((uint64_t *)a3, v10);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (MMapStruct)modelMMap
{
  return self->_modelMMap;
}

- (void)setModelMMap:(id)a3
{
}

- (SRResources)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_modelMMap, 0);
}

+ (void)sharedInstance
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25E363000, a2, OS_LOG_TYPE_ERROR, "Creating shared SREMusicRetrievalModel instance failed. Error=%@", (uint8_t *)&v2, 0xCu);
}

- (void)inferenceWithSequence:(int)a1 query:(NSObject *)a2 error:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_25E363000, a2, OS_LOG_TYPE_ERROR, "Music retrieval model inference failed. Error=%d", (uint8_t *)v2, 8u);
}

- (void)_loadModelWithError:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_25E363000, a2, OS_LOG_TYPE_ERROR, "Music Retrieval LSH model path not found. error=%@", (uint8_t *)&v3, 0xCu);
}

- (void)_loadModelWithError:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25E363000, log, OS_LOG_TYPE_ERROR, "Music Retrieval LSH model mmap failed.", v1, 2u);
}

@end