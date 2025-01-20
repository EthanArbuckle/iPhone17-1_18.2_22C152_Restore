@interface IMLogger
+ (id)rolledLogPrefix;
+ (id)sharedLogger;
+ (void)deleteRolledLogsForLogPath:(id)a3 maxAge:(double)a4;
+ (void)rollLogPath:(id)a3 maxSize:(unint64_t)a4;
- (BOOL)logTofileOnly;
- (BOOL)shouldOverrideCondition:(id)a3 file:(id)a4;
- (IMLogger)init;
- (NSString)filter;
- (NSString)runtimeOverride;
- (id)auxPath;
- (void)addRuntimeOverride:(id)a3;
- (void)logFile:(const char *)a3 lineNumber:(int)a4 format:(id)a5;
- (void)logFunction:(const char *)a3 format:(id)a4;
- (void)logString:(id)a3;
- (void)removeRuntimeOverride:(id)a3;
- (void)setAuxPath:(id)a3;
- (void)setFilter:(id)a3;
- (void)setLogToFileOnly:(BOOL)a3;
- (void)setRuntimeOverride:(id)a3;
@end

@implementation IMLogger

- (BOOL)shouldOverrideCondition:(id)a3 file:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(IMLogger *)self runtimeOverride];
  uint64_t v9 = [v8 length];

  if (!v9) {
    goto LABEL_4;
  }
  v10 = [v7 lastPathComponent];
  v11 = [v10 stringByDeletingPathExtension];

  v12 = [(IMLogger *)self runtimeOverride];
  if ([v12 rangeOfString:v6 options:1] != 0x7FFFFFFFFFFFFFFFLL)
  {

    goto LABEL_8;
  }
  v13 = [(IMLogger *)self runtimeOverride];
  BOOL v14 = 1;
  uint64_t v15 = [v13 rangeOfString:v11 options:1];

  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    if (!self->_runtimeOverrideRegex)
    {
      BOOL v14 = 0;
      goto LABEL_11;
    }
    v16 = [v7 lastPathComponent];
    v11 = [v16 stringByDeletingPathExtension];

    if (-[NSRegularExpression rangeOfFirstMatchInString:options:range:](self->_runtimeOverrideRegex, "rangeOfFirstMatchInString:options:range:", v11, 0, 0, [v11 length]) == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v14 = -[NSRegularExpression rangeOfFirstMatchInString:options:range:](self->_runtimeOverrideRegex, "rangeOfFirstMatchInString:options:range:", v6, 0, 0, [v6 length]) != 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:

      goto LABEL_11;
    }
LABEL_8:
    BOOL v14 = 1;
    goto LABEL_9;
  }
LABEL_11:

  return v14;
}

- (NSString)runtimeOverride
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)logFile:(const char *)a3 lineNumber:(int)a4 format:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", a3);
  v10 = [v9 lastPathComponent];

  if (v8)
  {
    v11 = (void *)[[NSString alloc] initWithFormat:v8 arguments:&v14];
    v12 = [NSString stringWithFormat:@"[%@:%d] %@", v10, v5, v11];
    [(IMLogger *)self logString:v12];
  }
  else
  {
    v13 = [NSString stringWithFormat:@"[%@:%d] <nil>", v10, v5];
    [(IMLogger *)self logString:v13];
  }
}

- (void)logString:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_filter || objc_msgSend(v4, "rangeOfString:") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_fileHandle && self->_logTofileOnly) {
      goto LABEL_10;
    }
    if (IMInitializeLogCategories_onceToken != -1) {
      dispatch_once(&IMInitializeLogCategories_onceToken, &__block_literal_global);
    }
    id v6 = (void *)IMLogCategoryDefault;
    if (os_log_type_enabled((os_log_t)IMLogCategoryDefault, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = pthread_self();
      *(_DWORD *)buf = 67109378;
      mach_port_t v18 = pthread_mach_thread_np(v8);
      __int16 v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1AC9D5000, v7, OS_LOG_TYPE_DEFAULT, "(%x) %@\n", buf, 0x12u);
    }
    if (self->_fileHandle)
    {
LABEL_10:
      id v9 = [NSString alloc];
      v10 = IMTimeStamp();
      procName = self->_procName;
      uint64_t pid = self->_pid;
      v13 = pthread_self();
      uint64_t v14 = (void *)[v9 initWithFormat:@"%@ %@[%d:%x] %@\n", v10, procName, pid, pthread_mach_thread_np(v13), v5];

      fileHandle = self->_fileHandle;
      v16 = [v14 dataUsingEncoding:4];
      [(NSFileHandle *)fileHandle writeData:v16];
    }
  }
}

+ (id)sharedLogger
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__IMLogger_sharedLogger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLogger_onceToken[0] != -1) {
    dispatch_once(sharedLogger_onceToken, block);
  }
  v2 = (void *)sharedLogger__sharedLogger;
  return v2;
}

- (IMLogger)init
{
  v21.receiver = self;
  v21.super_class = (Class)IMLogger;
  v2 = [(IMLogger *)&v21 init];
  if (v2)
  {
    v2->_uint64_t pid = getpid();
    v3 = [MEMORY[0x1E4F28B50] mainBundle];
    id v4 = [v3 infoDictionary];
    uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F1D008]];
    procName = v2->_procName;
    v2->_procName = (NSString *)v5;

    id v7 = [MEMORY[0x1E4F28F80] processInfo];
    id v8 = [v7 environment];

    id v9 = [v8 objectForKey:@"IMLogFilter"];

    if (v9)
    {
      v10 = [v8 objectForKey:@"IMLogFilter"];
      [(IMLogger *)v2 setFilter:v10];
    }
    v11 = [v8 objectForKey:@"IMLogRuntimeOverride"];

    if (v11)
    {
      v12 = [v8 objectForKey:@"IMLogRuntimeOverride"];
      [(IMLogger *)v2 setRuntimeOverride:v12];
    }
    v13 = [v8 objectForKey:@"IMLogRuntimeOverridePattern"];

    if (v13)
    {
      uint64_t v14 = [v8 objectForKey:@"IMLogRuntimeOverridePattern"];
      id v20 = 0;
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v14 options:0 error:&v20];
      id v16 = v20;
      runtimeOverrideRegex = v2->_runtimeOverrideRegex;
      v2->_runtimeOverrideRegex = (NSRegularExpression *)v15;

      if (!v2->_runtimeOverrideRegex) {
        [(IMLogger *)v2 logFile:"/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Logging/IMLogger.m", 75, @"Invalid RegexPattern: %@ -- Error: %@", v14, v16 lineNumber format];
      }
    }
    mach_port_t v18 = v2;
  }
  return v2;
}

uint64_t __24__IMLogger_sharedLogger__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedLogger__sharedLogger;
  sharedLogger__sharedLogger = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)setAuxPath:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_auxPath, a3);
  [(NSFileHandle *)self->_fileHandle closeFile];
  fileHandle = self->_fileHandle;
  self->_fileHandle = 0;

  id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if (([v6 fileExistsAtPath:self->_auxPath] & 1) == 0) {
    [v6 createFileAtPath:self->_auxPath contents:0 attributes:0];
  }
  id v7 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:self->_auxPath];
  id v8 = self->_fileHandle;
  self->_fileHandle = v7;

  [(NSFileHandle *)self->_fileHandle seekToEndOfFile];
}

- (id)auxPath
{
  return self->_auxPath;
}

- (void)setLogToFileOnly:(BOOL)a3
{
  self->_logTofileOnly = a3;
}

- (BOOL)logTofileOnly
{
  return self->_logTofileOnly;
}

- (void)logFunction:(const char *)a3 format:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:v6 arguments:&v10];
    id v8 = [NSString stringWithFormat:@"%s %@", a3, v7];
    [(IMLogger *)self logString:v8];
  }
  else
  {
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s <nil>", a3);
    [(IMLogger *)self logString:v9];
  }
}

- (void)addRuntimeOverride:(id)a3
{
  id v7 = a3;
  id v4 = [(IMLogger *)self runtimeOverride];
  if ([v4 length])
  {
    uint64_t v5 = [(IMLogger *)self runtimeOverride];
  }
  else
  {
    uint64_t v5 = &stru_1F03A51F0;
  }

  if ([(__CFString *)v5 rangeOfString:v7] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(__CFString *)v5 stringByAppendingString:v7];
    [(IMLogger *)self setRuntimeOverride:v6];
  }
}

- (void)removeRuntimeOverride:(id)a3
{
  id v4 = a3;
  id v6 = [(IMLogger *)self runtimeOverride];
  uint64_t v5 = [v6 stringByReplacingOccurrencesOfString:v4 withString:&stru_1F03A51F0];

  [(IMLogger *)self setRuntimeOverride:v5];
}

+ (id)rolledLogPrefix
{
  return @"Rolled-";
}

+ (void)rollLogPath:(id)a3 maxSize:(unint64_t)a4
{
  id v18 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v6 = [v5 attributesOfItemAtPath:v18 error:0];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKey:*MEMORY[0x1E4F28390]];
    unint64_t v9 = [v8 unsignedLongLongValue];

    if (v9 >= a4)
    {
      uint64_t v10 = [v18 lastPathComponent];
      v11 = NSString;
      v12 = +[IMLogger rolledLogPrefix];
      v13 = IMTimeStamp();
      uint64_t v14 = [v11 stringWithFormat:@"%@%@-%@", v12, v13, v10];

      uint64_t v15 = [v18 stringByDeletingLastPathComponent];
      id v16 = [v15 stringByAppendingPathComponent:v14];
      v17 = +[IMLogger sharedLogger];
      [v17 logFile:"/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Logging/IMLogger.m", 228, @"Rolling Log: %@ -> %@", v18, v16 lineNumber format];

      [v5 moveItemAtPath:v18 toPath:v16 error:0];
    }
  }
}

+ (void)deleteRolledLogsForLogPath:(id)a3 maxAge:(double)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v7 = [v5 lastPathComponent];
  v25 = v5;
  id v8 = [v5 stringByDeletingLastPathComponent];
  unint64_t v9 = [v6 contentsOfDirectoryAtPath:v8 error:0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    v26 = v9;
    uint64_t v27 = *MEMORY[0x1E4F28310];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
        uint64_t v15 = +[IMLogger rolledLogPrefix];
        if ([v14 hasPrefix:v15])
        {
          int v16 = [v14 hasSuffix:v7];

          if (!v16) {
            goto LABEL_13;
          }
          uint64_t v15 = [v8 stringByAppendingPathComponent:v14];
          v17 = [v6 attributesOfItemAtPath:v15 error:0];
          id v18 = [v17 objectForKey:v27];
          __int16 v19 = v18;
          if (v17)
          {
            [v18 timeIntervalSinceNow];
            if (-v20 >= a4)
            {
              +[IMLogger sharedLogger];
              objc_super v21 = v8;
              v22 = v7;
              v24 = id v23 = v6;
              [v24 logFile:"/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Logging/IMLogger.m", 247, @"Deleting Rolled Log: %@", v15 lineNumber format];

              id v6 = v23;
              id v7 = v22;
              id v8 = v21;
              unint64_t v9 = v26;
              [v6 removeItemAtPath:v15 error:0];
            }
          }
        }
LABEL_13:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }
}

- (NSString)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (void)setRuntimeOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runtimeOverrideRegex, 0);
  objc_storeStrong((id *)&self->_procName, 0);
  objc_storeStrong((id *)&self->_runtimeOverride, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_auxPath, 0);
}

@end