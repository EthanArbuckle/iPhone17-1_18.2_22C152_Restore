@interface SSRollableLog
- (SSLogFileOptions)logOptions;
- (SSRollableLog)initWithLogOptions:(id)a3;
- (id)_activeLogFilePath;
- (id)_logFilePathWithIndex:(int64_t)a3;
- (void)_checkLogFileSize;
- (void)_closeLogFile;
- (void)_openLogFile;
- (void)_rollLogFiles;
- (void)dealloc;
- (void)writeString:(id)a3;
@end

@implementation SSRollableLog

- (SSRollableLog)initWithLogOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSRollableLog;
  v4 = [(SSRollableLog *)&v6 init];
  if (v4)
  {
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSRollableLog", 0);
    v4->_lastFileStatTime = -1.79769313e308;
    v4->_options = (SSLogFileOptions *)[a3 copy];
    [(SSRollableLog *)v4 _openLogFile];
  }
  return v4;
}

- (void)dealloc
{
  fileObserverSource = self->_fileObserverSource;
  if (fileObserverSource)
  {
    dispatch_source_cancel(fileObserverSource);
    dispatch_release((dispatch_object_t)self->_fileObserverSource);
  }
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v4.receiver = self;
  v4.super_class = (Class)SSRollableLog;
  [(SSRollableLog *)&v4 dealloc];
}

- (SSLogFileOptions)logOptions
{
  v2 = (void *)[(SSLogFileOptions *)self->_options copy];
  return (SSLogFileOptions *)v2;
}

- (void)writeString:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__SSRollableLog_writeString___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __29__SSRollableLog_writeString___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[3])
  {
    [v2 _openLogFile];
    v2 = *(void **)(a1 + 32);
  }
  [v2 _checkLogFileSize];
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "writeData:", objc_msgSend(*(id *)(a1 + 40), "dataUsingEncoding:", 4));
}

- (id)_activeLogFilePath
{
  return [(SSRollableLog *)self _logFilePathWithIndex:0];
}

- (void)_checkLogFileSize
{
  unint64_t v3 = [(SSLogFileOptions *)self->_options maxLogFileSize];
  if (v3)
  {
    unint64_t v4 = v3;
    if ([(SSLogFileOptions *)self->_options maxNumberOfLogFiles] >= 2
      && CFAbsoluteTimeGetCurrent() - self->_lastFileStatTime >= 60.0)
    {
      memset(&v5.st_size, 0, 48);
      if (!stat((const char *)objc_msgSend(-[SSRollableLog _activeLogFilePath](self, "_activeLogFilePath", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), "fileSystemRepresentation"), &v5)&& v5.st_size >= v4)
      {
        [(SSRollableLog *)self _rollLogFiles];
      }
    }
  }
}

- (void)_closeLogFile
{
  fileObserverSource = self->_fileObserverSource;
  if (fileObserverSource)
  {
    dispatch_source_cancel(fileObserverSource);
    dispatch_release((dispatch_object_t)self->_fileObserverSource);
    self->_fileObserverSource = 0;
  }

  self->_fileHandle = 0;
}

- (id)_logFilePathWithIndex:(int64_t)a3
{
  stat v5 = [(SSLogFileOptions *)self->_options logFileBaseName];
  objc_super v6 = [(NSString *)v5 pathExtension];
  if ([(__CFString *)v6 length])
  {
    if (a3 < 1) {
      goto LABEL_8;
    }
    v7 = [(NSString *)v5 stringByDeletingPathExtension];
    v8 = -[NSString stringByAppendingPathExtension:](v7, "stringByAppendingPathExtension:", objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3));
    v9 = v6;
  }
  else
  {
    if (a3 >= 1) {
      stat v5 = -[NSString stringByAppendingPathExtension:](v5, "stringByAppendingPathExtension:", objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3));
    }
    v9 = @"log";
    v8 = v5;
  }
  stat v5 = [(NSString *)v8 stringByAppendingPathExtension:v9];
LABEL_8:
  v10 = [(SSLogFileOptions *)self->_options logDirectoryPath];
  return [(NSString *)v10 stringByAppendingPathComponent:v5];
}

- (void)_openLogFile
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v30 = 0;
  char v4 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", -[SSLogFileOptions logDirectoryPath](self->_options, "logDirectoryPath"), 1, 0, &v30);

  if ((v4 & 1) == 0)
  {
    stat v5 = objc_alloc_init(SSMutableLogConfig);
    [(SSLogConfig *)v5 setSubsystem:@"SSRollableLog"];
    [(SSLogConfig *)v5 setSubsystem:@"com.apple.StoreServices"];
    objc_super v6 = v5;
    if (!v5) {
      objc_super v6 = +[SSLogConfig sharedConfig];
    }
    int v7 = [(SSLogConfig *)v6 shouldLog];
    if ([(SSLogConfig *)v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    if (!os_log_type_enabled((os_log_t)[(SSLogConfig *)v6 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      v9 = [(SSLogFileOptions *)self->_options logDirectoryPath];
      int v31 = 138412546;
      v32 = v9;
      __int16 v33 = 2112;
      uint64_t v34 = v30;
      LODWORD(v26) = 22;
      v25 = &v31;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v31, v26);
        free(v11);
        SSFileLog(v6, @"%@", v13, v14, v15, v16, v17, v18, v12);
      }
    }
  }
  uint64_t v19 = open((const char *)objc_msgSend(-[SSRollableLog _activeLogFilePath](self, "_activeLogFilePath", v25), "fileSystemRepresentation"), 522, 384);
  if ((v19 & 0x80000000) == 0)
  {
    int v20 = v19;
    v21 = (NSFileHandle *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v19 closeOnDealloc:1];
    self->_fileHandle = v21;
    [(NSFileHandle *)v21 seekToEndOfFile];
    int v22 = dup(v20);
    v23 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144A8], v22, 0x61uLL, (dispatch_queue_t)self->_dispatchQueue);
    self->_fileObserverSource = v23;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __29__SSRollableLog__openLogFile__block_invoke;
    handler[3] = &unk_1E5BA73F8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v23, handler);
    fileObserverSource = self->_fileObserverSource;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __29__SSRollableLog__openLogFile__block_invoke_2;
    v27[3] = &__block_descriptor_36_e5_v8__0l;
    int v28 = v22;
    dispatch_source_set_cancel_handler(fileObserverSource, v27);
    dispatch_resume((dispatch_object_t)self->_fileObserverSource);
  }
}

uint64_t __29__SSRollableLog__openLogFile__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _closeLogFile];
  v2 = *(void **)(a1 + 32);
  return [v2 _openLogFile];
}

uint64_t __29__SSRollableLog__openLogFile__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_rollLogFiles
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  [(SSRollableLog *)self _closeLogFile];
  uint64_t v3 = [(SSLogFileOptions *)self->_options maxNumberOfLogFiles];
  objc_msgSend(v6, "removeItemAtPath:error:", -[SSRollableLog _logFilePathWithIndex:](self, "_logFilePathWithIndex:", v3 - 1), 0);
  uint64_t v4 = v3 - 2;
  if (v3 >= 2)
  {
    do
    {
      uint64_t v5 = v4;
      objc_msgSend(v6, "moveItemAtPath:toPath:error:", -[SSRollableLog _logFilePathWithIndex:](self, "_logFilePathWithIndex:", v4), -[SSRollableLog _logFilePathWithIndex:](self, "_logFilePathWithIndex:", v4 + 1), 0);
      uint64_t v4 = v5 - 1;
    }
    while (v5);
  }
  [(SSRollableLog *)self _openLogFile];
}

@end