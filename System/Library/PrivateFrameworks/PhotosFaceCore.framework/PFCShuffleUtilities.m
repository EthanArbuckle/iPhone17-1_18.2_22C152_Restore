@interface PFCShuffleUtilities
+ (id)_suggestionOptionsForShuffle:(id)a3;
+ (id)assetsForShuffle:(id)a3;
@end

@implementation PFCShuffleUtilities

+ (id)assetsForShuffle:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = [a1 _suggestionOptionsForShuffle:a3];
  v4 = [MEMORY[0x263F14F50] fetchSuggestionsWithOptions:v3];
  id v5 = objc_alloc_init(MEMORY[0x263F14E18]);
  v6 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"mediaType = %ld", 1);
  [v5 setPredicate:v6];

  v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"creationDate" ascending:0];
  v12[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v5 setSortDescriptors:v8];

  [v5 setIncludeHiddenAssets:0];
  v9 = [MEMORY[0x263F14D18] fetchKeyAssetBySuggestionUUIDForSuggestions:v4 options:v5];
  v10 = [v9 allValues];

  return v10;
}

+ (id)_suggestionOptionsForShuffle:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F14E18]);
  id v5 = [MEMORY[0x263EFF980] array];
  v6 = [v3 people];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = (void *)MEMORY[0x263F08A98];
    v9 = [v3 people];
    v10 = [v8 predicateWithFormat:@"%K = %d AND %K in %@", @"subtype", 804, @"context", v9];
    [v5 addObject:v10];
  }
  if ([v3 pets])
  {
    v11 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = %d", @"subtype", 803);
    [v5 addObject:v11];
  }
  if ([v3 nature])
  {
    v12 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = %d", @"subtype", 801);
    [v5 addObject:v12];
  }
  if ([v3 cityscape])
  {
    v13 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = %d", @"subtype", 802);
    [v5 addObject:v13];
  }
  id v14 = objc_alloc(MEMORY[0x263EFF980]);
  v15 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v21[0] = v15;
  v16 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v5];
  v21[1] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  v18 = (void *)[v14 initWithArray:v17];

  v19 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v18];
  [v4 setPredicate:v19];

  return v4;
}

@end