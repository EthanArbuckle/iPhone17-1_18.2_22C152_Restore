@interface PGHighlightItemModelManager
- (NSMutableDictionary)contextualKeyAssetMixedByHighlighItemUUID;
- (NSMutableDictionary)contextualKeyAssetPrivateByHighlighItemUUID;
- (NSMutableDictionary)contextualKeyAssetSharedByHighlighItemUUID;
- (NSMutableDictionary)visibilityStateMixedByHighlighItemUUID;
- (NSMutableDictionary)visibilityStatePrivateByHighlighItemUUID;
- (NSMutableDictionary)visibilityStateSharedByHighlighItemUUID;
- (PGHighlightItemModelManager)initWithLibrary:(id)a3;
- (PHPhotoLibrary)library;
- (id)_contextualKeyAssetByHighlighItemUUIDForHighlightFilter:(unsigned __int16)a3;
- (id)_visibilityStateByHighlighItemUUIDForHighlightFilter:(unsigned __int16)a3;
- (id)contextualKeyAssetForHighlightItem:(id)a3 sharingFilter:(unsigned __int16)a4;
- (id)fetchChildHighlightItemsForHighlightItem:(id)a3 sharingFilter:(unsigned __int16)a4;
- (id)fetchParentHighlightItemsForHighlightItems:(id)a3;
- (id)highlightUUIDsWithContextualKeyAssetChange;
- (id)highlightUUIDsWithVisibilityStateChange;
- (id)initForTesting;
- (unsigned)visibilityStateForHighlightItem:(id)a3 sharingFilter:(unsigned __int16)a4;
- (void)addVisibleHighlight:(id)a3 inMonth:(id)a4 withHighlightFilter:(unsigned __int16)a5;
- (void)commonInit;
- (void)consumeHighlightItemList:(id)a3;
- (void)setContextualKeyAsset:(id)a3 forHighlightItem:(id)a4 sharingFilter:(unsigned __int16)a5;
- (void)setVisibilityState:(unsigned __int16)a3 forHighlightItem:(id)a4 sharingFilter:(unsigned __int16)a5;
- (void)setVisibilityState:(unsigned __int16)a3 forHighlightItemList:(id)a4 sharingFilter:(unsigned __int16)a5;
@end

@implementation PGHighlightItemModelManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualKeyAssetMixedByHighlighItemUUID, 0);
  objc_storeStrong((id *)&self->_contextualKeyAssetSharedByHighlighItemUUID, 0);
  objc_storeStrong((id *)&self->_contextualKeyAssetPrivateByHighlighItemUUID, 0);
  objc_storeStrong((id *)&self->_visibilityStateMixedByHighlighItemUUID, 0);
  objc_storeStrong((id *)&self->_visibilityStateSharedByHighlighItemUUID, 0);
  objc_storeStrong((id *)&self->_visibilityStatePrivateByHighlighItemUUID, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

- (NSMutableDictionary)contextualKeyAssetMixedByHighlighItemUUID
{
  return self->_contextualKeyAssetMixedByHighlighItemUUID;
}

- (NSMutableDictionary)contextualKeyAssetSharedByHighlighItemUUID
{
  return self->_contextualKeyAssetSharedByHighlighItemUUID;
}

- (NSMutableDictionary)contextualKeyAssetPrivateByHighlighItemUUID
{
  return self->_contextualKeyAssetPrivateByHighlighItemUUID;
}

- (NSMutableDictionary)visibilityStateMixedByHighlighItemUUID
{
  return self->_visibilityStateMixedByHighlighItemUUID;
}

- (NSMutableDictionary)visibilityStateSharedByHighlighItemUUID
{
  return self->_visibilityStateSharedByHighlighItemUUID;
}

- (NSMutableDictionary)visibilityStatePrivateByHighlighItemUUID
{
  return self->_visibilityStatePrivateByHighlighItemUUID;
}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (id)_contextualKeyAssetByHighlighItemUUIDForHighlightFilter:(unsigned __int16)a3
{
  if (a3 <= 2u) {
    self = (&self->_contextualKeyAssetPrivateByHighlighItemUUID)[a3];
  }
  return self;
}

- (id)_visibilityStateByHighlighItemUUIDForHighlightFilter:(unsigned __int16)a3
{
  if (a3 <= 2u) {
    self = (&self->_visibilityStatePrivateByHighlighItemUUID)[a3];
  }
  return self;
}

- (void)addVisibleHighlight:(id)a3 inMonth:(id)a4 withHighlightFilter:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(PGHighlightItemModelManager *)self fetchChildHighlightItemsForHighlightItem:v9 sharingFilter:v5];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v22 = v8;
    unint64_t v13 = 0;
    v14 = 0;
    uint64_t v15 = *(void *)v24;
    double v16 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v10);
        }
        v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (MEMORY[0x1D25FE3E0]([(PGHighlightItemModelManager *)self visibilityStateForHighlightItem:v18 sharingFilter:v5]))
        {
          ++v13;
          [v18 promotionScore];
          if (v19 < v16)
          {
            double v20 = v19;
            id v21 = v18;

            double v16 = v20;
            v14 = v21;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
    if (v14)
    {
      id v8 = v22;
      if (v13 >= +[PGUserDefaults maximumNumberOfVisibleItems])[(PGHighlightItemModelManager *)self setVisibilityState:1 forHighlightItem:v14 sharingFilter:v5]; {
    }
      }
    else
    {
      id v8 = v22;
    }
  }
  else
  {
    v14 = 0;
  }
  [(PGHighlightItemModelManager *)self setVisibilityState:3 forHighlightItem:v8 sharingFilter:v5];
}

- (id)highlightUUIDsWithContextualKeyAssetChange
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = [(NSMutableDictionary *)self->_contextualKeyAssetPrivateByHighlighItemUUID allKeys];
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = [(NSMutableDictionary *)self->_contextualKeyAssetSharedByHighlighItemUUID allKeys];
  [v3 addObjectsFromArray:v5];

  v6 = [(NSMutableDictionary *)self->_contextualKeyAssetMixedByHighlighItemUUID allKeys];
  [v3 addObjectsFromArray:v6];

  return v3;
}

- (id)highlightUUIDsWithVisibilityStateChange
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = [(NSMutableDictionary *)self->_visibilityStatePrivateByHighlighItemUUID allKeys];
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = [(NSMutableDictionary *)self->_visibilityStateSharedByHighlighItemUUID allKeys];
  [v3 addObjectsFromArray:v5];

  v6 = [(NSMutableDictionary *)self->_visibilityStateMixedByHighlighItemUUID allKeys];
  [v3 addObjectsFromArray:v6];

  return v3;
}

- (id)contextualKeyAssetForHighlightItem:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = [(PGHighlightItemModelManager *)self _contextualKeyAssetByHighlighItemUUIDForHighlightFilter:v4];
  id v8 = [v6 uuid];

  id v9 = [v7 objectForKeyedSubscript:v8];

  return v9;
}

- (void)setContextualKeyAsset:(id)a3 forHighlightItem:(id)a4 sharingFilter:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = [(PGHighlightItemModelManager *)self _contextualKeyAssetByHighlighItemUUIDForHighlightFilter:v5];
  v10 = [v8 uuid];

  [v11 setObject:v9 forKeyedSubscript:v10];
}

- (unsigned)visibilityStateForHighlightItem:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = [(PGHighlightItemModelManager *)self _visibilityStateByHighlighItemUUIDForHighlightFilter:v4];
  id v8 = [v6 uuid];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    unsigned __int16 v10 = [v9 unsignedShortValue];
  }
  else {
    unsigned __int16 v10 = [v6 visibilityStateForHighlightFilter:v4];
  }
  unsigned __int16 v11 = v10;

  return v11;
}

- (void)setVisibilityState:(unsigned __int16)a3 forHighlightItemList:(id)a4 sharingFilter:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a3;
  id v8 = a4;
  [v8 setVisibilityState:v6 forSharingFilter:v5];
  [(PGHighlightItemModelManager *)self setVisibilityState:v6 forHighlightItem:v8 sharingFilter:v5];
}

- (void)setVisibilityState:(unsigned __int16)a3 forHighlightItem:(id)a4 sharingFilter:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a3;
  id v8 = a4;
  id v11 = [(PGHighlightItemModelManager *)self _visibilityStateByHighlighItemUUIDForHighlightFilter:v5];
  id v9 = [NSNumber numberWithUnsignedShort:v6];
  unsigned __int16 v10 = [v8 uuid];

  [v11 setObject:v9 forKeyedSubscript:v10];
}

- (id)fetchChildHighlightItemsForHighlightItem:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PGHighlightItemModelManager *)self library];
  id v8 = [v7 librarySpecificFetchOptions];

  [v8 setSharingFilter:v4];
  id v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v17[0] = v9;
  unsigned __int16 v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v17[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  [v8 setSortDescriptors:v11];

  uint64_t v12 = (void *)MEMORY[0x1E4F39238];
  unint64_t v13 = [v6 modelObject];

  v14 = [v12 fetchChildHighlightsForHighlight:v13 options:v8];

  uint64_t v15 = [v14 fetchedObjects];

  return v15;
}

- (id)fetchParentHighlightItemsForHighlightItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PGHighlightItemModelManager *)self library];
  id v6 = [v5 librarySpecificFetchOptions];

  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "modelObject", (void)v17);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    v14 = [MEMORY[0x1E4F39238] fetchParentHighlightsForHighlights:v7 options:v6];
    uint64_t v15 = [v14 fetchedObjects];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (void)consumeHighlightItemList:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F39240];
  id v4 = a3;
  uint64_t v5 = [v4 modelObject];
  id v9 = [v3 changeRequestForPhotosHighlight:v5];

  [v4 promotionScore];
  objc_msgSend(v9, "setPromotionScore:");
  [v9 setEnrichmentState:4];
  objc_msgSend(v9, "setVisibilityState:", objc_msgSend(v4, "visibilityStateForHighlightFilter:", 0));
  objc_msgSend(v9, "setVisibilityStateShared:", objc_msgSend(v4, "visibilityStateForHighlightFilter:", 1));
  objc_msgSend(v9, "setVisibilityStateMixed:", objc_msgSend(v4, "visibilityStateForHighlightFilter:", 2));
  id v6 = [v4 keyAssetPrivate];
  [v9 setKeyAssetPrivate:v6];

  v7 = [v4 keyAssetShared];
  [v9 setKeyAssetShared:v7];

  uint64_t v8 = [v4 mixedSharingCompositionKeyAssetRelationship];
  [v9 setMixedSharingCompositionKeyAssetRelationship:v8];
  [v9 didEnrichHighlight];
}

- (void)commonInit
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  visibilityStatePrivateByHighlighItemUUID = self->_visibilityStatePrivateByHighlighItemUUID;
  self->_visibilityStatePrivateByHighlighItemUUID = v3;

  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  visibilityStateSharedByHighlighItemUUID = self->_visibilityStateSharedByHighlighItemUUID;
  self->_visibilityStateSharedByHighlighItemUUID = v5;

  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  visibilityStateMixedByHighlighItemUUID = self->_visibilityStateMixedByHighlighItemUUID;
  self->_visibilityStateMixedByHighlighItemUUID = v7;

  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  contextualKeyAssetPrivateByHighlighItemUUID = self->_contextualKeyAssetPrivateByHighlighItemUUID;
  self->_contextualKeyAssetPrivateByHighlighItemUUID = v9;

  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  contextualKeyAssetSharedByHighlighItemUUID = self->_contextualKeyAssetSharedByHighlighItemUUID;
  self->_contextualKeyAssetSharedByHighlighItemUUID = v11;

  unint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  contextualKeyAssetMixedByHighlighItemUUID = self->_contextualKeyAssetMixedByHighlighItemUUID;
  self->_contextualKeyAssetMixedByHighlighItemUUID = v13;
}

- (id)initForTesting
{
  v5.receiver = self;
  v5.super_class = (Class)PGHighlightItemModelManager;
  v2 = [(PGHighlightItemModelManager *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(PGHighlightItemModelManager *)v2 commonInit];
  }
  return v3;
}

- (PGHighlightItemModelManager)initWithLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGHighlightItemModelManager;
  id v6 = [(PGHighlightItemModelManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_library, a3);
    [(PGHighlightItemModelManager *)v7 commonInit];
  }

  return v7;
}

@end