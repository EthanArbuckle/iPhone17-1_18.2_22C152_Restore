@interface PFCShuffleDataSource
- (BOOL)hasCityscape;
- (BOOL)hasNature;
- (BOOL)hasPeople;
- (BOOL)hasPets;
- (BOOL)hasSuggestions;
- (BOOL)hasSuggestionsForShuffleSubtype:(unsigned __int16)a3 persons:(id)a4 minimumCount:(int64_t)a5;
- (BOOL)hasSuggestionsForSubtype:(unsigned __int16)a3;
- (NSArray)sortedTopAmbientPeople;
- (NSSet)ambientPeople;
- (NSSet)topAmbientPeople;
- (PFCShuffleDataSource)initWithPhotoLibrary:(id)a3;
- (PHPhotoLibrary)photoLibrary;
- (id)baseSuggestionFetchOptionsWithSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4;
- (id)fetchPersonLocalIdentifiersForSuggestionSubtype:(unsigned __int16)a3 photoLibrary:(id)a4;
- (unint64_t)numberOfCityscapeSuggestions;
- (unint64_t)numberOfNatureSuggestions;
- (unint64_t)numberOfPeopleSuggestions;
- (unint64_t)numberOfPetSuggestions;
- (unint64_t)numberOfSuggestionsForShuffleSubtype:(unsigned __int16)a3 persons:(id)a4;
- (unint64_t)numberOfSuggestionsForTopPerson:(id)a3;
- (void)calculateAvailableShuffles;
- (void)calculatePeople;
- (void)calculatePeopleCount;
@end

@implementation PFCShuffleDataSource

- (PFCShuffleDataSource)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFCShuffleDataSource;
  v6 = [(PFCShuffleDataSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    [(PFCShuffleDataSource *)v7 calculateAvailableShuffles];
  }

  return v7;
}

- (BOOL)hasSuggestionsForSubtype:(unsigned __int16)a3
{
  int v3 = a3;
  id v5 = PHSuggestionStringWithSubtype();
  switch(v3)
  {
    case 801:
      BOOL v6 = [(PFCShuffleDataSource *)self hasNature];
      goto LABEL_9;
    case 802:
      BOOL v6 = [(PFCShuffleDataSource *)self hasCityscape];
      goto LABEL_9;
    case 803:
      BOOL v6 = [(PFCShuffleDataSource *)self hasPets];
      goto LABEL_9;
    case 804:
      BOOL v6 = [(PFCShuffleDataSource *)self hasPeople];
LABEL_9:
      BOOL v8 = v6;
      break;
    default:
      v7 = pfc_shuffle_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PFCShuffleDataSource hasSuggestionsForSubtype:]((uint64_t)v5, v7);
      }

      BOOL v8 = 0;
      break;
  }

  return v8;
}

- (unint64_t)numberOfSuggestionsForTopPerson:(id)a3
{
  v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  unint64_t v5 = [(PFCShuffleDataSource *)self numberOfSuggestionsForShuffleSubtype:602 persons:v4];

  return v5;
}

- (unint64_t)numberOfSuggestionsForShuffleSubtype:(unsigned __int16)a3 persons:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [(PFCShuffleDataSource *)self baseSuggestionFetchOptionsWithSubtype:v4 personLocalIdentifiers:v6];
  BOOL v8 = [MEMORY[0x263F14F50] fetchSuggestionsWithOptions:v7];
  objc_super v9 = PHSuggestionStringWithSubtype();
  v10 = pfc_shuffle_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218498;
    uint64_t v14 = [v8 count];
    __int16 v15 = 2112;
    v16 = v9;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_25932E000, v10, OS_LOG_TYPE_DEFAULT, "[PFCShuffleDataSource] Fetched (%lu) suggestions with subtype (%@), personLocalIdentifiers %@", (uint8_t *)&v13, 0x20u);
  }

  unint64_t v11 = [v8 count];
  return v11;
}

- (BOOL)hasSuggestionsForShuffleSubtype:(unsigned __int16)a3 persons:(id)a4 minimumCount:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v6 = -[PFCShuffleDataSource numberOfSuggestionsForShuffleSubtype:persons:](self, "numberOfSuggestionsForShuffleSubtype:persons:");
  v7 = PHSuggestionStringWithSubtype();
  if (v6 < a5)
  {
    BOOL v8 = pfc_shuffle_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218754;
      unint64_t v11 = v6;
      __int16 v12 = 2112;
      int v13 = v7;
      __int16 v14 = 2048;
      int64_t v15 = a5;
      __int16 v16 = 2112;
      __int16 v17 = v7;
      _os_log_impl(&dword_25932E000, v8, OS_LOG_TYPE_DEFAULT, "[PFCShuffleDataSource] Found %lu %@ suggestions, required %lu, skipping creating shuffle descriptor for %@", (uint8_t *)&v10, 0x2Au);
    }
  }
  return v6 >= a5;
}

- (void)calculateAvailableShuffles
{
  self->_numberOfNatureSuggestions = [(PFCShuffleDataSource *)self numberOfSuggestionsForShuffleSubtype:801 persons:0];
  self->_numberOfPetSuggestions = [(PFCShuffleDataSource *)self numberOfSuggestionsForShuffleSubtype:803 persons:0];
  self->_numberOfCityscapeSuggestions = [(PFCShuffleDataSource *)self numberOfSuggestionsForShuffleSubtype:802 persons:0];
  [(PFCShuffleDataSource *)self calculatePeople];
}

- (void)calculatePeople
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v3 = (void *)[objc_alloc(MEMORY[0x263F14F60]) initWithPhotoLibrary:self->_photoLibrary];
  uint64_t v4 = [v3 personUUIDsWithNegativeFeedback];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = objc_msgSend(MEMORY[0x263F14E88], "localIdentifierWithUUID:", *(void *)(*((void *)&v25 + 1) + 8 * v10), (void)v25);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v8);
  }

  __int16 v12 = (void *)MEMORY[0x263EFF9C0];
  int v13 = [(PFCShuffleDataSource *)self fetchPersonLocalIdentifiersForSuggestionSubtype:804 photoLibrary:self->_photoLibrary];
  __int16 v14 = [v12 setWithSet:v13];

  [v14 minusSet:v5];
  int64_t v15 = (NSSet *)[v14 copy];
  ambientPeople = self->_ambientPeople;
  self->_ambientPeople = v15;

  __int16 v17 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v18 = [(PFCShuffleDataSource *)self fetchPersonLocalIdentifiersForSuggestionSubtype:602 photoLibrary:self->_photoLibrary];
  uint64_t v19 = [v17 setWithSet:v18];

  [v19 intersectSet:v14];
  v20 = (NSSet *)[v19 copy];
  topAmbientPeople = self->_topAmbientPeople;
  self->_topAmbientPeople = v20;

  self->_numberOfPeopleSuggestions = [(NSSet *)self->_ambientPeople count];
  v22 = pfc_shuffle_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v23 = [(NSSet *)self->_ambientPeople count];
    NSUInteger v24 = [(NSSet *)self->_topAmbientPeople count];
    *(_DWORD *)buf = 134218240;
    NSUInteger v30 = v23;
    __int16 v31 = 2048;
    NSUInteger v32 = v24;
    _os_log_impl(&dword_25932E000, v22, OS_LOG_TYPE_DEFAULT, "[PFCShuffleDataSource] Found %td ambient people, %td VIPs", buf, 0x16u);
  }

  [(PFCShuffleDataSource *)self calculatePeopleCount];
}

- (void)calculatePeopleCount
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = self->_topAmbientPeople;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PFCShuffleDataSource numberOfSuggestionsForTopPerson:](self, "numberOfSuggestionsForTopPerson:", v9, (void)v13));
        [v3 setObject:v10 forKeyedSubscript:v9];
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  unint64_t v11 = [v3 keysSortedByValueUsingComparator:&__block_literal_global];
  sortedTopAmbientPeople = self->_sortedTopAmbientPeople;
  self->_sortedTopAmbientPeople = v11;
}

uint64_t __44__PFCShuffleDataSource_calculatePeopleCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (BOOL)hasSuggestions
{
  if ([(PFCShuffleDataSource *)self hasPeople]
    || [(PFCShuffleDataSource *)self hasPets]
    || [(PFCShuffleDataSource *)self hasNature])
  {
    return 1;
  }
  return [(PFCShuffleDataSource *)self hasCityscape];
}

- (BOOL)hasPeople
{
  return [(NSSet *)self->_ambientPeople count] != 0;
}

- (BOOL)hasPets
{
  return self->_numberOfPetSuggestions != 0;
}

- (BOOL)hasNature
{
  return self->_numberOfNatureSuggestions != 0;
}

- (BOOL)hasCityscape
{
  return self->_numberOfCityscapeSuggestions != 0;
}

- (id)baseSuggestionFetchOptionsWithSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4
{
  unsigned int v4 = a3;
  v20[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  uint64_t v8 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"creationDate" ascending:0];
  v20[0] = v8;
  uint64_t v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"uuid" ascending:0];
  v20[1] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  [v7 setSortDescriptors:v10];

  id v11 = objc_alloc(MEMORY[0x263EFF980]);
  __int16 v12 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v19[0] = v12;
  long long v13 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = %d", @"subtype", v4);
  v19[1] = v13;
  long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  long long v15 = (void *)[v11 initWithArray:v14];

  if (v6)
  {
    long long v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"context", v6];
    [v15 addObject:v16];
  }
  __int16 v17 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v15];
  [v7 setPredicate:v17];

  return v7;
}

- (id)fetchPersonLocalIdentifiersForSuggestionSubtype:(unsigned __int16)a3 photoLibrary:(id)a4
{
  unsigned int v4 = a3;
  v25[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = [a4 librarySpecificFetchOptions];
  id v6 = (void *)MEMORY[0x263F08730];
  uint64_t v7 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v25[0] = v7;
  uint64_t v8 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %d", @"subtype", v4);
  v25[1] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  uint64_t v10 = [v6 andPredicateWithSubpredicates:v9];
  [v5 setPredicate:v10];

  id v11 = [MEMORY[0x263F14F50] fetchSuggestionsWithOptions:v5];
  id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v20 + 1) + 8 * i) context];
        if (v18) {
          [v12 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v12;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSSet)ambientPeople
{
  return self->_ambientPeople;
}

- (NSSet)topAmbientPeople
{
  return self->_topAmbientPeople;
}

- (NSArray)sortedTopAmbientPeople
{
  return self->_sortedTopAmbientPeople;
}

- (unint64_t)numberOfPeopleSuggestions
{
  return self->_numberOfPeopleSuggestions;
}

- (unint64_t)numberOfNatureSuggestions
{
  return self->_numberOfNatureSuggestions;
}

- (unint64_t)numberOfPetSuggestions
{
  return self->_numberOfPetSuggestions;
}

- (unint64_t)numberOfCityscapeSuggestions
{
  return self->_numberOfCityscapeSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedTopAmbientPeople, 0);
  objc_storeStrong((id *)&self->_topAmbientPeople, 0);
  objc_storeStrong((id *)&self->_ambientPeople, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)hasSuggestionsForSubtype:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25932E000, a2, OS_LOG_TYPE_ERROR, "[PFCShuffleDataSource] bad shuffle subtype: %@", (uint8_t *)&v2, 0xCu);
}

@end