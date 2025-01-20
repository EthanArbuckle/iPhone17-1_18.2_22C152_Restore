@interface ML3ContainerQueryResultSet
- (BOOL)_updateToLibraryCurrentRevision;
- (ML3ContainerQueryResultSet)initWithQuery:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sortedBackingStoreForDisplayOrdering;
- (int64_t)persistentIDAtIndex:(unint64_t)a3;
- (unint64_t)entityLimit;
- (void)_loadCurrentFullResults;
- (void)enumeratePersistentIDsUsingBlock:(id)a3;
- (void)enumerateSectionsUsingBlock:(id)a3;
@end

@implementation ML3ContainerQueryResultSet

- (void).cxx_destruct
{
}

- (BOOL)_updateToLibraryCurrentRevision
{
  v3 = self->super._query;
  v4 = [(ML3Query *)v3 library];
  if ([(ML3Query *)v3 filtersOnDynamicProperties]) {
    uint64_t v5 = [v4 currentRevision];
  }
  else {
    uint64_t v5 = [v4 currentContentRevision];
  }
  int64_t revision = self->super._revision;
  if (self->super._backingStore && revision == v5)
  {
    BOOL v7 = 0;
  }
  else if (revision {
         && revision + 100 >= v5
  }
         && revision <= v5
         && !objc_msgSend(v4, "persistentID:changedAfterRevision:revisionTrackingCode:", self->_containerPID, revision, +[ML3Container revisionTrackingCode](ML3Container, "revisionTrackingCode")))
  {
    v9.receiver = self;
    v9.super_class = (Class)ML3ContainerQueryResultSet;
    BOOL v7 = [(ML3QueryResultSet *)&v9 _updateToLibraryCurrentRevision];
  }
  else
  {
    [(ML3ContainerQueryResultSet *)self _loadCurrentFullResults];
    ++self->super._localRevision;
    BOOL v7 = 1;
  }

  return v7;
}

- (unint64_t)entityLimit
{
  return self->_entityLimit;
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  id v4 = a3;
  fixedPriorityQueue = self->super._fixedPriorityQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ML3ContainerQueryResultSet_enumerateSectionsUsingBlock___block_invoke;
  v7[3] = &unk_1E5FB6E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(fixedPriorityQueue, v7);
}

void __58__ML3ContainerQueryResultSet_enumerateSectionsUsingBlock___block_invoke(uint64_t a1)
{
  id v13 = *(id *)(*(void *)(a1 + 32) + 16);
  v2 = [v13 container];
  v3 = [v13 container];
  id v4 = [v3 valueForProperty:@"is_reversed"];
  int v5 = [v4 BOOLValue];

  if ([v13 requiresSmartLimiting]
    && ([v2 displayOrderingTerms],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v2 limitOrderingTerms],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 isEqualToArray:v7],
        v7,
        v6,
        v8))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    v10 = *(void **)(*(void *)(a1 + 32) + 8);
    if (v5)
    {
      [v10 reverseEnumerateSectionsUsingBlock:v9];
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v11 + 72))
    {
      v12 = [(id)v11 sortedBackingStoreForDisplayOrdering];
      [v12 enumerateSectionsUsingBlock:*(void *)(a1 + 40)];

      goto LABEL_9;
    }
    v10 = *(void **)(v11 + 8);
    uint64_t v9 = *(void *)(a1 + 40);
  }
  [v10 enumerateSectionsUsingBlock:v9];
LABEL_9:
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  id v4 = a3;
  fixedPriorityQueue = self->super._fixedPriorityQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__ML3ContainerQueryResultSet_enumeratePersistentIDsUsingBlock___block_invoke;
  v7[3] = &unk_1E5FB6E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(fixedPriorityQueue, v7);
}

void __63__ML3ContainerQueryResultSet_enumeratePersistentIDsUsingBlock___block_invoke(uint64_t a1)
{
  id v11 = *(id *)(*(void *)(a1 + 32) + 16);
  v2 = [v11 container];
  if ([v11 requiresSmartLimiting]
    && ([v2 displayOrderingTerms],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v2 limitOrderingTerms],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v3 isEqualToArray:v4],
        v4,
        v3,
        v5))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v8 = *(void **)(v7 + 8);
    if (*(unsigned char *)(v7 + 73))
    {
      [v8 reverseEnumeratePersistentIDsUsingBlock:v6];
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v9 + 72))
    {
      v10 = [(id)v9 sortedBackingStoreForDisplayOrdering];
      [v10 enumeratePersistentIDsUsingBlock:*(void *)(a1 + 40)];

      goto LABEL_9;
    }
    id v8 = *(void **)(v9 + 8);
    uint64_t v6 = *(void *)(a1 + 40);
  }
  [v8 enumeratePersistentIDsUsingBlock:v6];
LABEL_9:
}

- (int64_t)persistentIDAtIndex:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  fixedPriorityQueue = self->super._fixedPriorityQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ML3ContainerQueryResultSet_persistentIDAtIndex___block_invoke;
  block[3] = &unk_1E5FB7B10;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(fixedPriorityQueue, block);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __50__ML3ContainerQueryResultSet_persistentIDAtIndex___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 72))
  {
    id v5 = [(id)v2 sortedBackingStoreForDisplayOrdering];
    *(void *)(*(void *)(a1[5] + 8) + 24) = [v5 persistentIDAtIndex:a1[6]];
  }
  else
  {
    if (*(unsigned char *)(v2 + 73))
    {
      id v3 = (id)objc_msgSend(*(id *)(v2 + 8), "persistentIDAtIndex:", objc_msgSend(*(id *)(v2 + 8), "count") + ~a1[6]);
    }
    else
    {
      uint64_t v4 = a1[6];
      v6.receiver = (id)v2;
      v6.super_class = (Class)ML3ContainerQueryResultSet;
      id v3 = objc_msgSendSuper2(&v6, sel_persistentIDAtIndex_, v4);
    }
    *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  }
}

- (id)sortedBackingStoreForDisplayOrdering
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  p_backingStore = &self->super._backingStore;
  if ([(ML3QueryResultSet_BackingStore *)self->super._backingStore count])
  {
    p_sortedBackingStore = &self->_sortedBackingStore;
    sortedBackingStore = self->_sortedBackingStore;
    if (sortedBackingStore) {
      goto LABEL_18;
    }
    objc_super v6 = [(ML3Query *)self->super._query container];
    uint64_t v7 = [v6 displayOrderingTerms];

    id v8 = objc_alloc_init(ML3QueryResultSet_MutableBackingStore);
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[ML3QueryResultSet_BackingStore count](*p_backingStore, "count"));
    uint64_t v10 = *p_backingStore;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __66__ML3ContainerQueryResultSet_sortedBackingStoreForDisplayOrdering__block_invoke;
    v31[3] = &unk_1E5FB7EE0;
    id v11 = v9;
    id v32 = v11;
    [(ML3QueryResultSet_BackingStore *)v10 enumeratePersistentIDsUsingBlock:v31];
    v12 = [(ML3Query *)self->super._query library];
    id v13 = +[ML3ContainmentPredicate predicateWithProperty:@"ROWID" values:v11];
    v14 = +[ML3Entity queryWithLibrary:v12 predicate:v13 orderingTerms:v7 usingSections:[(ML3Query *)self->super._query usingSections] options:[(ML3Query *)self->super._query options]];

    v15 = [(ML3Query *)self->super._query sectionProperty];
    if (v15)
    {
      v16 = v30;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __66__ML3ContainerQueryResultSet_sortedBackingStoreForDisplayOrdering__block_invoke_2;
      v30[3] = &unk_1E5FB6110;
      v30[4] = v8;
      v30[5] = v11;
      [v14 enumeratePersistentIDsAndSectionsWithProperty:v15 usingBlock:v30];
    }
    else
    {
      v16 = v29;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __66__ML3ContainerQueryResultSet_sortedBackingStoreForDisplayOrdering__block_invoke_3;
      v29[3] = &unk_1E5FB6138;
      v29[4] = v8;
      v29[5] = v11;
      [v14 enumeratePersistentIDsUsingBlock:v29];
    }

    unint64_t v17 = [(ML3QueryResultSet_BackingStore *)v8 count];
    if (v17 < [(ML3QueryResultSet_BackingStore *)*p_backingStore count])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v18 = v11;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v18);
            }
            FastAppendPersistentID(v8, [*(id *)(*((void *)&v25 + 1) + 8 * i) longLongValue], 0);
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v19);
      }
    }
    v22 = *p_sortedBackingStore;
    *p_sortedBackingStore = &v8->super;
    v23 = v8;
  }
  else
  {
    p_sortedBackingStore = p_backingStore;
  }
  sortedBackingStore = *p_sortedBackingStore;
LABEL_18:

  return sortedBackingStore;
}

void __66__ML3ContainerQueryResultSet_sortedBackingStoreForDisplayOrdering__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  objc_msgSend(v2, "addObject:");
}

void __66__ML3ContainerQueryResultSet_sortedBackingStoreForDisplayOrdering__block_invoke_2(uint64_t a1, int64_t a2, char a3)
{
  FastAppendPersistentID(*(ML3QueryResultSet_MutableBackingStore **)(a1 + 32), a2, a3);
  id v5 = *(void **)(a1 + 40);
  id v6 = [NSNumber numberWithLongLong:a2];
  objc_msgSend(v5, "removeObject:");
}

void __66__ML3ContainerQueryResultSet_sortedBackingStoreForDisplayOrdering__block_invoke_3(uint64_t a1, int64_t a2)
{
  FastAppendPersistentID(*(ML3QueryResultSet_MutableBackingStore **)(a1 + 32), a2, 0);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = [NSNumber numberWithLongLong:a2];
  objc_msgSend(v4, "removeObject:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ML3ContainerQueryResultSet;
  id v4 = [(ML3QueryResultSet *)&v6 copyWithZone:a3];
  *((unsigned char *)v4 + 72) = self->_needsSorting;
  *((unsigned char *)v4 + 73) = self->_needsReversing;
  objc_storeStrong((id *)v4 + 10, self->_sortedBackingStore);
  *((void *)v4 + 11) = self->_containerPID;
  *((void *)v4 + 12) = self->_entityLimit;
  return v4;
}

- (void)_loadCurrentFullResults
{
  id v3 = self->super._query;
  id v4 = [(ML3Query *)v3 container];
  if (![(ML3Query *)v3 requiresSmartLimiting])
  {
    self->_needsSorting = 0;
LABEL_6:
    self->_needsReversing = 0;
    goto LABEL_7;
  }
  id v5 = [v4 displayOrderingTerms];
  objc_super v6 = [v4 limitOrderingTerms];
  self->_needsSorting = [v5 isEqualToArray:v6] ^ 1;

  if (!self->_needsSorting || ![(ML3Query *)v3 requiresSmartLimiting]) {
    goto LABEL_6;
  }
  uint64_t v7 = [v4 valueForProperty:@"is_reversed"];
  self->_needsReversing = [v7 BOOLValue];

LABEL_7:
  sortedBackingStore = self->_sortedBackingStore;
  self->_sortedBackingStore = 0;

  v9.receiver = self;
  v9.super_class = (Class)ML3ContainerQueryResultSet;
  [(ML3QueryResultSet *)&v9 _loadCurrentFullResults];
}

- (ML3ContainerQueryResultSet)initWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [v4 container];
  objc_super v6 = [v5 valueForProperty:@"smart_is_limited"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    id v8 = [v5 valueForProperty:@"smart_limit_kind"];
    BOOL v9 = [v8 intValue] == 2;
  }
  else
  {
    BOOL v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)ML3ContainerQueryResultSet;
  uint64_t v10 = [(ML3QueryResultSet *)&v13 _initWithQuery:v4 supportsIncrementalUpdate:v9 | v7 ^ 1u];
  if (v10)
  {
    v10->_containerPID = [v5 persistentID];
    if (v9)
    {
      id v11 = [v5 valueForProperty:@"smart_limit_value"];
      v10->_entityLimit = [v11 unsignedIntegerValue];
    }
    else
    {
      v10->_entityLimit = -1;
    }
  }

  return v10;
}

@end