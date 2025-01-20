@interface PGHighlightItemList
+ (id)timeSortDescriptors;
+ (void)updateParentHighlightItemLists:(id)a3 withChildHighlightItems:(id)a4;
- (BOOL)hasChanges;
- (BOOL)isCandidateForReuse;
- (BOOL)isNewList;
- (NSArray)extendedCuratedAssets;
- (NSArray)sortedChildHighlightItems;
- (NSArray)sortedHighlightItemModelObjects;
- (NSDate)endDate;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (NSDate)startDate;
- (NSDateComponents)localDateComponents;
- (NSMutableOrderedSet)internalHighlightItems;
- (NSMutableSet)internalAddedHighlightItems;
- (NSMutableSet)internalRemovedHighlightItems;
- (NSSet)addedHighlightItems;
- (NSSet)removedHighlightItems;
- (NSString)description;
- (NSString)uuid;
- (PGHighlightItem)parentHighlightItem;
- (PGHighlightItemList)initWithParentHighlightItem:(id)a3 childHighlightItems:(id)a4;
- (PHAsset)keyAssetPrivate;
- (PHAsset)keyAssetShared;
- (double)promotionScore;
- (id)childHighlightItemsForHighlightFilter:(unsigned __int16)a3;
- (id)initAsNewList;
- (id)keyAssetForHighlightFilter:(unsigned __int16)a3;
- (id)modelObject;
- (unint64_t)numberOfAssetsInExtendedForSharingFilter:(unsigned __int16)a3;
- (unint64_t)numberOfAssetsInExtendedMixed;
- (unint64_t)numberOfAssetsInExtendedPrivate;
- (unint64_t)numberOfAssetsInExtendedShared;
- (unsigned)category;
- (unsigned)enrichmentState;
- (unsigned)kind;
- (unsigned)mixedSharingCompositionKeyAssetRelationship;
- (unsigned)sharingComposition;
- (unsigned)type;
- (unsigned)visibilityStateForHighlightFilter:(unsigned __int16)a3;
- (unsigned)visibilityStateMixed;
- (unsigned)visibilityStatePrivate;
- (unsigned)visibilityStateShared;
- (void)_updateHighlightItemsOrdering;
- (void)addHighlightItem:(id)a3;
- (void)removeHighlightItem:(id)a3;
- (void)setExtendedCuratedAssets:(id)a3;
- (void)setInternalHighlightItems:(id)a3;
- (void)setKeyAssetPrivate:(id)a3;
- (void)setKeyAssetShared:(id)a3;
- (void)setMixedSharingCompositionKeyAssetRelationship:(unsigned __int16)a3;
- (void)setModelObject:(id)a3;
- (void)setPromotionScore:(double)a3;
- (void)setVisibilityState:(unsigned __int16)a3 forSharingFilter:(unsigned __int16)a4;
- (void)setVisibilityStateMixed:(unsigned __int16)a3;
- (void)setVisibilityStatePrivate:(unsigned __int16)a3;
- (void)setVisibilityStateShared:(unsigned __int16)a3;
@end

@implementation PGHighlightItemList

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modelObject, 0);
  objc_storeStrong((id *)&self->_extendedCuratedAssets, 0);
  objc_storeStrong((id *)&self->_keyAssetShared, 0);
  objc_storeStrong((id *)&self->_keyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_parentHighlightItem, 0);
  objc_storeStrong((id *)&self->_internalRemovedHighlightItems, 0);
  objc_storeStrong((id *)&self->_internalAddedHighlightItems, 0);
  objc_storeStrong((id *)&self->_internalHighlightItems, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (unsigned)kind
{
  return self->_kind;
}

- (unsigned)enrichmentState
{
  return self->_enrichmentState;
}

- (void)setVisibilityStateMixed:(unsigned __int16)a3
{
  self->_visibilityStateMixed = a3;
}

- (unsigned)visibilityStateMixed
{
  return self->_visibilityStateMixed;
}

- (void)setVisibilityStateShared:(unsigned __int16)a3
{
  self->_visibilityStateShared = a3;
}

- (unsigned)visibilityStateShared
{
  return self->_visibilityStateShared;
}

- (void)setVisibilityStatePrivate:(unsigned __int16)a3
{
  self->_visibilityStatePrivate = a3;
}

- (unsigned)visibilityStatePrivate
{
  return self->_visibilityStatePrivate;
}

- (unsigned)category
{
  return self->_category;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setPromotionScore:(double)a3
{
  self->_promotionScore = a3;
}

- (double)promotionScore
{
  return self->_promotionScore;
}

- (void)setModelObject:(id)a3
{
}

- (id)modelObject
{
  return self->_modelObject;
}

- (void)setExtendedCuratedAssets:(id)a3
{
}

- (void)setMixedSharingCompositionKeyAssetRelationship:(unsigned __int16)a3
{
  self->_mixedSharingCompositionKeyAssetRelationship = a3;
}

- (void)setKeyAssetShared:(id)a3
{
}

- (PHAsset)keyAssetShared
{
  return self->_keyAssetShared;
}

- (void)setKeyAssetPrivate:(id)a3
{
}

- (PHAsset)keyAssetPrivate
{
  return self->_keyAssetPrivate;
}

- (PGHighlightItem)parentHighlightItem
{
  return self->_parentHighlightItem;
}

- (NSMutableSet)internalRemovedHighlightItems
{
  return self->_internalRemovedHighlightItems;
}

- (NSMutableSet)internalAddedHighlightItems
{
  return self->_internalAddedHighlightItems;
}

- (void)setInternalHighlightItems:(id)a3
{
}

- (NSMutableOrderedSet)internalHighlightItems
{
  return self->_internalHighlightItems;
}

- (id)childHighlightItemsForHighlightFilter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PGHighlightItemList *)self sharingComposition];
  if (+[PGHighlightEnrichmentUtilities canUseSharingComposition:v5 forSharingFilter:v3])
  {
    if (v5 == 2)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v7 = [(PGHighlightItemList *)self sortedChildHighlightItems];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if (+[PGHighlightEnrichmentUtilities canUseSharingComposition:forSharingFilter:](PGHighlightEnrichmentUtilities, "canUseSharingComposition:forSharingFilter:", [v12 sharingComposition], v3))
            {
              [v6 addObject:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }
    }
    else
    {
      id v6 = [(PGHighlightItemList *)self sortedChildHighlightItems];
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v6;
}

- (void)setVisibilityState:(unsigned __int16)a3 forSharingFilter:(unsigned __int16)a4
{
  if (a4 <= 2u) {
    *(&self->_visibilityStatePrivate + a4) = a3;
  }
}

- (unsigned)visibilityStateForHighlightFilter:(unsigned __int16)a3
{
  if (a3 > 2u) {
    return 0;
  }
  else {
    return *(&self->_visibilityStatePrivate + a3);
  }
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGHighlightItemList;
  v4 = [(PGHighlightItemList *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@ [(%@) - (%@)] (%ld) time periods", v4, self->_localStartDate, self->_localEndDate, -[NSMutableOrderedSet count](self->_internalHighlightItems, "count")];

  return (NSString *)v5;
}

- (void)_updateHighlightItemsOrdering
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  internalHighlightItems = self->_internalHighlightItems;
  v4 = [(id)objc_opt_class() timeSortDescriptors];
  [(NSMutableOrderedSet *)internalHighlightItems sortUsingDescriptors:v4];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = self->_internalHighlightItems;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "kind", (void)v22) != 3)
        {
          uint64_t v10 = [(NSMutableOrderedSet *)self->_internalHighlightItems firstObject];
          v11 = [v10 startDate];
          startDate = self->_startDate;
          self->_startDate = v11;

          v13 = [(NSMutableOrderedSet *)self->_internalHighlightItems lastObject];
          long long v14 = [v13 endDate];
          endDate = self->_endDate;
          self->_endDate = v14;

          long long v16 = [(NSMutableOrderedSet *)self->_internalHighlightItems firstObject];
          long long v17 = [v16 localStartDate];
          localStartDate = self->_localStartDate;
          self->_localStartDate = v17;

          uint64_t v19 = [(NSMutableOrderedSet *)self->_internalHighlightItems lastObject];
          v20 = [v19 localEndDate];
          localEndDate = self->_localEndDate;
          self->_localEndDate = v20;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)removeHighlightItem:(id)a3
{
  id v4 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->_internalHighlightItems, "containsObject:"))
  {
    [(NSMutableOrderedSet *)self->_internalHighlightItems removeObject:v4];
    if ([(NSMutableSet *)self->_internalAddedHighlightItems containsObject:v4]) {
      [(NSMutableSet *)self->_internalAddedHighlightItems removeObject:v4];
    }
    else {
      [(NSMutableSet *)self->_internalRemovedHighlightItems addObject:v4];
    }
    [(PGHighlightItemList *)self _updateHighlightItemsOrdering];
  }
}

- (void)addHighlightItem:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_internalHighlightItems, "containsObject:") & 1) == 0)
  {
    [(NSMutableOrderedSet *)self->_internalHighlightItems addObject:v4];
    if ([(NSMutableSet *)self->_internalRemovedHighlightItems containsObject:v4]) {
      [(NSMutableSet *)self->_internalRemovedHighlightItems removeObject:v4];
    }
    else {
      [(NSMutableSet *)self->_internalAddedHighlightItems addObject:v4];
    }
    [(PGHighlightItemList *)self _updateHighlightItemsOrdering];
  }
}

- (NSSet)removedHighlightItems
{
  v2 = (void *)[(NSMutableSet *)self->_internalRemovedHighlightItems copy];
  return (NSSet *)v2;
}

- (NSSet)addedHighlightItems
{
  v2 = (void *)[(NSMutableSet *)self->_internalAddedHighlightItems copy];
  return (NSSet *)v2;
}

- (NSArray)sortedChildHighlightItems
{
  v2 = [(NSMutableOrderedSet *)self->_internalHighlightItems array];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (BOOL)isNewList
{
  return self->_parentHighlightItem == 0;
}

- (BOOL)hasChanges
{
  return [(NSMutableSet *)self->_internalAddedHighlightItems count]
      || [(NSMutableSet *)self->_internalRemovedHighlightItems count] != 0;
}

- (BOOL)isCandidateForReuse
{
  return ![(NSMutableOrderedSet *)self->_internalHighlightItems count] && self->_parentHighlightItem != 0;
}

- (NSArray)extendedCuratedAssets
{
  if ([(PGHighlightItemList *)self isCandidateForReuse])
  {
    uint64_t v3 = [(PGHighlightItemList *)self parentHighlightItem];
    id v4 = [v3 extendedCuratedAssets];
  }
  else
  {
    id v4 = self->_extendedCuratedAssets;
  }
  return v4;
}

- (id)keyAssetForHighlightFilter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = [(PGHighlightItemList *)self sharingComposition];
  uint64_t v6 = [(PGHighlightItemList *)self mixedSharingCompositionKeyAssetRelationship];
  v9[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__PGHighlightItemList_keyAssetForHighlightFilter___block_invoke;
  v10[3] = &unk_1E68EA318;
  v10[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__PGHighlightItemList_keyAssetForHighlightFilter___block_invoke_2;
  v9[3] = &unk_1E68EA318;
  uint64_t v7 = +[PGHighlightEnrichmentUtilities selectKeyAssetForSharingComposition:v5 mixedSharingCompositionKeyAssetRelationship:v6 givenHighlightFilter:v3 privateHandler:v10 sharedHandler:v9];
  return v7;
}

uint64_t __50__PGHighlightItemList_keyAssetForHighlightFilter___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) keyAssetPrivate];
}

uint64_t __50__PGHighlightItemList_keyAssetForHighlightFilter___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) keyAssetShared];
}

- (unsigned)mixedSharingCompositionKeyAssetRelationship
{
  if (![(PGHighlightItemList *)self isCandidateForReuse]) {
    return self->_mixedSharingCompositionKeyAssetRelationship;
  }
  uint64_t v3 = [(PGHighlightItemList *)self parentHighlightItem];
  unsigned __int16 v4 = [v3 mixedSharingCompositionKeyAssetRelationship];

  return v4;
}

- (NSArray)sortedHighlightItemModelObjects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableOrderedSet count](self->_internalHighlightItems, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned __int16 v4 = self->_internalHighlightItems;
  uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "modelObject", (void)v13);

        if (v10)
        {
          v11 = [v9 modelObject];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (unint64_t)numberOfAssetsInExtendedForSharingFilter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned __int16 v4 = self->_internalHighlightItems;
  uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "numberOfAssetsInExtendedForSharingFilter:", v3, (void)v11);
      }
      uint64_t v6 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)numberOfAssetsInExtendedMixed
{
  return [(PGHighlightItemList *)self numberOfAssetsInExtendedForSharingFilter:2];
}

- (unint64_t)numberOfAssetsInExtendedShared
{
  return [(PGHighlightItemList *)self numberOfAssetsInExtendedForSharingFilter:1];
}

- (unint64_t)numberOfAssetsInExtendedPrivate
{
  return [(PGHighlightItemList *)self numberOfAssetsInExtendedForSharingFilter:0];
}

- (NSString)uuid
{
  v2 = [(PGHighlightItemList *)self parentHighlightItem];
  uint64_t v3 = [v2 uuid];

  return (NSString *)v3;
}

- (NSDateComponents)localDateComponents
{
  uint64_t v3 = [(PGHighlightItemList *)self startDate];
  unsigned __int16 v4 = [(PGHighlightItemList *)self endDate];
  [v4 timeIntervalSinceDate:v3];
  uint64_t v6 = [v3 dateByAddingTimeInterval:v5 * 0.5];
  unint64_t v7 = [(PGHighlightItemList *)self localStartDate];
  uint64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  if (v7)
  {
    [v3 timeIntervalSinceDate:v7];
    uint64_t v10 = (uint64_t)v9;
  }
  else
  {
    uint64_t v10 = 0;
  }
  long long v11 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:v10];
  long long v12 = [v8 componentsInTimeZone:v11 fromDate:v6];

  return (NSDateComponents *)v12;
}

- (unsigned)sharingComposition
{
  if (![(PGHighlightItemList *)self isCandidateForReuse]) {
    return self->_sharingComposition;
  }
  uint64_t v3 = [(PGHighlightItemList *)self parentHighlightItem];
  unsigned __int16 v4 = [v3 sharingComposition];

  return v4;
}

- (NSDate)localEndDate
{
  if ([(PGHighlightItemList *)self isCandidateForReuse])
  {
    uint64_t v3 = [(PGHighlightItemList *)self parentHighlightItem];
    unsigned __int16 v4 = [v3 localEndDate];
  }
  else
  {
    unsigned __int16 v4 = self->_localEndDate;
  }
  return v4;
}

- (NSDate)localStartDate
{
  if ([(PGHighlightItemList *)self isCandidateForReuse])
  {
    uint64_t v3 = [(PGHighlightItemList *)self parentHighlightItem];
    unsigned __int16 v4 = [v3 localStartDate];
  }
  else
  {
    unsigned __int16 v4 = self->_localStartDate;
  }
  return v4;
}

- (NSDate)endDate
{
  if ([(PGHighlightItemList *)self isCandidateForReuse])
  {
    uint64_t v3 = [(PGHighlightItemList *)self parentHighlightItem];
    unsigned __int16 v4 = [v3 endDate];
  }
  else
  {
    unsigned __int16 v4 = self->_endDate;
  }
  return v4;
}

- (NSDate)startDate
{
  if ([(PGHighlightItemList *)self isCandidateForReuse])
  {
    uint64_t v3 = [(PGHighlightItemList *)self parentHighlightItem];
    unsigned __int16 v4 = [v3 startDate];
  }
  else
  {
    unsigned __int16 v4 = self->_startDate;
  }
  return v4;
}

- (id)initAsNewList
{
  v10.receiver = self;
  v10.super_class = (Class)PGHighlightItemList;
  v2 = [(PGHighlightItemList *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
    internalHighlightItems = v2->_internalHighlightItems;
    v2->_internalHighlightItems = (NSMutableOrderedSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    internalAddedHighlightItems = v2->_internalAddedHighlightItems;
    v2->_internalAddedHighlightItems = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    internalRemovedHighlightItems = v2->_internalRemovedHighlightItems;
    v2->_internalRemovedHighlightItems = (NSMutableSet *)v7;
  }
  return v2;
}

- (PGHighlightItemList)initWithParentHighlightItem:(id)a3 childHighlightItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PGHighlightItemList;
  double v9 = [(PGHighlightItemList *)&v20 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentHighlightItem, a3);
    uint64_t v11 = [v7 modelObject];
    id modelObject = v10->_modelObject;
    v10->_id modelObject = (id)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v8];
    internalHighlightItems = v10->_internalHighlightItems;
    v10->_internalHighlightItems = (NSMutableOrderedSet *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    internalAddedHighlightItems = v10->_internalAddedHighlightItems;
    v10->_internalAddedHighlightItems = (NSMutableSet *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
    internalRemovedHighlightItems = v10->_internalRemovedHighlightItems;
    v10->_internalRemovedHighlightItems = (NSMutableSet *)v17;

    v10->_sharingComposition = [v7 sharingComposition];
    v10->_kind = [v7 kind];
    v10->_type = [v7 type];
    v10->_category = [v7 category];
    [(PGHighlightItemList *)v10 _updateHighlightItemsOrdering];
  }

  return v10;
}

+ (void)updateParentHighlightItemLists:(id)a3 withChildHighlightItems:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v14 = [v13 uuid];
        [v7 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v10);
  }
  v29 = v8;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v5;
  uint64_t v32 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        uint64_t v17 = [v16 internalAddedHighlightItems];
        [v17 removeAllObjects];

        uint64_t v18 = [v16 internalRemovedHighlightItems];
        [v18 removeAllObjects];

        v33 = v16;
        uint64_t v19 = [v16 internalHighlightItems];
        objc_super v20 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v19, "count"));
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v21 = v19;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v46 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v35;
          do
          {
            for (uint64_t k = 0; k != v23; ++k)
            {
              if (*(void *)v35 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v34 + 1) + 8 * k);
              uint64_t v27 = [v26 uuid];
              id v28 = [v7 objectForKeyedSubscript:v27];

              if (!v28) {
                id v28 = v26;
              }
              [v20 addObject:v28];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v46 count:16];
          }
          while (v23);
        }

        [v33 setInternalHighlightItems:v20];
        [v33 _updateHighlightItemsOrdering];
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v32);
  }
}

+ (id)timeSortDescriptors
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end