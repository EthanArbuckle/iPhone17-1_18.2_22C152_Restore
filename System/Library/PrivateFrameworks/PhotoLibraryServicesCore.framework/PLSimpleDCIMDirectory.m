@interface PLSimpleDCIMDirectory
+ (id)cameraRollPlistName;
+ (id)cloudPlistName;
+ (id)migrateOldPlistToNewPlist:(id)a3;
- (BOOL)_ensureDirectoryExists:(id)a3;
- (BOOL)representsCameraRoll;
- (BOOL)shouldCheckForExistingFiles;
- (NSURL)directoryURL;
- (PLSimpleDCIMDirectory)initWithDirectoryURL:(id)a3 subDirectorySuffix:(id)a4 perDirectoryLimit:(unint64_t)a5 userInfoPath:(id)a6;
- (_NSRange)_fileNameNumberRangeForDirNumber:(unint64_t)a3;
- (id)_availableFileNameNumbersInDirNumber:(unint64_t)a3;
- (id)_currentSubDirectory;
- (id)_nextAvailableFileURLWithExtension:(id)a3;
- (id)_subDirURLForNumber:(unint64_t)a3 create:(BOOL)a4 didCreate:(BOOL *)a5;
- (id)nextAvailableFileURLWithExtension:(id)a3;
- (void)_loadUserInfoLastUsedDirectoryNumber:(id *)a3 lastUsedFileNumber:(id *)a4;
- (void)_saveUserInfo;
- (void)reset;
- (void)setRepresentsCameraRoll:(BOOL)a3;
- (void)setShouldCheckForExistingFiles:(BOOL)a3;
@end

@implementation PLSimpleDCIMDirectory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_userInfoPath, 0);
  objc_storeStrong((id *)&self->_currentSubDirectoryURL, 0);
  objc_storeStrong((id *)&self->_availableFileNameNumbers, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_subDirSuffix, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

- (void)setShouldCheckForExistingFiles:(BOOL)a3
{
  self->_shouldCheckForExistingFiles = a3;
}

- (BOOL)shouldCheckForExistingFiles
{
  return self->_shouldCheckForExistingFiles;
}

- (void)setRepresentsCameraRoll:(BOOL)a3
{
  self->_representsCameraRoll = a3;
}

- (BOOL)representsCameraRoll
{
  return self->_representsCameraRoll;
}

- (NSURL)directoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)_ensureDirectoryExists:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned __int8 v15 = 0;
  fileManager = self->_fileManager;
  v6 = [v4 path];
  LODWORD(fileManager) = [(NSFileManager *)fileManager fileExistsAtPath:v6 isDirectory:&v15];
  int v7 = v15;

  if (fileManager) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = self->_fileManager;
    id v14 = 0;
    char v12 = [(NSFileManager *)v9 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v14];
    id v10 = v14;
    if ((v12 & 1) == 0)
    {
      v11 = PLBackendGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v10;
        _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_ERROR, "Unable to create DCIM dir: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (void)_loadUserInfoLastUsedDirectoryNumber:(id *)a3 lastUsedFileNumber:(id *)a4
{
  if (!self->_hasLoadedUserInfo && self->_userInfoPath)
  {
    self->_hasLoadedUserInfo = 1;
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithContentsOfFile:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v6 = [v8 objectForKey:@"DCIMLastDirectoryNumber"];
    int v7 = [v8 objectForKey:@"DCIMLastFileNumber"];
    if (a3) {
      *a3 = v6;
    }
    if (a4) {
      *a4 = v7;
    }
  }
}

- (void)_saveUserInfo
{
  if (self->_userInfoPath)
  {
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_currentSubDirectoryNumber];
    v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[NSMutableIndexSet firstIndex](self->_availableFileNameNumbers, "firstIndex"));
    objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, @"DCIMLastDirectoryNumber", v5, @"DCIMLastFileNumber", 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:100 options:0 error:0];
    [v6 writeToFile:self->_userInfoPath options:1073741825 error:0];
  }
}

- (_NSRange)_fileNameNumberRangeForDirNumber:(unint64_t)a3
{
  unint64_t v3 = (1000 * a3 - 100000) % 0x2710;
  uint64_t v4 = v3 | 1;
  unint64_t v5 = v3 + self->_directoryLimit;
  if (v5 >= 0x270F) {
    unint64_t v5 = 9999;
  }
  NSUInteger v6 = v5 - v4 + 1;
  NSUInteger v7 = v4;
  result.length = v6;
  result.location = v7;
  return result;
}

- (id)_availableFileNameNumbersInDirNumber:(unint64_t)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (void *)MEMORY[0x1E4F28E60];
  uint64_t v6 = -[PLSimpleDCIMDirectory _fileNameNumberRangeForDirNumber:](self, "_fileNameNumberRangeForDirNumber:");
  id v8 = objc_msgSend(v5, "indexSetWithIndexesInRange:", v6, v7);
  uint64_t v9 = *MEMORY[0x1E4F1C6E8];
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C6E8]];
  v11 = [(PLSimpleDCIMDirectory *)self _subDirURLForNumber:a3 create:0 didCreate:0];
  char v12 = [(NSFileManager *)self->_fileManager enumeratorAtURL:v11 includingPropertiesForKeys:v10 options:1 errorHandler:0];
  v32 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    v28 = v11;
    v29 = v10;
    v30 = v8;
    unint64_t v31 = 0;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x19F38F510]();
        id v35 = 0;
        int v20 = [v18 getResourceValue:&v35 forKey:v9 error:0];
        id v21 = v35;
        if (v20)
        {
          v22 = [MEMORY[0x1E4F28FE8] scannerWithString:v21];
          int v34 = -1;
          id v33 = 0;
          int v23 = [v22 scanUpToCharactersFromSet:v32 intoString:&v33];
          id v24 = v33;
          v25 = v24;
          if (v23
            && [v24 length] == 4
            && [v22 scanInt:&v34]
            && v34 >= 1
            && v34 <= 9999
            && [v22 scanString:@"." intoString:0])
          {
            unint64_t v26 = v31;
            if (v31 <= v34) {
              unint64_t v26 = v34;
            }
            unint64_t v31 = v26;
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v15);

    id v10 = v29;
    id v8 = v30;
    v11 = v28;
    if (v31) {
      [v30 removeIndexesInRange:1];
    }
  }
  else
  {
  }
  return v8;
}

- (id)_subDirURLForNumber:(unint64_t)a3 create:(BOOL)a4 didCreate:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = [NSString stringWithFormat:@"%u%@", a3, self->_subDirSuffix];
  uint64_t v9 = [(NSURL *)self->_baseURL URLByAppendingPathComponent:v8 isDirectory:1];
  id v10 = v9;
  if (v6)
  {
    id v19 = 0;
    int v11 = [v9 getResourceValue:&v19 forKey:*MEMORY[0x1E4F1C5C0] error:0];
    id v12 = v19;
    if (v11)
    {
      *a5 = 0;
    }
    else
    {
      *a5 = 1;
      fileManager = self->_fileManager;
      id v18 = 0;
      BOOL v14 = [(NSFileManager *)fileManager createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v18];
      id v15 = v18;
      if (!v14)
      {
        uint64_t v16 = [v10 path];
        NSLog((NSString *)@"Unable to create directory at '%@': %@", v16, v15);
      }
    }
  }
  return v10;
}

- (id)_currentSubDirectory
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!self->_currentSubDirectoryURL) {
    goto LABEL_6;
  }
  if ([(NSMutableIndexSet *)self->_availableFileNameNumbers firstIndex] != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_50;
  }
  if (self->_currentSubDirectoryURL && (availableFileNameNumbers = self->_availableFileNameNumbers) != 0) {
    BOOL v4 = [(NSMutableIndexSet *)availableFileNameNumbers firstIndex] == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
LABEL_6:
  }
    BOOL v4 = 0;
  unint64_t v5 = self->_availableFileNameNumbers;
  self->_availableFileNameNumbers = 0;

  currentSubDirectoryURL = self->_currentSubDirectoryURL;
  self->_currentSubDirectoryURL = 0;

  long long v38 = [MEMORY[0x1E4F28E60] indexSet];
  if (v4) {
    [v38 addIndex:self->_currentSubDirectoryNumber + 1];
  }
  self->_currentSubDirectoryNumber = 100;
  uint64_t v7 = *MEMORY[0x1E4F1C6E8];
  long long v37 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C6E8]];
  id v8 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](self->_fileManager, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", self->_baseURL);
  if (self->_representsCameraRoll) {
    unint64_t v9 = 999;
  }
  else {
    unint64_t v9 = 1000;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(obj);
        }
        BOOL v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v15 = (void *)MEMORY[0x19F38F510]();
        id v43 = 0;
        int v16 = [v14 getResourceValue:&v43 forKey:v7 error:0];
        id v17 = v43;
        if (v16)
        {
          id v18 = [MEMORY[0x1E4F28FE8] scannerWithString:v17];
          signed int v42 = -1;
          if ([v18 scanInt:&v42]
            && v42 >= 0x64
            && v9 > v42
            && [v18 scanString:self->_subDirSuffix intoString:0]
            && [v18 isAtEnd])
          {
            [v38 addIndex:v42];
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v11);
  }

  uint64_t v19 = [v38 lastIndex];
  if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v20 = 100;
  }
  else {
    unint64_t v20 = v19;
  }
  id v40 = 0;
  id v41 = 0;
  [(PLSimpleDCIMDirectory *)self _loadUserInfoLastUsedDirectoryNumber:&v41 lastUsedFileNumber:&v40];
  id v21 = v41;
  id v22 = v40;
  if (v21)
  {
    unint64_t v23 = [v21 unsignedIntegerValue];
    if ((v23 != 999 || !self->_representsCameraRoll) && v20 <= v23) {
      unint64_t v20 = v23;
    }
  }
  if (v21) {
    BOOL v24 = v22 == 0;
  }
  else {
    BOOL v24 = 1;
  }
  int v25 = !v24;
  while (1)
  {
    unint64_t v26 = (void *)MEMORY[0x19F38F510]();
    LOBYTE(v42) = 0;
    v27 = [(PLSimpleDCIMDirectory *)self _subDirURLForNumber:v20 create:1 didCreate:&v42];
    if ((_BYTE)v42)
    {
      v28 = (void *)MEMORY[0x1E4F28E60];
      uint64_t v29 = [(PLSimpleDCIMDirectory *)self _fileNameNumberRangeForDirNumber:v20];
      objc_msgSend(v28, "indexSetWithIndexesInRange:", v29, v30);
    }
    else
    {
      [(PLSimpleDCIMDirectory *)self _availableFileNameNumbersInDirNumber:v20];
    }
    unint64_t v31 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue();
    if (v25 && v20 == [v21 unsignedIntegerValue]) {
      -[NSMutableIndexSet removeIndexesInRange:](v31, "removeIndexesInRange:", 1, [v22 unsignedIntegerValue]);
    }
    if ([(NSMutableIndexSet *)v31 firstIndex] != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    ++v20;
  }
  v32 = self->_availableFileNameNumbers;
  self->_availableFileNameNumbers = v31;
  id v33 = v31;

  int v34 = self->_currentSubDirectoryURL;
  self->_currentSubDirectoryURL = v27;

  self->_currentSubDirectoryNumber = v20;

LABEL_50:
  id v35 = self->_currentSubDirectoryURL;
  return v35;
}

- (void)reset
{
  isolation = self->_isolation;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__PLSimpleDCIMDirectory_reset__block_invoke;
  v3[3] = &unk_1E58A1EC0;
  v3[4] = self;
  pl_dispatch_async(isolation, v3);
}

void __30__PLSimpleDCIMDirectory_reset__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  *(void *)(v1 + 48) = 0;
}

- (id)_nextAvailableFileURLWithExtension:(id)a3
{
  id v5 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  unint64_t v20 = __Block_byref_object_copy__11704;
  id v21 = __Block_byref_object_dispose__11705;
  id v22 = 0;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  isolation = self->_isolation;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__PLSimpleDCIMDirectory__nextAvailableFileURLWithExtension___block_invoke;
  v12[3] = &unk_1E58A1AD8;
  v12[4] = self;
  v12[5] = &v17;
  v12[6] = &v13;
  v12[7] = a2;
  pl_dispatch_sync(isolation, v12);
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"IMG_%04u", v14[3]);
  id v8 = v7;
  if (v5)
  {
    uint64_t v9 = [v7 stringByAppendingPathExtension:v5];

    id v8 = (void *)v9;
  }
  uint64_t v10 = [(id)v18[5] URLByAppendingPathComponent:v8 isDirectory:0];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v10;
}

uint64_t __60__PLSimpleDCIMDirectory__nextAvailableFileURLWithExtension___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _currentSubDirectory];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1 + 32) _ensureDirectoryExists:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 40) firstIndex];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PLSimpleDCIMDirectory.m" lineNumber:115 description:@"Directory without available file name index"];
  }
  [*(id *)(a1 + 32) _saveUserInfo];
  id v5 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return [v5 removeIndex:v6];
}

- (id)nextAvailableFileURLWithExtension:(id)a3
{
  id v4 = a3;
  id v5 = [(PLSimpleDCIMDirectory *)self _nextAvailableFileURLWithExtension:v4];
  if (self->_shouldCheckForExistingFiles)
  {
    while ([v5 checkResourceIsReachableAndReturnError:0])
    {
      uint64_t v6 = [(PLSimpleDCIMDirectory *)self _nextAvailableFileURLWithExtension:v4];

      id v5 = v6;
      if (!self->_shouldCheckForExistingFiles) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = v5;
LABEL_6:

  return v6;
}

- (PLSimpleDCIMDirectory)initWithDirectoryURL:(id)a3 subDirectorySuffix:(id)a4 perDirectoryLimit:(unint64_t)a5 userInfoPath:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)PLSimpleDCIMDirectory;
  BOOL v14 = [(PLSimpleDCIMDirectory *)&v32 init];
  uint64_t v15 = v14;
  if (!v14)
  {
LABEL_12:
    unint64_t v26 = v15;
    goto LABEL_13;
  }
  unint64_t v16 = 2000;
  if (a5) {
    unint64_t v16 = a5;
  }
  v14->_directoryLimit = v16;
  objc_storeStrong((id *)&v14->_baseURL, a3);
  uint64_t v17 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E4F28CB8]);
  fileManager = v15->_fileManager;
  v15->_fileManager = v17;

  if ([(PLSimpleDCIMDirectory *)v15 _ensureDirectoryExists:v15->_baseURL])
  {
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.assetsd.PLSimpleDCIMDirectory", 0);
    isolation = v15->_isolation;
    v15->_isolation = (OS_dispatch_queue *)v19;

    if (v12)
    {
      uint64_t v21 = [v12 length];
      id v22 = [v12 uppercaseString];
      unint64_t v23 = v22;
      if (v21 == 5)
      {
        uint64_t v24 = [(NSString *)v22 copy];
        subDirSuffix = v15->_subDirSuffix;
        v15->_subDirSuffix = (NSString *)v24;
      }
      else
      {
        v27 = [(NSString *)v22 stringByPaddingToLength:5 withString:@"X" startingAtIndex:0];

        id v12 = [v27 substringToIndex:5];

        uint64_t v28 = [v12 copy];
        unint64_t v23 = v15->_subDirSuffix;
        v15->_subDirSuffix = (NSString *)v28;
      }
    }
    else
    {
      unint64_t v23 = v15->_subDirSuffix;
      v15->_subDirSuffix = (NSString *)@"APPLE";
    }

    uint64_t v29 = [v13 copy];
    userInfoPath = v15->_userInfoPath;
    v15->_userInfoPath = (NSString *)v29;

    goto LABEL_12;
  }
  unint64_t v26 = 0;
LABEL_13:

  return v26;
}

+ (id)cloudPlistName
{
  return @"DCIM_CLOUD.plist";
}

+ (id)cameraRollPlistName
{
  return @"DCIM_APPLE.plist";
}

+ (id)migrateOldPlistToNewPlist:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    int v19 = -1;
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    int v15 = -1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__PLSimpleDCIMDirectory_migrateOldPlistToNewPlist___block_invoke;
    v11[3] = &unk_1E58A1AB0;
    v11[4] = &v16;
    v11[5] = &v12;
    [v3 enumerateKeysAndObjectsUsingBlock:v11];
    unsigned int v4 = *((_DWORD *)v17 + 6);
    if (v4 == -1 || (int v5 = *((_DWORD *)v13 + 6), v5 == -1) || v4 <= 0x64 && v5 < 1)
    {
      uint64_t v6 = 0;
    }
    else
    {
      id v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:");
      uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInt:*((unsigned int *)v13 + 6)];
      uint64_t v6 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, @"DCIMLastDirectoryNumber", v10, @"DCIMLastFileNumber", 0);
    }
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __51__PLSimpleDCIMDirectory_migrateOldPlistToNewPlist___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 hasPrefix:@"LastFileGroupNumber"])
  {
    uint64_t v6 = objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v9, "length") - 3);
    int v7 = [v6 intValue];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v7 > *(_DWORD *)(v8 + 24))
    {
      *(_DWORD *)(v8 + 24) = v7;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 intValue];
    }
  }
}

@end