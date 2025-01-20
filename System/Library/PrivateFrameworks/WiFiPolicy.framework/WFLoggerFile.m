@interface WFLoggerFile
- (WFLoggerFile)initWithDirectoryPath:(id)a3 dirPath:(__CFString *)a4 fileNamePrefix:(__CFString *)a5 runLoopRef:(__CFRunLoop *)a6 runLoopMode:(__CFString *)a7 classC:(unsigned __int8)a8 dateFormatter:(__CFDateFormatter *)a9 maxFileSizeInMB:(unint64_t)a10 logLifespanInDays:(unint64_t)a11 dispatchQueue:(id)a12;
- (WFLoggerFile)initWithFilePath:(id)a3 filePath:(__CFString *)a4 runLoopRef:(__CFRunLoop *)a5 runLoopMode:(__CFString *)a6 classC:(unsigned __int8)a7 dateFormatter:(__CFDateFormatter *)a8 maxFileSizeInMB:(unint64_t)a9 logLifespanInDays:(unint64_t)a10 dispatchQueue:(id)a11;
- (__CFString)changeLogFile:(unsigned __int8)a3;
- (__CFString)createDateString;
- (__CFString)generateLogFileName;
- (__CFString)getLogDirPath;
- (__CFString)getLogFileNamePrefix;
- (__CFString)getLogFilePath;
- (id)getLogLifespanInDays;
- (id)mapLogLevelEnum:(unint64_t)a3;
- (unint64_t)getLogLevelEnable;
- (unint64_t)getLogLevelPersist;
- (unint64_t)getLogPrivacy;
- (unint64_t)getMaxFileSizeInMB;
- (unsigned)checkLogFileUpdate:(__CFString *)a3;
- (unsigned)doesLogFileExist:(__CFString *)a3;
- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5;
- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6;
- (void)cleanStaleLogs;
- (void)createLogFile:(__CFString *)a3 fileClassC:(unsigned __int8)a4;
- (void)dealloc;
- (void)init:(id)a3 runLoopRef:(__CFRunLoop *)a4 runLoopMode:(__CFString *)a5 classC:(unsigned __int8)a6 dateFormatter:(__CFDateFormatter *)a7 maxFileSizeInMB:(unint64_t)a8 logLifespanInDays:(unint64_t)a9;
- (void)removeLogFile:(const char *)a3 maxAge:(double)a4;
- (void)removeLogFilesFromDir:(const char *)a3;
- (void)rotateLogFile:(__CFString *)a3;
- (void)schedule:(unsigned __int8)a3;
- (void)setLogLevelEnable:(unint64_t)a3;
- (void)setLogLevelPersist:(unint64_t)a3;
- (void)setLogLifespanInDays:(id)a3;
- (void)setLogPrivacy:(unint64_t)a3;
- (void)setMaxFileSizeInMB:(unint64_t)a3;
- (void)startWatchingLogFile;
- (void)stopWatchingLogFile;
- (void)writeToFile:(unint64_t)a3 cfStrMsg:(__CFString *)a4;
@end

@implementation WFLoggerFile

- (void)writeToFile:(unint64_t)a3 cfStrMsg:(__CFString *)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_filePtr)
  {
    SCPrint();
  }
  else
  {
    if (writeToFile_cfStrMsg__onceToken != -1) {
      dispatch_once(&writeToFile_cfStrMsg__onceToken, &__block_literal_global_5);
    }
    v5 = (void *)MEMORY[0x1D9440170]();
    uint64_t v6 = [NSString stringWithFormat:@"%@", a4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
  }
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5
{
}

- (__CFString)getLogFilePath
{
  return self->_logFilePath;
}

- (__CFString)getLogDirPath
{
  return self->_directoryPath;
}

- (__CFString)getLogFileNamePrefix
{
  return self->_fileNamePrefix;
}

- (id)mapLogLevelEnum:(unint64_t)a3
{
  if (a3 == 4) {
    return @"ERROR";
  }
  else {
    return @"NOTICE";
  }
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6
{
  uint64_t v9 = (void *)[[NSString alloc] initWithUTF8String:a5];
  id v10 = (id)[[NSString alloc] initWithFormat:v9 arguments:a6];
  [(WFLoggerFile *)self writeToFile:a3 cfStrMsg:v10];
}

void __37__WFLoggerFile_writeToFile_cfStrMsg___block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1D9440170]();
  uint64_t v1 = objc_msgSend(NSString, "stringWithFormat:", @"%s FAILED. _filePtr is nil", "-[WFLoggerFile writeToFile:cfStrMsg:]_block_invoke");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v3 = v1;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
}

- (void)dealloc
{
  [(WFLoggerFile *)self stopWatchingLogFile];
  loggingTimer = self->_loggingTimer;
  if (loggingTimer)
  {
    dispatch_source_cancel(loggingTimer);
    dispatch_release((dispatch_object_t)self->_loggingTimer);
    self->_loggingTimer = 0;
  }
  filePtr = self->_filePtr;
  if (filePtr)
  {
    fclose(filePtr);
    self->_filePtr = 0;
  }
  logFilePath = self->_logFilePath;
  if (logFilePath)
  {
    CFRelease(logFilePath);
    self->_logFilePath = 0;
  }
  presetFilePath = self->_presetFilePath;
  if (presetFilePath)
  {
    CFRelease(presetFilePath);
    self->_presetFilePath = 0;
  }
  directoryPath = self->_directoryPath;
  if (directoryPath)
  {
    CFRelease(directoryPath);
    self->_directoryPath = 0;
  }
  fileNamePrefix = self->_fileNamePrefix;
  if (fileNamePrefix)
  {
    CFRelease(fileNamePrefix);
    self->_fileNamePrefix = 0;
  }
  fileCreationDate = self->_fileCreationDate;
  if (fileCreationDate)
  {
    CFRelease(fileCreationDate);
    self->_fileCreationDate = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)WFLoggerFile;
  [(WFLoggerFile *)&v10 dealloc];
}

- (WFLoggerFile)initWithDirectoryPath:(id)a3 dirPath:(__CFString *)a4 fileNamePrefix:(__CFString *)a5 runLoopRef:(__CFRunLoop *)a6 runLoopMode:(__CFString *)a7 classC:(unsigned __int8)a8 dateFormatter:(__CFDateFormatter *)a9 maxFileSizeInMB:(unint64_t)a10 logLifespanInDays:(unint64_t)a11 dispatchQueue:(id)a12
{
  unsigned int v12 = a8;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)WFLoggerFile;
  v18 = [(WFLoggerFile *)&v24 init];
  v19 = v18;
  if (a9 && a7 && a6 && a5 && a4 && a3 && v18)
  {
    v18->_presetFilePath = 0;
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v18->_directoryPath = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a4);
    v19->_fileNamePrefix = (__CFString *)CFStringCreateCopy(v20, a5);
    v19->super._dispatchQueue = (OS_dispatch_queue *)a12;
    [(WFLoggerFile *)v19 init:a3 runLoopRef:a6 runLoopMode:a7 classC:v12 dateFormatter:a9 maxFileSizeInMB:a10 logLifespanInDays:a11];
  }
  else
  {
    v21 = (void *)MEMORY[0x1D9440170]();
    uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Failed to init: %p %p %p %p %p %p %p", "-[WFLoggerFile initWithDirectoryPath:dirPath:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:]", v19, a3, a4, a5, a6, a7, a9);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v22;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    return 0;
  }
  return v19;
}

- (WFLoggerFile)initWithFilePath:(id)a3 filePath:(__CFString *)a4 runLoopRef:(__CFRunLoop *)a5 runLoopMode:(__CFString *)a6 classC:(unsigned __int8)a7 dateFormatter:(__CFDateFormatter *)a8 maxFileSizeInMB:(unint64_t)a9 logLifespanInDays:(unint64_t)a10 dispatchQueue:(id)a11
{
  uint64_t v12 = a7;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)WFLoggerFile;
  v17 = [(WFLoggerFile *)&v25 init];
  v18 = (void *)MEMORY[0x1D9440170]();
  if (a8 && a6 && a5 && a4 && a3 && v17)
  {
    CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v17->_presetFilePath = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a4);
    v17->_directoryPath = (__CFString *)CFStringCreateCopy(v19, (CFStringRef)[(__CFString *)a4 stringByDeletingLastPathComponent]);
    v17->super._dispatchQueue = (OS_dispatch_queue *)a11;
    CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a4);
    v21 = (char *)malloc_type_calloc(1uLL, MaximumSizeOfFileSystemRepresentation, 0xC9C35C4uLL);
    CFStringGetFileSystemRepresentation(a4, v21, MaximumSizeOfFileSystemRepresentation);
    if (v21)
    {
      uint64_t v22 = fopen(v21, "a");
      if (v22) {
        fclose(v22);
      }
      free(v21);
    }
    [(WFLoggerFile *)v17 init:a3 runLoopRef:a5 runLoopMode:a6 classC:v12 dateFormatter:a8 maxFileSizeInMB:a9 logLifespanInDays:a10];
  }
  else
  {
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Failed to init: %p %p %p %p %p %p", "-[WFLoggerFile initWithFilePath:filePath:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:]", v17, a3, a4, a5, a6, a8);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v23;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    return 0;
  }
  return v17;
}

- (void)init:(id)a3 runLoopRef:(__CFRunLoop *)a4 runLoopMode:(__CFString *)a5 classC:(unsigned __int8)a6 dateFormatter:(__CFDateFormatter *)a7 maxFileSizeInMB:(unint64_t)a8 logLifespanInDays:(unint64_t)a9
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  self->super._ctxt = (WFLogger *)a3;
  self->_runLoopRef = a4;
  self->_runLoopMode = a5;
  self->_classC = a6;
  self->_privacy = 2;
  self->_level = 3;
  self->_fileCreationDate = 0;
  self->_dateFormatter = a7;
  self->_logLifespanInDays = (NSNumber *)[NSNumber numberWithUnsignedLong:a9];
  unint64_t v11 = 5000000;
  if (a8 - 6 >= 0xFFFFFFFFFFFFFFFBLL) {
    unint64_t v11 = 1000000 * a8;
  }
  self->_maxFileSizeInBytes = v11;
  self->_timerInterval = 600;
  unint64_t v12 = [(NSNumber *)self->_logLifespanInDays unsignedLongValue];
  self->_fileAgeOutInterval = 86400 * v12;
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s: _timerInterval %lu  _fileAgeOutInterval %lu", "-[WFLoggerFile init:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]", self->_timerInterval, 86400 * v12);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v21 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v13, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->super._dispatchQueue);
  self->_loggingTimer = v14;
  if (v14)
  {
    dispatch_set_context((dispatch_object_t)v14, self);
    dispatch_source_set_event_handler_f((dispatch_source_t)self->_loggingTimer, (dispatch_function_t)WFLoggerTimerTmoCallBack);
    loggingTimer = self->_loggingTimer;
    dispatch_time_t v16 = dispatch_time(0, 1000000000 * self->_timerInterval);
    dispatch_source_set_timer(loggingTimer, v16, 1000000000 * self->_timerInterval, 0);
    self->_loggingTimerStarted = 1;
    dispatch_activate((dispatch_object_t)self->_loggingTimer);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D9440170]();
    uint64_t v18 = [NSString stringWithFormat:@"FILE LOGGING TIMER NOT CREATED"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v18;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
  }
  if ([(WFLoggerFile *)self checkLogFileUpdate:0])
  {
    CFAllocatorRef v19 = [(WFLoggerFile *)self changeLogFile:self->_classC];
    if (v19) {
      CFRelease(v19);
    }
  }
}

- (void)schedule:(unsigned __int8)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (!self->_loggingTimerStarted)
    {
      loggingTimer = self->_loggingTimer;
      dispatch_time_t v5 = dispatch_time(0, 1000000000 * self->_timerInterval);
      dispatch_source_set_timer(loggingTimer, v5, 1000000000 * self->_timerInterval, 0);
      self->_loggingTimerStarted = 1;
    }
    uint64_t v6 = "started";
  }
  else
  {
    dispatch_source_set_timer((dispatch_source_t)self->_loggingTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    self->_loggingTimerStarted = 0;
    uint64_t v6 = "stopped";
  }
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s: WFLoggerTimer %s.", "-[WFLoggerFile schedule:]", v6);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v7, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (__CFString)createDateString
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, kCFDateFormatterShortStyle, kCFDateFormatterMediumStyle);
  if (v3)
  {
    uint64_t v4 = v3;
    CFDateFormatterSetFormat(v3, @"MM-dd-yyyy__HH:mm:ss");
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(v2, v4, Current);
    CFRelease(v4);
    return StringWithAbsoluteTime;
  }
  else
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s: null wifiLoggingDateFormatter", "-[WFLoggerFile createDateString]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v10 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v8, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
    return 0;
  }
}

- (__CFString)generateLogFileName
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WFLoggerFile *)self createDateString];
  uint64_t v4 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%s/%s-%@%s", [(__CFString *)self->_directoryPath UTF8String], [(__CFString *)self->_fileNamePrefix UTF8String], v3, ".log");
  if (v3) {
    CFRelease(v3);
  }
  if (!v4)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: null logFileName", "-[WFLoggerFile generateLogFileName]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v8 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
  return v4;
}

- (void)startWatchingLogFile
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  logFilePath = self->_logFilePath;
  if (logFilePath)
  {
    CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(logFilePath);
    dispatch_time_t v5 = (char *)malloc_type_calloc(1uLL, MaximumSizeOfFileSystemRepresentation, 0xDDA354C6uLL);
    if (v5)
    {
      uint64_t v6 = v5;
      CFStringGetFileSystemRepresentation(self->_logFilePath, v5, MaximumSizeOfFileSystemRepresentation);
      int v7 = open(v6, 0x8000);
      if (v7 <= 0)
      {
        CFAllocatorRef v20 = (void *)[NSString stringWithFormat:@"%s: Invalid log file descriptor for %@", "-[WFLoggerFile startWatchingLogFile]", self->_logFilePath];
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v25 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v20, "UTF8String")), "UTF8String");
        v15 = MEMORY[0x1E4F14500];
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      }
      else
      {
        unsigned int v8 = v7;
        if (self->_eventSource)
        {
          uint64_t v9 = (void *)[NSString stringWithFormat:@"%s: Already watching log file, resetting...", "-[WFLoggerFile startWatchingLogFile]"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            uint64_t v25 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v9, "UTF8String")), "UTF8String");
            _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
          dispatch_source_cancel((dispatch_source_t)self->_eventSource);
          dispatch_release((dispatch_object_t)self->_eventSource);
          self->_eventSource = 0;
          [(WFLoggerFile *)self schedule:0];
        }
        uint64_t v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144A8], v8, 1uLL, (dispatch_queue_t)self->super._dispatchQueue);
        self->_eventSource = v10;
        if (!v10)
        {
          v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s: dispatch_source_create failed", "-[WFLoggerFile startWatchingLogFile]");
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v18 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v17, "UTF8String")), "UTF8String");
            *(_DWORD *)buf = 136446210;
            uint64_t v25 = v18;
            _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
          }
          close(v8);
          goto LABEL_15;
        }
        [(WFLoggerFile *)self schedule:1];
        eventSource = self->_eventSource;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __36__WFLoggerFile_startWatchingLogFile__block_invoke;
        handler[3] = &unk_1E69BCAB0;
        handler[4] = self;
        dispatch_source_set_event_handler(eventSource, handler);
        unint64_t v12 = self->_eventSource;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __36__WFLoggerFile_startWatchingLogFile__block_invoke_78;
        v21[3] = &__block_descriptor_36_e5_v8__0l;
        unsigned int v22 = v8;
        dispatch_source_set_cancel_handler(v12, v21);
        dispatch_resume((dispatch_object_t)self->_eventSource);
        v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Watching log file %s", "-[WFLoggerFile startWatchingLogFile]", v6);
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
LABEL_15:
          free(v6);
          return;
        }
        uint64_t v14 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v13, "UTF8String")), "UTF8String");
        *(_DWORD *)buf = 136446210;
        uint64_t v25 = v14;
        v15 = MEMORY[0x1E4F14500];
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      }
      _os_log_impl(&dword_1D3CCD000, v15, v16, "%{public}s", buf, 0xCu);
      goto LABEL_15;
    }
    CFAllocatorRef v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Memory alloc failed", "-[WFLoggerFile startWatchingLogFile]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_20:
      *(_DWORD *)buf = 136446210;
      uint64_t v25 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v19, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    CFAllocatorRef v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s: No log file specified", "-[WFLoggerFile startWatchingLogFile]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
  }
}

void __36__WFLoggerFile_startWatchingLogFile__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = (void *)[NSString stringWithFormat:@"%s: Log file deletion detected, cleaning up and re-creating...", "-[WFLoggerFile startWatchingLogFile]_block_invoke"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v6 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v2, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 120))
  {
    fclose(*(FILE **)(v3 + 120));
    *(void *)(*(void *)(a1 + 32) + 120) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  uint64_t v4 = (const void *)[(id)v3 changeLogFile:*(unsigned __int8 *)(v3 + 64)];
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t __36__WFLoggerFile_startWatchingLogFile__block_invoke_78(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)stopWatchingLogFile
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_eventSource)
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Stopped watching log file", "-[WFLoggerFile stopWatchingLogFile]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v5 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    dispatch_source_cancel((dispatch_source_t)self->_eventSource);
    dispatch_release((dispatch_object_t)self->_eventSource);
    self->_eventSource = 0;
    [(WFLoggerFile *)self schedule:0];
  }
}

- (unsigned)checkLogFileUpdate:(__CFString *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1D9440170](self, a2);
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  unsigned __int8 v7 = 1;
  if (a3)
  {
    if (self->_fileCreationDate)
    {
      unsigned int v8 = (void *)v6;
      if ([(WFLoggerFile *)self doesLogFileExist:a3])
      {
        unint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "attributesOfItemAtPath:error:", a3, 0), "fileSize");
        if (v9 >= 0x4C4B41)
        {
          uint64_t v10 = (void *)[NSString stringWithFormat:@"%s File Size: %llu File path is %@", "-[WFLoggerFile checkLogFileUpdate:]", v9, a3];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            uint64_t v17 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v10, "UTF8String")), "UTF8String");
            _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
        }
        uint64_t v11 = (void *)MEMORY[0x1D9440170]();
        uint64_t v12 = objc_msgSend((id)objc_msgSend(v8, "attributesOfItemAtPath:error:", a3, 0), "fileCreationDate");
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceDate:", v12);
        unsigned __int8 v7 = v13 >= (double)(86400 * [(NSNumber *)self->_logLifespanInDays unsignedIntValue])
          || v9 > 0x4C4B40;
      }
    }
  }
  return v7;
}

- (__CFString)changeLogFile:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  presetFilePath = self->_presetFilePath;
  if (presetFilePath) {
    uint64_t v6 = (__CFString *)CFRetain(presetFilePath);
  }
  else {
    uint64_t v6 = [(WFLoggerFile *)self generateLogFileName];
  }
  unsigned __int8 v7 = v6;
  if ([(WFLoggerFile *)self doesLogFileExist:v6] && self->_filePtr)
  {
    unsigned int v8 = (void *)[NSString stringWithFormat:@"Logfile exists. Given Path: %@ KnownPath: %@", v7, self->_logFilePath];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v13 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v8, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [(WFLoggerFile *)self rotateLogFile:v7];
  }
  else
  {
    [(WFLoggerFile *)self createLogFile:v7 fileClassC:v3];
    unint64_t v9 = "YES";
    if (!v3) {
      unint64_t v9 = "NO";
    }
    uint64_t v10 = (void *)[NSString stringWithFormat:@"%s: Current log file: %@, new log file: %@, class C file: %s", "-[WFLoggerFile changeLogFile:]", self->_logFilePath, v7, v9];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v13 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v10, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  return v7;
}

- (void)cleanStaleLogs
{
  uint64_t v3 = [(__CFString *)self->_directoryPath UTF8String];

  [(WFLoggerFile *)self removeLogFilesFromDir:v3];
}

- (void)removeLogFilesFromDir:(const char *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = opendir(a3);
  if (v5)
  {
    uint64_t v6 = v5;
    for (i = readdir(v5); i; i = readdir(v6))
    {
      snprintf(__str, 0x100uLL, "%s/%s", a3, i->d_name);
      if (strstr(__str, ".log")) {
        [(WFLoggerFile *)self removeLogFile:__str maxAge:(double)self->_fileAgeOutInterval];
      }
    }
    closedir(v6);
  }
  else
  {
    unsigned int v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Can't open %s", "-[WFLoggerFile removeLogFilesFromDir:]", a3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__str = 136446210;
      uint64_t v10 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v8, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", (uint8_t *)__str, 0xCu);
    }
  }
}

- (void)createLogFile:(__CFString *)a3 fileClassC:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  memset(&v41, 0, sizeof(v41));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  *(_OWORD *)v44 = 0u;
  long long v45 = 0u;
  unsigned __int8 v7 = (void *)MEMORY[0x1D9440170](self, a2);
  unsigned int v8 = (__CFString *)[(__CFString *)a3 stringByDeletingLastPathComponent];
  if ([(__CFString *)v8 UTF8String])
  {
    [(__CFString *)v8 UTF8String];
    __strlcpy_chk();
  }
  directoryPath = self->_directoryPath;
  if (directoryPath)
  {
    CFRelease(directoryPath);
    self->_directoryPath = 0;
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  self->_directoryPath = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8);
  if (!v44[0] || stat(v44, &v41) != -1)
  {
    char v11 = 0;
    goto LABEL_8;
  }
  if (!mkdir(v44, 0x1FDu))
  {
    v33 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Re-created missing log directory %s", "-[WFLoggerFile createLogFile:fileClassC:]", v44);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v33, "UTF8String")), "UTF8String");
      *(_DWORD *)buf = 136446210;
      uint64_t v43 = v34;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    char v11 = 1;
LABEL_8:
    CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a3);
    uint64_t v13 = (char *)malloc_type_calloc(1uLL, MaximumSizeOfFileSystemRepresentation, 0x7313614AuLL);
    CFStringGetFileSystemRepresentation(a3, v13, MaximumSizeOfFileSystemRepresentation);
    if (v4 && (self->_isFileLoggingEnabled || !MKBUserUnlockedSinceBoot())) {
      goto LABEL_35;
    }
    logFilePath = self->_logFilePath;
    if (logFilePath)
    {
      char v15 = CFEqual(a3, logFilePath) ? v11 : 1;
      if ((v15 & 1) == 0 && self->_filePtr) {
        goto LABEL_35;
      }
    }
    if (v4)
    {
      int v16 = open_dprotected_np(v13, 514, 3, 0, 384);
      if (v16 < 0)
      {
        v35 = NSString;
        v36 = __error();
        v37 = objc_msgSend(v35, "stringWithFormat:", @"%s: open_dprotected_np failed with %s (%s)", "-[WFLoggerFile createLogFile:fileClassC:]", v13, strerror(*v36));
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_46;
        }
      }
      else
      {
        uint64_t v17 = fdopen(v16, "ab");
        uint64_t v18 = NSString;
        if (v17)
        {
          CFAllocatorRef v19 = v17;
          CFAllocatorRef v20 = (void *)[NSString stringWithFormat:@"%s: Device unlocked since boot, will log to class C file: %s", "-[WFLoggerFile createLogFile:fileClassC:]", v13];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          goto LABEL_28;
        }
        v38 = __error();
        v37 = objc_msgSend(v18, "stringWithFormat:", @"%s: fdopen failed %s (%s)", "-[WFLoggerFile createLogFile:fileClassC:]", v13, strerror(*v38));
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_46;
        }
      }
    }
    else
    {
      uint64_t v23 = fopen(v13, "a");
      objc_super v24 = NSString;
      if (v23)
      {
        CFAllocatorRef v19 = v23;
        CFAllocatorRef v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Will log to file: %s", "-[WFLoggerFile createLogFile:fileClassC:]", v13);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
LABEL_27:
          uint64_t v25 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v20, "UTF8String")), "UTF8String");
          *(_DWORD *)buf = 136446210;
          uint64_t v43 = v25;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
LABEL_28:
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        fileCreationDate = self->_fileCreationDate;
        if (fileCreationDate)
        {
          CFRelease(fileCreationDate);
          self->_fileCreationDate = 0;
        }
        self->_fileCreationDate = CFDateCreate(v10, Current);
        self->_isFileLoggingEnabled = 1;
        self->_filePtr = v19;
        uint64_t v28 = self->_logFilePath;
        if (v28)
        {
          CFRelease(v28);
          self->_logFilePath = 0;
        }
        self->_logFilePath = (__CFString *)CFStringCreateCopy(v10, a3);
        [(WFLoggerFile *)self stopWatchingLogFile];
        [(WFLoggerFile *)self startWatchingLogFile];
        v29 = (void *)[NSString stringWithFormat:@"%s: fileCreationDate %@", "-[WFLoggerFile createLogFile:fileClassC:]", self->_fileCreationDate];
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_35;
        }
        uint64_t v30 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v29, "UTF8String")), "UTF8String");
        *(_DWORD *)buf = 136446210;
        uint64_t v43 = v30;
        v31 = MEMORY[0x1E4F14500];
        os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_34;
      }
      v39 = __error();
      v37 = objc_msgSend(v24, "stringWithFormat:", @"%s: fopen failed %s (%s)", "-[WFLoggerFile createLogFile:fileClassC:]", v13, strerror(*v39));
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
LABEL_46:
        uint64_t v40 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v37, "UTF8String")), "UTF8String");
        *(_DWORD *)buf = 136446210;
        uint64_t v43 = v40;
        v31 = MEMORY[0x1E4F14500];
        os_log_type_t v32 = OS_LOG_TYPE_ERROR;
LABEL_34:
        _os_log_impl(&dword_1D3CCD000, v31, v32, "%{public}s", buf, 0xCu);
      }
    }
LABEL_35:
    if (v13) {
      free(v13);
    }
    goto LABEL_37;
  }
  uint64_t v21 = (void *)[NSString stringWithFormat:@"%s: Failed to create directory %s, errno = %d", "-[WFLoggerFile createLogFile:fileClassC:]", v44, *__error()];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v21, "UTF8String")), "UTF8String");
    *(_DWORD *)buf = 136446210;
    uint64_t v43 = v22;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
LABEL_37:
  [(WFLoggerFile *)self cleanStaleLogs];
}

- (void)removeLogFile:(const char *)a3 maxAge:(double)a4
{
  memset(&v8, 0, sizeof(v8));
  if (!stat(a3, &v8))
  {
    time_t v6 = time(0);
    if (difftime(v6, v8.st_mtimespec.tv_sec) > a4) {
      remove((const std::__fs::filesystem::path *)a3, v7);
    }
  }
}

- (unsigned)doesLogFileExist:(__CFString *)a3
{
  CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a3);
  uint64_t v5 = (char *)malloc_type_calloc(1uLL, MaximumSizeOfFileSystemRepresentation, 0x58B1A656uLL);
  if (!v5) {
    return 0;
  }
  time_t v6 = v5;
  CFStringGetFileSystemRepresentation(a3, v5, MaximumSizeOfFileSystemRepresentation);
  memset(&v9, 0, sizeof(v9));
  unsigned __int8 v7 = stat(v6, &v9) == 0;
  free(v6);
  return v7;
}

- (void)rotateLogFile:(__CFString *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t maxFileSizeInBytes = self->_maxFileSizeInBytes;
  memset(&v34, 0, sizeof(v34));
  unsigned __int8 isFileLoggingEnabled = self->_isFileLoggingEnabled;
  CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a3);
  stat v8 = (char *)malloc_type_calloc(1uLL, MaximumSizeOfFileSystemRepresentation, 0x510CC9A3uLL);
  if (v8)
  {
    stat v9 = v8;
    CFStringGetFileSystemRepresentation(a3, v8, MaximumSizeOfFileSystemRepresentation);
    if (stat(v9, &v34))
    {
      CFAllocatorRef v10 = NSString;
      char v11 = __error();
      uint64_t v12 = objc_msgSend(v10, "stringWithFormat:", @"%s: #error File status on %s returned non-zero (%s)", "-[WFLoggerFile rotateLogFile:]", v9, strerror(*v11));
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
LABEL_5:
        free(v9);
        self->_unsigned __int8 isFileLoggingEnabled = isFileLoggingEnabled;
        return;
      }
LABEL_4:
      uint64_t v13 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v12, "UTF8String")), "UTF8String");
      *(_DWORD *)buf = 136446210;
      uint64_t v36 = v13;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
      goto LABEL_5;
    }
    unint64_t v15 = self->_maxFileSizeInBytes;
    if (!v15)
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s: #error Max size is 0", "-[WFLoggerFile rotateLogFile:]");
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if (v34.st_size < v15)
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s: #error Nothing to do. CurrentSize:%lld MaxSize:%lu", "-[WFLoggerFile rotateLogFile:]", v34.st_size, v15);
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    off_t v16 = llround((double)maxFileSizeInBytes * 0.5);
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Rotating log file %s from %lld to %ld bytes", "-[WFLoggerFile rotateLogFile:]", v9, v34.st_size, v16);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v17, "UTF8String")), "UTF8String");
      *(_DWORD *)buf = 136446210;
      uint64_t v36 = v18;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    self->_unsigned __int8 isFileLoggingEnabled = 0;
    CFAllocatorRef v19 = fopen(v9, "r");
    if (!v19)
    {
      uint64_t v26 = NSString;
      uint64_t v27 = __error();
      uint64_t v12 = objc_msgSend(v26, "stringWithFormat:", @"%s: #error opening log file %s (%s) for reading", "-[WFLoggerFile rotateLogFile:]", v9, strerror(*v27));
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    CFAllocatorRef v20 = v19;
    if (fseek(v19, -v16, 2))
    {
      uint64_t v21 = NSString;
      uint64_t v22 = __error();
      uint64_t v23 = strerror(*v22);
      objc_super v24 = (void *)[v21 stringWithFormat:@"%s: #error fseeking log file %s (%s), file size %lld, SEEK_END offset %ld", "-[WFLoggerFile rotateLogFile:]", v9, v23, v34.st_size, v16];
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
LABEL_21:
        fclose(v20);
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v28 = fopen(v9, "r+");
      if (v28)
      {
        v29 = v28;
        size_t v30 = fread(buf, 1uLL, 0x400uLL, v20);
        if (v30)
        {
          size_t v31 = v30;
          do
          {
            fwrite(buf, 1uLL, v31, v29);
            size_t v31 = fread(buf, 1uLL, 0x400uLL, v20);
          }
          while (v31);
        }
        fclose(v20);
        fflush(v29);
        fclose(v29);
        truncate(v9, v16);
        goto LABEL_5;
      }
      os_log_type_t v32 = NSString;
      v33 = __error();
      objc_super v24 = objc_msgSend(v32, "stringWithFormat:", @"%s: #error opening log file %s (%s) for writing", "-[WFLoggerFile rotateLogFile:]", v9, strerror(*v33));
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
    }
    uint64_t v25 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v24, "UTF8String")), "UTF8String");
    *(_DWORD *)buf = 136446210;
    uint64_t v36 = v25;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    goto LABEL_21;
  }
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s: alloc failed", "-[WFLoggerFile rotateLogFile:]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v36 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v14, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

- (void)setMaxFileSizeInMB:(unint64_t)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s not applicable", "-[WFLoggerFile setMaxFileSizeInMB:]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v5 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

- (unint64_t)getMaxFileSizeInMB
{
  return self->_maxFileSizeInBytes / 0xF4240;
}

- (void)setLogLifespanInDays:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s not applicable", "-[WFLoggerFile setLogLifespanInDays:]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v5 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

- (id)getLogLifespanInDays
{
  return self->_logLifespanInDays;
}

- (void)setLogPrivacy:(unint64_t)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s not applicable", "-[WFLoggerFile setLogPrivacy:]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v5 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

- (unint64_t)getLogPrivacy
{
  return self->_privacy;
}

- (void)setLogLevelEnable:(unint64_t)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s not applicable", "-[WFLoggerFile setLogLevelEnable:]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v5 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

- (unint64_t)getLogLevelEnable
{
  return self->_level;
}

- (void)setLogLevelPersist:(unint64_t)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s not applicable", "-[WFLoggerFile setLogLevelPersist:]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v5 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

- (unint64_t)getLogLevelPersist
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = objc_msgSend(NSString, "stringWithFormat:", @"%s not applicable", "-[WFLoggerFile getLogLevelPersist]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v5 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v2, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
  return 3;
}

@end