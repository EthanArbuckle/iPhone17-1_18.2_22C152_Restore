@interface VUIMediaLibraryUtilities
+ (id)_sortIndexesForObjects:(id)a3 titleForObjectBlock:(id)a4;
+ (id)groupingForMediaEntities:(id)a3 groupingKeyPath:(id)a4 groupingSortComparator:(id)a5 performDefaultSort:(BOOL)a6 sortIndexPropertyKey:(id)a7;
+ (id)mediaItemEntityTypesSortComparator;
+ (id)sortIndexesForGrouping:(id)a3;
+ (id)sortIndexesForMediaEntities:(id)a3 sortIndexPropertyKey:(id)a4;
@end

@implementation VUIMediaLibraryUtilities

+ (id)groupingForMediaEntities:(id)a3 groupingKeyPath:(id)a4 groupingSortComparator:(id)a5 performDefaultSort:(BOOL)a6 sortIndexPropertyKey:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [[VUIMediaEntitiesToGroupsValueTransformer alloc] initWithIdentifierKeyPath:v13];

  [(VUIMediaEntitiesToGroupsValueTransformer *)v15 setGroupsSortComparator:v12];
  [(VUIMediaEntitiesToGroupsValueTransformer *)v15 setPerformDefaultSort:v7];
  [(VUIMediaEntitiesToGroupsValueTransformer *)v15 setSortIndexKeyPath:v11];

  v16 = [(VUIMediaEntitiesToGroupsValueTransformer *)v15 transformedValue:v14];

  return v16;
}

+ (id)sortIndexesForGrouping:(id)a3
{
  return (id)[a1 _sortIndexesForObjects:a3 titleForObjectBlock:&__block_literal_global_154];
}

uint64_t __51__VUIMediaLibraryUtilities_sortIndexesForGrouping___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

+ (id)sortIndexesForMediaEntities:(id)a3 sortIndexPropertyKey:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__VUIMediaLibraryUtilities_sortIndexesForMediaEntities_sortIndexPropertyKey___block_invoke;
  v10[3] = &unk_1E6DFD2D0;
  id v11 = v6;
  id v7 = v6;
  v8 = [a1 _sortIndexesForObjects:a3 titleForObjectBlock:v10];

  return v8;
}

uint64_t __77__VUIMediaLibraryUtilities_sortIndexesForMediaEntities_sortIndexPropertyKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 valueForKey:*(void *)(a1 + 32)];
}

+ (id)mediaItemEntityTypesSortComparator
{
  if (mediaItemEntityTypesSortComparator___onceToken != -1) {
    dispatch_once(&mediaItemEntityTypesSortComparator___onceToken, &__block_literal_global_4_2);
  }
  return &__block_literal_global_21_1;
}

void __62__VUIMediaLibraryUtilities_mediaItemEntityTypesSortComparator__block_invoke()
{
  v9[6] = *MEMORY[0x1E4F143B8];
  v0 = +[VUIMediaEntityType movieRental];
  v8[0] = v0;
  v9[0] = &unk_1F3F3E000;
  v1 = +[VUIMediaEntityType show];
  v8[1] = v1;
  v9[1] = &unk_1F3F3E018;
  v2 = +[VUIMediaEntityType season];
  v8[2] = v2;
  v9[2] = &unk_1F3F3E030;
  v3 = +[VUIMediaEntityType episode];
  v8[3] = v3;
  v9[3] = &unk_1F3F3E048;
  v4 = +[VUIMediaEntityType movie];
  v8[4] = v4;
  v9[4] = &unk_1F3F3E060;
  v5 = +[VUIMediaEntityType homeVideo];
  v8[5] = v5;
  v9[5] = &unk_1F3F3E078;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:6];
  id v7 = (void *)mediaItemEntityTypesSortComparator___mediaItemEntityTypeToSortOrder;
  mediaItemEntityTypesSortComparator___mediaItemEntityTypeToSortOrder = v6;
}

uint64_t __62__VUIMediaLibraryUtilities_mediaItemEntityTypesSortComparator__block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (void *)mediaItemEntityTypesSortComparator___mediaItemEntityTypeToSortOrder;
  id v5 = a3;
  uint64_t v6 = [v4 objectForKey:a2];
  id v7 = [(id)mediaItemEntityTypesSortComparator___mediaItemEntityTypeToSortOrder objectForKey:v5];

  uint64_t v8 = [v6 compare:v7];
  return v8;
}

+ (id)_sortIndexesForObjects:(id)a3 titleForObjectBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__35;
  v30 = __Block_byref_object_dispose__35;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__35;
  v24 = __Block_byref_object_dispose__35;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 1;
  id v7 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__VUIMediaLibraryUtilities__sortIndexesForObjects_titleForObjectBlock___block_invoke;
  v12[3] = &unk_1E6DFD318;
  v15 = v18;
  id v8 = v6;
  id v14 = v8;
  v16 = &v20;
  id v9 = v7;
  id v13 = v9;
  v17 = &v26;
  [v5 enumerateObjectsUsingBlock:v12];
  if (v21[5]) {
    objc_msgSend((id)v27[5], "addObject:");
  }
  v10 = (void *)[(id)v27[5] copy];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v10;
}

void __71__VUIMediaLibraryUtilities__sortIndexesForObjects_titleForObjectBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    unsigned __int16 v15 = 0;
    id v5 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if ([v5 length])
    {
      unsigned __int16 v15 = [v5 characterAtIndex:0];
      id v6 = [NSString stringWithCharacters:&v15 length:1];
    }
    else
    {
      id v6 = &stru_1F3E921E0;
    }
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v9
      && ([v9 title],
          v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [(__CFString *)v6 isEqualToString:v10],
          v10,
          v11))
    {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "count") + 1);
    }
    else
    {
      if (([*(id *)(a1 + 32) characterIsMember:v15] & 1) == 0)
      {

        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        id v6 = @"#";
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "addObject:");
      }
      id v12 = [[VUIMediaEntitySortIndex alloc] initWithTitle:v6 startIndex:a3 count:1];
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] + 1;
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v8 setCount:v7];
  }
}

@end