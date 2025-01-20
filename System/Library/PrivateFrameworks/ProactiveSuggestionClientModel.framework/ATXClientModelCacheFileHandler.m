@interface ATXClientModelCacheFileHandler
+ (id)clientModelIdFromFileName:(id)a3;
+ (id)readSuggestionsFromCacheFromReadOnlyFileHandle:(id)a3;
+ (id)unarchiveCacheFileFromReadOnlyFileHandle:(id)a3;
- (ATXClientModelCacheFileHandler)initWithCacheFileBasePath:(id)a3 clientModelId:(id)a4;
- (BOOL)createCacheFileForClientModelCacheUpdate:(id)a3;
- (BOOL)deleteCachedSuggestionsFile;
- (BOOL)writeSerializedDataToCacheFile:(id)a3;
- (id)cacheFilePath;
- (id)readOnlyFileHandleForSuggestionsCache;
- (id)readSuggestionsFromCache;
- (id)serializeSuggestionsData:(id)a3;
@end

@implementation ATXClientModelCacheFileHandler

- (ATXClientModelCacheFileHandler)initWithCacheFileBasePath:(id)a3 clientModelId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXClientModelCacheFileHandler;
  v9 = [(ATXClientModelCacheFileHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cacheFileBasePath, a3);
    objc_storeStrong((id *)&v10->_clientModelId, a4);
  }

  return v10;
}

- (id)cacheFilePath
{
  return [(NSString *)self->_cacheFileBasePath stringByAppendingPathComponent:self->_clientModelId];
}

+ (id)clientModelIdFromFileName:(id)a3
{
  id v3 = a3;
  return v3;
}

- (BOOL)deleteCachedSuggestionsFile
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(ATXClientModelCacheFileHandler *)self cacheFilePath];
  id v16 = 0;
  char v5 = [v3 removeItemAtPath:v4 error:&v16];
  id v6 = v16;
  id v7 = v6;
  if (!v6) {
    char v5 = 1;
  }
  if (v5)
  {
    id v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      v9 = "Blending: Deleted file at path: %@";
      v10 = v8;
      uint32_t v11 = 12;
LABEL_9:
      _os_log_impl(&dword_1AE67F000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  objc_super v12 = [v6 userInfo];
  v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  uint64_t v14 = [v13 code];

  if (v14 != 2)
  {
    id v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v4;
      __int16 v19 = 2112;
      v20 = v7;
      v9 = "Blending: Failed to delete file at path: %@ with error: %@";
      v10 = v8;
      uint32_t v11 = 22;
      goto LABEL_9;
    }
LABEL_10:
  }
  return v5;
}

- (BOOL)createCacheFileForClientModelCacheUpdate:(id)a3
{
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1B3E6F520]();
  id v6 = [(ATXClientModelCacheFileHandler *)self serializeSuggestionsData:v4];
  if (v6) {
    BOOL v7 = [(ATXClientModelCacheFileHandler *)self writeSerializedDataToCacheFile:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)serializeSuggestionsData:(id)a3
{
  id v4 = a3;
  [v4 setFeedbackMetadata:0];
  char v5 = [v4 encodeAsProto];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    BOOL v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXClientModelCacheFileHandler serializeSuggestionsData:]((uint64_t)self, v7);
    }
  }
  return v5;
}

- (BOOL)writeSerializedDataToCacheFile:(id)a3
{
  id v4 = a3;
  char v5 = [(ATXClientModelCacheFileHandler *)self cacheFilePath];
  id v10 = 0;
  char v6 = [v4 writeToFile:v5 options:1073741825 error:&v10];

  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    id v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      [(ATXClientModelCacheFileHandler *)(uint64_t)self writeSerializedDataToCacheFile:v8];
    }
  }
  return v6;
}

- (id)readOnlyFileHandleForSuggestionsCache
{
  v2 = (void *)MEMORY[0x1E4F28CB0];
  id v3 = [(ATXClientModelCacheFileHandler *)self cacheFilePath];
  id v4 = [v2 fileHandleForReadingAtPath:v3];

  return v4;
}

- (id)readSuggestionsFromCache
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = __atxlog_handle_blending();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    clientModelId = self->_clientModelId;
    int v9 = 138412290;
    id v10 = clientModelId;
    _os_log_impl(&dword_1AE67F000, v3, OS_LOG_TYPE_DEFAULT, "Blending: Retrieving suggestions for client model: %@", (uint8_t *)&v9, 0xCu);
  }

  char v5 = objc_opt_class();
  char v6 = [(ATXClientModelCacheFileHandler *)self readOnlyFileHandleForSuggestionsCache];
  id v7 = [v5 readSuggestionsFromCacheFromReadOnlyFileHandle:v6];

  return v7;
}

+ (id)unarchiveCacheFileFromReadOnlyFileHandle:(id)a3
{
  id v9 = 0;
  id v3 = [a3 readDataToEndOfFileAndReturnError:&v9];
  id v4 = v9;
  char v5 = v4;
  if (v3)
  {
    id v6 = v3;
  }
  else if ([v4 code] != 260)
  {
    id v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ATXClientModelCacheFileHandler unarchiveCacheFileFromReadOnlyFileHandle:]((uint64_t)v5, v7);
    }
  }
  return v3;
}

+ (id)readSuggestionsFromCacheFromReadOnlyFileHandle:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [(id)objc_opt_class() unarchiveCacheFileFromReadOnlyFileHandle:v3];
    if (v4)
    {
      char v5 = (void *)MEMORY[0x1B3E6F520]();
      id v6 = [[ATXClientModelCacheUpdate alloc] initWithProtoData:v4];
      id v7 = __atxlog_handle_blending();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          id v9 = [(ATXClientModelCacheUpdate *)v6 suggestions];
          int v12 = 134217984;
          uint64_t v13 = [v9 count];
          _os_log_impl(&dword_1AE67F000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Deserialized to get %lu suggestions.", (uint8_t *)&v12, 0xCu);
        }
        id v6 = v6;
        id v10 = v6;
      }
      else
      {
        if (v8)
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_1AE67F000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Unable to deserialize data retrieved from the cache file.", (uint8_t *)&v12, 2u);
        }

        id v10 = 0;
      }
    }
    else
    {
      __atxlog_handle_blending();
      id v6 = (ATXClientModelCacheUpdate *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1AE67F000, &v6->super, OS_LOG_TYPE_DEFAULT, "Blending: Unable to unarchive cache file.", (uint8_t *)&v12, 2u);
      }
      id v10 = 0;
    }
  }
  else
  {
    id v4 = __atxlog_handle_blending();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1AE67F000, v4, OS_LOG_TYPE_DEFAULT, "Blending: Unable to acquire readonly handle to cache file. Not reading suggestions from cache.", (uint8_t *)&v12, 2u);
    }
    id v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_cacheFileBasePath, 0);
}

- (void)serializeSuggestionsData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_ERROR, "Blending: <<%@>> Unable to serialize proactive suggestion data.", (uint8_t *)&v3, 0xCu);
}

- (void)writeSerializedDataToCacheFile:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "Blending: <<%@>> Could not write client model cache update data for client model. Error: %@", (uint8_t *)&v4, 0x16u);
}

+ (void)unarchiveCacheFileFromReadOnlyFileHandle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_ERROR, "Blending: Error reading the read only handle: %@", (uint8_t *)&v2, 0xCu);
}

@end