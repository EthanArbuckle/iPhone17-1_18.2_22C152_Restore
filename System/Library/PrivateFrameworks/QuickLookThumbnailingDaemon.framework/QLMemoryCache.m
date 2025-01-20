@interface QLMemoryCache
- (BOOL)addThumbnailData:(id)a3;
- (BOOL)hasThumbnailDataToSave;
- (BOOL)sendThumbnailDataForThumbnailRequest:(id)a3 withCacheThread:(id)a4;
- (QLMemoryCache)initWithCacheThread:(id)a3;
- (_QLCacheThread)cacheThread;
- (id)thumbnailDataToSaveWithBatch:(unint64_t)a3;
- (unint64_t)memoryUsed;
- (unint64_t)thumbnailToSaveCount;
- (void)_getReadLock;
- (void)_getWriteLock;
- (void)_invalidateThumbnailData:(id)a3;
- (void)_releaseReadLock;
- (void)_releaseWriteLock;
- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3;
- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3;
- (void)reset;
- (void)setCacheThread:(id)a3;
- (void)setMemoryUsed:(unint64_t)a3;
- (void)thumbnailDataBatchSaved:(id)a3;
- (void)thumbnailToSaveCount;
@end

@implementation QLMemoryCache

- (void)_releaseReadLock
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "stop reading", v2, v3, v4, v5, v6);
}

- (id)thumbnailDataToSaveWithBatch:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(QLMemoryCache *)self _getWriteLock];
  if (a3 && [(NSMutableArray *)self->_thumbnailDataToSave count] >= a3
    || (a3 = [(NSMutableArray *)self->_thumbnailDataToSave count]) != 0)
  {
    uint64_t v5 = -[NSMutableArray subarrayWithRange:](self->_thumbnailDataToSave, "subarrayWithRange:", 0, a3);
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint8_t v6 = _log_8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [v5 count];
    thumbnailDataToSave = self->_thumbnailDataToSave;
    int v10 = 138413058;
    v11 = self;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    __int16 v16 = 2112;
    v17 = thumbnailDataToSave;
    _os_log_debug_impl(&dword_1DDC5E000, v6, OS_LOG_TYPE_DEBUG, "%@: getting thumbnail data save batch: %lu thumbnails, asked for %lu - total: %@", (uint8_t *)&v10, 0x2Au);
  }

  [(QLMemoryCache *)self _releaseWriteLock];
  return v5;
}

- (BOOL)sendThumbnailDataForThumbnailRequest:(id)a3 withCacheThread:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_cacheEnabled)
  {
    BOOL v35 = 0;
    goto LABEL_42;
  }
  uint64_t v8 = [v6 request];
  v9 = [v8 fileIdentifier];
  int v10 = [v9 fileIdentifier];

  if (!v10)
  {
    uint64_t v18 = _log_8();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[QLMemoryCache sendThumbnailDataForThumbnailRequest:withCacheThread:]();
    }
    BOOL v35 = 0;
    goto LABEL_41;
  }
  [v8 maximumPixelSize];
  float v12 = v11;
  int v13 = [v8 iconMode];
  uint64_t v14 = [v6 badgeType];
  int v47 = [v6 needsLowQualityThumbnailGeneration];
  [(QLMemoryCache *)self _getReadLock];
  v45 = self;
  v46 = [(NSMutableDictionary *)self->_thumbnailData objectForKeyedSubscript:v10];
  if (!v46)
  {
LABEL_39:
    [(QLMemoryCache *)v45 _releaseReadLock];
    BOOL v35 = 0;
    uint64_t v18 = 0;
    goto LABEL_40;
  }
  v44 = v10;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v15 = v46;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (!v16)
  {

    int v10 = v44;
    goto LABEL_39;
  }
  uint64_t v17 = v16;
  v42 = v7;
  id v43 = v6;
  uint64_t v18 = 0;
  uint64_t v19 = *(void *)v49;
  while (2)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v49 != v19) {
        objc_enumerationMutation(v15);
      }
      v21 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      if (v13 == objc_msgSend(v21, "iconMode", v42, v43) && objc_msgSend(v21, "badgeType") == v14)
      {
        uint64_t v22 = [v21 iconVariant];
        if (v22 == [v8 iconVariant])
        {
          int v23 = [v21 interpolationQuality];
          if (v23 == [v8 interpolationQuality])
          {
            uint64_t v24 = [v21 externalGeneratorDataHash];
            if (v24 == [v8 externalThumbnailGeneratorDataHash])
            {
              [v21 size];
              if (v25 == v12)
              {
                v36 = v21;

                uint64_t v18 = v36;
                goto LABEL_34;
              }
              if (v47)
              {
                [v8 minimumDimension];
                if (QLSThumbnailSizeIsSufficientForLowQuality())
                {
                  if (!v18)
                  {
                    uint64_t v18 = v21;
                    continue;
                  }
                  [v21 size];
                  if (v26 <= v12)
                  {
                    [v21 size];
                    float v32 = v31;
                    [v18 size];
                    if (v32 <= v33) {
                      continue;
                    }
LABEL_24:
                    v34 = v21;

                    uint64_t v18 = v34;
                    continue;
                  }
                  [v18 size];
                  if (v27 < v12) {
                    goto LABEL_24;
                  }
                  [v21 size];
                  float v29 = v28;
                  [v18 size];
                  if (v29 < v30) {
                    goto LABEL_24;
                  }
                }
              }
            }
          }
        }
      }
    }
    uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v17) {
      continue;
    }
    break;
  }
LABEL_34:

  id v7 = v42;
  id v6 = v43;
  int v10 = v44;
  if (!v18) {
    goto LABEL_39;
  }
  v37 = [v8 fileIdentifier];
  v38 = [v37 version];

  v39 = [v18 version];
  char v40 = [v39 isEqual:v38];

  if ((v40 & 1) == 0)
  {

    uint64_t v18 = 0;
  }

  [(QLMemoryCache *)v45 _releaseReadLock];
  if (v18)
  {
    [v42 _sendThumbnailData:v18 forThumbnailRequest:v43];
    BOOL v35 = 1;
  }
  else
  {
    BOOL v35 = 0;
  }
LABEL_40:

LABEL_41:
LABEL_42:

  return v35;
}

- (unint64_t)thumbnailToSaveCount
{
  [(QLMemoryCache *)self _getReadLock];
  uint64_t v3 = [(NSMutableArray *)self->_thumbnailDataToSave count];
  uint64_t v4 = _log_8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(QLMemoryCache *)(uint64_t)self thumbnailToSaveCount];
  }

  [(QLMemoryCache *)self _releaseReadLock];
  return v3;
}

- (void)_releaseWriteLock
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "stop Writing", v2, v3, v4, v5, v6);
}

- (void)_getWriteLock
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "start Writing", v2, v3, v4, v5, v6);
}

- (void)_getReadLock
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "start reading", v2, v3, v4, v5, v6);
}

- (QLMemoryCache)initWithCacheThread:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QLMemoryCache;
  uint64_t v5 = [(QLMemoryCache *)&v13 init];
  if (v5)
  {
    uint8_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    thumbnailData = v5->_thumbnailData;
    v5->_thumbnailData = v6;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    thumbnailDataToSave = v5->_thumbnailDataToSave;
    v5->_thumbnailDataToSave = v8;

    int v10 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    memoryLock = v5->_memoryLock;
    v5->_memoryLock = v10;

    v5->_cacheEnabled = 1;
    objc_storeWeak((id *)&v5->_cacheThread, v4);
  }

  return v5;
}

- (void)reset
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _log_8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DDC5E000, v3, OS_LOG_TYPE_INFO, "Resetting memory cache", buf, 2u);
  }

  [(QLMemoryCache *)self _getWriteLock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = self->_thumbnailDataToSave;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setState:", 2, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_thumbnailDataToSave removeAllObjects];
  [(NSMutableDictionary *)self->_thumbnailData removeAllObjects];
  [(QLMemoryCache *)self _releaseWriteLock];
}

- (void)_invalidateThumbnailData:(id)a3
{
  id v4 = a3;
  char v13 = 0;
  if ([v4 setState:2 changedState:&v13] && v13)
  {
    self->_memoryUsed -= [v4 totalBufferSize];
    uint64_t v5 = [v4 bitmapDataToValidate];

    if (v5)
    {
      uint64_t v6 = [(QLMemoryCache *)self cacheThread];
      uint64_t v7 = [v6 diskCache];
      uint64_t v8 = [v4 bitmapDataToValidate];
      [v7 discardReservedBuffer:v8];
    }
    long long v9 = [v4 metadataToValidate];

    if (v9)
    {
      long long v10 = [(QLMemoryCache *)self cacheThread];
      long long v11 = [v10 diskCache];
      long long v12 = [v4 metadataToValidate];
      [v11 discardReservedBuffer:v12];
    }
  }
}

- (BOOL)addThumbnailData:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL cacheEnabled = self->_cacheEnabled;
  if (!self->_cacheEnabled) {
    goto LABEL_25;
  }
  uint64_t v6 = _log_8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [v4 fileIdentifier];
    [v4 size];
    double v9 = v8;
    long long v10 = [v4 bitmapFormat];
    uint64_t v11 = [v10 width];
    long long v12 = [v4 bitmapFormat];
    int v37 = 138413058;
    v38 = v7;
    __int16 v39 = 2048;
    double v40 = v9;
    __int16 v41 = 2048;
    uint64_t v42 = v11;
    __int16 v43 = 2048;
    uint64_t v44 = [v12 height];
    _os_log_impl(&dword_1DDC5E000, v6, OS_LOG_TYPE_INFO, "Adding thumbnail %@ %f (%zd, %zd) to pending saves", (uint8_t *)&v37, 0x2Au);
  }
  char v13 = [v4 fileIdentifier];
  [(QLMemoryCache *)self _getWriteLock];
  id v14 = [(NSMutableDictionary *)self->_thumbnailData objectForKeyedSubscript:v13];
  if (!v14)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)self->_thumbnailData setObject:v14 forKeyedSubscript:v13];
  }
  uint64_t v15 = [v14 count];
  if (v15 >= 1)
  {
    unint64_t v16 = v15;
    uint64_t v17 = [v4 version];
    uint64_t v18 = [v14 objectAtIndexedSubscript:0];
    uint64_t v19 = [v18 version];
    char v20 = [v17 isEqual:v19];

    if (v20)
    {
      if (v16 >= 2)
      {
        uint64_t v21 = 0;
        while (1)
        {
          uint64_t v22 = [v14 objectAtIndexedSubscript:v21];
          int v23 = [v22 iconMode];
          if (v23 == [v4 iconMode])
          {
            uint64_t v24 = [v22 badgeType];
            if (v24 == [v4 badgeType])
            {
              uint64_t v25 = [v22 iconVariant];
              if (v25 == [v4 iconVariant])
              {
                int v26 = [v22 interpolationQuality];
                if (v26 == [v4 interpolationQuality])
                {
                  uint64_t v27 = [v22 externalGeneratorDataHash];
                  if (v27 == [v4 externalGeneratorDataHash])
                  {
                    [v22 size];
                    float v29 = v28;
                    [v4 size];
                    if (v29 == v30) {
                      break;
                    }
                  }
                }
              }
            }
          }

          if (v16 == ++v21) {
            goto LABEL_21;
          }
        }
        v36 = _log_8();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          -[QLMemoryCache addThumbnailData:](v22, v36);
        }

        [(QLMemoryCache *)self _invalidateThumbnailData:v22];
        [(NSMutableArray *)self->_thumbnailDataToSave removeObject:v22];
        [v14 replaceObjectAtIndex:v21 withObject:v4];

        goto LABEL_22;
      }
    }
    else
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        float v32 = [v14 objectAtIndexedSubscript:i];
        [(QLMemoryCache *)self _invalidateThumbnailData:v32];
      }
      [(NSMutableArray *)self->_thumbnailDataToSave removeObjectsInArray:v14];
      [v14 removeAllObjects];
    }
  }
LABEL_21:
  [v14 addObject:v4];
LABEL_22:
  self->_memoryUsed += [v4 totalBufferSize];
  if (!self->_pendingSavesTransaction)
  {
    float v33 = (OS_os_transaction *)os_transaction_create();
    pendingSavesTransaction = self->_pendingSavesTransaction;
    self->_pendingSavesTransaction = v33;
  }
  [(NSMutableArray *)self->_thumbnailDataToSave addObject:v4];
  [(QLMemoryCache *)self _releaseWriteLock];

LABEL_25:
  return cacheEnabled;
}

- (void)thumbnailDataBatchSaved:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(QLMemoryCache *)self _getWriteLock];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v27;
    *(void *)&long long v7 = 138412546;
    long long v24 = v7;
    id obj = v5;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
        long long v12 = _log_8();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v21 = [v11 fileIdentifier];
          [v11 size];
          *(_DWORD *)buf = v24;
          float v31 = v21;
          __int16 v32 = 2048;
          double v33 = v22;
          _os_log_debug_impl(&dword_1DDC5E000, v12, OS_LOG_TYPE_DEBUG, "thumbnail saved %@ %f", buf, 0x16u);
        }
        [(NSMutableArray *)self->_thumbnailDataToSave removeObject:v11];
        thumbnailData = self->_thumbnailData;
        id v14 = [v11 fileIdentifier];
        uint64_t v15 = [(NSMutableDictionary *)thumbnailData objectForKeyedSubscript:v14];

        if (v15)
        {
          uint64_t v16 = [v15 count];
          if (v16 >= 1)
          {
            uint64_t v17 = 0;
            while (1)
            {
              uint64_t v18 = objc_msgSend(v15, "objectAtIndexedSubscript:", v17, v24);

              if (v11 == v18) {
                break;
              }
              if (v16 == ++v17) {
                goto LABEL_17;
              }
            }
            [v15 removeObjectAtIndex:v17];
            self->_memoryUsed -= [v11 totalBufferSize];
            --v16;
          }
          if (!v16)
          {
            uint64_t v19 = self->_thumbnailData;
            char v20 = [v11 fileIdentifier];
            [(NSMutableDictionary *)v19 setObject:0 forKeyedSubscript:v20];
          }
        }
LABEL_17:

        ++v10;
      }
      while (v10 != v8);
      id v5 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v8);
  }

  if (![(NSMutableArray *)self->_thumbnailDataToSave count])
  {
    pendingSavesTransaction = self->_pendingSavesTransaction;
    self->_pendingSavesTransaction = 0;
  }
  [(QLMemoryCache *)self _releaseWriteLock];
}

- (BOOL)hasThumbnailDataToSave
{
  return [(QLMemoryCache *)self thumbnailToSaveCount] != 0;
}

- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3
{
  id v4 = a3;
  [(QLMemoryCache *)self _getWriteLock];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  thumbnailData = self->_thumbnailData;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __104__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers___block_invoke;
  v16[3] = &unk_1E6D0D420;
  id v7 = v4;
  id v17 = v7;
  id v18 = v5;
  uint64_t v19 = self;
  id v8 = v5;
  [(NSMutableDictionary *)thumbnailData enumerateKeysAndObjectsUsingBlock:v16];
  [(NSMutableDictionary *)self->_thumbnailData removeObjectsForKeys:v8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  thumbnailDataToSave = self->_thumbnailDataToSave;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __104__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers___block_invoke_2;
  v13[3] = &unk_1E6D0D448;
  id v14 = v7;
  id v15 = v9;
  id v11 = v9;
  id v12 = v7;
  [(NSMutableArray *)thumbnailDataToSave enumerateObjectsUsingBlock:v13];
  [(NSMutableArray *)self->_thumbnailDataToSave removeObjectsAtIndexes:v11];
  [(QLMemoryCache *)self _releaseWriteLock];
}

void __104__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    id v8 = *(void **)(a1 + 32);
    id v9 = [v7 itemID];
    uint64_t v10 = [v9 providerDomainID];
    LOBYTE(v8) = [v8 containsObject:v10];

    if ((v8 & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v7];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_msgSend(v16, "setState:", 2, (void)v17);
          objc_msgSend(*(id *)(a1 + 48), "setMemoryUsed:", objc_msgSend(*(id *)(a1 + 48), "memoryUsed") - objc_msgSend(v16, "totalBufferSize"));
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

void __104__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  id v5 = [v12 fileIdentifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = v12;
  if (isKindOfClass)
  {
    id v8 = [v12 fileIdentifier];
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v8 itemID];
    id v11 = [v10 providerDomainID];
    LOBYTE(v9) = [v9 containsObject:v11];

    if ((v9 & 1) == 0)
    {
      [*(id *)(a1 + 40) addIndex:a3];
      [v12 setState:2];
    }

    id v7 = v12;
  }
}

- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3
{
  id v4 = a3;
  [(QLMemoryCache *)self _getWriteLock];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  thumbnailData = self->_thumbnailData;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers___block_invoke;
  v16[3] = &unk_1E6D0D420;
  id v7 = v4;
  id v17 = v7;
  id v18 = v5;
  long long v19 = self;
  id v8 = v5;
  [(NSMutableDictionary *)thumbnailData enumerateKeysAndObjectsUsingBlock:v16];
  [(NSMutableDictionary *)self->_thumbnailData removeObjectsForKeys:v8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  thumbnailDataToSave = self->_thumbnailDataToSave;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers___block_invoke_2;
  v13[3] = &unk_1E6D0D448;
  id v14 = v7;
  id v15 = v9;
  id v11 = v9;
  id v12 = v7;
  [(NSMutableArray *)thumbnailDataToSave enumerateObjectsUsingBlock:v13];
  [(NSMutableArray *)self->_thumbnailDataToSave removeObjectsAtIndexes:v11];
  [(QLMemoryCache *)self _releaseWriteLock];
}

void __83__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    id v8 = *(void **)(a1 + 32);
    id v9 = [v7 itemID];
    uint64_t v10 = [v9 providerDomainID];
    LODWORD(v8) = [v8 containsObject:v10];

    if (v8) {
      [*(id *)(a1 + 40) addObject:v7];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_msgSend(v16, "setState:", 2, (void)v17);
          objc_msgSend(*(id *)(a1 + 48), "setMemoryUsed:", objc_msgSend(*(id *)(a1 + 48), "memoryUsed") - objc_msgSend(v16, "totalBufferSize"));
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

void __83__QLMemoryCache_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  id v5 = [v12 fileIdentifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = v12;
  if (isKindOfClass)
  {
    id v8 = [v12 fileIdentifier];
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v8 itemID];
    id v11 = [v10 providerDomainID];
    LODWORD(v9) = [v9 containsObject:v11];

    if (v9)
    {
      [*(id *)(a1 + 40) addIndex:a3];
      [v12 setState:2];
    }

    id v7 = v12;
  }
}

- (unint64_t)memoryUsed
{
  return self->_memoryUsed;
}

- (void)setMemoryUsed:(unint64_t)a3
{
  self->_memoryUsed = a3;
}

- (_QLCacheThread)cacheThread
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cacheThread);
  return (_QLCacheThread *)WeakRetained;
}

- (void)setCacheThread:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cacheThread);
  objc_storeStrong((id *)&self->_pendingSavesTransaction, 0);
  objc_storeStrong((id *)&self->_memoryLock, 0);
  objc_storeStrong((id *)&self->_thumbnailDataToSave, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
}

- (void)addThumbnailData:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 fileIdentifier];
  [a1 size];
  int v6 = 138412802;
  id v7 = v4;
  __int16 v8 = 2048;
  double v9 = v5;
  __int16 v10 = 2080;
  id v11 = " (replacing same)";
  _os_log_debug_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_DEBUG, "Removing thumbnail %@ %f from pending saves to limit number of saves%s", (uint8_t *)&v6, 0x20u);
}

- (void)sendThumbnailDataForThumbnailRequest:withCacheThread:.cold.1()
{
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1DDC5E000, v0, OS_LOG_TYPE_ERROR, "Thumbnail request with no real path was sent to cache", v1, 2u);
}

- (void)thumbnailToSaveCount
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_DEBUG, "%@: thumbnail left to be saved %ld", (uint8_t *)&v3, 0x16u);
}

@end