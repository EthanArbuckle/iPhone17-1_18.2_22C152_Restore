@interface PLAppPrivateData
+ (BOOL)_validateBundleRootWithPathManager:(id)a3;
+ (BOOL)accessInstanceVariablesDirectly;
+ (id)appPrivateDataForLibraryURL:(id)a3;
- (BOOL)_saveToFilesystemWithError:(id *)a3;
- (BOOL)setValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setValue:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)setValuesForKeysWithDictionary:(id)a3 error:(id *)a4;
- (NSMutableDictionary)backingDictionary;
- (NSURL)libraryURL;
- (PLAppPrivateData)initWithLibraryURL:(id)a3;
- (PLPhotoLibraryPathManager)pathManager;
- (id)_appPrivateDataFolderURLCreateIfNeeded:(BOOL)a3;
- (id)_dictionaryStorageURL;
- (id)_dictionaryStorageURLPreparedForWriting:(BOOL)a3;
- (id)allKeys;
- (id)debugDescription;
- (id)dictionaryWithValuesForKeys:(id)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (void)_readFromFilesystem;
- (void)_recursiveCreateSubDictionariesIfMissing:(id)a3 index:(unint64_t)a4 parentDictionary:(id)a5;
- (void)setBackingDictionary:(id)a3;
- (void)setLibraryURL:(id)a3;
- (void)setPathManager:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
- (void)setValuesForKeysWithDictionary:(id)a3;
@end

@implementation PLAppPrivateData

+ (id)appPrivateDataForLibraryURL:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  if (!sPathToObjectMap)
  {
    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    v7 = (void *)sPathToObjectMap;
    sPathToObjectMap = v6;
  }
  v8 = [v4 path];
  v9 = [(id)sPathToObjectMap objectForKey:v8];
  if (!v9)
  {
    v9 = [[PLAppPrivateData alloc] initWithLibraryURL:v4];
    if (v9) {
      [(id)sPathToObjectMap setObject:v9 forKey:v8];
    }
  }

  objc_sync_exit(v5);
  return v9;
}

- (PLAppPrivateData)initWithLibraryURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLAppPrivateData;
  uint64_t v6 = [(PLAppPrivateData *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryURL, a3);
    v8 = [[PLPhotoLibraryPathManager alloc] initWithLibraryURL:v7->_libraryURL];
    pathManager = v7->_pathManager;
    v7->_pathManager = v8;

    if ([(id)objc_opt_class() _validateBundleRootWithPathManager:v7->_pathManager])
    {
      [(PLAppPrivateData *)v7 _readFromFilesystem];
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (void)_readFromFilesystem
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(PLAppPrivateData *)self _dictionaryStorageURL];
  id v4 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:v3];
  id v5 = v4;
  if (v4)
  {
    [v4 open];
    id v21 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithStream:v5 options:1 format:0 error:&v21];
    id v7 = v21;
    [v5 close];
    if (v6)
    {
      [(PLAppPrivateData *)self setBackingDictionary:v6];
      v8 = PLBackendGetLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
LABEL_13:

        goto LABEL_14;
      }
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      objc_super v11 = [v3 path];
      *(_DWORD *)buf = 138412546;
      v23 = v10;
      __int16 v24 = 2112;
      v25 = v11;
      v12 = "Successfully read %@ from file %@";
      v13 = v8;
      os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
      uint32_t v15 = 22;
    }
    else
    {
      v16 = [v7 userInfo];
      v8 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      v17 = [v8 domain];
      if ([v17 isEqualToString:*MEMORY[0x1E4F28798]])
      {
        uint64_t v18 = [v8 code];

        if (v18 == 2) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      v10 = PLBackendGetLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      objc_super v11 = [v3 path];
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      v12 = "Error reading property list from %@";
      v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 12;
    }
    _os_log_impl(&dword_19BCFB000, v13, v14, v12, buf, v15);

LABEL_12:
    goto LABEL_13;
  }
LABEL_14:
  v19 = [(PLAppPrivateData *)self backingDictionary];

  if (!v19)
  {
    v20 = [MEMORY[0x1E4F1CA60] dictionary];
    [(PLAppPrivateData *)self setBackingDictionary:v20];
  }
}

- (void)setBackingDictionary:(id)a3
{
}

- (BOOL)_saveToFilesystemWithError:(id *)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)MEMORY[0x1E4F28F98];
  uint64_t v6 = [(PLAppPrivateData *)v4 backingDictionary];
  id v32 = 0;
  id v7 = [v5 dataWithPropertyList:v6 format:100 options:0 error:&v32];
  id v8 = v32;

  if (v7)
  {
    v9 = [(PLAppPrivateData *)v4 _dictionaryStorageURLPreparedForWriting:1];
    id v31 = v8;
    int v10 = [v7 writeToURL:v9 options:1 error:&v31];
    id v11 = v31;

    v12 = PLBackendGetLog();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = [v7 length];
        uint32_t v15 = [v9 path];
        *(_DWORD *)buf = 134218242;
        uint64_t v34 = v14;
        __int16 v35 = 2112;
        id v36 = v15;
        _os_log_impl(&dword_19BCFB000, v13, OS_LOG_TYPE_DEBUG, "%ld bytes written to %@", buf, 0x16u);
      }
      BOOL v16 = 1;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v17 = [v9 path];
        *(_DWORD *)buf = 138412546;
        uint64_t v34 = (uint64_t)v17;
        __int16 v35 = 2112;
        id v36 = v11;
        _os_log_impl(&dword_19BCFB000, v13, OS_LOG_TYPE_ERROR, "Failed to write property list to %@. Error: %@", buf, 0x16u);
      }
      if (PLIsErrorEqualToCode(v11, (void *)*MEMORY[0x1E4F281F8], 513))
      {
        unsigned __int8 v30 = 0;
        uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
        v19 = [v9 path];
        uint64_t v20 = [v18 fileExistsAtPath:v19 isDirectory:&v30];

        v41[0] = *MEMORY[0x1E4F1C6A8];
        id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
        v22 = [v9 resourceValuesForKeys:v21 error:0];

        v23 = [v9 path];
        BOOL v24 = +[PLSandboxHelper processCanWriteSandboxForPath:v23];

        v25 = PLBackendGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = [MEMORY[0x1E4F28ED0] numberWithBool:v20];
          v27 = [MEMORY[0x1E4F28ED0] numberWithBool:v30];
          v28 = [MEMORY[0x1E4F28ED0] numberWithBool:v24];
          *(_DWORD *)buf = 138413058;
          uint64_t v34 = (uint64_t)v26;
          __int16 v35 = 2112;
          id v36 = v27;
          __int16 v37 = 2112;
          v38 = v28;
          __int16 v39 = 2112;
          v40 = v22;
          _os_log_impl(&dword_19BCFB000, v25, OS_LOG_TYPE_ERROR, "_saveToFilesystem: exists? %@ isDirectory? %@ sandboxCanWrite? %@ properties: %@", buf, 0x2Au);
        }
      }
      BOOL v16 = 0;
    }
  }
  else
  {
    v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = (uint64_t)v8;
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, "Failed to serialize backingDictionary. Error: %@", buf, 0xCu);
    }
    BOOL v16 = 0;
    id v11 = v8;
  }

  if (a3) {
    *a3 = v11;
  }

  objc_sync_exit(v4);
  return v16;
}

- (id)_dictionaryStorageURLPreparedForWriting:(BOOL)a3
{
  v3 = [(PLAppPrivateData *)self _appPrivateDataFolderURLCreateIfNeeded:a3];
  id v4 = [v3 URLByAppendingPathComponent:@"appPrivateData.plist"];

  return v4;
}

- (id)_appPrivateDataFolderURLCreateIfNeeded:(BOOL)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [(PLPhotoLibraryPathManager *)self->_pathManager photoDirectoryWithType:5 createIfNeeded:a3 error:0];
  id v5 = [v3 fileURLWithPath:v4];

  return v5;
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = self;
  objc_sync_enter(v10);
  id v11 = [(PLAppPrivateData *)v10 backingDictionary];
  [v11 setValue:v8 forKey:v9];

  LOBYTE(a5) = [(PLAppPrivateData *)v10 _saveToFilesystemWithError:a5];
  objc_sync_exit(v10);

  return (char)a5;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(PLAppPrivateData *)v5 backingDictionary];
  id v7 = [v6 valueForKey:v4];

  objc_sync_exit(v5);
  return v7;
}

- (NSMutableDictionary)backingDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (id)_dictionaryStorageURL
{
  return [(PLAppPrivateData *)self _dictionaryStorageURLPreparedForWriting:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

- (void)setPathManager:(id)a3
{
}

- (PLPhotoLibraryPathManager)pathManager
{
  return (PLPhotoLibraryPathManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLibraryURL:(id)a3
{
}

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setValuesForKeysWithDictionary:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = 0;
  LOBYTE(self) = [(PLAppPrivateData *)self setValuesForKeysWithDictionary:v4 error:&v8];
  id v5 = v8;
  if ((self & 1) == 0)
  {
    if (v5)
    {
      uint64_t v9 = *MEMORY[0x1E4F28A50];
      v10[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Failed setting keys with dictionary on app private data" userInfo:v6];
    objc_exception_throw(v7);
  }
}

- (BOOL)setValuesForKeysWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(PLAppPrivateData *)v7 backingDictionary];
  [v8 setValuesForKeysWithDictionary:v6];

  LOBYTE(a4) = [(PLAppPrivateData *)v7 _saveToFilesystemWithError:a4];
  objc_sync_exit(v7);

  return (char)a4;
}

- (id)dictionaryWithValuesForKeys:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(PLAppPrivateData *)v5 backingDictionary];
  id v7 = [v6 dictionaryWithValuesForKeys:v4];

  objc_sync_exit(v5);
  return v7;
}

- (id)allKeys
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(PLAppPrivateData *)v2 backingDictionary];
  id v4 = [v3 allKeys];

  objc_sync_exit(v2);
  return v4;
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v11 = 0;
  LOBYTE(self) = [(PLAppPrivateData *)self setValue:v6 forKeyPath:v7 error:&v11];
  id v8 = v11;
  if ((self & 1) == 0)
  {
    if (v8)
    {
      uint64_t v12 = *MEMORY[0x1E4F28A50];
      v13[0] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Failed setting value for keypath on app private data" userInfo:v9];
    objc_exception_throw(v10);
  }
}

- (BOOL)setValue:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  objc_sync_enter(v10);
  id v11 = [v9 componentsSeparatedByString:@"."];
  uint64_t v12 = [(PLAppPrivateData *)v10 backingDictionary];
  [(PLAppPrivateData *)v10 _recursiveCreateSubDictionariesIfMissing:v11 index:0 parentDictionary:v12];

  v13 = [(PLAppPrivateData *)v10 backingDictionary];
  [v13 setValue:v8 forKeyPath:v9];

  LOBYTE(a5) = [(PLAppPrivateData *)v10 _saveToFilesystemWithError:a5];
  objc_sync_exit(v10);

  return (char)a5;
}

- (void)_recursiveCreateSubDictionariesIfMissing:(id)a3 index:(unint64_t)a4 parentDictionary:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  unint64_t v9 = a4 + 1;
  if ([v14 count] > a4 + 1)
  {
    id v10 = [v14 objectAtIndex:a4];
    id v11 = [v8 objectForKey:v10];
    uint64_t v12 = [v8 objectForKey:v10];

    if (!v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];

      [v8 setObject:v13 forKey:v10];
      id v11 = (void *)v13;
    }
    [(PLAppPrivateData *)self _recursiveCreateSubDictionariesIfMissing:v14 index:v9 parentDictionary:v11];
  }
}

- (id)valueForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(PLAppPrivateData *)v5 backingDictionary];
  id v7 = [v6 valueForKeyPath:v4];

  objc_sync_exit(v5);
  return v7;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v11 = 0;
  LOBYTE(self) = [(PLAppPrivateData *)self setValue:v6 forKey:v7 error:&v11];
  id v8 = v11;
  if ((self & 1) == 0)
  {
    if (v8)
    {
      uint64_t v12 = *MEMORY[0x1E4F28A50];
      v13[0] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Failed setting value on app private data" userInfo:v9];
    objc_exception_throw(v10);
  }
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(PLAppPrivateData *)self _dictionaryStorageURL];
  id v7 = [v6 path];
  id v8 = [v3 stringWithFormat:@"%@<%p> (%@): %@", v5, self, v7, self->_backingDictionary];

  return v8;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (BOOL)_validateBundleRootWithPathManager:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  char v3 = [a3 validateCreationRequestWithError:&v7];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    id v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_FAULT, "AppPrivateData invalid bundle root. Error: %@", buf, 0xCu);
    }
  }
  return v3;
}

@end