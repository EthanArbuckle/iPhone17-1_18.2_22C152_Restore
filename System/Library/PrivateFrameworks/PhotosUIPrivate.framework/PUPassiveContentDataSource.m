@interface PUPassiveContentDataSource
+ (id)_ascendingSortedArrayFromSet:(id)a3;
+ (id)_subtypeTitleFromSubtype:(unsigned __int16)a3;
+ (id)ambientDataSource;
+ (id)wallpaperDataSource;
+ (id)watchFaceDataSource;
- (NSMutableArray)contextDataSources;
- (NSPointerArray)delegates;
- (NSString)title;
- (PHFetchResult)fetchResult;
- (PUPassiveContentDataSource)initWithFetchResult:(id)a3;
- (PUPassiveContentDataSource)initWithSuggestionSubtype:(unsigned __int16)a3;
- (PUPassiveContentDataSource)initWithSuggestionSubtype:(unsigned __int16)a3 includingSingleFeature:(unint64_t)a4;
- (id)indexPathForSuggestionUUID:(id)a3;
- (id)initForAmbientFeatured;
- (id)initForSettlingEffect;
- (id)objectAtIndexPath:(id)a3;
- (id)titleForSection:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countInSection:(unint64_t)a3;
- (unint64_t)sectionCount;
- (void)_setupContextDataSourcesIfNeeded;
- (void)photoLibraryDidChange:(id)a3;
- (void)setContextDataSources:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PUPassiveContentDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextDataSources, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setContextDataSources:(id)a3
{
}

- (NSMutableArray)contextDataSources
{
  return self->_contextDataSources;
}

- (NSPointerArray)delegates
{
  return self->_delegates;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)photoLibraryDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PUPassiveContentDataSource *)self fetchResult];
  v6 = [v4 changeDetailsForFetchResult:v5];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 fetchResultAfterChanges];
    objc_storeStrong((id *)&self->_fetchResult, v8);
    [(PUPassiveContentDataSource *)self _setupContextDataSourcesIfNeeded];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v9 = [(PUPassiveContentDataSource *)self delegates];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) dataSourceChanged:self];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (id)indexPathForSuggestionUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__94385;
  long long v16 = __Block_byref_object_dispose__94386;
  id v17 = 0;
  v5 = [(PUPassiveContentDataSource *)self contextDataSources];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PUPassiveContentDataSource_indexPathForSuggestionUUID___block_invoke;
  v9[3] = &unk_1E5F2D198;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__PUPassiveContentDataSource_indexPathForSuggestionUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = [a2 suggestions];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PUPassiveContentDataSource_indexPathForSuggestionUUID___block_invoke_2;
  v10[3] = &unk_1E5F2D170;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = v8;
  uint64_t v12 = v9;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  [v7 enumerateObjectsUsingBlock:v10];
}

void __57__PUPassiveContentDataSource_indexPathForSuggestionUUID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 uuid];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:*(void *)(a1 + 48)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
    **(unsigned char **)(a1 + 56) = 1;
  }
}

- (unint64_t)sectionCount
{
  return [(NSMutableArray *)self->_contextDataSources count];
}

- (unint64_t)count
{
  v2 = [(PUPassiveContentDataSource *)self fetchResult];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)countInSection:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_contextDataSources count] <= a3) {
    return 0;
  }
  v5 = [(NSMutableArray *)self->_contextDataSources objectAtIndexedSubscript:a3];
  id v6 = [v5 suggestions];
  unint64_t v7 = [v6 count];

  return v7;
}

- (id)titleForSection:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_contextDataSources count] <= a3)
  {
    id v6 = &stru_1F06BE7B8;
  }
  else
  {
    v5 = [(NSMutableArray *)self->_contextDataSources objectAtIndexedSubscript:a3];
    id v6 = [v5 context];
  }
  return v6;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUPassiveContentDataSource *)self contextDataSources];
  id v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "section"));

  unint64_t v7 = [v6 suggestions];
  uint64_t v8 = [v4 row];

  uint64_t v9 = [v7 objectAtIndex:v8];

  return v9;
}

- (void)_setupContextDataSourcesIfNeeded
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  contextDataSources = self->_contextDataSources;
  self->_contextDataSources = v3;

  v5 = [(PHFetchResult *)self->_fetchResult firstObject];
  id v6 = [v5 context];

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v35 = self;
    uint64_t v8 = self->_fetchResult;
    uint64_t v9 = [(PHFetchResult *)v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v14 = (void *)MEMORY[0x1B3E7C430]();
          uint64_t v15 = [v13 context];
          if (v15) {
            long long v16 = (__CFString *)v15;
          }
          else {
            long long v16 = @"No Context Suggestions, please file a radar";
          }
          id v17 = [v7 objectForKeyedSubscript:v16];
          if (!v17)
          {
            id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v7 setObject:v17 forKeyedSubscript:v16];
          }
          [v17 addObject:v13];
        }
        uint64_t v10 = [(PHFetchResult *)v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v10);
    }

    v18 = [v7 keysSortedByValueUsingComparator:&__block_literal_global_94397];
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v37 + 1) + 8 * j);
          v26 = [v7 objectForKeyedSubscript:v25];
          [v19 addObjectsFromArray:v26];
          v27 = [[_PUPassiveContentContextDataSource alloc] initWithContext:v25 suggestions:v26];
          if (v27) {
            [(NSMutableArray *)v35->_contextDataSources addObject:v27];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v22);
    }

    id v28 = objc_alloc(MEMORY[0x1E4F39150]);
    v29 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
    uint64_t v30 = [v28 initWithObjects:v19 photoLibrary:v29 fetchType:*MEMORY[0x1E4F39688] fetchPropertySets:0 identifier:0 registerIfNeeded:1];

    fetchResult = v35->_fetchResult;
    v35->_fetchResult = (PHFetchResult *)v30;
  }
  else
  {
    v32 = [_PUPassiveContentContextDataSource alloc];
    v33 = [(PHFetchResult *)self->_fetchResult fetchedObjects];
    v36 = [(_PUPassiveContentContextDataSource *)v32 initWithContext:0 suggestions:v33];

    v34 = v36;
    if (v36)
    {
      [(NSMutableArray *)self->_contextDataSources addObject:v36];
      v34 = v36;
    }
  }
}

uint64_t __62__PUPassiveContentDataSource__setupContextDataSourcesIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a2;
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  id v7 = NSNumber;
  uint64_t v8 = [v5 count];

  uint64_t v9 = [v7 numberWithUnsignedInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (PUPassiveContentDataSource)initWithFetchResult:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUPassiveContentDataSource;
  id v6 = [(PUPassiveContentDataSource *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    delegates = v6->_delegates;
    v6->_delegates = (NSPointerArray *)v7;

    objc_storeStrong((id *)&v6->_fetchResult, a3);
    uint64_t v9 = [v5 photoLibrary];
    [v9 registerChangeObserver:v6];

    [(PUPassiveContentDataSource *)v6 _setupContextDataSourcesIfNeeded];
  }

  return v6;
}

- (PUPassiveContentDataSource)initWithSuggestionSubtype:(unsigned __int16)a3 includingSingleFeature:(unint64_t)a4
{
  uint64_t v5 = a3;
  v27[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  uint64_t v8 = [v7 librarySpecificFetchOptions];
  uint64_t v9 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v27[0] = v10;
  objc_super v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"subtype", v5);
  v27[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  uint64_t v13 = [v9 andPredicateWithSubpredicates:v12];
  [v8 setPredicate:v13];

  uint64_t v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v26[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v26[1] = v15;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  [v8 setSortDescriptors:v16];

  id v17 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v8];
  if (a4)
  {
    uint64_t v18 = [MEMORY[0x1E4F8E858] filterSuggestions:v17 includingSingleFeature:a4];

    id v17 = (void *)v18;
  }
  id v19 = [(PUPassiveContentDataSource *)self initWithFetchResult:v17];
  id v20 = [(id)objc_opt_class() _subtypeTitleFromSubtype:v5];
  uint64_t v21 = NSString;
  uint64_t v22 = [(PUPassiveContentDataSource *)v19 fetchResult];
  uint64_t v23 = [v21 stringWithFormat:@"%@ - %lu", v20, objc_msgSend(v22, "count")];
  title = v19->_title;
  v19->_title = (NSString *)v23;

  return v19;
}

- (PUPassiveContentDataSource)initWithSuggestionSubtype:(unsigned __int16)a3
{
  return [(PUPassiveContentDataSource *)self initWithSuggestionSubtype:a3 includingSingleFeature:0];
}

- (id)initForSettlingEffect
{
  unint64_t v3 = (void *)MEMORY[0x1E4F8E858];
  id v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  uint64_t v5 = [v3 fetchSettlingEffectSuggestionsInPhotoLibrary:v4];

  id v6 = [(PUPassiveContentDataSource *)self initWithFetchResult:v5];
  uint64_t v7 = NSString;
  uint64_t v8 = [(PUPassiveContentDataSource *)v6 fetchResult];
  uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", @"Settling Effect - %lu", objc_msgSend(v8, "count"));
  title = v6->_title;
  v6->_title = (NSString *)v9;

  return v6;
}

- (id)initForAmbientFeatured
{
  v41[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  unint64_t v3 = [v2 librarySpecificFetchOptions];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v41[0] = v5;
  id v6 = [MEMORY[0x1E4F39310] predicateForAllFeaturedStateEnabledSuggestionTypesForWidget];
  v41[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  uint64_t v8 = [v4 andPredicateWithSubpredicates:v7];
  [v3 setPredicate:v8];

  v33 = v3;
  uint64_t v9 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v3];
  v34 = v2;
  uint64_t v10 = [v2 librarySpecificFetchOptions];
  [v10 setIncludeGuestAssets:1];
  uint64_t v11 = *MEMORY[0x1E4F39538];
  v40[0] = *MEMORY[0x1E4F394E0];
  v40[1] = v11;
  v40[2] = *MEMORY[0x1E4F39458];
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  [v10 setFetchPropertySets:v12];

  v31 = v10;
  uint64_t v13 = [MEMORY[0x1E4F38EB8] fetchKeyAssetBySuggestionUUIDForSuggestions:v9 options:v10];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v15 = v9;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v21 = [v20 uuid];
        uint64_t v22 = [v13 objectForKeyedSubscript:v21];

        if (![MEMORY[0x1E4F8E7A0] suggestionIsEligibleForDisplay:v20 asset:v22 modelSet:0]) {
          [v14 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v17);
  }

  id v23 = objc_alloc(MEMORY[0x1E4F39150]);
  v24 = (void *)[v23 initWithObjects:v14 photoLibrary:v34 fetchType:*MEMORY[0x1E4F39688] fetchPropertySets:0 identifier:0 registerIfNeeded:0];
  uint64_t v25 = [(PUPassiveContentDataSource *)self initWithFetchResult:v24];
  v26 = NSString;
  v27 = [(PUPassiveContentDataSource *)v25 fetchResult];
  uint64_t v28 = objc_msgSend(v26, "stringWithFormat:", @"Featured Photo - %lu", objc_msgSend(v27, "count"));
  title = v25->_title;
  v25->_title = (NSString *)v28;

  return v25;
}

+ (id)_ascendingSortedArrayFromSet:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F29008];
  id v4 = a3;
  uint64_t v5 = [v3 sortDescriptorWithKey:@"self" ascending:1];
  id v6 = [v4 allObjects];

  v10[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v8 = [v6 sortedArrayUsingDescriptors:v7];

  return v8;
}

+ (id)watchFaceDataSource
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [MEMORY[0x1E4F39310] allAmbientSuggestionSubtypes];
  uint64_t v5 = [a1 _ascendingSortedArrayFromSet:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [PUPassiveContentDataSource alloc];
        uint64_t v13 = -[PUPassiveContentDataSource initWithSuggestionSubtype:includingSingleFeature:](v12, "initWithSuggestionSubtype:includingSingleFeature:", (unsigned __int16)objc_msgSend(v11, "unsignedIntValue", (void)v15), 2);
        [v3 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v3;
}

+ (id)ambientDataSource
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [MEMORY[0x1E4F39310] allAmbientSuggestionSubtypes];
  uint64_t v5 = [a1 _ascendingSortedArrayFromSet:v4];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [PUPassiveContentDataSource alloc];
        uint64_t v13 = -[PUPassiveContentDataSource initWithSuggestionSubtype:](v12, "initWithSuggestionSubtype:", (unsigned __int16)objc_msgSend(v11, "unsignedIntValue", (void)v16));
        [v3 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [[PUPassiveContentDataSource alloc] initForAmbientFeatured];
  [v3 addObject:v14];

  return v3;
}

+ (id)wallpaperDataSource
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [MEMORY[0x1E4F39310] allTopWallpaperSuggestionSubtypes];
  id v6 = [a1 _ascendingSortedArrayFromSet:v5];
  [v4 addObjectsFromArray:v6];

  uint64_t v7 = [MEMORY[0x1E4F39310] allShuffleWallpaperSuggestionSubtypes];
  uint64_t v8 = [a1 _ascendingSortedArrayFromSet:v7];
  [v4 addObjectsFromArray:v8];

  [v4 addObject:&unk_1F078D070];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = [PUPassiveContentDataSource alloc];
        long long v16 = -[PUPassiveContentDataSource initWithSuggestionSubtype:](v15, "initWithSuggestionSubtype:", (unsigned __int16)objc_msgSend(v14, "unsignedIntValue", (void)v19));
        [v3 addObject:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  id v17 = [[PUPassiveContentDataSource alloc] initForSettlingEffect];
  [v3 addObject:v17];

  return v3;
}

+ (id)_subtypeTitleFromSubtype:(unsigned __int16)a3
{
  if (!(!v4 & v3))
  {
    uint64_t v7 = @"Top People";
    switch(a3)
    {
      case 0x25Au:
        goto LABEL_12;
      case 0x25Bu:
        uint64_t v7 = @"Top Pet";
        return v7;
      case 0x25Cu:
        uint64_t v7 = @"Top Landscape";
        return v7;
      case 0x25Du:
        uint64_t v7 = @"Top Cityscape";
        return v7;
      default:
        JUMPOUT(0);
    }
  }
  switch(a3)
  {
    case 0x28Cu:
      uint64_t v7 = @"People (Shuffle)";
      break;
    case 0x28Du:
      uint64_t v7 = @"Pet (Shuffle)";
      break;
    case 0x28Eu:
      uint64_t v7 = @"Landscape (Shuffle)";
      break;
    case 0x28Fu:
      uint64_t v7 = @"Cityscape (Shuffle)";
      break;
    default:
      PHSuggestionStringWithSubtype();
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      break;
  }
  return v7;
}

@end