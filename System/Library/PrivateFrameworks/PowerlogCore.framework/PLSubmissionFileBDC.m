@interface PLSubmissionFileBDC
- (BOOL)copyAndPrepareLog;
- (PLSubmissionFileBDC)initWithConfig:(id)a3;
- (id)fileExtension;
- (id)fileType;
- (id)getBDCPlistFile;
- (id)getEPSQLFile;
- (id)getListOfRequiredBDCFiles;
- (void)copyAndPrepareLog;
- (void)getBDCPlistFile;
- (void)getEPSQLFile;
- (void)getListOfRequiredBDCFiles;
- (void)submit;
@end

@implementation PLSubmissionFileBDC

- (PLSubmissionFileBDC)initWithConfig:(id)a3
{
  id v4 = a3;
  if (![v4 submitBDC]
    || +[PLPlatform isTVOS]
    || (v8.receiver = self,
        v8.super_class = (Class)PLSubmissionFileBDC,
        v5 = [(PLSubmissionFile *)&v8 initWithConfig:v4],
        (self = v5) != 0)
    && ![(PLSubmissionFileBDC *)v5 copyAndPrepareLog])
  {
    v6 = 0;
  }
  else
  {
    self = self;
    v6 = self;
  }

  return v6;
}

- (void)submit
{
  if ([(PLSubmissionFile *)self iCloudUploadEnabled])
  {
    [(PLSubmissionFile *)self submitLogToiCloudWithCompress:0];
  }
}

- (id)fileType
{
  return @"BDC_logs";
}

- (id)fileExtension
{
  return @".bdc.anon";
}

- (BOOL)copyAndPrepareLog
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  v3 = [(PLSubmissionFileBDC *)self getListOfRequiredBDCFiles];
  if ([v3 count])
  {
    id v4 = [(PLSubmissionFile *)self filePath];
    v5 = [v4 stringByReplacingOccurrencesOfString:@".bdc.anon" withString:&stru_1F15208F0];

    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v7 = [v6 fileExistsAtPath:v5];

    if (v7)
    {
      objc_super v8 = PLLogSubmission();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileBG copyAndPrepareLog]();
      }
      BOOL v9 = 0;
      goto LABEL_54;
    }
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v74 = 0;
    int v11 = [v10 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v74];
    objc_super v8 = v74;

    if ((v11 & 1) == 0)
    {
      v25 = PLLogSubmission();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileBG copyAndPrepareLog].cold.8();
      }
      BOOL v9 = 0;
      goto LABEL_53;
    }
    v61 = v3;
    v63 = self;
    v12 = v5;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v3;
    uint64_t v13 = [obj countByEnumeratingWithState:&v70 objects:v83 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v71;
      do
      {
        uint64_t v16 = 0;
        v17 = v8;
        do
        {
          if (*(void *)v71 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v70 + 1) + 8 * v16);
          v19 = [@"/var/db/Battery/BDC" stringByAppendingPathComponent:v18];
          v20 = [v12 stringByAppendingPathComponent:v18];
          v21 = [MEMORY[0x1E4F28CB8] defaultManager];
          v69 = v17;
          char v22 = [v21 copyItemAtPath:v19 toPath:v20 error:&v69];
          objc_super v8 = v69;

          if ((v22 & 1) == 0)
          {
            v23 = PLLogSubmission();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v78 = v19;
              __int16 v79 = 2112;
              v80 = v20;
              __int16 v81 = 2112;
              v82 = v8;
              _os_log_error_impl(&dword_1BBD2F000, v23, OS_LOG_TYPE_ERROR, "Error trying to copy bdc file from %@ to %@, %@", buf, 0x20u);
            }
          }
          ++v16;
          v17 = v8;
        }
        while (v14 != v16);
        uint64_t v14 = [obj countByEnumeratingWithState:&v70 objects:v83 count:16];
      }
      while (v14);
    }

    v24 = [(PLSubmissionFileBDC *)v63 getEPSQLFile];
    v5 = v12;
    v25 = [v12 stringByAppendingPathComponent:v24];

    v26 = [v25 stringByAppendingFormat:@".gz"];
    v27 = +[PPSCoreStorage sharedSQLStorage];
    v28 = [v27 EPSQLConnection];

    v64 = v28;
    if ([v28 copyDatabaseToPath:v25 fromDate:0 toDate:0 withTableFilters:0 vacuumDB:0])
    {
      if (!+[PLUtilities compressWithSource:v25 withDestination:v26 withLevel:4])
      {
        v29 = PLLogSubmission();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[PLSubmissionFileBG copyAndPrepareLog].cold.6();
        }
      }
      v30 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v30 removeItemAtPath:v25 error:0];

      v31 = [MEMORY[0x1E4F28CB8] defaultManager];
      v32 = [v25 stringByAppendingString:@"-shm"];
      [v31 removeItemAtPath:v32 error:0];
    }
    else
    {
      v31 = PLLogSubmission();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileCE copyAndPrepareLog].cold.7();
      }
    }
    v3 = v61;

    uint64_t v33 = [v5 stringByAppendingPathComponent:@"tag.json"];
    v34 = [MEMORY[0x1E4F1CA48] arrayWithArray:obj];
    v35 = [v26 lastPathComponent];
    [v34 addObject:v35];

    v75 = @"LogFiles";
    v76 = v34;
    v60 = v34;
    v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    if (!-[PLSubmissionFile createTagFileWithPath:withInfo:](v63, "createTagFileWithPath:withInfo:", v33))
    {
      v36 = PLLogSubmission();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileBG copyAndPrepareLog].cold.5();
      }
    }
    id obja = v26;
    uint64_t v37 = [(PLSubmissionFileBDC *)v63 getBDCPlistFile];
    v62 = (void *)v33;
    v58 = (void *)v37;
    if (v37)
    {
      v38 = (void *)v37;
      v39 = [v5 stringByAppendingPathComponent:@"com.apple.powerd.bdc.plist"];
      v40 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v39];
      v68 = v8;
      char v41 = [v38 writeToURL:v40 error:&v68];
      v42 = v68;

      if ((v41 & 1) == 0)
      {
        v43 = PLLogSubmission();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          -[PLSubmissionFileBDC copyAndPrepareLog].cold.5();
        }
      }
    }
    else
    {
      v39 = PLLogSubmission();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileBDC copyAndPrepareLog].cold.4();
      }
      v42 = v8;
    }

    v44 = (void *)MEMORY[0x1E4F5F3C0];
    v45 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    v46 = [v44 archiveDirectoryAt:v45 deleteOriginal:1];

    if (v46)
    {
      v47 = [MEMORY[0x1E4F28CB8] defaultManager];
      v48 = [v46 path];
      v49 = [(PLSubmissionFile *)v63 filePath];
      v67 = v42;
      int v50 = [v47 moveItemAtPath:v48 toPath:v49 error:&v67];
      objc_super v8 = v67;

      if (v50)
      {
        [(PLSubmissionFile *)v63 decorateFile];
        BOOL v9 = 1;
        v51 = v58;
        v52 = obja;
LABEL_52:

LABEL_53:
LABEL_54:

        goto LABEL_55;
      }
      v53 = PLLogSubmission();
      v51 = v58;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileBDC copyAndPrepareLog]();
      }

      v54 = [MEMORY[0x1E4F28CB8] defaultManager];
      v55 = [v46 path];
      [v54 removeItemAtPath:v55 error:0];
    }
    else
    {
      objc_super v8 = v42;
      v51 = v58;
    }
    v56 = PLLogSubmission();
    v52 = obja;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFileBDC copyAndPrepareLog]();
    }

    BOOL v9 = 0;
    goto LABEL_52;
  }
  BOOL v9 = 0;
LABEL_55:

  return v9;
}

- (id)getListOfRequiredBDCFiles
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = 0;
  v3 = [v2 contentsOfDirectoryAtPath:@"/var/db/Battery/BDC" error:&v20];
  id v4 = v20;

  v5 = [MEMORY[0x1E4F1CA48] array];
  if (v4)
  {
    v6 = PLLogSubmission();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(PLSubmissionFileBDC *)(uint64_t)v4 getListOfRequiredBDCFiles];
    }
LABEL_4:

    id v7 = 0;
    goto LABEL_16;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v5, "addObject:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v13 = [v5 count];
  uint64_t v14 = PLLogSubmission();
  v6 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFileBDC getListOfRequiredBDCFiles]();
    }
    goto LABEL_4;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFileBDC getListOfRequiredBDCFiles]();
  }

  id v7 = v5;
LABEL_16:

  return v7;
}

- (id)getEPSQLFile
{
  v3 = [(PLSubmissionFile *)self taskingConfig];
  id v4 = [v3 startDate];
  v5 = [v4 convertFromMonotonicToSystem];

  v6 = [(PLSubmissionFile *)self taskingConfig];
  id v7 = [v6 endDate];
  id v8 = [v7 convertFromMonotonicToSystem];

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] filenameDateStringWithStartDate:v5 endDate:v8];
  if (![v9 length])
  {
    uint64_t v10 = [(PLSubmissionFile *)self taskingConfig];
    uint64_t v11 = [v10 tagUUID];

    uint64_t v9 = (void *)v11;
  }
  v12 = [NSString stringWithFormat:@"log_%@.EPSQL", v9];
  uint64_t v13 = PLLogSubmission();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFileBDC getEPSQLFile]();
  }

  return v12;
}

- (id)getBDCPlistFile
{
  mach_service = xpc_connection_create_mach_service("com.apple.iokit.powerdxpc", MEMORY[0x1E4F14428], 0);
  v3 = mach_service;
  if (!mach_service)
  {
    uint64_t v14 = PLLogSubmission();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFileBDC getBDCPlistFile]();
    }

    goto LABEL_14;
  }
  id v4 = (void *)MEMORY[0x1E4F14428];
  xpc_connection_set_target_queue(mach_service, MEMORY[0x1E4F14428]);

  xpc_connection_set_event_handler(v3, &__block_literal_global_31);
  xpc_connection_resume(v3);
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (!v5)
  {
    uint64_t v15 = PLLogSubmission();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFileBDC getBDCPlistFile]();
    }

    xpc_connection_cancel(v3);
LABEL_14:
    long long v16 = 0;
    goto LABEL_21;
  }
  v6 = v5;
  xpc_dictionary_set_BOOL(v5, "BDCXPCCopyDefaults", 1);
  id v7 = [PLTimer alloc];
  id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
  uint64_t v9 = dispatch_get_global_queue(2, 0);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __38__PLSubmissionFileBDC_getBDCPlistFile__block_invoke_50;
  v23[3] = &unk_1E6254400;
  uint64_t v10 = v3;
  v24 = v10;
  uint64_t v11 = [(PLTimer *)v7 initWithFireDate:v8 withInterval:0 withTolerance:0 repeats:v9 withUserInfo:v23 withQueue:0.0 withBlock:0.0];

  xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(v10, v6);
  [(PLTimer *)v11 invalidate];
  if (!v12)
  {
    uint64_t v13 = PLLogSubmission();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFileBDC getBDCPlistFile]();
    }
    goto LABEL_17;
  }
  if (MEMORY[0x1C1869B20](v12) != MEMORY[0x1E4F14590])
  {
    if (MEMORY[0x1C1869B20](v12) != MEMORY[0x1E4F145A8])
    {
LABEL_18:
      xpc_connection_cancel(v10);
      goto LABEL_19;
    }
    uint64_t v13 = PLLogSubmission();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFileBDC getBDCPlistFile].cold.6();
    }
LABEL_17:

    goto LABEL_18;
  }
  long long v18 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  long long v19 = PLLogSubmission();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFileBDC getBDCPlistFile].cold.5();
  }

  xpc_connection_cancel(v10);
  if (v18)
  {
    id v20 = [v18 objectForKeyedSubscript:@"returnCode"];
    int v21 = [v20 intValue];

    if (!v21)
    {
      long long v16 = [v18 objectForKeyedSubscript:@"BDCXPCCopyDefaults"];

      goto LABEL_20;
    }
    uint64_t v22 = PLLogSubmission();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      [(PLSubmissionFileBDC *)v21 getBDCPlistFile];
    }
  }
LABEL_19:
  long long v16 = 0;
LABEL_20:

LABEL_21:
  return v16;
}

void __38__PLSubmissionFileBDC_getBDCPlistFile__block_invoke_50(uint64_t a1)
{
  v2 = PLLogSubmission();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __38__PLSubmissionFileBDC_getBDCPlistFile__block_invoke_50_cold_1();
  }

  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

- (void)copyAndPrepareLog
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to copy BDC plist to %@, %@");
}

- (void)getListOfRequiredBDCFiles
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  v3 = @"/var/db/Battery/BDC";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Error accessing BDC dir: %@, %@", (uint8_t *)&v2, 0x16u);
}

- (void)getEPSQLFile
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_DEBUG, "Requested BDC EPSQL file: %@", v1, 0xCu);
}

- (void)getBDCPlistFile
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "Failed to receive response from powerd via XPC, %@", v2, v3, v4, v5, v6);
}

void __38__PLSubmissionFileBDC_getBDCPlistFile__block_invoke_50_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "[ERROR] Timeout occured while trying to retrieve BDC plist from powerd", v2, v3, v4, v5, v6);
}

@end