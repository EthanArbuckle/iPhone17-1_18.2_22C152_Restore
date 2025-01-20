@interface VUIMediaEntityFetchRequest
+ (VUIMediaEntityFetchRequest)mediaEntityFetchRequestWithIdentifier:(id)a3;
+ (id)_HLSResolutionPredicateWithResolution:(id)a3;
+ (id)_addedDateSortDescriptor;
+ (id)_addedToDateSortDescriptor;
+ (id)_any4KResolutionPredicate;
+ (id)_anyHDRColorCapabilityPredicate;
+ (id)_episodeNumberSortDescriptor;
+ (id)_episodesFetchRequestWithSeasonIdentifier:(id)a3 showIdentifier:(id)a4;
+ (id)_finalizedSortDescriptorFromSortDescriptor:(id)a3 mediaEntityKind:(id)a4;
+ (id)_finalizedSortDescriptorsFromSortDescriptors:(id)a3 mediaEntityKind:(id)a4;
+ (id)_fractionalEpisodeNumberSortDescriptor;
+ (id)_identifierPredicateWithIdentifier:(id)a3;
+ (id)_includeSortIndexesOptions;
+ (id)_isEqualPredicateWithAdamId:(id)a3;
+ (id)_isInPredicateWithAdamId:(id)a3;
+ (id)_isLocalPredicate;
+ (id)_minimalMovieRentalsPropertiesFetchRequest;
+ (id)_minimalMoviesPropertiesFetchRequest;
+ (id)_minimalPropertiesFetchRequestWithType:(id)a3;
+ (id)_minimalShowsPropertiesFetchRequest;
+ (id)_predicateWithSubpredicates:(id)a3 compoundPredicateType:(unint64_t)a4;
+ (id)_releaseDateSortDescriptor;
+ (id)_releaseYearSortDescriptor;
+ (id)_resolutionPredicateWithResolution:(id)a3;
+ (id)_seasonIdentifierPredicateWithIdentifier:(id)a3;
+ (id)_seasonNumberSortDescriptor;
+ (id)_seasonsFetchRequestWithSeasonIdentifier:(id)a3;
+ (id)_seasonsFetchRequestWithShowIdentifier:(id)a3;
+ (id)_showIdentifierPredicateWithIdentifier:(id)a3;
+ (id)_showTitleSortDescriptor;
+ (id)_titleSortDescriptor;
+ (id)episodesFetchRequest;
+ (id)episodesFetchRequestWithSeasonIdentifier:(id)a3;
+ (id)episodesGroupedBySeasonIdentifierFetchRequestWithShowIdentifier:(id)a3;
+ (id)homeVideosFetchRequest;
+ (id)seasonsFetchRequest;
- (BOOL)_isCollectionsFetch;
- (BOOL)_isItemsFetch;
- (BOOL)_isSeasonsFetch;
- (BOOL)_isShowsFetch;
- (BOOL)_shouldGenerateGroupingSortIndexes;
- (BOOL)_shouldGenerateSortIndexes;
- (BOOL)isEqual:(id)a3;
- (NSArray)sortDescriptors;
- (NSDictionary)options;
- (NSPredicate)predicate;
- (NSSet)mediaEntityTypes;
- (NSSet)properties;
- (NSString)groupingKeyPath;
- (NSString)identifier;
- (VUIMediaEntityFetchRequest)init;
- (VUIMediaEntityFetchRequest)initWithMediaEntityType:(id)a3;
- (VUIMediaEntityFetchRequest)initWithMediaEntityTypes:(id)a3;
- (_NSRange)range;
- (id)_manualSortDescriptorsWithMediaEntityKind:(id)a3 propertiesRequiredForSort:(id *)a4;
- (id)_sortIndexPropertyKeyWithMediaEntityKind:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)groupingSortComparator;
- (unint64_t)hash;
- (void)_addPredicate:(id)a3;
- (void)_didUpdateRequestProperties;
- (void)add4KResolutionPredicate;
- (void)addAdamIdPredicate:(id)a3;
- (void)addAdamIdsPredicate:(id)a3;
- (void)addDownloadStatePredicateForStates:(unint64_t)a3;
- (void)addGroupingSortIndexesOption;
- (void)addHDRColorCapabilityOr4KResolutionPredicate;
- (void)addHDRColorCapabilityPredicate;
- (void)addHasItemsOption;
- (void)addIsLocalOrHasExpiredDownloadPredicate;
- (void)addIsLocalPredicate;
- (void)addRecentlyAddedSortDescriptorWithLimit:(unint64_t)a3;
- (void)addSortIndexesOption;
- (void)setGroupingKeyPath:(id)a3;
- (void)setGroupingSortComparator:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMediaEntityTypes:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setProperties:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation VUIMediaEntityFetchRequest

+ (VUIMediaEntityFetchRequest)mediaEntityFetchRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F3F68A60])
  {
    id v5 = v4;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The identifier parameter must conform to VUIMediaEntityIdentifierInternal"];
    id v5 = 0;
  }
  v6 = [VUIMediaEntityFetchRequest alloc];
  v7 = [v5 mediaEntityType];
  v8 = [(VUIMediaEntityFetchRequest *)v6 initWithMediaEntityType:v7];

  v9 = [a1 _identifierPredicateWithIdentifier:v4];
  [(VUIMediaEntityFetchRequest *)v8 setPredicate:v9];
  v10 = VUIMediaEntityFetchRequestAllPropertiesSet();
  [(VUIMediaEntityFetchRequest *)v8 setProperties:v10];

  return v8;
}

+ (id)homeVideosFetchRequest
{
  v3 = +[VUIMediaEntityType homeVideo];
  id v4 = [a1 _minimalPropertiesFetchRequestWithType:v3];

  return v4;
}

+ (id)seasonsFetchRequest
{
  return (id)[a1 _seasonsFetchRequestWithShowIdentifier:0];
}

+ (id)episodesFetchRequest
{
  return (id)[a1 _episodesFetchRequestWithSeasonIdentifier:0 showIdentifier:0];
}

+ (id)episodesFetchRequestWithSeasonIdentifier:(id)a3
{
  return (id)[a1 _episodesFetchRequestWithSeasonIdentifier:a3 showIdentifier:0];
}

+ (id)episodesGroupedBySeasonIdentifierFetchRequestWithShowIdentifier:(id)a3
{
  return (id)[a1 _episodesFetchRequestWithSeasonIdentifier:0 showIdentifier:a3];
}

- (void)addSortIndexesOption
{
  v3 = [(VUIMediaEntityFetchRequest *)self options];
  id v4 = (id)[v3 mutableCopy];

  [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"IncludeSortIndexes"];
  [(VUIMediaEntityFetchRequest *)self setOptions:v4];
}

- (void)addGroupingSortIndexesOption
{
  v3 = [(VUIMediaEntityFetchRequest *)self options];
  id v4 = (id)[v3 mutableCopy];

  [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"IncludeGroupingSortIndexes"];
  [(VUIMediaEntityFetchRequest *)self setOptions:v4];
}

- (void)addHasItemsOption
{
  v3 = [(VUIMediaEntityFetchRequest *)self options];
  id v5 = (id)[v3 mutableCopy];

  id v4 = v5;
  if (!v5) {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v6 = v4;
  [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"CheckHasItems"];
  [(VUIMediaEntityFetchRequest *)self setOptions:v6];
}

- (void)addRecentlyAddedSortDescriptorWithLimit:(unint64_t)a3
{
  id v5 = [(VUIMediaEntityFetchRequest *)self mediaEntityTypes];
  id v6 = [v5 allObjects];
  v7 = [v6 firstObject];
  uint64_t v8 = [v7 subtype];

  if (v8 == 1)
  {
    uint64_t v9 = [(id)objc_opt_class() _addedToDateSortDescriptor];
    goto LABEL_5;
  }
  if (!v8)
  {
    uint64_t v9 = [(id)objc_opt_class() _addedDateSortDescriptor];
LABEL_5:
    id v12 = (id)v9;
    goto LABEL_7;
  }
  id v12 = 0;
LABEL_7:
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v12, 0);
  v11 = [(VUIMediaEntityFetchRequest *)self sortDescriptors];
  if (v11) {
    [v10 addObjectsFromArray:v11];
  }
  [(VUIMediaEntityFetchRequest *)self setSortDescriptors:v10];
  -[VUIMediaEntityFetchRequest setRange:](self, "setRange:", 0, a3);
}

- (void)addHDRColorCapabilityPredicate
{
  id v3 = [(id)objc_opt_class() _anyHDRColorCapabilityPredicate];
  [(VUIMediaEntityFetchRequest *)self _addPredicate:v3];
}

- (void)add4KResolutionPredicate
{
  id v3 = [(id)objc_opt_class() _any4KResolutionPredicate];
  [(VUIMediaEntityFetchRequest *)self _addPredicate:v3];
}

- (void)addHDRColorCapabilityOr4KResolutionPredicate
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [(id)objc_opt_class() _anyHDRColorCapabilityPredicate];
  [v6 addObject:v3];
  id v4 = [(id)objc_opt_class() _any4KResolutionPredicate];
  [v6 addObject:v4];
  id v5 = [(id)objc_opt_class() _predicateWithSubpredicates:v6 compoundPredicateType:2];
  [(VUIMediaEntityFetchRequest *)self _addPredicate:v5];
}

- (void)addIsLocalPredicate
{
  id v3 = [(id)objc_opt_class() _isLocalPredicate];
  [(VUIMediaEntityFetchRequest *)self _addPredicate:v3];
}

- (void)addIsLocalOrHasExpiredDownloadPredicate
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() _isLocalPredicate];
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NIL AND %K == NO AND %K == NO", @"downloadExpirationDate", @"markedAsDeleted", @"isLocal");
  id v5 = objc_opt_class();
  v8[0] = v3;
  v8[1] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v7 = [v5 _predicateWithSubpredicates:v6 compoundPredicateType:2];

  [(VUIMediaEntityFetchRequest *)self _addPredicate:v7];
}

- (void)addDownloadStatePredicateForStates:(unint64_t)a3
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = v5;
  if (a3)
  {
    v36 = v5;
    v7 = (uint64_t *)MEMORY[0x1E4FA8630];
    if (!sDownloadManager)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4FA8178]);
      uint64_t v9 = *MEMORY[0x1E4FA84C0];
      v48[0] = *MEMORY[0x1E4FA8490];
      v48[1] = v9;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
      [v8 setDownloadKinds:v10];

      [v8 setShouldFilterExternalOriginatedDownloads:0];
      uint64_t v47 = *v7;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      [v8 setPrefetchedDownloadProperties:v11];

      uint64_t v12 = [objc_alloc(MEMORY[0x1E4FA8170]) initWithManagerOptions:v8];
      v13 = (void *)sDownloadManager;
      sDownloadManager = v12;
    }
    unint64_t v35 = a3;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v15 = [(id)sDownloadManager downloads];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v42;
      uint64_t v19 = *v7;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v15);
          }
          v21 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * v20), "valueForProperty:", v19, v35);
          if (v21) {
            [v14 addObject:v21];
          }

          ++v20;
        }
        while (v17 != v20);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v17);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v22 = +[VUIDownloadManager sharedInstance];
    v23 = [v22 downloads];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v38;
      uint64_t v27 = *MEMORY[0x1E4FAA0D8];
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(v23);
          }
          v29 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v28), "mediaItem", v35);
          v30 = [v29 mediaItemMetadataForProperty:v27];

          if (v30)
          {
            v31 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v30, "longLongValue"));
            [v14 addObject:v31];
          }
          ++v28;
        }
        while (v25 != v28);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v25);
    }

    v32 = [(id)objc_opt_class() _isInPredicateWithAdamId:v14];
    id v6 = v36;
    [v36 addObject:v32];

    LOBYTE(a3) = v35;
  }
  if ((a3 & 2) != 0)
  {
    v33 = [(id)objc_opt_class() _isLocalPredicate];
    [v6 addObject:v33];
  }
  v34 = [(id)objc_opt_class() _predicateWithSubpredicates:v6 compoundPredicateType:2];
  [(VUIMediaEntityFetchRequest *)self _addPredicate:v34];
}

- (void)addAdamIdPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _isEqualPredicateWithAdamId:v4];

  [(VUIMediaEntityFetchRequest *)self _addPredicate:v5];
}

- (void)addAdamIdsPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _isInPredicateWithAdamId:v4];

  [(VUIMediaEntityFetchRequest *)self _addPredicate:v5];
}

+ (id)_minimalPropertiesFetchRequestWithType:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[VUIMediaEntityFetchRequest alloc] initWithMediaEntityType:v4];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = [a1 _includeSortIndexesOptions];
  [(VUIMediaEntityFetchRequest *)v5 setOptions:v7];

  id v8 = [a1 _predicateWithSubpredicates:v6 compoundPredicateType:1];
  [(VUIMediaEntityFetchRequest *)v5 setPredicate:v8];
  uint64_t v9 = [a1 _titleSortDescriptor];
  v13[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [(VUIMediaEntityFetchRequest *)v5 setSortDescriptors:v10];

  v11 = VUIMediaEntityFetchRequestMinimalPropertiesSet();
  [(VUIMediaEntityFetchRequest *)v5 setProperties:v11];

  return v5;
}

+ (id)_minimalMoviesPropertiesFetchRequest
{
  id v3 = +[VUIMediaEntityType movie];
  id v4 = [a1 _minimalPropertiesFetchRequestWithType:v3];

  id v5 = VUIMediaEntityFetchRequestMinimalMoviesPropertiesSet();
  [v4 setProperties:v5];

  return v4;
}

+ (id)_minimalMovieRentalsPropertiesFetchRequest
{
  id v3 = +[VUIMediaEntityType movieRental];
  id v4 = [a1 _minimalPropertiesFetchRequestWithType:v3];

  id v5 = VUIMediaEntityFetchRequestMinimalMovieRentalsPropertiesSet();
  [v4 setProperties:v5];

  return v4;
}

+ (id)_minimalShowsPropertiesFetchRequest
{
  id v3 = +[VUIMediaEntityType show];
  id v4 = [a1 _minimalPropertiesFetchRequestWithType:v3];

  id v5 = VUIMediaEntityFetchRequestMinimalShowPropertiesSet();
  [v4 setProperties:v5];

  return v4;
}

+ (id)_seasonsFetchRequestWithShowIdentifier:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [VUIMediaEntityFetchRequest alloc];
  id v6 = +[VUIMediaEntityType season];
  v7 = [(VUIMediaEntityFetchRequest *)v5 initWithMediaEntityType:v6];

  if (v4)
  {
    id v8 = [a1 _showIdentifierPredicateWithIdentifier:v4];
    [(VUIMediaEntityFetchRequest *)v7 setPredicate:v8];
  }
  uint64_t v9 = [a1 _includeSortIndexesOptions];
  [(VUIMediaEntityFetchRequest *)v7 setOptions:v9];

  v10 = [a1 _titleSortDescriptor];
  v11 = [a1 _seasonNumberSortDescriptor];
  v15[0] = v11;
  v15[1] = v10;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [(VUIMediaEntityFetchRequest *)v7 setSortDescriptors:v12];
  v13 = VUIMediaEntityFetchRequestAllPropertiesSet();
  [(VUIMediaEntityFetchRequest *)v7 setProperties:v13];

  return v7;
}

+ (id)_seasonsFetchRequestWithSeasonIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [VUIMediaEntityFetchRequest alloc];
  id v6 = +[VUIMediaEntityType season];
  v7 = [(VUIMediaEntityFetchRequest *)v5 initWithMediaEntityType:v6];

  if (v4)
  {
    id v8 = [a1 _identifierPredicateWithIdentifier:v4];
    [(VUIMediaEntityFetchRequest *)v7 setPredicate:v8];
  }
  uint64_t v9 = VUIMediaEntityFetchRequestAllPropertiesSet();
  [(VUIMediaEntityFetchRequest *)v7 setProperties:v9];

  return v7;
}

+ (id)_episodesFetchRequestWithSeasonIdentifier:(id)a3 showIdentifier:(id)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [VUIMediaEntityFetchRequest alloc];
  uint64_t v9 = +[VUIMediaEntityType episode];
  v10 = [(VUIMediaEntityFetchRequest *)v8 initWithMediaEntityType:v9];

  v11 = [a1 _titleSortDescriptor];
  uint64_t v12 = VUIMediaEntityFetchRequestMinimalEpisodePropertiesSet();
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v26 = v7;
  if (v6)
  {
    id v14 = [a1 _seasonIdentifierPredicateWithIdentifier:v6];
    [v13 addObject:v14];
    v15 = [a1 _episodeNumberSortDescriptor];
    v29[0] = v15;
    v29[1] = v11;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];

LABEL_3:
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_6;
  }
  if (!v7)
  {
    uint64_t v27 = v11;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    goto LABEL_3;
  }
  uint64_t v25 = [a1 _showIdentifierPredicateWithIdentifier:v7];
  [v13 addObject:v25];
  uint64_t v24 = [a1 _episodeNumberSortDescriptor];
  v23 = [a1 _fractionalEpisodeNumberSortDescriptor];
  v28[0] = v23;
  v28[1] = v24;
  v28[2] = v11;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  uint64_t v17 = @"seasonIdentifier";
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"seasonTitle", @"seasonIdentifier", 0);
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v20 unionSet:v12];
  [v20 unionSet:v19];

  uint64_t v18 = &__block_literal_global_36;
  uint64_t v12 = v20;
LABEL_6:
  [(VUIMediaEntityFetchRequest *)v10 setSortDescriptors:v16];
  [(VUIMediaEntityFetchRequest *)v10 setGroupingKeyPath:v17];
  [(VUIMediaEntityFetchRequest *)v10 setGroupingSortComparator:v18];
  [(VUIMediaEntityFetchRequest *)v10 setProperties:v12];
  v21 = [a1 _predicateWithSubpredicates:v13 compoundPredicateType:1];
  [(VUIMediaEntityFetchRequest *)v10 setPredicate:v21];

  return v10;
}

uint64_t __96__VUIMediaEntityFetchRequest_Factory___episodesFetchRequestWithSeasonIdentifier_showIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 mediaEntities];
  id v6 = [v5 firstObject];

  id v7 = [v4 mediaEntities];

  id v8 = [v7 firstObject];

  uint64_t v9 = [v6 seasonNumber];
  uint64_t v10 = [v8 seasonNumber];
  v11 = (void *)v10;
  if (v9 && v10)
  {
    uint64_t v12 = [v9 compare:v10];
    if (!v12)
    {
      id v13 = [v6 seasonTitle];
      id v14 = [v8 seasonTitle];
      v15 = [MEMORY[0x1E4FB3D28] titleSortComparatorWithAscending:1];
      uint64_t v12 = ((uint64_t (**)(void, void *, void *))v15)[2](v15, v13, v14);
    }
  }
  else if (v9)
  {
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

+ (id)_identifierPredicateWithIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "vui_equalPredicateWithKeyPath:value:", @"identifier", a3);
}

+ (id)_showIdentifierPredicateWithIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "vui_equalPredicateWithKeyPath:value:", @"showIdentifier", a3);
}

+ (id)_seasonIdentifierPredicateWithIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "vui_equalPredicateWithKeyPath:value:", @"seasonIdentifier", a3);
}

+ (id)_isEqualPredicateWithAdamId:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "vui_equalPredicateWithKeyPath:value:", @"storeID", a3);
}

+ (id)_isInPredicateWithAdamId:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "vui_inPredicateWithKeyPath:value:", @"storeID", a3);
}

+ (id)_isLocalPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "vui_equalPredicateWithKeyPath:value:", @"isLocal", MEMORY[0x1E4F1CC38]);
}

+ (id)_anyHDRColorCapabilityPredicate
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F28F60], "vui_keyPathBitTestPredicateWithKeyPath:value:", @"colorCapability", &unk_1F3F3C8C0);
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "vui_keyPathBitTestPredicateWithKeyPath:value:", @"HLSColorCapability", &unk_1F3F3C8C0);
  id v4 = objc_opt_class();
  v8[0] = v2;
  v8[1] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v4 _predicateWithSubpredicates:v5 compoundPredicateType:2];

  return v6;
}

+ (id)_resolutionPredicateWithResolution:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "vui_equalPredicateWithKeyPath:value:", @"resolution", a3);
}

+ (id)_HLSResolutionPredicateWithResolution:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "vui_equalPredicateWithKeyPath:value:", @"HLSResolution", a3);
}

+ (id)_any4KResolutionPredicate
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [(id)objc_opt_class() _resolutionPredicateWithResolution:&unk_1F3F3C8C0];
  [v2 addObject:v3];
  id v4 = [(id)objc_opt_class() _HLSResolutionPredicateWithResolution:&unk_1F3F3C8C0];
  [v2 addObject:v4];
  id v5 = [(id)objc_opt_class() _predicateWithSubpredicates:v2 compoundPredicateType:2];

  return v5;
}

+ (id)_predicateWithSubpredicates:(id)a3 compoundPredicateType:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "vui_predicateWithSubpredicates:type:", a3, a4);
}

- (void)_addPredicate:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v8 = objc_alloc_init(v4);
  [v8 addObject:v5];

  id v6 = [(VUIMediaEntityFetchRequest *)self predicate];
  if (v6) {
    [v8 addObject:v6];
  }
  id v7 = [(id)objc_opt_class() _predicateWithSubpredicates:v8 compoundPredicateType:1];
  [(VUIMediaEntityFetchRequest *)self setPredicate:v7];
}

+ (id)_includeSortIndexesOptions
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"IncludeSortIndexes";
  v5[0] = MEMORY[0x1E4F1CC38];
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

+ (id)_titleSortDescriptor
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1];
}

+ (id)_releaseYearSortDescriptor
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"releaseYear" ascending:1];
}

+ (id)_addedDateSortDescriptor
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:0];
}

+ (id)_releaseDateSortDescriptor
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"releaseDate" ascending:0];
}

+ (id)_seasonNumberSortDescriptor
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"seasonNumber" ascending:1];
}

+ (id)_showTitleSortDescriptor
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"showTitle" ascending:1];
}

+ (id)_episodeNumberSortDescriptor
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeNumber" ascending:1];
}

+ (id)_fractionalEpisodeNumberSortDescriptor
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"fractionalEpisodeNumber" ascending:1];
}

+ (id)_addedToDateSortDescriptor
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedToDate" ascending:0];
}

- (VUIMediaEntityFetchRequest)initWithMediaEntityType:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  id v5 = [(VUIMediaEntityFetchRequest *)self initWithMediaEntityTypes:v4];

  return v5;
}

- (VUIMediaEntityFetchRequest)initWithMediaEntityTypes:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIMediaEntityFetchRequest;
  id v5 = [(VUIMediaEntityFetchRequest *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    mediaEntityTypes = v5->_mediaEntityTypes;
    v5->_mediaEntityTypes = (NSSet *)v6;

    id v8 = VUIMediaEntityFetchRequestRequiredProperties();
    uint64_t v9 = [v8 copy];
    properties = v5->_properties;
    v5->_properties = (NSSet *)v9;
  }
  return v5;
}

- (VUIMediaEntityFetchRequest)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (!identifier)
  {
    uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
    id v5 = [v4 UUIDString];
    uint64_t v6 = self->_identifier;
    self->_identifier = v5;

    identifier = self->_identifier;
  }
  return identifier;
}

- (void)setProperties:(id)a3
{
  id v9 = a3;
  uint64_t v4 = v9;
  if ((VUIMediaEntityFetchRequestIsAllPropertiesSet(v9) & 1) == 0)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = VUIMediaEntityFetchRequestRequiredProperties();
    uint64_t v4 = (void *)[v5 initWithSet:v6];

    if (v9) {
      [v4 unionSet:v9];
    }
  }
  id v7 = (NSSet *)[v4 copy];
  properties = self->_properties;
  self->_properties = v7;

  [(VUIMediaEntityFetchRequest *)self _didUpdateRequestProperties];
}

- (void)setPredicate:(id)a3
{
  uint64_t v4 = (NSPredicate *)[a3 copy];
  predicate = self->_predicate;
  self->_predicate = v4;

  [(VUIMediaEntityFetchRequest *)self _didUpdateRequestProperties];
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
  [(VUIMediaEntityFetchRequest *)self _didUpdateRequestProperties];
}

- (void)setSortDescriptors:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];
  sortDescriptors = self->_sortDescriptors;
  self->_sortDescriptors = v4;

  [(VUIMediaEntityFetchRequest *)self _didUpdateRequestProperties];
}

- (void)setGroupingKeyPath:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  groupingKeyPath = self->_groupingKeyPath;
  self->_groupingKeyPath = v4;

  [(VUIMediaEntityFetchRequest *)self _didUpdateRequestProperties];
}

- (void)setGroupingSortComparator:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id groupingSortComparator = self->_groupingSortComparator;
  self->_id groupingSortComparator = v4;

  [(VUIMediaEntityFetchRequest *)self _didUpdateRequestProperties];
}

- (void)setOptions:(id)a3
{
  uint64_t v4 = (NSDictionary *)[a3 copy];
  options = self->_options;
  self->_options = v4;

  [(VUIMediaEntityFetchRequest *)self _didUpdateRequestProperties];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[VUIMediaEntityFetchRequest alloc] initWithMediaEntityTypes:self->_mediaEntityTypes];
  id v5 = [(VUIMediaEntityFetchRequest *)self identifier];
  uint64_t v6 = [v5 copy];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v6;

  uint64_t v8 = [(NSPredicate *)self->_predicate copy];
  predicate = v4->_predicate;
  v4->_predicate = (NSPredicate *)v8;

  uint64_t v10 = [(NSArray *)self->_sortDescriptors copy];
  sortDescriptors = v4->_sortDescriptors;
  v4->_sortDescriptors = (NSArray *)v10;

  uint64_t v12 = [(NSSet *)self->_properties copy];
  properties = v4->_properties;
  v4->_properties = (NSSet *)v12;

  uint64_t v14 = [(NSDictionary *)self->_options copy];
  options = v4->_options;
  v4->_options = (NSDictionary *)v14;

  v4->_range = self->_range;
  uint64_t v16 = [(NSString *)self->_groupingKeyPath copy];
  groupingKeyPath = v4->_groupingKeyPath;
  v4->_groupingKeyPath = (NSString *)v16;

  uint64_t v18 = [self->_groupingSortComparator copy];
  id groupingSortComparator = v4->_groupingSortComparator;
  v4->_id groupingSortComparator = (id)v18;

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v40.receiver = self;
  v40.super_class = (Class)VUIMediaEntityFetchRequest;
  uint64_t v4 = [(VUIMediaEntityFetchRequest *)&v40 description];
  [v3 addObject:v4];

  id v5 = NSString;
  uint64_t v6 = [(VUIMediaEntityFetchRequest *)self identifier];
  id v7 = [v5 stringWithFormat:@"%@=%@", @"identifier", v6];
  [v3 addObject:v7];

  uint64_t v8 = NSString;
  id v9 = [(VUIMediaEntityFetchRequest *)self mediaEntityTypes];
  uint64_t v10 = [v8 stringWithFormat:@"%@=%@", @"mediaEntityTypes", v9];
  [v3 addObject:v10];

  v11 = NSString;
  uint64_t v12 = [(VUIMediaEntityFetchRequest *)self predicate];
  id v13 = [v11 stringWithFormat:@"%@=%@", @"predicate", v12];
  [v3 addObject:v13];

  uint64_t v14 = NSString;
  v15 = [(VUIMediaEntityFetchRequest *)self sortDescriptors];
  uint64_t v16 = [v14 stringWithFormat:@"%@=%@", @"sortDescriptors", v15];
  [v3 addObject:v16];

  uint64_t v17 = NSString;
  uint64_t v18 = [(VUIMediaEntityFetchRequest *)self properties];
  uint64_t v19 = [v17 stringWithFormat:@"%@=%@", @"properties", v18];
  [v3 addObject:v19];

  id v20 = NSString;
  v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIMediaEntityFetchRequest range](self, "range"));
  v22 = (void *)MEMORY[0x1E4F28ED0];
  [(VUIMediaEntityFetchRequest *)self range];
  uint64_t v24 = [v22 numberWithUnsignedInteger:v23];
  uint64_t v25 = [v20 stringWithFormat:@"%@,%@", v21, v24];
  uint64_t v26 = [v20 stringWithFormat:@"%@=%@", @"range", v25];
  [v3 addObject:v26];

  uint64_t v27 = NSString;
  uint64_t v28 = [(VUIMediaEntityFetchRequest *)self groupingKeyPath];
  v29 = [v27 stringWithFormat:@"%@=%@", @"groupingKeyPath", v28];
  [v3 addObject:v29];

  v30 = NSString;
  v31 = [(VUIMediaEntityFetchRequest *)self groupingSortComparator];
  v32 = [v30 stringWithFormat:@"%@=%@", @"groupingSortComparator", v31];
  [v3 addObject:v32];

  v33 = NSString;
  v34 = [(VUIMediaEntityFetchRequest *)self options];
  unint64_t v35 = [v33 stringWithFormat:@"%@=%@", @"options", v34];
  [v3 addObject:v35];

  v36 = NSString;
  long long v37 = [v3 componentsJoinedByString:@", "];
  long long v38 = [v36 stringWithFormat:@"<%@>", v37];

  return v38;
}

- (unint64_t)hash
{
  id v2 = [(VUIMediaEntityFetchRequest *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIMediaEntityFetchRequest *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    id v7 = [(VUIMediaEntityFetchRequest *)self identifier];
    uint64_t v8 = [(VUIMediaEntityFetchRequest *)v6 identifier];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
      char v12 = 1;
    }
    else
    {
      char v12 = 0;
      if (v9 && v10) {
        char v12 = [v9 isEqual:v10];
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)_didUpdateRequestProperties
{
}

- (BOOL)_isItemsFetch
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(VUIMediaEntityFetchRequest *)self mediaEntityTypes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v7 + 1) + 8 * i) subtype])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_isCollectionsFetch
{
  return ![(VUIMediaEntityFetchRequest *)self _isItemsFetch];
}

- (BOOL)_isShowsFetch
{
  id v2 = [(VUIMediaEntityFetchRequest *)self mediaEntityTypes];
  uint64_t v3 = +[VUIMediaEntityType show];
  char v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)_isSeasonsFetch
{
  id v2 = [(VUIMediaEntityFetchRequest *)self mediaEntityTypes];
  uint64_t v3 = +[VUIMediaEntityType season];
  char v4 = [v2 containsObject:v3];

  return v4;
}

- (id)_sortIndexPropertyKeyWithMediaEntityKind:(id)a3
{
  id v4 = a3;
  if ([(VUIMediaEntityFetchRequest *)self _shouldGenerateSortIndexes])
  {
    id v5 = [(VUIMediaEntityFetchRequest *)self sortDescriptors];
    uint64_t v6 = [v5 firstObject];
    long long v7 = v6;
    if (v6)
    {
      long long v8 = [v6 key];
      long long v9 = [v4 propertyDescriptorForName:v8];
      if ([v9 propertyType] == 4)
      {
        long long v10 = [v9 sortAsName];
        if (!v10)
        {
          long long v10 = [v9 name];
        }
      }
      else
      {
        long long v10 = 0;
      }
    }
    else
    {
      long long v10 = 0;
    }
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldGenerateSortIndexes
{
  id v2 = [(VUIMediaEntityFetchRequest *)self options];
  char v3 = objc_msgSend(v2, "vui_BOOLForKey:defaultValue:", @"IncludeSortIndexes", 0);

  return v3;
}

- (BOOL)_shouldGenerateGroupingSortIndexes
{
  char v3 = [(VUIMediaEntityFetchRequest *)self groupingKeyPath];
  if (v3)
  {
    id v4 = [(VUIMediaEntityFetchRequest *)self options];
    char v5 = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"IncludeGroupingSortIndexes", 0);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_manualSortDescriptorsWithMediaEntityKind:(id)a3 propertiesRequiredForSort:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [(VUIMediaEntityFetchRequest *)self sortDescriptors];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = [v11 key];
        id v13 = [v21 sortingPropertyDescriptorForName:v12];
        if (!v13) {
          [MEMORY[0x1E4F1CA00] raise:v19, @"Unknown key for sort descriptor! %@", v12 format];
        }
        uint64_t v14 = [v13 name];
        v15 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", v14, objc_msgSend(v11, "ascending"));
        [v6 addObject:v14];
        [v5 addObject:v15];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
  if (a4) {
    *a4 = v6;
  }
  uint64_t v16 = [(id)objc_opt_class() _finalizedSortDescriptorsFromSortDescriptors:v5 mediaEntityKind:v21];

  return v16;
}

+ (id)_finalizedSortDescriptorsFromSortDescriptors:(id)a3 mediaEntityKind:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count]) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v8 = 0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(a1, "_finalizedSortDescriptorFromSortDescriptor:mediaEntityKind:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (id)_finalizedSortDescriptorFromSortDescriptor:(id)a3 mediaEntityKind:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 key];
  if (v7)
  {
    id v8 = [v6 propertyDescriptorForName:v7];
    if ([v8 propertyType] == 4)
    {
      id v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FB3D38]), "initWithKey:ascending:", v7, objc_msgSend(v5, "ascending"));

      if (v9) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v9 = v5;
LABEL_7:

  return v9;
}

- (void)setIdentifier:(id)a3
{
}

- (NSSet)mediaEntityTypes
{
  return self->_mediaEntityTypes;
}

- (void)setMediaEntityTypes:(id)a3
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (NSSet)properties
{
  return self->_properties;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)groupingKeyPath
{
  return self->_groupingKeyPath;
}

- (id)groupingSortComparator
{
  return self->_groupingSortComparator;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_groupingSortComparator, 0);
  objc_storeStrong((id *)&self->_groupingKeyPath, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_mediaEntityTypes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end