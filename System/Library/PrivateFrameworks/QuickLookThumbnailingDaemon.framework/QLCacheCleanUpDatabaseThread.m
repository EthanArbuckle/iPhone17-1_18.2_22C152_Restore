@interface QLCacheCleanUpDatabaseThread
- (BOOL)_updateHitCount;
- (BOOL)diskCacheCleanupDone;
- (BOOL)shouldRemoveThumbnailsForDeletedFiles;
- (NSMutableDictionary)thumbnailsHit;
- (QLCacheCleanUpDatabaseThread)initWithCacheThread:(id)a3;
- (_QLCacheThread)cacheThread;
- (int)currentMode;
- (unint64_t)hitToSaveCount;
- (void)_stopWriteAndCleanUpThreadRunLoop;
- (void)_threadMain;
- (void)_writeAndCleanUp;
- (void)addHitWithThumbnailData:(id)a3;
- (void)cleanUpForReset;
- (void)dealloc;
- (void)pause;
- (void)setCacheThread:(id)a3;
- (void)setDiskCacheCleanupDone:(BOOL)a3;
- (void)setShouldRemoveThumbnailsForDeletedFiles:(BOOL)a3;
- (void)setThumbnailsHit:(id)a3;
- (void)startCleanUp;
- (void)stop;
@end

@implementation QLCacheCleanUpDatabaseThread

uint64_t __48__QLCacheCleanUpDatabaseThread__writeAndCleanUp__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = _dbLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __48__QLCacheCleanUpDatabaseThread__writeAndCleanUp__block_invoke_cold_2();
  }

  if ([*(id *)(a1 + 32) currentMode] == 1
    && ([*(id *)(a1 + 32) diskCacheCleanupDone] & 1) == 0)
  {
    *(void *)&long long v3 = 134218242;
    long long v25 = v3;
    do
    {
      v7 = (void *)MEMORY[0x1E01C5C90]();
      v8 = [*(id *)(a1 + 32) cacheThread];
      v9 = [v8 memoryCache];
      v10 = [v9 thumbnailDataToSaveWithBatch:20];

      v11 = _dbLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [v10 count];
        v13 = [*(id *)(a1 + 32) cacheThread];
        v14 = [v13 memoryCache];
        *(_DWORD *)buf = v25;
        uint64_t v27 = v12;
        __int16 v28 = 2112;
        v29 = v14;
        _os_log_impl(&dword_1DDC5E000, v11, OS_LOG_TYPE_INFO, "Writing %lu thumbnails from %@", buf, 0x16u);
      }
      v15 = *(void **)(a1 + 32);
      if (v10)
      {
        v16 = [v15 cacheThread];
        v17 = [v16 diskCache];
        [v17 writeThumbnailDataBatch:v10];

        v18 = [*(id *)(a1 + 32) cacheThread];
        v19 = [v18 memoryCache];
        [v19 thumbnailDataBatchSaved:v10];

        uint64_t v4 = 1;
      }
      else
      {
        LODWORD(v4) = [v15 _updateHitCount];
        v20 = [*(id *)(a1 + 32) cacheThread];
        v21 = [v20 diskCache];
        uint64_t v22 = [v21 cleanup];

        if (v22) {
          uint64_t v4 = 1;
        }
        else {
          uint64_t v4 = v4;
        }
        if (objc_msgSend(*(id *)(a1 + 32), "shouldRemoveThumbnailsForDeletedFiles", v25))
        {
          v23 = [*(id *)(a1 + 32) cacheThread];
          v24 = [v23 diskCache];
          if ([v24 cleanupDeletedFiles]) {
            uint64_t v4 = 1;
          }
          else {
            uint64_t v4 = v4;
          }
        }
        [*(id *)(a1 + 32) setDiskCacheCleanupDone:1];
        v18 = [*(id *)(a1 + 32) cacheThread];
        [v18 _cleanUpDatabaseDone];
      }
    }
    while ([*(id *)(a1 + 32) currentMode] == 1
         && ([*(id *)(a1 + 32) diskCacheCleanupDone] & 1) == 0);
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = _dbLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __48__QLCacheCleanUpDatabaseThread__writeAndCleanUp__block_invoke_cold_1();
  }

  return v4;
}

- (_QLCacheThread)cacheThread
{
  return (_QLCacheThread *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)diskCacheCleanupDone
{
  return self->_diskCacheCleanupDone;
}

- (int)currentMode
{
  return self->_currentMode;
}

- (BOOL)shouldRemoveThumbnailsForDeletedFiles
{
  return self->_shouldRemoveThumbnailsForDeletedFiles;
}

- (void)setDiskCacheCleanupDone:(BOOL)a3
{
  self->_diskCacheCleanupDone = a3;
}

- (unint64_t)hitToSaveCount
{
  long long v3 = self->_thumbnailsHit;
  objc_sync_enter(v3);
  unint64_t v4 = [(NSMutableDictionary *)self->_thumbnailsHit count];
  objc_sync_exit(v3);

  return v4;
}

- (void)addHitWithThumbnailData:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self->_thumbnailsHit;
  objc_sync_enter(v5);
  v6 = [QLCachedThumbnailDescriptor alloc];
  [v4 size];
  int v8 = v7;
  uint64_t v9 = [v4 iconMode];
  uint64_t v10 = [v4 badgeType];
  uint64_t v11 = [v4 externalGeneratorDataHash];
  LODWORD(v12) = v8;
  v13 = [(QLCachedThumbnailDescriptor *)v6 initWithSize:v9 iconMode:v10 badgeType:v11 externalGeneratorDataHash:v12];
  v14 = _dbLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = [v4 fileIdentifier];
    [(QLCacheCleanUpDatabaseThread *)v15 addHitWithThumbnailData:v14];
  }

  thumbnailsHit = self->_thumbnailsHit;
  v17 = [v4 fileIdentifier];
  id v18 = [(NSMutableDictionary *)thumbnailsHit objectForKey:v17];

  if (!v18)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v19 = self->_thumbnailsHit;
    v20 = [v4 fileIdentifier];
    [(NSMutableDictionary *)v19 setObject:v18 forKey:v20];
  }
  v21 = [v18 objectForKey:v13];
  uint64_t v22 = v21;
  if (v21) {
    uint64_t v23 = [v21 unsignedIntValue] + 1;
  }
  else {
    uint64_t v23 = 1;
  }
  v24 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v23];

  [v18 setObject:v24 forKey:v13];
  objc_sync_exit(v5);
}

- (BOOL)_updateHitCount
{
  long long v3 = self->_thumbnailsHit;
  objc_sync_enter(v3);
  id v4 = [(NSMutableDictionary *)self->_thumbnailsHit allKeys];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    v6 = [v4 objectAtIndex:0];
    int v7 = [(_QLCacheThread *)self->_cacheThread diskCache];
    int v8 = [(NSMutableDictionary *)self->_thumbnailsHit objectForKey:v6];
    [v7 updateHitCount:v8 forFileIdentifier:v6];

    [(NSMutableDictionary *)self->_thumbnailsHit removeObjectForKey:v6];
  }

  objc_sync_exit(v3);
  return v5 != 0;
}

- (void)startCleanUp
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "calling to stop the runloop", v2, v3, v4, v5, v6);
}

- (void)_stopWriteAndCleanUpThreadRunLoop
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "stopping runloop", v2, v3, v4, v5, v6);
}

- (void)pause
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "pause thread", v2, v3, v4, v5, v6);
}

- (void)_threadMain
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "getting runloop", v2, v3, v4, v5, v6);
}

- (void)_writeAndCleanUp
{
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1DDC5E000, v0, OS_LOG_TYPE_ERROR, "Unable to write memory cache on disk", v1, 2u);
}

- (QLCacheCleanUpDatabaseThread)initWithCacheThread:(id)a3
{
  id v5 = a3;
  uint8_t v6 = [(QLCacheCleanUpDatabaseThread *)self init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cacheThread, a3);
    int v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    thumbnailsHit = v7->_thumbnailsHit;
    v7->_thumbnailsHit = v8;

    v7->_currentMode = 0;
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    threadLock = v7->_threadLock;
    v7->_threadLock = (NSConditionLock *)v10;
  }
  return v7;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "dealloc QLCacheCleanUpDatabaseThread", v2, v3, v4, v5, v6);
}

- (void)stop
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "stop Writing thumbnails", v2, v3, v4, v5, v6);
}

- (void)cleanUpForReset
{
  [(NSConditionLock *)self->_threadLock lockWhenCondition:0];
  uint64_t v3 = [(_QLCacheThread *)self->_cacheThread diskCache];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke;
  v8[3] = &unk_1E6D0D030;
  v8[4] = self;
  char v4 = [v3 doWriting:v8];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [(_QLCacheThread *)self->_cacheThread memoryCache];
    [v5 reset];

    uint8_t v6 = [(QLCacheCleanUpDatabaseThread *)self thumbnailsHit];
    objc_sync_enter(v6);
    int v7 = [(QLCacheCleanUpDatabaseThread *)self thumbnailsHit];
    [v7 removeAllObjects];

    objc_sync_exit(v6);
  }
  [(NSConditionLock *)self->_threadLock unlock];
}

BOOL __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke(uint64_t a1)
{
  uint64_t v2 = _dbLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke_cold_3();
  }

  uint64_t v3 = [*(id *)(a1 + 32) cacheThread];
  char v4 = [v3 memoryCache];
  uint64_t v5 = [v4 thumbnailDataToSaveWithBatch:0];

  uint8_t v6 = _dbLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke_cold_2(v5, v6);
  }

  if (v5)
  {
    int v7 = [*(id *)(a1 + 32) cacheThread];
    int v8 = [v7 diskCache];
    [v8 discardThumbnailDataBatchForReset:v5];

    uint64_t v9 = [*(id *)(a1 + 32) cacheThread];
    uint64_t v10 = [v9 memoryCache];
    [v10 thumbnailDataBatchSaved:v5];
  }
  uint64_t v11 = [*(id *)(a1 + 32) thumbnailsHit];
  objc_sync_enter(v11);
  double v12 = [*(id *)(a1 + 32) thumbnailsHit];
  [v12 removeAllObjects];

  objc_sync_exit(v11);
  v13 = _dbLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke_cold_1();
  }

  return v5 != 0;
}

- (void)setShouldRemoveThumbnailsForDeletedFiles:(BOOL)a3
{
  self->_shouldRemoveThumbnailsForDeletedFiles = a3;
}

- (void)setCacheThread:(id)a3
{
}

- (NSMutableDictionary)thumbnailsHit
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setThumbnailsHit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong((id *)&self->_threadLock, 0);
  objc_storeStrong((id *)&self->_cacheThread, 0);
  objc_storeStrong((id *)&self->_thumbnailsHit, 0);
}

- (void)addHitWithThumbnailData:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_DEBUG, "add hit for %@", buf, 0xCu);
}

void __48__QLCacheCleanUpDatabaseThread__writeAndCleanUp__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "End writing and clean up", v2, v3, v4, v5, v6);
}

void __48__QLCacheCleanUpDatabaseThread__writeAndCleanUp__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Start Writing and clean up", v2, v3, v4, v5, v6);
}

void __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "End cleaning up for reset", v2, v3, v4, v5, v6);
}

void __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_DEBUG, "Discarding %lu thumbnails", (uint8_t *)&v3, 0xCu);
}

void __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Start cleaning up for reset", v2, v3, v4, v5, v6);
}

@end