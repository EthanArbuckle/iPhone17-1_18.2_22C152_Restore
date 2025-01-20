@interface SUCoreSplunkHistory
+ (id)sharedHistory;
+ (void)logEventUUID:(id)a3;
- (NSString)lastUUID;
- (OS_dispatch_queue)splunkHistoryQueue;
- (SUCoreSplunkHistory)init;
- (int)lockFD;
- (int)setupLogFile;
- (void)acquireSharedLock;
- (void)dealloc;
- (void)init;
- (void)releaseSharedLock;
- (void)safeWriteEventUUID:(id)a3;
- (void)setLastUUID:(id)a3;
- (void)setLockFD:(int)a3;
@end

@implementation SUCoreSplunkHistory

- (SUCoreSplunkHistory)init
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)SUCoreSplunkHistory;
  v2 = [(SUCoreSplunkHistory *)&v40 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_15;
  }
  v2->_lockFD = -1;
  lastUUID = v2->_lastUUID;
  v2->_lastUUID = 0;

  id v5 = [NSString alloc];
  v6 = +[SUCore sharedCore];
  v7 = [v6 commonDomain];
  id v8 = (id) [v5 initWithFormat:@"%@.%@", v7, @"core.splunk.history"];
  v9 = (const char *)[v8 UTF8String];
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
  splunkHistoryQueue = v3->_splunkHistoryQueue;
  v3->_splunkHistoryQueue = (OS_dispatch_queue *)v11;

  if (!v3->_splunkHistoryQueue)
  {
    id v20 = +[SUCoreDiag sharedDiag];
    id v25 = [NSString alloc];
    v26 = +[SUCore sharedCore];
    v27 = [v26 commonDomain];
    v28 = (void *)[v25 initWithFormat:@"unable to create dispatch queue domain(%@.%@)", v27, @"core.splunk.history"];
    [v20 trackError:@"[SPLUNK_HISTORY] INIT" forReason:v28 withResult:8100 withError:0];

LABEL_22:
    v31 = 0;
    goto LABEL_23;
  }
  v13 = +[SUCoreLog sharedLogger];
  v14 = [v13 oslog];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = +[SUCore sharedCore];
    v16 = [v15 commonDomain];
    *(_DWORD *)buf = 138543618;
    v44 = v16;
    __int16 v45 = 2114;
    v46 = @"core.splunk.history";
    _os_log_impl(&dword_1B4EC2000, v14, OS_LOG_TYPE_DEFAULT, "[SPLUNK_HISTORY] DISPATCH | created dispatch queue domain(%{public}@.%{public}@)", buf, 0x16u);
  }
  v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v18 = [v17 fileExistsAtPath:@"/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/"];

  if ((v18 & 1) == 0)
  {
    uint64_t v19 = *MEMORY[0x1E4F282E0];
    v41[0] = *MEMORY[0x1E4F28320];
    v41[1] = v19;
    v42[0] = @"mobile";
    v42[1] = @"mobile";
    v41[2] = *MEMORY[0x1E4F28370];
    v42[2] = *MEMORY[0x1E4F28378];
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];
    v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v39 = 0;
    [v21 createDirectoryAtPath:@"/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/" withIntermediateDirectories:1 attributes:v20 error:&v39];
    v22 = v39;

    if (v22)
    {
      v23 = +[SUCoreLog sharedLogger];
      v24 = [v23 oslog];

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        [(SUCoreSplunkHistory *)(uint64_t)v22 init];
      }

      goto LABEL_21;
    }
  }
  id v20 = [@"/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/" stringByAppendingPathComponent:@"SUCoreSplunkHistory.lock"];
  v29 = (const char *)[v20 cStringUsingEncoding:4];
  if (!v29)
  {
    v32 = +[SUCoreLog sharedLogger];
    v22 = [v32 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v33 = "[SPLUNK_HISTORY] INIT | failed creating file lock";
      v34 = v22;
      uint32_t v35 = 2;
LABEL_20:
      _os_log_impl(&dword_1B4EC2000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
    }
LABEL_21:

    goto LABEL_22;
  }
  int v30 = open(v29, 521, 420);
  v3->_lockFD = v30;
  if (v30 == -1)
  {
    v36 = +[SUCoreLog sharedLogger];
    v22 = [v36 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v37;
      v33 = "[SPLUNK_HISTORY] INIT | failed opening lock file, errno:%d";
      v34 = v22;
      uint32_t v35 = 8;
      goto LABEL_20;
    }
    goto LABEL_21;
  }

LABEL_15:
  v31 = v3;
LABEL_23:

  return v31;
}

- (void)dealloc
{
  [(SUCoreSplunkHistory *)self releaseSharedLock];
  int lockFD = self->_lockFD;
  if (lockFD != -1)
  {
    close(lockFD);
    self->_int lockFD = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUCoreSplunkHistory;
  [(SUCoreSplunkHistory *)&v4 dealloc];
}

+ (id)sharedHistory
{
  if (sharedHistory_reporterOnce != -1) {
    dispatch_once(&sharedHistory_reporterOnce, &__block_literal_global_1);
  }
  v2 = (void *)sharedHistory_logger;
  return v2;
}

uint64_t __36__SUCoreSplunkHistory_sharedHistory__block_invoke()
{
  sharedHistory_logger = objc_alloc_init(SUCoreSplunkHistory);
  return MEMORY[0x1F41817F8]();
}

+ (void)logEventUUID:(id)a3
{
  id v3 = a3;
  id v4 = +[SUCoreSplunkHistory sharedHistory];
  [v4 safeWriteEventUUID:v3];
}

- (void)acquireSharedLock
{
}

- (void)releaseSharedLock
{
}

- (int)setupLogFile
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = [@"/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/" stringByAppendingPathComponent:@"SUCoreSplunkHistory.log"];
  id v3 = (const char *)[v2 cStringUsingEncoding:4];
  if (!v3)
  {
    v10 = +[SUCoreLog sharedLogger];
    dispatch_queue_t v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "[SPLUNK_HISTORY] SETUP | failed creating file name";
      v13 = v11;
      uint32_t v14 = 2;
LABEL_10:
      _os_log_impl(&dword_1B4EC2000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
LABEL_11:

LABEL_22:
    int v6 = -1;
    goto LABEL_23;
  }
  id v4 = (const std::__fs::filesystem::path *)v3;
  int v5 = open(v3, 521, 420);
  if (v5 == -1)
  {
    v15 = +[SUCoreLog sharedLogger];
    dispatch_queue_t v11 = [v15 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = *__error();
      *(_DWORD *)buf = 67109120;
      int v35 = v16;
      v12 = "[SPLUNK_HISTORY] SETUP | failed opening log file, errno:%d";
      v13 = v11;
      uint32_t v14 = 8;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  int v6 = v5;
  memset(&v33, 0, sizeof(v33));
  if (fstat(v5, &v33))
  {
    v7 = +[SUCoreLog sharedLogger];
    id v8 = [v7 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *__error();
      *(_DWORD *)buf = 67109120;
      int v35 = v9;
      _os_log_impl(&dword_1B4EC2000, v8, OS_LOG_TYPE_DEFAULT, "[SPLUNK_HISTORY] SETUP | failed to get file stats, errno:%d", buf, 8u);
    }
    goto LABEL_21;
  }
  if (v33.st_size >= 0x40000)
  {
    id v8 = [NSString stringWithFormat:@"%@%@", v2, @".1"];
    uint64_t v17 = [v8 cStringUsingEncoding:4];
    if (v17)
    {
      char v18 = (const std::__fs::filesystem::path *)v17;
      close(v6);
      rename(v4, v18, v19);
      if (!v20)
      {
        int v29 = open((const char *)v4, 521, 420);
        if (v29 != -1)
        {
          int v6 = v29;

          goto LABEL_23;
        }
        int v30 = +[SUCoreLog sharedLogger];
        v31 = [v30 oslog];

        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          int v32 = *__error();
          *(_DWORD *)buf = 67109120;
          int v35 = v32;
          _os_log_impl(&dword_1B4EC2000, v31, OS_LOG_TYPE_DEFAULT, "[SPLUNK_HISTORY] SETUP | failed opening new log file, errno:%d", buf, 8u);
        }

        goto LABEL_22;
      }
      v21 = +[SUCoreLog sharedLogger];
      v22 = [v21 oslog];

      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v23 = *__error();
      *(_DWORD *)buf = 67109120;
      int v35 = v23;
      v24 = "[SPLUNK_HISTORY] SETUP | failed moving old file, errno:%d";
      id v25 = v22;
      uint32_t v26 = 8;
    }
    else
    {
      v27 = +[SUCoreLog sharedLogger];
      v22 = [v27 oslog];

      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

LABEL_21:
        close(v6);
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      v24 = "[SPLUNK_HISTORY] SETUP | failed creating file name";
      id v25 = v22;
      uint32_t v26 = 2;
    }
    _os_log_impl(&dword_1B4EC2000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    goto LABEL_20;
  }
LABEL_23:

  return v6;
}

- (void)safeWriteEventUUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
  int v6 = (void *)v5;
  if (!v4 || !v5)
  {
    v7 = +[SUCoreLog sharedLogger];
    id v8 = [v7 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_1B4EC2000, v8, OS_LOG_TYPE_DEFAULT, "[SPLUNK_HISTORY] WRITE | wrong format for event UUID %@", buf, 0xCu);
    }
  }
  int v9 = [(SUCoreSplunkHistory *)self splunkHistoryQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__SUCoreSplunkHistory_safeWriteEventUUID___block_invoke;
  v11[3] = &unk_1E60B62D8;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __42__SUCoreSplunkHistory_safeWriteEventUUID___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) lastUUID];
  char v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    [*(id *)(a1 + 32) acquireSharedLock];
    int v4 = [*(id *)(a1 + 32) setupLogFile];
    if (v4 == -1)
    {
LABEL_15:
      [*(id *)(a1 + 32) releaseSharedLock];
      return;
    }
    int v5 = v4;
    id v6 = [NSString stringWithFormat:@"%@\n", *(void *)(a1 + 40)];
    v7 = (const char *)[v6 cStringUsingEncoding:4];
    size_t v8 = strlen(v7);
    ssize_t v9 = write(v5, v7, v8);
    if (v9 < 0)
    {
      id v10 = +[SUCoreLog sharedLogger];
      dispatch_queue_t v11 = [v10 oslog];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = *__error();
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v12;
        __int16 v24 = 1024;
        int v25 = v13;
        id v14 = "[SPLUNK_HISTORY] WRITE | failed writing event UUID %@, errno:%d";
        uint64_t v15 = v11;
        uint32_t v16 = 18;
LABEL_10:
        _os_log_impl(&dword_1B4EC2000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else
    {
      if (v9 == v8)
      {
        [*(id *)(a1 + 32) setLastUUID:*(void *)(a1 + 40)];
LABEL_12:
        uint64_t v19 = +[SUCoreLog sharedLogger];
        int v20 = [v19 oslog];

        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v23 = v21;
          _os_log_impl(&dword_1B4EC2000, v20, OS_LOG_TYPE_DEFAULT, "[SPLUNK_HISTORY] WRITE | Wrote UUID %@", buf, 0xCu);
        }

        close(v5);
        goto LABEL_15;
      }
      uint64_t v17 = +[SUCoreLog sharedLogger];
      dispatch_queue_t v11 = [v17 oslog];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v18;
        id v14 = "[SPLUNK_HISTORY] WRITE | failed writing complete event UUID %@";
        uint64_t v15 = v11;
        uint32_t v16 = 12;
        goto LABEL_10;
      }
    }

    goto LABEL_12;
  }
}

- (OS_dispatch_queue)splunkHistoryQueue
{
  return self->_splunkHistoryQueue;
}

- (NSString)lastUUID
{
  return self->_lastUUID;
}

- (void)setLastUUID:(id)a3
{
}

- (int)lockFD
{
  return self->_lockFD;
}

- (void)setLockFD:(int)a3
{
  self->_int lockFD = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUUID, 0);
  objc_storeStrong((id *)&self->_splunkHistoryQueue, 0);
}

- (void)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  char v3 = @"/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1B4EC2000, a2, OS_LOG_TYPE_ERROR, "[SPLUNK_HISTORY] INIT | failed to create history directory at path: %@, error: %@", (uint8_t *)&v2, 0x16u);
}

@end