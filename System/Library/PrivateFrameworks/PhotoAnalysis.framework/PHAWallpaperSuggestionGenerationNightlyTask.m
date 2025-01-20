@interface PHAWallpaperSuggestionGenerationNightlyTask
+ (BOOL)shouldRefreshGalleryWithLoggingConnection:(id)a3;
+ (id)lastGalleryAppearanceDateWithError:(id *)a3;
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSDictionary)suggestionOptionsDictionary;
- (NSString)name;
- (double)period;
- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)setSuggestionOptionsDictionary:(id)a3;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAWallpaperSuggestionGenerationNightlyTask

+ (id)lastGalleryAppearanceDateWithError:(id *)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4036;
  v18 = __Block_byref_object_dispose__4037;
  id v19 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__4036;
  v12[4] = __Block_byref_object_dispose__4037;
  id v13 = 0;
  v3 = objc_msgSend(MEMORY[0x1E4F4B040], "sharedInstance", a3);
  if (objc_opt_respondsToSelector())
  {
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__PHAWallpaperSuggestionGenerationNightlyTask_lastGalleryAppearanceDateWithError___block_invoke;
    v8[3] = &unk_1E6917EB0;
    v10 = &v14;
    v11 = v12;
    v5 = v4;
    v9 = v5;
    [v3 synchronousDateOfLastGalleryAppearanceWithCompletion:v8];
    dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v6 = (id)v15[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __82__PHAWallpaperSuggestionGenerationNightlyTask_lastGalleryAppearanceDateWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (BOOL)shouldRefreshGalleryWithLoggingConnection:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v23 = 0;
  id v5 = [a1 lastGalleryAppearanceDateWithError:&v23];
  id v6 = (__CFString *)v23;
  uint64_t v7 = +[PHAWallpaperSuggestionRefreshSession lastGalleryRefreshDate];
  v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v9 = [v8 persistentDomainForName:@"com.apple.mobileslideshow"];

  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F8EAF0]];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v5;
    __int16 v26 = 2112;
    v27 = v7;
    __int16 v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1D21F2000, v4, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationNightlyTask] LastGalleryAppearanceDate: %@, LastGalleryRefreshDate: %@, LastWallpaperShelfViewedDate: %@", buf, 0x20u);
  }
  if (v6)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_error_impl(&dword_1D21F2000, v4, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationNightlyTask] Error getting LastGalleryAppearance date from Proactive: %@. Proceed with gallery refresh.", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if (!v7)
  {
    BOOL v11 = 1;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v16 = "[PHAWallpaperSuggestionGenerationNightlyTask] Should refresh wallpaper gallery. Last gallery refresh date is nil";
    v17 = v4;
    uint32_t v18 = 2;
    goto LABEL_18;
  }
  if (v10)
  {
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSinceDate:v7];
    double v14 = v13;

    BOOL v11 = v14 > 604800.0;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 138413314;
    v15 = @"Skip";
    if (v14 > 604800.0) {
      v15 = @"Should";
    }
    v25 = v15;
    __int16 v26 = 2112;
    v27 = v10;
    __int16 v28 = 2112;
    v29 = v7;
    __int16 v30 = 2048;
    double v31 = v14;
    __int16 v32 = 2048;
    uint64_t v33 = 0x4122750000000000;
    uint64_t v16 = "[PHAWallpaperSuggestionGenerationNightlyTask] %@ refresh wallpaper gallery. LastWallpaperShelfViewedDate: %@, "
          "LastGalleryRefreshDate: %@, timeSinceLastRefresh: %.2f > minRefreshPeriod: %.2f seconds";
    v17 = v4;
    uint32_t v18 = 52;
    goto LABEL_18;
  }
  id v19 = [(__CFString *)v5 laterDate:v7];
  int v20 = [v19 isEqualToDate:v5];

  BOOL v21 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v20)
  {
    if (!v21)
    {
LABEL_6:
      BOOL v11 = 1;
      goto LABEL_22;
    }
    *(_DWORD *)buf = 138412546;
    v25 = v5;
    __int16 v26 = 2112;
    v27 = v7;
    uint64_t v16 = "[PHAWallpaperSuggestionGenerationNightlyTask] Should refresh wallpaper gallery. LastGalleryAppearanceDate: %@ "
          "is later than LastGalleryRefreshDate: %@";
    BOOL v11 = 1;
    v17 = v4;
    uint32_t v18 = 22;
LABEL_18:
    _os_log_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
    goto LABEL_22;
  }
  if (v21)
  {
    *(_DWORD *)buf = 138412546;
    v25 = v5;
    __int16 v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_1D21F2000, v4, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationNightlyTask] Skip refreshing wallpaper gallery. LastGalleryAppearanceDate: %@, LastGalleryRefreshDate: %@", buf, 0x16u);
  }
  BOOL v11 = 0;
LABEL_22:

  return v11;
}

- (void).cxx_destruct
{
}

- (void)setSuggestionOptionsDictionary:(id)a3
{
}

- (NSDictionary)suggestionOptionsDictionary
{
  return self->_suggestionOptionsDictionary;
}

- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v83 = 95;
      *(_WORD *)&v83[4] = 2080;
      *(void *)&v83[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Fra"
                           "mework/Storytelling/Tasks/SuggestionTasks/PHAWallpaperSuggestionGenerationNightlyTask.m";
      _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10 = [v6 workingContextForSuggestions];
    BOOL v11 = [v10 loggingConnection];

    id v12 = objc_alloc_init(MEMORY[0x1E4F28E08]);
    double v13 = [[PHAWallpaperSuggestionRefreshSession alloc] initWithGraphManager:v6];
    id v75 = 0;
    LODWORD(v10) = [(PHAWallpaperSuggestionRefreshSession *)v13 prepareWithError:&v75];
    id v14 = v75;
    id v15 = v14;
    if (v10)
    {
      id v49 = v6;
      id v51 = v14;
      v55 = v12;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v83 = v13;
        _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionGenerationNightlyTask] Successfully created refresh session %@", buf, 0xCu);
      }
      uint64_t v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint32_t v18 = [v7 progressReportersForParallelOperationsWithCount:3];
      dispatch_group_enter(v16);
      uint64_t v19 = [v18 firstObject];
      int v20 = (void *)v19;
      if (v19) {
        BOOL v21 = (void *)v19;
      }
      else {
        BOOL v21 = v7;
      }
      v22 = v13;
      id v23 = v21;

      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __106__PHAWallpaperSuggestionGenerationNightlyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke;
      v69[3] = &unk_1E6917E88;
      id v24 = v55;
      id v70 = v24;
      v53 = v11;
      v25 = v11;
      v71 = v25;
      id v26 = v9;
      id v72 = v26;
      id v27 = v17;
      id v73 = v27;
      __int16 v28 = v16;
      v74 = v28;
      v50 = v23;
      [(PHAWallpaperSuggestionRefreshSession *)v22 refreshPosterConfigurationsForNightlyRefresh:1 progressReporter:v23 passingFilter:0 withCompletion:v69];
      v54 = v18;
      if ([(id)objc_opt_class() shouldRefreshGalleryWithLoggingConnection:v25])
      {
        dispatch_group_enter(v28);
        if ((unint64_t)[v18 count] <= 1)
        {
          id v29 = v7;
        }
        else
        {
          id v29 = [v18 objectAtIndexedSubscript:1];
        }
        double v31 = v29;
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __106__PHAWallpaperSuggestionGenerationNightlyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_253;
        v63[3] = &unk_1E6917E88;
        id v64 = v24;
        v65 = v25;
        id v66 = v26;
        id v67 = v27;
        v68 = v28;
        [(PHAWallpaperSuggestionRefreshSession *)v22 refreshPosterDescriptorsWithProgressReporter:v31 completion:v63];
      }
      dispatch_group_enter(v28);
      if ((unint64_t)[v18 count] <= 2)
      {
        id v32 = v7;
      }
      else
      {
        id v32 = [v18 objectAtIndexedSubscript:2];
      }
      uint64_t v33 = v32;
      id v15 = v51;
      double v13 = v22;
      id v6 = v49;
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __106__PHAWallpaperSuggestionGenerationNightlyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_257;
      v57[3] = &unk_1E6917E88;
      id v34 = v24;
      id v58 = v34;
      v35 = v25;
      v59 = v35;
      id v36 = v26;
      id v60 = v36;
      id v37 = v27;
      id v61 = v37;
      v38 = v28;
      v62 = v38;
      [(PHAWallpaperSuggestionRefreshSession *)v13 refreshAmbientDescriptorsWithProgressReporter:v33 completion:v57];
      dispatch_group_leave(v38);
      dispatch_time_t v39 = dispatch_time(0, 300000000000);
      v52 = v38;
      intptr_t v40 = dispatch_group_wait(v38, v39);
      if ([v7 isCancelledWithProgress:1.0])
      {
        [v34 lock];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D21F2000, v35, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionGenerationNightlyTask] Wallpaper suggestions refresh was canceled", buf, 2u);
        }
        if (objc_msgSend(v37, "count", v49))
        {
          uint64_t v80 = *MEMORY[0x1E4F28750];
          id v81 = v37;
          v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        }
        else
        {
          v41 = 0;
        }
        uint64_t v43 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:userInfo:", 16, v41);

        [v34 unlock];
        id v36 = 0;
        id v15 = (id)v43;
      }
      else if (v40)
      {
        [v34 lock];
        if (!v15)
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D21F2000, v35, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationNightlyTask] Timed out refreshing wallpaper suggestions", buf, 2u);
          }
          if (objc_msgSend(v37, "count", v49))
          {
            uint64_t v78 = *MEMORY[0x1E4F28750];
            id v79 = v37;
            v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
          }
          else
          {
            v42 = 0;
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:userInfo:", 9, v42);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        [v34 unlock];
        id v36 = 0;
      }
      else if ([v37 count])
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D21F2000, v35, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationNightlyTask] Refreshing wallpaper suggestions failed because of underlying errors", buf, 2u);
        }
        v44 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v76 = *MEMORY[0x1E4F28750];
        id v77 = v37;
        v45 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1, v49);
        uint64_t v46 = objc_msgSend(v44, "pl_analysisErrorWithCode:userInfo:", 26, v45);

        id v36 = 0;
        id v15 = (id)v46;
      }
      [(PHAWallpaperSuggestionRefreshSession *)v13 cleanup];
      BOOL v11 = v53;
      id v12 = v55;
      if (a5) {
        *a5 = v15;
      }
      id v9 = v36;

      v8 = v9;
    }
    else
    {
      __int16 v30 = v11;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        uint64_t v47 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(void *)v83 = v47;
        _os_log_fault_impl(&dword_1D21F2000, v30, OS_LOG_TYPE_FAULT, "[PHAWallpaperSuggestionGenerationNightlyTask] Failed to create refresh session, %@ will not be able to run, bailing out", buf, 0xCu);
      }

      if (a5)
      {
        id v15 = v15;
        v8 = 0;
        *a5 = v15;
      }
      else
      {
        v8 = 0;
      }
    }
  }

  return v8;
}

void __106__PHAWallpaperSuggestionGenerationNightlyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) lock];
  id v7 = *(NSObject **)(a1 + 40);
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_error_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationNightlyTask] Failed to refresh poster configurations: %@", (uint8_t *)&v8, 0xCu);
      if (!v6) {
        goto LABEL_8;
      }
    }
    else if (!v6)
    {
      goto LABEL_8;
    }
    [*(id *)(a1 + 56) addObject:v6];
    goto LABEL_8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationNightlyTask] Successfully refreshed poster configurations", (uint8_t *)&v8, 2u);
  }
  [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:@"shuffleInfo"];
LABEL_8:
  [*(id *)(a1 + 32) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __106__PHAWallpaperSuggestionGenerationNightlyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_253(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) lock];
  id v7 = *(NSObject **)(a1 + 40);
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_error_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationNightlyTask] Failed to refresh poster descriptors: %@", (uint8_t *)&v8, 0xCu);
      if (!v6) {
        goto LABEL_8;
      }
    }
    else if (!v6)
    {
      goto LABEL_8;
    }
    [*(id *)(a1 + 56) addObject:v6];
    goto LABEL_8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationNightlyTask] Successfully refreshed poster descriptors", (uint8_t *)&v8, 2u);
  }
  [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:@"galleryInfo"];
LABEL_8:
  [*(id *)(a1 + 32) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __106__PHAWallpaperSuggestionGenerationNightlyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_257(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) lock];
  id v7 = *(NSObject **)(a1 + 40);
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_error_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationNightlyTask] Failed to refresh ambient poster descriptors: %@", (uint8_t *)&v8, 0xCu);
      if (!v6) {
        goto LABEL_8;
      }
    }
    else if (!v6)
    {
      goto LABEL_8;
    }
    [*(id *)(a1 + 56) addObject:v6];
    goto LABEL_8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationNightlyTask] Successfully refreshed ambient poster descriptors", (uint8_t *)&v8, 2u);
  }
  [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:@"ambientInfo"];
LABEL_8:
  [*(id *)(a1 + 32) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAWallpaperSuggestionGenerationNightlyTask timeoutFatal:]", "PHAWallpaperSuggestionGenerationNightlyTask.m", 87, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAWallpaperSuggestionGenerationNightlyTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v5 = [(PHAWallpaperSuggestionGenerationNightlyTask *)self generateSuggestionsWithGraphManager:a3 progressReporter:a4 error:a5];
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 photoLibrary];
  char v6 = [v5 isSystemPhotoLibrary];

  if ((v6 & 1) == 0)
  {
    id v7 = [v4 workingContext];
    int v8 = [v7 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(PHAWallpaperSuggestionGenerationNightlyTask *)self name];
      uint64_t v10 = [v4 photoLibrary];
      BOOL v11 = [v10 debugDescription];
      int v13 = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1D21F2000, v8, OS_LOG_TYPE_DEFAULT, "%@ is running on a non system photo library. Library: %@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v6;
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
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (double)period
{
  return -2.0;
}

- (NSString)name
{
  return (NSString *)@"PHAWallpaperSuggestionGenerationNightlyTask";
}

@end