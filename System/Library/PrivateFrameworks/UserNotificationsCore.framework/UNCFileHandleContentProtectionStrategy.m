@interface UNCFileHandleContentProtectionStrategy
- (BOOL)_isFileProtectionTypeSupported:(id)a3;
- (BOOL)dataIsAvailableAtPath:(id)a3;
- (BOOL)removeAllDataAtPath:(id)a3 error:(id *)a4;
- (BOOL)removeItemAtPath:(id)a3 error:(id *)a4;
- (BOOL)writeData:(id)a3 atPath:(id)a4 error:(id *)a5;
- (UNCFileHandleContentProtectionStrategy)initWithFileProtectionType:(id)a3 excludeFromBackup:(BOOL)a4;
- (id)_fileHandleForCreatingStoreAtPath:(id)a3 protectionType:(id)a4;
- (id)allDataAtPath:(id)a3;
- (id)allPaths;
- (id)dataAtPath:(id)a3;
- (void)_excludeItemFromBackupAtPath:(id)a3;
- (void)migrateDataAtPath:(id)a3 toPath:(id)a4;
@end

@implementation UNCFileHandleContentProtectionStrategy

- (UNCFileHandleContentProtectionStrategy)initWithFileProtectionType:(id)a3 excludeFromBackup:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNCFileHandleContentProtectionStrategy;
  v8 = [(UNCFileHandleContentProtectionStrategy *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_excludeFromBackup = a4;
    objc_storeStrong((id *)&v8->_fileProtectionType, a3);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    keyedFileHandles = v9->_keyedFileHandles;
    v9->_keyedFileHandles = v10;
  }
  return v9;
}

- (id)allPaths
{
  return (id)[(NSMutableDictionary *)self->_keyedFileHandles allKeys];
}

- (id)allDataAtPath:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(UNCFileHandleContentProtectionStrategy *)self dataAtPath:v4];
  v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [v4 stringByDeletingPathExtension];
  v8 = [v7 stringByDeletingLastPathComponent];
  v9 = [v8 stringByAppendingPathComponent:@"staging"];

  if ([v6 fileExistsAtPath:v9])
  {
    v26 = v6;
    v27 = v5;
    id v34 = 0;
    v25 = v9;
    v10 = objc_msgSend(v6, "unc_contentsSortedByLastModificationDateOfDirectoryAtPath:error:", v9, &v34);
    id v24 = v34;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v30 + 1) + 8 * v15);
          v17 = -[NSMutableDictionary objectForKey:](self->_keyedFileHandles, "objectForKey:", v4, v24);
          v18 = [v17 path];
          char v19 = [v16 isEqualToString:v18];

          if ((v19 & 1) == 0)
          {
            id v29 = 0;
            v20 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v16 options:0 error:&v29];
            id v21 = v29;
            if (v20)
            {
              [v28 addObject:v20];
            }
            else
            {
              v22 = *MEMORY[0x263F1E030];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                id v36 = v4;
                __int16 v37 = 2114;
                id v38 = v21;
                _os_log_error_impl(&dword_2608DB000, v22, OS_LOG_TYPE_ERROR, "Could not access data at %{public}@: %{public}@", buf, 0x16u);
              }
            }
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v13);
    }

    v6 = v26;
    v5 = v27;
    v9 = v25;
  }
  if (v5) {
    [v28 addObject:v5];
  }

  return v28;
}

- (BOOL)removeAllDataAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(UNCFileHandleContentProtectionStrategy *)self removeItemAtPath:v6 error:a4])
  {
    id v7 = [MEMORY[0x263F08850] defaultManager];
    v8 = [v6 stringByDeletingPathExtension];
    v9 = [v8 stringByDeletingLastPathComponent];
    v10 = [v9 stringByAppendingPathComponent:@"staging"];

    if ([v7 fileExistsAtPath:v10]
      && ([v7 removeItemAtPath:v10 error:a4] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
        -[UNCFileHandleContentProtectionStrategy removeAllDataAtPath:error:]();
      }
      BOOL v11 = 0;
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)dataIsAvailableAtPath:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_keyedFileHandles objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)dataAtPath:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_keyedFileHandles objectForKey:a3];
  BOOL v4 = [v3 fileHandle];

  [v4 seekToFileOffset:0];
  v5 = [v4 availableData];
  if ([v5 length]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)writeData:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(NSMutableDictionary *)self->_keyedFileHandles objectForKey:v8];
  if (!v9)
  {
    v10 = [MEMORY[0x263F08850] defaultManager];
    BOOL v11 = [v8 stringByDeletingPathExtension];
    uint64_t v12 = [v11 stringByDeletingLastPathComponent];
    uint64_t v13 = [v12 stringByAppendingPathComponent:@"staging"];

    if (([v10 fileExistsAtPath:v13] & 1) == 0)
    {
      id v24 = 0;
      [v10 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v24];
      id v14 = v24;
      if (v14 && os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
        -[UNCFileHandleContentProtectionStrategy writeData:atPath:error:]();
      }
    }
    if (self->_excludeFromBackup) {
      [(UNCFileHandleContentProtectionStrategy *)self _excludeItemFromBackupAtPath:v13];
    }
    uint64_t v15 = [v8 lastPathComponent];
    v16 = [v15 stringByDeletingPathExtension];
    v17 = [v16 stringByAppendingString:@"XXXXXX"];
    v18 = [v13 stringByAppendingPathComponent:v17];

    uint64_t v19 = [(UNCFileHandleContentProtectionStrategy *)self _fileHandleForCreatingStoreAtPath:v18 protectionType:self->_fileProtectionType];
    if (!v19)
    {

      BOOL v22 = 0;
      v9 = v10;
      goto LABEL_14;
    }
    v9 = (void *)v19;
    [(NSMutableDictionary *)self->_keyedFileHandles setObject:v19 forKey:v8];
    if (self->_excludeFromBackup)
    {
      v20 = [v9 path];
      [(UNCFileHandleContentProtectionStrategy *)self _excludeItemFromBackupAtPath:v20];
    }
  }
  uint64_t v13 = [v9 fileHandle];
  [v13 truncateFileAtOffset:0];
  [v13 writeData:v7];
  id v21 = [v9 fileHandle];
  [v21 synchronizeFile];

  BOOL v22 = 1;
LABEL_14:

  return v22;
}

- (BOOL)removeItemAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x263F08850] defaultManager];
  id v8 = [(NSMutableDictionary *)self->_keyedFileHandles objectForKey:v6];
  if (v8)
  {
    [(NSMutableDictionary *)self->_keyedFileHandles removeObjectForKey:v6];
    v9 = [v8 fileHandle];
    [v9 synchronizeFile];

    v10 = [v8 fileHandle];
    [v10 closeFile];

    BOOL v11 = [v8 path];

    if ([v7 fileExistsAtPath:v11]
      && ([v7 removeItemAtPath:v11 error:a4] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
        -[UNCFileHandleContentProtectionStrategy removeAllDataAtPath:error:]();
      }
      BOOL v12 = 0;
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else
  {
    if ([v7 fileExistsAtPath:v6]
      && ([v7 removeItemAtPath:v6 error:a4] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
        -[UNCFileHandleContentProtectionStrategy removeAllDataAtPath:error:]();
      }
      BOOL v12 = 0;
    }
    else
    {
      BOOL v12 = 1;
    }
    BOOL v11 = v6;
  }

  return v12;
}

- (void)migrateDataAtPath:(id)a3 toPath:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];
  id v14 = 0;
  [(UNCFileHandleContentProtectionStrategy *)self writeData:v8 atPath:v7 error:&v14];
  id v9 = v14;
  if (v9)
  {
    v10 = v9;
    BOOL v11 = *MEMORY[0x263F1E048];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E048], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v16 = v6;
      __int16 v17 = 2114;
      id v18 = v7;
      __int16 v19 = 2114;
      v20 = v10;
      _os_log_error_impl(&dword_2608DB000, v11, OS_LOG_TYPE_ERROR, "Migrating repository from: %{public}@ to: %{public}@ failed %{public}@", buf, 0x20u);
    }
LABEL_7:

    goto LABEL_8;
  }
  id v13 = 0;
  [(UNCFileHandleContentProtectionStrategy *)self removeItemAtPath:v6 error:&v13];
  id v12 = v13;
  if (v12)
  {
    v10 = v12;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E048], OS_LOG_TYPE_ERROR)) {
      -[UNCFileHandleContentProtectionStrategy migrateDataAtPath:toPath:]();
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (id)_fileHandleForCreatingStoreAtPath:(id)a3 protectionType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqual:*MEMORY[0x263F08080]])
  {
    int v7 = 1;
  }
  else if ([v6 isEqual:*MEMORY[0x263F08088]])
  {
    int v7 = 2;
  }
  else if ([v6 isEqual:*MEMORY[0x263F08098]])
  {
    int v7 = 3;
  }
  else
  {
    if (![v6 isEqual:*MEMORY[0x263F080B0]]) {
      goto LABEL_14;
    }
    int v7 = 4;
  }
  size_t v8 = [v5 lengthOfBytesUsingEncoding:4] + 1;
  id v9 = (char *)malloc_type_malloc(v8, 0x94622DD1uLL);
  if ([v5 getCString:v9 maxLength:v8 encoding:4])
  {
    uint64_t v10 = mkstemp_dprotected_np(v9, v7, 0);
    if ((v10 & 0x80000000) == 0)
    {
      BOOL v11 = (void *)[objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v10];
      if (v11)
      {
        id v12 = objc_alloc_init(UNSFileHandleWrapper);
        [(UNSFileHandleWrapper *)v12 setFileHandle:v11];
        id v13 = [NSString stringWithUTF8String:v9];
        [(UNSFileHandleWrapper *)v12 setPath:v13];
      }
      else
      {
        id v12 = 0;
      }
      free(v9);

      goto LABEL_17;
    }
  }
  free(v9);
LABEL_14:
  id v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)_isFileProtectionTypeSupported:(id)a3
{
  return (id)*MEMORY[0x263F080B0] == a3
      || *MEMORY[0x263F08098] == (void)a3
      || *MEMORY[0x263F08088] == (void)a3
      || *MEMORY[0x263F08080] == (void)a3;
}

- (void)_excludeItemFromBackupAtPath:(id)a3
{
  id v3 = a3;
  BOOL v4 = [NSURL fileURLWithPath:v3];
  uint64_t v5 = *MEMORY[0x263EFF6B0];
  id v8 = 0;
  char v6 = [v4 setResourceValue:MEMORY[0x263EFFA88] forKey:v5 error:&v8];
  id v7 = v8;
  if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
    -[UNCFileHandleContentProtectionStrategy _excludeItemFromBackupAtPath:]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyedFileHandles, 0);

  objc_storeStrong((id *)&self->_fileProtectionType, 0);
}

- (void)removeAllDataAtPath:error:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "Could not delete %{public}@: %{public}@");
}

- (void)writeData:(void *)a1 atPath:(uint64_t)a2 error:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = objc_begin_catch(a1);
  uint64_t v5 = *MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = a3;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_error_impl(&dword_2608DB000, v5, OS_LOG_TYPE_ERROR, "Exception caught data at %{public}@; exception: %{public}@",
      (uint8_t *)&v6,
      0x16u);
  }

  objc_end_catch();
}

- (void)writeData:atPath:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "Could not create directory at %{public}@; error: %{public}@ for protection");
}

- (void)migrateDataAtPath:toPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "Removing migrated repository from: %{public}@ failed %{public}@");
}

- (void)_excludeItemFromBackupAtPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "Could not set 'exclude from backup' key on %{public}@; error: %{public}@");
}

@end