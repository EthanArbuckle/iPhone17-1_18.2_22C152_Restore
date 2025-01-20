@interface ICCoreDataDataSource
- (BOOL)needsReindexWithCollectionDifference:(id)a3 controller:(id)a4 identifiersToReload:(id)a5;
- (BOOL)suspendsUpdates;
- (ICCoreDataDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 indexer:(id)a5;
- (ICCoreDataIndexer)indexer;
- (ICSelectorDelayer)reindexDelayer;
- (NSDate)lastReindexParentModificationDate;
- (NSManagedObjectContext)applySnapshotLegacyManagedObjectContext;
- (NSManagedObjectContext)applySnapshotModernManagedObjectContext;
- (OS_dispatch_queue)applySnapshotCompletionQueue;
- (OS_dispatch_queue)expansionStateCompletionQueue;
- (id)firstRelevantItemIdentifier;
- (id)nextRelevantItemIdentifierAfter:(id)a3;
- (unint64_t)autoExpandMode;
- (void)applySnapshotAnimated:(BOOL)a3 dataRenderedBlock:(id)a4;
- (void)collapseItemsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)expandItemsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)indexer:(id)a3 didChangeContentWithDifference:(id)a4 controller:(id)a5;
- (void)managedObjectContextUpdaterDidMerge:(id)a3;
- (void)noteLockManagerDidToggleLock:(id)a3;
- (void)performBlockSuspendingUpdates:(id)a3 andApplySnapshotAnimated:(BOOL)a4;
- (void)reindexAndApplySnapshot;
- (void)reindexDataAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5;
- (void)reloadDataAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5;
- (void)setApplySnapshotLegacyManagedObjectContext:(id)a3;
- (void)setApplySnapshotModernManagedObjectContext:(id)a3;
- (void)setAutoExpandMode:(unint64_t)a3;
- (void)setExpanded:(BOOL)a3 itemIdentifiers:(id)a4 completion:(id)a5;
- (void)setIndexer:(id)a3;
- (void)setLastReindexParentModificationDate:(id)a3;
- (void)setSuspendsUpdates:(BOOL)a3;
@end

@implementation ICCoreDataDataSource

- (ICCoreDataIndexer)indexer
{
  return self->_indexer;
}

void __92__ICCoreDataDataSource_needsReindexWithCollectionDifference_controller_identifiersToReload___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v7 = [v6 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 object];
    int v9 = objc_msgSend(v8, "ic_isModernFolderType");

    if (v9)
    {
      v10 = [*(id *)(a1 + 32) managedObjectContext];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __92__ICCoreDataDataSource_needsReindexWithCollectionDifference_controller_identifiersToReload___block_invoke_2;
      v24 = &unk_1E5FDA508;
      id v25 = *(id *)(a1 + 32);
      id v11 = v6;
      uint64_t v12 = *(void *)(a1 + 40);
      id v26 = v11;
      uint64_t v27 = v12;
      uint64_t v28 = *(void *)(a1 + 56);
      [v10 performBlockAndWait:&v21];
    }
  }
  else
  {
  }
  uint64_t v13 = objc_msgSend(v6, "index", v21, v22, v23, v24);
  if (v13 == [v6 associatedIndex])
  {
    v14 = [*(id *)(a1 + 40) collectionViewDiffableDataSource];
    v15 = [v14 snapshot];
    v16 = [v15 itemIdentifiers];
    v17 = [v6 object];
    int v18 = [v16 containsObject:v17];

    if (v18)
    {
      v19 = *(void **)(a1 + 48);
      v20 = [v6 object];
      [v19 addObject:v20];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

void __92__ICCoreDataDataSource_needsReindexWithCollectionDifference_controller_identifiersToReload___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  v3 = [*(id *)(a1 + 40) object];
  objc_msgSend(v2, "ic_existingObjectWithID:", v3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [v9 parentModificationDate];
  v5 = [*(id *)(a1 + 48) lastReindexParentModificationDate];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 > 0.0)
  {
    v8 = [v9 parentModificationDate];
    [*(id *)(a1 + 48) setLastReindexParentModificationDate:v8];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (NSDate)lastReindexParentModificationDate
{
  return self->_lastReindexParentModificationDate;
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_38(uint64_t a1)
{
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_35(uint64_t a1)
{
}

uint64_t __78__ICCoreDataDataSource_reloadDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) applySnapshotAnimated:*(unsigned __int8 *)(a1 + 48) dataRenderedBlock:*(void *)(a1 + 40)];
}

uint64_t __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v20;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * v7);
          id v9 = [WeakRetained collectionViewDiffableDataSource];
          v10 = [v9 indexPathForItemIdentifier:v8];

          if (v10)
          {
            id v11 = [WeakRetained collectionView];
            [v11 selectItemAtIndexPath:v10 animated:0 scrollPosition:0];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v5);
    }

    uint64_t v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v18 = 0;
      _os_log_impl(&dword_1B08EB000, v12, OS_LOG_TYPE_INFO, "Snaphot(s) fully applied", v18, 2u);
    }

    uint64_t v13 = *(void *)(a1 + 48);
    if (v13) {
      (*(void (**)(void))(v13 + 16))();
    }
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"ICDataSourceDataUpdateDidRenderNotification" object:WeakRetained];

    v15 = *(id *)(a1 + 40);
    v16 = v15;
    os_signpost_id_t v17 = *(void *)(a1 + 64);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)int v18 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B08EB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "com.apple.notes.datasource.applySnapshots", "", v18, 2u);
    }
  }
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_40(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICDataSourceDataDidUpdateNotification" object:*(void *)(a1 + 32)];
}

- (ICCoreDataDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 indexer:(id)a5
{
  id v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)ICCoreDataDataSource;
  v10 = [(ICDataSource *)&v28 initWithCollectionView:a3 cellProvider:a4];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_indexer, a5);
    [(ICCoreDataIndexer *)v11->_indexer setDelegate:v11];
    uint64_t v12 = [v9 legacyManagedObjectContext];
    applySnapshotLegacyManagedObjectContext = v11->_applySnapshotLegacyManagedObjectContext;
    v11->_applySnapshotLegacyManagedObjectContext = (NSManagedObjectContext *)v12;

    uint64_t v14 = [v9 modernManagedObjectContext];
    applySnapshotModernManagedObjectContext = v11->_applySnapshotModernManagedObjectContext;
    v11->_applySnapshotModernManagedObjectContext = (NSManagedObjectContext *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F837C8]) initWithTarget:v11 selector:sel_reindexAndApplySnapshot delay:1 waitToFireUntilRequestsStop:0 callOnMainThread:0.1];
    reindexDelayer = v11->_reindexDelayer;
    v11->_reindexDelayer = (ICSelectorDelayer *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastReindexParentModificationDate = v11->_lastReindexParentModificationDate;
    v11->_lastReindexParentModificationDate = (NSDate *)v18;

    long long v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.notes.expansion-state-completion-queue", v21);
    expansionStateCompletionQueue = v11->_expansionStateCompletionQueue;
    v11->_expansionStateCompletionQueue = (OS_dispatch_queue *)v22;

    dispatch_queue_t v24 = dispatch_queue_create("com.apple.notes.apply-snapshot-completion-queue", v21);
    applySnapshotCompletionQueue = v11->_applySnapshotCompletionQueue;
    v11->_applySnapshotCompletionQueue = (OS_dispatch_queue *)v24;

    id v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v11 selector:sel_managedObjectContextUpdaterDidMerge_ name:*MEMORY[0x1E4F83690] object:0];
  }
  return v11;
}

- (void)setApplySnapshotModernManagedObjectContext:(id)a3
{
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_2_36(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v33 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        uint64_t v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:v6];
        if (v7)
        {
          switch([*(id *)(a1 + 56) autoExpandMode])
          {
            case 0:
              uint64_t v8 = +[ICExpansionState sharedExpansionState];
              id v9 = [*(id *)(a1 + 56) indexer];
              v10 = [v9 expansionStateContext];
              id v11 = [v8 expandedObjectIDsInContext:v10];

              goto LABEL_14;
            case 1:
              uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
              uint64_t v8 = [*(id *)(a1 + 56) collectionViewDiffableDataSource];
              uint64_t v13 = [v8 snapshot];
              uint64_t v14 = [v13 sectionIdentifiers];
              id v11 = [v12 setWithArray:v14];

              goto LABEL_14;
            case 2:
              v15 = [v7 items];
              uint64_t v8 = (void *)[v15 mutableCopy];

              uint64_t v16 = [*(id *)(a1 + 56) collectionViewDiffableDataSource];
              os_signpost_id_t v17 = [v16 snapshot];
              uint64_t v18 = [v17 sectionIdentifiers];
              [v8 removeObjectsInArray:v18];

              goto LABEL_13;
            case 3:
              uint64_t v16 = [v7 items];
              uint64_t v8 = (void *)[v16 mutableCopy];
LABEL_13:

              id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
LABEL_14:

              if (v11)
              {
                v30[0] = MEMORY[0x1E4F143A8];
                v30[1] = 3221225472;
                v30[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_3;
                v30[3] = &unk_1E5FDA580;
                id v19 = v7;
                id v31 = v19;
                long long v20 = [v11 objectsPassingTest:v30];
                long long v21 = [v20 allObjects];
                [v19 expandItems:v21];
              }
              break;
            default:
              break;
          }
          dispatch_queue_t v22 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = [v7 items];
            uint64_t v24 = [v23 count];
            *(_DWORD *)buf = 134217984;
            uint64_t v37 = v24;
            _os_log_impl(&dword_1B08EB000, v22, OS_LOG_TYPE_INFO, "Applying section snapshot with %ld items", buf, 0xCu);
          }
          id v25 = [*(id *)(a1 + 56) collectionViewDiffableDataSource];
          uint64_t v26 = *(unsigned __int8 *)(a1 + 64);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_38;
          v28[3] = &unk_1E5FD8DF0;
          id v29 = *(id *)(a1 + 40);
          [v25 applySnapshot:v7 toSection:v6 animatingDifferences:v26 completion:v28];
        }
        else
        {
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v3);
  }
}

- (unint64_t)autoExpandMode
{
  return self->_autoExpandMode;
}

- (id)firstRelevantItemIdentifier
{
  uint64_t v2 = [(ICCoreDataDataSource *)self indexer];
  uint64_t v3 = [v2 firstRelevantItemIdentifier];

  return v3;
}

- (void)reloadDataAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(ICCoreDataDataSource *)self indexer];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__ICCoreDataDataSource_reloadDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke;
  v13[3] = &unk_1E5FDA490;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a3;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 reloadData:v13];
}

void __78__ICCoreDataDataSource_reloadDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) indexer];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)applySnapshotAnimated:(BOOL)a3 dataRenderedBlock:(id)a4
{
  BOOL v66 = a3;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICCoreDataDataSource applySnapshotAnimated:dataRenderedBlock:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v7 = [(ICDataSource *)self collectionView];
  id v8 = [v7 indexPathsForSelectedItems];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v104 objects:v112 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v105;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v105 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v104 + 1) + 8 * i);
        uint64_t v13 = [(ICDataSource *)self collectionViewDiffableDataSource];
        id v14 = [v13 itemIdentifierForIndexPath:v12];

        objc_msgSend(v6, "ic_addNonNilObject:", v14);
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v104 objects:v112 count:16];
    }
    while (v9);
  }

  id v15 = os_log_create("com.apple.notes", "PointsOfInterest");
  BOOL v16 = (char *)os_signpost_id_generate(v15);
  os_signpost_id_t v17 = v15;
  uint64_t v18 = v17;
  if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v18, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v16, "com.apple.notes.datasource.applySnapshots", "", buf, 2u);
  }

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke;
  aBlock[3] = &unk_1E5FDA558;
  objc_copyWeak(v102, &location);
  id v61 = v6;
  id v99 = v61;
  id v59 = v5;
  id v101 = v59;
  v63 = v18;
  v100 = v63;
  v102[1] = v16;
  v67 = (void (**)(void))_Block_copy(aBlock);
  id v19 = [(ICDataSource *)self sectionTypes];

  if (v19)
  {
    v70 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v59, v61, v63, v102);
    long long v20 = [MEMORY[0x1E4F1CA60] dictionary];
    v71 = [MEMORY[0x1E4F1CA48] array];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v21 = [(ICDataSource *)self sectionTypes];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v94 objects:v111 count:16];
    if (v22)
    {
      id obj = v21;
      uint64_t v69 = *(void *)v95;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v95 != v69) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void **)(*((void *)&v94 + 1) + 8 * j);
          uint64_t v25 = [v24 unsignedIntegerValue];
          uint64_t v26 = [(ICCoreDataDataSource *)self indexer];
          uint64_t v27 = [(ICCoreDataDataSource *)self applySnapshotLegacyManagedObjectContext];
          objc_super v28 = [(ICCoreDataDataSource *)self applySnapshotModernManagedObjectContext];
          id v29 = [v26 sectionSnapshotsForSectionType:v25 legacyManagedObjectContext:v27 modernManagedObjectContext:v28];

          [v70 addEntriesFromDictionary:v29];
          v30 = [(ICCoreDataDataSource *)self indexer];
          id v31 = [v30 sectionIdentifiersForSectionType:v25];

          [v71 addObjectsFromArray:v31];
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v32 = v31;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v90 objects:v110 count:16];
          if (v33)
          {
            uint64_t v34 = *(void *)v91;
            do
            {
              for (uint64_t k = 0; k != v33; ++k)
              {
                if (*(void *)v91 != v34) {
                  objc_enumerationMutation(v32);
                }
                [v20 setObject:v24 forKeyedSubscript:*(void *)(*((void *)&v90 + 1) + 8 * k)];
              }
              uint64_t v33 = [v32 countByEnumeratingWithState:&v90 objects:v110 count:16];
            }
            while (v33);
          }
        }
        long long v21 = obj;
        uint64_t v22 = [obj countByEnumeratingWithState:&v94 objects:v111 count:16];
      }
      while (v22);
    }

    v36 = dispatch_group_create();
    uint64_t v37 = [(ICDataSource *)self collectionViewDiffableDataSource];
    v38 = [v37 snapshot];

    dispatch_group_enter(v36);
    objc_msgSend(v38, "ic_updateWithSectionIdentifiers:", v71);
    uint64_t v39 = os_log_create("com.apple.notes", "UI");
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
    if (v66)
    {
      if (v40)
      {
        uint64_t v41 = [v38 numberOfSections];
        *(_DWORD *)buf = 134217984;
        uint64_t v109 = v41;
        _os_log_impl(&dword_1B08EB000, v39, OS_LOG_TYPE_INFO, "Applying top-level snapshot animated with %ld sections", buf, 0xCu);
      }

      v42 = [(ICDataSource *)self collectionViewDiffableDataSource];
      v43 = v89;
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_34;
      v89[3] = &unk_1E5FD8DF0;
      v89[4] = v36;
      [v42 applySnapshot:v38 animatingDifferences:1 completion:v89];
    }
    else
    {
      if (v40)
      {
        uint64_t v50 = [v38 numberOfSections];
        *(_DWORD *)buf = 134217984;
        uint64_t v109 = v50;
        _os_log_impl(&dword_1B08EB000, v39, OS_LOG_TYPE_INFO, "Applying top-level snapshot using reloadData with %ld sections", buf, 0xCu);
      }

      v42 = [(ICDataSource *)self collectionViewDiffableDataSource];
      v43 = v88;
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_35;
      v88[3] = &unk_1E5FD8DF0;
      v88[4] = v36;
      [v42 applySnapshotUsingReloadData:v38 completion:v88];
    }

    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_2_36;
    v82[3] = &unk_1E5FDA5A8;
    id v51 = v71;
    id v83 = v51;
    v52 = v36;
    v84 = v52;
    id v48 = v70;
    id v85 = v48;
    v86 = self;
    BOOL v87 = v66;
    v53 = (void (**)(void))_Block_copy(v82);
    v54 = os_log_create("com.apple.notes", "UI");
    BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_INFO);
    if (v66)
    {
      if (v55)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B08EB000, v54, OS_LOG_TYPE_INFO, "Applying section snapshots", buf, 2u);
      }

      v53[2](v53);
    }
    else
    {
      if (v55)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B08EB000, v54, OS_LOG_TYPE_INFO, "Applying section snapshots using _performBatchApplyUsingReloadData", buf, 2u);
      }

      v56 = [(ICDataSource *)self collectionViewDiffableDataSource];
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_39;
      v80[3] = &unk_1E5FD9320;
      v81 = v53;
      [v56 _performBatchApplyUsingReloadData:v80];
    }
    uint64_t v75 = MEMORY[0x1E4F143A8];
    uint64_t v76 = 3221225472;
    v77 = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_40;
    v78 = &unk_1E5FD8DF0;
    v79 = self;
    performBlockOnMainThread();
    v57 = [(ICCoreDataDataSource *)self applySnapshotCompletionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_2_41;
    block[3] = &unk_1E5FD8F48;
    v73 = v52;
    v74 = v67;
    v58 = v52;
    dispatch_async(v57, block);
  }
  else
  {
    v44 = [(ICDataSource *)self collectionView];

    if (!v44)
    {
      v67[2]();
      goto LABEL_46;
    }
    v45 = [(ICCoreDataDataSource *)self indexer];
    v46 = [(ICCoreDataDataSource *)self applySnapshotLegacyManagedObjectContext];
    v47 = [(ICCoreDataDataSource *)self applySnapshotModernManagedObjectContext];
    id v48 = (id)[v45 newSnapshotFromIndexWithLegacyManagedObjectContext:v46 modernManagedObjectContext:v47];

    v49 = [(ICDataSource *)self collectionViewDiffableDataSource];
    [v49 applySnapshot:v48 animatingDifferences:v66 completion:v67];

    performBlockOnMainThread();
  }

LABEL_46:
  objc_destroyWeak(v65);
  objc_destroyWeak(&location);
}

- (NSManagedObjectContext)applySnapshotModernManagedObjectContext
{
  return self->_applySnapshotModernManagedObjectContext;
}

- (NSManagedObjectContext)applySnapshotLegacyManagedObjectContext
{
  return self->_applySnapshotLegacyManagedObjectContext;
}

- (OS_dispatch_queue)applySnapshotCompletionQueue
{
  return self->_applySnapshotCompletionQueue;
}

uint64_t __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_2_41(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke(id *a1)
{
  objc_copyWeak(v5, a1 + 7);
  id v2 = a1[4];
  id v4 = a1[6];
  id v3 = a1[5];
  v5[1] = a1[8];
  performBlockOnMainThreadAndWait();

  objc_destroyWeak(v5);
}

void __78__ICCoreDataDataSource_reloadDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke(uint64_t a1)
{
  id v3 = *(id *)(a1 + 40);
  performBlockOnMainThread();
  id v2 = *(id *)(a1 + 48);
  performBlockOnMainThreadAndWait();
}

- (void)indexer:(id)a3 didChangeContentWithDifference:(id)a4 controller:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (![(ICCoreDataDataSource *)self suspendsUpdates]
    && ![(ICDataSource *)self isTogglingLock])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    if ([(ICCoreDataDataSource *)self needsReindexWithCollectionDifference:v7 controller:v8 identifiersToReload:v9])
    {
      uint64_t v10 = [(ICCoreDataDataSource *)self reindexDelayer];
      [v10 requestFire];
    }
    else if ([v9 count])
    {
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__ICCoreDataDataSource_indexer_didChangeContentWithDifference_controller___block_invoke;
      block[3] = &unk_1E5FDA4E0;
      objc_copyWeak(&v13, &location);
      id v12 = v9;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)suspendsUpdates
{
  return self->_suspendsUpdates;
}

- (BOOL)needsReindexWithCollectionDifference:(id)a3 controller:(id)a4 identifiersToReload:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v11 = [v8 insertions];
  id v12 = [v8 removals];
  id v13 = [v11 arrayByAddingObjectsFromArray:v12];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__ICCoreDataDataSource_needsReindexWithCollectionDifference_controller_identifiersToReload___block_invoke;
  v17[3] = &unk_1E5FDA530;
  id v14 = v9;
  id v18 = v14;
  id v19 = self;
  long long v21 = &v22;
  id v15 = v10;
  id v20 = v15;
  [v13 enumerateObjectsUsingBlock:v17];
  LOBYTE(v10) = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return (char)v10;
}

- (void)setAutoExpandMode:(unint64_t)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (self->_autoExpandMode != a3)
  {
    self->_autoExpandMode = a3;
    id v5 = [(ICCoreDataDataSource *)self indexer];
    uint64_t v6 = [(ICCoreDataDataSource *)self applySnapshotLegacyManagedObjectContext];
    id v7 = [(ICCoreDataDataSource *)self applySnapshotModernManagedObjectContext];
    id v8 = (void *)[v5 newSnapshotFromIndexWithLegacyManagedObjectContext:v6 modernManagedObjectContext:v7];
    id v9 = [v8 itemIdentifiers];
    uint64_t v33 = (void *)[v9 mutableCopy];

    if (!a3)
    {
      id v10 = +[ICExpansionState sharedExpansionState];
      id v11 = [(ICCoreDataDataSource *)self indexer];
      id v12 = [v11 expansionStateContext];
      id v13 = [v10 expandedObjectIDsInContext:v12];

      id v14 = [v13 allObjects];
      [v33 removeObjectsInArray:v14];
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v15 = [(ICDataSource *)self collectionViewDiffableDataSource];
    BOOL v16 = [v15 snapshot];
    os_signpost_id_t v17 = [v16 sectionIdentifiers];

    id v18 = v17;
    uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v24 = [(ICDataSource *)self collectionViewDiffableDataSource];
          char v25 = [v24 snapshotForSection:v23];

          uint64_t v26 = (void *)MEMORY[0x1E4F1CA80];
          uint64_t v27 = [v25 items];
          objc_super v28 = [v26 setWithArray:v27];

          switch(a3)
          {
            case 0uLL:
              id v29 = [MEMORY[0x1E4F1CAD0] setWithArray:v33];
              [v28 intersectSet:v29];

              v30 = [v28 allObjects];
              [v25 collapseItems:v30];
              goto LABEL_15;
            case 1uLL:
              id v31 = [MEMORY[0x1E4F1CAD0] setWithArray:v33];
              [v28 minusSet:v31];
              goto LABEL_13;
            case 2uLL:
              id v31 = [MEMORY[0x1E4F1CAD0] setWithArray:v33];
              [v28 intersectSet:v31];
LABEL_13:

              goto LABEL_14;
            case 3uLL:
LABEL_14:
              v30 = [v28 allObjects];
              [v25 expandItems:v30];
LABEL_15:

              break;
            default:
              break;
          }
          id v32 = [(ICDataSource *)self collectionViewDiffableDataSource];
          [v32 applySnapshot:v25 toSection:v23 animatingDifferences:1];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v20);
    }
  }
}

- (void)reindexDataAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(ICCoreDataDataSource *)self suspendsUpdates])
  {
    id v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ICCoreDataDataSource reindexDataAnimated:dataIndexedBlock:dataRenderedBlock:](v10);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    id v11 = [(ICCoreDataDataSource *)self indexer];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__ICCoreDataDataSource_reindexDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke;
    v12[3] = &unk_1E5FDA4B8;
    id v13 = v8;
    objc_copyWeak(&v15, &location);
    BOOL v16 = a3;
    id v14 = v9;
    [v11 indexObjectsWithCompletion:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __79__ICCoreDataDataSource_reindexDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __79__ICCoreDataDataSource_reindexDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke_2;
  v2[3] = &unk_1E5FDA4B8;
  id v3 = *(id *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  char v6 = *(unsigned char *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  dispatch_sync(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v5);
}

void __79__ICCoreDataDataSource_reindexDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v4 = [WeakRetained indexer];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  [v5 applySnapshotAnimated:*(unsigned __int8 *)(a1 + 56) dataRenderedBlock:*(void *)(a1 + 40)];
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCoreDataDataSource *)self indexer];
  char v6 = [v5 nextRelevantItemIdentifierAfter:v4];

  return v6;
}

- (void)expandItemsWithIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)collapseItemsWithIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)performBlockSuspendingUpdates:(id)a3 andApplySnapshotAnimated:(BOOL)a4
{
  id v5 = (void (**)(void))a3;
  [(ICCoreDataDataSource *)self setSuspendsUpdates:1];
  v5[2](v5);

  char v6 = [(ICCoreDataDataSource *)self reindexDelayer];
  [v6 cancelPreviousFireRequests];

  performBlockOnMainThread();
}

uint64_t __79__ICCoreDataDataSource_performBlockSuspendingUpdates_andApplySnapshotAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__ICCoreDataDataSource_performBlockSuspendingUpdates_andApplySnapshotAnimated___block_invoke_2;
  v3[3] = &unk_1E5FD8DF0;
  v3[4] = v1;
  return [v1 applySnapshotAnimated:1 dataRenderedBlock:v3];
}

uint64_t __79__ICCoreDataDataSource_performBlockSuspendingUpdates_andApplySnapshotAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSuspendsUpdates:0];
}

- (void)managedObjectContextUpdaterDidMerge:(id)a3
{
  id v4 = [(ICDataSource *)self collectionView];
  id v5 = [v4 window];
  BOOL v6 = v5 != 0;

  [(ICDataSource *)self reloadDataAnimated:v6];
}

uint64_t __74__ICCoreDataDataSource_indexer_didChangeContentWithDifference_controller___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v13 = WeakRetained;
    id v5 = [WeakRetained collectionViewDiffableDataSource];
    BOOL v6 = [v5 snapshot];
    id v7 = [v6 itemIdentifiers];
    id v8 = [v4 setWithArray:v7];
    [v3 intersectSet:v8];

    if ([*(id *)(a1 + 32) count])
    {
      id v9 = [v13 collectionViewDiffableDataSource];
      id v10 = [v9 snapshot];
      id v11 = [*(id *)(a1 + 32) allObjects];
      [v10 reloadItemsWithIdentifiers:v11];
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (void)noteLockManagerDidToggleLock:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICCoreDataDataSource;
  [(ICDataSource *)&v4 noteLockManagerDidToggleLock:a3];
  [(ICCoreDataDataSource *)self reindexAndApplySnapshot];
}

- (void)reindexAndApplySnapshot
{
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_34(uint64_t a1)
{
}

BOOL __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsItem:v3])
  {
    objc_super v4 = [*(id *)(a1 + 32) childrenOfParent:v3];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_3_42(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICDataSourceDataDidUpdateNotification" object:*(void *)(a1 + 32)];
}

- (void)setExpanded:(BOOL)a3 itemIdentifiers:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v34 = a4;
  id v29 = a5;
  id v8 = dispatch_group_create();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v9 = [(ICDataSource *)self collectionViewDiffableDataSource];
  id v10 = [v9 snapshot];
  id v11 = [v10 sectionIdentifiers];

  id obj = v11;
  uint64_t v35 = [v11 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v35)
  {
    uint64_t v31 = *(void *)v50;
    id v32 = self;
    uint64_t v33 = v8;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v50 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        dispatch_group_enter(v8);
        id v14 = [(ICDataSource *)self collectionViewDiffableDataSource];
        id v15 = [v14 snapshotForSection:v13];

        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke;
        v47[3] = &unk_1E5FDA5D0;
        id v16 = v15;
        id v48 = v16;
        os_signpost_id_t v17 = objc_msgSend(v34, "ic_objectsPassingTest:", v47);
        id v18 = +[ICExpansionState sharedExpansionState];
        uint64_t v19 = [(ICCoreDataDataSource *)self indexer];
        uint64_t v20 = [v19 expansionStateContext];

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v21 = v17;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v44;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v44 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v43 + 1) + 8 * j);
              if (v6) {
                [v18 expandItemIdentifier:v26 context:v20];
              }
              else {
                [v18 collapseItemIdentifier:v26 context:v20];
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v43 objects:v53 count:16];
          }
          while (v23);
        }

        if (v6) {
          [v16 expandItems:v21];
        }
        else {
          [v16 collapseItems:v21];
        }
        self = v32;
        id v8 = v33;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke_2;
        block[3] = &unk_1E5FDA5F8;
        void block[4] = v32;
        id v40 = v16;
        uint64_t v41 = v13;
        v42 = v33;
        id v27 = v16;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v35);
  }

  if (v29)
  {
    objc_super v28 = [(ICCoreDataDataSource *)self expansionStateCompletionQueue];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke_4;
    v36[3] = &unk_1E5FD8F48;
    long long v37 = v8;
    id v38 = v29;
    dispatch_async(v28, v36);
  }
}

uint64_t __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_super v4 = [v2 items];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

void __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionViewDiffableDataSource];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke_3;
  v5[3] = &unk_1E5FD8DF0;
  id v6 = *(id *)(a1 + 56);
  [v2 applySnapshot:v3 toSection:v4 animatingDifferences:1 completion:v5];
}

void __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke_3(uint64_t a1)
{
}

void __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke_4(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = MEMORY[0x1E4F14428];
  dispatch_async(v3, v2);
}

- (void)setIndexer:(id)a3
{
}

- (void)setApplySnapshotLegacyManagedObjectContext:(id)a3
{
}

- (ICSelectorDelayer)reindexDelayer
{
  return self->_reindexDelayer;
}

- (void)setLastReindexParentModificationDate:(id)a3
{
}

- (OS_dispatch_queue)expansionStateCompletionQueue
{
  return self->_expansionStateCompletionQueue;
}

- (void)setSuspendsUpdates:(BOOL)a3
{
  self->_suspendsUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applySnapshotCompletionQueue, 0);
  objc_storeStrong((id *)&self->_expansionStateCompletionQueue, 0);
  objc_storeStrong((id *)&self->_lastReindexParentModificationDate, 0);
  objc_storeStrong((id *)&self->_reindexDelayer, 0);
  objc_storeStrong((id *)&self->_applySnapshotModernManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_applySnapshotLegacyManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
}

- (void)reindexDataAnimated:(os_log_t)log dataIndexedBlock:dataRenderedBlock:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Suppressing automatic reindex due to performBlockSuspendingUpdates usage.", v1, 2u);
}

@end