@interface WBSFileLogger
+ (BOOL)collectLogsInDirectory:(id)a3 withName:(id)a4 intoFile:(id)a5 error:(id *)a6;
- (WBSFileLogger)initWithDirectoryURL:(id)a3 logName:(id)a4 maximumLogAge:(unint64_t)a5;
- (void)_closeStream;
- (void)_logMessage:(id)a3 date:(id)a4;
- (void)_removeOldLogs;
- (void)dealloc;
- (void)logFormat:(id)a3;
- (void)logMessage:(id)a3;
- (void)tearDown;
@end

@implementation WBSFileLogger

- (void)_removeOldLogs
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  unint64_t v4 = -self->_maximumLogAgeInDays;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v24 = [v3 dateByAddingUnit:16 value:v4 toDate:v5 options:0];

  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v25 = v3;
  [v7 setCalendar:v3];
  v29 = v7;
  [v7 setDateFormat:@"_yyyy-MM-dd"];
  NSUInteger v8 = [(NSString *)self->_logName length];
  uint64_t v9 = [@"_yyyy-MM-dd" length];
  uint64_t v10 = [@".log" length];
  NSUInteger v28 = [(NSString *)self->_logName length];
  uint64_t v27 = [@"_yyyy-MM-dd" length];
  v23 = v6;
  v11 = [v6 contentsOfDirectoryAtURL:self->_directoryURL includingPropertiesForKeys:0 options:0 error:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    NSUInteger v14 = v9 + v10 + v8;
    uint64_t v15 = *(void *)v31;
    v16 = @".log";
    v26 = v11;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v11);
        }
        v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v19 = [v18 lastPathComponent];
        if ([v19 length] == v14
          && [v19 hasPrefix:self->_logName]
          && [v19 hasSuffix:v16])
        {
          v20 = v16;
          v21 = objc_msgSend(v19, "substringWithRange:", v28, v27);
          v22 = [v29 dateFromString:v21];
          if (v22 && [v25 compareDate:v22 toDate:v24 toUnitGranularity:16] == -1) {
            [v23 removeItemAtURL:v18 error:0];
          }

          v16 = v20;
          v11 = v26;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v13);
  }
}

uint64_t __60__WBSFileLogger_initWithDirectoryURL_logName_maximumLogAge___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 createDirectoryAtURL:*(void *)(*(void *)(a1 + 32) + 8) withIntermediateDirectories:1 attributes:0 error:0];

  v3 = *(void **)(a1 + 32);
  return [v3 _removeOldLogs];
}

- (WBSFileLogger)initWithDirectoryURL:(id)a3 logName:(id)a4 maximumLogAge:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)WBSFileLogger;
  v11 = [(WBSFileLogger *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    logName = v11->_logName;
    v11->_logName = (NSString *)v12;

    v11->_maximumLogAgeInDays = a5;
    objc_storeStrong((id *)&v11->_directoryURL, a3);
    NSUInteger v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.SafariShared.Logger", v14);
    logQueue = v11->_logQueue;
    v11->_logQueue = (OS_dispatch_queue *)v15;

    v17 = v11->_logQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__WBSFileLogger_initWithDirectoryURL_logName_maximumLogAge___block_invoke;
    block[3] = &unk_1E615A768;
    v18 = v11;
    v22 = v18;
    dispatch_async(v17, block);
    v19 = v18;
  }
  return v11;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_closeStreamTimer);
  [WeakRetained invalidate];

  outputStream = self->_outputStream;
  if (outputStream)
  {
    v5 = outputStream;
    logQueue = self->_logQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__WBSFileLogger_dealloc__block_invoke;
    block[3] = &unk_1E615A768;
    id v10 = v5;
    id v7 = v5;
    dispatch_async(logQueue, block);
  }
  v8.receiver = self;
  v8.super_class = (Class)WBSFileLogger;
  [(WBSFileLogger *)&v8 dealloc];
}

uint64_t __24__WBSFileLogger_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

- (void)tearDown
{
  if (self->_outputStream)
  {
    logQueue = self->_logQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__WBSFileLogger_tearDown__block_invoke;
    block[3] = &unk_1E615A768;
    void block[4] = self;
    dispatch_sync(logQueue, block);
  }
}

uint64_t __25__WBSFileLogger_tearDown__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) close];
}

- (void)logFormat:(id)a3
{
  unint64_t v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(WBSFileLogger *)self logMessage:v6];
}

- (void)logMessage:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 date];
  uint64_t v7 = (void *)[v5 copy];

  logQueue = self->_logQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__WBSFileLogger_logMessage___block_invoke;
  block[3] = &unk_1E615B188;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(logQueue, block);
}

uint64_t __28__WBSFileLogger_logMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logMessage:*(void *)(a1 + 40) date:*(void *)(a1 + 48)];
}

- (void)_logMessage:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_super v8 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v9 = v8;
  if (!self->_logStartDate || (objc_msgSend(v8, "isDate:inSameDayAsDate:", v7) & 1) == 0)
  {
    [(WBSFileLogger *)self _closeStream];
    [(WBSFileLogger *)self _removeOldLogs];
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    logStartDate = self->_logStartDate;
    self->_logStartDate = v10;
  }
  if (!self->_outputStream)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v12 setCalendar:v9];
    [v12 setDateFormat:@"_yyyy-MM-dd"];
    id v13 = NSString;
    logName = self->_logName;
    dispatch_queue_t v15 = [v12 stringFromDate:v7];
    v16 = [v13 stringWithFormat:@"%@%@%@", logName, v15, @".log"];

    v17 = (void *)MEMORY[0x1E4F1CAA8];
    v18 = [(NSURL *)self->_directoryURL URLByAppendingPathComponent:v16 isDirectory:0];
    v19 = [v17 outputStreamWithURL:v18 append:1];
    outputStream = self->_outputStream;
    self->_outputStream = v19;

    [(NSOutputStream *)self->_outputStream open];
  }
  v21 = [NSString stringWithFormat:@"%@: %@\n", v7, v6];
  v22 = [v21 dataUsingEncoding:4];
  objc_super v23 = self->_outputStream;
  id v24 = v22;
  -[NSOutputStream write:maxLength:](v23, "write:maxLength:", [v24 bytes], objc_msgSend(v24, "length"));
  p_closeStreamTimer = &self->_closeStreamTimer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_closeStreamTimer);
  [WeakRetained invalidate];

  uint64_t v27 = (void *)MEMORY[0x1E4F1CB00];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __34__WBSFileLogger__logMessage_date___block_invoke;
  v30[3] = &unk_1E615B1B0;
  objc_copyWeak(&v31, &location);
  NSUInteger v28 = [v27 timerWithTimeInterval:0 repeats:v30 block:5.0];
  objc_storeWeak((id *)p_closeStreamTimer, v28);
  v29 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v29 addTimer:v28 forMode:*MEMORY[0x1E4F1C4B0]];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __34__WBSFileLogger__logMessage_date___block_invoke(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__WBSFileLogger__logMessage_date___block_invoke_2;
    block[3] = &unk_1E615A768;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __34__WBSFileLogger__logMessage_date___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeStream];
}

- (void)_closeStream
{
  p_closeStreamTimer = &self->_closeStreamTimer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_closeStreamTimer);
  [WeakRetained invalidate];

  objc_storeWeak((id *)p_closeStreamTimer, 0);
  [(NSOutputStream *)self->_outputStream close];
  outputStream = self->_outputStream;
  self->_outputStream = 0;
}

+ (BOOL)collectLogsInDirectory:(id)a3 withName:(id)a4 intoFile:(id)a5 error:(id *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = [v12 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:0 options:0 error:a6];
  if (v13)
  {
    uint64_t v14 = [v10 length];
    uint64_t v15 = [@"_yyyy-MM-dd" length] + v14;
    uint64_t v16 = [@".log" length];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __64__WBSFileLogger_collectLogsInDirectory_withName_intoFile_error___block_invoke;
    v34[3] = &unk_1E615B1D8;
    uint64_t v36 = v15 + v16;
    id v35 = v10;
    objc_msgSend(v13, "safari_filterObjectsUsingBlock:", v34);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 count];
    BOOL v19 = v18 != 0;
    if (v18)
    {
      NSUInteger v28 = v12;
      id v29 = v9;
      v20 = [v17 sortedArrayUsingComparator:&__block_literal_global_15];

      v21 = [MEMORY[0x1E4F1CAA8] outputStreamWithURL:v11 append:1];
      [v21 open];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v17 = v20;
      uint64_t v22 = [v17 countByEnumeratingWithState:&v30 objects:v37 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(v17);
            }
            id v26 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(*((void *)&v30 + 1) + 8 * i)];
            objc_msgSend(v21, "write:maxLength:", objc_msgSend(v26, "bytes"), objc_msgSend(v26, "length"));
          }
          uint64_t v23 = [v17 countByEnumeratingWithState:&v30 objects:v37 count:16];
        }
        while (v23);
      }

      [v21 close];
      id v9 = v29;
      id v12 = v28;
    }
    else if (a6)
    {
      *a6 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

uint64_t __64__WBSFileLogger_collectLogsInDirectory_withName_intoFile_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 lastPathComponent];
  if ([v3 length] == *(void *)(a1 + 40)
    && [v3 hasPrefix:*(void *)(a1 + 32)])
  {
    uint64_t v4 = [v3 hasSuffix:@".log"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __64__WBSFileLogger_collectLogsInDirectory_withName_intoFile_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 lastPathComponent];
  id v6 = [v4 lastPathComponent];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logName, 0);
  objc_destroyWeak((id *)&self->_closeStreamTimer);
  objc_storeStrong((id *)&self->_logStartDate, 0);
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end