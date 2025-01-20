@interface PPSSafeguardController
+ (id)sharedInstance;
- (BOOL)debug_forceEligibility;
- (BOOL)debug_installDate;
- (BOOL)debug_treatAsTestDevice;
- (BOOL)excludeTestDevices;
- (BOOL)handleTask:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isTestDeviceForSafeguard;
- (BOOL)performSubmission;
- (BOOL)upload:(BOOL *)a3;
- (DRConfigMonitor)drConfigMonitor;
- (PLNSNotificationOperatorComposition)dayChangedNotification;
- (PPSSafeguardController)init;
- (double)minimumLiveOnTime;
- (id)currentDate;
- (id)eligibilityRange;
- (id)installDate;
- (id)lastSubmissionDate;
- (id)startDate;
- (id)stopDate;
- (id)todayRange;
- (id)uploadRange;
- (id)workQueue;
- (int)dataDuration;
- (int)eligibilityDuration;
- (int)startHour;
- (int)stopHour;
- (unint64_t)isEligible;
- (void)configureWithDefaultValues;
- (void)configureWithDictionary:(id)a3;
- (void)isEligible;
- (void)registerDataCollectionActivity;
- (void)reportEventToCA:(unint64_t)a3 didUpload:(BOOL)a4;
- (void)setDayChangedNotification:(id)a3;
- (void)setDrConfigMonitor:(id)a3;
- (void)setupDRTasking;
- (void)unregisterDataCollectionActivity;
@end

@implementation PPSSafeguardController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_16);
  }
  v2 = (void *)sharedInstance_result;
  return v2;
}

uint64_t __40__PPSSafeguardController_sharedInstance__block_invoke()
{
  sharedInstance_result = objc_alloc_init(PPSSafeguardController);
  return MEMORY[0x1F41817F8]();
}

- (void)registerDataCollectionActivity
{
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 2u);
}

uint64_t __56__PPSSafeguardController_registerDataCollectionActivity__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerDataCollectionActivity];
}

void __56__PPSSafeguardController_registerDataCollectionActivity__block_invoke_2(uint64_t a1, void *a2)
{
  os_log_type_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleTask:v3];
}

- (PPSSafeguardController)init
{
  if (+[PLUtilities isPowerlogHelperd]
    || !+[PLPlatform internalBuild])
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PPSSafeguardController;
    id v3 = [(PPSSafeguardController *)&v7 init];
    v4 = v3;
    if (v3) {
      [(PPSSafeguardController *)v3 setupDRTasking];
    }
    self = v4;
    v5 = self;
  }

  return v5;
}

- (BOOL)upload:(BOOL *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v4 = PLLogSubmission();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "Performing safeguard submission...", buf, 2u);
  }

  v5 = [[PLSubmissionConfig alloc] initWithReasonType:2 DRConfig:0];
  int v6 = [(PPSSafeguardController *)self dataDuration];
  if (v6 != 86400)
  {
    int v7 = v6;
    v8 = [(PLSubmissionConfig *)v5 endDate];
    v9 = [v8 dateByAddingTimeInterval:(double)-v7];
    [(PLSubmissionConfig *)v5 setStartDate:v9];

    v10 = PLLogSubmission();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PPSSafeguardController upload:]();
    }
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = [(PLSubmissionConfig *)v5 splitBySubmissionType];
  uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (!v11)
  {
    BOOL v36 = 1;
    goto LABEL_39;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v45;
  v39 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v45 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      v16 = [[PLSubmissionFilePLL alloc] initWithConfig:v15];
      v17 = v16;
      if (v16)
      {
        [(PLSubmissionFilePLL *)v16 submit];
        v18 = PLLogSubmission();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBD2F000, v18, OS_LOG_TYPE_DEFAULT, "Finished preparing PLL", buf, 2u);
        }

        if (*a3)
        {
          p_super = PLLogSubmission();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBD2F000, p_super, OS_LOG_TYPE_INFO, "Task expired after Powerlog generation", buf, 2u);
          }
          goto LABEL_38;
        }
      }
      v19 = [[PLSubmissionFileMSS alloc] initWithConfig:v15];
      p_super = &v19->super.super;
      if (v19)
      {
        [(PLSubmissionFileMSS *)v19 submit];
        v21 = PLLogSubmission();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBD2F000, v21, OS_LOG_TYPE_DEFAULT, "Finished preparing MSS", buf, 2u);
        }

        if (*a3)
        {
          v37 = PLLogSubmission();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBD2F000, v37, OS_LOG_TYPE_INFO, "Task expired after Microstackshots generation", buf, 2u);
          }

LABEL_38:
          v5 = v39;

          BOOL v36 = 0;
          goto LABEL_39;
        }
      }
      v22 = [[PLSubmissionFileSP alloc] initWithConfig:v15];
      v23 = v22;
      if (v22) {
        [(PLSubmissionFile *)v22 submit];
      }
      uint64_t v24 = objc_msgSend(v15, "filePath", v39);
      if (v24)
      {
        v25 = (void *)v24;
        uint64_t v26 = [v15 ckTagConfig];
        if (v26)
        {
          v27 = (void *)v26;
          v28 = [v15 tagUUID];

          if (v28)
          {
            v29 = objc_alloc_init(PPSSubmissionRecord);
            v30 = [v15 contextDictionary];
            [(PPSSubmissionRecord *)v29 setContextDictionary:v30];

            [(PPSSubmissionRecord *)v29 setIsExpedited:1];
            v31 = (void *)MEMORY[0x1E4F1CB10];
            v32 = [v15 filePath];
            v33 = [v31 fileURLWithPath:v32];
            [(PPSSubmissionRecord *)v29 setFilePath:v33];

            [(PPSSubmissionRecord *)v29 setFileType:@"gz"];
            v34 = [v15 submissionCategory];
            [(PPSSubmissionRecord *)v29 setIssueCategory:v34];

            v35 = [v15 getSubmitReasonTypeToReasonLog];
            [(PPSSubmissionRecord *)v29 setIssueDescription:v35];

            [(PPSSubmissionRecord *)v29 setRecordType:@"attachment"];
            [(PPSSubmissionRecord *)v29 setTargetContainer:@"com.apple.perfpowerservices.tasking"];
            +[PPSSubmissionUtilities submit:v29];
            goto LABEL_29;
          }
        }
        else
        {
        }
      }
      PLLogSubmission();
      v29 = (PPSSubmissionRecord *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v29->super, OS_LOG_TYPE_ERROR)) {
        [(PPSSafeguardController *)&v42 upload:&v29->super];
      }
LABEL_29:
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v12) {
      continue;
    }
    break;
  }
  BOOL v36 = 1;
  v5 = v39;
LABEL_39:

  return v36;
}

- (unint64_t)isEligible
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(PPSSafeguardController *)self isEnabled])
  {
    if ([(PPSSafeguardController *)self debug_forceEligibility])
    {
      id v3 = PLLogSubmission();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(v32) = 0;
        _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_INFO, "Forcing eligibility...", (uint8_t *)&v32, 2u);
      }
      unint64_t v4 = 0;
    }
    else if ([(PPSSafeguardController *)self excludeTestDevices] {
           && [(PPSSafeguardController *)self isTestDeviceForSafeguard])
    }
    {
      id v3 = PLLogSubmission();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(v32) = 0;
        _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_INFO, "Excluding test device", (uint8_t *)&v32, 2u);
      }
      unint64_t v4 = 5;
    }
    else
    {
      id v3 = [(PPSSafeguardController *)self installDate];
      v5 = PLLogSubmission();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v32 = 138412290;
        double v33 = *(double *)&v3;
        _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_INFO, "Date/time of last OS install: %@", (uint8_t *)&v32, 0xCu);
      }

      int v6 = [(PPSSafeguardController *)self todayRange];
      int v7 = [(PPSSafeguardController *)self lastSubmissionDate];
      int v8 = [v6 containsDate:v7];

      v9 = PLLogSubmission();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v8)
      {
        if (v10)
        {
          uint64_t v11 = [(PPSSafeguardController *)self lastSubmissionDate];
          int v32 = 138412290;
          double v33 = *(double *)&v11;
          _os_log_impl(&dword_1BBD2F000, v9, OS_LOG_TYPE_INFO, "Safeguard submission already performed on '%@'", (uint8_t *)&v32, 0xCu);
        }
        unint64_t v4 = 2;
      }
      else
      {
        if (v10)
        {
          LOWORD(v32) = 0;
          _os_log_impl(&dword_1BBD2F000, v9, OS_LOG_TYPE_INFO, "Device has not yet performed upload", (uint8_t *)&v32, 2u);
        }

        v9 = [(PPSSafeguardController *)self eligibilityRange];
        uint64_t v12 = [(PPSSafeguardController *)self currentDate];
        char v13 = [v9 containsDate:v12];

        if (v13)
        {
          v14 = [(PPSSafeguardController *)self uploadRange];
          if (v14)
          {
            v15 = [(PPSSafeguardController *)self currentDate];
            char v16 = [v14 containsDate:v15];
            v17 = PLLogSubmission();
            BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
            if (v16)
            {
              if (v18)
              {
                v19 = [v9 startDate];
                v20 = [v9 endDate];
                int v32 = 138412546;
                double v33 = *(double *)&v19;
                __int16 v34 = 2112;
                double v35 = *(double *)&v20;
                _os_log_impl(&dword_1BBD2F000, v17, OS_LOG_TYPE_INFO, "Device is within eligibility range: ['%@', '%@']", (uint8_t *)&v32, 0x16u);
              }
              v21 = [MEMORY[0x1E4F1C9C8] date];
              [v21 timeIntervalSinceDate:v3];
              double v23 = v22;

              [(PPSSafeguardController *)self minimumLiveOnTime];
              double v25 = v24;
              v17 = PLLogSubmission();
              BOOL v26 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
              if (v25 <= 0.0 || v23 >= v25)
              {
                if (v26)
                {
                  int v32 = 134218240;
                  double v33 = v25;
                  __int16 v34 = 2048;
                  double v35 = v23;
                  _os_log_impl(&dword_1BBD2F000, v17, OS_LOG_TYPE_INFO, "Device meets minimum LiveOn time of '%f': %f", (uint8_t *)&v32, 0x16u);
                }
                unint64_t v4 = 0;
              }
              else
              {
                if (v26)
                {
                  int v32 = 134218240;
                  double v33 = v23;
                  __int16 v34 = 2048;
                  double v35 = v25;
                  _os_log_impl(&dword_1BBD2F000, v17, OS_LOG_TYPE_INFO, "Current LiveOn time '%f' does not yet meet minimum time required '%f'", (uint8_t *)&v32, 0x16u);
                }
                unint64_t v4 = 4;
              }
            }
            else
            {
              if (v18)
              {
                v29 = [v14 startDate];
                v30 = [v14 endDate];
                int v32 = 138412546;
                double v33 = *(double *)&v29;
                __int16 v34 = 2112;
                double v35 = *(double *)&v30;
                _os_log_impl(&dword_1BBD2F000, v17, OS_LOG_TYPE_INFO, "Not currently within upload range: ['%@', '%@']", (uint8_t *)&v32, 0x16u);
              }
              unint64_t v4 = 6;
            }
          }
          else
          {
            v15 = PLLogSubmission();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[PPSSafeguardController isEligible](v15);
            }
            unint64_t v4 = 6;
          }
        }
        else
        {
          v14 = PLLogSubmission();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v27 = [v9 startDate];
            v28 = [v9 endDate];
            int v32 = 138412546;
            double v33 = *(double *)&v27;
            __int16 v34 = 2112;
            double v35 = *(double *)&v28;
            _os_log_impl(&dword_1BBD2F000, v14, OS_LOG_TYPE_INFO, "No install within eligibility range: ['%@', '%@']", (uint8_t *)&v32, 0x16u);
          }
          unint64_t v4 = 3;
        }
      }
    }
  }
  else
  {
    id v3 = PLLogSubmission();
    unint64_t v4 = 1;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v32) = 0;
      unint64_t v4 = 1;
      _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_INFO, "Disabled for eligiblity", (uint8_t *)&v32, 2u);
    }
  }

  return v4;
}

- (BOOL)isTestDeviceForSafeguard
{
  if ([(PPSSafeguardController *)self debug_treatAsTestDevice]) {
    return 1;
  }
  id v3 = +[PLUtilities automatedDeviceGroup];
  uint64_t v4 = [v3 length];

  +[PLFileStats totalLogDuration];
  return v5 < 86400.0 && v4 != 0;
}

- (BOOL)performSubmission
{
  return [(PPSSafeguardController *)self handleTask:0];
}

- (BOOL)handleTask:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3020000000;
  char v23 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __37__PPSSafeguardController_handleTask___block_invoke;
  v19[3] = &unk_1E6254750;
  v19[4] = &v20;
  [v4 setExpirationHandler:v19];
  unint64_t v5 = [(PPSSafeguardController *)self isEligible];
  unint64_t v6 = v5;
  if (v5 > 6) {
    goto LABEL_18;
  }
  if (((1 << v5) & 0x6E) != 0)
  {
    [v4 setTaskCompleted];
LABEL_4:
    BOOL v7 = 0;
    goto LABEL_5;
  }
  if (v5)
  {
LABEL_18:
    v17 = PLLogSubmission();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v25 = v6;
      _os_log_impl(&dword_1BBD2F000, v17, OS_LOG_TYPE_INFO, "Postponing safeguard submission with status '%lud'", buf, 0xCu);
    }

    goto LABEL_4;
  }
  BOOL v7 = [(PPSSafeguardController *)self upload:v21 + 5];
LABEL_5:
  [(PPSSafeguardController *)self reportEventToCA:v6 didUpload:v7];
  if (v4)
  {
    if (v7)
    {
      int v8 = NSNumber;
      v9 = [(PPSSafeguardController *)self currentDate];
      [v9 timeIntervalSince1970];
      BOOL v10 = objc_msgSend(v8, "numberWithDouble:");
      +[PLDefaults setObject:v10 forKey:@"PPSSafeguardDefaultLastSubmissionTime"];

      [v4 setTaskCompleted];
    }
    else
    {
      uint64_t v11 = PLLogSubmission();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v11, OS_LOG_TYPE_INFO, "Deferring safeguard submission...", buf, 2u);
      }

      id v18 = 0;
      char v12 = [v4 setTaskExpiredWithRetryAfter:&v18 error:0.0];
      char v13 = (__CFString *)v18;
      v14 = v13;
      if ((v12 & 1) == 0)
      {
        v15 = @"Unknown";
        if (v13) {
          v15 = v13;
        }
        NSLog(&cfstr_FailedToExpire.isa, v15);
        [v4 setTaskCompleted];
      }
    }
  }
  _Block_object_dispose(&v20, 8);

  return v7;
}

uint64_t __37__PPSSafeguardController_handleTask___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 40) = 1;
  return result;
}

- (void)reportEventToCA:(unint64_t)a3 didUpload:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [MEMORY[0x1E4F1CA60] dictionary];
  int v8 = [NSNumber numberWithBool:v4];
  [v7 setObject:v8 forKeyedSubscript:@"PPSSafeguardCAKeyDidUpload"];

  v9 = [NSNumber numberWithInt:a3 == 0];
  [v7 setObject:v9 forKeyedSubscript:@"PPSSafeguardCAKeyIsEligible"];

  BOOL v10 = objc_msgSend(NSNumber, "numberWithBool:", -[PPSSafeguardController isTestDeviceForSafeguard](self, "isTestDeviceForSafeguard"));
  [v7 setObject:v10 forKeyedSubscript:@"PPSSafeguardCAKeyIsTestDevice"];

  uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
  [v7 setObject:v11 forKeyedSubscript:@"PPSSafeguardCAKeyStatus"];

  char v12 = objc_msgSend(NSNumber, "numberWithInt:", -[PPSSafeguardController dataDuration](self, "dataDuration"));
  [v7 setObject:v12 forKeyedSubscript:@"PPSSafeguardParameterDataDuration"];

  char v13 = objc_msgSend(NSNumber, "numberWithInt:", -[PPSSafeguardController eligibilityDuration](self, "eligibilityDuration"));
  [v7 setObject:v13 forKeyedSubscript:@"PPSSafeguardParameterEligibilityDuration"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[PPSSafeguardController excludeTestDevices](self, "excludeTestDevices"));
  [v7 setObject:v14 forKeyedSubscript:@"PPSSafeguardParameterExcludeTestDevices"];

  v15 = objc_msgSend(NSNumber, "numberWithInt:", -[PPSSafeguardController startHour](self, "startHour"));
  [v7 setObject:v15 forKeyedSubscript:@"PPSSafeguardParameterStartHour"];

  char v16 = objc_msgSend(NSNumber, "numberWithInt:", -[PPSSafeguardController stopHour](self, "stopHour"));
  [v7 setObject:v16 forKeyedSubscript:@"PPSSafeguardParameterStopHour"];

  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[PPSSafeguardController isEnabled](self, "isEnabled"));
  [v7 setObject:v17 forKeyedSubscript:@"PPSSafeguardParameterIsEnabled"];

  id v18 = NSNumber;
  [(PPSSafeguardController *)self minimumLiveOnTime];
  v19 = objc_msgSend(v18, "numberWithDouble:");
  [v7 setObject:v19 forKeyedSubscript:@"PPSSafeguardParameterMinimumLiveOnTime"];

  uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", -[PPSSafeguardController debug_forceEligibility](self, "debug_forceEligibility"));
  [v7 setObject:v20 forKeyedSubscript:@"PPSSafeguardDebugParameterForceEligibility"];

  v21 = PLLogSubmission();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int v23 = 138412546;
    double v24 = @"com.apple.perfpowerservices.submission.safeguard";
    __int16 v25 = 2112;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1BBD2F000, v21, OS_LOG_TYPE_INFO, "Emitting '%@': %@", (uint8_t *)&v23, 0x16u);
  }

  uint64_t v22 = (void *)[v7 copy];
  AnalyticsSendEvent();
}

- (id)workQueue
{
  uint64_t v2 = objc_opt_class();
  return +[PLUtilities workQueueForClass:v2];
}

- (void)setupDRTasking
{
  id v3 = objc_alloc(MEMORY[0x1E4F5F3D8]);
  BOOL v4 = [(PPSSafeguardController *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__PPSSafeguardController_setupDRTasking__block_invoke;
  v7[3] = &unk_1E6254778;
  v7[4] = self;
  unint64_t v5 = (DRConfigMonitor *)[v3 initWithTeamID:@"perfpowerservices.safeguard.config" targetQueue:v4 configProcessingBlock:v7];
  drConfigMonitor = self->_drConfigMonitor;
  self->_drConfigMonitor = v5;
}

void __40__PPSSafeguardController_setupDRTasking__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    BOOL v7 = PLLogSubmission();
    int v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __40__PPSSafeguardController_setupDRTasking__block_invoke_cold_2((uint64_t)v6, v8);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [v5 teamID];
        BOOL v10 = [v5 configUUID];
        uint64_t v11 = [v5 receivedDate];
        *(_DWORD *)buf = 138412802;
        v19 = v9;
        __int16 v20 = 2112;
        v21 = v10;
        __int16 v22 = 2112;
        int v23 = v11;
        _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "DRConfig for teamID <%@> received: %@, receive time: %@", buf, 0x20u);
      }
      char v12 = *(void **)(a1 + 32);
      char v13 = [v5 payloadDictionaryRepresentation];
      [v12 configureWithDictionary:v13];

      v14 = [*(id *)(a1 + 32) drConfigMonitor];
      v15 = [v5 configUUID];
      id v17 = 0;
      [v14 markCompletedConfigUUID:v15 errorOut:&v17];
      int v8 = v17;

      if (v8)
      {
        char v16 = PLLogSubmission();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __40__PPSSafeguardController_setupDRTasking__block_invoke_cold_1((uint64_t)v8, v16);
        }
      }
    }
  }
}

- (void)configureWithDefaultValues
{
  +[PLDefaults setObject:0 forKey:@"PPSSafeguardParameterDataDuration"];
  +[PLDefaults setObject:0 forKey:@"PPSSafeguardParameterExcludeTestDevices"];
  +[PLDefaults setObject:0 forKey:@"PPSSafeguardParameterStartHour"];
  +[PLDefaults setObject:0 forKey:@"PPSSafeguardParameterStopHour"];
  +[PLDefaults setObject:0 forKey:@"PPSSafeguardParameterIsEnabled"];
  +[PLDefaults setObject:0 forKey:@"PPSSafeguardParameterMinimumLiveOnTime"];
  +[PLDefaults setObject:0 forKey:@"PPSSafeguardParameterEligibilityDuration"];
  +[PLDefaults setObject:0 forKey:@"PPSSafeguardDebugParameterForceEligibility"];
  +[PLDefaults setObject:0 forKey:@"PPSSafeguardDebugParameterInstallDate"];
  +[PLDefaults setObject:0 forKey:@"PPSSafeguardDebugParameterTreatAsTestDevice"];
  +[PLDefaults setObject:0 forKey:@"PPSSafeguardDefaultLastSubmissionTime"];
}

- (void)configureWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = PLLogSubmission();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PPSSafeguardController configureWithDictionary:]();
    }

    id v5 = [v3 objectForKeyedSubscript:@"PPSSafeguardParameterIsEnabled"];
    if (v5)
    {
      +[PLDefaults setObject:v5 forKey:@"PPSSafeguardParameterIsEnabled"];
      id v6 = PLLogSubmission();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412546;
        __int16 v20 = @"PPSSafeguardParameterIsEnabled";
        __int16 v21 = 2112;
        __int16 v22 = v5;
        _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", (uint8_t *)&v19, 0x16u);
      }
    }
    BOOL v7 = [v3 objectForKeyedSubscript:@"PPSSafeguardParameterDataDuration"];
    if (v7)
    {
      +[PLDefaults setObject:v7 forKey:@"PPSSafeguardParameterDataDuration"];
      int v8 = PLLogSubmission();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412546;
        __int16 v20 = @"PPSSafeguardParameterDataDuration";
        __int16 v21 = 2112;
        __int16 v22 = v7;
        _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", (uint8_t *)&v19, 0x16u);
      }
    }
    v9 = [v3 objectForKeyedSubscript:@"PPSSafeguardParameterMinimumLiveOnTime"];
    if (v9)
    {
      +[PLDefaults setObject:v9 forKey:@"PPSSafeguardParameterMinimumLiveOnTime"];
      BOOL v10 = PLLogSubmission();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412546;
        __int16 v20 = @"PPSSafeguardParameterMinimumLiveOnTime";
        __int16 v21 = 2112;
        __int16 v22 = v9;
        _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", (uint8_t *)&v19, 0x16u);
      }
    }
    uint64_t v11 = [v3 objectForKeyedSubscript:@"PPSSafeguardParameterStartHour"];
    if (v11)
    {
      +[PLDefaults setObject:v11 forKey:@"PPSSafeguardParameterStartHour"];
      char v12 = PLLogSubmission();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412546;
        __int16 v20 = @"PPSSafeguardParameterStartHour";
        __int16 v21 = 2112;
        __int16 v22 = v11;
        _os_log_impl(&dword_1BBD2F000, v12, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", (uint8_t *)&v19, 0x16u);
      }
    }
    char v13 = [v3 objectForKeyedSubscript:@"PPSSafeguardParameterStopHour"];
    if (v13)
    {
      +[PLDefaults setObject:v13 forKey:@"PPSSafeguardParameterStopHour"];
      v14 = PLLogSubmission();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412546;
        __int16 v20 = @"PPSSafeguardParameterStopHour";
        __int16 v21 = 2112;
        __int16 v22 = v13;
        _os_log_impl(&dword_1BBD2F000, v14, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", (uint8_t *)&v19, 0x16u);
      }
    }
    v15 = [v3 objectForKeyedSubscript:@"PPSSafeguardParameterEligibilityDuration"];
    if (v15)
    {
      +[PLDefaults setObject:v15 forKey:@"PPSSafeguardParameterEligibilityDuration"];
      char v16 = PLLogSubmission();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412546;
        __int16 v20 = @"PPSSafeguardParameterEligibilityDuration";
        __int16 v21 = 2112;
        __int16 v22 = v15;
        _os_log_impl(&dword_1BBD2F000, v16, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", (uint8_t *)&v19, 0x16u);
      }
    }
    id v17 = [v3 objectForKeyedSubscript:@"PPSSafeguardParameterExcludeTestDevices"];
    if (v17)
    {
      +[PLDefaults setObject:v17 forKey:@"PPSSafeguardParameterExcludeTestDevices"];
      id v18 = PLLogSubmission();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412546;
        __int16 v20 = @"PPSSafeguardParameterExcludeTestDevices";
        __int16 v21 = 2112;
        __int16 v22 = v17;
        _os_log_impl(&dword_1BBD2F000, v18, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", (uint8_t *)&v19, 0x16u);
      }
    }
  }
}

- (id)currentDate
{
  return (id)[MEMORY[0x1E4F1C9C8] now];
}

- (id)installDate
{
  BOOL v2 = [(PPSSafeguardController *)self debug_installDate];
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  if (v2) {
    BOOL v4 = @"PPSSafeguardDebugParameterInstallDate";
  }
  else {
    BOOL v4 = @"LastUpgradeSystemTimestamp";
  }
  +[PLDefaults doubleForKey:v4 ifNotSet:-1.0];
  id v5 = objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
  return v5;
}

- (id)lastSubmissionDate
{
  if (+[PLDefaults objectExistsForKey:@"PPSSafeguardDefaultLastSubmissionTime"])
  {
    BOOL v2 = (void *)MEMORY[0x1E4F1C9C8];
    +[PLDefaults doubleForKey:@"PPSSafeguardDefaultLastSubmissionTime"];
    id v3 = objc_msgSend(v2, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)startDate
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  BOOL v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v5 = [(PPSSafeguardController *)self startHour];
  id v6 = [(PPSSafeguardController *)self currentDate];
  BOOL v7 = [v4 dateBySettingHour:v5 minute:0 second:0 ofDate:v6 options:0];

  return v7;
}

- (id)stopDate
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  BOOL v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v5 = [(PPSSafeguardController *)self stopHour];
  id v6 = [(PPSSafeguardController *)self currentDate];
  BOOL v7 = [v4 dateBySettingHour:v5 minute:0 second:0 ofDate:v6 options:0];

  return v7;
}

- (id)eligibilityRange
{
  int v3 = [(PPSSafeguardController *)self eligibilityDuration];
  BOOL v4 = [(PPSSafeguardController *)self installDate];
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] nearestMidnightBeforeDate:v4];
  id v6 = [v5 dateByAddingTimeInterval:(double)v3];
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v6];

  return v7;
}

- (id)todayRange
{
  BOOL v2 = [(PPSSafeguardController *)self currentDate];
  int v3 = [MEMORY[0x1E4F1C9C8] nearestMidnightBeforeDate:v2];
  BOOL v4 = [MEMORY[0x1E4F1C9C8] nearestMidnightAfterDate:v2];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v3 endDate:v4];

  return v5;
}

- (id)uploadRange
{
  int v3 = [(PPSSafeguardController *)self startDate];
  uint64_t v4 = [(PPSSafeguardController *)self stopDate];
  uint64_t v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4) {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v3 endDate:v4];
  }

  return v6;
}

- (int)dataDuration
{
  +[PLDefaults doubleForKey:@"PPSSafeguardParameterDataDuration" ifNotSet:86400.0];
  return (int)v2;
}

- (int)eligibilityDuration
{
  +[PLDefaults doubleForKey:@"PPSSafeguardParameterEligibilityDuration" ifNotSet:172800.0];
  return (int)v2;
}

- (BOOL)excludeTestDevices
{
  return +[PLDefaults BOOLForKey:@"PPSSafeguardParameterExcludeTestDevices" ifNotSet:1];
}

- (BOOL)isEnabled
{
  BOOL v2 = +[PLPlatform internalBuild];
  return v2 & +[PLDefaults BOOLForKey:@"PPSSafeguardParameterIsEnabled" ifNotSet:1];
}

- (double)minimumLiveOnTime
{
  +[PLDefaults doubleForKey:@"PPSSafeguardParameterMinimumLiveOnTime" ifNotSet:3600.0];
  return result;
}

- (int)startHour
{
  +[PLDefaults doubleForKey:@"PPSSafeguardParameterStartHour" ifNotSet:12.0];
  return (int)v2;
}

- (int)stopHour
{
  +[PLDefaults doubleForKey:@"PPSSafeguardParameterStopHour" ifNotSet:14.0];
  return (int)v2;
}

- (BOOL)debug_forceEligibility
{
  BOOL v2 = +[PLDefaults debugEnabled];
  if (v2)
  {
    LOBYTE(v2) = +[PLDefaults BOOLForKey:@"PPSSafeguardDebugParameterForceEligibility" ifNotSet:0];
  }
  return v2;
}

- (BOOL)debug_installDate
{
  BOOL v2 = +[PLDefaults debugEnabled];
  if (v2)
  {
    LOBYTE(v2) = +[PLDefaults objectExistsForKey:@"PPSSafeguardDebugParameterInstallDate"];
  }
  return v2;
}

- (BOOL)debug_treatAsTestDevice
{
  BOOL v2 = +[PLDefaults debugEnabled];
  if (v2)
  {
    LOBYTE(v2) = +[PLDefaults BOOLForKey:@"PPSSafeguardDebugParameterTreatAsTestDevice"];
  }
  return v2;
}

- (void)unregisterDataCollectionActivity
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    if ([(PPSSafeguardController *)self isEnabled])
    {
      int v3 = [MEMORY[0x1E4F4F440] sharedScheduler];
      uint64_t v4 = [v3 taskRequestForIdentifier:@"com.apple.perfpowerservices.safeguard"];

      if (v4)
      {
        uint64_t v5 = PLLogSubmission();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          int v7 = 138412290;
          int v8 = @"com.apple.perfpowerservices.safeguard";
          _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_INFO, "Unregistering safeguard collection activity ('%@')...", (uint8_t *)&v7, 0xCu);
        }

        id v6 = [MEMORY[0x1E4F4F440] sharedScheduler];
        [v6 deregisterTaskWithIdentifier:@"com.apple.perfpowerservices.safeguard"];
      }
    }
  }
}

- (DRConfigMonitor)drConfigMonitor
{
  return (DRConfigMonitor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDrConfigMonitor:(id)a3
{
}

- (PLNSNotificationOperatorComposition)dayChangedNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDayChangedNotification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayChangedNotification, 0);
  objc_storeStrong((id *)&self->_drConfigMonitor, 0);
}

- (void)upload:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "Cannot submit record to DiagnosticPipeline due to missing info", buf, 2u);
}

- (void)upload:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 8u);
}

- (void)isEligible
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "Invalid upload range", v1, 2u);
}

void __40__PPSSafeguardController_setupDRTasking__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Error trying to mark DRConfig as completed: %@", (uint8_t *)&v2, 0xCu);
}

void __40__PPSSafeguardController_setupDRTasking__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "DRConfig error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)configureWithDictionary:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
}

@end