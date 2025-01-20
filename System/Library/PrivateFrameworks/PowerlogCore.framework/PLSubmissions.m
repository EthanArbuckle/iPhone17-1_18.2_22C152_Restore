@interface PLSubmissions
+ (id)sharedInstance;
- (BOOL)fullModeSubmissionBehavior;
- (BOOL)internalSubmissionBehavior;
- (BOOL)taskingBlobDRExists;
- (BOOL)taskingBlobExists;
- (BOOL)taskingBlobLegacyExists;
- (BOOL)taskingStarted;
- (BOOL)taskingTypeSpecified;
- (BOOL)xpcActivityStarted;
- (DRConfigMonitor)taskingMonitor;
- (NSMutableArray)submissionQueue;
- (NSNumber)capValue;
- (NSString)filterQuery;
- (NSString)onDemandTasking;
- (NSString)request;
- (PLSQLiteConnection)connection;
- (PLStorageOperator)storageOperator;
- (PLSubmissions)init;
- (double)lastXPCActivityTimestamp;
- (double)xpcActivityDelay;
- (id)configFromMonitor:(id)a3;
- (id)createWatchdogForSubmissionActivity:(id)a3;
- (id)enqueueFileForUpload:(id)a3;
- (id)generateMSSSubmissionWithPayload:(id)a3;
- (id)getCurrentDRConfig;
- (id)getLastBatteryTimestampSystem;
- (id)workQueue;
- (int)checkTaskingCompletionStatus;
- (signed)submitReasonForToday;
- (void)attemptToUnregisterUploadSchedulingActivity;
- (void)cleanupTemporarySubmissionFilesForTag:(id)a3;
- (void)clearTaskingDRConfig;
- (void)deferXPCActivity:(id)a3;
- (void)disableHangtracer;
- (void)emitBlobDetectedEvent:(id)a3;
- (void)emitBlobVerifiedEvent:(id)a3;
- (void)emitCollisionEvent:(id)a3;
- (void)enableHangtracer;
- (void)enqueueSubmissionRecord:(id)a3;
- (void)fileCleanupWithRecord:(id)a3;
- (void)finishXPCActivity:(id)a3;
- (void)generateOTASubmissionAndSendTaskingEndSubmission:(BOOL)a3;
- (void)generatePLLSubmissionWithPayload:(id)a3;
- (void)handleDRConfigUpdate:(id)a3 error:(id)a4;
- (void)handleXPCActivityCallback:(id)a3;
- (void)initSubmissionQueue;
- (void)logOTAStatus:(id)a3;
- (void)logSubmissionStateToAnalytics:(id)a3;
- (void)logTaskingStatus:(int)a3 withAction:(int)a4;
- (void)logTaskingStatus:(int)a3 withAction:(int)a4 withTables:(id)a5;
- (void)logTaskingTablesTurnedOn:(id)a3;
- (void)performSubmission:(id)a3;
- (void)persistSubmissionInfo:(id)a3;
- (void)prepareAndEnqueueSubmissionFilesWithConfig:(id)a3;
- (void)registerUploadSchedulingActivity;
- (void)rejectTaskingDRConfig;
- (void)removeFileAtPath:(id)a3;
- (void)removeFileAtURL:(id)a3;
- (void)sendSubmissionIssueSignature:(id)a3;
- (void)setCapValue:(id)a3;
- (void)setConnection:(id)a3;
- (void)setFilterQuery:(id)a3;
- (void)setLastXPCActivityTimestamp:(double)a3;
- (void)setOnDemandTasking:(id)a3;
- (void)setRequest:(id)a3;
- (void)setStorageOperator:(id)a3;
- (void)setSubmissionQueue:(id)a3;
- (void)setTaskingMonitor:(id)a3;
- (void)setXpcActivityDelay:(double)a3;
- (void)setXpcActivityStarted:(BOOL)a3;
- (void)setupDRTasking;
- (void)stopDRTasking;
- (void)stopWatchdogForSubmissionActivity:(id)a3;
- (void)submitRecord:(id)a3 withActivity:(id)a4;
- (void)submitRecordToDiagnosticPipeline:(id)a3 withConfig:(id)a4;
- (void)submitWithTaskingConfig:(id)a3;
- (void)taskingCleanup;
- (void)taskingModeSafeguard;
- (void)taskingModeSetup;
@end

@implementation PLSubmissions

- (id)enqueueFileForUpload:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogSubmission();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 filePath];
    v7 = [v4 ckTagConfig];
    *(_DWORD *)buf = 138412546;
    v30 = v6;
    __int16 v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "File enqueued for submission: %@ %@", buf, 0x16u);
  }
  uint64_t v8 = [v4 filePath];
  if (v8)
  {
    v9 = (void *)v8;
    uint64_t v10 = [v4 ckTagConfig];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [v4 tagUUID];

      if (v12)
      {
        v13 = [PLSubmissionRecord alloc];
        v14 = [v4 filePath];
        v15 = [v4 tagUUID];
        v16 = [v4 ckTagConfig];
        v17 = [v4 configUUID];
        v18 = [v4 configDateReceived];
        v19 = [v4 configDateApplied];
        v20 = [(PLSubmissionRecord *)v13 initWithCKFilePath:v14 tagUUID:v15 tagConfig:v16 configUUID:v17 configDateReceived:v18 configDateApplied:v19];

        [(PLSubmissionRecord *)v20 emitAttemptEvent];
        v21 = [(PLSubmissions *)self workQueue];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __53__PLSubmissions_XPCScheduling__enqueueFileForUpload___block_invoke;
        v27[3] = &unk_1E62539B8;
        v27[4] = self;
        v22 = v20;
        v28 = v22;
        dispatch_async(v21, v27);

        v23 = v28;
        v24 = v22;

        v25 = v24;
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  v24 = PLLogSubmission();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[PLSubmissions(XPCScheduling) enqueueFileForUpload:]();
  }
  v25 = 0;
LABEL_11:

  return v25;
}

uint64_t __53__PLSubmissions_XPCScheduling__enqueueFileForUpload___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) submissionQueue];
  [v2 addObject:*(void *)(a1 + 40)];

  uint64_t result = [*(id *)(a1 + 32) xpcActivityStarted];
  if ((result & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 registerUploadSchedulingActivity];
  }
  return result;
}

- (void)enqueueSubmissionRecord:(id)a3
{
  id v4 = a3;
  v5 = [(PLSubmissions *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PLSubmissions_XPCScheduling__enqueueSubmissionRecord___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __56__PLSubmissions_XPCScheduling__enqueueSubmissionRecord___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) submissionQueue];
  [v2 addObject:*(void *)(a1 + 40)];

  uint64_t result = [*(id *)(a1 + 32) xpcActivityStarted];
  if ((result & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 registerUploadSchedulingActivity];
  }
  return result;
}

- (void)registerUploadSchedulingActivity
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLLogSubmission();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Registering submission scheduler", buf, 2u);
  }

  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14330], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14338], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F14270], (const char *)*MEMORY[0x1E4F14280]);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F14298], 20971520);
  int64_t v5 = +[PLDefaults longForKey:@"submissionActivityDelayInSecs" ifNotSet:0];
  if (!v5) {
    int64_t v5 = 60 * arc4random_uniform(0x3Du);
  }
  id v6 = PLLogSubmission();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v10 = v5;
    _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_DEFAULT, "Delay of %lld secs", buf, 0xCu);
  }

  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F14170], v5);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F14218]);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141A8], *MEMORY[0x1E4F141F8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v7 timeIntervalSince1970];
  -[PLSubmissions setLastXPCActivityTimestamp:](self, "setLastXPCActivityTimestamp:");

  [(PLSubmissions *)self setXpcActivityDelay:(double)v5];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __64__PLSubmissions_XPCScheduling__registerUploadSchedulingActivity__block_invoke;
  handler[3] = &unk_1E62548B0;
  handler[4] = self;
  xpc_activity_register("com.apple.powerlogd.XPCScheduler", v4, handler);
  [(PLSubmissions *)self setXpcActivityStarted:1];
}

void __64__PLSubmissions_XPCScheduling__registerUploadSchedulingActivity__block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  xpc_object_t v4 = PLLogSubmission();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "Scheduling for background work", buf, 2u);
  }

  if (xpc_activity_get_state(v3) != 2)
  {
    id v6 = PLLogSubmission();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_DEFAULT, "Activity state: not to run", buf, 2u);
    }
    goto LABEL_10;
  }
  if (!xpc_activity_set_state(v3, 4))
  {
    id v6 = PLLogSubmission();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __64__PLSubmissions_XPCScheduling__registerUploadSchedulingActivity__block_invoke_cold_1();
    }
LABEL_10:

    goto LABEL_11;
  }
  int64_t v5 = [*(id *)(a1 + 32) workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PLSubmissions_XPCScheduling__registerUploadSchedulingActivity__block_invoke_14;
  v7[3] = &unk_1E62539B8;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  dispatch_async(v5, v7);

LABEL_11:
}

uint64_t __64__PLSubmissions_XPCScheduling__registerUploadSchedulingActivity__block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleXPCActivityCallback:*(void *)(a1 + 40)];
}

- (void)attemptToUnregisterUploadSchedulingActivity
{
  if (![(PLSubmissions *)self internalSubmissionBehavior]) {
    goto LABEL_3;
  }
  v3 = [MEMORY[0x1E4F1C9C8] date];
  xpc_object_t v4 = [MEMORY[0x1E4F1C9C8] nearestMidnightAfterDate:v3];
  [v4 timeIntervalSinceDate:v3];
  double v6 = v5;
  double v7 = (double)(uint64_t)*MEMORY[0x1E4F14218];

  if (v6 >= v7)
  {
LABEL_3:
    id v8 = PLLogSubmission();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "Unregistering submission scheduler", v9, 2u);
    }

    xpc_activity_unregister("com.apple.powerlogd.XPCScheduler");
    [(PLSubmissions *)self setXpcActivityStarted:0];
    [(PLSubmissions *)self setLastXPCActivityTimestamp:0.0];
  }
}

- (void)handleXPCActivityCallback:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = (_xpc_activity_s *)a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v5 = [(PLSubmissions *)self submissionQueue];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v5);
      }
      int64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
      if (![v10 inSubmission]) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v10;

    if (!v11) {
      goto LABEL_15;
    }
    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    v13 = [v11 filePath];
    char v14 = [v12 fileExistsAtPath:v13];

    if (v14)
    {
      if (v4 && xpc_activity_should_defer(v4)) {
        [(PLSubmissions *)self deferXPCActivity:v4];
      }
      else {
        [(PLSubmissions *)self submitRecord:v11 withActivity:v4];
      }
    }
    else
    {
      v18 = PLLogSubmission();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1BBD2F000, v18, OS_LOG_TYPE_DEFAULT, "Submission record does not exist", v19, 2u);
      }

      [(PLSubmissions *)self fileCleanupWithRecord:v11];
      [(PLSubmissions *)self finishXPCActivity:v4];
    }
  }
  else
  {
LABEL_9:

LABEL_15:
    v15 = PLLogSubmission();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1BBD2F000, v15, OS_LOG_TYPE_DEFAULT, "Nothing to submit", v19, 2u);
    }

    [(PLSubmissions *)self finishXPCActivity:v4];
    v16 = [(PLSubmissions *)self submissionQueue];
    uint64_t v17 = [v16 count];

    if (!v17) {
      [(PLSubmissions *)self attemptToUnregisterUploadSchedulingActivity];
    }
  }
}

- (void)submitRecord:(id)a3 withActivity:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v8 timeIntervalSince1970];
  double v10 = v9;

  [(PLSubmissions *)self lastXPCActivityTimestamp];
  double v12 = v10 - v11;
  [(PLSubmissions *)self xpcActivityDelay];
  if (v12 >= v13)
  {
    [(PLSubmissions *)self setLastXPCActivityTimestamp:v10];
    v15 = PLLogSubmission();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = v6;
      _os_log_impl(&dword_1BBD2F000, v15, OS_LOG_TYPE_DEFAULT, "Submit record: %@", buf, 0xCu);
    }

    [v6 setInSubmission:1];
    v16 = [v6 filePath];
    uint64_t v17 = [v6 tagConfig];
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.perfpowerservices.tasking" environment:1];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v18];
    v62 = [v19 publicCloudDatabase];
    long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"Attachment"];
    id v21 = objc_alloc(MEMORY[0x1E4F19E50]);
    long long v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16];
    uint64_t v23 = [v21 initWithFileURL:v22];

    if (v23)
    {
      v60 = v19;
      v61 = v18;
      v59 = (void *)v23;
      [v20 setObject:v23 forKeyedSubscript:@"asset"];
      v24 = [v16 lastPathComponent];
      [v20 setObject:v24 forKeyedSubscript:@"fileName"];

      uint64_t v25 = [v17 objectForKeyedSubscript:@"Internal"];
      if ([v25 isEqualToString:@"true"]) {
        v26 = &unk_1F1580900;
      }
      else {
        v26 = &unk_1F1580918;
      }
      [v20 setObject:v26 forKeyedSubscript:@"internal"];

      v27 = [v17 objectForKeyedSubscript:@"Beta"];
      if ([v27 isEqualToString:@"true"]) {
        v28 = &unk_1F1580900;
      }
      else {
        v28 = &unk_1F1580918;
      }
      [v20 setObject:v28 forKeyedSubscript:@"seed"];

      [v20 setObject:@"iOS" forKeyedSubscript:@"machineType"];
      v29 = [v20 objectForKeyedSubscript:@"machineType"];
      int v30 = [v29 isEqualToString:@"iOS"];

      if (v30 && +[PLPlatform isiPad]) {
        [v20 setObject:@"iPadOS" forKeyedSubscript:@"machineType"];
      }
      __int16 v31 = [v17 objectForKeyedSubscript:@"Model"];

      if (v31)
      {
        v32 = [v17 objectForKeyedSubscript:@"Model"];
        [v20 setObject:v32 forKeyedSubscript:@"deviceModel"];
      }
      uint64_t v33 = [v17 objectForKeyedSubscript:@"TagUUID"];

      if (v33)
      {
        v34 = [v17 objectForKeyedSubscript:@"TagUUID"];
        [v20 setObject:v34 forKeyedSubscript:@"UUID"];
      }
      v35 = [v17 objectForKeyedSubscript:@"Reason"];

      if (v35)
      {
        v36 = [v17 objectForKeyedSubscript:@"Reason"];
        [v20 setObject:v36 forKeyedSubscript:@"reason"];
      }
      v37 = [v17 objectForKeyedSubscript:@"Build"];

      if (v37)
      {
        v38 = [v17 objectForKeyedSubscript:@"Build"];
        [v20 setObject:v38 forKeyedSubscript:@"build"];
      }
      v39 = [v17 objectForKeyedSubscript:@"Date"];

      if (v39)
      {
        v40 = [v17 objectForKeyedSubscript:@"Date"];
        [v20 setObject:v40 forKeyedSubscript:@"date"];
      }
      v41 = [v17 objectForKeyedSubscript:@"ExtendedAttributes"];

      if (v41)
      {
        v42 = [v17 objectForKeyedSubscript:@"ExtendedAttributes"];
        [v20 setObject:v42 forKeyedSubscript:@"extendedAttributes"];
      }
      v43 = [v17 objectForKeyedSubscript:@"SubmittedFilesMask"];

      if (v43)
      {
        v44 = [v17 objectForKeyedSubscript:@"SubmittedFilesMask"];
        [v20 setObject:v44 forKeyedSubscript:@"submittedFilesMask"];
      }
      id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v45 addObject:v20];
      v46 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:v45 recordIDsToDelete:0];
      v47 = [v46 configuration];
      [v47 setAllowsCellularAccess:0];

      v48 = [v46 configuration];
      [v48 setDiscretionaryNetworkBehavior:0];

      v49 = [v46 configuration];
      [v49 setPreferAnonymousRequests:1];

      v50 = [v46 configuration];
      [v50 setXpcActivity:v7];

      [v46 setPerRecordCompletionBlock:&__block_literal_global_20];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_107;
      v65[3] = &unk_1E62548F8;
      v65[4] = self;
      id v51 = v6;
      id v66 = v51;
      id v52 = v7;
      id v67 = v52;
      [v46 setModifyRecordsCompletionBlock:v65];
      if (v52 && xpc_activity_should_defer((xpc_activity_t)v52))
      {
        [(PLSubmissions *)self workQueue];
        id v58 = v7;
        v54 = v53 = v16;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_2;
        block[3] = &unk_1E62538C8;
        id v64 = v51;
        dispatch_async(v54, block);

        v16 = v53;
        id v7 = v58;
        [(PLSubmissions *)self deferXPCActivity:v52];

        v18 = v61;
        v55 = v62;
      }
      else
      {
        v55 = v62;
        [v62 addOperation:v46];
        v18 = v61;
      }
      v56 = v59;

      v19 = v60;
    }
    else
    {
      v57 = PLLogSubmission();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissions(XPCScheduling) submitRecord:withActivity:]((uint64_t)v16, v57);
      }

      [(PLSubmissions *)self fileCleanupWithRecord:v6];
      [(PLSubmissions *)self finishXPCActivity:v7];
      v55 = v62;
      v56 = 0;
    }
  }
  else
  {
    char v14 = PLLogSubmission();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v14, OS_LOG_TYPE_DEFAULT, "Upload activity triggered earlier than delay. Deferring...", buf, 2u);
    }

    [(PLSubmissions *)self finishXPCActivity:v7];
  }
}

void __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = PLLogSubmission();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_cold_1();
  }
}

void __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_107(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = PLLogSubmission();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v6;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "Failed to submit ck records %@, error: %@", buf, 0x16u);
    }

    double v10 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_108;
    block[3] = &unk_1E62538C8;
    id v28 = *(id *)(a1 + 40);
    dispatch_async(v10, block);

    double v11 = [v7 domain];
    uint64_t v12 = *MEMORY[0x1E4F19C40];
    if ([v11 isEqualToString:*MEMORY[0x1E4F19C40]])
    {
      uint64_t v13 = [v7 code];

      if (v13 != 20)
      {
LABEL_25:
        [*(id *)(a1 + 32) finishXPCActivity:*(void *)(a1 + 48)];
LABEL_26:
        long long v20 = v28;
        goto LABEL_27;
      }
      char v14 = [v7 userInfo];
      double v11 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      v15 = [v11 domain];
      int v16 = [v15 isEqualToString:v12];

      if (v16)
      {
        if ([v11 code] == 130)
        {
          uint64_t v17 = PLLogSubmission();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_107_cold_1();
          }
        }
        else
        {
          if ([v11 code] == 131)
          {
            id v21 = PLLogSubmission();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBD2F000, v21, OS_LOG_TYPE_DEFAULT, "Activity needs to be deferred", buf, 2u);
            }

            [*(id *)(a1 + 32) deferXPCActivity:*(void *)(a1 + 48)];
            goto LABEL_26;
          }
          if ([v11 code] != 2000
            && [v11 code] != 2001
            && [v11 code] != 2002
            && [v11 code] != 2009
            && [v11 code] != 2022
            || +[PLDefaults longForKey:@"submissionActivityDelayInSecs" ifNotSet:0])
          {
            goto LABEL_24;
          }
          uint32_t v22 = arc4random_uniform(0xB4u);
          uint64_t v23 = xpc_activity_copy_criteria(*(xpc_activity_t *)(a1 + 48));
          uint64_t v17 = v23;
          if (v23)
          {
            xpc_dictionary_set_int64(v23, (const char *)*MEMORY[0x1E4F14170], (uint64_t)((double)v22 * 60.0 + 3600.0));
            xpc_activity_set_criteria(*(xpc_activity_t *)(a1 + 48), v17);
          }
          else
          {
            v24 = PLLogSubmission();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_107_cold_2();
            }
          }
        }
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v9)
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v6;
    _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "Submission of ck records %@ succeeded", buf, 0xCu);
  }

  [*(id *)(a1 + 40) emitSuccessEvent];
  [*(id *)(a1 + 32) logSubmissionStateToAnalytics:@"success"];
  v18 = [*(id *)(a1 + 32) workQueue];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_109;
  v25[3] = &unk_1E62539B8;
  v19 = *(void **)(a1 + 40);
  v25[4] = *(void *)(a1 + 32);
  id v26 = v19;
  dispatch_async(v18, v25);

  [*(id *)(a1 + 32) finishXPCActivity:*(void *)(a1 + 48)];
  long long v20 = v26;
LABEL_27:
}

uint64_t __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_108(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInSubmission:0];
}

uint64_t __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_109(uint64_t a1)
{
  return [*(id *)(a1 + 32) fileCleanupWithRecord:*(void *)(a1 + 40)];
}

uint64_t __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInSubmission:0];
}

- (void)finishXPCActivity:(id)a3
{
  v3 = (_xpc_activity_s *)a3;
  id v4 = v3;
  if (v3)
  {
    if (xpc_activity_get_state(v3) == 4)
    {
      BOOL v5 = xpc_activity_set_state(v4, 5);
      id v6 = PLLogSubmission();
      id v7 = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v8 = 0;
          _os_log_impl(&dword_1BBD2F000, v7, OS_LOG_TYPE_DEFAULT, "Set background state to done", v8, 2u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        -[PLSubmissions(XPCScheduling) finishXPCActivity:]();
      }
    }
    else
    {
      id v7 = PLLogSubmission();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissions(XPCScheduling) finishXPCActivity:]();
      }
    }
  }
}

- (void)deferXPCActivity:(id)a3
{
  v3 = (_xpc_activity_s *)a3;
  id v4 = v3;
  if (v3)
  {
    if (xpc_activity_get_state(v3) == 3)
    {
      BOOL v5 = PLLogSubmission();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = 0;
        id v6 = "Background state already in defer";
        id v7 = (uint8_t *)&v10;
LABEL_10:
        _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
    else
    {
      BOOL v8 = xpc_activity_set_state(v4, 3);
      BOOL v5 = PLLogSubmission();
      BOOL v9 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v9)
        {
          __int16 v12 = 0;
          id v6 = "Set background state to defer";
          id v7 = (uint8_t *)&v12;
          goto LABEL_10;
        }
      }
      else if (v9)
      {
        *(_WORD *)buf = 0;
        id v6 = "Failed to set background state to defer";
        id v7 = buf;
        goto LABEL_10;
      }
    }
  }
}

- (void)fileCleanupWithRecord:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = PLLogSubmission();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "Removing submission record %@", (uint8_t *)&v14, 0xCu);
  }

  id v6 = [v4 filePath];
  [(PLSubmissions *)self removeFileAtPath:v6];

  id v7 = [v4 daFileDirPath];
  [(PLSubmissions *)self removeFileAtPath:v7];

  BOOL v8 = [v4 ckFileDirPath];
  [(PLSubmissions *)self removeFileAtPath:v8];

  BOOL v9 = NSTemporaryDirectory();
  __int16 v10 = [v9 stringByAppendingPathComponent:@"PLSubmissionConfig"];
  double v11 = [v4 tagUUID];
  __int16 v12 = [v10 stringByAppendingPathComponent:v11];
  [(PLSubmissions *)self removeFileAtPath:v12];

  uint64_t v13 = [(PLSubmissions *)self submissionQueue];
  [v13 removeObject:v4];
}

- (void)removeFileAtURL:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  int v5 = [v4 removeItemAtURL:v3 error:&v9];
  id v6 = v9;

  id v7 = PLLogSubmission();
  BOOL v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "Removed file at %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[PLSubmissions(XPCScheduling) removeFileAtURL:]();
  }
}

- (void)removeFileAtPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  int v5 = [v4 removeItemAtPath:v3 error:&v9];
  id v6 = v9;

  id v7 = PLLogSubmission();
  BOOL v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "Removed file at %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[PLSubmissions(XPCScheduling) removeFileAtURL:]();
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PLSubmissions_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, block);
  }
  v2 = (void *)sharedInstance_instance_2;
  return v2;
}

uint64_t __31__PLSubmissions_sharedInstance__block_invoke()
{
  sharedInstance_instance_2 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (id)workQueue
{
  uint64_t v2 = objc_opt_class();
  return +[PLUtilities workQueueForClass:v2];
}

- (PLSubmissions)init
{
  if (+[PLUtilities isPowerlogHelperd])
  {
    id v3 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLSubmissions;
    id v4 = [(PLSubmissions *)&v12 init];
    if (v4)
    {
      uint64_t v5 = +[PLSQLiteConnection sharedSQLiteConnection];
      connection = v4->_connection;
      v4->_connection = (PLSQLiteConnection *)v5;

      [(PLSubmissions *)v4 setXpcActivityStarted:0];
      id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
      [(PLSubmissions *)v4 setSubmissionQueue:v7];

      BOOL v8 = [(PLSubmissions *)v4 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __21__PLSubmissions_init__block_invoke;
      block[3] = &unk_1E62538C8;
      id v11 = v4;
      dispatch_async(v8, block);
    }
    self = v4;
    id v3 = self;
  }

  return v3;
}

uint64_t __21__PLSubmissions_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) initSubmissionQueue];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setupDRTasking];
}

- (void)setupDRTasking
{
  id v3 = objc_alloc(MEMORY[0x1E4F5F3D8]);
  id v4 = [(PLSubmissions *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__PLSubmissions_setupDRTasking__block_invoke;
  v7[3] = &unk_1E6254778;
  v7[4] = self;
  uint64_t v5 = (void *)[v3 initWithTeamID:@"perfpowerservices.config" targetQueue:v4 configProcessingBlock:v7];
  [(PLSubmissions *)self setTaskingMonitor:v5];

  id v6 = [(PLSubmissions *)self taskingMonitor];
  [v6 startMonitoring];
}

uint64_t __31__PLSubmissions_setupDRTasking__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleDRConfigUpdate:a2 error:a3];
}

- (id)configFromMonitor:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  id v4 = [v3 currentConfigSnapshotWithErrorOut:&v9];
  id v5 = v9;
  if (v5)
  {
    id v6 = PLLogSubmission();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(PLSubmissions *)v3 configFromMonitor:v6];
    }

    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (void)stopDRTasking
{
  id v3 = PLLogSubmission();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Stop monitoring DRConfig", v5, 2u);
  }

  id v4 = [(PLSubmissions *)self taskingMonitor];
  [v4 stopMonitoring];
}

- (BOOL)taskingBlobDRExists
{
  uint64_t v2 = self;
  id v3 = [(PLSubmissions *)self taskingMonitor];
  id v4 = [(PLSubmissions *)v2 configFromMonitor:v3];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)taskingBlobLegacyExists
{
  uint64_t v2 = PLOSAPreferencesGetValue();
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)taskingBlobExists
{
  if ([(PLSubmissions *)self taskingBlobDRExists]) {
    return 1;
  }
  return [(PLSubmissions *)self taskingBlobLegacyExists];
}

- (BOOL)taskingTypeSpecified
{
  uint64_t v2 = [(PLSubmissions *)self getCurrentDRConfig];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = [v2 payloadDictionaryRepresentation];
    id v5 = [v4 objectForKeyedSubscript:@"PLTaskingType"];

    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)internalSubmissionBehavior
{
  BOOL v3 = +[PLPlatform internalBuild];
  if (v3)
  {
    if ([(PLSubmissions *)self taskingBlobDRExists]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(PLSubmissions *)self taskingBlobLegacyExists];
    }
  }
  return v3;
}

- (BOOL)fullModeSubmissionBehavior
{
  if (!+[PLPlatform internalBuild]
    || !+[PLDefaults fullMode])
  {
    return 0;
  }
  return [(PLSubmissions *)self taskingBlobExists];
}

- (void)handleDRConfigUpdate:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = PLLogSubmission();
    BOOL v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PLRapidController handleDRConfigUpdate:error:]();
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v5 teamID];
        __int16 v10 = [v5 configUUID];
        id v11 = [v5 receivedDate];
        *(_DWORD *)buf = 138412802;
        int v14 = v9;
        __int16 v15 = 2112;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "DRConfig for teamID <%@> received: %@, receive time: %@", buf, 0x20u);
      }
      objc_super v12 = v5;
      AnalyticsSendEventLazy();
      BOOL v8 = v12;
    }
  }
}

id __44__PLSubmissions_handleDRConfigUpdate_error___block_invoke(uint64_t a1)
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v5[0] = @"ConfigUUID";
  v1 = [*(id *)(a1 + 32) configUUID];
  v6[0] = v1;
  v6[1] = &unk_1F1580D20;
  v5[1] = @"SubmissionError";
  v5[2] = @"SubmissionMode";
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithLong:", +[PLDefaults mode](PLDefaults, "mode"));
  v6[2] = v2;
  v6[3] = &unk_1F1580D38;
  v5[3] = @"SubmissionReason";
  v5[4] = @"SubmissionStage";
  v6[4] = &unk_1F1580D20;
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];

  return v3;
}

- (id)getCurrentDRConfig
{
  BOOL v3 = [(PLSubmissions *)self taskingMonitor];
  id v4 = [(PLSubmissions *)self configFromMonitor:v3];

  return v4;
}

- (signed)submitReasonForToday
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PLSubmissions_submitReasonForToday__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (submitReasonForToday_defaultOnce != -1) {
      dispatch_once(&submitReasonForToday_defaultOnce, block);
    }
    if (submitReasonForToday_classDebugEnabled)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"submission check: taskMode = %d", +[PLDefaults taskMode](PLDefaults, "taskMode"));
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
      id v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLSubmissions submitReasonForToday]"];
      +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:274];

      BOOL v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if (!+[PLDefaults taskMode]) {
    goto LABEL_53;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __37__PLSubmissions_submitReasonForToday__block_invoke_114;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v9;
    if (submitReasonForToday_defaultOnce_112 != -1) {
      dispatch_once(&submitReasonForToday_defaultOnce_112, v36);
    }
    if (submitReasonForToday_classDebugEnabled_113)
    {
      __int16 v10 = [NSString stringWithFormat:@"tasking submission configured"];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
      objc_super v12 = [v11 lastPathComponent];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PLSubmissions submitReasonForToday]"];
      +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:276];

      int v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v15 = [(PLSubmissions *)self checkTaskingCompletionStatus];
  uint64_t v16 = v15 ? 2 : 1;
  [(PLSubmissions *)self logTaskingStatus:v15 withAction:v16];
  if (!v15)
  {
    LOWORD(v23) = 3;
  }
  else
  {
LABEL_53:
    if ([(PLSubmissions *)self internalSubmissionBehavior])
    {
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v17 = objc_opt_class();
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __37__PLSubmissions_submitReasonForToday__block_invoke_120;
        v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v35[4] = v17;
        if (submitReasonForToday_defaultOnce_118 != -1) {
          dispatch_once(&submitReasonForToday_defaultOnce_118, v35);
        }
        if (submitReasonForToday_classDebugEnabled_119)
        {
          v18 = [NSString stringWithFormat:@"internal submission configured"];
          uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
          long long v20 = [v19 lastPathComponent];
          id v21 = [NSString stringWithUTF8String:"-[PLSubmissions submitReasonForToday]"];
          +[PLCoreStorage logMessage:v18 fromFile:v20 fromFunction:v21 fromLineNumber:286];

          uint32_t v22 = PLLogCommon();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      LOWORD(v23) = 1;
    }
    else if ([(PLSubmissions *)self fullModeSubmissionBehavior])
    {
      v24 = PLLogSubmission();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v24, OS_LOG_TYPE_DEFAULT, "Tasking blob received for internal device in Full Mode.", buf, 2u);
      }

      if ([(PLSubmissions *)self taskingTypeSpecified]) {
        LOWORD(v23) = 5;
      }
      else {
        LOWORD(v23) = 3;
      }
    }
    else
    {
      if (+[PLPlatform internalBuild])
      {
        uint64_t v25 = PLLogSubmission();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBD2F000, v25, OS_LOG_TYPE_DEFAULT, "Tasking blob received for internal device", buf, 2u);
        }
      }
      if ([(PLSubmissions *)self taskingTypeSpecified])
      {
        LOWORD(v23) = 5;
      }
      else
      {
        int v23 = +[PLDefaults debugEnabled];
        if (v23)
        {
          uint64_t v26 = objc_opt_class();
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __37__PLSubmissions_submitReasonForToday__block_invoke_126;
          v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v33[4] = v26;
          if (submitReasonForToday_defaultOnce_124 != -1) {
            dispatch_once(&submitReasonForToday_defaultOnce_124, v33);
          }
          if (submitReasonForToday_classDebugEnabled_125)
          {
            v27 = [NSString stringWithFormat:@"submission not configured"];
            id v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
            v29 = [v28 lastPathComponent];
            id v30 = [NSString stringWithUTF8String:"-[PLSubmissions submitReasonForToday]"];
            +[PLCoreStorage logMessage:v27 fromFile:v29 fromFunction:v30 fromLineNumber:299];

            __int16 v31 = PLLogCommon();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
            }
          }
          LOWORD(v23) = 0;
        }
      }
    }
  }
  return v23;
}

BOOL __37__PLSubmissions_submitReasonForToday__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  submitReasonForToday_classDebugEnabled = result;
  return result;
}

BOOL __37__PLSubmissions_submitReasonForToday__block_invoke_114(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  submitReasonForToday_classDebugEnabled_113 = result;
  return result;
}

BOOL __37__PLSubmissions_submitReasonForToday__block_invoke_120(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  submitReasonForToday_classDebugEnabled_119 = result;
  return result;
}

BOOL __37__PLSubmissions_submitReasonForToday__block_invoke_126(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  submitReasonForToday_classDebugEnabled_125 = result;
  return result;
}

- (void)generateOTASubmissionAndSendTaskingEndSubmission:(BOOL)a3
{
  BOOL v38 = a3;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  AnalyticsSendEventLazy();
  uint64_t v4 = [(PLSubmissions *)self getCurrentDRConfig];
  uint64_t v5 = [(PLSubmissions *)self submitReasonForToday];
  int v40 = v5;
  v39 = (void *)v4;
  id v6 = [[PLSubmissionConfig alloc] initWithReasonType:v5 DRConfig:v4];
  id v7 = [(PLSubmissions *)self getLastBatteryTimestampSystem];
  [(PLSubmissionConfig *)v6 setLastBatteryTimestampSystem:v7];

  BOOL v8 = PLLogSubmission();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v48) = v5;
    _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "Submit reason type: %hd", buf, 8u);
  }

  uint64_t v9 = PLLogSubmission();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = [v39 teamID];
    id v11 = [v39 configUUID];
    *(_DWORD *)buf = 138412546;
    v48 = v10;
    __int16 v49 = 2112;
    v50 = v11;
    _os_log_impl(&dword_1BBD2F000, v9, OS_LOG_TYPE_DEFAULT, "Current DRConfig teamID: %@, UUID: %@", buf, 0x16u);
  }
  objc_super v12 = PLLogSubmission();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v39 payloadDictionaryRepresentation];
    *(_DWORD *)buf = 138412290;
    v48 = v13;
    _os_log_impl(&dword_1BBD2F000, v12, OS_LOG_TYPE_DEFAULT, "DRConfig payload: %@", buf, 0xCu);
  }
  int v14 = PLLogSubmission();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[PLSubmissionConfig hasFileToSubmit](v6, "hasFileToSubmit"));
    v36 = objc_msgSend(NSNumber, "numberWithBool:", -[PLSubmissionConfig submitPLL](v6, "submitPLL"));
    objc_msgSend(NSNumber, "numberWithBool:", -[PLSubmissionConfig submitPLLUpgrade](v6, "submitPLLUpgrade"));
    uint64_t v16 = v37 = self;
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", -[PLSubmissionConfig submitMSS](v6, "submitMSS"));
    v35 = objc_msgSend(NSNumber, "numberWithBool:", -[PLSubmissionConfig submitSP](v6, "submitSP"));
    v18 = objc_msgSend(NSNumber, "numberWithBool:", -[PLSubmissionConfig submitBDC](v6, "submitBDC"));
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", -[PLSubmissionConfig submitCE](v6, "submitCE"));
    long long v20 = objc_msgSend(NSNumber, "numberWithBool:", -[PLSubmissionConfig submitXC](v6, "submitXC"));
    *(_DWORD *)buf = 138414082;
    v48 = v15;
    __int16 v49 = 2112;
    v50 = v36;
    __int16 v51 = 2112;
    id v52 = v16;
    __int16 v53 = 2112;
    v54 = v17;
    __int16 v55 = 2112;
    v56 = v35;
    __int16 v57 = 2112;
    id v58 = v18;
    __int16 v59 = 2112;
    v60 = v19;
    __int16 v61 = 2112;
    v62 = v20;
    _os_log_impl(&dword_1BBD2F000, v14, OS_LOG_TYPE_DEFAULT, "tasking config BOOLs: %@, %@, %@, %@, %@, %@, %@, %@", buf, 0x52u);

    self = v37;
  }

  void block[5] = MEMORY[0x1E4F143A8];
  block[6] = 3221225472;
  block[7] = __66__PLSubmissions_generateOTASubmissionAndSendTaskingEndSubmission___block_invoke_131;
  block[8] = &unk_1E6254470;
  id v21 = v6;
  v46 = v21;
  AnalyticsSendEventLazy();
  if (!v40) {
    [(PLSubmissions *)self emitBlobDetectedEvent:v21];
  }
  if ([(PLSubmissionConfig *)v21 hasFileToSubmit])
  {
    if ([(PLSubmissionConfig *)v21 submitPLL] && v40 == 3 && v38)
    {
      uint32_t v22 = PLLogSubmission();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v22, OS_LOG_TYPE_DEFAULT, "On demand tasking about to end, giving grace period of 10 secs...", buf, 2u);
      }

      int v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v23 postNotificationName:@"kPLTaskingEndNotification" object:self];

      dispatch_time_t v24 = dispatch_time(0, 10000000000);
      uint64_t v25 = [(PLSubmissions *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__PLSubmissions_generateOTASubmissionAndSendTaskingEndSubmission___block_invoke_135;
      block[3] = &unk_1E62538C8;
      void block[4] = self;
      dispatch_after(v24, v25, block);

      goto LABEL_38;
    }
    if ([(PLSubmissionConfig *)v21 submitPLL]
      || (v40 & 0xFFFFFFFB) == 1 && [(PLSubmissionConfig *)v21 submitXC])
    {
      if ((v40 - 1) > 2)
      {
        if (v40 == 5)
        {
          BOOL v27 = [(PLSubmissionConfig *)v21 shouldSubmitToday];
          id v28 = PLLogSubmission();
          BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
          if (!v27)
          {
            if (v29)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBD2F000, v28, OS_LOG_TYPE_DEFAULT, "Skipping conditional tasking...", buf, 2u);
            }

            goto LABEL_37;
          }
          if (v29)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBD2F000, v28, OS_LOG_TYPE_DEFAULT, "Starting conditional tasking...", buf, 2u);
          }

          goto LABEL_36;
        }
LABEL_37:
        v34 = [(PLSubmissions *)self workQueue];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __66__PLSubmissions_generateOTASubmissionAndSendTaskingEndSubmission___block_invoke_136;
        v41[3] = &unk_1E62557A8;
        id v21 = v21;
        v42 = v21;
        v43 = self;
        __int16 v44 = v40;
        dispatch_async(v34, v41);

        goto LABEL_38;
      }
    }
    else
    {
      if ([(PLSubmissionConfig *)v21 submitPLLUpgrade])
      {
        id v30 = [[PLSubmissionConfig alloc] initWithReasonType:4 DRConfig:v39];

        __int16 v31 = [(PLSubmissions *)self getLastBatteryTimestampSystem];
        [(PLSubmissionConfig *)v30 setLastBatteryTimestampSystem:v31];

        [(PLSubmissions *)self submitWithTaskingConfig:v30];
        id v21 = v30;
        goto LABEL_37;
      }
      id v32 = PLLogSubmission();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v32, OS_LOG_TYPE_DEFAULT, "No powerlog file to submit.", buf, 2u);
      }

      BOOL v33 = [(PLSubmissionConfig *)v21 shouldStartTaskingToday];
      [(PLSubmissions *)self emitBlobVerifiedEvent:v21];
      if (!v33) {
        goto LABEL_37;
      }
      [(PLSubmissionConfig *)v21 setSubmitReasonType:3];
    }
LABEL_36:
    [(PLSubmissions *)self submitWithTaskingConfig:v21];
    goto LABEL_37;
  }
  uint64_t v26 = PLLogSubmission();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[PLSubmissions generateOTASubmissionAndSendTaskingEndSubmission:](v40, v26);
  }

  [(PLSubmissions *)self taskingCleanup];
LABEL_38:
}

id __66__PLSubmissions_generateOTASubmissionAndSendTaskingEndSubmission___block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"SubmissionMode";
  v0 = objc_msgSend(NSNumber, "numberWithLong:", +[PLDefaults mode](PLDefaults, "mode"));
  v4[0] = v0;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

id __66__PLSubmissions_generateOTASubmissionAndSendTaskingEndSubmission___block_invoke_131(uint64_t a1)
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"ConfigUUID";
  uint64_t v2 = [*(id *)(a1 + 32) configUUID];
  v9[0] = v2;
  v8[1] = @"SubmissionError";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "hasFileToSubmit") ^ 1);
  v9[1] = v3;
  v8[2] = @"SubmissionMode";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithLong:", +[PLDefaults mode](PLDefaults, "mode"));
  v9[2] = v4;
  v8[3] = @"SubmissionReason";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(*(id *)(a1 + 32), "submitReasonType"));
  v8[4] = @"SubmissionStage";
  v9[3] = v5;
  v9[4] = &unk_1F1580D50;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];

  return v6;
}

uint64_t __66__PLSubmissions_generateOTASubmissionAndSendTaskingEndSubmission___block_invoke_135(uint64_t a1)
{
  return [*(id *)(a1 + 32) generateOTASubmissionAndSendTaskingEndSubmission:0];
}

void __66__PLSubmissions_generateOTASubmissionAndSendTaskingEndSubmission___block_invoke_136(uint64_t a1)
{
  uint64_t v2 = PLLogSubmission();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v2, OS_LOG_TYPE_DEFAULT, "Starting mode check...", buf, 2u);
  }

  if (+[PLDefaults taskMode])
  {
    uint64_t v3 = PLLogSubmission();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "End mode", buf, 2u);
    }

    id v7 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy();
    [*(id *)(a1 + 40) taskingCleanup];
    PowerlogControlSwitchMode();
  }
  else if ([*(id *)(a1 + 32) submitPLL] {
         && *(_WORD *)(a1 + 48) != 5
  }
         && (int v4 = [*(id *)(a1 + 32) shouldStartTaskingToday],
             [*(id *)(a1 + 40) emitBlobVerifiedEvent:*(void *)(a1 + 32)],
             v4))
  {
    uint64_t v5 = PLLogSubmission();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "Start mode", buf, 2u);
    }

    PowerlogControlSwitchMode();
  }
  else
  {
    id v6 = PLLogSubmission();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_DEFAULT, "Defaults cleanup", buf, 2u);
    }

    [*(id *)(a1 + 40) taskingCleanup];
  }
}

id __66__PLSubmissions_generateOTASubmissionAndSendTaskingEndSubmission___block_invoke_137(uint64_t a1)
{
  void v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"ConfigUUID";
  uint64_t v2 = [*(id *)(a1 + 32) configUUID];
  v8[0] = v2;
  v8[1] = &unk_1F1580D68;
  v7[1] = @"SubmissionError";
  v7[2] = @"SubmissionMode";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLong:", +[PLDefaults mode](PLDefaults, "mode"));
  v8[2] = v3;
  v7[3] = @"SubmissionReason";
  int v4 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(*(id *)(a1 + 32), "submitReasonType"));
  v7[4] = @"SubmissionStage";
  v8[3] = v4;
  v8[4] = &unk_1F1580D80;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];

  return v5;
}

- (void)performSubmission:(id)a3
{
  id v6 = a3;
  AnalyticsSendEventLazy();
  int v4 = [(PLSubmissions *)self createWatchdogForSubmissionActivity:@"OTA"];
  [(PLSubmissions *)self prepareAndEnqueueSubmissionFilesWithConfig:v6];
  [(PLSubmissions *)self stopWatchdogForSubmissionActivity:v4];
  id v5 = v6;
  AnalyticsSendEventLazy();
}

id __35__PLSubmissions_performSubmission___block_invoke(uint64_t a1)
{
  void v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"ConfigUUID";
  uint64_t v2 = [*(id *)(a1 + 32) configUUID];
  v8[0] = v2;
  v8[1] = &unk_1F1580D20;
  v7[1] = @"SubmissionError";
  v7[2] = @"SubmissionMode";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLong:", +[PLDefaults mode](PLDefaults, "mode"));
  v8[2] = v3;
  v7[3] = @"SubmissionReason";
  int v4 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(*(id *)(a1 + 32), "submitReasonType"));
  v7[4] = @"SubmissionStage";
  v8[3] = v4;
  v8[4] = &unk_1F1580DB0;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];

  return v5;
}

id __35__PLSubmissions_performSubmission___block_invoke_150(uint64_t a1)
{
  void v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"ConfigUUID";
  uint64_t v2 = [*(id *)(a1 + 32) configUUID];
  v8[0] = v2;
  v8[1] = &unk_1F1580D20;
  v7[1] = @"SubmissionError";
  v7[2] = @"SubmissionMode";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLong:", +[PLDefaults mode](PLDefaults, "mode"));
  v8[2] = v3;
  v7[3] = @"SubmissionReason";
  int v4 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(*(id *)(a1 + 32), "submitReasonType"));
  v7[4] = @"SubmissionStage";
  v8[3] = v4;
  v8[4] = &unk_1F1580DC8;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];

  return v5;
}

- (void)submitWithTaskingConfig:(id)a3
{
  id v4 = a3;
  [(PLSubmissions *)self logSubmissionStateToAnalytics:@"attempt"];
  [v4 submitFileStatsToAnalytics];
  id v5 = [(PLSubmissions *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__PLSubmissions_submitWithTaskingConfig___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__PLSubmissions_submitWithTaskingConfig___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)os_transaction_create();
  uint64_t v3 = (void *)MEMORY[0x1C1869120]();
  [*(id *)(a1 + 32) performSubmission:*(void *)(a1 + 40)];
  dispatch_time_t v4 = dispatch_time(0, 60000000000);
  id v5 = +[PLUtilities transactionWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PLSubmissions_submitWithTaskingConfig___block_invoke_2;
  block[3] = &unk_1E62538C8;
  id v8 = v2;
  id v6 = v2;
  dispatch_after(v4, v5, block);
}

- (void)prepareAndEnqueueSubmissionFilesWithConfig:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = [a3 splitBySubmissionType];
  uint64_t v49 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (v49)
  {
    uint64_t v3 = &dword_1BBD2F000;
    uint64_t v48 = *(void *)v56;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v56 != v48) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v55 + 1) + 8 * v4);
        id v6 = PLLogSubmission();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          BOOL v38 = [v5 getSubmitReasonTypeToReasonLog];
          uint64_t v39 = [v5 submittedFilesMask];
          int v40 = [v5 submissionMaskToString];
          *(_DWORD *)buf = 138412802;
          v60 = v38;
          __int16 v61 = 2048;
          uint64_t v62 = v39;
          __int16 v63 = 2112;
          id v64 = v40;
          _os_log_debug_impl(v3, v6, OS_LOG_TYPE_DEBUG, "Starting submission of type '%@' (mask: %llu = %@)", buf, 0x20u);
        }
        id v7 = [[PLSubmissionFilePLL alloc] initWithConfig:v5];
        id v8 = v7;
        if (v7)
        {
          [(PLSubmissionFilePLL *)v7 submit];
          uint64_t v9 = PLLogSubmission();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v9, OS_LOG_TYPE_DEFAULT, "Finished preparing PLL", buf, 2u);
          }
        }
        __int16 v10 = [[PLSubmissionFileMSS alloc] initWithConfig:v5];
        id v11 = v10;
        if (v10)
        {
          [(PLSubmissionFileMSS *)v10 submit];
          objc_super v12 = PLLogSubmission();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v12, OS_LOG_TYPE_DEFAULT, "Finished preparing MSS", buf, 2u);
          }
        }
        uint64_t v13 = [[PLSubmissionFileBDC alloc] initWithConfig:v5];
        int v14 = v13;
        if (v13)
        {
          [(PLSubmissionFileBDC *)v13 submit];
          uint64_t v15 = PLLogSubmission();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v15, OS_LOG_TYPE_DEFAULT, "Finished preparing BDC", buf, 2u);
          }
        }
        id v52 = v14;
        uint64_t v16 = [[PLSubmissionFileCE alloc] initWithConfig:v5];
        uint64_t v17 = v16;
        if (v16)
        {
          [(PLSubmissionFileCE *)v16 submit];
          v18 = PLLogSubmission();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v18, OS_LOG_TYPE_DEFAULT, "Finished preparing CE", buf, 2u);
          }
        }
        uint64_t v19 = [[PLSubmissionFileXC alloc] initWithConfig:v5];
        long long v20 = v19;
        if (v19)
        {
          [(PLSubmissionFileXC *)v19 submit];
          id v21 = PLLogSubmission();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v21, OS_LOG_TYPE_DEFAULT, "Finished preparing XC", buf, 2u);
          }
        }
        __int16 v51 = v8;
        uint32_t v22 = [[PLSubmissionFileBG alloc] initWithConfig:v5];
        int v23 = v22;
        if (v22)
        {
          [(PLSubmissionFileBG *)v22 submit];
          dispatch_time_t v24 = PLLogSubmission();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v24, OS_LOG_TYPE_DEFAULT, "Finished preparing BG", buf, 2u);
          }
        }
        v50 = v11;
        uint64_t v25 = [[PLSubmissionFileSP alloc] initWithConfig:v5];
        uint64_t v26 = v25;
        if (v25)
        {
          [(PLSubmissionFile *)v25 submit];
          BOOL v27 = PLLogSubmission();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v27, OS_LOG_TYPE_DEFAULT, "Finished preparing SP", buf, 2u);
          }
        }
        uint64_t v28 = [v5 filePath];
        if (v28)
        {
          BOOL v29 = (void *)v28;
          id v30 = v3;
          uint64_t v31 = [v5 ckTagConfig];
          if (v31)
          {
            id v32 = (void *)v31;
            BOOL v33 = [v5 tagUUID];

            uint64_t v3 = v30;
            if (v33)
            {
              if ([v5 enableDPUpload])
              {
                v42 = [PLSubmissionRecord alloc];
                v46 = [v5 filePath];
                id v45 = [v5 tagUUID];
                __int16 v44 = [v5 ckTagConfig];
                v41 = [v5 configUUID];
                uint64_t v34 = [v5 configDateReceived];
                v35 = [v5 configDateApplied];
                v36 = (void *)v34;
                v37 = [(PLSubmissionRecord *)v42 initWithCKFilePath:v46 tagUUID:v45 tagConfig:v44 configUUID:v41 configDateReceived:v34 configDateApplied:v35];

                [(PLSubmissions *)self submitRecordToDiagnosticPipeline:v37 withConfig:v5];
              }
              else
              {
                v37 = [(PLSubmissions *)self enqueueFileForUpload:v5];
                [(PLSubmissions *)self persistSubmissionInfo:v37];
              }
              uint64_t v3 = v30;
              goto LABEL_46;
            }
          }
          else
          {
          }
        }
        v37 = PLLogSubmission();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          [(PLSubmissions *)&v53 prepareAndEnqueueSubmissionFilesWithConfig:v37];
        }
LABEL_46:

        ++v4;
      }
      while (v49 != v4);
      uint64_t v49 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
    }
    while (v49);
  }
}

- (void)submitRecordToDiagnosticPipeline:(id)a3 withConfig:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 getSubmitReasonTypeToReasonLog];
  id v8 = [v6 contextDictionary];
  uint64_t v9 = PLLogSubmission();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = [v6 submissionCategory];
    *(_DWORD *)buf = 138412802;
    int v23 = @"com.apple.perfpowerservices";
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    __int16 v26 = 2112;
    BOOL v27 = v8;
    _os_log_impl(&dword_1BBD2F000, v9, OS_LOG_TYPE_DEFAULT, "Submitting '%@:%@' record for %@ via DiagnosticPipeline", buf, 0x20u);
  }
  v20[1] = MEMORY[0x1E4F143A8];
  v20[2] = 3221225472;
  v20[3] = __61__PLSubmissions_submitRecordToDiagnosticPipeline_withConfig___block_invoke;
  v20[4] = &unk_1E6254470;
  id v11 = v6;
  id v21 = v11;
  AnalyticsSendEventLazy();
  [v5 emitAttemptEvent];
  objc_super v12 = [v11 submissionCategory];
  uint64_t v13 = [v5 filePath];
  v20[0] = 0;
  int v14 = DRSubmitLogToCKContainer();
  id v15 = 0;

  if (v14)
  {
    uint64_t v19 = v11;
    AnalyticsSendEventLazy();
    objc_msgSend(v5, "emitSuccessEvent", @"attachment", @"asset", v8, v20);
    uint64_t v16 = PLLogSubmission();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v5 filePath];
      *(_DWORD *)buf = 138412290;
      int v23 = v17;
      _os_log_impl(&dword_1BBD2F000, v16, OS_LOG_TYPE_DEFAULT, "Successfully submitted %@ to DiagnosticPipeline for upload", buf, 0xCu);
    }
    v18 = v19;
  }
  else
  {
    v18 = PLLogSubmission();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissions submitRecordToDiagnosticPipeline:withConfig:]();
    }
  }

  [v5 cleanup];
}

id __61__PLSubmissions_submitRecordToDiagnosticPipeline_withConfig___block_invoke(uint64_t a1)
{
  void v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"ConfigUUID";
  uint64_t v2 = [*(id *)(a1 + 32) configUUID];
  v8[0] = v2;
  v8[1] = &unk_1F1580D20;
  v7[1] = @"SubmissionError";
  v7[2] = @"SubmissionMode";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLong:", +[PLDefaults mode](PLDefaults, "mode"));
  v8[2] = v3;
  v7[3] = @"SubmissionReason";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(*(id *)(a1 + 32), "submitReasonType"));
  v7[4] = @"SubmissionStage";
  v8[3] = v4;
  v8[4] = &unk_1F1580DE0;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];

  return v5;
}

id __61__PLSubmissions_submitRecordToDiagnosticPipeline_withConfig___block_invoke_176(uint64_t a1)
{
  void v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"ConfigUUID";
  uint64_t v2 = [*(id *)(a1 + 32) configUUID];
  v8[0] = v2;
  v8[1] = &unk_1F1580D20;
  v7[1] = @"SubmissionError";
  v7[2] = @"SubmissionMode";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLong:", +[PLDefaults mode](PLDefaults, "mode"));
  v8[2] = v3;
  v7[3] = @"SubmissionReason";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(*(id *)(a1 + 32), "submitReasonType"));
  v7[4] = @"SubmissionStage";
  v8[3] = v4;
  v8[4] = &unk_1F1580DF8;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];

  return v5;
}

- (void)generatePLLSubmissionWithPayload:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v60 = (void *)os_transaction_create();
  context = (void *)MEMORY[0x1C1869120]();
  long long v58 = [(PLSubmissions *)self createWatchdogForSubmissionActivity:@"PLL"];
  id v5 = [NSString stringWithFormat:@"GenerateOTASubmissionWithPayload"];
  id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
  id v7 = [v6 lastPathComponent];
  id v8 = [NSString stringWithUTF8String:"-[PLSubmissions generatePLLSubmissionWithPayload:]"];
  +[PLCoreStorage logMessage:v5 fromFile:v7 fromFunction:v8 fromLineNumber:605];

  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v69 = v5;
    _os_log_impl(&dword_1BBD2F000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  __int16 v10 = (void *)[v4 mutableCopy];
  id v11 = [v4 objectForKeyedSubscript:@"cache_size"];

  if (!v11)
  {
    objc_super v12 = [NSNumber numberWithInteger:10];
    [v10 setObject:v12 forKeyedSubscript:@"cache_size"];
  }
  uint64_t v13 = [v4 objectForKeyedSubscript:@"path"];
  int v14 = [[PLSubmissionConfig alloc] initWithPayload:v10];
  id v15 = [(PLSubmissions *)self getLastBatteryTimestampSystem];
  [(PLSubmissionConfig *)v14 setLastBatteryTimestampSystem:v15];

  uint64_t v16 = [[PLSubmissionFilePLL alloc] initWithConfig:v14];
  v66[0] = @"Type";
  uint64_t v17 = [(PLSubmissionConfig *)v14 getSubmitReasonTypeToStorageEventOTAType];
  v18 = (void *)v17;
  v66[1] = @"Success";
  uint64_t v19 = MEMORY[0x1E4F1CC38];
  if (!v16) {
    uint64_t v19 = MEMORY[0x1E4F1CC28];
  }
  v67[0] = v17;
  v67[1] = v19;
  unint64_t v20 = 0x1E4F1C000uLL;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
  long long v57 = self;
  [(PLSubmissions *)self logOTAStatus:v21];

  uint32_t v22 = [(PLSubmissionFile *)v16 filePath];
  if (v22)
  {
    v54 = v10;
    long long v56 = v4;
    int v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v65 = 0;
    long long v55 = v13;
    char v24 = [v23 moveItemAtPath:v22 toPath:v13 error:&v65];
    id v25 = v65;

    if ((v24 & 1) == 0)
    {
      __int16 v26 = [NSString stringWithFormat:@"Error moving file %@", v25];
      BOOL v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
      uint64_t v28 = [v27 lastPathComponent];
      BOOL v29 = [NSString stringWithUTF8String:"-[PLSubmissions generatePLLSubmissionWithPayload:]"];
      +[PLCoreStorage logMessage:v26 fromFile:v28 fromFunction:v29 fromLineNumber:625];

      id v30 = PLLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v69 = v26;
        _os_log_impl(&dword_1BBD2F000, v30, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      unint64_t v20 = 0x1E4F1C000;
    }
    uint64_t v31 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v32 = [(PLSubmissionFile *)v16 directory];
    id v64 = v25;
    char v33 = [v31 removeItemAtPath:v32 error:&v64];
    id v34 = v64;

    if ((v33 & 1) == 0)
    {
      v35 = [NSString stringWithFormat:@"Error removing file %@", v34];
      v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
      v37 = [v36 lastPathComponent];
      BOOL v38 = [NSString stringWithUTF8String:"-[PLSubmissions generatePLLSubmissionWithPayload:]"];
      +[PLCoreStorage logMessage:v35 fromFile:v37 fromFunction:v38 fromLineNumber:630];

      uint64_t v39 = PLLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v69 = v35;
        _os_log_impl(&dword_1BBD2F000, v39, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      unint64_t v20 = 0x1E4F1C000uLL;
    }
    id v4 = v56;
    int v40 = [v56 objectForKeyedSubscript:@"user"];
    if ([v40 length])
    {
      v41 = objc_msgSend(*(id *)(v20 + 2536), "dictionaryWithObjectsAndKeys:", v40, *MEMORY[0x1E4F28320], 0);
      v42 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v63 = v34;
      char v43 = [v42 setAttributes:v41 ofItemAtPath:v55 error:&v63];
      id v44 = v63;

      if ((v43 & 1) == 0)
      {
        uint8_t v53 = v41;
        id v45 = [NSString stringWithFormat:@"Error setting attr %@", v44];
        v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
        v47 = [v46 lastPathComponent];
        uint64_t v48 = [NSString stringWithUTF8String:"-[PLSubmissions generatePLLSubmissionWithPayload:]"];
        +[PLCoreStorage logMessage:v45 fromFile:v47 fromFunction:v48 fromLineNumber:637];

        uint64_t v49 = PLLogCommon();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v69 = v45;
          _os_log_impl(&dword_1BBD2F000, v49, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }

        v41 = v53;
      }

      id v4 = v56;
    }
    else
    {
      id v44 = v34;
    }
    uint64_t v13 = v55;

    __int16 v10 = v54;
  }
  [(PLSubmissionFile *)v16 cleanupTmpDirectory];
  [(PLSubmissions *)v57 stopWatchdogForSubmissionActivity:v58];

  dispatch_time_t v50 = dispatch_time(0, 60000000000);
  __int16 v51 = +[PLUtilities transactionWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PLSubmissions_generatePLLSubmissionWithPayload___block_invoke;
  block[3] = &unk_1E62538C8;
  id v62 = v60;
  id v52 = v60;
  dispatch_after(v50, v51, block);
}

- (id)generateMSSSubmissionWithPayload:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = (void *)MEMORY[0x1C1869120]();
  id v7 = [(PLSubmissions *)self createWatchdogForSubmissionActivity:@"MSS"];
  id v8 = [NSString stringWithFormat:@"GenerateMSSSubmissionWithPayload"];
  uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
  __int16 v10 = [v9 lastPathComponent];
  id v11 = [NSString stringWithUTF8String:"-[PLSubmissions generateMSSSubmissionWithPayload:]"];
  +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:654];

  objc_super v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v8;
    _os_log_impl(&dword_1BBD2F000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  uint64_t v13 = (void *)[v4 mutableCopy];
  int v14 = [[PLSubmissionConfig alloc] initWithPayload:v13];
  id v15 = [(PLSubmissions *)self getLastBatteryTimestampSystem];
  [(PLSubmissionConfig *)v14 setLastBatteryTimestampSystem:v15];

  uint64_t v16 = [[PLSubmissionFileMSS alloc] initWithConfig:v14];
  uint64_t v17 = [(PLSubmissionFile *)v16 filePath];
  if (v17) {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v17, @"microstackshots", 0);
  }
  else {
    v18 = 0;
  }
  [(PLSubmissions *)self stopWatchdogForSubmissionActivity:v7];

  return v18;
}

- (id)getLastBatteryTimestampSystem
{
  uint64_t v2 = +[PowerlogCore sharedCore];
  uint64_t v3 = [v2 storage];
  id v4 = [v3 lastEntryForKey:@"PLBatteryAgent_EventBackward_Battery"];

  id v5 = [v4 entryDate];
  id v6 = [v5 convertFromMonotonicToSystem];

  return v6;
}

- (void)logTaskingStatus:(int)a3 withAction:(int)a4
{
}

- (void)logTaskingStatus:(int)a3 withAction:(int)a4 withTables:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  v22[3] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PLSubmissions_logTaskingStatus_withAction_withTables___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v9;
    if (logTaskingStatus_withAction_withTables__defaultOnce != -1) {
      dispatch_once(&logTaskingStatus_withAction_withTables__defaultOnce, block);
    }
    if (logTaskingStatus_withAction_withTables__classDebugEnabled)
    {
      __int16 v10 = [NSString stringWithFormat:@"error=%d, action=%d, taskingTables=%@", v6, v5, v8];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
      objc_super v12 = [v11 lastPathComponent];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PLSubmissions logTaskingStatus:withAction:withTables:]"];
      +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:682];

      int v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  id v15 = [NSString stringWithFormat:@"taskingTablesPayload=%@", v8];
  uint64_t v16 = [(PLSubmissions *)self storageOperator];
  v21[0] = @"Action";
  uint64_t v17 = [NSNumber numberWithInt:v5];
  v22[0] = v17;
  v21[1] = @"ErrorType";
  v18 = [NSNumber numberWithInt:v6];
  v21[2] = @"TaskingTablesPayload";
  v22[1] = v18;
  v22[2] = v15;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  [v16 logEventForwardTaskingMode:v19];
}

BOOL __56__PLSubmissions_logTaskingStatus_withAction_withTables___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  logTaskingStatus_withAction_withTables__classDebugEnabled = result;
  return result;
}

- (void)enableHangtracer
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(@"PLTasking.HangTracerEnableAppActivationLogging", &unk_1F1580E10, @"com.apple.hangtracer", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFPreferencesSynchronize(@"com.apple.hangtracer", @"mobile", v2);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.hangtracer.pref_changed", 0, 0, 0);
}

- (void)disableHangtracer
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(@"PLTasking.HangTracerEnableAppActivationLogging", 0, @"com.apple.hangtracer", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFPreferencesSynchronize(@"com.apple.hangtracer", @"mobile", v2);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.hangtracer.pref_changed", 0, 0, 0);
}

- (void)logTaskingTablesTurnedOn:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    int v14 = __42__PLSubmissions_logTaskingTablesTurnedOn___block_invoke;
    id v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (logTaskingTablesTurnedOn__defaultOnce != -1) {
      dispatch_once(&logTaskingTablesTurnedOn__defaultOnce, &block);
    }
    if (logTaskingTablesTurnedOn__classDebugEnabled)
    {
      uint64_t v6 = [NSString stringWithFormat:@"TaskingTablesTurnedOn=%@", v4, block, v13, v14, v15, v16];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
      id v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PLSubmissions logTaskingTablesTurnedOn:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:712];

      __int16 v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  id v11 = [(PLSubmissions *)self storageOperator];
  [v11 logEventNoneAdditionalTablesTurnedOn:v4];
}

BOOL __42__PLSubmissions_logTaskingTablesTurnedOn___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  logTaskingTablesTurnedOn__classDebugEnabled = result;
  return result;
}

- (void)logOTAStatus:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [v4 stringWithFormat:@"OTAStatus=%@", v5];
  id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
  id v8 = [v7 lastPathComponent];
  uint64_t v9 = [NSString stringWithUTF8String:"-[PLSubmissions logOTAStatus:]"];
  +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:717];

  __int16 v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v11 = [(PLSubmissions *)self storageOperator];
  [v11 logEventPointOTA:v5];
}

- (void)clearTaskingDRConfig
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLSubmissions *)self getCurrentDRConfig];
  id v4 = PLLogSubmission();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "No DRConfig to clear", buf, 2u);
    }
    goto LABEL_10;
  }
  if (v5)
  {
    uint64_t v6 = [v3 configUUID];
    *(_DWORD *)buf = 138412290;
    objc_super v12 = v6;
    _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to mark DRConfig %@ as completed", buf, 0xCu);
  }
  id v7 = [(PLSubmissions *)self taskingMonitor];
  id v8 = [v3 configUUID];
  id v10 = 0;
  [v7 markCompletedConfigUUID:v8 errorOut:&v10];
  id v4 = v10;

  if (v4)
  {
    uint64_t v9 = PLLogSubmission();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PLRapidController completeTaskingConfig:]();
    }

LABEL_10:
  }
}

- (void)rejectTaskingDRConfig
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLSubmissions *)self getCurrentDRConfig];
  id v4 = PLLogSubmission();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "No DRConfig to reject", buf, 2u);
    }
    goto LABEL_10;
  }
  if (v5)
  {
    uint64_t v6 = [v3 configUUID];
    *(_DWORD *)buf = 138412290;
    objc_super v12 = v6;
    _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "Rejecting DRConfig %@", buf, 0xCu);
  }
  id v7 = [(PLSubmissions *)self taskingMonitor];
  id v8 = [v3 configUUID];
  id v10 = 0;
  [v7 rejectConfigUUID:v8 errorOut:&v10];
  id v4 = v10;

  if (v4)
  {
    uint64_t v9 = PLLogSubmission();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PLRapidController rejectTaskingConfig:]();
    }

LABEL_10:
  }
}

- (void)taskingCleanup
{
  [(PLSubmissions *)self disableHangtracer];
  +[PLSubmissionConfig clearTaskingDefaults];
  [(PLSubmissions *)self clearTaskingDRConfig];
}

- (int)checkTaskingCompletionStatus
{
  CFStringRef v2 = +[PLDefaults objectForKey:@"PLTaskingOnDemandStartDate"];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLSubmissions_checkTaskingCompletionStatus__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v4;
    if (checkTaskingCompletionStatus_defaultOnce != -1) {
      dispatch_once(&checkTaskingCompletionStatus_defaultOnce, block);
    }
    if (checkTaskingCompletionStatus_classDebugEnabled)
    {
      BOOL v5 = [NSString stringWithFormat:@"taskingStartDate=%@, now=%@", v2, v3];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLSubmissions checkTaskingCompletionStatus]"];
      +[PLCoreStorage logMessage:v5 fromFile:v7 fromFunction:v8 fromLineNumber:760];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if ([v2 compare:v3] == 1)
  {
    int v10 = 1;
    PLADClientAddValueForScalarKey();
    AnalyticsSendEventLazy();
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v11 = objc_opt_class();
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_2;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = v11;
      if (checkTaskingCompletionStatus_defaultOnce_265 != -1) {
        dispatch_once(&checkTaskingCompletionStatus_defaultOnce_265, v26);
      }
      if (checkTaskingCompletionStatus_classDebugEnabled_266)
      {
        objc_super v12 = [NSString stringWithFormat:@"Abort Tasking: monotonic time moved back"];
        uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
        uint64_t v14 = [v13 lastPathComponent];
        id v15 = [NSString stringWithUTF8String:"-[PLSubmissions checkTaskingCompletionStatus]"];
        +[PLCoreStorage logMessage:v12 fromFile:v14 fromFunction:v15 fromLineNumber:768];

        uint64_t v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
      int v10 = 1;
    }
  }
  else
  {
    [v3 timeIntervalSinceDate:v2];
    if (v17 >= 604800.0)
    {
      PLADClientAddValueForScalarKey();
      AnalyticsSendEventLazy();
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v18 = objc_opt_class();
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_2_285;
        v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v25[4] = v18;
        if (checkTaskingCompletionStatus_defaultOnce_283 != -1) {
          dispatch_once(&checkTaskingCompletionStatus_defaultOnce_283, v25);
        }
        if (checkTaskingCompletionStatus_classDebugEnabled_284)
        {
          uint64_t v19 = [NSString stringWithFormat:@"Abort Tasking: 7 days since tasking start"];
          unint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
          id v21 = [v20 lastPathComponent];
          uint64_t v22 = [NSString stringWithUTF8String:"-[PLSubmissions checkTaskingCompletionStatus]"];
          +[PLCoreStorage logMessage:v19 fromFile:v21 fromFunction:v22 fromLineNumber:779];

          int v23 = PLLogCommon();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      int v10 = 2;
    }
    else
    {
      PLADClientAddValueForScalarKey();
      AnalyticsSendEventLazy();
      int v10 = 0;
    }
  }

  return v10;
}

BOOL __45__PLSubmissions_checkTaskingCompletionStatus__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  checkTaskingCompletionStatus_classDebugEnabled = result;
  return result;
}

void *__45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_258()
{
  return &unk_1F15872F0;
}

BOOL __45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  checkTaskingCompletionStatus_classDebugEnabled_266 = result;
  return result;
}

void *__45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_273()
{
  return &unk_1F1587318;
}

BOOL __45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_2_285(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  checkTaskingCompletionStatus_classDebugEnabled_284 = result;
  return result;
}

void *__45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_292()
{
  return &unk_1F1587340;
}

- (void)taskingModeSafeguard
{
  if (+[PLDefaults taskMode])
  {
    +[PLDefaults doubleForKey:@"PLTaskingRestartCount" ifNotSet:0.0];
    double v4 = v3 + 1.0;
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__PLSubmissions_taskingModeSafeguard__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v5;
      if (taskingModeSafeguard_defaultOnce != -1) {
        dispatch_once(&taskingModeSafeguard_defaultOnce, block);
      }
      if (taskingModeSafeguard_classDebugEnabled)
      {
        uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"powerlog restartCount=%f", *(void *)&v4);
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
        id v8 = [v7 lastPathComponent];
        uint64_t v9 = [NSString stringWithUTF8String:"-[PLSubmissions taskingModeSafeguard]"];
        +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:795];

        int v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    if (v4 <= 10.0)
    {
      double v17 = [NSNumber numberWithDouble:v4];
      +[PLDefaults setObject:v17 forKey:@"PLTaskingRestartCount" saveToDisk:1];
    }
    else
    {
      PLADClientAddValueForScalarKey();
      AnalyticsSendEventLazy();
      [(PLSubmissions *)self logTaskingStatus:4 withAction:2];
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v11 = objc_opt_class();
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __37__PLSubmissions_taskingModeSafeguard__block_invoke_2;
        v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v18[4] = v11;
        if (taskingModeSafeguard_defaultOnce_321 != -1) {
          dispatch_once(&taskingModeSafeguard_defaultOnce_321, v18);
        }
        if (taskingModeSafeguard_classDebugEnabled_322)
        {
          objc_super v12 = [NSString stringWithFormat:@"restartCount over limit, exiting tasking mode"];
          uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
          uint64_t v14 = [v13 lastPathComponent];
          id v15 = [NSString stringWithUTF8String:"-[PLSubmissions taskingModeSafeguard]"];
          +[PLCoreStorage logMessage:v12 fromFile:v14 fromFunction:v15 fromLineNumber:802];

          uint64_t v16 = PLLogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      PowerlogControlSwitchMode();
    }
  }
}

BOOL __37__PLSubmissions_taskingModeSafeguard__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  taskingModeSafeguard_classDebugEnabled = result;
  return result;
}

void *__37__PLSubmissions_taskingModeSafeguard__block_invoke_311()
{
  return &unk_1F1587368;
}

BOOL __37__PLSubmissions_taskingModeSafeguard__block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  taskingModeSafeguard_classDebugEnabled_322 = result;
  return result;
}

- (void)taskingModeSetup
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self->_taskingStarted = 0;
  if (+[PLDefaults taskMode])
  {
    if (+[PLDefaults objectExistsForKey:@"PLTaskingOnDemandStartDate"])
    {
      [(PLSubmissions *)self logTaskingStatus:0 withAction:3];
    }
    else
    {
      dispatch_time_t v3 = dispatch_time(0, 10000000000);
      double v4 = [(PLSubmissions *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33__PLSubmissions_taskingModeSetup__block_invoke;
      block[3] = &unk_1E62538C8;
      void block[4] = self;
      dispatch_after(v3, v4, block);

      PLADClientAddValueForScalarKey();
      AnalyticsSendEventLazy();
      +[PLSubmissionConfig submitTaskingDefaultsCheckStateToCA:@"OnDemandTaskingStart"];
      uint64_t v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      +[PLDefaults setObject:v5 forKey:@"PLTaskingOnDemandStartDate" saveToDisk:1];
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v6 = objc_opt_class();
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __33__PLSubmissions_taskingModeSetup__block_invoke_2_343;
        void v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v21[4] = v6;
        if (taskingModeSetup_defaultOnce != -1) {
          dispatch_once(&taskingModeSetup_defaultOnce, v21);
        }
        if (taskingModeSetup_classDebugEnabled)
        {
          id v7 = [NSString stringWithFormat:@"starting on demand logging with startTime=%@", v5];
          id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
          uint64_t v9 = [v8 lastPathComponent];
          int v10 = [NSString stringWithUTF8String:"-[PLSubmissions taskingModeSetup]"];
          +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:838];

          uint64_t v11 = PLLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      objc_super v12 = +[PLCoreStorage additionalTables];
      uint64_t v13 = PLLogSubmission();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        char v24 = v12;
        _os_log_impl(&dword_1BBD2F000, v13, OS_LOG_TYPE_DEFAULT, "AdditionalTables: %@", buf, 0xCu);
      }

      [(PLSubmissions *)self logTaskingStatus:0 withAction:0 withTables:v12];
      uint64_t v14 = +[PLEntryKey PLEntryKeyStringsForTasking];
      [(PLSubmissions *)self logTaskingTablesTurnedOn:v14];
      [(PLSubmissions *)self enableHangtracer];
      +[PLEntryKey PLEntryKeyStringsForTaskingReset];
      self->_taskingStarted = 1;
      if (+[PLDefaults objectExistsForKey:@"PLTaskingFiles"])
      {
        id v15 = +[PLDefaults objectForKey:@"PLTaskingFiles"];
        int v16 = [v15 containsObject:@"PLL-Upgrade"];

        if (v16)
        {
          double v17 = PLLogSubmission();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBD2F000, v17, OS_LOG_TYPE_INFO, "Upgrade powerlog requested", buf, 2u);
          }

          dispatch_time_t v18 = dispatch_time(0, 10000000000);
          uint64_t v19 = [(PLSubmissions *)self workQueue];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __33__PLSubmissions_taskingModeSetup__block_invoke_348;
          v20[3] = &unk_1E62538C8;
          v20[4] = self;
          dispatch_after(v18, v19, v20);
        }
      }
    }
  }
}

void __33__PLSubmissions_taskingModeSetup__block_invoke(uint64_t a1)
{
  CFStringRef v2 = [*(id *)(a1 + 32) getCurrentDRConfig];
  id v1 = v2;
  AnalyticsSendEventLazy();
}

id __33__PLSubmissions_taskingModeSetup__block_invoke_2(uint64_t a1)
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v5[0] = @"ConfigUUID";
  id v1 = [*(id *)(a1 + 32) configUUID];
  v6[0] = v1;
  v6[1] = &unk_1F1580D20;
  v5[1] = @"SubmissionError";
  v5[2] = @"SubmissionMode";
  CFStringRef v2 = objc_msgSend(NSNumber, "numberWithLong:", +[PLDefaults mode](PLDefaults, "mode"));
  v6[2] = v2;
  v6[3] = &unk_1F1580E28;
  v5[3] = @"SubmissionReason";
  v5[4] = @"SubmissionStage";
  v6[4] = &unk_1F1580E40;
  dispatch_time_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];

  return v3;
}

void *__33__PLSubmissions_taskingModeSetup__block_invoke_333()
{
  return &unk_1F1587390;
}

BOOL __33__PLSubmissions_taskingModeSetup__block_invoke_2_343(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  taskingModeSetup_classDebugEnabled = result;
  return result;
}

void __33__PLSubmissions_taskingModeSetup__block_invoke_348(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) getCurrentDRConfig];
  CFStringRef v2 = [[PLSubmissionConfig alloc] initWithReasonType:4 DRConfig:v3];
  if (v2) {
    [*(id *)(a1 + 32) submitWithTaskingConfig:v2];
  }
}

- (id)createWatchdogForSubmissionActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [PLTimer alloc];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:3600.0];
  id v7 = dispatch_get_global_queue(2, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PLSubmissions_createWatchdogForSubmissionActivity___block_invoke;
  v11[3] = &unk_1E62557D0;
  id v12 = v4;
  uint64_t v13 = self;
  id v8 = v4;
  uint64_t v9 = [(PLTimer *)v5 initWithFireDate:v6 withInterval:0 withTolerance:0 repeats:v7 withUserInfo:v11 withQueue:0.0 withBlock:0.0];

  return v9;
}

uint64_t __53__PLSubmissions_createWatchdogForSubmissionActivity___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = [NSString stringWithFormat:@"[ERROR] Watchdog fired %@", *(void *)(a1 + 32)];
  id v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
  id v4 = [v3 lastPathComponent];
  uint64_t v5 = [NSString stringWithUTF8String:"-[PLSubmissions createWatchdogForSubmissionActivity:]_block_invoke"];
  +[PLCoreStorage logMessage:v2 fromFile:v4 fromFunction:v5 fromLineNumber:878];

  uint64_t v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v2;
    _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  [*(id *)(a1 + 40) sendSubmissionIssueSignature:*(void *)(a1 + 32)];
  return +[PLUtilities exitWithReason:1002];
}

- (void)stopWatchdogForSubmissionActivity:(id)a3
{
  id v3 = a3;
  [v3 setTimerActive:0];
  [v3 invalidate];
}

- (void)sendSubmissionIssueSignature:(id)a3
{
  id v7 = a3;
  id v3 = objc_alloc_init(MEMORY[0x1E4FA8AF0]);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v5 = [v4 processName];
    uint64_t v6 = [v3 signatureWithDomain:@"PowerlogSubmission" type:@"Timeout" subType:v7 subtypeContext:&stru_1F15208F0 detectedProcess:v5 triggerThresholdValues:@"3600"];

    [v3 snapshotWithSignature:v6 duration:0 events:0 payload:0 actions:&__block_literal_global_370 reply:600.0];
  }
}

void __46__PLSubmissions_sendSubmissionIssueSignature___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FA8C70]];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    uint64_t v5 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FA8C68]];
    uint64_t v6 = [NSString stringWithFormat:@"SDRDiagnosticReporter response = %@, sessionID = %@", v2, v5];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
    id v8 = [v7 lastPathComponent];
    uint64_t v9 = [NSString stringWithUTF8String:"-[PLSubmissions sendSubmissionIssueSignature:]_block_invoke"];
    +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:903];

    uint64_t v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = [NSString stringWithFormat:@"SDRDiagnosticReporter dampened"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m"];
    id v12 = [v11 lastPathComponent];
    uint64_t v13 = [NSString stringWithUTF8String:"-[PLSubmissions sendSubmissionIssueSignature:]_block_invoke"];
    +[PLCoreStorage logMessage:v5 fromFile:v12 fromFunction:v13 fromLineNumber:906];

    uint64_t v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
}

- (void)initSubmissionQueue
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v2 = PLLogSubmission();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v2, OS_LOG_TYPE_DEFAULT, "Initializing submission queue", buf, 2u);
  }

  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = NSTemporaryDirectory();
  uint64_t v5 = [v4 stringByAppendingPathComponent:@"PLSubmissionConfig"];
  uint64_t v6 = [v3 enumeratorAtPath:v5];

  unint64_t v7 = 0x1E4F28000uLL;
  __int16 v59 = [MEMORY[0x1E4F1CA48] array];
  v60 = [MEMORY[0x1E4F1CA80] set];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v74 objects:v84 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v75;
    uint64_t v11 = @"PLSubmissionConfig";
    do
    {
      uint64_t v12 = 0;
      uint64_t v61 = v9;
      do
      {
        if (*(void *)v75 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v74 + 1) + 8 * v12);
        uint64_t v14 = NSTemporaryDirectory();
        id v15 = [v14 stringByAppendingPathComponent:v11];
        uint64_t v16 = [v15 stringByAppendingPathComponent:v13];

        char v73 = 0;
        double v17 = [*(id *)(v7 + 3256) defaultManager];
        LODWORD(v14) = [v17 fileExistsAtPath:v16 isDirectory:&v73];

        if (v14) {
          BOOL v18 = v73 == 0;
        }
        else {
          BOOL v18 = 0;
        }
        if (v18)
        {
          uint64_t v19 = v11;
          uint64_t v20 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v16];
          id v21 = (void *)MEMORY[0x1E4F28DC0];
          uint64_t v22 = objc_opt_class();
          id v72 = 0;
          int v23 = [v21 unarchivedObjectOfClass:v22 fromData:v20 error:&v72];
          id v24 = v72;
          if (v24)
          {
            uint64_t v25 = PLLogSubmission();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v81 = v16;
              __int16 v82 = 2112;
              id v83 = v24;
              _os_log_error_impl(&dword_1BBD2F000, v25, OS_LOG_TYPE_ERROR, "Failed to read record from file: %@, error: %@", buf, 0x16u);
            }
            goto LABEL_21;
          }
          __int16 v26 = [*(id *)(v7 + 3256) defaultManager];
          BOOL v27 = [v23 filePath];
          char v28 = [v26 fileExistsAtPath:v27];

          if (v28)
          {
            [v59 addObject:v23];
            BOOL v29 = [v23 tagUUID];
            [v60 addObject:v29];
            id v24 = (id)v20;
            unint64_t v7 = 0x1E4F28000;
          }
          else
          {
            uint64_t v25 = PLLogSubmission();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              id v30 = [v23 filePath];
              *(_DWORD *)buf = 138412546;
              id v81 = v30;
              __int16 v82 = 2112;
              id v83 = v23;
              _os_log_error_impl(&dword_1BBD2F000, v25, OS_LOG_TYPE_ERROR, "File %@ does not exist for record %@", buf, 0x16u);
            }
            unint64_t v7 = 0x1E4F28000uLL;
LABEL_21:

            BOOL v29 = v23;
            int v23 = (void *)v20;
          }

          uint64_t v11 = v19;
          uint64_t v9 = v61;
        }

        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v74 objects:v84 count:16];
    }
    while (v9);
  }

  [*(id *)(v7 + 3256) defaultManager];
  v32 = unint64_t v31 = v7;
  id v71 = 0;
  char v33 = [v32 contentsOfDirectoryAtPath:@"/tmp/powerlog/" error:&v71];
  id v34 = v71;

  if (v34)
  {
    v35 = PLLogSubmission();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v81 = v34;
      _os_log_impl(&dword_1BBD2F000, v35, OS_LOG_TYPE_DEFAULT, "Failed to read contents at tmp: %@", buf, 0xCu);
    }
  }
  else
  {
    long long v57 = v33;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v36 = v33;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v67 objects:v79 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = v31;
      uint64_t v40 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v68 != v40) {
            objc_enumerationMutation(v36);
          }
          v42 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          char v43 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v42];
          if (v43)
          {
            id v44 = [@"/tmp/powerlog/" stringByAppendingPathComponent:v42];
            char v73 = 0;
            id v45 = [*(id *)(v39 + 3256) defaultManager];
            int v46 = [v45 fileExistsAtPath:v44 isDirectory:&v73];

            if (v46) {
              BOOL v47 = v73 == 0;
            }
            else {
              BOOL v47 = 1;
            }
            if (!v47 && ([v42 containsString:@"cloud"] & 1) == 0)
            {
              uint64_t v48 = [v42 lastPathComponent];
              if (([v60 containsObject:v48] & 1) == 0)
              {
                uint64_t v49 = PLLogSubmission();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v81 = v48;
                  _os_log_impl(&dword_1BBD2F000, v49, OS_LOG_TYPE_DEFAULT, "Removing temporary files for: %@", buf, 0xCu);
                }

                [(PLSubmissions *)self cleanupTemporarySubmissionFilesForTag:v48];
              }
            }
            uint64_t v39 = 0x1E4F28000;
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v67 objects:v79 count:16];
      }
      while (v38);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v35 = v59;
    uint64_t v50 = [v35 countByEnumeratingWithState:&v63 objects:v78 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v64;
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v64 != v52) {
            objc_enumerationMutation(v35);
          }
          v54 = *(void **)(*((void *)&v63 + 1) + 8 * j);
          long long v55 = PLLogSubmission();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            long long v56 = [v54 tagUUID];
            *(_DWORD *)buf = 138412290;
            id v81 = v56;
            _os_log_impl(&dword_1BBD2F000, v55, OS_LOG_TYPE_DEFAULT, "Initialized and enqueued record from disk: %@", buf, 0xCu);
          }
          [(PLSubmissions *)self enqueueSubmissionRecord:v54];
        }
        uint64_t v51 = [v35 countByEnumeratingWithState:&v63 objects:v78 count:16];
      }
      while (v51);
    }
    id v34 = 0;
    char v33 = v57;
  }
}

- (void)cleanupTemporarySubmissionFilesForTag:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLSubmissionRecord getDASubmissionDirPathForTag:v4];
  [(PLSubmissions *)self removeFileAtPath:v5];

  id v6 = +[PLSubmissionRecord getCKSubmissionDirPathForTag:v4];

  [(PLSubmissions *)self removeFileAtPath:v6];
}

- (void)persistSubmissionInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = NSTemporaryDirectory();
    uint64_t v5 = [v4 stringByAppendingPathComponent:@"PLSubmissionConfig"];
    id v6 = [v3 tagUUID];
    unint64_t v7 = [v5 stringByAppendingPathComponent:v6];

    if (+[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:v7])
    {
      id v12 = 0;
      uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v12];
      uint64_t v9 = v12;
      if (v9)
      {
        uint64_t v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[PLSubmissions persistSubmissionInfo:]();
        }
      }
      else
      {
        uint64_t v10 = [v7 stringByAppendingPathComponent:@"record"];
        if (([v8 writeToFile:v10 atomically:1] & 1) == 0)
        {
          uint64_t v11 = PLLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            -[PLSubmissions persistSubmissionInfo:]();
          }
        }
      }
    }
    else
    {
      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v7;
        _os_log_impl(&dword_1BBD2F000, v9, OS_LOG_TYPE_DEFAULT, "Failed to create dir: %@", buf, 0xCu);
      }
    }
  }
}

- (void)logSubmissionStateToAnalytics:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v3 stringWithFormat:@"%@.%@", @"com.apple.powerlog.iCloudTaskingSubmission", v4];
  PLADClientAddValueForScalarKey();
  AnalyticsSendEventLazy();
}

id __47__PLSubmissions_logSubmissionStateToAnalytics___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"state";
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)emitCollisionEvent:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v10 = v3;
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"TaskingBlobCollision"];
    uint64_t v5 = [v10 configUUID];

    if (v5)
    {
      id v6 = [v10 configUUID];
      unint64_t v7 = [v6 UUIDString];
      [v4 setObject:v7 forKeyedSubscript:@"DPTaskingUUID"];
    }
    uint64_t v8 = [v10 payloadDictionaryRepresentation];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"PLTaskingRequest"];

    if (v9) {
      [v4 setObject:v9 forKeyedSubscript:@"TaskingReason"];
    }
    _submitTaskingCAEventPayload(v4, @"Collision with DA tasking");

    id v3 = v10;
  }
}

- (void)emitBlobDetectedEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = v4;
    if (![(PLSubmissions *)self internalSubmissionBehavior])
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
      [v5 setObject:@"TaskingBlobDetected" forKeyedSubscript:@"TaskingState"];
      if ([v11 isDRTasking])
      {
        id v6 = [v11 configUUID];

        if (v6)
        {
          unint64_t v7 = [v11 configUUID];
          uint64_t v8 = [v7 UUIDString];
          [v5 setObject:v8 forKeyedSubscript:@"DPTaskingUUID"];
        }
      }
      uint64_t v9 = [v11 request];

      if (v9)
      {
        id v10 = [v11 request];
        [v5 setObject:v10 forKeyedSubscript:@"TaskingReason"];
      }
      _submitTaskingCAEventPayload(v5, @"Tasking blob detected");
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)emitBlobVerifiedEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v13 = v4;
    if (![(PLSubmissions *)self internalSubmissionBehavior])
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
      [v5 setObject:@"TaskingBlobVerified" forKeyedSubscript:@"TaskingState"];
      if ([v13 isDRTasking])
      {
        id v6 = [v13 configUUID];

        if (v6)
        {
          unint64_t v7 = [v13 configUUID];
          uint64_t v8 = [v7 UUIDString];
          [v5 setObject:v8 forKeyedSubscript:@"DPTaskingUUID"];
        }
      }
      uint64_t v9 = [v13 blobFailureReason];

      if (v9)
      {
        id v10 = [v13 blobFailureReason];
        [v5 setObject:v10 forKeyedSubscript:@"TaskingBlobFailureReason"];
      }
      uint64_t v11 = [v13 request];

      if (v11)
      {
        id v12 = [v13 request];
        [v5 setObject:v12 forKeyedSubscript:@"TaskingReason"];
      }
      _submitTaskingCAEventPayload(v5, @"Tasking blob verified");
    }
  }
  MEMORY[0x1F41817F8]();
}

- (PLStorageOperator)storageOperator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageOperator);
  return (PLStorageOperator *)WeakRetained;
}

- (void)setStorageOperator:(id)a3
{
}

- (BOOL)xpcActivityStarted
{
  return self->_xpcActivityStarted;
}

- (void)setXpcActivityStarted:(BOOL)a3
{
  self->_xpcActivityStarted = a3;
}

- (NSMutableArray)submissionQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSubmissionQueue:(id)a3
{
}

- (double)lastXPCActivityTimestamp
{
  return self->_lastXPCActivityTimestamp;
}

- (void)setLastXPCActivityTimestamp:(double)a3
{
  self->_lastXPCActivityTimestamp = a3;
}

- (double)xpcActivityDelay
{
  return self->_xpcActivityDelay;
}

- (void)setXpcActivityDelay:(double)a3
{
  self->_xpcActivityDelay = a3;
}

- (BOOL)taskingStarted
{
  return self->_taskingStarted;
}

- (PLSQLiteConnection)connection
{
  return (PLSQLiteConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSString)request
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSString)filterQuery
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFilterQuery:(id)a3
{
}

- (NSString)onDemandTasking
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOnDemandTasking:(id)a3
{
}

- (NSNumber)capValue
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCapValue:(id)a3
{
}

- (DRConfigMonitor)taskingMonitor
{
  return (DRConfigMonitor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTaskingMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskingMonitor, 0);
  objc_storeStrong((id *)&self->_capValue, 0);
  objc_storeStrong((id *)&self->_onDemandTasking, 0);
  objc_storeStrong((id *)&self->_filterQuery, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_submissionQueue, 0);
  objc_destroyWeak((id *)&self->_storageOperator);
}

void __64__PLSubmissions_XPCScheduling__registerUploadSchedulingActivity__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "Failed to set background state to continue", v2, v3, v4, v5, v6);
}

void __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_DEBUG, "Record %@ completed: %@", v1, 0x16u);
}

void __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_107_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "xpcActivity passed not in continue state", v2, v3, v4, v5, v6);
}

void __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_107_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "XPC activity criteria dict is null", v2, v3, v4, v5, v6);
}

- (void)configFromMonitor:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 teamID];
  int v6 = 138412546;
  unint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1BBD2F000, a3, OS_LOG_TYPE_ERROR, "Error getting current config from DRConfigMonitor <%@> : %@", (uint8_t *)&v6, 0x16u);
}

- (void)generateOTASubmissionAndSendTaskingEndSubmission:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Nothing to submit for reason %d", (uint8_t *)v2, 8u);
}

- (void)prepareAndEnqueueSubmissionFilesWithConfig:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "Not submitting submission record to DiagnosticPipeline due to missing info", buf, 2u);
}

- (void)submitRecordToDiagnosticPipeline:withConfig:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "Error occurred when submitting to DiagnosticPipeline: %@", v2, v3, v4, v5, v6);
}

- (void)persistSubmissionInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "Failed to write record %@ to file", v2, v3, v4, v5, v6);
}

- (void)persistSubmissionInfo:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to serialize record: %@, error: %@");
}

@end