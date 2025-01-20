@interface PXSharedLibraryAggregateSharingSuggestionContainer
- (BOOL)isEqual:(id)a3;
- (NSArray)px_sl_containedSharingSuggestions;
- (NSDate)aggregateBeforeDate;
- (NSSet)px_sl_containedSharingSuggestionObjectIDs;
- (NSString)px_sl_identifier;
- (NSString)px_sl_title;
- (PHAssetCollection)px_sl_containerCollection;
- (PXSharedLibraryAggregateSharingSuggestionContainer)initWithSharingSuggestions:(id)a3 aggregateBeforeDate:(id)a4;
- (_NSRange)aggregationRange;
- (id)px_sl_fetchAssetCollections;
- (unint64_t)hash;
- (void)px_sl_getKeyAsset:(id *)a3 suggestedDate:(id *)a4 locations:(id *)a5;
@end

@implementation PXSharedLibraryAggregateSharingSuggestionContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateBeforeDate, 0);
  objc_storeStrong((id *)&self->_px_sl_containerCollection, 0);
  objc_storeStrong((id *)&self->_px_sl_containedSharingSuggestionObjectIDs, 0);
  objc_storeStrong((id *)&self->_px_sl_containedSharingSuggestions, 0);
  objc_storeStrong((id *)&self->_px_sl_title, 0);
  objc_storeStrong((id *)&self->_sharingSuggestions, 0);
}

- (_NSRange)aggregationRange
{
  NSUInteger length = self->_aggregationRange.length;
  NSUInteger location = self->_aggregationRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSDate)aggregateBeforeDate
{
  return self->_aggregateBeforeDate;
}

- (NSSet)px_sl_containedSharingSuggestionObjectIDs
{
  return self->_px_sl_containedSharingSuggestionObjectIDs;
}

- (NSArray)px_sl_containedSharingSuggestions
{
  return self->_px_sl_containedSharingSuggestions;
}

- (PHAssetCollection)px_sl_containerCollection
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_px_sl_containerCollection)
  {
    v3 = [(PXSharedLibraryAggregateSharingSuggestionContainer *)v2 px_sl_containedSharingSuggestions];
    v4 = [v3 firstObject];
    v5 = [v4 photoLibrary];
    v6 = [v5 librarySpecificFetchOptions];

    [v6 setIncludeSharedLibrarySharingSuggestionsSmartAlbum:1];
    v7 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:1000000214 options:v6];
    v8 = (void *)MEMORY[0x1E4F28F60];
    v9 = [(PXSharedLibraryAggregateSharingSuggestionContainer *)v2 px_sl_containedSharingSuggestionObjectIDs];
    v10 = [v8 predicateWithFormat:@"highlightBeingAssets.parentPhotosHighlight IN (%@)", v9];
    [v6 setInternalPredicate:v10];

    [v6 setWantsIncrementalChangeDetails:0];
    v11 = (void *)MEMORY[0x1E4F38EB8];
    v12 = [v7 firstObject];
    v13 = [v11 fetchAssetsInAssetCollection:v12 options:v6];

    uint64_t v14 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v13 title:0 identifier:@"PXSharedLibrarySharingSuggestionTransientIdentifier"];
    px_sl_containerCollection = v2->_px_sl_containerCollection;
    v2->_px_sl_containerCollection = (PHAssetCollection *)v14;
  }
  objc_sync_exit(v2);

  v16 = v2->_px_sl_containerCollection;
  return v16;
}

- (void)px_sl_getKeyAsset:(id *)a3 suggestedDate:(id *)a4 locations:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = [(PXSharedLibraryAggregateSharingSuggestionContainer *)self px_sl_containedSharingSuggestions];
  uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  id v7 = 0;
  id v8 = 0;
  if (v27)
  {
    uint64_t v26 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v34 = 0;
        id v35 = 0;
        id v33 = 0;
        objc_msgSend(v10, "px_sl_getKeyAsset:suggestedDate:locations:", &v35, &v34, &v33);
        id v11 = v35;
        id v12 = v34;
        id v13 = v33;
        if (!v8) {
          id v8 = v11;
        }
        v28 = v11;
        if (!v7) {
          id v7 = v12;
        }
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v40 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v30 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * j);
              if (([v6 containsObject:v19] & 1) == 0) {
                [v6 addObject:v19];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v40 count:16];
          }
          while (v16);
        }

        if (v8 && v7 && (unint64_t)[v6 count] >= 4)
        {

          goto LABEL_26;
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }
LABEL_26:

  id v20 = v8;
  *a3 = v20;
  id v21 = v7;
  *a4 = v21;
  *a5 = [v6 array];
}

- (id)px_sl_fetchAssetCollections
{
  v2 = (void *)MEMORY[0x1E4F39238];
  v3 = [(PXSharedLibraryAggregateSharingSuggestionContainer *)self px_sl_containedSharingSuggestions];
  v4 = [v2 fetchHighlightsInSharedLibrarySharingSuggestions:v3];

  return v4;
}

- (NSString)px_sl_title
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_px_sl_title)
  {
    v3 = [(PXSharedLibraryAggregateSharingSuggestionContainer *)v2 px_sl_containedSharingSuggestions];
    v4 = [v3 firstObject];

    v5 = [(PXSharedLibraryAggregateSharingSuggestionContainer *)v2 px_sl_containedSharingSuggestions];
    id v6 = [v5 lastObject];

    id v7 = [v4 startDate];
    id v8 = [v6 startDate];
    v9 = [v7 earlierDate:v8];

    v10 = [v4 endDate];
    id v11 = [v6 endDate];
    id v12 = [v10 laterDate:v11];

    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v12];
    uint64_t v14 = _localizedSuggestionTitleForDateInterval(v13);
    px_sl_title = v2->_px_sl_title;
    v2->_px_sl_title = (NSString *)v14;
  }
  objc_sync_exit(v2);

  uint64_t v16 = v2->_px_sl_title;
  return v16;
}

- (unint64_t)hash
{
  v2 = [(PXSharedLibraryAggregateSharingSuggestionContainer *)self px_sl_identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(PXSharedLibraryAggregateSharingSuggestionContainer *)self px_sl_identifier];
    id v6 = objc_msgSend(v4, "px_sl_identifier");
    if (v5 == v6) {
      char v7 = 1;
    }
    else {
      char v7 = [v5 isEqualToString:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)px_sl_identifier
{
  return (NSString *)@"PXSharedLibrarySuggestionAggregateIdentifier";
}

- (PXSharedLibraryAggregateSharingSuggestionContainer)initWithSharingSuggestions:(id)a3 aggregateBeforeDate:(id)a4
{
  id v7 = a3;
  obuint64_t j = a4;
  id v8 = a4;
  uint64_t v9 = [v7 count];
  NSUInteger v10 = 0;
  while (1)
  {
    if ((v9 & ~(v9 >> 63)) == v10)
    {
LABEL_6:
      uint64_t v14 = 0;
      goto LABEL_7;
    }
    id v11 = [v7 objectAtIndexedSubscript:v10];
    id v12 = [v11 endDate];
    uint64_t v13 = [v12 compare:v8];

    if (v13 == -1 && (uint64_t)(v10 + 1) < v9) {
      break;
    }

    ++v10;
    if (v13 == -1) {
      goto LABEL_6;
    }
  }

  uint64_t v14 = 0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v9 != v10)
  {
    v27.receiver = self;
    v27.super_class = (Class)PXSharedLibraryAggregateSharingSuggestionContainer;
    uint64_t v16 = [(PXSharedLibraryAggregateSharingSuggestionContainer *)&v27 init];
    uint64_t v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_sharingSuggestions, a3);
      objc_storeStrong((id *)&v17->_aggregateBeforeDate, obj);
      v17->_aggregationRange.NSUInteger location = v10;
      v17->_aggregationRange.NSUInteger length = v9 - v10;
      v18 = [(PHFetchResult *)v17->_sharingSuggestions fetchedObjects];
      uint64_t v19 = objc_msgSend(v18, "subarrayWithRange:", v17->_aggregationRange.location, v17->_aggregationRange.length);
      px_sl_containedSharingSuggestions = v17->_px_sl_containedSharingSuggestions;
      v17->_px_sl_containedSharingSuggestions = (NSArray *)v19;

      id v21 = (void *)MEMORY[0x1E4F1CAD0];
      v22 = [(PHFetchResult *)v17->_sharingSuggestions fetchedObjectIDs];
      v23 = objc_msgSend(v22, "subarrayWithRange:", v17->_aggregationRange.location, v17->_aggregationRange.length);
      uint64_t v24 = [v21 setWithArray:v23];
      px_sl_containedSharingSuggestionObjectIDs = v17->_px_sl_containedSharingSuggestionObjectIDs;
      v17->_px_sl_containedSharingSuggestionObjectIDs = (NSSet *)v24;
    }
    self = v17;
    uint64_t v14 = self;
  }
LABEL_7:

  return v14;
}

@end