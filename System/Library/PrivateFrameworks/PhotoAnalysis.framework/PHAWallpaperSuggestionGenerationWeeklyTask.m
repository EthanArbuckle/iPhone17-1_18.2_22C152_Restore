@interface PHAWallpaperSuggestionGenerationWeeklyTask
+ (id)generationOptionNameFromSingleOption:(unint64_t)a3;
+ (void)sendWallpaperGenerationCompletedBiomeEvent:(id)a3;
- (BOOL)currentPlatformIsSupported;
- (BOOL)featureAvailable;
- (BOOL)isGraphDependentSubtype:(unsigned __int16)a3;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (BOOL)suggestionsExistInPhotoLibrary:(id)a3 subtypePredicate:(id)a4;
- (NSDictionary)suggestionOptionsDictionary;
- (NSString)name;
- (PHAWallpaperSuggestionGenerationWeeklyTask)initWithGenerationOptions:(unint64_t)a3;
- (double)period;
- (id)baseSuggestionOptionsWithSubtypes:(id)a3;
- (id)generateSuggestionsWithContentMode:(signed __int16)a3 suggestionController:(id)a4 progressReporter:(id)a5 shouldReload:(BOOL *)a6;
- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (id)incrementalKey;
- (id)subtypePredicateWithContentMode:(signed __int16)a3;
- (id)suggestionOptionsWithContentMode:(signed __int16)a3 isGraphReady:(BOOL)a4 loggingConnection:(id)a5;
- (id)taskClassDependencies;
- (int)priority;
- (unint64_t)featureCode;
- (unint64_t)version;
- (unsigned)suggestionProfileForContentMode:(signed __int16)a3;
- (void)setSuggestionOptionsDictionary:(id)a3;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAWallpaperSuggestionGenerationWeeklyTask

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

- (unint64_t)featureCode
{
  unint64_t generatedContent = self->_generatedContent;
  if (generatedContent) {
    return 103;
  }
  else {
    return ((uint64_t)(generatedContent << 61) >> 63) & 0x68;
  }
}

- (BOOL)featureAvailable
{
  return (self->_generationOptions & ~self->_generatedContent) == 0;
}

- (BOOL)suggestionsExistInPhotoLibrary:(id)a3 subtypePredicate:(id)a4
{
  id v5 = a4;
  v6 = [a3 librarySpecificFetchOptions];
  [v6 setPredicate:v5];

  [v6 setFetchLimit:1];
  v7 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v6];
  BOOL v8 = [v7 count] != 0;

  return v8;
}

- (id)generateSuggestionsWithContentMode:(signed __int16)a3 suggestionController:(id)a4 progressReporter:(id)a5 shouldReload:(BOOL *)a6
{
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a5;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v12 = [v10 graphManager];
  v13 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)self subtypePredicateWithContentMode:v8];
  v14 = [v12 photoLibrary];
  BOOL v23 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)self suggestionsExistInPhotoLibrary:v14 subtypePredicate:v13];

  uint64_t v15 = [v12 isReady];
  v16 = [v12 workingContextForSuggestions];
  v17 = [v16 loggingConnection];

  v18 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)self suggestionOptionsWithContentMode:v8 isGraphReady:v15 loggingConnection:v17];
  uint64_t v19 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)self suggestionProfileForContentMode:v8];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __132__PHAWallpaperSuggestionGenerationWeeklyTask_generateSuggestionsWithContentMode_suggestionController_progressReporter_shouldReload___block_invoke;
  v24[3] = &unk_1E6918E10;
  v26 = v27;
  id v20 = v11;
  id v25 = v20;
  v21 = [v10 generateSuggestionsWithProfile:v19 options:v18 progress:v24];
  if (a6) {
    *a6 = !v23;
  }

  _Block_object_dispose(v27, 8);

  return v21;
}

uint64_t __132__PHAWallpaperSuggestionGenerationWeeklyTask_generateSuggestionsWithContentMode_suggestionController_progressReporter_shouldReload___block_invoke(uint64_t a1, unsigned char *a2)
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

- (id)baseSuggestionOptionsWithSubtypes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addIndex:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "unsignedIntValue"));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  if (self->_suggestionOptionsDictionary) {
    id v11 = (id)[objc_alloc(MEMORY[0x1E4F8D920]) initWithOptionsDictionary:self->_suggestionOptionsDictionary];
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x1E4F8D920]);
  }
  v12 = v11;
  [v11 setDefaultStartAndEndDatesIfNeeded];
  [v12 setIgnoreCollisionsWithExistingSuggestions:1];
  uint64_t v13 = [v12 suggestionSubtypeWhitelist];
  if (v13)
  {
    v14 = (void *)v13;
    uint64_t v15 = [v12 suggestionSubtypeWhitelist];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__PHAWallpaperSuggestionGenerationWeeklyTask_baseSuggestionOptionsWithSubtypes___block_invoke;
    v18[3] = &unk_1E69175C0;
    id v19 = v5;
    v16 = [v15 indexesPassingTest:v18];
    [v12 setSuggestionSubtypeWhitelist:v16];
  }
  else
  {
    [v12 setSuggestionSubtypeWhitelist:v5];
  }

  return v12;
}

uint64_t __80__PHAWallpaperSuggestionGenerationWeeklyTask_baseSuggestionOptionsWithSubtypes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsIndex:a2];
}

- (id)subtypePredicateWithContentMode:(signed __int16)a3
{
  switch(a3)
  {
    case 0:
      self = [MEMORY[0x1E4F39310] predicateForAllShuffleWallpaperSuggestions];
      goto LABEL_11;
    case 1:
      self = [MEMORY[0x1E4F39310] predicateForAllTopWallpaperSuggestions];
      goto LABEL_11;
    case 2:
      id v6 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v7 = 680;
      goto LABEL_10;
    case 3:
      self = [MEMORY[0x1E4F39310] predicateForAllAmbientSuggestions];
      goto LABEL_11;
    case 4:
      id v6 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v7 = 901;
LABEL_10:
      objc_msgSend(v6, "predicateWithFormat:", @"%K = %d", @"subtype", v7, v3);
      self = (PHAWallpaperSuggestionGenerationWeeklyTask *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      break;
    default:
      break;
  }
  return self;
}

- (unsigned)suggestionProfileForContentMode:(signed __int16)a3
{
  if (a3 == 3) {
    return 6;
  }
  else {
    return 2;
  }
}

- (id)suggestionOptionsWithContentMode:(signed __int16)a3 isGraphReady:(BOOL)a4 loggingConnection:(id)a5
{
  int v6 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  switch(v6)
  {
    case 0:
      id v10 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v11 = [MEMORY[0x1E4F39310] allShuffleWallpaperSuggestionSubtypes];
      uint64_t v12 = [v10 setWithSet:v11];

      uint64_t v13 = 200;
      goto LABEL_8;
    case 1:
      v14 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v11 = [MEMORY[0x1E4F39310] allTopWallpaperSuggestionSubtypes];
      uint64_t v12 = [v14 setWithSet:v11];

      uint64_t v13 = 25;
      goto LABEL_8;
    case 2:
      uint64_t v12 = [MEMORY[0x1E4F1CA80] setWithObject:&unk_1F291A5B8];
      uint64_t v13 = 100;
      goto LABEL_10;
    case 3:
      uint64_t v15 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v11 = [MEMORY[0x1E4F39310] allAmbientSuggestionSubtypes];
      uint64_t v12 = [v15 setWithSet:v11];

      uint64_t v13 = 400;
LABEL_8:
      id v9 = (id)v11;
      goto LABEL_10;
    case 4:
      uint64_t v12 = [MEMORY[0x1E4F1CA80] setWithObject:&unk_1F291A5D0];
      uint64_t v13 = 25;
LABEL_10:

      id v9 = (id)v12;
      if (!a4) {
        goto LABEL_11;
      }
      goto LABEL_25;
    default:
      uint64_t v13 = 0;
      if (a4) {
        goto LABEL_25;
      }
LABEL_11:
      oslog = v8;
      uint64_t v16 = v13;
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v18 = v9;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v18);
            }
            long long v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (-[PHAWallpaperSuggestionGenerationWeeklyTask isGraphDependentSubtype:](self, "isGraphDependentSubtype:", (unsigned __int16)[v23 integerValue]))
            {
              [v17 addObject:v23];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v20);
      }

      uint64_t v13 = v16;
      uint64_t v8 = oslog;
      if ([v17 count])
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v33 = v17;
          __int16 v34 = 1024;
          int v35 = v6;
          _os_log_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionGenerationWeeklyTask] Graph is not ready; removing suggestions for %@ for content mode %hd",
            buf,
            0x12u);
        }
        [v18 minusSet:v17];
      }

LABEL_25:
      v24 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)self baseSuggestionOptionsWithSubtypes:v9];
      uint64_t v25 = [(NSDictionary *)self->_suggestionOptionsDictionary objectForKeyedSubscript:*MEMORY[0x1E4F8B0E0]];

      if (!v25) {
        [v24 setMaximumNumberOfSuggestions:v13];
      }

      return v24;
  }
}

- (BOOL)isGraphDependentSubtype:(unsigned __int16)a3
{
  BOOL result = 1;
  if ((int)a3 > 679)
  {
    if ((int)a3 <= 909)
    {
      if ((a3 - 680) <= 0x17 && ((1 << (a3 + 88)) & 0xE00007) != 0) {
        return 0;
      }
      unsigned int v4 = a3 - 801;
      goto LABEL_22;
    }
    if ((a3 - 910) < 8 || (a3 - 1201) < 2 || (a3 - 1101) <= 1) {
      return 0;
    }
  }
  else
  {
    if ((int)a3 > 300)
    {
      if ((int)a3 <= 500)
      {
        if ((a3 - 301) >= 6 && a3 != 401) {
          return result;
        }
        return 0;
      }
      if ((a3 - 601) <= 0x36 && ((1 << (a3 - 89)) & 0x60000000000019) != 0) {
        return 0;
      }
      unsigned int v4 = a3 - 501;
LABEL_22:
      if (v4 >= 2) {
        return result;
      }
      return 0;
    }
    if ((a3 - 201) < 4 || (a3 - 101) < 3 || !a3) {
      return 0;
    }
  }
  return result;
}

- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 workingContextForSuggestions];
  uint64_t v11 = [v10 loggingConnection];
  uint64_t v12 = [[PHASuggestionController alloc] initWithGraphManager:v8];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v111 = v8;
  v14 = [v8 photoLibrary];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__PHAWallpaperSuggestionGenerationWeeklyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke;
  aBlock[3] = &unk_1E6917FE0;
  uint64_t v15 = v11;
  v127 = v15;
  v128 = a5;
  v112 = (void (**)(void))_Block_copy(aBlock);
  v113 = v9;
  if ([v9 isCancelledWithProgress:0.0])
  {
    v112[2]();
    uint64_t v16 = 0;
  }
  else
  {
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F8D970]) initWithPhotoLibrary:v14];
    unsigned int v104 = [v17 libraryIsProcessedEnough];
    int v110 = 0;
    char v125 = 0;
    if (self->_generationOptions)
    {
      id v18 = [v9 childProgressReporterFromStart:0.11 toEnd:0.29];
      v106 = self;
      uint64_t v19 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)self generateSuggestionsWithContentMode:0 suggestionController:v12 progressReporter:v18 shouldReload:&v125];
      int v110 = v125 != 0;
      uint64_t v20 = v15;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = v12;
        long long v22 = v17;
        int v23 = [v19 count];
        [v19 componentsJoinedByString:@", "];
        v101 = v14;
        uint64_t v25 = v24 = v13;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v136 = v23;
        id v17 = v22;
        uint64_t v12 = v21;
        *(_WORD *)&v136[4] = 2112;
        *(void *)&v136[6] = v25;
        _os_log_impl(&dword_1D21F2000, v20, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Generated %d wallpaper shuffle suggestions with local identifiers %@", buf, 0x12u);

        id v13 = v24;
        v14 = v101;
      }

      [v13 addObjectsFromArray:v19];
      self = v106;
      if ([v19 count]) {
        v106->_generatedContent |= 1uLL;
      }
    }
    if ([v113 isCancelledWithProgress:0.3]) {
      goto LABEL_60;
    }
    unsigned __int8 v124 = 0;
    v103 = v12;
    if ((self->_generationOptions & 2) != 0)
    {
      v26 = [v113 childProgressReporterFromStart:0.31 toEnd:0.59];
      v107 = self;
      v27 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)self generateSuggestionsWithContentMode:1 suggestionController:v12 progressReporter:v26 shouldReload:&v124];
      int v110 = (v124 | v110) != 0;
      long long v28 = v15;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        long long v29 = v10;
        long long v30 = v15;
        id v31 = v13;
        int v32 = [v27 count];
        [v27 componentsJoinedByString:@", "];
        id v33 = v94 = v17;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v136 = v32;
        id v13 = v31;
        uint64_t v15 = v30;
        id v10 = v29;
        *(_WORD *)&v136[4] = 2112;
        *(void *)&v136[6] = v33;
        _os_log_impl(&dword_1D21F2000, v28, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Generated %d wallpaper top suggestions with local identifiers %@", buf, 0x12u);

        id v17 = v94;
      }

      [v13 addObjectsFromArray:v27];
      self = v107;
      if (v27) {
        v107->_generatedContent |= 2uLL;
      }
    }
    if ([v113 isCancelledWithProgress:0.5]) {
      goto LABEL_60;
    }
    if ((self->_generationOptions & 4) != 0)
    {
      v92 = v13;
      __int16 v34 = [MEMORY[0x1E4F8E858] fetchSettlingEffectSuggestionsInPhotoLibrary:v14];
      v91 = [v113 childProgressReporterFromStart:0.61 toEnd:0.79];
      v93 = -[PHAWallpaperSuggestionGenerationWeeklyTask generateSuggestionsWithContentMode:suggestionController:progressReporter:shouldReload:](self, "generateSuggestionsWithContentMode:suggestionController:progressReporter:shouldReload:", 2, v12);
      int v35 = [MEMORY[0x1E4F8E858] fetchSettlingEffectSuggestionsInPhotoLibrary:v14];
      v36 = v34;
      v100 = v15;
      v102 = v14;
      v95 = v17;
      v108 = self;
      if ([v34 count]) {
        BOOL v37 = 0;
      }
      else {
        BOOL v37 = [v35 count] != 0;
      }
      id v38 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v120 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      id v39 = v35;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v120 objects:v134 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v121;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v121 != v42) {
              objc_enumerationMutation(v39);
            }
            v44 = [*(id *)(*((void *)&v120 + 1) + 8 * i) localIdentifier];
            [v38 addObject:v44];
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v120 objects:v134 count:16];
        }
        while (v41);
      }

      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v45 = v36;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v116 objects:v133 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v117;
        do
        {
          for (uint64_t j = 0; j != v47; ++j)
          {
            if (*(void *)v117 != v48) {
              objc_enumerationMutation(v45);
            }
            v50 = [*(id *)(*((void *)&v116 + 1) + 8 * j) localIdentifier];
            [v38 removeObject:v50];
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v116 objects:v133 count:16];
        }
        while (v47);
      }

      uint64_t v15 = v100;
      v51 = v100;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        int v52 = [v39 count];
        int v53 = [v45 count];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v136 = v52 - v53;
        *(_WORD *)&v136[4] = 2112;
        *(void *)&v136[6] = v38;
        _os_log_impl(&dword_1D21F2000, v51, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Updated %d wallpaper with settling effect with local identifiers %@", buf, 0x12u);
      }
      v110 |= v37;

      id v13 = v92;
      [v92 addObjectsFromArray:v93];
      self = v108;
      v14 = v102;
      uint64_t v12 = v103;
      if ([v38 count]) {
        v108->_generatedContent |= 4uLL;
      }

      id v17 = v95;
    }
    if ([v113 isCancelledWithProgress:0.6]) {
      goto LABEL_60;
    }
    unint64_t generationOptions = self->_generationOptions;
    if ((generationOptions & 8) != 0)
    {
      v54 = [v113 childProgressReporterFromStart:0.61 toEnd:0.69];
      v55 = v12;
      v56 = self;
      v57 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)self generateSuggestionsWithContentMode:3 suggestionController:v55 progressReporter:v54 shouldReload:0];
      v58 = v15;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        id v59 = v13;
        int v60 = [v57 count];
        [v57 componentsJoinedByString:@", "];
        v61 = v96 = v17;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v136 = v60;
        id v13 = v59;
        *(_WORD *)&v136[4] = 2112;
        *(void *)&v136[6] = v61;
        _os_log_impl(&dword_1D21F2000, v58, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Generated %d ambient suggestions with local identifiers %@", buf, 0x12u);

        id v17 = v96;
      }

      [v13 addObjectsFromArray:v57];
      if ([v57 count])
      {
        v56->_generatedContent |= 8uLL;
        v62 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v62 setBool:1 forKey:@"PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnoughForAmbient"];
      }
      else
      {
        v97 = v17;
        if (v104) {
          uint64_t v63 = 1;
        }
        else {
          uint64_t v63 = [v17 libraryIsEmpty];
        }
        v62 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v62 setBool:v63 forKey:@"PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnoughForAmbient"];
        id v17 = v97;
      }

      self = v56;
      uint64_t v12 = v103;
    }
    if ([v113 isCancelledWithProgress:0.7]) {
      goto LABEL_60;
    }
    if (_os_feature_enabled_impl() && (self->_generationOptions & 0x10) != 0)
    {
      v64 = [v113 childProgressReporterFromStart:0.71 toEnd:0.79];
      v109 = self;
      v65 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)self generateSuggestionsWithContentMode:4 suggestionController:v12 progressReporter:v64 shouldReload:0];
      v66 = v15;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        v67 = v10;
        v68 = v15;
        id v69 = v13;
        int v70 = [v65 count];
        [v65 componentsJoinedByString:@", "];
        v71 = v98 = v17;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v136 = v70;
        id v13 = v69;
        uint64_t v15 = v68;
        id v10 = v67;
        *(_WORD *)&v136[4] = 2112;
        *(void *)&v136[6] = v71;
        _os_log_impl(&dword_1D21F2000, v66, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Generated %d Me suggestions with local identifiers %@", buf, 0x12u);

        id v17 = v98;
      }

      [v13 addObjectsFromArray:v65];
      self = v109;
      if ([v65 count]) {
        v109->_generatedContent |= 0x10uLL;
      }
    }
    if ([v113 isCancelledWithProgress:0.8])
    {
LABEL_60:
      v112[2]();
      uint64_t v16 = 0;
    }
    else
    {
      v73 = self;
      if (v110)
      {
        v99 = v17;
        id v74 = v13;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionGenerationWeeklyTask] No preexisting Wallpaper Suggestions, attempting to run refresh session", buf, 2u);
        }
        v75 = [[PHAWallpaperSuggestionRefreshSession alloc] initWithGraphManager:v111];
        id v115 = 0;
        BOOL v76 = [(PHAWallpaperSuggestionRefreshSession *)v75 prepareWithError:&v115];
        id v77 = v115;
        if (v76)
        {
          v78 = [v113 childProgressReporterFromStart:0.9 toEnd:1.0];
          id v114 = v77;
          BOOL v79 = [(PHAWallpaperSuggestionRefreshSession *)v75 reloadWallpaperSuggestionsForUUIDs:0 progress:v78 error:&v114];
          id v80 = v114;

          [(PHAWallpaperSuggestionRefreshSession *)v75 cleanup];
          if (v79)
          {
            id v17 = v99;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Successfully ran refresh session", buf, 2u);
            }
          }
          else
          {
            id v17 = v99;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v136 = v80;
              _os_log_error_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionGenerationWeeklyTask] Failed to run refresh session: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v136 = v77;
            _os_log_fault_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_FAULT, "[PHAWallpaperSuggestionGenerationWeeklyTask] Failed to prepare refresh session: %@", buf, 0xCu);
          }
          id v80 = v77;
          id v17 = v99;
        }
      }
      else
      {
        id v74 = v13;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Wallpaper Suggestions preexisted this generation, assuming refresh session already ran today", buf, 2u);
        }
      }
      v81 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v81 setBool:v104 forKey:@"PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnough"];

      if (v124) {
        unsigned int v82 = v104;
      }
      else {
        unsigned int v82 = 0;
      }
      if (v82 == 1) {
        [(id)objc_opt_class() sendWallpaperGenerationCompletedBiomeEvent:v15];
      }
      v83 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)v73 suggestionOptionsDictionary];

      if (!v83)
      {
        v84 = [[PHAWallpaperSuggestionAnalyticsSender alloc] initWithGraphManager:v111 libraryAnalysisSummary:v17];
        [(PHAWallpaperSuggestionAnalyticsSender *)v84 sendWallpaperGenerationSummaryEventWithGeneratedSuggestionLocalIdentifiers:v74];
        if ((generationOptions & 8) != 0) {
          [(PHAWallpaperSuggestionAnalyticsSender *)v84 sendAmbientGenerationSummaryEventWithGeneratedSuggestionLocalIdentifiers:v74];
        }
      }
      if ([v113 isCancelledWithProgress:1.0])
      {
        v112[2]();
        uint64_t v16 = 0;
        id v13 = v74;
      }
      else
      {
        v85 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)v73 suggestionOptionsDictionary];
        v86 = [v85 objectForKeyedSubscript:*MEMORY[0x1E4F8B0A8]];
        char v87 = [v86 BOOLValue];

        if (v87)
        {
          uint64_t v129 = *MEMORY[0x1E4F8B110];
          id v130 = v74;
          id v13 = v74;
          v88 = (void *)MEMORY[0x1E4F1C9E8];
          v89 = &v130;
          v90 = &v129;
        }
        else
        {
          uint64_t v131 = *MEMORY[0x1E4F8B118];
          id v132 = v74;
          id v13 = v74;
          v88 = (void *)MEMORY[0x1E4F1C9E8];
          v89 = &v132;
          v90 = &v131;
        }
        uint64_t v16 = [v88 dictionaryWithObjects:v89 forKeys:v90 count:1];
      }
      uint64_t v12 = v103;
    }
  }

  return v16;
}

void __105__PHAWallpaperSuggestionGenerationWeeklyTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1D21F2000, v2, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionGenerationWeeklyTask] Wallpaper suggestions generation was canceled", v3, 2u);
  }
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
    **(void **)(a1 + 40) = (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAWallpaperSuggestionGenerationWeeklyTask timeoutFatal:]", "PHAWallpaperSuggestionGenerationWeeklyTask.m", 186, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAWallpaperSuggestionGenerationWeeklyTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v5 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)self generateSuggestionsWithGraphManager:a3 progressReporter:a4 error:a5];
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 photoLibrary];
  char v6 = [v5 isSystemPhotoLibrary];

  if (v6)
  {
    if ((self->_generationOptions & 0x12) != 0) {
      char v7 = [v4 isReady];
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    id v8 = [v4 workingContext];
    id v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)self name];
      uint64_t v11 = [v4 photoLibrary];
      uint64_t v12 = [v11 debugDescription];
      int v14 = 138412546;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, "%@ is running on a non system photo library. Library: %@", (uint8_t *)&v14, 0x16u);
    }
    char v7 = 0;
  }

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
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  if (self->_generationOptions == 4) {
    return [MEMORY[0x1E4F8A378] currentDeviceSupportsSettlingEffect];
  }
  else {
    return 1;
  }
}

- (unint64_t)version
{
  return 2;
}

- (double)period
{
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnough"];

  unint64_t generationOptions = self->_generationOptions;
  if ((generationOptions & 8) != 0)
  {
    char v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v7 = [v6 BOOLForKey:@"PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnoughForAmbient"];

    if (!v7) {
      return 21600.0;
    }
  }
  double result = 604800.0;
  if ((v4 & ((generationOptions & 4) == 0)) == 0) {
    return -2.0;
  }
  return result;
}

- (NSString)name
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t generationOptions = self->_generationOptions;
  if (generationOptions)
  {
    id v9 = [(id)objc_opt_class() generationOptionNameFromSingleOption:1];
    [v3 addObject:v9];

    unint64_t generationOptions = self->_generationOptions;
    if ((generationOptions & 2) == 0)
    {
LABEL_3:
      if ((generationOptions & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((generationOptions & 2) == 0)
  {
    goto LABEL_3;
  }
  id v10 = [(id)objc_opt_class() generationOptionNameFromSingleOption:2];
  [v3 addObject:v10];

  unint64_t generationOptions = self->_generationOptions;
  if ((generationOptions & 4) == 0)
  {
LABEL_4:
    if ((generationOptions & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v11 = [(id)objc_opt_class() generationOptionNameFromSingleOption:4];
  [v3 addObject:v11];

  unint64_t generationOptions = self->_generationOptions;
  if ((generationOptions & 8) == 0)
  {
LABEL_5:
    if ((generationOptions & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_12:
  uint64_t v12 = [(id)objc_opt_class() generationOptionNameFromSingleOption:8];
  [v3 addObject:v12];

  if ((self->_generationOptions & 0x10) != 0)
  {
LABEL_6:
    id v5 = [(id)objc_opt_class() generationOptionNameFromSingleOption:16];
    [v3 addObject:v5];
  }
LABEL_7:
  if ([v3 count])
  {
    char v6 = NSString;
    int v7 = [v3 componentsJoinedByString:@"|"];
    id v8 = [v6 stringWithFormat:@"PHAWallpaperWeeklyTask[%@]", v7];
  }
  else
  {
    id v8 = @"PHAWallpaperWeeklyTask";
  }

  return (NSString *)v8;
}

- (PHAWallpaperSuggestionGenerationWeeklyTask)initWithGenerationOptions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHAWallpaperSuggestionGenerationWeeklyTask;
  double result = [(PHAWallpaperSuggestionGenerationWeeklyTask *)&v5 init];
  if (result)
  {
    result->_unint64_t generationOptions = a3;
    result->_unint64_t generatedContent = 0;
  }
  return result;
}

+ (void)sendWallpaperGenerationCompletedBiomeEvent:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v5 = [v4 bundleIdentifier];

  char v6 = (void *)[objc_alloc(MEMORY[0x1E4F4FE08]) initWithContentIdentifier:@"com.apple.photoanalysisd.wallpaper-generation-completed" context:v5 osBuild:0 userInfo:0];
  int v7 = BiomeLibrary();
  id v8 = [v7 Discoverability];
  id v9 = [v8 Signals];
  id v10 = [v9 source];

  [v10 sendEvent:v6];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1D21F2000, v3, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionGenerationWeeklyTask] Sent wallpaper-generation-completed Biome event", v11, 2u);
  }
}

+ (id)generationOptionNameFromSingleOption:(unint64_t)a3
{
  id result = @"Shuffle";
  switch(a3)
  {
    case 1uLL:
      return result;
    case 2uLL:
      id result = @"Top";
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      id result = @"SettlingEffect";
      break;
    case 8uLL:
      id result = @"Ambient";
      break;
    default:
      if (a3 == 16) {
        id result = @"Me";
      }
      else {
LABEL_5:
      }
        id result = @"None";
      break;
  }
  return result;
}

@end