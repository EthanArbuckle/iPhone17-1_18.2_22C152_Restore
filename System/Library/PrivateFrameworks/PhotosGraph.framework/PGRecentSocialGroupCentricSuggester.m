@interface PGRecentSocialGroupCentricSuggester
+ (NSIndexSet)suggestionSubtypes;
+ (NSIndexSet)suggestionTypes;
- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4;
- (id)assetsMatchingSocialGroup:(id)a3 betweenStartDate:(id)a4 andEndDate:(id)a5 matchingAssetUUID:(id)a6;
- (id)assetsWithPersonsBetweenStartDate:(id)a3 andEndDate:(id)a4 matchAssetUUID:(id)a5;
- (id)longTimeNoSeeSocialGroupPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)nextLongTimeNoSeeSocialGroupPotentialSuggestionWithProgress:(id)a3;
- (id)nextSocialGroupPotentialSuggestionWithProgress:(id)a3;
- (id)nextSuggestionWithProgress:(id)a3;
- (id)potentialSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)socialGroupPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)verifiedPersons;
- (void)reset;
- (void)startSuggestingWithOptions:(id)a3;
- (void)usePotentialSuggestions:(id)a3;
@end

@implementation PGRecentSocialGroupCentricSuggester

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:305];
}

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibleAssets, 0);
  objc_storeStrong((id *)&self->_socialGroupPotentialSuggestionEnumerator, 0);
  objc_storeStrong((id *)&self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator, 0);
  objc_storeStrong((id *)&self->_socialGroupPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_longTimeNoSeeSocialGroupPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_usedPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_allPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (void)usePotentialSuggestions:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableSet *)self->_usedPotentialSuggestions addObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)assetsMatchingSocialGroup:(id)a3 betweenStartDate:(id)a4 andEndDate:(id)a5 matchingAssetUUID:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = [(PGAbstractSuggester *)self session];
  v15 = [v14 loggingConnection];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = (uint64_t)v10;
    __int16 v34 = 2112;
    id v35 = v11;
    _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: Computing eligible socialgroup assets between %@ and %@", buf, 0x16u);
  }
  v16 = [(PGRecentSocialGroupCentricSuggester *)self assetsWithPersonsBetweenStartDate:v10 andEndDate:v11 matchAssetUUID:v12];

  v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
  unint64_t v18 = [v13 count];

  v19 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __111__PGRecentSocialGroupCentricSuggester_assetsMatchingSocialGroup_betweenStartDate_andEndDate_matchingAssetUUID___block_invoke;
  v29 = &unk_1E68E7638;
  id v30 = v17;
  unint64_t v31 = v18 >> 1;
  id v20 = v17;
  v21 = [v19 predicateWithBlock:&v26];
  v22 = objc_msgSend(v16, "filteredArrayUsingPredicate:", v21, v26, v27, v28, v29);

  v23 = v15;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = [v22 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v33 = v24;
    _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: found %lu eligible assets", buf, 0xCu);
  }

  return v22;
}

BOOL __111__PGRecentSocialGroupCentricSuggester_assetsMatchingSocialGroup_betweenStartDate_andEndDate_matchingAssetUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 clsPersonLocalIdentifiers];
  uint64_t v5 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
  [v5 intersectSet:*(void *)(a1 + 32)];
  unint64_t v6 = [v5 count];
  if (v6 >= 2 && (unint64_t v7 = v6, v6 >= *(void *)(a1 + 40)))
  {
    long long v9 = [v3 clsFaceInformationSummary];
    unsigned int v10 = [v9 numberOfFaces];
    unint64_t v11 = v10 - v7;
    if (v10 < v7) {
      unint64_t v11 = 0;
    }
    BOOL v8 = v11 < v7 && (double)v7 * 0.5 <= (double)[v9 numberOfGoodFacesOfVerifiedPersons];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)assetsWithPersonsBetweenStartDate:(id)a3 andEndDate:(id)a4 matchAssetUUID:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  eligibleAssets = self->_eligibleAssets;
  if (!eligibleAssets)
  {
    v62 = [(PGAbstractSuggester *)self session];
    v61 = [v62 photoLibrary];
    uint64_t v60 = [MEMORY[0x1E4F38EB8] clsPrefetchOptionsForKeyAsset];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v54 = (void *)MEMORY[0x1D25FED50]();
    v53 = [(id)objc_opt_class() noVideoPredicate];
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v53, 0);
    if (v8)
    {
      uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated >= %@", v8];
      [v13 addObject:v14];
    }
    if (v9)
    {
      v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated <= %@", v9];
      [v13 addObject:v15];
    }
    if (v10)
    {
      v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid == %@", v10];
      [v13 addObject:v16];
    }
    v52 = v13;
    if ((unint64_t)[v13 count] <= 1) {
      [v13 firstObject];
    }
    else {
      [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];
    }
    id v55 = v10;
    id v56 = v9;
    v51 = id v57 = v8;
    v17 = [(PGAbstractSuggester *)self defaultAssetFetchOptionsWithInternalPredicate:v51];
    unint64_t v18 = +[PGCurationManager assetPropertySetsForCuration];
    [v17 setFetchPropertySets:v18];

    [v17 setChunkSizeForFetch:500];
    v49 = [(PGRecentSocialGroupCentricSuggester *)self verifiedPersons];
    v50 = v17;
    v59 = objc_msgSend(MEMORY[0x1E4F38EB8], "fetchAssetsForPersons:options:");
    uint64_t v19 = [v59 count];
    if (v19)
    {
      uint64_t v20 = v19;
      unint64_t v21 = 0;
      unint64_t v58 = v19;
      do
      {
        context = (void *)MEMORY[0x1D25FED50]();
        if (v20 - v21 >= 0x1F4) {
          uint64_t v22 = 500;
        }
        else {
          uint64_t v22 = v20 - v21;
        }
        v23 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v21, v22);
        uint64_t v24 = [v59 objectsAtIndexes:v23];

        id v25 = objc_alloc(MEMORY[0x1E4F39150]);
        uint64_t v26 = [v59 fetchType];
        uint64_t v27 = [v59 fetchPropertySets];
        v28 = (void *)[v25 initWithObjects:v24 photoLibrary:v61 fetchType:v26 fetchPropertySets:v27 identifier:0 registerIfNeeded:0];

        v29 = (void *)MEMORY[0x1E4F38EB8];
        id v30 = [v62 curationContext];
        unint64_t v31 = [v29 clsAllAssetsFromFetchResult:v28 prefetchOptions:v60 curationContext:v30];

        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v32 = v31;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v64 objects:v68 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v65 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              if ([(PGAbstractSuggester *)self assetIsValidForSuggesting:v37])
              {
                v38 = [v37 uuid];
                [v12 addObject:v38];
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v64 objects:v68 count:16];
          }
          while (v34);
        }

        v21 += 500;
        uint64_t v20 = v58;
      }
      while (v21 < v58);
    }

    v39 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v12];
    v40 = [(PGAbstractSuggester *)self defaultAssetFetchOptionsWithInternalPredicate:v39];
    v41 = +[PGCurationManager assetPropertySetsForCuration];
    [v40 setFetchPropertySets:v41];

    v42 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v40];
    v43 = (void *)MEMORY[0x1E4F38EB8];
    v44 = [v62 curationContext];
    v45 = [v43 clsAllAssetsFromFetchResult:v42 prefetchOptions:v60 curationContext:v44];
    v46 = self->_eligibleAssets;
    self->_eligibleAssets = v45;

    eligibleAssets = self->_eligibleAssets;
    id v9 = v56;
    id v8 = v57;
    id v10 = v55;
  }
  v47 = eligibleAssets;

  return v47;
}

- (id)verifiedPersons
{
  v2 = [(PGAbstractSuggester *)self session];
  id v3 = [v2 photoLibrary];
  id v4 = [v3 librarySpecificFetchOptions];

  [v4 setPersonContext:1];
  uint64_t v5 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v4];
  unint64_t v6 = [v5 fetchedObjects];

  return v6;
}

- (id)potentialSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v7 = [(PGAbstractSuggester *)self session];
  id v8 = [v7 workingContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__PGRecentSocialGroupCentricSuggester_potentialSuggestionsWithOptions_progress___block_invoke;
  v14[3] = &unk_1E68F0AF0;
  id v15 = v5;
  id v9 = v6;
  id v16 = v9;
  id v10 = v5;
  [v8 performSynchronousConcurrentGraphReadUsingBlock:v14];

  unint64_t v11 = v16;
  id v12 = v9;

  return v12;
}

void __80__PGRecentSocialGroupCentricSuggester_potentialSuggestionsWithOptions_progress___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 graph];
  id v4 = [*(id *)(a1 + 32) universalStartDate];
  id v5 = [*(id *)(a1 + 32) universalEndDate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__PGRecentSocialGroupCentricSuggester_potentialSuggestionsWithOptions_progress___block_invoke_2;
  v8[3] = &unk_1E68E7610;
  id v9 = v5;
  id v10 = v4;
  id v11 = *(id *)(a1 + 40);
  id v6 = v4;
  id v7 = v5;
  [v3 enumerateSocialGroupsWithBlock:v8 includeInvalidGroups:0];
}

void __80__PGRecentSocialGroupCentricSuggester_potentialSuggestionsWithOptions_progress___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, float a5)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)MEMORY[0x1D25FED50]();
  if ((unint64_t)[v9 count] >= 2)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      v43 = v12;
      id v44 = v11;
      id v45 = v10;
      v46 = v9;
      id v16 = 0;
      char v17 = 0;
      uint64_t v18 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v56 != v18) {
            objc_enumerationMutation(v13);
          }
          uint64_t v20 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          unint64_t v21 = objc_msgSend(v20, "universalStartDate", v43);
          if ([v21 compare:*(void *)(a1 + 32)] == 1
            || ([v20 universalEndDate],
                uint64_t v22 = objc_claimAutoreleasedReturnValue(),
                uint64_t v23 = [v22 compare:*(void *)(a1 + 40)],
                v22,
                v23 == -1))
          {
            if ([v21 compare:*(void *)(a1 + 40)] == -1)
            {
              if (v16)
              {
                uint64_t v24 = [v21 laterDate:v16];

                id v16 = (id)v24;
              }
              else
              {
                id v16 = v21;
              }
            }
          }
          else
          {
            char v17 = 1;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v15);

      if ((v17 & 1) == 0)
      {
        id v10 = v45;
        id v9 = v46;
        id v12 = v43;
        id v11 = v44;
        goto LABEL_38;
      }
      if (v16)
      {
        [*(id *)(a1 + 40) timeIntervalSinceDate:v16];
        if (v25 <= 2592000.0)
        {

          id v16 = 0;
        }
      }
      uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v46, "count"));
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v27 = v46;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v52;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v52 != v30) {
              objc_enumerationMutation(v27);
            }
            id v32 = [*(id *)(*((void *)&v51 + 1) + 8 * j) localIdentifier];
            [v26 addObject:v32];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v51 objects:v60 count:16];
        }
        while (v29);
      }

      uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v34 = v13;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v59 count:16];
      id v11 = v44;
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v48;
        do
        {
          for (uint64_t k = 0; k != v36; ++k)
          {
            if (*(void *)v48 != v37) {
              objc_enumerationMutation(v34);
            }
            v39 = [*(id *)(*((void *)&v47 + 1) + 8 * k) localIdentifier];
            [v33 addObject:v39];
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v47 objects:v59 count:16];
        }
        while (v36);
      }

      v40 = [PGPotentialRecentSocialGroupCentricSuggestion alloc];
      id v10 = v45;
      *(float *)&double v41 = a5;
      v42 = [(PGPotentialRecentSocialGroupCentricSuggestion *)v40 initWithPersonLocalIdentifiers:v26 personWeights:v45 momentLocalIdentifiers:v33 weight:v16 notSeenSinceDate:v41];
      [*(id *)(a1 + 48) addObject:v42];

      id v9 = v46;
      id v12 = v43;
    }
    else
    {
      id v16 = 0;
      uint64_t v26 = v13;
    }

LABEL_38:
  }
}

- (id)nextSocialGroupPotentialSuggestionWithProgress:(id)a3
{
  id v4 = a3;
  socialGroupPotentialSuggestionEnumerator = self->_socialGroupPotentialSuggestionEnumerator;
  if (!socialGroupPotentialSuggestionEnumerator)
  {
    socialGroupPotentialSuggestions = self->_socialGroupPotentialSuggestions;
    if (!socialGroupPotentialSuggestions)
    {
      id v7 = [(PGRecentSocialGroupCentricSuggester *)self socialGroupPotentialSuggestionsWithOptions:self->_options progress:v4];
      id v8 = self->_socialGroupPotentialSuggestions;
      self->_socialGroupPotentialSuggestions = v7;

      [(PGRecentSocialGroupCentricSuggester *)self usePotentialSuggestions:self->_socialGroupPotentialSuggestions];
      socialGroupPotentialSuggestions = self->_socialGroupPotentialSuggestions;
    }
    id v9 = [(NSArray *)socialGroupPotentialSuggestions objectEnumerator];
    id v10 = self->_socialGroupPotentialSuggestionEnumerator;
    self->_socialGroupPotentialSuggestionEnumerator = v9;

    socialGroupPotentialSuggestionEnumerator = self->_socialGroupPotentialSuggestionEnumerator;
  }
  id v11 = [(NSEnumerator *)socialGroupPotentialSuggestionEnumerator nextObject];

  return v11;
}

- (id)nextLongTimeNoSeeSocialGroupPotentialSuggestionWithProgress:(id)a3
{
  id v4 = a3;
  longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator;
  if (!longTimeNoSeeSocialGroupPotentialSuggestionEnumerator)
  {
    longTimeNoSeeSocialGroupPotentialSuggestions = self->_longTimeNoSeeSocialGroupPotentialSuggestions;
    if (!longTimeNoSeeSocialGroupPotentialSuggestions)
    {
      id v7 = [(PGRecentSocialGroupCentricSuggester *)self longTimeNoSeeSocialGroupPotentialSuggestionsWithOptions:self->_options progress:v4];
      id v8 = self->_longTimeNoSeeSocialGroupPotentialSuggestions;
      self->_longTimeNoSeeSocialGroupPotentialSuggestions = v7;

      [(PGRecentSocialGroupCentricSuggester *)self usePotentialSuggestions:self->_longTimeNoSeeSocialGroupPotentialSuggestions];
      longTimeNoSeeSocialGroupPotentialSuggestions = self->_longTimeNoSeeSocialGroupPotentialSuggestions;
    }
    id v9 = [(NSArray *)longTimeNoSeeSocialGroupPotentialSuggestions objectEnumerator];
    id v10 = self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator;
    self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = v9;

    longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator;
  }
  id v11 = [(NSEnumerator *)longTimeNoSeeSocialGroupPotentialSuggestionEnumerator nextObject];

  return v11;
}

- (id)socialGroupPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v6 = a4;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  uint64_t v54 = 0;
  long long v55 = (double *)&v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  v42 = (void (**)(void *, unsigned char *, double))_Block_copy(v6);
  v38 = v6;
  if (v42)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v55[3] >= 0.01)
    {
      v55[3] = Current;
      char v53 = 0;
      v42[2](v42, &v53, 0.0);
      char v8 = *((unsigned char *)v59 + 24) | v53;
      *((unsigned char *)v59 + 24) = v8;
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v65 = 288;
          __int16 v66 = 2080;
          long long v67 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          id v9 = MEMORY[0x1E4F14500];
LABEL_12:
          _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
    }
  }
  double v41 = self;
  if (!self->_allPotentialSuggestions)
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __91__PGRecentSocialGroupCentricSuggester_socialGroupPotentialSuggestionsWithOptions_progress___block_invoke;
    v48[3] = &unk_1E68F03F8;
    long long v49 = v42;
    long long v50 = &v54;
    long long v51 = &v58;
    uint64_t v52 = 0x3F847AE147AE147BLL;
    uint64_t v30 = [(PGRecentSocialGroupCentricSuggester *)self potentialSuggestionsWithOptions:v43 progress:v48];
    allPotentialSuggestions = self->_allPotentialSuggestions;
    self->_allPotentialSuggestions = v30;

    if (*((unsigned char *)v59 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v65 = 295;
        __int16 v66 = 2080;
        long long v67 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

      goto LABEL_36;
    }
  }
  if (v42)
  {
    double v10 = CFAbsoluteTimeGetCurrent();
    if (v10 - v55[3] >= 0.01)
    {
      v55[3] = v10;
      char v53 = 0;
      v42[2](v42, &v53, 0.3);
      char v11 = *((unsigned char *)v59 + 24) | v53;
      *((unsigned char *)v59 + 24) = v11;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v65 = 298;
          __int16 v66 = 2080;
          long long v67 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          id v9 = MEMORY[0x1E4F14500];
          goto LABEL_12;
        }
LABEL_36:
        id v32 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_50;
      }
    }
  }
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v12 = [(NSArray *)self->_allPotentialSuggestions count];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = self->_allPotentialSuggestions;
  uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v63 count:16];
  if (v13)
  {
    double v14 = 1.0 / (double)v12;
    uint64_t v15 = *(void *)v45;
    double v16 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (v42)
        {
          double v19 = CFAbsoluteTimeGetCurrent();
          if (v19 - v55[3] >= 0.01)
          {
            v55[3] = v19;
            char v53 = 0;
            v42[2](v42, &v53, v16 * 0.6 + 0.3);
            char v20 = *((unsigned char *)v59 + 24) | v53;
            *((unsigned char *)v59 + 24) = v20;
            if (v20)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v65 = 305;
                __int16 v66 = 2080;
                long long v67 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_40;
            }
          }
        }
        if (([(NSMutableSet *)self->_usedPotentialSuggestions containsObject:v18] & 1) == 0)
        {
          unint64_t v21 = (void *)MEMORY[0x1D25FED50]();
          uint64_t v22 = [v43 additionalOptions];
          uint64_t v23 = [v22 objectForKeyedSubscript:@"assetUUID"];

          uint64_t v24 = [v18 personLocalIdentifiers];
          double v25 = [v43 universalStartDate];
          uint64_t v26 = [v43 universalEndDate];
          id v27 = [(PGRecentSocialGroupCentricSuggester *)v41 assetsMatchingSocialGroup:v24 betweenStartDate:v25 andEndDate:v26 matchingAssetUUID:v23];

          if ([v27 count])
          {
            [v18 setAssets:v27];
            [v39 addObject:v18];
          }

          self = v41;
        }
        double v16 = v14 + v16;
      }
      uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v63 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  if (v42
    && (double v28 = CFAbsoluteTimeGetCurrent(), v28 - v55[3] >= 0.01)
    && (v55[3] = v28,
        char v53 = 0,
        v42[2](v42, &v53, 0.9),
        char v29 = *((unsigned char *)v59 + 24) | v53,
        (*((unsigned char *)v59 + 24) = v29) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v65 = 325;
      __int16 v66 = 2080;
      long long v67 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_40:
    id v32 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v33 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"assets.@count" ascending:0];
    uint64_t v62 = v33;
    id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];

    [v39 sortUsingDescriptors:v34];
    if (v42
      && (double v35 = CFAbsoluteTimeGetCurrent(), v35 - v55[3] >= 0.01)
      && (v55[3] = v35,
          char v53 = 0,
          v42[2](v42, &v53, 1.0),
          char v36 = *((unsigned char *)v59 + 24) | v53,
          (*((unsigned char *)v59 + 24) = v36) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v65 = 331;
        __int16 v66 = 2080;
        long long v67 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v32 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v32 = v39;
    }
  }
LABEL_50:
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  return v32;
}

void __91__PGRecentSocialGroupCentricSuggester_socialGroupPotentialSuggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)longTimeNoSeeSocialGroupPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v6 = a4;
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = (double *)&v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  long long v46 = (void (**)(void *, unsigned char *, double))_Block_copy(v6);
  double v41 = v6;
  if (v46)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v58[3] >= 0.01)
    {
      v58[3] = Current;
      char v56 = 0;
      v46[2](v46, &v56, 0.0);
      char v8 = *((unsigned char *)v62 + 24) | v56;
      *((unsigned char *)v62 + 24) = v8;
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v68 = 233;
          __int16 v69 = 2080;
          v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          id v9 = MEMORY[0x1E4F14500];
LABEL_12:
          _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_37;
        }
        goto LABEL_37;
      }
    }
  }
  long long v45 = self;
  if (!self->_allPotentialSuggestions)
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __104__PGRecentSocialGroupCentricSuggester_longTimeNoSeeSocialGroupPotentialSuggestionsWithOptions_progress___block_invoke;
    v51[3] = &unk_1E68F03F8;
    uint64_t v52 = v46;
    char v53 = &v57;
    uint64_t v54 = &v61;
    uint64_t v55 = 0x3F847AE147AE147BLL;
    id v32 = [(PGRecentSocialGroupCentricSuggester *)self potentialSuggestionsWithOptions:v44 progress:v51];
    allPotentialSuggestions = self->_allPotentialSuggestions;
    self->_allPotentialSuggestions = v32;

    if (*((unsigned char *)v62 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v68 = 240;
        __int16 v69 = 2080;
        v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

      goto LABEL_37;
    }
  }
  if (v46)
  {
    double v10 = CFAbsoluteTimeGetCurrent();
    if (v10 - v58[3] >= 0.01)
    {
      v58[3] = v10;
      char v56 = 0;
      v46[2](v46, &v56, 0.3);
      char v11 = *((unsigned char *)v62 + 24) | v56;
      *((unsigned char *)v62 + 24) = v11;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v68 = 243;
          __int16 v69 = 2080;
          v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          id v9 = MEMORY[0x1E4F14500];
          goto LABEL_12;
        }
LABEL_37:
        id v34 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_51;
      }
    }
  }
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v12 = [(NSArray *)self->_allPotentialSuggestions count];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = self->_allPotentialSuggestions;
  uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v66 count:16];
  if (v13)
  {
    double v14 = 1.0 / (double)v12;
    uint64_t v15 = *(void *)v48;
    double v16 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v48 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (v46)
        {
          double v19 = CFAbsoluteTimeGetCurrent();
          if (v19 - v58[3] >= 0.01)
          {
            v58[3] = v19;
            char v56 = 0;
            v46[2](v46, &v56, v16 * 0.6 + 0.3);
            char v20 = *((unsigned char *)v62 + 24) | v56;
            *((unsigned char *)v62 + 24) = v20;
            if (v20)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v68 = 250;
                __int16 v69 = 2080;
                v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_41;
            }
          }
        }
        if (([(NSMutableSet *)self->_usedPotentialSuggestions containsObject:v18] & 1) == 0)
        {
          unint64_t v21 = [v18 notSeenSinceDate];
          BOOL v22 = v21 == 0;

          self = v45;
          if (!v22)
          {
            uint64_t v23 = (void *)MEMORY[0x1D25FED50]();
            uint64_t v24 = [v44 additionalOptions];
            double v25 = [v24 objectForKeyedSubscript:@"assetUUID"];

            uint64_t v26 = [v18 personLocalIdentifiers];
            id v27 = [v44 universalStartDate];
            double v28 = [v44 universalEndDate];
            char v29 = [(PGRecentSocialGroupCentricSuggester *)v45 assetsMatchingSocialGroup:v26 betweenStartDate:v27 andEndDate:v28 matchingAssetUUID:v25];

            if ([v29 count])
            {
              [v18 setAssets:v29];
              [v42 addObject:v18];
            }

            self = v45;
          }
        }
        double v16 = v14 + v16;
      }
      uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v66 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  if (v46
    && (double v30 = CFAbsoluteTimeGetCurrent(), v30 - v58[3] >= 0.01)
    && (v58[3] = v30,
        char v56 = 0,
        v46[2](v46, &v56, 0.9),
        char v31 = *((unsigned char *)v62 + 24) | v56,
        (*((unsigned char *)v62 + 24) = v31) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v68 = 273;
      __int16 v69 = 2080;
      v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_41:
    id v34 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    double v35 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"notSeenSinceDate" ascending:1];
    v65[0] = v35;
    char v36 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"assets.@count" ascending:0];
    v65[1] = v36;
    uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];

    [v42 sortUsingDescriptors:v37];
    if (v46
      && (double v38 = CFAbsoluteTimeGetCurrent(), v38 - v58[3] >= 0.01)
      && (v58[3] = v38,
          char v56 = 0,
          v46[2](v46, &v56, 1.0),
          char v39 = *((unsigned char *)v62 + 24) | v56,
          (*((unsigned char *)v62 + 24) = v39) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v68 = 280;
        __int16 v69 = 2080;
        v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v34 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v34 = v42;
    }
  }
LABEL_51:
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  return v34;
}

void __104__PGRecentSocialGroupCentricSuggester_longTimeNoSeeSocialGroupPotentialSuggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = objc_alloc_init(PGSuggestionOptions);
  [(PGSuggestionOptions *)v8 setLocalToday:v7];

  id v9 = [v6 creationDate];
  [(PGSuggestionOptions *)v8 setUniversalStartDate:v9];

  BOOL v22 = @"assetUUID";
  double v10 = [v6 uuid];
  v23[0] = v10;
  char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  [(PGSuggestionOptions *)v8 setAdditionalOptions:v11];

  [(PGSuggestionOptions *)v8 setMaximumNumberOfSuggestions:1];
  unint64_t v12 = [(PGRecentSocialGroupCentricSuggester *)self suggestionsWithOptions:v8 progress:&__block_literal_global_22636];
  if ([v12 count] == 1)
  {
    uint64_t v13 = [v12 firstObject];
    double v14 = [v13 keyAssets];
    if ([v14 count] == 1)
    {
      unint64_t v21 = [v12 firstObject];
      uint64_t v15 = [v21 keyAssets];
      double v16 = [v15 firstObject];
      char v17 = [v16 uuid];
      uint64_t v18 = [v6 uuid];
      char v19 = [v17 isEqualToString:v18];
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v26 = a4;
  id v6 = _Block_copy(v26);
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v37 = 0;
  double v38 = (double *)&v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  if (v6
    && (double v7 = CFAbsoluteTimeGetCurrent(), v7 - v38[3] >= 0.01)
    && (v38[3] = v7,
        char v36 = 0,
        (*((void (**)(void *, char *, double))v6 + 2))(v6, &v36, 0.0),
        char v8 = *((unsigned char *)v42 + 24) | v36,
        (*((unsigned char *)v42 + 24) = v8) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v46 = 176;
      __int16 v47 = 2080;
      long long v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    -[PGRecentSocialGroupCentricSuggester startSuggestingWithOptions:](self, "startSuggestingWithOptions:", v28, v26);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = [v28 maximumNumberOfSuggestions];
    id v27 = v10;
    unint64_t v12 = 0;
    if (v11) {
      unint64_t v13 = v11;
    }
    else {
      unint64_t v13 = -1;
    }
    double v14 = 0.0;
    uint64_t v15 = MEMORY[0x1E4F14500];
    while (v12 < v13)
    {
      double v16 = (void *)MEMORY[0x1D25FED50]();
      if (v6
        && (double Current = CFAbsoluteTimeGetCurrent(), Current - v38[3] >= 0.01)
        && (v38[3] = Current,
            char v36 = 0,
            (*((void (**)(void *, char *, double))v6 + 2))(v6, &v36, v14),
            char v18 = *((unsigned char *)v42 + 24) | v36,
            (*((unsigned char *)v42 + 24) = v18) != 0))
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v46 = 187;
          __int16 v47 = 2080;
          long long v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        int v19 = 1;
      }
      else
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __71__PGRecentSocialGroupCentricSuggester_suggestionsWithOptions_progress___block_invoke;
        v29[3] = &unk_1E68ECB50;
        id v30 = v6;
        char v31 = &v37;
        double v34 = v14;
        double v35 = 1.0 / (double)v13;
        uint64_t v33 = 0x3F847AE147AE147BLL;
        id v32 = &v41;
        uint64_t v20 = [(PGRecentSocialGroupCentricSuggester *)self nextSuggestionWithProgress:v29];
        unint64_t v21 = (void *)v20;
        if (*((unsigned char *)v42 + 24))
        {
          int v19 = 1;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v46 = 192;
            __int16 v47 = 2080;
            long long v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
            _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else if (v20)
        {
          [v27 addObject:v20];
          int v19 = 0;
          ++v12;
          double v14 = 1.0 / (double)v13 + v14;
        }
        else
        {
          int v19 = 3;
        }
      }
      if (v19)
      {
        if (v19 != 3)
        {
          id v9 = (id)MEMORY[0x1E4F1CBF0];
          BOOL v22 = v27;
          goto LABEL_35;
        }
        break;
      }
    }
    BOOL v22 = v27;
    if (v6
      && (double v23 = CFAbsoluteTimeGetCurrent(), v23 - v38[3] >= 0.01)
      && (v38[3] = v23,
          char v36 = 0,
          (*((void (**)(void *, char *, double))v6 + 2))(v6, &v36, 1.0),
          char v24 = *((unsigned char *)v42 + 24) | v36,
          (*((unsigned char *)v42 + 24) = v24) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v46 = 202;
        __int16 v47 = 2080;
        long long v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v9 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v9 = v27;
    }
LABEL_35:
  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v9;
}

void __71__PGRecentSocialGroupCentricSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
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

- (void)reset
{
  id v3 = [(PGAbstractSuggester *)self session];
  id v4 = [v3 loggingConnection];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1D1805000, v4, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: Resetting", v7, 2u);
  }

  longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator;
  self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = 0;

  socialGroupPotentialSuggestionEnumerator = self->_socialGroupPotentialSuggestionEnumerator;
  self->_socialGroupPotentialSuggestionEnumerator = 0;
}

- (id)nextSuggestionWithProgress:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v4 = (char *)_Block_copy(v34);
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  uint64_t v50 = 0;
  long long v51 = (double *)&v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  if (v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v51[3] >= 0.01)
    {
      v51[3] = Current;
      char v49 = 0;
      (*((void (**)(char *, char *, double))v4 + 2))(v4, &v49, 0.0);
      char v6 = *((unsigned char *)v55 + 24) | v49;
      *((unsigned char *)v55 + 24) = v6;
      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)uint64_t v59 = 97;
          *(_WORD *)&v59[4] = 2080;
          *(void *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        uint64_t v7 = 0;
        goto LABEL_67;
      }
    }
  }
  double v35 = [(PGAbstractSuggester *)self session];
  char v8 = [v35 workingContext];
  char v36 = [v8 curationManager];

  log = [v35 loggingConnection];
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: nextSuggestion", buf, 2u);
  }
  id v9 = 0;
  double v38 = (void (**)(id, char *, double))(v4 + 16);
  do
  {
    if (v9) {
      goto LABEL_54;
    }
    id v10 = (void *)MEMORY[0x1D25FED50]();
    if (!v4
      || (double v11 = CFAbsoluteTimeGetCurrent(), v11 - v51[3] < 0.01)
      || (v51[3] = v11,
          char v49 = 0,
          (*((void (**)(char *, char *, double))v4 + 2))(v4, &v49, 0.5),
          char v12 = *((unsigned char *)v55 + 24) | v49,
          (*((unsigned char *)v55 + 24) = v12) == 0))
    {
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __66__PGRecentSocialGroupCentricSuggester_nextSuggestionWithProgress___block_invoke;
      v44[3] = &unk_1E68F03F8;
      double v14 = v4;
      long long v45 = v14;
      int v46 = &v50;
      uint64_t v48 = 0x3F847AE147AE147BLL;
      __int16 v47 = &v54;
      uint64_t v15 = [(PGRecentSocialGroupCentricSuggester *)self nextLongTimeNoSeeSocialGroupPotentialSuggestionWithProgress:v44];
      double v16 = (void *)v15;
      if (*((unsigned char *)v55 + 24))
      {
        int v13 = 1;
        char v17 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)uint64_t v59 = 112;
          *(_WORD *)&v59[4] = 2080;
          *(void *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v9 = 0;
        goto LABEL_21;
      }
      if (!v15)
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __66__PGRecentSocialGroupCentricSuggester_nextSuggestionWithProgress___block_invoke_192;
        v39[3] = &unk_1E68F03F8;
        uint64_t v40 = v14;
        uint64_t v41 = &v50;
        uint64_t v43 = 0x3F847AE147AE147BLL;
        id v42 = &v54;
        double v16 = [(PGRecentSocialGroupCentricSuggester *)self nextLongTimeNoSeeSocialGroupPotentialSuggestionWithProgress:v39];
        if (*((unsigned char *)v55 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)uint64_t v59 = 119;
            *(_WORD *)&v59[4] = 2080;
            *(void *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_42;
        }
      }
      if (!v4
        || (double v18 = CFAbsoluteTimeGetCurrent(), v18 - v51[3] < 0.01)
        || (v51[3] = v18,
            char v49 = 0,
            (*v38)(v14, &v49, 0.5),
            char v19 = *((unsigned char *)v55 + 24) | v49,
            (*((unsigned char *)v55 + 24) = v19) == 0))
      {
        if (!v16)
        {
          id v9 = 0;
          int v13 = 3;
          goto LABEL_22;
        }
        uint64_t v20 = [v16 personLocalIdentifiers];
        unint64_t v21 = objc_alloc_init(PGKeyAssetCurationOptions);
        BOOL v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v20];
        [(PGKeyAssetCurationOptions *)v21 setReferencePersonLocalIdentifiers:v22];

        double v23 = [v16 assets];
        char v24 = [v36 bestAssetInAssets:v23 options:v21];

        if (v4
          && (double v25 = CFAbsoluteTimeGetCurrent(), v25 - v51[3] >= 0.01)
          && (v51[3] = v25,
              char v49 = 0,
              (*v38)(v14, &v49, 0.5),
              char v26 = *((unsigned char *)v55 + 24) | v49,
              (*((unsigned char *)v55 + 24) = v26) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)uint64_t v59 = 131;
            *(_WORD *)&v59[4] = 2080;
            *(void *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v9 = 0;
          int v13 = 1;
        }
        else
        {
          if (v24)
          {
            id v9 = [[PGPeopleCentricSuggestion alloc] initWithPersonLocalIdentifiers:v20 asset:v24];
            id v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            id v28 = [v27 localizedStringForKey:@"PGPeopleTitleFormatGenericSocialGroup" value:@"PGPeopleTitleFormatGenericSocialGroup" table:@"Localizable"];
            [(PGSingleAssetSuggestion *)v9 setTitle:v28];

            char v29 = [v24 localCreationDate];
            id v30 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v29 dateStyle:2 timeStyle:0];
            [(PGSingleAssetSuggestion *)v9 setSubtitle:v30];
          }
          else
          {
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D1805000, log, OS_LOG_TYPE_ERROR, "Recent SocialGroup Centric: bestAssetInAssets returned nil, cannot generate suggestion", buf, 2u);
            }
            id v9 = 0;
          }
          int v13 = 0;
        }

LABEL_21:
LABEL_22:

        goto LABEL_23;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)uint64_t v59 = 122;
        *(_WORD *)&v59[4] = 2080;
        *(void *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
LABEL_42:
      id v9 = 0;
      int v13 = 1;
      goto LABEL_21;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v59 = 107;
      *(_WORD *)&v59[4] = 2080;
      *(void *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v9 = 0;
    int v13 = 1;
LABEL_23:
  }
  while (!v13);
  if (v13 != 3)
  {
LABEL_61:
    uint64_t v7 = 0;
    goto LABEL_66;
  }
  if (v9)
  {
LABEL_54:
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)uint64_t v59 = v9;
      _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: Suggesting %{private}@", buf, 0xCu);
    }
    if (v4) {
      goto LABEL_57;
    }
    goto LABEL_65;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: Nothing to suggest", buf, 2u);
  }
  id v9 = 0;
  if (!v4) {
    goto LABEL_65;
  }
LABEL_57:
  double v31 = CFAbsoluteTimeGetCurrent();
  if (v31 - v51[3] >= 0.01)
  {
    v51[3] = v31;
    char v49 = 0;
    (*((void (**)(char *, char *, double))v4 + 2))(v4, &v49, 1.0);
    char v32 = *((unsigned char *)v55 + 24) | v49;
    *((unsigned char *)v55 + 24) = v32;
    if (v32)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)uint64_t v59 = 161;
        *(_WORD *)&v59[4] = 2080;
        *(void *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_61;
    }
  }
LABEL_65:
  id v9 = v9;
  uint64_t v7 = v9;
LABEL_66:

LABEL_67:
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  return v7;
}

void __66__PGRecentSocialGroupCentricSuggester_nextSuggestionWithProgress___block_invoke(uint64_t a1, unsigned char *a2)
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

void __66__PGRecentSocialGroupCentricSuggester_nextSuggestionWithProgress___block_invoke_192(uint64_t a1, unsigned char *a2)
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

- (void)startSuggestingWithOptions:(id)a3
{
  id v4 = (PGSuggestionOptions *)a3;
  uint64_t v5 = [(PGAbstractSuggester *)self session];
  char v6 = [v5 loggingConnection];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v14 = 0;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: Starting suggesting", v14, 2u);
  }

  allPotentialSuggestions = self->_allPotentialSuggestions;
  self->_allPotentialSuggestions = 0;

  usedPotentialSuggestions = self->_usedPotentialSuggestions;
  self->_usedPotentialSuggestions = 0;

  longTimeNoSeeSocialGroupPotentialSuggestions = self->_longTimeNoSeeSocialGroupPotentialSuggestions;
  self->_longTimeNoSeeSocialGroupPotentialSuggestions = 0;

  socialGroupPotentialSuggestions = self->_socialGroupPotentialSuggestions;
  self->_socialGroupPotentialSuggestions = 0;

  longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator;
  self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = 0;

  socialGroupPotentialSuggestionEnumerator = self->_socialGroupPotentialSuggestionEnumerator;
  self->_socialGroupPotentialSuggestionEnumerator = 0;

  options = self->_options;
  self->_options = v4;
}

@end