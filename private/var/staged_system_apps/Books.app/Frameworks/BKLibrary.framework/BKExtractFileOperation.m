@interface BKExtractFileOperation
- (BKExtractFileOperationDelegate)delegate;
- (BOOL)_ensureBackupAttributeOnItemAtPath:(id)a3 error:(id *)a4;
- (BOOL)_forceFileProtectionOnItemAtPath:(id)a3 usingFileManager:(id)a4 error:(id *)a5;
- (BOOL)_reportingProgress;
- (BOOL)fixFilePermissions;
- (BOOL)skipCleanupDestinationFile;
- (BOOL)useFileCoordination;
- (NSString)destinationFilePath;
- (NSString)forcedFileProtection;
- (NSString)sourceFilePath;
- (double)progress;
- (id)_zipExtractionPathFromSourcePath:(id)a3;
- (id)userContext;
- (int)sourceFileType;
- (void)_fixFilePermissions:(id)a3;
- (void)_initializeProgress;
- (void)_performCopyFromPath:(id)a3 toPath:(id)a4;
- (void)_performMoveFromPath:(id)a3 toPath:(id)a4;
- (void)_performZipExtractionFromPath:(id)a3 toPath:(id)a4;
- (void)_updateProgressWithByteCount:(int64_t)a3;
- (void)didCopyItemToURL:(id)a3 fileSize:(unint64_t)a4;
- (void)main;
- (void)setDelegate:(id)a3;
- (void)setDestinationFilePath:(id)a3;
- (void)setFixFilePermissions:(BOOL)a3;
- (void)setForcedFileProtection:(id)a3;
- (void)setSourceFilePath:(id)a3;
- (void)setSourceFileType:(int)a3;
- (void)setUseFileCoordination:(BOOL)a3;
- (void)setUserContext:(id)a3;
@end

@implementation BKExtractFileOperation

- (void)main
{
  v3 = BCIMLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int v4 = [(BKExtractFileOperation *)self sourceFileType];
    v5 = [(BKExtractFileOperation *)self sourceFilePath];
    *(_DWORD *)buf = 67109378;
    unsigned int v29 = v4;
    __int16 v30 = 2112;
    v31 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "BKExtractFileOperation main: Starting operation: (type: %d, path: %@)", buf, 0x12u);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_2AC4;
  v27[3] = &unk_D1388;
  v27[4] = self;
  v6 = objc_retainBlock(v27);
  if ([(BKExtractFileOperation *)self useFileCoordination])
  {
    v7 = [(BKExtractFileOperation *)self sourceFilePath];
    v8 = +[NSURL fileURLWithPath:v7];

    if ([(BKExtractFileOperation *)self sourceFileType] == 2)
    {
      uint64_t v26 = 0;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_2C78;
      v24[3] = &unk_D13B0;
      v9 = (id *)&v25;
      v24[4] = self;
      v25 = v6;
      v10 = (id *)&v26;
      +[NSURL coordinateWritingItemAtURL:v8 options:2 error:&v26 byAccessor:v24];
    }
    else
    {
      uint64_t v23 = 0;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_2CF4;
      v21[3] = &unk_D13B0;
      v9 = (id *)&v22;
      v21[4] = self;
      v22 = v6;
      v10 = (id *)&v23;
      +[NSURL coordinateReadingItemAtURL:v8 options:0 error:&v23 byAccessor:v21];
    }
    id v11 = *v10;

    if (v11)
    {
      v12 = BCIMLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_8EDAC(self);
      }
    }
  }
  else
  {
    id v11 = [(BKExtractFileOperation *)self sourceFilePath];
    v8 = [(BKExtractFileOperation *)self destinationFilePath];
    ((void (*)(void *, id, void *))v6[2])(v6, v11, v8);
  }

  BOOL success = self->_success;
  v14 = BCIMLog();
  v15 = v14;
  if (success)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [(BKExtractFileOperation *)self sourceFileType];
      v17 = [(BKExtractFileOperation *)self sourceFilePath];
      *(_DWORD *)buf = 67109378;
      unsigned int v29 = v16;
      __int16 v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "BKExtractFileOperation main: Success: (type: %d, path: %@)", buf, 0x12u);
    }
    if ([(BKExtractFileOperation *)self _reportingProgress])
    {
      self->_progressBytes = self->_totalBytes;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained performSelectorOnMainThread:"extractOperationDidUpdateProgress:" withObject:self waitUntilDone:1];
    }
    v19 = &selRef_extractOperationDidFinish_;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_8ECF8(self);
    }

    v19 = &selRef_extractOperationDidFail_;
  }
  id v20 = objc_loadWeakRetained((id *)&self->_delegate);
  [v20 performSelectorOnMainThread:*v19 withObject:self waitUntilDone:1];
}

- (void)setSourceFilePath:(id)a3
{
  v5 = (NSString *)a3;
  p_sourceFilePath = &self->_sourceFilePath;
  if (self->_sourceFilePath != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_sourceFilePath, a3);
    p_sourceFilePath = (NSString **)[(BKExtractFileOperation *)self _initializeProgress];
    v5 = v7;
  }

  _objc_release_x1(p_sourceFilePath, v5);
}

- (void)_initializeProgress
{
  unint64_t v10 = 0;
  id v3 = 0;
  if ([(BKExtractFileOperation *)self sourceFileType] != 1)
  {
LABEL_9:
    self->_totalBytes = 0;
    goto LABEL_10;
  }
  unsigned int v4 = [(BKExtractFileOperation *)self sourceFilePath];
  v5 = +[NSURL fileURLWithPath:v4];

  id v9 = 0;
  id v6 = [objc_alloc((Class)BUUnarchivingFileCopier) initWithURL:v5 options:5 error:&v9];
  id v3 = v9;
  if (!v6)
  {
    v8 = BKLibraryLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_8EE6C();
    }

    goto LABEL_9;
  }

  [v6 countTotalFileSize:&v10 totalFileCount:0];
  v7 = BKLibraryLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_8EED4((uint64_t *)&v10, v7);
  }

  self->_totalBytes = v10;
  self->_progressBytes = 0;
  self->_lastSnapshotTime = -1.79769313e308;

LABEL_10:
}

- (BOOL)_reportingProgress
{
  return self->_totalBytes != 0;
}

- (double)progress
{
  unint64_t totalBytes = self->_totalBytes;
  if (totalBytes) {
    double result = (double)self->_progressBytes / (double)totalBytes;
  }
  else {
    double result = 0.0;
  }
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (void)_updateProgressWithByteCount:(int64_t)a3
{
  unint64_t progressBytes = self->_progressBytes;
  unint64_t totalBytes = progressBytes + a3;
  if (progressBytes + a3 >= self->_totalBytes) {
    unint64_t totalBytes = self->_totalBytes;
  }
  if (totalBytes != progressBytes) {
    self->_unint64_t progressBytes = totalBytes;
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (self->_lastSnapshotTime + 0.2 < Current)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained performSelectorOnMainThread:"extractOperationDidUpdateProgress:" withObject:self waitUntilDone:1];

    self->_lastSnapshotTime = Current;
  }
}

- (BOOL)_forceFileProtectionOnItemAtPath:(id)a3 usingFileManager:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(BKExtractFileOperation *)self forcedFileProtection];

  if (v10)
  {
    NSFileAttributeKey v14 = NSFileProtectionKey;
    NSFileProtectionType v15 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    id v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    unsigned __int8 v12 = [v9 setAttributes:v11 ofItemAtPath:v8 error:a5];
  }
  else
  {
    unsigned __int8 v12 = 1;
  }

  return v12;
}

- (void)_performCopyFromPath:(id)a3 toPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSFileManager);
  id v17 = 0;
  unsigned int v9 = [v8 copyItemAtPath:v7 toPath:v6 error:&v17];

  id v10 = v17;
  id v11 = v10;
  if (!v9)
  {
    NSFileProtectionType v15 = BCIMLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_8EFB8((uint64_t)v11, v15);
    }
    id v13 = v11;
    goto LABEL_9;
  }
  id v16 = v10;
  unsigned __int8 v12 = [(BKExtractFileOperation *)self _forceFileProtectionOnItemAtPath:v6 usingFileManager:v8 error:&v16];
  id v13 = v16;

  if ((v12 & 1) == 0)
  {
    NSFileProtectionType v15 = BCIMLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_8EF50();
    }
LABEL_9:

    BOOL v14 = 0;
    goto LABEL_10;
  }
  BOOL v14 = 1;
LABEL_10:
  self->_BOOL success = v14;
}

- (void)_performMoveFromPath:(id)a3 toPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSFileManager);
  id v19 = 0;
  unsigned int v9 = [v8 moveItemAtPath:v7 toPath:v6 error:&v19];

  id v10 = v19;
  id v11 = v10;
  if (!v9)
  {
    id v16 = BCIMLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_8F100((uint64_t)v11, v16);
    }
    goto LABEL_12;
  }
  id v18 = v10;
  unsigned int v12 = [(BKExtractFileOperation *)self _forceFileProtectionOnItemAtPath:v6 usingFileManager:v8 error:&v18];
  id v13 = v18;

  if (!v12)
  {
    id v16 = BCIMLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_8F098();
    }
    id v11 = v13;
    goto LABEL_12;
  }
  id v17 = v13;
  unsigned __int8 v14 = [(BKExtractFileOperation *)self _ensureBackupAttributeOnItemAtPath:v6 error:&v17];
  id v11 = v17;

  if ((v14 & 1) == 0)
  {
    id v16 = BCIMLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_8F030();
    }
LABEL_12:

    BOOL v15 = 0;
    goto LABEL_13;
  }
  BOOL v15 = 1;
LABEL_13:
  self->_BOOL success = v15;
}

- (BOOL)_ensureBackupAttributeOnItemAtPath:(id)a3 error:(id *)a4
{
  v5 = +[NSURL fileURLWithPath:a3];
  id v11 = 0;
  unsigned int v6 = [v5 getResourceValue:&v11 forKey:NSURLIsExcludedFromBackupKey error:a4];
  id v7 = v11;
  id v8 = v7;
  if (v6)
  {
    if (v7 && ![v7 BOOLValue]) {
      unsigned __int8 v9 = 1;
    }
    else {
      unsigned __int8 v9 = [v5 setResourceValue:&__kCFBooleanFalse forKey:NSURLIsExcludedFromBackupKey error:a4];
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)_fixFilePermissions:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[NSFileManager defaultManager];
  sub_374C((uint64_t)v4, v3);
  v32[0] = NSURLIsDirectoryKey;
  v32[1] = NSURLIsSymbolicLinkKey;
  +[NSArray arrayWithObjects:v32 count:2];
  id v17 = v4;
  id v16 = v18 = v3;
  v5 = [v4 enumeratorAtURL:v3];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      unsigned __int8 v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v9);
        id v19 = 0;
        id v20 = 0;
        unsigned int v11 = [v10 getResourceValue:&v20 forKey:NSURLIsSymbolicLinkKey error:&v19];
        id v12 = v20;
        id v13 = v19;
        if (v11)
        {
          if (v12)
          {
            uint64_t v14 = (uint64_t)[v12 BOOLValue];
            if ((v14 & 1) == 0) {
              sub_374C(v14, v10);
            }
          }
        }
        else
        {
          BOOL v15 = BCIMLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 141558530;
            uint64_t v26 = 1752392040;
            __int16 v27 = 2112;
            v28 = v10;
            __int16 v29 = 2112;
            id v30 = v13;
            _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "BKExtractFileOperation _fixFilePermissions: getResourceValue failed. key: NSURLIsSymbolicLinkKey url: %{mask.hash}@ error: %@", buf, 0x20u);
          }
        }
        unsigned __int8 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v7);
  }
}

- (void)_performZipExtractionFromPath:(id)a3 toPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    uint64_t v8 = [(BKExtractFileOperation *)self _zipExtractionPathFromSourcePath:v6];
    unsigned __int8 v9 = +[NSURL fileURLWithPath:v6];
    id v10 = +[NSURL fileURLWithPath:v8];
    unsigned int v11 = BKLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558786;
      uint64_t v28 = 1752392040;
      __int16 v29 = 2112;
      id v30 = v6;
      __int16 v31 = 2160;
      uint64_t v32 = 1752392040;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Extracting %{mask.hash}@ to immediate path %{mask.hash}@", buf, 0x2Au);
    }

    self->_skipCleanupDestinationFile = 1;
    id v26 = 0;
    id v12 = [objc_alloc((Class)BUUnarchivingFileCopier) initWithURL:v9 options:5 error:&v26];
    id v13 = v26;
    [v12 setDelegate:self];
    self->_skipCleanupDestinationFile = 0;
    if (v13)
    {
      uint64_t v14 = BKLibraryLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_8F3E0();
      }
    }
    else
    {
      id v25 = 0;
      unsigned __int8 v15 = [v12 copyToURL:v10 error:&v25];
      id v13 = v25;
      self->_BOOL success = v15;
    }

    id v16 = objc_alloc_init((Class)NSFileManager);
    id v17 = v16;
    if (self->_success)
    {
      id v18 = BKLibraryLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 141558786;
        uint64_t v28 = 1752392040;
        __int16 v29 = 2112;
        id v30 = v8;
        __int16 v31 = 2160;
        uint64_t v32 = 1752392040;
        __int16 v33 = 2112;
        id v34 = v7;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Moving from immediate path %{mask.hash}@ to destination %{mask.hash}@", buf, 0x2Au);
      }

      id v24 = 0;
      unsigned __int8 v19 = [v17 moveItemAtPath:v8 toPath:v7 error:&v24];
      id v20 = v24;
      self->_BOOL success = v19;
      if (v19) {
        goto LABEL_23;
      }
      long long v21 = BCIMLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_8F310();
      }
    }
    else
    {
      if (![v16 fileExistsAtPath:v8])
      {
        id v20 = 0;
        goto LABEL_23;
      }
      id v23 = 0;
      unsigned __int8 v22 = [v17 removeItemAtPath:v8 error:&v23];
      id v20 = v23;
      if (v22)
      {
LABEL_23:

        goto LABEL_24;
      }
      long long v21 = BCIMLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_8F2A8();
      }
    }

    goto LABEL_23;
  }
  self->_BOOL success = 0;
LABEL_24:
}

- (id)_zipExtractionPathFromSourcePath:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[UIApplication applicationCacheDirectory];
  v5 = [v4 stringByAppendingPathComponent:@"tmp"];
  id v6 = [v3 lastPathComponent];

  id v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

- (void)didCopyItemToURL:(id)a3 fileSize:(unint64_t)a4
{
}

- (BKExtractFileOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKExtractFileOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)destinationFilePath
{
  return self->_destinationFilePath;
}

- (void)setDestinationFilePath:(id)a3
{
}

- (NSString)sourceFilePath
{
  return self->_sourceFilePath;
}

- (id)userContext
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setUserContext:(id)a3
{
}

- (int)sourceFileType
{
  return self->_sourceFileType;
}

- (void)setSourceFileType:(int)a3
{
  self->_sourceFileType = a3;
}

- (BOOL)skipCleanupDestinationFile
{
  return self->_skipCleanupDestinationFile;
}

- (BOOL)useFileCoordination
{
  return self->_useFileCoordination;
}

- (void)setUseFileCoordination:(BOOL)a3
{
  self->_useFileCoordination = a3;
}

- (NSString)forcedFileProtection
{
  return self->_forcedFileProtection;
}

- (void)setForcedFileProtection:(id)a3
{
}

- (BOOL)fixFilePermissions
{
  return self->_fixFilePermissions;
}

- (void)setFixFilePermissions:(BOOL)a3
{
  self->_fixFilePermissions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcedFileProtection, 0);
  objc_storeStrong((id *)&self->_sourceFilePath, 0);
  objc_storeStrong((id *)&self->_destinationFilePath, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong(&self->_userContext, 0);
}

@end