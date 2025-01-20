@interface PLSubmissionFile
- (BOOL)createTagFileWithPath:(id)a3;
- (BOOL)createTagFileWithPath:(id)a3 withInfo:(id)a4;
- (BOOL)iCloudUploadEnabled;
- (NSString)directory;
- (NSString)fileName;
- (PLSubmissionConfig)taskingConfig;
- (PLSubmissionFile)initWithConfig:(id)a3;
- (id)fileExtension;
- (id)filePath;
- (id)fileType;
- (int)submitLogToDAWithBugType:(id)a3;
- (void)cleanupTmpDirectory;
- (void)decorateFile;
- (void)decorateFileAtPath:(id)a3;
- (void)logSubmissionResultToCAWithErrorType:(int)a3 withFileType:(id)a4 withOverrideKeys:(id)a5;
- (void)setDirectory:(id)a3;
- (void)setFileName:(id)a3;
- (void)setFileNameWithSubmissionType:(id)a3 withID:(id)a4;
- (void)setICloudUploadEnabled:(BOOL)a3;
- (void)setTaskingConfig:(id)a3;
- (void)submit;
- (void)submitLogToiCloud:(id)a3 WithCompress:(BOOL)a4;
- (void)submitLogToiCloudWithCompress:(BOOL)a3;
@end

@implementation PLSubmissionFile

- (PLSubmissionFile)initWithConfig:(id)a3
{
  id v5 = a3;
  v6 = [(PLSubmissionFile *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_taskingConfig, a3);
    v8 = NSString;
    v9 = [v5 tagUUID];
    v10 = [v5 tagUUID];
    uint64_t v11 = [v10 length];
    v12 = @"/";
    if (!v11) {
      v12 = &stru_1F15208F0;
    }
    uint64_t v13 = [v8 stringWithFormat:@"%@%@%@", @"/tmp/powerlog/", v9, v12];
    directory = v7->_directory;
    v7->_directory = (NSString *)v13;

    fileName = v7->_fileName;
    v7->_fileName = 0;

    v7->_iCloudUploadEnabled = 1;
    v16 = [v5 startDate];
    v17 = [v16 convertFromMonotonicToSystem];

    v18 = [v5 endDate];
    v19 = [v18 convertFromMonotonicToSystem];

    v20 = [MEMORY[0x1E4F1C9C8] filenameDateStringWithStartDate:v17 endDate:v19];
    if (![v20 length])
    {
      uint64_t v21 = [v5 tagUUID];

      v20 = (void *)v21;
    }
    v22 = [v5 getSubmitReasonTypeToStorageEventOTAType];
    [(PLSubmissionFile *)v7 setFileNameWithSubmissionType:v22 withID:v20];
  }
  return v7;
}

- (void)setFileNameWithSubmissionType:(id)a3 withID:(id)a4
{
  v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  id v12 = [(PLSubmissionFile *)self fileType];
  v9 = [(PLSubmissionFile *)self fileExtension];
  v10 = [v6 stringWithFormat:@"%@OTA%@Submission_%@%@", v12, v8, v7, v9];

  fileName = self->_fileName;
  self->_fileName = v10;
}

- (id)filePath
{
  v3 = NSString;
  v4 = [(PLSubmissionFile *)self directory];
  id v5 = [(PLSubmissionFile *)self fileName];
  v6 = [v3 stringWithFormat:@"%@%@", v4, v5];

  return v6;
}

- (id)fileType
{
  return &stru_1F15208F0;
}

- (id)fileExtension
{
  return &stru_1F15208F0;
}

- (int)submitLogToDAWithBugType:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLSubmissionFile *)self filePath];
  int64_t v6 = +[PLFileStats fileSizeAtPath:v5];

  id v7 = [(PLSubmissionFile *)self taskingConfig];
  id v8 = [v7 capSize];
  uint64_t v9 = [v8 longLongValue];

  if (v6 <= v9)
  {
    v39 = @"override-fileName";
    v14 = [(PLSubmissionFile *)self fileName];
    v40[0] = v14;
    int v13 = 1;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    v16 = (void *)MEMORY[0x1E4F1CB10];
    v17 = [(PLSubmissionFile *)self filePath];
    v18 = [v16 fileURLWithPath:v17];
    int v19 = PLOSAMoveFileForSubmissions();

    if (v19)
    {
      v20 = [(PLSubmissionFile *)self filePath];
      uint64_t v21 = [v20 lastPathComponent];
      v22 = [@"/var/mobile/Library/Logs/CrashReporter/" stringByAppendingPathComponent:v21];
      +[PLUtilities markFileAsPurgeable:v22 withUrgency:512];

      int v13 = 0;
      uint64_t v12 = 1;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = [(PLSubmissionFile *)self filePath];
    [v10 removeItemAtPath:v11 error:0];

    uint64_t v12 = 0;
    int v13 = 2;
  }
  v23 = [(PLSubmissionFile *)self taskingConfig];
  int v24 = [v23 submitReasonType];

  if (v24 == 3)
  {
    v25 = [(PLSubmissionFile *)self taskingConfig];
    v26 = [v25 request];
    if (v26)
    {
      v27 = [(PLSubmissionFile *)self taskingConfig];
      v28 = [v27 request];
    }
    else
    {
      v28 = @"request nil";
    }

    v29 = +[PLSubmissions sharedInstance];
    v37[0] = @"Type";
    v30 = [(PLSubmissionFile *)self taskingConfig];
    v31 = [v30 getSubmitReasonTypeToStorageEventOTAType];
    v38[0] = v31;
    v38[1] = v28;
    v37[1] = @"Name";
    v37[2] = @"Success";
    v32 = [NSNumber numberWithBool:v12];
    v38[2] = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
    [v29 logOTAStatus:v33];
  }
  else
  {
    v28 = +[PLSubmissions sharedInstance];
    v35[0] = @"Type";
    v29 = [(PLSubmissionFile *)self taskingConfig];
    v30 = [v29 getSubmitReasonTypeToStorageEventOTAType];
    v36[0] = v30;
    v35[1] = @"Success";
    v31 = [NSNumber numberWithBool:v12];
    v36[1] = v31;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
    [(__CFString *)v28 logOTAStatus:v32];
  }

  return v13;
}

- (void)logSubmissionResultToCAWithErrorType:(int)a3 withFileType:(id)a4 withOverrideKeys:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = (__CFString *)a4;
  id v9 = a5;
  v10 = v9;
  if (!v9 || [v9 count] != 4)
  {
    switch((int)v6)
    {
      case 0:
        v16 = NSString;
        v17 = [(PLSubmissionFile *)self taskingConfig];
        v18 = [v17 getSubmitReasonTypeToCAFieldValue];
        int v19 = [v16 stringWithFormat:@"%@", v18];

        int v13 = v19;
        v15 = @"noError";
        v14 = v13;
        if (v13) {
          goto LABEL_15;
        }
        goto LABEL_21;
      case 1:
        int v13 = [NSString stringWithFormat:@"%@", @"submissionFail.OSA"];
        v14 = @"submissionFail";
        v15 = @"OSA";
        if (!v13) {
          goto LABEL_21;
        }
        goto LABEL_15;
      case 2:
        int v13 = [NSString stringWithFormat:@"%@", @"submissionFail.fileOverLimit"];
        v14 = @"submissionFail";
        v15 = @"fileOverLimit";
        if (v13) {
          goto LABEL_15;
        }
        goto LABEL_21;
      case 3:
        int v13 = [NSString stringWithFormat:@"%@", @"submissionFail.noFile"];
        v14 = @"submissionFail";
        v15 = @"noFile";
        if (!v13) {
          goto LABEL_21;
        }
LABEL_15:
        v20 = &stru_1F15208F0;
        if (v8) {
          v20 = v8;
        }
        uint64_t v21 = ".";
        if (!v8) {
          uint64_t v21 = "";
        }
        uint64_t v11 = [NSString stringWithFormat:@"com.apple.powerlog.%@%s%@", v20, v21, v13];
        goto LABEL_23;
      default:
        v15 = 0;
        v14 = 0;
LABEL_21:
        uint64_t v11 = 0;
        goto LABEL_24;
    }
  }
  uint64_t v11 = [v10 objectAtIndexedSubscript:v6];
  uint64_t v12 = [v10 objectAtIndexedSubscript:v6];
  int v13 = [v12 componentsSeparatedByString:@"."];

  if (v6 || (unint64_t)[(__CFString *)v13 count] < 4)
  {
    if ((unint64_t)[(__CFString *)v13 count] < 5)
    {
      v15 = 0;
      v14 = 0;
    }
    else
    {
      v14 = [(__CFString *)v13 objectAtIndexedSubscript:3];
      v15 = [(__CFString *)v13 objectAtIndexedSubscript:4];
    }
  }
  else
  {
    v14 = [(__CFString *)v13 objectAtIndexedSubscript:3];
    v15 = @"noError";
  }
LABEL_23:

LABEL_24:
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v22 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__PLSubmissionFile_logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v22;
    if (logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys__defaultOnce != -1) {
      dispatch_once(&logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys__defaultOnce, block);
    }
    if (logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys__classDebugEnabled)
    {
      v23 = [NSString stringWithFormat:@"Set aggdKey = %@ for OTA submission result: error = %d, filetype = %@, overrideKeys = %@ (%d == %d)", v11, v6, v8, v10, objc_msgSend(v10, "count"), 4];
      int v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m"];
      v25 = [v24 lastPathComponent];
      v26 = [NSString stringWithUTF8String:"-[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]"];
      +[PLCoreStorage logMessage:v23 fromFile:v25 fromFunction:v26 fromLineNumber:172];

      v27 = PLLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if (v14)
  {
    v28 = v14;
    v29 = v15;
    v30 = v8;
    AnalyticsSendEventLazy();
  }
  if (v11) {
    PLADClientAddValueForScalarKey();
  }
}

BOOL __87__PLSubmissionFile_logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys__classDebugEnabled = result;
  return result;
}

id __87__PLSubmissionFile_logSubmissionResultToCAWithErrorType_withFileType_withOverrideKeys___block_invoke_87(void *a1)
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"source";
  v5[1] = @"reason";
  v1 = (__CFString *)a1[5];
  if (!v1) {
    v1 = &stru_1F15208F0;
  }
  v6[0] = a1[4];
  v6[1] = v1;
  v5[2] = @"fileType";
  v2 = (__CFString *)a1[6];
  if (!v2) {
    v2 = &stru_1F15208F0;
  }
  v6[2] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  return v3;
}

- (void)decorateFile
{
  id v3 = [(PLSubmissionFile *)self filePath];
  [(PLSubmissionFile *)self decorateFileAtPath:v3];
}

- (void)decorateFileAtPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PLSubmissionFile *)self taskingConfig];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = +[PLSubmissionConfig getDateMarkerFromSystemDate:v6];

  id v8 = v4;
  id v9 = (const char *)[v8 UTF8String];
  id v10 = v7;
  uint64_t v11 = (const void *)[v10 UTF8String];
  id v125 = v10;
  size_t v12 = strlen((const char *)[v125 UTF8String]);
  if (setxattr(v9, "com.apple.powerlog.handoverDate", v11, v12, 0, 0)
    && +[PLDefaults debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v13;
    if (decorateFileAtPath__defaultOnce != -1) {
      dispatch_once(&decorateFileAtPath__defaultOnce, block);
    }
    if (decorateFileAtPath__classDebugEnabled)
    {
      v14 = NSString;
      uint64_t v15 = *__error();
      v16 = __error();
      v17 = [v14 stringWithFormat:@"Add decoration to %@ \"%s:%@\" failed %d(%s)\n", v8, "com.apple.powerlog.handoverDate", v125, v15, strerror(*v16)];
      v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m"];
      int v19 = [v18 lastPathComponent];
      v20 = [NSString stringWithUTF8String:"-[PLSubmissionFile decorateFileAtPath:]"];
      +[PLCoreStorage logMessage:v17 fromFile:v19 fromFunction:v20 fromLineNumber:198];

      uint64_t v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v22 = [v5 getDateMarker];
  id v23 = v8;
  int v24 = (const char *)[v23 UTF8String];
  id v25 = v22;
  v26 = (const void *)[v25 UTF8String];
  id v124 = v25;
  size_t v27 = strlen((const char *)[v124 UTF8String]);
  if (setxattr(v24, "com.apple.powerlog.collectDate", v26, v27, 0, 0)
    && +[PLDefaults debugEnabled])
  {
    uint64_t v28 = objc_opt_class();
    v134[0] = MEMORY[0x1E4F143A8];
    v134[1] = 3221225472;
    v134[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_106;
    v134[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v134[4] = v28;
    if (decorateFileAtPath__defaultOnce_104 != -1) {
      dispatch_once(&decorateFileAtPath__defaultOnce_104, v134);
    }
    if (decorateFileAtPath__classDebugEnabled_105)
    {
      v29 = NSString;
      uint64_t v30 = *__error();
      v31 = __error();
      v32 = [v29 stringWithFormat:@"Add decoration to %@ \"%s:%@\" failed %d(%s)\n", v23, "com.apple.powerlog.collectDate", v124, v30, strerror(*v31)];
      v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m"];
      v34 = [v33 lastPathComponent];
      v35 = [NSString stringWithUTF8String:"-[PLSubmissionFile decorateFileAtPath:]"];
      +[PLCoreStorage logMessage:v32 fromFile:v34 fromFunction:v35 fromLineNumber:202];

      v36 = PLLogCommon();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  unsigned __int8 value = [v5 internal];
  id v37 = v23;
  if (setxattr((const char *)[v37 UTF8String], "com.apple.powerlog.internal", &value, 1uLL, 0, 0)
    && +[PLDefaults debugEnabled])
  {
    uint64_t v38 = objc_opt_class();
    v132[0] = MEMORY[0x1E4F143A8];
    v132[1] = 3221225472;
    v132[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_110;
    v132[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v132[4] = v38;
    if (decorateFileAtPath__defaultOnce_108 != -1) {
      dispatch_once(&decorateFileAtPath__defaultOnce_108, v132);
    }
    if (decorateFileAtPath__classDebugEnabled_109)
    {
      v39 = NSString;
      uint64_t v40 = value;
      uint64_t v41 = *__error();
      v42 = __error();
      v43 = [v39 stringWithFormat:@"Add decoration to %@ \"%s:%d\" failed %d(%s)\n", v37, "com.apple.powerlog.internal", v40, v41, strerror(*v42)];
      v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m"];
      v45 = [v44 lastPathComponent];
      v46 = [NSString stringWithUTF8String:"-[PLSubmissionFile decorateFileAtPath:]"];
      +[PLCoreStorage logMessage:v43 fromFile:v45 fromFunction:v46 fromLineNumber:206];

      v47 = PLLogCommon();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  unsigned __int8 v131 = [v5 seed];
  id v48 = v37;
  if (setxattr((const char *)[v48 UTF8String], "com.apple.powerlog.beta", &v131, 1uLL, 0, 0)
    && +[PLDefaults debugEnabled])
  {
    uint64_t v49 = objc_opt_class();
    v130[0] = MEMORY[0x1E4F143A8];
    v130[1] = 3221225472;
    v130[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_117;
    v130[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v130[4] = v49;
    if (decorateFileAtPath__defaultOnce_115 != -1) {
      dispatch_once(&decorateFileAtPath__defaultOnce_115, v130);
    }
    if (decorateFileAtPath__classDebugEnabled_116)
    {
      v50 = NSString;
      uint64_t v51 = v131;
      uint64_t v52 = *__error();
      v53 = __error();
      v54 = [v50 stringWithFormat:@"Add decoration to %@ \"%s:%d\" failed %d(%s)\n", v48, "com.apple.powerlog.beta", v51, v52, strerror(*v53)];
      v55 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m"];
      v56 = [v55 lastPathComponent];
      v57 = [NSString stringWithUTF8String:"-[PLSubmissionFile decorateFileAtPath:]"];
      +[PLCoreStorage logMessage:v54 fromFile:v56 fromFunction:v57 fromLineNumber:210];

      v58 = PLLogCommon();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  id v59 = v48;
  v60 = (const char *)[v59 UTF8String];
  id v61 = [v5 deviceModel];
  v62 = (const void *)[v61 UTF8String];
  id v63 = [v5 deviceModel];
  size_t v64 = strlen((const char *)[v63 UTF8String]);
  LODWORD(v60) = setxattr(v60, "com.apple.powerlog.deviceModel", v62, v64, 0, 0);

  if (v60 && +[PLDefaults debugEnabled])
  {
    uint64_t v65 = objc_opt_class();
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_121;
    v129[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v129[4] = v65;
    if (decorateFileAtPath__defaultOnce_119 != -1) {
      dispatch_once(&decorateFileAtPath__defaultOnce_119, v129);
    }
    if (decorateFileAtPath__classDebugEnabled_120)
    {
      v66 = NSString;
      v67 = [v5 deviceModel];
      uint64_t v68 = *__error();
      v69 = __error();
      v70 = [v66 stringWithFormat:@"Add decoration to %@ \"%s:%@\" failed %d(%s)\n", v59, "com.apple.powerlog.deviceModel", v67, v68, strerror(*v69)];

      v71 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m"];
      v72 = [v71 lastPathComponent];
      v73 = [NSString stringWithUTF8String:"-[PLSubmissionFile decorateFileAtPath:]"];
      +[PLCoreStorage logMessage:v70 fromFile:v72 fromFunction:v73 fromLineNumber:213];

      v74 = PLLogCommon();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v75 = [v5 builds];
  v76 = [v75 lastObject];

  if (v76)
  {
    id v77 = v59;
    v78 = (const char *)[v77 UTF8String];
    id v79 = v76;
    v80 = (const void *)[v79 UTF8String];
    id v81 = v79;
    size_t v82 = strlen((const char *)[v81 UTF8String]);
    if (setxattr(v78, "com.apple.powerlog.build", v80, v82, 0, 0))
    {
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v83 = objc_opt_class();
        v128[0] = MEMORY[0x1E4F143A8];
        v128[1] = 3221225472;
        v128[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_125;
        v128[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v128[4] = v83;
        if (decorateFileAtPath__defaultOnce_123 != -1) {
          dispatch_once(&decorateFileAtPath__defaultOnce_123, v128);
        }
        if (decorateFileAtPath__classDebugEnabled_124)
        {
          v84 = NSString;
          uint64_t v85 = *__error();
          v86 = __error();
          v87 = [v84 stringWithFormat:@"Add decoration to %@ \"%s:%@\" failed %d(%s)\n", v77, "com.apple.powerlog.build", v81, v85, strerror(*v86)];
          v88 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m"];
          v89 = [v88 lastPathComponent];
          v90 = [NSString stringWithUTF8String:"-[PLSubmissionFile decorateFileAtPath:]"];
          +[PLCoreStorage logMessage:v87 fromFile:v89 fromFunction:v90 fromLineNumber:218];

          v91 = PLLogCommon();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
    }
  }
  id v92 = v59;
  v93 = (const char *)[v92 UTF8String];
  id v94 = [v5 tagUUID];
  v95 = (const void *)[v94 UTF8String];
  id v96 = [v5 tagUUID];
  size_t v97 = strlen((const char *)[v96 UTF8String]);
  LODWORD(v93) = setxattr(v93, "com.apple.powerlog.TagUUID", v95, v97, 0, 0);

  if (v93 && +[PLDefaults debugEnabled])
  {
    uint64_t v98 = objc_opt_class();
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_129;
    v127[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v127[4] = v98;
    if (decorateFileAtPath__defaultOnce_127 != -1) {
      dispatch_once(&decorateFileAtPath__defaultOnce_127, v127);
    }
    if (decorateFileAtPath__classDebugEnabled_128)
    {
      v99 = NSString;
      v100 = [v5 tagUUID];
      uint64_t v101 = *__error();
      v102 = __error();
      v103 = [v99 stringWithFormat:@"Add decoration to %@ \"%s:%@\" failed %d(%s)\n", v92, "com.apple.powerlog.TagUUID", v100, v101, strerror(*v102)];

      v104 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m"];
      v105 = [v104 lastPathComponent];
      v106 = [NSString stringWithUTF8String:"-[PLSubmissionFile decorateFileAtPath:]"];
      +[PLCoreStorage logMessage:v103 fromFile:v105 fromFunction:v106 fromLineNumber:222];

      v107 = PLLogCommon();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v108 = [v5 getSubmitReasonTypeToReasonLog];
  id v109 = v92;
  v110 = (const char *)[v109 UTF8String];
  id v111 = v108;
  v112 = (const void *)[v111 UTF8String];
  id v113 = v111;
  size_t v114 = strlen((const char *)[v113 UTF8String]);
  if (setxattr(v110, "com.apple.powerlog.reason", v112, v114, 0, 0)
    && +[PLDefaults debugEnabled])
  {
    uint64_t v115 = objc_opt_class();
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __39__PLSubmissionFile_decorateFileAtPath___block_invoke_133;
    v126[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v126[4] = v115;
    if (decorateFileAtPath__defaultOnce_131 != -1) {
      dispatch_once(&decorateFileAtPath__defaultOnce_131, v126);
    }
    if (decorateFileAtPath__classDebugEnabled_132)
    {
      v116 = NSString;
      uint64_t v117 = *__error();
      v118 = __error();
      v119 = [v116 stringWithFormat:@"Add decoration to %@ \"%s:%@\" failed %d(%s)\n", v109, "com.apple.powerlog.reason", v113, v117, strerror(*v118)];
      v120 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m"];
      v121 = [v120 lastPathComponent];
      v122 = [NSString stringWithUTF8String:"-[PLSubmissionFile decorateFileAtPath:]"];
      +[PLCoreStorage logMessage:v119 fromFile:v121 fromFunction:v122 fromLineNumber:226];

      v123 = PLLogCommon();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decorateFileAtPath__classDebugEnabled = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_106(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decorateFileAtPath__classDebugEnabled_105 = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_110(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decorateFileAtPath__classDebugEnabled_109 = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_117(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decorateFileAtPath__classDebugEnabled_116 = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_121(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decorateFileAtPath__classDebugEnabled_120 = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_125(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decorateFileAtPath__classDebugEnabled_124 = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_129(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decorateFileAtPath__classDebugEnabled_128 = result;
  return result;
}

BOOL __39__PLSubmissionFile_decorateFileAtPath___block_invoke_133(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  decorateFileAtPath__classDebugEnabled_132 = result;
  return result;
}

- (BOOL)createTagFileWithPath:(id)a3
{
  return [(PLSubmissionFile *)self createTagFileWithPath:a3 withInfo:0];
}

- (BOOL)createTagFileWithPath:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PLSubmissionFile *)self taskingConfig];
  id v9 = [v8 tagUUID];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
    uint64_t v11 = [v8 tagUUID];
    [v10 setObject:v11 forKeyedSubscript:@"TagUUID"];

    size_t v12 = [v8 getDateMarker];
    [v10 setObject:v12 forKeyedSubscript:@"Date"];

    uint64_t v13 = [v8 builds];
    v14 = [v13 lastObject];
    [v10 setObject:v14 forKeyedSubscript:@"Build"];

    uint64_t v15 = [v8 deviceModel];
    [v10 setObject:v15 forKeyedSubscript:@"Model"];

    if ([v8 internal]) {
      v16 = @"true";
    }
    else {
      v16 = @"false";
    }
    [v10 setObject:v16 forKeyedSubscript:@"Internal"];
    if ([v8 seed]) {
      v17 = @"true";
    }
    else {
      v17 = @"false";
    }
    [v10 setObject:v17 forKeyedSubscript:@"Beta"];
    if ([MEMORY[0x1E4F28D90] isValidJSONObject:v10])
    {
      v18 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:0 error:0];
      int v19 = (void *)[[NSString alloc] initWithData:v18 encoding:4];
      char v20 = [v19 writeToFile:v6 atomically:0 encoding:4 error:0];
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (void)submit
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__PLSubmissionFile_submit__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (submit_defaultOnce != -1) {
      dispatch_once(&submit_defaultOnce, block);
    }
    if (submit_classDebugEnabled)
    {
      id v3 = [NSString stringWithFormat:@"PLSubmissionFile: submit\n"];
      id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m"];
      id v5 = [v4 lastPathComponent];
      id v6 = [NSString stringWithUTF8String:"-[PLSubmissionFile submit]"];
      +[PLCoreStorage logMessage:v3 fromFile:v5 fromFunction:v6 fromLineNumber:266];

      id v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __26__PLSubmissionFile_submit__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  submit_classDebugEnabled = result;
  return result;
}

- (void)submitLogToiCloud:(id)a3 WithCompress:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = [(PLSubmissionFile *)self taskingConfig];
    id v8 = [v7 tagUUID];

    if (v8)
    {
      id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v10 = [v9 fileExistsAtPath:v6];

      if (v10)
      {
        +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:@"/tmp/powerlog/cloud/"];
        uint64_t v11 = NSString;
        size_t v12 = [(PLSubmissionFile *)self taskingConfig];
        uint64_t v13 = [v12 tagUUID];
        v14 = [v11 stringWithFormat:@"%@Powerlog_%@/", @"/tmp/powerlog/cloud/", v13];

        if (v14) {
          +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:v14];
        }
        uint64_t v15 = NSString;
        v16 = [v6 lastPathComponent];
        v17 = [v15 stringWithFormat:@"%@%@", v14, v16];

        if (v4)
        {
          BOOL v18 = +[PLUtilities compressWithSource:v6 withDestination:v17 withLevel:4];
          int v19 = PLLogSubmission();
          char v20 = v19;
          if (v18)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
              -[PLSubmissionFile submitLogToiCloud:WithCompress:]();
            }

            [(PLSubmissionFile *)self decorateFileAtPath:v17];
          }
          else
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              -[PLSubmissionFile submitLogToiCloud:WithCompress:]();
            }
          }
        }
        else
        {
          uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v27 = 0;
          int v22 = [v21 copyItemAtPath:v6 toPath:v17 error:&v27];
          id v23 = v27;

          int v24 = PLLogSubmission();
          id v25 = v24;
          if (v22)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
              -[PLSubmissionFile submitLogToiCloud:WithCompress:]();
            }
          }
          else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v26 = [v23 localizedDescription];
            *(_DWORD *)buf = 138412802;
            id v29 = v6;
            __int16 v30 = 2112;
            v31 = v17;
            __int16 v32 = 2112;
            v33 = v26;
            _os_log_error_impl(&dword_1BBD2F000, v25, OS_LOG_TYPE_ERROR, "Failed to copy '%@' to '%@' for submission due to error '%@'", buf, 0x20u);
          }
        }
      }
      else
      {
        v14 = PLLogSubmission();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[PLSubmissionFile submitLogToiCloud:WithCompress:].cold.4();
        }
      }
    }
  }
}

- (void)submitLogToiCloudWithCompress:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PLSubmissionFile *)self filePath];
  [(PLSubmissionFile *)self submitLogToiCloud:v5 WithCompress:v3];
}

- (void)cleanupTmpDirectory
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v4 = [(PLSubmissionFile *)self directory];
  char v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v7 = [(PLSubmissionFile *)self directory];
    id v22 = 0;
    [v6 removeItemAtPath:v7 error:&v22];
    id v8 = v22;

    id v9 = NSString;
    char v10 = [(PLSubmissionFile *)self directory];
    uint64_t v11 = [(PLSubmissionFile *)self fileName];
    size_t v12 = [v9 stringWithFormat:@"Cleanup remove directory %@, file %@, %@", v10, v11, v8];

    uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m"];
    v14 = [v13 lastPathComponent];
    uint64_t v15 = [NSString stringWithUTF8String:"-[PLSubmissionFile cleanupTmpDirectory]"];
    +[PLCoreStorage logMessage:v12 fromFile:v14 fromFunction:v15 fromLineNumber:321];

    v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v24 = v12;
      _os_log_impl(&dword_1BBD2F000, v16, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
  else
  {
    v17 = NSString;
    BOOL v18 = [(PLSubmissionFile *)self directory];
    id v8 = [v17 stringWithFormat:@"Cleanup directory %@ does not exist, skipping removal", v18];

    int v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFile.m"];
    char v20 = [v19 lastPathComponent];
    uint64_t v21 = [NSString stringWithUTF8String:"-[PLSubmissionFile cleanupTmpDirectory]"];
    +[PLCoreStorage logMessage:v8 fromFile:v20 fromFunction:v21 fromLineNumber:314];

    size_t v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v24 = v8;
      _os_log_impl(&dword_1BBD2F000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
}

- (PLSubmissionConfig)taskingConfig
{
  return (PLSubmissionConfig *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTaskingConfig:(id)a3
{
}

- (NSString)directory
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDirectory:(id)a3
{
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileName:(id)a3
{
}

- (BOOL)iCloudUploadEnabled
{
  return self->_iCloudUploadEnabled;
}

- (void)setICloudUploadEnabled:(BOOL)a3
{
  self->_iCloudUploadEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_taskingConfig, 0);
}

- (void)logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)submitLogToiCloud:WithCompress:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BBD2F000, v0, v1, "Compressed '%@' to '%@' for submission");
}

- (void)submitLogToiCloud:WithCompress:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_ERROR, "Failed to compress '%@' to '%@' for submission", v1, 0x16u);
}

- (void)submitLogToiCloud:WithCompress:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BBD2F000, v0, v1, "Copied '%@' to '%@' for submission");
}

- (void)submitLogToiCloud:WithCompress:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_ERROR, "PLSubmissionFile: file %@ does not exist, cannot submit", v1, 0xCu);
}

@end