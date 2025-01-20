@interface WFLogger
+ (id)sharedWFLoggerSingleton;
- (NSNumber)getLogLifespanInDays;
- (WFLogger)init;
- (id)loggerBase;
- (unint64_t)getDestination;
- (unint64_t)getLogLevelEnable;
- (unint64_t)getLogLevelPersist;
- (unint64_t)getLogPrivacy;
- (unint64_t)getMaxFileSizeInMB;
- (void)WFLog:(unint64_t)a3 message:(const char *)a4;
- (void)dump;
- (void)setDestinationCircularBuffer;
- (void)setDestinationFile:(__CFString *)a3 runLoopRef:(__CFRunLoop *)a4 runLoopMode:(__CFString *)a5 classC:(unsigned __int8)a6 dateFormatter:(__CFDateFormatter *)a7 maxFileSizeInMB:(unint64_t)a8 logLifespanInDays:(unint64_t)a9;
- (void)setDestinationFileLocation:(__CFString *)a3 fileNamePrefix:(__CFString *)a4 runLoopRef:(__CFRunLoop *)a5 runLoopMode:(__CFString *)a6 classC:(unsigned __int8)a7 dateFormatter:(__CFDateFormatter *)a8 maxFileSizeInMB:(unint64_t)a9 logLifespanInDays:(unint64_t)a10;
- (void)setDestinationOsLog:(__CFString *)a3 category:(__CFString *)a4 logLifespanInDays:(unint64_t)a5 logLevel:(unint64_t)a6 logPrivacy:(unint64_t)a7;
@end

@implementation WFLogger

void __26__WFLogger_WFLog_message___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 8) WFLog:a1[6] privacy:*(void *)(a1[4] + 24) cfStrMsg:*(void *)(*(void *)(a1[5] + 8) + 24)];
  v2 = *(const void **)(*(void *)(a1[5] + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
}

void __26__WFLogger_WFLog_message___block_invoke(uint64_t a1)
{
  +[WFLoggerOsLog WFLogOsLog:*(void *)(a1 + 40) cfStrMsg:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (void)WFLog:(unint64_t)a3 message:(const char *)a4
{
  objc_sync_enter(self);
  if (self->_loggerBase && self->_destination != 1)
  {
    uint64_t v21 = 0;
    va_list v22 = (va_list)&v23;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a4, 0x8000100u);
    if (v8 || (CFStringRef v8 = CFStringCreateWithCString(v7, a4, 0)) != 0)
    {
      if (self->_destination == 2)
      {
        CFStringRef v9 = CFStringCreateWithFormatAndArguments(v7, 0, v8, v22);
        v19[3] = (uint64_t)v9;
      }
      else
      {
        memset(&v17, 0, sizeof(v17));
        v16.tv_sec = 0;
        *(void *)&v16.tv_usec = 0;
        gettimeofday(&v16, 0);
        localtime_r(&v16.tv_sec, &v17);
        Mutable = CFStringCreateMutable(v7, 0);
        v19[3] = (uint64_t)Mutable;
        CFStringAppendFormat(Mutable, 0, @"%02d/%02d/%04d %2d:%02d:%02d.%03d ", (v17.tm_mon + 1), v17.tm_mday, (v17.tm_year + 1900), v17.tm_hour, v17.tm_min, v17.tm_sec, (v16.tv_usec / 1000));
        CFStringAppendFormatAndArguments((CFMutableStringRef)v19[3], 0, v8, v22);
      }
      if (self->_destination != 2
        && (!self->_wflRunningOnWatchClassDevice || self->_wflEnableDualLoggingOnWatchClassDevice))
      {
        *(void *)&v17.tm_sec = 0;
        *(void *)&v17.tm_hour = &v17;
        *(void *)&v17.tm_mon = 0x2020000000;
        *(void *)&v17.tm_wday = 0;
        CFStringRef v11 = CFStringCreateWithFormatAndArguments(v7, 0, v8, v22);
        *(void *)(*(void *)&v17.tm_hour + 24) = v11;
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __26__WFLogger_WFLog_message___block_invoke;
        block[3] = &unk_1E69BD730;
        block[4] = &v17;
        block[5] = a3;
        dispatch_async(dispatchQueue, block);
        _Block_object_dispose(&v17, 8);
      }
      CFRelease(v8);
      v13 = self->_dispatchQueue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __26__WFLogger_WFLog_message___block_invoke_2;
      v14[3] = &unk_1E69BD758;
      v14[4] = self;
      v14[5] = &v18;
      v14[6] = a3;
      dispatch_async(v13, v14);
    }
    _Block_object_dispose(&v18, 8);
  }
  objc_sync_exit(self);
}

+ (id)sharedWFLoggerSingleton
{
  v3 = objc_opt_class();
  objc_sync_enter(v3);
  id v4 = (id)_sharedWFLoggerSingleton;
  if (!_sharedWFLoggerSingleton)
  {
    id v4 = objc_alloc_init((Class)a1);
    _sharedWFLoggerSingleton = (uint64_t)v4;
  }
  objc_sync_exit(v3);
  return v4;
}

- (WFLogger)init
{
  result = (WFLogger *)_sharedWFLoggerSingleton;
  if (!_sharedWFLoggerSingleton)
  {
    v6.receiver = self;
    v6.super_class = (Class)WFLogger;
    id v4 = [(WFLogger *)&v6 init];
    if (v4)
    {
      v5 = v4;
      v4->_destination = 1;
      v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wflogger", 0);
      [(WFLogger *)v5 setDestinationOsLog:@"com.apple.WiFiPolicy" category:&stru_1F2B5AC50 logLifespanInDays:7 logLevel:3 logPrivacy:2];
      _sharedWFLoggerSingleton = (uint64_t)v5;
      v5->_wflRunningOnWatchClassDevice = MGGetSInt32Answer() == 6;
      v5->_wflEnableDualLoggingOnWatchClassDevice = 1;
    }
    return (WFLogger *)_sharedWFLoggerSingleton;
  }
  return result;
}

- (unint64_t)getDestination
{
  return self->_destination;
}

- (id)loggerBase
{
  return self->_loggerBase;
}

- (void)setDestinationCircularBuffer
{
  if (self->_destination != 4)
  {
    loggerBase = self->_loggerBase;
    if (loggerBase)
    {

      self->_loggerBase = 0;
    }
    id v4 = objc_alloc_init(WFLoggerCircularBuffer);
    if (v4)
    {
      self->_loggerBase = &v4->super;
      self->_destination = 4;
    }
  }
}

- (void)setDestinationFile:(__CFString *)a3 runLoopRef:(__CFRunLoop *)a4 runLoopMode:(__CFString *)a5 classC:(unsigned __int8)a6 dateFormatter:(__CFDateFormatter *)a7 maxFileSizeInMB:(unint64_t)a8 logLifespanInDays:(unint64_t)a9
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a3 isEmpty])
  {
    timeval v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s filePath is empty", "-[WFLogger setDestinationFile:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v26 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v16, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
  else if (self->_destination != 3 {
         || (loggerBase = self->_loggerBase) == 0
  }
         || (CFStringRef v18 = (const __CFString *)[(WFLoggerBase *)loggerBase getLogFilePath]) == 0
         || CFStringCompare(a3, v18, 4uLL))
  {
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s Logging destination will change to file: %s", "-[WFLogger setDestinationFile:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]", -[__CFString UTF8String](a3, "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v26 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v19, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (self->_wflRunningOnWatchClassDevice)
    {
      if (!self->_wflEnableDualLoggingOnWatchClassDevice)
      {
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Dual logging suppressed on watch class device. WiFi logs will not be present in the system log while file logging is configured", "-[WFLogger setDestinationFile:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]");
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v20, "UTF8String")), "UTF8String");
          *(_DWORD *)buf = 136446210;
          uint64_t v26 = v21;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
      }
    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__WFLogger_setDestinationFile_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays___block_invoke;
    block[3] = &unk_1E69BD6B8;
    block[4] = self;
    block[5] = a3;
    void block[6] = a4;
    block[7] = a5;
    unsigned __int8 v24 = a6;
    block[8] = a7;
    block[9] = a8;
    block[10] = a9;
    dispatch_sync(dispatchQueue, block);
  }
}

void __109__WFLogger_setDestinationFile_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2) {
    [v2 stopWatchingLogFile];
  }
  v3 = -[WFLoggerFile initWithFilePath:filePath:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:]([WFLoggerFile alloc], "initWithFilePath:filePath:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:", *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(*(void *)(a1 + 32) + 32));
  if (v3)
  {
    id v4 = v3;
    v5 = *(void **)(*(void *)(a1 + 32) + 8);
    if (v5)
    {

      *(void *)(*(void *)(a1 + 32) + 8) = 0;
    }
    [(WFLoggerFile *)v4 schedule:1];
    *(void *)(*(void *)(a1 + 32) + 8) = v4;
    *(void *)(*(void *)(a1 + 32) + 16) = 3;
    objc_super v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s Logging destination changed to file: %s", "-[WFLogger setDestinationFile:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]_block_invoke", objc_msgSend(*(id *)(a1 + 40), "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v8 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (void)setDestinationFileLocation:(__CFString *)a3 fileNamePrefix:(__CFString *)a4 runLoopRef:(__CFRunLoop *)a5 runLoopMode:(__CFString *)a6 classC:(unsigned __int8)a7 dateFormatter:(__CFDateFormatter *)a8 maxFileSizeInMB:(unint64_t)a9 logLifespanInDays:(unint64_t)a10
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a3 isEmpty])
  {
    tm v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s dirPath is empty", "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]");
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return;
    }
LABEL_6:
    *(_DWORD *)buf = 136446210;
    uint64_t v29 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v17, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    return;
  }
  if ([(__CFString *)a4 isEmpty])
  {
    tm v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s fileNamePrefix is empty", "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]");
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return;
    }
    goto LABEL_6;
  }
  if (self->_destination != 3
    || (loggerBase = self->_loggerBase) == 0
    || (v19 = (__CFString *)[(WFLoggerBase *)loggerBase getLogDirPath],
        uint64_t v20 = [(WFLoggerBase *)self->_loggerBase getLogFileNamePrefix],
        !v19)
    || (uint64_t v21 = (__CFString *)v20) == 0
    || ([(__CFString *)v19 isEmpty] & 1) != 0
    || ([(__CFString *)v21 isEmpty] & 1) != 0
    || CFStringCompare(a3, v19, 4uLL)
    || CFStringCompare(a4, v21, 4uLL))
  {
    va_list v22 = objc_msgSend(NSString, "stringWithFormat:", @"%s Logging destination will change to directory: %s FileNamePrefix: %s", "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]", -[__CFString UTF8String](a3, "UTF8String"), -[__CFString UTF8String](a4, "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v29 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v22, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (self->_wflRunningOnWatchClassDevice && !self->_wflEnableDualLoggingOnWatchClassDevice)
    {
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Dual logging suppressed on watch class device. WiFi logs will not be present in the system log while file logging is configured", "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]");
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v23, "UTF8String")), "UTF8String");
        *(_DWORD *)buf = 136446210;
        uint64_t v29 = v24;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __132__WFLogger_setDestinationFileLocation_fileNamePrefix_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays___block_invoke;
    block[3] = &unk_1E69BD6E0;
    block[4] = self;
    block[5] = a3;
    void block[6] = a4;
    block[7] = a5;
    unsigned __int8 v27 = a7;
    block[8] = a6;
    block[9] = a8;
    block[10] = a9;
    void block[11] = a10;
    dispatch_sync(dispatchQueue, block);
  }
}

void __132__WFLogger_setDestinationFileLocation_fileNamePrefix_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2) {
    [v2 stopWatchingLogFile];
  }
  v3 = -[WFLoggerFile initWithDirectoryPath:dirPath:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:]([WFLoggerFile alloc], "initWithDirectoryPath:dirPath:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:", *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(*(void *)(a1 + 32) + 32));
  if (v3)
  {
    id v4 = v3;
    v5 = *(void **)(*(void *)(a1 + 32) + 8);
    if (v5)
    {

      *(void *)(*(void *)(a1 + 32) + 8) = 0;
    }
    [(WFLoggerFile *)v4 schedule:1];
    *(void *)(*(void *)(a1 + 32) + 8) = v4;
    *(void *)(*(void *)(a1 + 32) + 16) = 3;
    objc_super v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s Logging destination changed to directory: %s FileNamePrefix: %s", "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]_block_invoke", objc_msgSend(*(id *)(a1 + 40), "UTF8String"), objc_msgSend(*(id *)(a1 + 48), "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v8 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (void)setDestinationOsLog:(__CFString *)a3 category:(__CFString *)a4 logLifespanInDays:(unint64_t)a5 logLevel:(unint64_t)a6 logPrivacy:(unint64_t)a7
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a3 isEmpty])
  {
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s subSystem is empty", "-[WFLogger setDestinationOsLog:category:logLifespanInDays:logLevel:logPrivacy:]");
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v17 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v13, "UTF8String")), "UTF8String");
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
  else if (self->_destination != 2)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__WFLogger_setDestinationOsLog_category_logLifespanInDays_logLevel_logPrivacy___block_invoke;
    block[3] = &unk_1E69BD708;
    block[4] = self;
    block[5] = a3;
    void block[6] = a4;
    block[7] = a5;
    block[8] = a6;
    block[9] = a7;
    dispatch_sync(dispatchQueue, block);
  }
}

id __79__WFLogger_setDestinationOsLog_category_logLifespanInDays_logLevel_logPrivacy___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2) {
    [v2 stopWatchingLogFile];
  }
  id result = -[WFLoggerOsLog init:subSystem:category:logLifespanInDays:logLevel:logPrivacy:dispatchQueue:]([WFLoggerOsLog alloc], "init:subSystem:category:logLifespanInDays:logLevel:logPrivacy:dispatchQueue:", *(void *)(*(void *)(a1 + 32) + 32));
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 8))
    {
      objc_super v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s Logging destination changed to system wide logging (os_log)", "-[WFLogger setDestinationOsLog:category:logLifespanInDays:logLevel:logPrivacy:]_block_invoke");
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v8 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String")), "UTF8String");
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }

      *(void *)(*(void *)(a1 + 32) + 8) = 0;
      uint64_t v5 = *(void *)(a1 + 32);
    }
    *(void *)(v5 + 8) = v4;
    *(void *)(*(void *)(a1 + 32) + 16) = 2;
    id result = (id)[*(id *)(*(void *)(a1 + 32) + 8) getLogPrivacy];
    *(void *)(*(void *)(a1 + 32) + 24) = result;
  }
  return result;
}

- (void)dump
{
  loggerBase = self->_loggerBase;
  if (loggerBase) {
    [(WFLoggerBase *)loggerBase dump];
  }
}

- (NSNumber)getLogLifespanInDays
{
  id result = (NSNumber *)self->_loggerBase;
  if (result) {
    return (NSNumber *)[(NSNumber *)result getLogLifespanInDays];
  }
  return result;
}

- (unint64_t)getLogPrivacy
{
  loggerBase = self->_loggerBase;
  if (loggerBase) {
    return [(WFLoggerBase *)loggerBase getLogPrivacy];
  }
  else {
    return 1;
  }
}

- (unint64_t)getLogLevelEnable
{
  loggerBase = self->_loggerBase;
  if (loggerBase) {
    return [(WFLoggerBase *)loggerBase getLogLevelEnable];
  }
  else {
    return 3;
  }
}

- (unint64_t)getLogLevelPersist
{
  loggerBase = self->_loggerBase;
  if (loggerBase) {
    return [(WFLoggerBase *)loggerBase getLogLevelPersist];
  }
  else {
    return 3;
  }
}

- (unint64_t)getMaxFileSizeInMB
{
  unint64_t result = (unint64_t)self->_loggerBase;
  if (result) {
    return [(id)result getMaxFileSizeInMB];
  }
  return result;
}

@end