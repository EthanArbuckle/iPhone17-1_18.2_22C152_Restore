@interface PHAWallpaperShuffleDescriptorGenerator
+ (id)displayNameLocalizationKeyForTopSubtype:(unsigned __int16)a3;
+ (unsigned)wallpaperTopSubtypeFromShuffleSubtype:(unsigned __int16)a3;
- (PHAWallpaperShuffleDescriptorGenerator)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4;
- (id)allVIPShufflePosterDescriptorFromEligiblePersonLocalIdentifiers:(id)a3;
- (id)baseSuggestionFetchOptionsWithSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4 suggestionUUIDsToAvoid:(id)a5;
- (id)descriptorForSuggestion:(id)a3;
- (id)fetchSuggestionWithSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4;
- (id)peopleShufflePosterDescriptors;
- (id)shuffleDescriptorEligiblePersonLocalIdentifiers;
- (id)shuffleDescriptorsForDonation;
- (id)shufflePosterDescriptorForShuffleSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4 suggestionUUIDsToAvoid:(id)a5 requireMinimumShuffleCount:(BOOL)a6;
- (id)shuffleVIPPersonLocalIdentifiers;
- (id)suggestionPersonLocalIdentifiersFromSuggestions:(id)a3;
@end

@implementation PHAWallpaperShuffleDescriptorGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);

  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (id)fetchSuggestionWithSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4
{
  v4 = [(PHAWallpaperShuffleDescriptorGenerator *)self baseSuggestionFetchOptionsWithSubtype:a3 personLocalIdentifiers:a4 suggestionUUIDsToAvoid:0];
  v5 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v4];

  return v5;
}

- (id)baseSuggestionFetchOptionsWithSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4 suggestionUUIDsToAvoid:(id)a5
{
  unsigned int v6 = a3;
  v24[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v24[0] = v11;
  v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v24[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  [v10 setSortDescriptors:v13];

  id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v23[0] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"subtype", v6);
  v23[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v18 = (void *)[v14 initWithArray:v17];

  if (v8)
  {
    v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"context", v8];
    [v18 addObject:v19];
  }
  if (v9)
  {
    v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"uuid", v9];
    [v18 addObject:v20];
  }
  v21 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v18];
  [v10 setPredicate:v21];

  return v10;
}

- (id)suggestionPersonLocalIdentifiersFromSuggestions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "context", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)descriptorForSuggestion:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F38EB8];
  v35 = self;
  uint64_t v6 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  uint64_t v7 = [v5 fetchKeyAssetsInAssetCollection:v4 options:v6];
  uint64_t v8 = [v7 firstObject];

  id v9 = [v4 uuid];
  uint64_t v10 = [v4 subtype];
  id v11 = objc_alloc(MEMORY[0x1E4F8CD28]);
  v34 = v8;
  long long v12 = [v8 uuid];
  long long v13 = (void *)[v11 initWithAssetUUID:v12 suggestionUUID:v9 suggestionSubtype:v10];

  id v14 = objc_alloc(MEMORY[0x1E4F8CD00]);
  v39[0] = v13;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  uint64_t v16 = 2;
  uint64_t v17 = (void *)[v14 initWithDescriptorType:2 media:v15];

  v18 = NSString;
  v19 = (void *)MEMORY[0x1E4F8CD00];
  v38 = v9;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v21 = [v19 descriptorIdentifierForDescriptorType:2 uuids:v20];
  v22 = PHSuggestionStringWithSubtype();
  v23 = [v18 stringWithFormat:@"%@|%@", v21, v22];
  [v17 setIdentifier:v23];

  v24 = (void *)[objc_alloc(MEMORY[0x1E4F8CD38]) initWithShuffleType:0];
  [v17 setShuffleConfiguration:v24];
  if (v10 == 604)
  {
    uint64_t v16 = 4;
    goto LABEL_6;
  }
  if (v10 == 603)
  {
LABEL_6:
    [v24 setShuffleSmartAlbums:v16];
    goto LABEL_15;
  }
  v25 = v35;
  if (v10 == 602)
  {
    [v24 setShuffleSmartAlbums:1];
LABEL_10:
    v27 = [v4 context];
    if (v27)
    {
      v28 = [MEMORY[0x1E4F1CAD0] setWithObject:v27];
      [v24 setPersonLocalIdentifiers:v28];
    }
    else
    {
      loggingConnection = v25->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v9;
        _os_log_error_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_ERROR, "[PHAWallpaperShuffleDescriptorGenerator] Person Suggestion %@ has nil context.", buf, 0xCu);
      }
    }

    goto LABEL_15;
  }
  v26 = v35->_loggingConnection;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v32 = v26;
    v33 = PHSuggestionStringWithSubtype();
    *(_DWORD *)buf = 138412290;
    v37 = v33;
    _os_log_error_impl(&dword_1D21F2000, v32, OS_LOG_TYPE_ERROR, "[PHAWallpaperShuffleDescriptorGenerator] Unsupported shuffle descriptor type: %@", buf, 0xCu);

    v25 = v35;
  }
  [v24 setShuffleSmartAlbums:0];
  if (v10 == 652) {
    goto LABEL_10;
  }
LABEL_15:
  v30 = [(id)objc_opt_class() displayNameLocalizationKeyForTopSubtype:v10];
  [v17 setDisplayNameLocalizationKey:v30];

  return v17;
}

- (id)shuffleDescriptorEligiblePersonLocalIdentifiers
{
  v39[1] = *MEMORY[0x1E4F143B8];
  v28 = [MEMORY[0x1E4F8E858] fetchPersonLocalIdentifiersForSuggestionSubtype:602 photoLibrary:self->_photoLibrary];
  v27 = -[PHAWallpaperShuffleDescriptorGenerator baseSuggestionFetchOptionsWithSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:](self, "baseSuggestionFetchOptionsWithSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:", 652);
  v26 = objc_msgSend(MEMORY[0x1E4F39310], "fetchSuggestionsWithOptions:");
  id v3 = -[PHAWallpaperShuffleDescriptorGenerator suggestionPersonLocalIdentifiersFromSuggestions:](self, "suggestionPersonLocalIdentifiersFromSuggestions:");
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37[0] = v3;
    _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Shuffle people local identifiers with count: %@", buf, 0xCu);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __89__PHAWallpaperShuffleDescriptorGenerator_shuffleDescriptorEligiblePersonLocalIdentifiers__block_invoke;
  v33[3] = &unk_1E6918A38;
  id v34 = v3;
  id v6 = v5;
  id v35 = v6;
  id v25 = v34;
  [v34 enumerateObjectsUsingBlock:v33];
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"count" ascending:0];
  v39[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  id v9 = (id)[v6 sortedArrayUsingDescriptors:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
LABEL_5:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v30 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
      uint64_t v17 = [v16 count];
      uint64_t v18 = [v17 integerValue];
      int64_t shuffleMinimumSuggestionRequired = self->_shuffleMinimumSuggestionRequired;

      if (v18 >= shuffleMinimumSuggestionRequired)
      {
        v20 = [v16 personLocalIdentifer];
        [v10 addObject:v20];
      }
      if ((unint64_t)[v10 count] > 5) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v13) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  v21 = self->_loggingConnection;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    int v23 = [v10 count];
    *(_DWORD *)buf = 67109378;
    LODWORD(v37[0]) = v23;
    WORD2(v37[0]) = 2112;
    *(void *)((char *)v37 + 6) = v10;
    _os_log_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Found %d people eligible for shuffle descriptor. %@", buf, 0x12u);
  }

  return v10;
}

void __89__PHAWallpaperShuffleDescriptorGenerator_shuffleDescriptorEligiblePersonLocalIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [_PHAWallpaperSuggestionCount alloc];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "countForObject:", v3));
  id v6 = [(_PHAWallpaperSuggestionCount *)v4 initWithPersonLocalIdentifier:v3 count:v5];

  [*(id *)(a1 + 40) addObject:v6];
}

- (id)shuffleVIPPersonLocalIdentifiers
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F39338]) initWithPhotoLibrary:self->_photoLibrary];
  id v4 = [v3 personUUIDsWithNegativeFeedback];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
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
        id v11 = objc_msgSend(MEMORY[0x1E4F391F0], "localIdentifierWithUUID:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [MEMORY[0x1E4F8E858] fetchPersonLocalIdentifiersForSuggestionSubtype:602 photoLibrary:self->_photoLibrary];
  uint64_t v13 = [MEMORY[0x1E4F8E858] fetchPersonLocalIdentifiersForSuggestionSubtype:652 photoLibrary:self->_photoLibrary];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v12];
  [v14 intersectSet:v13];
  [v14 minusSet:v5];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = loggingConnection;
    uint64_t v17 = [v14 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_1D21F2000, v16, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Found %td shuffle VIP. %@", buf, 0x16u);
  }

  return v14;
}

- (id)allVIPShufflePosterDescriptorFromEligiblePersonLocalIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] > 1)
  {
    uint64_t v7 = [v4 allObjects];
    uint64_t v8 = objc_msgSend(v7, "objectAtIndex:", -[PFPseudoRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", objc_msgSend(v7, "count")));
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
    id v6 = [(PHAWallpaperShuffleDescriptorGenerator *)self shufflePosterDescriptorForShuffleSubtype:652 personLocalIdentifiers:v9 suggestionUUIDsToAvoid:0 requireMinimumShuffleCount:0];

    if (v6)
    {
      id v10 = [v6 shuffleConfiguration];
      [v10 setPersonLocalIdentifiers:v4];

      id v11 = NSString;
      uint64_t v12 = [MEMORY[0x1E4F8CD00] descriptorTypeStringWithType:2];
      uint64_t v13 = [v11 stringWithFormat:@"%@|%@", v12, @"All-VIP"];
      [v6 setIdentifier:v13];

      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F8D988], "peopleShuffleDescriptorTitleWithCount:", objc_msgSend(v7, "count"));
      [v6 setDisplayNameLocalizationKey:v14];
    }
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v6;
      _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Created all-vip shuffle poster descriptor %@", buf, 0xCu);
    }
  }
  else
  {
    id v5 = self->_loggingConnection;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v5, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Less than 2 eligible VIPs. Skip 'All-VIP' shuffle poster descriptor", buf, 2u);
    }
    id v6 = 0;
  }

  return v6;
}

- (id)peopleShufflePosterDescriptors
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v28 = [(PHAWallpaperShuffleDescriptorGenerator *)self shuffleVIPPersonLocalIdentifiers];
  uint64_t v4 = -[PHAWallpaperShuffleDescriptorGenerator allVIPShufflePosterDescriptorFromEligiblePersonLocalIdentifiers:](self, "allVIPShufflePosterDescriptorFromEligiblePersonLocalIdentifiers:");
  uint64_t v26 = v4;
  if (v4)
  {
    id v5 = (void *)v4;
    objc_msgSend(v3, "addObject:", v4, v4);
    id v6 = [v5 media];
    uint64_t v7 = [v6 firstObject];

    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v9 = [v7 suggestionUUID];
      id v10 = [v8 setWithObject:v9];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  [(PHAWallpaperShuffleDescriptorGenerator *)self shuffleDescriptorEligiblePersonLocalIdentifiers];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v30)
  {
    uint64_t v11 = *(void *)v32;
    unint64_t v12 = 0x1E4F1C000uLL;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v15 = (void *)MEMORY[0x1D26057A0]();
        uint64_t v16 = [*(id *)(v12 + 2768) setWithObject:v14];
        uint64_t v17 = [(PHAWallpaperShuffleDescriptorGenerator *)self shufflePosterDescriptorForShuffleSubtype:652 personLocalIdentifiers:v16 suggestionUUIDsToAvoid:v10 requireMinimumShuffleCount:1];
        [v17 setDisplayNameLocalizationKey:@"PHOTOS_WALLPAPER_DESCRIPTOR_TITLE_SMART_ALBUM_ONE_PERSON"];
        if (v17)
        {
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = loggingConnection;
            [v17 identifier];
            uint64_t v20 = v11;
            long long v21 = self;
            long long v22 = v10;
            v24 = id v23 = v3;
            *(_DWORD *)buf = 138412290;
            v36 = v24;
            _os_log_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Created Shuffle Poster Descriptor: %@", buf, 0xCu);

            id v3 = v23;
            id v10 = v22;
            self = v21;
            uint64_t v11 = v20;
            unint64_t v12 = 0x1E4F1C000;
          }
          [v3 addObject:v17];
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v30);
  }

  return v3;
}

- (id)shufflePosterDescriptorForShuffleSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4 suggestionUUIDsToAvoid:(id)a5 requireMinimumShuffleCount:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = PHSuggestionStringWithSubtype();
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v38 = (uint64_t)v12;
    __int16 v39 = 2112;
    id v40 = v10;
    _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Fetching suggestion with subtype (%@), personLocalIdentifiers %@", buf, 0x16u);
  }
  uint64_t v14 = [(PHAWallpaperShuffleDescriptorGenerator *)self fetchSuggestionWithSubtype:v8 personLocalIdentifiers:v10];
  uint64_t v15 = v14;
  if (v6 && (unint64_t)[v14 count] < self->_shuffleMinimumSuggestionRequired)
  {
    uint64_t v16 = self->_loggingConnection;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v16;
      uint64_t v18 = [v15 count];
      int64_t shuffleMinimumSuggestionRequired = self->_shuffleMinimumSuggestionRequired;
      *(_DWORD *)buf = 134218754;
      uint64_t v38 = v18;
      __int16 v39 = 2112;
      id v40 = v12;
      __int16 v41 = 2048;
      int64_t v42 = shuffleMinimumSuggestionRequired;
      __int16 v43 = 2112;
      v44 = v12;
      _os_log_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Found %lu %@ suggestions, required %lu, skipping creating shuffle descriptor for %@", buf, 0x2Au);
    }
    uint64_t v20 = 0;
  }
  else
  {
    long long v21 = (void *)MEMORY[0x1E4F38EB8];
    long long v22 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    id v23 = [v21 fetchKeyAssetBySuggestionUUIDForSuggestions:v15 options:v22];

    uint64_t v24 = -[PHAWallpaperShuffleDescriptorGenerator baseSuggestionFetchOptionsWithSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:](self, "baseSuggestionFetchOptionsWithSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:", [(id)objc_opt_class() wallpaperTopSubtypeFromShuffleSubtype:v8], 0, v11);
    __int16 v25 = (void *)MEMORY[0x1E4F39310];
    uint64_t v26 = [v23 allValues];
    v27 = [v25 fetchAssetCollectionsContainingAssets:v26 withType:8 options:v24];

    if ([v27 count])
    {
      uint64_t v28 = objc_msgSend(v27, "objectAtIndex:", -[PFPseudoRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", objc_msgSend(v27, "count")));
      uint64_t v20 = [(PHAWallpaperShuffleDescriptorGenerator *)self descriptorForSuggestion:v28];
      long long v29 = self->_loggingConnection;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = v29;
        [v20 identifier];
        id v36 = v10;
        long long v31 = v12;
        v33 = id v32 = v11;
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = (uint64_t)v33;
        _os_log_impl(&dword_1D21F2000, v30, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Created Shuffle Poster Descriptor: %@", buf, 0xCu);

        id v11 = v32;
        unint64_t v12 = v31;
        id v10 = v36;
      }
    }
    else
    {
      long long v34 = self->_loggingConnection;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v34, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] No assets exist in both top & shuffle suggestions. Skipping creating shuffle descriptor", buf, 2u);
      }
      uint64_t v20 = 0;
    }
  }

  return v20;
}

- (id)shuffleDescriptorsForDonation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = self->_loggingConnection;
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)v3);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v5 = v3;
  BOOL v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "WallpaperShuffleDescriptorGeneration", "", buf, 2u);
  }

  uint64_t v7 = mach_absolute_time();
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [(PHAWallpaperShuffleDescriptorGenerator *)self shufflePosterDescriptorForShuffleSubtype:653 personLocalIdentifiers:0 suggestionUUIDsToAvoid:0 requireMinimumShuffleCount:1];
  if (v9) {
    [v8 addObject:v9];
  }
  id v10 = [(PHAWallpaperShuffleDescriptorGenerator *)self shufflePosterDescriptorForShuffleSubtype:654 personLocalIdentifiers:0 suggestionUUIDsToAvoid:0 requireMinimumShuffleCount:1];
  if (v10) {
    [v8 addObject:v10];
  }
  __int16 v25 = [(PHAWallpaperShuffleDescriptorGenerator *)self peopleShufflePosterDescriptors];
  objc_msgSend(v8, "addObjectsFromArray:");
  uint64_t v11 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v14 = v6;
  uint64_t v15 = v14;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v15, OS_SIGNPOST_INTERVAL_END, v4, "WallpaperShuffleDescriptorGeneration", "", buf, 2u);
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v33 = "WallpaperShuffleDescriptorGeneration";
    __int16 v34 = 2048;
    double v35 = (float)((float)((float)((float)(v11 - v7) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = [*(id *)(*((void *)&v26 + 1) + 8 * i) identifier];
        [v16 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v19);
  }

  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v33 = (const char *)v16;
    _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Generated shuffle descriptors: %@", buf, 0xCu);
  }

  return v17;
}

- (PHAWallpaperShuffleDescriptorGenerator)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PHAWallpaperShuffleDescriptorGenerator;
  uint64_t v9 = [(PHAWallpaperShuffleDescriptorGenerator *)&v17 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
    uint64_t v11 = [MEMORY[0x1E4F8E858] randomNumberGeneratorForWallpaperDonation];
    randomNumberGenerator = v10->_randomNumberGenerator;
    v10->_randomNumberGenerator = (PFPseudoRandomNumberGenerator *)v11;

    v10->_int64_t shuffleMinimumSuggestionRequired = 25;
    uint64_t v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v14 = [v13 integerForKey:@"PHAWallpaperSuggestionShuffleMinimumSuggestionRequired"];

    if (v14 >= 1)
    {
      loggingConnection = v10->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v19 = v14;
        _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] PHAWallpaperSuggestionShuffleMinimumSuggestionRequired overwrite to %d", buf, 8u);
      }
      v10->_int64_t shuffleMinimumSuggestionRequired = v14;
    }
  }

  return v10;
}

+ (id)displayNameLocalizationKeyForTopSubtype:(unsigned __int16)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((a3 - 602) < 3) {
    return off_1E6918A58[(unsigned __int16)(a3 - 602)];
  }
  int v4 = a3;
  id v5 = PLWallpaperGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_error_impl(&dword_1D21F2000, v5, OS_LOG_TYPE_ERROR, "[PHAWallpaperShuffleDescriptorGenerator] wallpaperTopSubtypeFromShuffleSubtype called with %d. This method should only take in non-top wallpaper subtypes.", (uint8_t *)v6, 8u);
  }

  return 0;
}

+ (unsigned)wallpaperTopSubtypeFromShuffleSubtype:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((a3 & 0xFFFC) == 0x28C) {
    return a3 - 50;
  }
  id v5 = PLWallpaperGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_error_impl(&dword_1D21F2000, v5, OS_LOG_TYPE_ERROR, "[PHAWallpaperShuffleDescriptorGenerator] wallpaperTopSubtypeFromShuffleSubtype called with %d. This method should only take in non-top wallpaper subtypes.", (uint8_t *)v7, 8u);
  }

  return 0;
}

@end