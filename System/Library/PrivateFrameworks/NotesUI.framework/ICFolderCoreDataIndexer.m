@interface ICFolderCoreDataIndexer
- (BOOL)hideUnmigratedLocalLegacyAccounts;
- (BOOL)includeMigratedICloudLegacyAccounts;
- (BOOL)includeMigratedLocalLegacyAccounts;
- (BOOL)isCustomFolder:(id)a3;
- (BOOL)isDefaultFolder:(id)a3;
- (BOOL)itemIdentifiersContainCustomFolder:(id)a3;
- (BOOL)shouldAutoExpandSingleSection;
- (BOOL)shouldIncludeDefaultFolder;
- (BOOL)shouldIncludeLegacyAccounts;
- (BOOL)shouldIncludeNewFolderButton;
- (BOOL)shouldIncludeSmartFolders;
- (BOOL)shouldIncludeSubfolders;
- (BOOL)shouldIncludeTagOperator;
- (BOOL)shouldIncludeTags;
- (BOOL)shouldIncludeTrash;
- (ICFolderCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4;
- (ICFolderCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4 overrideContainerIdentifier:(id)a5;
- (ICItemIdentifier)overrideContainerIdentifier;
- (ICTagCoreDataIndexer)tagIndexer;
- (NSFetchedResultsController)legacyFetchedResultsController;
- (NSFetchedResultsController)modernFetchedResultsController;
- (NSManagedObjectID)accountObjectID;
- (NSManagedObjectID)ancestorObjectID;
- (NSMutableDictionary)folderItemIdentifiersToChildFolderItemIdentifiers;
- (NSMutableDictionary)folderItemIdentifiersToParentFolderItemIdentifier;
- (NSMutableDictionary)folderListSectionIdentifiersToButtonIdentifiers;
- (NSMutableDictionary)folderListSectionIdentifiersToFolderItemIdentifiers;
- (NSMutableDictionary)folderListSectionIdentifiersToVirtualSmartFolderIdentifiers;
- (NSMutableOrderedSet)folderListSectionIdentifiers;
- (NSMutableSet)legacyAccountManagedObjectIDs;
- (NSMutableSet)modernAccountManagedObjectIDs;
- (NSMutableSet)smartFolderManagedObjectIDs;
- (NSMutableSet)virtualSmartFolderIdentifiers;
- (NSSet)allSmartFolderObjectIDs;
- (NSSet)allVirtualSmartFolderIdentifiers;
- (OS_dispatch_queue)indexAccessQueue;
- (id)activeFetchedResultsControllers;
- (id)expansionStateContext;
- (id)firstRelevantItemIdentifier;
- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5;
- (id)legacyFolderFetchPredicate;
- (id)modernDescendantsPredicate;
- (id)modernFolderFetchPredicate;
- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4;
- (id)nextRelevantItemIdentifierAfter:(id)a3;
- (id)rootFolderListSectionIdentifiersForSection:(id)a3;
- (id)sectionIdentifierForHeaderInSection:(int64_t)a3;
- (id)sectionIdentifiersForSectionType:(unint64_t)a3;
- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5;
- (id)sortedFolderItemIdentifiersForItemIdentifiers:(id)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5;
- (int64_t)shouldIncludeAccount;
- (int64_t)shouldIncludeCallNotes;
- (int64_t)shouldIncludeMathNotes;
- (int64_t)shouldIncludeSharedWithYou;
- (int64_t)shouldIncludeSystemPaper;
- (unint64_t)countOfLegacyAccounts;
- (unint64_t)countOfModernAccounts;
- (unint64_t)totalFolderCount;
- (void)addAccountItemsIfNeededForFolderSectionIdentifier:(id)a3;
- (void)addChildFoldersOfParentFolder:(id)a3 toSectionSnapshot:(id)a4;
- (void)addSystemSectionIfNeeded;
- (void)deleteObjectWithIDFromIndex:(id)a3 inSection:(id)a4;
- (void)deleteWithDecisionController:(id)a3 completion:(id)a4;
- (void)didIndex;
- (void)setAccountObjectID:(id)a3;
- (void)setAncestorObjectID:(id)a3;
- (void)setFolderItemIdentifiersToChildFolderItemIdentifiers:(id)a3;
- (void)setFolderItemIdentifiersToParentFolderItemIdentifier:(id)a3;
- (void)setFolderListSectionIdentifiers:(id)a3;
- (void)setFolderListSectionIdentifiersToButtonIdentifiers:(id)a3;
- (void)setFolderListSectionIdentifiersToFolderItemIdentifiers:(id)a3;
- (void)setFolderListSectionIdentifiersToVirtualSmartFolderIdentifiers:(id)a3;
- (void)setIndexAccessQueue:(id)a3;
- (void)setLegacyAccountManagedObjectIDs:(id)a3;
- (void)setLegacyFetchedResultsController:(id)a3;
- (void)setModernAccountManagedObjectIDs:(id)a3;
- (void)setModernFetchedResultsController:(id)a3;
- (void)setOverrideContainerIdentifier:(id)a3;
- (void)setShouldAutoExpandSingleSection:(BOOL)a3;
- (void)setShouldIncludeAccount:(int64_t)a3;
- (void)setShouldIncludeCallNotes:(int64_t)a3;
- (void)setShouldIncludeDefaultFolder:(BOOL)a3;
- (void)setShouldIncludeLegacyAccounts:(BOOL)a3;
- (void)setShouldIncludeMathNotes:(int64_t)a3;
- (void)setShouldIncludeNewFolderButton:(BOOL)a3;
- (void)setShouldIncludeSharedWithYou:(int64_t)a3;
- (void)setShouldIncludeSmartFolders:(BOOL)a3;
- (void)setShouldIncludeSubfolders:(BOOL)a3;
- (void)setShouldIncludeSystemPaper:(int64_t)a3;
- (void)setShouldIncludeTagOperator:(BOOL)a3;
- (void)setShouldIncludeTags:(BOOL)a3;
- (void)setShouldIncludeTrash:(BOOL)a3;
- (void)setSmartFolderManagedObjectIDs:(id)a3;
- (void)setTagIndexer:(id)a3;
- (void)setVirtualSmartFolderIdentifiers:(id)a3;
- (void)sortIdentifiersWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4;
- (void)willIndex;
@end

@implementation ICFolderCoreDataIndexer

BOOL __70__ICFolderCoreDataIndexer_rootFolderListSectionIdentifiersForSection___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 folderItemIdentifiersToParentFolderItemIdentifier];
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5 == 0;
}

- (NSMutableDictionary)folderItemIdentifiersToParentFolderItemIdentifier
{
  return self->_folderItemIdentifiersToParentFolderItemIdentifier;
}

void __62__ICFolderCoreDataIndexer_itemIdentifiersContainCustomFolder___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  id v4 = [v2 modernManagedObjectContext];
  id v3 = objc_msgSend(v4, "ic_existingObjectWithID:", a1[5]);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 isCustomFolder:v3];
}

uint64_t __62__ICFolderCoreDataIndexer_itemIdentifiersContainCustomFolder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if (objc_msgSend(v3, "ic_isModernFolderType"))
  {
    id v4 = [*(id *)(a1 + 32) modernManagedObjectContext];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__ICFolderCoreDataIndexer_itemIdentifiersContainCustomFolder___block_invoke_2;
    v13[3] = &unk_1E5FD9870;
    uint64_t v5 = *(void *)(a1 + 32);
    v15 = &v16;
    v13[4] = v5;
    id v14 = v3;
    [v4 performBlockAndWait:v13];
  }
  if (objc_msgSend(v3, "ic_isLegacyFolderType"))
  {
    v6 = [*(id *)(a1 + 32) legacyManagedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__ICFolderCoreDataIndexer_itemIdentifiersContainCustomFolder___block_invoke_3;
    v10[3] = &unk_1E5FD9870;
    uint64_t v7 = *(void *)(a1 + 32);
    v12 = &v16;
    v10[4] = v7;
    id v11 = v3;
    [v6 performBlockAndWait:v10];
  }
  uint64_t v8 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v8;
}

- (BOOL)isCustomFolder:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__ICFolderCoreDataIndexer_isCustomFolder___block_invoke;
  v7[3] = &unk_1E5FDB2D0;
  id v5 = v3;
  id v8 = v5;
  v9 = &v10;
  [v4 performBlockAndWait:v7];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

void __127__ICFolderCoreDataIndexer_sortedFolderItemIdentifiersForItemIdentifiers_legacyManagedObjectContext_modernManagedObjectContext___block_invoke_3(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v7, "ic_isLegacyAccountType", (void)v15))
        {
          [*(id *)(a1 + 40) addObject:v7];
        }
        else if (objc_msgSend(v7, "ic_isLegacyFolderType"))
        {
          id v8 = [*(id *)(a1 + 48) objectWithID:v7];
          int v9 = [*(id *)(a1 + 56) isDefaultFolder:v8];
          if (v9) {
            uint64_t v10 = 64;
          }
          else {
            uint64_t v10 = 72;
          }
          if (v9) {
            id v11 = v7;
          }
          else {
            id v11 = v8;
          }
          [*(id *)(a1 + v10) addObject:v11];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 72) sortUsingSelector:sel_compare_];
  uint64_t v12 = objc_msgSend(*(id *)(a1 + 72), "ic_map:", &__block_literal_global_180);
  uint64_t v13 = *(void *)(*(void *)(a1 + 80) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

void __51__ICFolderCoreDataIndexer_addSystemSectionIfNeeded__block_invoke(uint64_t a1)
{
  objc_opt_class();
  id v2 = [*(id *)(a1 + 32) overrideContainerIdentifier];
  ICDynamicCast();
  id v35 = (id)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    [*(id *)(a1 + 40) addObject:v35];
    objc_opt_class();
    uint64_t v3 = [*(id *)(a1 + 32) virtualSmartFolderIdentifiers];
    uint64_t v4 = ICCheckedDynamicCast();
    [v4 addObject:v35];
LABEL_20:

    goto LABEL_21;
  }
  if (![*(id *)(a1 + 32) shouldIncludeSystemPaper])
  {
    uint64_t v5 = [MEMORY[0x1E4F83278] globalVirtualSystemPaperFolder];
    v6 = [*(id *)(a1 + 32) modernManagedObjectContext];
    char v7 = [v5 isHiddenInContext:v6];

    if ((v7 & 1) == 0)
    {
      id v8 = *(void **)(a1 + 40);
      int v9 = [MEMORY[0x1E4F83278] globalVirtualSystemPaperFolder];
      [v8 addObject:v9];
    }
    objc_opt_class();
    uint64_t v10 = [*(id *)(a1 + 32) virtualSmartFolderIdentifiers];
    id v11 = ICCheckedDynamicCast();
    uint64_t v12 = [MEMORY[0x1E4F83278] globalVirtualSystemPaperFolder];
    [v11 addObject:v12];
  }
  if (![*(id *)(a1 + 32) shouldIncludeMathNotes])
  {
    uint64_t v13 = [MEMORY[0x1E4F83278] globalVirtualMathNotesFolder];
    id v14 = [*(id *)(a1 + 32) modernManagedObjectContext];
    char v15 = [v13 isHiddenInContext:v14];

    if ((v15 & 1) == 0)
    {
      long long v16 = *(void **)(a1 + 40);
      long long v17 = [MEMORY[0x1E4F83278] globalVirtualMathNotesFolder];
      [v16 addObject:v17];
    }
    objc_opt_class();
    long long v18 = [*(id *)(a1 + 32) virtualSmartFolderIdentifiers];
    char v19 = ICCheckedDynamicCast();
    uint64_t v20 = [MEMORY[0x1E4F83278] globalVirtualMathNotesFolder];
    [v19 addObject:v20];
  }
  if (![*(id *)(a1 + 32) shouldIncludeCallNotes])
  {
    v21 = [MEMORY[0x1E4F83278] globalVirtualCallNotesFolder];
    v22 = [*(id *)(a1 + 32) modernManagedObjectContext];
    char v23 = [v21 isHiddenInContext:v22];

    if ((v23 & 1) == 0)
    {
      v24 = *(void **)(a1 + 40);
      v25 = [MEMORY[0x1E4F83278] globalVirtualCallNotesFolder];
      [v24 addObject:v25];
    }
    objc_opt_class();
    v26 = [*(id *)(a1 + 32) virtualSmartFolderIdentifiers];
    v27 = ICCheckedDynamicCast();
    v28 = [MEMORY[0x1E4F83278] globalVirtualCallNotesFolder];
    [v27 addObject:v28];
  }
  if ([*(id *)(a1 + 32) shouldIncludeSharedWithYou] != 2)
  {
    if ([*(id *)(a1 + 32) shouldIncludeSharedWithYou] == 1
      || ([MEMORY[0x1E4F83278] globalVirtualSharedWithYouFolder],
          v29 = objc_claimAutoreleasedReturnValue(),
          [*(id *)(a1 + 32) modernManagedObjectContext],
          v30 = objc_claimAutoreleasedReturnValue(),
          char v31 = [v29 isHiddenInContext:v30],
          v30,
          v29,
          (v31 & 1) == 0))
    {
      v32 = *(void **)(a1 + 40);
      v33 = [MEMORY[0x1E4F83278] globalVirtualSharedWithYouFolder];
      [v32 addObject:v33];
    }
    objc_opt_class();
    uint64_t v3 = [*(id *)(a1 + 32) virtualSmartFolderIdentifiers];
    uint64_t v4 = ICCheckedDynamicCast();
    v34 = [MEMORY[0x1E4F83278] globalVirtualSharedWithYouFolder];
    [v4 addObject:v34];

    goto LABEL_20;
  }
LABEL_21:
}

- (NSMutableSet)virtualSmartFolderIdentifiers
{
  return self->_virtualSmartFolderIdentifiers;
}

- (int64_t)shouldIncludeSharedWithYou
{
  return self->_shouldIncludeSharedWithYou;
}

- (ICItemIdentifier)overrideContainerIdentifier
{
  return self->_overrideContainerIdentifier;
}

void __100__ICFolderCoreDataIndexer_sortIdentifiersWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) accountObjectID];
  objc_msgSend(v2, "ic_existingObjectWithID:", v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "ic_refreshObject:mergeChanges:", v4, 1);
}

- (void)setAncestorObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_ancestorObjectID, a3);
  id v4 = [(ICFolderCoreDataIndexer *)self modernFolderFetchPredicate];
  uint64_t v5 = [(ICFolderCoreDataIndexer *)self modernFetchedResultsController];
  v6 = [v5 fetchRequest];
  [v6 setPredicate:v4];

  id v9 = [(ICFolderCoreDataIndexer *)self legacyFolderFetchPredicate];
  char v7 = [(ICFolderCoreDataIndexer *)self legacyFetchedResultsController];
  id v8 = [v7 fetchRequest];
  [v8 setPredicate:v9];
}

- (ICFolderCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4 overrideContainerIdentifier:(id)a5
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v39.receiver = self;
  v39.super_class = (Class)ICFolderCoreDataIndexer;
  id v11 = [(ICCoreDataIndexer *)&v39 initWithLegacyManagedObjectContext:v8 modernManagedObjectContext:v9];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_overrideContainerIdentifier, a5);
    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.notes.folder-list-index-access-queue", v13);
    indexAccessQueue = v12->_indexAccessQueue;
    v12->_indexAccessQueue = (OS_dispatch_queue *)v14;

    v12->_shouldIncludeTags = 0;
    v12->_shouldIncludeTagOperator = 0;
    v12->_shouldIncludeSystemPaper = 0;
    v12->_shouldIncludeMathNotes = 0;
    v12->_shouldIncludeCallNotes = 0;
    v12->_shouldIncludeSmartFolders = 1;
    v12->_shouldIncludeSharedWithYou = 0;
    v12->_shouldIncludeAccount = 0;
    v12->_shouldIncludeDefaultFolder = 1;
    *(_WORD *)&v12->_shouldIncludeTrash = 1;
    v12->_shouldIncludeSubfolders = 1;
    v12->_shouldIncludeLegacyAccounts = 1;
    v12->_shouldAutoExpandSingleSection = 1;
    if (v8)
    {
      long long v16 = (void *)MEMORY[0x1E4F1C0D0];
      long long v17 = ICLegacyEntityNameFolder();
      long long v18 = [v16 fetchRequestWithEntityName:v17];

      char v19 = [(ICFolderCoreDataIndexer *)v12 legacyFolderFetchPredicate];
      [v18 setPredicate:v19];

      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"name" ascending:1];
      v41[0] = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
      [v18 setSortDescriptors:v21];

      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F1C0F0]) initWithFetchRequest:v18 managedObjectContext:v8 sectionNameKeyPath:0 cacheName:0];
      legacyFetchedResultsController = v12->_legacyFetchedResultsController;
      v12->_legacyFetchedResultsController = (NSFetchedResultsController *)v22;
    }
    if (v9)
    {
      v24 = (void *)MEMORY[0x1E4F1C0D0];
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      v27 = [v24 fetchRequestWithEntityName:v26];

      [v27 setReturnsObjectsAsFaults:0];
      v28 = [(ICFolderCoreDataIndexer *)v12 modernFolderFetchPredicate];
      [v27 setPredicate:v28];

      v29 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"folderType" ascending:1];
      v40[0] = v29;
      v30 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1];
      v40[1] = v30;
      char v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
      [v27 setSortDescriptors:v31];

      uint64_t v32 = [objc_alloc(MEMORY[0x1E4F1C0F0]) initWithFetchRequest:v27 managedObjectContext:v9 sectionNameKeyPath:0 cacheName:0];
      modernFetchedResultsController = v12->_modernFetchedResultsController;
      v12->_modernFetchedResultsController = (NSFetchedResultsController *)v32;

      v34 = [ICTagCoreDataIndexer alloc];
      id v35 = +[ICFolderListSectionIdentifier tagSectionIdentifier];
      uint64_t v36 = [(ICTagCoreDataIndexer *)v34 initWithModernManagedObjectContext:v9 sectionIdentifier:v35];
      tagIndexer = v12->_tagIndexer;
      v12->_tagIndexer = (ICTagCoreDataIndexer *)v36;
    }
  }

  return v12;
}

- (id)modernFolderFetchPredicate
{
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"         isHiddenNoteContainer != YES AND          owner.didChooseToMigrate == YES AND          markedForDeletion != YES AND          needsInitialFetchFromCloud != YES AND          (folderType != %d || SUBQUERY(notes, $n, $n.markedForDeletion != YES).@count > 0)", 1];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithObject:v3];
  if (![(ICFolderCoreDataIndexer *)self shouldIncludeSmartFolders])
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"folderType != %d", 2);
    [v4 addObject:v5];
  }
  v6 = [(ICFolderCoreDataIndexer *)self accountObjectID];

  if (v6)
  {
    char v7 = (void *)MEMORY[0x1E4F28F60];
    id v8 = [(ICFolderCoreDataIndexer *)self accountObjectID];
    id v9 = [v7 predicateWithFormat:@"account == %@", v8];
    [v4 addObject:v9];
  }
  id v10 = [(ICFolderCoreDataIndexer *)self ancestorObjectID];

  if (v10)
  {
    id v11 = [(ICFolderCoreDataIndexer *)self modernDescendantsPredicate];
    [v4 addObject:v11];
  }
  uint64_t v12 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];

  return v12;
}

- (BOOL)shouldIncludeSmartFolders
{
  return self->_shouldIncludeSmartFolders;
}

- (NSManagedObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (id)legacyFolderFetchPredicate
{
  v24[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  if (![(ICFolderCoreDataIndexer *)self includeMigratedLocalLegacyAccounts]
    || ![(ICFolderCoreDataIndexer *)self includeMigratedICloudLegacyAccounts])
  {
    id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"account.didChooseToMigrate == nil OR account.didChooseToMigrate == NO"];
    if ([(ICFolderCoreDataIndexer *)self includeMigratedLocalLegacyAccounts]
      || [(ICFolderCoreDataIndexer *)self includeMigratedICloudLegacyAccounts])
    {
      BOOL v5 = [(ICFolderCoreDataIndexer *)self includeMigratedLocalLegacyAccounts];
      v6 = (void *)MEMORY[0x1E4F28F60];
      char v7 = [NSNumber numberWithInteger:!v5];
      id v8 = [v6 predicateWithFormat:@"account.type == %@", v7];

      id v9 = (void *)MEMORY[0x1E4F28BA0];
      v23[0] = v4;
      v23[1] = v8;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
      uint64_t v11 = [v9 orPredicateWithSubpredicates:v10];

      uint64_t v12 = (void *)MEMORY[0x1E4F28BA0];
      v22[0] = v3;
      v22[1] = v11;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
      dispatch_queue_t v14 = [v12 andPredicateWithSubpredicates:v13];

      uint64_t v3 = (void *)v11;
    }
    else
    {
      char v15 = (void *)MEMORY[0x1E4F28BA0];
      v24[0] = v3;
      v24[1] = v4;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      dispatch_queue_t v14 = [v15 andPredicateWithSubpredicates:v8];
    }

    if (![(ICFolderCoreDataIndexer *)self includeMigratedLocalLegacyAccounts]
      && [(ICFolderCoreDataIndexer *)self hideUnmigratedLocalLegacyAccounts])
    {
      long long v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"account.type != %@", &unk_1F09A4358];
      long long v17 = (void *)MEMORY[0x1E4F28BA0];
      v21[0] = v14;
      v21[1] = v16;
      long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
      uint64_t v19 = [v17 andPredicateWithSubpredicates:v18];

      dispatch_queue_t v14 = (void *)v19;
    }

    uint64_t v3 = v14;
  }
  return v3;
}

- (BOOL)includeMigratedLocalLegacyAccounts
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F83868]];

  return v3;
}

- (BOOL)includeMigratedICloudLegacyAccounts
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F83860]];

  return v3;
}

- (BOOL)hideUnmigratedLocalLegacyAccounts
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v2 BOOLForKey:*MEMORY[0x1E4F83820]]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F83818]];
  }

  return v3;
}

- (id)modernDescendantsPredicate
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__ICFolderCoreDataIndexer_modernDescendantsPredicate__block_invoke;
  v5[3] = &unk_1E5FDC168;
  v5[4] = self;
  id v2 = [MEMORY[0x1E4F83380] ancestorFolderPredicatesWithBlock:v5];
  char v3 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v2];

  return v3;
}

void __43__ICFolderCoreDataIndexer_isDefaultFolder___block_invoke(uint64_t a1)
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v3 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v5 = v3;
    char v4 = [v5 isDefaultFolderForAccount];
  }
  else
  {
    if (![v3 conformsToProtocol:&unk_1F0A657B8]) {
      return;
    }
    objc_opt_class();
    ICClassAndProtocolCast();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    char v4 = objc_msgSend(v5, "isDefaultFolder", &unk_1F0A657B8);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

void __42__ICFolderCoreDataIndexer_isCustomFolder___block_invoke(uint64_t a1)
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v3 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v5 = v3;
    char v4 = [v5 isSystemFolder];
  }
  else
  {
    if (![v3 conformsToProtocol:&unk_1F0A657B8]) {
      return;
    }
    objc_opt_class();
    ICClassAndProtocolCast();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    char v4 = objc_msgSend(v5, "isDefaultFolder", &unk_1F0A657B8);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 ^ 1;
}

id __53__ICFolderCoreDataIndexer_modernDescendantsPredicate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F28F60];
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 ancestorObjectID];
  v6 = [v2 predicateWithFormat:@"%K == %@", v4, v5];

  return v6;
}

void __127__ICFolderCoreDataIndexer_sortedFolderItemIdentifiersForItemIdentifiers_legacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        char v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v7, "ic_isModernAccountType", (void)v13))
        {
          [*(id *)(a1 + 40) addObject:v7];
          continue;
        }
        if (objc_msgSend(v7, "ic_isModernFolderType"))
        {
          id v8 = objc_msgSend(*(id *)(a1 + 48), "ic_existingObjectWithID:", v7);
          if ([*(id *)(a1 + 56) isDefaultFolder:v8])
          {
            id v9 = *(void **)(a1 + 64);
            goto LABEL_13;
          }
          if ([v8 isTrashFolder])
          {
            id v9 = *(void **)(a1 + 72);
LABEL_13:
            [v9 addObject:v7];
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 80), "ic_addNonNilObject:", v8);
          }

          continue;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 80) sortUsingSelector:sel_compare_];
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 80), "ic_map:", &__block_literal_global_178);
  uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (BOOL)isDefaultFolder:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ICFolderCoreDataIndexer_isDefaultFolder___block_invoke;
  v7[3] = &unk_1E5FDB2D0;
  id v5 = v3;
  id v8 = v5;
  id v9 = &v10;
  [v4 performBlockAndWait:v7];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

void __87__ICFolderCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke(uint64_t a1)
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) tagIndexer];
  id v3 = [v2 activeFetchedResultsControllers];
  int v4 = [v3 containsObject:*(void *)(a1 + 40)];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) tagIndexer];
    v6 = [v5 indexObjectsInSection:*(void *)(a1 + 48) sectionIndex:*(void *)(a1 + 64) fetchedResultsController:*(void *)(a1 + 40)];

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v6];
  }
  char v7 = *(void **)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) modernFetchedResultsController];

  if (v7 == v8)
  {
    [*(id *)(a1 + 32) addSystemSectionIfNeeded];
    if ([*(id *)(a1 + 32) shouldIncludeNewFolderButton])
    {
      id v9 = (void *)MEMORY[0x1E4F83278];
      uint64_t v10 = [*(id *)(a1 + 32) modernManagedObjectContext];
      uint64_t v11 = [v9 defaultAccountInContext:v10];

      if (!v11)
      {
        uint64_t v12 = [[ICFolderListSectionIdentifier alloc] initWithSectionType:6];
        char v13 = [*(id *)(a1 + 32) folderListSectionIdentifiers];
        [v13 addObject:v12];

        long long v14 = [*(id *)(a1 + 32) folderListSectionIdentifiersToButtonIdentifiers];
        long long v15 = [v14 objectForKeyedSubscript:v12];
        long long v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v17 = [MEMORY[0x1E4F1CA70] orderedSet];
        }
        uint64_t v18 = v17;

        uint64_t v19 = [[ICButtonItemIdentifier alloc] initWithType:0 parentIdentifier:v12];
        [v18 addObject:v19];
        uint64_t v20 = [[ICButtonItemIdentifier alloc] initWithType:1 parentIdentifier:v12];
        [v18 addObject:v20];
        v21 = [*(id *)(a1 + 32) folderListSectionIdentifiersToButtonIdentifiers];
        [v21 setObject:v18 forKeyedSubscript:v12];
      }
    }
  }
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id obj = [*(id *)(a1 + 48) objects];
  uint64_t v130 = [obj countByEnumeratingWithState:&v135 objects:v141 count:16];
  if (v130)
  {
    uint64_t v22 = *(void *)v136;
    uint64_t v128 = *(void *)v136;
    do
    {
      for (uint64_t i = 0; i != v130; ++i)
      {
        if (*(void *)v136 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v135 + 1) + 8 * i);
        v25 = [v24 objectID];
        v26 = [[ICFolderListSectionIdentifier alloc] initWithObject:v24];
        if (v26)
        {
          v27 = [*(id *)(a1 + 32) folderListSectionIdentifiersToButtonIdentifiers];
          v28 = [v27 objectForKeyedSubscript:v26];
          v29 = v28;
          if (v28)
          {
            v30 = v28;
          }
          else
          {
            v30 = [MEMORY[0x1E4F1CA70] orderedSet];
          }
          v133 = v30;

          uint64_t v32 = [*(id *)(a1 + 32) folderListSectionIdentifiersToVirtualSmartFolderIdentifiers];
          v33 = [v32 objectForKeyedSubscript:v26];
          v34 = v33;
          if (v33)
          {
            id v35 = v33;
          }
          else
          {
            id v35 = [MEMORY[0x1E4F1CA70] orderedSet];
          }
          v134 = v35;

          uint64_t v36 = [*(id *)(a1 + 32) folderListSectionIdentifiersToFolderItemIdentifiers];
          v37 = [v36 objectForKeyedSubscript:v26];
          v38 = v37;
          if (v37)
          {
            id v39 = v37;
          }
          else
          {
            id v39 = [MEMORY[0x1E4F1CA70] orderedSet];
          }
          v131 = v39;
          char v31 = v133;

          objc_opt_class();
          v132 = v25;
          if (objc_opt_isKindOfClass())
          {
            id v40 = v24;
            v41 = v134;
            if ([v40 isVisible])
            {
              v42 = v131;
              if ((([*(id *)(a1 + 32) shouldIncludeTrash] & 1) != 0
                 || ([v40 isTrashFolder] & 1) == 0)
                && (([*(id *)(a1 + 32) shouldIncludeDefaultFolder] & 1) != 0
                 || ([v40 isDefaultFolderForAccount] & 1) == 0))
              {
                v43 = [*(id *)(a1 + 32) modernAccountManagedObjectIDs];
                v44 = [(ICFolderListSectionIdentifier *)v26 accountObjectID];
                objc_msgSend(v43, "ic_addNonNilObject:", v44);

                if ([*(id *)(a1 + 32) shouldIncludeNewFolderButton]
                  && [(ICFolderListSectionIdentifier *)v26 sectionType])
                {
                  v45 = [[ICButtonItemIdentifier alloc] initWithType:0 parentIdentifier:v26];
                  [v133 addObject:v45];
                }
                if ([*(id *)(a1 + 32) shouldIncludeSystemPaper] == 1)
                {
                  v46 = [v40 account];
                  v47 = [v46 virtualSystemPaperFolder];
                  [v134 addObject:v47];

                  objc_opt_class();
                  v48 = [*(id *)(a1 + 32) virtualSmartFolderIdentifiers];
                  v49 = ICCheckedDynamicCast();
                  v50 = [v40 account];
                  v51 = [v50 virtualSystemPaperFolder];
                  [v49 addObject:v51];

                  char v31 = v133;
                  uint64_t v22 = v128;
                }
                if ([*(id *)(a1 + 32) shouldIncludeMathNotes] == 1)
                {
                  v52 = [v40 account];
                  v53 = [v52 virtualMathNotesFolder];
                  [v134 addObject:v53];

                  objc_opt_class();
                  v54 = [*(id *)(a1 + 32) virtualSmartFolderIdentifiers];
                  v55 = ICCheckedDynamicCast();
                  v56 = [v40 account];
                  v57 = [v56 virtualMathNotesFolder];
                  [v55 addObject:v57];

                  uint64_t v22 = v128;
                  char v31 = v133;
                }
                v41 = v134;
                if ([*(id *)(a1 + 32) shouldIncludeCallNotes] == 1)
                {
                  v58 = [v40 account];
                  v59 = [v58 virtualCallNotesFolder];
                  [v134 addObject:v59];

                  objc_opt_class();
                  v60 = [*(id *)(a1 + 32) virtualSmartFolderIdentifiers];
                  v61 = ICCheckedDynamicCast();
                  v62 = [v40 account];
                  v63 = [v62 virtualCallNotesFolder];
                  [v61 addObject:v63];

                  uint64_t v22 = v128;
                  v41 = v134;

                  char v31 = v133;
                }
                uint64_t v64 = [v40 parent];
                if (v64)
                {
                  v65 = (void *)v64;
                  v66 = [v40 parent];
                  v67 = [v66 objectID];
                  v68 = [*(id *)(a1 + 32) ancestorObjectID];
                  char v69 = [v67 isEqual:v68];

                  uint64_t v22 = v128;
                  v41 = v134;

                  char v31 = v133;
                  if ((v69 & 1) == 0)
                  {
                    v70 = [*(id *)(a1 + 32) folderItemIdentifiersToChildFolderItemIdentifiers];
                    v71 = [v40 parent];
                    v72 = [v71 objectID];
                    v73 = [v70 objectForKeyedSubscript:v72];
                    v74 = v73;
                    if (v73)
                    {
                      id v75 = v73;
                    }
                    else
                    {
                      id v75 = [MEMORY[0x1E4F1CA70] orderedSet];
                    }
                    v96 = v75;

                    v97 = [v40 objectID];
                    [v96 addObject:v97];

                    v98 = [*(id *)(a1 + 32) folderItemIdentifiersToChildFolderItemIdentifiers];
                    v99 = [v40 parent];
                    v100 = [v99 objectID];
                    [v98 setObject:v96 forKeyedSubscript:v100];

                    v101 = [v40 parent];
                    v102 = [v101 objectID];
                    v103 = [*(id *)(a1 + 32) folderItemIdentifiersToParentFolderItemIdentifier];
                    v104 = [v40 objectID];
                    [v103 setObject:v102 forKeyedSubscript:v104];

                    uint64_t v22 = v128;
                    char v31 = v133;
                    v41 = v134;
                  }
                }
                if ([v40 isSmartFolder])
                {
                  v105 = [*(id *)(a1 + 32) smartFolderManagedObjectIDs];
                  v106 = [v40 objectID];
                  objc_msgSend(v105, "ic_addNonNilObject:", v106);

                  char v31 = v133;
                }
                v77 = [*(id *)(a1 + 32) modernManagedObjectContext];
                objc_msgSend(v77, "ic_refreshObject:mergeChanges:", v40, 1);
                goto LABEL_69;
              }
LABEL_73:

              v25 = v132;
              goto LABEL_74;
            }
LABEL_49:
            v42 = v131;
            goto LABEL_73;
          }
          v41 = v134;
          if ([v24 conformsToProtocol:&unk_1F0A657B8])
          {
            objc_opt_class();
            ICClassAndProtocolCast();
            id v40 = (id)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(*(id *)(a1 + 32), "shouldIncludeTrash", &unk_1F0A657B8) & 1) == 0
              && ([v40 isTrashFolder] & 1) != 0)
            {
              goto LABEL_49;
            }
            v42 = v131;
            if (([*(id *)(a1 + 32) shouldIncludeDefaultFolder] & 1) == 0
              && ([v40 isDefaultFolder] & 1) != 0)
            {
              goto LABEL_73;
            }
            v76 = [v40 ancestorFolders];
            v77 = [v76 valueForKey:@"objectID"];

            uint64_t v78 = [*(id *)(a1 + 32) ancestorObjectID];
            if (v78)
            {
              v79 = (void *)v78;
              v80 = [*(id *)(a1 + 32) ancestorObjectID];
              int v81 = [v77 containsObject:v80];

              if (!v81)
              {

                uint64_t v22 = v128;
                char v31 = v133;
                v41 = v134;
                goto LABEL_73;
              }
            }
            v82 = [*(id *)(a1 + 32) legacyAccountManagedObjectIDs];
            v83 = [(ICFolderListSectionIdentifier *)v26 accountObjectID];
            objc_msgSend(v82, "ic_addNonNilObject:", v83);

            uint64_t v84 = [v40 parentFolder];
            if (v84)
            {
              v85 = (void *)v84;
              v127 = v77;
              v86 = [v40 parentFolder];
              v87 = [v86 objectID];
              v88 = [*(id *)(a1 + 32) ancestorObjectID];
              char v89 = [v87 isEqual:v88];

              if ((v89 & 1) == 0)
              {
                v90 = [*(id *)(a1 + 32) folderItemIdentifiersToChildFolderItemIdentifiers];
                v91 = [v40 parentFolder];
                v92 = [v91 objectID];
                v93 = [v90 objectForKeyedSubscript:v92];
                v94 = v93;
                if (v93)
                {
                  id v95 = v93;
                }
                else
                {
                  id v95 = [MEMORY[0x1E4F1CA70] orderedSet];
                }
                v107 = v95;

                v108 = [v40 objectID];
                [v107 addObject:v108];

                v109 = [*(id *)(a1 + 32) folderItemIdentifiersToChildFolderItemIdentifiers];
                v110 = [v40 parentFolder];
                v111 = [v110 objectID];
                [v109 setObject:v107 forKeyedSubscript:v111];

                v112 = [v40 parentFolder];
                v113 = [v112 objectID];
                v114 = [*(id *)(a1 + 32) folderItemIdentifiersToParentFolderItemIdentifier];
                v115 = [v40 objectID];
                [v114 setObject:v113 forKeyedSubscript:v115];
              }
              v77 = v127;
              uint64_t v22 = v128;
            }
            else
            {
              uint64_t v22 = v128;
            }
            char v31 = v133;
            v41 = v134;
LABEL_69:

            v25 = v132;
          }
          v116 = [(ICFolderListSectionIdentifier *)v26 accountObjectID];

          if (v116)
          {
            v117 = [*(id *)(a1 + 32) folderListSectionIdentifiers];
            objc_msgSend(v117, "ic_addNonNilObject:", v26);
          }
          v42 = v131;
          objc_msgSend(v131, "ic_addNonNilObject:", v25);
          v118 = [*(id *)(a1 + 32) folderListSectionIdentifiersToButtonIdentifiers];
          [v118 setObject:v31 forKeyedSubscript:v26];

          v119 = [*(id *)(a1 + 32) folderListSectionIdentifiersToVirtualSmartFolderIdentifiers];
          [v119 setObject:v41 forKeyedSubscript:v26];

          v120 = [*(id *)(a1 + 32) folderListSectionIdentifiersToFolderItemIdentifiers];
          [v120 setObject:v131 forKeyedSubscript:v26];

          [*(id *)(a1 + 32) addAccountItemsIfNeededForFolderSectionIdentifier:v26];
          v121 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          id v40 = [v24 objectID];
          [v121 addObject:v40];
          goto LABEL_73;
        }
        char v31 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v140 = v24;
          _os_log_debug_impl(&dword_1B08EB000, v31, OS_LOG_TYPE_DEBUG, "Cannot create folder list section identifier from object %@", buf, 0xCu);
        }
LABEL_74:
      }
      uint64_t v130 = [obj countByEnumeratingWithState:&v135 objects:v141 count:16];
    }
    while (v130);
  }

  if ([*(id *)(a1 + 32) shouldIncludeTags])
  {
    v122 = [*(id *)(a1 + 32) tagIndexer];
    v123 = [v122 objectIDs];
    uint64_t v124 = [v123 count];

    if (v124)
    {
      v125 = [*(id *)(a1 + 32) folderListSectionIdentifiers];
      v126 = +[ICFolderListSectionIdentifier tagSectionIdentifier];
      objc_msgSend(v125, "ic_addNonNilObject:", v126);
    }
  }
}

- (NSMutableDictionary)folderListSectionIdentifiersToFolderItemIdentifiers
{
  return self->_folderListSectionIdentifiersToFolderItemIdentifiers;
}

- (NSMutableDictionary)folderListSectionIdentifiersToVirtualSmartFolderIdentifiers
{
  return self->_folderListSectionIdentifiersToVirtualSmartFolderIdentifiers;
}

- (NSMutableDictionary)folderListSectionIdentifiersToButtonIdentifiers
{
  return self->_folderListSectionIdentifiersToButtonIdentifiers;
}

- (NSMutableOrderedSet)folderListSectionIdentifiers
{
  return self->_folderListSectionIdentifiers;
}

- (BOOL)shouldIncludeNewFolderButton
{
  return self->_shouldIncludeNewFolderButton;
}

- (int64_t)shouldIncludeSystemPaper
{
  return self->_shouldIncludeSystemPaper;
}

- (int64_t)shouldIncludeMathNotes
{
  return self->_shouldIncludeMathNotes;
}

- (int64_t)shouldIncludeCallNotes
{
  return self->_shouldIncludeCallNotes;
}

- (NSMutableSet)modernAccountManagedObjectIDs
{
  return self->_modernAccountManagedObjectIDs;
}

- (BOOL)shouldIncludeTrash
{
  return self->_shouldIncludeTrash;
}

- (BOOL)shouldIncludeDefaultFolder
{
  return self->_shouldIncludeDefaultFolder;
}

- (void)addAccountItemsIfNeededForFolderSectionIdentifier:(id)a3
{
  id v11 = a3;
  if ([(ICFolderCoreDataIndexer *)self shouldIncludeAccount] != 2)
  {
    int v4 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiersToFolderItemIdentifiers];
    id v5 = [v4 objectForKeyedSubscript:v11];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F1CA70] orderedSet];
    }
    id v8 = v7;

    if ([(ICFolderCoreDataIndexer *)self shouldIncludeAccount] == 1
      || [(ICFolderCoreDataIndexer *)self itemIdentifiersContainCustomFolder:v8])
    {
      id v9 = [v11 accountObjectID];
      objc_msgSend(v8, "ic_addNonNilObject:", v9);
    }
    uint64_t v10 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiersToFolderItemIdentifiers];
    [v10 setObject:v8 forKeyedSubscript:v11];
  }
}

- (int64_t)shouldIncludeAccount
{
  return self->_shouldIncludeAccount;
}

- (BOOL)itemIdentifiersContainCustomFolder:(id)a3
{
  int v4 = [a3 array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__ICFolderCoreDataIndexer_itemIdentifiersContainCustomFolder___block_invoke;
  v6[3] = &unk_1E5FDB3E0;
  v6[4] = self;
  LOBYTE(self) = objc_msgSend(v4, "ic_containsObjectPassingTest:", v6);

  return (char)self;
}

- (ICTagCoreDataIndexer)tagIndexer
{
  return self->_tagIndexer;
}

- (id)activeFetchedResultsControllers
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = [(ICFolderCoreDataIndexer *)self modernFetchedResultsController];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = [(ICFolderCoreDataIndexer *)self ancestorObjectID];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [(ICFolderCoreDataIndexer *)self ancestorObjectID];
      int v9 = objc_msgSend(v8, "ic_isModernContainerType");

      if (!v9) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    uint64_t v10 = [(ICFolderCoreDataIndexer *)self modernFetchedResultsController];
    [v3 addObject:v10];
  }
LABEL_7:
  id v11 = [(ICFolderCoreDataIndexer *)self legacyFetchedResultsController];
  if (!v11 || ![(ICFolderCoreDataIndexer *)self shouldIncludeLegacyAccounts]) {
    goto LABEL_14;
  }
  uint64_t v12 = [(ICFolderCoreDataIndexer *)self ancestorObjectID];
  if (!v12)
  {

    goto LABEL_13;
  }
  char v13 = (void *)v12;
  long long v14 = [(ICFolderCoreDataIndexer *)self ancestorObjectID];
  int v15 = objc_msgSend(v14, "ic_isLegacyContainerType");

  if (v15)
  {
LABEL_13:
    id v11 = [(ICFolderCoreDataIndexer *)self legacyFetchedResultsController];
    [v3 addObject:v11];
LABEL_14:
  }
  if ([(ICFolderCoreDataIndexer *)self shouldIncludeTags])
  {
    long long v16 = [(ICFolderCoreDataIndexer *)self tagIndexer];
    id v17 = [v16 activeFetchedResultsControllers];
    uint64_t v18 = [v17 allObjects];
    [v3 addObjectsFromArray:v18];
  }
  uint64_t v19 = (void *)[v3 copy];

  return v19;
}

- (NSManagedObjectID)ancestorObjectID
{
  return self->_ancestorObjectID;
}

- (NSFetchedResultsController)modernFetchedResultsController
{
  return self->_modernFetchedResultsController;
}

- (BOOL)shouldIncludeTags
{
  return self->_shouldIncludeTags;
}

- (NSFetchedResultsController)legacyFetchedResultsController
{
  return self->_legacyFetchedResultsController;
}

- (BOOL)shouldIncludeLegacyAccounts
{
  return self->_shouldIncludeLegacyAccounts;
}

- (void)addSystemSectionIfNeeded
{
  id v3 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiersToVirtualSmartFolderIdentifiers];
  uint64_t v4 = +[ICFolderListSectionIdentifier systemSectionIdentifier];
  id v5 = [v3 objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA70] orderedSet];
  }
  id v8 = v7;

  int v9 = [(ICCoreDataIndexer *)self modernManagedObjectContext];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __51__ICFolderCoreDataIndexer_addSystemSectionIfNeeded__block_invoke;
  uint64_t v18 = &unk_1E5FD91D0;
  uint64_t v19 = self;
  id v10 = v8;
  id v20 = v10;
  [v9 performBlockAndWait:&v15];

  if (objc_msgSend(v10, "count", v15, v16, v17, v18, v19))
  {
    id v11 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiers];
    uint64_t v12 = +[ICFolderListSectionIdentifier systemSectionIdentifier];
    [v11 addObject:v12];

    char v13 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiersToVirtualSmartFolderIdentifiers];
    long long v14 = +[ICFolderListSectionIdentifier systemSectionIdentifier];
    [v13 setObject:v10 forKeyedSubscript:v14];
  }
}

- (void)setShouldIncludeSubfolders:(BOOL)a3
{
  self->_shouldIncludeSubfolders = a3;
}

- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  int v9 = [(ICFolderCoreDataIndexer *)self indexAccessQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__ICFolderCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v16[3] = &unk_1E5FDA5F8;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v10 = v8;
  id v19 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_sync(v9, v16);

  char v13 = v19;
  id v14 = v10;

  return v14;
}

- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  char v23 = __Block_byref_object_copy__46;
  v24 = __Block_byref_object_dispose__46;
  id v25 = [MEMORY[0x1E4F1CA48] array];
  id v10 = [(ICFolderCoreDataIndexer *)self indexAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__ICFolderCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke;
  block[3] = &unk_1E5FDC0F0;
  block[4] = self;
  id v11 = v9;
  id v16 = v11;
  id v12 = v8;
  id v18 = &v20;
  unint64_t v19 = a4;
  id v17 = v12;
  dispatch_sync(v10, block);

  char v13 = (void *)[(id)v21[5] copy];
  _Block_object_dispose(&v20, 8);

  return v13;
}

- (OS_dispatch_queue)indexAccessQueue
{
  return self->_indexAccessQueue;
}

- (void)sortIdentifiersWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v6 = a4;
  id v7 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiers];
  id v8 = +[ICFolderListSectionIdentifier sortDescriptors];
  [v7 sortUsingDescriptors:v8];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v9 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiersToFolderItemIdentifiers];
  id v10 = (void *)[v9 copy];

  id obj = v10;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v16 = [v15 accountObjectID];

        if (v16)
        {
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          void v41[2] = __100__ICFolderCoreDataIndexer_sortIdentifiersWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke;
          v41[3] = &unk_1E5FD91D0;
          id v42 = v6;
          v43 = v15;
          [v42 performBlockAndWait:v41];
        }
        id v17 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiersToFolderItemIdentifiers];
        id v18 = [v17 objectForKeyedSubscript:v15];

        unint64_t v19 = [(ICFolderCoreDataIndexer *)self sortedFolderItemIdentifiersForItemIdentifiers:v18 legacyManagedObjectContext:v36 modernManagedObjectContext:v6];
        uint64_t v20 = (void *)[v19 mutableCopy];
        v21 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiersToFolderItemIdentifiers];
        [v21 setObject:v20 forKeyedSubscript:v15];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v12);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v22 = [(ICFolderCoreDataIndexer *)self folderItemIdentifiersToChildFolderItemIdentifiers];
  char v23 = (void *)[v22 copy];

  id v35 = v23;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(v35);
        }
        uint64_t v28 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        v29 = [(ICFolderCoreDataIndexer *)self folderItemIdentifiersToChildFolderItemIdentifiers];
        v30 = [v29 objectForKeyedSubscript:v28];

        char v31 = [(ICFolderCoreDataIndexer *)self sortedFolderItemIdentifiersForItemIdentifiers:v30 legacyManagedObjectContext:v36 modernManagedObjectContext:v6];
        uint64_t v32 = (void *)[v31 mutableCopy];
        v33 = [(ICFolderCoreDataIndexer *)self folderItemIdentifiersToChildFolderItemIdentifiers];
        [v33 setObject:v32 forKeyedSubscript:v28];
      }
      uint64_t v25 = [v35 countByEnumeratingWithState:&v37 objects:v48 count:16];
    }
    while (v25);
  }
}

- (unint64_t)totalFolderCount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiersToFolderItemIdentifiers];
  id v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) count];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 == 1)
  {
    long long v10 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v11 = [(ICFolderCoreDataIndexer *)self indexAccessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__ICFolderCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke;
    block[3] = &unk_1E5FDB390;
    block[4] = self;
    id v16 = v8;
    id v18 = v10;
    uint64_t v19 = 1;
    id v17 = v9;
    id v12 = v10;
    dispatch_sync(v11, block);

    long long v13 = (void *)[v12 copy];
  }
  else
  {
    long long v13 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v13;
}

- (id)sortedFolderItemIdentifiersForItemIdentifiers:(id)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__46;
  v60 = __Block_byref_object_dispose__46;
  id v61 = 0;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__46;
  v54 = __Block_byref_object_dispose__46;
  id v55 = 0;
  long long v13 = [MEMORY[0x1E4F1CA48] array];
  id v14 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  void v41[2] = __127__ICFolderCoreDataIndexer_sortedFolderItemIdentifiersForItemIdentifiers_legacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v41[3] = &unk_1E5FDC1B0;
  id v16 = v8;
  id v42 = v16;
  id v17 = v13;
  id v43 = v17;
  id v18 = v10;
  id v44 = v18;
  long long v45 = self;
  id v19 = v14;
  id v46 = v19;
  id v20 = v15;
  id v47 = v20;
  id v21 = v11;
  id v48 = v21;
  v49 = &v56;
  [v18 performBlockAndWait:v41];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  uint64_t v32 = __127__ICFolderCoreDataIndexer_sortedFolderItemIdentifiersForItemIdentifiers_legacyManagedObjectContext_modernManagedObjectContext___block_invoke_3;
  v33 = &unk_1E5FDC1D8;
  id v22 = v16;
  id v34 = v22;
  id v23 = v17;
  id v35 = v23;
  id v24 = v9;
  id v36 = v24;
  long long v37 = self;
  id v25 = v19;
  id v38 = v25;
  id v26 = v12;
  id v39 = v26;
  long long v40 = &v50;
  [v24 performBlockAndWait:&v30];
  v27 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSet", v30, v31, v32, v33);
  [v27 addObjectsFromArray:v23];
  [v27 addObjectsFromArray:v25];
  [v27 addObjectsFromArray:v57[5]];
  [v27 addObjectsFromArray:v51[5]];
  [v27 addObjectsFromArray:v20];
  uint64_t v28 = (void *)[v27 copy];

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  return v28;
}

- (void)didIndex
{
  id v3 = [(ICFolderCoreDataIndexer *)self indexAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__ICFolderCoreDataIndexer_didIndex__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __35__ICFolderCoreDataIndexer_didIndex__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tagIndexer];
  [v1 didIndex];
}

void __36__ICFolderCoreDataIndexer_willIndex__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tagIndexer];
  [v2 willIndex];

  id v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  [*(id *)(a1 + 32) setFolderListSectionIdentifiers:v3];

  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(a1 + 32) setFolderListSectionIdentifiersToButtonIdentifiers:v4];

  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(a1 + 32) setFolderListSectionIdentifiersToVirtualSmartFolderIdentifiers:v5];

  unint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(a1 + 32) setFolderListSectionIdentifiersToFolderItemIdentifiers:v6];

  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(a1 + 32) setFolderItemIdentifiersToParentFolderItemIdentifier:v7];

  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(a1 + 32) setFolderItemIdentifiersToChildFolderItemIdentifiers:v8];

  id v9 = [MEMORY[0x1E4F1CA80] set];
  [*(id *)(a1 + 32) setLegacyAccountManagedObjectIDs:v9];

  id v10 = [MEMORY[0x1E4F1CA80] set];
  [*(id *)(a1 + 32) setModernAccountManagedObjectIDs:v10];

  long long v11 = [MEMORY[0x1E4F1CA80] set];
  [*(id *)(a1 + 32) setSmartFolderManagedObjectIDs:v11];

  id v12 = [MEMORY[0x1E4F1CA80] set];
  [*(id *)(a1 + 32) setVirtualSmartFolderIdentifiers:v12];
}

void __112__ICFolderCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) sortIdentifiersWithLegacyManagedObjectContext:*(void *)(a1 + 40) modernManagedObjectContext:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) sectionIdentifiersForSectionType:*(void *)(a1 + 64)];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v45 = [v2 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v45)
  {
    id v43 = v2;
    uint64_t v44 = *(void *)v51;
    unint64_t v3 = 0x1E4F1C000uLL;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v51 != v44) {
          objc_enumerationMutation(v2);
        }
        uint64_t v5 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
        uint64_t v7 = [*(id *)(a1 + 32) folderListSectionIdentifiersToButtonIdentifiers];
        id v8 = [v7 objectForKeyedSubscript:v5];
        id v9 = v8;
        if (v8)
        {
          id v10 = v8;
        }
        else
        {
          id v10 = [MEMORY[0x1E4F1CAA0] orderedSet];
        }
        long long v11 = v10;

        id v12 = [*(id *)(a1 + 32) folderListSectionIdentifiersToVirtualSmartFolderIdentifiers];
        long long v13 = [v12 objectForKeyedSubscript:v5];
        id v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [MEMORY[0x1E4F1CAA0] orderedSet];
        }
        id v16 = v15;

        if ([v5 sectionType])
        {
          if ([v5 sectionType] == 8)
          {
            v59 = v5;
            id v17 = [*(id *)(v3 + 2424) arrayWithObjects:&v59 count:1];
            [v6 appendItems:v17];

            if ([*(id *)(a1 + 32) shouldIncludeTagOperator])
            {
              id v18 = +[ICTagOperatorItemIdentifier sharedItemIdentifier];
              uint64_t v58 = v18;
              id v19 = [*(id *)(v3 + 2424) arrayWithObjects:&v58 count:1];
              [v6 appendItems:v19 intoParent:v5];
            }
            id v20 = [v11 array];
            [v6 appendItems:v20 intoParent:v5];

            id v21 = [v16 array];
            [v6 appendItems:v21 intoParent:v5];

            id v22 = +[ICTagContainerItemIdentifier sharedItemIdentifier];
            id v57 = v22;
            id v23 = [*(id *)(v3 + 2424) arrayWithObjects:&v57 count:1];
            [v6 appendItems:v23 intoParent:v5];
          }
          else
          {
            id v22 = [*(id *)(a1 + 32) rootFolderListSectionIdentifiersForSection:v5];
            if ([*(id *)(a1 + 32) shouldIncludeOutlineParentItems])
            {
              uint64_t v56 = v5;
              id v25 = [*(id *)(v3 + 2424) arrayWithObjects:&v56 count:1];
              [v6 appendItems:v25];

              id v26 = [v11 array];
              [v6 appendItems:v26 intoParent:v5];

              v27 = [v16 array];
              [v6 appendItems:v27 intoParent:v5];

              uint64_t v28 = [v22 array];
              [v6 appendItems:v28 intoParent:v5];
            }
            else
            {
              v29 = [v11 array];
              [v6 appendItems:v29];

              uint64_t v30 = [v16 array];
              [v6 appendItems:v30];

              uint64_t v28 = [v22 array];
              [v6 appendItems:v28];
            }

            if ([*(id *)(a1 + 32) shouldIncludeSubfolders])
            {
              long long v48 = 0u;
              long long v49 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              id v22 = v22;
              uint64_t v31 = [v22 countByEnumeratingWithState:&v46 objects:v55 count:16];
              if (v31)
              {
                uint64_t v32 = v31;
                uint64_t v33 = *(void *)v47;
                do
                {
                  for (uint64_t j = 0; j != v32; ++j)
                  {
                    if (*(void *)v47 != v33) {
                      objc_enumerationMutation(v22);
                    }
                    [*(id *)(a1 + 32) addChildFoldersOfParentFolder:*(void *)(*((void *)&v46 + 1) + 8 * j) toSectionSnapshot:v6];
                  }
                  uint64_t v32 = [v22 countByEnumeratingWithState:&v46 objects:v55 count:16];
                }
                while (v32);
              }

              id v2 = v43;
              unint64_t v3 = 0x1E4F1C000;
            }
          }
        }
        else
        {
          id v24 = [v11 array];
          [v6 appendItems:v24];

          id v22 = [v16 array];
          [v6 appendItems:v22];
        }

        if ([*(id *)(a1 + 32) shouldIncludeOutlineParentItems])
        {
          id v35 = +[ICExpansionState sharedExpansionState];
          id v36 = [*(id *)(a1 + 32) expansionStateContext];
          int v37 = [v35 isSectionIdentiferExpanded:v5 inContext:v36];

          if ([*(id *)(a1 + 32) shouldAutoExpandSingleSection]
            && ([v2 count] != 1 ? (char v38 = 1) : (char v38 = v37), (v38 & 1) == 0))
          {
            id v39 = [*(id *)(a1 + 32) expansionStateContext];
            [v35 expandItemIdentifier:v5 context:v39];
          }
          else if (!v37)
          {
LABEL_41:

            unint64_t v3 = 0x1E4F1C000;
            goto LABEL_42;
          }
          long long v40 = [v6 items];
          int v41 = [v40 containsObject:v5];

          if (v41)
          {
            v54 = v5;
            id v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
            [v6 expandItems:v42];
          }
          goto LABEL_41;
        }
LABEL_42:
        [*(id *)(a1 + 56) setObject:v6 forKeyedSubscript:v5];
      }
      uint64_t v45 = [v2 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v45);
  }
}

- (void)addChildFoldersOfParentFolder:(id)a3 toSectionSnapshot:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICFolderCoreDataIndexer *)self folderItemIdentifiersToChildFolderItemIdentifiers];
  id v9 = [v8 objectForKeyedSubscript:v6];

  id v10 = [v9 array];
  [v7 appendItems:v10 intoParent:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[ICFolderCoreDataIndexer addChildFoldersOfParentFolder:toSectionSnapshot:](self, "addChildFoldersOfParentFolder:toSectionSnapshot:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), v7, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (NSMutableDictionary)folderItemIdentifiersToChildFolderItemIdentifiers
{
  return self->_folderItemIdentifiersToChildFolderItemIdentifiers;
}

void __105__ICFolderCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) sortIdentifiersWithLegacyManagedObjectContext:*(void *)(a1 + 40) modernManagedObjectContext:*(void *)(a1 + 48)];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = [*(id *)(a1 + 32) folderListSectionIdentifiers];
  uint64_t v2 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v55 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v66 != v55) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(a1 + 56);
        uint64_t v73 = *(void *)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v5 = v73;
        id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
        [v6 appendSectionsWithIdentifiers:v7];

        id v8 = [*(id *)(a1 + 32) folderListSectionIdentifiersToButtonIdentifiers];
        id v9 = [v8 objectForKeyedSubscript:v5];
        id v10 = v9;
        if (v9)
        {
          id v11 = v9;
        }
        else
        {
          id v11 = [MEMORY[0x1E4F1CAA0] orderedSet];
        }
        uint64_t v12 = v11;

        uint64_t v13 = *(void **)(a1 + 56);
        uint64_t v14 = [v12 array];
        [v13 appendItemsWithIdentifiers:v14 intoSectionWithIdentifier:v5];

        uint64_t v15 = [*(id *)(a1 + 32) folderListSectionIdentifiersToVirtualSmartFolderIdentifiers];
        long long v16 = [v15 objectForKeyedSubscript:v5];
        long long v17 = v16;
        if (v16)
        {
          id v18 = v16;
        }
        else
        {
          id v18 = [MEMORY[0x1E4F1CAA0] orderedSet];
        }
        long long v19 = v18;

        id v20 = *(void **)(a1 + 56);
        uint64_t v21 = [v19 array];
        [v20 appendItemsWithIdentifiers:v21 intoSectionWithIdentifier:v5];

        id v22 = [*(id *)(a1 + 32) folderListSectionIdentifiersToFolderItemIdentifiers];
        id v23 = [v22 objectForKeyedSubscript:v5];
        id v24 = v23;
        if (v23)
        {
          id v25 = v23;
        }
        else
        {
          id v25 = [MEMORY[0x1E4F1CAA0] orderedSet];
        }
        id v26 = v25;

        v27 = *(void **)(a1 + 56);
        uint64_t v28 = [v26 array];
        [v27 appendItemsWithIdentifiers:v28 intoSectionWithIdentifier:v5];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
    }
    while (v3);
  }

  v29 = [MEMORY[0x1E4F1CA48] array];
  if ([*(id *)(a1 + 32) shouldIncludeTags])
  {
    uint64_t v30 = [*(id *)(a1 + 32) tagIndexer];
    uint64_t v31 = (void *)[v30 newSnapshotFromIndexWithLegacyManagedObjectContext:*(void *)(a1 + 40) modernManagedObjectContext:*(void *)(a1 + 48)];

    if ([*(id *)(a1 + 32) shouldIncludeTagOperator])
    {
      uint64_t v32 = *(void **)(a1 + 56);
      uint64_t v33 = +[ICTagOperatorItemIdentifier sharedItemIdentifier];
      v72 = v33;
      id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
      id v35 = [*(id *)(a1 + 56) itemIdentifiers];
      id v36 = [v35 firstObject];
      [v32 insertItemsWithIdentifiers:v34 beforeItemWithIdentifier:v36];
    }
    objc_msgSend(v29, "ic_addNonNilObject:", v31);
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v51 = v29;
  id obja = (id)[v51 countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (obja)
  {
    uint64_t v52 = *(void *)v62;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v62 != v52) {
          objc_enumerationMutation(v51);
        }
        uint64_t v56 = v37;
        char v38 = *(void **)(*((void *)&v61 + 1) + 8 * v37);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v39 = [v38 sectionIdentifiers];
        uint64_t v40 = [v39 countByEnumeratingWithState:&v57 objects:v70 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v58;
          do
          {
            for (uint64_t j = 0; j != v41; ++j)
            {
              if (*(void *)v58 != v42) {
                objc_enumerationMutation(v39);
              }
              uint64_t v44 = *(void *)(*((void *)&v57 + 1) + 8 * j);
              uint64_t v45 = [*(id *)(a1 + 56) sectionIdentifiers];
              char v46 = [v45 containsObject:v44];

              if ((v46 & 1) == 0)
              {
                long long v47 = *(void **)(a1 + 56);
                uint64_t v69 = v44;
                long long v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
                [v47 appendSectionsWithIdentifiers:v48];
              }
              long long v49 = *(void **)(a1 + 56);
              long long v50 = [v38 itemIdentifiersInSectionWithIdentifier:v44];
              [v49 appendItemsWithIdentifiers:v50 intoSectionWithIdentifier:v44];
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v57 objects:v70 count:16];
          }
          while (v41);
        }

        uint64_t v37 = v56 + 1;
      }
      while ((id)(v56 + 1) != obja);
      id obja = (id)[v51 countByEnumeratingWithState:&v61 objects:v71 count:16];
    }
    while (obja);
  }
}

- (id)sectionIdentifiersForSectionType:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiers];
    uint64_t v4 = [v3 array];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (void)setVirtualSmartFolderIdentifiers:(id)a3
{
}

- (void)setSmartFolderManagedObjectIDs:(id)a3
{
}

- (void)setModernAccountManagedObjectIDs:(id)a3
{
}

- (void)setLegacyAccountManagedObjectIDs:(id)a3
{
}

- (void)setFolderListSectionIdentifiersToVirtualSmartFolderIdentifiers:(id)a3
{
}

- (void)setFolderListSectionIdentifiersToFolderItemIdentifiers:(id)a3
{
}

- (void)setFolderListSectionIdentifiersToButtonIdentifiers:(id)a3
{
}

- (void)setFolderListSectionIdentifiers:(id)a3
{
}

- (void)setFolderItemIdentifiersToParentFolderItemIdentifier:(id)a3
{
}

- (void)setFolderItemIdentifiersToChildFolderItemIdentifiers:(id)a3
{
}

- (id)expansionStateContext
{
  uint64_t v2 = [(ICFolderCoreDataIndexer *)self ancestorObjectID];
  uint64_t v3 = [v2 URIRepresentation];
  uint64_t v4 = [v3 absoluteString];

  return v4;
}

- (void)willIndex
{
  uint64_t v3 = [(ICFolderCoreDataIndexer *)self indexAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ICFolderCoreDataIndexer_willIndex__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)shouldIncludeSubfolders
{
  return self->_shouldIncludeSubfolders;
}

- (BOOL)shouldAutoExpandSingleSection
{
  return self->_shouldAutoExpandSingleSection;
}

- (id)rootFolderListSectionIdentifiersForSection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiersToFolderItemIdentifiers];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CAA0] orderedSet];
  }
  id v8 = v7;

  id v9 = (void *)MEMORY[0x1E4F1CAA0];
  id v10 = [v8 array];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__ICFolderCoreDataIndexer_rootFolderListSectionIdentifiersForSection___block_invoke;
  v14[3] = &unk_1E5FDB3E0;
  v14[4] = self;
  id v11 = objc_msgSend(v10, "ic_objectsPassingTest:", v14);
  uint64_t v12 = [v9 orderedSetWithArray:v11];

  return v12;
}

uint64_t __127__ICFolderCoreDataIndexer_sortedFolderItemIdentifiersForItemIdentifiers_legacyManagedObjectContext_modernManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

- (void)setShouldIncludeSystemPaper:(int64_t)a3
{
  self->_shouldIncludeSystemPaper = a3;
}

- (void)setShouldIncludeSharedWithYou:(int64_t)a3
{
  self->_shouldIncludeSharedWithYou = a3;
}

- (void)setShouldIncludeMathNotes:(int64_t)a3
{
  self->_shouldIncludeMathNotes = a3;
}

- (void)setShouldIncludeCallNotes:(int64_t)a3
{
  self->_shouldIncludeCallNotes = a3;
}

- (void)setShouldIncludeAccount:(int64_t)a3
{
  self->_shouldIncludeAccount = a3;
}

- (void)setShouldAutoExpandSingleSection:(BOOL)a3
{
  self->_shouldAutoExpandSingleSection = a3;
}

- (ICFolderCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  return [(ICFolderCoreDataIndexer *)self initWithLegacyManagedObjectContext:a3 modernManagedObjectContext:a4 overrideContainerIdentifier:0];
}

- (void)setShouldIncludeTags:(BOOL)a3
{
  self->_shouldIncludeTags = a3;
}

- (unint64_t)countOfLegacyAccounts
{
  uint64_t v2 = [(ICFolderCoreDataIndexer *)self legacyAccountManagedObjectIDs];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSMutableSet)legacyAccountManagedObjectIDs
{
  return self->_legacyAccountManagedObjectIDs;
}

- (unint64_t)countOfModernAccounts
{
  uint64_t v2 = [(ICFolderCoreDataIndexer *)self modernAccountManagedObjectIDs];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)setShouldIncludeSmartFolders:(BOOL)a3
{
  self->_shouldIncludeSmartFolders = a3;
  id v6 = [(ICFolderCoreDataIndexer *)self modernFolderFetchPredicate];
  id v4 = [(ICFolderCoreDataIndexer *)self modernFetchedResultsController];
  uint64_t v5 = [v4 fetchRequest];
  [v5 setPredicate:v6];
}

- (NSSet)allSmartFolderObjectIDs
{
  uint64_t v2 = [(ICFolderCoreDataIndexer *)self smartFolderManagedObjectIDs];
  unint64_t v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (NSSet)allVirtualSmartFolderIdentifiers
{
  uint64_t v2 = [(ICFolderCoreDataIndexer *)self virtualSmartFolderIdentifiers];
  unint64_t v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (id)firstRelevantItemIdentifier
{
  unint64_t v3 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiers];
  id v4 = [v3 firstObject];

  if (![v4 sectionType])
  {
    uint64_t v5 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiers];
    unint64_t v6 = [v5 count];

    if (v6 >= 2)
    {
      id v7 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiers];
      uint64_t v8 = [v7 objectAtIndex:1];

      id v4 = (void *)v8;
    }
  }
  id v9 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiersToVirtualSmartFolderIdentifiers];
  id v10 = [v9 objectForKeyedSubscript:v4];
  id v11 = [v10 firstObject];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    uint64_t v14 = [(ICFolderCoreDataIndexer *)self rootFolderListSectionIdentifiersForSection:v4];
    id v13 = [v14 firstObject];
  }
  return v13;
}

- (id)sectionIdentifierForHeaderInSection:(int64_t)a3
{
  uint64_t v5 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiers];
  if ([v5 count] <= (unint64_t)a3)
  {
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  unint64_t v6 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiers];
  unint64_t v7 = [v6 count];

  if (v7 >= 2)
  {
    uint64_t v5 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiers];
    uint64_t v8 = [v5 objectAtIndexedSubscript:a3];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:
  return v8;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICFolderCoreDataIndexer *)self firstRelevantItemIdentifier];
  objc_opt_class();
  unint64_t v6 = [v4 lastObject];
  unint64_t v7 = ICDynamicCast();

  if (v7)
  {
    id v8 = v7;
    id v9 = v8;
    do
    {
      id v10 = v9;
      id v9 = v8;

      id v11 = [(ICFolderCoreDataIndexer *)self folderItemIdentifiersToParentFolderItemIdentifier];
      id v8 = [v11 objectForKeyedSubscript:v9];
    }
    while (v8);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__46;
    uint64_t v30 = __Block_byref_object_dispose__46;
    id v31 = 0;
    uint64_t v12 = [(ICFolderCoreDataIndexer *)self folderListSectionIdentifiersToFolderItemIdentifiers];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __59__ICFolderCoreDataIndexer_nextRelevantItemIdentifierAfter___block_invoke;
    id v23 = &unk_1E5FDC118;
    id v13 = v9;
    id v24 = v13;
    id v25 = &v26;
    [v12 enumerateKeysAndObjectsUsingBlock:&v20];

    if (v27[5])
    {
      uint64_t v14 = -[ICFolderCoreDataIndexer rootFolderListSectionIdentifiersForSection:](self, "rootFolderListSectionIdentifiersForSection:", v20, v21, v22, v23);
      uint64_t v15 = [v14 indexOfObject:v13];
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v14 count] > (unint64_t)(v15 + 1)) {
          uint64_t v16 = v15 + 1;
        }
        else {
          uint64_t v16 = 0;
        }
        uint64_t v17 = [v14 objectAtIndex:v16];

        uint64_t v5 = (void *)v17;
      }
    }
    id v18 = v5;

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    id v18 = v5;
  }

  return v18;
}

void __59__ICFolderCoreDataIndexer_nextRelevantItemIdentifierAfter___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)deleteObjectWithIDFromIndex:(id)a3 inSection:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = ICDynamicCast();
  if (v8)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = [(ICFolderCoreDataIndexer *)self folderItemIdentifiersToChildFolderItemIdentifiers];
    id v10 = [v9 objectForKeyedSubscript:v6];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          [(ICFolderCoreDataIndexer *)self deleteObjectWithIDFromIndex:*(void *)(*((void *)&v20 + 1) + 8 * i) inSection:v8];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    uint64_t v15 = [(ICFolderCoreDataIndexer *)self indexAccessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__ICFolderCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke;
    block[3] = &unk_1E5FD8FE8;
    block[4] = self;
    id v18 = v6;
    id v19 = v8;
    dispatch_sync(v15, block);
  }
  else
  {
    uint64_t v16 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[ICFolderCoreDataIndexer deleteObjectWithIDFromIndex:inSection:]((uint64_t)v6, (uint64_t)v7, v16);
    }
  }
}

void __65__ICFolderCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) folderItemIdentifiersToParentFolderItemIdentifier];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  unint64_t v3 = [*(id *)(a1 + 32) folderItemIdentifiersToChildFolderItemIdentifiers];
  [v3 removeObjectForKey:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) folderListSectionIdentifiersToFolderItemIdentifiers];
  uint64_t v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 48)];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA70] orderedSet];
  }
  id v10 = v7;

  [v10 removeObject:*(void *)(a1 + 40)];
  if (([*(id *)(a1 + 32) itemIdentifiersContainCustomFolder:v10] & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 48) accountObjectID];
    [v10 removeObject:v8];
  }
  id v9 = [*(id *)(a1 + 32) folderListSectionIdentifiersToFolderItemIdentifiers];
  [v9 setObject:v10 forKeyedSubscript:*(void *)(a1 + 48)];
}

- (void)deleteWithDecisionController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 sourceObjects];
  id v9 = [v8 valueForKey:@"objectID"];

  id v10 = [v7 sourceObjects];
  uint64_t v11 = objc_msgSend(v10, "ic_compactMap:", &__block_literal_global_50);

  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v9];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__ICFolderCoreDataIndexer_deleteWithDecisionController_completion___block_invoke_2;
  v16[3] = &unk_1E5FDC140;
  id v17 = v9;
  id v18 = v12;
  id v19 = self;
  id v20 = v6;
  id v13 = v12;
  id v14 = v9;
  id v15 = v6;
  [v7 performDecisionWithCompletion:v16];
}

ICFolderListSectionIdentifier *__67__ICFolderCoreDataIndexer_deleteWithDecisionController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [[ICFolderListSectionIdentifier alloc] initWithObject:v2];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v5 = v4;

  return v5;
}

uint64_t __67__ICFolderCoreDataIndexer_deleteWithDecisionController_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v9 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8, (void)v13);
          if (objc_msgSend(v8, "ic_isFolderType")) {
            BOOL v10 = v9 == 0;
          }
          else {
            BOOL v10 = 1;
          }
          if (!v10) {
            [*(id *)(a1 + 48) deleteObjectWithIDFromIndex:v8 inSection:v9];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }

    uint64_t result = *(void *)(a1 + 56);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      uint64_t v12 = *(uint64_t (**)(void))(result + 16);
      return v12();
    }
  }
  return result;
}

uint64_t __127__ICFolderCoreDataIndexer_sortedFolderItemIdentifiersForItemIdentifiers_legacyManagedObjectContext_modernManagedObjectContext___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

void __62__ICFolderCoreDataIndexer_itemIdentifiersContainCustomFolder___block_invoke_3(void *a1)
{
  id v2 = (void *)a1[4];
  id v4 = [v2 legacyManagedObjectContext];
  id v3 = objc_msgSend(v4, "ic_existingObjectWithID:", a1[5]);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 isCustomFolder:v3];
}

- (void)setAccountObjectID:(id)a3
{
}

- (void)setShouldIncludeLegacyAccounts:(BOOL)a3
{
  self->_shouldIncludeLegacyAccounts = a3;
}

- (BOOL)shouldIncludeTagOperator
{
  return self->_shouldIncludeTagOperator;
}

- (void)setShouldIncludeTagOperator:(BOOL)a3
{
  self->_shouldIncludeTagOperator = a3;
}

- (void)setShouldIncludeDefaultFolder:(BOOL)a3
{
  self->_shouldIncludeDefaultFolder = a3;
}

- (void)setShouldIncludeTrash:(BOOL)a3
{
  self->_shouldIncludeTrash = a3;
}

- (void)setShouldIncludeNewFolderButton:(BOOL)a3
{
  self->_shouldIncludeNewFolderButton = a3;
}

- (void)setOverrideContainerIdentifier:(id)a3
{
}

- (void)setLegacyFetchedResultsController:(id)a3
{
}

- (void)setModernFetchedResultsController:(id)a3
{
}

- (void)setIndexAccessQueue:(id)a3
{
}

- (NSMutableSet)smartFolderManagedObjectIDs
{
  return self->_smartFolderManagedObjectIDs;
}

- (void)setTagIndexer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagIndexer, 0);
  objc_storeStrong((id *)&self->_virtualSmartFolderIdentifiers, 0);
  objc_storeStrong((id *)&self->_smartFolderManagedObjectIDs, 0);
  objc_storeStrong((id *)&self->_modernAccountManagedObjectIDs, 0);
  objc_storeStrong((id *)&self->_legacyAccountManagedObjectIDs, 0);
  objc_storeStrong((id *)&self->_folderListSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_folderItemIdentifiersToChildFolderItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_folderItemIdentifiersToParentFolderItemIdentifier, 0);
  objc_storeStrong((id *)&self->_folderListSectionIdentifiersToFolderItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_folderListSectionIdentifiersToVirtualSmartFolderIdentifiers, 0);
  objc_storeStrong((id *)&self->_folderListSectionIdentifiersToButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_indexAccessQueue, 0);
  objc_storeStrong((id *)&self->_modernFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_legacyFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_overrideContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_accountObjectID, 0);
  objc_storeStrong((id *)&self->_ancestorObjectID, 0);
}

- (void)deleteObjectWithIDFromIndex:(os_log_t)log inSection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1B08EB000, log, OS_LOG_TYPE_FAULT, "Invalid folder list section identifier — not deleting object from index {objectID: %@, section: %@}", (uint8_t *)&v3, 0x16u);
}

@end