@interface PGRecentPersonCentricSuggester
+ (NSIndexSet)suggestionSubtypes;
+ (NSIndexSet)suggestionTypes;
- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4;
- (id)assetsByPersonLocalIdentifierWithOptions:(id)a3 progress:(id)a4;
- (id)assetsWithSinglePersonBetweenStartDate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5 progress:(id)a6;
- (id)assetsWithSinglePersonWithOptions:(id)a3 progress:(id)a4;
- (id)birthdayPersonPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)lastAssetWithPerson:(id)a3 beforeDate:(id)a4 matchingAssetUUID:(id)a5;
- (id)longTimeNoSeePersonPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)nextBirthdayPersonPotentialSuggestionWithProgress:(id)a3;
- (id)nextLongTimeNoSeePersonPotentialSuggestionWithProgress:(id)a3;
- (id)nextPersonPotentialSuggestionWithProgress:(id)a3;
- (id)nextPotentialSuggestionWithProgress:(id)a3;
- (id)nextSuggestionWithProgress:(id)a3;
- (id)personPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)suggestionWithPotentialSuggestion:(id)a3 progress:(id)a4;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (id)verifiedPersonByPersonLocalIdentifier;
- (unint64_t)relationScoreWithPersonNode:(id)a3;
- (void)reset;
- (void)startSuggestingWithOptions:(id)a3;
- (void)updateUsedPersonLocalIdentifiersFromPotentialSuggestions:(id)a3;
@end

@implementation PGRecentPersonCentricSuggester

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:304];
}

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personPotentialSuggestionEnumerator, 0);
  objc_storeStrong((id *)&self->_longTimeNoSeePersonPotentialSuggestionEnumerator, 0);
  objc_storeStrong((id *)&self->_birthdayPersonPotentialSuggestionEnumerator, 0);
  objc_storeStrong((id *)&self->_personPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_longTimeNoSeePersonPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_birthdayPersonPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_usedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_assetsByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_verifiedPersonByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (void)updateUsedPersonLocalIdentifiersFromPotentialSuggestions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) personLocalIdentifier];
        [(NSMutableSet *)self->_usedPersonLocalIdentifiers addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)assetsWithSinglePersonBetweenStartDate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5 progress:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = (void (**)(void *, unsigned char *, double))_Block_copy(a6);
  double v14 = 0.0;
  if (!v13 || (double v15 = CFAbsoluteTimeGetCurrent(), v15 < 0.01))
  {
LABEL_8:
    v17 = [(PGAbstractSuggester *)self session];
    v18 = [v17 loggingConnection];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v49 = v10;
      *(_WORD *)&v49[8] = 2112;
      *(void *)&v49[10] = v11;
      _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: Computing eligible single-person assets between %@ and %@", buf, 0x16u);
    }
    v19 = [(PGRecentPersonCentricSuggester *)self verifiedPersonByPersonLocalIdentifier];
    if (![v19 count])
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: No verified person, no eligible asset", buf, 2u);
      }
      id v16 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_50;
    }
    uint64_t v40 = [(id)objc_opt_class() noVideoPredicate];
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v40, 0);
    if (v10)
    {
      v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated >= %@", v10];
      [v20 addObject:v21];
    }
    if (v11)
    {
      v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated <= %@", v11];
      [v20 addObject:v22];
    }
    if (v12)
    {
      v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid == %@", v12];
      [v20 addObject:v23];
    }
    id v43 = v12;
    id v44 = v10;
    id v42 = v11;
    if ((unint64_t)[v20 count] > 1) {
      [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v20];
    }
    else {
    v41 = [v20 firstObject];
    }
    v24 = [(PGAbstractSuggester *)self defaultAssetFetchOptionsWithInternalPredicate:v41];
    v25 = +[PGCurationManager assetPropertySetsForCuration];
    [v24 setFetchPropertySets:v25];

    v26 = (void *)MEMORY[0x1E4F38EB8];
    v27 = [v19 allValues];
    v45 = [v26 fetchAssetsForPersons:v27 options:v24];

    if (v13)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v14 >= 0.01)
      {
        char v47 = 0;
        v13[2](v13, &v47, 0.4);
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v49 = 693;
            *(_WORD *)&v49[4] = 2080;
            *(void *)&v49[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v16 = (id)MEMORY[0x1E4F1CBF0];
          id v12 = v43;
          v29 = (void *)v40;
          goto LABEL_49;
        }
        double v14 = Current;
      }
    }
    uint64_t v30 = [MEMORY[0x1E4F38EB8] clsPrefetchOptionsForKeyAsset];
    v31 = (void *)MEMORY[0x1E4F38EB8];
    v32 = [v17 curationContext];
    v33 = [v31 clsAllAssetsFromFetchResult:v45 prefetchOptions:v30 curationContext:v32];

    if (v13)
    {
      double v34 = CFAbsoluteTimeGetCurrent();
      id v11 = v42;
      if (v34 - v14 >= 0.01)
      {
        char v47 = 0;
        v13[2](v13, &v47, 0.8);
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v49 = 698;
            *(_WORD *)&v49[4] = 2080;
            *(void *)&v49[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v16 = (id)MEMORY[0x1E4F1CBF0];
LABEL_48:
          v29 = (void *)v40;

          id v12 = v43;
LABEL_49:

          id v10 = v44;
LABEL_50:

          goto LABEL_51;
        }
        double v14 = v34;
      }
    }
    else
    {
      id v11 = v42;
    }
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __111__PGRecentPersonCentricSuggester_assetsWithSinglePersonBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke;
    v46[3] = &unk_1E68EC880;
    v46[4] = self;
    v35 = [MEMORY[0x1E4F28F60] predicateWithBlock:v46];
    v36 = [v33 filteredArrayUsingPredicate:v35];

    v37 = v18;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = [v36 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v49 = v38;
      _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: found %lu eligible assets", buf, 0xCu);
    }

    if (v13 && CFAbsoluteTimeGetCurrent() - v14 >= 0.01 && (char v47 = 0, v13[2](v13, &v47, 1.0), v47))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v49 = 710;
        *(_WORD *)&v49[4] = 2080;
        *(void *)&v49[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v16 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v16 = v36;
    }

    goto LABEL_48;
  }
  char v47 = 0;
  v13[2](v13, &v47, 0.0);
  if (!v47)
  {
    double v14 = v15;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v49 = 655;
    *(_WORD *)&v49[4] = 2080;
    *(void *)&v49[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v16 = (id)MEMORY[0x1E4F1CBF0];
LABEL_51:

  return v16;
}

BOOL __111__PGRecentPersonCentricSuggester_assetsWithSinglePersonBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) assetIsValidForSuggesting:v3])
  {
    id v4 = [v3 clsFaceInformationSummary];
    BOOL v5 = [v4 numberOfFaces] == 1
      && [v4 numberOfGoodFacesOfVerifiedPersons] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)lastAssetWithPerson:(id)a3 beforeDate:(id)a4 matchingAssetUUID:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = a3;
  id v11 = [v9 predicateWithFormat:@"dateCreated < %@", a4];
  id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v11, 0);
  if (v8)
  {
    long long v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid == %@", v8];
    [v12 addObject:v13];
  }
  if ((unint64_t)[v12 count] <= 1) {
    [v12 firstObject];
  }
  else {
  double v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v12];
  }
  double v15 = [(PGAbstractSuggester *)self defaultAssetFetchOptionsWithInternalPredicate:v14];
  [v15 setFetchLimit:1];
  id v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v21[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v15 setSortDescriptors:v17];

  v18 = [MEMORY[0x1E4F38EB8] fetchAssetsForPerson:v10 options:v15];

  v19 = [v18 firstObject];

  return v19;
}

- (id)verifiedPersonByPersonLocalIdentifier
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  verifiedPersonByPersonLocalIdentifier = self->_verifiedPersonByPersonLocalIdentifier;
  if (!verifiedPersonByPersonLocalIdentifier)
  {
    id v4 = [(PGAbstractSuggester *)self session];
    BOOL v5 = [v4 photoLibrary];
    uint64_t v6 = [v5 librarySpecificFetchOptions];

    [v6 setPersonContext:1];
    uint64_t v7 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v6];
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    id v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          double v15 = objc_msgSend(v14, "localIdentifier", (void)v18);
          [(NSDictionary *)v8 setObject:v14 forKeyedSubscript:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v16 = self->_verifiedPersonByPersonLocalIdentifier;
    self->_verifiedPersonByPersonLocalIdentifier = v8;

    verifiedPersonByPersonLocalIdentifier = self->_verifiedPersonByPersonLocalIdentifier;
  }
  return verifiedPersonByPersonLocalIdentifier;
}

- (id)nextPersonPotentialSuggestionWithProgress:(id)a3
{
  id v4 = a3;
  personPotentialSuggestionEnumerator = self->_personPotentialSuggestionEnumerator;
  if (!personPotentialSuggestionEnumerator)
  {
    personPotentialSuggestions = self->_personPotentialSuggestions;
    if (!personPotentialSuggestions)
    {
      uint64_t v7 = [(PGRecentPersonCentricSuggester *)self personPotentialSuggestionsWithOptions:self->_options progress:v4];
      id v8 = self->_personPotentialSuggestions;
      self->_personPotentialSuggestions = v7;

      [(PGRecentPersonCentricSuggester *)self updateUsedPersonLocalIdentifiersFromPotentialSuggestions:self->_personPotentialSuggestions];
      personPotentialSuggestions = self->_personPotentialSuggestions;
    }
    id v9 = [(NSArray *)personPotentialSuggestions objectEnumerator];
    uint64_t v10 = self->_personPotentialSuggestionEnumerator;
    self->_personPotentialSuggestionEnumerator = v9;

    personPotentialSuggestionEnumerator = self->_personPotentialSuggestionEnumerator;
  }
  uint64_t v11 = [(NSEnumerator *)personPotentialSuggestionEnumerator nextObject];

  return v11;
}

- (id)nextLongTimeNoSeePersonPotentialSuggestionWithProgress:(id)a3
{
  id v4 = a3;
  longTimeNoSeePersonPotentialSuggestionEnumerator = self->_longTimeNoSeePersonPotentialSuggestionEnumerator;
  if (!longTimeNoSeePersonPotentialSuggestionEnumerator)
  {
    longTimeNoSeePersonPotentialSuggestions = self->_longTimeNoSeePersonPotentialSuggestions;
    if (!longTimeNoSeePersonPotentialSuggestions)
    {
      uint64_t v7 = [(PGRecentPersonCentricSuggester *)self longTimeNoSeePersonPotentialSuggestionsWithOptions:self->_options progress:v4];
      id v8 = self->_longTimeNoSeePersonPotentialSuggestions;
      self->_longTimeNoSeePersonPotentialSuggestions = v7;

      [(PGRecentPersonCentricSuggester *)self updateUsedPersonLocalIdentifiersFromPotentialSuggestions:self->_longTimeNoSeePersonPotentialSuggestions];
      longTimeNoSeePersonPotentialSuggestions = self->_longTimeNoSeePersonPotentialSuggestions;
    }
    id v9 = [(NSArray *)longTimeNoSeePersonPotentialSuggestions objectEnumerator];
    uint64_t v10 = self->_longTimeNoSeePersonPotentialSuggestionEnumerator;
    self->_longTimeNoSeePersonPotentialSuggestionEnumerator = v9;

    longTimeNoSeePersonPotentialSuggestionEnumerator = self->_longTimeNoSeePersonPotentialSuggestionEnumerator;
  }
  uint64_t v11 = [(NSEnumerator *)longTimeNoSeePersonPotentialSuggestionEnumerator nextObject];

  return v11;
}

- (id)nextBirthdayPersonPotentialSuggestionWithProgress:(id)a3
{
  id v4 = a3;
  birthdayPersonPotentialSuggestionEnumerator = self->_birthdayPersonPotentialSuggestionEnumerator;
  if (!birthdayPersonPotentialSuggestionEnumerator)
  {
    birthdayPersonPotentialSuggestions = self->_birthdayPersonPotentialSuggestions;
    if (!birthdayPersonPotentialSuggestions)
    {
      uint64_t v7 = [(PGRecentPersonCentricSuggester *)self birthdayPersonPotentialSuggestionsWithOptions:self->_options progress:v4];
      id v8 = self->_birthdayPersonPotentialSuggestions;
      self->_birthdayPersonPotentialSuggestions = v7;

      [(PGRecentPersonCentricSuggester *)self updateUsedPersonLocalIdentifiersFromPotentialSuggestions:self->_birthdayPersonPotentialSuggestions];
      birthdayPersonPotentialSuggestions = self->_birthdayPersonPotentialSuggestions;
    }
    id v9 = [(NSArray *)birthdayPersonPotentialSuggestions objectEnumerator];
    uint64_t v10 = self->_birthdayPersonPotentialSuggestionEnumerator;
    self->_birthdayPersonPotentialSuggestionEnumerator = v9;

    birthdayPersonPotentialSuggestionEnumerator = self->_birthdayPersonPotentialSuggestionEnumerator;
  }
  uint64_t v11 = [(NSEnumerator *)birthdayPersonPotentialSuggestionEnumerator nextObject];

  return v11;
}

- (id)personPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v39 = a4;
  uint64_t v7 = (void (**)(void *, unsigned char *, double))_Block_copy(v39);
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  uint64_t v51 = 0;
  v52 = (double *)&v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  if (v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v52[3] >= 0.01)
    {
      v52[3] = Current;
      char v50 = 0;
      v7[2](v7, &v50, 0.0);
      char v9 = *((unsigned char *)v56 + 24) | v50;
      *((unsigned char *)v56 + 24) = v9;
      if (v9)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v62 = 511;
          __int16 v63 = 2080;
          v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          uint64_t v10 = MEMORY[0x1E4F14500];
LABEL_12:
          _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
    }
  }
  if (!self->_assetsByPersonLocalIdentifier)
  {
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __81__PGRecentPersonCentricSuggester_personPotentialSuggestionsWithOptions_progress___block_invoke;
    v45[3] = &unk_1E68F03F8;
    v46 = v7;
    char v47 = &v51;
    v48 = &v55;
    uint64_t v49 = 0x3F847AE147AE147BLL;
    v29 = [(PGRecentPersonCentricSuggester *)self assetsByPersonLocalIdentifierWithOptions:v6 progress:v45];
    assetsByPersonLocalIdentifier = self->_assetsByPersonLocalIdentifier;
    self->_assetsByPersonLocalIdentifier = v29;

    if (*((unsigned char *)v56 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v62 = 518;
        __int16 v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

      goto LABEL_36;
    }
  }
  if (v7)
  {
    double v11 = CFAbsoluteTimeGetCurrent();
    if (v11 - v52[3] >= 0.01)
    {
      v52[3] = v11;
      char v50 = 0;
      v7[2](v7, &v50, 0.5);
      char v12 = *((unsigned char *)v56 + 24) | v50;
      *((unsigned char *)v56 + 24) = v12;
      if (v12)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v62 = 521;
          __int16 v63 = 2080;
          v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          uint64_t v10 = MEMORY[0x1E4F14500];
          goto LABEL_12;
        }
LABEL_36:
        id v31 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_50;
      }
    }
  }
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = [(PGRecentPersonCentricSuggester *)self verifiedPersonByPersonLocalIdentifier];
  unint64_t v14 = [v13 count];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v38 = v13;
  double v15 = [v13 objectEnumerator];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v60 count:16];
  if (v16)
  {
    double v17 = 1.0 / (double)v14;
    uint64_t v18 = *(void *)v42;
    double v19 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if (v7)
        {
          double v22 = CFAbsoluteTimeGetCurrent();
          if (v22 - v52[3] >= 0.01)
          {
            v52[3] = v22;
            char v50 = 0;
            v7[2](v7, &v50, v19 * 0.4 + 0.5);
            char v23 = *((unsigned char *)v56 + 24) | v50;
            *((unsigned char *)v56 + 24) = v23;
            if (v23)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v62 = 529;
                __int16 v63 = 2080;
                v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_40;
            }
          }
        }
        v24 = [v21 localIdentifier];
        if (([(NSMutableSet *)self->_usedPersonLocalIdentifiers containsObject:v24] & 1) == 0)
        {
          v25 = [(NSDictionary *)self->_assetsByPersonLocalIdentifier objectForKeyedSubscript:v24];
          if (v25)
          {
            v26 = [[PGPotentialRecentPersonCentricSuggestion alloc] initWithPersonLocalIdentifier:v24 assets:v25 notSeenSinceDate:0];
            [v40 addObject:v26];
          }
        }

        double v19 = v17 + v19;
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v60 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  if (v7
    && (double v27 = CFAbsoluteTimeGetCurrent(), v27 - v52[3] >= 0.01)
    && (v52[3] = v27, char v50 = 0, v7[2](v7, &v50, 0.9), v28 = *((unsigned char *)v56 + 24) | v50, (*((unsigned char *)v56 + 24) = v28) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v62 = 545;
      __int16 v63 = 2080;
      v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_40:
    id v31 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v32 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"assets.@count" ascending:0];
    v59[0] = v32;
    v33 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"personLocalIdentifier" ascending:1];
    v59[1] = v33;
    double v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];

    [v40 sortUsingDescriptors:v34];
    if (v7
      && (double v35 = CFAbsoluteTimeGetCurrent(), v35 - v52[3] >= 0.01)
      && (v52[3] = v35,
          char v50 = 0,
          v7[2](v7, &v50, 1.0),
          char v36 = *((unsigned char *)v56 + 24) | v50,
          (*((unsigned char *)v56 + 24) = v36) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v62 = 552;
        __int16 v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v31 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v31 = v40;
    }
  }
LABEL_50:
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  return v31;
}

void __81__PGRecentPersonCentricSuggester_personPotentialSuggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)longTimeNoSeePersonPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v44 = a4;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  uint64_t v61 = 0;
  int v62 = (double *)&v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  uint64_t v49 = _Block_copy(v44);
  if (!v49
    || (double v5 = CFAbsoluteTimeGetCurrent(), v5 - v62[3] < 0.01)
    || (v62[3] = v5,
        char v60 = 0,
        (*((void (**)(void *, char *, double))v49 + 2))(v49, &v60, 0.0),
        char v6 = *((unsigned char *)v66 + 24) | v60,
        (*((unsigned char *)v66 + 24) = v6) == 0))
  {
    id v8 = [v47 universalStartDate];
    if (v8)
    {
      if (!self->_assetsByPersonLocalIdentifier)
      {
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __94__PGRecentPersonCentricSuggester_longTimeNoSeePersonPotentialSuggestionsWithOptions_progress___block_invoke;
        v55[3] = &unk_1E68F03F8;
        id v56 = v49;
        uint64_t v57 = &v61;
        char v58 = &v65;
        uint64_t v59 = 0x3F847AE147AE147BLL;
        double v34 = [(PGRecentPersonCentricSuggester *)self assetsByPersonLocalIdentifierWithOptions:v47 progress:v55];
        assetsByPersonLocalIdentifier = self->_assetsByPersonLocalIdentifier;
        self->_assetsByPersonLocalIdentifier = v34;

        if (*((unsigned char *)v66 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v72 = 462;
            __int16 v73 = 2080;
            v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_41;
        }
      }
      if (!v49
        || (double v9 = CFAbsoluteTimeGetCurrent(), v9 - v62[3] < 0.01)
        || (v62[3] = v9,
            char v60 = 0,
            (*((void (**)(void *, char *, double))v49 + 2))(v49, &v60, 0.5),
            char v10 = *((unsigned char *)v66 + 24) | v60,
            (*((unsigned char *)v66 + 24) = v10) == 0))
      {
        id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        double v11 = [(PGRecentPersonCentricSuggester *)self verifiedPersonByPersonLocalIdentifier];
        unint64_t v12 = [v11 count];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v13 = [v11 objectEnumerator];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v70 count:16];
        long long v43 = v11;
        v46 = v8;
        if (v14)
        {
          double v15 = 1.0 / (double)v12;
          uint64_t v48 = *(void *)v52;
          double v16 = 0.0;
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v52 != v48) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              if (v49)
              {
                double Current = CFAbsoluteTimeGetCurrent();
                if (Current - v62[3] >= 0.01)
                {
                  v62[3] = Current;
                  char v60 = 0;
                  (*((void (**)(void *, char *, double))v49 + 2))(v49, &v60, v16 * 0.4 + 0.5);
                  char v20 = *((unsigned char *)v66 + 24) | v60;
                  *((unsigned char *)v66 + 24) = v20;
                  if (v20)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      int v72 = 473;
                      __int16 v73 = 2080;
                      v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
                      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }

                    id v7 = (id)MEMORY[0x1E4F1CBF0];
                    goto LABEL_53;
                  }
                }
              }
              long long v21 = objc_msgSend(v18, "localIdentifier", v43, v44);
              if (([(NSMutableSet *)self->_usedPersonLocalIdentifiers containsObject:v21] & 1) == 0)
              {
                double v22 = [(NSDictionary *)self->_assetsByPersonLocalIdentifier objectForKeyedSubscript:v21];
                if (v22)
                {
                  char v23 = [v47 additionalOptions];
                  v24 = [v23 objectForKeyedSubscript:@"assetUUID"];

                  v25 = [(PGRecentPersonCentricSuggester *)self lastAssetWithPerson:v18 beforeDate:v46 matchingAssetUUID:v24];
                  v26 = [v25 creationDate];
                  if (v25)
                  {
                    double v27 = [v47 universalStartDate];
                    [v27 timeIntervalSinceDate:v26];
                    BOOL v29 = v28 > 2592000.0;

                    if (v29)
                    {
                      uint64_t v30 = [[PGPotentialRecentPersonCentricSuggestion alloc] initWithPersonLocalIdentifier:v21 assets:v22 notSeenSinceDate:v26];
                      [v45 addObject:v30];
                    }
                  }
                }
              }

              double v16 = v15 + v16;
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v70 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        if (v49
          && (double v31 = CFAbsoluteTimeGetCurrent(), v31 - v62[3] >= 0.01)
          && (v62[3] = v31,
              char v60 = 0,
              (*((void (**)(void *, char *, double))v49 + 2))(v49, &v60, 0.9),
              char v32 = *((unsigned char *)v66 + 24) | v60,
              *((unsigned char *)v66 + 24) = v32,
              v33 = v43,
              v32))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v72 = 495;
            __int16 v73 = 2080;
            v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v7 = (id)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          char v36 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"notSeenSinceDate", 1, v43);
          v69[0] = v36;
          v37 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"assets.@count" ascending:0];
          v69[1] = v37;
          uint64_t v38 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"personLocalIdentifier" ascending:1];
          v69[2] = v38;
          id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];

          [v45 sortUsingDescriptors:v39];
          if (v49
            && (double v40 = CFAbsoluteTimeGetCurrent(), v40 - v62[3] >= 0.01)
            && (v62[3] = v40,
                char v60 = 0,
                (*((void (**)(void *, char *, double))v49 + 2))(v49, &v60, 1.0),
                char v41 = *((unsigned char *)v66 + 24) | v60,
                (*((unsigned char *)v66 + 24) = v41) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v72 = 503;
              __int16 v73 = 2080;
              v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Su"
                    "ggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            id v7 = (id)MEMORY[0x1E4F1CBF0];
          }
          else
          {
            id v7 = v45;
          }

LABEL_53:
          v33 = v43;
        }

        id v8 = v46;
        goto LABEL_55;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v72 = 465;
        __int16 v73 = 2080;
        v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
LABEL_41:
    id v7 = (id)MEMORY[0x1E4F1CBF0];
LABEL_55:

    goto LABEL_56;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v72 = 449;
    __int16 v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v7 = (id)MEMORY[0x1E4F1CBF0];
LABEL_56:
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

  return v7;
}

void __94__PGRecentPersonCentricSuggester_longTimeNoSeePersonPotentialSuggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)birthdayPersonPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  *(void *)((char *)&v74[2] + 4) = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v47 = a4;
  char v6 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v47);
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = (double *)&v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  if (v6)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v65[3] >= 0.01)
    {
      v65[3] = Current;
      LOBYTE(info.numer) = 0;
      v6[2](v6, &info, 0.0);
      char v8 = *((unsigned char *)v69 + 24) | LOBYTE(info.numer);
      *((unsigned char *)v69 + 24) = v8;
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int buf = 67109378;
          LODWORD(v74[0]) = 381;
          WORD2(v74[0]) = 2080;
          *(void *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPerson"
                                         "CentricSuggester.m";
          double v9 = MEMORY[0x1E4F14500];
LABEL_12:
          _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
  }
  if (!self->_assetsByPersonLocalIdentifier)
  {
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    void v59[2] = __89__PGRecentPersonCentricSuggester_birthdayPersonPotentialSuggestionsWithOptions_progress___block_invoke;
    v59[3] = &unk_1E68F03F8;
    char v60 = v6;
    uint64_t v61 = &v64;
    int v62 = &v68;
    uint64_t v63 = 0x3F847AE147AE147BLL;
    double v27 = [(PGRecentPersonCentricSuggester *)self assetsByPersonLocalIdentifierWithOptions:v48 progress:v59];
    assetsByPersonLocalIdentifier = self->_assetsByPersonLocalIdentifier;
    self->_assetsByPersonLocalIdentifier = v27;

    if (*((unsigned char *)v69 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109378;
        LODWORD(v74[0]) = 388;
        WORD2(v74[0]) = 2080;
        *(void *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }

      goto LABEL_25;
    }
  }
  if (v6)
  {
    double v10 = CFAbsoluteTimeGetCurrent();
    if (v10 - v65[3] >= 0.01)
    {
      v65[3] = v10;
      LOBYTE(info.numer) = 0;
      v6[2](v6, &info, 0.5);
      char v11 = *((unsigned char *)v69 + 24) | LOBYTE(info.numer);
      *((unsigned char *)v69 + 24) = v11;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int buf = 67109378;
          LODWORD(v74[0]) = 391;
          WORD2(v74[0]) = 2080;
          *(void *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPerson"
                                         "CentricSuggester.m";
          double v9 = MEMORY[0x1E4F14500];
          goto LABEL_12;
        }
LABEL_25:
        id v26 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_45;
      }
    }
  }
  unint64_t v12 = [(PGAbstractSuggester *)self session];
  long long v13 = [v12 loggingConnection];
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  double v15 = v13;
  double v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "BirthdayPersonPotentialSuggestions", "", (uint8_t *)&buf, 2u);
  }
  v46 = v16;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v17 = mach_absolute_time();
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v43 = v17;
  uint64_t v19 = [v48 localToday];
  uint64_t v20 = [MEMORY[0x1E4F76C68] monthFromDate:v19];
  id v45 = (void *)v19;
  uint64_t v21 = [MEMORY[0x1E4F76C68] dayFromDate:v19];
  double v22 = [v12 workingContext];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __89__PGRecentPersonCentricSuggester_birthdayPersonPotentialSuggestionsWithOptions_progress___block_invoke_254;
  v50[3] = &unk_1E68E92A8;
  long long v53 = &v64;
  long long v54 = &v68;
  id v44 = v6;
  long long v52 = v44;
  v50[4] = self;
  uint64_t v55 = 0x3F847AE147AE147BLL;
  uint64_t v56 = v20;
  uint64_t v57 = v21;
  id v23 = v18;
  id v51 = v23;
  [v22 performSynchronousConcurrentGraphReadUsingBlock:v50];

  v24 = v12;
  if (*((unsigned char *)v69 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int buf = 67109378;
      LODWORD(v74[0]) = 429;
      WORD2(v74[0]) = 2080;
      *(void *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
      v25 = MEMORY[0x1E4F14500];
LABEL_19:
      _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    uint64_t v29 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    char v32 = v46;
    v33 = v32;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v33, OS_SIGNPOST_INTERVAL_END, v14, "BirthdayPersonPotentialSuggestions", "", (uint8_t *)&buf, 2u);
    }

    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      int buf = 136315394;
      v74[0] = "BirthdayPersonPotentialSuggestions";
      LOWORD(v74[1]) = 2048;
      *(double *)((char *)&v74[1] + 2) = (float)((float)((float)((float)(v29 - v43) * (float)numer) / (float)denom)
                                               / 1000000.0);
      _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
    }
    if (!v6
      || (double v34 = CFAbsoluteTimeGetCurrent(), v34 - v65[3] < 0.01)
      || (v65[3] = v34,
          char v49 = 0,
          v44[2](v44, (mach_timebase_info *)&v49, 0.9),
          char v35 = *((unsigned char *)v69 + 24) | v49,
          (*((unsigned char *)v69 + 24) = v35) == 0))
    {
      char v36 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"relationshipScore" ascending:1];
      v72[0] = v36;
      v37 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"assets.@count" ascending:0];
      v72[1] = v37;
      uint64_t v38 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"personLocalIdentifier" ascending:1];
      v72[2] = v38;
      id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:3];

      [v23 sortUsingDescriptors:v39];
      if (v6
        && (double v40 = CFAbsoluteTimeGetCurrent(), v40 - v65[3] >= 0.01)
        && (v65[3] = v40,
            char v49 = 0,
            v44[2](v44, (mach_timebase_info *)&v49, 1.0),
            char v41 = *((unsigned char *)v69 + 24) | v49,
            (*((unsigned char *)v69 + 24) = v41) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int buf = 67109378;
          LODWORD(v74[0]) = 441;
          WORD2(v74[0]) = 2080;
          *(void *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPerson"
                                         "CentricSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        }
        id v26 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        id v26 = v23;
      }

      goto LABEL_44;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int buf = 67109378;
      LODWORD(v74[0]) = 433;
      WORD2(v74[0]) = 2080;
      *(void *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
      v25 = MEMORY[0x1E4F14500];
      goto LABEL_19;
    }
  }
  id v26 = (id)MEMORY[0x1E4F1CBF0];
LABEL_44:

LABEL_45:
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);

  return v26;
}

void __89__PGRecentPersonCentricSuggester_birthdayPersonPotentialSuggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __89__PGRecentPersonCentricSuggester_birthdayPersonPotentialSuggestionsWithOptions_progress___block_invoke_254(uint64_t a1, void *a2)
{
  id v3 = [a2 graph];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PGRecentPersonCentricSuggester_birthdayPersonPotentialSuggestionsWithOptions_progress___block_invoke_2;
  v7[3] = &unk_1E68E9280;
  id v4 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 72);
  long long v10 = *(_OWORD *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(void **)(a1 + 40);
  id v9 = v4;
  v7[4] = v5;
  long long v12 = *(_OWORD *)(a1 + 80);
  id v8 = v6;
  [v3 enumeratePersonNodesIncludingMe:1 withBlock:v7];
}

void __89__PGRecentPersonCentricSuggester_birthdayPersonPotentialSuggestionsWithOptions_progress___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 48)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8),
        Current - *(double *)(v7 + 24) >= *(double *)(a1 + 72))
    && (*(double *)(v7 + 24) = Current,
        (*(void (**)(double))(*(void *)(a1 + 48) + 16))(0.75),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    id v8 = [v5 localIdentifier];
    if ([v8 length])
    {
      if (([*(id *)(*(void *)(a1 + 32) + 72) containsObject:v8] & 1) == 0)
      {
        id v9 = [v5 birthdayDate];
        if (v9
          || ([v5 potentialBirthdayDate], (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          long long v10 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v8];
          if (v10)
          {
            uint64_t v11 = [MEMORY[0x1E4F76C68] monthFromDate:v9];
            uint64_t v12 = [MEMORY[0x1E4F76C68] dayFromDate:v9];
            if (v11 == *(void *)(a1 + 80) && v12 == *(void *)(a1 + 88))
            {
              long long v13 = -[PGPotentialRecentPersonCentricSuggestion initWithPersonLocalIdentifier:assets:relationshipScore:]([PGPotentialRecentPersonCentricSuggestion alloc], "initWithPersonLocalIdentifier:assets:relationshipScore:", v8, v10, [*(id *)(a1 + 32) relationScoreWithPersonNode:v5]);
              [*(id *)(a1 + 40) addObject:v13];
            }
          }
        }
      }
    }
  }
}

- (unint64_t)relationScoreWithPersonNode:(id)a3
{
  id v3 = a3;
  if ([v3 isMyPartner] & 1) != 0 || (objc_msgSend(v3, "isMyInferredPartner"))
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isMyChild] & 1) != 0 || (objc_msgSend(v3, "isMyInferredChild"))
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isMyParent] & 1) != 0 || (objc_msgSend(v3, "isMyInferredParent"))
  {
    unint64_t v4 = 3;
  }
  else if (([v3 isMemberOfMyFamily] & 1) != 0 {
         || ([v3 isInferredMemberOfMyFamily] & 1) != 0)
  }
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isMyFriend])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isMyInferredFriend])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 6;
  }

  return v4;
}

- (id)assetsByPersonLocalIdentifierWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v31 = a4;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  uint64_t v52 = 0;
  long long v53 = (double *)&v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  v37 = _Block_copy(v31);
  if (!v37
    || (double v6 = CFAbsoluteTimeGetCurrent(), v6 - v53[3] < 0.01)
    || (v53[3] = v6,
        char v51 = 0,
        (*((void (**)(void *, char *, double))v37 + 2))(v37, &v51, 0.0),
        char v7 = *((unsigned char *)v57 + 24) | v51,
        (*((unsigned char *)v57 + 24) = v7) == 0))
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __84__PGRecentPersonCentricSuggester_assetsByPersonLocalIdentifierWithOptions_progress___block_invoke;
    v46[3] = &unk_1E68F03F8;
    id v33 = v37;
    id v47 = v33;
    id v48 = &v52;
    char v49 = &v56;
    uint64_t v50 = 0x3F847AE147AE147BLL;
    uint64_t v30 = [(PGRecentPersonCentricSuggester *)self assetsWithSinglePersonWithOptions:v32 progress:v46];
    if (*((unsigned char *)v57 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 67109378;
        int v63 = 338;
        __int16 v64 = 2080;
        uint64_t v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        id v9 = MEMORY[0x1E4F14500];
LABEL_10:
        _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (!v37
        || (double v10 = CFAbsoluteTimeGetCurrent(), v10 - v53[3] < 0.01)
        || (v53[3] = v10,
            char v51 = 0,
            (*((void (**)(id, char *, double))v33 + 2))(v33, &v51, 0.8),
            char v11 = *((unsigned char *)v57 + 24) | v51,
            (*((unsigned char *)v57 + 24) = v11) == 0))
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        unint64_t v13 = [v30 count];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        obuint64_t j = v30;
        uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v61 count:16];
        if (v14)
        {
          double v15 = 1.0 / (double)v13;
          uint64_t v35 = *(void *)v43;
          double v16 = 0.0;
          while (2)
          {
            uint64_t v36 = v14;
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v43 != v35) {
                objc_enumerationMutation(obj);
              }
              id v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              if (v37)
              {
                double Current = CFAbsoluteTimeGetCurrent();
                if (Current - v53[3] >= 0.01)
                {
                  v53[3] = Current;
                  char v51 = 0;
                  (*((void (**)(id, char *, double))v33 + 2))(v33, &v51, v16 * 0.2 + 0.8);
                  char v20 = *((unsigned char *)v57 + 24) | v51;
                  *((unsigned char *)v57 + 24) = v20;
                  if (v20)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)int buf = 67109378;
                      int v63 = 347;
                      __int16 v64 = 2080;
                      uint64_t v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
                      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }

                    goto LABEL_44;
                  }
                }
              }
              long long v40 = 0u;
              long long v41 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              uint64_t v21 = [v18 clsPersonLocalIdentifiers];
              uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v60 count:16];
              if (v22)
              {
                uint64_t v23 = *(void *)v39;
                do
                {
                  for (uint64_t j = 0; j != v22; ++j)
                  {
                    if (*(void *)v39 != v23) {
                      objc_enumerationMutation(v21);
                    }
                    uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * j);
                    id v26 = [v12 objectForKeyedSubscript:v25];
                    if (!v26)
                    {
                      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                      [v12 setObject:v26 forKeyedSubscript:v25];
                    }
                    [v26 addObject:v18];
                  }
                  uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v60 count:16];
                }
                while (v22);
              }

              double v16 = v15 + v16;
            }
            uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v61 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        if (v37
          && (double v27 = CFAbsoluteTimeGetCurrent(), v27 - v53[3] >= 0.01)
          && (v53[3] = v27,
              char v51 = 0,
              (*((void (**)(id, char *, double))v33 + 2))(v33, &v51, 1.0),
              char v28 = *((unsigned char *)v57 + 24) | v51,
              (*((unsigned char *)v57 + 24) = v28) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int buf = 67109378;
            int v63 = 363;
            __int16 v64 = 2080;
            uint64_t v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_44:
          id v8 = (id)MEMORY[0x1E4F1CC08];
        }
        else
        {
          id v8 = v12;
        }

        goto LABEL_47;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 67109378;
        int v63 = 340;
        __int16 v64 = 2080;
        uint64_t v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        id v9 = MEMORY[0x1E4F14500];
        goto LABEL_10;
      }
    }
    id v8 = (id)MEMORY[0x1E4F1CC08];
LABEL_47:

    goto LABEL_48;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 67109378;
    int v63 = 333;
    __int16 v64 = 2080;
    uint64_t v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v8 = (id)MEMORY[0x1E4F1CC08];
LABEL_48:
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  return v8;
}

void __84__PGRecentPersonCentricSuggester_assetsByPersonLocalIdentifierWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.8);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)assetsWithSinglePersonWithOptions:(id)a3 progress:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 additionalOptions];
  id v9 = [v8 objectForKeyedSubscript:@"assetUUID"];

  double v10 = [v7 universalStartDate];
  char v11 = [v7 universalEndDate];

  id v12 = [(PGRecentPersonCentricSuggester *)self assetsWithSinglePersonBetweenStartDate:v10 andEndDate:v11 matchingAssetUUID:v9 progress:v6];

  return v12;
}

- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(PGSuggestionOptions);
  [(PGSuggestionOptions *)v8 setLocalToday:v7];

  id v9 = [v6 creationDate];
  [(PGSuggestionOptions *)v8 setUniversalStartDate:v9];

  uint64_t v22 = @"assetUUID";
  double v10 = [v6 uuid];
  v23[0] = v10;
  char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  [(PGSuggestionOptions *)v8 setAdditionalOptions:v11];

  [(PGSuggestionOptions *)v8 setMaximumNumberOfSuggestions:1];
  id v12 = [(PGRecentPersonCentricSuggester *)self suggestionsWithOptions:v8 progress:&__block_literal_global_33965];
  if ([v12 count] == 1)
  {
    unint64_t v13 = [v12 firstObject];
    uint64_t v14 = [v13 keyAssets];
    if ([v14 count] == 1)
    {
      uint64_t v21 = [v12 firstObject];
      double v15 = [v21 keyAssets];
      double v16 = [v15 firstObject];
      uint64_t v17 = [v16 uuid];
      id v18 = [v6 uuid];
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
  long long v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v37 = 0;
  long long v38 = (double *)&v37;
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
      *(_DWORD *)int buf = 67109378;
      int v46 = 269;
      __int16 v47 = 2080;
      id v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    -[PGRecentPersonCentricSuggester startSuggestingWithOptions:](self, "startSuggestingWithOptions:", v28, v26);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = [v28 maximumNumberOfSuggestions];
    double v27 = v10;
    unint64_t v12 = 0;
    if (v11) {
      unint64_t v13 = v11;
    }
    else {
      unint64_t v13 = -1;
    }
    double v14 = 0.0;
    double v15 = MEMORY[0x1E4F14500];
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
          *(_DWORD *)int buf = 67109378;
          int v46 = 280;
          __int16 v47 = 2080;
          id v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        int v19 = 1;
      }
      else
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __66__PGRecentPersonCentricSuggester_suggestionsWithOptions_progress___block_invoke;
        v29[3] = &unk_1E68ECB50;
        id v30 = v6;
        id v31 = &v37;
        double v34 = v14;
        double v35 = 1.0 / (double)v13;
        uint64_t v33 = 0x3F847AE147AE147BLL;
        id v32 = &v41;
        uint64_t v20 = [(PGRecentPersonCentricSuggester *)self nextSuggestionWithProgress:v29];
        uint64_t v21 = (void *)v20;
        if (*((unsigned char *)v42 + 24))
        {
          int v19 = 1;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int buf = 67109378;
            int v46 = 285;
            __int16 v47 = 2080;
            id v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
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
          uint64_t v22 = v27;
          goto LABEL_35;
        }
        break;
      }
    }
    uint64_t v22 = v27;
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
        *(_DWORD *)int buf = 67109378;
        int v46 = 295;
        __int16 v47 = 2080;
        id v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
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

void __66__PGRecentPersonCentricSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
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
  unint64_t v4 = [v3 loggingConnection];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v8 = 0;
    _os_log_impl(&dword_1D1805000, v4, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: Resetting", v8, 2u);
  }

  birthdayPersonPotentialSuggestionEnumerator = self->_birthdayPersonPotentialSuggestionEnumerator;
  self->_birthdayPersonPotentialSuggestionEnumerator = 0;

  longTimeNoSeePersonPotentialSuggestionEnumerator = self->_longTimeNoSeePersonPotentialSuggestionEnumerator;
  self->_longTimeNoSeePersonPotentialSuggestionEnumerator = 0;

  personPotentialSuggestionEnumerator = self->_personPotentialSuggestionEnumerator;
  self->_personPotentialSuggestionEnumerator = 0;
}

- (id)nextSuggestionWithProgress:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  unint64_t v4 = (void (**)(void *, unsigned char *, double))_Block_copy(v21);
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v34 = 0;
  double v35 = (double *)&v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  if (v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v35[3] >= 0.01)
    {
      v35[3] = Current;
      char v33 = 0;
      v4[2](v4, &v33, 0.0);
      char v6 = *((unsigned char *)v39 + 24) | v33;
      *((unsigned char *)v39 + 24) = v6;
      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 67109378;
          *(_DWORD *)uint64_t v43 = 220;
          *(_WORD *)&v43[4] = 2080;
          *(void *)&v43[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        uint64_t v7 = 0;
        goto LABEL_45;
      }
    }
  }
  char v8 = [(PGAbstractSuggester *)self session];
  oslog = [v8 loggingConnection];

  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: nextSuggestion", buf, 2u);
  }
  id v9 = 0;
  id v10 = MEMORY[0x1E4F14500];
  do
  {
    if (v9) {
      goto LABEL_32;
    }
    uint64_t v11 = (void *)MEMORY[0x1D25FED50]();
    if (v4
      && (double v12 = CFAbsoluteTimeGetCurrent(), v12 - v35[3] >= 0.01)
      && (v35[3] = v12,
          char v33 = 0,
          v4[2](v4, &v33, 0.5),
          char v13 = *((unsigned char *)v39 + 24) | v33,
          (*((unsigned char *)v39 + 24) = v13) != 0))
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 67109378;
        *(_DWORD *)uint64_t v43 = 227;
        *(_WORD *)&v43[4] = 2080;
        *(void *)&v43[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v9 = 0;
      int v14 = 1;
    }
    else
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __61__PGRecentPersonCentricSuggester_nextSuggestionWithProgress___block_invoke;
      v28[3] = &unk_1E68F03F8;
      double v15 = v4;
      id v29 = v15;
      id v30 = &v34;
      id v31 = &v38;
      uint64_t v32 = 0x3F847AE147AE147BLL;
      uint64_t v16 = [(PGRecentPersonCentricSuggester *)self nextPotentialSuggestionWithProgress:v28];
      uint64_t v17 = (void *)v16;
      if (*((unsigned char *)v39 + 24))
      {
        int v14 = 1;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 67109378;
          *(_DWORD *)uint64_t v43 = 232;
          *(_WORD *)&v43[4] = 2080;
          *(void *)&v43[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v9 = 0;
      }
      else if (v16)
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        void v23[2] = __61__PGRecentPersonCentricSuggester_nextSuggestionWithProgress___block_invoke_249;
        v23[3] = &unk_1E68F03F8;
        char v24 = v15;
        uint64_t v25 = &v34;
        id v26 = &v38;
        uint64_t v27 = 0x3F847AE147AE147BLL;
        id v9 = [(PGRecentPersonCentricSuggester *)self suggestionWithPotentialSuggestion:v17 progress:v23];
        if (*((unsigned char *)v39 + 24))
        {
          int v14 = 1;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int buf = 67109378;
            *(_DWORD *)uint64_t v43 = 241;
            *(_WORD *)&v43[4] = 2080;
            *(void *)&v43[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          int v14 = 0;
        }
      }
      else
      {
        id v9 = 0;
        int v14 = 3;
      }
    }
  }
  while (!v14);
  if (v14 != 3)
  {
LABEL_39:
    uint64_t v7 = 0;
    goto LABEL_44;
  }
  if (v9)
  {
LABEL_32:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 138477827;
      *(void *)uint64_t v43 = v9;
      _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: Suggesting %{private}@", buf, 0xCu);
    }
    if (!v4) {
      goto LABEL_43;
    }
  }
  else
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: Nothing to suggest", buf, 2u);
    }
    id v9 = 0;
    if (!v4) {
      goto LABEL_43;
    }
  }
  double v18 = CFAbsoluteTimeGetCurrent();
  if (v18 - v35[3] >= 0.01)
  {
    v35[3] = v18;
    char v33 = 0;
    v4[2](v4, &v33, 1.0);
    char v19 = *((unsigned char *)v39 + 24) | v33;
    *((unsigned char *)v39 + 24) = v19;
    if (v19)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 67109378;
        *(_DWORD *)uint64_t v43 = 253;
        *(_WORD *)&v43[4] = 2080;
        *(void *)&v43[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_39;
    }
  }
LABEL_43:
  id v9 = v9;
  uint64_t v7 = v9;
LABEL_44:

LABEL_45:
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v7;
}

void __61__PGRecentPersonCentricSuggester_nextSuggestionWithProgress___block_invoke(uint64_t a1, unsigned char *a2)
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

void __61__PGRecentPersonCentricSuggester_nextSuggestionWithProgress___block_invoke_249(uint64_t a1, unsigned char *a2)
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

- (id)suggestionWithPotentialSuggestion:(id)a3 progress:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = (void (**)(void *, void *, double))_Block_copy(v7);
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  char v82 = 0;
  uint64_t v75 = 0;
  v76 = (double *)&v75;
  uint64_t v77 = 0x2020000000;
  uint64_t v78 = 0;
  uint64_t v49 = v7;
  uint64_t v50 = v6;
  if (!v8
    || (double v9 = CFAbsoluteTimeGetCurrent(), v9 - v76[3] < 0.01)
    || (v76[3] = v9,
        LOBYTE(v70[0]) = 0,
        v8[2](v8, v70, 0.0),
        char v10 = *((unsigned char *)v80 + 24) | LOBYTE(v70[0]),
        (*((unsigned char *)v80 + 24) = v10) == 0))
  {
    double v12 = [(PGAbstractSuggester *)self session];
    uint64_t v13 = [v12 loggingConnection];
    char v51 = [v6 personLocalIdentifier];
    int v14 = [v6 assets];
    uint64_t v52 = [MEMORY[0x1E4F39050] fetchFacesGroupedByAssetLocalIdentifierForAssets:v14 options:0];
    __int16 v47 = v12;
    os_log_t oslog = (os_log_t)v13;
    if (v8)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v76[3] >= 0.01)
      {
        v76[3] = Current;
        LOBYTE(v70[0]) = 0;
        v8[2](v8, v70, 0.2);
        char v16 = *((unsigned char *)v80 + 24) | LOBYTE(v70[0]);
        *((unsigned char *)v80 + 24) = v16;
        if (v16)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            uint64_t buf = 0x9704000202;
            LOWORD(v89) = 2080;
            *(void *)((char *)&v89 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecent"
                                            "PersonCentricSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
          }
          uint64_t v11 = 0;
          goto LABEL_49;
        }
      }
    }
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v14, "count"));
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v18 = v14;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v71 objects:v93 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v72 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          double v23 = [v22 localIdentifier];
          [v17 setObject:v22 forKeyedSubscript:v23];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v71 objects:v93 count:16];
      }
      while (v19);
    }

    uint64_t buf = 0;
    *(void *)&long long v89 = &buf;
    *((void *)&v89 + 1) = 0x3032000000;
    v90 = __Block_byref_object_copy__33983;
    v91 = __Block_byref_object_dispose__33984;
    id v92 = 0;
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    v70[3] = 0xFFEFFFFFFFFFFFFFLL;
    uint64_t v66 = 0;
    uint64_t v67 = (double *)&v66;
    uint64_t v68 = 0x2020000000;
    unint64_t v69 = 0xFFEFFFFFFFFFFFFFLL;
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x2020000000;
    v65[3] = 0;
    double v24 = 1.0 / (double)(unint64_t)[v52 count];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __77__PGRecentPersonCentricSuggester_suggestionWithPotentialSuggestion_progress___block_invoke;
    v54[3] = &unk_1E68E9258;
    int v46 = v8;
    id v56 = v46;
    uint64_t v57 = &v75;
    uint64_t v63 = 0x3F847AE147AE147BLL;
    uint64_t v58 = v65;
    char v59 = &v79;
    double v64 = v24;
    id v25 = v51;
    id v55 = v25;
    char v60 = v70;
    uint64_t v61 = &v66;
    p_uint64_t buf = &buf;
    [v52 enumerateKeysAndObjectsUsingBlock:v54];
    if (*((unsigned char *)v80 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_24:
        uint64_t v11 = 0;
LABEL_48:

        _Block_object_dispose(v65, 8);
        _Block_object_dispose(&v66, 8);
        _Block_object_dispose(v70, 8);
        _Block_object_dispose(&buf, 8);

LABEL_49:
        goto LABEL_50;
      }
      int v84 = 67109378;
      int v85 = 183;
      __int16 v86 = 2080;
      v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
      id v26 = MEMORY[0x1E4F14500];
LABEL_23:
      _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v84, 0x12u);
      goto LABEL_24;
    }
    if (v8)
    {
      double v27 = CFAbsoluteTimeGetCurrent();
      if (v27 - v76[3] >= 0.01)
      {
        v76[3] = v27;
        char v53 = 0;
        ((void (**)(void *, char *, double))v46)[2](v46, &v53, 0.8);
        char v28 = *((unsigned char *)v80 + 24) | v53;
        *((unsigned char *)v80 + 24) = v28;
        if (v28)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_24;
          }
          int v84 = 67109378;
          int v85 = 185;
          __int16 v86 = 2080;
          v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          id v26 = MEMORY[0x1E4F14500];
          goto LABEL_23;
        }
      }
    }
    if (v67[3] >= 0.15
      && ([v17 objectForKeyedSubscript:*(void *)(v89 + 40)],
          (id v29 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v30 = [[PGPeopleCentricSuggestion alloc] initWithPersonLocalIdentifier:v25 asset:v29];
      id v31 = [v47 photoLibrary];
      uint64_t v32 = [v31 librarySpecificFetchOptions];

      char v33 = (void *)MEMORY[0x1E4F391F0];
      uint64_t v34 = [v50 personLocalIdentifier];
      v83 = v34;
      double v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
      uint64_t v44 = [v33 fetchPersonsWithLocalIdentifiers:v35 options:v32];

      uint64_t v36 = [v44 firstObject];
      long long v45 = [v36 displayName];

      uint64_t v37 = [v45 length];
      uint64_t v38 = v45;
      if (!v37)
      {
        char v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v38 = [v33 localizedStringForKey:@"PGPeopleTitleFormatGenericUnnamedPerson" value:@"PGPeopleTitleFormatGenericUnnamedPerson" table:@"Localizable"];
      }
      [(PGSingleAssetSuggestion *)v30 setTitle:v38];
      if (!v37)
      {
      }
      uint64_t v39 = [v29 localCreationDate];
      uint64_t v40 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v39 dateStyle:2 timeStyle:0];
      [(PGSingleAssetSuggestion *)v30 setSubtitle:v40];

      if (!v8) {
        goto LABEL_46;
      }
    }
    else
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v84) = 0;
        _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: no eligible best asset, cannot generate suggestion", (uint8_t *)&v84, 2u);
      }
      id v29 = 0;
      id v30 = 0;
      if (!v8) {
        goto LABEL_46;
      }
    }
    double v41 = CFAbsoluteTimeGetCurrent();
    if (v41 - v76[3] >= 0.01)
    {
      v76[3] = v41;
      char v53 = 0;
      ((void (**)(void *, char *, double))v46)[2](v46, &v53, 1.0);
      char v42 = *((unsigned char *)v80 + 24) | v53;
      *((unsigned char *)v80 + 24) = v42;
      if (v42)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int v84 = 67109378;
          int v85 = 212;
          __int16 v86 = 2080;
          v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v84, 0x12u);
        }
        uint64_t v11 = 0;
        goto LABEL_47;
      }
    }
LABEL_46:
    uint64_t v11 = v30;
LABEL_47:

    goto LABEL_48;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0x8D04000202;
    LOWORD(v89) = 2080;
    *(void *)((char *)&v89 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  uint64_t v11 = 0;
LABEL_50:
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);

  return v11;
}

void __77__PGRecentPersonCentricSuggester_suggestionWithPotentialSuggestion_progress___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  if (*(void *)(a1 + 40)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8),
        Current - *(double *)(v11 + 24) >= *(double *)(a1 + 96))
    && (*(double *)(v11 + 24) = Current,
        char v32 = 0,
        (*(void (**)(double))(*(void *)(a1 + 40) + 16))(*(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                 + 24)
                                                                     * 0.6 + 0.2),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    obuint64_t j = a2;
    double v12 = v8;
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 104)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v19 = [v18 personLocalIdentifier];
          int v20 = [v19 isEqualToString:*(void *)(a1 + 32)];

          if (v20)
          {
            [v18 quality];
            double v22 = v21;
            [v18 size];
            double v24 = v23;
            double v25 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
            id v8 = v12;
            if (v22 > v25
              || v22 == v25
              && ((double v26 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), v24 > v26)
               || v24 == v26
               && [v12 compare:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)] == -1))
            {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), obj);
              *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v22;
              *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v24;
            }

            goto LABEL_19;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v8 = v12;
  }
LABEL_19:
}

- (id)nextPotentialSuggestionWithProgress:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _Block_copy(v4);
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = (double *)&v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  if (!v5
    || (double v6 = CFAbsoluteTimeGetCurrent(), v6 - v36[3] < 0.01)
    || (v36[3] = v6,
        char v34 = 0,
        (*((void (**)(void *, char *, double))v5 + 2))(v5, &v34, 0.0),
        char v7 = *((unsigned char *)v40 + 24) | v34,
        (*((unsigned char *)v40 + 24) = v7) == 0))
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __70__PGRecentPersonCentricSuggester_nextPotentialSuggestionWithProgress___block_invoke;
    v29[3] = &unk_1E68F03F8;
    id v9 = v5;
    id v30 = v9;
    long long v31 = &v35;
    char v32 = &v39;
    uint64_t v33 = 0x3F847AE147AE147BLL;
    id v10 = [(PGRecentPersonCentricSuggester *)self nextBirthdayPersonPotentialSuggestionWithProgress:v29];
    if (*((unsigned char *)v40 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        int v44 = 112;
        __int16 v45 = 2080;
        int v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        uint64_t v11 = MEMORY[0x1E4F14500];
LABEL_10:
        _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (v5)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v36[3] >= 0.01)
        {
          v36[3] = Current;
          char v34 = 0;
          (*((void (**)(id, char *, double))v9 + 2))(v9, &v34, 0.33);
          char v14 = *((unsigned char *)v40 + 24) | v34;
          *((unsigned char *)v40 + 24) = v14;
          if (v14)
          {
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
              goto LABEL_11;
            }
            *(_DWORD *)uint64_t buf = 67109378;
            int v44 = 114;
            __int16 v45 = 2080;
            int v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            uint64_t v11 = MEMORY[0x1E4F14500];
            goto LABEL_10;
          }
        }
      }
      if (!v10)
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __70__PGRecentPersonCentricSuggester_nextPotentialSuggestionWithProgress___block_invoke_233;
        v24[3] = &unk_1E68F03F8;
        id v25 = v9;
        double v26 = &v35;
        double v27 = &v39;
        uint64_t v28 = 0x3F847AE147AE147BLL;
        id v10 = [(PGRecentPersonCentricSuggester *)self nextLongTimeNoSeePersonPotentialSuggestionWithProgress:v24];
        if (*((unsigned char *)v40 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v44 = 120;
            __int16 v45 = 2080;
            int v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_11;
        }
      }
      if (v5)
      {
        double v15 = CFAbsoluteTimeGetCurrent();
        if (v15 - v36[3] >= 0.01)
        {
          v36[3] = v15;
          char v34 = 0;
          (*((void (**)(id, char *, double))v9 + 2))(v9, &v34, 0.66);
          char v16 = *((unsigned char *)v40 + 24) | v34;
          *((unsigned char *)v40 + 24) = v16;
          if (v16)
          {
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
              goto LABEL_11;
            }
            *(_DWORD *)uint64_t buf = 67109378;
            int v44 = 123;
            __int16 v45 = 2080;
            int v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            uint64_t v11 = MEMORY[0x1E4F14500];
            goto LABEL_10;
          }
        }
      }
      if (!v10)
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __70__PGRecentPersonCentricSuggester_nextPotentialSuggestionWithProgress___block_invoke_234;
        v19[3] = &unk_1E68F03F8;
        id v20 = v9;
        double v21 = &v35;
        double v22 = &v39;
        uint64_t v23 = 0x3F847AE147AE147BLL;
        id v10 = [(PGRecentPersonCentricSuggester *)self nextPersonPotentialSuggestionWithProgress:v19];
        if (*((unsigned char *)v40 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v44 = 130;
            __int16 v45 = 2080;
            int v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_11;
        }
      }
      if (!v5
        || (double v17 = CFAbsoluteTimeGetCurrent(), v17 - v36[3] < 0.01)
        || (v36[3] = v17,
            char v34 = 0,
            (*((void (**)(id, char *, double))v9 + 2))(v9, &v34, 1.0),
            char v18 = *((unsigned char *)v40 + 24) | v34,
            (*((unsigned char *)v40 + 24) = v18) == 0))
      {
        id v10 = v10;
        id v8 = v10;
        goto LABEL_12;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        int v44 = 133;
        __int16 v45 = 2080;
        int v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        uint64_t v11 = MEMORY[0x1E4F14500];
        goto LABEL_10;
      }
    }
LABEL_11:
    id v8 = 0;
LABEL_12:

    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    int v44 = 107;
    __int16 v45 = 2080;
    int v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v8 = 0;
LABEL_13:
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v8;
}

void __70__PGRecentPersonCentricSuggester_nextPotentialSuggestionWithProgress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.33);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __70__PGRecentPersonCentricSuggester_nextPotentialSuggestionWithProgress___block_invoke_233(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.33 + 0.33);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __70__PGRecentPersonCentricSuggester_nextPotentialSuggestionWithProgress___block_invoke_234(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.33 + 0.66);
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
  double v6 = [v5 loggingConnection];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: Starting suggesting", buf, 2u);
  }

  assetsByPersonLocalIdentifier = self->_assetsByPersonLocalIdentifier;
  self->_assetsByPersonLocalIdentifier = 0;

  birthdayPersonPotentialSuggestions = self->_birthdayPersonPotentialSuggestions;
  self->_birthdayPersonPotentialSuggestions = 0;

  longTimeNoSeePersonPotentialSuggestions = self->_longTimeNoSeePersonPotentialSuggestions;
  self->_longTimeNoSeePersonPotentialSuggestions = 0;

  personPotentialSuggestions = self->_personPotentialSuggestions;
  self->_personPotentialSuggestions = 0;

  birthdayPersonPotentialSuggestionEnumerator = self->_birthdayPersonPotentialSuggestionEnumerator;
  self->_birthdayPersonPotentialSuggestionEnumerator = 0;

  longTimeNoSeePersonPotentialSuggestionEnumerator = self->_longTimeNoSeePersonPotentialSuggestionEnumerator;
  self->_longTimeNoSeePersonPotentialSuggestionEnumerator = 0;

  personPotentialSuggestionEnumerator = self->_personPotentialSuggestionEnumerator;
  self->_personPotentialSuggestionEnumerator = 0;

  char v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  usedPersonLocalIdentifiers = self->_usedPersonLocalIdentifiers;
  self->_usedPersonLocalIdentifiers = v14;

  char v16 = [v5 workingContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__PGRecentPersonCentricSuggester_startSuggestingWithOptions___block_invoke;
  v19[3] = &unk_1E68F0848;
  void v19[4] = self;
  [v16 performSynchronousConcurrentGraphReadUsingBlock:v19];

  options = self->_options;
  self->_options = v4;
  char v18 = v4;
}

void __61__PGRecentPersonCentricSuggester_startSuggestingWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 graph];
  id v3 = [v5 meNodeWithFallbackInferredMeNode];
  id v4 = [v3 localIdentifier];
  if ([v4 length]) {
    [*(id *)(*(void *)(a1 + 32) + 72) addObject:v4];
  }
}

@end