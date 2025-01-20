@interface PLRapidController
+ (BOOL)deferActivity:(id)a3;
+ (BOOL)diagnosticLogSubmissionEnabled;
+ (BOOL)finishActivity:(id)a3 withStatus:(int64_t)a4;
+ (BOOL)randomBoolWithYesPercentage:(double)a3;
+ (id)allTablesInDB:(id)a3;
+ (id)appsToKeep:(id)a3;
+ (id)dataCollectionCriterion;
+ (id)sharedInstance;
+ (id)trimConditionsForTables:(id)a3 trimDate:(id)a4;
+ (int)hangTypeFromStr:(id)a3;
+ (void)cleanup;
+ (void)dropDataFromDB:(id)a3 withConfig:(id)a4;
+ (void)dropTablesFromDB:(id)a3 withConfig:(id)a4;
+ (void)offsetTimestampsInDB:(id)a3 withConfig:(id)a4 withBaseTimestamp:(double)a5;
+ (void)roundDataInDB:(id)a3 withConfig:(id)a4;
- (BOOL)copyDB;
- (BOOL)isUploadSizeWithinLimit:(id)a3;
- (BOOL)packageDB:(id)a3;
- (BOOL)prepareMSSLog;
- (BOOL)preparePerfPowerlog:(id)a3 shouldDefer:(BOOL *)a4;
- (BOOL)shouldDoRapidCollection;
- (DRConfigMonitor)taskingMonitor;
- (NSDate)logCreationEndDate;
- (NSDate)logCreationResumeDate;
- (NSDate)logCreationStartDate;
- (NSString)configUUID;
- (NSString)failureReason;
- (NSString)mdLogCompressedFilePath;
- (NSString)mdLogFilePath;
- (NSString)mssCompressedFilePath;
- (NSString)mssFilePath;
- (NSString)taskingRequestReason;
- (PLRapidController)init;
- (double)samplingPercentage;
- (id)configFromMonitor:(id)a3;
- (id)generateContextDictionary:(id)a3;
- (id)generateDummyPayload;
- (id)logGenerationStats;
- (id)packageAllLogs;
- (id)setupConnection;
- (id)topAppsRunTime;
- (id)uploadLog:(id)a3;
- (int64_t)stage;
- (void)addMDLogContext:(id)a3;
- (void)addMSSContext:(id)a3;
- (void)completeTaskingConfig:(id)a3;
- (void)createHangTableInDB:(id)a3;
- (void)dropAppVersions:(id)a3;
- (void)dropDuplicateRows:(id)a3;
- (void)generateDummyPayload;
- (void)handleDRConfigUpdate:(id)a3 error:(id)a4;
- (void)handleXPCActivityCallback:(id)a3;
- (void)initializeSamplingPercentage;
- (void)initializeTaskingParams;
- (void)logHangSignposts:(id)a3 toDB:(id)a4;
- (void)logSignpostDataToDB:(id)a3;
- (void)logToCADataUploadState:(id)a3;
- (void)logToCALogGenerationStats:(id)a3;
- (void)persistActivityState;
- (void)prepareMSSLog;
- (void)pruneDB:(id)a3 withConfig:(id)a4;
- (void)registerDataCollectionActivity;
- (void)rejectTaskingConfig:(id)a3;
- (void)resetActivity;
- (void)setConfigUUID:(id)a3;
- (void)setFailureReason:(id)a3;
- (void)setLogCreationEndDate:(id)a3;
- (void)setLogCreationResumeDate:(id)a3;
- (void)setLogCreationStartDate;
- (void)setLogCreationStartDate:(id)a3;
- (void)setMDLogCompressedFilePath;
- (void)setMDLogFilePath;
- (void)setMSSCompressedFilePath;
- (void)setMSSFilePath;
- (void)setMdLogCompressedFilePath:(id)a3;
- (void)setMdLogFilePath:(id)a3;
- (void)setMssCompressedFilePath:(id)a3;
- (void)setMssFilePath:(id)a3;
- (void)setSamplingPercentage:(double)a3;
- (void)setStage:(int64_t)a3;
- (void)setTaskingMonitor:(id)a3;
- (void)setTaskingRequestReason:(id)a3;
- (void)setupDRTasking;
- (void)stopDRTasking;
- (void)trimAndFilterDB:(id)a3 withConfig:(id)a4;
@end

@implementation PLRapidController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PLRapidController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, block);
  }
  v2 = (void *)sharedInstance_instance_1;
  return v2;
}

uint64_t __35__PLRapidController_sharedInstance__block_invoke()
{
  sharedInstance_instance_1 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (PLRapidController)init
{
  if (+[PLUtilities isPowerlogHelperd])
  {
    v3 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PLRapidController;
    v4 = [(PLRapidController *)&v7 init];
    v5 = v4;
    if (v4) {
      [(PLRapidController *)v4 setupDRTasking];
    }
    self = v5;
    v3 = self;
  }

  return v3;
}

- (void)initializeSamplingPercentage
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[PLPlatform internalBuild];
  double v4 = 25.0;
  if (!v3)
  {
    BOOL v5 = +[PLPlatform seedBuild];
    double v4 = 0.2;
    if (v5) {
      double v4 = 20.0;
    }
  }
  [(PLRapidController *)self setSamplingPercentage:v4];
  +[PLDefaults doubleForKey:@"RapidSamplingPercentage" ifNotSet:-1.0];
  double v7 = v6;
  +[PLDefaults doubleForKey:@"RapidTaskedSamplingPercentage" ifNotSet:-1.0];
  if (v7 >= 0.0)
  {
    v10 = RapidLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      double v14 = v7;
      _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "Overriding sampling percentage with manual override = %f", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    double v9 = v8;
    if (v8 < 0.0) {
      goto LABEL_12;
    }
    v10 = RapidLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      double v14 = v9;
      _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "Overriding sampling percentage with tasking override = %f", (uint8_t *)&v13, 0xCu);
    }
    double v7 = v9;
  }

  [(PLRapidController *)self setSamplingPercentage:v7];
LABEL_12:
  v11 = RapidLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    [(PLRapidController *)self samplingPercentage];
    int v13 = 134217984;
    double v14 = v12;
    _os_log_impl(&dword_1BBD2F000, v11, OS_LOG_TYPE_DEFAULT, "RAPID sampling percentage: %f", (uint8_t *)&v13, 0xCu);
  }
}

- (void)initializeTaskingParams
{
  BOOL v3 = +[PLDefaults objectForKey:@"RapidTaskingConfigUUID"];
  [(PLRapidController *)self setConfigUUID:v3];

  id v4 = +[PLDefaults objectForKey:@"RapidTaskingRequest"];
  [(PLRapidController *)self setTaskingRequestReason:v4];
}

- (void)persistActivityState
{
  BOOL v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[PLRapidController stage](self, "stage"));
  +[PLDefaults setObject:v3 forKey:@"RapidStage" saveToDisk:1];

  id v4 = [(PLRapidController *)self logCreationStartDate];
  +[PLDefaults setObject:v4 forKey:@"RapidStartDate" saveToDisk:1];

  +[PLDefaults doubleForKey:@"RapidDeferralCount" ifNotSet:0.0];
  double v6 = [NSNumber numberWithDouble:v5 + 1.0];
  +[PLDefaults setObject:v6 forKey:@"RapidDeferralCount" saveToDisk:1];

  double v7 = [(PLRapidController *)self logCreationResumeDate];
  [v7 timeIntervalSinceNow];
  double v9 = v8;

  +[PLDefaults doubleForKey:@"RapidProcessingTime" ifNotSet:0.0];
  id v11 = [NSNumber numberWithDouble:v10 - v9];
  +[PLDefaults setObject:v11 forKey:@"RapidProcessingTime" saveToDisk:1];
}

- (void)resetActivity
{
  +[PLDefaults setObject:0 forKey:@"RapidStage" saveToDisk:1];
  +[PLDefaults setObject:0 forKey:@"RapidStartDate" saveToDisk:1];
  +[PLDefaults setObject:0 forKey:@"RapidDeferralCount" saveToDisk:1];
  +[PLDefaults setObject:0 forKey:@"RapidProcessingTime" saveToDisk:1];
}

- (void)registerDataCollectionActivity
{
  BOOL v3 = RapidLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Register XPC activity", buf, 2u);
  }

  id v4 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __51__PLRapidController_registerDataCollectionActivity__block_invoke;
  handler[3] = &unk_1E62548B0;
  handler[4] = self;
  xpc_activity_register("com.apple.RAPID.DataCollectionActivity", v4, handler);
}

void __51__PLRapidController_registerDataCollectionActivity__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  id v4 = RapidLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "XPC activity handler invoked", buf, 2u);
  }

  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    double v10 = RapidLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "XPC activity stats -> run", v11, 2u);
    }

    [*(id *)(a1 + 32) handleXPCActivityCallback:v3];
  }
  else if (!state)
  {
    double v6 = RapidLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v12 = 0;
      _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_DEFAULT, "XPC activity state -> check-in", v12, 2u);
    }

    xpc_object_t v7 = xpc_activity_copy_criteria(v3);
    double v8 = v7;
    if (!v7 || !xpc_dictionary_get_count(v7))
    {
      double v9 = +[PLRapidController dataCollectionCriterion];
      xpc_activity_set_criteria(v3, v9);
    }
  }
}

- (void)handleXPCActivityCallback:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  +[PLDefaults doubleForKey:@"RapidStage" ifNotSet:-1.0];
  [(PLRapidController *)self setStage:(int)v5];
  [(PLRapidController *)self initializeSamplingPercentage];
  [(PLRapidController *)self initializeTaskingParams];
  if ([(PLRapidController *)self stage] != -1) {
    goto LABEL_4;
  }
  [(PLRapidController *)self logToCADataUploadState:@"CheckShouldUpload"];
  if ([(PLRapidController *)self shouldDoRapidCollection])
  {
    [(PLRapidController *)self setStage:[(PLRapidController *)self stage] + 1];
    [(PLRapidController *)self logToCADataUploadState:@"LogGenerationStart"];
LABEL_4:
    [(PLRapidController *)self setLogCreationStartDate];
    double v6 = RapidLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v7 = [(PLRapidController *)self logCreationStartDate];
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_DEFAULT, "Log generation started at %@", buf, 0xCu);
    }
    char v18 = 0;
    BOOL v8 = [(PLRapidController *)self preparePerfPowerlog:v4 shouldDefer:&v18];
    if (v18)
    {
      [(PLRapidController *)self persistActivityState];
      +[PLRapidController deferActivity:v4];
    }
    else
    {
      BOOL v9 = v8;
      [(PLRapidController *)self prepareMSSLog];
      [(PLRapidController *)self setStage:6];
      double v10 = [MEMORY[0x1E4F1C9C8] date];
      [(PLRapidController *)self setLogCreationEndDate:v10];

      id v11 = RapidLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        double v12 = [(PLRapidController *)self logCreationEndDate];
        *(_DWORD *)buf = 138412546;
        v20 = v12;
        __int16 v21 = 1024;
        BOOL v22 = v9;
        _os_log_impl(&dword_1BBD2F000, v11, OS_LOG_TYPE_DEFAULT, "Log generation ended at %@ success: %d", buf, 0x12u);
      }
      if (v9)
      {
        int v13 = [(PLRapidController *)self packageAllLogs];
        if (v13) {
          [(PLRapidController *)self logToCADataUploadState:@"LogGenerationComplete"];
        }
      }
      else
      {
        int v13 = 0;
      }
      [(PLRapidController *)self logToCADataUploadState:@"LogSubmitToDPAttempt"];
      uint64_t v15 = [(PLRapidController *)self uploadLog:v13];
      [(PLRapidController *)self resetActivity];
      if (v15)
      {
        v16 = RapidLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[PLRapidController handleXPCActivityCallback:]();
        }

        uint64_t v17 = 3;
      }
      else
      {
        [(PLRapidController *)self logToCADataUploadState:@"LogSubmitToDPSuccess"];
        if (v13) {
          uint64_t v17 = 0;
        }
        else {
          uint64_t v17 = 3;
        }
      }
      +[PLRapidController finishActivity:v4 withStatus:v17];
    }
    goto LABEL_25;
  }
  double v14 = RapidLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v14, OS_LOG_TYPE_DEFAULT, "Device should not upload today!", buf, 2u);
  }

  +[PLRapidController finishActivity:v4 withStatus:2];
LABEL_25:
}

+ (id)dataCollectionCriterion
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = RapidLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1BBD2F000, v2, OS_LOG_TYPE_DEFAULT, "Preparing data collection criterion", (uint8_t *)&v11, 2u);
  }

  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14340], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14188], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14250], 1);
  id v4 = +[PLDefaults objectForKey:@"RapidActivityInterval" ifNotSet:0];
  if (v4)
  {
    double v5 = RapidLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      double v12 = v4;
      _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "Overriding RAPID activity interval to %@ secs", (uint8_t *)&v11, 0xCu);
    }

    double v6 = (const char *)*MEMORY[0x1E4F141C8];
    int64_t v7 = [v4 unsignedIntValue];
    BOOL v8 = v3;
    BOOL v9 = v6;
  }
  else
  {
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
    BOOL v9 = (const char *)*MEMORY[0x1E4F141A8];
    int64_t v7 = *MEMORY[0x1E4F14218];
    BOOL v8 = v3;
  }
  xpc_dictionary_set_int64(v8, v9, v7);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);

  return v3;
}

+ (BOOL)finishActivity:(id)a3 withStatus:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int v5 = xpc_activity_set_completion_status();
    double v6 = RapidLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218240;
      int64_t v9 = a4;
      __int16 v10 = 1024;
      int v11 = v5;
      _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_DEFAULT, "XPC activity set state to DONE, status: %ld success: %d", (uint8_t *)&v8, 0x12u);
    }

    +[PLRapidController cleanup];
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (BOOL)deferActivity:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v3 = xpc_activity_set_state((xpc_activity_t)a3, 3);
    id v4 = RapidLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "XPC activity set state to DEFER, success: %d", (uint8_t *)v6, 8u);
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)shouldDoRapidCollection
{
  BOOL v3 = RapidLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Device upload check", v6, 2u);
  }

  BOOL v4 = +[PLRapidController diagnosticLogSubmissionEnabled];
  if (v4)
  {
    [(PLRapidController *)self samplingPercentage];
    LOBYTE(v4) = +[PLRapidController randomBoolWithYesPercentage:](PLRapidController, "randomBoolWithYesPercentage:");
  }
  return v4;
}

+ (BOOL)diagnosticLogSubmissionEnabled
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = DiagnosticLogSubmissionEnabled();
  BOOL v3 = RapidLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "DNU upload: %d", (uint8_t *)v5, 8u);
  }

  return v2;
}

+ (BOOL)randomBoolWithYesPercentage:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v4 = (double)arc4random() * 100.0 * 2.32830644e-10;
  int v5 = RapidLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4 < a3;
    _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "Coin toss upload: %d", (uint8_t *)v7, 8u);
  }

  return v4 < a3;
}

- (BOOL)preparePerfPowerlog:(id)a3 shouldDefer:(BOOL *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (_xpc_activity_s *)a3;
  if ([(PLRapidController *)self stage] <= 4)
  {
    uint64_t v8 = RapidLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "Preparing perfpowerlog", (uint8_t *)&v15, 2u);
    }

    [(PLRapidController *)self setMDLogFilePath];
    [(PLRapidController *)self setMDLogCompressedFilePath];
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:@"/tmp/rapid/"];
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:@"/tmp/rapid/rapid_archive"];
    int64_t v9 = getRapidAllowblocklist();
    if ([(PLRapidController *)self stage] > 4)
    {
      __int16 v10 = 0;
    }
    else
    {
      __int16 v10 = 0;
      while (!*a4)
      {
        if (!v10)
        {
          if ([(PLRapidController *)self stage] < 1)
          {
            __int16 v10 = 0;
          }
          else
          {
            __int16 v10 = [(PLRapidController *)self setupConnection];
            if (!v10)
            {
LABEL_31:
              BOOL v7 = 0;
              goto LABEL_29;
            }
          }
        }
        switch([(PLRapidController *)self stage])
        {
          case 0:
            if (![(PLRapidController *)self copyDB]) {
              goto LABEL_31;
            }
            break;
          case 1:
            [(PLRapidController *)self pruneDB:v10 withConfig:v9];
            break;
          case 2:
            [(PLRapidController *)self logSignpostDataToDB:v10];
            break;
          case 3:
            [(PLRapidController *)self trimAndFilterDB:v10 withConfig:v9];
            break;
          case 4:
            if (![(PLRapidController *)self packageDB:v10]) {
              goto LABEL_31;
            }
            break;
          default:
            break;
        }
        [(PLRapidController *)self setStage:[(PLRapidController *)self stage] + 1];
        *a4 = xpc_activity_should_defer(v6);
        if ([(PLRapidController *)self stage] >= 5) {
          break;
        }
      }
    }
    if ([(PLRapidController *)self stage] == 5)
    {
      int v11 = [(PLRapidController *)self mdLogCompressedFilePath];
      uint64_t v12 = +[PLFileStats fileSizeAtPath:v11];

      if (v12 > (uint64_t)((double)+[PLDefaults longForKey:@"RapidTaskedUploadSizeLimit" ifNotSet:2048000]* 0.7))
      {
        uint64_t v13 = RapidLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 134217984;
          uint64_t v16 = v12;
          _os_log_impl(&dword_1BBD2F000, v13, OS_LOG_TYPE_DEFAULT, "MDLog size = %lld, skipping MSS upload", (uint8_t *)&v15, 0xCu);
        }

        *a4 = 0;
        [(PLRapidController *)self setStage:6];
      }
    }
    BOOL v7 = 1;
LABEL_29:
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)setupConnection
{
  char v13 = 0;
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v4 = [(PLRapidController *)self mdLogFilePath];
  int v5 = [v3 fileExistsAtPath:v4 isDirectory:&v13];

  if (v5) {
    BOOL v6 = v13 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    int64_t v9 = [PLSQLiteConnection alloc];
    __int16 v10 = [(PLRapidController *)self mdLogFilePath];
    uint64_t v8 = [(PLSQLiteConnection *)v9 initWithFilePath:v10];
  }
  else
  {
    BOOL v7 = RapidLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1BBD2F000, v7, OS_LOG_TYPE_DEFAULT, "Expected file, but not found. Resetting stage, try next time!", v12, 2u);
    }

    [(PLRapidController *)self setFailureReason:@"SetupConnectionFileMissing"];
    uint64_t v8 = 0;
  }
  return v8;
}

- (BOOL)copyDB
{
  BOOL v3 = RapidLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v10 = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Copy DB", v10, 2u);
  }

  double v4 = +[PowerlogCore sharedCore];
  int v5 = [v4 storage];
  BOOL v6 = [v5 connection];

  BOOL v7 = [(PLRapidController *)self mdLogFilePath];
  char v8 = [v6 copyDatabaseToPath:v7];

  if ((v8 & 1) == 0) {
    [(PLRapidController *)self setFailureReason:@"CopyDB"];
  }

  return v8;
}

- (void)pruneDB:(id)a3 withConfig:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = RapidLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v9 = 0;
    _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "Prune DB", v9, 2u);
  }

  [v7 beginTransaction];
  +[PLRapidController dropTablesFromDB:v7 withConfig:v6];
  +[PLRapidController dropDataFromDB:v7 withConfig:v6];

  [(PLRapidController *)self dropAppVersions:v7];
  [v7 endTransaction];
}

- (void)trimAndFilterDB:(id)a3 withConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = RapidLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "Trim DB", buf, 2u);
  }

  [v6 beginTransaction];
  int64_t v9 = [(PLRapidController *)self logCreationStartDate];
  __int16 v10 = [v9 convertFromSystemToMonotonic];

  int v11 = [v10 dateByAddingTimeInterval:-86400.0];
  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  char v13 = [v7 allKeys];
  double v14 = [v12 setWithArray:v13];

  int v15 = +[PLRapidController trimConditionsForTables:v14 trimDate:v11];
  [v6 trimAllTablesFromDate:v11 toDate:v10 withTableFilters:v15];
  uint64_t v16 = RapidLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1BBD2F000, v16, OS_LOG_TYPE_DEFAULT, "Time Offsetting", v19, 2u);
  }

  [v11 timeIntervalSince1970];
  +[PLRapidController offsetTimestampsInDB:withConfig:withBaseTimestamp:](PLRapidController, "offsetTimestampsInDB:withConfig:withBaseTimestamp:", v6, v7);
  uint64_t v17 = RapidLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v18 = 0;
    _os_log_impl(&dword_1BBD2F000, v17, OS_LOG_TYPE_DEFAULT, "Rounding", v18, 2u);
  }

  +[PLRapidController roundDataInDB:v6 withConfig:v7];
  [(PLRapidController *)self dropDuplicateRows:v6];
  [v6 endTransaction];
}

- (BOOL)packageDB:(id)a3
{
  id v4 = a3;
  int v5 = RapidLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "Attribute", buf, 2u);
  }

  id v6 = (id)[v4 performQuery:@"CREATE TABLE attributes(name TEXT PRIMARY KEY, value) WITHOUT ROWID"];
  id v7 = (id)[v4 performQuery:@"INSERT INTO attributes (name, value) VALUES (\"LogType\", \"RAPID\");"];
  char v8 = RapidLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v15 = 0;
    _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "Vacuum", v15, 2u);
  }

  [v4 fullVacuum];
  [v4 closeConnection];
  int64_t v9 = RapidLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v14 = 0;
    _os_log_impl(&dword_1BBD2F000, v9, OS_LOG_TYPE_DEFAULT, "Compress DB", v14, 2u);
  }

  __int16 v10 = [(PLRapidController *)self mdLogFilePath];
  int v11 = [(PLRapidController *)self mdLogCompressedFilePath];
  BOOL v12 = +[PLUtilities compressWithSource:v10 withDestination:v11 withLevel:6];

  if (!v12) {
    [(PLRapidController *)self setFailureReason:@"CompressDB"];
  }

  return v12;
}

+ (void)dropTablesFromDB:(id)a3 withConfig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PLRapidController allTablesInDB:v5];
  char v8 = (void *)MEMORY[0x1E4F1CAD0];
  int64_t v9 = [v6 allKeys];
  __int16 v10 = [v8 setWithArray:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__PLRapidController_dropTablesFromDB_withConfig___block_invoke;
  v14[3] = &unk_1E6255618;
  id v15 = v10;
  id v16 = v6;
  id v17 = v5;
  id v11 = v5;
  id v12 = v6;
  id v13 = v10;
  [v7 enumerateObjectsUsingBlock:v14];
}

void __49__PLRapidController_dropTablesFromDB_withConfig___block_invoke(id *a1, void *a2)
{
  id v9 = [a2 objectForKeyedSubscript:@"name"];
  int v3 = [a1[4] containsObject:v9];
  id v4 = [a1[5] objectForKeyedSubscript:v9];
  id v5 = [v4 objectForKeyedSubscript:@"isIHA"];
  if ([v5 BOOLValue]) {
    int v6 = !+[PLUtilities isHealthDataSubmissionAllowed];
  }
  else {
    int v6 = 0;
  }

  if (!v3 || v6)
  {
    id v7 = [NSString stringWithFormat:@"DROP TABLE '%@';", v9];
    if (v7) {
      id v8 = (id)[a1[6] performQuery:v7];
    }
  }
}

+ (void)dropDataFromDB:(id)a3 withConfig:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __47__PLRapidController_dropDataFromDB_withConfig___block_invoke;
  v7[3] = &unk_1E6255668;
  id v8 = v5;
  id v6 = v5;
  [a4 enumerateKeysAndObjectsUsingBlock:v7];
}

void __47__PLRapidController_dropDataFromDB_withConfig___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 objectForKeyedSubscript:@"drop"];
  if (v6)
  {
    char v7 = [v5 containsString:@"_Aggregate_"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__PLRapidController_dropDataFromDB_withConfig___block_invoke_2;
    v8[3] = &unk_1E6255640;
    char v12 = v7;
    id v9 = v5;
    id v10 = *(id *)(a1 + 32);
    id v11 = @"ALTER TABLE %@ DROP COLUMN \"%@\"";
    [v6 enumerateObjectsUsingBlock:v8];
  }
}

void __47__PLRapidController_dropDataFromDB_withConfig___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = [NSString stringWithFormat:@"DROP INDEX IF EXISTS Index_%@_%@", *(void *)(a1 + 32), v3];
    id v5 = (id)[*(id *)(a1 + 40) performQuery:v4];

    id v3 = v8;
  }
  id v6 = objc_msgSend(NSString, "stringWithFormat:", *(void *)(a1 + 48), *(void *)(a1 + 32), v3);
  id v7 = (id)[*(id *)(a1 + 40) performQuery:v6];
}

- (void)dropAppVersions:(id)a3
{
  id v8 = a3;
  id v4 = [(PLRapidController *)self topAppsRunTime];
  id v5 = [MEMORY[0x1E4F28E78] stringWithFormat:@"delete from PLApplicationAgent_EventNone_AllApps"];
  id v6 = +[PLRapidController appsToKeep:v4];
  [v5 appendString:v6];

  id v7 = (id)[v8 performQuery:v5];
}

+ (id)appsToKeep:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 count])
  {
    id v5 = &stru_1F15208F0;
    goto LABEL_13;
  }
  id v4 = [MEMORY[0x1E4F4BD00] defaultService];
  if ([v4 autoUpdateEnabled])
  {
  }
  else
  {
    unint64_t v6 = [v3 count];

    if (v6 >= 3)
    {
      uint32_t v11 = [v3 count];
      id v9 = [v3 objectAtIndexedSubscript:arc4random_uniform(v11)];
      char v12 = [v3 objectAtIndexedSubscript:arc4random_uniform(v11)];
      id v13 = RapidLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v16 = v9;
        __int16 v17 = 2112;
        char v18 = v12;
        _os_log_impl(&dword_1BBD2F000, v13, OS_LOG_TYPE_DEFAULT, "Report app version data for: %@, %@", buf, 0x16u);
      }

      id v10 = [NSString stringWithFormat:@" where AppBundleId not in ('%@','%@')", v9, v12];

      goto LABEL_12;
    }
  }
  id v7 = RapidLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v3;
    _os_log_impl(&dword_1BBD2F000, v7, OS_LOG_TYPE_DEFAULT, "Report app version data for all top 3rd party apps: %@", buf, 0xCu);
  }

  id v8 = NSString;
  id v9 = [v3 componentsJoinedByString:@"','"];
  id v10 = [v8 stringWithFormat:@" where AppBundleId not in ('%@')", v9];
LABEL_12:

  id v5 = v10;
LABEL_13:

  return v5;
}

- (id)topAppsRunTime
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = +[PowerlogCore sharedCore];
  id v5 = [v4 storage];
  unint64_t v6 = [v5 connection];

  id v7 = [(PLRapidController *)self logCreationStartDate];
  id v8 = [v7 convertFromSystemToMonotonic];

  id v9 = [v8 dateByAddingTimeInterval:-86400.0];
  id v10 = NSString;
  [v9 timeIntervalSince1970];
  uint64_t v12 = v11;
  [v8 timeIntervalSince1970];
  objc_msgSend(v10, "stringWithFormat:", @"select distinct AppBundleId as app from PLApplicationAgent_EventNone_AllApps                              where AppIs3rdParty = 1 OR AppBundleId NOT like '%%com.apple.%%' AND AppBundleId in                              (select BundleID from PLAppTimeService_Aggregate_AppRunTime where timestamp >= %f AND timestamp < %f                               group by BundleID having SUM(ScreenOnTime) > %d                             );",
    v12,
    v13,
  double v14 = 60);
  BOOL v22 = v6;
  id v15 = [v6 performQuery:v14];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v23 + 1) + 8 * i) objectForKeyedSubscript:@"app"];
        [v3 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  return v3;
}

- (void)dropDuplicateRows:(id)a3
{
  id v3 = a3;
  id v4 = RapidLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v6 = 0;
    _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "Drop Duplicate Rows", v6, 2u);
  }

  id v5 = (id)[v3 performQuery:@"DELETE from PLBBAgent_EventPoint_TelephonyActivity where ID in (SELECT ID FROM PLBBAgent_EventPoint_TelephonyActivity t1 WHERE EXISTS (SELECT * FROM PLBBAgent_EventPoint_TelephonyActivity t2 WHERE t2.airplaneMode IS t1.airplaneMode and t2.callStatus IS t1.callStatus and t2.campedRat IS t1.campedRat and t2.signalBars IS t1.signalBars and t2.subsId IS t1.subsId AND t2.ID = (SELECT MAX(ID) FROM PLBBAgent_EventPoint_TelephonyActivity t3 WHERE t3.ID < t1.ID)));"];
}

+ (void)offsetTimestampsInDB:(id)a3 withConfig:(id)a4 withBaseTimestamp:(double)a5
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__PLRapidController_offsetTimestampsInDB_withConfig_withBaseTimestamp___block_invoke;
  v9[3] = &unk_1E62556B8;
  double v12 = a5;
  id v10 = @"UPDATE %@ SET timestamp = timestamp - %f, ";
  id v11 = v7;
  id v8 = v7;
  [a4 enumerateKeysAndObjectsUsingBlock:v9];
}

void __71__PLRapidController_offsetTimestampsInDB_withConfig_withBaseTimestamp___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  unint64_t v6 = [a3 objectForKeyedSubscript:@"timeOffset"];
  id v7 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", a1[4], v5, a1[6]);

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PLRapidController_offsetTimestampsInDB_withConfig_withBaseTimestamp___block_invoke_2;
  v12[3] = &unk_1E6255690;
  id v13 = v7;
  uint64_t v14 = a1[6];
  id v8 = v7;
  [v6 enumerateObjectsUsingBlock:v12];
  id v9 = (void *)a1[5];
  id v10 = objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 2);
  id v11 = (id)[v9 performQuery:v10];
}

uint64_t __71__PLRapidController_offsetTimestampsInDB_withConfig_withBaseTimestamp___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"\"%@\" = \"%@\" - %f, ", a2, a2, *(void *)(a1 + 40)];
}

+ (void)roundDataInDB:(id)a3 withConfig:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __46__PLRapidController_roundDataInDB_withConfig___block_invoke;
  v7[3] = &unk_1E6255668;
  id v8 = v5;
  id v6 = v5;
  [a4 enumerateKeysAndObjectsUsingBlock:v7];
}

void __46__PLRapidController_roundDataInDB_withConfig___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"roundNearest"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"roundNearestThresholded"];

  if (v7 | v8)
  {
    id v9 = [MEMORY[0x1E4F28E78] stringWithFormat:@"UPDATE %@ SET ", v5];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__PLRapidController_roundDataInDB_withConfig___block_invoke_2;
    v18[3] = &unk_1E62556E0;
    uint64_t v19 = @"((cast(\"%@\" as int) + %d) / %d) * %d";
    id v10 = v9;
    id v20 = v10;
    [(id)v7 enumerateKeysAndObjectsUsingBlock:v18];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__PLRapidController_roundDataInDB_withConfig___block_invoke_3;
    v15[3] = &unk_1E6255708;
    uint64_t v16 = @"((cast(\"%@\" as int) + %d) / %d) * %d";
    id v17 = v10;
    id v11 = v10;
    [(id)v8 enumerateKeysAndObjectsUsingBlock:v15];
    double v12 = *(void **)(a1 + 32);
    id v13 = objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 2);
    id v14 = (id)[v12 performQuery:v13];
  }
}

void __46__PLRapidController_roundDataInDB_withConfig___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 intValue];
  if ((int)v6 >= 0) {
    int v7 = v6;
  }
  else {
    int v7 = v6 + 1;
  }
  objc_msgSend(NSString, "stringWithFormat:", *(void *)(a1 + 32), v5, (v7 >> 1), v6, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) appendFormat:@"\"%@\" =  %@, ", v5, v8];
}

void __46__PLRapidController_roundDataInDB_withConfig___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [v6 componentsSeparatedByString:@","];
  if ([v7 count] == 2)
  {
    id v8 = [v7 objectAtIndexedSubscript:0];
    uint64_t v9 = [v8 intValue];

    id v10 = [v7 objectAtIndexedSubscript:1];
    uint64_t v11 = [v10 intValue];

    if ((int)v11 >= 0) {
      int v12 = v11;
    }
    else {
      int v12 = v11 + 1;
    }
    id v13 = objc_msgSend(NSString, "stringWithFormat:", *(void *)(a1 + 32), v5, (v12 >> 1), v11, v11);
    [*(id *)(a1 + 40) appendFormat:@"\"%@\" =  (\"%@\" > %d) * %@ + (\"%@\" <= %d) * (\"%@\", "), v5, v5, v9, v13, v5, v9, v5];
  }
  else
  {
    id v14 = RapidLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __46__PLRapidController_roundDataInDB_withConfig___block_invoke_3_cold_1();
    }
  }
}

+ (id)trimConditionsForTables:(id)a3 trimDate:(id)a4
{
  id v5 = a3;
  [a4 timeIntervalSince1970];
  uint64_t v7 = v6;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__PLRapidController_trimConditionsForTables_trimDate___block_invoke;
  v13[3] = &unk_1E6255730;
  uint64_t v17 = v7;
  id v14 = @"timestamp is NULL OR timestamp < (SELECT max(timestamp) FROM '%@' WHERE timestamp < %f)";
  id v15 = @"(timestampEnd < %f) OR ((timestamp is NULL OR timestamp < %f) AND (timestampEnd is NULL OR timestampEnd < %f))";
  id v9 = v8;
  id v16 = v9;
  [v5 enumerateObjectsUsingBlock:v13];

  id v10 = v16;
  id v11 = v9;

  return v11;
}

uint64_t __54__PLRapidController_trimConditionsForTables_trimDate___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  if (([v16 containsString:@"_Array_"] & 1) == 0)
  {
    id v3 = +[PLEntryKey PLEntryKeyForEntryKey:v16];
    id v4 = [v3 entryType];
    if ([v4 isEqualToString:@"EventForward"])
    {
    }
    else
    {
      id v5 = [v3 entryKey];
      int v6 = [v5 isEqualToString:@"PLConfigAgent_EventNone_Config"];

      if (!v6)
      {
        id v8 = [v3 entryType];
        int v9 = [v8 isEqualToString:@"EventInterval"];

        if (!v9) {
          goto LABEL_7;
        }
        id v10 = NSString;
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v12 = *(void *)(a1 + 56);
        id v13 = +[PLUtilities deviceBootTime];
        [v13 timeIntervalSince1970];
        uint64_t v7 = objc_msgSend(v10, "stringWithFormat:", v11, v12, v14, *(void *)(a1 + 56));

        if (!v7) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", *(void *)(a1 + 32), v16, *(void *)(a1 + 56));
    if (!v7)
    {
LABEL_7:

      goto LABEL_8;
    }
LABEL_6:
    [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:v16];

    goto LABEL_7;
  }
LABEL_8:
  return MEMORY[0x1F4181820]();
}

+ (id)allTablesInDB:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = [v3 stringWithFormat:@"SELECT name FROM sqlite_master WHERE type=\"table\""];;
  int v6 = [v4 performQuery:v5];

  uint64_t v7 = (void *)[v6 mutableCopy];
  [v7 removeObject:&unk_1F1587200];

  return v7;
}

- (void)setLogCreationStartDate
{
  [a1 stage];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1BBD2F000, v1, v2, "Expected logCreationStartDate for stage %ld but not found!", v3, v4, v5, v6, v7);
}

- (void)setMDLogFilePath
{
  id v3 = [@"/tmp/rapid/" stringByAppendingPathComponent:@"rapid-perfpowerlog.PLSQL"];
  [(PLRapidController *)self setMdLogFilePath:v3];
}

- (void)setMDLogCompressedFilePath
{
}

+ (void)cleanup
{
  BOOL v2 = +[PLDefaults BOOLForKey:@"RapidNoCleanup" ifNotSet:0];
  id v3 = RapidLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Skipping cleanup!", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Cleanup", buf, 2u);
    }

    *(void *)buf = 0;
    uint64_t v11 = buf;
    uint64_t v12 = 0x3032000000;
    id v13 = __Block_byref_object_copy__14;
    uint64_t v14 = __Block_byref_object_dispose__14;
    id v15 = 0;
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v6 = (id *)(v11 + 40);
    id obj = (id)*((void *)v11 + 5);
    uint8_t v7 = [v5 contentsOfDirectoryAtPath:@"/tmp/rapid/" error:&obj];
    objc_storeStrong(v6, obj);

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __28__PLRapidController_cleanup__block_invoke;
    v8[3] = &unk_1E6255758;
    void v8[4] = buf;
    [v7 enumerateObjectsUsingBlock:v8];

    _Block_object_dispose(buf, 8);
  }
}

void __28__PLRapidController_cleanup__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [@"/tmp/rapid/" stringByAppendingPathComponent:a2];
  if (([v3 isEqualToString:@"/tmp/rapid/rapid_archive.tar.gz"] & 1) == 0)
  {
    BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = a1 + 32;
    uint64_t v7 = *(void *)(v6 + 8);
    id obj = *(id *)(v7 + 40);
    char v8 = [v4 removeItemAtPath:v3 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);

    if ((v8 & 1) == 0)
    {
      int v9 = RapidLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __28__PLRapidController_cleanup__block_invoke_cold_1(v5, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
}

- (void)logSignpostDataToDB:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = RapidLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "Signpost Logging", (uint8_t *)&v14, 2u);
  }

  uint64_t v6 = objc_alloc_init(SignpostReaderHelper);
  uint64_t v7 = [(PLRapidController *)self logCreationStartDate];
  char v8 = [v7 dateByAddingTimeInterval:-86400.0];

  int v9 = [(PLRapidController *)self logCreationStartDate];
  uint64_t v10 = [(SignpostReaderHelper *)v6 generateRapidSignpostSummaryWithStartDate:v8 endDate:v9];

  uint64_t v11 = RapidLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 allKeys];
    int v14 = 138412290;
    uint64_t v15 = v12;
    _os_log_impl(&dword_1BBD2F000, v11, OS_LOG_TYPE_DEFAULT, "Signpost result %@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v13 = [v10 objectForKeyedSubscript:@"hangDurations"];
  [(PLRapidController *)self logHangSignposts:v13 toDB:v4];
}

- (void)logHangSignposts:(id)a3 toDB:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = RapidLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v6 count];
    _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "Hangs count %lu", (uint8_t *)&buf, 0xCu);
  }

  if (v6 && [v6 count])
  {
    [(PLRapidController *)self createHangTableInDB:v7];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v14 = 0x2020000000;
    int v15 = 1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__PLRapidController_logHangSignposts_toDB___block_invoke;
    v9[3] = &unk_1E6255780;
    uint64_t v10 = @"INSERT INTO %@ (ID, timestamp, BundleID, HangDuration, HangType) VALUES (%@, %f, '%@', %@, '%@')";
    p_long long buf = &buf;
    id v11 = v7;
    [v6 enumerateObjectsUsingBlock:v9];

    _Block_object_dispose(&buf, 8);
  }
}

void __43__PLRapidController_logHangSignposts_toDB___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  id v3 = (void *)MEMORY[0x1C1869120]();
  id v4 = [v18 objectForKeyedSubscript:@"startDate"];
  uint64_t v5 = [v4 convertFromSystemToMonotonic];
  [v5 timeIntervalSince1970];
  uint64_t v7 = v6;

  char v8 = NSNumber;
  int v9 = [v18 objectForKeyedSubscript:@"type"];
  uint64_t v10 = objc_msgSend(v8, "numberWithInt:", +[PLRapidController hangTypeFromStr:](PLRapidController, "hangTypeFromStr:", v9));

  id v11 = NSString;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  uint64_t v14 = [v18 objectForKeyedSubscript:@"bundleID"];
  int v15 = [v18 objectForKeyedSubscript:@"duration"];
  uint64_t v16 = objc_msgSend(v11, "stringWithFormat:", v12, @"Signposts_HangDurations", v13, v7, v14, v15, v10);

  id v17 = (id)[*(id *)(a1 + 40) performQuery:v16];
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

+ (int)hangTypeFromStr:(id)a3
{
  v13[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v13[0] = @"Completed Runloop Hang";
  v13[1] = @"Timed Out Runloop Hang";
  v13[2] = @"Debugger Attached Runloop Hang";
  v13[3] = @"Extended Launch Runloop Hang";
  void v13[4] = @"App Exit Runloop Hang";
  v13[5] = @"Non-Responsive Task Runloop Hang";
  v13[6] = @"User Switched Away Runloop Hang";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:7];
  uint64_t v6 = (void *)[v4 initWithArray:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v12[0] = @"Runloop and Slow Fence Hang";
  v12[1] = @"Blown Fence Hang";
  v12[2] = @"Blown CA Fence Hang";
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  int v9 = (void *)[v7 initWithArray:v8];

  if (([v3 isEqualToString:@"UIKit-runloop"] & 1) != 0
    || ([v6 containsObject:v3] & 1) != 0)
  {
    int v10 = 1;
  }
  else
  {
    int v10 = 2;
    if (([v3 isEqualToString:@"Fence-hang"] & 1) == 0)
    {
      if ([v9 containsObject:v3]) {
        int v10 = 2;
      }
      else {
        int v10 = 0;
      }
    }
  }

  return v10;
}

- (void)createHangTableInDB:(id)a3
{
}

- (BOOL)prepareMSSLog
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PLRapidController *)self stage];
  RapidLog();
  id v4 = (SignpostReaderHelper *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT);
  if (v3 == 5)
  {
    if (v5)
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1BBD2F000, &v4->super, OS_LOG_TYPE_DEFAULT, "Preparing MSS", (uint8_t *)&v28, 2u);
    }

    [(PLRapidController *)self setMSSFilePath];
    [(PLRapidController *)self setMSSCompressedFilePath];
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:@"/tmp/rapid/rapid_archive/mss"];
    id v4 = objc_alloc_init(SignpostReaderHelper);
    uint64_t v6 = [(PLRapidController *)self logCreationStartDate];
    id v7 = [v6 dateByAddingTimeInterval:-86400.0];
    char v8 = [(PLRapidController *)self logCreationStartDate];
    int v9 = [(PLRapidController *)self mssFilePath];
    int v10 = [(SignpostReaderHelper *)v4 generateRapidMSSWithStartDate:v7 endDate:v8 atPath:v9];

    id v11 = RapidLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      int64_t v29 = (int64_t)v10;
      _os_log_impl(&dword_1BBD2F000, v11, OS_LOG_TYPE_INFO, "generateMSS result: %@", (uint8_t *)&v28, 0xCu);
    }

    uint64_t v12 = [v10 objectForKeyedSubscript:@"success"];

    if (v12)
    {
      uint64_t v13 = [(PLRapidController *)self mssFilePath];
      uint64_t v14 = [(PLRapidController *)self mssCompressedFilePath];
      BOOL v15 = +[PLUtilities compressWithSource:v13 withDestination:v14 withLevel:6];

      if (v15)
      {
        BOOL v16 = 1;
LABEL_19:

        goto LABEL_20;
      }
      long long v26 = RapidLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[PLRapidController prepareMSSLog](self);
      }

      [(PLRapidController *)self setFailureReason:@"CompressMSS"];
    }
    else
    {
      id v17 = RapidLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        [(PLRapidController *)v17 prepareMSSLog];
      }

      long long v25 = [v10 objectForKeyedSubscript:@"error"];
      [(PLRapidController *)self setFailureReason:v25];
    }
    BOOL v16 = 0;
    goto LABEL_19;
  }
  if (v5)
  {
    int v28 = 134217984;
    int64_t v29 = [(PLRapidController *)self stage];
    _os_log_impl(&dword_1BBD2F000, &v4->super, OS_LOG_TYPE_DEFAULT, "Skipping MSS preparation, stage = %ld", (uint8_t *)&v28, 0xCu);
  }
  BOOL v16 = 0;
LABEL_20:

  return v16;
}

- (void)setMSSFilePath
{
  id v3 = [@"/tmp/rapid/" stringByAppendingPathComponent:@"rapid-microstackshot.txt"];
  [(PLRapidController *)self setMssFilePath:v3];
}

- (void)setMSSCompressedFilePath
{
}

- (id)packageAllLogs
{
  id v3 = (void *)MEMORY[0x1E4F5F3C0];
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/tmp/rapid/rapid_archive"];
  BOOL v5 = [v3 archiveDirectoryAt:v4 deleteOriginal:0];

  if (v5)
  {
    uint64_t v6 = [v5 path];
    +[PLUtilities setMobileOwnerForFile:v6];
  }
  else
  {
    [(PLRapidController *)self setFailureReason:@"DEArchiverFailure"];
  }
  id v7 = [v5 path];

  return v7;
}

- (id)generateContextDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(PLRapidController *)self logGenerationStats];
  [(PLRapidController *)self logToCALogGenerationStats:v5];
  uint64_t v6 = (void *)[v5 mutableCopy];
  id v7 = +[PLUtilities supplementalBuildVersion];
  if (v7)
  {
    [v6 setObject:v7 forKeyedSubscript:@"SupplementalBuild"];
  }
  else
  {
    char v8 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v8 forKeyedSubscript:@"SupplementalBuild"];
  }
  int v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F1C400]];
  id v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (__CFString *)v10;
  }
  else {
    uint64_t v12 = @"unknown";
  }
  [v6 setObject:v12 forKeyedSubscript:@"CurrentCountry"];

  [v6 setObject:@"4" forKeyedSubscript:@"Version"];
  [v6 setObject:@"2" forKeyedSubscript:@"MetadataVersion"];
  uint64_t v13 = +[PLUtilities automatedDeviceGroup];
  if (v13) {
    uint64_t v14 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v14 = MEMORY[0x1E4F1CC28];
  }
  [v6 setObject:v14 forKeyedSubscript:@"AutomatedDeviceGroup"];

  BOOL v15 = NSNumber;
  [(PLRapidController *)self samplingPercentage];
  BOOL v16 = objc_msgSend(v15, "numberWithDouble:");
  [v6 setObject:v16 forKeyedSubscript:@"SamplingPercentage"];

  id v17 = [v6 objectForKeyedSubscript:@"AutomatedDeviceGroup"];
  int v18 = [v17 BOOLValue];

  if (v18)
  {
    uint64_t v19 = +[PLUtilities automatedDeviceGroup];
    [v6 setObject:v19 forKeyedSubscript:@"AutomatedDeviceGroupRawValue"];
  }
  uint64_t v20 = [(PLRapidController *)self configUUID];

  if (v20)
  {
    uint64_t v21 = [(PLRapidController *)self configUUID];
    [v6 setObject:v21 forKeyedSubscript:@"TaskingConfigUUID"];
  }
  uint64_t v22 = [(PLRapidController *)self taskingRequestReason];

  if (v22)
  {
    uint64_t v23 = [(PLRapidController *)self taskingRequestReason];
    [v6 setObject:v23 forKeyedSubscript:@"TaskingRequest"];
  }
  [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"IsValidPayload"];
  if (a3)
  {
    uint64_t v24 = [v5 objectForKeyedSubscript:@"AllowedUpload"];
    char v25 = [v24 BOOLValue];

    long long v26 = RapidLog();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_1BBD2F000, v26, OS_LOG_TYPE_DEFAULT, "Upload file size within acceptable threshold", (uint8_t *)&v34, 2u);
      }

      [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsValidPayload"];
      int v28 = objc_opt_new();
      [v6 setObject:v28 forKeyedSubscript:@"Files"];

      int64_t v29 = [v6 objectForKeyedSubscript:@"Files"];
      [(PLRapidController *)self addMDLogContext:v29];

      uint64_t v30 = [v6 objectForKeyedSubscript:@"Files"];
      [(PLRapidController *)self addMSSContext:v30];
    }
    else
    {
      if (v27)
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_1BBD2F000, v26, OS_LOG_TYPE_DEFAULT, "Upload file size exceeded", (uint8_t *)&v34, 2u);
      }

      [v6 setObject:@"PayloadTooLarge" forKeyedSubscript:@"FailureReason"];
    }
  }
  else
  {
    v31 = RapidLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_1BBD2F000, v31, OS_LOG_TYPE_DEFAULT, "Missing uploadFilePath", (uint8_t *)&v34, 2u);
    }
  }
  v32 = RapidLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 138412290;
    v35 = v6;
    _os_log_impl(&dword_1BBD2F000, v32, OS_LOG_TYPE_DEFAULT, "Context Dictionary: %@", (uint8_t *)&v34, 0xCu);
  }

  return v6;
}

- (BOOL)isUploadSizeWithinLimit:(id)a3
{
  int64_t v3 = +[PLFileStats fileSizeAtPath:a3];
  return v3 <= +[PLDefaults longForKey:@"RapidTaskedUploadSizeLimit" ifNotSet:2048000];
}

- (void)addMDLogContext:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = [(PLRapidController *)self mdLogCompressedFilePath];
  int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    uint64_t v13 = @"paths";
    char v8 = (void *)MEMORY[0x1E4F1C978];
    int v9 = [(PLRapidController *)self mdLogCompressedFilePath];
    uint64_t v10 = [v9 lastPathComponent];
    id v11 = objc_msgSend(v8, "arrayWithObjects:", v10, 0);
    v14[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v4 setObject:v12 forKeyedSubscript:@"perfpowerlog"];
  }
}

- (void)addMSSContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:@"/tmp/rapid/rapid_archive/mss"];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v22 = 0;
    int v7 = [v6 contentsOfDirectoryAtPath:@"/tmp/rapid/rapid_archive/mss" error:&v22];
    id v8 = v22;

    if ([v7 count])
    {
      int v9 = [@"/tmp/rapid/rapid_archive/mss" lastPathComponent];
      uint64_t v10 = objc_opt_new();
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v11 = v7;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            BOOL v16 = objc_msgSend(v9, "stringByAppendingPathComponent:", *(void *)(*((void *)&v18 + 1) + 8 * v15), (void)v18);
            [v10 addObject:v16];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v25 count:16];
        }
        while (v13);
      }

      uint64_t v23 = @"paths";
      uint64_t v24 = v10;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      [v3 setObject:v17 forKeyedSubscript:@"mss"];
    }
  }
}

- (id)uploadLog:(id)a3
{
  id v4 = a3;
  int v5 = RapidLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "Submit log to DP", buf, 2u);
  }

  BOOL v6 = +[PLDefaults BOOLForKey:@"RapidTagUploadAsTest" ifNotSet:0];
  int v7 = @"RAPIDArchive";
  if (v6) {
    int v7 = @"TestRAPIDArchive";
  }
  id v8 = v7;
  int v9 = [(PLRapidController *)self generateContextDictionary:v4];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"IsValidPayload"];
  char v11 = [v10 BOOLValue];

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = [(PLRapidController *)self generateDummyPayload];

    id v4 = (id)v12;
  }
  DRSubmitRapidLog();
  id v13 = 0;

  return v13;
}

- (id)generateDummyPayload
{
  BOOL v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v3 = [v2 fileExistsAtPath:@"/tmp/rapid/rapid_archive.tar.gz"];

  if (!v3) {
    goto LABEL_4;
  }
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = 0;
  char v5 = [v4 removeItemAtPath:@"/tmp/rapid/rapid_archive.tar.gz" error:&v10];
  id v6 = v10;

  if (v5)
  {

LABEL_4:
    id v6 = [@"0" dataUsingEncoding:4];
    int v7 = @"/tmp/rapid/rapid_archive.tar.gz";
    [v6 writeToFile:@"/tmp/rapid/rapid_archive.tar.gz" atomically:1];
    +[PLUtilities setMobileOwnerForFile:@"/tmp/rapid/rapid_archive.tar.gz"];
    goto LABEL_8;
  }
  id v8 = RapidLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[PLRapidController generateDummyPayload]();
  }

  int v7 = 0;
LABEL_8:

  return v7;
}

- (void)logToCADataUploadState:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = RapidLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v8 = @"com.apple.rapid.dataUploadStats";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "CA Event: %@ Payload: %@", buf, 0x16u);
  }

  id v6 = v3;
  id v5 = v3;
  AnalyticsSendEventLazy();
}

id __44__PLRapidController_logToCADataUploadState___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"state";
  v5[0] = v1;
  BOOL v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)logGenerationStats
{
  id v3 = objc_opt_new();
  id v4 = NSNumber;
  +[PLDefaults doubleForKey:@"RapidDeferralCount" ifNotSet:0.0];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v5 forKeyedSubscript:@"DeferralCount"];

  uint64_t v6 = [(PLRapidController *)self failureReason];
  int v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = @"None";
  }
  [v3 setObject:v8 forKeyedSubscript:@"FailureReason"];

  __int16 v9 = [(PLRapidController *)self mdLogCompressedFilePath];
  int64_t v10 = +[PLFileStats fileSizeAtPath:v9];

  uint64_t v11 = [(PLRapidController *)self mssCompressedFilePath];
  int64_t v12 = +[PLFileStats fileSizeAtPath:v11];

  int64_t v13 = +[PLFileStats fileSizeAtPath:@"/tmp/rapid/rapid_archive.tar.gz"];
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[PLRapidController isUploadSizeWithinLimit:](self, "isUploadSizeWithinLimit:", @"/tmp/rapid/rapid_archive.tar.gz"));
  [v3 setObject:v14 forKeyedSubscript:@"AllowedUpload"];

  uint64_t v15 = [NSNumber numberWithLongLong:v10];
  [v3 setObject:v15 forKeyedSubscript:@"PerfPowerLogSizeCompressed"];

  BOOL v16 = [NSNumber numberWithLongLong:v12];
  [v3 setObject:v16 forKeyedSubscript:@"MSSSizeCompressed"];

  id v17 = [NSNumber numberWithLongLong:v13];
  [v3 setObject:v17 forKeyedSubscript:@"LogSizeCompressed"];

  long long v18 = objc_msgSend(NSNumber, "numberWithLong:", +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", @"RapidTaskedUploadSizeLimit", 2048000));
  [v3 setObject:v18 forKeyedSubscript:@"UploadSizeLimit"];

  long long v19 = [(PLRapidController *)self logCreationEndDate];
  long long v20 = [(PLRapidController *)self logCreationResumeDate];
  [v19 timeIntervalSinceDate:v20];
  double v22 = v21;

  +[PLDefaults doubleForKey:@"RapidProcessingTime" ifNotSet:0.0];
  uint64_t v24 = [NSNumber numberWithDouble:v22 + v23];
  [v3 setObject:v24 forKeyedSubscript:@"ProcessingTime"];

  char v25 = NSNumber;
  uint64_t v26 = [(PLRapidController *)self logCreationEndDate];
  BOOL v27 = [(PLRapidController *)self logCreationStartDate];
  [v26 timeIntervalSinceDate:v27];
  int v28 = objc_msgSend(v25, "numberWithDouble:");

  [v3 setObject:v28 forKeyedSubscript:@"StartToEndTime"];
  return v3;
}

- (void)logToCALogGenerationStats:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = RapidLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v8 = @"com.apple.rapid.logGenerationStats";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "CA Event: %@ Payload: %@", buf, 0x16u);
  }

  uint64_t v6 = v3;
  id v5 = v3;
  AnalyticsSendEventLazy();
}

id __47__PLRapidController_logToCALogGenerationStats___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)setupDRTasking
{
  id v3 = RapidLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Setup DR Tasking Monitor", buf, 2u);
  }

  id v4 = objc_alloc(MEMORY[0x1E4F5F3D8]);
  id v5 = +[PLUtilities workQueueForKey:@"PLCoreStorage"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__PLRapidController_setupDRTasking__block_invoke;
  v8[3] = &unk_1E6254778;
  void v8[4] = self;
  uint64_t v6 = (void *)[v4 initWithTeamID:@"perfpowerservices.rapid.config" targetQueue:v5 configProcessingBlock:v8];
  [(PLRapidController *)self setTaskingMonitor:v6];

  int v7 = [(PLRapidController *)self taskingMonitor];
  [v7 startMonitoring];
}

uint64_t __35__PLRapidController_setupDRTasking__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v6 = RapidLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(PLRapidController *)v3 configFromMonitor:v6];
    }

    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (void)handleDRConfigUpdate:(id)a3 error:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7)
    {
      id v9 = PLLogSubmission();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[PLRapidController handleDRConfigUpdate:error:]();
      }
      goto LABEL_33;
    }
    id v10 = RapidLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 teamID];
      int64_t v12 = [v6 configUUID];
      int64_t v13 = [v6 receivedDate];
      int v34 = 138412802;
      v35 = v11;
      __int16 v36 = 2112;
      v37 = v12;
      __int16 v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "DRConfig for teamID <%@> received: %@, receive time: %@", (uint8_t *)&v34, 0x20u);
    }
    id v9 = [v6 payloadDictionaryRepresentation];
    uint64_t v14 = [v9 objectForKeyedSubscript:@"RAPIDTaskingRequest"];
    uint64_t v15 = RapidLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 138412290;
      v35 = v14;
      _os_log_impl(&dword_1BBD2F000, v15, OS_LOG_TYPE_DEFAULT, "DRConfig TaskingRequestReason: %@", (uint8_t *)&v34, 0xCu);
    }

    if (!v14)
    {
      [(PLRapidController *)self rejectTaskingConfig:v6];
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    unint64_t v16 = 0x1E6253000uLL;
    id v17 = [v6 configUUID];
    long long v18 = [v17 UUIDString];
    +[PLDefaults setObject:v18 forKey:@"RapidTaskingConfigUUID" saveToDisk:1];

    +[PLDefaults setObject:v14 forKey:@"RapidTaskingRequest" saveToDisk:1];
    long long v19 = [v9 objectForKeyedSubscript:@"RAPIDSamplingPercentage"];
    long long v20 = RapidLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 138412290;
      v35 = v19;
      _os_log_impl(&dword_1BBD2F000, v20, OS_LOG_TYPE_DEFAULT, "DRConfig SamplingPercentage: %@", (uint8_t *)&v34, 0xCu);
    }

    if (v19)
    {
      if (objc_opt_respondsToSelector())
      {
        double v21 = v19;
LABEL_22:
        +[PLDefaults setObject:v21 forKey:@"RapidTaskedSamplingPercentage" saveToDisk:1];
LABEL_23:
        int v28 = [v9 objectForKeyedSubscript:@"RAPIDUploadSizeLimit"];
        int64_t v29 = RapidLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 138412290;
          v35 = v28;
          _os_log_impl(&dword_1BBD2F000, v29, OS_LOG_TYPE_DEFAULT, "DRConfig UploadSizeLimit: %@", (uint8_t *)&v34, 0xCu);
        }

        if (v28 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v30 = *(void **)(v16 + 936);
          v31 = v28;
        }
        else
        {
          v32 = RapidLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            int v34 = 138412290;
            v35 = @"RapidTaskedUploadSizeLimit";
            _os_log_impl(&dword_1BBD2F000, v32, OS_LOG_TYPE_DEFAULT, "Deleting %@", (uint8_t *)&v34, 0xCu);
          }

          uint64_t v30 = *(void **)(v16 + 936);
          v31 = 0;
        }
        [v30 setObject:v31 forKey:@"RapidTaskedUploadSizeLimit" saveToDisk:1];
        [(PLRapidController *)self completeTaskingConfig:v6];

        goto LABEL_32;
      }
      if (objc_opt_respondsToSelector())
      {
        double v22 = +[PLUtilities hardwareModel];
        double v23 = [(__CFString *)v19 objectForKeyedSubscript:v22];
        if (v23)
        {
          uint64_t v24 = NSNumber;
          char v25 = [(__CFString *)v19 objectForKeyedSubscript:v22];
          [v25 doubleValue];
          uint64_t v26 = objc_msgSend(v24, "numberWithDouble:");

          unint64_t v16 = 0x1E6253000;
        }
        else
        {
          uint64_t v26 = &unk_1F1580D08;
        }

        v33 = RapidLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 138412546;
          v35 = v22;
          __int16 v36 = 2112;
          v37 = v26;
          _os_log_impl(&dword_1BBD2F000, v33, OS_LOG_TYPE_DEFAULT, "Selecting sampling percentage for HW model '%@': %@", (uint8_t *)&v34, 0x16u);
        }

        [*(id *)(v16 + 936) setObject:v26 forKey:@"RapidTaskedSamplingPercentage" saveToDisk:1];
        goto LABEL_23;
      }
    }
    BOOL v27 = RapidLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 138412290;
      v35 = @"RapidTaskedSamplingPercentage";
      _os_log_impl(&dword_1BBD2F000, v27, OS_LOG_TYPE_DEFAULT, "Deleting %@", (uint8_t *)&v34, 0xCu);
    }

    double v21 = 0;
    goto LABEL_22;
  }
LABEL_34:
}

- (void)completeTaskingConfig:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = RapidLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 configUUID];
    *(_DWORD *)long long buf = 138412290;
    int64_t v13 = v6;
    _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to mark DRConfig %@ as completed", buf, 0xCu);
  }
  id v7 = [(PLRapidController *)self taskingMonitor];
  id v8 = [v4 configUUID];
  id v11 = 0;
  [v7 markCompletedConfigUUID:v8 errorOut:&v11];
  id v9 = v11;

  if (v9)
  {
    id v10 = RapidLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PLRapidController completeTaskingConfig:]();
    }
  }
}

- (void)rejectTaskingConfig:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = RapidLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 configUUID];
    *(_DWORD *)long long buf = 138412290;
    int64_t v13 = v6;
    _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "Rejecting DRConfig %@", buf, 0xCu);
  }
  id v7 = [(PLRapidController *)self taskingMonitor];
  id v8 = [v4 configUUID];
  id v11 = 0;
  [v7 rejectConfigUUID:v8 errorOut:&v11];
  id v9 = v11;

  if (v9)
  {
    id v10 = RapidLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PLRapidController rejectTaskingConfig:]();
    }
  }
}

- (void)stopDRTasking
{
  id v3 = RapidLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Stop monitoring DRConfig", v5, 2u);
  }

  id v4 = [(PLRapidController *)self taskingMonitor];
  [v4 stopMonitoring];
}

- (int64_t)stage
{
  return self->_stage;
}

- (void)setStage:(int64_t)a3
{
  self->_stage = a3;
}

- (double)samplingPercentage
{
  return self->_samplingPercentage;
}

- (void)setSamplingPercentage:(double)a3
{
  self->_samplingPercentage = a3;
}

- (NSString)taskingRequestReason
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTaskingRequestReason:(id)a3
{
}

- (NSDate)logCreationStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogCreationStartDate:(id)a3
{
}

- (NSDate)logCreationEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLogCreationEndDate:(id)a3
{
}

- (NSDate)logCreationResumeDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLogCreationResumeDate:(id)a3
{
}

- (NSString)mdLogFilePath
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMdLogFilePath:(id)a3
{
}

- (NSString)mdLogCompressedFilePath
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMdLogCompressedFilePath:(id)a3
{
}

- (NSString)mssFilePath
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMssFilePath:(id)a3
{
}

- (NSString)mssCompressedFilePath
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMssCompressedFilePath:(id)a3
{
}

- (NSString)failureReason
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFailureReason:(id)a3
{
}

- (DRConfigMonitor)taskingMonitor
{
  return (DRConfigMonitor *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTaskingMonitor:(id)a3
{
}

- (NSString)configUUID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setConfigUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configUUID, 0);
  objc_storeStrong((id *)&self->_taskingMonitor, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
  objc_storeStrong((id *)&self->_mssCompressedFilePath, 0);
  objc_storeStrong((id *)&self->_mssFilePath, 0);
  objc_storeStrong((id *)&self->_mdLogCompressedFilePath, 0);
  objc_storeStrong((id *)&self->_mdLogFilePath, 0);
  objc_storeStrong((id *)&self->_logCreationResumeDate, 0);
  objc_storeStrong((id *)&self->_logCreationEndDate, 0);
  objc_storeStrong((id *)&self->_logCreationStartDate, 0);
  objc_storeStrong((id *)&self->_taskingRequestReason, 0);
}

- (void)handleXPCActivityCallback:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "Log submit to DP failed with error: %@", v2, v3, v4, v5, v6);
}

void __46__PLRapidController_roundDataInDB_withConfig___block_invoke_3_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_2();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1BBD2F000, v1, OS_LOG_TYPE_ERROR, "Malformed rule %@ for col %@!", v2, 0x16u);
}

void __28__PLRapidController_cleanup__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)prepareMSSLog
{
  os_log_t v1 = [a1 mssFilePath];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1BBD2F000, v2, v3, "Failed to compress MSS report at path: %@", v4, v5, v6, v7, v8);
}

- (void)generateDummyPayload
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "Failed to removed file: %@", v2, v3, v4, v5, v6);
}

- (void)configFromMonitor:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 teamID];
  OUTLINED_FUNCTION_3_2();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BBD2F000, a3, OS_LOG_TYPE_ERROR, "Error getting current config from DRConfigMonitor <%@> : %@", v6, 0x16u);
}

- (void)handleDRConfigUpdate:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "DRConfig error: %@", v2, v3, v4, v5, v6);
}

- (void)completeTaskingConfig:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "Error trying to mark DRConfig as completed: %@", v2, v3, v4, v5, v6);
}

- (void)rejectTaskingConfig:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "Error trying to reject DRConfig: %@", v2, v3, v4, v5, v6);
}

@end