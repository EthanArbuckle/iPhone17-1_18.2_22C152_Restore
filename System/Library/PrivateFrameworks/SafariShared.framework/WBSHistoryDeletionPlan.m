@interface WBSHistoryDeletionPlan
- (BOOL)wasPrepared;
- (NSMapTable)allVisitsToDeleteByItemExcludingItemsBeingDeleted;
- (NSMapTable)updatedLastVisitsByItem;
- (NSSet)allItemsToDelete;
- (NSSet)allVisitsToDeleteExcludingVisitsFromItemsBeingDeleted;
- (NSSet)discoveredItemsToDelete;
- (NSSet)discoveredVisitsToDelete;
- (NSSet)triggeringItems;
- (NSSet)triggeringVisits;
- (WBSHistoryDeletionPlan)initWithSQLiteStore:(id)a3 discoveredItemsToDelete:(id)a4;
- (WBSHistoryDeletionPlan)initWithSQLiteStore:(id)a3 triggeringItems:(id)a4 excludingItems:(id)a5 visits:(id)a6 reason:(int64_t)a7;
- (WBSHistoryDeletionPlan)initWithSQLiteStore:(id)a3 triggeringVisits:(id)a4 excludingItems:(id)a5 visits:(id)a6;
- (WBSHistoryDeletionPlan)initWithSQLiteStore:(id)a3 triggeringVisits:(id)a4 updatedLastVisitsByItem:(id)a5;
@end

@implementation WBSHistoryDeletionPlan

- (WBSHistoryDeletionPlan)initWithSQLiteStore:(id)a3 triggeringItems:(id)a4 excludingItems:(id)a5 visits:(id)a6 reason:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v31.receiver = self;
  v31.super_class = (Class)WBSHistoryDeletionPlan;
  v17 = [(WBSHistoryDeletionPlan *)&v31 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_store, a3);
    uint64_t v19 = [v14 copy];
    triggeringItems = v18->_triggeringItems;
    v18->_triggeringItems = (NSSet *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CAD0] set];
    triggeringVisits = v18->_triggeringVisits;
    v18->_triggeringVisits = (NSSet *)v21;

    uint64_t v23 = [v15 copy];
    excludedItems = v18->_excludedItems;
    v18->_excludedItems = (NSSet *)v23;

    uint64_t v25 = [v16 copy];
    excludedVisits = v18->_excludedVisits;
    v18->_excludedVisits = (NSSet *)v25;

    if (a7 == 1)
    {
      uint64_t v27 = [v14 mutableCopy];
    }
    else
    {
      uint64_t v27 = [MEMORY[0x1E4F1CA80] set];
    }
    discoveredItemsToDelete = v18->_discoveredItemsToDelete;
    v18->_discoveredItemsToDelete = (NSMutableSet *)v27;

    v29 = v18;
  }

  return v18;
}

- (WBSHistoryDeletionPlan)initWithSQLiteStore:(id)a3 triggeringVisits:(id)a4 excludingItems:(id)a5 visits:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)WBSHistoryDeletionPlan;
  id v15 = [(WBSHistoryDeletionPlan *)&v29 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_store, a3);
    uint64_t v17 = [MEMORY[0x1E4F1CAD0] set];
    triggeringItems = v16->_triggeringItems;
    v16->_triggeringItems = (NSSet *)v17;

    uint64_t v19 = [v12 copy];
    triggeringVisits = v16->_triggeringVisits;
    v16->_triggeringVisits = (NSSet *)v19;

    uint64_t v21 = [v13 copy];
    excludedItems = v16->_excludedItems;
    v16->_excludedItems = (NSSet *)v21;

    uint64_t v23 = [v14 copy];
    excludedVisits = v16->_excludedVisits;
    v16->_excludedVisits = (NSSet *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CA80] set];
    discoveredItemsToDelete = v16->_discoveredItemsToDelete;
    v16->_discoveredItemsToDelete = (NSMutableSet *)v25;

    uint64_t v27 = v16;
  }

  return v16;
}

- (WBSHistoryDeletionPlan)initWithSQLiteStore:(id)a3 discoveredItemsToDelete:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSHistoryDeletionPlan;
  v9 = [(WBSHistoryDeletionPlan *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
    triggeringItems = v10->_triggeringItems;
    v10->_triggeringItems = (NSSet *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CAD0] set];
    triggeringVisits = v10->_triggeringVisits;
    v10->_triggeringVisits = (NSSet *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CAD0] set];
    excludedItems = v10->_excludedItems;
    v10->_excludedItems = (NSSet *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CAD0] set];
    excludedVisits = v10->_excludedVisits;
    v10->_excludedVisits = (NSSet *)v17;

    uint64_t v19 = [v8 mutableCopy];
    discoveredItemsToDelete = v10->_discoveredItemsToDelete;
    v10->_discoveredItemsToDelete = (NSMutableSet *)v19;

    v10->_wasPrepared = 1;
    uint64_t v21 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    updatedLastVisitsByItem = v10->_updatedLastVisitsByItem;
    v10->_updatedLastVisitsByItem = (NSMapTable *)v21;

    uint64_t v23 = v10;
  }

  return v10;
}

- (WBSHistoryDeletionPlan)initWithSQLiteStore:(id)a3 triggeringVisits:(id)a4 updatedLastVisitsByItem:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)WBSHistoryDeletionPlan;
  id v12 = [(WBSHistoryDeletionPlan *)&v28 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    uint64_t v14 = [MEMORY[0x1E4F1CAD0] set];
    triggeringItems = v13->_triggeringItems;
    v13->_triggeringItems = (NSSet *)v14;

    uint64_t v16 = [v10 copy];
    triggeringVisits = v13->_triggeringVisits;
    v13->_triggeringVisits = (NSSet *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CAD0] set];
    excludedItems = v13->_excludedItems;
    v13->_excludedItems = (NSSet *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CAD0] set];
    excludedVisits = v13->_excludedVisits;
    v13->_excludedVisits = (NSSet *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
    discoveredItemsToDelete = v13->_discoveredItemsToDelete;
    v13->_discoveredItemsToDelete = (NSMutableSet *)v22;

    v13->_wasPrepared = 1;
    uint64_t v24 = [v11 copy];
    updatedLastVisitsByItem = v13->_updatedLastVisitsByItem;
    v13->_updatedLastVisitsByItem = (NSMapTable *)v24;

    v26 = v13;
  }

  return v13;
}

- (NSSet)allItemsToDelete
{
  v3 = (void *)[(NSSet *)self->_triggeringItems mutableCopy];
  [v3 unionSet:self->_discoveredItemsToDelete];
  [v3 minusSet:self->_excludedItems];
  return (NSSet *)v3;
}

- (NSSet)allVisitsToDeleteExcludingVisitsFromItemsBeingDeleted
{
  v3 = [(NSSet *)self->_triggeringVisits setByAddingObjectsFromSet:self->_discoveredVisitsToDelete];
  v4 = (void *)[v3 mutableCopy];

  [v4 minusSet:self->_excludedVisits];
  v5 = (void *)MEMORY[0x1E4F28F60];
  v6 = [(WBSHistoryDeletionPlan *)self allItemsToDelete];
  id v7 = [v5 predicateWithFormat:@"NOT (item IN %@)", v6];
  id v8 = [v4 filteredSetUsingPredicate:v7];

  return (NSSet *)v8;
}

- (NSMapTable)allVisitsToDeleteByItemExcludingItemsBeingDeleted
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [(WBSHistoryDeletionPlan *)self allVisitsToDeleteExcludingVisitsFromItemsBeingDeleted];
  v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "item", (void)v14);
        if (v9)
        {
          id v10 = [v3 objectForKey:v9];
          id v11 = v10;
          if (v10)
          {
            [v10 addObject:v8];
          }
          else
          {
            id v12 = [MEMORY[0x1E4F1CA48] arrayWithObject:v8];
            [v3 setObject:v12 forKey:v9];
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return (NSMapTable *)v3;
}

- (NSSet)triggeringItems
{
  return self->_triggeringItems;
}

- (NSSet)triggeringVisits
{
  return self->_triggeringVisits;
}

- (NSSet)discoveredItemsToDelete
{
  return &self->_discoveredItemsToDelete->super;
}

- (NSSet)discoveredVisitsToDelete
{
  return self->_discoveredVisitsToDelete;
}

- (NSMapTable)updatedLastVisitsByItem
{
  return self->_updatedLastVisitsByItem;
}

- (BOOL)wasPrepared
{
  return self->_wasPrepared;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedLastVisitsByItem, 0);
  objc_storeStrong((id *)&self->_discoveredVisitsToDelete, 0);
  objc_storeStrong((id *)&self->_triggeringVisits, 0);
  objc_storeStrong((id *)&self->_triggeringItems, 0);
  objc_storeStrong((id *)&self->_discoveredItemsToDelete, 0);
  objc_storeStrong((id *)&self->_excludedVisits, 0);
  objc_storeStrong((id *)&self->_excludedItems, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end