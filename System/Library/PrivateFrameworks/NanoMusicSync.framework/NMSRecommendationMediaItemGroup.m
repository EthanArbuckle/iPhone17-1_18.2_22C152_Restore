@interface NMSRecommendationMediaItemGroup
- (BOOL)isEstimate;
- (id)_fetchDownloadableItemsForIDs:(id)a3;
- (id)identifiersForContainerType:(unint64_t)a3;
- (id)itemList;
@end

@implementation NMSRecommendationMediaItemGroup

- (id)identifiersForContainerType:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3 > 1) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = objc_opt_class();
  }
  v5 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = [(NMSRecommendationMediaItemGroup *)self recommendation];
  v7 = [v6 items];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (!v4 || (objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = [v12 identifiers];
          v14 = (void *)[v13 copy];
          [v5 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v15 = (void *)[v5 copy];

  return v15;
}

- (id)itemList
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (![(NMSMediaItemGroup *)self type] || [(NMSMediaItemGroup *)self type] == 1)
  {
    uint64_t v4 = [NMSDownloadableItem alloc];
    v5 = [NSNumber numberWithUnsignedInt:arc4random()];
    if ([(NMSMediaItemGroup *)self type]) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = 3;
    }
    v7 = [(NMSDownloadableItem *)v4 initWithMediaLibraryIdentifier:v5 externalLibraryIdentifier:0 size:175000000 itemType:v6 manuallyAdded:[(NMSMediaItemGroup *)self manuallyAdded]];
    [v3 addObject:v7];
  }
  uint64_t v8 = (void *)[v3 copy];

  return v8;
}

- (id)_fetchDownloadableItemsForIDs:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7;
  long long v17 = __Block_byref_object_dispose__7;
  id v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v5 = [MEMORY[0x263F57428] predicateWithProperty:*MEMORY[0x263F57388] values:v4];
  uint64_t v6 = (void *)MEMORY[0x263F57470];
  v7 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
  uint64_t v8 = [v6 unrestrictedAllItemsQueryWithlibrary:v7 predicate:v5 orderingTerms:0];

  v19[0] = *MEMORY[0x263F573D8];
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__NMSRecommendationMediaItemGroup__fetchDownloadableItemsForIDs___block_invoke;
  v12[3] = &unk_264634A10;
  v12[4] = self;
  v12[5] = &v13;
  [v8 enumeratePersistentIDsAndProperties:v9 usingBlock:v12];

  uint64_t v10 = (void *)[(id)v14[5] copy];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __65__NMSRecommendationMediaItemGroup__fetchDownloadableItemsForIDs___block_invoke(uint64_t a1, uint64_t a2, id *a3)
{
  id v9 = *a3;
  if (![v9 unsignedLongLongValue])
  {

    id v9 = &unk_26D51D1D8;
  }
  v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v6 = [NMSDownloadableItem alloc];
  v7 = [NSNumber numberWithLongLong:a2];
  uint64_t v8 = -[NMSDownloadableItem initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:](v6, "initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:", v7, 0, [v9 unsignedIntegerValue], 0, objc_msgSend(*(id *)(a1 + 32), "manuallyAdded"));
  [v5 addObject:v8];
}

- (BOOL)isEstimate
{
  return 1;
}

@end