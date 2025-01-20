@interface ICInvitationsCoreDataIndexer
+ (NSDate)defaultReceivedSince;
- (ICAccount)account;
- (ICFolderCustomNoteSortType)sortType;
- (ICInvitationsCoreDataIndexer)initWithModernManagedObjectContext:(id)a3 sectionIdentifier:(id)a4;
- (ICSectionIdentifier)sectionIdentifier;
- (NSDate)receivedSince;
- (NSFetchedResultsController)fetchedResultsController;
- (NSMutableOrderedSet)invitationObjectIDs;
- (NSString)expansionStateContext;
- (OS_dispatch_queue)indexAccessQueue;
- (id)activeFetchedResultsControllers;
- (id)firstRelevantItemIdentifier;
- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5;
- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4;
- (id)nextRelevantItemIdentifierAfter:(id)a3;
- (id)sectionIdentifiersForSectionType:(unint64_t)a3;
- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5;
- (unint64_t)totalInvitationsCount;
- (void)deleteObjectWithIDFromIndex:(id)a3 inSection:(id)a4;
- (void)setAccount:(id)a3;
- (void)setExpansionStateContext:(id)a3;
- (void)setReceivedSince:(id)a3;
- (void)setSortType:(id)a3;
- (void)willIndex;
@end

@implementation ICInvitationsCoreDataIndexer

- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__27;
  v16 = __Block_byref_object_dispose__27;
  id v17 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  v8 = [(ICInvitationsCoreDataIndexer *)self indexAccessQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __110__ICInvitationsCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v11[3] = &unk_1E5FDB2D0;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(v8, v11);

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (OS_dispatch_queue)indexAccessQueue
{
  return self->_indexAccessQueue;
}

- (id)activeFetchedResultsControllers
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v4 = [(ICInvitationsCoreDataIndexer *)self fetchedResultsController];
  objc_msgSend(v3, "ic_addNonNilObject:", v4);

  v5 = (void *)[v3 copy];
  return v5;
}

- (NSFetchedResultsController)fetchedResultsController
{
  if (!self->_fetchedResultsController)
  {
    v3 = [(ICCoreDataIndexer *)self modernManagedObjectContext];

    if (v3)
    {
      v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*MEMORY[0x1E4F830F0]];
      [v4 setReturnsObjectsAsFaults:0];
      v5 = (void *)MEMORY[0x1E4F83790];
      id v6 = [(ICInvitationsCoreDataIndexer *)self sortType];
      id v7 = [v5 sortDescriptorsForCurrentTypeIncludingPinnedNotes:0 folderNoteSortType:v6];
      [v4 setSortDescriptors:v7];

      v8 = (void *)MEMORY[0x1E4F833B8];
      id v9 = [(ICInvitationsCoreDataIndexer *)self account];
      v10 = [(ICInvitationsCoreDataIndexer *)self receivedSince];
      v11 = [v8 predicateForPendingInvitationsInAccount:v9 receivedSince:v10];
      [v4 setPredicate:v11];

      id v12 = objc_alloc(MEMORY[0x1E4F1C0F0]);
      v13 = [(ICCoreDataIndexer *)self modernManagedObjectContext];
      uint64_t v14 = (NSFetchedResultsController *)[v12 initWithFetchRequest:v4 managedObjectContext:v13 sectionNameKeyPath:0 cacheName:0];
      fetchedResultsController = self->_fetchedResultsController;
      self->_fetchedResultsController = v14;
    }
  }
  v16 = self->_fetchedResultsController;
  return v16;
}

- (ICFolderCustomNoteSortType)sortType
{
  return self->_sortType;
}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 == 5)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__27;
    v18 = __Block_byref_object_dispose__27;
    id v19 = [MEMORY[0x1E4F1CA60] dictionary];
    v10 = [(ICInvitationsCoreDataIndexer *)self indexAccessQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __117__ICInvitationsCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke;
    v13[3] = &unk_1E5FDB2D0;
    v13[4] = self;
    v13[5] = &v14;
    dispatch_sync(v10, v13);

    id v11 = (id)v15[5];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F1CC08];
  }

  return v11;
}

- (NSDate)receivedSince
{
  return self->_receivedSince;
}

- (ICAccount)account
{
  return self->_account;
}

- (void)setSortType:(id)a3
{
  objc_storeStrong((id *)&self->_sortType, a3);
  id v6 = a3;
  fetchedResultsController = self->_fetchedResultsController;
  self->_fetchedResultsController = 0;
}

- (void)willIndex
{
  v3 = [(ICInvitationsCoreDataIndexer *)self indexAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ICInvitationsCoreDataIndexer_willIndex__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (ICInvitationsCoreDataIndexer)initWithModernManagedObjectContext:(id)a3 sectionIdentifier:(id)a4
{
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ICInvitationsCoreDataIndexer;
  id v8 = [(ICCoreDataIndexer *)&v20 initWithLegacyManagedObjectContext:0 modernManagedObjectContext:a3];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sectionIdentifier, a4);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.notes.invitations-index-access-queue", v10);
    indexAccessQueue = v9->_indexAccessQueue;
    v9->_indexAccessQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA70] orderedSet];
    invitationObjectIDs = v9->_invitationObjectIDs;
    v9->_invitationObjectIDs = (NSMutableOrderedSet *)v13;

    uint64_t v15 = [MEMORY[0x1E4F83758] noteSortTypeDefaultAscending];
    sortType = v9->_sortType;
    v9->_sortType = (ICFolderCustomNoteSortType *)v15;

    uint64_t v17 = [(id)objc_opt_class() defaultReceivedSince];
    receivedSince = v9->_receivedSince;
    v9->_receivedSince = (NSDate *)v17;
  }
  return v9;
}

+ (NSDate)defaultReceivedSince
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [MEMORY[0x1E4F1C9C8] now];
  v4 = [v2 dateByAddingUnit:16 value:-30 toDate:v3 options:0];

  return (NSDate *)v4;
}

void __41__ICInvitationsCoreDataIndexer_willIndex__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) invitationObjectIDs];
  [v1 removeAllObjects];
}

void __117__ICInvitationsCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) invitationObjectIDs];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1358]);
    int v5 = [*(id *)(a1 + 32) shouldIncludeOutlineParentItems];
    id v6 = *(void **)(a1 + 32);
    if (v5)
    {
      id v7 = [v6 sectionIdentifier];
      v22[0] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      [v4 appendItems:v8];

      id v9 = [*(id *)(a1 + 32) invitationObjectIDs];
      v10 = [v9 array];
      dispatch_queue_t v11 = [*(id *)(a1 + 32) sectionIdentifier];
      [v4 appendItems:v10 intoParentItem:v11];

      id v12 = +[ICExpansionState sharedExpansionState];
      uint64_t v13 = [*(id *)(a1 + 32) sectionIdentifier];
      uint64_t v14 = [*(id *)(a1 + 32) expansionStateContext];
      int v15 = [v12 isSectionIdentiferExpanded:v13 inContext:v14];

      if (![*(id *)(a1 + 32) shouldIncludeOutlineParentItems] || !v15) {
        goto LABEL_8;
      }
      uint64_t v16 = [*(id *)(a1 + 32) sectionIdentifier];
      v21 = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
      [v4 expandItems:v17];
    }
    else
    {
      uint64_t v16 = [v6 invitationObjectIDs];
      uint64_t v17 = [v16 array];
      [v4 appendItems:v17];
    }

LABEL_8:
    v18 = *(void **)(a1 + 32);
    id v19 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_super v20 = [v18 sectionIdentifier];
    [v19 setObject:v4 forKeyedSubscript:v20];
  }
}

void __110__ICInvitationsCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) invitationObjectIDs];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v5 = [*(id *)(a1 + 32) sectionIdentifier];
    v11[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v4 appendSectionsWithIdentifiers:v6];

    id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = [*(id *)(a1 + 32) invitationObjectIDs];
    id v9 = [v8 array];
    v10 = [*(id *)(a1 + 32) sectionIdentifier];
    [v7 appendItemsWithIdentifiers:v9 intoSectionWithIdentifier:v10];
  }
}

- (NSMutableOrderedSet)invitationObjectIDs
{
  return self->_invitationObjectIDs;
}

- (void)setExpansionStateContext:(id)a3
{
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
  id v6 = a3;
  fetchedResultsController = self->_fetchedResultsController;
  self->_fetchedResultsController = 0;
}

- (void)setReceivedSince:(id)a3
{
  objc_storeStrong((id *)&self->_receivedSince, a3);
  id v6 = a3;
  fetchedResultsController = self->_fetchedResultsController;
  self->_fetchedResultsController = 0;
}

- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  objc_super v20 = __Block_byref_object_copy__27;
  v21 = __Block_byref_object_dispose__27;
  id v22 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [(ICInvitationsCoreDataIndexer *)self indexAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__ICInvitationsCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke;
  block[3] = &unk_1E5FD93E0;
  id v10 = v7;
  id v14 = v10;
  int v15 = self;
  uint64_t v16 = &v17;
  dispatch_sync(v9, block);

  dispatch_queue_t v11 = (void *)[(id)v18[5] copy];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __92__ICInvitationsCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "objects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        id v8 = [*(id *)(a1 + 40) invitationObjectIDs];
        id v9 = [v7 objectID];
        [v8 addObject:v9];

        id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        dispatch_queue_t v11 = [v7 objectID];
        [v10 addObject:v11];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (id)sectionIdentifiersForSectionType:(unint64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 5)
  {
    uint64_t v3 = [(ICInvitationsCoreDataIndexer *)self sectionIdentifier];
    v6[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (unint64_t)totalInvitationsCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(ICInvitationsCoreDataIndexer *)self indexAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __53__ICInvitationsCoreDataIndexer_totalInvitationsCount__block_invoke;
  v6[3] = &unk_1E5FD91F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __53__ICInvitationsCoreDataIndexer_totalInvitationsCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) invitationObjectIDs];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (id)firstRelevantItemIdentifier
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__27;
  dispatch_queue_t v11 = __Block_byref_object_dispose__27;
  id v12 = 0;
  uint64_t v3 = [(ICInvitationsCoreDataIndexer *)self indexAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __59__ICInvitationsCoreDataIndexer_firstRelevantItemIdentifier__block_invoke;
  v6[3] = &unk_1E5FD91F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __59__ICInvitationsCoreDataIndexer_firstRelevantItemIdentifier__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) invitationObjectIDs];
  uint64_t v2 = [v5 firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__27;
  uint64_t v17 = __Block_byref_object_dispose__27;
  id v18 = 0;
  id v5 = [(ICInvitationsCoreDataIndexer *)self indexAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ICInvitationsCoreDataIndexer_nextRelevantItemIdentifierAfter___block_invoke;
  block[3] = &unk_1E5FD9D20;
  dispatch_queue_t v11 = self;
  id v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __64__ICInvitationsCoreDataIndexer_nextRelevantItemIdentifierAfter___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = [*(id *)(a1 + 32) lastObject];
  ICDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v3 = [*(id *)(a1 + 40) invitationObjectIDs];
  if (v5)
  {
    uint64_t v2 = [v3 array];
    objc_msgSend(v2, "ic_objectAfter:", v5);
  }
  else
  {
    [v3 firstObject];
  id v4 = };
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
  if (v5)
  {

    id v4 = v2;
  }
}

- (void)deleteObjectWithIDFromIndex:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  id v6 = [(ICInvitationsCoreDataIndexer *)self indexAccessQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__ICInvitationsCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke;
  v8[3] = &unk_1E5FD91D0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

void __70__ICInvitationsCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) invitationObjectIDs];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (NSString)expansionStateContext
{
  return self->_expansionStateContext;
}

- (ICSectionIdentifier)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationObjectIDs, 0);
  objc_storeStrong((id *)&self->_indexAccessQueue, 0);
  objc_storeStrong((id *)&self->_receivedSince, 0);
  objc_storeStrong((id *)&self->_sortType, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_expansionStateContext, 0);
}

@end