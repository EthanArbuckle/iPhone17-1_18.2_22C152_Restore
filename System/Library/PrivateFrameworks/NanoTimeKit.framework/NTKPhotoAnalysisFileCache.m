@interface NTKPhotoAnalysisFileCache
+ (id)sharedInstance;
- (BOOL)_load;
- (BOOL)_save;
- (NTKPhotoAnalysisFileCache)init;
- (id)photoAnalysisForIdentifier:(id)a3;
- (void)_dirtyCache;
- (void)dealloc;
- (void)setPhotoAnalysis:(id)a3 forIdentifier:(id)a4;
@end

@implementation NTKPhotoAnalysisFileCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_22 != -1) {
    dispatch_once(&sharedInstance_onceToken_22, &__block_literal_global_156);
  }
  v2 = (void *)sharedInstance___sharedInstance_8;
  return v2;
}

void __43__NTKPhotoAnalysisFileCache_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedInstance_8;
  sharedInstance___sharedInstance_8 = v0;
}

- (NTKPhotoAnalysisFileCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKPhotoAnalysisFileCache;
  v2 = [(NTKPhotoAnalysisFileCache *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    taskScheduler = v2->_taskScheduler;
    v2->_taskScheduler = (NTKTaskScheduler *)v3;

    if (![(NTKPhotoAnalysisFileCache *)v2 _load])
    {
      uint64_t v5 = objc_opt_new();
      cache = v2->_cache;
      v2->_cache = (NSMutableDictionary *)v5;

      v2->_sequenceNumber = 100;
    }
    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(NTKTaskScheduler *)self->_taskScheduler cancelAllTasks];
  v3.receiver = self;
  v3.super_class = (Class)NTKPhotoAnalysisFileCache;
  [(NTKPhotoAnalysisFileCache *)&v3 dealloc];
}

- (BOOL)_load
{
  return 0;
}

- (void)_dirtyCache
{
  if (!self->_cacheDirty)
  {
    self->_cacheDirty = 1;
    objc_initWeak(&location, self);
    taskScheduler = self->_taskScheduler;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__NTKPhotoAnalysisFileCache__dirtyCache__block_invoke;
    v5[3] = &unk_1E62C0820;
    objc_copyWeak(&v6, &location);
    id v4 = [(NTKTaskScheduler *)taskScheduler scheduleTask:v5 identifier:@"com.apple.ntk.NTKPhotoAnalysisCacheEntry"];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

uint64_t __40__NTKPhotoAnalysisFileCache__dirtyCache__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _save];

  return v2;
}

- (BOOL)_save
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(NSMutableDictionary *)self->_cache keysSortedByValueUsingComparator:&__block_literal_global_52_1];
  if ((int)[v3 count] < 151) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 count] - 150;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = 100;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        int v12 = v4 - 1;
        if (v4 < 1)
        {
          v14 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          [v14 setSequenceNumber:v9];

          uint64_t v9 = (v9 + 1);
        }
        else
        {
          v13 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v21 = v11;
            _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "[photo analysis file cache] evict %@", buf, 0xCu);
          }

          [(NSMutableDictionary *)self->_cache removeObjectForKey:v11];
          int v4 = v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }
  else
  {
    LODWORD(v9) = 100;
  }

  self->_cacheDirty = 0;
  self->_sequenceNumber = v9;

  return 1;
}

uint64_t __34__NTKPhotoAnalysisFileCache__save__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  LODWORD(a2) = [a2 sequenceNumber];
  int v5 = [v4 sequenceNumber];

  int v6 = a2 - v5;
  if ((int)a2 < v5) {
    int v6 = -1;
  }
  if (v6 >= 1) {
    return 1;
  }
  return v6;
}

- (id)photoAnalysisForIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(NSMutableDictionary *)self->_cache objectForKey:v4];
  int v6 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "[photo analysis file cache] found %@", (uint8_t *)&v10, 0xCu);
    }

    ++self->_sequenceNumber;
    objc_msgSend(v5, "setSequenceNumber:");
    [(NTKPhotoAnalysisFileCache *)self _dirtyCache];
    uint64_t v8 = [v5 analysis];
  }
  else
  {
    if (v7)
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "[photo analysis file cache] not found %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (void)setPhotoAnalysis:(id)a3 forIdentifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  ++self->_sequenceNumber;
  objc_msgSend(v8, "setSequenceNumber:");
  [v8 setAnalysis:v7];

  [(NSMutableDictionary *)self->_cache setObject:v8 forKey:v6];
  uint64_t v9 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "[photo analysis file cache] add %@", (uint8_t *)&v10, 0xCu);
  }

  [(NTKPhotoAnalysisFileCache *)self _dirtyCache];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end