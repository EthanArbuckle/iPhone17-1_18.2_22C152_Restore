@interface MXStorageUtil
- (BOOL)_removeFile:(id)a3 error:(id *)a4;
- (BOOL)_removeFiles:(id)a3 fromDirectory:(id)a4 error:(id *)a5;
- (BOOL)createDirectory:(id)a3 error:(id *)a4;
- (BOOL)isDataExistAsDirectoryForPath:(id)a3;
- (BOOL)removeExistingFilesFromDirectory:(id)a3;
- (BOOL)saveData:(id)a3 withFilePath:(id)a4;
- (MXStorageUtil)init;
- (NSFileManager)fileManager;
- (OS_os_log)logHandle;
- (id)_filesFromDirectory:(id)a3 error:(id *)a4;
- (id)archivedDataWithObject:(id)a3 error:(id *)a4;
- (id)attributesOfItemAtPath:(id)a3 error:(id *)a4;
- (id)dataFromPath:(id)a3;
- (id)unarchivedObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5;
- (void)removeFiles:(id)a3 withFilenameContainsSubstring:(id)a4 fromDirectory:(id)a5 error:(id *)a6;
- (void)setAuthProtectionForPath:(id)a3 fromAttributes:(id)a4;
- (void)setFileManager:(id)a3;
- (void)setLogHandle:(id)a3;
@end

@implementation MXStorageUtil

- (id)_filesFromDirectory:(id)a3 error:(id *)a4
{
  return [(NSFileManager *)self->_fileManager contentsOfDirectoryAtPath:a3 error:a4];
}

- (MXStorageUtil)init
{
  v8.receiver = self;
  v8.super_class = (Class)MXStorageUtil;
  v2 = [(MXStorageUtil *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
    fileManager = v2->_fileManager;
    v2->_fileManager = (NSFileManager *)v3;

    os_log_t v5 = os_log_create("com.apple.metrickit", "storage.utility");
    logHandle = v2->_logHandle;
    v2->_logHandle = (OS_os_log *)v5;

    if (!v2->_logHandle) {
      objc_storeStrong((id *)&v2->_logHandle, &_os_log_internal);
    }
  }
  return v2;
}

- (BOOL)saveData:(id)a3 withFilePath:(id)a4
{
  id v6 = a4;
  id v19 = 0;
  char v7 = [a3 writeToFile:v6 options:0x40000000 error:&v19];
  id v8 = v19;
  if (v8)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
      -[MXStorageUtil saveData:withFilePath:].cold.4((uint64_t)v6, (uint64_t)v8, logHandle);
    }
  }
  id v10 = v6;
  int v11 = open((const char *)[v10 UTF8String], 0);
  if (v11 < 0)
  {
    v16 = self->_logHandle;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MXStorageUtil saveData:withFilePath:]((uint64_t)v10, v16);
    }
  }
  else
  {
    int v12 = v11;
    uint64_t v18 = 65605;
    int v13 = ffsctl(v11, 0xC0084A44uLL, &v18, 0);
    v14 = self->_logHandle;
    if (v13)
    {
      int v15 = v13;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MXStorageUtil saveData:withFilePath:]((uint64_t)v10, v15, v14);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      -[MXStorageUtil saveData:withFilePath:]((uint64_t)v10, v14);
    }
    close(v12);
  }

  return v7;
}

- (id)dataFromPath:(id)a3
{
  id v4 = a3;
  os_log_t v5 = [(MXStorageUtil *)self fileManager];
  id v6 = [v5 contentsAtPath:v4];

  return v6;
}

- (BOOL)removeExistingFilesFromDirectory:(id)a3
{
  id v4 = a3;
  os_log_t v5 = [(MXStorageUtil *)self _filesFromDirectory:v4 error:0];
  uint64_t v7 = 0;
  LOBYTE(self) = [(MXStorageUtil *)self _removeFiles:v5 fromDirectory:v4 error:&v7];

  return (char)self;
}

- (void)removeFiles:(id)a3 withFilenameContainsSubstring:(id)a4 fromDirectory:(id)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v25;
    *(void *)&long long v13 = 138412546;
    long long v22 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v9);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v17, "containsString:", v10, v22))
        {
          fileManager = self->_fileManager;
          id v19 = [v11 stringByAppendingPathComponent:v17];
          LOBYTE(fileManager) = [(NSFileManager *)fileManager removeItemAtPath:v19 error:a6];

          if ((fileManager & 1) == 0)
          {
            logHandle = self->_logHandle;
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
            {
              id v21 = *a6;
              *(_DWORD *)buf = v22;
              v29 = v17;
              __int16 v30 = 2112;
              id v31 = v21;
              _os_log_error_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_ERROR, "Failed to remove file %@ with error %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v14 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v14);
  }
}

- (BOOL)createDirectory:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(NSFileManager *)self->_fileManager createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:a4];
  if (!v7 && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
    -[MXStorageUtil createDirectory:error:]();
  }

  return v7;
}

- (BOOL)isDataExistAsDirectoryForPath:(id)a3
{
  char v4 = 0;
  BOOL result = [(NSFileManager *)self->_fileManager fileExistsAtPath:a3 isDirectory:&v4];
  if (!v4) {
    return 0;
  }
  return result;
}

- (id)attributesOfItemAtPath:(id)a3 error:(id *)a4
{
  return [(NSFileManager *)self->_fileManager attributesOfItemAtPath:a3 error:a4];
}

- (void)setAuthProtectionForPath:(id)a3 fromAttributes:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x263F080A8];
  id v8 = [a4 objectForKeyedSubscript:*MEMORY[0x263F080A8]];
  uint64_t v9 = *MEMORY[0x263F08098];
  char v10 = [v8 isEqualToString:*MEMORY[0x263F08098]];

  if ((v10 & 1) == 0)
  {
    fileManager = self->_fileManager;
    uint64_t v13 = v7;
    v14[0] = v9;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [(NSFileManager *)fileManager setAttributes:v12 ofItemAtPath:v6 error:0];
  }
}

- (id)archivedDataWithObject:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

- (id)unarchivedObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5
{
  return (id)[MEMORY[0x263F08928] unarchivedObjectOfClass:a3 fromData:a4 error:a5];
}

- (BOOL)_removeFiles:(id)a3 fromDirectory:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(v9, "stringByAppendingPathComponent:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        BOOL v16 = [(MXStorageUtil *)self _removeFile:v15 error:a5];

        if (!v16)
        {
          if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
            -[MXStorageUtil _removeFiles:fromDirectory:error:]();
          }
          BOOL v17 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 1;
LABEL_13:

  return v17;
}

- (BOOL)_removeFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MXStorageUtil *)self fileManager];
  LOBYTE(a4) = [v7 removeItemAtPath:v6 error:a4];

  return (char)a4;
}

- (NSFileManager)fileManager
{
  return (NSFileManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFileManager:(id)a3
{
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);

  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (void)saveData:(uint64_t)a1 withFilePath:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  int v4 = *__error();
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_22BB49000, v3, OS_LOG_TYPE_ERROR, "Failed to open the file %{public}@ with errno %{errno}d hence couldn't mark it purgeable", (uint8_t *)&v5, 0x12u);
}

- (void)saveData:(uint64_t)a1 withFilePath:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22BB49000, a2, OS_LOG_TYPE_DEBUG, "Marked %{public}@ purgeable", (uint8_t *)&v2, 0xCu);
}

- (void)saveData:(os_log_t)log withFilePath:.cold.3(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_22BB49000, log, OS_LOG_TYPE_ERROR, "Failed to mark %{public}@ purgeable: %{errno}d", (uint8_t *)&v3, 0x12u);
}

- (void)saveData:(NSObject *)a3 withFilePath:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_22BB49000, a2, a3, "Failed to write to file %@ with error %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)createDirectory:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22BB49000, v0, v1, "Failed to create directory at path %@ with error %@");
}

- (void)_removeFiles:fromDirectory:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22BB49000, v0, v1, "Failed to remove file %@ with error %@");
}

@end