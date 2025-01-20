@interface PHASharedLibrarySuggestionGenerationTask
+ (BOOL)resetSuggestionsWithGraphManager:(id)a3 error:(id *)a4;
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)runWithGraphManager:(id)a3 withIncrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSString)name;
- (PHASharedLibrarySuggestionGenerationTask)initWithTaskType:(signed __int16)a3;
- (double)period;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)_sendNotificationWithPhotoLibrary:(id)a3 loggingConnection:(id)a4;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHASharedLibrarySuggestionGenerationTask

- (void)_sendNotificationWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileslideshow"];
  int HasInternalDiagnostics = PFOSVariantHasInternalDiagnostics();
  char v9 = HasInternalDiagnostics;
  if (HasInternalDiagnostics) {
    int v10 = [v7 BOOLForKey:@"ForceSharedLibrarySuggestionsNotification"];
  }
  else {
    int v10 = 0;
  }
  v11 = [MEMORY[0x1E4F1C9C8] date];
  id v12 = objc_alloc(MEMORY[0x1E4F29130]);
  v13 = (void *)[v12 initWithStoreIdentifier:*MEMORY[0x1E4F8D270] type:0];
  v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_DEFAULT, "[PHASharedLibrarySuggestionGenerationTask] notification defaults override is set", buf, 2u);
    }
    goto LABEL_49;
  }
  if (([v13 synchronize] & 1) == 0 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_ERROR, "[PHASharedLibrarySuggestionGenerationTask] Store synchronize failed", buf, 2u);
  }
  v15 = [v14 objectForKey:*MEMORY[0x1E4F8D260]];
  v16 = v15;
  v44 = v7;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v18 = v17;
  v19 = [v5 librarySpecificFetchOptions];
  v48[0] = *MEMORY[0x1E4F394A8];
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  [v19 setFetchPropertySets:v20];

  [v19 setShouldPrefetchCount:1];
  [v19 setWantsIncrementalChangeDetails:0];
  v43 = v18;
  v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K > %@", @"addedDate", v18];
  [v19 setInternalPredicate:v21];

  v22 = [MEMORY[0x1E4F38EB8] fetchAssetsInPreviewStateWithPhotosOrPhotosDeferredSuggestedByClientTypeWithOptions:v19];
  unint64_t v23 = [v22 count];
  if ((uint64_t)v23 > 9)
  {
    id v40 = v5;
    v41 = v22;
    v42 = [v14 objectForKey:*MEMORY[0x1E4F8D258]];
    if (!v42) {
      goto LABEL_61;
    }
    if (v9)
    {
      v25 = @"SLNotificationMinimumNumberOfDaysBetweenNotifications";
      if (v23 > 0x31) {
        v25 = @"SLHPNotificationMinimumNumberOfDaysBetweenNotifications";
      }
      v26 = v25;
      uint64_t v27 = [v44 integerForKey:v26];
      if (v27 < 1)
      {

        uint64_t v38 = 15;
        if (v23 > 0x31) {
          uint64_t v38 = 3;
        }
        if (!v27) {
          uint64_t v27 = v38;
        }
      }
      else
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v46 = v26;
          *(_WORD *)&v46[8] = 1024;
          v47[0] = v27;
          _os_log_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_INFO, "[PHASharedLibrarySuggestionGenerationTask] notification using override %@ = %d", buf, 0x12u);
        }
      }
    }
    else
    {
      uint64_t v27 = v23 <= 0x31 ? 15 : 3;
    }
    v28 = [MEMORY[0x1E4F76C68] components:16 fromDate:v42 toDate:v11 options:0];
    uint64_t v29 = [v28 day];

    if (v29 < v27)
    {
      int v24 = 1;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v46 = v23;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v29;
        LOWORD(v47[0]) = 1024;
        *(_DWORD *)((char *)v47 + 2) = v27;
        v30 = "[PHASharedLibrarySuggestionGenerationTask] skip notification for %d suggestions - %d days since last notif"
              "ied less than %d";
LABEL_44:
        _os_log_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_INFO, v30, buf, 0x14u);
      }
    }
    else
    {
LABEL_61:
      if (!v16) {
        goto LABEL_45;
      }
      if (v9)
      {
        v31 = @"SLHPNotificationMinimumNumberOfDaysSinceLastSeenSuggestions";
        if (v23 > 0x31) {
          v31 = @"SLNotificationMinimumNumberOfDaysSinceLastSeenSuggestions";
        }
        v32 = v31;
        uint64_t v33 = [v44 integerForKey:v32];
        if (v33 < 1)
        {

          uint64_t v39 = 15;
          if (v23 > 0x31) {
            uint64_t v39 = 3;
          }
          if (!v33) {
            uint64_t v33 = v39;
          }
        }
        else
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v46 = v32;
            *(_WORD *)&v46[8] = 1024;
            v47[0] = v33;
            _os_log_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_INFO, "[PHASharedLibrarySuggestionGenerationTask] notification using override %@ = %d", buf, 0x12u);
          }
        }
      }
      else
      {
        uint64_t v33 = v23 <= 0x31 ? 15 : 3;
      }
      v34 = [MEMORY[0x1E4F76C68] components:16 fromDate:v16 toDate:v11 options:0];
      uint64_t v35 = [v34 day];

      if (v35 >= v33)
      {
LABEL_45:
        int v24 = 0;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v46 = v23;
          _os_log_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_DEFAULT, "[PHASharedLibrarySuggestionGenerationTask] sending notification for %d suggestions", buf, 8u);
          int v24 = 0;
        }
        goto LABEL_47;
      }
      int v24 = 1;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v46 = v23;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v35;
        LOWORD(v47[0]) = 1024;
        *(_DWORD *)((char *)v47 + 2) = v33;
        v30 = "[PHASharedLibrarySuggestionGenerationTask] skip notification for %d suggestions - %d days since last seen less than %d";
        goto LABEL_44;
      }
    }
LABEL_47:

    id v5 = v40;
    v22 = v41;
    goto LABEL_48;
  }
  int v24 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v46 = v23;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = 10;
    _os_log_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_INFO, "[PHASharedLibrarySuggestionGenerationTask] skip notification - not enough suggestions: %d < %d", buf, 0xEu);
  }
LABEL_48:

  v7 = v44;
  if (!v24)
  {
LABEL_49:
    v36 = [v5 assetsdClient];
    v37 = [v36 notificationClient];

    [v37 asyncNotifySharedLibrarySuggestionsWithNotificationDeliveryDate:v11];
    [v14 setObject:v11 forKey:*MEMORY[0x1E4F8D258]];
  }
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHASharedLibrarySuggestionGenerationTask timeoutFatal:]", "PHASharedLibrarySuggestionGenerationTask.m", 216, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHASharedLibrarySuggestionGenerationTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 withIncrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v24 = a4;
  id v11 = a5;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  id v12 = [v10 workingContext];
  v13 = (void *)MEMORY[0x1E4F8D900];
  v14 = [v12 photoLibrary];
  v15 = [v13 libraryScopeToUseWithPhotoLibrary:v14];

  if (v15)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F8D900]) initWithWorkingContext:v12 libraryScope:v15];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __109__PHASharedLibrarySuggestionGenerationTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke;
    v25[3] = &unk_1E6918E10;
    uint64_t v27 = &v28;
    id v26 = v11;
    char v17 = [v16 processSuggestionsForIncrementalChange:v24 withError:a6 progressBlock:v25];
    if (*((unsigned char *)v29 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v33 = 207;
        __int16 v34 = 2080;
        uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/SharedLibraryTasks/PHASharedLibrarySuggestionGenerationTask.m";
        _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a6 && !*a6)
      {
        [MEMORY[0x1E4F71EB8] errorForCode:-4];
        BOOL v18 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = v17;
      v20 = [v10 photoLibrary];
      v21 = [v10 workingContext];
      v22 = [v21 loggingConnection];
      [(PHASharedLibrarySuggestionGenerationTask *)self _sendNotificationWithPhotoLibrary:v20 loggingConnection:v22];
    }
  }
  else
  {
    v19 = [v12 loggingConnection];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] Cannot instanciate without a valid library scope", buf, 2u);
    }

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 9);
      BOOL v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  _Block_object_dispose(&v28, 8);
  return v18;
}

uint64_t __109__PHASharedLibrarySuggestionGenerationTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke(uint64_t a1, unsigned char *a2)
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

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  char v9 = [v7 workingContext];
  id v10 = (void *)MEMORY[0x1E4F8D900];
  id v11 = [v9 photoLibrary];
  id v12 = [v10 libraryScopeToUseWithPhotoLibrary:v11];

  if (v12)
  {
    __int16 v34 = (void *)[objc_alloc(MEMORY[0x1E4F8D900]) initWithWorkingContext:v9 libraryScope:v12];
    if (self->_taskType)
    {
      if (self->_taskType != 1)
      {
        char v15 = 0;
LABEL_19:
        if (*((unsigned char *)v43 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v47 = 183;
            __int16 v48 = 2080;
            v49 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/St"
                  "orytelling/Tasks/SharedLibraryTasks/PHASharedLibrarySuggestionGenerationTask.m";
            _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          if (a5 && !*a5)
          {
            [MEMORY[0x1E4F71EB8] errorForCode:-4];
            char v15 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            char v15 = 0;
          }
        }
        else
        {
          uint64_t v30 = [v7 photoLibrary];
          char v31 = [v7 workingContext];
          v32 = [v31 loggingConnection];
          [(PHASharedLibrarySuggestionGenerationTask *)self _sendNotificationWithPhotoLibrary:v30 loggingConnection:v32];
        }
        goto LABEL_28;
      }
      v13 = [MEMORY[0x1E4F1C9C8] distantPast];
      v14 = [MEMORY[0x1E4F1C9C8] date];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __87__PHASharedLibrarySuggestionGenerationTask_runWithGraphManager_progressReporter_error___block_invoke_2;
      v36[3] = &unk_1E6918E10;
      uint64_t v38 = &v42;
      id v37 = v8;
      char v15 = [v34 processSuggestionsFromStartDate:v13 toDate:v14 withError:a5 progressBlock:v36];

      v16 = v37;
    }
    else
    {
      BOOL v18 = [v7 photoLibrary];
      v16 = [v18 librarySpecificFetchOptions];

      [v16 setFetchLimit:1];
      [v16 setWantsIncrementalChangeDetails:0];
      v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
      v50[0] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
      [v16 setSortDescriptors:v20];

      v21 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v16];
      if ([v21 count])
      {
        v22 = [v21 firstObject];
        unint64_t v23 = [v22 creationDate];
        id v24 = v23;
        if (v23)
        {
          id v25 = v23;
        }
        else
        {
          id v25 = [MEMORY[0x1E4F1C9C8] date];
        }
        id v26 = v25;

        uint64_t v27 = (void *)MEMORY[0x1E4F76C68];
        uint64_t v28 = [MEMORY[0x1E4F76C68] startOfDayForDate:v26];
        uint64_t v29 = [v27 dateByAddingDays:-90 toDate:v28];

        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __87__PHASharedLibrarySuggestionGenerationTask_runWithGraphManager_progressReporter_error___block_invoke;
        v39[3] = &unk_1E6918E10;
        v41 = &v42;
        id v40 = v8;
        char v15 = [v34 processSuggestionsFromStartDate:v29 toDate:v26 withError:a5 progressBlock:v39];
      }
      else
      {
        char v15 = 1;
      }
    }
    goto LABEL_19;
  }
  char v17 = [v9 loggingConnection];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] Cannot instanciate without a valid library scope", buf, 2u);
  }

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 9);
    char v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v15 = 0;
  }
LABEL_28:

  _Block_object_dispose(&v42, 8);
  return v15;
}

uint64_t __87__PHASharedLibrarySuggestionGenerationTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, unsigned char *a2)
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

uint64_t __87__PHASharedLibrarySuggestionGenerationTask_runWithGraphManager_progressReporter_error___block_invoke_2(uint64_t a1, unsigned char *a2)
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 photoLibrary];
  if (([v5 isSystemPhotoLibrary] & 1) == 0)
  {
    id v8 = [v4 workingContext];
    char v9 = [v8 loggingConnection];

    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v10 = [(PHASharedLibrarySuggestionGenerationTask *)self name];
    int v15 = 138412290;
    v16 = v10;
    id v11 = "Task is running on a non system photo library: not running %@ job";
LABEL_11:
    _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0xCu);

    goto LABEL_12;
  }
  v6 = [MEMORY[0x1E4F8D900] libraryScopeToUseWithPhotoLibrary:v5];

  if (!v6)
  {
    id v12 = [v4 workingContext];
    char v9 = [v12 loggingConnection];

    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v10 = [(PHASharedLibrarySuggestionGenerationTask *)self name];
    int v15 = 138412290;
    v16 = v10;
    id v11 = "%@ task is not running without an active shared library scope to use";
    goto LABEL_11;
  }
  if ((PLIsSharedLibrarySuggestionsEnabled() & 1) == 0)
  {
    v13 = [v4 workingContext];
    char v9 = [v13 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(PHASharedLibrarySuggestionGenerationTask *)self name];
      int v15 = 138412290;
      v16 = v10;
      id v11 = "Shared Library suggestions are disabled in defaults: not running %@ job";
      goto LABEL_11;
    }
LABEL_12:

    char v7 = 0;
    goto LABEL_13;
  }
  char v7 = [v4 isReady];
LABEL_13:

  return v7;
}

- (int)priority
{
  return 1;
}

- (id)taskClassDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)incrementalKey
{
  if (self->_taskType == 1)
  {
    v2 = 0;
  }
  else
  {
    v2 = [(PHASharedLibrarySuggestionGenerationTask *)self name];
  }

  return v2;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (double)period
{
  double result = dbl_1D2433360[self->_taskType == 1];
  if (!self->_taskType) {
    return 86400.0;
  }
  return result;
}

- (NSString)name
{
  v2 = @"SharedLibrarySuggestionsUnknown";
  if (self->_taskType == 1) {
    v2 = @"PHASharedLibrarySuggestionGenerationWeeklyTask";
  }
  if (self->_taskType) {
    return &v2->isa;
  }
  else {
    return (NSString *)@"PHASharedLibrarySuggestionGenerationDailyTask";
  }
}

- (PHASharedLibrarySuggestionGenerationTask)initWithTaskType:(signed __int16)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHASharedLibrarySuggestionGenerationTask;
  double result = [(PHASharedLibrarySuggestionGenerationTask *)&v5 init];
  if (result) {
    result->_taskType = a3;
  }
  return result;
}

+ (BOOL)resetSuggestionsWithGraphManager:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 photoLibrary];
  char v7 = (void *)MEMORY[0x1D26057A0]();
  id v8 = [v6 librarySpecificFetchOptions];
  char v9 = [MEMORY[0x1E4F39110] fetchActiveLibraryScopeWithOptions:v8];
  if ([v9 count] == 1)
  {
    id v10 = [v6 librarySpecificFetchOptions];
    v31[0] = *MEMORY[0x1E4F394A8];
    LOBYTE(v11) = 1;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    [v10 setFetchPropertySets:v12];

    id v24 = v10;
    v13 = [MEMORY[0x1E4F38EB8] fetchAssetsInPreviewStateWithPhotosOrPhotosDeferredSuggestedByClientTypeWithOptions:v10];
    if ([v13 count])
    {
      v22 = v7;
      unint64_t v23 = a4;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __83__PHASharedLibrarySuggestionGenerationTask_resetSuggestionsWithGraphManager_error___block_invoke;
      v26[3] = &unk_1E69189B0;
      id v27 = v9;
      id v14 = v13;
      id v28 = v14;
      id v25 = 0;
      int v11 = [v6 performChangesAndWait:v26 error:&v25];
      id v15 = v25;
      v16 = [v5 workingContext];
      uint64_t v17 = [v16 loggingConnection];

      if (v11)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v18 = [v14 count];
          *(_DWORD *)buf = 67109120;
          LODWORD(v30) = v18;
          _os_log_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_INFO, "Reset %d shared library suggestions", buf, 8u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v15;
        _os_log_error_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_ERROR, "Failed to reset shared library suggestions: %@", buf, 0xCu);
      }

      char v7 = v22;
      a4 = v23;
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
    LOBYTE(v11) = 1;
  }

  id v19 = objc_alloc(MEMORY[0x1E4F29130]);
  v20 = (void *)[v19 initWithStoreIdentifier:*MEMORY[0x1E4F8D270] type:0];
  [v20 removeObjectForKey:*MEMORY[0x1E4F8D268]];
  [v20 removeObjectForKey:*MEMORY[0x1E4F8D260]];
  [v20 removeObjectForKey:*MEMORY[0x1E4F8D250]];
  [v20 synchronize];
  if (*a4) {
    *a4 = v15;
  }

  return v11;
}

void __83__PHASharedLibrarySuggestionGenerationTask_resetSuggestionsWithGraphManager_error___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F39118];
  v3 = [*(id *)(a1 + 32) firstObject];
  id v4 = [v2 changeRequestForLibraryScope:v3];

  [v4 removePreviewAssetsSuggestedByPhotos:*(void *)(a1 + 40)];
}

@end