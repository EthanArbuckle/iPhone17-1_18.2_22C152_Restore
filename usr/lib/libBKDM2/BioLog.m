@interface BioLog
+ (void)cancelDiagnosticLogsRemoval;
+ (void)initialize;
+ (void)removeBioLogAsync;
+ (void)removeDiagnosticLogs;
+ (void)removeDiagnosticLogsImmediately;
+ (void)scheduleDiagnosticLogsRemoval;
- (BOOL)createFileAtPath:(id)a3 contents:(id)a4 attributes:(id)a5 purgeable:(BOOL)a6;
- (BOOL)isInternal;
- (id)computeAllVsAllMatrixFromScoreDataArray:(id)a3 sequenceNumber:(unsigned __int16)a4;
- (id)eventPathWithName:(id)a3 date:(id)a4;
- (id)initForInternalLogging:(BOOL)a3;
- (id)logLogContextWithDate:(id)a3;
- (id)logNameFromDate:(id)a3;
- (id)sequencePathForId:(id *)a3;
- (id)sequencePathForId:(id *)a3 andSubdirectory:(id)a4;
- (void)applyRetentionPolicy;
- (void)logAllVsAllWithDate:(id)a3;
- (void)logCameraFrame:(id *)a3 sensorRawData:(id)a4 metaData:(id)a5;
- (void)logCameraFrame:(id)a3 withBuffers:(id)a4;
- (void)logData:(id)a3 withContext:(id *)a4;
- (void)logFrameDebug:(id)a3 withBuffer:(id)a4;
- (void)logInternalCameraFrame:(id *)a3 sensorRawData:(id)a4 metaData:(id)a5;
- (void)logPasscodeValidatedWithUserID:(unsigned int)a3;
- (void)logRemoveIdentity:(id)a3 withTemplateListData:(id)a4 templateSize:(unint64_t)a5 client:(id)a6 isPO:(BOOL)a7;
- (void)logSecureFaceDetectInfo;
- (void)logSecureFaceDetectStart:(id *)a3;
- (void)logSecureFaceDetectState:(int)a3;
- (void)logSecureFaceDetectStop;
- (void)logSecureFrameMeta:(id)a3 timestamp:(id)a4;
- (void)logSequenceDebug:(id)a3 withContext:(id *)a4;
- (void)logSequenceInfo:(id)a3 withContext:(id *)a4 orientation:(id *)a5 identities:(id)a6;
- (void)logTemplate:(id)a3 withContext:(id *)a4;
- (void)logTemplate:(id)a3 withSequenceNumber:(unsigned __int16)a4 date:(id)a5 index:(unsigned __int8)a6 toPath:(id)a7 isPO:(BOOL)a8;
- (void)logTemplateList:(id)a3 withContext:(id *)a4 isPO:(BOOL)a5;
- (void)logTemplateList:(id)a3 withTemplateSize:(unint64_t)a4 sequenceNumber:(unsigned __int16)a5 date:(id)a6 toPath:(id)a7 isPO:(BOOL)a8;
- (void)scheduleRetentionPolicy;
- (void)setRetentionPolicyLow:(BOOL)a3;
@end

@implementation BioLog

+ (void)initialize
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_222D7E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.BioLog'!\n", v0, 2u);
}

- (id)initForInternalLogging:(BOOL)a3
{
  BOOL v3 = a3;
  v68[2] = *MEMORY[0x263EF8340];
  v4 = [(BioLog *)self init];
  v5 = v4;
  uint64_t v6 = MEMORY[0x263EF8438];
  if (!v4) {
    goto LABEL_28;
  }
  v4->_internal = v3;
  v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
  fileNameFormatter = v5->_fileNameFormatter;
  v5->_fileNameFormatter = v7;

  [(NSDateFormatter *)v5->_fileNameFormatter setDateFormat:@"yyyy_MM_dd_HH_mm_ss_SSS"];
  v9 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
  milisecondsFormatter = v5->_milisecondsFormatter;
  v5->_milisecondsFormatter = v9;

  [(NSDateFormatter *)v5->_milisecondsFormatter setDateFormat:@"SSS"];
  uint64_t v12 = *MEMORY[0x263F080A8];
  v67[0] = *MEMORY[0x263F08060];
  uint64_t v11 = v67[0];
  v67[1] = v12;
  uint64_t v13 = *MEMORY[0x263F080B0];
  v68[0] = @"mobile";
  v68[1] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
  fileAttributes = v5->_fileAttributes;
  v5->_fileAttributes = (NSDictionary *)v14;

  v65[0] = v11;
  v65[1] = v12;
  uint64_t v16 = *MEMORY[0x263F08088];
  v66[0] = @"mobile";
  v66[1] = v16;
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
  fileAttributesProtected = v5->_fileAttributesProtected;
  v5->_fileAttributesProtected = (NSDictionary *)v17;

  if (v5->_internal)
  {
    v63[0] = v11;
    v63[1] = v12;
    uint64_t v19 = *MEMORY[0x263F08098];
    v64[0] = @"mobile";
    v64[1] = v19;
    v20 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
  }
  else
  {
    v20 = v5->_fileAttributesProtected;
  }
  fileAttributesAutoUpload = v5->_fileAttributesAutoUpload;
  v5->_fileAttributesAutoUpload = v20;

  dispatch_queue_t v22 = dispatch_queue_create("com.apple.BioLog.writing", 0);
  dispatchQueueWriting = v5->_dispatchQueueWriting;
  v5->_dispatchQueueWriting = (OS_dispatch_queue *)v22;

  if (!v5->_dispatchQueueWriting)
  {
    if (__osLog_BioLog) {
      v52 = __osLog_BioLog;
    }
    else {
      v52 = v6;
    }
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    int v55 = 136316162;
    *(void *)v56 = "_dispatchQueueWriting";
    *(_WORD *)&v56[8] = 2048;
    *(void *)&v56[10] = 0;
    __int16 v57 = 2080;
    v58 = &unk_222DFB9BF;
    __int16 v59 = 2080;
    v60 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
    __int16 v61 = 1024;
    int v62 = 122;
    goto LABEL_47;
  }
  v24 = (const char *)RETENTION_QUEUE_LABEL;
  v25 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v26 = dispatch_queue_create(v24, v25);
  retentionQueue = v5->_retentionQueue;
  v5->_retentionQueue = (OS_dispatch_queue *)v26;

  if (!v5->_retentionQueue)
  {
    if (__osLog_BioLog) {
      v52 = __osLog_BioLog;
    }
    else {
      v52 = v6;
    }
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    int v55 = 136316162;
    *(void *)v56 = "_retentionQueue";
    *(_WORD *)&v56[8] = 2048;
    *(void *)&v56[10] = 0;
    __int16 v57 = 2080;
    v58 = &unk_222DFB9BF;
    __int16 v59 = 2080;
    v60 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
    __int16 v61 = 1024;
    int v62 = 126;
LABEL_47:
    _os_log_impl(&dword_222D7E000, v52, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v55, 0x30u);
LABEL_48:
    v28 = v5;
    v5 = 0;
    goto LABEL_27;
  }
  v5->_retentionNewItemsSize = 0;
  v28 = [MEMORY[0x263EFF910] date];
  v29 = [(BioLog *)v5 logNameFromDate:v28];
  rootPath = v5->_rootPath;
  if (v3)
  {
    v5->_rootPath = (NSString *)@"/Library/Logs/BioLog";
  }
  else
  {
    v5->_rootPath = (NSString *)@"/var/mobile/Library/BioLogC";

    [(id)objc_opt_class() cancelDiagnosticLogsRemoval];
    if (!isInternalBuild()
      || ([MEMORY[0x263F2AAB8] sharedInstance],
          v31 = objc_claimAutoreleasedReturnValue(),
          char v32 = [v31 BOOLForKey:@"bioLogDataVaultDisabled"],
          v31,
          (v32 & 1) == 0))
    {
      [(NSString *)v5->_rootPath UTF8String];
      if (rootless_check_datavault_flag())
      {
        [(NSString *)v5->_rootPath UTF8String];
        int v33 = rootless_mkdir_datavault();
        if (v33)
        {
          int v54 = v33;
          if (__osLog_BioLog) {
            v53 = __osLog_BioLog;
          }
          else {
            v53 = v6;
          }
          if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
            goto LABEL_60;
          }
          int v55 = 136316162;
          *(void *)v56 = "err == 0 ";
          *(_WORD *)&v56[8] = 2048;
          *(void *)&v56[10] = v54;
          __int16 v57 = 2080;
          v58 = &unk_222DFB9BF;
          __int16 v59 = 2080;
          v60 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
          __int16 v61 = 1024;
          int v62 = 152;
          goto LABEL_59;
        }
        chown([(NSString *)v5->_rootPath UTF8String], 0x1F5u, 0x1F5u);
      }
    }
  }
  uint64_t v34 = [(NSString *)v5->_rootPath stringByAppendingPathComponent:v29];
  logPath = v5->_logPath;
  v5->_logPath = (NSString *)v34;

  v36 = [MEMORY[0x263F08850] defaultManager];
  char v37 = [v36 fileExistsAtPath:v5->_logPath];

  if (v37) {
    goto LABEL_17;
  }
  v38 = [MEMORY[0x263F08850] defaultManager];
  char v39 = [v38 createDirectoryAtPath:v5->_logPath withIntermediateDirectories:1 attributes:v5->_fileAttributes error:0];

  if (v39)
  {
    +[BLRetention setPurgeableAtPath:v5->_logPath directory:1];
LABEL_17:
    v40 = [(NSString *)v5->_rootPath stringByAppendingPathComponent:@"Current"];
    v41 = [MEMORY[0x263F08850] defaultManager];
    [v41 removeItemAtPath:v40 error:0];

    v42 = [MEMORY[0x263F08850] defaultManager];
    char v43 = [v42 createSymbolicLinkAtPath:v40 withDestinationPath:v29 error:0];

    if ((v43 & 1) == 0)
    {
      v44 = (__osLog_BioLog ? __osLog_BioLog : v6);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v55) = 0;
        _os_log_impl(&dword_222D7E000, v44, OS_LOG_TYPE_ERROR, "Log symlink creation failed! Don't trust 'BioLog/Current'.\n", (uint8_t *)&v55, 2u);
      }
    }
    if (v5->_internal)
    {
      uint64_t v45 = [(BioLog *)v5 logLogContextWithDate:v28];
      logContextBasePath = v5->_logContextBasePath;
      v5->_logContextBasePath = (NSString *)v45;
    }
    uint64_t v47 = objc_opt_new();
    scoreDataArray = v5->_scoreDataArray;
    v5->_scoreDataArray = (NSMutableArray *)v47;

    *(_DWORD *)v5->_computedSequenceNumberPair = 0;
    v5->_lastComputedSequenceNumber = 0;
    goto LABEL_26;
  }
  if (__osLog_BioLog) {
    v53 = __osLog_BioLog;
  }
  else {
    v53 = v6;
  }
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    int v55 = 136316162;
    *(void *)v56 = "result";
    *(_WORD *)&v56[8] = 2048;
    *(void *)&v56[10] = 0;
    __int16 v57 = 2080;
    v58 = &unk_222DFB9BF;
    __int16 v59 = 2080;
    v60 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
    __int16 v61 = 1024;
    int v62 = 165;
LABEL_59:
    _os_log_impl(&dword_222D7E000, v53, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v55, 0x30u);
  }
LABEL_60:
  v40 = v5;
  v5 = 0;
LABEL_26:

LABEL_27:
LABEL_28:
  if (__osLogTrace_BioLog) {
    v49 = __osLogTrace_BioLog;
  }
  else {
    v49 = v6;
  }
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      v50 = v5->_logPath;
    }
    else {
      v50 = 0;
    }
    int v55 = 67109378;
    *(_DWORD *)v56 = v5 != 0;
    *(_WORD *)&v56[4] = 2112;
    *(void *)&v56[6] = v50;
    _os_log_impl(&dword_222D7E000, v49, OS_LOG_TYPE_DEFAULT, "initToPath -> (%d) (_ %@)\n", (uint8_t *)&v55, 0x12u);
  }
  return v5;
}

- (BOOL)isInternal
{
  return self->_internal;
}

+ (void)removeDiagnosticLogsImmediately
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F08850] defaultManager];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v12 = v17 = 0u;
  v2 = [v12 contentsOfDirectoryAtPath:@"/var/mobile/Library/BioLogC" error:0];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = [@"/var/mobile/Library/BioLogC" stringByAppendingPathComponent:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        v8 = [MEMORY[0x263F08850] defaultManager];
        id v13 = 0;
        char v9 = [v8 removeItemAtPath:v7 error:&v13];
        id v10 = v13;

        if ((v9 & 1) == 0)
        {
          if (__osLog_BioLog) {
            uint64_t v11 = __osLog_BioLog;
          }
          else {
            uint64_t v11 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v19 = v7;
            __int16 v20 = 2112;
            id v21 = v10;
            _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_ERROR, "Could not remove BioLog directory %@: %@\n", buf, 0x16u);
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v4);
  }
}

+ (void)removeDiagnosticLogs
{
  [(id)__removalRequestDate timeIntervalSinceNow];
  if (v3 < -2592000.0)
  {
    [a1 removeDiagnosticLogsImmediately];
  }
}

+ (void)removeBioLogAsync
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [@"/Library/Logs/BioLog" stringByAppendingString:@"_DeleteMe"];
  double v3 = [MEMORY[0x263F08850] defaultManager];
  id v10 = 0;
  int v4 = [v3 moveItemAtPath:@"/Library/Logs/BioLog" toPath:v2 error:&v10];
  id v5 = v10;

  if (v4)
  {
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __27__BioLog_removeBioLogAsync__block_invoke;
    v8[3] = &unk_26466F610;
    id v9 = v2;
    dispatch_async(v6, v8);
  }
  else
  {
    if (__osLog_BioLog) {
      v7 = __osLog_BioLog;
    }
    else {
      v7 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v12 = @"/Library/Logs/BioLog";
      __int16 v13 = 2112;
      long long v14 = v2;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_ERROR, "Could not rename BioLog directory %@ to %@: %@\n", buf, 0x20u);
    }
  }
}

void __27__BioLog_removeBioLogAsync__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0;
  char v4 = [v2 removeItemAtPath:v3 error:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0)
  {
    if (__osLog_BioLog) {
      uint64_t v6 = __osLog_BioLog;
    }
    else {
      uint64_t v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v9 = @"/Library/Logs/BioLog";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_ERROR, "Could not remove BioLog directory %@: %@\n", buf, 0x16u);
    }
  }
}

+ (void)scheduleDiagnosticLogsRemoval
{
  if (__removalRequestDate)
  {
    [a1 removeDiagnosticLogs];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F2AAB8] sharedInstance];
    char v4 = [v3 objectOfClass:objc_opt_class() forKey:@"bioLogRemovalRequestDate"];

    id v5 = (void *)MEMORY[0x263EFF910];
    if (v4)
    {
      [v4 doubleValue];
      uint64_t v6 = [v5 dateWithTimeIntervalSince1970:];
      id v7 = (void *)__removalRequestDate;
      __removalRequestDate = v6;
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263EFF910] date];
      id v9 = (void *)__removalRequestDate;
      __removalRequestDate = v8;

      __int16 v10 = [MEMORY[0x263F2AAB8] sharedInstance];
      id v11 = NSNumber;
      [(id)__removalRequestDate timeIntervalSince1970];
      __int16 v13 = [v11 numberWithUnsignedInteger:(unint64_t)v12];
      [v10 setObject:v13 forKey:@"bioLogRemovalRequestDate"];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __39__BioLog_scheduleDiagnosticLogsRemoval__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __39__BioLog_scheduleDiagnosticLogsRemoval__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:sel_removeDiagnosticLogs withObject:0 afterDelay:2592000.0];
}

+ (void)cancelDiagnosticLogsRemoval
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:a1 selector:sel_scheduleDiagnosticLogsRemoval object:0];
  v2 = (void *)__removalRequestDate;
  __removalRequestDate = 0;

  id v3 = [MEMORY[0x263F2AAB8] sharedInstance];
  [v3 setObject:0 forKey:@"bioLogRemovalRequestDate"];
}

- (id)logNameFromDate:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyy-MM-dd_HH_mm_ss"];
  uint64_t v6 = NSString;
  [v4 timeIntervalSince1970];
  uint64_t v8 = (uint64_t)v7;
  id v9 = [v5 stringFromDate:v4];

  __int16 v10 = [v6 stringWithFormat:@"%s%ld_%@%s", "BL_", v8, v9, &unk_222DFB9BF];

  return v10;
}

- (BOOL)createFileAtPath:(id)a3 contents:(id)a4 attributes:(id)a5 purgeable:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  double v12 = (void *)MEMORY[0x263F08850];
  id v13 = a5;
  long long v14 = [v12 defaultManager];
  int v15 = [v14 createFileAtPath:v10 contents:v11 attributes:v13];

  if (v15)
  {
    if (v6) {
      +[BLRetention setPurgeableAtPath:v10 directory:0];
    }
    self->_retentionNewItemsSize += [v11 length];
  }

  return v15;
}

- (id)logLogContextWithDate:(id)a3
{
  v38[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v37[0] = @"biolog_file_type";
  v37[1] = @"version";
  v38[0] = @"log";
  v38[1] = &unk_26D5C1218;
  v37[2] = @"epoch";
  id v5 = NSNumber;
  [v4 timeIntervalSince1970];
  BOOL v6 = [v5 numberWithDouble:];
  v38[2] = v6;
  v37[3] = @"log_data";
  v35[0] = @"device_serial_number";
  double v7 = +[BLHelper deviceSerialNumber];
  v35[1] = @"system_build_version";
  v36[0] = v7;
  uint64_t v8 = +[BLHelper buildVersion];
  v36[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  v38[3] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];

  uint64_t v11 = MEMORY[0x263EF8438];
  if (__osLog_BioLog) {
    double v12 = __osLog_BioLog;
  }
  else {
    double v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    long long v14 = +[BLHelper deviceSerialNumber];
    *(_DWORD *)buf = 138412290;
    dispatch_queue_t v26 = v14;
    _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_DEFAULT, "logLogContextWithDate device_serial_number %@\n", buf, 0xCu);
  }
  int v15 = [MEMORY[0x263F08900] dataWithJSONObject:v10 options:3 error:0];
  if (!v15)
  {
    uint64_t v23 = (__osLog_BioLog ? __osLog_BioLog : v11);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      dispatch_queue_t v26 = "jsonData";
      __int16 v27 = 2048;
      uint64_t v28 = 0;
      __int16 v29 = 2080;
      v30 = &unk_222DFB9BF;
      __int16 v31 = 2080;
      char v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v33 = 1024;
      int v34 = 312;
      _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  id v16 = NSString;
  [v4 timeIntervalSince1970];
  v18 = [v16 stringWithFormat:@"%s%ld", "BL_", (uint64_t)v17];
  uint64_t v19 = [(NSString *)self->_logPath stringByAppendingPathComponent:v18];
  __int16 v20 = [v19 stringByAppendingString:@".json"];
  BOOL v21 = [(BioLog *)self createFileAtPath:v20 contents:v15 attributes:self->_fileAttributesProtected purgeable:1];

  if (!v21)
  {
    v24 = (__osLog_BioLog ? __osLog_BioLog : v11);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      dispatch_queue_t v26 = "result";
      __int16 v27 = 2048;
      uint64_t v28 = 0;
      __int16 v29 = 2080;
      v30 = &unk_222DFB9BF;
      __int16 v31 = 2080;
      char v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v33 = 1024;
      int v34 = 319;
      _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }

  return v19;
}

- (void)logAllVsAllWithDate:(id)a3
{
  void v65[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_logContextBasePath)
  {
    if (!self->_allVsAllScoreDict)
    {
      id v5 = objc_alloc(MEMORY[0x263EFF9A0]);
      v64[0] = @"all_vs_all_ir";
      v64[1] = @"all_vs_all_depth";
      v65[0] = MEMORY[0x263EFFA68];
      v65[1] = MEMORY[0x263EFFA68];
      BOOL v6 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
      double v7 = (NSMutableDictionary *)[v5 initWithDictionary:v6];
      allVsAllScoreDict = self->_allVsAllScoreDict;
      self->_allVsAllScoreDict = v7;

      id v9 = (NSMutableArray *)objc_opt_new();
      allVsAllLogFileArray = self->_allVsAllLogFileArray;
      self->_allVsAllLogFileArray = v9;
    }
    int v11 = self->_computedSequenceNumberPair[0];
    if (v11 == self->_sequenceNumber) {
      int v11 = self->_computedSequenceNumberPair[1];
    }
    if (v11 != self->_lastComputedSequenceNumber)
    {
      self->_lastComputedSequenceNumber = v11;
      id v12 = objc_alloc(MEMORY[0x263EFF980]);
      id v13 = [(NSMutableDictionary *)self->_allVsAllScoreDict objectForKeyedSubscript:@"all_vs_all_ir"];
      long long v14 = (void *)[v12 initWithArray:v13];

      id v15 = objc_alloc(MEMORY[0x263EFF980]);
      id v16 = [(NSMutableDictionary *)self->_allVsAllScoreDict objectForKeyedSubscript:@"all_vs_all_depth"];
      double v17 = (void *)[v15 initWithArray:v16];

      if ((unint64_t)[v14 count] <= 0x63
        && (unint64_t)[v17 count] <= 0x63
        && (unint64_t)[(NSMutableArray *)self->_scoreDataArray count] <= 0xC7)
      {
        v18 = [(NSMutableArray *)self->_scoreDataArray sortedArrayUsingComparator:&__block_literal_global_0];
        uint64_t v45 = [MEMORY[0x263F08A98] predicateWithFormat:@"isIr == TRUE"];
        v44 = [v18 filteredArrayUsingPredicate:];
        char v43 = -[BioLog computeAllVsAllMatrixFromScoreDataArray:sequenceNumber:](self, "computeAllVsAllMatrixFromScoreDataArray:sequenceNumber:");
        [v14 addObjectsFromArray:];
        uint64_t v47 = v14;
        uint64_t v19 = (void *)[v14 copy];
        [(NSMutableDictionary *)self->_allVsAllScoreDict setObject:v19 forKeyedSubscript:@"all_vs_all_ir"];

        [MEMORY[0x263F08A98] predicateWithFormat:@"isIr == FALSE"];
        v42 = v46 = v18;
        v41 = [v18 filteredArrayUsingPredicate:];
        v40 = -[BioLog computeAllVsAllMatrixFromScoreDataArray:sequenceNumber:](self, "computeAllVsAllMatrixFromScoreDataArray:sequenceNumber:");
        [v17 addObjectsFromArray:];
        __int16 v20 = (void *)[v17 copy];
        [(NSMutableDictionary *)self->_allVsAllScoreDict setObject:v20 forKeyedSubscript:@"all_vs_all_depth"];

        BOOL v21 = (void *)MEMORY[0x263F08900];
        dispatch_queue_t v22 = (void *)[(NSMutableDictionary *)self->_allVsAllScoreDict copy];
        uint64_t v23 = [v21 dataWithJSONObject:v22 options:3 error:0];

        if (!v23)
        {
          v36 = (__osLog_BioLog ? __osLog_BioLog : MEMORY[0x263EF8438]);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            int v55 = "jsonData";
            __int16 v56 = 2048;
            uint64_t v57 = 0;
            __int16 v58 = 2080;
            __int16 v59 = &unk_222DFB9BF;
            __int16 v60 = 2080;
            __int16 v61 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
            __int16 v62 = 1024;
            int v63 = 389;
            _os_log_impl(&dword_222D7E000, v36, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        v24 = NSString;
        logContextBasePath = self->_logContextBasePath;
        [v4 timeIntervalSince1970];
        v38 = [v24 stringWithFormat:@"%@_%ld_all_vs_all%@", logContextBasePath, (uint64_t)(v26 * 1000.0), @".json"];
        char v39 = (void *)v23;
        if (!-[BioLog createFileAtPath:contents:attributes:purgeable:](self, "createFileAtPath:contents:attributes:purgeable:"))
        {
          char v37 = (__osLog_BioLog ? __osLog_BioLog : MEMORY[0x263EF8438]);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            int v55 = "result";
            __int16 v56 = 2048;
            uint64_t v57 = 0;
            __int16 v58 = 2080;
            __int16 v59 = &unk_222DFB9BF;
            __int16 v60 = 2080;
            __int16 v61 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
            __int16 v62 = 1024;
            int v63 = 396;
            _os_log_impl(&dword_222D7E000, v37, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        __int16 v27 = (void *)[(NSMutableArray *)self->_allVsAllLogFileArray copy];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v28 = v27;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v53 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v50 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v49 + 1) + 8 * i);
              int v34 = [MEMORY[0x263F08850] defaultManager];
              id v48 = 0;
              [v34 removeItemAtPath:v33 error:&v48];
              id v35 = v48;

              if (!v35) {
                [(NSMutableArray *)self->_allVsAllLogFileArray removeObject:v33];
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v49 objects:v53 count:16];
          }
          while (v30);
        }

        [(NSMutableArray *)self->_allVsAllLogFileArray addObject:v38];
        long long v14 = v47;
      }
    }
  }
}

uint64_t __30__BioLog_logAllVsAllWithDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  int v6 = [v5 sequenceNumber];
  if (v6 == [v4 sequenceNumber])
  {
    double v7 = [v5 frameNumber];

    uint64_t v8 = [v4 frameNumber];
    uint64_t v9 = [v7 compare:v8];
  }
  else
  {
    unsigned int v10 = [v5 sequenceNumber];

    if (v10 < [v4 sequenceNumber]) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = 1;
    }
  }

  return v9;
}

- (void)setRetentionPolicyLow:(BOOL)a3
{
  self->_retentionLowMode = a3;
}

- (void)applyRetentionPolicy
{
  if ((applyRetentionPolicy_running & 1) == 0)
  {
    retentionQueue = self->_retentionQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__BioLog_applyRetentionPolicy__block_invoke;
    block[3] = &unk_26466F610;
    block[4] = self;
    dispatch_async(retentionQueue, block);
  }
}

void __30__BioLog_applyRetentionPolicy__block_invoke(uint64_t a1)
{
  id v9 = (id)os_transaction_create();
  applyRetentionPolicy_running = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 112) = 1;
  v2 = (void *)MEMORY[0x223CA8CA0]();
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    id v3 = [MEMORY[0x263F2AAB8] sharedInstance];
    id v4 = [v3 numberForKey:@"bioLogRetentionSizeLimit"];

    uint64_t v5 = [v4 unsignedIntegerValue];
    int v6 = [MEMORY[0x263F2AAB8] sharedInstance];
    double v7 = [v6 numberForKey:@"bioLogRetentionDiskSpace"];

    uint64_t v8 = [v7 unsignedIntegerValue];
    if (v7 && ![v7 unsignedIntegerValue]) {
      uint64_t v8 = 1;
    }
    if (!v4 || v5)
    {
      if (!v4 && *(unsigned char *)(*(void *)(a1 + 32) + 113)) {
        uint64_t v5 = 1536;
      }
      [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_applyRetentionPolicy object:0];
      +[BLRetention applyPolicyWithPath:*(void *)(*(void *)(a1 + 32) + 16) sizeLimit:v5 freeSpaceLimit:v8];
      [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_applyRetentionPolicy object:0];
    }
  }
  else
  {
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_applyRetentionPolicy object:0];
    +[BLRetention applyCustomerPolicyWithPath:*(void *)(*(void *)(a1 + 32) + 16)];
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_applyRetentionPolicy object:0];
  }
  applyRetentionPolicy_running = 0;
  *(void *)(*(void *)(a1 + 32) + 104) = 0;
}

- (void)scheduleRetentionPolicy
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_retentionNewItemsSize >> 20;
  if (v3 < 0x401)
  {
    if (v3 > 0x200 || !v2->_retentionRunOnce)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __33__BioLog_scheduleRetentionPolicy__block_invoke;
      block[3] = &unk_26466F610;
      block[4] = v2;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
    [(BioLog *)v2 applyRetentionPolicy];
  }
  objc_sync_exit(v2);
}

uint64_t __33__BioLog_scheduleRetentionPolicy__block_invoke(uint64_t a1)
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_applyRetentionPolicy object:0];
  v2 = *(void **)(a1 + 32);

  return [v2 performSelector:sel_applyRetentionPolicy withObject:0 afterDelay:3.0];
}

- (id)sequencePathForId:(id *)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = self;
  objc_sync_enter(v4);
  unsigned int sequenceNumber = v4->_sequenceNumber;
  unsigned int var1 = a3->var1;
  if (v4->_sequencePath) {
    BOOL v7 = sequenceNumber == var1;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    if (v4->_sequenceType == a3->var2) {
      goto LABEL_26;
    }
  }
  else
  {
    if (sequenceNumber > var1) {
      goto LABEL_10;
    }
    if (sequenceNumber != var1) {
      goto LABEL_15;
    }
  }
  if (v4->_sequenceType != a3->var2)
  {
LABEL_10:
    if (__osLog_BioLog) {
      uint64_t v8 = __osLog_BioLog;
    }
    else {
      uint64_t v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = v4->_sequenceNumber;
      int v10 = a3->var1;
      int sequenceType = v4->_sequenceType;
      int var2 = a3->var2;
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v36 = v9;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = v10;
      LOWORD(v37) = 1024;
      *(_DWORD *)((char *)&v37 + 2) = sequenceType;
      HIWORD(v37) = 1024;
      *(_DWORD *)v38 = var2;
      _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_ERROR, "Unexpected order %d > %d || %d != %d\n", buf, 0x1Au);
    }
  }
LABEL_15:
  id v13 = [MEMORY[0x263F2AAC8] dateFromNanoTime:a3->var0 nanoseconds:0];
  long long v14 = NSString;
  uint64_t v15 = a3->var1;
  [v13 timeIntervalSince1970];
  double v17 = v16;
  v18 = [(NSDateFormatter *)v4->_milisecondsFormatter stringFromDate:v13];
  uint64_t v19 = +[BLHelper stringFromSequenceType:a3->var2];
  __int16 v20 = [v14 stringWithFormat:@"%05d-%ld%@-%@.seq", v15, (uint64_t)v17, v18, v19];

  v4->_int sequenceType = a3->var2;
  v4->_unsigned int sequenceNumber = a3->var1;
  uint64_t v21 = [(NSString *)v4->_logPath stringByAppendingPathComponent:v20];
  sequencePath = v4->_sequencePath;
  v4->_sequencePath = (NSString *)v21;

  uint64_t v23 = [MEMORY[0x263F08850] defaultManager];
  LOBYTE(v19) = [v23 fileExistsAtPath:v4->_sequencePath];

  if ((v19 & 1) == 0)
  {
    v24 = [MEMORY[0x263F08850] defaultManager];
    char v25 = [v24 createDirectoryAtPath:v4->_sequencePath withIntermediateDirectories:1 attributes:v4->_fileAttributes error:0];

    if (v25)
    {
      +[BLRetention setPurgeableAtPath:v4->_sequencePath directory:1];
      double v26 = [(NSString *)v4->_logPath stringByAppendingPathComponent:@"LastSequence"];
      __int16 v27 = [MEMORY[0x263F08850] defaultManager];
      [v27 removeItemAtPath:v26 error:0];

      id v28 = [MEMORY[0x263F08850] defaultManager];
      char v29 = [v28 createSymbolicLinkAtPath:v26 withDestinationPath:v20 error:0];

      if ((v29 & 1) == 0)
      {
        uint64_t v30 = (__osLog_BioLog ? __osLog_BioLog : MEMORY[0x263EF8438]);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222D7E000, v30, OS_LOG_TYPE_ERROR, "Sequence symlink creation failed! Don't thrust 'BioLog/Current/LastSequence'.\n", buf, 2u);
        }
      }
    }
    else
    {
      if (__osLog_BioLog) {
        uint64_t v33 = __osLog_BioLog;
      }
      else {
        uint64_t v33 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v36 = "result";
        *(_WORD *)&v36[8] = 2048;
        uint64_t v37 = 0;
        *(_WORD *)v38 = 2080;
        *(void *)&v38[2] = &unk_222DFB9BF;
        __int16 v39 = 2080;
        v40 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v41 = 1024;
        int v42 = 499;
        _os_log_impl(&dword_222D7E000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      int v34 = v4->_logPath;
      double v26 = v4->_sequencePath;
      v4->_sequencePath = v34;
    }

    if (a3->var2 == 1) {
      +[BLRetention setRetentionType:@"rp_enroll" atPath:v4->_sequencePath];
    }
  }

LABEL_26:
  [(BioLog *)v4 scheduleRetentionPolicy];
  uint64_t v31 = (void *)[(NSString *)v4->_sequencePath copy];
  objc_sync_exit(v4);

  return v31;
}

- (id)sequencePathForId:(id *)a3 andSubdirectory:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(BioLog *)self sequencePathForId:a3];
  uint64_t v8 = [(id)v7 stringByAppendingPathComponent:v6];

  int v9 = [MEMORY[0x263F08850] defaultManager];
  LOBYTE(v7) = [v9 fileExistsAtPath:v8];

  if ((v7 & 1) == 0)
  {
    int v10 = [MEMORY[0x263F08850] defaultManager];
    int v11 = [v10 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:self->_fileAttributes error:0];

    if (v11)
    {
      +[BLRetention setPurgeableAtPath:v8 directory:1];
    }
    else
    {
      id v12 = self->_logPath;

      uint64_t v8 = v12;
    }
  }

  return v8;
}

- (void)logCameraFrame:(id)a3 withBuffers:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = [v8 bytes];
  if (v9)
  {
    uint64_t v10 = v9;
    if ([v8 length] == 71)
    {
      if (*(unsigned char *)(v10 + 69))
      {
        int v11 = [v7 firstObject];
      }
      else
      {
        int v11 = 0;
      }
      if (*(unsigned char *)(v10 + 70))
      {
        id v12 = [v7 lastObject];
      }
      else
      {
        id v12 = 0;
      }
      [(BioLog *)self logCameraFrame:v10 sensorRawData:v11 metaData:v12];

      goto LABEL_10;
    }
    if (__osLog_BioLog) {
      id v13 = __osLog_BioLog;
    }
    else {
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136316162;
      uint64_t v15 = "sizeof(*header) == [headerData length]";
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2080;
      uint64_t v19 = &unk_222DFB9BF;
      __int16 v20 = 2080;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v22 = 1024;
      int v23 = 554;
      goto LABEL_21;
    }
  }
  else
  {
    if (__osLog_BioLog) {
      id v13 = __osLog_BioLog;
    }
    else {
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136316162;
      uint64_t v15 = "header";
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2080;
      uint64_t v19 = &unk_222DFB9BF;
      __int16 v20 = 2080;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v22 = 1024;
      int v23 = 553;
LABEL_21:
      _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
    }
  }
LABEL_10:
}

- (void)logCameraFrame:(id *)a3 sensorRawData:(id)a4 metaData:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if (self->_internal)
  {
    [(BioLog *)self logInternalCameraFrame:a3 sensorRawData:v8 metaData:v9];
    goto LABEL_14;
  }
  if (!self->_cropFrameBuffer)
  {
    uint64_t v10 = (NSMutableData *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:*(unsigned __int16 *)((char *)&a3->var5.var9 + 1)* (unint64_t)*(unsigned __int16 *)((char *)&a3->var5.var9 + 3)];
    cropFrameBuffer = self->_cropFrameBuffer;
    self->_cropFrameBuffer = v10;

    id v12 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    cropFrameBufferSemaphore = self->_cropFrameBufferSemaphore;
    self->_cropFrameBufferSemaphore = v12;

    if (!self->_cropFrameBuffer)
    {
      if (__osLog_BioLog) {
        v36 = __osLog_BioLog;
      }
      else {
        v36 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v43 = "_cropFrameBuffer";
      __int16 v44 = 2048;
      uint64_t v45 = 0;
      __int16 v46 = 2080;
      uint64_t v47 = &unk_222DFB9BF;
      __int16 v48 = 2080;
      long long v49 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v50 = 1024;
      int v51 = 585;
LABEL_38:
      _os_log_impl(&dword_222D7E000, v36, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      goto LABEL_14;
    }
  }
  if (!self->_cropFrameBufferSemaphore)
  {
    if (__osLog_BioLog) {
      v36 = __osLog_BioLog;
    }
    else {
      v36 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v43 = "_cropFrameBufferSemaphore";
    __int16 v44 = 2048;
    uint64_t v45 = 0;
    __int16 v46 = 2080;
    uint64_t v47 = &unk_222DFB9BF;
    __int16 v48 = 2080;
    long long v49 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
    __int16 v50 = 1024;
    int v51 = 586;
    goto LABEL_38;
  }
  if (BYTE2(a3->var5.var8)) {
    goto LABEL_7;
  }
  if (__osLog_BioLog) {
    uint64_t v37 = __osLog_BioLog;
  }
  else {
    uint64_t v37 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v43 = "frameHeader->loggingValid";
    __int16 v44 = 2048;
    uint64_t v45 = 0;
    __int16 v46 = 2080;
    uint64_t v47 = &unk_222DFB9BF;
    __int16 v48 = 2080;
    long long v49 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
    __int16 v50 = 1024;
    int v51 = 588;
    _os_log_impl(&dword_222D7E000, v37, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  if (BYTE2(a3->var5.var8))
  {
LABEL_7:
    if (!*(unsigned int *)((char *)&a3->var5.var7 + 2))
    {
      if (__osLog_BioLog) {
        v38 = __osLog_BioLog;
      }
      else {
        v38 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v43 = "frameHeader->logging.cropScaleFactorDenom != 0";
        __int16 v44 = 2048;
        uint64_t v45 = 0;
        __int16 v46 = 2080;
        uint64_t v47 = &unk_222DFB9BF;
        __int16 v48 = 2080;
        long long v49 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v50 = 1024;
        int v51 = 592;
        _os_log_impl(&dword_222D7E000, v38, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      *(void *)&a3->var5.var6 = 0x100000001;
    }
    scale_rect_from_center_and_pin();
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    unint64_t v22 = stride_of_packed_raw10_minimum(v14, v16, v18);
  }
  else
  {
    unint64_t v22 = 0;
    double v21 = 0.0;
    double v19 = 0.0;
    double v17 = 0.0;
    double v15 = 0.0;
  }
  int v23 = [MEMORY[0x263EFF990] dataWithBytes:a3 length:71];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_cropFrameBufferSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (BYTE2(a3->var5.var8) && *(_WORD *)&a3->var5.var1)
  {
    uint64_t v24 = [v23 bytes];
    double v25 = crop_packed_raw10([v8 bytes], *(unsigned __int16 *)((char *)&a3->var5.var8 + 3), *(unsigned __int16 *)((char *)&a3->var5.var9 + 1), *(unsigned __int16 *)((char *)&a3->var5.var9 + 3), (char *)-[NSMutableData mutableBytes](self->_cropFrameBuffer, "mutableBytes"), v15, v17, v19, v21, v22);
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    char v32 = [[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:-[NSMutableData mutableBytes](self->_cropFrameBuffer, "mutableBytes") length:(unint64_t)(v30 * (double)v22) freeWhenDone:0];
    *(_WORD *)(v24 + 65) = (int)v25;
    *(_WORD *)(v24 + 67) = (int)v27;
    *(_WORD *)(v24 + 59) = (int)v29;
    *(_WORD *)(v24 + 61) = (int)v31;
    *(_WORD *)(v24 + 63) = v22;
  }
  else
  {
    char v32 = 0;
  }
  uint64_t v33 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__BioLog_logCameraFrame_sensorRawData_metaData___block_invoke;
  block[3] = &unk_26466F9A0;
  block[4] = self;
  id v40 = v23;
  id v41 = v32;
  id v34 = v32;
  id v35 = v23;
  dispatch_async(v33, block);

LABEL_14:
}

intptr_t __48__BioLog_logCameraFrame_sensorRawData_metaData___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) logInternalCameraFrame:*(id *)(a1 + 40) bytes:*(void *)(a1 + 48)];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 128);

  return dispatch_semaphore_signal(v2);
}

- (void)logInternalCameraFrame:(id *)a3 sensorRawData:(id)a4 metaData:(id)a5
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x263F2AAC8] dateFromNanoTime:a3->var0.var0 nanoseconds:0];
  int v11 = NSString;
  uint64_t var2 = a3->var0.var2;
  [v10 timeIntervalSince1970];
  uint64_t v14 = (uint64_t)v13;
  double v15 = [(NSDateFormatter *)self->_milisecondsFormatter stringFromDate:v10];
  double v16 = +[BLHelper stringFromFrameType:a3->var0.var5];
  uint64_t v66 = var2;
  double v17 = self;
  double v18 = [v11 stringWithFormat:@"%05d-%ld%@-%@", v66, v14, v15, v16];

  double v19 = [(BioLog *)v17 sequencePathForId:&a3->var0.var6];
  double v20 = v19;
  if (v19)
  {
    double v21 = [v19 stringByAppendingPathComponent:v18];
    if (__osLog_BioLog) {
      unint64_t v22 = __osLog_BioLog;
    }
    else {
      unint64_t v22 = MEMORY[0x263EF8438];
    }
    v83 = v18;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = v21;
      unint64_t var0 = a3->var0.var0;
      double v25 = v22;
      *(_DWORD *)buf = 134218754;
      v95 = (const char *)var0;
      double v21 = v23;
      __int16 v96 = 2048;
      uint64_t v97 = [v8 length];
      __int16 v98 = 2048;
      v99 = (void *)[v9 length];
      __int16 v100 = 2112;
      v101 = (const char *)v23;
      _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_DEFAULT, "logCameraFrame %llu: %lu %lu > %@.prlf(c)/prlm +json\n", buf, 0x2Au);
    }
    if (v8)
    {
      if (logInternalCameraFrame_sensorRawData_metaData__onceToken != -1) {
        dispatch_once(&logInternalCameraFrame_sensorRawData_metaData__onceToken, &__block_literal_global_145);
      }
      double v26 = [v21 stringByAppendingString:logInternalCameraFrame_sensorRawData_metaData__sensorRawExtension];
      BOOL v27 = [(BioLog *)v17 createFileAtPath:v26 contents:v8 attributes:v17->_fileAttributesProtected purgeable:1];

      if (!v27)
      {
        int v63 = (__osLog_BioLog ? __osLog_BioLog : MEMORY[0x263EF8438]);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v95 = "result";
          __int16 v96 = 2048;
          uint64_t v97 = 0;
          __int16 v98 = 2080;
          v99 = &unk_222DFB9BF;
          __int16 v100 = 2080;
          v101 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
          __int16 v102 = 1024;
          int v103 = 670;
          _os_log_impl(&dword_222D7E000, v63, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
    }
    if (v9)
    {
      double v28 = [v21 stringByAppendingString:@".prlm"];
      BOOL v29 = [(BioLog *)v17 createFileAtPath:v28 contents:v9 attributes:v17->_fileAttributesAutoUpload purgeable:1];

      if (!v29)
      {
        v64 = (__osLog_BioLog ? __osLog_BioLog : MEMORY[0x263EF8438]);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v95 = "result";
          __int16 v96 = 2048;
          uint64_t v97 = 0;
          __int16 v98 = 2080;
          v99 = &unk_222DFB9BF;
          __int16 v100 = 2080;
          v101 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
          __int16 v102 = 1024;
          int v103 = 676;
          _os_log_impl(&dword_222D7E000, v64, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
    }
    v84 = v17;
    v73 = (void *)MEMORY[0x263EFF9A0];
    v92[0] = @"seq_type";
    v93[0] = +[BLHelper stringFromSequenceType:a3->var0.var4];
    v92[1] = @"frm_type";
    v77 = +[BLHelper stringFromFrameType:a3->var0.var5];
    v93[1] = v77;
    v92[2] = @"seq_num";
    v75 = [NSNumber numberWithUnsignedShort:a3->var0.var1];
    v93[2] = v75;
    v92[3] = @"frm_num";
    v74 = [NSNumber numberWithUnsignedShort:a3->var0.var2];
    v93[3] = v74;
    v92[4] = @"frm_grp";
    v72 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(&a3->var0.var6.var2 + 1)];
    v93[4] = v72;
    v92[5] = @"raw_compressed";
    v85 = v10;
    v87 = v20;
    v79 = (void *)v93[0];
    v82 = v21;
    if (logInternalCameraFrame_sensorRawData_metaData__rawFramesPacked) {
      [NSNumber numberWithBool:[(id)logInternalCameraFrame_sensorRawData_metaData__rawFramesPacked BOOLValue]];
    }
    else {
    v71 = [MEMORY[0x263EFF9D0] null];
    }
    v93[5] = v71;
    v92[6] = @"raw_size";
    v70 = [NSNumber numberWithUnsignedInteger:[v8 length]];
    v93[6] = v70;
    v92[7] = @"meta_size";
    id v86 = v9;
    v69 = [NSNumber numberWithUnsignedInteger:[v9 length]];
    v93[7] = v69;
    v92[8] = @"frm_cox";
    v68 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(&a3->var6 + 1)];
    v93[8] = v68;
    v92[9] = @"frm_coy";
    v67 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)((char *)&a3->var7 + 1)];
    v93[9] = v67;
    v92[10] = @"frm_width";
    double v30 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)((char *)&a3->var5.var8 + 3)];
    v93[10] = v30;
    v92[11] = @"frm_height";
    double v31 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)((char *)&a3->var5.var9 + 1)];
    v93[11] = v31;
    v92[12] = @"frm_bpr";
    char v32 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)((char *)&a3->var5.var9 + 3)];
    v93[12] = v32;
    v92[13] = @"user_feedback";
    uint64_t v33 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(&a3->var0.var6.var2 + 3)];
    v93[13] = v33;
    v92[14] = @"user_engagement_status";
    id v34 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(&a3->var0.var6.var2 + 5)];
    v93[14] = v34;
    v92[15] = @"proj_type";
    id v35 = [NSNumber numberWithUnsignedChar:HIBYTE(a3->var1)];
    v93[15] = v35;
    v36 = [NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:16];
    uint64_t v37 = [v73 dictionaryWithDictionary:v36];

    if (BYTE2(a3->var5.var8))
    {
      if (!*(unsigned int *)((char *)&a3->var5.var7 + 2))
      {
        if (__osLog_BioLog) {
          v65 = __osLog_BioLog;
        }
        else {
          v65 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v95 = "frameHeader->logging.cropScaleFactorDenom != 0";
          __int16 v96 = 2048;
          uint64_t v97 = 0;
          __int16 v98 = 2080;
          v99 = &unk_222DFB9BF;
          __int16 v100 = 2080;
          v101 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
          __int16 v102 = 1024;
          int v103 = 703;
          _os_log_impl(&dword_222D7E000, v65, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        *(void *)&a3->var5.var6 = 0x100000001;
      }
      v90[0] = @"exposure";
      v80 = [NSNumber numberWithUnsignedInt:*(unsigned int *)&a3->var5.var4];
      v91[0] = v80;
      v90[1] = @"proj_sub_mode";
      v78 = [NSNumber numberWithUnsignedChar:LOBYTE(a3->var3)];
      v91[1] = v78;
      v90[2] = @"ntc_temp";
      v76 = [NSNumber numberWithChar:SHIBYTE(a3->var3)];
      v91[2] = v76;
      v90[3] = @"distance";
      v38 = [NSNumber numberWithUnsignedShort:a3->var2];
      v91[3] = v38;
      v90[4] = @"crop_factor";
      LODWORD(v39) = *(_DWORD *)&a3->var5.var6;
      LODWORD(v40) = *(unsigned int *)((char *)&a3->var5.var7 + 2);
      id v41 = [NSNumber numberWithDouble:(double)v39 / (double)v40];
      v91[4] = v41;
      v90[5] = @"bb_x";
      int v42 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)&a3->var4];
      v91[5] = v42;
      v90[6] = @"bb_y";
      uint64_t v43 = [NSNumber numberWithUnsignedShort:a3->var5.var0];
      v91[6] = v43;
      v90[7] = @"bb_w";
      __int16 v44 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)&a3->var5.var1];
      v91[7] = v44;
      v90[8] = @"bb_h";
      uint64_t v45 = [NSNumber numberWithUnsignedShort:a3->var5.var3];
      v91[8] = v45;
      __int16 v46 = [NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:9];
      [v37 addEntriesFromDictionary:v46];
    }
    v88[0] = @"biolog_file_type";
    v88[1] = @"version";
    v89[0] = @"frame";
    v89[1] = &unk_26D5C1218;
    v88[2] = @"nanoepoch";
    uint64_t v47 = [NSNumber numberWithUnsignedLongLong:a3->var0.var0];
    v89[2] = v47;
    v88[3] = @"epoch";
    __int16 v48 = NSNumber;
    uint64_t v10 = v85;
    [v85 timeIntervalSince1970];
    long long v49 = [v48 numberWithDouble:];
    v88[4] = @"frm_data";
    v89[3] = v49;
    v89[4] = v37;
    v81 = v37;
    __int16 v50 = [NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:5];

    int v51 = [MEMORY[0x263F08900] dataWithJSONObject:v50 options:3 error:0];
    if (!v51)
    {
      __int16 v61 = (__osLog_BioLog ? __osLog_BioLog : MEMORY[0x263EF8438]);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v95 = "jsonData";
        __int16 v96 = 2048;
        uint64_t v97 = 0;
        __int16 v98 = 2080;
        v99 = &unk_222DFB9BF;
        __int16 v100 = 2080;
        v101 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v102 = 1024;
        int v103 = 728;
        _os_log_impl(&dword_222D7E000, v61, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    uint64_t v52 = NSString;
    uint64_t v53 = a3->var0.var2;
    [v85 timeIntervalSince1970];
    uint64_t v55 = (uint64_t)v54;
    __int16 v56 = [(NSDateFormatter *)v84->_milisecondsFormatter stringFromDate:v85];
    uint64_t v57 = [v52 stringWithFormat:@"%05d-%ld%@", v53, v55, v56];

    __int16 v58 = [v87 stringByAppendingPathComponent:v57];

    __int16 v59 = [v58 stringByAppendingString:@".json"];
    LOBYTE(v55) = [(BioLog *)v84 createFileAtPath:v59 contents:v51 attributes:v84->_fileAttributesProtected purgeable:1];

    id v9 = v86;
    if ((v55 & 1) == 0)
    {
      if (__osLog_BioLog) {
        __int16 v62 = __osLog_BioLog;
      }
      else {
        __int16 v62 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v95 = "result";
        __int16 v96 = 2048;
        uint64_t v97 = 0;
        __int16 v98 = 2080;
        v99 = &unk_222DFB9BF;
        __int16 v100 = 2080;
        v101 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v102 = 1024;
        int v103 = 735;
        _os_log_impl(&dword_222D7E000, v62, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }

    double v18 = (void *)v57;
    double v20 = v87;
  }
  else
  {
    if (__osLog_BioLog) {
      __int16 v60 = __osLog_BioLog;
    }
    else {
      __int16 v60 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v95 = "sequencePath";
      __int16 v96 = 2048;
      uint64_t v97 = 0;
      __int16 v98 = 2080;
      v99 = &unk_222DFB9BF;
      __int16 v100 = 2080;
      v101 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v102 = 1024;
      int v103 = 650;
      _os_log_impl(&dword_222D7E000, v60, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
}

void __56__BioLog_logInternalCameraFrame_sensorRawData_metaData___block_invoke()
{
  uint64_t v0 = +[BLHelper numberForBootArg:@"camPearlPackedRaw"];
  v1 = (void *)logInternalCameraFrame_sensorRawData_metaData__rawFramesPacked;
  logInternalCameraFrame_sensorRawData_metaData__rawFramesPacked = v0;

  v2 = (void *)logInternalCameraFrame_sensorRawData_metaData__rawFramesPacked;
  if (!logInternalCameraFrame_sensorRawData_metaData__rawFramesPacked)
  {
    logInternalCameraFrame_sensorRawData_metaData__rawFramesPacked = MEMORY[0x263EFFA88];

    v2 = (void *)logInternalCameraFrame_sensorRawData_metaData__rawFramesPacked;
  }
  if (([v2 BOOLValue] & 1) == 0)
  {
    unint64_t v3 = (void *)logInternalCameraFrame_sensorRawData_metaData__sensorRawExtension;
    logInternalCameraFrame_sensorRawData_metaData__sensorRawExtension = @".prlf";
  }
}

- (void)logFrameDebug:(id)a3 withBuffer:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!self->_internal)
  {
    if (__osLog_BioLog) {
      char v32 = __osLog_BioLog;
    }
    else {
      char v32 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_DWORD *)buf = 136316162;
    v36 = "_internal";
    __int16 v37 = 2048;
    uint64_t v38 = 0;
    __int16 v39 = 2080;
    unint64_t v40 = &unk_222DFB9BF;
    __int16 v41 = 2080;
    int v42 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
    __int16 v43 = 1024;
    int v44 = 749;
    goto LABEL_33;
  }
  id v8 = v6;
  uint64_t v9 = [v8 bytes];
  if (!v9)
  {
    if (__osLog_BioLog) {
      char v32 = __osLog_BioLog;
    }
    else {
      char v32 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_DWORD *)buf = 136316162;
    v36 = "frameHeader";
    __int16 v37 = 2048;
    uint64_t v38 = 0;
    __int16 v39 = 2080;
    unint64_t v40 = &unk_222DFB9BF;
    __int16 v41 = 2080;
    int v42 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
    __int16 v43 = 1024;
    int v44 = 752;
    goto LABEL_33;
  }
  uint64_t v10 = v9;
  if ([v8 length] != 27)
  {
    if (__osLog_BioLog) {
      char v32 = __osLog_BioLog;
    }
    else {
      char v32 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_DWORD *)buf = 136316162;
    v36 = "sizeof(*frameHeader) == [headerData length]";
    __int16 v37 = 2048;
    uint64_t v38 = 0;
    __int16 v39 = 2080;
    unint64_t v40 = &unk_222DFB9BF;
    __int16 v41 = 2080;
    int v42 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
    __int16 v43 = 1024;
    int v44 = 753;
LABEL_33:
    _os_log_impl(&dword_222D7E000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_34:
    id v12 = 0;
    int v23 = 0;
    double v21 = 0;
    uint64_t v14 = 0;
    goto LABEL_17;
  }
  id v34 = v6;
  if (*(unsigned char *)(v10 + 14) == 2)
  {
    id v11 = [[BLScoreData alloc] initFromDebugData:v7];
    id v12 = v11;
    if (v11)
    {
      [v11 setSequenceNumber:*(unsigned __int16 *)(v10 + 8)];
      [(NSMutableArray *)self->_scoreDataArray addObject:v12];
      int v13 = self->_computedSequenceNumberPair[0];
      if (v13 != *(unsigned __int16 *)(v10 + 8))
      {
        self->_computedSequenceNumberPair[1] = v13;
        self->_computedSequenceNumberPair[0] = *(_WORD *)(v10 + 8);
      }
    }
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v14 = [MEMORY[0x263F2AAC8] dateFromNanoTime:*(void *)v10 nanoseconds:0];
  double v15 = NSString;
  uint64_t v16 = *(unsigned __int16 *)(v10 + 10);
  [v14 timeIntervalSince1970];
  uint64_t v18 = (uint64_t)v17;
  double v19 = [(NSDateFormatter *)self->_milisecondsFormatter stringFromDate:v14];
  double v20 = +[BLHelper stringFromFrameType:*(unsigned __int8 *)(v10 + 15)];
  double v21 = [v15 stringWithFormat:@"%05d-%ld%@-%@", v16, v18, v19, v20];

  unint64_t v22 = [(BioLog *)self sequencePathForId:v10 + 16];
  int v23 = [v22 stringByAppendingPathComponent:v21];

  uint64_t v24 = MEMORY[0x263EF8438];
  if (__osLog_BioLog) {
    double v25 = __osLog_BioLog;
  }
  else {
    double v25 = MEMORY[0x263EF8438];
  }
  if (v23)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      double v26 = v24;
      BOOL v27 = v12;
      double v28 = *(const char **)v10;
      BOOL v29 = v25;
      *(_DWORD *)buf = 134218754;
      v36 = v28;
      id v12 = v27;
      uint64_t v24 = v26;
      __int16 v37 = 2048;
      uint64_t v38 = [v7 length];
      __int16 v39 = 2112;
      unint64_t v40 = v23;
      __int16 v41 = 2080;
      int v42 = ".prle";
      _os_log_impl(&dword_222D7E000, v29, OS_LOG_TYPE_DEFAULT, "logFrameDebug %llu: %lu > %@%s\n", buf, 0x2Au);
    }
    double v30 = [v23 stringByAppendingString:@".prle"];
    BOOL v31 = [(BioLog *)self createFileAtPath:v30 contents:v7 attributes:self->_fileAttributesAutoUpload purgeable:1];

    if (!v31)
    {
      if (__osLog_BioLog) {
        uint64_t v33 = __osLog_BioLog;
      }
      else {
        uint64_t v33 = v24;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v36 = "result";
        __int16 v37 = 2048;
        uint64_t v38 = 0;
        __int16 v39 = 2080;
        unint64_t v40 = &unk_222DFB9BF;
        __int16 v41 = 2080;
        int v42 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v43 = 1024;
        int v44 = 776;
        _os_log_impl(&dword_222D7E000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v36 = "filePath";
      __int16 v37 = 2048;
      uint64_t v38 = 0;
      __int16 v39 = 2080;
      unint64_t v40 = &unk_222DFB9BF;
      __int16 v41 = 2080;
      int v42 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v43 = 1024;
      int v44 = 772;
      _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v23 = 0;
  }
  id v6 = v34;
LABEL_17:
}

- (void)logData:(id)a3 withContext:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_internal)
  {
    id v7 = [MEMORY[0x263F2AAC8] dateFromNanoTime:a4->var0 nanoseconds:0];
    id v8 = NSString;
    [v7 timeIntervalSince1970];
    uint64_t v10 = (uint64_t)v9;
    id v11 = [(NSDateFormatter *)self->_milisecondsFormatter stringFromDate:v7];
    id v12 = [v8 stringWithFormat:@"Data_%ld%@.dmp", v10, v11];

    if (a4->var2.var0)
    {
      int v13 = [(BioLog *)self sequencePathForId:&a4->var2];
    }
    else
    {
      int v13 = self->_logPath;
    }
    uint64_t v14 = v13;
    uint64_t v15 = [(NSString *)v13 stringByAppendingPathComponent:v12];
    uint64_t v16 = MEMORY[0x263EF8438];
    if (__osLog_BioLog) {
      double v17 = __osLog_BioLog;
    }
    else {
      double v17 = MEMORY[0x263EF8438];
    }
    if (v15)
    {
      uint64_t v18 = (void *)v15;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t var0 = a4->var0;
        double v20 = v17;
        uint64_t v21 = [v6 length];
        *(_DWORD *)buf = 134218498;
        double v25 = (const char *)var0;
        uint64_t v16 = MEMORY[0x263EF8438];
        __int16 v26 = 2048;
        uint64_t v27 = v21;
        __int16 v28 = 2112;
        BOOL v29 = v18;
        _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_DEFAULT, "logData %llu: %lu > %@\n", buf, 0x20u);
      }
      if (![(BioLog *)self createFileAtPath:v18 contents:v6 attributes:self->_fileAttributesProtected purgeable:1])
      {
        if (__osLog_BioLog) {
          int v23 = __osLog_BioLog;
        }
        else {
          int v23 = v16;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          double v25 = "result";
          __int16 v26 = 2048;
          uint64_t v27 = 0;
          __int16 v28 = 2080;
          BOOL v29 = &unk_222DFB9BF;
          __int16 v30 = 2080;
          BOOL v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
          __int16 v32 = 1024;
          int v33 = 808;
          _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        double v25 = "filePath";
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        BOOL v29 = &unk_222DFB9BF;
        __int16 v30 = 2080;
        BOOL v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v32 = 1024;
        int v33 = 804;
        _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v18 = 0;
    }
  }
  else
  {
    if (__osLog_BioLog) {
      unint64_t v22 = __osLog_BioLog;
    }
    else {
      unint64_t v22 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      double v25 = "_internal";
      __int16 v26 = 2048;
      uint64_t v27 = 0;
      __int16 v28 = 2080;
      BOOL v29 = &unk_222DFB9BF;
      __int16 v30 = 2080;
      BOOL v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v32 = 1024;
      int v33 = 788;
      _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v18 = 0;
    uint64_t v14 = 0;
    id v12 = 0;
    id v7 = 0;
  }
}

- (void)logTemplate:(id)a3 withSequenceNumber:(unsigned __int16)a4 date:(id)a5 index:(unsigned __int8)a6 toPath:(id)a7 isPO:(BOOL)a8
{
  BOOL v8 = a8;
  unsigned int v10 = a6;
  unsigned int v12 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  double v17 = NSString;
  [v15 timeIntervalSince1970];
  uint64_t v19 = (uint64_t)v18;
  uint64_t v20 = [(NSDateFormatter *)self->_milisecondsFormatter stringFromDate:v15];
  uint64_t v21 = (void *)v20;
  if (v8) {
    unint64_t v22 = @"templ-po-%05d-%ld%@-%u";
  }
  else {
    unint64_t v22 = @"templ-%05d-%ld%@-%u";
  }
  int v23 = [v17 stringWithFormat:v22, v12, v19, v20, v10];

  uint64_t v24 = [v16 stringByAppendingPathComponent:v23];
  double v25 = MEMORY[0x263EF8438];
  if (__osLog_BioLog) {
    __int16 v26 = __osLog_BioLog;
  }
  else {
    __int16 v26 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = v26;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)__int16 v32 = v10;
    *(_WORD *)&v32[4] = 2048;
    *(void *)&v32[6] = [v14 length];
    *(_WORD *)&v32[14] = 2112;
    *(void *)&v32[16] = v24;
    *(_WORD *)&v32[24] = 2080;
    *(void *)&v32[26] = ".tpl";
    _os_log_impl(&dword_222D7E000, v27, OS_LOG_TYPE_DEFAULT, "logTemplate #%u: %lu > %@%s\n", buf, 0x26u);
  }
  __int16 v28 = [v24 stringByAppendingString:@".tpl"];
  BOOL v29 = [(BioLog *)self createFileAtPath:v28 contents:v14 attributes:self->_fileAttributesProtected purgeable:1];

  if (!v29)
  {
    if (__osLog_BioLog) {
      __int16 v30 = __osLog_BioLog;
    }
    else {
      __int16 v30 = v25;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v32 = "result";
      *(_WORD *)&v32[8] = 2048;
      *(void *)&v32[10] = 0;
      *(_WORD *)&v32[18] = 2080;
      *(void *)&v32[20] = &unk_222DFB9BF;
      *(_WORD *)&v32[28] = 2080;
      *(void *)&v32[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v33 = 1024;
      int v34 = 832;
      _os_log_impl(&dword_222D7E000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
}

- (void)logTemplateList:(id)a3 withTemplateSize:(unint64_t)a4 sequenceNumber:(unsigned __int16)a5 date:(id)a6 toPath:(id)a7 isPO:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v11 = a5;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  if ([v14 length] && objc_msgSend(v14, "length") >= a4)
  {
    if (v16)
    {
      if ([v14 length] >= a4)
      {
        uint64_t v17 = 0;
        unint64_t v18 = 0;
        do
        {
          uint64_t v19 = [v14 subdataWithRange:v17, a4];
          [(BioLog *)self logTemplate:v19 withSequenceNumber:v11 date:v15 index:v18 toPath:v16 isPO:v8];

          ++v18;
          v17 += a4;
        }
        while (v18 < [v14 length] / a4);
      }
      goto LABEL_7;
    }
    if (__osLog_BioLog) {
      double v25 = __osLog_BioLog;
    }
    else {
      double v25 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136316162;
      uint64_t v27 = "path";
      __int16 v28 = 2048;
      uint64_t v29 = 0;
      __int16 v30 = 2080;
      BOOL v31 = &unk_222DFB9BF;
      __int16 v32 = 2080;
      __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v34 = 1024;
      int v35 = 838;
      uint64_t v21 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
      unint64_t v22 = v25;
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      uint32_t v24 = 48;
      goto LABEL_18;
    }
  }
  else
  {
    if (__osLog_BioLog) {
      uint64_t v20 = __osLog_BioLog;
    }
    else {
      uint64_t v20 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      uint64_t v21 = "logTemplateList: No templates.\n";
      unint64_t v22 = v20;
      os_log_type_t v23 = OS_LOG_TYPE_INFO;
      uint32_t v24 = 2;
LABEL_18:
      _os_log_impl(&dword_222D7E000, v22, v23, v21, (uint8_t *)&v26, v24);
    }
  }
LABEL_7:
}

- (void)logTemplateList:(id)a3 withContext:(id *)a4 isPO:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (self->_internal)
  {
    double v9 = [MEMORY[0x263F2AAC8] dateFromNanoTime:a4->var0 nanoseconds:0];
    uint64_t v10 = [(BioLog *)self sequencePathForId:&a4->var2];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      [(BioLog *)self logTemplateList:v8 withTemplateSize:a4->var1 sequenceNumber:a4->var2.var1 date:v9 toPath:v10 isPO:v5];
    }
    else
    {
      if (__osLog_BioLog) {
        int v13 = __osLog_BioLog;
      }
      else {
        int v13 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136316162;
        id v15 = "sequencePath";
        __int16 v16 = 2048;
        uint64_t v17 = 0;
        __int16 v18 = 2080;
        uint64_t v19 = &unk_222DFB9BF;
        __int16 v20 = 2080;
        uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v22 = 1024;
        int v23 = 857;
        _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog_BioLog) {
      unsigned int v12 = __osLog_BioLog;
    }
    else {
      unsigned int v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136316162;
      id v15 = "_internal";
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2080;
      uint64_t v19 = &unk_222DFB9BF;
      __int16 v20 = 2080;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v22 = 1024;
      int v23 = 852;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
    }
  }
}

- (void)logTemplate:(id)a3 withContext:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_internal)
  {
    id v7 = [MEMORY[0x263F2AAC8] dateFromNanoTime:a4->var0 nanoseconds:0];
    id v8 = NSString;
    uint64_t var1 = a4->var2.var1;
    [v7 timeIntervalSince1970];
    uint64_t v11 = (uint64_t)v10;
    unsigned int v12 = [(NSDateFormatter *)self->_milisecondsFormatter stringFromDate:v7];
    int v13 = [v8 stringWithFormat:@"templ-%05d-%ld%@", var1, v11, v12];

    int v14 = [(BioLog *)self sequencePathForId:&a4->var2];
    id v15 = [v14 stringByAppendingPathComponent:v13];

    __int16 v16 = MEMORY[0x263EF8438];
    if (__osLog_BioLog) {
      uint64_t v17 = __osLog_BioLog;
    }
    else {
      uint64_t v17 = MEMORY[0x263EF8438];
    }
    if (v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t var0 = a4->var0;
        uint64_t v19 = v17;
        *(_DWORD *)buf = 134218754;
        double v25 = (const char *)var0;
        __int16 v26 = 2048;
        uint64_t v27 = [v6 length];
        __int16 v28 = 2112;
        uint64_t v29 = v15;
        __int16 v30 = 2080;
        BOOL v31 = ".tpl";
        _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_DEFAULT, "logTemplate %llu: %lu > %@%s\n", buf, 0x2Au);
      }
      __int16 v20 = [v15 stringByAppendingString:@".tpl"];
      BOOL v21 = [(BioLog *)self createFileAtPath:v20 contents:v6 attributes:self->_fileAttributesProtected purgeable:1];

      if (!v21)
      {
        if (__osLog_BioLog) {
          int v23 = __osLog_BioLog;
        }
        else {
          int v23 = v16;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          double v25 = "result";
          __int16 v26 = 2048;
          uint64_t v27 = 0;
          __int16 v28 = 2080;
          uint64_t v29 = &unk_222DFB9BF;
          __int16 v30 = 2080;
          BOOL v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
          __int16 v32 = 1024;
          int v33 = 881;
          _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        double v25 = "filePath";
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        uint64_t v29 = &unk_222DFB9BF;
        __int16 v30 = 2080;
        BOOL v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v32 = 1024;
        int v33 = 877;
        _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v15 = 0;
    }
  }
  else
  {
    if (__osLog_BioLog) {
      __int16 v22 = __osLog_BioLog;
    }
    else {
      __int16 v22 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      double v25 = "_internal";
      __int16 v26 = 2048;
      uint64_t v27 = 0;
      __int16 v28 = 2080;
      uint64_t v29 = &unk_222DFB9BF;
      __int16 v30 = 2080;
      BOOL v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v32 = 1024;
      int v33 = 870;
      _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v15 = 0;
    int v13 = 0;
    id v7 = 0;
  }
}

- (void)logSequenceInfo:(id)a3 withContext:(id *)a4 orientation:(id *)a5 identities:(id)a6
{
  uint64_t v363 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v307 = a6;
  if (!logSequenceInfo_withContext_orientation_identities__lastSequenceName)
  {
    uint64_t v11 = [MEMORY[0x263EFF9D0] null];
    unsigned int v12 = (void *)logSequenceInfo_withContext_orientation_identities__lastSequenceName;
    logSequenceInfo_withContext_orientation_identities__lastSequenceName = v11;
  }
  int v13 = [MEMORY[0x263EFF9D0] null];
  id v14 = v10;
  uint64_t v15 = [v14 bytes];
  if (!v15)
  {
    if (__osLog_BioLog) {
      v214 = __osLog_BioLog;
    }
    else {
      v214 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v214, OS_LOG_TYPE_ERROR)) {
      goto LABEL_136;
    }
    *(_DWORD *)buf = 136316162;
    v355 = "sequenceInfo";
    __int16 v356 = 2048;
    uint64_t v357 = 0;
    __int16 v358 = 2080;
    v359 = &unk_222DFB9BF;
    __int16 v360 = 2080;
    *(void *)v361 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
    *(_WORD *)&v361[8] = 1024;
    int v362 = 898;
LABEL_152:
    _os_log_impl(&dword_222D7E000, v214, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_136;
  }
  if (!a4)
  {
    if (__osLog_BioLog) {
      v214 = __osLog_BioLog;
    }
    else {
      v214 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v214, OS_LOG_TYPE_ERROR)) {
      goto LABEL_136;
    }
    *(_DWORD *)buf = 136316162;
    v355 = "context";
    __int16 v356 = 2048;
    uint64_t v357 = 0;
    __int16 v358 = 2080;
    v359 = &unk_222DFB9BF;
    __int16 v360 = 2080;
    *(void *)v361 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
    *(_WORD *)&v361[8] = 1024;
    int v362 = 899;
    goto LABEL_152;
  }
  if (a5)
  {
    uint64_t v16 = v15;
    v279 = a4;
    uint64_t v17 = v15 + 4;
    v304 = [MEMORY[0x263F2AAC8] dateFromNanoTime:*(void *)(v15 + 4) nanoseconds:0];
    unint64_t v18 = 0x26466F000uLL;
    uint64_t v308 = v16;
    if (!*(unsigned char *)v16)
    {
      v285 = 0;
      int v301 = 0;
      BOOL v278 = 0;
      goto LABEL_107;
    }
    if (!self->_internal && *(unsigned char *)(v16 + 1))
    {
      v219 = (void *)__osLog_BioLog;
      if (!__osLog_BioLog) {
        v219 = (void *)MEMORY[0x263EF8438];
      }
      v220 = v219;
      if (os_log_type_enabled(v220, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v355 = "!sequenceInfo->internal";
        __int16 v356 = 2048;
        uint64_t v357 = 0;
        __int16 v358 = 2080;
        v359 = &unk_222DFB9BF;
        __int16 v360 = 2080;
        *(void *)v361 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        *(_WORD *)&v361[8] = 1024;
        int v362 = 910;
        _os_log_impl(&dword_222D7E000, v220, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      *(unsigned char *)(v16 + 1) = 0;
    }
    id v261 = v14;
    uint64_t v280 = v16 + 4;
    v281 = self;
    v305 = v13;
    uint64_t v288 = +[BLHelper numberFromDouble:a5->var1];
    v296 = +[BLHelper numberFromDouble:a5->var2];
    uint64_t v297 = +[BLHelper numberFromDouble:a5->var3];
    v295 = +[BLHelper numberFromDouble:a5->var4.var0];
    v294 = +[BLHelper numberFromDouble:a5->var4.var1];
    uint64_t v19 = +[BLHelper numberFromDouble:a5->var4.var2];
    v293 = +[BLHelper numberFromDouble:a5->var5.var0];
    v292 = +[BLHelper numberFromDouble:a5->var5.var1];
    v291 = +[BLHelper numberFromDouble:a5->var5.var2];
    v290 = +[BLHelper numberFromDouble:a5->var6.var0];
    v289 = +[BLHelper numberFromDouble:a5->var6.var1];
    uint64_t v20 = +[BLHelper numberFromDouble:a5->var6.var2];
    v282 = (void *)MEMORY[0x263EFF9A0];
    v352[0] = @"system_build_version";
    v309 = +[BLHelper buildVersion];
    v353[0] = v309;
    v352[1] = @"internal";
    v300 = [NSNumber numberWithBool:*(unsigned char *)(v16 + 1) != 0];
    v353[1] = v300;
    v352[2] = @"canceled";
    v298 = [NSNumber numberWithBool:*(unsigned char *)(v16 + 2) != 0];
    v353[2] = v298;
    v352[3] = @"failure";
    v284 = [NSNumber numberWithBool:*(_DWORD *)(v16 + 23) != 0];
    v353[3] = v284;
    v352[4] = @"failure_reason";
    v277 = [NSNumber numberWithInt:*(unsigned int *)(v16 + 23)];
    v353[4] = v277;
    v352[5] = @"total_frame_count";
    v273 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v16 + 15)];
    v353[5] = v273;
    v352[6] = @"frames_processed";
    v270 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v16 + 17)];
    v353[6] = v270;
    v352[7] = @"frames_for_logging";
    v267 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v16 + 19)];
    v353[7] = v267;
    v352[8] = @"frames_logged";
    v264 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v16 + 21)];
    v353[8] = v264;
    v352[9] = @"sensor_temperature";
    BOOL v21 = [NSNumber numberWithInt:*(unsigned int *)(v16 + 35)];
    v353[9] = v21;
    v352[10] = @"ambient_lux";
    __int16 v22 = [NSNumber numberWithInt:*(unsigned int *)(v16 + 39)];
    v353[10] = v22;
    v352[11] = @"secure_face_detect_mode";
    int v23 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v16 + 43)];
    v353[11] = v23;
    v352[12] = @"final_orientation";
    uint64_t v24 = [NSNumber numberWithUnsignedLong:a5->var0];
    v353[12] = v24;
    v352[13] = @"final_attitude";
    v350[0] = @"device_roll";
    v350[1] = @"device_pitch";
    v351[0] = v288;
    v351[1] = v296;
    v350[2] = @"device_yaw";
    v351[2] = v297;
    double v25 = [NSDictionary dictionaryWithObjects:v351 forKeys:v350 count:3];
    v353[13] = v25;
    v352[14] = @"final_rotation_rate";
    v348[0] = @"device_rotation_x";
    v348[1] = @"device_rotation_y";
    v349[0] = v295;
    v349[1] = v294;
    v348[2] = @"device_rotation_z";
    v260 = (void *)v19;
    v349[2] = v19;
    __int16 v26 = [NSDictionary dictionaryWithObjects:v349 forKeys:v348 count:3];
    v353[14] = v26;
    v352[15] = @"final_acceleration";
    v346[0] = @"device_acceleration_x";
    v346[1] = @"device_acceleration_y";
    v347[0] = v293;
    v347[1] = v292;
    v346[2] = @"device_acceleration_z";
    v347[2] = v291;
    uint64_t v27 = [NSDictionary dictionaryWithObjects:v347 forKeys:v346 count:3];
    v353[15] = v27;
    v352[16] = @"final_gravity";
    v344[0] = @"device_gravity_x";
    v344[1] = @"device_gravity_y";
    v345[0] = v290;
    v345[1] = v289;
    v344[2] = @"device_gravity_z";
    v259 = (void *)v20;
    v345[2] = v20;
    __int16 v28 = [NSDictionary dictionaryWithObjects:v345 forKeys:v344 count:3];
    v353[16] = v28;
    uint64_t v29 = [NSDictionary dictionaryWithObjects:v353 forKeys:v352 count:17];
    v276 = [v282 dictionaryWithDictionary:v29];

    uint64_t v16 = v308;
    BOOL v30 = *(unsigned char *)(v308 + 2) != 0;
    if (*(unsigned char *)(v308 + 44))
    {
      BOOL v31 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v308 + 45];
      __int16 v32 = [v31 UUIDString];
    }
    else
    {
      __int16 v32 = [MEMORY[0x263EFF9D0] null];
    }
    int v33 = v305;
    int v34 = *(unsigned __int8 *)(v308 + 14);
    uint64_t v17 = v280;
    self = v281;
    unint64_t v18 = 0x26466F000;
    BOOL v278 = v30;
    if (v34 == 1)
    {
      v324[0] = @"enroll";
      v323[0] = @"seq_type";
      v323[1] = @"enroll_result";
      v257 = v32;
      v310 = [NSNumber numberWithBool:*(unsigned char *)(v308 + 65) != 0];
      v324[1] = v310;
      v324[2] = v32;
      v323[2] = @"enroll_identity_uuid";
      v323[3] = @"enroll_user_id";
      uint64_t v36 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v308 + 61)];
      v324[3] = v36;
      v323[4] = @"enroll_identity_augmented";
      __int16 v37 = [NSNumber numberWithBool:*(unsigned char *)(v308 + 68) != 0];
      v324[4] = v37;
      v323[5] = @"enroll_frames_num";
      uint64_t v38 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v308 + 66)];
      v324[5] = v38;
      __int16 v39 = [NSDictionary dictionaryWithObjects:v324 forKeys:v323 count:6];
      int v44 = v276;
      [v276 addEntriesFromDictionary:v39];

      int v33 = v305;
      __int16 v32 = v257;

      int v301 = 0;
      if (*(unsigned char *)(v308 + 65)) {
        unint64_t v40 = @"rp_enroll";
      }
      else {
        unint64_t v40 = @"rp_none";
      }
      v285 = v40;
LABEL_25:
      uint64_t v45 = (void *)v288;
      __int16 v46 = (void *)v297;
LABEL_106:
      id v173 = v44;

      int v13 = v173;
      id v14 = v261;
LABEL_107:
      v319[0] = @"biolog_file_type";
      v319[1] = @"version";
      v320[0] = @"sequence";
      v320[1] = &unk_26D5C1230;
      v319[2] = @"nanoepoch";
      v174 = [NSNumber numberWithUnsignedLongLong:*(void *)(v16 + 4)];
      v320[2] = v174;
      v319[3] = @"epoch";
      v175 = *(void **)(v18 + 832);
      [v304 timeIntervalSince1970];
      v176 = [v175 numberFromDouble:x0];
      v320[3] = v176;
      v306 = v13;
      v320[4] = v13;
      v319[4] = @"seq_data";
      v319[5] = @"battery_level";
      v177 = [*(id *)(v18 + 832) deviceBatteryLevel];
      v320[5] = v177;
      v178 = [NSDictionary dictionaryWithObjects:v320 forKeys:v319 count:6];

      v179 = NSString;
      uint64_t v180 = *(unsigned __int16 *)(v16 + 12);
      [v304 timeIntervalSince1970];
      uint64_t v182 = (uint64_t)v181;
      v183 = [(NSDateFormatter *)self->_milisecondsFormatter stringFromDate:v304];
      v184 = [v179 stringWithFormat:@"seq-%05d-%ld%@", v180, v182, v183];

      if (v184)
      {
        v185 = [(BioLog *)self sequencePathForId:v17];
        if (v185)
        {
          id v186 = v185;
          uint64_t v187 = [v185 lastPathComponent];
          v188 = (void *)logSequenceInfo_withContext_orientation_identities__lastSequenceName;
          logSequenceInfo_withContext_orientation_identities__lastSequenceName = v187;

          uint64_t v189 = [v186 stringByAppendingPathComponent:v184];
          if (v189)
          {
            v190 = (void *)v189;
            v312 = v184;
            uint64_t v191 = [MEMORY[0x263F08900] dataWithJSONObject:v178 options:3 error:0];
            v192 = (void *)MEMORY[0x263EF8438];
            if (__osLog_BioLog) {
              v193 = __osLog_BioLog;
            }
            else {
              v193 = MEMORY[0x263EF8438];
            }
            if (!v191)
            {
              if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v355 = "jsonData";
                __int16 v356 = 2048;
                uint64_t v357 = 0;
                __int16 v358 = 2080;
                v359 = &unk_222DFB9BF;
                __int16 v360 = 2080;
                *(void *)v361 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
                *(_WORD *)&v361[8] = 1024;
                int v362 = 1297;
                _os_log_impl(&dword_222D7E000, v193, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              v194 = 0;
              goto LABEL_134;
            }
            v194 = (void *)v191;
            v195 = v193;
            if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
            {
              v196 = self;
              id v197 = v14;
              unint64_t var0 = (const char *)v279->var0;
              uint64_t v199 = [v194 length];
              *(_DWORD *)buf = 134219010;
              v355 = var0;
              id v14 = v197;
              self = v196;
              __int16 v356 = 2048;
              uint64_t v357 = v199;
              __int16 v358 = 2112;
              v359 = v190;
              __int16 v360 = 1024;
              *(_DWORD *)v361 = v278;
              *(_WORD *)&v361[4] = 1024;
              *(_DWORD *)&v361[6] = v301;
              _os_log_impl(&dword_222D7E000, v195, OS_LOG_TYPE_DEFAULT, "logSequenceInfo %llu: %lu > %@.json (canceled: %d, matchFailed: %d)\n", buf, 0x2Cu);
            }

            v200 = [v190 stringByAppendingString:@".json"];
            v201 = self;
            BOOL v202 = [(BioLog *)self createFileAtPath:v200 contents:v194 attributes:self->_fileAttributesAutoUpload purgeable:1];

            if (!v202)
            {
              v217 = (void *)__osLog_BioLog;
              if (!__osLog_BioLog) {
                v217 = v192;
              }
              v218 = v217;
              if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v355 = "result";
                __int16 v356 = 2048;
                uint64_t v357 = 0;
                __int16 v358 = 2080;
                v359 = &unk_222DFB9BF;
                __int16 v360 = 2080;
                *(void *)v361 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
                *(_WORD *)&v361[8] = 1024;
                int v362 = 1308;
                _os_log_impl(&dword_222D7E000, v218, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
            }
            v203 = v201;
            if (v201->_internal || !*(unsigned char *)(v308 + 2))
            {
              unint64_t v204 = 0x26466F000;
              if (!v285)
              {
                if (v201->_internal)
                {
LABEL_124:
                  if (*(unsigned char *)(v308 + 14) == 2)
                  {
                    v205 = [MEMORY[0x263F2AAB8] sharedInstance];
                    int v206 = [v205 BOOLForKey:@"bioLogMatchTailspin"];

                    if (v206)
                    {
                      v207 = *(void **)(v204 + 832);
                      v208 = [v190 stringByAppendingString:@".tailspin"];
                      [v207 writeTailspinToFile:v208];
                    }
                  }
                }
LABEL_127:
                if (v301 && v203->_internal)
                {
                  v209 = [MEMORY[0x263F01880] defaultWorkspace];
                  if ([v209 applicationIsInstalled:@"com.apple.vetap.thegobbler"])
                  {
                    id v210 = v14;
                    v211 = [MEMORY[0x263F2AAB8] sharedInstance];
                    int v212 = [v211 BOOLForKey:@"bioLogMatchFailureSettingsPrompt"];

                    if (v212)
                    {
                      v213 = *(void **)(v204 + 832);
                      v313[0] = MEMORY[0x263EF8330];
                      v313[1] = 3221225472;
                      v313[2] = __61__BioLog_logSequenceInfo_withContext_orientation_identities___block_invoke;
                      v313[3] = &unk_26466F9C8;
                      id v186 = v186;
                      id v314 = v186;
                      [v213 displayUserPrompt:0 strings:&unk_26D5C1008 completion:v313];
                    }
                    id v14 = v210;
                  }
                  else
                  {
                  }
                }
LABEL_134:
                v184 = v312;
LABEL_135:

                int v13 = v306;
                goto LABEL_136;
              }
            }
            else
            {
              unint64_t v204 = 0x26466F000uLL;
            }
            +[BLRetention setRetentionType:atPath:](BLRetention, "setRetentionType:atPath:");
            if (v201->_internal) {
              goto LABEL_124;
            }
            goto LABEL_127;
          }
          if (__osLog_BioLog) {
            v216 = __osLog_BioLog;
          }
          else {
            v216 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v216, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v355 = "filePath";
            __int16 v356 = 2048;
            uint64_t v357 = 0;
            __int16 v358 = 2080;
            v359 = &unk_222DFB9BF;
            __int16 v360 = 2080;
            *(void *)v361 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
            *(_WORD *)&v361[8] = 1024;
            int v362 = 1294;
            _os_log_impl(&dword_222D7E000, v216, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
LABEL_165:
          v190 = 0;
          v194 = 0;
          goto LABEL_135;
        }
        if (__osLog_BioLog) {
          v215 = __osLog_BioLog;
        }
        else {
          v215 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v215, OS_LOG_TYPE_ERROR))
        {
LABEL_164:
          id v186 = 0;
          goto LABEL_165;
        }
        *(_DWORD *)buf = 136316162;
        v355 = "sequencePath";
        __int16 v356 = 2048;
        uint64_t v357 = 0;
        __int16 v358 = 2080;
        v359 = &unk_222DFB9BF;
        __int16 v360 = 2080;
        *(void *)v361 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        *(_WORD *)&v361[8] = 1024;
        int v362 = 1289;
      }
      else
      {
        if (__osLog_BioLog) {
          v215 = __osLog_BioLog;
        }
        else {
          v215 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v215, OS_LOG_TYPE_ERROR)) {
          goto LABEL_164;
        }
        *(_DWORD *)buf = 136316162;
        v355 = "filename";
        __int16 v356 = 2048;
        uint64_t v357 = 0;
        __int16 v358 = 2080;
        v359 = &unk_222DFB9BF;
        __int16 v360 = 2080;
        *(void *)v361 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        *(_WORD *)&v361[8] = 1024;
        int v362 = 1286;
      }
      _os_log_impl(&dword_222D7E000, v215, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      goto LABEL_164;
    }
    if (v34 != 2)
    {
      if (v34 == 3)
      {
        v343[0] = @"attn";
        v342[0] = @"seq_type";
        v342[1] = @"face_detected";
        if (*(unsigned char *)(v308 + 65)) {
          [NSNumber numberWithBool:*(unsigned char *)(v308 + 66) != 0];
        }
        else {
        int v35 = [MEMORY[0x263EFF9D0] null];
        }
        v343[1] = v35;
        v342[2] = @"face_detect_result_code";
        uint64_t v47 = [NSNumber numberWithInt:*(unsigned int *)(v308 + 67)];
        v343[2] = v47;
        __int16 v48 = [NSDictionary dictionaryWithObjects:v343 forKeys:v342 count:3];
        [v276 addEntriesFromDictionary:v48];

        if (*(unsigned char *)(v308 + 65))
        {
          int v301 = 0;
          if (*(unsigned char *)(v308 + 66)) {
            long long v49 = 0;
          }
          else {
            long long v49 = @"rp_noface";
          }
          v285 = v49;
        }
        else
        {
          v285 = 0;
          int v301 = 0;
        }
        uint64_t v45 = (void *)v288;
        __int16 v46 = (void *)v297;
        int v44 = v276;
        goto LABEL_106;
      }
      v321 = @"seq_type";
      int v42 = [MEMORY[0x263EFF9D0] null];
      v322 = v42;
      __int16 v43 = [NSDictionary dictionaryWithObjects:&v322 forKeys:&v321 count:1];
      int v44 = v276;
      [v276 addEntriesFromDictionary:v43];

      v285 = 0;
      int v301 = 0;
      goto LABEL_25;
    }
    v258 = v32;
    if (*(unsigned char *)(v308 + 84))
    {
      BOOL v256 = *(unsigned char *)(v308 + 68) != 0;
      unint64_t v41 = 0x263F08000;
      goto LABEL_40;
    }
    int v50 = *(unsigned __int8 *)(v308 + 70);
    unint64_t v41 = 0x263F08000uLL;
    if (*(unsigned char *)(v308 + 98) == 3)
    {
      if (*(unsigned char *)(v308 + 70))
      {
        BOOL v51 = 1;
LABEL_39:
        BOOL v256 = v51;
LABEL_40:
        uint64_t v52 = [MEMORY[0x263EFF9D0] null];
        uint64_t v53 = [MEMORY[0x263EFF9D0] null];
        double v54 = [MEMORY[0x263EFF9D0] null];
        if (*(unsigned char *)(v308 + 65))
        {
          uint64_t v55 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v308 + 66) != 0];

          uint64_t v52 = (void *)v55;
        }
        if (*(unsigned char *)(v308 + 67))
        {
          uint64_t v56 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v308 + 68) != 0];

          uint64_t v53 = (void *)v56;
        }
        if (*(unsigned char *)(v308 + 69))
        {
          uint64_t v57 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v308 + 70) != 0];

          double v54 = (void *)v57;
        }
        v255 = v52;
        __int16 v58 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v308 + 109)];
        __int16 v59 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v308 + 109)];
        v253 = v54;
        v254 = v53;
        BOOL v60 = 0;
        if (*(unsigned char *)(v308 + 109))
        {
          unint64_t v61 = 0;
          do
          {
            __int16 v62 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v308 + v61 + 86) != 0];
            [v58 addObject:v62];

            int v63 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v308 + v61 + 92) != 0];
            [v59 addObject:v63];

            BOOL v60 = (*(unsigned __int8 *)(v308 + v61 + 86) | v60 | *(unsigned __int8 *)(v308 + v61 + 92)) != 0;
            ++v61;
            unint64_t v64 = *(unsigned __int8 *)(v308 + 109);
          }
          while (v61 < v64);
        }
        else
        {
          unint64_t v64 = 0;
        }
        BOOL v221 = v60;
        v251 = v59;
        v252 = v58;
        v311 = [MEMORY[0x263EFF980] arrayWithCapacity:v64];
        v299 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v308 + 109)];
        v283 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v308 + 109)];
        if (*(unsigned char *)(v308 + 167) && *(unsigned char *)(v308 + 109))
        {
          unint64_t v65 = 0;
          do
          {
            unint64_t v66 = v16 + 36 * v65;
            v67 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v66 + 186];
            v68 = [v67 UUIDString];
            [v311 addObject:v68];

            v69 = [*(id *)(v41 + 2584) numberWithUnsignedInt:*(unsigned int *)(v66 + 202)];
            [v299 addObject:v69];

            long long v317 = 0u;
            long long v318 = 0u;
            long long v315 = 0u;
            long long v316 = 0u;
            id v70 = v307;
            uint64_t v71 = [v70 countByEnumeratingWithState:&v315 objects:v341 count:16];
            if (v71)
            {
              uint64_t v72 = v71;
              uint64_t v73 = *(void *)v316;
              while (2)
              {
                for (uint64_t i = 0; i != v72; ++i)
                {
                  if (*(void *)v316 != v73) {
                    objc_enumerationMutation(v70);
                  }
                  v75 = *(void **)(*((void *)&v315 + 1) + 8 * i);
                  v76 = [v75 uuid];
                  v77 = [v76 UUIDString];
                  v78 = [v311 lastObject];
                  int v79 = [v77 isEqualToString:v78];

                  if (v79)
                  {
                    v80 = [v75 creationTime];
                    [v80 timeIntervalSince1970];
                    v81 = +[BLHelper numberFromDouble:](BLHelper, "numberFromDouble:");
                    [v283 addObject:v81];

                    goto LABEL_64;
                  }
                }
                uint64_t v72 = [v70 countByEnumeratingWithState:&v315 objects:v341 count:16];
                if (v72) {
                  continue;
                }
                break;
              }
            }
LABEL_64:

            ++v65;
            uint64_t v16 = v308;
            unint64_t v41 = 0x263F08000uLL;
          }
          while (v65 < *(unsigned __int8 *)(v308 + 109));
        }
        v340[0] = @"match";
        v339[0] = @"seq_type";
        v339[1] = @"match_seq_type";
        v302 = [*(id *)(v41 + 2584) numberWithUnsignedChar:*(unsigned __int8 *)(v16 + 98)];
        v340[1] = v302;
        v339[2] = @"match_flags";
        v286 = [*(id *)(v41 + 2584) numberWithUnsignedInt:*(unsigned int *)(v16 + 104)];
        v340[2] = v286;
        v339[3] = @"match_trigger";
        v274 = [*(id *)(v41 + 2584) numberWithUnsignedChar:*(unsigned __int8 *)(v16 + 108)];
        v340[3] = v274;
        v339[4] = @"processed_doubles";
        v271 = [*(id *)(v41 + 2584) numberWithUnsignedChar:*(unsigned __int8 *)(v16 + 99)];
        v340[4] = v271;
        v339[5] = @"overall_match_result";
        v268 = [*(id *)(v41 + 2584) numberWithBool:v256];
        v340[5] = v268;
        v340[6] = v255;
        v339[6] = @"face_detect_result";
        v339[7] = @"bio_check_result";
        v340[7] = v254;
        v340[8] = v253;
        v339[8] = @"probing_pattern_result";
        v339[9] = @"face_detect_result_code";
        v265 = [*(id *)(v41 + 2584) numberWithInt:*(unsigned int *)(v16 + 100)];
        v340[9] = v265;
        v340[10] = v258;
        v339[10] = @"match_identity_uuid";
        v339[11] = @"match_identity_user_id";
        v262 = [*(id *)(v41 + 2584) numberWithUnsignedInt:*(unsigned int *)(v16 + 61)];
        v340[11] = v262;
        v339[12] = @"enrolled_identity_count";
        v249 = [*(id *)(v41 + 2584) numberWithUnsignedChar:*(unsigned __int8 *)(v16 + 109)];
        v340[12] = v249;
        v340[13] = v311;
        v339[13] = @"enrolled_identity_uuid";
        v339[14] = @"enrolled_identity_date";
        v340[14] = v283;
        v340[15] = v299;
        v339[15] = @"enrolled_user_id";
        v339[16] = @"matched_identity_index";
        v247 = [*(id *)(v41 + 2584) numberWithChar:*(char *)(v16 + 110)];
        v340[16] = v247;
        v339[17] = @"template_updated";
        v246 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 83) != 0];
        v340[17] = v246;
        v339[18] = @"passcode_challenge";
        v245 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 84) != 0];
        v340[18] = v245;
        v339[19] = @"passcode_challenge_allowed";
        v244 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 85) != 0];
        v340[19] = v244;
        v340[20] = v252;
        v339[20] = @"is_safe_update";
        v339[21] = @"is_passcode_update";
        v340[21] = v251;
        v339[22] = @"is_combined";
        v243 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 71) != 0];
        v340[22] = v243;
        v339[23] = @"is_auto_retry";
        v242 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 72) != 0];
        v340[23] = v242;
        v339[24] = @"is_auto_retry_allowed";
        v241 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 73) != 0];
        v340[24] = v241;
        v339[25] = @"is_static_unlock";
        v240 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 74) != 0];
        v340[25] = v240;
        v339[26] = @"is_online_unlock";
        v239 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 75) != 0];
        v340[26] = v239;
        v339[27] = @"is_online_static_unlock";
        v238 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 76) != 0];
        v340[27] = v238;
        v339[28] = @"is_online_shortterm_unlock";
        v237 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 77) != 0];
        v340[28] = v237;
        v339[29] = @"is_shortterm_unlock";
        v236 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 78) != 0];
        v340[29] = v236;
        v339[30] = @"as_dot_ir_pass";
        v235 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 79) != 0];
        v340[30] = v235;
        v339[31] = @"as_fused_ir_pass";
        v234 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 80) != 0];
        v340[31] = v234;
        v339[32] = @"as_flood_ir_pass";
        v233 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 81) != 0];
        v340[32] = v233;
        v339[33] = @"has_attention";
        v232 = [*(id *)(v41 + 2584) numberWithBool:*(unsigned char *)(v16 + 82) != 0];
        v340[33] = v232;
        v339[34] = @"first_bio_flood_frame";
        v337[0] = @"distance";
        v231 = [*(id *)(v41 + 2584) numberWithUnsignedShort:*(unsigned __int16 *)(v16 + 119)];
        v338[0] = v231;
        v337[1] = @"bb_x";
        v230 = [*(id *)(v41 + 2584) numberWithUnsignedShort:*(unsigned __int16 *)(v16 + 121)];
        v338[1] = v230;
        v337[2] = @"bb_y";
        v229 = [*(id *)(v41 + 2584) numberWithUnsignedShort:*(unsigned __int16 *)(v16 + 123)];
        v338[2] = v229;
        v337[3] = @"bb_w";
        v228 = [*(id *)(v41 + 2584) numberWithUnsignedShort:*(unsigned __int16 *)(v16 + 125)];
        v338[3] = v228;
        v337[4] = @"bb_h";
        v227 = [*(id *)(v41 + 2584) numberWithUnsignedShort:*(unsigned __int16 *)(v16 + 127)];
        v338[4] = v227;
        v337[5] = @"exposure";
        v226 = [*(id *)(v41 + 2584) numberWithUnsignedInt:*(unsigned int *)(v16 + 129)];
        v338[5] = v226;
        v225 = [NSDictionary dictionaryWithObjects:v338 forKeys:v337 count:6];
        v340[34] = v225;
        v340[35] = logSequenceInfo_withContext_orientation_identities__lastSequenceName;
        v339[35] = @"last_sequence_name";
        v339[36] = @"face_detect_flood_frame_count";
        v224 = [*(id *)(v41 + 2584) numberWithUnsignedShort:*(unsigned __int16 *)(v16 + 111)];
        v340[36] = v224;
        v339[37] = @"bio_frame_has_eye_occlusion_count";
        v223 = [*(id *)(v41 + 2584) numberWithUnsignedShort:*(unsigned __int16 *)(v16 + 113)];
        v340[37] = v223;
        v339[38] = @"user_feedback";
        v222 = [*(id *)(v41 + 2584) numberWithUnsignedInt:*(unsigned int *)(v16 + 115)];
        v340[38] = v222;
        v339[39] = @"face_detect_user_engagement_status";
        v82 = [*(id *)(v41 + 2584) numberWithUnsignedInt:*(unsigned int *)(v16 + 163)];
        v340[39] = v82;
        v339[40] = @"face_info";
        v335[0] = @"distance";
        v83 = [*(id *)(v41 + 2584) numberWithUnsignedShort:*(unsigned __int16 *)(v16 + 133)];
        v336[0] = v83;
        v335[1] = @"face_orientation";
        v84 = [*(id *)(v41 + 2584) numberWithUnsignedChar:*(unsigned __int8 *)(v16 + 135)];
        v336[1] = v84;
        v335[2] = @"face_pitch";
        v85 = [*(id *)(v41 + 2584) numberWithInt:*(unsigned int *)(v16 + 136)];
        v336[2] = v85;
        v335[3] = @"face_yaw";
        id v86 = [*(id *)(v41 + 2584) numberWithInt:*(unsigned int *)(v16 + 140)];
        v336[3] = v86;
        v335[4] = @"face_roll";
        v87 = [*(id *)(v41 + 2584) numberWithInt:*(unsigned int *)(v16 + 144)];
        v336[4] = v87;
        v88 = [NSDictionary dictionaryWithObjects:v336 forKeys:v335 count:5];
        v340[40] = v88;
        v89 = [NSDictionary dictionaryWithObjects:v340 forKeys:v339 count:41];
        int v44 = v276;
        [v276 addEntriesFromDictionary:v89];

        self = v281;
        if (v281->_internal)
        {
          v333[0] = @"feature_generation_error";
          v90 = [NSNumber numberWithInt:*(unsigned int *)(v16 + 27)];
          v334[0] = v90;
          v333[1] = @"feature_vectors_error";
          v91 = [NSNumber numberWithInt:*(unsigned int *)(v16 + 31)];
          v334[1] = v91;
          v92 = [NSDictionary dictionaryWithObjects:v334 forKeys:v333 count:2];
          [v276 addEntriesFromDictionary:v92];
        }
        int v33 = v305;
        unint64_t v18 = 0x26466F000uLL;
        uint64_t v17 = v280;
        __int16 v46 = (void *)v297;
        __int16 v32 = v258;
        if (*(unsigned char *)(v16 + 1))
        {
          v93 = [MEMORY[0x263EFF9D0] null];
          if (*(unsigned char *)(v16 + 153))
          {
            uint64_t v94 = [NSNumber numberWithBool:*(unsigned char *)(v16 + 154) != 0];

            v93 = (void *)v94;
          }
          v95 = @"fullface";
          if (!*(unsigned char *)(v16 + 148)) {
            v95 = @"periocular";
          }
          v332[0] = v95;
          v331[0] = @"matcher_type";
          v331[1] = @"passcode_update_eligible";
          __int16 v96 = [NSNumber numberWithBool:*(unsigned char *)(v16 + 151) != 0];
          v332[1] = v96;
          v331[2] = @"best_frame_has_occlusion";
          uint64_t v97 = [NSNumber numberWithBool:*(unsigned char *)(v16 + 152) != 0];
          v332[2] = v97;
          v331[3] = @"flood_pattern_detection_result";
          __int16 v98 = [NSNumber numberWithBool:*(_DWORD *)(v16 + 23) != 5];
          v332[3] = v98;
          v250 = v93;
          v332[4] = v93;
          v331[4] = @"probing_pattern_detection_result";
          v331[5] = @"probing_pattern_score";
          LODWORD(v99) = *(_DWORD *)(v16 + 155);
          __int16 v100 = +[BLHelper numberFromFloat:v99];
          v332[5] = v100;
          v331[6] = @"first_bio_frame_exposure";
          v101 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v16 + 159)];
          v332[6] = v101;
          __int16 v102 = [NSDictionary dictionaryWithObjects:v332 forKeys:v331 count:7];
          [v276 addEntriesFromDictionary:v102];

          if (*(unsigned char *)(v16 + 167))
          {
            int v103 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            uint64_t v104 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v105 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v106 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            if (*(unsigned char *)(v16 + 109))
            {
              unint64_t v108 = 0;
              v109 = (int *)(v16 + 182);
              do
              {
                LODWORD(v107) = *(v109 - 3);
                v110 = +[BLHelper numberFromFloat:v107];
                [v103 addObject:v110];

                LODWORD(v111) = *(v109 - 2);
                v112 = +[BLHelper numberFromFloat:v111];
                [v104 addObject:v112];

                LODWORD(v113) = *(v109 - 1);
                v114 = +[BLHelper numberFromFloat:v113];
                [v105 addObject:v114];

                int v115 = *v109;
                v109 += 9;
                LODWORD(v116) = v115;
                v117 = +[BLHelper numberFromFloat:v116];
                [v106 addObject:v117];

                ++v108;
              }
              while (v108 < *(unsigned __int8 *)(v16 + 109));
            }
            v329[0] = @"match_threshold";
            v329[1] = @"online_threshold";
            v330[0] = v103;
            v330[1] = v104;
            v329[2] = @"shortterm_threshold";
            v329[3] = @"as_threshold";
            v330[2] = v105;
            v330[3] = v106;
            v118 = [NSDictionary dictionaryWithObjects:v330 forKeys:v329 count:4];
            [v276 addEntriesFromDictionary:v118];

            self = v281;
          }
          uint64_t v248 = v16 + 386;
          __int16 v46 = (void *)v297;
          if (*(unsigned char *)(v16 + 168))
          {
            v303 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v287 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v275 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v272 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v269 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v266 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v263 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v119 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v120 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v121 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v122 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v123 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v124 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            if (*(unsigned char *)(v16 + 109))
            {
              unint64_t v126 = 0;
              v127 = (_DWORD *)(v16 + 386);
              do
              {
                LODWORD(v125) = *v127;
                v128 = +[BLHelper numberFromFloat:v125];
                [v303 addObject:v128];

                LODWORD(v129) = v127[1];
                v130 = +[BLHelper numberFromFloat:v129];
                [v287 addObject:v130];

                LODWORD(v131) = v127[2];
                v132 = +[BLHelper numberFromFloat:v131];
                [v275 addObject:v132];

                LODWORD(v133) = v127[3];
                v134 = +[BLHelper numberFromFloat:v133];
                [v272 addObject:v134];

                LODWORD(v135) = v127[4];
                v136 = +[BLHelper numberFromFloat:v135];
                [v269 addObject:v136];

                LODWORD(v137) = v127[5];
                v138 = +[BLHelper numberFromFloat:v137];
                [v266 addObject:v138];

                LODWORD(v139) = v127[6];
                v140 = +[BLHelper numberFromFloat:v139];
                [v263 addObject:v140];

                LODWORD(v141) = v127[7];
                v142 = +[BLHelper numberFromFloat:v141];
                [v119 addObject:v142];

                LODWORD(v143) = v127[8];
                v144 = +[BLHelper numberFromFloat:v143];
                [v120 addObject:v144];

                LODWORD(v145) = v127[9];
                v146 = +[BLHelper numberFromFloat:v145];
                [v121 addObject:v146];

                LODWORD(v147) = v127[10];
                v148 = +[BLHelper numberFromFloat:v147];
                [v122 addObject:v148];

                LODWORD(v149) = v127[11];
                v150 = +[BLHelper numberFromFloat:v149];
                [v123 addObject:v150];

                LODWORD(v151) = v127[12];
                v152 = +[BLHelper numberFromFloat:v151];
                [v124 addObject:v152];

                ++v126;
                v127 += 13;
              }
              while (v126 < *(unsigned __int8 *)(v308 + 109));
            }
            v327[0] = @"ir_score";
            v327[1] = @"depth_score";
            v328[0] = v303;
            v328[1] = v287;
            v327[2] = @"ir_online_score";
            v327[3] = @"depth_online_score";
            v328[2] = v275;
            v328[3] = v272;
            v327[4] = @"as_dotted_score";
            v327[5] = @"as_flood_score";
            v328[4] = v269;
            v328[5] = v266;
            v327[6] = @"as_score";
            v327[7] = @"as_threshold_dynamic";
            v328[6] = v263;
            v328[7] = v119;
            v327[8] = @"as_score_minus_as_threshold";
            v327[9] = @"as_depth_score";
            v328[8] = v120;
            v328[9] = v121;
            v327[10] = @"min_depth_score";
            v327[11] = @"as_depth_threshold";
            v328[10] = v122;
            v328[11] = v123;
            v327[12] = @"scene_matcher_score";
            v328[12] = v124;
            v153 = [NSDictionary dictionaryWithObjects:v328 forKeys:v327 count:13];
            [v276 addEntriesFromDictionary:v153];

            self = v281;
            unint64_t v18 = 0x26466F000uLL;
            uint64_t v16 = v308;
            int v44 = v276;
            __int16 v46 = (void *)v297;
          }
          if (*(unsigned char *)(v16 + 169))
          {
            v154 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v155 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v156 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            v157 = [MEMORY[0x263EFF980] arrayWithCapacity:*(unsigned __int8 *)(v16 + 109)];
            if (*(unsigned char *)(v16 + 109))
            {
              unint64_t v159 = 0;
              v160 = (_DWORD *)(v248 + 312);
              do
              {
                LODWORD(v158) = *v160;
                v161 = +[BLHelper numberFromFloat:v158];
                [v154 addObject:v161];

                LODWORD(v162) = v160[1];
                v163 = +[BLHelper numberFromFloat:v162];
                [v155 addObject:v163];

                LODWORD(v164) = v160[2];
                v165 = +[BLHelper numberFromFloat:v164];
                [v156 addObject:v165];

                LODWORD(v166) = v160[3];
                v167 = +[BLHelper numberFromFloat:v166];
                [v157 addObject:v167];

                ++v159;
                v160 += 4;
              }
              while (v159 < *(unsigned __int8 *)(v16 + 109));
            }
            v325[0] = @"overall_score";
            v325[1] = @"overall_online_score";
            v326[0] = v154;
            v326[1] = v155;
            v325[2] = @"overall_shortterm_score";
            v325[3] = @"depth_shortterm_score";
            v326[2] = v156;
            v326[3] = v157;
            v168 = [NSDictionary dictionaryWithObjects:v326 forKeys:v325 count:4];
            [v44 addEntriesFromDictionary:v168];

            self = v281;
            __int16 v46 = (void *)v297;
          }

          uint64_t v17 = v280;
          __int16 v32 = v258;
          int v33 = v305;
        }
        if (*(unsigned char *)(v16 + 2))
        {
          int v301 = 0;
        }
        else
        {
          int v169 = !v256;
          if (!*(unsigned char *)(v16 + 66)) {
            int v169 = 0;
          }
          int v301 = v169;
        }
        uint64_t v45 = (void *)v288;
        if (!*(unsigned char *)(v16 + 65) || *(unsigned char *)(v16 + 66))
        {
          if (*(unsigned char *)(v16 + 67))
          {
            if (!v256)
            {
              v170 = @"rp_nomatch";
LABEL_105:
              v285 = v170;
              v172 = [MEMORY[0x263EFF910] date];
              [(BioLog *)self logAllVsAllWithDate:v172];

              goto LABEL_106;
            }
          }
          else
          {
            v170 = @"rp_nomatch";
            BOOL v171 = v256;
            if (!*(unsigned char *)(v16 + 69))
            {
              BOOL v171 = 0;
              v170 = @"rp_matchfailure";
            }
            if (!v171) {
              goto LABEL_105;
            }
          }
          v170 = @"rp_update";
          if (!v221) {
            v170 = 0;
          }
          goto LABEL_105;
        }
        v170 = @"rp_noface";
        goto LABEL_105;
      }
      int v50 = *(unsigned __int8 *)(v308 + 68);
    }
    BOOL v51 = v50 != 0;
    goto LABEL_39;
  }
  if (__osLog_BioLog) {
    v214 = __osLog_BioLog;
  }
  else {
    v214 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v355 = "orientation";
    __int16 v356 = 2048;
    uint64_t v357 = 0;
    __int16 v358 = 2080;
    v359 = &unk_222DFB9BF;
    __int16 v360 = 2080;
    *(void *)v361 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
    *(_WORD *)&v361[8] = 1024;
    int v362 = 900;
    goto LABEL_152;
  }
LABEL_136:
}

void __61__BioLog_logSequenceInfo_withContext_orientation_identities___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    unint64_t v3 = [MEMORY[0x263F2AAB8] sharedInstance];
    [v3 setObject:*(void *)(a1 + 32) forKey:@"bioLogLastFailedSequence"];

    id v4 = [MEMORY[0x263F2AAB8] sharedInstance];
    [v4 synchronize];

    if (__osLog_BioLog) {
      BOOL v5 = __osLog_BioLog;
    }
    else {
      BOOL v5 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = @"prefs:root=INTERNAL_SETTINGS&path=Face%20ID";
      _os_log_impl(&dword_222D7E000, v5, OS_LOG_TYPE_DEFAULT, "displayUserPrompt completion openURL %@\n", (uint8_t *)&v9, 0xCu);
    }
    id v6 = [MEMORY[0x263F01880] defaultWorkspace];
    id v7 = [NSURL URLWithString:@"prefs:root=INTERNAL_SETTINGS&path=Face%20ID"];
    [v6 openSensitiveURL:v7 withOptions:0];
  }
  id v8 = [MEMORY[0x263F2AAB8] sharedInstance];
  [v8 setBool:0 forKey:@"bioLogMatchFailureSettingsPrompt"];
}

- (id)computeAllVsAllMatrixFromScoreDataArray:(id)a3 sequenceNumber:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [MEMORY[0x263F08A98] predicateWithFormat:@"sequenceNumber == %hu", v4];
  uint64_t v27 = v30 = v5;
  id v6 = [v5 filteredArrayUsingPredicate:];
  uint64_t v29 = objc_opt_new();
  if ([v6 count])
  {
    unint64_t v7 = 0;
    __int16 v28 = v6;
    do
    {
      id v8 = [v6 objectAtIndexedSubscript:v7];
      int v9 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:[v30 count]];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v10 = v30;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            unsigned int v16 = [v15 sequenceNumber];
            if (v16 < [v8 sequenceNumber])
            {
              [v8 scoreVersus:v15];
              uint64_t v17 = [NSNumber numberWithFloat:];
              [v9 addObject:v17];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v12);
      }

      id v6 = v28;
      if (v7)
      {
        for (uint64_t j = 0; j != v7; ++j)
        {
          uint64_t v19 = [v28 objectAtIndexedSubscript:j];
          [v8 scoreVersus:v19];
          uint64_t v20 = [NSNumber numberWithFloat:];
          [v9 addObject:v20];
        }
      }
      BOOL v21 = [NSNumber numberWithUnsignedShort:[v8 sequenceNumber]];
      v35[0] = v21;
      __int16 v22 = [v8 frameNumber];
      v35[1] = v22;
      int v23 = (void *)[v9 copy];
      void v35[2] = v23;
      uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];

      [v29 addObject:v24];
      ++v7;
    }
    while (v7 < [v28 count]);
  }
  double v25 = (void *)[v29 copy];

  return v25;
}

- (void)logSequenceDebug:(id)a3 withContext:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_internal)
  {
    unint64_t v7 = [MEMORY[0x263F2AAC8] dateFromNanoTime:a4->var2.var0 nanoseconds:0];
    id v8 = NSString;
    uint64_t var1 = a4->var2.var1;
    [v7 timeIntervalSince1970];
    uint64_t v11 = (uint64_t)v10;
    uint64_t v12 = [(NSDateFormatter *)self->_milisecondsFormatter stringFromDate:v7];
    uint64_t v13 = [v8 stringWithFormat:@"seq-%05d-%ld%@", var1, v11, v12];

    id v14 = [(BioLog *)self sequencePathForId:&a4->var2];
    uint64_t v15 = [v14 stringByAppendingPathComponent:v13];

    unsigned int v16 = MEMORY[0x263EF8438];
    if (__osLog_BioLog) {
      uint64_t v17 = __osLog_BioLog;
    }
    else {
      uint64_t v17 = MEMORY[0x263EF8438];
    }
    if (v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t var0 = a4->var0;
        uint64_t v19 = v17;
        *(_DWORD *)buf = 134218754;
        double v25 = (const char *)var0;
        __int16 v26 = 2048;
        uint64_t v27 = [v6 length];
        __int16 v28 = 2112;
        uint64_t v29 = v15;
        __int16 v30 = 2080;
        long long v31 = ".prlt";
        _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_DEFAULT, "logSequenceDebug %llu: %lu > %@%s\n", buf, 0x2Au);
      }
      uint64_t v20 = [v15 stringByAppendingString:@".prlt"];
      BOOL v21 = [(BioLog *)self createFileAtPath:v20 contents:v6 attributes:self->_fileAttributesProtected purgeable:1];

      if (!v21)
      {
        if (__osLog_BioLog) {
          int v23 = __osLog_BioLog;
        }
        else {
          int v23 = v16;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          double v25 = "result";
          __int16 v26 = 2048;
          uint64_t v27 = 0;
          __int16 v28 = 2080;
          uint64_t v29 = &unk_222DFB9BF;
          __int16 v30 = 2080;
          long long v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
          __int16 v32 = 1024;
          int v33 = 1395;
          _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        double v25 = "filePath";
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        uint64_t v29 = &unk_222DFB9BF;
        __int16 v30 = 2080;
        long long v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v32 = 1024;
        int v33 = 1391;
        _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v15 = 0;
    }
  }
  else
  {
    if (__osLog_BioLog) {
      __int16 v22 = __osLog_BioLog;
    }
    else {
      __int16 v22 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      double v25 = "_internal";
      __int16 v26 = 2048;
      uint64_t v27 = 0;
      __int16 v28 = 2080;
      uint64_t v29 = &unk_222DFB9BF;
      __int16 v30 = 2080;
      long long v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v32 = 1024;
      int v33 = 1384;
      _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v15 = 0;
    uint64_t v13 = 0;
    unint64_t v7 = 0;
  }
}

- (id)eventPathWithName:(id)a3 date:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = NSString;
  uint64_t sequenceNumber = self->_sequenceNumber;
  id v8 = a4;
  id v9 = a3;
  [v8 timeIntervalSince1970];
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = [(NSDateFormatter *)self->_milisecondsFormatter stringFromDate:v8];

  uint64_t v13 = [v6 stringWithFormat:@"%05d-%ld%@-%@.evt", sequenceNumber, v11, v12, v9];

  id v14 = [(NSString *)self->_logPath stringByAppendingPathComponent:v13];
  uint64_t v15 = [MEMORY[0x263F08850] defaultManager];
  LOBYTE(v9) = [v15 fileExistsAtPath:v14];

  if ((v9 & 1) == 0)
  {
    unsigned int v16 = [MEMORY[0x263F08850] defaultManager];
    char v17 = [v16 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:self->_fileAttributes error:0];

    if (v17)
    {
      +[BLRetention setPurgeableAtPath:v14 directory:1];
    }
    else
    {
      if (__osLog_BioLog) {
        uint64_t v19 = __osLog_BioLog;
      }
      else {
        uint64_t v19 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        BOOL v21 = "result";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2080;
        double v25 = &unk_222DFB9BF;
        __int16 v26 = 2080;
        uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v28 = 1024;
        int v29 = 1411;
        _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      id v14 = 0;
    }
  }

  return v14;
}

- (void)logRemoveIdentity:(id)a3 withTemplateListData:(id)a4 templateSize:(unint64_t)a5 client:(id)a6 isPO:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = [MEMORY[0x263EFF910] date];
  unsigned int v16 = v15;
  v69 = self;
  if (self->_internal)
  {
    unint64_t v52 = a5;
    id v67 = v13;
    v72[0] = @"biolog_file_type";
    v72[1] = @"version";
    v73[0] = @"event";
    v73[1] = &unk_26D5C1218;
    v72[2] = @"epoch";
    char v17 = NSNumber;
    [v15 timeIntervalSince1970];
    unint64_t v64 = [v17 numberWithDouble:];
    v72[3] = @"log_data";
    v70[0] = @"event_name";
    v70[1] = @"identity_part";
    unint64_t v18 = @"fullface";
    v73[2] = v64;
    BOOL v53 = v7;
    if (v7) {
      unint64_t v18 = @"periocular";
    }
    v71[0] = @"identity_removal";
    v71[1] = v18;
    v70[2] = @"identity_uuid";
    unint64_t v65 = v16;
    int v63 = [v12 uuid];
    __int16 v62 = [v63 UUIDString];
    unint64_t v61 = +[BLHelper objectOrNSNull:v62];
    v71[2] = v61;
    v70[3] = @"identity_name";
    BOOL v60 = [v12 name];
    __int16 v59 = +[BLHelper objectOrNSNull:v60];
    v71[3] = v59;
    v70[4] = @"identity_cretion_time";
    uint64_t v19 = NSNumber;
    __int16 v58 = [v12 creationTime];
    [v58 timeIntervalSince1970];
    uint64_t v57 = [v19 numberWithDouble:];
    uint64_t v56 = +[BLHelper objectOrNSNull:v57];
    v71[4] = v56;
    v70[5] = @"client_bundle_id";
    uint64_t v55 = [v14 clientInfo];
    double v54 = [v55 valueForKey:@"BKClientBundleIdentifier"];
    uint64_t v20 = +[BLHelper objectOrNSNull:v54];
    v71[5] = v20;
    v70[6] = @"client_process_name";
    BOOL v21 = [v14 clientInfo];
    __int16 v22 = [v21 valueForKey:@"BKClientProcessName"];
    uint64_t v23 = +[BLHelper objectOrNSNull:v22];
    v71[6] = v23;
    v70[7] = @"client_connection_id";
    id v66 = v14;
    __int16 v24 = [v14 clientInfo];
    double v25 = [v24 valueForKey:@"BKClientConnectionId"];
    __int16 v26 = +[BLHelper objectOrNSNull:v25];
    v71[7] = v26;
    v70[8] = @"user_id";
    v68 = v12;
    uint64_t v27 = [NSNumber numberWithUnsignedInt:[v12 userID]];
    v71[8] = v27;
    __int16 v28 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:9];
    v73[3] = v28;
    uint64_t v29 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:4];

    uint64_t v30 = (void *)v29;
    long long v31 = [MEMORY[0x263F08900] dataWithJSONObject:v29 options:3 error:0];
    __int16 v32 = MEMORY[0x263EF8438];
    if (!v31)
    {
      long long v49 = (__osLog_BioLog ? __osLog_BioLog : MEMORY[0x263EF8438]);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v75 = "jsonData";
        __int16 v76 = 2048;
        v77 = 0;
        __int16 v78 = 2080;
        int v79 = (const char *)&unk_222DFB9BF;
        __int16 v80 = 2080;
        v81 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v82 = 1024;
        int v83 = 1457;
        _os_log_impl(&dword_222D7E000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    int v33 = NSString;
    uint64_t sequenceNumber = v69->_sequenceNumber;
    unsigned int v16 = v65;
    [v65 timeIntervalSince1970];
    uint64_t v36 = (uint64_t)v35;
    uint64_t v37 = [(NSDateFormatter *)v69->_milisecondsFormatter stringFromDate:v65];
    uint64_t v38 = [v33 stringWithFormat:@"evt-%05d-%ld%@", sequenceNumber, v36, v37];

    __int16 v39 = [(BioLog *)v69 eventPathWithName:@"remove" date:v65];
    if (v39)
    {
      unint64_t v40 = v39;
      unint64_t v41 = [v39 stringByAppendingPathComponent:v38];
      if (v69->_internal) {
        int v42 = @"rp_enroll";
      }
      else {
        int v42 = @"rp_keep";
      }
      +[BLRetention setRetentionType:v42 atPath:v40];
      if (__osLog_BioLog) {
        __int16 v43 = __osLog_BioLog;
      }
      else {
        __int16 v43 = v32;
      }
      id v14 = v66;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        int v44 = v43;
        uint64_t v45 = [v68 uuid];
        *(_DWORD *)buf = 138412802;
        v75 = v45;
        __int16 v76 = 2112;
        v77 = v41;
        __int16 v78 = 2080;
        int v79 = ".json";
        _os_log_impl(&dword_222D7E000, v44, OS_LOG_TYPE_DEFAULT, "logRemoveIdentity %@ > %@%s\n", buf, 0x20u);
      }
      __int16 v46 = [v41 stringByAppendingString:@".json"];
      BOOL v47 = [(BioLog *)v69 createFileAtPath:v46 contents:v31 attributes:v69->_fileAttributesProtected purgeable:1];

      if (!v47)
      {
        if (__osLog_BioLog) {
          BOOL v51 = __osLog_BioLog;
        }
        else {
          BOOL v51 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v75 = "result";
          __int16 v76 = 2048;
          v77 = 0;
          __int16 v78 = 2080;
          int v79 = (const char *)&unk_222DFB9BF;
          __int16 v80 = 2080;
          v81 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
          __int16 v82 = 1024;
          int v83 = 1475;
          _os_log_impl(&dword_222D7E000, v51, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      id v13 = v67;
      [(BioLog *)v69 logTemplateList:v67 withTemplateSize:v52 sequenceNumber:v69->_sequenceNumber date:v65 toPath:v40 isPO:v53];

      id v12 = v68;
    }
    else
    {
      if (__osLog_BioLog) {
        int v50 = __osLog_BioLog;
      }
      else {
        int v50 = v32;
      }
      id v14 = v66;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v75 = "eventPath";
        __int16 v76 = 2048;
        v77 = 0;
        __int16 v78 = 2080;
        int v79 = (const char *)&unk_222DFB9BF;
        __int16 v80 = 2080;
        v81 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v82 = 1024;
        int v83 = 1462;
        _os_log_impl(&dword_222D7E000, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      id v13 = v67;
      id v12 = v68;
    }
  }
  else
  {
    if (__osLog_BioLog) {
      __int16 v48 = __osLog_BioLog;
    }
    else {
      __int16 v48 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v75 = "_internal";
      __int16 v76 = 2048;
      v77 = 0;
      __int16 v78 = 2080;
      int v79 = (const char *)&unk_222DFB9BF;
      __int16 v80 = 2080;
      v81 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v82 = 1024;
      int v83 = 1434;
      _os_log_impl(&dword_222D7E000, v48, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
}

- (void)logPasscodeValidatedWithUserID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v38[4] = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFF910] date];
  id v6 = v5;
  if (self->_internal)
  {
    v37[0] = @"biolog_file_type";
    v37[1] = @"version";
    v38[0] = @"event";
    v38[1] = &unk_26D5C1218;
    v37[2] = @"epoch";
    BOOL v7 = NSNumber;
    [v5 timeIntervalSince1970];
    id v8 = [v7 numberWithDouble:];
    v38[2] = v8;
    v37[3] = @"log_data";
    v35[0] = @"event_name";
    v35[1] = @"user_id";
    v36[0] = @"passcode_validated";
    id v9 = [NSNumber numberWithUnsignedInt:v3];
    v36[1] = v9;
    double v10 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    v38[3] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];

    id v12 = [MEMORY[0x263F08900] dataWithJSONObject:v11 options:3 error:0];
    if (!v12)
    {
      __int16 v26 = (__osLog_BioLog ? __osLog_BioLog : MEMORY[0x263EF8438]);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)uint64_t v30 = "jsonData";
        *(_WORD *)&v30[8] = 2048;
        *(void *)&v30[10] = 0;
        *(_WORD *)&v30[18] = 2080;
        *(void *)&v30[20] = &unk_222DFB9BF;
        __int16 v31 = 2080;
        __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v33 = 1024;
        int v34 = 1505;
        _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    id v13 = NSString;
    uint64_t sequenceNumber = self->_sequenceNumber;
    [v6 timeIntervalSince1970];
    uint64_t v16 = (uint64_t)v15;
    char v17 = [(NSDateFormatter *)self->_milisecondsFormatter stringFromDate:v6];
    unint64_t v18 = [v13 stringWithFormat:@"evt-%05d-%ld%@", sequenceNumber, v16, v17];

    uint64_t v19 = [(BioLog *)self eventPathWithName:@"passcode" date:v6];
    if (v19)
    {
      uint64_t v20 = v19;
      BOOL v21 = [v19 stringByAppendingPathComponent:v18];
      if (self->_internal) {
        __int16 v22 = @"rp_passcode";
      }
      else {
        __int16 v22 = @"rp_keep";
      }
      +[BLRetention setRetentionType:v22 atPath:v20];
      if (__osLog_BioLog) {
        uint64_t v23 = __osLog_BioLog;
      }
      else {
        uint64_t v23 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)uint64_t v30 = v3;
        *(_WORD *)&v30[4] = 2112;
        *(void *)&v30[6] = v21;
        *(_WORD *)&v30[14] = 2080;
        *(void *)&v30[16] = ".json";
        _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_DEFAULT, "logPasscodeValidated %d > %@%s\n", buf, 0x1Cu);
      }
      __int16 v24 = [v21 stringByAppendingString:@".json"];
      BOOL v25 = [(BioLog *)self createFileAtPath:v24 contents:v12 attributes:self->_fileAttributesProtected purgeable:1];

      if (!v25)
      {
        if (__osLog_BioLog) {
          __int16 v28 = __osLog_BioLog;
        }
        else {
          __int16 v28 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)uint64_t v30 = "result";
          *(_WORD *)&v30[8] = 2048;
          *(void *)&v30[10] = 0;
          *(_WORD *)&v30[18] = 2080;
          *(void *)&v30[20] = &unk_222DFB9BF;
          __int16 v31 = 2080;
          __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
          __int16 v33 = 1024;
          int v34 = 1523;
          _os_log_impl(&dword_222D7E000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
    }
    else
    {
      if (__osLog_BioLog) {
        uint64_t v27 = __osLog_BioLog;
      }
      else {
        uint64_t v27 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)uint64_t v30 = "eventPath";
        *(_WORD *)&v30[8] = 2048;
        *(void *)&v30[10] = 0;
        *(_WORD *)&v30[18] = 2080;
        *(void *)&v30[20] = &unk_222DFB9BF;
        __int16 v31 = 2080;
        __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v33 = 1024;
        int v34 = 1510;
        _os_log_impl(&dword_222D7E000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      BOOL v21 = 0;
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
    id v12 = 0;
    BOOL v21 = 0;
    uint64_t v20 = 0;
    unint64_t v18 = 0;
  }
}

- (void)logSecureFaceDetectStart:(id *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (__osLogTrace_BioLog) {
    id v5 = __osLogTrace_BioLog;
  }
  else {
    id v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = WORD2(a3->var3.var0);
    *(_DWORD *)buf = 67109120;
    int v27 = v6;
    _os_log_impl(&dword_222D7E000, v5, OS_LOG_TYPE_DEFAULT, "logSecureFaceDetectStart <- [%u:*]\n", buf, 8u);
  }
  if (self->_secureFaceDetectDict) {
    [(BioLog *)self logSecureFaceDetectInfo];
  }
  unint64_t v7 = *(void *)(&a3->var2 + 1);
  *(_DWORD *)((char *)&self->_secureSequenceId.nanotime + 7) = *(_DWORD *)((char *)&a3->var3.var0 + 3);
  self->_secureSequenceId.nanotime = v7;
  id v8 = [MEMORY[0x263F2AAC8] dateFromNanoTime:self->_secureSequenceId.nanotime nanoseconds:0];
  id v21 = objc_alloc(MEMORY[0x263EFF9A0]);
  v24[0] = @"biolog_file_type";
  v24[1] = @"version";
  v25[0] = @"secureFaceDetectSequence";
  v25[1] = &unk_26D5C1218;
  v24[2] = @"epoch";
  id v9 = NSNumber;
  [v8 timeIntervalSince1970];
  double v10 = [v9 numberWithDouble:];
  v25[2] = v10;
  v24[3] = @"seq_data";
  uint64_t v11 = (void *)MEMORY[0x263EFF9A0];
  v22[0] = @"request";
  id v12 = [NSNumber numberWithUnsignedInt:a3->var0];
  v23[0] = v12;
  v22[1] = @"flags";
  id v13 = [NSNumber numberWithUnsignedInt:a3->var1];
  v23[1] = v13;
  v22[2] = @"sessionID";
  id v14 = [NSNumber numberWithUnsignedInt:a3->var2];
  v23[2] = v14;
  v23[3] = MEMORY[0x263EFFA80];
  v22[3] = @"stopped";
  v22[4] = @"final_state";
  v23[4] = &unk_26D5C1248;
  double v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];
  uint64_t v16 = [v11 dictionaryWithDictionary:v15];
  v25[3] = v16;
  v24[4] = @"frame_array";
  char v17 = [MEMORY[0x263EFF980] array];
  v25[4] = v17;
  unint64_t v18 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];
  uint64_t v19 = (NSDictionary *)[v21 initWithDictionary:v18];
  secureFaceDetectDict = self->_secureFaceDetectDict;
  self->_secureFaceDetectDict = v19;
}

- (void)logSecureFaceDetectState:(int)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  secureFaceDetectDict = self->_secureFaceDetectDict;
  if (secureFaceDetectDict)
  {
    uint64_t v4 = *(void *)&a3;
    obuint64_t j = secureFaceDetectDict;
    objc_sync_enter(obj);
    int v6 = [NSNumber numberWithUnsignedInt:v4];
    unint64_t v7 = [(NSDictionary *)self->_secureFaceDetectDict objectForKeyedSubscript:@"seq_data"];
    [v7 setObject:v6 forKeyedSubscript:@"final_state"];

    objc_sync_exit(obj);
  }
  else
  {
    if (__osLog_BioLog) {
      id v8 = __osLog_BioLog;
    }
    else {
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v11 = "_secureFaceDetectDict";
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      double v15 = &unk_222DFB9BF;
      __int16 v16 = 2080;
      char v17 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v18 = 1024;
      int v19 = 1564;
      _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
}

- (void)logSecureFaceDetectStop
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  secureFaceDetectDict = self->_secureFaceDetectDict;
  if (secureFaceDetectDict)
  {
    obuint64_t j = secureFaceDetectDict;
    objc_sync_enter(obj);
    uint64_t v4 = [(NSDictionary *)self->_secureFaceDetectDict objectForKeyedSubscript:@"seq_data"];
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"stopped"];

    [(BioLog *)self logSecureFaceDetectInfo];
    objc_sync_exit(obj);
  }
  else
  {
    if (__osLog_BioLog) {
      id v5 = __osLog_BioLog;
    }
    else {
      id v5 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v8 = "_secureFaceDetectDict";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      __int16 v12 = &unk_222DFB9BF;
      __int16 v13 = 2080;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v15 = 1024;
      int v16 = 1574;
      _os_log_impl(&dword_222D7E000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
}

- (void)logSecureFrameMeta:(id)a3 timestamp:(id)a4
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v53 = a3;
  id v54 = a4;
  if (v53)
  {
    id v66 = [MEMORY[0x263EFF9A0] dictionary];
    if (v66)
    {
      id v5 = NSNumber;
      [v54 timeIntervalSince1970];
      int v6 = [v5 numberWithDouble:];
      [v66 setObject:v6 forKeyedSubscript:@"timestamp"];

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      obuint64_t j = v53;
      uint64_t v59 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
      if (!v59) {
        goto LABEL_60;
      }
      uint64_t v57 = (void *)*MEMORY[0x263EF9F08];
      uint64_t v58 = *(void *)v71;
      uint64_t v56 = (void *)*MEMORY[0x263EF9F00];
      *(void *)&long long v7 = 136316162;
      long long v51 = v7;
      while (1)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v71 != v58) {
            objc_enumerationMutation(obj);
          }
          __int16 v9 = *(void **)(*((void *)&v70 + 1) + 8 * v8);
          if (v9)
          {
            [*(id *)(*((void *)&v70 + 1) + 8 * v8) time];
            if (v69)
            {
              uint64_t v10 = NSNumber;
              [v9 time];
              [v9 time];
              *(float *)&double v11 = (float)v68 / (float)v67;
              uint64_t v12 = [v10 numberWithFloat:v11];
              goto LABEL_13;
            }
          }
          else
          {
            char v69 = 0;
          }
          uint64_t v12 = [MEMORY[0x263EFF9D0] null:v51];
LABEL_13:
          __int16 v13 = (void *)v12;
          [v66 setObject:v12 forKeyedSubscript:@"timestamp_av" atIndex:v51];

          __int16 v14 = [v9 type];
          LODWORD(v13) = v14 == v57;

          if (v13)
          {
            id v21 = v9;
            __int16 v22 = [v66 objectForKeyedSubscript:@"face"];
            BOOL v23 = v22 == 0;

            if (!v23)
            {
              uint64_t v45 = (__osLog_BioLog ? __osLog_BioLog : MEMORY[0x263EF8438]);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v51;
                __int16 v82 = "frameDict[@\"face\"] == ((void *)0)";
                __int16 v83 = 2048;
                uint64_t v84 = 0;
                __int16 v85 = 2080;
                id v86 = &unk_222DFB9BF;
                __int16 v87 = 2080;
                v88 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
                __int16 v89 = 1024;
                int v90 = 1615;
                _os_log_impl(&dword_222D7E000, v45, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
            }
            v78[0] = @"pitch_angle";
            if ([v21 hasPitchAngle])
            {
              __int16 v24 = NSNumber;
              [v21 pitchAngle];
              [v24 numberWithDouble:];
            }
            else
            {
              [MEMORY[0x263EFF9D0] null];
            unint64_t v65 = };
            v79[0] = v65;
            v78[1] = @"yaw_angle";
            if ([v21 hasYawAngle])
            {
              BOOL v25 = NSNumber;
              [v21 yawAngle];
              [v25 numberWithDouble:];
            }
            else
            {
              [MEMORY[0x263EFF9D0] null];
            unint64_t v64 = };
            v79[1] = v64;
            v78[2] = @"roll_angle";
            if ([v21 hasRollAngle])
            {
              __int16 v26 = NSNumber;
              [v21 rollAngle];
              [v26 numberWithDouble:];
            }
            else
            {
              [MEMORY[0x263EFF9D0] null];
            int v27 = };
            v79[2] = v27;
            v78[3] = @"distance";
            if ([v21 hasDistance])
            {
              uint64_t v28 = NSNumber;
              [v21 distance];
              [v28 numberWithDouble:];
            }
            else
            {
              [MEMORY[0x263EFF9D0] null];
            int v63 = };
            v79[3] = v63;
            v78[4] = @"bounds";
            v76[0] = @"x";
            uint64_t v29 = NSNumber;
            [v21 bounds];
            __int16 v62 = [v29 numberWithDouble:x0];
            v77[0] = v62;
            v76[1] = @"y";
            uint64_t v30 = NSNumber;
            [v21 bounds];
            unint64_t v61 = [v30 numberWithDouble:v31];
            v77[1] = v61;
            v76[2] = @"width";
            __int16 v32 = NSNumber;
            [v21 bounds];
            BOOL v60 = [v32 numberWithDouble:v33];
            v77[2] = v60;
            v76[3] = @"height";
            int v34 = NSNumber;
            [v21 bounds];
            uint64_t v36 = [v34 numberWithDouble:v35];
            v77[3] = v36;
            uint64_t v37 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:4];
            v79[4] = v37;
            v78[5] = @"paying_attention";
            if ([v21 hasPayingAttention]) {
              [NSNumber numberWithBool:[v21 payingAttention]];
            }
            else {
            uint64_t v38 = [MEMORY[0x263EFF9D0] null];
            }
            v79[5] = v38;
            v78[6] = @"orientation";
            if ([v21 hasOrientation]) {
              [NSNumber numberWithUnsignedInteger:[v21 orientation]];
            }
            else {
            __int16 v39 = [MEMORY[0x263EFF9D0] null];
            }
            v79[6] = v39;
            v78[7] = @"confidence";
            if ([v21 hasConfidence])
            {
              unint64_t v40 = NSNumber;
              [v21 confidence];
              [v40 numberWithDouble:];
            }
            else
            {
              [MEMORY[0x263EFF9D0] null];
            unint64_t v41 = };
            v79[7] = v41;
            v78[8] = @"paying_attention_confidence";
            if ([v21 hasPayingAttentionConfidence])
            {
              int v42 = NSNumber;
              [v21 payingAttentionConfidence];
              [v42 numberWithDouble:];
            }
            else
            {
              [MEMORY[0x263EFF9D0] null];
            __int16 v43 = };
            v79[8] = v43;
            int v44 = [NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:9];
            [v66 setObject:v44 forKeyedSubscript:@"face"];
          }
          else
          {
            __int16 v15 = [v9 type];
            BOOL v16 = v15 == v56;

            if (!v16) {
              goto LABEL_47;
            }
            id v17 = v9;
            __int16 v18 = [v66 objectForKeyedSubscript:@"eye_relief_status"];
            BOOL v19 = v18 == 0;

            if (!v19)
            {
              __int16 v46 = (__osLog_BioLog ? __osLog_BioLog : MEMORY[0x263EF8438]);
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v51;
                __int16 v82 = "frameDict[@\"eye_relief_status\"] == ((void *)0)";
                __int16 v83 = 2048;
                uint64_t v84 = 0;
                __int16 v85 = 2080;
                id v86 = &unk_222DFB9BF;
                __int16 v87 = 2080;
                v88 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
                __int16 v89 = 1024;
                int v90 = 1640;
                _os_log_impl(&dword_222D7E000, v46, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
            }
            v74[0] = @"eye_relief_status";
            unint64_t v65 = [NSNumber numberWithUnsignedInteger:[v17 eyeReliefStatus]];
            v74[1] = @"distance";
            v75[0] = v65;
            if ([v17 hasDistance])
            {
              uint64_t v20 = NSNumber;
              [v17 distance];
              [v20 numberWithDouble:];
            }
            else
            {
              [MEMORY[0x263EFF9D0] null];
            unint64_t v64 = };
            v75[1] = v64;
            int v27 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];
            [v66 setObject:v27 forKeyedSubscript:@"eye_relief_status"];
          }

LABEL_47:
          ++v8;
        }
        while (v59 != v8);
        uint64_t v47 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
        uint64_t v59 = v47;
        if (!v47)
        {
LABEL_60:

          __int16 v48 = self->_secureFaceDetectDict;
          objc_sync_enter(v48);
          long long v49 = [(NSDictionary *)self->_secureFaceDetectDict objectForKeyedSubscript:@"frame_array"];
          [v49 addObject:v66];

          objc_sync_exit(v48);
          goto LABEL_61;
        }
      }
    }
    if (__osLog_BioLog) {
      int v50 = __osLog_BioLog;
    }
    else {
      int v50 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v82 = "frameDict";
      __int16 v83 = 2048;
      uint64_t v84 = 0;
      __int16 v85 = 2080;
      id v86 = &unk_222DFB9BF;
      __int16 v87 = 2080;
      v88 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v89 = 1024;
      int v90 = 1590;
      goto LABEL_72;
    }
  }
  else
  {
    if (__osLog_BioLog) {
      int v50 = __osLog_BioLog;
    }
    else {
      int v50 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v82 = "metadataObjects";
      __int16 v83 = 2048;
      uint64_t v84 = 0;
      __int16 v85 = 2080;
      id v86 = &unk_222DFB9BF;
      __int16 v87 = 2080;
      v88 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v89 = 1024;
      int v90 = 1587;
LABEL_72:
      _os_log_impl(&dword_222D7E000, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
LABEL_61:
}

- (void)logSecureFaceDetectInfo
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace_BioLog) {
    uint64_t v4 = __osLogTrace_BioLog;
  }
  else {
    uint64_t v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int number = self->_secureSequenceId.number;
    *(_DWORD *)buf = 67109120;
    LODWORD(v32) = number;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEFAULT, "logSecureFaceDetectInfo [%u:*]\n", buf, 8u);
  }
  secureFaceDetectDict = self->_secureFaceDetectDict;
  if (secureFaceDetectDict)
  {
    long long v7 = secureFaceDetectDict;
    objc_sync_enter(v7);
    uint64_t v8 = self->_secureFaceDetectDict;
    __int16 v9 = self->_secureFaceDetectDict;
    self->_secureFaceDetectDict = 0;

    objc_sync_exit(v7);
    uint64_t v10 = [MEMORY[0x263F2AAC8] dateFromNanoTime:self->_secureSequenceId.nanotime nanoseconds:0];
    double v11 = NSString;
    uint64_t v12 = self->_secureSequenceId.number;
    [v10 timeIntervalSince1970];
    uint64_t v14 = (uint64_t)v13;
    __int16 v15 = [(NSDateFormatter *)self->_milisecondsFormatter stringFromDate:v10];
    BOOL v16 = [v11 stringWithFormat:@"sec-%05d-%ld%@%@", v12, v14, v15, @".json"];

    if (v16)
    {
      id v17 = [(BioLog *)self sequencePathForId:&self->_secureSequenceId];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = [v17 stringByAppendingPathComponent:v16];
        if (v19)
        {
          uint64_t v20 = (void *)v19;
          dispatchQueueWriting = self->_dispatchQueueWriting;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __33__BioLog_logSecureFaceDetectInfo__block_invoke;
          block[3] = &unk_26466F9F0;
          int v27 = v8;
          id v18 = v18;
          id v28 = v18;
          id v22 = v20;
          id v29 = v22;
          uint64_t v30 = self;
          dispatch_async(dispatchQueueWriting, block);

LABEL_11:
          return;
        }
        if (__osLog_BioLog) {
          BOOL v25 = __osLog_BioLog;
        }
        else {
          BOOL v25 = v3;
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v32 = "filePath";
          __int16 v33 = 2048;
          uint64_t v34 = 0;
          __int16 v35 = 2080;
          uint64_t v36 = &unk_222DFB9BF;
          __int16 v37 = 2080;
          uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
          __int16 v39 = 1024;
          int v40 = 1689;
          _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
LABEL_30:
        id v22 = 0;
        goto LABEL_11;
      }
      if (__osLog_BioLog) {
        __int16 v24 = __osLog_BioLog;
      }
      else {
        __int16 v24 = v3;
      }
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
LABEL_29:
        id v18 = 0;
        goto LABEL_30;
      }
      *(_DWORD *)buf = 136316162;
      __int16 v32 = "sequencePath";
      __int16 v33 = 2048;
      uint64_t v34 = 0;
      __int16 v35 = 2080;
      uint64_t v36 = &unk_222DFB9BF;
      __int16 v37 = 2080;
      uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v39 = 1024;
      int v40 = 1686;
    }
    else
    {
      if (__osLog_BioLog) {
        __int16 v24 = __osLog_BioLog;
      }
      else {
        __int16 v24 = v3;
      }
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 136316162;
      __int16 v32 = "filename";
      __int16 v33 = 2048;
      uint64_t v34 = 0;
      __int16 v35 = 2080;
      uint64_t v36 = &unk_222DFB9BF;
      __int16 v37 = 2080;
      uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v39 = 1024;
      int v40 = 1683;
    }
    _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_29;
  }
  if (__osLog_BioLog) {
    BOOL v23 = __osLog_BioLog;
  }
  else {
    BOOL v23 = v3;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v32 = "_secureFaceDetectDict";
    __int16 v33 = 2048;
    uint64_t v34 = 0;
    __int16 v35 = 2080;
    uint64_t v36 = &unk_222DFB9BF;
    __int16 v37 = 2080;
    uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
    __int16 v39 = 1024;
    int v40 = 1668;
    _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
}

void __33__BioLog_logSecureFaceDetectInfo__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = [MEMORY[0x263F08900] dataWithJSONObject:*(void *)(a1 + 32) options:3 error:0];
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"seq_data"];
    id v5 = [v4 objectForKeyedSubscript:@"final_state"];
    int v6 = [v5 isEqual:&unk_26D5C1260];

    if (v6) {
      +[BLRetention setRetentionType:@"rp_noface" atPath:*(void *)(a1 + 40)];
    }
    objc_sync_exit(v2);

    long long v7 = MEMORY[0x263EF8438];
    if (__osLog_BioLog) {
      uint64_t v8 = __osLog_BioLog;
    }
    else {
      uint64_t v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = v8;
      uint64_t v10 = [v3 length];
      uint64_t v11 = *(void *)(a1 + 48);
      int v14 = 134218242;
      __int16 v15 = (const char *)v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_DEFAULT, "logSecureFaceDetectInfo: %lu > %@\n", (uint8_t *)&v14, 0x16u);
    }
    if (([*(id *)(a1 + 56) createFileAtPath:*(void *)(a1 + 48) contents:v3 attributes:*(void *)(*(void *)(a1 + 56) + 72) purgeable:1] & 1) == 0)
    {
      if (__osLog_BioLog) {
        double v13 = __osLog_BioLog;
      }
      else {
        double v13 = v7;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136316162;
        __int16 v15 = "result";
        __int16 v16 = 2048;
        uint64_t v17 = 0;
        __int16 v18 = 2080;
        uint64_t v19 = &unk_222DFB9BF;
        __int16 v20 = 2080;
        id v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
        __int16 v22 = 1024;
        int v23 = 1707;
        _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog_BioLog) {
      uint64_t v12 = __osLog_BioLog;
    }
    else {
      uint64_t v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136316162;
      __int16 v15 = "jsonData";
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2080;
      uint64_t v19 = &unk_222DFB9BF;
      __int16 v20 = 2080;
      id v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BioLog.m";
      __int16 v22 = 1024;
      int v23 = 1697;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
    }
    objc_sync_exit(v2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueueWriting, 0);
  objc_storeStrong((id *)&self->_secureFaceDetectDict, 0);
  objc_storeStrong((id *)&self->_allVsAllLogFileArray, 0);
  objc_storeStrong((id *)&self->_allVsAllScoreDict, 0);
  objc_storeStrong((id *)&self->_scoreDataArray, 0);
  objc_storeStrong((id *)&self->_cropFrameBufferSemaphore, 0);
  objc_storeStrong((id *)&self->_cropFrameBuffer, 0);
  objc_storeStrong((id *)&self->_retentionQueue, 0);
  objc_storeStrong((id *)&self->_milisecondsFormatter, 0);
  objc_storeStrong((id *)&self->_fileNameFormatter, 0);
  objc_storeStrong((id *)&self->_fileAttributesAutoUpload, 0);
  objc_storeStrong((id *)&self->_fileAttributesProtected, 0);
  objc_storeStrong((id *)&self->_fileAttributes, 0);
  objc_storeStrong((id *)&self->_logContextBasePath, 0);
  objc_storeStrong((id *)&self->_sequencePath, 0);
  objc_storeStrong((id *)&self->_logPath, 0);

  objc_storeStrong((id *)&self->_rootPath, 0);
}

@end