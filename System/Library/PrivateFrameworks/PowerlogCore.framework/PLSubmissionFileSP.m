@interface PLSubmissionFileSP
- (BOOL)copyAndPrepareLog;
- (PLSubmissionFileSP)initWithConfig:(id)a3;
- (id)fileType;
- (void)copyAndPrepareLog;
@end

@implementation PLSubmissionFileSP

- (PLSubmissionFileSP)initWithConfig:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLSubmissionFileSP;
  v3 = [(PLSubmissionFile *)&v7 initWithConfig:a3];
  v4 = v3;
  if (v3 && ![(PLSubmissionFileSP *)v3 copyAndPrepareLog]) {
    v5 = 0;
  }
  else {
    v5 = v4;
  }

  return v5;
}

- (id)fileType
{
  return @"Signpost";
}

- (BOOL)copyAndPrepareLog
{
  v2 = self;
  v56[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PLSubmissionFile *)self taskingConfig];
  if (![v3 signpostDisable])
  {
    if (!+[PLPlatform internalBuild]
      || !+[PLDefaults BOOLForKey:@"SignpostReaderDisable" ifNotSet:0])
    {
      uint64_t v11 = [v3 signpostAllowlist];
      if (v11) {
        v12 = v11;
      }
      else {
        v12 = &unk_1F1586990;
      }
      if (+[PLPlatform internalBuild])
      {
        v13 = [v12 mutableCopy];
        [v13 setObject:MEMORY[0x1E4F1CBF0] forKey:@"com.apple.metrickit.log"];
        [v13 setObject:&unk_1F1585A60 forKeyedSubscript:@"com.apple.signpost_emitter"];

        v12 = v13;
      }
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v15 = [v3 tagUUID];
      [v14 setObject:v15 forKeyedSubscript:@"TagUUID"];

      v16 = [v3 builds];
      v17 = [v16 lastObject];
      [v14 setObject:v17 forKeyedSubscript:@"Build"];

      v18 = [v3 deviceModel];
      [v14 setObject:v18 forKeyedSubscript:@"Model"];

      if ([v3 internal]) {
        v19 = @"true";
      }
      else {
        v19 = @"false";
      }
      [v14 setObject:v19 forKeyedSubscript:@"Internal"];
      if ([v3 seed]) {
        v20 = @"true";
      }
      else {
        v20 = @"false";
      }
      [v14 setObject:v20 forKeyedSubscript:@"Beta"];
      v21 = [v3 getSubmitReasonTypeToReasonLog];
      [v14 setObject:v21 forKeyedSubscript:@"Reason"];

      v22 = [v3 getDateMarkerLegacy];
      [v14 setObject:v22 forKeyedSubscript:@"Date"];

      v55[0] = @"CollectDate";
      v23 = [v3 getDateMarker];
      v55[1] = @"SignpostStartDate";
      v56[0] = v23;
      v24 = [MEMORY[0x1E4F1C9C8] date];
      v25 = +[PLSubmissionConfig getDateMarkerFromSystemDate:v24];
      v56[1] = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
      [v14 setObject:v26 forKeyedSubscript:@"ExtendedAttributes"];

      v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "submittedFilesMask"));
      [v14 setObject:v27 forKeyedSubscript:@"SubmittedFilesMask"];

      v28 = (void *)[v14 mutableCopy];
      v29 = [v14 objectForKeyedSubscript:@"ExtendedAttributes"];
      v30 = [v29 serializedJSONString];
      [v28 setObject:v30 forKeyedSubscript:@"ExtendedAttributes"];

      v31 = [v3 startDate];
      v32 = [v31 convertFromMonotonicToSystem];

      v33 = [v3 endDate];
      v34 = [v33 convertFromMonotonicToSystem];

      v35 = objc_alloc_init(SignpostReaderHelper);
      v36 = [(PLSubmissionFile *)v2 taskingConfig];
      v51 = v12;
      v37 = -[SignpostReaderHelper generateSignpostSubmissionWithTagConfig:withAllowlist:withStartDate:withEndDate:includeSPFile:](v35, "generateSignpostSubmissionWithTagConfig:withAllowlist:withStartDate:withEndDate:includeSPFile:", v28, v12, v32, v34, [v36 submitSP]);

      v38 = PLLogSubmission();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = [v37 objectForKeyedSubscript:@"tarballPath"];
        *(_DWORD *)buf = 138412290;
        v54 = v39;
        _os_log_impl(&dword_1BBD2F000, v38, OS_LOG_TYPE_DEFAULT, "PerfPowerServicesSignpostReader tarball path: %@", buf, 0xCu);
      }
      v40 = [v37 objectForKeyedSubscript:@"tarballPath"];
      v41 = [(PLSubmissionFile *)v2 taskingConfig];
      [v41 setFilePath:v40];

      v42 = [(PLSubmissionFile *)v2 taskingConfig];
      [v42 setCkTagConfig:v14];

      if (v37)
      {
        objc_opt_class();
        uint64_t v43 = 3;
        if (objc_opt_isKindOfClass())
        {
          [v37 objectForKeyedSubscript:@"success"];
          v50 = v2;
          v44 = v28;
          v45 = v35;
          v46 = v34;
          v48 = v47 = v32;
          int v10 = [v48 BOOLValue];

          v32 = v47;
          v34 = v46;
          v35 = v45;
          v28 = v44;
          v2 = v50;
          if (v10) {
            uint64_t v43 = 0;
          }
          else {
            uint64_t v43 = 3;
          }
        }
        else
        {
          LOBYTE(v10) = 0;
        }
      }
      else
      {
        LOBYTE(v10) = 0;
        uint64_t v43 = 3;
      }
      [(PLSubmissionFile *)v2 logSubmissionResultToCAWithErrorType:v43 withFileType:@"signpost" withOverrideKeys:0];

      v5 = v51;
      goto LABEL_36;
    }
    v5 = PLLogSubmission();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "signpost collection disabled", buf, 2u);
    }
LABEL_13:
    LOBYTE(v10) = 0;
LABEL_36:

    goto LABEL_37;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLSubmissionFileSP_copyAndPrepareLog__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (copyAndPrepareLog_defaultOnce != -1) {
      dispatch_once(&copyAndPrepareLog_defaultOnce, block);
    }
    if (copyAndPrepareLog_classDebugEnabled)
    {
      v5 = [NSString stringWithFormat:@"copyAndPrepareLog: Signpost submission disabled"];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFileSP.m"];
      objc_super v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLSubmissionFileSP copyAndPrepareLog]"];
      +[PLCoreStorage logMessage:v5 fromFile:v7 fromFunction:v8 fromLineNumber:53];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        [(PLSubmissionFileSP *)(uint64_t)v5 copyAndPrepareLog];
      }

      goto LABEL_13;
    }
  }
  LOBYTE(v10) = 0;
LABEL_37:

  return v10;
}

BOOL __39__PLSubmissionFileSP_copyAndPrepareLog__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  copyAndPrepareLog_classDebugEnabled = result;
  return result;
}

- (void)copyAndPrepareLog
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

@end