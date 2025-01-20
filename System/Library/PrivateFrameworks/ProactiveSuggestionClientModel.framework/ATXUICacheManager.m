@interface ATXUICacheManager
- (ATXUICacheManager)init;
- (ATXUICacheManager)initWithCacheBasePath:(id)a3;
- (BOOL)deleteCacheFileForConsumerSubType:(unsigned __int8)a3;
- (BOOL)updateCachedLayout:(id)a3 consumerSubType:(unsigned __int8)a4;
- (BOOL)writeSerializedDataToCacheFile:(id)a3 path:(id)a4;
- (double)cacheAgeForConsumerSubTypeString:(id)a3;
- (id)cacheFilePathForConsumerSubType:(unsigned __int8)a3;
- (id)cacheFilePathForConsumerSubTypeString:(id)a3;
- (id)cachedLayoutForConsumerSubType:(unsigned __int8)a3 expectedClass:(Class)a4;
- (id)consumerSubTypeStringsWithNonEmptyCachedLayout;
- (id)dataFromFileHandle:(id)a3;
- (id)serializeLayout:(id)a3;
@end

@implementation ATXUICacheManager

- (ATXUICacheManager)init
{
  v3 = [MEMORY[0x1E4F4B650] uiCachesRootDirectory];
  v4 = [(ATXUICacheManager *)self initWithCacheBasePath:v3];

  return v4;
}

- (ATXUICacheManager)initWithCacheBasePath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUICacheManager;
  v5 = [(ATXUICacheManager *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    cacheBasePath = v5->_cacheBasePath;
    v5->_cacheBasePath = (NSString *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (id)cachedLayoutForConsumerSubType:(unsigned __int8)a3 expectedClass:(Class)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(ATXUICacheManager *)self cacheFilePathForConsumerSubType:a3];
  v7 = [MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:v6];
  v8 = [(ATXUICacheManager *)self dataFromFileHandle:v7];

  if (v8)
  {
    objc_super v9 = (void *)[[a4 alloc] initWithProtoData:v8];
    v10 = v9;
    if (v9
      && [v9 conformsToProtocol:&unk_1F0629580]
      && [v10 conformsToProtocol:&unk_1F0629A08]
      && ([v10 conformsToProtocol:&unk_1F062A630] & 1) != 0)
    {
      id v11 = v10;
    }
    else
    {
      v12 = __atxlog_handle_blending();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_1AE67F000, v12, OS_LOG_TYPE_DEFAULT, "Blending: Unable to deserialize data retrieved from cache file with path %@", (uint8_t *)&v14, 0xCu);
      }

      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)dataFromFileHandle:(id)a3
{
  id v3 = a3;
  id v4 = __atxlog_handle_blending();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE67F000, v4, OS_LOG_TYPE_DEFAULT, "Blending: Reading cache file to retrieve UI layout", buf, 2u);
  }

  if (v3)
  {
    id v11 = 0;
    v5 = [v3 readDataToEndOfFileAndReturnError:&v11];
    uint64_t v6 = v11;
    v7 = v6;
    if (!v5 || v6)
    {
      objc_super v9 = __atxlog_handle_blending();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ATXUICacheManager dataFromFileHandle:]();
      }

      id v8 = 0;
    }
    else
    {
      id v8 = v5;
    }
  }
  else
  {
    v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1AE67F000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Not reading UI layout from cache because fileHandle is nil. The file could have been deleted if there are no valid layouts for the consumer.", v12, 2u);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)cacheFilePathForConsumerSubType:(unsigned __int8)a3
{
  id v4 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a3];
  v5 = [(ATXUICacheManager *)self cacheFilePathForConsumerSubTypeString:v4];

  return v5;
}

- (id)cacheFilePathForConsumerSubTypeString:(id)a3
{
  return [(NSString *)self->_cacheBasePath stringByAppendingPathComponent:a3];
}

- (id)consumerSubTypeStringsWithNonEmptyCachedLayout
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v4 contentsOfDirectoryAtPath:self->_cacheBasePath error:0];

  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1B3E6F520]();
          char v15 = 0;
          [MEMORY[0x1E4F4B680] consumerSubtypeForString:v11 found:&v15];
          if (v15) {
            [v3 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    id v13 = v3;
  }
  else
  {
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (double)cacheAgeForConsumerSubTypeString:(id)a3
{
  id v3 = [(ATXUICacheManager *)self cacheFilePathForConsumerSubTypeString:a3];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v4 attributesOfItemAtPath:v3 error:0];

  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28310]];
  [v6 timeIntervalSinceNow];
  double v8 = -v7;

  return v8;
}

- (BOOL)updateCachedLayout:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v4];
  double v8 = __atxlog_handle_blending();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    long long v16 = v7;
    _os_log_impl(&dword_1AE67F000, v8, OS_LOG_TYPE_DEFAULT, "Blending: Trying to update cached layout for consumer %@", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    uint64_t v9 = [(ATXUICacheManager *)self serializeLayout:v6];
    if (v9)
    {
      v10 = [(ATXUICacheManager *)self cacheFilePathForConsumerSubType:v4];
      BOOL v11 = [(ATXUICacheManager *)self writeSerializedDataToCacheFile:v9 path:v10];

      if (v11)
      {
        BOOL v12 = 1;
LABEL_13:

        goto LABEL_14;
      }
      id v13 = __atxlog_handle_blending();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXUICacheManager updateCachedLayout:consumerSubType:]();
      }
    }
    else
    {
      id v13 = __atxlog_handle_blending();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXUICacheManager updateCachedLayout:consumerSubType:]();
      }
    }

    BOOL v12 = 0;
    goto LABEL_13;
  }
  BOOL v12 = [(ATXUICacheManager *)self deleteCacheFileForConsumerSubType:v4];
LABEL_14:

  return v12;
}

- (BOOL)deleteCacheFileForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_new();
  id v6 = [(ATXUICacheManager *)self cacheFilePathForConsumerSubType:v3];
  id v17 = 0;
  char v7 = [v5 removeItemAtPath:v6 error:&v17];
  id v8 = v17;
  uint64_t v9 = v8;
  if (!v8) {
    char v7 = 1;
  }
  if (v7)
  {
    v10 = __atxlog_handle_blending();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v3];
      *(_DWORD *)buf = 138412546;
      long long v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_1AE67F000, v10, OS_LOG_TYPE_DEFAULT, "Blending: Deleted file at path: %@ for UI consumer: %@", buf, 0x16u);
    }
    notify_post((const char *)[@"kATXUICacheManagerDidUpdateDarwinNotification" UTF8String]);
  }
  else
  {
    BOOL v12 = [v8 userInfo];
    id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v14 = [v13 code];

    if (v14 != 2)
    {
      int v15 = __atxlog_handle_blending();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v19 = v6;
        __int16 v20 = 2112;
        uint64_t v21 = v9;
        _os_log_impl(&dword_1AE67F000, v15, OS_LOG_TYPE_DEFAULT, "Blending: Failed to delete file at path: %@ with error: %@", buf, 0x16u);
      }
    }
  }

  return v7;
}

- (BOOL)writeSerializedDataToCacheFile:(id)a3 path:(id)a4
{
  id v10 = 0;
  char v4 = [a3 writeToFile:a4 options:1073741825 error:&v10];
  id v5 = v10;
  id v6 = __atxlog_handle_blending();
  char v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1AE67F000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Finished writing layout data.", v9, 2u);
    }

    notify_post((const char *)[@"kATXUICacheManagerDidUpdateDarwinNotification" UTF8String]);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXUICacheManager writeSerializedDataToCacheFile:path:]();
    }
  }
  return v4;
}

- (id)serializeLayout:(id)a3
{
  uint64_t v3 = [a3 encodeAsProto];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = __atxlog_handle_blending();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXUICacheManager serializeLayout:](v6);
    }
  }
  return v4;
}

- (void)updateCachedLayout:consumerSubType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_ERROR, "Blending: Failed to serialize suggestion for consumer %@", v1, 0xCu);
}

- (void)updateCachedLayout:consumerSubType:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_ERROR, "Blending: Failed to write suggestion to cache file for consumer %@", v1, 0xCu);
}

- (void)writeSerializedDataToCacheFile:path:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_FAULT, "Blending: Could not write layout data. Error: %@", v1, 0xCu);
}

- (void)dataFromFileHandle:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1AE67F000, v1, OS_LOG_TYPE_ERROR, "Blending: Unable to read data from file handle %@ - %@", v2, 0x16u);
}

- (void)serializeLayout:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1AE67F000, log, OS_LOG_TYPE_ERROR, "Blending: Unable to serialize layout.", v1, 2u);
}

@end