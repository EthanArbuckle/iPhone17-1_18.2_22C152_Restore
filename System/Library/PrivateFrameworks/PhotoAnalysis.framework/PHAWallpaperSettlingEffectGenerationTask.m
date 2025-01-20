@interface PHAWallpaperSettlingEffectGenerationTask
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

@implementation PHAWallpaperSettlingEffectGenerationTask

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
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  v9 = [v7 workingContextForSuggestions];
  v10 = [v9 loggingConnection];
  if (!*((unsigned char *)v30 + 24))
  {
    char v11 = [v8 isCancelledWithProgress:0.0];
    *((unsigned char *)v30 + 24) = v11;
    if (v11) {
      goto LABEL_4;
    }
    if (self->_suggestionOptionsDictionary) {
      id v14 = (id)[objc_alloc(MEMORY[0x1E4F8D920]) initWithOptionsDictionary:self->_suggestionOptionsDictionary];
    }
    else {
      id v14 = objc_alloc_init(MEMORY[0x1E4F8D920]);
    }
    v15 = v14;
    [v14 setDefaultStartAndEndDatesIfNeeded];
    [v15 setIgnoreCollisionsWithExistingSuggestions:1];
    v16 = [(NSDictionary *)self->_suggestionOptionsDictionary objectForKeyedSubscript:*MEMORY[0x1E4F8B0E0]];
    BOOL v17 = v16 == 0;

    if (v17) {
      [v15 setMaximumNumberOfSuggestions:200];
    }
    v18 = [[PHASuggestionController alloc] initWithGraphManager:v7];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __103__PHAWallpaperSettlingEffectGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke;
    v26[3] = &unk_1E6918E10;
    v28 = &v29;
    id v19 = v8;
    id v27 = v19;
    v20 = [(PHASuggestionController *)v18 generateWallpaperSuggestionsWithOptions:v15 progress:v26];
    if (*((unsigned char *)v30 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v36 = 93;
        __int16 v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/SuggestionTasks/PHAWallpaperSettlingEffectGenerationTask.m";
        v21 = MEMORY[0x1E4F14500];
LABEL_25:
        _os_log_impl(&dword_1D21F2000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      v22 = v10;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v25 = [v20 count];
        v23 = [v20 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 67109378;
        int v36 = v25;
        __int16 v37 = 2112;
        v38 = v23;
        _os_log_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_INFO, "[PHAWallpaperSettlingEffectGenerationTask] Generated %d wallpaper suggestions with local identifiers %@", buf, 0x12u);
      }
      if (*((unsigned char *)v30 + 24))
      {
        *((unsigned char *)v30 + 24) = 1;
      }
      else
      {
        char v24 = [v19 isCancelledWithProgress:1.0];
        *((unsigned char *)v30 + 24) = v24;
        if ((v24 & 1) == 0)
        {
          uint64_t v33 = *MEMORY[0x1E4F8B118];
          v34 = v20;
          v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
          goto LABEL_27;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v36 = 97;
        __int16 v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/SuggestionTasks/PHAWallpaperSettlingEffectGenerationTask.m";
        v21 = MEMORY[0x1E4F14500];
        goto LABEL_25;
      }
    }
    v12 = (void *)MEMORY[0x1E4F1CC08];
LABEL_27:

    goto LABEL_7;
  }
  *((unsigned char *)v30 + 24) = 1;
LABEL_4:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v36 = 80;
    __int16 v37 = 2080;
    v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storytelli"
          "ng/Tasks/SuggestionTasks/PHAWallpaperSettlingEffectGenerationTask.m";
    _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v12 = (void *)MEMORY[0x1E4F1CC08];
LABEL_7:

  _Block_object_dispose(&v29, 8);

  return v12;
}

uint64_t __103__PHAWallpaperSettlingEffectGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, unsigned char *a2)
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

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAWallpaperSettlingEffectGenerationTask timeoutFatal:]", "PHAWallpaperSettlingEffectGenerationTask.m", 68, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAWallpaperSettlingEffectGenerationTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  v5 = [(PHAWallpaperSettlingEffectGenerationTask *)self generateSuggestionsWithGraphManager:a3 progressReporter:a4 error:a5];
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  return 1;
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
  return (NSString *)@"PHAWallpaperSettlingEffectGenerationTask";
}

@end