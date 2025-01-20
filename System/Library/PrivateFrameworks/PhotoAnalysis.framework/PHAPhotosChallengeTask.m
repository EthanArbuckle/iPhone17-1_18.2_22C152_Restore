@interface PHAPhotosChallengeTask
+ (BOOL)postNewQuestionsNotificationIfNeededWithGraphManager:(id)a3 notificationDate:(id)a4;
+ (BOOL)postSubmissionNotificationIfNeededWithGraphManager:(id)a3 notificationDate:(id)a4;
+ (id)currentQuestionsKVSDataFromGraphManager:(id)a3;
+ (void)removeCurrentKVSDataFromGraphManager:(id)a3;
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSString)name;
- (PHAPhotosChallengeTask)init;
- (double)period;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (int64_t)limit;
- (int64_t)questionOptions;
- (void)setLimit:(int64_t)a3;
- (void)setQuestionOptions:(int64_t)a3;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAPhotosChallengeTask

- (void)setQuestionOptions:(int64_t)a3
{
  self->_questionOptions = a3;
}

- (int64_t)questionOptions
{
  return self->_questionOptions;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAPhotosChallengeTask timeoutFatal:]", "PHAPhotosChallengeTask.m", 170, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAPhotosChallengeTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  if (PFOSVariantHasInternalDiagnostics())
  {
    v10 = objc_opt_class();
    v11 = [MEMORY[0x1E4F8A9D8] _notificationDeliveryDate];
    [v10 postSubmissionNotificationIfNeededWithGraphManager:v8 notificationDate:v11];
  }
  v12 = [[PHAQuestionController alloc] initWithGraphManager:v8];
  int64_t limit = self->_limit;
  if (limit == -1)
  {
    *(void *)buf = 0;
    *(void *)&long long v39 = buf;
    *((void *)&v39 + 1) = 0x2020000000;
    uint64_t v40 = 0;
    int64_t questionOptions = self->_questionOptions;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __69__PHAPhotosChallengeTask_runWithGraphManager_progressReporter_error___block_invoke;
    v26[3] = &unk_1E6917F28;
    v28 = buf;
    v29 = &v30;
    id v27 = v9;
    BOOL v17 = [(PHAQuestionController *)v12 generateQuestionsWithOptions:questionOptions progress:v26];
    int v18 = *((unsigned __int8 *)v31 + 24);
    if (*((unsigned char *)v31 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v34 = 67109378;
        int v35 = 144;
        __int16 v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/PHAPhotosChallengeTask.m";
        _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v34, 0x12u);
      }
      if (a5 && !*a5)
      {
        *a5 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
      }
    }
    else
    {
      v19 = [v8 workingContext];
      v20 = v19;
      if (v17)
      {
        v21 = [v19 loggingConnection];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v34 = 0;
          _os_log_impl(&dword_1D21F2000, v21, OS_LOG_TYPE_INFO, "[PHAPhotosChallengeTask] Automatic question generation completed successfully.", v34, 2u);
        }
      }
      else
      {
        v21 = [v19 loggingConnection];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v34 = 0;
          _os_log_error_impl(&dword_1D21F2000, v21, OS_LOG_TYPE_ERROR, "[PHAPhotosChallengeTask] Automatic question generation did not complete successfully.", v34, 2u);
        }
      }
    }
    _Block_object_dispose(buf, 8);
    if (v18) {
      goto LABEL_25;
    }
  }
  else
  {
    int64_t v14 = self->_questionOptions;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__PHAPhotosChallengeTask_runWithGraphManager_progressReporter_error___block_invoke_219;
    v23[3] = &unk_1E6918E10;
    v25 = &v30;
    id v24 = v9;
    BOOL v15 = [(PHAQuestionController *)v12 generateQuestionsWithOptions:v14 limit:limit handleQuestionVersionBump:1 updateInvalidQuestions:1 progress:v23];
    if (*((unsigned char *)v31 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 156;
        LOWORD(v39) = 2080;
        *(void *)((char *)&v39 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "oAnalysis/Framework/Storytelling/Tasks/PHAPhotosChallengeTask.m";
        _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a5 && !*a5)
      {
        *a5 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
      }

LABEL_25:
      LOBYTE(v17) = 0;
      goto LABEL_26;
    }
    LOBYTE(v17) = v15;
  }
LABEL_26:

  _Block_object_dispose(&v30, 8);
  return v17;
}

uint64_t __69__PHAPhotosChallengeTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 * 0.05 + 0.9;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

uint64_t __69__PHAPhotosChallengeTask_runWithGraphManager_progressReporter_error___block_invoke_219(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v4 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F8D770] photosChallengeIsEnabled]
    && [v3 isReady])
  {
    uint64_t v4 = [v3 workingContext];
    uint64_t v5 = [v4 photoLibrary];
    [v5 ratioOfAssetsWithFacesProcessed];
    double v7 = v6;
    [v5 ratioOfAssetsWithScenesProcessed];
    BOOL v9 = v8 >= 0.75 && v7 >= 0.75;
    if (!v9)
    {
      v10 = [v4 loggingConnection];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_INFO, "[PHAPhotosChallengeTask] shouldRunWithGraphManager returning NO, library does not have enough faces and/or scenes processed.", v12, 2u);
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (int)priority
{
  return -2;
}

- (id)taskClassDependencies
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (id)incrementalKey
{
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (double)period
{
  return 86400.0;
}

- (NSString)name
{
  return (NSString *)@"PHAPhotosChallengeTask";
}

- (PHAPhotosChallengeTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHAPhotosChallengeTask;
  uint64_t result = [(PHAPhotosChallengeTask *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_int64_t limit = xmmword_1D24333B0;
  }
  return result;
}

+ (BOOL)postNewQuestionsNotificationIfNeededWithGraphManager:(id)a3 notificationDate:(id)a4
{
  *(void *)&v24[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 workingContext];
  double v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v9 = [v8 objectForKey:@"PhotosChallengeLastPostedNewQuestionsNotificationDate"];

  if (!v9
    || ([v9 dateByAddingTimeInterval:259200.0],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 compare:v6],
        v10,
        v11 == -1))
  {
    v12 = [v5 photoLibrary];
    int64_t v14 = [v12 librarySpecificFetchOptions];
    [v14 setShouldPrefetchCount:1];
    BOOL v15 = [MEMORY[0x1E4F39250] fetchUnansweredQuestionsWithOptions:v14 validQuestionsOnly:1];
    unint64_t v16 = [v15 count];

    BOOL v13 = v16 > 9;
    if (v16 > 9)
    {
      BOOL v17 = [v12 assetsdClient];
      v20 = [v17 notificationClient];

      [v20 asyncNotifyPhotosChallengeNewQuestionsWithNotificationDeliveryDate:v6];
      int v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v18 setValue:v6 forKey:@"PhotosChallengeLastPostedNewQuestionsNotificationDate"];

      v19 = [v7 loggingConnection];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        *(void *)id v24 = v6;
        _os_log_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_DEFAULT, "[PHAPhotosChallengeTask] Post notification for new questions at %@", (uint8_t *)&v23, 0xCu);
      }
    }
    else
    {
      v20 = [v7 loggingConnection];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v23 = 67109376;
        v24[0] = v16;
        LOWORD(v24[1]) = 1024;
        *(_DWORD *)((char *)&v24[1] + 2) = 10;
        _os_log_impl(&dword_1D21F2000, v20, OS_LOG_TYPE_INFO, "[PHAPhotosChallengeTask] Not posting a new questions notification, user does not have enough unanswered questions: %d < %d", (uint8_t *)&v23, 0xEu);
      }
    }
  }
  else
  {
    v12 = [v7 loggingConnection];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      *(void *)id v24 = v9;
      _os_log_impl(&dword_1D21F2000, v12, OS_LOG_TYPE_INFO, "[PHAPhotosChallengeTask] Already recently posted a new questions notification (on date: %@).", (uint8_t *)&v23, 0xCu);
    }
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)postSubmissionNotificationIfNeededWithGraphManager:(id)a3 notificationDate:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 workingContext];
  double v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v9 = [v8 dictionaryForKey:@"PhotosChallengeSubmissionLastPostedNotificationMetadata"];

  v10 = [v9 objectForKeyedSubscript:@"date"];
  uint64_t v11 = v10;
  if (!v10
    || ([v10 dateByAddingTimeInterval:1814400.0],
        v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 compare:v6],
        v12,
        v13 == -1))
  {
    int64_t v14 = [v5 photoLibrary];
    unint64_t v16 = [v14 librarySpecificFetchOptions];
    [v16 setShouldPrefetchCount:1];
    BOOL v17 = [MEMORY[0x1E4F39250] fetchAnsweredQuestionsWithOptions:v16 validQuestionsOnly:1];
    unint64_t v18 = [v17 count];

    if (v18 <= 0x31)
    {
      v19 = [v7 loggingConnection];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v20 = "[PHAPhotosChallengeTask] Not posting a submission notification, user hasn't answered enough questions.";
LABEL_23:
        _os_log_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_INFO, v20, buf, 2u);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    if ((int)*MEMORY[0x1E4F74590] <= 84) {
      uint64_t v21 = 84;
    }
    else {
      uint64_t v21 = *MEMORY[0x1E4F74590];
    }
    v22 = [v9 objectForKeyedSubscript:@"sceneAnalysisVersion"];
    uint64_t v23 = [v22 integerValue];

    if (v23 >= v21
      || ([v14 ratioOfAssetsAtOrAboveSceneAnalysisVersion:(__int16)v21], v24 >= 0.75))
    {
      BOOL v39 = v23 < v21;
      uint64_t v37 = v21;
      v25 = [v9 objectForKeyedSubscript:@"faceAnalysisVersion"];
      uint64_t v26 = [v25 integerValue];
      uint64_t v27 = (int)*MEMORY[0x1E4F74588];

      if (v26 < v27)
      {
        [v14 ratioOfAssetsAtOrAboveFaceAnalysisVersion:(__int16)v27];
        if (v28 < 0.75) {
          goto LABEL_16;
        }
        BOOL v39 = 1;
      }
      id v41 = v6;
      v29 = [v9 objectForKeyedSubscript:@"graphVersion"];
      unint64_t v30 = [v29 integerValue];
      unint64_t v31 = [v5 currentGraphVersion];

      if (v30 < v31 || v39)
      {
        char v33 = [v14 assetsdClient];
        v19 = [v33 notificationClient];

        -[NSObject asyncNotifyPhotosChallengeSubmissionWithNotificationDeliveryDate:](v19, "asyncNotifyPhotosChallengeSubmissionWithNotificationDeliveryDate:");
        v34 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        v43[0] = v41;
        v42[0] = 0x1F2905000;
        v42[1] = @"sceneAnalysisVersion";
        uint64_t v40 = [NSNumber numberWithInt:v37];
        v43[1] = v40;
        v42[2] = @"faceAnalysisVersion";
        v38 = [NSNumber numberWithInt:v27];
        v43[2] = v38;
        v42[3] = @"graphVersion";
        int v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "currentGraphVersion"));
        v43[3] = v35;
        __int16 v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:4];
        [v34 setObject:v36 forKey:@"PhotosChallengeSubmissionLastPostedNotificationMetadata"];

        id v6 = v41;
        BOOL v15 = 1;
        goto LABEL_25;
      }
      v19 = [v7 loggingConnection];
      id v6 = v41;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v20 = "[PHAPhotosChallengeTask] Not posting a submission notification, relevant data versions haven't changed sin"
              "ce last notification.";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
LABEL_16:
    v19 = [v7 loggingConnection];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v20 = "[PHAPhotosChallengeTask] Not posting a submission notification, not enough of library has been processed wit"
            "h newest data versions yet.";
      goto LABEL_23;
    }
LABEL_24:
    BOOL v15 = 0;
LABEL_25:

    goto LABEL_26;
  }
  int64_t v14 = [v7 loggingConnection];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v11;
    _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_INFO, "[PHAPhotosChallengeTask] Already recently posted a submission notification (on date: %@).", buf, 0xCu);
  }
  BOOL v15 = 0;
LABEL_26:

  return v15;
}

+ (void)removeCurrentKVSDataFromGraphManager:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[PHAQuestionController alloc] initWithGraphManager:v3];

  [(PHAQuestionController *)v4 removeCurrentKVSData];
}

+ (id)currentQuestionsKVSDataFromGraphManager:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[PHAQuestionController alloc] initWithGraphManager:v3];

  id v5 = [(PHAQuestionController *)v4 currentQuestionsKVSData];
  id v6 = v5;
  if (!v5) {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v5;

  return v7;
}

@end