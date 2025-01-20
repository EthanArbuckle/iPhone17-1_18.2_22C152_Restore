@interface _UIDataSourceUpdateMap
+ (id)mapForInitialSnapshot:(id)a3 finalSnapshot:(id)a4 batchUpdateItems:(id)a5;
+ (id)mapForInitialSnapshot:(id)a3 orderedUpdateItems:(id)a4;
+ (id)validatedMapForInitialSnapshot:(id)a3 finalSnapshot:(id)a4 batchUpdateItems:(id)a5;
- (BOOL)_isSectionOnlyIndexPath:(id)a3;
- (BOOL)_mapIsSimpleInsertMoveSequence;
- (BOOL)isBatchUpdateMap;
- (NSArray)originalUpdateItems;
- (NSArray)reverseUpdateItems;
- (NSArray)updateItems;
- (_UIDataSourceBatchUpdateMapHelper)batchUpdateMapHelper;
- (_UIDataSourceSnapshotter)finalSnapshot;
- (_UIDataSourceSnapshotter)initialSnapshot;
- (_UIDataSourceUpdateMap)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 updateItems:(id)a5 assertForInvalidUpdates:(BOOL)a6;
- (id)_findUpdateForIdentifier:(id)a3;
- (id)_mapUpdateForCollectionUpdateItem:(id)a3 snapshot:(id)a4;
- (id)_newGlobalItemMapDescription;
- (id)_newSectionMapDescription;
- (id)_oldGlobalItemMapDescription;
- (id)_oldSectionMapDescription;
- (id)_rebasedUpdatesForUpdate:(id)a3;
- (id)_sectionIndexPathForSection:(int64_t)a3;
- (id)_transformIndexPath:(id)a3 applyingUpdateItem:(id)a4 withSnapshot:(id)a5;
- (id)_updateMapByRevertingAllUpdatesExceptUpdateWithIdentifier:(id)a3;
- (id)description;
- (id)finalIndexPathForIndexPath:(id)a3 startingAtUpdateWithIdentifier:(id)a4;
- (id)finalIndexPathForInitialIndexPath:(id)a3;
- (id)finalUpdateForInitialUpdate:(id)a3;
- (id)initialIndexPathForFinalIndexPath:(id)a3;
- (id)initialIndexPathForIndexPath:(id)a3 beforeUpdateWithIdentifier:(id)a4;
- (id)initialUpdateForFinalUpdate:(id)a3;
- (id)initialUpdateForUpdateIdentifier:(id)a3;
- (id)rebasedMapFromNewBaseMap:(id)a3;
- (id)submapAfterUpdate:(id)a3;
- (id)submapBeforeUpdate:(id)a3;
- (id)updateMapByRevertingUpdateWithIdentifier:(id)a3;
- (int64_t)_transformSectionIndex:(int64_t)a3 applyingUpdateItem:(id)a4 withSnapshot:(id)a5;
- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3;
- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3;
- (void)_computeFinalSnapshotAndReverseUpdateItemsForCollectionViewUpdateItems:(id)a3;
- (void)_performAppendingInsertsFixups;
- (void)_updateSnapshot:(id)a3 forUpdateItem:(id)a4;
- (void)setBatchUpdateMapHelper:(id)a3;
- (void)setFinalSnapshot:(id)a3;
- (void)setInitialSnapshot:(id)a3;
- (void)setOriginalUpdateItems:(id)a3;
- (void)setReverseUpdateItems:(id)a3;
- (void)setUpdateItems:(id)a3;
@end

@implementation _UIDataSourceUpdateMap

- (_UIDataSourceUpdateMap)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 updateItems:(id)a5 assertForInvalidUpdates:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_UIDataSourceUpdateMap;
  v14 = [(_UIDataSourceUpdateMap *)&v21 init];
  if (!v14) {
    goto LABEL_6;
  }
  uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v13 copyItems:1];
  originalUpdateItems = v14->_originalUpdateItems;
  v14->_originalUpdateItems = (NSArray *)v15;

  objc_storeStrong((id *)&v14->_initialSnapshot, a3);
  objc_storeStrong((id *)&v14->_finalSnapshot, a4);
  if (!v12)
  {
    [(_UIDataSourceUpdateMap *)v14 _computeFinalSnapshotAndReverseUpdateItemsForCollectionViewUpdateItems:v13];
    goto LABEL_6;
  }
  v17 = -[_UIDataSourceBatchUpdateMapHelper initWithInitialSnapshot:finalSnapshot:updates:assertingForInvalidUpdates:]((id *)[_UIDataSourceBatchUpdateMapHelper alloc], v11, v12, v13, v6);
  batchUpdateMapHelper = v14->_batchUpdateMapHelper;
  v14->_batchUpdateMapHelper = (_UIDataSourceBatchUpdateMapHelper *)v17;

  if (v14->_batchUpdateMapHelper)
  {
LABEL_6:
    v19 = v14;
    goto LABEL_7;
  }
  v19 = 0;
LABEL_7:

  return v19;
}

+ (id)mapForInitialSnapshot:(id)a3 orderedUpdateItems:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithInitialSnapshot:v7 finalSnapshot:0 updateItems:v6 assertForInvalidUpdates:1];

  return v8;
}

+ (id)mapForInitialSnapshot:(id)a3 finalSnapshot:(id)a4 batchUpdateItems:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithInitialSnapshot:v10 finalSnapshot:v9 updateItems:v8 assertForInvalidUpdates:1];

  return v11;
}

+ (id)validatedMapForInitialSnapshot:(id)a3 finalSnapshot:(id)a4 batchUpdateItems:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithInitialSnapshot:v10 finalSnapshot:v9 updateItems:v8 assertForInvalidUpdates:0];

  return v11;
}

- (id)finalIndexPathForInitialIndexPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v8 = 0;
    goto LABEL_11;
  }
  if ([v4 section] == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v5, "item") == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v5;
LABEL_10:
    id v8 = v6;
    goto LABEL_11;
  }
  batchUpdateMapHelper = self->_batchUpdateMapHelper;
  if (batchUpdateMapHelper)
  {
    -[_UIDataSourceBatchUpdateMapHelper finalIndexPathForInitialIndexPath:]((uint64_t)batchUpdateMapHelper, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if ([(_UIDataSourceUpdateMap *)self _isSectionOnlyIndexPath:v5])
  {
    -[_UIDataSourceUpdateMap _sectionIndexPathForSection:](self, "_sectionIndexPathForSection:", -[_UIDataSourceUpdateMap finalSectionIndexForInitialSectionIndex:](self, "finalSectionIndexForInitialSectionIndex:", [v5 section]));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  id v10 = (void *)[(_UIDataSourceSnapshotter *)self->_initialSnapshot copy];
  id v8 = v5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = [(_UIDataSourceUpdateMap *)self updateItems];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
LABEL_16:
    uint64_t v15 = 0;
    v16 = v8;
    while (1)
    {
      if (*(void *)v19 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * v15);
      id v8 = [(_UIDataSourceUpdateMap *)self _transformIndexPath:v16 applyingUpdateItem:v17 withSnapshot:v10];

      if (!v8) {
        break;
      }
      [(_UIDataSourceUpdateMap *)self _updateSnapshot:v10 forUpdateItem:v17];
      ++v15;
      v16 = v8;
      if (v13 == v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

LABEL_11:
  return v8;
}

- (id)initialIndexPathForFinalIndexPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v8 = 0;
    goto LABEL_11;
  }
  if ([v4 section] == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v5, "item") == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v5;
LABEL_10:
    id v8 = v6;
    goto LABEL_11;
  }
  batchUpdateMapHelper = self->_batchUpdateMapHelper;
  if (batchUpdateMapHelper)
  {
    -[_UIDataSourceBatchUpdateMapHelper initialIndexPathForFinalIndexPath:]((uint64_t)batchUpdateMapHelper, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if ([(_UIDataSourceUpdateMap *)self _isSectionOnlyIndexPath:v5])
  {
    -[_UIDataSourceUpdateMap _sectionIndexPathForSection:](self, "_sectionIndexPathForSection:", -[_UIDataSourceUpdateMap initialSectionIndexForFinalSectionIndex:](self, "initialSectionIndexForFinalSectionIndex:", [v5 section]));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  id v10 = (void *)[(_UIDataSourceSnapshotter *)self->_finalSnapshot copy];
  id v8 = v5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = [(_UIDataSourceUpdateMap *)self reverseUpdateItems];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
LABEL_16:
    uint64_t v15 = 0;
    v16 = v8;
    while (1)
    {
      if (*(void *)v19 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * v15);
      id v8 = [(_UIDataSourceUpdateMap *)self _transformIndexPath:v16 applyingUpdateItem:v17 withSnapshot:v10];

      if (!v8) {
        break;
      }
      [(_UIDataSourceUpdateMap *)self _updateSnapshot:v10 forUpdateItem:v17];
      ++v15;
      v16 = v8;
      if (v13 == v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

LABEL_11:
  return v8;
}

- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v5 = a3;
    batchUpdateMapHelper = self->_batchUpdateMapHelper;
    if (batchUpdateMapHelper)
    {
      return -[_UIDataSourceBatchUpdateMapHelper finalSectionIndexForInitialSectionIndex:]((uint64_t)batchUpdateMapHelper, a3);
    }
    else
    {
      if (a3 < 0) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      id v7 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
      uint64_t v8 = [v7 numberOfSections];

      if (v8 <= v5)
      {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        id v9 = (void *)[(_UIDataSourceSnapshotter *)self->_initialSnapshot copy];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v10 = [(_UIDataSourceUpdateMap *)self updateItems];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
              if ([v15 isSectionUpdate])
              {
                int64_t v5 = [(_UIDataSourceUpdateMap *)self _transformSectionIndex:v5 applyingUpdateItem:v15 withSnapshot:v9];
                [(_UIDataSourceUpdateMap *)self _updateSnapshot:v9 forUpdateItem:v15];
                if (v5 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
                  goto LABEL_20;
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_20:

        return v5;
      }
    }
  }
  return result;
}

- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v5 = a3;
    batchUpdateMapHelper = self->_batchUpdateMapHelper;
    if (batchUpdateMapHelper)
    {
      return -[_UIDataSourceBatchUpdateMapHelper initialSectionIndexForFinalSectionIndex:]((uint64_t)batchUpdateMapHelper, a3);
    }
    else
    {
      if (a3 < 0) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      id v7 = [(_UIDataSourceUpdateMap *)self finalSnapshot];
      uint64_t v8 = [v7 numberOfSections];

      if (v8 <= v5)
      {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        id v9 = (void *)[(_UIDataSourceSnapshotter *)self->_finalSnapshot copy];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v10 = [(_UIDataSourceUpdateMap *)self reverseUpdateItems];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
              if ([v15 isSectionUpdate])
              {
                int64_t v5 = [(_UIDataSourceUpdateMap *)self _transformSectionIndex:v5 applyingUpdateItem:v15 withSnapshot:v9];
                [(_UIDataSourceUpdateMap *)self _updateSnapshot:v9 forUpdateItem:v15];
                if (v5 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
                  goto LABEL_20;
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_20:

        return v5;
      }
    }
  }
  return result;
}

- (id)rebasedMapFromNewBaseMap:(id)a3
{
  v70[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 initialSnapshot];
  id v7 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
    if (!v5) {
      goto LABEL_51;
    }
  }
  else
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2 object:self file:@"_UIDataSourceUpdateMap.m" lineNumber:213 description:@"Initial snapshots must start at the same place. They dont."];

    if (!v5) {
      goto LABEL_51;
    }
  }
  id v9 = [v5 updates];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    if ([v5 isBatchUpdateMap])
    {
      if (![(_UIDataSourceUpdateMap *)self _mapIsSimpleInsertMoveSequence])
      {
        uint64_t v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id obj = [(_UIDataSourceUpdateMap *)self updates];
        uint64_t v58 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
        if (!v58) {
          goto LABEL_36;
        }
        uint64_t v57 = *(void *)v60;
        while (1)
        {
          uint64_t v32 = 0;
          do
          {
            if (*(void *)v60 != v57) {
              objc_enumerationMutation(obj);
            }
            uint64_t v33 = *(void *)(*((void *)&v59 + 1) + 8 * v32);
            if (v33) {
              v34 = *(void **)(v33 + 88);
            }
            else {
              v34 = 0;
            }
            id v35 = v34;
            v36 = [(_UIDataSourceUpdateMap *)self initialUpdateForUpdateIdentifier:v35];

            v37 = [v5 finalUpdateForInitialUpdate:v36];
            if (!v37)
            {
              v49 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICollectionView", &_MergedGlobals_1001) + 8);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v64 = self;
                __int16 v65 = 2112;
                v66 = v36;
                __int16 v67 = 2112;
                id v68 = v5;
                _os_log_impl(&dword_1853B0000, v49, OS_LOG_TYPE_ERROR, "Data source update map could not compute initial update value after shadow updates. Map: %@, update: %@, newBaseMap: %@", buf, 0x20u);
              }
              goto LABEL_47;
            }
            if ([v12 count])
            {
              v38 = [v5 finalSnapshot];
              v39 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v38 orderedUpdateItems:v12];

              uint64_t v40 = [v39 finalUpdateForInitialUpdate:v37];
              if (!v40)
              {
                v53 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICollectionView", &qword_1EB25FF30) + 8);
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  v64 = self;
                  __int16 v65 = 2112;
                  v66 = v37;
                  __int16 v67 = 2112;
                  id v68 = v39;
                  _os_log_impl(&dword_1853B0000, v53, OS_LOG_TYPE_ERROR, "Data source update map could not compute update value after shadow updates. Map: %@,, update: %@, shadowUpdatesMap: %@", buf, 0x20u);
                }

LABEL_47:
                goto LABEL_48;
              }
              v41 = (id *)v40;
              if (v33) {
                v42 = *(void **)(v33 + 88);
              }
              else {
                v42 = 0;
              }
              id v43 = v42;
              objc_storeStrong(v41 + 11, v42);

              [v12 addObject:v41];
            }
            else
            {
              if (v33) {
                v44 = *(void **)(v33 + 88);
              }
              else {
                v44 = 0;
              }
              id v45 = v44;
              objc_storeStrong(v37 + 11, v44);

              [v12 addObject:v37];
            }

            ++v32;
          }
          while (v58 != v32);
          uint64_t v46 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
          uint64_t v58 = v46;
          if (!v46)
          {
LABEL_36:

            v47 = [v5 finalSnapshot];
            v27 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v47 orderedUpdateItems:v12];

            goto LABEL_37;
          }
        }
      }
      uint64_t v11 = [(_UIDataSourceUpdateMap *)self updates];
      uint64_t v12 = [v11 objectAtIndexedSubscript:0];

      uint64_t v13 = [(_UIDataSourceUpdateMap *)self updates];
      uint64_t v14 = [v13 objectAtIndexedSubscript:1];

      uint64_t v15 = [v5 finalUpdateForInitialUpdate:v12];
      if (!v15) {
        goto LABEL_43;
      }
      long long v16 = v12 ? (void *)v12[11] : 0;
      id v17 = v16;
      objc_storeStrong(v15 + 11, v16);

      long long v18 = [v14 indexPathAfterUpdate];
      long long v19 = [v5 finalIndexPathForInitialIndexPath:v18];

      if (!v19)
      {
        v50 = [v5 finalSnapshot];
        v51 = [v14 indexPathAfterUpdate];
        int v52 = [v50 indexPathIsSectionAppendingInsert:v51];

        if (!v52
          || ([v14 indexPathAfterUpdate], (long long v19 = objc_claimAutoreleasedReturnValue()) == 0))
        {
LABEL_43:

LABEL_48:
          v48 = 0;
          goto LABEL_49;
        }
      }
      long long v20 = [UICollectionViewUpdateItem alloc];
      uint64_t v21 = [v15 indexPathAfterUpdate];
      v22 = [(UICollectionViewUpdateItem *)v20 initWithInitialIndexPath:v21 finalIndexPath:v19 updateAction:3];

      if (v14) {
        uint64_t v23 = (void *)v14[11];
      }
      else {
        uint64_t v23 = 0;
      }
      id v24 = v23;
      -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)v22, v24);

      v25 = [v5 finalSnapshot];
      v70[0] = v15;
      v70[1] = v22;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
      v27 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v25 orderedUpdateItems:v26];

LABEL_37:
    }
    else
    {
      v28 = [v5 updates];
      v29 = [v28 firstObject];
      v30 = [(_UIDataSourceUpdateMap *)self _rebasedUpdatesForUpdate:v29];

      v31 = [v5 finalSnapshot];
      v27 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v31 orderedUpdateItems:v30];
    }
    [v27 _performAppendingInsertsFixups];
    v48 = v27;
LABEL_49:

    goto LABEL_52;
  }
LABEL_51:
  v48 = self;
LABEL_52:

  return v48;
}

- (BOOL)isBatchUpdateMap
{
  return self->_batchUpdateMapHelper != 0;
}

- (id)updateMapByRevertingUpdateWithIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(_UIDataSourceUpdateMap *)self updates];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    if (!v5)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2, self, @"_UIDataSourceUpdateMap.m", 296, @"Invalid parameter not satisfying: %@", @"updateIdentifier != nil" object file lineNumber description];
    }
    char v8 = [(_UIDataSourceUpdateMap *)self updates];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __67___UIDataSourceUpdateMap_updateMapByRevertingUpdateWithIdentifier___block_invoke;
    v33[3] = &unk_1E52E68A8;
    id v34 = v5;
    uint64_t v9 = [v8 indexOfObjectPassingTest:v33];

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2 object:self file:@"_UIDataSourceUpdateMap.m" lineNumber:302 description:@"Internal error: could not find specified update by identifier."];
    }
    uint64_t v10 = [(_UIDataSourceUpdateMap *)self updates];
    uint64_t v11 = [v10 objectAtIndexedSubscript:v9];

    uint64_t v12 = [(_UIDataSourceUpdateMap *)self updates];
    uint64_t v13 = objc_msgSend(v12, "subarrayWithRange:", 0, v9 + 1);

    uint64_t v14 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
    uint64_t v15 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v14 orderedUpdateItems:v13];
    long long v16 = [v15 finalSnapshot];

    id v17 = [(_UIDataSourceUpdateMap *)self updates];
    uint64_t v18 = [v17 count] - (v9 + 1);

    long long v19 = [(_UIDataSourceUpdateMap *)self updates];
    long long v20 = objc_msgSend(v19, "subarrayWithRange:", v9 + 1, v18);

    uint64_t v21 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v16 orderedUpdateItems:v20];
    v22 = [v21 finalUpdateForInitialUpdate:v11];
    uint64_t v23 = -[UICollectionViewUpdateItem revertedUpdate](v22);

    id v24 = [(_UIDataSourceUpdateMap *)self _rebasedUpdatesForUpdate:v23];
    v25 = (void *)[v24 mutableCopy];

    [v25 removeObjectAtIndex:v9];
    v26 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
    v27 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v26 orderedUpdateItems:v25];

    [v27 _performAppendingInsertsFixups];
  }
  else
  {
    v28 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
    v29 = [(_UIDataSourceUpdateMap *)self updates];
    v27 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v28 orderedUpdateItems:v29];
  }
  return v27;
}

- (id)initialUpdateForUpdateIdentifier:(id)a3
{
  id v4 = [(_UIDataSourceUpdateMap *)self _findUpdateForIdentifier:a3];
  if (v4
    && ([(_UIDataSourceUpdateMap *)self updates],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 indexOfObjectIdenticalTo:v4],
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    char v8 = [(_UIDataSourceUpdateMap *)self updates];
    uint64_t v9 = objc_msgSend(v8, "subarrayWithRange:", 0, v6 + 1);

    uint64_t v10 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
    uint64_t v11 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v10 orderedUpdateItems:v9];

    id v12 = v4[11];
    uint64_t v13 = [v11 _updateMapByRevertingAllUpdatesExceptUpdateWithIdentifier:v12];

    uint64_t v14 = [v13 updates];
    uint64_t v7 = [v14 firstObject];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)finalIndexPathForIndexPath:(id)a3 startingAtUpdateWithIdentifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(_UIDataSourceUpdateMap *)self _findUpdateForIdentifier:a4];
  if (v7)
  {
    char v8 = [(_UIDataSourceUpdateMap *)self submapAfterUpdate:v7];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = [v8 finalIndexPathForInitialIndexPath:v6];
    }
    else
    {
      id v10 = v6;
    }
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)initialIndexPathForIndexPath:(id)a3 beforeUpdateWithIdentifier:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = [(_UIDataSourceUpdateMap *)self _findUpdateForIdentifier:a4];
    if (v8)
    {
      uint64_t v9 = [(_UIDataSourceUpdateMap *)self submapBeforeUpdate:v8];
      id v10 = v9;
      if (!v9) {
        goto LABEL_7;
      }
      uint64_t v11 = [v9 initialIndexPathForFinalIndexPath:v7];
      if (!v11)
      {
        if (*(void *)(v8 + 80)) {
          goto LABEL_7;
        }
        if ((*(unsigned char *)(v8 + 56) & 1) == 0) {
          goto LABEL_7;
        }
        uint64_t v14 = [v10 initialSnapshot];
        uint64_t v15 = -[UICollectionViewUpdateItem _indexPath]((void *)v8);
        uint64_t v11 = objc_msgSend(v14, "indexPathForAppendingInsertInSection:", objc_msgSend(v15, "section"));

        if (!v11)
        {
LABEL_7:
          id v12 = [MEMORY[0x1E4F28B00] currentHandler];
          [v12 handleFailureInMethod:a2 object:self file:@"_UIDataSourceUpdateMap.m" lineNumber:383 description:@"Could not determine the intialIndexPath before shadow update"];

          uint64_t v11 = 0;
        }
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)finalUpdateForInitialUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 indexPathBeforeUpdate];
  id v6 = [(_UIDataSourceUpdateMap *)self finalIndexPathForInitialIndexPath:v5];

  id v7 = [v4 indexPathAfterUpdate];
  uint64_t v8 = [(_UIDataSourceUpdateMap *)self finalIndexPathForInitialIndexPath:v7];

  if (v8) {
    goto LABEL_2;
  }
  if (v4 && v4[10])
  {
    id v10 = [UICollectionViewUpdateItem alloc];
    char v9 = 0;
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  id v17 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
  uint64_t v18 = -[UICollectionViewUpdateItem _indexPath](v4);
  int v19 = [v17 indexPathIsSectionAppendingInsert:v18];

  if (!v19)
  {
    uint64_t v8 = 0;
LABEL_2:
    char v9 = 0;
    goto LABEL_3;
  }
  long long v20 = [(_UIDataSourceUpdateMap *)self finalSnapshot];
  uint64_t v21 = -[UICollectionViewUpdateItem _indexPath](v4);
  uint64_t v8 = objc_msgSend(v20, "indexPathForAppendingInsertInSection:", objc_msgSend(v21, "section"));

  char v9 = 1;
LABEL_3:
  id v10 = [UICollectionViewUpdateItem alloc];
  if (!v4)
  {
    uint64_t v11 = 0;
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v11 = v4[10];
LABEL_9:
  id v12 = [(UICollectionViewUpdateItem *)v10 initWithInitialIndexPath:v6 finalIndexPath:v8 updateAction:v11];
  uint64_t v13 = v12;
  if (v12) {
    *(unsigned char *)&v12->_updateItemFlags = *(unsigned char *)&v12->_updateItemFlags & 0xFE | v9;
  }
  uint64_t v14 = [(UICollectionViewUpdateItem *)v12 indexPathBeforeUpdate];
  if (v14) {
    goto LABEL_12;
  }
  uint64_t v15 = [(UICollectionViewUpdateItem *)v13 indexPathAfterUpdate];

  if (!v15)
  {
    uint64_t v14 = v13;
    uint64_t v13 = 0;
LABEL_12:
  }
  return v13;
}

- (id)initialUpdateForFinalUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 indexPathBeforeUpdate];
  id v6 = [(_UIDataSourceUpdateMap *)self initialIndexPathForFinalIndexPath:v5];

  id v7 = [v4 indexPathAfterUpdate];
  uint64_t v8 = [(_UIDataSourceUpdateMap *)self initialIndexPathForFinalIndexPath:v7];

  char v9 = [UICollectionViewUpdateItem alloc];
  if (v4) {
    uint64_t v10 = v4[10];
  }
  else {
    uint64_t v10 = 0;
  }

  uint64_t v11 = [(UICollectionViewUpdateItem *)v9 initWithInitialIndexPath:v6 finalIndexPath:v8 updateAction:v10];
  id v12 = [(UICollectionViewUpdateItem *)v11 indexPathAfterUpdate];
  if (v12) {
    goto LABEL_4;
  }
  uint64_t v13 = [(UICollectionViewUpdateItem *)v11 indexPathBeforeUpdate];

  if (!v13)
  {
    id v12 = v11;
    uint64_t v11 = 0;
LABEL_4:
  }
  return v11;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
  id v7 = [(_UIDataSourceUpdateMap *)self finalSnapshot];
  uint64_t v8 = [(_UIDataSourceUpdateMap *)self updates];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; intialSnapshot = %@; finalSnapshot = %@; updates = %@>",
    v5,
    self,
    v6,
    v7,
  char v9 = v8);

  return v9;
}

- (id)_oldSectionMapDescription
{
  v3 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
  uint64_t v4 = [v3 numberOfSections];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51___UIDataSourceUpdateMap__oldSectionMapDescription__block_invoke;
  v8[3] = &unk_1E52E0928;
  v8[4] = self;
  id v5 = _mapAsArray(v4, v8);
  id v6 = [v5 description];

  return v6;
}

- (id)_newSectionMapDescription
{
  v3 = [(_UIDataSourceUpdateMap *)self finalSnapshot];
  uint64_t v4 = [v3 numberOfSections];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51___UIDataSourceUpdateMap__newSectionMapDescription__block_invoke;
  v8[3] = &unk_1E52E0928;
  v8[4] = self;
  id v5 = _mapAsArray(v4, v8);
  id v6 = [v5 description];

  return v6;
}

- (id)_oldGlobalItemMapDescription
{
  v3 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
  uint64_t v4 = [v3 numberOfItems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54___UIDataSourceUpdateMap__oldGlobalItemMapDescription__block_invoke;
  v8[3] = &unk_1E52E0928;
  v8[4] = self;
  id v5 = _mapAsArray(v4, v8);
  id v6 = [v5 description];

  return v6;
}

- (id)_newGlobalItemMapDescription
{
  v3 = [(_UIDataSourceUpdateMap *)self finalSnapshot];
  uint64_t v4 = [v3 numberOfItems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54___UIDataSourceUpdateMap__newGlobalItemMapDescription__block_invoke;
  v8[3] = &unk_1E52E0928;
  v8[4] = self;
  id v5 = _mapAsArray(v4, v8);
  id v6 = [v5 description];

  return v6;
}

- (id)_sectionIndexPathForSection:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:a3];
}

- (BOOL)_isSectionOnlyIndexPath:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 length] == 1 || objc_msgSend(v3, "item") == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (BOOL)_mapIsSimpleInsertMoveSequence
{
  id v3 = [(_UIDataSourceUpdateMap *)self updates];
  uint64_t v4 = [v3 count];

  if (v4 == 2)
  {
    id v5 = [(_UIDataSourceUpdateMap *)self updates];
    id v6 = [v5 objectAtIndexedSubscript:0];

    id v7 = [(_UIDataSourceUpdateMap *)self updates];
    uint64_t v8 = [v7 objectAtIndexedSubscript:1];

    if (v6)
    {
      char v9 = 0;
      if (v6[10] || !v8) {
        goto LABEL_10;
      }
    }
    else if (!v8)
    {
      goto LABEL_9;
    }
    if (v8[10] == 3)
    {
      uint64_t v10 = [v6 indexPathAfterUpdate];
      uint64_t v11 = [v8 indexPathBeforeUpdate];
      char v9 = [v10 isEqual:v11];

LABEL_10:
      return v9;
    }
LABEL_9:
    char v9 = 0;
    goto LABEL_10;
  }
  return 0;
}

- (void)_performAppendingInsertsFixups
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
  uint64_t v4 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v3 orderedUpdateItems:MEMORY[0x1E4F1CBF0]];

  id v5 = [(_UIDataSourceUpdateMap *)self updates];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = [(_UIDataSourceUpdateMap *)self updates];
      uint64_t v9 = [v8 objectAtIndexedSubscript:v7];

      if (!v9 || !*(void *)(v9 + 80))
      {
        uint64_t v10 = [v4 finalSnapshot];
        uint64_t v11 = -[UICollectionViewUpdateItem _indexPath]((void *)v9);
        char v12 = [v10 indexPathIsSectionAppendingInsert:v11];

        if (v9) {
          *(unsigned char *)(v9 + 56) = *(unsigned char *)(v9 + 56) & 0xFE | v12;
        }
      }
      uint64_t v13 = [v4 finalSnapshot];
      v18[0] = v9;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      uint64_t v15 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v13 orderedUpdateItems:v14];

      ++v7;
      long long v16 = [(_UIDataSourceUpdateMap *)self updates];
      unint64_t v17 = [v16 count];

      uint64_t v4 = v15;
    }
    while (v7 < v17);
  }
  else
  {
    uint64_t v15 = v4;
  }
}

- (id)_findUpdateForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__48;
  long long v16 = __Block_byref_object_dispose__48;
  id v17 = 0;
  id v5 = [(_UIDataSourceUpdateMap *)self updates];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51___UIDataSourceUpdateMap__findUpdateForIdentifier___block_invoke;
  v9[3] = &unk_1E52E3478;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)submapBeforeUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDataSourceUpdateMap *)self originalUpdateItems];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45___UIDataSourceUpdateMap_submapBeforeUpdate___block_invoke;
  v13[3] = &unk_1E52E68A8;
  id v6 = v4;
  id v14 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v13];

  if (v7)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = 0;
      goto LABEL_7;
    }
    id v10 = [(_UIDataSourceUpdateMap *)self originalUpdateItems];
    uint64_t v9 = objc_msgSend(v10, "subarrayWithRange:", 0, v7);

    uint64_t v11 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
    uint64_t v8 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v11 orderedUpdateItems:v9];
  }
  else
  {
    uint64_t v9 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
    uint64_t v8 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v9 orderedUpdateItems:MEMORY[0x1E4F1CBF0]];
  }

LABEL_7:
  return v8;
}

- (id)submapAfterUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDataSourceUpdateMap *)self originalUpdateItems];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __44___UIDataSourceUpdateMap_submapAfterUpdate___block_invoke;
  v23[3] = &unk_1E52E68A8;
  id v6 = v4;
  id v24 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v23];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [(_UIDataSourceUpdateMap *)self originalUpdateItems];
    unint64_t v10 = [v9 count];

    uint64_t v11 = v10 - v7 - 1;
    if ((uint64_t)(v10 - v7) < 1)
    {
      id v17 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
      uint64_t v8 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v17 orderedUpdateItems:MEMORY[0x1E4F1CBF0]];
    }
    else
    {
      uint64_t v12 = v7 + 1;
      uint64_t v13 = [(_UIDataSourceUpdateMap *)self originalUpdateItems];
      id v14 = objc_msgSend(v13, "subarrayWithRange:", 0, v12);

      uint64_t v15 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
      long long v16 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v15 orderedUpdateItems:v14];

      id v17 = [v16 finalSnapshot];

      uint64_t v18 = [(_UIDataSourceUpdateMap *)self originalUpdateItems];
      unint64_t v19 = [v18 count];

      if (v10 <= v19)
      {
        uint64_t v21 = [(_UIDataSourceUpdateMap *)self originalUpdateItems];
        long long v20 = objc_msgSend(v21, "subarrayWithRange:", v12, v11);
      }
      else
      {
        long long v20 = (void *)MEMORY[0x1E4F1CBF0];
      }
      uint64_t v8 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v17 orderedUpdateItems:v20];
    }
  }

  return v8;
}

- (id)_updateMapByRevertingAllUpdatesExceptUpdateWithIdentifier:(id)a3
{
  id v5 = a3;
  if ([(_UIDataSourceUpdateMap *)self isBatchUpdateMap])
  {
    id v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"_UIDataSourceUpdateMap.m" lineNumber:585 description:@"Cannot revert for a batch updates map."];
  }
  id v6 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
  uint64_t v7 = [(_UIDataSourceUpdateMap *)self updates];
  uint64_t v8 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v6 orderedUpdateItems:v7];

  uint64_t v9 = [v8 updates];
  unint64_t v10 = [v9 count];

  if (v10 >= 2)
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = [v8 updates];
      uint64_t v13 = [v12 count];

      if (v13)
      {
        unint64_t v14 = 0;
        while (1)
        {
          uint64_t v15 = [v8 updates];
          long long v16 = [v15 objectAtIndexedSubscript:v14];

          id v17 = v16 ? (void *)v16[11] : 0;
          id v18 = v17;
          char v19 = [v18 isEqual:v5];

          if ((v19 & 1) == 0) {
            break;
          }

          ++v14;
          long long v20 = [v8 updates];
          unint64_t v21 = [v20 count];

          if (v14 >= v21) {
            goto LABEL_16;
          }
        }
        if (v16) {
          v22 = (void *)v16[11];
        }
        else {
          v22 = 0;
        }
        id v23 = v22;
        uint64_t v24 = [v8 updateMapByRevertingUpdateWithIdentifier:v23];

        uint64_t v8 = (void *)v24;
      }
LABEL_16:
      v25 = [(_UIDataSourceUpdateMap *)self updates];
      unint64_t v26 = [v25 count];

      if (v11 > v26)
      {
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        v28 = NSStringFromSelector(a2);
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIDataSourceUpdateMap.m", 600, @"ERROR: failed to revert intermediate update; failing to create map for %@",
          v28);
      }
      ++v11;
      v29 = [v8 updates];
      unint64_t v30 = [v29 count];
    }
    while (v30 > 1);
  }
  v31 = [v8 updates];
  uint64_t v32 = [v31 count];

  if (v32 != 1)
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    v36 = NSStringFromSelector(a2);
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIDataSourceUpdateMap.m", 603, @"Resultant map does not have exactly 1 item in it; failing to create map for %@",
      v36);
  }
  return v8;
}

- (id)_rebasedUpdatesForUpdate:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  if (v34)
  {
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = [(_UIDataSourceUpdateMap *)self updates];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      SEL v32 = a2;
      unint64_t v7 = 0;
      uint64_t v8 = -1;
      do
      {
        uint64_t v9 = [(_UIDataSourceUpdateMap *)self updates];
        unint64_t v10 = [v9 objectAtIndexedSubscript:v7];

        unint64_t v11 = [(_UIDataSourceUpdateMap *)self updates];
        uint64_t v12 = objc_msgSend(v11, "subarrayWithRange:", 0, v7);

        uint64_t v13 = [(_UIDataSourceUpdateMap *)self initialSnapshot];
        id v35 = (void *)v12;
        unint64_t v14 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v13 orderedUpdateItems:v12];

        uint64_t v15 = [v14 finalSnapshot];

        v36[0] = v10;
        long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
        id v17 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v15 orderedUpdateItems:v16];

        ++v7;
        id v18 = [(_UIDataSourceUpdateMap *)self updates];
        uint64_t v19 = [v18 count] + v8;

        long long v20 = [(_UIDataSourceUpdateMap *)self updates];
        unint64_t v21 = objc_msgSend(v20, "subarrayWithRange:", v7, v19);
        v22 = [v21 arrayByAddingObject:v34];

        id v23 = [v17 finalSnapshot];
        uint64_t v24 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v23 orderedUpdateItems:v22];

        v25 = [v24 finalUpdateForInitialUpdate:v10];
        if (!v25) {
          v25 = [[UICollectionViewUpdateItem alloc] initWithAction:4 forIndexPath:0];
        }
        if (v10) {
          unint64_t v26 = (void *)v10[11];
        }
        else {
          unint64_t v26 = 0;
        }
        id v27 = v26;
        -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)v25, v27);

        if (!v25)
        {
          unint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
          [v30 handleFailureInMethod:v32 object:self file:@"_UIDataSourceUpdateMap.m" lineNumber:645 description:@"Failed to rebase update."];
        }
        [v33 addObject:v25];

        v28 = [(_UIDataSourceUpdateMap *)self updates];
        unint64_t v29 = [v28 count];

        --v8;
      }
      while (v7 < v29);
    }
  }
  else
  {
    id v33 = [(_UIDataSourceUpdateMap *)self updates];
  }

  return v33;
}

- (void)_computeFinalSnapshotAndReverseUpdateItemsForCollectionViewUpdateItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[(_UIDataSourceSnapshotter *)self->_initialSnapshot copy];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = -[_UIDataSourceUpdateMap _mapUpdateForCollectionUpdateItem:snapshot:](self, "_mapUpdateForCollectionUpdateItem:snapshot:", *(void *)(*((void *)&v15 + 1) + 8 * v12), v5, (void)v15);
        unint64_t v14 = [v13 reverseUpdateItem];
        if (v14)
        {
          [v6 addObject:v13];
          [v7 insertObject:v14 atIndex:0];
          [(_UIDataSourceUpdateMap *)self _updateSnapshot:v5 forUpdateItem:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [(_UIDataSourceUpdateMap *)self setFinalSnapshot:v5];
  [(_UIDataSourceUpdateMap *)self setUpdateItems:v6];
  [(_UIDataSourceUpdateMap *)self setReverseUpdateItems:v7];
}

- (id)_mapUpdateForCollectionUpdateItem:(id)a3 snapshot:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = v5[10];
    if (v7)
    {
      if (v7 == 3)
      {
        uint64_t v16 = v5[6];
        long long v17 = [v5 indexPathBeforeUpdate];
        unint64_t v14 = v17;
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v18 = objc_msgSend(v6, "rangeForSection:", objc_msgSend(v17, "section"));
          uint64_t v20 = v19;

          unint64_t v14 = (void *)[v6 copy];
          unint64_t v21 = [v5 indexPathBeforeUpdate];
          objc_msgSend(v14, "_deleteSection:", objc_msgSend(v21, "section"));

          uint64_t v22 = [v14 rangeForSection:v5[3]];
          id v23 = [v5 indexPathBeforeUpdate];
          uint64_t v24 = +[_MapUpdate itemMoveSection:toSection:fromRange:toRange:](_MapUpdate, "itemMoveSection:toSection:fromRange:toRange:", [v23 section], v5[3], v18, v20, v22, v20);
        }
        else
        {
          unint64_t v29 = [v5 indexPathAfterUpdate];
          uint64_t v24 = +[_MapUpdate itemMoveFromIndexIndexPath:toIndexPath:fromIndex:toIndex:](_MapUpdate, "itemMoveFromIndexIndexPath:toIndexPath:fromIndex:toIndex:", v14, v29, [v6 globalIndexForIndexPath:v14], objc_msgSend(v6, "globalIndexForIndexPath:", v29));
        }
        goto LABEL_21;
      }
      if (v7 == 1)
      {
        uint64_t v8 = v5[6];
        uint64_t v9 = -[UICollectionViewUpdateItem _indexPath](v5);
        uint64_t v10 = v9;
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v11 = objc_msgSend(v6, "rangeForSection:", objc_msgSend(v9, "section"));
          uint64_t v13 = v12;

          unint64_t v14 = -[UICollectionViewUpdateItem _indexPath](v5);
          +[_MapUpdate itemDeleteSection:deleteRange:](_MapUpdate, "itemDeleteSection:deleteRange:", [v14 section], v11, v13);
        }
        else
        {
          uint64_t v30 = [v6 globalIndexForIndexPath:v9];

          unint64_t v14 = -[UICollectionViewUpdateItem _indexPath](v5);
          +[_MapUpdate itemDeleteItemAtIndexPath:v14 index:v30];
        uint64_t v15 = };
        goto LABEL_20;
      }
LABEL_18:
      uint64_t v24 = 0;
      goto LABEL_22;
    }
    uint64_t v25 = v5[6];
    unint64_t v26 = -[UICollectionViewUpdateItem _indexPath](v5);
    id v27 = v26;
    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v28 = objc_msgSend(v6, "rangeForSection:", objc_msgSend(v26, "section"));

      unint64_t v14 = -[UICollectionViewUpdateItem _indexPath](v5);
      uint64_t v15 = +[_MapUpdate itemInsertSection:insertRange:](_MapUpdate, "itemInsertSection:insertRange:", [v14 section], v28, 0);
      goto LABEL_20;
    }
  }
  else
  {
    id v27 = -[UICollectionViewUpdateItem _indexPath](0);
  }
  uint64_t v31 = [v6 globalIndexForIndexPath:v27];

  if (v31 == 0x7FFFFFFFFFFFFFFFLL)
  {
    SEL v32 = -[UICollectionViewUpdateItem _indexPath](v5);
    int v33 = [v6 indexPathIsSectionAppendingInsert:v32];

    if (!v33) {
      goto LABEL_18;
    }
    id v34 = -[UICollectionViewUpdateItem _indexPath](v5);
    uint64_t v35 = objc_msgSend(v6, "rangeForSection:", objc_msgSend(v34, "section"));
    uint64_t v31 = v35 + v36;

    if (v31 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_18;
    }
  }
  unint64_t v14 = -[UICollectionViewUpdateItem _indexPath](v5);
  uint64_t v15 = +[_MapUpdate itemInsertItemAtIndexPath:v14 index:v31];
LABEL_20:
  uint64_t v24 = (void *)v15;
LABEL_21:

LABEL_22:
  return v24;
}

- (id)_transformIndexPath:(id)a3 applyingUpdateItem:(id)a4 withSnapshot:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (!v8) {
    goto LABEL_17;
  }
  unint64_t v12 = [v10 globalIndexForIndexPath:v8];
  if ([v9 isMove])
  {
    if ([v9 isSectionUpdate])
    {
      uint64_t v13 = [v8 section];
      if ([v9 moveFromSection] == v13)
      {
        unint64_t v14 = (void *)MEMORY[0x1E4F28D58];
        uint64_t v15 = [v8 item];
        uint64_t v16 = [v9 moveToSection];
        long long v17 = v14;
        uint64_t v18 = v15;
LABEL_32:
        id v19 = [v17 indexPathForItem:v18 inSection:v16];
        goto LABEL_33;
      }
      uint64_t v25 = v13 - ([v9 moveFromSection] < v13);
      if ([v9 moveToSection] <= v25) {
        ++v25;
      }
      unint64_t v26 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v18 = [v8 item];
      long long v17 = v26;
    }
    else
    {
      unint64_t v21 = [v9 moveFromIndexPath];
      int v22 = [v8 isEqual:v21];

      if (v22)
      {
        id v19 = [v9 moveToIndexPath];
        if (v19) {
          goto LABEL_36;
        }
        goto LABEL_34;
      }
      uint64_t v25 = [v8 section];
      uint64_t v27 = [v8 item];
      uint64_t v28 = [v9 moveFromIndexPath];
      uint64_t v29 = [v28 section];

      uint64_t v30 = [v9 moveToIndexPath];
      uint64_t v31 = [v30 section];

      if (v25 != v31 && v25 != v29)
      {
        id v19 = v8;
        goto LABEL_36;
      }
      if (v25 == v29)
      {
        id v34 = [v9 moveFromIndexPath];
        BOOL v35 = [v34 item] < v27;

        v27 -= v35;
      }
      if (v25 == v31)
      {
        uint64_t v36 = [v9 moveToIndexPath];
        BOOL v37 = [v36 item] <= v27;

        v27 += v37;
      }
      long long v17 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v18 = v27;
    }
    uint64_t v16 = v25;
    goto LABEL_32;
  }
  if ([v9 isInsert])
  {
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v9 insertRange] <= v12)
      {
        [v9 insertRange];
        id v19 = 0;
        v12 += v20;
        goto LABEL_34;
      }
      goto LABEL_25;
    }
LABEL_17:
    id v19 = 0;
    goto LABEL_36;
  }
  id v19 = 0;
  if (![v9 isDelete] || v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_33:
    if (v19) {
      goto LABEL_36;
    }
    goto LABEL_34;
  }
  unint64_t v23 = [v9 deleteRange];
  if (v12 >= v23 && v12 - v23 < v24) {
    goto LABEL_17;
  }
  uint64_t v32 = [v9 deleteRange];
  if (v12 < v32 + v33)
  {
LABEL_25:
    id v19 = 0;
    goto LABEL_34;
  }
  [v9 deleteRange];
  id v19 = 0;
  v12 -= v40;
LABEL_34:
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v38 = (void *)[v11 copy];
    [(_UIDataSourceUpdateMap *)self _updateSnapshot:v38 forUpdateItem:v9];
    id v19 = [v38 indexPathForGlobalIndex:v12];
  }
LABEL_36:

  return v19;
}

- (int64_t)_transformSectionIndex:(int64_t)a3 applyingUpdateItem:(id)a4 withSnapshot:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    unint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_UIDataSourceUpdateMap.m", 825, @"Invalid parameter not satisfying: %@", @"snapshot != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_20:
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UIDataSourceUpdateMap.m", 826, @"Invalid parameter not satisfying: %@", @"updateItem != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_20;
  }
LABEL_3:
  int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_18;
  }
  if (![v9 isSectionUpdate]) {
    goto LABEL_17;
  }
  if ([v9 isMove])
  {
    if ([v9 moveFromSection] == a3)
    {
      int64_t v11 = [v9 moveToSection];
      goto LABEL_18;
    }
    a3 -= [v9 moveFromSection] < a3;
    int64_t v12 = [v9 moveToSection];
    goto LABEL_11;
  }
  if ([v9 isInsert])
  {
    int64_t v12 = [v9 section];
LABEL_11:
    if (v12 > a3) {
      int64_t v11 = a3;
    }
    else {
      int64_t v11 = a3 + 1;
    }
    goto LABEL_18;
  }
  if (![v9 isDelete])
  {
LABEL_17:
    int64_t v11 = a3;
    goto LABEL_18;
  }
  if ([v9 section] != a3) {
    int64_t v11 = a3 - ([v9 section] < a3);
  }
LABEL_18:

  return v11;
}

- (void)_updateSnapshot:(id)a3 forUpdateItem:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  if (![v5 isDelete])
  {
    if ([v5 isMove])
    {
      int v8 = [v5 isSectionUpdate];
      uint64_t v9 = [v5 moveFromSection];
      if (!v8)
      {
        [v16 _decrementSectionCount:v9];
        objc_msgSend(v16, "_incrementSectionCount:", objc_msgSend(v5, "moveToSection"));
        goto LABEL_14;
      }
      [v16 _deleteSection:v9];
      uint64_t v10 = [v5 moveToSection];
      [v5 moveToRange];
      int64_t v11 = v16;
      uint64_t v12 = v10;
      uint64_t v14 = v13;
    }
    else
    {
      if (![v5 isInsert]) {
        goto LABEL_14;
      }
      if (![v5 isSectionUpdate])
      {
        uint64_t v15 = [v5 indexPath];
        objc_msgSend(v16, "_incrementSectionCount:", objc_msgSend(v15, "section"));

        goto LABEL_14;
      }
      uint64_t v12 = [v5 section];
      int64_t v11 = v16;
      uint64_t v14 = 0;
    }
    [v11 _insertSection:v12 withInitialCount:v14];
    goto LABEL_14;
  }
  int v6 = [v5 isSectionUpdate];
  uint64_t v7 = [v5 section];
  if (v6) {
    [v16 _deleteSection:v7];
  }
  else {
    [v16 _decrementSectionCount:v7];
  }
LABEL_14:
}

- (_UIDataSourceSnapshotter)initialSnapshot
{
  return self->_initialSnapshot;
}

- (void)setInitialSnapshot:(id)a3
{
}

- (_UIDataSourceSnapshotter)finalSnapshot
{
  return self->_finalSnapshot;
}

- (void)setFinalSnapshot:(id)a3
{
}

- (NSArray)originalUpdateItems
{
  return self->_originalUpdateItems;
}

- (void)setOriginalUpdateItems:(id)a3
{
}

- (NSArray)updateItems
{
  return self->_updateItems;
}

- (void)setUpdateItems:(id)a3
{
}

- (NSArray)reverseUpdateItems
{
  return self->_reverseUpdateItems;
}

- (void)setReverseUpdateItems:(id)a3
{
}

- (_UIDataSourceBatchUpdateMapHelper)batchUpdateMapHelper
{
  return self->_batchUpdateMapHelper;
}

- (void)setBatchUpdateMapHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchUpdateMapHelper, 0);
  objc_storeStrong((id *)&self->_reverseUpdateItems, 0);
  objc_storeStrong((id *)&self->_updateItems, 0);
  objc_storeStrong((id *)&self->_originalUpdateItems, 0);
  objc_storeStrong((id *)&self->_finalSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
}

@end