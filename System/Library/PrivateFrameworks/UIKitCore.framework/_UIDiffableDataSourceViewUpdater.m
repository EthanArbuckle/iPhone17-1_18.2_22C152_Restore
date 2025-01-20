@interface _UIDiffableDataSourceViewUpdater
- (BOOL)_doesExpectedUpdate:(id)a3 matchActualUpdates:(id)a4 allowingEmptyUpdates:(BOOL)a5;
- (BOOL)hasPerformedInitialUpdate;
- (UICollectionView)collectionView;
- (UITableView)tableView;
- (_UICollectionDataSourceSnapshotTranslating)dataSourceSnapshot;
- (_UICollectionViewUpdateItemApplying)updatesSink;
- (_UIDiffableDataSourceViewUpdater)initWithCollectionView:(id)a3;
- (_UIDiffableDataSourceViewUpdater)initWithCollectionViewUpdatesSink:(id)a3;
- (_UIDiffableDataSourceViewUpdater)initWithTableView:(id)a3;
- (_UIDiffableDataSourceViewUpdater)initWithUpdatesSink:(id)a3 collectionView:(id)a4 tableView:(id)a5;
- (id)_sectionIndexesToReloadForTableViewCompatibility:(id)a3;
- (id)targetView;
- (int64_t)_performUpdateWithCollectionViewUpdateItems:(id)a3 dataSourceSnapshot:(id)a4 updateHandler:(id)a5 completion:(id)a6 viewPropertyAnimator:(id)a7 customAnimationsProvider:(id)a8 animated:(BOOL)a9;
- (int64_t)sinkKind;
- (int64_t)tableViewRowAnimation;
- (void)_deleteAllItems;
- (void)_performMoveUpdate:(id)a3 onCollectionView:(id)a4;
- (void)_performMoveUpdate:(id)a3 onTableView:(id)a4;
- (void)_performViewUpdates:(id)a3;
- (void)_reloadData;
- (void)setCollectionView:(id)a3;
- (void)setDataSourceSnapshot:(id)a3;
- (void)setHasPerformedInitialUpdate:(BOOL)a3;
- (void)setSinkKind:(int64_t)a3;
- (void)setTableView:(id)a3;
- (void)setTableViewRowAnimation:(int64_t)a3;
- (void)setUpdatesSink:(id)a3;
@end

@implementation _UIDiffableDataSourceViewUpdater

- (void)_reloadData
{
  [(_UIDiffableDataSourceViewUpdater *)self setHasPerformedInitialUpdate:1];
  v3 = [(_UIDiffableDataSourceViewUpdater *)self collectionView];
  v4 = v3;
  if (v3)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __47___UIDiffableDataSourceViewUpdater__reloadData__block_invoke;
    v17[3] = &unk_1E52D9F70;
    id v5 = v3;
    id v18 = v5;
    [v5 _performDiffableUpdate:v17];
    v6 = [v5 window];

    if (v6) {
      [v5 layoutIfNeeded];
    }
    id v7 = v18;
  }
  else
  {
    v8 = [(_UIDiffableDataSourceViewUpdater *)self tableView];
    if (v8)
    {
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __47___UIDiffableDataSourceViewUpdater__reloadData__block_invoke_2;
      v15 = &unk_1E52D9F70;
      id v7 = v8;
      id v16 = v7;
      [v7 _performDiffableUpdate:&v12];
      v9 = objc_msgSend(v7, "window", v12, v13, v14, v15);

      if (v9) {
        [v7 layoutIfNeeded];
      }
    }
    else
    {
      v10 = [(_UIDiffableDataSourceViewUpdater *)self updatesSink];
      v11 = v10;
      if (v10) {
        [v10 _reloadData];
      }

      id v7 = 0;
    }
  }
}

- (void)_performViewUpdates:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:self file:@"_UIDiffableDataSourceViewUpdater.m" lineNumber:349 description:@"Error: Updates can only be committed on the main thread."];
  }
  v6 = [(_UIDiffableDataSourceViewUpdater *)self collectionView];
  v41 = [(_UIDiffableDataSourceViewUpdater *)self tableView];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v44 = 0;
    id obj = v7;
    SEL v38 = a2;
    v39 = self;
    v10 = 0;
    v11 = 0;
    uint64_t v12 = 0;
    v40 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    uint64_t v13 = *(void *)v47;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v46 + 1) + 8 * v14);
        if (v15)
        {
          switch(*(void *)(v15 + 80))
          {
            case 0:
              if (*(void *)(v15 + 48) != 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_24;
              }
              id v16 = (void *)v44;
              if (v44)
              {
                uint64_t v17 = *(void *)(v15 + 24);
                goto LABEL_21;
              }
              uint64_t v44 = [objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:*(void *)(v15 + 24)];
              break;
            case 1:
              if (*(void *)(v15 + 48) != 0x7FFFFFFFFFFFFFFFLL)
              {
                if (v11)
                {
                  id v18 = [*(id *)(*((void *)&v46 + 1) + 8 * v14) indexPathBeforeUpdate];
                  v19 = v11;
                  goto LABEL_31;
                }
                id v26 = objc_alloc(MEMORY[0x1E4F1CA48]);
                id v18 = [(id)v15 indexPathBeforeUpdate];
                v11 = objc_msgSend(v26, "initWithObjects:", v18, 0);
                goto LABEL_32;
              }
              id v16 = (void *)v43;
              if (v43) {
                goto LABEL_20;
              }
              uint64_t v43 = [objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:*(void *)(v15 + 8)];
              break;
            case 2:
              if (*(void *)(v15 + 48) == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (*(void *)(v15 + 8) == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v29 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v29 handleFailureInMethod:v38 object:self file:@"_UIDiffableDataSourceViewUpdater.m" lineNumber:400 description:@"Cannot reload a section with NSNotFound index"];
                }
                id v16 = (void *)v42;
                if (v42)
                {
LABEL_20:
                  uint64_t v17 = *(void *)(v15 + 8);
LABEL_21:
                  [v16 addIndex:v17];
                }
                else
                {
                  uint64_t v42 = [objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:*(void *)(v15 + 8)];
                }
              }
              else
              {
                if ((*(unsigned char *)(v15 + 56) & 2) == 0)
                {
                  if (v10)
                  {
                    id v18 = [*(id *)(*((void *)&v46 + 1) + 8 * v14) indexPathBeforeUpdate];
                    v19 = v10;
                    goto LABEL_31;
                  }
                  id v27 = objc_alloc(MEMORY[0x1E4F1CA48]);
                  id v18 = [(id)v15 indexPathBeforeUpdate];
                  v10 = objc_msgSend(v27, "initWithObjects:", v18, 0);
                  goto LABEL_32;
                }
                v20 = v6;
                v21 = v12;
                v22 = v11;
                v23 = v10;
                if (v40)
                {
                  v24 = [*(id *)(*((void *)&v46 + 1) + 8 * v14) indexPathBeforeUpdate];
                  [v40 addObject:v24];
                }
                else
                {
                  id v28 = objc_alloc(MEMORY[0x1E4F1CA48]);
                  v24 = [(id)v15 indexPathBeforeUpdate];
                  v40 = objc_msgSend(v28, "initWithObjects:", v24, 0);
                }

                v10 = v23;
                v11 = v22;
                uint64_t v12 = v21;
                v6 = v20;
                self = v39;
              }
              break;
            case 3:
              if (v6)
              {
                [(_UIDiffableDataSourceViewUpdater *)self _performMoveUpdate:*(void *)(*((void *)&v46 + 1) + 8 * v14) onCollectionView:v6];
              }
              else if (v41)
              {
                [(_UIDiffableDataSourceViewUpdater *)self _performMoveUpdate:*(void *)(*((void *)&v46 + 1) + 8 * v14) onTableView:v41];
              }
              break;
            default:
              break;
          }
        }
        else
        {
LABEL_24:
          if (v12)
          {
            id v18 = [*(id *)(*((void *)&v46 + 1) + 8 * v14) indexPathAfterUpdate];
            v19 = v12;
LABEL_31:
            [v19 addObject:v18];
          }
          else
          {
            id v25 = objc_alloc(MEMORY[0x1E4F1CA48]);
            id v18 = [(id)v15 indexPathAfterUpdate];
            uint64_t v12 = objc_msgSend(v25, "initWithObjects:", v18, 0);
          }
LABEL_32:
        }
        ++v14;
      }
      while (v9 != v14);
      uint64_t v30 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      uint64_t v9 = v30;
    }
    while (v30);
    id v7 = obj;

    if (v6)
    {
      if (v42) {
        objc_msgSend(v6, "reloadSections:");
      }
      if (v43) {
        objc_msgSend(v6, "deleteSections:");
      }
      if (v44) {
        objc_msgSend(v6, "insertSections:");
      }
      if (v40) {
        objc_msgSend(v6, "reconfigureItemsAtIndexPaths:");
      }
      if (v10) {
        [v6 reloadItemsAtIndexPaths:v10];
      }
      if (v11) {
        [v6 deleteItemsAtIndexPaths:v11];
      }
      if (v12) {
        [v6 insertItemsAtIndexPaths:v12];
      }
    }
    else
    {
      uint64_t v35 = v42;
      v32 = (void *)v43;
      v33 = (void *)v44;
      v34 = v40;
      if (!v41)
      {
        v31 = (void *)v42;
        goto LABEL_79;
      }
      if (v42)
      {
        v36 = [(_UIDiffableDataSourceViewUpdater *)v39 _sectionIndexesToReloadForTableViewCompatibility:v42];
        objc_msgSend(v41, "reloadSections:withRowAnimation:", v36, -[_UIDiffableDataSourceViewUpdater tableViewRowAnimation](v39, "tableViewRowAnimation"));

        v34 = v40;
        v32 = (void *)v43;
        v33 = (void *)v44;
      }
      if (v32)
      {
        objc_msgSend(v41, "deleteSections:withRowAnimation:", v32, -[_UIDiffableDataSourceViewUpdater tableViewRowAnimation](v39, "tableViewRowAnimation", v35));
        v34 = v40;
        v33 = (void *)v44;
      }
      if (v33)
      {
        objc_msgSend(v41, "insertSections:withRowAnimation:", v33, -[_UIDiffableDataSourceViewUpdater tableViewRowAnimation](v39, "tableViewRowAnimation", v35));
        v34 = v40;
      }
      if (v34) {
        [v41 reconfigureRowsAtIndexPaths:v34];
      }
      if (v10) {
        objc_msgSend(v41, "reloadRowsAtIndexPaths:withRowAnimation:", v10, -[_UIDiffableDataSourceViewUpdater tableViewRowAnimation](v39, "tableViewRowAnimation", v35));
      }
      if (v11) {
        objc_msgSend(v41, "deleteRowsAtIndexPaths:withRowAnimation:", v11, -[_UIDiffableDataSourceViewUpdater tableViewRowAnimation](v39, "tableViewRowAnimation", v35));
      }
      if (v12) {
        objc_msgSend(v41, "insertRowsAtIndexPaths:withRowAnimation:", v12, -[_UIDiffableDataSourceViewUpdater tableViewRowAnimation](v39, "tableViewRowAnimation", v35));
      }
    }
    v31 = (void *)v42;
    v32 = (void *)v43;
    v33 = (void *)v44;
    v34 = v40;
  }
  else
  {

    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    uint64_t v12 = 0;
    v11 = 0;
    v10 = 0;
  }
LABEL_79:
}

- (int64_t)_performUpdateWithCollectionViewUpdateItems:(id)a3 dataSourceSnapshot:(id)a4 updateHandler:(id)a5 completion:(id)a6 viewPropertyAnimator:(id)a7 customAnimationsProvider:(id)a8 animated:(BOOL)a9
{
  id v16 = a3;
  id v54 = a4;
  id v17 = a5;
  id v18 = a6;
  v19 = v17;
  id v55 = v18;
  id v57 = a7;
  id v56 = a8;
  if (!v17)
  {
    long long v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceViewUpdater.m", 104, @"Invalid parameter not satisfying: %@", @"updateHandler" object file lineNumber description];
  }
  v20 = v16;
  if (!v16)
  {
    long long v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceViewUpdater.m", 105, @"Invalid parameter not satisfying: %@", @"updateItems" object file lineNumber description];
  }
  v21 = v54;
  if (!v54)
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceViewUpdater.m", 106, @"Invalid parameter not satisfying: %@", @"dataSourceSnapshot" object file lineNumber description];
  }
  if (!v57 && v56)
  {
    uint64_t v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2 object:self file:@"_UIDiffableDataSourceViewUpdater.m" lineNumber:108 description:@"An non-nil animator is required to use a custom animations provider"];
  }
  BOOL v22 = [(_UIDiffableDataSourceViewUpdater *)self hasPerformedInitialUpdate];
  [(_UIDiffableDataSourceViewUpdater *)self setHasPerformedInitialUpdate:1];
  [(_UIDiffableDataSourceViewUpdater *)self setDataSourceSnapshot:v54];
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  uint64_t v95 = 1;
  v23 = [(_UIDiffableDataSourceViewUpdater *)self collectionView];
  BOOL v24 = !v22;
  if (v23)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke;
    aBlock[3] = &unk_1E52E3968;
    id v25 = v17;
    id v91 = v25;
    aBlock[4] = self;
    id v26 = v20;
    id v90 = v26;
    id v27 = _Block_copy(aBlock);
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_2;
    v87[3] = &unk_1E52D9FE8;
    id v28 = v55;
    id v88 = v28;
    v29 = _Block_copy(v87);
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_3;
    v74[3] = &unk_1E52E45F0;
    v53 = v23;
    id v30 = v23;
    BOOL v31 = v24;
    id v32 = v30;
    id v75 = v30;
    id v79 = v25;
    v76 = self;
    id v77 = v26;
    v84 = &v92;
    id v80 = v28;
    BOOL v85 = a9;
    id v78 = v57;
    id v33 = v27;
    id v81 = v33;
    id v82 = v56;
    id v34 = v29;
    id v83 = v34;
    BOOL v86 = v31;
    [v32 _performDiffableUpdate:v74];
    int64_t v35 = v93[3];

    v36 = v91;
    v19 = v17;
    v21 = v54;
    v23 = v53;
  }
  else
  {
    v36 = [(_UIDiffableDataSourceViewUpdater *)self tableView];
    if (v36)
    {
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_5;
      v71[3] = &unk_1E52E3968;
      id v37 = v17;
      id v73 = v37;
      v71[4] = self;
      id v38 = v20;
      id v72 = v38;
      v39 = _Block_copy(v71);
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_6;
      v69[3] = &unk_1E52D9FE8;
      BOOL v40 = v24;
      id v41 = v55;
      id v70 = v41;
      uint64_t v42 = _Block_copy(v69);
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_7;
      v58[3] = &unk_1E52E4618;
      id v59 = v36;
      id v62 = v37;
      v60 = self;
      id v61 = v38;
      v66 = &v92;
      id v63 = v41;
      BOOL v67 = a9;
      id v43 = v39;
      id v64 = v43;
      id v44 = v42;
      id v65 = v44;
      BOOL v68 = v40;
      [v59 _performDiffableUpdate:v58];
      int64_t v35 = v93[3];

      v45 = v73;
      v23 = 0;
      v19 = v17;
      v21 = v54;
    }
    else
    {
      v45 = [(_UIDiffableDataSourceViewUpdater *)self updatesSink];
      if (v45)
      {
        long long v46 = [(_UIDiffableDataSourceViewUpdater *)self dataSourceSnapshot];
        LOBYTE(v52) = a9;
        [v45 _performUpdateWithCollectionViewUpdateItems:v20 dataSourceSnapshot:v46 updateHandler:v17 completion:v55 viewPropertyAnimator:v57 customAnimationsProvider:v56 animated:v52];
      }
      int64_t v35 = v93[3];
    }
  }
  _Block_object_dispose(&v92, 8);

  return v35;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (void)setHasPerformedInitialUpdate:(BOOL)a3
{
  self->_hasPerformedInitialUpdate = a3;
}

- (void)setDataSourceSnapshot:(id)a3
{
}

- (BOOL)hasPerformedInitialUpdate
{
  return self->_hasPerformedInitialUpdate;
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (void)setTableViewRowAnimation:(int64_t)a3
{
  self->_tableViewRowAnimation = a3;
}

- (_UIDiffableDataSourceViewUpdater)initWithUpdatesSink:(id)a3 collectionView:(id)a4 tableView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_UIDiffableDataSourceViewUpdater;
  v11 = [(_UIDiffableDataSourceViewUpdater *)&v18 init];
  uint64_t v12 = v11;
  if (v11)
  {
    if (v8)
    {
      uint64_t v13 = 0;
      uint64_t v14 = 32;
      uint64_t v15 = 24;
      id v16 = v8;
LABEL_8:
      *(Class *)((char *)&v11->super.isa + v15) = (Class)v13;
      objc_storeWeak((id *)((char *)&v11->super.isa + v14), v16);
      goto LABEL_9;
    }
    if (v9)
    {
      uint64_t v14 = 40;
      uint64_t v13 = 1;
      uint64_t v15 = 24;
      id v16 = v9;
      goto LABEL_8;
    }
    if (v10)
    {
      v11->_sinkKind = 2;
      uint64_t v14 = 56;
      uint64_t v13 = 100;
      uint64_t v15 = 16;
      id v16 = v10;
      goto LABEL_8;
    }
  }
LABEL_9:

  return v12;
}

- (_UIDiffableDataSourceViewUpdater)initWithCollectionView:(id)a3
{
  return [(_UIDiffableDataSourceViewUpdater *)self initWithUpdatesSink:0 collectionView:a3 tableView:0];
}

- (_UIDiffableDataSourceViewUpdater)initWithTableView:(id)a3
{
  return [(_UIDiffableDataSourceViewUpdater *)self initWithUpdatesSink:0 collectionView:0 tableView:a3];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_dataSourceSnapshot, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_updatesSink);
}

- (_UIDiffableDataSourceViewUpdater)initWithCollectionViewUpdatesSink:(id)a3
{
  return [(_UIDiffableDataSourceViewUpdater *)self initWithUpdatesSink:a3 collectionView:0 tableView:0];
}

- (BOOL)_doesExpectedUpdate:(id)a3 matchActualUpdates:(id)a4 allowingEmptyUpdates:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 count])
  {
    if ([v8 count] == 1)
    {
      id v9 = [v8 firstObject];
      char v10 = -[UICollectionViewUpdateItem isEqualToUpdate:](v9, v7);

      if (v10)
      {
LABEL_4:
        a5 = 1;
        goto LABEL_14;
      }
    }
    else if ([v8 count] == 2 && objc_msgSend(v7, "updateAction") == 3)
    {
      uint64_t v11 = [v8 indexOfObjectPassingTest:&__block_literal_global_107];
      uint64_t v12 = [v8 indexOfObjectPassingTest:&__block_literal_global_21];
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v13 = v12;
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v14 = [v8 objectAtIndexedSubscript:v11];
          uint64_t v15 = [v8 objectAtIndexedSubscript:v13];
          if (-[UICollectionViewUpdateItem _initialIndexPathEqualToUpdateItem:]((uint64_t)v14, v7)
            && (-[UICollectionViewUpdateItem _finalIndexPathEqualToUpdateItem:]((uint64_t)v15, v7) & 1) != 0)
          {

            goto LABEL_4;
          }
        }
      }
    }
    a5 = 0;
  }
LABEL_14:

  return a5;
}

- (void)_deleteAllItems
{
  [(_UIDiffableDataSourceViewUpdater *)self setHasPerformedInitialUpdate:1];
  v3 = [(_UIDiffableDataSourceViewUpdater *)self collectionView];
  v4 = v3;
  if (v3)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51___UIDiffableDataSourceViewUpdater__deleteAllItems__block_invoke;
    v17[3] = &unk_1E52D9F70;
    id v5 = v3;
    id v18 = v5;
    [v5 _performDiffableUpdate:v17];
    v6 = [v5 window];

    if (v6) {
      [v5 layoutIfNeeded];
    }
    id v7 = v18;
  }
  else
  {
    id v8 = [(_UIDiffableDataSourceViewUpdater *)self tableView];
    if (v8)
    {
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      uint64_t v14 = __51___UIDiffableDataSourceViewUpdater__deleteAllItems__block_invoke_2;
      uint64_t v15 = &unk_1E52D9F70;
      id v7 = v8;
      id v16 = v7;
      [v7 _performDiffableUpdate:&v12];
      id v9 = objc_msgSend(v7, "window", v12, v13, v14, v15);

      if (v9) {
        [v7 layoutIfNeeded];
      }
    }
    else
    {
      char v10 = [(_UIDiffableDataSourceViewUpdater *)self updatesSink];
      uint64_t v11 = v10;
      if (v10) {
        [v10 _deleteAllItems];
      }

      id v7 = 0;
    }
  }
}

- (id)targetView
{
  if ([(_UIDiffableDataSourceViewUpdater *)self sinkKind] == 2)
  {
    v3 = [(_UIDiffableDataSourceViewUpdater *)self tableView];
  }
  else if ([(_UIDiffableDataSourceViewUpdater *)self sinkKind] == 1)
  {
    v3 = [(_UIDiffableDataSourceViewUpdater *)self collectionView];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_performMoveUpdate:(id)a3 onCollectionView:(id)a4
{
  id v12 = a4;
  id v5 = a3;
  v6 = v5;
  if (v5 && v5[6] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v5[1];
    uint64_t v8 = v5[3];

    [v12 moveSection:v7 toSection:v8];
    id v9 = v12;
  }
  else
  {
    uint64_t v10 = [v5 indexPathBeforeUpdate];
    uint64_t v11 = [v6 indexPathAfterUpdate];

    [v12 moveItemAtIndexPath:v10 toIndexPath:v11];
    id v9 = (void *)v10;
  }
}

- (id)_sectionIndexesToReloadForTableViewCompatibility:(id)a3
{
  id v4 = a3;
  if ((dyld_program_sdk_at_least() & 1) != 0
    || ([(_UIDiffableDataSourceViewUpdater *)self dataSourceSnapshot],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 numberOfSections],
        v5,
        !v6))
  {
    id v7 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)_performMoveUpdate:(id)a3 onTableView:(id)a4
{
  id v12 = a4;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5 && v5[6] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v5[1];
    uint64_t v8 = v5[3];

    [v12 moveSection:v7 toSection:v8];
    id v9 = v12;
  }
  else
  {
    uint64_t v10 = [v5 indexPathBeforeUpdate];
    uint64_t v11 = [v6 indexPathAfterUpdate];

    [v12 moveRowAtIndexPath:v10 toIndexPath:v11];
    id v9 = (void *)v10;
  }
}

- (int64_t)tableViewRowAnimation
{
  return self->_tableViewRowAnimation;
}

- (int64_t)sinkKind
{
  return self->_sinkKind;
}

- (void)setSinkKind:(int64_t)a3
{
  self->_sinkKind = a3;
}

- (_UICollectionViewUpdateItemApplying)updatesSink
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updatesSink);
  return (_UICollectionViewUpdateItemApplying *)WeakRetained;
}

- (void)setUpdatesSink:(id)a3
{
}

- (void)setCollectionView:(id)a3
{
}

- (_UICollectionDataSourceSnapshotTranslating)dataSourceSnapshot
{
  return self->_dataSourceSnapshot;
}

- (void)setTableView:(id)a3
{
}

@end