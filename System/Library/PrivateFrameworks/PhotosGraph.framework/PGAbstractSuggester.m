@interface PGAbstractSuggester
+ (NSIndexSet)suggestionSubtypes;
+ (NSIndexSet)suggestionTypes;
+ (id)_sharedLibraryPersonIdentifiersInLibrary:(id)a3 withScope:(id)a4;
+ (id)internalPredicateForProcessedAssetsWithMinimumSceneAnalysisVersion:(unint64_t)a3;
+ (id)noVideoPredicate;
+ (id)suggestedPersonLocalIdentifiersFromSharingSuggestionResults:(id)a3 forMomentNodes:(id)a4 containsUnverifiedPersons:(BOOL *)a5;
+ (id)suggesterWithSession:(id)a3;
- (BOOL)assetIsValidForSuggesting:(id)a3;
- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4;
- (BOOL)hasSuggestableScenesWithAsset:(id)a3;
- (BOOL)lastSuggestionWasColliding;
- (BOOL)processedAssetIsValidForSuggesting:(id)a3 allowGuestAsset:(BOOL)a4;
- (PGAbstractSuggester)initWithSession:(id)a3;
- (PGSuggestionSession)session;
- (double)userFeedbackScoreWithAsset:(id)a3;
- (id)defaultAssetFetchOptionsWithInternalPredicate:(id)a3;
- (id)reasonsForSuggestion:(id)a3;
- (id)sharingSuggestionResultsForMomentNodes:(id)a3 withWorkingContext:(id)a4;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (void)_prefetchSharedLibraryStateIfNeeded;
- (void)setLastSuggestionWasColliding:(BOOL)a3;
- (void)setSession:(id)a3;
@end

@implementation PGAbstractSuggester

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_sharedLibraryPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestableScenesHelper, 0);
}

- (void)setLastSuggestionWasColliding:(BOOL)a3
{
  self->_lastSuggestionWasColliding = a3;
}

- (BOOL)lastSuggestionWasColliding
{
  return self->_lastSuggestionWasColliding;
}

- (void)setSession:(id)a3
{
}

- (PGSuggestionSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (PGSuggestionSession *)WeakRetained;
}

- (id)reasonsForSuggestion:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)sharingSuggestionResultsForMomentNodes:(id)a3 withWorkingContext:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v30 = [[PGSharingManager alloc] initWithWorkingContext:v7];
    v8 = objc_opt_new();
    [v8 setSharingStream:1];
    v29 = v8;
    [v8 setIncludeUnverified:1];
    v9 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v35 + 1) + 8 * i) localIdentifier];
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v12);
    }

    v16 = [(PGSharingManager *)v30 suggestionResultsForAssetLocalIdentifiers:0 momentLocalIdentifiers:v9 options:v29];
    [(PGAbstractSuggester *)self _prefetchSharedLibraryStateIfNeeded];
    if (self->_isSharedLibraryEnabled)
    {
      id v27 = v7;
      id v28 = v6;
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v31 + 1) + 8 * j);
            v24 = objc_msgSend(v23, "person", v27, v28);
            v25 = [v24 localIdentifier];

            if (!v25 || ![(NSSet *)self->_sharedLibraryPersonIdentifiers containsObject:v25]) {
              [v17 addObject:v23];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v20);
      }

      id v7 = v27;
      id v6 = v28;
    }
    else
    {
      v17 = v16;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

- (void)_prefetchSharedLibraryStateIfNeeded
{
  if (!self->_prefetchedSharedLibraryState)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
    id v9 = [WeakRetained photoLibrary];

    v4 = [v9 librarySpecificFetchOptions];
    [v4 setFetchLimit:1];
    v5 = [MEMORY[0x1E4F39110] fetchActiveLibraryScopeWithOptions:v4];
    id v6 = [v5 firstObject];

    self->_isSharedLibraryEnabled = v6 != 0;
    if (v6)
    {
      id v7 = +[PGAbstractSuggester _sharedLibraryPersonIdentifiersInLibrary:v9 withScope:v6];
      sharedLibraryPersonIdentifiers = self->_sharedLibraryPersonIdentifiers;
      self->_sharedLibraryPersonIdentifiers = v7;
    }
    self->_prefetchedSharedLibraryState = 1;
  }
}

- (BOOL)hasSuggestableScenesWithAsset:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  suggestableScenesHelper = self->_suggestableScenesHelper;
  id v6 = [v4 curationModel];
  id v7 = [(CLSSceneConfidenceThresholdHelper *)suggestableScenesHelper confidenceThresholdBySceneIdentifierWithCurationModel:v6];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = objc_msgSend(v4, "sceneClassifications", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "extendedSceneIdentifier"));
        v14 = [v7 objectForKeyedSubscript:v13];

        if (v14)
        {
          [v12 confidence];
          double v16 = v15;
          [v14 doubleValue];
          if (v16 >= v17)
          {

            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v9;
}

- (id)defaultAssetFetchOptionsWithInternalPredicate:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PGAbstractSuggester *)self session];
  id v6 = [v5 photoLibrary];
  id v7 = [v6 librarySpecificFetchOptions];

  [v7 setIncludeGuestAssets:0];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 1);
  uint64_t v9 = (void *)v8;
  if (v4)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28BA0];
    v14[0] = v4;
    v14[1] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    uint64_t v12 = [v10 andPredicateWithSubpredicates:v11];
    [v7 setInternalPredicate:v12];
  }
  else
  {
    [v7 setInternalPredicate:v8];
  }
  [v7 setWantsIncrementalChangeDetails:0];

  return v7;
}

- (BOOL)processedAssetIsValidForSuggesting:(id)a3 allowGuestAsset:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 clsIsUtility] & 1) != 0
    || ([(PGAbstractSuggester *)self userFeedbackScoreWithAsset:v6],
        v7 < *MEMORY[0x1E4F39848]))
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = 0;
    if (([v6 clsAvoidIfPossibleAsKeyItemForMemories:0 allowGuestAsset:v4] & 1) == 0)
    {
      uint64_t v10 = [v6 clsFaceInformationSummary];
      if ([v10 numberOfFaces]) {
        BOOL v8 = [v10 numberOfGoodFacesOfVerifiedPersons] != 0;
      }
      else {
        BOOL v8 = 1;
      }
    }
  }

  return v8;
}

- (double)userFeedbackScoreWithAsset:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 uuid];
  id v6 = [v4 clsPersonAndPetLocalIdentifiers];
  uint64_t v7 = [v6 count];
  if (v7)
  {
    long long v21 = self;
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [MEMORY[0x1E4F391F0] uuidFromLocalIdentifier:*(void *)(*((void *)&v22 + 1) + 8 * v13)];
          if (v14) {
            [v8 addObject:v14];
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    self = v21;
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  double v16 = [WeakRetained curationContext];
  double v17 = [v16 userFeedbackCalculator];
  [v17 scoreForKeyAssetUUID:v5 personsUUIDsInKeyAsset:v8 memoryFeatures:0];
  double v19 = v18;

  return v19;
}

- (BOOL)assetIsValidForSuggesting:(id)a3
{
  id v4 = a3;
  v5 = [v4 sceneAnalysisProperties];
  int v6 = [v5 sceneAnalysisVersion];
  int v7 = (__int16)*MEMORY[0x1E4F8AE00];

  BOOL v9 = v6 > v7
    && ([v4 faceAdjustmentVersion], BOOL v8 = objc_claimAutoreleasedReturnValue(),
                                                   v8,
                                                   v8)
    && [(PGAbstractSuggester *)self processedAssetIsValidForSuggesting:v4 allowGuestAsset:0];

  return v9;
}

- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4
{
  return 0;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (PGAbstractSuggester)initWithSession:(id)a3
{
  id v4 = a3;
  v5 = [(PGAbstractSuggester *)self init];
  int v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_session, v4);
    v6->_lastSuggestionWasColliding = 0;
    id v7 = objc_alloc(MEMORY[0x1E4F8E788]);
    BOOL v8 = +[PGGraphSceneNode suggestableSceneNames];
    BOOL v9 = [v8 allObjects];
    uint64_t v10 = [v7 initWithSceneNames:v9 thresholdType:1];
    suggestableScenesHelper = v6->_suggestableScenesHelper;
    v6->_suggestableScenesHelper = (CLSSceneConfidenceThresholdHelper *)v10;

    *(_WORD *)&v6->_prefetchedSharedLibraryState = 0;
    sharedLibraryPersonIdentifiers = v6->_sharedLibraryPersonIdentifiers;
    v6->_sharedLibraryPersonIdentifiers = 0;
  }
  return v6;
}

+ (id)suggestedPersonLocalIdentifiersFromSharingSuggestionResults:(id)a3 forMomentNodes:(id)a4 containsUnverifiedPersons:(BOOL *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    id v28 = v8;
    v29 = a5;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      unint64_t v12 = 0;
      uint64_t v13 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v9);
          }
          v12 += objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "numberOfAssetsWithPersons", v28, v29);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v11);
    }
    else
    {
      unint64_t v12 = 0;
    }

    double v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      char v19 = 0;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v16);
          }
          long long v22 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          long long v23 = objc_msgSend(v22, "person", v28, v29, (void)v30);
          if ([v23 isVerified]
            && ([v22 sourceWeight], v24 >= 1.0)
            && (v12 < 0xA || ([v22 weight], v25 > 1.0)))
          {
            v26 = [v23 localIdentifier];
            [v15 addObject:v26];
          }
          else
          {
            char v19 = 1;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v18);
    }
    else
    {
      char v19 = 0;
    }

    id v8 = v28;
    BOOL *v29 = v19 & 1;
  }
  else
  {
    double v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

+ (id)_sharedLibraryPersonIdentifiersInLibrary:(id)a3 withScope:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v38 = v5;
  long long v36 = [v5 librarySpecificFetchOptions];
  long long v37 = v6;
  objc_msgSend(MEMORY[0x1E4F39130], "fetchLibraryScopeRulesForLibraryScope:options:", v6);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v52;
    uint64_t v39 = *(void *)v52;
    do
    {
      uint64_t v11 = 0;
      uint64_t v41 = v9;
      do
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(obj);
        }
        unint64_t v12 = *(void **)(*((void *)&v51 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x1D25FED50]();
        v14 = [v12 personCondition];
        double v15 = v14;
        if (v14 && [v14 criteria] == 1)
        {
          id v16 = [v15 personUUIDs];
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v56 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v48;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v48 != v19) {
                  objc_enumerationMutation(v16);
                }
                long long v21 = [MEMORY[0x1E4F391F0] localIdentifierWithUUID:*(void *)(*((void *)&v47 + 1) + 8 * i)];
                [v7 addObject:v21];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v47 objects:v56 count:16];
            }
            while (v18);
          }

          uint64_t v10 = v39;
          uint64_t v9 = v41;
        }

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v9);
  }

  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v22 = [MEMORY[0x1E4F392E8] fetchParticipantsInShare:v37 options:v36];
  long long v23 = [v38 librarySpecificFetchOptions];
  [v23 setFetchLimit:1];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v24 = v22;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        long long v30 = (void *)MEMORY[0x1D25FED50]();
        long long v31 = [MEMORY[0x1E4F391F0] fetchPersonForShareParticipant:v29 options:v23];
        long long v32 = [v31 firstObject];

        if (v32)
        {
          long long v33 = [v32 localIdentifier];
          [v42 addObject:v33];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v26);
  }

  long long v34 = [v42 setByAddingObjectsFromSet:v7];

  return v34;
}

+ (id)internalPredicateForProcessedAssetsWithMinimumSceneAnalysisVersion:(unint64_t)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"faceAdjustmentVersion");
  v12[0] = v5;
  id v6 = (void *)MEMORY[0x1E4F8A950];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v8 = [v6 predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToSceneVersion:v7];
  v12[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v10 = [v4 andPredicateWithSubpredicates:v9];

  return v10;
}

+ (id)noVideoPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"playbackStyle != %d && playbackStyle != %d", 4, 5);
}

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSet];
}

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSet];
}

+ (id)suggesterWithSession:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithSession:v4];

  return v5;
}

@end