@interface PGSuggestionSession
+ (id)availableSuggestionTypeInfosWithProfile:(unsigned __int8)a3;
+ (id)suggesterClassesWithProfile:(unsigned __int8)a3;
+ (id)suggestionSubtypesWithProfile:(unsigned __int8)a3;
+ (id)suggestionTypesWithProfile:(unsigned __int8)a3;
- (BOOL)_suggestionIsColliding:(id)a3 relaxCollisionRules:(BOOL)a4;
- (BOOL)suggesterClass:(Class)a3 supportsOptions:(id)a4;
- (BOOL)suggestion:(id)a3 collidesWithMemories:(id)a4;
- (BOOL)suggestion:(id)a3 isEqualToSuggestion:(id)a4;
- (BOOL)supportsRelaxedCollisionRulesForSuggester:(id)a3;
- (CLSCurationContext)curationContext;
- (NSArray)collidableMemories;
- (NSArray)deniedSuggestions;
- (NSArray)existingSuggestions;
- (NSSet)forbiddenAssetUUIDs;
- (OS_os_log)loggingConnection;
- (PGManagerWorkingContext)workingContext;
- (PGSuggestionNotificationProfile)notificationProfile;
- (PGSuggestionSession)initWithProfile:(unsigned __int8)a3 workingContext:(id)a4;
- (PHPhotoLibrary)photoLibrary;
- (double)topTierAestheticScore;
- (id)activeSuggestersWithOptions:(id)a3;
- (id)anySuggestionCollidingWithSuggestion:(id)a3 inSuggestions:(id)a4 relaxCollisionRules:(BOOL)a5 collisionReason:(unint64_t *)a6;
- (id)bestSuggestionBetween:(id)a3 and:(id)a4;
- (id)coordinatedSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)electedSuggestionsFromSuggestions:(id)a3 options:(id)a4 progress:(id)a5;
- (id)existingSuggestionsWithState:(unsigned __int16)a3 count:(unint64_t)a4;
- (id)infoWithSuggestion:(id)a3;
- (id)infosWithSuggestions:(id)a3;
- (id)suggesterClasses;
- (id)suggestionsByCollisionReasonCollidingWithSuggestion:(id)a3 inSuggestions:(id)a4 relaxCollisionRules:(BOOL)a5;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)uncoordinatedSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (unint64_t)deniedSuggestion:(id)a3 collidesWithSuggestion:(id)a4;
- (unint64_t)outstanderSuggestion:(id)a3 collidesWithSuggestion:(id)a4 relaxCollisionRules:(BOOL)a5;
- (unint64_t)reasonForSuggestion:(id)a3 collidingWithSuggestion:(id)a4 relaxCollisionRules:(BOOL)a5;
- (unint64_t)singleAssetSuggestion:(id)a3 collidesWithSuggestion:(id)a4;
- (unsigned)profile;
- (void)setCollidableMemories:(id)a3;
- (void)setDeniedSuggestions:(id)a3;
- (void)setExistingSuggestions:(id)a3;
- (void)setForbiddenAssetUUIDs:(id)a3;
@end

@implementation PGSuggestionSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forbiddenAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_deniedSuggestions, 0);
  objc_storeStrong((id *)&self->_notificationProfile, 0);
  objc_storeStrong((id *)&self->_collidableMemories, 0);
  objc_storeStrong((id *)&self->_existingSuggestions, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
  objc_storeStrong((id *)&self->_universalToday, 0);
}

- (void)setForbiddenAssetUUIDs:(id)a3
{
}

- (NSSet)forbiddenAssetUUIDs
{
  return self->_forbiddenAssetUUIDs;
}

- (void)setDeniedSuggestions:(id)a3
{
}

- (NSArray)deniedSuggestions
{
  return self->_deniedSuggestions;
}

- (PGSuggestionNotificationProfile)notificationProfile
{
  return self->_notificationProfile;
}

- (void)setCollidableMemories:(id)a3
{
}

- (NSArray)collidableMemories
{
  return self->_collidableMemories;
}

- (NSArray)existingSuggestions
{
  return self->_existingSuggestions;
}

- (CLSCurationContext)curationContext
{
  return self->_curationContext;
}

- (PGManagerWorkingContext)workingContext
{
  return self->_workingContext;
}

- (unsigned)profile
{
  return self->_profile;
}

- (id)existingSuggestionsWithState:(unsigned __int16)a3 count:(unint64_t)a4
{
  int v5 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(NSArray *)self->_existingSuggestions count];
  if (v7 >= a4) {
    unint64_t v8 = a4;
  }
  else {
    unint64_t v8 = v7;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v10 = self->_existingSuggestions;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
LABEL_6:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
      if (objc_msgSend(v15, "state", (void)v17) == v5)
      {
        [v9 addObject:v15];
        if ([v9 count] >= v8) {
          break;
        }
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  return v9;
}

- (id)infosWithSuggestions:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v4;
  uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v32;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v31 + 1) + 8 * v5);
        id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        unint64_t v7 = [(NSArray *)self->_existingSuggestions reverseObjectEnumerator];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
        uint64_t v25 = v5;
        if (!v8)
        {
          v10 = 0;
          goto LABEL_24;
        }
        uint64_t v9 = v8;
        v10 = 0;
        uint64_t v11 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v28 != v11) {
              objc_enumerationMutation(v7);
            }
            uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            if ([(PGSuggestionSession *)self suggestion:v6 isEqualToSuggestion:v13])
            {
              [(PGSuggestionSession *)self infoWithSuggestion:v13];
              uint64_t v14 = v10;
              v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              unint64_t v15 = [(PGSuggestionSession *)self reasonForSuggestion:v6 collidingWithSuggestion:v13 relaxCollisionRules:0];
              if (!v15) {
                continue;
              }
              v16 = @"Unknown";
              if (v15 <= 3) {
                v16 = off_1E68EA2D0[v15];
              }
              uint64_t v14 = v16;
              id v17 = [v26 objectForKeyedSubscript:v14];
              if (!v17)
              {
                id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [v26 setObject:v17 forKeyedSubscript:v14];
              }
              long long v18 = [(PGSuggestionSession *)self infoWithSuggestion:v13];
              [v17 addObject:v18];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v9);
LABEL_24:

        long long v19 = [(PGSuggestionSession *)self infoWithSuggestion:v6];
        [v19 setObject:v10 forKeyedSubscript:@"identicalExistingSuggestionInfo"];
        [v19 setObject:v26 forKeyedSubscript:@"suggestionsByCollisionReason"];
        [v23 addObject:v19];

        uint64_t v5 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v24);
  }

  return v23;
}

- (id)infoWithSuggestion:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v22[0] = @"type";
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v3, "type"));
  v22[1] = @"subtype";
  v23[0] = v4;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v3, "subtype"));
  v23[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  unint64_t v7 = (void *)[v6 mutableCopy];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isInvalid"));
    [v7 setObject:v8 forKeyedSubscript:@"isInvalid"];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v3 uuid];
    [v7 setObject:v9 forKeyedSubscript:@"uuid"];
  }
  v10 = [v3 universalStartDate];
  [v7 setObject:v10 forKeyedSubscript:@"universalStartDate"];

  uint64_t v11 = [v3 universalEndDate];
  [v7 setObject:v11 forKeyedSubscript:@"universalEndDate"];

  uint64_t v12 = [v3 keyAssets];
  uint64_t v13 = [v12 firstObject];

  if (v13)
  {
    uint64_t v14 = [v13 uuid];
    [v7 setObject:v14 forKeyedSubscript:@"keyAssetUUID"];

    unint64_t v15 = [v13 creationDate];
    [v7 setObject:v15 forKeyedSubscript:@"keyAssetCreationDate"];
  }
  v16 = [v3 creationDate];
  [v7 setObject:v16 forKeyedSubscript:@"creationDate"];

  id v17 = [v3 title];
  [v7 setObject:v17 forKeyedSubscript:@"title"];

  long long v18 = [v3 subtitle];
  [v7 setObject:v18 forKeyedSubscript:@"subtitle"];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v19 = [v3 reasons];
    if (v19)
    {
      long long v20 = (void *)v19;
      [v7 setObject:v19 forKeyedSubscript:@"reasons"];
    }
  }

  return v7;
}

- (BOOL)suggestion:(id)a3 isEqualToSuggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v51 = [v6 type];
  int v50 = [v7 type];
  int v49 = [v6 subtype];
  int v48 = [v7 subtype];
  uint64_t v8 = [v6 keyAssets];
  uint64_t v9 = (void *)[v8 count];
  if (!v9)
  {
    id v4 = [v7 keyAssets];
    if (![v4 count])
    {
      char v47 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v10 = [v6 keyAssets];
  uint64_t v11 = [v7 keyAssets];
  char v47 = [v10 isEqualToArray:v11];

  if (!v9) {
    goto LABEL_6;
  }
LABEL_7:

  uint64_t v12 = [v6 representativeAssets];
  uint64_t v13 = (void *)[v12 count];
  if (!v13)
  {
    uint64_t v9 = [v7 representativeAssets];
    if (![v9 count])
    {
      char v16 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  uint64_t v14 = [v6 representativeAssets];
  unint64_t v15 = [v7 representativeAssets];
  char v16 = [v14 isEqualToArray:v15];

  if (!v13) {
    goto LABEL_12;
  }
LABEL_13:

  id v17 = [v6 features];
  uint64_t v18 = [v17 count];
  if (v18
    || ([v7 features], uint64_t v13 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v13, "count")))
  {
    uint64_t v19 = [v6 features];
    long long v20 = [v7 features];
    char v21 = [v19 isEqualToSet:v20];

    if (v18) {
      goto LABEL_19;
    }
  }
  else
  {
    char v21 = 1;
  }

LABEL_19:
  uint64_t v22 = [v6 suggestedPersonLocalIdentifiers];
  if ([v22 count])
  {
    id v23 = [v7 suggestedPersonLocalIdentifiers];
    if ([v23 count])
    {
      uint64_t v24 = [v6 suggestedPersonLocalIdentifiers];
      uint64_t v25 = [v7 suggestedPersonLocalIdentifiers];
      char v26 = [v24 isEqualToArray:v25];
    }
    else
    {
      char v26 = 1;
    }
  }
  else
  {
    char v26 = 1;
  }

  long long v27 = [v6 title];
  long long v28 = [v7 title];
  if (v27 == v28)
  {
    char v31 = 1;
  }
  else
  {
    long long v29 = [v6 title];
    long long v30 = [v7 title];
    char v31 = [v29 isEqualToString:v30];
  }
  long long v32 = [v6 subtitle];
  long long v33 = [v7 subtitle];
  if (v32 == v33)
  {
    char v41 = 1;
  }
  else
  {
    long long v34 = [v6 subtitle];
    [v7 subtitle];
    id v46 = v6;
    id v35 = v7;
    char v36 = v31;
    char v37 = v26;
    char v38 = v21;
    v40 = char v39 = v16;
    char v41 = [v34 isEqualToString:v40];

    char v16 = v39;
    char v21 = v38;
    char v26 = v37;
    char v31 = v36;
    id v7 = v35;
    id v6 = v46;
  }
  BOOL v42 = v51 == v50 && v49 == v48;
  char v43 = v47;
  if (!v42) {
    char v43 = 0;
  }
  char v44 = v43 & v16 & v21 & v26 & v31 & v41;

  return v44;
}

- (double)topTierAestheticScore
{
  double result = self->_topTierAestheticScore;
  if (result == 2.22507386e-308)
  {
    id v4 = [(PGSuggestionSession *)self workingContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__PGSuggestionSession_topTierAestheticScore__block_invoke;
    v9[3] = &unk_1E68F0848;
    v9[4] = self;
    [v4 performSynchronousConcurrentGraphReadUsingBlock:v9];

    if (self->_topTierAestheticScore == 2.22507386e-308)
    {
      uint64_t v5 = [(PGSuggestionSession *)self loggingConnection];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_1D1805000, v5, OS_LOG_TYPE_DEFAULT, "topTierAestheticScore could not be determined from the graph, computing it from the photoLibrary.", v8, 2u);
      }

      id v6 = [(PGSuggestionSession *)self photoLibrary];
      +[PGGraphBuilder topTierAestheticScoreForRatio:v6 inPhotoLibrary:0.01];
      self->_topTierAestheticScore = v7;
    }
    return self->_topTierAestheticScore;
  }
  return result;
}

void __44__PGSuggestionSession_topTierAestheticScore__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 graph];
  id v4 = [v3 infoNode];
  [v4 topTierAestheticScore];
  double v6 = v5;

  if (v6 > 0.0) {
    *(double *)(*(void *)(a1 + 32) + 88) = v6;
  }
}

- (BOOL)_suggestionIsColliding:(id)a3 relaxCollisionRules:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v23 = 0;
  double v7 = [(PGSuggestionSession *)self anySuggestionCollidingWithSuggestion:v6 inSuggestions:self->_existingSuggestions relaxCollisionRules:v4 collisionReason:&v23];
  loggingConnection = self->_loggingConnection;
  BOOL v9 = os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      unint64_t v10 = v23;
      uint64_t v11 = loggingConnection;
      if (v10 > 3) {
        uint64_t v12 = @"Unknown";
      }
      else {
        uint64_t v12 = off_1E68EA2D0[v10];
      }
      id v17 = v12;
      *(_DWORD *)buf = 138412547;
      uint64_t v25 = v17;
      __int16 v26 = 2113;
      long long v27 = v7;
      uint64_t v18 = "Suggestion did collide (%@) with existing suggestion %{private}@";
      uint64_t v19 = v11;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
      _os_log_impl(&dword_1D1805000, v19, v20, v18, buf, 0x16u);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "Suggestion didn't collide with any existing suggestion", buf, 2u);
  }
  double v7 = [(PGSuggestionSession *)self anySuggestionCollidingWithSuggestion:v6 inSuggestions:self->_deniedSuggestions relaxCollisionRules:0 collisionReason:&v23];
  uint64_t v13 = self->_loggingConnection;
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v14)
    {
      unint64_t v15 = v23;
      uint64_t v11 = v13;
      if (v15 > 3) {
        char v16 = @"Unknown";
      }
      else {
        char v16 = off_1E68EA2D0[v15];
      }
      id v17 = v16;
      *(_DWORD *)buf = 138412547;
      uint64_t v25 = v17;
      __int16 v26 = 2113;
      long long v27 = v7;
      uint64_t v18 = "Suggestion did collide (%@) with denied suggestion %{private}@";
      uint64_t v19 = v11;
      os_log_type_t v20 = OS_LOG_TYPE_INFO;
      goto LABEL_18;
    }
LABEL_19:

    BOOL v21 = 1;
    goto LABEL_20;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "Suggestion didn't collide with any denied suggestion", buf, 2u);
  }
  BOOL v21 = 0;
LABEL_20:

  return v21;
}

- (id)uncoordinatedSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v66 = a4;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x2020000000;
  char v97 = 0;
  uint64_t v90 = 0;
  v91 = (double *)&v90;
  uint64_t v92 = 0x2020000000;
  uint64_t v93 = 0;
  v77 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v66);
  if (v77)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v91[3] >= 0.01)
    {
      v91[3] = Current;
      LOBYTE(info.numer) = 0;
      v77[2](v77, &info, 0.0);
      char v7 = *((unsigned char *)v95 + 24) | LOBYTE(info.numer);
      *((unsigned char *)v95 + 24) = v7;
      if (v7)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v100 = 774;
          *(_WORD *)&v100[4] = 2080;
          *(void *)&v100[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/PGSuggestionSession.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v68 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_94;
      }
    }
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "Starting uncoordinated suggestion generation", buf, 2u);
    loggingConnection = self->_loggingConnection;
  }
  BOOL v9 = loggingConnection;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  uint64_t v11 = v9;
  uint64_t v12 = v11;
  os_signpost_id_t spid = v10;
  unint64_t v65 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "UncoordinatedSuggestionGeneration", "", buf, 2u);
  }
  v67 = v12;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v63 = mach_absolute_time();
  uint64_t v13 = (void *)MEMORY[0x1E4F76C68];
  BOOL v14 = [v5 localToday];
  unint64_t v15 = [v13 universalDateFromLocalDate:v14];
  universalToday = self->_universalToday;
  self->_universalToday = v15;

  v70 = [(PGSuggestionSession *)self activeSuggestersWithOptions:v5];
  unint64_t v73 = [v70 count];
  uint64_t v17 = [v5 maximumNumberOfSuggestions];
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v71 = v18;
  id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v72 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v69 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  unint64_t v75 = 0;
  id v68 = (id)MEMORY[0x1E4F1CBF0];
  while ([v74 count] < v71 && objc_msgSend(v72, "count") < v73)
  {
    context = (void *)MEMORY[0x1D25FED50]();
    if (v77)
    {
      double v19 = CFAbsoluteTimeGetCurrent();
      if (v19 - v91[3] >= 0.01)
      {
        v91[3] = v19;
        LOBYTE(v88.numer) = 0;
        v77[2](v77, &v88, 0.5);
        char v20 = *((unsigned char *)v95 + 24) | LOBYTE(v88.numer);
        *((unsigned char *)v95 + 24) = v20;
        if (v20)
        {
          BOOL v21 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v100 = 792;
            *(_WORD *)&v100[4] = 2080;
            *(void *)&v100[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Suggestions/PGSuggestionSession.m";
            _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          int v22 = 1;
          goto LABEL_76;
        }
      }
    }
    unint64_t v23 = [v70 objectAtIndexedSubscript:v75];
    uint64_t v24 = self->_loggingConnection;
    os_signpost_id_t v25 = os_signpost_id_generate((os_log_t)v24);
    __int16 v26 = v24;
    long long v27 = v26;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "NextSuggestion", "", buf, 2u);
    }
    uint64_t v28 = v27;

    mach_timebase_info v88 = 0;
    mach_timebase_info(&v88);
    uint64_t v29 = mach_absolute_time();
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __68__PGSuggestionSession_uncoordinatedSuggestionsWithOptions_progress___block_invoke;
    v83[3] = &unk_1E68F03F8;
    v84 = v77;
    v85 = &v90;
    uint64_t v87 = 0x3F847AE147AE147BLL;
    v86 = &v94;
    long long v30 = [v23 nextSuggestionWithProgress:v83];
    if (*((unsigned char *)v95 + 24))
    {
      int v22 = 1;
      char v31 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v100 = 800;
        *(_WORD *)&v100[4] = 2080;
        *(void *)&v100[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/PGSuggestionSession.m";
        _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_74;
    }
    long long v32 = self->_loggingConnection;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412547;
      *(void *)v100 = v23;
      *(_WORD *)&v100[8] = 2113;
      *(void *)&v100[10] = v30;
      _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_DEFAULT, "Suggester %@ returned suggestion %{private}@", buf, 0x16u);
    }
    uint64_t v33 = mach_absolute_time();
    uint32_t numer = v88.numer;
    uint32_t denom = v88.denom;
    char v36 = v28;
    char v37 = v36;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v37, OS_SIGNPOST_INTERVAL_END, v25, "NextSuggestion", "", buf, 2u);
    }

    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v100 = "NextSuggestion";
      *(_WORD *)&v100[8] = 2048;
      *(double *)&v100[10] = (float)((float)((float)((float)(v33 - v29) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    [v23 setLastSuggestionWasColliding:0];
    char v38 = self;
    if (v30)
    {
      if (([v5 ignoreCollisionsWithExistingSuggestions] & 1) == 0
        && -[PGSuggestionSession _suggestionIsColliding:relaxCollisionRules:](self, "_suggestionIsColliding:relaxCollisionRules:", v30, [v69 containsIndex:v75]))
      {
        uint64_t v39 = 1;
        id v40 = v30;
LABEL_64:
        long long v30 = 0;
        goto LABEL_70;
      }
      if ([v5 ignoreCollisionsWithSameBatchSuggestions])
      {
        uint64_t v39 = 0;
      }
      else
      {
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v40 = v74;
        uint64_t v42 = [v40 countByEnumeratingWithState:&v79 objects:v98 count:16];
        if (v42)
        {
          id v62 = v5;
          uint64_t v43 = *(void *)v80;
          while (2)
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v80 != v43) {
                objc_enumerationMutation(v40);
              }
              uint64_t v45 = *(void *)(*((void *)&v79 + 1) + 8 * i);
              unint64_t v46 = [(PGSuggestionSession *)v38 reasonForSuggestion:v30 collidingWithSuggestion:v45 relaxCollisionRules:0];
              char v47 = v38->_loggingConnection;
              if (v46)
              {
                int v48 = v47;
                id v5 = v62;
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  int v49 = @"Unknown";
                  if (v46 <= 3) {
                    int v49 = off_1E68EA2D0[v46];
                  }
                  int v50 = v49;
                  *(_DWORD *)buf = 138412547;
                  *(void *)v100 = v50;
                  *(_WORD *)&v100[8] = 2113;
                  *(void *)&v100[10] = v45;
                  _os_log_impl(&dword_1D1805000, v48, OS_LOG_TYPE_DEFAULT, "Suggestion did collide (%@) with same batch suggestion %{private}@", buf, 0x16u);
                }
                uint64_t v39 = 0;
                goto LABEL_64;
              }
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                *(void *)v100 = v45;
                _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_DEFAULT, "Suggestion didn't collide with same batch suggestion %{private}@", buf, 0xCu);
              }
              char v38 = self;
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v79 objects:v98 count:16];
            if (v42) {
              continue;
            }
            break;
          }
          uint64_t v39 = 0;
          id v5 = v62;
        }
        else
        {
          uint64_t v39 = 0;
        }
LABEL_70:
      }
      [v23 setLastSuggestionWasColliding:v39];
      if (!v30)
      {
        int v22 = 0;
        goto LABEL_75;
      }
      [v74 addObject:v30];
      goto LABEL_73;
    }
    if (-[PGSuggestionSession supportsRelaxedCollisionRulesForSuggester:](self, "supportsRelaxedCollisionRulesForSuggester:", v23)&& ([v69 containsIndex:v75] & 1) == 0)
    {
      int v51 = self->_loggingConnection;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v100 = v23;
        _os_log_impl(&dword_1D1805000, v51, OS_LOG_TYPE_DEFAULT, "No more suggestions for suggester %@, trying with relaxed collision rules", buf, 0xCu);
      }
      [v69 addIndex:v75];
      [v23 reset];
    }
    else
    {
      char v41 = self->_loggingConnection;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v100 = v23;
        _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_DEFAULT, "No more suggestions for suggester %@", buf, 0xCu);
      }
      [v72 addIndex:v75];
    }
    long long v30 = 0;
LABEL_73:
    int v22 = 0;
    unint64_t v75 = (v75 + 1) % v73;
LABEL_74:

LABEL_75:
LABEL_76:
    if (v22) {
      goto LABEL_93;
    }
  }
  uint64_t v52 = mach_absolute_time();
  uint32_t v53 = info.numer;
  uint32_t v54 = info.denom;
  v55 = v67;
  v56 = v55;
  if (v65 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v56, OS_SIGNPOST_INTERVAL_END, spid, "UncoordinatedSuggestionGeneration", "", buf, 2u);
  }

  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v100 = "UncoordinatedSuggestionGeneration";
    *(_WORD *)&v100[8] = 2048;
    *(double *)&v100[10] = (float)((float)((float)((float)(v52 - v63) * (float)v53) / (float)v54) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v56, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v57 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v58 = [v74 count];
    *(_DWORD *)buf = 134218242;
    *(void *)v100 = v58;
    *(_WORD *)&v100[8] = 2112;
    *(void *)&v100[10] = v74;
    _os_log_impl(&dword_1D1805000, (os_log_t)v57, OS_LOG_TYPE_DEFAULT, "Generated %lu suggestions:\n%@", buf, 0x16u);
  }

  if (v77
    && (double v59 = CFAbsoluteTimeGetCurrent(), v59 - v91[3] >= 0.01)
    && (v91[3] = v59,
        LOBYTE(v88.numer) = 0,
        v77[2](v77, &v88, 1.0),
        char v60 = *((unsigned char *)v95 + 24) | LOBYTE(v88.numer),
        (*((unsigned char *)v95 + 24) = v60) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v100 = 871;
      *(_WORD *)&v100[4] = 2080;
      *(void *)&v100[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/PGSuggestionSession.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v68 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v68 = v74;
  }
LABEL_93:

LABEL_94:
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v94, 8);

  return v68;
}

void __68__PGSuggestionSession_uncoordinatedSuggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)coordinatedSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v52 = a4;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2020000000;
  char v85 = 0;
  uint64_t v78 = 0;
  long long v79 = (double *)&v78;
  uint64_t v80 = 0x2020000000;
  uint64_t v81 = 0;
  id v62 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v52);
  if (v62)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v79[3] >= 0.01)
    {
      v79[3] = Current;
      LOBYTE(info.numer) = 0;
      v62[2](v62, &info, 0.0);
      char v6 = *((unsigned char *)v83 + 24) | LOBYTE(info.numer);
      *((unsigned char *)v83 + 24) = v6;
      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = 656;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/PGSuggestionSession.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v54 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_72;
      }
    }
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "Starting coordinated suggestion generation", buf, 2u);
    loggingConnection = self->_loggingConnection;
  }
  uint64_t v8 = loggingConnection;
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  os_signpost_id_t v10 = v8;
  uint64_t v11 = v10;
  os_signpost_id_t spid = v9;
  unint64_t v51 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CoordinatedSuggestionGeneration", "", buf, 2u);
  }
  uint32_t v53 = v11;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v49 = mach_absolute_time();
  uint64_t v12 = (void *)MEMORY[0x1E4F76C68];
  uint64_t v13 = [v57 localToday];
  BOOL v14 = [v12 universalDateFromLocalDate:v13];
  universalToday = self->_universalToday;
  self->_universalToday = v14;

  uint64_t v58 = [(PGSuggestionSession *)self activeSuggestersWithOptions:v57];
  unint64_t v61 = [v58 count];
  id v63 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v56 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v61];
  id v55 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  unint64_t v16 = 0;
  id v54 = (id)MEMORY[0x1E4F1CBF0];
  while ([v63 count] < v61)
  {
    uint64_t v17 = (void *)MEMORY[0x1D25FED50]();
    if (v62
      && (double v18 = CFAbsoluteTimeGetCurrent(), v18 - v79[3] >= 0.01)
      && (v79[3] = v18,
          LOBYTE(v76.numer) = 0,
          v62[2](v62, &v76, 0.5),
          char v19 = *((unsigned char *)v83 + 24) | LOBYTE(v76.numer),
          (*((unsigned char *)v83 + 24) = v19) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 673;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/PGSuggestionSession.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if ([v63 containsIndex:v16]) {
        goto LABEL_53;
      }
      char v20 = [v58 objectAtIndexedSubscript:v16];
      BOOL v21 = self->_loggingConnection;
      os_signpost_id_t v22 = os_signpost_id_generate((os_log_t)v21);
      unint64_t v23 = v21;
      uint64_t v24 = v23;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "NextSuggestion", "", buf, 2u);
      }

      mach_timebase_info v76 = 0;
      mach_timebase_info(&v76);
      uint64_t v25 = mach_absolute_time();
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __66__PGSuggestionSession_coordinatedSuggestionsWithOptions_progress___block_invoke;
      v71[3] = &unk_1E68F03F8;
      id v72 = v62;
      unint64_t v73 = &v78;
      uint64_t v75 = 0x3F847AE147AE147BLL;
      id v74 = &v82;
      __int16 v26 = [v20 nextSuggestionWithProgress:v71];
      int v59 = *((unsigned __int8 *)v83 + 24);
      if (*((unsigned char *)v83 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = 683;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/PGSuggestionSession.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      else
      {
        long long v27 = self->_loggingConnection;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412547;
          *(void *)&uint8_t buf[4] = v20;
          *(_WORD *)&buf[12] = 2113;
          *(void *)&buf[14] = v26;
          _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_DEFAULT, "Suggester %@ returned suggestion %{private}@", buf, 0x16u);
        }
        uint64_t v28 = mach_absolute_time();
        uint32_t numer = v76.numer;
        uint32_t denom = v76.denom;
        char v31 = v24;
        long long v32 = v31;
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v32, OS_SIGNPOST_INTERVAL_END, v22, "NextSuggestion", "", buf, 2u);
        }

        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "NextSuggestion";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = (float)((float)((float)((float)(v28 - v25) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        [v20 setLastSuggestionWasColliding:0];
        if (v26)
        {
          if (([v57 ignoreCollisionsWithExistingSuggestions] & 1) != 0
            || !-[PGSuggestionSession _suggestionIsColliding:relaxCollisionRules:](self, "_suggestionIsColliding:relaxCollisionRules:", v26, [v55 containsIndex:v16]))
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            char v87 = 1;
            if (([v57 ignoreCollisionsWithSameBatchSuggestions] & 1) == 0 && objc_msgSend(v56, "count"))
            {
              id v34 = objc_alloc_init(MEMORY[0x1E4F28E60]);
              v67[0] = MEMORY[0x1E4F143A8];
              v67[1] = 3221225472;
              v67[2] = __66__PGSuggestionSession_coordinatedSuggestionsWithOptions_progress___block_invoke_279;
              v67[3] = &unk_1E68E59E8;
              v67[4] = self;
              id v68 = v26;
              id v35 = v34;
              id v69 = v35;
              v70 = buf;
              [v56 enumerateKeysAndObjectsUsingBlock:v67];
              if (*(unsigned char *)(*(void *)&buf[8] + 24) && [v35 count])
              {
                v64[0] = MEMORY[0x1E4F143A8];
                v64[1] = 3221225472;
                v64[2] = __66__PGSuggestionSession_coordinatedSuggestionsWithOptions_progress___block_invoke_281;
                v64[3] = &unk_1E68EFDD8;
                id v65 = v56;
                id v66 = v63;
                [v35 enumerateIndexesUsingBlock:v64];
              }
            }
            if (*(unsigned char *)(*(void *)&buf[8] + 24))
            {
              char v36 = [NSNumber numberWithUnsignedInteger:v16];
              [v56 setObject:v26 forKeyedSubscript:v36];

              [v63 addIndex:v16];
            }
            _Block_object_dispose(buf, 8);
            uint64_t v33 = 0;
          }
          else
          {
            uint64_t v33 = 1;
          }
          [v20 setLastSuggestionWasColliding:v33];
        }
        else if (-[PGSuggestionSession supportsRelaxedCollisionRulesForSuggester:](self, "supportsRelaxedCollisionRulesForSuggester:", v20)&& ([v55 containsIndex:v16] & 1) == 0)
        {
          [v55 addIndex:v16];
          [v20 reset];
        }
        else
        {
          [v63 addIndex:v16];
        }
      }

      if (!v59)
      {
LABEL_53:
        unint64_t v16 = (v16 + 1) % v61;
        char v37 = 1;
        goto LABEL_54;
      }
    }
    char v37 = 0;
LABEL_54:
    if ((v37 & 1) == 0) {
      goto LABEL_71;
    }
  }
  char v38 = [v56 allValues];
  uint64_t v39 = mach_absolute_time();
  uint32_t v40 = info.numer;
  uint32_t v41 = info.denom;
  uint64_t v42 = v53;
  uint64_t v43 = v42;
  if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v43, OS_SIGNPOST_INTERVAL_END, spid, "CoordinatedSuggestionGeneration", "", buf, 2u);
  }

  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "CoordinatedSuggestionGeneration";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v39 - v49) * (float)v40) / (float)v41) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v43, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  char v44 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v45 = [v38 count];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v45;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v38;
    _os_log_impl(&dword_1D1805000, (os_log_t)v44, OS_LOG_TYPE_DEFAULT, "Generated %lu suggestions:\n%@", buf, 0x16u);
  }

  if (v62
    && (double v46 = CFAbsoluteTimeGetCurrent(), v46 - v79[3] >= 0.01)
    && (v79[3] = v46,
        LOBYTE(v76.numer) = 0,
        v62[2](v62, &v76, 1.0),
        char v47 = *((unsigned char *)v83 + 24) | LOBYTE(v76.numer),
        (*((unsigned char *)v83 + 24) = v47) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 766;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/PGSuggestionSession.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v54 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v54 = v38;
  }

LABEL_71:
LABEL_72:
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);

  return v54;
}

void __66__PGSuggestionSession_coordinatedSuggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __66__PGSuggestionSession_coordinatedSuggestionsWithOptions_progress___block_invoke_279(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = a3;
  unint64_t v9 = [*(id *)(a1 + 32) reasonForSuggestion:*(void *)(a1 + 40) collidingWithSuggestion:v8 relaxCollisionRules:0];
  os_signpost_id_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = v10[5];
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      uint64_t v13 = v11;
      if (v9 > 3) {
        BOOL v14 = @"Unknown";
      }
      else {
        BOOL v14 = off_1E68EA2D0[v9];
      }
      unint64_t v15 = v14;
      int v17 = 138412547;
      double v18 = v15;
      __int16 v19 = 2113;
      char v20 = v8;
      _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_DEFAULT, "Suggestion did collide (%@) with same batch suggestion %{private}@", (uint8_t *)&v17, 0x16u);

      os_signpost_id_t v10 = *(void **)(a1 + 32);
    }
    unint64_t v16 = [v10 bestSuggestionBetween:v8 and:*(void *)(a1 + 40)];
    if (v16 == *(void **)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v7, "unsignedIntegerValue"));
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else if (v12)
  {
    int v17 = 138477827;
    double v18 = v8;
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_DEFAULT, "Suggestion didn't collide with same batch suggestion %{private}@", (uint8_t *)&v17, 0xCu);
  }
}

uint64_t __66__PGSuggestionSession_coordinatedSuggestionsWithOptions_progress___block_invoke_281(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  [v4 removeObjectForKey:v5];

  char v6 = *(void **)(a1 + 40);
  return [v6 removeIndex:a2];
}

- (id)activeSuggestersWithOptions:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PGSuggestionSession *)self suggesterClasses];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = loggingConnection;
    uint64_t v8 = [v5 count];
    profile = (void *)self->_profile;
    *(_DWORD *)buf = 134218240;
    uint64_t v30 = v8;
    __int16 v31 = 2048;
    long long v32 = profile;
    _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_DEFAULT, "Querying %lu Suggesters for profile %lu", buf, 0x16u);
  }
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v25;
    *(void *)&long long v12 = 138412290;
    long long v22 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v10);
        }
        unint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        int v17 = (void *)MEMORY[0x1D25FED50]();
        if ([(PGSuggestionSession *)self suggesterClass:v16 supportsOptions:v4])
        {
          double v18 = [v16 suggesterWithSession:self];
          __int16 v19 = self->_loggingConnection;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v30 = (uint64_t)v16;
            __int16 v31 = 2112;
            long long v32 = v18;
            _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_DEFAULT, "Querying Suggester of class %@ - %@", buf, 0x16u);
          }
          objc_msgSend(v18, "startSuggestingWithOptions:", v4, v22);
          [v23 addObject:v18];
        }
        else
        {
          char v20 = self->_loggingConnection;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v22;
            uint64_t v30 = (uint64_t)v16;
            _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_DEFAULT, "Suggester class %@ doesn't support passed options", buf, 0xCu);
          }
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  return v23;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v6 = a4;
  uint64_t v74 = 0;
  uint64_t v75 = &v74;
  uint64_t v76 = 0x2020000000;
  char v77 = 0;
  uint64_t v70 = 0;
  unint64_t v71 = (double *)&v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v73 = 0;
  id v52 = (void (**)(void *, unsigned char *, double))_Block_copy(v6);
  int v48 = v6;
  if (v52)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v71[3] >= 0.01)
    {
      v71[3] = Current;
      char v69 = 0;
      v52[2](v52, &v69, 0.0);
      char v8 = *((unsigned char *)v75 + 24) | v69;
      *((unsigned char *)v75 + 24) = v8;
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v79 = 569;
          *(_WORD *)&v79[4] = 2080;
          *(void *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/PGSuggestionSession.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v9 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_60;
      }
    }
  }
  id v10 = (void *)MEMORY[0x1E4F76C68];
  uint64_t v11 = [v51 localToday];
  long long v12 = [v10 universalDateFromLocalDate:v11];
  universalToday = self->_universalToday;
  self->_universalToday = v12;

  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = [(PGSuggestionSession *)self suggesterClasses];
  unint64_t v15 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v14 count];
    uint64_t profile = self->_profile;
    *(_DWORD *)buf = 134218240;
    *(void *)long long v79 = v16;
    *(_WORD *)&v79[8] = 2048;
    *(void *)&v79[10] = profile;
    _os_log_impl(&dword_1D1805000, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Querying %lu Suggesters for profile %lu", buf, 0x16u);
  }

  unint64_t v18 = [v14 count];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v14;
  uint64_t v19 = [obj countByEnumeratingWithState:&v65 objects:v82 count:16];
  if (!v19) {
    goto LABEL_34;
  }
  double v20 = 0.5 / (double)v18;
  uint64_t v21 = *(void *)v66;
  double v22 = 0.0;
  while (2)
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v66 != v21) {
        objc_enumerationMutation(obj);
      }
      long long v24 = *(void **)(*((void *)&v65 + 1) + 8 * i);
      if (v52)
      {
        double v25 = CFAbsoluteTimeGetCurrent();
        if (v25 - v71[3] >= 0.01)
        {
          v71[3] = v25;
          char v69 = 0;
          v52[2](v52, &v69, v22);
          char v26 = *((unsigned char *)v75 + 24) | v69;
          *((unsigned char *)v75 + 24) = v26;
          if (v26)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)long long v79 = 582;
              *(_WORD *)&v79[4] = 2080;
              *(void *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Suggestions/PGSuggestionSession.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
LABEL_48:

            goto LABEL_49;
          }
        }
      }
      long long v27 = (void *)MEMORY[0x1D25FED50]();
      if ([(PGSuggestionSession *)self suggesterClass:v24 supportsOptions:v51])
      {
        uint64_t v28 = [v24 suggesterWithSession:self];
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)long long v79 = v24;
          *(_WORD *)&v79[8] = 2112;
          *(void *)&v79[10] = v28;
          _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "Querying Suggester of class %@ - %@", buf, 0x16u);
        }
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __55__PGSuggestionSession_suggestionsWithOptions_progress___block_invoke;
        v58[3] = &unk_1E68ECB50;
        int v59 = v52;
        char v60 = &v70;
        double v63 = v22;
        double v64 = v20;
        uint64_t v62 = 0x3F847AE147AE147BLL;
        unint64_t v61 = &v74;
        uint64_t v30 = [v28 suggestionsWithOptions:v51 progress:v58];
        int v31 = *((unsigned __int8 *)v75 + 24);
        if (*((unsigned char *)v75 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)long long v79 = 595;
            *(_WORD *)&v79[4] = 2080;
            *(void *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/PGSuggestionSession.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          uint64_t v33 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = [v30 count];
            *(_DWORD *)buf = 134218498;
            *(void *)long long v79 = v34;
            *(_WORD *)&v79[8] = 2112;
            *(void *)&v79[10] = v24;
            __int16 v80 = 2112;
            uint64_t v81 = v28;
            _os_log_impl(&dword_1D1805000, (os_log_t)v33, OS_LOG_TYPE_DEFAULT, "Added %lu suggestions from suggester of class %@ - %@", buf, 0x20u);
          }

          [v49 addObjectsFromArray:v30];
        }

        if (v31)
        {
          int v35 = 0;
          goto LABEL_31;
        }
      }
      else
      {
        long long v32 = self->_loggingConnection;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)long long v79 = v24;
          _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_DEFAULT, "Suggester class %@ doesn't support passed options", buf, 0xCu);
        }
      }
      int v35 = 1;
LABEL_31:
      if (!v35) {
        goto LABEL_48;
      }
      double v22 = v20 + v22;
    }
    uint64_t v19 = [obj countByEnumeratingWithState:&v65 objects:v82 count:16];
    if (v19) {
      continue;
    }
    break;
  }
LABEL_34:

  if (!v52
    || (double v36 = CFAbsoluteTimeGetCurrent(), v36 - v71[3] < 0.01)
    || (v71[3] = v36,
        char v69 = 0,
        v52[2](v52, &v69, 0.5),
        char v37 = *((unsigned char *)v75 + 24) | v69,
        (*((unsigned char *)v75 + 24) = v37) == 0))
  {
    char v38 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = [v49 count];
      *(_DWORD *)buf = 134217984;
      *(void *)long long v79 = v39;
      _os_log_impl(&dword_1D1805000, (os_log_t)v38, OS_LOG_TYPE_DEFAULT, "Got %lu suggestions in total, running elections.", buf, 0xCu);
    }

    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __55__PGSuggestionSession_suggestionsWithOptions_progress___block_invoke_277;
    v53[3] = &unk_1E68F03F8;
    uint32_t v40 = v52;
    id v54 = v40;
    id v55 = &v70;
    v56 = &v74;
    uint64_t v57 = 0x3F847AE147AE147BLL;
    uint32_t v41 = [(PGSuggestionSession *)self electedSuggestionsFromSuggestions:v49 options:v51 progress:v53];
    if (*((unsigned char *)v75 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)long long v79 = 616;
        *(_WORD *)&v79[4] = 2080;
        *(void *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/PGSuggestionSession.m";
        uint64_t v42 = MEMORY[0x1E4F14500];
LABEL_44:
        _os_log_impl(&dword_1D1805000, v42, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      uint64_t v43 = self->_loggingConnection;
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = [v41 count];
        *(_DWORD *)buf = 134217984;
        *(void *)long long v79 = v44;
        _os_log_impl(&dword_1D1805000, (os_log_t)v43, OS_LOG_TYPE_DEFAULT, "Elected results: %lu", buf, 0xCu);
      }

      if (!v52
        || (double v45 = CFAbsoluteTimeGetCurrent(), v45 - v71[3] < 0.01)
        || (v71[3] = v45,
            char v69 = 0,
            v40[2](v40, &v69, 1.0),
            char v46 = *((unsigned char *)v75 + 24) | v69,
            (*((unsigned char *)v75 + 24) = v46) == 0))
      {
        id v9 = v41;
        goto LABEL_58;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)long long v79 = 619;
        *(_WORD *)&v79[4] = 2080;
        *(void *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/PGSuggestionSession.m";
        uint64_t v42 = MEMORY[0x1E4F14500];
        goto LABEL_44;
      }
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
LABEL_58:

    goto LABEL_59;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)long long v79 = 609;
    *(_WORD *)&v79[4] = 2080;
    *(void *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/PGSuggestionSession.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_49:
  id v9 = (id)MEMORY[0x1E4F1CBF0];
LABEL_59:

LABEL_60:
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);

  return v9;
}

void __55__PGSuggestionSession_suggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 64) + *(double *)(a1 + 72) * a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __55__PGSuggestionSession_suggestionsWithOptions_progress___block_invoke_277(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (BOOL)suggesterClass:(Class)a3 supportsOptions:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 suggestionTypeWhitelist];
  uint64_t v7 = [v5 suggestionTypeBlocklist];
  if (v6 | v7)
  {
    uint64_t v8 = [(objc_class *)a3 suggestionTypes];
    if (v6 && !objc_msgSend((id)v6, "pg_intersectsIndexSet:", v8)
      || v7 && ([(id)v7 containsIndexes:v8] & 1) != 0)
    {
      BOOL v9 = 0;
      goto LABEL_18;
    }
  }
  uint64_t v8 = [v5 suggestionSubtypeWhitelist];
  uint64_t v10 = [v5 suggestionSubtypeBlocklist];
  if (v8 | v10)
  {
    uint64_t v11 = [(objc_class *)a3 suggestionSubtypes];
    BOOL v9 = (!v8 || objc_msgSend((id)v8, "pg_intersectsIndexSet:", v11))
      && (!v10 || ![(id)v10 containsIndexes:v11]);
  }
  else
  {
    BOOL v9 = 1;
  }

LABEL_18:
  return v9;
}

- (id)suggesterClasses
{
  id v3 = objc_opt_class();
  uint64_t profile = self->_profile;
  return (id)[v3 suggesterClassesWithProfile:profile];
}

- (id)bestSuggestionBetween:(id)a3 and:(id)a4
{
  return a3;
}

- (id)electedSuggestionsFromSuggestions:(id)a3 options:(id)a4 progress:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void *, void *, double))_Block_copy(a5);
  double v11 = 0.0;
  if (v10)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(v46) = 0;
      v10[2](v10, &v46, 0.0);
      if ((_BYTE)v46)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)id v52 = 464;
          *(_WORD *)&v52[4] = 2080;
          *(void *)&v52[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/PGSuggestionSession.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v13 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_54;
      }
      double v11 = Current;
    }
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v15 = [v8 count];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v44 = v8;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (!v17) {
    goto LABEL_42;
  }
  uint64_t v18 = v17;
  double v19 = 1.0 / (double)v15;
  uint64_t v20 = *(void *)v48;
  double v21 = 0.0;
  id v45 = v14;
  while (2)
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v48 != v20) {
        objc_enumerationMutation(v16);
      }
      uint64_t v23 = *(void *)(*((void *)&v47 + 1) + 8 * v22);
      if (v10)
      {
        double v24 = CFAbsoluteTimeGetCurrent();
        if (v24 - v11 >= 0.01)
        {
          LOBYTE(v46) = 0;
          v10[2](v10, &v46, v21);
          if ((_BYTE)v46)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)id v52 = 471;
              *(_WORD *)&v52[4] = 2080;
              *(void *)&v52[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Suggestions/PGSuggestionSession.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            id v13 = (id)MEMORY[0x1E4F1CBF0];
            goto LABEL_52;
          }
          double v11 = v24;
        }
      }
      unint64_t v46 = 0;
      if ([v9 ignoreCollisionsWithExistingSuggestions])
      {
LABEL_18:
        if (([v9 ignoreCollisionsWithSameBatchSuggestions] & 1) != 0
          || ([(PGSuggestionSession *)self anySuggestionCollidingWithSuggestion:v23 inSuggestions:v14 relaxCollisionRules:0 collisionReason:&v46], (uint64_t v25 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          [v14 addObject:v23];
          goto LABEL_37;
        }
        char v26 = (void *)v25;
        loggingConnection = self->_loggingConnection;
        if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO)) {
          goto LABEL_36;
        }
        unint64_t v28 = v46;
        uint64_t v29 = loggingConnection;
        uint64_t v30 = @"Unknown";
        if (v28 <= 3) {
          uint64_t v30 = off_1E68EA2D0[v28];
        }
        int v31 = v30;
        *(_DWORD *)buf = 138412547;
        *(void *)id v52 = v31;
        *(_WORD *)&v52[8] = 2113;
        *(void *)&v52[10] = v26;
        long long v32 = v29;
        uint64_t v33 = "Suggestion did collide (%@) with same batch suggestion %{private}@";
        goto LABEL_35;
      }
      uint64_t v34 = [(PGSuggestionSession *)self anySuggestionCollidingWithSuggestion:v23 inSuggestions:self->_existingSuggestions relaxCollisionRules:0 collisionReason:&v46];
      if (v34)
      {
        char v26 = (void *)v34;
        int v35 = self->_loggingConnection;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          unint64_t v36 = v46;
          uint64_t v29 = v35;
          char v37 = @"Unknown";
          if (v36 <= 3) {
            char v37 = off_1E68EA2D0[v36];
          }
          int v31 = v37;
          *(_DWORD *)buf = 138412547;
          *(void *)id v52 = v31;
          *(_WORD *)&v52[8] = 2113;
          *(void *)&v52[10] = v26;
          long long v32 = v29;
          uint64_t v33 = "Suggestion did collide (%@) with existing suggestion %{private}@";
LABEL_35:
          _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, v33, buf, 0x16u);

          id v14 = v45;
          goto LABEL_36;
        }
        goto LABEL_36;
      }
      uint64_t v38 = [(PGSuggestionSession *)self anySuggestionCollidingWithSuggestion:v23 inSuggestions:self->_deniedSuggestions relaxCollisionRules:0 collisionReason:&v46];
      if (v38)
      {
        char v26 = (void *)v38;
        uint64_t v39 = self->_loggingConnection;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          unint64_t v40 = v46;
          uint64_t v29 = v39;
          uint32_t v41 = @"Unknown";
          if (v40 <= 3) {
            uint32_t v41 = off_1E68EA2D0[v40];
          }
          int v31 = v41;
          *(_DWORD *)buf = 138412547;
          *(void *)id v52 = v31;
          *(_WORD *)&v52[8] = 2113;
          *(void *)&v52[10] = v26;
          long long v32 = v29;
          uint64_t v33 = "Suggestion did collide (%@) with denied suggestion %{private}@";
          goto LABEL_35;
        }
LABEL_36:

        goto LABEL_37;
      }
      if (![(PGSuggestionSession *)self suggestion:v23 collidesWithMemories:self->_collidableMemories])goto LABEL_18; {
LABEL_37:
      }
      double v21 = v19 + v21;
      ++v22;
    }
    while (v18 != v22);
    uint64_t v42 = [v16 countByEnumeratingWithState:&v47 objects:v53 count:16];
    uint64_t v18 = v42;
    if (v42) {
      continue;
    }
    break;
  }
LABEL_42:

  if (v10 && CFAbsoluteTimeGetCurrent() - v11 >= 0.01 && (LOBYTE(v46) = 0, v10[2](v10, &v46, 1.0), (_BYTE)v46))
  {
    id v8 = v44;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)id v52 = 516;
      *(_WORD *)&v52[4] = 2080;
      *(void *)&v52[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/PGSuggestionSession.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v13 = v14;
LABEL_52:
    id v8 = v44;
  }

LABEL_54:
  return v13;
}

- (BOOL)suggestion:(id)a3 collidesWithMemories:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 universalStartDate];
  id v8 = [v5 universalEndDate];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "cls_universalStartDate", (void)v17);
        unint64_t v15 = objc_msgSend(v13, "cls_universalEndDate");
        if ([v14 compare:v8] != 1 && objc_msgSend(v15, "compare:", v7) != -1)
        {

          LOBYTE(v10) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v10;
}

- (id)suggestionsByCollisionReasonCollidingWithSuggestion:(id)a3 inSuggestions:(id)a4 relaxCollisionRules:(BOOL)a5
{
  BOOL v23 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x1D25FED50]();
        unint64_t v15 = [(PGSuggestionSession *)self reasonForSuggestion:v7 collidingWithSuggestion:v13 relaxCollisionRules:v23];
        if (v15)
        {
          unint64_t v16 = v15;
          long long v17 = [NSNumber numberWithUnsignedInteger:v15];
          id v18 = [v22 objectForKeyedSubscript:v17];

          if (!v18)
          {
            id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v19 = [NSNumber numberWithUnsignedInteger:v16];
            [v22 setObject:v18 forKeyedSubscript:v19];
          }
          [v18 addObject:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  return v22;
}

- (id)anySuggestionCollidingWithSuggestion:(id)a3 inSuggestions:(id)a4 relaxCollisionRules:(BOOL)a5 collisionReason:(unint64_t *)a6
{
  BOOL v7 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (a6) {
    *a6 = 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    BOOL v23 = a6;
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v18 = (void *)MEMORY[0x1D25FED50]();
        unint64_t v19 = [(PGSuggestionSession *)self reasonForSuggestion:v10 collidingWithSuggestion:v17 relaxCollisionRules:v7];
        if (v19)
        {
          unint64_t v21 = v19;
          id v20 = v17;
          if (v23) {
            *BOOL v23 = v21;
          }
          goto LABEL_15;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  id v20 = 0;
LABEL_15:

  return v20;
}

- (BOOL)supportsRelaxedCollisionRulesForSuggester:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)deniedSuggestion:(id)a3 collidesWithSuggestion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 state] == 4)
  {
    BOOL v7 = [v6 universalStartDate];
    id v8 = [v7 dateByAddingTimeInterval:-120.0];

    uint64_t v9 = [v6 universalEndDate];
    id v10 = [v9 dateByAddingTimeInterval:120.0];

    id v11 = [v5 universalStartDate];
    id v12 = [v5 universalEndDate];
    if ([v11 compare:v10] == 1)
    {
      unint64_t v13 = 0;
    }
    else if ([v12 compare:v8] == -1)
    {
      unint64_t v13 = 0;
    }
    else
    {
      unint64_t v13 = 3;
    }
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (unint64_t)outstanderSuggestion:(id)a3 collidesWithSuggestion:(id)a4 relaxCollisionRules:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 creationDate];
  universalToday = v10;
  if (!v10) {
    universalToday = self->_universalToday;
  }
  id v12 = universalToday;

  unint64_t v13 = [v9 creationDate];
  uint64_t v14 = v13;
  if (!v13) {
    uint64_t v14 = self->_universalToday;
  }
  uint64_t v15 = v14;

  [(NSDate *)v12 timeIntervalSinceDate:v15];
  double v17 = v16;

  double v18 = fabs(v17);
  if (v18 >= 15552000.0 || v18 >= 2592000.0 && v5)
  {
    unint64_t v19 = 0;
  }
  else
  {
    if (v18 >= 2592000.0 || v5) {
      double v21 = 3600.0;
    }
    else {
      double v21 = 43200.0;
    }
    id v22 = [v8 universalStartDate];
    BOOL v23 = [v22 dateByAddingTimeInterval:-v21];

    long long v24 = [v8 universalEndDate];
    long long v25 = [v24 dateByAddingTimeInterval:v21];

    long long v26 = [v9 universalStartDate];
    long long v27 = [v9 universalEndDate];
    unint64_t v19 = [v26 compare:v25] != 1 && objc_msgSend(v27, "compare:", v23) != -1;
  }
  return v19;
}

- (unint64_t)singleAssetSuggestion:(id)a3 collidesWithSuggestion:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 creationDate];
  universalToday = v8;
  if (!v8) {
    universalToday = self->_universalToday;
  }
  id v10 = universalToday;

  id v11 = [v7 creationDate];
  id v12 = v11;
  if (!v11) {
    id v12 = self->_universalToday;
  }
  unint64_t v13 = v12;

  [(NSDate *)v10 timeIntervalSinceDate:v13];
  double v15 = fabs(v14);
  if (v15 >= 2592000.0)
  {
    unint64_t v23 = 0;
  }
  else
  {
    double v16 = dbl_1D1F4F0D0[v15 < 604800.0];
    double v17 = [v6 universalStartDate];
    double v18 = [v17 dateByAddingTimeInterval:-v16];

    unint64_t v19 = [v6 universalEndDate];
    id v20 = [v19 dateByAddingTimeInterval:v16];

    double v21 = [v7 universalStartDate];
    id v22 = [v7 universalEndDate];
    if ([v21 compare:v20] == 1 || objc_msgSend(v22, "compare:", v18) == -1)
    {
      if (v15 < 259200.0
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        context = (void *)MEMORY[0x1D25FED50]();
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v24 = [v6 features];
        uint64_t v36 = [v24 countByEnumeratingWithState:&v47 objects:v52 count:16];
        if (v36)
        {
          uint64_t v25 = *(void *)v48;
          unint64_t v40 = v20;
          uint32_t v41 = v18;
          uint64_t v38 = v24;
          uint64_t v39 = v22;
          uint64_t v35 = *(void *)v48;
          do
          {
            uint64_t v26 = 0;
            do
            {
              if (*(void *)v48 != v25) {
                objc_enumerationMutation(v24);
              }
              uint64_t v37 = v26;
              long long v27 = *(void **)(*((void *)&v47 + 1) + 8 * v26);
              long long v43 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              unint64_t v28 = objc_msgSend(v7, "features", v35);
              uint64_t v29 = [v28 countByEnumeratingWithState:&v43 objects:v51 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = *(void *)v44;
                while (2)
                {
                  for (uint64_t i = 0; i != v30; ++i)
                  {
                    if (*(void *)v44 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    if ([v27 collidesWithFeature:*(void *)(*((void *)&v43 + 1) + 8 * i)])
                    {

                      unint64_t v23 = 2;
                      id v20 = v40;
                      double v18 = v41;
                      long long v24 = v38;
                      id v22 = v39;
                      goto LABEL_34;
                    }
                  }
                  uint64_t v30 = [v28 countByEnumeratingWithState:&v43 objects:v51 count:16];
                  if (v30) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v26 = v37 + 1;
              id v20 = v40;
              double v18 = v41;
              long long v24 = v38;
              id v22 = v39;
              uint64_t v25 = v35;
            }
            while (v37 + 1 != v36);
            uint64_t v33 = [v38 countByEnumeratingWithState:&v47 objects:v52 count:16];
            uint64_t v25 = v35;
            unint64_t v23 = 0;
            uint64_t v36 = v33;
          }
          while (v33);
        }
        else
        {
          unint64_t v23 = 0;
        }
LABEL_34:
      }
      else
      {
        unint64_t v23 = 0;
      }
    }
    else
    {
      unint64_t v23 = 1;
    }
  }
  return v23;
}

- (unint64_t)reasonForSuggestion:(id)a3 collidingWithSuggestion:(id)a4 relaxCollisionRules:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v9 state] != 4
    || (unint64_t v10 = [(PGSuggestionSession *)self deniedSuggestion:v9 collidesWithSuggestion:v8]) == 0)
  {
    if ([v8 type] == 1
      || [v9 type] == 1
      || [v8 type] == 6
      || [v9 type] == 6)
    {
      unint64_t v10 = 0;
    }
    else
    {
      if ([v8 type] == 5) {
        unint64_t v12 = [(PGSuggestionSession *)self outstanderSuggestion:v8 collidesWithSuggestion:v9 relaxCollisionRules:v5];
      }
      else {
        unint64_t v12 = [(PGSuggestionSession *)self singleAssetSuggestion:v8 collidesWithSuggestion:v9];
      }
      unint64_t v10 = v12;
    }
  }

  return v10;
}

- (void)setExistingSuggestions:(id)a3
{
  id v4 = (NSArray *)a3;
  if (self->_profile == 1)
  {
    BOOL v5 = [PGSuggestionNotificationProfile alloc];
    id v6 = [(PGManagerWorkingContext *)self->_workingContext serviceManager];
    id v7 = [(PGSuggestionNotificationProfile *)v5 initWithExistingSuggestions:v4 serviceManager:v6];
    notificationProfile = self->_notificationProfile;
    self->_notificationProfile = v7;
  }
  existingSuggestions = self->_existingSuggestions;
  self->_existingSuggestions = v4;
}

- (OS_os_log)loggingConnection
{
  return [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
}

- (PHPhotoLibrary)photoLibrary
{
  return [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
}

- (PGSuggestionSession)initWithProfile:(unsigned __int8)a3 workingContext:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PGSuggestionSession;
  id v8 = [(PGSuggestionSession *)&v15 init];
  id v9 = v8;
  if (v8)
  {
    v8->_uint64_t profile = a3;
    objc_storeStrong((id *)&v8->_workingContext, a4);
    id v10 = objc_alloc(MEMORY[0x1E4F8E768]);
    id v11 = [v7 photoLibrary];
    uint64_t v12 = [v10 initWithPhotoLibrary:v11];
    curationContext = v9->_curationContext;
    v9->_curationContext = (CLSCurationContext *)v12;

    v9->_topTierAestheticScore = 2.22507386e-308;
  }

  return v9;
}

+ (id)availableSuggestionTypeInfosWithProfile:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [a1 suggesterClassesWithProfile:v3];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [v11 suggestionTypes];
        unint64_t v13 = [v11 suggestionSubtypes];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __63__PGSuggestionSession_availableSuggestionTypeInfosWithProfile___block_invoke;
        v16[3] = &unk_1E68EFDD8;
        id v17 = v13;
        id v18 = v5;
        id v14 = v13;
        [v12 enumerateIndexesUsingBlock:v16];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

void __63__PGSuggestionSession_availableSuggestionTypeInfosWithProfile___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = PHSuggestionStringWithType();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PGSuggestionSession_availableSuggestionTypeInfosWithProfile___block_invoke_2;
  v7[3] = &unk_1E68E59C0;
  id v8 = v4;
  uint64_t v10 = a2;
  id v5 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v6 = v4;
  [v5 enumerateIndexesUsingBlock:v7];
}

void __63__PGSuggestionSession_availableSuggestionTypeInfosWithProfile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v4 = PHSuggestionStringWithSubtype();
  id v5 = [NSString stringWithFormat:@"%@ - %@", *(void *)(a1 + 32), v4];
  v10[0] = v5;
  v9[0] = @"uuid";
  v9[1] = @"type";
  id v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v10[1] = v6;
  v9[2] = @"subtype";
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a2];
  v10[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v5];
}

+ (id)suggestionSubtypesWithProfile:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F28E60] indexSet];
  id v6 = [a1 suggesterClassesWithProfile:v3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) suggestionSubtypes];
        [v5 addIndexes:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)suggestionTypesWithProfile:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F28E60] indexSet];
  id v6 = [a1 suggesterClassesWithProfile:v3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) suggestionTypes];
        [v5 addIndexes:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)suggesterClassesWithProfile:(unsigned __int8)a3
{
  v15[6] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0u:
      v15[0] = objc_opt_class();
      v15[1] = objc_opt_class();
      v15[2] = objc_opt_class();
      v15[3] = objc_opt_class();
      v15[4] = objc_opt_class();
      v15[5] = objc_opt_class();
      uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
      id v4 = v15;
      goto LABEL_10;
    case 1u:
      v13[0] = objc_opt_class();
      v13[1] = objc_opt_class();
      uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
      id v4 = v13;
      goto LABEL_13;
    case 2u:
      v12[0] = objc_opt_class();
      v12[1] = objc_opt_class();
      v12[2] = objc_opt_class();
      v12[3] = objc_opt_class();
      v12[4] = objc_opt_class();
      v12[5] = objc_opt_class();
      v12[6] = objc_opt_class();
      v12[7] = objc_opt_class();
      v12[8] = objc_opt_class();
      v12[9] = objc_opt_class();
      uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
      id v4 = v12;
      uint64_t v6 = 10;
      goto LABEL_14;
    case 3u:
      uint64_t v11 = objc_opt_class();
      uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
      id v4 = &v11;
      goto LABEL_8;
    case 4u:
      uint64_t v14 = objc_opt_class();
      uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
      id v4 = &v14;
LABEL_8:
      uint64_t v6 = 1;
      goto LABEL_14;
    case 5u:
      v10[0] = objc_opt_class();
      v10[1] = objc_opt_class();
      v10[2] = objc_opt_class();
      v10[3] = objc_opt_class();
      void v10[4] = objc_opt_class();
      v10[5] = objc_opt_class();
      uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
      id v4 = v10;
LABEL_10:
      uint64_t v6 = 6;
      goto LABEL_14;
    case 6u:
      v9[0] = objc_opt_class();
      v9[1] = objc_opt_class();
      v9[2] = objc_opt_class();
      void v9[3] = objc_opt_class();
      uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
      id v4 = v9;
      uint64_t v6 = 4;
      goto LABEL_14;
    case 7u:
      v8[0] = objc_opt_class();
      v8[1] = objc_opt_class();
      uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
      id v4 = v8;
LABEL_13:
      uint64_t v6 = 2;
LABEL_14:
      id v5 = [v3 arrayWithObjects:v4 count:v6];
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

@end