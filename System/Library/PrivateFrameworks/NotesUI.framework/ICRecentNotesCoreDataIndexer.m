@interface ICRecentNotesCoreDataIndexer
- (BOOL)checklistsOnly;
- (BOOL)nonPasswordProtectedOnly;
- (BOOL)passwordProtectedOnly;
- (BOOL)pinnedOnly;
- (ICRecentNotesCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4;
- (NSArray)sortedSectionIdentifiers;
- (NSFetchedResultsController)legacyNoteFetchedResultsController;
- (NSFetchedResultsController)modernNoteFetchedResultsController;
- (NSMutableDictionary)sectionIdentifiersToManagedObjectIDs;
- (OS_dispatch_queue)indexAccessQueue;
- (id)activeFetchedResultsControllers;
- (id)firstRelevantItemIdentifier;
- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5;
- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4;
- (id)nextRelevantItemIdentifierAfter:(id)a3;
- (id)sectionIdentifierForHeaderInSection:(int64_t)a3;
- (id)sectionIdentifiersForSectionType:(unint64_t)a3;
- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5;
- (int64_t)sortType;
- (unint64_t)maximumNumberOfNotesPerAccount;
- (void)setChecklistsOnly:(BOOL)a3;
- (void)setMaximumNumberOfNotesPerAccount:(unint64_t)a3;
- (void)setNonPasswordProtectedOnly:(BOOL)a3;
- (void)setPasswordProtectedOnly:(BOOL)a3;
- (void)setPinnedOnly:(BOOL)a3;
- (void)setShouldIncludeOutlineParentItems:(BOOL)a3;
- (void)setSortType:(int64_t)a3;
- (void)willIndex;
@end

@implementation ICRecentNotesCoreDataIndexer

- (ICRecentNotesCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ICRecentNotesCoreDataIndexer;
  v4 = [(ICCoreDataIndexer *)&v6 initWithLegacyManagedObjectContext:a3 modernManagedObjectContext:a4];
  if (v4) {
    -[ICRecentNotesCoreDataIndexer setSortType:](v4, "setSortType:", [MEMORY[0x1E4F83790] currentNoteListSortType]);
  }
  return v4;
}

- (void)setShouldIncludeOutlineParentItems:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[ICRecentNotesCoreDataIndexer setShouldIncludeOutlineParentItems:](v5);
  }

  v6.receiver = self;
  v6.super_class = (Class)ICRecentNotesCoreDataIndexer;
  [(ICCoreDataIndexer *)&v6 setShouldIncludeOutlineParentItems:v3];
}

- (void)setMaximumNumberOfNotesPerAccount:(unint64_t)a3
{
  self->_maximumNumberOfNotesPerAccount = a3;
  v5 = [(ICRecentNotesCoreDataIndexer *)self legacyNoteFetchedResultsController];
  objc_super v6 = [v5 fetchRequest];
  [v6 setFetchBatchSize:a3];

  id v8 = [(ICRecentNotesCoreDataIndexer *)self modernNoteFetchedResultsController];
  v7 = [v8 fetchRequest];
  [v7 setFetchBatchSize:a3];
}

- (void)setChecklistsOnly:(BOOL)a3
{
  if (self->_checklistsOnly != a3)
  {
    self->_checklistsOnly = a3;
    legacyNoteFetchedResultsController = self->_legacyNoteFetchedResultsController;
    self->_legacyNoteFetchedResultsController = 0;

    modernNoteFetchedResultsController = self->_modernNoteFetchedResultsController;
    self->_modernNoteFetchedResultsController = 0;
  }
}

- (void)setPinnedOnly:(BOOL)a3
{
  if (self->_pinnedOnly != a3)
  {
    self->_pinnedOnly = a3;
    legacyNoteFetchedResultsController = self->_legacyNoteFetchedResultsController;
    self->_legacyNoteFetchedResultsController = 0;

    modernNoteFetchedResultsController = self->_modernNoteFetchedResultsController;
    self->_modernNoteFetchedResultsController = 0;
  }
}

- (void)setPasswordProtectedOnly:(BOOL)a3
{
  if (self->_passwordProtectedOnly != a3)
  {
    self->_passwordProtectedOnly = a3;
    legacyNoteFetchedResultsController = self->_legacyNoteFetchedResultsController;
    self->_legacyNoteFetchedResultsController = 0;

    modernNoteFetchedResultsController = self->_modernNoteFetchedResultsController;
    self->_modernNoteFetchedResultsController = 0;
  }
}

- (void)setNonPasswordProtectedOnly:(BOOL)a3
{
  if (self->_nonPasswordProtectedOnly != a3)
  {
    self->_nonPasswordProtectedOnly = a3;
    legacyNoteFetchedResultsController = self->_legacyNoteFetchedResultsController;
    self->_legacyNoteFetchedResultsController = 0;

    modernNoteFetchedResultsController = self->_modernNoteFetchedResultsController;
    self->_modernNoteFetchedResultsController = 0;
  }
}

- (void)setSortType:(int64_t)a3
{
  self->_sortType = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F83790], "legacySortDescriptorsForType:", -[ICRecentNotesCoreDataIndexer sortType](self, "sortType"));
  v5 = [(ICRecentNotesCoreDataIndexer *)self legacyNoteFetchedResultsController];
  objc_super v6 = [v5 fetchRequest];
  [v6 setSortDescriptors:v4];

  objc_msgSend(MEMORY[0x1E4F83790], "sortDescriptorsForType:", -[ICRecentNotesCoreDataIndexer sortType](self, "sortType"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [(ICRecentNotesCoreDataIndexer *)self modernNoteFetchedResultsController];
  id v8 = [v7 fetchRequest];
  [v8 setSortDescriptors:v9];
}

- (OS_dispatch_queue)indexAccessQueue
{
  indexAccessQueue = self->_indexAccessQueue;
  if (!indexAccessQueue)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.notes.recent-notes-index-access-queue", v4);
    objc_super v6 = self->_indexAccessQueue;
    self->_indexAccessQueue = v5;

    indexAccessQueue = self->_indexAccessQueue;
  }
  return indexAccessQueue;
}

- (NSFetchedResultsController)legacyNoteFetchedResultsController
{
  if (!self->_legacyNoteFetchedResultsController
    && ![(ICRecentNotesCoreDataIndexer *)self pinnedOnly]
    && ![(ICRecentNotesCoreDataIndexer *)self checklistsOnly])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1C0D0];
    v4 = ICLegacyEntityNameNote();
    v5 = [v3 fetchRequestWithEntityName:v4];

    [v5 setReturnsObjectsAsFaults:0];
    objc_super v6 = objc_msgSend(MEMORY[0x1E4F83790], "legacySortDescriptorsForType:", -[ICRecentNotesCoreDataIndexer sortType](self, "sortType"));
    [v5 setSortDescriptors:v6];

    v7 = [MEMORY[0x1E4F82D78] visibleNotesPredicate];
    [v5 setPredicate:v7];

    id v8 = objc_alloc(MEMORY[0x1E4F1C0F0]);
    id v9 = [(ICCoreDataIndexer *)self legacyManagedObjectContext];
    v10 = (NSFetchedResultsController *)[v8 initWithFetchRequest:v5 managedObjectContext:v9 sectionNameKeyPath:0 cacheName:0];
    legacyNoteFetchedResultsController = self->_legacyNoteFetchedResultsController;
    self->_legacyNoteFetchedResultsController = v10;
  }
  v12 = self->_legacyNoteFetchedResultsController;
  return v12;
}

- (NSFetchedResultsController)modernNoteFetchedResultsController
{
  v39[2] = *MEMORY[0x1E4F143B8];
  modernNoteFetchedResultsController = self->_modernNoteFetchedResultsController;
  if (!modernNoteFetchedResultsController)
  {
    v4 = (void *)MEMORY[0x1E4F28BA0];
    v5 = (void *)MEMORY[0x1E4F83418];
    objc_super v6 = [(ICCoreDataIndexer *)self modernManagedObjectContext];
    v7 = [v5 predicateForVisibleNotesInContext:v6];
    v39[0] = v7;
    id v8 = [MEMORY[0x1E4F83418] predicateForSystemPaperNotesNotInTrash];
    v39[1] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    v10 = [v4 orPredicateWithSubpredicates:v9];

    if ([(ICRecentNotesCoreDataIndexer *)self checklistsOnly])
    {
      v11 = (void *)MEMORY[0x1E4F28BA0];
      v38[0] = v10;
      v12 = [MEMORY[0x1E4F83418] predicateForNotesWithChecklists];
      v38[1] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
      uint64_t v14 = [v11 andPredicateWithSubpredicates:v13];

      v10 = (void *)v14;
    }
    if ([(ICRecentNotesCoreDataIndexer *)self pinnedOnly])
    {
      v15 = (void *)MEMORY[0x1E4F28BA0];
      v37[0] = v10;
      v16 = [MEMORY[0x1E4F83418] predicateForPinnedNotes];
      v37[1] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      uint64_t v18 = [v15 andPredicateWithSubpredicates:v17];

      v10 = (void *)v18;
    }
    if ([(ICRecentNotesCoreDataIndexer *)self passwordProtectedOnly])
    {
      v19 = (void *)MEMORY[0x1E4F28BA0];
      v36[0] = v10;
      v20 = [MEMORY[0x1E4F83328] predicateForPasswordProtectedObjects];
      v36[1] = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
      uint64_t v22 = [v19 andPredicateWithSubpredicates:v21];

      v10 = (void *)v22;
    }
    if ([(ICRecentNotesCoreDataIndexer *)self nonPasswordProtectedOnly])
    {
      v23 = (void *)MEMORY[0x1E4F28BA0];
      v35[0] = v10;
      v24 = [MEMORY[0x1E4F83328] predicateForPasswordProtectedObjects];
      v25 = [v23 notPredicateWithSubpredicate:v24];
      v35[1] = v25;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
      uint64_t v27 = [v23 andPredicateWithSubpredicates:v26];

      v10 = (void *)v27;
    }
    v28 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*MEMORY[0x1E4F83120]];
    [v28 setReturnsObjectsAsFaults:0];
    v29 = objc_msgSend(MEMORY[0x1E4F83790], "sortDescriptorsForType:", -[ICRecentNotesCoreDataIndexer sortType](self, "sortType"));
    [v28 setSortDescriptors:v29];

    [v28 setPredicate:v10];
    id v30 = objc_alloc(MEMORY[0x1E4F1C0F0]);
    v31 = [(ICCoreDataIndexer *)self modernManagedObjectContext];
    v32 = (NSFetchedResultsController *)[v30 initWithFetchRequest:v28 managedObjectContext:v31 sectionNameKeyPath:0 cacheName:0];
    v33 = self->_modernNoteFetchedResultsController;
    self->_modernNoteFetchedResultsController = v32;

    modernNoteFetchedResultsController = self->_modernNoteFetchedResultsController;
  }
  return modernNoteFetchedResultsController;
}

- (NSMutableDictionary)sectionIdentifiersToManagedObjectIDs
{
  sectionIdentifiersToManagedObjectIDs = self->_sectionIdentifiersToManagedObjectIDs;
  if (!sectionIdentifiersToManagedObjectIDs)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = self->_sectionIdentifiersToManagedObjectIDs;
    self->_sectionIdentifiersToManagedObjectIDs = v4;

    sectionIdentifiersToManagedObjectIDs = self->_sectionIdentifiersToManagedObjectIDs;
  }
  return sectionIdentifiersToManagedObjectIDs;
}

- (id)activeFetchedResultsControllers
{
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  v4 = [(ICRecentNotesCoreDataIndexer *)self legacyNoteFetchedResultsController];

  if (v4)
  {
    v5 = [(ICRecentNotesCoreDataIndexer *)self legacyNoteFetchedResultsController];
    [v3 addObject:v5];
  }
  objc_super v6 = [(ICRecentNotesCoreDataIndexer *)self modernNoteFetchedResultsController];

  if (v6)
  {
    v7 = [(ICRecentNotesCoreDataIndexer *)self modernNoteFetchedResultsController];
    [v3 addObject:v7];
  }
  id v8 = (void *)[v3 copy];

  return v8;
}

- (void)willIndex
{
  BOOL v3 = [(ICRecentNotesCoreDataIndexer *)self indexAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ICRecentNotesCoreDataIndexer_willIndex__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __41__ICRecentNotesCoreDataIndexer_willIndex__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sectionIdentifiersToManagedObjectIDs];
  [v1 removeAllObjects];
}

- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__62;
  v21 = __Block_byref_object_dispose__62;
  id v22 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [(ICRecentNotesCoreDataIndexer *)self indexAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__ICRecentNotesCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke;
  block[3] = &unk_1E5FD93E0;
  id v10 = v7;
  id v14 = v10;
  v15 = self;
  v16 = &v17;
  dispatch_sync(v9, block);

  v11 = (void *)[(id)v18[5] copy];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __92__ICRecentNotesCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [*(id *)(a1 + 32) objects];
  uint64_t v2 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v29;
    *(void *)&long long v3 = 138412290;
    long long v26 = v3;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
        objc_opt_class();
        id v8 = ICDynamicCast();
        char v9 = [v8 isSystemPaper];
        id v10 = [ICFolderListSectionIdentifier alloc];
        if (v9) {
          uint64_t v11 = [(ICFolderListSectionIdentifier *)v10 initWithSectionType:1];
        }
        else {
          uint64_t v11 = [(ICFolderListSectionIdentifier *)v10 initWithObject:v7];
        }
        v12 = (void *)v11;

        if (!v12)
        {
          v25 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v26;
            v33 = v7;
            _os_log_debug_impl(&dword_1B08EB000, v25, OS_LOG_TYPE_DEBUG, "Cannot create folder list section identifier from object %@", buf, 0xCu);
          }
          goto LABEL_16;
        }
        v13 = [*(id *)(a1 + 40) sectionIdentifiersToManagedObjectIDs];
        id v14 = [v13 objectForKeyedSubscript:v12];

        if (!v14)
        {
          v15 = [MEMORY[0x1E4F1CA70] orderedSet];
          v16 = [*(id *)(a1 + 40) sectionIdentifiersToManagedObjectIDs];
          [v16 setObject:v15 forKeyedSubscript:v12];
        }
        uint64_t v17 = objc_msgSend(*(id *)(a1 + 40), "sectionIdentifiersToManagedObjectIDs", v26);
        uint64_t v18 = [v17 objectForKeyedSubscript:v12];
        unint64_t v19 = [v18 count];
        unint64_t v20 = [*(id *)(a1 + 40) maximumNumberOfNotesPerAccount];

        if (v19 < v20)
        {
          v21 = [*(id *)(a1 + 40) sectionIdentifiersToManagedObjectIDs];
          id v22 = [v21 objectForKeyedSubscript:v12];
          v23 = [v7 objectID];
          [v22 addObject:v23];

          v24 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          v25 = [v7 objectID];
          [v24 addObject:v25];
LABEL_16:
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v4);
  }
}

- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  uint64_t v6 = [(ICRecentNotesCoreDataIndexer *)self indexAccessQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __110__ICRecentNotesCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v10[3] = &unk_1E5FD91D0;
  id v7 = v5;
  id v11 = v7;
  v12 = self;
  dispatch_sync(v6, v10);

  id v8 = v7;
  return v8;
}

void __110__ICRecentNotesCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  long long v3 = [*(id *)(a1 + 40) sortedSectionIdentifiers];
  [v2 appendSectionsWithIdentifiers:v3];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "sectionIdentifiersToManagedObjectIDs", 0);
  id v5 = [v4 allKeys];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        id v11 = [*(id *)(a1 + 40) sectionIdentifiersToManagedObjectIDs];
        v12 = [v11 objectForKeyedSubscript:v10];

        v13 = *(void **)(a1 + 32);
        id v14 = [v12 array];
        [v13 appendItemsWithIdentifiers:v14 intoSectionWithIdentifier:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4, a5);
  uint64_t v7 = [(ICRecentNotesCoreDataIndexer *)self indexAccessQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __117__ICRecentNotesCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v12[3] = &unk_1E5FD91D0;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  dispatch_sync(v7, v12);

  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __117__ICRecentNotesCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiersToManagedObjectIDs", 0);
  long long v3 = [v2 allKeys];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        id v9 = objc_alloc_init(MEMORY[0x1E4FB1358]);
        [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v8];

        id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
        id v11 = [*(id *)(a1 + 32) sectionIdentifiersToManagedObjectIDs];
        v12 = [v11 objectForKeyedSubscript:v8];
        id v13 = [v12 array];
        [v10 appendItems:v13];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (NSArray)sortedSectionIdentifiers
{
  uint64_t v2 = [(ICRecentNotesCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
  long long v3 = [v2 allKeys];
  uint64_t v4 = +[ICFolderListSectionIdentifier sortDescriptors];
  uint64_t v5 = [v3 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (id)sectionIdentifierForHeaderInSection:(int64_t)a3
{
  if (a3 < 0
    || (-[ICRecentNotesCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs"), v5 = objc_claimAutoreleasedReturnValue(), unint64_t v6 = [v5 count], v5, v6 <= a3))
  {
    uint64_t v8 = [(ICRecentNotesCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
    id v9 = [v8 allKeys];
    uint64_t v7 = [v9 objectAtIndexedSubscript:a3];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)sectionIdentifiersForSectionType:(unint64_t)a3
{
  long long v3 = [(ICRecentNotesCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
  uint64_t v4 = [v3 allKeys];

  return v4;
}

- (id)firstRelevantItemIdentifier
{
  long long v3 = [(ICRecentNotesCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
  uint64_t v4 = [(ICRecentNotesCoreDataIndexer *)self sortedSectionIdentifiers];
  uint64_t v5 = [v4 firstObject];
  unint64_t v6 = [v3 objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  long long v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[ICRecentNotesCoreDataIndexer nextRelevantItemIdentifierAfter:](v3);
  }

  return 0;
}

- (int64_t)sortType
{
  return self->_sortType;
}

- (unint64_t)maximumNumberOfNotesPerAccount
{
  return self->_maximumNumberOfNotesPerAccount;
}

- (BOOL)checklistsOnly
{
  return self->_checklistsOnly;
}

- (BOOL)pinnedOnly
{
  return self->_pinnedOnly;
}

- (BOOL)passwordProtectedOnly
{
  return self->_passwordProtectedOnly;
}

- (BOOL)nonPasswordProtectedOnly
{
  return self->_nonPasswordProtectedOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifiersToManagedObjectIDs, 0);
  objc_storeStrong((id *)&self->_modernNoteFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_legacyNoteFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_indexAccessQueue, 0);
}

- (void)setShouldIncludeOutlineParentItems:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1B08EB000, log, OS_LOG_TYPE_FAULT, "[ICRecentNotesCoreDataIndexer setShouldIncludeOutlineParentItems:] is not implemented", v1, 2u);
}

- (void)nextRelevantItemIdentifierAfter:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1B08EB000, log, OS_LOG_TYPE_FAULT, "[ICRecentNotesCoreDataIndexer nextRelevantItemIdentifierAfter:] is not implemented", v1, 2u);
}

@end