@interface ICTagCoreDataIndexer
+ (BOOL)isTagItemIdentifier:(id)a3;
- (BOOL)includesAllTagsItem;
- (BOOL)includesNewTagItem;
- (ICSectionIdentifier)sectionIdentifier;
- (ICTagCoreDataIndexer)initWithModernManagedObjectContext:(id)a3 sectionIdentifier:(id)a4;
- (NSArray)hashtags;
- (NSArray)leadingVisibleObjectIDs;
- (NSArray)objectIDs;
- (NSFetchedResultsController)fetchedResultsController;
- (OS_dispatch_queue)accessQueue;
- (id)activeFetchedResultsControllers;
- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5;
- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4;
- (id)nextRelevantItemIdentifierAfter:(id)a3;
- (id)sectionIdentifierForHeaderInSection:(int64_t)a3;
- (id)sectionIdentifiersForSectionType:(unint64_t)a3;
- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5;
- (unint64_t)hiddenTagCount;
- (unint64_t)visibleTagLimit;
- (void)setAccessQueue:(id)a3;
- (void)setFetchedResultsController:(id)a3;
- (void)setHashtags:(id)a3;
- (void)setIncludesAllTagsItem:(BOOL)a3;
- (void)setIncludesNewTagItem:(BOOL)a3;
- (void)setLeadingVisibleObjectIDs:(id)a3;
- (void)setObjectIDs:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setVisibleTagLimit:(unint64_t)a3;
- (void)willIndex;
@end

@implementation ICTagCoreDataIndexer

- (ICTagCoreDataIndexer)initWithModernManagedObjectContext:(id)a3 sectionIdentifier:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)ICTagCoreDataIndexer;
  v8 = [(ICCoreDataIndexer *)&v28 initWithLegacyManagedObjectContext:0 modernManagedObjectContext:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sectionIdentifier, a4);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.notes.tag-index-access-queue", v10);
    accessQueue = v9->_accessQueue;
    v9->_accessQueue = (OS_dispatch_queue *)v11;

    *(_WORD *)&v9->_includesAllTagsItem = 1;
    v9->_visibleTagLimit = -1;
    v13 = (void *)MEMORY[0x1E4F1C0D0];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = [v13 fetchRequestWithEntityName:v15];

    v17 = [MEMORY[0x1E4F83388] predicateForVisibleObjects];
    [v16 setPredicate:v17];

    [v16 setReturnsObjectsAsFaults:0];
    v18 = (void *)MEMORY[0x1E4F29008];
    v19 = NSStringFromSelector(sel_standardizedContent);
    v20 = [v18 sortDescriptorWithKey:v19 ascending:1];
    v29[0] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    [v16 setSortDescriptors:v21];

    if (v6)
    {
      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F1C0F0]) initWithFetchRequest:v16 managedObjectContext:v6 sectionNameKeyPath:0 cacheName:0];
      fetchedResultsController = v9->_fetchedResultsController;
      v9->_fetchedResultsController = (NSFetchedResultsController *)v22;
    }
    hashtags = v9->_hashtags;
    v25 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v9->_hashtags = (NSArray *)MEMORY[0x1E4F1CBF0];

    objectIDs = v9->_objectIDs;
    v9->_objectIDs = v25;
  }
  return v9;
}

- (id)activeFetchedResultsControllers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = (void *)MEMORY[0x1E4F1C978];
  v4 = [(ICTagCoreDataIndexer *)self fetchedResultsController];
  v5 = objc_msgSend(v3, "ic_arrayFromNonNilObject:", v4);
  id v6 = [v2 setWithArray:v5];

  return v6;
}

- (NSFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5
{
  id v6 = [(ICTagCoreDataIndexer *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__ICTagCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_sync(v6, block);

  id v7 = [(ICTagCoreDataIndexer *)self objectIDs];
  return v7;
}

uint64_t __33__ICTagCoreDataIndexer_willIndex__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObjectIDs:MEMORY[0x1E4F1CBF0]];
}

- (void)willIndex
{
  v3 = [(ICTagCoreDataIndexer *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__ICTagCoreDataIndexer_willIndex__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

void __84__ICTagCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F83388];
  v3 = [*(id *)(a1 + 32) modernManagedObjectContext];
  id v5 = [v2 canonicalHashtagsInContext:v3];

  v4 = objc_msgSend(v5, "ic_map:", &__block_literal_global_39);
  [*(id *)(a1 + 32) setObjectIDs:v4];
}

- (void)setObjectIDs:(id)a3
{
}

+ (BOOL)isTagItemIdentifier:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = ICDynamicCast();
  if (objc_msgSend(v4, "ic_isHashtagType") & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (unint64_t)hiddenTagCount
{
  id v3 = [(ICTagCoreDataIndexer *)self objectIDs];
  uint64_t v4 = [v3 count];
  id v5 = [(ICTagCoreDataIndexer *)self leadingVisibleObjectIDs];
  unint64_t v6 = v4 - [v5 count];

  return v6;
}

- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  unint64_t v6 = [(ICTagCoreDataIndexer *)self accessQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__ICTagCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v11[3] = &unk_1E5FD91D0;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  dispatch_sync(v6, v11);

  v8 = v12;
  id v9 = v7;

  return v9;
}

void __102__ICTagCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) sectionIdentifier];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) sectionIdentifier];
    v19[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v3 appendSectionsWithIdentifiers:v5];

    if ([*(id *)(a1 + 32) includesNewTagItem])
    {
      unint64_t v6 = *(void **)(a1 + 40);
      id v7 = +[ICTagNewTagItemIdentifier sharedItemIdentifier];
      v18 = v7;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      id v9 = [*(id *)(a1 + 32) sectionIdentifier];
      [v6 appendItemsWithIdentifiers:v8 intoSectionWithIdentifier:v9];
    }
    if ([*(id *)(a1 + 32) includesAllTagsItem])
    {
      v10 = *(void **)(a1 + 40);
      dispatch_queue_t v11 = +[ICTagAllTagsItemIdentifier sharedItemIdentifier];
      v17 = v11;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      v13 = [*(id *)(a1 + 32) sectionIdentifier];
      [v10 appendItemsWithIdentifiers:v12 intoSectionWithIdentifier:v13];
    }
    v14 = *(void **)(a1 + 40);
    v15 = [*(id *)(a1 + 32) leadingVisibleObjectIDs];
    v16 = [*(id *)(a1 + 32) sectionIdentifier];
    [v14 appendItemsWithIdentifiers:v15 intoSectionWithIdentifier:v16];
  }
}

uint64_t __84__ICTagCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

- (id)sectionIdentifiersForSectionType:(unint64_t)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__34;
  v13 = __Block_byref_object_dispose__34;
  id v14 = 0;
  id v5 = [(ICTagCoreDataIndexer *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ICTagCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke;
  block[3] = &unk_1E5FDB780;
  void block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __57__ICTagCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3 == 4)
  {
    v1 = [*(id *)(a1 + 32) sectionIdentifier];
    v5[0] = v1;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  if (v3 == 4)
  {
  }
}

- (NSArray)leadingVisibleObjectIDs
{
  uint64_t v3 = [(ICTagCoreDataIndexer *)self objectIDs];
  uint64_t v4 = (void *)[v3 copy];

  if ([(ICTagCoreDataIndexer *)self visibleTagLimit])
  {
    id v5 = [(ICTagCoreDataIndexer *)self objectIDs];
    unint64_t v6 = [v5 count];
    unint64_t v7 = [(ICTagCoreDataIndexer *)self visibleTagLimit];

    if (v6 > v7)
    {
      uint64_t v8 = objc_msgSend(v4, "subarrayWithRange:", 0, -[ICTagCoreDataIndexer visibleTagLimit](self, "visibleTagLimit"));

      uint64_t v4 = (void *)v8;
    }
  }
  return (NSArray *)v4;
}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  if (a3 == 4)
  {
    unint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", 4, a4, a5);
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1358]);
    uint64_t v8 = [(ICTagCoreDataIndexer *)self accessQueue];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __109__ICTagCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke;
    v17 = &unk_1E5FD91D0;
    id v9 = v7;
    id v18 = v9;
    v19 = self;
    dispatch_sync(v8, &v14);

    v10 = [(ICTagCoreDataIndexer *)self sectionIdentifier];

    if (v10)
    {
      uint64_t v11 = [(ICTagCoreDataIndexer *)self sectionIdentifier];
      [v6 setObject:v9 forKeyedSubscript:v11];
    }
    id v12 = (void *)[v6 copy];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

void __109__ICTagCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = +[ICTagAllTagsItemIdentifier sharedItemIdentifier];
  uint64_t v3 = *(void **)(a1 + 32);
  v7[0] = v2;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 appendItems:v4];

  id v5 = *(void **)(a1 + 32);
  unint64_t v6 = [*(id *)(a1 + 40) leadingVisibleObjectIDs];
  [v5 appendItems:v6];
}

- (id)sectionIdentifierForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  return 0;
}

- (BOOL)includesAllTagsItem
{
  return self->_includesAllTagsItem;
}

- (void)setIncludesAllTagsItem:(BOOL)a3
{
  self->_includesAllTagsItem = a3;
}

- (BOOL)includesNewTagItem
{
  return self->_includesNewTagItem;
}

- (void)setIncludesNewTagItem:(BOOL)a3
{
  self->_includesNewTagItem = a3;
}

- (unint64_t)visibleTagLimit
{
  return self->_visibleTagLimit;
}

- (void)setVisibleTagLimit:(unint64_t)a3
{
  self->_visibleTagLimit = a3;
}

- (void)setAccessQueue:(id)a3
{
}

- (void)setFetchedResultsController:(id)a3
{
}

- (NSArray)hashtags
{
  return self->_hashtags;
}

- (void)setHashtags:(id)a3
{
}

- (void)setLeadingVisibleObjectIDs:(id)a3
{
}

- (ICSectionIdentifier)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_leadingVisibleObjectIDs, 0);
  objc_storeStrong((id *)&self->_hashtags, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_objectIDs, 0);
}

@end