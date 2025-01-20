@interface ExtractFileOperation
- (BOOL)_applyFileAttributesToDirectory:(id)a3 error:(id *)a4;
- (BOOL)_performBOMCopy:(id *)a3;
- (NSDictionary)fileAttributes;
- (NSString)destinationFilePath;
- (NSString)sourceFilePath;
- (id)_newBOMCopierOptions;
- (int)sourceFileType;
- (void)_copierFinishedFileWithPath:(const char *)a3 size:(int64_t)a4;
- (void)_copierStartedFileWithPath:(const char *)a3 size:(int64_t)a4;
- (void)_copierUpdatedFileWithPath:(const char *)a3 size:(int64_t)a4;
- (void)_initializeProgress;
- (void)_updateProgressWithByteCount:(int64_t)a3;
- (void)dealloc;
- (void)run;
- (void)setDestinationFilePath:(id)a3;
- (void)setFileAttributes:(id)a3;
- (void)setSourceFilePath:(id)a3;
- (void)setSourceFileType:(int)a3;
@end

@implementation ExtractFileOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ExtractFileOperation;
  [(ExtractFileOperation *)&v3 dealloc];
}

- (void)run
{
  [(ExtractFileOperation *)self _initializeProgress];
  uint64_t v4 = 0;
  BOOL v3 = [(ExtractFileOperation *)self _performBOMCopy:&v4];
  if (v3) {
    [(ExtractFileOperation *)self _applyFileAttributesToDirectory:[(ExtractFileOperation *)self destinationFilePath] error:0];
  }
  [(ExtractFileOperation *)self setError:v4];
  [(ExtractFileOperation *)self setSuccess:v3];
}

- (BOOL)_applyFileAttributesToDirectory:(id)a3 error:(id *)a4
{
  id v66 = 0;
  v6 = &syslog_ptr;
  id v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
    int v10 = v9;
  }
  else {
    int v10 = v9 & 2;
  }
  if (v10)
  {
    v73.st_dev = 138412546;
    *(void *)&v73.st_mode = objc_opt_class();
    WORD2(v73.st_ino) = 2112;
    *(__darwin_ino64_t *)((char *)&v73.st_ino + 6) = (__darwin_ino64_t)a3;
    LODWORD(v55) = 22;
    v53 = &v73;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v73, v55);
      free(v12);
      v53 = (stat *)v13;
      SSFileLog();
    }
  }
  id v58 = objc_alloc_init((Class)NSFileManager);
  id obj = [v58 subpathsOfDirectoryAtPath:a3 error:&v66];
  if (obj)
  {
    id v57 = [(NSDictionary *)[(ExtractFileOperation *)self fileAttributes] mutableCopy];
    if (!v57) {
      id v57 = objc_alloc_init((Class)NSMutableDictionary);
    }
    v56 = a4;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v74, 16, v53);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v63;
      unsigned __int8 v17 = 1;
      id v60 = a3;
LABEL_17:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v63 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v62 + 1) + 8 * v18);
        id v20 = objc_alloc_init((Class)NSAutoreleasePool);
        id v21 = [a3 stringByAppendingPathComponent:v19];
        v22 = (const char *)[v21 fileSystemRepresentation];
        if (v22)
        {
          memset(&v73, 0, sizeof(v73));
          if (stat(v22, &v73))
          {
            id v23 = [v6[405] sharedDaemonConfig];
            if (!v23) {
              id v23 = [v6[405] sharedConfig];
            }
            unsigned int v24 = [v23 shouldLog];
            if ([v23 shouldLogToDisk]) {
              int v25 = v24 | 2;
            }
            else {
              int v25 = v24;
            }
            if (os_log_type_enabled((os_log_t)[v23 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
              int v26 = v25;
            }
            else {
              int v26 = v25 & 2;
            }
            if (v26)
            {
              uint64_t v27 = objc_opt_class();
              v28 = __error();
              v29 = strerror(*v28);
              int v67 = 138412802;
              uint64_t v68 = v27;
              __int16 v69 = 2112;
              id v70 = v21;
              __int16 v71 = 2080;
              id v72 = v29;
              LODWORD(v55) = 32;
              v54 = &v67;
              uint64_t v30 = _os_log_send_and_compose_impl();
              if (v30)
              {
                v31 = (void *)v30;
                v32 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, &v67, v55);
                free(v31);
                v54 = (int *)v32;
                SSFileLog();
              }
            }

            unsigned __int8 v17 = 0;
            id v66 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
            a3 = v60;
            v6 = &syslog_ptr;
          }
          else
          {
            id v33 = objc_alloc((Class)NSNumber);
            id v34 = [v33 initWithShort:(__int16)v73.st_mode | 0x1B0u];
            [v57 setObject:v34 forKey:NSFilePosixPermissions];

            id v66 = 0;
            unsigned __int8 v17 = [v58 setAttributes:v57 ofItemAtPath:v21 error:&v66];
            if ((v17 & 1) == 0)
            {
              id v35 = [v6[405] sharedDaemonConfig];
              if (!v35) {
                id v35 = [v6[405] sharedConfig];
              }
              unsigned int v36 = [v35 shouldLog];
              if ([v35 shouldLogToDisk]) {
                v36 |= 2u;
              }
              if (!os_log_type_enabled((os_log_t)[v35 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
                v36 &= 2u;
              }
              if (v36)
              {
                uint64_t v37 = objc_opt_class();
                int v67 = 138412802;
                uint64_t v68 = v37;
                __int16 v69 = 2112;
                id v70 = v21;
                __int16 v71 = 2112;
                id v72 = v66;
                LODWORD(v55) = 32;
                v54 = &v67;
                uint64_t v38 = _os_log_send_and_compose_impl();
                if (v38)
                {
                  v39 = (void *)v38;
                  v40 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v67, v55);
                  free(v39);
                  v54 = (int *)v40;
                  SSFileLog();
                }
              }
              id v41 = v66;
              a3 = v60;
              v6 = &syslog_ptr;
            }
          }
        }
        objc_msgSend(v20, "drain", v54);
        if ((v17 & 1) == 0) {
          break;
        }
        if (v15 == (id)++v18)
        {
          id v15 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
          if (v15) {
            goto LABEL_17;
          }
          break;
        }
      }
    }
    else
    {
      unsigned __int8 v17 = 1;
    }

    BOOL v50 = v17 & 1;
    a4 = v56;
  }
  else
  {
    id v42 = +[SSLogConfig sharedDaemonConfig];
    if (!v42) {
      id v42 = +[SSLogConfig sharedConfig];
    }
    unsigned int v43 = objc_msgSend(v42, "shouldLog", v53);
    if ([v42 shouldLogToDisk]) {
      int v44 = v43 | 2;
    }
    else {
      int v44 = v43;
    }
    if (os_log_type_enabled((os_log_t)[v42 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      int v45 = v44;
    }
    else {
      int v45 = v44 & 2;
    }
    if (v45)
    {
      uint64_t v46 = objc_opt_class();
      v73.st_dev = 138412802;
      *(void *)&v73.st_mode = v46;
      WORD2(v73.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v73.st_ino + 6) = (__darwin_ino64_t)a3;
      HIWORD(v73.st_gid) = 2112;
      *(void *)&v73.st_rdev = v66;
      LODWORD(v55) = 32;
      uint64_t v47 = _os_log_send_and_compose_impl();
      if (v47)
      {
        v48 = (void *)v47;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v47, 4, &v73, v55);
        free(v48);
        SSFileLog();
      }
    }
    id v49 = v66;
    BOOL v50 = 0;
  }

  id v51 = v66;
  if (a4) {
    *a4 = v66;
  }
  return v50;
}

- (void)_copierFinishedFileWithPath:(const char *)a3 size:(int64_t)a4
{
  self->_activeFilePath = 0;
}

- (void)_copierStartedFileWithPath:(const char *)a3 size:(int64_t)a4
{
  self->_activeFileBytesCopied = 0;

  self->_activeFilePath = (NSString *)[objc_alloc((Class)NSString) initWithCString:a3 encoding:4];
}

- (void)_copierUpdatedFileWithPath:(const char *)a3 size:(int64_t)a4
{
  activeFilePath = self->_activeFilePath;
  if (activeFilePath)
  {
    if (!strcmp(a3, [(NSString *)activeFilePath cStringUsingEncoding:4]))
    {
      [(ExtractFileOperation *)self _updateProgressWithByteCount:a4 - self->_activeFileBytesCopied];
      self->_activeFileBytesCopied = a4;
    }
  }
}

- (void)_initializeProgress
{
  [(NSString *)[(ExtractFileOperation *)self sourceFilePath] fileSystemRepresentation];
  if (!BOMCopierCountFilesInArchive())
  {
    uint64_t v3 = OBJC_IVAR___ISOperation__progress;
    [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] setUnits:1];
    [*(id *)&self->ISOperation_opaque[v3] setMaxValue:0];
    [*(id *)&self->ISOperation_opaque[v3] resetSnapshots];
    self->_lastSnapshotTime = -1.79769313e308;
    [(ExtractFileOperation *)self _updateProgressWithByteCount:0];
  }
}

- (id)_newBOMCopierOptions
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [(ExtractFileOperation *)self sourceFileType];
  if (v4 == 1)
  {
    CFStringRef v5 = @"extractCPIO";
    goto LABEL_5;
  }
  if (!v4)
  {
    CFStringRef v5 = @"extractPKZip";
LABEL_5:
    [v3 setObject:kCFBooleanTrue forKey:v5];
  }
  return v3;
}

- (BOOL)_performBOMCopy:(id *)a3
{
  if (!BOMCopierNew())
  {
    id v23 = 0;
    BOOL v15 = 0;
    if (!a3) {
      return v15;
    }
    goto LABEL_28;
  }
  BOMCopierSetUserData();
  BOMCopierSetCopyFileFinishedHandler();
  BOMCopierSetCopyFileStartedHandler();
  BOMCopierSetCopyFileUpdateHandler();
  BOMCopierSetFatalErrorHandler();
  BOMCopierSetFatalFileErrorHandler();
  BOMCopierSetFileConflictErrorHandler();
  BOMCopierSetFileErrorHandler();
  CFStringRef v5 = [(NSString *)[(ExtractFileOperation *)self sourceFilePath] fileSystemRepresentation];
  v6 = [(NSString *)[(ExtractFileOperation *)self destinationFilePath] fileSystemRepresentation];
  id v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v27 = 138412802;
    uint64_t v28 = objc_opt_class();
    __int16 v29 = 2080;
    uint64_t v30 = v5;
    __int16 v31 = 2080;
    v32 = v6;
    LODWORD(v26) = 32;
    int v25 = &v27;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v27, v26);
      free(v11);
      int v25 = (int *)v12;
      SSFileLog();
    }
  }
  id v13 = [(ExtractFileOperation *)self _newBOMCopierOptions];
  int v14 = BOMCopierCopyWithOptions();
  BOOL v15 = v14 == 0;
  if (v14)
  {
    int v16 = v14;
    id v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17) {
      id v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    if (!os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v19 &= 2u;
    }
    if (v19)
    {
      uint64_t v20 = objc_opt_class();
      int v27 = 138412546;
      uint64_t v28 = v20;
      __int16 v29 = 1024;
      LODWORD(v30) = v16;
      LODWORD(v26) = 18;
      uint64_t v21 = _os_log_send_and_compose_impl();
      if (v21)
      {
        v22 = (void *)v21;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v27, v26);
        free(v22);
        SSFileLog();
      }
    }
    id v23 = (void *)ISError();
  }
  else
  {
    id v23 = 0;
  }

  BOMCopierFree();
  if (a3) {
LABEL_28:
  }
    *a3 = v23;
  return v15;
}

- (void)_updateProgressWithByteCount:(int64_t)a3
{
  uint64_t v5 = OBJC_IVAR___ISOperation__progress;
  v6 = (char *)[*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] currentValue];
  id v7 = &v6[a3];
  if ((uint64_t)v7 >= (uint64_t)[*(id *)&self->ISOperation_opaque[v5] maxValue]) {
    id v7 = (char *)[*(id *)&self->ISOperation_opaque[v5] maxValue];
  }
  if (v7 != v6) {
    [*(id *)&self->ISOperation_opaque[v5] setCurrentValue:v7];
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (self->_lastSnapshotTime + kSSOperationDefaultSnapshotInterval < Current)
  {
    [*(id *)&self->ISOperation_opaque[v5] snapshot];
    [(ExtractFileOperation *)self sendProgressToDelegate];
    self->_lastSnapshotTime = Current;
  }
}

- (NSString)destinationFilePath
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDestinationFilePath:(id)a3
{
}

- (NSDictionary)fileAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFileAttributes:(id)a3
{
}

- (NSString)sourceFilePath
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSourceFilePath:(id)a3
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

@end