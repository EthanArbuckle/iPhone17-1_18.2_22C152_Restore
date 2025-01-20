@interface SearchUIShortcutsAppTopHitAsyncSectionLoader
+ (BOOL)supportsSectionModel:(id)a3;
- (BOOL)supportsFileProviderRecents;
- (id)appShortcutTopHitFilterQuery;
- (id)buildCardSectionsForFoundItems:(id)a3;
- (id)buildSearchQueryForBundleIdentifier:(id)a3;
- (id)dateRangeQueryForUpToSeconds:(unint64_t)a3;
- (id)fileProviderQueryString;
- (id)futureDateRangeQuery;
- (id)rankingQueriesForFileprovider;
- (id)rankingQueriesForShortcuts;
- (id)shortcutsQueryString;
- (id)userShortcutFilterQuery;
@end

@implementation SearchUIShortcutsAppTopHitAsyncSectionLoader

+ (BOOL)supportsSectionModel:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SearchUIShortcutsAppTopHitAsyncSectionLoader;
  return objc_msgSendSuper2(&v4, sel_supportsSectionModel_, a3);
}

- (id)buildSearchQueryForBundleIdentifier:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = objc_opt_new();
  v5 = [(SearchUICoreSpotlightAppTopHitAsyncSectionLoader *)self defaultFetchAttributes];
  [v4 setFetchAttributes:v5];

  objc_msgSend(v4, "setMaxCount:", objc_msgSend((id)objc_opt_class(), "maxNumOfTopHitEntities"));
  [v4 setDisableSemanticSearch:1];
  v6 = objc_opt_new();
  v7 = (void *)MEMORY[0x1E4F1CA48];
  v27[0] = *MEMORY[0x1E4FA5E18];
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v9 = [v7 arrayWithArray:v8];

  v10 = [(SearchUIShortcutsAppTopHitAsyncSectionLoader *)self shortcutsQueryString];
  if ([(SearchUIShortcutsAppTopHitAsyncSectionLoader *)self supportsFileProviderRecents])
  {
    v11 = [(SearchUIAsyncSectionLoader *)self delegate];
    int v12 = [v11 deviceIsAuthenticated];

    if (v12)
    {
      v13 = NSString;
      v14 = [(SearchUIShortcutsAppTopHitAsyncSectionLoader *)self fileProviderQueryString];
      uint64_t v15 = [v13 stringWithFormat:@"(%@) || (%@)", v10, v14];

      v16 = [(SearchUIShortcutsAppTopHitAsyncSectionLoader *)self rankingQueriesForFileprovider];
      [v6 addObjectsFromArray:v16];

      uint64_t v17 = *MEMORY[0x1E4FA5E00];
      v26[0] = *MEMORY[0x1E4FA5DF8];
      v26[1] = v17;
      uint64_t v18 = *MEMORY[0x1E4FA5E10];
      v26[2] = *MEMORY[0x1E4FA5E08];
      v26[3] = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
      [v9 addObjectsFromArray:v19];

      v10 = (void *)v15;
    }
  }
  v20 = [(SearchUIAsyncSectionLoader *)self delegate];
  char v21 = [v20 deviceIsAuthenticated];

  if ((v21 & 1) == 0)
  {
    uint64_t v22 = [NSString stringWithFormat:@"(%@) && (%@ == %@)", v10, *MEMORY[0x1E4F233F0], *MEMORY[0x1E4F28378]];

    v10 = (void *)v22;
  }
  v23 = [(SearchUIShortcutsAppTopHitAsyncSectionLoader *)self rankingQueriesForShortcuts];
  [v6 addObjectsFromArray:v23];

  [v4 setRankingQueries:v6];
  [v4 setBundleIDs:v9];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v10 queryContext:v4];

  return v24;
}

- (id)buildCardSectionsForFoundItems:(id)a3
{
  objc_super v4 = (void *)[a3 mutableCopy];
  [v4 sortUsingComparator:&__block_literal_global_15];
  v7.receiver = self;
  v7.super_class = (Class)SearchUIShortcutsAppTopHitAsyncSectionLoader;
  v5 = [(SearchUICoreSpotlightAppTopHitAsyncSectionLoader *)&v7 buildCardSectionsForFoundItems:v4];

  return v5;
}

uint64_t __79__SearchUIShortcutsAppTopHitAsyncSectionLoader_buildCardSectionsForFoundItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 domainIdentifier];
  uint64_t v7 = *MEMORY[0x1E4FB4C00];
  int v8 = [v6 isEqualToString:*MEMORY[0x1E4FB4C00]];

  v9 = [v5 domainIdentifier];
  int v10 = [v9 isEqualToString:v7];

  if (v8) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    uint64_t v17 = [v4 attributeSet];
    uint64_t v18 = [v17 title];
    v19 = [v5 attributeSet];
    v20 = [v19 title];
    uint64_t v21 = [v18 compare:v20];
    goto LABEL_12;
  }
  if (v8) {
    uint64_t v21 = -1;
  }
  else {
    uint64_t v21 = 1;
  }
  if (((v8 | v10) & 1) == 0)
  {
    int v12 = [v4 attributeSet];
    uint64_t v13 = *MEMORY[0x1E4F23530];
    v14 = [v12 attributeForKey:*MEMORY[0x1E4F23530]];
    uint64_t v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [NSNumber numberWithUnsignedInteger:-1];
    }
    uint64_t v17 = v16;

    uint64_t v22 = [v5 attributeSet];
    v23 = [v22 attributeForKey:v13];
    v24 = v23;
    if (v23)
    {
      id v25 = v23;
    }
    else
    {
      id v25 = [NSNumber numberWithUnsignedInteger:-1];
    }
    uint64_t v18 = v25;

    uint64_t v26 = [v17 compare:v18];
    if (v26)
    {
      uint64_t v21 = v26;
      goto LABEL_19;
    }
    v19 = [v5 attributeSet];
    v20 = [v19 lastUsedDate];
    v28 = [v4 attributeSet];
    v29 = [v28 lastUsedDate];
    uint64_t v21 = [v20 compare:v29];

LABEL_12:
LABEL_19:
  }
  return v21;
}

- (id)rankingQueriesForShortcuts
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SearchUIShortcutsAppTopHitAsyncSectionLoader_rankingQueriesForShortcuts__block_invoke;
  block[3] = &unk_1E6E72730;
  block[4] = self;
  if (rankingQueriesForShortcuts_onceToken != -1) {
    dispatch_once(&rankingQueriesForShortcuts_onceToken, block);
  }
  return (id)rankingQueriesForShortcuts_rankingQueries;
}

void __74__SearchUIShortcutsAppTopHitAsyncSectionLoader_rankingQueriesForShortcuts__block_invoke(uint64_t a1)
{
  id v10 = (id)objc_opt_new();
  v2 = [*(id *)(a1 + 32) appShortcutTopHitFilterQuery];
  [v10 addObject:v2];

  uint64_t v3 = [(id)objc_opt_class() maxNumOfTopHitEntities];
  if (v3)
  {
    uint64_t v4 = *MEMORY[0x1E4F23530];
    do
    {
      uint64_t v5 = v3 - 1;
      v6 = [NSString stringWithFormat:@"InRange(%@, %lu, %lu)", v4, v3 - 1, v3];
      [v10 addObject:v6];

      uint64_t v3 = v5;
    }
    while (v5);
  }
  uint64_t v7 = [*(id *)(a1 + 32) userShortcutFilterQuery];
  [v10 addObject:v7];

  uint64_t v8 = [v10 copy];
  v9 = (void *)rankingQueriesForShortcuts_rankingQueries;
  rankingQueriesForShortcuts_rankingQueries = v8;
}

- (id)shortcutsQueryString
{
  uint64_t v3 = NSString;
  uint64_t v4 = *MEMORY[0x1E4F234D0];
  uint64_t v5 = [(SearchUIAppTopHitAsyncSectionLoader *)self bundleIdentifier];
  v6 = [v3 stringWithFormat:@"%@==%@", v4, v5];

  uint64_t v7 = NSString;
  uint64_t v8 = [(SearchUIShortcutsAppTopHitAsyncSectionLoader *)self appShortcutTopHitFilterQuery];
  v9 = [(SearchUIShortcutsAppTopHitAsyncSectionLoader *)self userShortcutFilterQuery];
  id v10 = [v7 stringWithFormat:@"((%@) && ((%@) || (%@)))", v6, v8, v9];

  return v10;
}

- (id)userShortcutFilterQuery
{
  return (id)[NSString stringWithFormat:@"((%@ == %@) && (%@ == 1))", *MEMORY[0x1E4F22D28], *MEMORY[0x1E4FB4C00], *MEMORY[0x1E4F236B0]];
}

- (id)appShortcutTopHitFilterQuery
{
  return (id)[NSString stringWithFormat:@"%@==1", *MEMORY[0x1E4F23548]];
}

- (BOOL)supportsFileProviderRecents
{
  v2 = (void *)MEMORY[0x1E4FA5DE8];
  uint64_t v3 = [(SearchUIAppTopHitAsyncSectionLoader *)self bundleIdentifier];
  uint64_t v4 = (BOOL *)[v2 supportsFileProviderFor:v3];

  return v4;
}

- (id)rankingQueriesForFileprovider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SearchUIShortcutsAppTopHitAsyncSectionLoader_rankingQueriesForFileprovider__block_invoke;
  block[3] = &unk_1E6E72730;
  block[4] = self;
  if (rankingQueriesForFileprovider_onceToken != -1) {
    dispatch_once(&rankingQueriesForFileprovider_onceToken, block);
  }
  return (id)rankingQueriesForFileprovider_rankingQueries;
}

void __77__SearchUIShortcutsAppTopHitAsyncSectionLoader_rankingQueriesForFileprovider__block_invoke(uint64_t a1)
{
  id v7 = (id)objc_opt_new();
  for (uint64_t i = 0; i != 16; ++i)
  {
    uint64_t v3 = [*(id *)(a1 + 32) dateRangeQueryForUpToSeconds:60 * qword_1E46B6748[i]];
    [v7 addObject:v3];
  }
  uint64_t v4 = [*(id *)(a1 + 32) futureDateRangeQuery];
  [v7 addObject:v4];

  uint64_t v5 = [v7 copy];
  v6 = (void *)rankingQueriesForFileprovider_rankingQueries;
  rankingQueriesForFileprovider_rankingQueries = v5;
}

- (id)fileProviderQueryString
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SearchUIAppTopHitAsyncSectionLoader *)self bundleIdentifier];
  uint64_t v4 = DOCContentTypesReadableByApplicationWithBundleIdentifier();

  if ([v4 count])
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F442D8], "doc_identifiersForContentTypes:", v4);
    v6 = [MEMORY[0x1E4F25D38] defaultManager];
    id v7 = (void *)[v6 newRecentsCollection];

    [v7 setAllowedFileTypes:v5];
    uint64_t v8 = [(id)*MEMORY[0x1E4F443C8] identifier];
    v17[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v7 setExcludedFileTypes:v9];

    id v10 = [v7 scopedSearchQuery];
    BOOL v11 = [v10 toSpotlightQueryString];

    int v12 = NSString;
    uint64_t v13 = [(SearchUIShortcutsAppTopHitAsyncSectionLoader *)self dateRangeQueryForUpToSeconds:1209600];
    v14 = [(SearchUIShortcutsAppTopHitAsyncSectionLoader *)self futureDateRangeQuery];
    uint64_t v15 = [v12 stringWithFormat:@"(%@) && ((%@) || (%@))", v11, v13, v14];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)dateRangeQueryForUpToSeconds:(unint64_t)a3
{
  return (id)[NSString stringWithFormat:@"InRange(%@, $time.now(-%ld), $time.now)", *MEMORY[0x1E4F230F0], a3];
}

- (id)futureDateRangeQuery
{
  return (id)[NSString stringWithFormat:@"%@ >= $time.now", *MEMORY[0x1E4F230F0]];
}

@end