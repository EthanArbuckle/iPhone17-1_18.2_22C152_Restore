@interface PHASuggestionGenerationTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)featureComplete;
- (BOOL)generateWallpaperSuggestions;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSDictionary)suggestionOptionsDictionary;
- (NSString)name;
- (PHASuggestionGenerationTask)init;
- (double)period;
- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (id)incrementalKey;
- (id)initForFastPass;
- (id)taskClassDependencies;
- (int)priority;
- (unint64_t)featureCode;
- (unsigned)suggestionProfileFromSuggestionType:(unsigned __int16)a3 subtype:(unsigned __int16)a4;
- (void)setSuggestionOptionsDictionary:(id)a3;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHASuggestionGenerationTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionOptionsDictionary, 0);

  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- (unint64_t)featureCode
{
  return self->_featureCode;
}

- (BOOL)featureComplete
{
  return self->_featureComplete;
}

- (void)setSuggestionOptionsDictionary:(id)a3
{
}

- (NSDictionary)suggestionOptionsDictionary
{
  return self->_suggestionOptionsDictionary;
}

- (unsigned)suggestionProfileFromSuggestionType:(unsigned __int16)a3 subtype:(unsigned __int16)a4
{
  if (a4 == 502) {
    return 3;
  }
  if (a3 > 0xBu) {
    return 0;
  }
  return byte_1D2433480[a3];
}

- (BOOL)generateWallpaperSuggestions
{
  return 1;
}

- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 0;
  v55 = [v7 photoLibrary];
  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = [[PHASuggestionController alloc] initWithGraphManager:v7];
  if (self->_suggestionOptionsDictionary) {
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F8D920]) initWithOptionsDictionary:self->_suggestionOptionsDictionary];
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x1E4F8D920]);
  }
  v11 = v10;
  [v10 setDefaultStartAndEndDatesIfNeeded];
  v12 = [(NSDictionary *)self->_suggestionOptionsDictionary objectForKeyedSubscript:*MEMORY[0x1E4F8B0E0]];

  [(PHASuggestionController *)v9 ingestExistingSuggestionsWithOptions:v11];
  v13 = [v55 librarySpecificFetchOptions];
  [v13 setIncludePendingMemories:1];
  v14 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v13];
  v54 = [v14 fetchedObjects];

  [(PHASuggestionController *)v9 setExistingMemories:v54];
  [(PHASuggestionController *)v9 cacheWidgetSuggestionsWithCurrentlyFeaturedState];
  if (*((unsigned char *)v67 + 24))
  {
    *((unsigned char *)v67 + 24) = 1;
    goto LABEL_7;
  }
  char v15 = [v8 isCancelledWithProgress:0.0];
  *((unsigned char *)v67 + 24) = v15;
  if (v15)
  {
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v75 = 135;
      *(_WORD *)&v75[4] = 2080;
      *(void *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Fra"
                           "mework/Storytelling/Tasks/SuggestionTasks/PHASuggestionGenerationTask.m";
      _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    if (a5 && !*a5)
    {
      id v16 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
LABEL_12:
      v17 = 0;
      *a5 = v16;
      goto LABEL_78;
    }
    goto LABEL_77;
  }
  suggestionOptionsDictionary = self->_suggestionOptionsDictionary;
  if (!suggestionOptionsDictionary
    || (-[NSDictionary objectForKeyedSubscript:](suggestionOptionsDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E4F8B0C0]), v19 = objc_claimAutoreleasedReturnValue(), char v20 = [v19 BOOLValue], v19, (v20 & 1) != 0))
  {
    unsigned int v51 = 1;
LABEL_16:
    if (!v12) {
      [v11 setMaximumNumberOfSuggestions:1];
    }
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __90__PHASuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke;
    v63[3] = &unk_1E6918E10;
    v65 = &v66;
    id v64 = v8;
    v21 = [(PHASuggestionController *)v9 generateSingleAssetSuggestionsWithOptions:v11 progress:v63];
    v22 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_INFO))
    {
      id v49 = v8;
      int v23 = [v21 count];
      v24 = [v21 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v75 = v23;
      *(_WORD *)&v75[4] = 2112;
      *(void *)&v75[6] = v24;
      _os_log_impl(&dword_1D21F2000, (os_log_t)v22, OS_LOG_TYPE_INFO, "[PHASuggestionGenerationTask] Generated %d Single Asset suggestions with local identifiers %@", buf, 0x12u);

      id v8 = v49;
    }

    if (*((unsigned char *)v67 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v75 = 154;
        *(_WORD *)&v75[4] = 2080;
        *(void *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/F"
                             "ramework/Storytelling/Tasks/SuggestionTasks/PHASuggestionGenerationTask.m";
        _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a5 && !*a5)
      {
        *a5 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
      }

      goto LABEL_77;
    }
    [v52 addObjectsFromArray:v21];

    int v28 = 0;
    goto LABEL_30;
  }
  v25 = [(NSDictionary *)self->_suggestionOptionsDictionary objectForKeyedSubscript:*MEMORY[0x1E4F8B108]];
  unsigned __int16 v26 = [v25 integerValue];

  v27 = [(NSDictionary *)self->_suggestionOptionsDictionary objectForKeyedSubscript:*MEMORY[0x1E4F8B0F8]];
  LOWORD(v25) = [v27 integerValue];

  unsigned int v51 = 0;
  int v28 = [(PHASuggestionGenerationTask *)self suggestionProfileFromSuggestionType:v26 subtype:(unsigned __int16)v25];
  if (!v28) {
    goto LABEL_16;
  }
LABEL_30:
  if ((v51 & 1) != 0 || v28 == 4)
  {
    if (!v12) {
      [v11 setMaximumNumberOfSuggestions:3];
    }
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __90__PHASuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_212;
    v60[3] = &unk_1E6918E10;
    v62 = &v66;
    id v61 = v8;
    v29 = [(PHASuggestionController *)v9 generateOnThisDayAssetSuggestionsWithOptions:v11 progress:v60];
    v30 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_INFO))
    {
      id v50 = v8;
      v48 = v29;
      int v31 = [v29 count];
      v32 = [v48 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v75 = v31;
      *(_WORD *)&v75[4] = 2112;
      *(void *)&v75[6] = v32;
      _os_log_impl(&dword_1D21F2000, (os_log_t)v30, OS_LOG_TYPE_INFO, "[PHASuggestionGenerationTask] Generated %d On This Day suggestions with local identifiers %@", buf, 0x12u);

      v29 = v48;
      id v8 = v50;
    }

    if (*((unsigned char *)v67 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v75 = 167;
        *(_WORD *)&v75[4] = 2080;
        *(void *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/F"
                             "ramework/Storytelling/Tasks/SuggestionTasks/PHASuggestionGenerationTask.m";
        _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a5 && !*a5)
      {
        *a5 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
      }

      goto LABEL_77;
    }
    [v52 addObjectsFromArray:v29];
  }
  if (v28 == 3) {
    int v33 = 1;
  }
  else {
    int v33 = v51;
  }
  if (v33 == 1)
  {
    if (!v12)
    {
      unint64_t v34 = [(PHASuggestionController *)v9 newFeaturedSuggestionsCount];
      if (v34 >= 0xA) {
        uint64_t v35 = 1;
      }
      else {
        uint64_t v35 = 10 - v34;
      }
      [v11 setMaximumNumberOfSuggestions:v35];
    }
    [v11 setClearFeaturedSuggestions:v51];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __90__PHASuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_213;
    v57[3] = &unk_1E6918E10;
    v59 = &v66;
    id v58 = v8;
    v36 = [(PHASuggestionController *)v9 generateWidgetSuggestionsWithOptions:v11 progress:v57];
    v37 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_INFO))
    {
      int v38 = [v36 count];
      v39 = [v36 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v75 = v38;
      *(_WORD *)&v75[4] = 2112;
      *(void *)&v75[6] = v39;
      _os_log_impl(&dword_1D21F2000, (os_log_t)v37, OS_LOG_TYPE_INFO, "[PHASuggestionGenerationTask] Generated %d Widget suggestions with local identifiers %@", buf, 0x12u);
    }
    if (*((unsigned char *)v67 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v75 = 186;
        *(_WORD *)&v75[4] = 2080;
        *(void *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/F"
                             "ramework/Storytelling/Tasks/SuggestionTasks/PHASuggestionGenerationTask.m";
        _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a5 && !*a5)
      {
        *a5 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
      }

      goto LABEL_77;
    }
    [v52 addObjectsFromArray:v36];
  }
  if ([v52 count])
  {
    if (!self->_fastPass) {
      self->_featureComplete = 1;
    }
    loggingConnection = self->_loggingConnection;
    id v56 = 0;
    BOOL v41 = +[PHAMemoryElectionTask reloadForYouWidgetTimelineWithLoggingConnection:loggingConnection error:&v56];
    id v42 = v56;
    if (!v41)
    {
      v43 = self->_loggingConnection;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v75 = v42;
        _os_log_error_impl(&dword_1D21F2000, v43, OS_LOG_TYPE_ERROR, "[PHASuggestionGenerationTask] Error calling reloadWidgetTimelineWithPhotoLibrary (%@)", buf, 0xCu);
      }
    }
  }
  if (*((unsigned char *)v67 + 24))
  {
    *((unsigned char *)v67 + 24) = 1;
  }
  else
  {
    char v44 = [v8 isCancelledWithProgress:1.0];
    *((unsigned char *)v67 + 24) = v44;
    if ((v44 & 1) == 0)
    {
      if ([v11 discardGeneratedSuggestions])
      {
        uint64_t v70 = *MEMORY[0x1E4F8B110];
        id v71 = v52;
        v46 = &v70;
        v47 = &v71;
      }
      else
      {
        uint64_t v72 = *MEMORY[0x1E4F8B118];
        id v73 = v52;
        v46 = &v72;
        v47 = &v73;
      }
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:1];
      goto LABEL_78;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v75 = 203;
    *(_WORD *)&v75[4] = 2080;
    *(void *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Frame"
                         "work/Storytelling/Tasks/SuggestionTasks/PHASuggestionGenerationTask.m";
    _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  if (a5 && !*a5)
  {
    id v16 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
    goto LABEL_12;
  }
LABEL_77:
  v17 = 0;
LABEL_78:

  _Block_object_dispose(&v66, 8);

  return v17;
}

uint64_t __90__PHASuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, unsigned char *a2)
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

uint64_t __90__PHASuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_212(uint64_t a1, unsigned char *a2)
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

uint64_t __90__PHASuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke_213(uint64_t a1, unsigned char *a2)
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
    __assert_rtn("-[PHASuggestionGenerationTask timeoutFatal:]", "PHASuggestionGenerationTask.m", 108, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHASuggestionGenerationTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  v5 = [(PHASuggestionGenerationTask *)self generateSuggestionsWithGraphManager:a3 progressReporter:a4 error:a5];
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  char v4 = PLIsFeaturedContentAllowed();
  if ((v4 & 1) == 0)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHASuggestionGenerationTask] featured content is disabled in settings", v7, 2u);
    }
  }
  return v4;
}

- (int)priority
{
  return 1;
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
  return -2.0;
}

- (NSString)name
{
  return (NSString *)@"PHASuggestionGenerationTask";
}

- (id)initForFastPass
{
  id result = [(PHASuggestionGenerationTask *)self init];
  if (result) {
    *((unsigned char *)result + 16) = 1;
  }
  return result;
}

- (PHASuggestionGenerationTask)init
{
  v7.receiver = self;
  v7.super_class = (Class)PHASuggestionGenerationTask;
  v2 = [(PHASuggestionGenerationTask *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_fastPass = 0;
    os_log_t v4 = os_log_create("com.apple.PhotosGraph", "SuggestionGenerationTask");
    loggingConnection = v3->_loggingConnection;
    v3->_loggingConnection = (OS_os_log *)v4;

    v3->_featureCode = 100;
  }
  return v3;
}

@end