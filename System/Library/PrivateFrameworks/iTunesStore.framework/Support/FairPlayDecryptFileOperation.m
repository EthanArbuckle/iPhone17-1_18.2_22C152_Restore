@interface FairPlayDecryptFileOperation
- (BOOL)_decryptWithSession:(id)a3 error:(id *)a4;
- (FairPlayDecryptFileOperation)init;
- (FairPlayDecryptFileOperation)initWithPath:(id)a3 dpInfo:(id)a4;
- (void)_initializeProgressWithFileHandle:(id)a3;
- (void)_updateProgressWithByteCount:(int64_t)a3;
- (void)dealloc;
- (void)run;
@end

@implementation FairPlayDecryptFileOperation

- (FairPlayDecryptFileOperation)init
{
  return [(FairPlayDecryptFileOperation *)self initWithPath:0 dpInfo:0];
}

- (FairPlayDecryptFileOperation)initWithPath:(id)a3 dpInfo:(id)a4
{
  if (!a3 || !a4) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"FairPlayDecryptFileOperation.m" lineNumber:38 description:@"Must have a path and DPInfo"];
  }
  v9.receiver = self;
  v9.super_class = (Class)FairPlayDecryptFileOperation;
  v7 = [(FairPlayDecryptFileOperation *)&v9 init];
  if (v7)
  {
    v7->_dpInfo = (NSData *)a4;
    v7->_path = (NSString *)a3;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FairPlayDecryptFileOperation;
  [(FairPlayDecryptFileOperation *)&v3 dealloc];
}

- (void)run
{
  objc_super v3 = [[FairPlayDecryptSession alloc] initWithDPInfo:self->_dpInfo];

  self->_dpInfo = 0;
  if (v3)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v25 = sub_100080FE8;
    v26 = &unk_1003A3380;
    v27 = self;
    v28 = v3;
    HIDWORD(v23) = 0;
    IOReturn v4 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", (CFStringRef)[(FairPlayDecryptSession *)v3 identifier], 0, @"itunesstored FairPlay asset decryption", 0, 900.0, @"TimeoutActionRelease", (IOPMAssertionID *)&v23 + 1);
    id v5 = +[SSLogConfig sharedDaemonConfig];
    id v6 = v5;
    if (v4)
    {
      if (!v5) {
        id v6 = +[SSLogConfig sharedConfig];
      }
      unsigned int v7 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v8 = v7 | 2;
      }
      else {
        int v8 = v7;
      }
      if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_INFO)) {
        v8 &= 2u;
      }
      if (v8)
      {
        uint64_t v9 = objc_opt_class();
        int v29 = 138412546;
        uint64_t v30 = v9;
        __int16 v31 = 1024;
        LODWORD(v32) = v4;
        LODWORD(v23) = 18;
        uint64_t v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          v11 = (void *)v10;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v29, v23);
          free(v11);
          SSFileLog();
        }
      }
      [(FairPlayDecryptFileOperation *)self setError:ISError()];
      [(FairPlayDecryptFileOperation *)self setSuccess:0];
    }
    else
    {
      if (!v5) {
        id v6 = +[SSLogConfig sharedConfig];
      }
      unsigned int v17 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v18 = v17 | 2;
      }
      else {
        int v18 = v17;
      }
      if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_INFO)) {
        v18 &= 2u;
      }
      if (v18)
      {
        uint64_t v19 = objc_opt_class();
        id v20 = [(FairPlayDecryptSession *)v3 identifier];
        int v29 = 138412546;
        uint64_t v30 = v19;
        __int16 v31 = 2112;
        id v32 = v20;
        LODWORD(v23) = 22;
        uint64_t v21 = _os_log_send_and_compose_impl();
        if (v21)
        {
          v22 = (void *)v21;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v29, v23);
          free(v22);
          SSFileLog();
        }
      }
      v25((uint64_t)v24);
      IOPMAssertionRelease(HIDWORD(v23));
    }
  }
  else
  {
    id v12 = +[SSLogConfig sharedDaemonConfig];
    if (!v12) {
      id v12 = +[SSLogConfig sharedConfig];
    }
    unsigned int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v14 &= 2u;
    }
    if (v14)
    {
      int v29 = 138412290;
      uint64_t v30 = objc_opt_class();
      LODWORD(v23) = 12;
      uint64_t v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        v16 = (void *)v15;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v29, v23);
        free(v16);
        SSFileLog();
      }
    }
    [(FairPlayDecryptFileOperation *)self setError:ISError()];
  }
}

- (BOOL)_decryptWithSession:(id)a3 error:(id *)a4
{
  unsigned int v7 = +[NSFileHandle fileHandleForUpdatingAtPath:self->_path];
  if (v7)
  {
    int v8 = v7;
    v26 = a4;
    [(FairPlayDecryptFileOperation *)self _initializeProgressWithFileHandle:v7];
    id v9 = 0;
    while (1)
    {
      objc_msgSend(v9, "drain", v24, v25);
      id v9 = objc_alloc_init((Class)NSAutoreleasePool);
      uint64_t v10 = [(NSFileHandle *)v8 readDataOfLength:0x8000];
      if (![(NSData *)v10 length]) {
        break;
      }
      id v27 = 0;
      id v11 = [a3 decryptBytes:v10 error:&v27];
      if (v11)
      {
        [(NSFileHandle *)v8 seekToFileOffset:(unsigned char *)[(NSFileHandle *)v8 offsetInFile] - (unsigned char *)[(NSData *)v10 length]];
        [(NSFileHandle *)v8 writeData:v11];
        [(FairPlayDecryptFileOperation *)self _updateProgressWithByteCount:[(NSFileHandle *)v8 offsetInFile]];
      }
      else
      {
        id v12 = +[SSLogConfig sharedDaemonConfig];
        if (!v12) {
          id v12 = +[SSLogConfig sharedConfig];
        }
        unsigned int v13 = [v12 shouldLog];
        unsigned int v14 = [v12 shouldLogToDisk];
        uint64_t v15 = [v12 OSLogObject];
        if (v14) {
          v13 |= 2u;
        }
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          v13 &= 2u;
        }
        if (v13)
        {
          uint64_t v16 = objc_opt_class();
          int v28 = 138412546;
          uint64_t v29 = v16;
          __int16 v30 = 2112;
          id v31 = v27;
          LODWORD(v25) = 22;
          v24 = &v28;
          uint64_t v17 = _os_log_send_and_compose_impl();
          if (v17)
          {
            int v18 = (void *)v17;
            uint64_t v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v28, v25);
            free(v18);
            v24 = (int *)v19;
            SSFileLog();
          }
        }
        id v20 = v27;
        if (v20)
        {
          int v21 = 0;
          goto LABEL_20;
        }
      }
    }
    id v20 = 0;
    int v21 = 1;
LABEL_20:
    a4 = v26;
    [(NSFileHandle *)v8 synchronizeFile];
    [(NSFileHandle *)v8 closeFile];
    [v9 drain];
    id v23 = v20;
    BOOL result = v21 != 0;
    if (v26) {
      goto LABEL_21;
    }
  }
  else
  {
    id v20 = (id)ISError();
    BOOL result = 0;
    if (a4) {
LABEL_21:
    }
      *a4 = v20;
  }
  return result;
}

- (void)_initializeProgressWithFileHandle:(id)a3
{
  memset(&v5.st_size, 0, 48);
  if (fstat((int)objc_msgSend(a3, "fileDescriptor", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v5) != -1)
  {
    uint64_t v4 = OBJC_IVAR___ISOperation__progress;
    [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] setUnits:1];
    [*(id *)&self->ISOperation_opaque[v4] setMaxValue:v5.st_size];
    [*(id *)&self->ISOperation_opaque[v4] resetSnapshots];
    self->_lastSnapshotTime = -1.79769313e308;
    [(FairPlayDecryptFileOperation *)self _updateProgressWithByteCount:0];
  }
}

- (void)_updateProgressWithByteCount:(int64_t)a3
{
  id v3 = (id)a3;
  uint64_t v5 = OBJC_IVAR___ISOperation__progress;
  id v6 = *(void **)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress];
  if ((uint64_t)[v6 maxValue] <= a3) {
    id v3 = [*(id *)&self->ISOperation_opaque[v5] maxValue];
  }
  [v6 setCurrentValue:v3];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (self->_lastSnapshotTime + kSSOperationDefaultSnapshotInterval < Current)
  {
    [*(id *)&self->ISOperation_opaque[v5] snapshot];
    [(FairPlayDecryptFileOperation *)self sendProgressToDelegate];
    self->_lastSnapshotTime = Current;
  }
}

@end