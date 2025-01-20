@interface NMSMediaItemGroupIterator
- (BOOL)isCurrentIdentifierEstimate;
- (NMSMediaItemGroupIterator)initWithItemGroups:(id)a3 estimatedItemSize:(unint64_t)a4;
- (NMSQuotaEvaluationState)evaluationState;
- (NSArray)itemGroups;
- (NSMutableArray)indexesToBeRemoved;
- (NSMutableArray)remainingContainers;
- (NSMutableArray)remainingItemLists;
- (NSMutableOrderedSet)mutableItemListWithinQuota;
- (id)currentItem;
- (id)downloadInfoWithinQuota;
- (id)identifiersForContainersOfType:(unint64_t)a3;
- (id)mediaContainersAboveQuota;
- (unint64_t)currentContainerIndex;
- (unint64_t)currentItemIndex;
- (unint64_t)estimatedItemSize;
- (unint64_t)iteratingOrder;
- (unint64_t)nominatedItemSize;
- (unint64_t)sizeForCurrentIdentifier;
- (unint64_t)sizeForItemListWithinQuota;
- (void)_generateItemListAndSizesDictIfNecessary;
- (void)_markToBeRemoved;
- (void)addCurrentIdentifierToWithinQuotaListAndCountSizeTowardsQuota:(BOOL)a3;
- (void)removeCurrentIdentifier;
- (void)resetToIterateOverQuotaIdentifiers;
- (void)setCurrentContainerIndex:(unint64_t)a3;
- (void)setCurrentItemIndex:(unint64_t)a3;
- (void)setIndexesToBeRemoved:(id)a3;
- (void)setItemGroups:(id)a3;
- (void)setMutableItemListWithinQuota:(id)a3;
- (void)setNominatedItemSize:(unint64_t)a3;
- (void)setRemainingContainers:(id)a3;
- (void)setRemainingItemLists:(id)a3;
- (void)setSizeForItemListWithinQuota:(unint64_t)a3;
- (void)skipCurrentIdentifier;
@end

@implementation NMSMediaItemGroupIterator

- (NMSQuotaEvaluationState)evaluationState
{
  v3 = objc_alloc_init(NMSQuotaEvaluationState_Legacy);
  v4 = [(NMSMediaItemGroupIterator *)self currentItem];
  v5 = [v4 mediaLibraryIdentifier];
  [(NMSQuotaEvaluationState_Legacy *)v3 setMediaLibraryIdentifier:v5];

  v6 = [(NMSMediaItemGroupIterator *)self currentItem];
  v7 = [v6 externalLibraryIdentifier];
  [(NMSQuotaEvaluationState_Legacy *)v3 setExternalLibraryIdentifier:v7];

  [(NMSQuotaEvaluationState_Legacy *)v3 setContainerIndex:[(NMSMediaItemGroupIterator *)self currentContainerIndex]];
  [(NMSQuotaEvaluationState_Legacy *)v3 setItemIndex:[(NMSMediaItemGroupIterator *)self currentItemIndex]];
  [(NMSQuotaEvaluationState_Legacy *)v3 setItemSize:[(NMSMediaItemGroupIterator *)self sizeForCurrentIdentifier]];
  [(NMSQuotaEvaluationState_Legacy *)v3 setListTotalSize:[(NMSMediaItemGroupIterator *)self sizeForItemListWithinQuota]];

  return (NMSQuotaEvaluationState *)v3;
}

- (NMSMediaItemGroupIterator)initWithItemGroups:(id)a3 estimatedItemSize:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NMSMediaItemGroupIterator;
  v7 = [(NMSMediaItemGroupIterator *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    itemGroups = v7->_itemGroups;
    v7->_itemGroups = (NSArray *)v8;

    v7->_estimatedItemSize = a4;
  }

  return v7;
}

- (NSMutableArray)remainingContainers
{
  remainingContainers = self->_remainingContainers;
  if (!remainingContainers)
  {
    v4 = (NSMutableArray *)[(NSArray *)self->_itemGroups mutableCopy];
    v5 = self->_remainingContainers;
    self->_remainingContainers = v4;

    remainingContainers = self->_remainingContainers;
  }

  return remainingContainers;
}

- (NSMutableOrderedSet)mutableItemListWithinQuota
{
  mutableItemListWithinQuota = self->_mutableItemListWithinQuota;
  if (!mutableItemListWithinQuota)
  {
    v4 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    v5 = self->_mutableItemListWithinQuota;
    self->_mutableItemListWithinQuota = v4;

    mutableItemListWithinQuota = self->_mutableItemListWithinQuota;
  }

  return mutableItemListWithinQuota;
}

- (id)downloadInfoWithinQuota
{
  v3 = [NMSMediaDownloadInfo alloc];
  v4 = [(NMSMediaItemGroupIterator *)self mutableItemListWithinQuota];
  v5 = [(NMSMediaDownloadInfo *)v3 initWithItems:v4];

  return v5;
}

- (void)_generateItemListAndSizesDictIfNecessary
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v3 = [(NMSMediaItemGroupIterator *)self remainingItemLists];

  if (!v3)
  {
    v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_itemGroups, "count"));
    [(NMSMediaItemGroupIterator *)self setRemainingItemLists:v4];

    v5 = [NMLogActionsCoalescer alloc];
    uint64_t v6 = objc_opt_class();
    v7 = NMLogForCategory(6);
    uint64_t v8 = [(NMLogActionsCoalescer *)v5 initWithIdentifier:v6 logCategory:v7];

    v9 = [@"[MediaQuota]" stringByAppendingString:@" Building item list"];
    v28 = v8;
    [(NMLogActionsCoalescer *)v8 setPrefix:v9];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    obuint64_t j = self->_itemGroups;
    uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v29)
    {
      uint64_t v10 = 0;
      uint64_t v27 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v13 = [v12 itemList];
          if ([v13 count])
          {
            v14 = [(NMSMediaItemGroupIterator *)self remainingItemLists];
            v15 = [MEMORY[0x263EFF980] arrayWithArray:v13];
            [v14 addObject:v15];

            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            id v16 = v13;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v31;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v31 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  v21 = *(void **)(*((void *)&v30 + 1) + 8 * j);
                  if (([v21 isManuallyAdded] & 1) == 0) {
                    self->_nominatedItemSize += [v21 size];
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
              }
              while (v18);
            }

            v22 = NSString;
            v23 = [v12 itemList];
            v24 = [v22 stringWithFormat:@"CTNR:%3d %@ generated item list which has %lu items.", v10, v12, objc_msgSend(v23, "count")];

            uint64_t v10 = (v10 + 1);
          }
          else
          {
            v24 = [NSString stringWithFormat:@"Skipped %@ because it's empty.", v12];
          }
          v25 = +[NMGenericMessageLogAction logActionWithMessage:v24];
          [(NMLogActionsCoalescer *)v28 addLogAction:v25];
        }
        uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v29);
    }

    [(NMLogActionsCoalescer *)v28 flush];
  }
}

- (unint64_t)iteratingOrder
{
  return 0;
}

- (id)currentItem
{
  [(NMSMediaItemGroupIterator *)self _generateItemListAndSizesDictIfNecessary];
  unint64_t v3 = [(NMSMediaItemGroupIterator *)self currentContainerIndex];
  v4 = [(NMSMediaItemGroupIterator *)self remainingItemLists];
  if (v3 >= [v4 count])
  {
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  unint64_t v5 = [(NMSMediaItemGroupIterator *)self currentItemIndex];
  uint64_t v6 = [(NMSMediaItemGroupIterator *)self remainingItemLists];
  v7 = objc_msgSend(v6, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
  unint64_t v8 = [v7 count];

  if (v5 < v8)
  {
    v4 = [(NMSMediaItemGroupIterator *)self remainingItemLists];
    v9 = objc_msgSend(v4, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
    uint64_t v10 = objc_msgSend(v9, "objectAtIndex:", -[NMSMediaItemGroupIterator currentItemIndex](self, "currentItemIndex"));

LABEL_5:
    goto LABEL_7;
  }
  uint64_t v10 = 0;
LABEL_7:

  return v10;
}

- (void)skipCurrentIdentifier
{
  [(NMSMediaItemGroupIterator *)self _generateItemListAndSizesDictIfNecessary];
  unint64_t v3 = [(NMSMediaItemGroupIterator *)self currentItem];

  if (v3)
  {
    v4 = [(NMSMediaItemGroupIterator *)self remainingContainers];
    unint64_t v5 = objc_msgSend(v4, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
    uint64_t v6 = [v5 quotaData];
    [v6 setHasSkippedItems:1];

    [(NMSMediaItemGroupIterator *)self _continueToNextIdentifier];
  }
}

- (void)removeCurrentIdentifier
{
  [(NMSMediaItemGroupIterator *)self _generateItemListAndSizesDictIfNecessary];
  unint64_t v3 = [(NMSMediaItemGroupIterator *)self currentItem];

  if (v3)
  {
    [(NMSMediaItemGroupIterator *)self _markToBeRemoved];
    v4 = [(NMSMediaItemGroupIterator *)self remainingContainers];
    unint64_t v5 = objc_msgSend(v4, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
    uint64_t v6 = [v5 quotaData];
    [v6 setHasRemovedItems:1];

    [(NMSMediaItemGroupIterator *)self _continueToNextIdentifier];
  }
}

- (void)addCurrentIdentifierToWithinQuotaListAndCountSizeTowardsQuota:(BOOL)a3
{
  BOOL v3 = a3;
  [(NMSMediaItemGroupIterator *)self _generateItemListAndSizesDictIfNecessary];
  unint64_t v5 = [(NMSMediaItemGroupIterator *)self currentItem];
  if (v5)
  {
    id v12 = v5;
    uint64_t v6 = [(NMSMediaItemGroupIterator *)self mutableItemListWithinQuota];
    char v7 = [v6 containsObject:v12];

    if ((v7 & 1) == 0)
    {
      unint64_t v8 = [(NMSMediaItemGroupIterator *)self mutableItemListWithinQuota];
      [v8 addObject:v12];

      if (v3) {
        self->_sizeForItemListWithinQuota += [v12 size];
      }
    }
    v9 = [(NMSMediaItemGroupIterator *)self remainingContainers];
    uint64_t v10 = objc_msgSend(v9, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
    objc_super v11 = [v10 quotaData];
    objc_msgSend(v11, "setNumItemsAdded:", objc_msgSend(v11, "numItemsAdded") + 1);

    [(NMSMediaItemGroupIterator *)self _markToBeRemoved];
    [(NMSMediaItemGroupIterator *)self _continueToNextIdentifier];
    unint64_t v5 = v12;
  }
}

- (void)resetToIterateOverQuotaIdentifiers
{
  [(NMSMediaItemGroupIterator *)self _generateItemListAndSizesDictIfNecessary];
  BOOL v3 = [(NMSMediaItemGroupIterator *)self remainingItemLists];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [(NMSMediaItemGroupIterator *)self remainingItemLists];
      char v7 = [v6 objectAtIndex:v5];

      unint64_t v8 = [(NMSMediaItemGroupIterator *)self indexesToBeRemoved];
      v9 = [v8 objectAtIndex:v5];
      [v7 removeObjectsAtIndexes:v9];

      if ([v7 count])
      {
        uint64_t v10 = [(NMSMediaItemGroupIterator *)self remainingContainers];
        objc_super v11 = [v10 objectAtIndex:v5];
        id v12 = [v11 quotaData];
        [v12 setHasSkippedItems:0];

        ++v5;
      }
      else
      {
        v13 = [(NMSMediaItemGroupIterator *)self remainingItemLists];
        [v13 removeObjectAtIndex:v5];

        v14 = [(NMSMediaItemGroupIterator *)self remainingContainers];
        [v14 removeObjectAtIndex:v5];

        v15 = [(NMSMediaItemGroupIterator *)self indexesToBeRemoved];
        [v15 removeObjectAtIndex:v5];
      }
      id v16 = [(NMSMediaItemGroupIterator *)self remainingItemLists];
      unint64_t v17 = [v16 count];
    }
    while (v5 < v17);
  }
  [(NMSMediaItemGroupIterator *)self setCurrentContainerIndex:0];
  [(NMSMediaItemGroupIterator *)self setCurrentItemIndex:0];
  indexesToBeRemoved = self->_indexesToBeRemoved;
  self->_indexesToBeRemoved = 0;
}

- (unint64_t)sizeForCurrentIdentifier
{
  [(NMSMediaItemGroupIterator *)self _generateItemListAndSizesDictIfNecessary];
  BOOL v3 = [(NMSMediaItemGroupIterator *)self currentItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [v3 minimumSize];
  }
  else {
    uint64_t v4 = [v3 size];
  }
  unint64_t v5 = v4;

  return v5;
}

- (BOOL)isCurrentIdentifierEstimate
{
  [(NMSMediaItemGroupIterator *)self _generateItemListAndSizesDictIfNecessary];
  BOOL v3 = [(NMSMediaItemGroupIterator *)self remainingContainers];
  uint64_t v4 = [v3 objectAtIndex:self->_currentContainerIndex];
  char v5 = [v4 isEstimate];

  return v5;
}

- (id)identifiersForContainersOfType:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(NMSMediaItemGroupIterator *)self itemGroups];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) identifiersForContainerType:a3];
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = (void *)[v5 copy];

  return v12;
}

- (id)mediaContainersAboveQuota
{
  v2 = [(NMSMediaItemGroupIterator *)self itemGroups];
  BOOL v3 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_3];
  uint64_t v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

uint64_t __54__NMSMediaItemGroupIterator_mediaContainersAboveQuota__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 quotaData];
  uint64_t v3 = [v2 hasItemsAboveQuota];

  return v3;
}

- (NSMutableArray)indexesToBeRemoved
{
  if (!self->_indexesToBeRemoved)
  {
    uint64_t v3 = (void *)MEMORY[0x263EFF980];
    uint64_t v4 = [(NMSMediaItemGroupIterator *)self remainingContainers];
    objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
    char v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    indexesToBeRemoved = self->_indexesToBeRemoved;
    self->_indexesToBeRemoved = v5;

    uint64_t v7 = [(NMSMediaItemGroupIterator *)self remainingContainers];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t v10 = self->_indexesToBeRemoved;
        objc_super v11 = [MEMORY[0x263F089C8] indexSet];
        [(NSMutableArray *)v10 addObject:v11];

        ++v9;
        id v12 = [(NMSMediaItemGroupIterator *)self remainingContainers];
        unint64_t v13 = [v12 count];
      }
      while (v9 < v13);
    }
  }
  long long v14 = self->_indexesToBeRemoved;

  return v14;
}

- (void)_markToBeRemoved
{
  id v4 = [(NMSMediaItemGroupIterator *)self indexesToBeRemoved];
  uint64_t v3 = objc_msgSend(v4, "objectAtIndex:", -[NMSMediaItemGroupIterator currentContainerIndex](self, "currentContainerIndex"));
  objc_msgSend(v3, "addIndex:", -[NMSMediaItemGroupIterator currentItemIndex](self, "currentItemIndex"));
}

- (unint64_t)estimatedItemSize
{
  return self->_estimatedItemSize;
}

- (unint64_t)sizeForItemListWithinQuota
{
  return self->_sizeForItemListWithinQuota;
}

- (void)setSizeForItemListWithinQuota:(unint64_t)a3
{
  self->_sizeForItemListWithinQuota = a3;
}

- (unint64_t)nominatedItemSize
{
  return self->_nominatedItemSize;
}

- (void)setNominatedItemSize:(unint64_t)a3
{
  self->_nominatedItemSize = a3;
}

- (NSArray)itemGroups
{
  return self->_itemGroups;
}

- (void)setItemGroups:(id)a3
{
}

- (void)setRemainingContainers:(id)a3
{
}

- (NSMutableArray)remainingItemLists
{
  return self->_remainingItemLists;
}

- (void)setRemainingItemLists:(id)a3
{
}

- (unint64_t)currentContainerIndex
{
  return self->_currentContainerIndex;
}

- (void)setCurrentContainerIndex:(unint64_t)a3
{
  self->_currentContainerIndex = a3;
}

- (unint64_t)currentItemIndex
{
  return self->_currentItemIndex;
}

- (void)setCurrentItemIndex:(unint64_t)a3
{
  self->_currentItemIndex = a3;
}

- (void)setMutableItemListWithinQuota:(id)a3
{
}

- (void)setIndexesToBeRemoved:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesToBeRemoved, 0);
  objc_storeStrong((id *)&self->_mutableItemListWithinQuota, 0);
  objc_storeStrong((id *)&self->_remainingItemLists, 0);
  objc_storeStrong((id *)&self->_remainingContainers, 0);

  objc_storeStrong((id *)&self->_itemGroups, 0);
}

@end