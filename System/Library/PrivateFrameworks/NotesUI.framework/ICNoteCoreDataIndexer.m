@interface ICNoteCoreDataIndexer
- (BOOL)dateHeadersAreStaleForNote:(id)a3;
- (BOOL)isShowingDateHeaders;
- (BOOL)shouldIncludeInvitations;
- (BOOL)shouldIncludeOutlineParentItems;
- (BOOL)shouldIncludeSubfolders;
- (BOOL)shouldIncludeTagDetail;
- (BOOL)shouldIncludeTags;
- (BOOL)sortsByPinned;
- (ICFolderCoreDataIndexer)folderIndexer;
- (ICFolderCustomNoteSortType)sortType;
- (ICInvitationsCoreDataIndexer)invitationsIndexer;
- (ICNoteContainer)noteContainer;
- (ICNoteCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4;
- (ICNoteFolderSectionIdentifier)folderSectionIdentifier;
- (ICNoteSectionIdentifier)invitationsSectionIdentifier;
- (ICNoteSectionIdentifier)noteSectionIdentifier;
- (ICNoteSectionIdentifier)pinnedNoteSectionIdentifier;
- (ICNoteSectionIdentifier)tagSectionIdentifier;
- (ICQuery)noteQuery;
- (ICTagCoreDataIndexer)tagIndexer;
- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder;
- (NSArray)sortedNoteIdentifiers;
- (NSFetchedResultsController)legacyNoteFetchedResultsController;
- (NSFetchedResultsController)modernNoteFetchedResultsController;
- (NSFetchedResultsController)modernPinnedNoteFetchedResultsController;
- (NSMutableDictionary)sectionIdentifiersToManagedObjectIDs;
- (NSOrderedSet)sectionIdentifiers;
- (NoteCollectionObject)noteCollection;
- (OS_dispatch_queue)indexAccessQueue;
- (id)activeFetchedResultsControllers;
- (id)dateHeadersValueForNote:(id)a3;
- (id)expansionStateContext;
- (id)firstRelevantItemIdentifier;
- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5;
- (id)legacyDateHeadersAttribute;
- (id)modernDateHeadersAttribute;
- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4;
- (id)nextRelevantItemIdentifierAfter:(id)a3;
- (id)sectionForObjectID:(id)a3;
- (id)sectionIdentifierForHeaderInSection:(int64_t)a3;
- (id)sectionIdentifiersForSectionType:(unint64_t)a3;
- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5;
- (id)unpinnedNoteIdentifiers;
- (id)unpinnedSectionIdentifierForObject:(id)a3;
- (int)dateHeadersType;
- (int64_t)resolvedDateHeadersType;
- (unint64_t)pinnedNotesSectionMinimumCount;
- (unint64_t)totalFolderCount;
- (unint64_t)totalInvitationsCount;
- (unint64_t)totalNoteCount;
- (void)addObjectIDs:(id)a3 toIndexInSection:(id)a4;
- (void)deleteObjectWithIDFromIndex:(id)a3 inSection:(id)a4;
- (void)deleteWithDecisionController:(id)a3 completion:(id)a4;
- (void)didIndex;
- (void)mergePinnedNotesAndNotesSectionIfNeeded;
- (void)prependObjectIDs:(id)a3 toIndexInSection:(id)a4;
- (void)removeObjectIDs:(id)a3 fromIndexInSection:(id)a4;
- (void)removeUnpinnedNoteObjectIds:(id)a3;
- (void)setDateHeadersType:(int)a3;
- (void)setFolderIndexer:(id)a3;
- (void)setFolderSectionIdentifier:(id)a3;
- (void)setIndexAccessQueue:(id)a3;
- (void)setInvitationsIndexer:(id)a3;
- (void)setInvitationsSectionIdentifier:(id)a3;
- (void)setLegacyNoteFetchedResultsController:(id)a3;
- (void)setModernNoteFetchedResultsController:(id)a3;
- (void)setModernPinnedNoteFetchedResultsController:(id)a3;
- (void)setNoteCollection:(id)a3;
- (void)setNoteContainer:(id)a3;
- (void)setNoteQuery:(id)a3;
- (void)setNoteSectionIdentifier:(id)a3;
- (void)setPinnedNoteSectionIdentifier:(id)a3;
- (void)setPinnedNotesSectionMinimumCount:(unint64_t)a3;
- (void)setSectionIdentifiers:(id)a3;
- (void)setSectionIdentifiersToManagedObjectIDs:(id)a3;
- (void)setShouldIncludeInvitations:(BOOL)a3;
- (void)setShouldIncludeOutlineParentItems:(BOOL)a3;
- (void)setShouldIncludeSubfolders:(BOOL)a3;
- (void)setShouldIncludeTagDetail:(BOOL)a3;
- (void)setShouldIncludeTags:(BOOL)a3;
- (void)setSortType:(id)a3;
- (void)setSortType:(id)a3 force:(BOOL)a4;
- (void)setSortedNoteIdentifiers:(id)a3;
- (void)setTagSectionIdentifier:(id)a3;
- (void)setVirtualSmartFolder:(id)a3;
- (void)sortSection:(id)a3;
- (void)togglePinnedForNote:(id)a3;
- (void)unmergePinnedNotesAndNotesSectionIfNeeded;
- (void)updateContainerPredicate;
- (void)updateLegacyFetchedResultsControllers;
- (void)updateModernFetchedResultsControllers;
- (void)updateSectionIdentifiers;
- (void)willIndex;
@end

@implementation ICNoteCoreDataIndexer

- (unint64_t)totalNoteCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__ICNoteCoreDataIndexer_totalNoteCount__block_invoke;
  v5[3] = &unk_1E5FDB2F8;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) objects];
  v2 = [*(id *)(a1 + 40) modernDateHeadersAttribute];
  uint64_t v3 = [v6 valueForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) objects];
  uint64_t v2 = [v5 valueForKey:@"objectID"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __39__ICNoteCoreDataIndexer_totalNoteCount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ((unint64_t)([a2 sectionType] - 3) <= 2) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v5 count];
  }
}

- (void)updateModernFetchedResultsControllers
{
  uint64_t v3 = [(ICNoteCoreDataIndexer *)self indexAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ICNoteCoreDataIndexer_updateModernFetchedResultsControllers__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __64__ICNoteCoreDataIndexer_mergePinnedNotesAndNotesSectionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) sortsByPinned];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)modernDateHeadersAttribute
{
  int64_t v2 = [(ICNoteCoreDataIndexer *)self resolvedDateHeadersType];
  uint64_t v3 = @"creationDate";
  if (v2 != 2) {
    uint64_t v3 = 0;
  }
  if (v2 == 1) {
    return @"modificationDate";
  }
  else {
    return v3;
  }
}

- (void)setModernPinnedNoteFetchedResultsController:(id)a3
{
}

- (void)setModernNoteFetchedResultsController:(id)a3
{
}

BOOL __58__ICNoteCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 sectionType] == 0;
}

BOOL __58__ICNoteCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 sectionType] == 1;
}

BOOL __58__ICNoteCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sectionType] == 2;
}

BOOL __58__ICNoteCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 sectionType] == 4
    || [v2 sectionType] == 3
    || [v2 sectionType] == 5;

  return v3;
}

- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__28;
  v25 = __Block_byref_object_dispose__28;
  id v26 = 0;
  v10 = [(ICNoteCoreDataIndexer *)self indexAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke;
  block[3] = &unk_1E5FDB320;
  id v16 = v9;
  id v17 = v8;
  v18 = self;
  v19 = &v21;
  unint64_t v20 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(v10, block);

  id v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (void)setShouldIncludeSubfolders:(BOOL)a3
{
  self->_shouldIncludeSubfolders = a3;
}

- (void)setPinnedNotesSectionMinimumCount:(unint64_t)a3
{
  self->_pinnedNotesSectionMinimumCount = a3;
}

- (id)activeFetchedResultsControllers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__28;
  id v11 = __Block_byref_object_dispose__28;
  id v12 = [MEMORY[0x1E4F1CA80] set];
  BOOL v3 = [(ICNoteCoreDataIndexer *)self indexAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__ICNoteCoreDataIndexer_activeFetchedResultsControllers__block_invoke;
  v6[3] = &unk_1E5FDB2D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  uint64_t v4 = (void *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSFetchedResultsController)modernNoteFetchedResultsController
{
  return self->_modernNoteFetchedResultsController;
}

void __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 32) managedObjectContext];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_2;
  v68[3] = &unk_1E5FD91F8;
  uint64_t v70 = *(void *)(a1 + 56);
  id v69 = *(id *)(a1 + 40);
  [v3 performBlockAndWait:v68];

  uint64_t v4 = [*(id *)(a1 + 48) folderIndexer];
  id v5 = [v4 activeFetchedResultsControllers];
  LODWORD(v2) = [v5 containsObject:*v2];

  id v6 = *(void **)(a1 + 48);
  if (v2)
  {
    uint64_t v7 = [v6 folderIndexer];
    uint64_t v8 = [v7 indexObjectsInSection:*(void *)(a1 + 40) sectionIndex:*(void *)(a1 + 64) fetchedResultsController:*(void *)(a1 + 32)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v11 = *(void **)(a1 + 48);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v13 = [v11 folderSectionIdentifier];
    [v11 addObjectIDs:v12 toIndexInSection:v13];

    goto LABEL_24;
  }
  v14 = [v6 invitationsIndexer];
  v15 = [v14 activeFetchedResultsControllers];
  int v16 = [v15 containsObject:*(void *)(a1 + 32)];

  if (v16)
  {
    id v17 = [*(id *)(a1 + 48) invitationsIndexer];
    uint64_t v18 = [v17 indexObjectsInSection:*(void *)(a1 + 40) sectionIndex:*(void *)(a1 + 64) fetchedResultsController:*(void *)(a1 + 32)];
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    unint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    uint64_t v21 = *(void **)(a1 + 48);
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v23 = [v21 invitationsSectionIdentifier];
    [v21 addObjectIDs:v22 toIndexInSection:v23];

    goto LABEL_24;
  }
  v24 = *(void **)(a1 + 32);
  v25 = [*(id *)(a1 + 48) modernPinnedNoteFetchedResultsController];
  LODWORD(v24) = v24 == v25;

  if (v24)
  {
    v30 = *(void **)(a1 + 48);
    uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v32 = [v30 pinnedNoteSectionIdentifier];
    [v30 addObjectIDs:v31 toIndexInSection:v32];

    goto LABEL_24;
  }
  id v26 = *(void **)(a1 + 32);
  v27 = [*(id *)(a1 + 48) modernNoteFetchedResultsController];
  LODWORD(v26) = v26 == v27;

  if (!v26)
  {
    v28 = *(void **)(a1 + 32);
    v29 = [*(id *)(a1 + 48) legacyNoteFetchedResultsController];
    LODWORD(v28) = v28 == v29;

    if (!v28) {
      goto LABEL_24;
    }
LABEL_23:
    v51 = *(void **)(a1 + 48);
    uint64_t v52 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v53 = [v51 noteSectionIdentifier];
    [v51 addObjectIDs:v52 toIndexInSection:v53];

    goto LABEL_24;
  }
  if (![*(id *)(a1 + 48) resolvedDateHeadersType]) {
    goto LABEL_23;
  }
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__28;
  v66 = __Block_byref_object_dispose__28;
  id v67 = 0;
  v33 = [*(id *)(a1 + 32) managedObjectContext];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_3;
  v58[3] = &unk_1E5FD9870;
  v61 = &v62;
  id v34 = *(id *)(a1 + 40);
  uint64_t v35 = *(void *)(a1 + 48);
  id v59 = v34;
  uint64_t v60 = v35;
  [v33 performBlockAndWait:v58];

  uint64_t v36 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
  if (v36 != [(id)v63[5] count])
  {
    v37 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_cold_1(v37);
    }
  }
  v38 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v40 = v63[5];
  v41 = [*(id *)(a1 + 48) sortType];
  v42 = +[ICNoteTimelineController timelineSectionsForNoteObjectIDs:dates:referenceDate:direction:](ICNoteTimelineController, "timelineSectionsForNoteObjectIDs:dates:referenceDate:direction:", v39, v40, v38, [v41 direction]);

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v43 = v42;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v54 objects:v71 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v55 != v45) {
          objc_enumerationMutation(v43);
        }
        v47 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v48 = *(void **)(a1 + 48);
        v49 = objc_msgSend(v47, "objectIDs", (void)v54);
        v50 = [v47 identifier];
        [v48 addObjectIDs:v49 toIndexInSection:v50];
      }
      uint64_t v44 = [v43 countByEnumeratingWithState:&v54 objects:v71 count:16];
    }
    while (v44);
  }

  _Block_object_dispose(&v62, 8);
LABEL_24:
  objc_msgSend(*(id *)(a1 + 48), "mergePinnedNotesAndNotesSectionIfNeeded", (void)v54);
  [*(id *)(a1 + 48) updateSectionIdentifiers];
}

- (NSFetchedResultsController)modernPinnedNoteFetchedResultsController
{
  return self->_modernPinnedNoteFetchedResultsController;
}

void __110__ICNoteCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  switch(*(void *)(a1 + 64))
  {
    case 1:
      id v2 = [*(id *)(a1 + 32) folderIndexer];
      BOOL v3 = [v2 sectionSnapshotsForSectionType:1 legacyManagedObjectContext:*(void *)(v1 + 48) modernManagedObjectContext:*(void *)(v1 + 56)];

      uint64_t v4 = [*(id *)(v1 + 32) sectionIdentifiersForSectionType:*(void *)(v1 + 64)];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v68 objects:v80 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v69 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v68 + 1) + 8 * i);
            v10 = [v3 allValues];
            id v11 = [v10 firstObject];
            [*(id *)(v1 + 40) setObject:v11 forKeyedSubscript:v9];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v68 objects:v80 count:16];
        }
        while (v6);
      }
      goto LABEL_48;
    case 2:
      BOOL v3 = [*(id *)(a1 + 32) sectionIdentifiersForSectionType:2];
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      uint64_t v56 = [v3 countByEnumeratingWithState:&v60 objects:v78 count:16];
      if (v56)
      {
        uint64_t v55 = *(void *)v61;
        obuint64_t j = v3;
        do
        {
          for (uint64_t j = 0; j != v56; ++j)
          {
            if (*(void *)v61 != v55) {
              objc_enumerationMutation(v3);
            }
            id v13 = *(void **)(*((void *)&v60 + 1) + 8 * j);
            id v59 = objc_alloc_init(MEMORY[0x1E4FB1358]);
            uint64_t v14 = [v3 count];
            v15 = [*(id *)(v1 + 32) invitationsIndexer];
            int v16 = (void *)[v15 newSnapshotFromIndex];
            id v17 = [v16 sectionIdentifiers];
            uint64_t v18 = [v17 count];
            uint64_t v19 = v1;
            uint64_t v20 = v18 + v14;
            uint64_t v21 = v19;
            uint64_t v22 = [*(id *)(v19 + 32) folderIndexer];
            uint64_t v23 = (void *)[v22 newSnapshotFromIndex];
            v24 = [v23 sectionIdentifiers];
            unint64_t v25 = v20 + [v24 count];

            BOOL v26 = v25 > 1 || [v13 sectionType] != 4;
            uint64_t v1 = v21;
            BOOL v3 = obj;
            if (objc_msgSend(*(id *)(v21 + 32), "shouldIncludeOutlineParentItems", v55) && v26)
            {
              v77 = v13;
              v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
              v28 = v59;
              [v59 appendItems:v27];

              v29 = +[ICExpansionState sharedExpansionState];
              v30 = [*(id *)(v1 + 32) expansionStateContext];
              int v31 = [v29 isSectionIdentiferExpanded:v13 inContext:v30];

              if (v31)
              {
                v76 = v13;
                v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
                [v59 expandItems:v32];
              }
              v33 = [*(id *)(v1 + 32) sectionIdentifiersToManagedObjectIDs];
              id v34 = [v33 objectForKeyedSubscript:v13];
              uint64_t v35 = [v34 array];
              [v59 appendItems:v35 intoParent:v13];
            }
            else
            {
              v29 = [*(id *)(v21 + 32) sectionIdentifiersToManagedObjectIDs];
              v33 = [v29 objectForKeyedSubscript:v13];
              id v34 = [v33 array];
              v28 = v59;
              [v59 appendItems:v34];
            }

            [*(id *)(v1 + 40) setObject:v28 forKeyedSubscript:v13];
          }
          uint64_t v56 = [obj countByEnumeratingWithState:&v60 objects:v78 count:16];
        }
        while (v56);
      }
      goto LABEL_49;
    case 4:
      BOOL v3 = [*(id *)(a1 + 32) sectionIdentifiersForSectionType:4];
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      uint64_t v36 = [v3 countByEnumeratingWithState:&v72 objects:v83 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v73;
        id obja = v3;
        do
        {
          for (uint64_t k = 0; k != v37; ++k)
          {
            if (*(void *)v73 != v38) {
              objc_enumerationMutation(obja);
            }
            uint64_t v40 = *(void *)(*((void *)&v72 + 1) + 8 * k);
            objc_opt_class();
            v41 = ICDynamicCast();
            if (![v41 sectionType])
            {
              id v42 = objc_alloc_init(MEMORY[0x1E4FB1358]);
              if ([*(id *)(v1 + 32) shouldIncludeTags])
              {
                id v43 = +[ICTagContainerItemIdentifier sharedItemIdentifier];
                v82 = v43;
                uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
                [v42 appendItems:v44];
              }
              if ([*(id *)(v1 + 32) shouldIncludeTagDetail])
              {
                uint64_t v45 = +[ICTagDetailItemIdentifier sharedItemIdentifier];
                v81 = v45;
                v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
                [v42 appendItems:v46];
              }
              [*(id *)(v1 + 40) setObject:v42 forKeyedSubscript:v40];
            }
          }
          BOOL v3 = obja;
          uint64_t v37 = [obja countByEnumeratingWithState:&v72 objects:v83 count:16];
        }
        while (v37);
      }
      goto LABEL_49;
    case 5:
      v47 = [*(id *)(a1 + 32) invitationsIndexer];
      BOOL v3 = [v47 sectionSnapshotsForSectionType:5 legacyManagedObjectContext:*(void *)(v1 + 48) modernManagedObjectContext:*(void *)(v1 + 56)];

      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      uint64_t v4 = [*(id *)(v1 + 32) sectionIdentifiersForSectionType:*(void *)(v1 + 64)];
      uint64_t v48 = [v4 countByEnumeratingWithState:&v64 objects:v79 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v65;
        do
        {
          for (uint64_t m = 0; m != v49; ++m)
          {
            if (*(void *)v65 != v50) {
              objc_enumerationMutation(v4);
            }
            uint64_t v52 = *(void *)(*((void *)&v64 + 1) + 8 * m);
            v53 = [v3 allValues];
            long long v54 = [v53 firstObject];
            [*(id *)(v1 + 40) setObject:v54 forKeyedSubscript:v52];
          }
          uint64_t v49 = [v4 countByEnumeratingWithState:&v64 objects:v79 count:16];
        }
        while (v49);
      }
LABEL_48:

LABEL_49:
      break;
    default:
      return;
  }
}

- (ICFolderCoreDataIndexer)folderIndexer
{
  return self->_folderIndexer;
}

- (ICInvitationsCoreDataIndexer)invitationsIndexer
{
  return self->_invitationsIndexer;
}

- (id)sectionIdentifiersForSectionType:(unint64_t)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  switch(a3)
  {
    case 1uLL:
      uint64_t v5 = [(ICNoteCoreDataIndexer *)self sectionIdentifiers];
      uint64_t v6 = [v5 array];
      uint64_t v7 = objc_msgSend(v6, "ic_objectsPassingTest:", &__block_literal_global_33);

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __58__ICNoteCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke_2;
      v22[3] = &unk_1E5FDB368;
      v22[4] = self;
      BOOL v3 = objc_msgSend(v7, "ic_map:", v22);

      goto LABEL_12;
    case 2uLL:
      uint64_t v8 = [(ICNoteCoreDataIndexer *)self sectionIdentifiers];
      uint64_t v9 = [v8 array];
      BOOL v3 = objc_msgSend(v9, "ic_objectsPassingTest:", &__block_literal_global_35);

      BOOL v10 = [(ICNoteCoreDataIndexer *)self shouldIncludeTags];
      if (v10
        || ([(ICNoteCoreDataIndexer *)self noteQuery],
            (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        if ([v3 count])
        {
          BOOL v11 = 0;
          if (v10) {
            goto LABEL_7;
          }
        }
        else
        {
          BOOL v11 = [(ICNoteCoreDataIndexer *)self totalInvitationsCount] == 0;
          if (v10)
          {
LABEL_7:
            if (!v11) {
              goto LABEL_12;
            }
            goto LABEL_17;
          }
        }

        if (!v11) {
          goto LABEL_12;
        }
        goto LABEL_17;
      }
      uint64_t v19 = [(ICNoteCoreDataIndexer *)self virtualSmartFolder];
      if (v19)
      {
        uint64_t v20 = (void *)v19;
        if ([v3 count])
        {
        }
        else
        {
          unint64_t v21 = [(ICNoteCoreDataIndexer *)self totalInvitationsCount];

          if (!v21)
          {
LABEL_17:
            id v17 = [[ICNoteSectionIdentifier alloc] initWithNoteSectionType:4];
            v23[0] = v17;
            uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];

            BOOL v3 = (void *)v18;
          }
        }
      }
LABEL_12:
      return v3;
    case 4uLL:
      uint64_t v12 = [(ICNoteCoreDataIndexer *)self sectionIdentifiers];
      id v13 = [v12 array];
      uint64_t v14 = v13;
      v15 = &__block_literal_global_41;
      goto LABEL_11;
    case 5uLL:
      uint64_t v12 = [(ICNoteCoreDataIndexer *)self sectionIdentifiers];
      id v13 = [v12 array];
      uint64_t v14 = v13;
      v15 = &__block_literal_global_43;
LABEL_11:
      BOOL v3 = objc_msgSend(v13, "ic_objectsPassingTest:", v15);

      goto LABEL_12;
    default:
      goto LABEL_12;
  }
}

- (NSOrderedSet)sectionIdentifiers
{
  return self->_sectionIdentifiers;
}

- (void)addObjectIDs:(id)a3 toIndexInSection:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v10 count])
  {
    uint64_t v7 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
    uint64_t v8 = [v7 objectForKeyedSubscript:v6];

    if (!v8)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA70] orderedSet];
      uint64_t v9 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
      [v9 setObject:v8 forKeyedSubscript:v6];
    }
    [v8 addObjectsFromArray:v10];
  }
}

- (NSMutableDictionary)sectionIdentifiersToManagedObjectIDs
{
  return self->_sectionIdentifiersToManagedObjectIDs;
}

- (BOOL)shouldIncludeOutlineParentItems
{
  return self->_shouldIncludeOutlineParentItems;
}

- (void)updateSectionIdentifiers
{
  BOOL v3 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
  uint64_t v4 = [v3 allKeys];
  id v13 = (id)[v4 mutableCopy];

  if ([(ICNoteCoreDataIndexer *)self shouldIncludeTags]
    || [(ICNoteCoreDataIndexer *)self shouldIncludeTagDetail])
  {
    uint64_t v5 = [(ICNoteCoreDataIndexer *)self tagSectionIdentifier];
    char v6 = [v13 containsObject:v5];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [(ICNoteCoreDataIndexer *)self tagSectionIdentifier];
      [v13 insertObject:v7 atIndex:0];
    }
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = +[ICNoteSectionIdentifier sortDescriptors];
  [v8 addObjectsFromArray:v9];

  if ([(ICNoteCoreDataIndexer *)self resolvedDateHeadersType])
  {
    id v10 = [(ICNoteCoreDataIndexer *)self sortType];
    BOOL v11 = +[ICNoteTimelineSectionIdentifier sortDescriptorsWithDirection:](ICNoteTimelineSectionIdentifier, "sortDescriptorsWithDirection:", [v10 direction]);
    [v8 addObjectsFromArray:v11];
  }
  [v13 sortUsingDescriptors:v8];
  uint64_t v12 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v13];
  [(ICNoteCoreDataIndexer *)self setSectionIdentifiers:v12];
}

- (int64_t)resolvedDateHeadersType
{
  if (![(ICNoteCoreDataIndexer *)self isShowingDateHeaders]) {
    return 0;
  }
  BOOL v3 = [(ICNoteCoreDataIndexer *)self sortType];
  unint64_t v4 = [v3 resolvedCustomSortTypeOrder];

  if (v4 > 3) {
    return 1;
  }
  else {
    return qword_1B0B98A88[v4];
  }
}

- (ICFolderCustomNoteSortType)sortType
{
  return self->_sortType;
}

- (BOOL)isShowingDateHeaders
{
  if ([(ICNoteCoreDataIndexer *)self dateHeadersType] == 2) {
    return 1;
  }
  unint64_t v4 = [(ICNoteCoreDataIndexer *)self noteContainer];
  if (!v4
    || [(ICNoteCoreDataIndexer *)self dateHeadersType]
    || [MEMORY[0x1E4F83730] defaultDateHeadersType] == 1)
  {
    uint64_t v5 = [(ICNoteCoreDataIndexer *)self virtualSmartFolder];
    if (!v5
      || [(ICNoteCoreDataIndexer *)self dateHeadersType]
      || [MEMORY[0x1E4F83730] defaultDateHeadersType] == 1)
    {
      char v6 = [(ICNoteCoreDataIndexer *)self noteQuery];
      if (v6 && ![(ICNoteCoreDataIndexer *)self dateHeadersType]) {
        char v3 = [MEMORY[0x1E4F83730] showsQueryDateHeaders];
      }
      else {
        char v3 = 0;
      }
    }
    else
    {
      char v3 = 1;
    }
  }
  else
  {
    char v3 = 1;
  }

  return v3;
}

- (int)dateHeadersType
{
  return self->_dateHeadersType;
}

- (BOOL)shouldIncludeTags
{
  return self->_shouldIncludeTags;
}

- (BOOL)sortsByPinned
{
  uint64_t v3 = [(ICNoteCoreDataIndexer *)self noteQuery];
  if (!v3)
  {
    char v6 = [(ICNoteCoreDataIndexer *)self virtualSmartFolder];

    if (v6)
    {
      LOBYTE(v5) = 1;
      return v5;
    }
    int v8 = [MEMORY[0x1E4F29060] isMainThread];
    uint64_t v9 = [(ICNoteCoreDataIndexer *)self noteContainer];
    unint64_t v4 = (void *)v9;
    if (v8)
    {
      if (v9)
      {
        id v10 = [(ICNoteCoreDataIndexer *)self noteContainer];
        int v5 = [v10 isTrashFolder] ^ 1;

        goto LABEL_3;
      }
    }
    else
    {
      objc_opt_class();
      BOOL v11 = ICClassAndProtocolCast();

      uint64_t v12 = [(ICNoteCoreDataIndexer *)self noteContainer];

      if (!v12)
      {
        LOBYTE(v5) = 0;
        unint64_t v4 = v11;
        goto LABEL_3;
      }
      id v13 = [(ICCoreDataIndexer *)self modernManagedObjectContext];
      uint64_t v14 = [v11 objectID];
      v15 = objc_msgSend(v13, "ic_existingObjectWithID:", v14);
      objc_opt_class();
      unint64_t v4 = ICClassAndProtocolCast();

      if (v4)
      {
        int v5 = objc_msgSend(v4, "isTrashFolder", &unk_1F0A404D8) ^ 1;
        goto LABEL_3;
      }
    }
    LOBYTE(v5) = 0;
    goto LABEL_3;
  }
  unint64_t v4 = (void *)v3;
  LOBYTE(v5) = 1;
LABEL_3:

  return v5;
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  return self->_virtualSmartFolder;
}

- (ICQuery)noteQuery
{
  return self->_noteQuery;
}

- (id)expansionStateContext
{
  uint64_t v3 = [(ICNoteCoreDataIndexer *)self noteContainer];
  unint64_t v4 = [v3 objectID];
  int v5 = [v4 URIRepresentation];
  char v6 = [v5 absoluteString];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = [(ICNoteCoreDataIndexer *)self noteCollection];
    id v10 = [v9 objectID];
    BOOL v11 = [v10 URIRepresentation];
    uint64_t v12 = [v11 absoluteString];
    id v13 = v12;
    if (v12)
    {
      id v8 = v12;
    }
    else
    {
      uint64_t v14 = [(ICNoteCoreDataIndexer *)self virtualSmartFolder];
      id v8 = [v14 identifier];
    }
  }

  return v8;
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (void)setSectionIdentifiers:(id)a3
{
}

- (BOOL)shouldIncludeTagDetail
{
  return self->_shouldIncludeTagDetail;
}

- (void)mergePinnedNotesAndNotesSectionIfNeeded
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v3 = [(ICCoreDataIndexer *)self modernManagedObjectContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__ICNoteCoreDataIndexer_mergePinnedNotesAndNotesSectionIfNeeded__block_invoke;
  v16[3] = &unk_1E5FD91F8;
  v16[4] = self;
  v16[5] = &v17;
  [v3 performBlockAndWait:v16];

  if (*((unsigned char *)v18 + 24))
  {
    unint64_t v4 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
    int v5 = [(ICNoteCoreDataIndexer *)self pinnedNoteSectionIdentifier];
    char v6 = [v4 objectForKeyedSubscript:v5];
    uint64_t v7 = [v6 array];
    id v8 = (void *)[v7 copy];

    if (v8)
    {
      unint64_t v9 = [v8 count];
      if (v9 < [(ICNoteCoreDataIndexer *)self pinnedNotesSectionMinimumCount])
      {
        id v10 = [(ICNoteCoreDataIndexer *)self pinnedNoteSectionIdentifier];
        [(ICNoteCoreDataIndexer *)self removeObjectIDs:v8 fromIndexInSection:v10];

        if ([(ICNoteCoreDataIndexer *)self resolvedDateHeadersType])
        {
          BOOL v11 = [(ICCoreDataIndexer *)self modernManagedObjectContext];
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __64__ICNoteCoreDataIndexer_mergePinnedNotesAndNotesSectionIfNeeded__block_invoke_2;
          v13[3] = &unk_1E5FD91D0;
          id v14 = v8;
          v15 = self;
          [v11 performBlockAndWait:v13];

          uint64_t v12 = v14;
        }
        else
        {
          uint64_t v12 = [(ICNoteCoreDataIndexer *)self noteSectionIdentifier];
          [(ICNoteCoreDataIndexer *)self prependObjectIDs:v8 toIndexInSection:v12];
        }
      }
    }
  }
  _Block_object_dispose(&v17, 8);
}

- (ICNoteSectionIdentifier)pinnedNoteSectionIdentifier
{
  return self->_pinnedNoteSectionIdentifier;
}

- (unint64_t)totalInvitationsCount
{
  if (![(ICNoteCoreDataIndexer *)self shouldIncludeInvitations]) {
    return 0;
  }
  uint64_t v3 = [(ICNoteCoreDataIndexer *)self invitationsIndexer];
  unint64_t v4 = [v3 totalInvitationsCount];

  return v4;
}

- (BOOL)shouldIncludeInvitations
{
  return self->_shouldIncludeInvitations;
}

- (unint64_t)totalFolderCount
{
  if (![(ICNoteCoreDataIndexer *)self shouldIncludeSubfolders]) {
    return 0;
  }
  uint64_t v3 = [(ICNoteCoreDataIndexer *)self folderIndexer];
  unint64_t v4 = [v3 totalFolderCount];

  return v4;
}

- (BOOL)shouldIncludeSubfolders
{
  return self->_shouldIncludeSubfolders;
}

- (ICNoteFolderSectionIdentifier)folderSectionIdentifier
{
  return self->_folderSectionIdentifier;
}

void __33__ICNoteCoreDataIndexer_didIndex__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) invitationsIndexer];
  [v2 didIndex];

  id v3 = [*(id *)(a1 + 32) folderIndexer];
  [v3 didIndex];
}

- (void)setSortType:(id)a3 force:(BOOL)a4
{
  id v8 = a3;
  if (a4 || ([(ICFolderCustomNoteSortType *)self->_sortType isEqual:v8] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sortType, a3);
    uint64_t v7 = [(ICNoteCoreDataIndexer *)self invitationsIndexer];
    [v7 setSortType:v8];

    [(ICCoreDataIndexer *)self setNeedsFetchedResultsControllerUpdate:1];
  }
}

- (void)didIndex
{
  id v3 = [(ICNoteCoreDataIndexer *)self indexAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__ICNoteCoreDataIndexer_didIndex__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (id)firstRelevantItemIdentifier
{
  id v3 = [(ICNoteCoreDataIndexer *)self sectionIdentifiers];
  unint64_t v4 = objc_msgSend(v3, "ic_objectPassingTest:", &__block_literal_global_49);

  int v5 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
  char v6 = [v5 objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F1CC08];
  if (a3 <= 5 && ((1 << a3) & 0x36) != 0)
  {
    BOOL v11 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v12 = [(ICNoteCoreDataIndexer *)self indexAccessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __110__ICNoteCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke;
    block[3] = &unk_1E5FDB390;
    unint64_t v19 = a3;
    void block[4] = self;
    id v16 = v11;
    id v17 = v8;
    id v18 = v9;
    id v13 = v11;
    dispatch_sync(v12, block);

    id v10 = (void *)[v13 copy];
  }

  return v10;
}

- (OS_dispatch_queue)indexAccessQueue
{
  return self->_indexAccessQueue;
}

void __34__ICNoteCoreDataIndexer_willIndex__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) folderIndexer];
  [v2 willIndex];

  id v3 = [*(id *)(a1 + 32) invitationsIndexer];
  [v3 willIndex];

  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(a1 + 32) setSectionIdentifiersToManagedObjectIDs:v4];

  id v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  [*(id *)(a1 + 32) setSectionIdentifiers:v5];
}

- (void)willIndex
{
  id v3 = [(ICNoteCoreDataIndexer *)self indexAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ICNoteCoreDataIndexer_willIndex__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)setSectionIdentifiersToManagedObjectIDs:(id)a3
{
}

uint64_t __52__ICNoteCoreDataIndexer_firstRelevantItemIdentifier__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsRelevantIdentifiers];
}

- (ICNoteCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)ICNoteCoreDataIndexer;
  id v8 = [(ICCoreDataIndexer *)&v32 initWithLegacyManagedObjectContext:v6 modernManagedObjectContext:v7];
  id v9 = v8;
  if (v8)
  {
    v8->_shouldIncludeSubfolders = 0;
    v8->_shouldIncludeTags = 0;
    v8->_shouldIncludeTagDetail = 0;
    v8->_shouldIncludeInvitations = 0;
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.notes.note-index-access-queue", v10);
    indexAccessQueue = v9->_indexAccessQueue;
    v9->_indexAccessQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [MEMORY[0x1E4F83758] noteSortTypeDefaultAscending];
    sortType = v9->_sortType;
    v9->_sortType = (ICFolderCustomNoteSortType *)v13;

    v9->_pinnedNotesSectionMinimumCount = 1;
    v15 = [[ICNoteSectionIdentifier alloc] initWithNoteSectionType:0];
    tagSectionIdentifier = v9->_tagSectionIdentifier;
    v9->_tagSectionIdentifier = v15;

    id v17 = objc_alloc_init(ICNoteFolderSectionIdentifier);
    folderSectionIdentifier = v9->_folderSectionIdentifier;
    v9->_folderSectionIdentifier = v17;

    unint64_t v19 = [[ICNoteSectionIdentifier alloc] initWithNoteSectionType:1];
    invitationsSectionIdentifier = v9->_invitationsSectionIdentifier;
    v9->_invitationsSectionIdentifier = v19;

    unint64_t v21 = [[ICNoteSectionIdentifier alloc] initWithNoteSectionType:3];
    pinnedNoteSectionIdentifier = v9->_pinnedNoteSectionIdentifier;
    v9->_pinnedNoteSectionIdentifier = v21;

    uint64_t v23 = [[ICNoteSectionIdentifier alloc] initWithNoteSectionType:4];
    noteSectionIdentifier = v9->_noteSectionIdentifier;
    v9->_noteSectionIdentifier = v23;

    unint64_t v25 = [ICInvitationsCoreDataIndexer alloc];
    BOOL v26 = [(ICNoteCoreDataIndexer *)v9 invitationsSectionIdentifier];
    uint64_t v27 = [(ICInvitationsCoreDataIndexer *)v25 initWithModernManagedObjectContext:v7 sectionIdentifier:v26];
    invitationsIndexer = v9->_invitationsIndexer;
    v9->_invitationsIndexer = (ICInvitationsCoreDataIndexer *)v27;

    v29 = [[ICFolderCoreDataIndexer alloc] initWithLegacyManagedObjectContext:v6 modernManagedObjectContext:v7];
    folderIndexer = v9->_folderIndexer;
    v9->_folderIndexer = v29;

    [(ICCoreDataIndexer *)v9->_folderIndexer setShouldIncludeOutlineParentItems:1];
    [(ICFolderCoreDataIndexer *)v9->_folderIndexer setShouldIncludeAccount:2];
    [(ICFolderCoreDataIndexer *)v9->_folderIndexer setShouldIncludeSharedWithYou:2];
    [(ICFolderCoreDataIndexer *)v9->_folderIndexer setShouldIncludeSystemPaper:2];
    [(ICFolderCoreDataIndexer *)v9->_folderIndexer setShouldIncludeMathNotes:2];
    [(ICFolderCoreDataIndexer *)v9->_folderIndexer setShouldIncludeCallNotes:2];
    [(ICFolderCoreDataIndexer *)v9->_folderIndexer setShouldAutoExpandSingleSection:0];
  }

  return v9;
}

- (void)setShouldIncludeOutlineParentItems:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldIncludeOutlineParentItems = a3;
  id v5 = [(ICNoteCoreDataIndexer *)self folderIndexer];
  [v5 setShouldIncludeOutlineParentItems:v3];

  id v6 = [(ICNoteCoreDataIndexer *)self invitationsIndexer];
  [v6 setShouldIncludeOutlineParentItems:v3];
}

- (ICNoteSectionIdentifier)invitationsSectionIdentifier
{
  return self->_invitationsSectionIdentifier;
}

- (void)setShouldIncludeTags:(BOOL)a3
{
  self->_shouldIncludeTags = a3;
}

- (void)setShouldIncludeTagDetail:(BOOL)a3
{
  self->_shouldIncludeTagDetail = a3;
}

- (void)setShouldIncludeInvitations:(BOOL)a3
{
  self->_shouldIncludeInvitations = a3;
}

- (void)setDateHeadersType:(int)a3
{
  self->_dateHeadersType = a3;
}

- (void)setLegacyNoteFetchedResultsController:(id)a3
{
}

- (void)updateLegacyFetchedResultsControllers
{
  v24[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(ICNoteCoreDataIndexer *)self noteCollection];

  if (v3)
  {
    unint64_t v4 = [(ICNoteCoreDataIndexer *)self noteCollection];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v6 = @"store";
    if (isKindOfClass) {
      id v6 = @"store.account";
    }
    id v7 = v6;

    id v8 = (void *)MEMORY[0x1E4F28F60];
    id v9 = [(ICNoteCoreDataIndexer *)self noteCollection];
    id v10 = [v8 predicateWithFormat:@"%K == %@ AND deletedFlag == NO AND isBookkeepingEntry == NO AND body.content != nil", v7, v9];

    dispatch_queue_t v11 = objc_msgSend(MEMORY[0x1E4F83790], "legacySortDescriptorsForType:", objc_msgSend(MEMORY[0x1E4F83790], "currentNoteListSortType"));
    uint64_t v12 = [(ICNoteCoreDataIndexer *)self legacyNoteFetchedResultsController];

    if (v12)
    {
      uint64_t v13 = [(ICNoteCoreDataIndexer *)self legacyNoteFetchedResultsController];
      id v14 = [v13 fetchRequest];
      [v14 setPredicate:v10];

      v15 = [(ICNoteCoreDataIndexer *)self legacyNoteFetchedResultsController];
      id v16 = [v15 fetchRequest];
      [v16 setSortDescriptors:v11];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Note"];
      [v15 setPredicate:v10];
      [v15 setSortDescriptors:v11];
      id v17 = objc_alloc(MEMORY[0x1E4F1C0F0]);
      id v16 = [(ICCoreDataIndexer *)self legacyManagedObjectContext];
      id v18 = (void *)[v17 initWithFetchRequest:v15 managedObjectContext:v16 sectionNameKeyPath:0 cacheName:0];
      [(ICNoteCoreDataIndexer *)self setLegacyNoteFetchedResultsController:v18];
    }
    unint64_t v19 = [(ICNoteCoreDataIndexer *)self legacyDateHeadersAttribute];

    if (v19)
    {
      char v20 = [(ICNoteCoreDataIndexer *)self legacyDateHeadersAttribute];
      v24[0] = v20;
      unint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      uint64_t v22 = [(ICNoteCoreDataIndexer *)self legacyNoteFetchedResultsController];
      uint64_t v23 = [v22 fetchRequest];
      [v23 setPropertiesToFetch:v21];
    }
  }
  else
  {
    [(ICNoteCoreDataIndexer *)self setLegacyNoteFetchedResultsController:0];
  }
}

- (NoteCollectionObject)noteCollection
{
  return self->_noteCollection;
}

- (void)setNoteContainer:(id)a3
{
  unint64_t v4 = (ICNoteContainer *)a3;
  noteCollection = self->_noteCollection;
  self->_noteCollection = 0;

  noteContainer = self->_noteContainer;
  self->_noteContainer = v4;
  id v7 = v4;

  noteQuery = self->_noteQuery;
  self->_noteQuery = 0;

  virtualSmartFolder = self->_virtualSmartFolder;
  self->_virtualSmartFolder = 0;

  objc_opt_class();
  id v10 = ICDynamicCast();
  dispatch_queue_t v11 = [v10 objectID];
  uint64_t v12 = [(ICNoteCoreDataIndexer *)self folderIndexer];
  [v12 setAncestorObjectID:v11];

  uint64_t v13 = [(ICNoteCoreDataIndexer *)self expansionStateContext];
  id v14 = [(ICNoteCoreDataIndexer *)self invitationsIndexer];
  [v14 setExpansionStateContext:v13];

  objc_opt_class();
  v15 = ICDynamicCast();

  id v16 = [(ICNoteCoreDataIndexer *)self invitationsIndexer];
  [v16 setAccount:v15];

  [(ICCoreDataIndexer *)self setNeedsFetchedResultsControllerUpdate:1];
}

- (void)setNoteCollection:(id)a3
{
  objc_storeStrong((id *)&self->_noteCollection, a3);
  id v5 = a3;
  noteContainer = self->_noteContainer;
  self->_noteContainer = 0;

  noteQuery = self->_noteQuery;
  self->_noteQuery = 0;

  virtualSmartFolder = self->_virtualSmartFolder;
  self->_virtualSmartFolder = 0;

  id v9 = [v5 objectID];

  id v10 = [(ICNoteCoreDataIndexer *)self folderIndexer];
  [v10 setAncestorObjectID:v9];

  dispatch_queue_t v11 = [(ICNoteCoreDataIndexer *)self expansionStateContext];
  uint64_t v12 = [(ICNoteCoreDataIndexer *)self invitationsIndexer];
  [v12 setExpansionStateContext:v11];

  uint64_t v13 = [(ICNoteCoreDataIndexer *)self invitationsIndexer];
  [v13 setAccount:0];

  [(ICCoreDataIndexer *)self setNeedsFetchedResultsControllerUpdate:1];
}

- (void)setNoteQuery:(id)a3
{
  unint64_t v4 = (ICQuery *)a3;
  noteCollection = self->_noteCollection;
  self->_noteCollection = 0;

  noteContainer = self->_noteContainer;
  self->_noteContainer = 0;

  noteQuery = self->_noteQuery;
  self->_noteQuery = v4;
  id v8 = v4;

  virtualSmartFolder = self->_virtualSmartFolder;
  self->_virtualSmartFolder = 0;

  id v10 = [(ICNoteCoreDataIndexer *)self folderIndexer];
  [v10 setAncestorObjectID:0];

  dispatch_queue_t v11 = [(ICNoteCoreDataIndexer *)self expansionStateContext];
  uint64_t v12 = [(ICNoteCoreDataIndexer *)self invitationsIndexer];
  [v12 setExpansionStateContext:v11];

  uint64_t v13 = [(ICNoteCoreDataIndexer *)self invitationsIndexer];
  [v13 setAccount:0];

  [(ICCoreDataIndexer *)self setNeedsFetchedResultsControllerUpdate:1];
}

- (void)setVirtualSmartFolder:(id)a3
{
  unint64_t v4 = (ICVirtualSmartFolderItemIdentifier *)a3;
  noteCollection = self->_noteCollection;
  self->_noteCollection = 0;

  noteContainer = self->_noteContainer;
  self->_noteContainer = 0;

  noteQuery = self->_noteQuery;
  self->_noteQuery = 0;

  virtualSmartFolder = self->_virtualSmartFolder;
  self->_virtualSmartFolder = v4;

  id v9 = [(ICNoteCoreDataIndexer *)self folderIndexer];
  [v9 setAncestorObjectID:0];

  id v10 = [(ICNoteCoreDataIndexer *)self expansionStateContext];
  dispatch_queue_t v11 = [(ICNoteCoreDataIndexer *)self invitationsIndexer];
  [v11 setExpansionStateContext:v10];

  uint64_t v12 = [(ICNoteCoreDataIndexer *)self invitationsIndexer];
  [v12 setAccount:0];

  [(ICCoreDataIndexer *)self setNeedsFetchedResultsControllerUpdate:1];
}

- (void)setSortType:(id)a3
{
}

- (void)togglePinnedForNote:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = ICDynamicCast();
  id v6 = v5;
  if (v5 && [v5 isPinnable])
  {
    if ([(ICNoteCoreDataIndexer *)self sortsByPinned])
    {
      id v7 = [(ICNoteCoreDataIndexer *)self indexAccessQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__ICNoteCoreDataIndexer_togglePinnedForNote___block_invoke;
      block[3] = &unk_1E5FD8FE8;
      void block[4] = self;
      id v10 = v4;
      id v11 = v6;
      dispatch_sync(v7, block);
    }
    else
    {
      [v6 changePinStatusIfPossible];
      id v8 = [v6 managedObjectContext];
      objc_msgSend(v8, "ic_save");
    }
  }
}

uint64_t __45__ICNoteCoreDataIndexer_togglePinnedForNote___block_invoke(id *a1)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  [a1[4] unmergePinnedNotesAndNotesSectionIfNeeded];
  id v2 = [a1[4] sectionIdentifiersToManagedObjectIDs];
  BOOL v3 = [a1[4] pinnedNoteSectionIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = [a1[5] objectID];
  int v6 = [v4 containsObject:v5];

  if (v6)
  {
    [a1[6] setIsPinned:0];
    [a1[6] updateChangeCountWithReason:@"Toggled pin state"];
    id v7 = [a1[6] managedObjectContext];
    objc_msgSend(v7, "ic_save");

    id v8 = [a1[4] unpinnedSectionIdentifierForObject:a1[6]];
    id v9 = a1[4];
    id v10 = [a1[5] objectID];
    v34[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    uint64_t v12 = [a1[4] pinnedNoteSectionIdentifier];
    [v9 removeObjectIDs:v11 fromIndexInSection:v12];

    id v13 = a1[4];
    id v14 = [a1[5] objectID];
    v33 = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    [v13 addObjectIDs:v15 toIndexInSection:v8];

    [a1[4] sortSection:v8];
  }
  else
  {
    id v8 = [a1[4] unpinnedSectionIdentifierForObject:a1[6]];
    id v16 = [a1[4] sectionIdentifiersToManagedObjectIDs];
    id v17 = [v16 objectForKeyedSubscript:v8];
    id v18 = [a1[5] objectID];
    int v19 = [v17 containsObject:v18];

    if (v19)
    {
      [a1[6] setIsPinned:1];
      [a1[6] updateChangeCountWithReason:@"Toggled pin state"];
      char v20 = [a1[6] managedObjectContext];
      objc_msgSend(v20, "ic_save");

      id v21 = a1[4];
      uint64_t v22 = [a1[5] objectID];
      objc_super v32 = v22;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      v24 = [a1[4] pinnedNoteSectionIdentifier];
      [v21 addObjectIDs:v23 toIndexInSection:v24];

      id v25 = a1[4];
      BOOL v26 = [a1[5] objectID];
      int v31 = v26;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      [v25 removeObjectIDs:v27 fromIndexInSection:v8];

      id v28 = a1[4];
      v29 = [v28 pinnedNoteSectionIdentifier];
      [v28 sortSection:v29];
    }
  }

  [a1[4] mergePinnedNotesAndNotesSectionIfNeeded];
  return [a1[4] updateSectionIdentifiers];
}

- (void)updateContainerPredicate
{
  BOOL v3 = [(ICNoteCoreDataIndexer *)self noteCollection];

  if (v3)
  {
    id v7 = [(ICNoteCoreDataIndexer *)self noteCollection];
    [(ICNoteCoreDataIndexer *)self setNoteCollection:v7];
  }
  else
  {
    id v4 = [(ICNoteCoreDataIndexer *)self noteContainer];

    if (v4)
    {
      id v7 = [(ICNoteCoreDataIndexer *)self noteContainer];
      [(ICNoteCoreDataIndexer *)self setNoteContainer:v7];
    }
    else
    {
      id v5 = [(ICNoteCoreDataIndexer *)self noteQuery];

      if (v5)
      {
        id v7 = [(ICNoteCoreDataIndexer *)self noteQuery];
        [(ICNoteCoreDataIndexer *)self setNoteQuery:v7];
      }
      else
      {
        int v6 = [(ICNoteCoreDataIndexer *)self virtualSmartFolder];

        if (!v6) {
          return;
        }
        id v7 = [(ICNoteCoreDataIndexer *)self virtualSmartFolder];
        [(ICNoteCoreDataIndexer *)self setVirtualSmartFolder:v7];
      }
    }
  }
}

void __56__ICNoteCoreDataIndexer_activeFetchedResultsControllers__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldIncludeInvitations])
  {
    id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    BOOL v3 = [*(id *)(a1 + 32) invitationsIndexer];
    id v4 = [v3 activeFetchedResultsControllers];
    id v5 = [v4 allObjects];
    objc_msgSend(v2, "ic_addObjectsFromNonNilArray:", v5);
  }
  if ([*(id *)(a1 + 32) shouldIncludeSubfolders])
  {
    int v6 = [*(id *)(a1 + 32) folderIndexer];
    id v7 = [v6 ancestorObjectID];

    if (v7)
    {
      id v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v9 = [*(id *)(a1 + 32) folderIndexer];
      id v10 = [v9 activeFetchedResultsControllers];
      id v11 = [v10 allObjects];
      [v8 addObjectsFromArray:v11];
    }
  }
  uint64_t v12 = [*(id *)(a1 + 32) noteContainer];
  if (v12 || ([*(id *)(a1 + 32) noteQuery], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v24 = [*(id *)(a1 + 32) virtualSmartFolder];

    if (!v24) {
      goto LABEL_13;
    }
  }
  id v13 = [*(id *)(a1 + 32) modernPinnedNoteFetchedResultsController];

  if (v13)
  {
    id v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v15 = [*(id *)(a1 + 32) modernPinnedNoteFetchedResultsController];
    [v14 addObject:v15];
  }
  id v16 = [*(id *)(a1 + 32) modernNoteFetchedResultsController];

  if (v16)
  {
    id v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v18 = [*(id *)(a1 + 32) modernNoteFetchedResultsController];
    [v17 addObject:v18];
  }
LABEL_13:
  uint64_t v19 = [*(id *)(a1 + 32) noteCollection];
  if (v19)
  {
    char v20 = (void *)v19;
    id v21 = [*(id *)(a1 + 32) legacyNoteFetchedResultsController];

    if (v21)
    {
      uint64_t v22 = *(void **)(a1 + 32);
      uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v25 = [v22 legacyNoteFetchedResultsController];
      [v23 addObject:v25];
    }
  }
}

- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  int v6 = [(ICNoteCoreDataIndexer *)self indexAccessQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __103__ICNoteCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v11[3] = &unk_1E5FD91D0;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  dispatch_sync(v6, v11);

  id v8 = v12;
  id v9 = v7;

  return v9;
}

void __103__ICNoteCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) sectionIdentifiers];

  if (v2)
  {
    BOOL v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) sectionIdentifiers];
    id v5 = [v4 array];
    [v3 appendSectionsWithIdentifiers:v5];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v6 = objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiers", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
          id v12 = [*(id *)(a1 + 32) sectionIdentifiersToManagedObjectIDs];
          id v13 = [v12 objectForKeyedSubscript:v11];

          if (v13)
          {
            id v14 = *(void **)(a1 + 40);
            v15 = [v13 array];
            [v14 appendItemsWithIdentifiers:v15 intoSectionWithIdentifier:v11];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
}

ICNoteFolderSectionIdentifier *__58__ICNoteCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = ICDynamicCast();
  if (v4)
  {
    id v5 = [ICNoteFolderSectionIdentifier alloc];
    int v6 = [*(id *)(a1 + 32) folderIndexer];
    uint64_t v7 = [v6 ancestorObjectID];
    uint64_t v8 = [(ICNoteFolderSectionIdentifier *)v5 initWithNoteContainerObjectID:v7];
  }
  else
  {
    uint64_t v8 = (ICNoteFolderSectionIdentifier *)v3;
  }

  return v8;
}

- (id)sectionIdentifierForHeaderInSection:(int64_t)a3
{
  id v5 = [(ICNoteCoreDataIndexer *)self sectionIdentifiers];
  unint64_t v6 = [v5 count];

  uint64_t v7 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
  uint64_t v8 = [(ICNoteCoreDataIndexer *)self pinnedNoteSectionIdentifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  uint64_t v10 = [(ICNoteCoreDataIndexer *)self sectionIdentifiers];
  if ([v10 count] >= (unint64_t)a3)
  {

    if (v6 <= 1 && !v9)
    {
      uint64_t v11 = 0;
      goto LABEL_8;
    }
    uint64_t v10 = [(ICNoteCoreDataIndexer *)self sectionIdentifiers];
    uint64_t v11 = [v10 objectAtIndexedSubscript:a3];
  }
  else
  {
    uint64_t v11 = 0;
  }

LABEL_8:
  return v11;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteCoreDataIndexer *)self sortedNoteIdentifiers];
  unint64_t v6 = (void *)[v5 mutableCopy];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__ICNoteCoreDataIndexer_nextRelevantItemIdentifierAfter___block_invoke;
  v20[3] = &unk_1E5FDA5D0;
  id v7 = v4;
  id v21 = v7;
  uint64_t v8 = [v5 indexesOfObjectsPassingTest:v20];
  [v6 removeObjectsAtIndexes:v8];
  uint64_t v9 = [v5 count];
  if (v9 == [v6 count])
  {
    uint64_t v10 = 0;
    goto LABEL_17;
  }
  uint64_t v11 = [v6 firstObject];
  uint64_t v12 = [v5 indexOfObject:v11];

  id v13 = [v6 lastObject];
  unint64_t v14 = [v5 indexOfObject:v13];

  v15 = (void *)MEMORY[0x1E4F1CBF0];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && v14 != 0x7FFFFFFFFFFFFFFFLL && [v5 count] > v14)
  {
    v15 = objc_msgSend(v5, "subarrayWithRange:", v12, v14 - v12);
  }
  long long v16 = (void *)[v15 mutableCopy];
  [v16 removeObjectsInArray:v7];
  if ([v16 count])
  {
    uint64_t v17 = [v16 firstObject];
  }
  else
  {
    if ([v5 count] > v14 + 1) {
      unint64_t v18 = v14 + 1;
    }
    else {
      unint64_t v18 = v12 - 1;
    }
    if ([v5 count] <= v18) {
      goto LABEL_15;
    }
    uint64_t v17 = [v5 objectAtIndexedSubscript:v18];
  }
  uint64_t v10 = (void *)v17;
  if (!v17)
  {
LABEL_15:
    uint64_t v10 = [(ICNoteCoreDataIndexer *)self firstRelevantItemIdentifier];
  }

LABEL_17:
  return v10;
}

uint64_t __57__ICNoteCoreDataIndexer_nextRelevantItemIdentifierAfter___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)deleteObjectWithIDFromIndex:(id)a3 inSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  uint64_t v8 = ICDynamicCast();
  if (v8)
  {
    uint64_t v9 = [(ICNoteCoreDataIndexer *)self folderSectionIdentifier];
    int v10 = [v8 isEqual:v9];

    if (v10)
    {
      uint64_t v27 = 0;
      id v28 = &v27;
      uint64_t v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__28;
      int v31 = __Block_byref_object_dispose__28;
      objc_super v32 = 0;
      uint64_t v11 = [(ICCoreDataIndexer *)self modernManagedObjectContext];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      void v24[2] = __63__ICNoteCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke;
      v24[3] = &unk_1E5FD9870;
      BOOL v26 = &v27;
      v24[4] = self;
      id v12 = v6;
      id v25 = v12;
      [v11 performBlockAndWait:v24];

      id v13 = [(ICNoteCoreDataIndexer *)self folderIndexer];
      [v13 deleteObjectWithIDFromIndex:v12 inSection:v28[5]];

      [(ICNoteCoreDataIndexer *)self updateSectionIdentifiers];
      _Block_object_dispose(&v27, 8);
      unint64_t v14 = v32;
LABEL_10:

      goto LABEL_11;
    }
    long long v16 = [(ICNoteCoreDataIndexer *)self invitationsSectionIdentifier];
    int v17 = [v8 isEqual:v16];

    if (!v17)
    {
      char v20 = [(ICNoteCoreDataIndexer *)self indexAccessQueue];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __63__ICNoteCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke_2;
      v21[3] = &unk_1E5FD8FE8;
      v21[4] = self;
      id v22 = v6;
      id v23 = v8;
      dispatch_sync(v20, v21);

      unint64_t v14 = v22;
      goto LABEL_10;
    }
    unint64_t v18 = [(ICNoteCoreDataIndexer *)self invitationsIndexer];
    long long v19 = [(ICNoteCoreDataIndexer *)self invitationsSectionIdentifier];
    [v18 deleteObjectWithIDFromIndex:v6 inSection:v19];

    [(ICNoteCoreDataIndexer *)self updateSectionIdentifiers];
  }
  else
  {
    v15 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[ICNoteCoreDataIndexer deleteObjectWithIDFromIndex:inSection:]((uint64_t)v6, (uint64_t)v7, v15);
    }
  }
LABEL_11:
}

void __63__ICNoteCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke(uint64_t a1)
{
  id v2 = [ICFolderListSectionIdentifier alloc];
  id v7 = [*(id *)(a1 + 32) modernManagedObjectContext];
  id v3 = objc_msgSend(v7, "ic_existingObjectWithID:", *(void *)(a1 + 40));
  uint64_t v4 = [(ICFolderListSectionIdentifier *)v2 initWithObject:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __63__ICNoteCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  v5[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 removeObjectIDs:v3 fromIndexInSection:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) mergePinnedNotesAndNotesSectionIfNeeded];
  return [*(id *)(a1 + 32) updateSectionIdentifiers];
}

- (void)deleteWithDecisionController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 sourceObjects];
  uint64_t v9 = [v8 valueForKey:@"objectID"];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__ICNoteCoreDataIndexer_deleteWithDecisionController_completion___block_invoke;
  v12[3] = &unk_1E5FDB3B8;
  unint64_t v14 = self;
  id v15 = v6;
  id v13 = v9;
  id v10 = v9;
  id v11 = v6;
  [v7 performDecisionWithCompletion:v12];
}

uint64_t __65__ICNoteCoreDataIndexer_deleteWithDecisionController_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v8, "ic_isFolderType", (void)v26))
          {
            uint64_t v9 = [*(id *)(a1 + 40) sectionIdentifiersToManagedObjectIDs];
            id v10 = [*(id *)(a1 + 40) folderSectionIdentifier];
            id v11 = [v9 objectForKeyedSubscript:v10];
            int v12 = [v11 containsObject:v8];

            if (v12)
            {
              id v13 = *(void **)(a1 + 40);
              uint64_t v14 = [v13 folderSectionIdentifier];
              goto LABEL_13;
            }
          }
          if (objc_msgSend(v8, "ic_isNoteType"))
          {
            id v15 = [*(id *)(a1 + 40) sectionIdentifiersToManagedObjectIDs];
            long long v16 = [*(id *)(a1 + 40) pinnedNoteSectionIdentifier];
            int v17 = [v15 objectForKeyedSubscript:v16];
            int v18 = [v17 containsObject:v8];

            if (v18)
            {
              id v13 = *(void **)(a1 + 40);
              uint64_t v14 = [v13 pinnedNoteSectionIdentifier];
LABEL_13:
              long long v19 = (void *)v14;
              char v20 = v13;
LABEL_14:
              [v20 deleteObjectWithIDFromIndex:v8 inSection:v19];
              goto LABEL_19;
            }
          }
          long long v19 = [*(id *)(a1 + 40) sectionForObjectID:v8];
          if (v19)
          {
            if (objc_msgSend(v8, "ic_isNoteType"))
            {
              id v21 = [*(id *)(a1 + 40) sectionIdentifiersToManagedObjectIDs];
              id v22 = [v21 objectForKeyedSubscript:v19];
              int v23 = [v22 containsObject:v8];

              if (v23)
              {
                char v20 = *(void **)(a1 + 40);
                goto LABEL_14;
              }
            }
          }
LABEL_19:
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v5);
    }

    uint64_t result = *(void *)(a1 + 48);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      id v25 = *(uint64_t (**)(void))(result + 16);
      return v25();
    }
  }
  return result;
}

- (void)unmergePinnedNotesAndNotesSectionIfNeeded
{
  if ([(ICNoteCoreDataIndexer *)self sortsByPinned])
  {
    id v3 = [(ICCoreDataIndexer *)self modernManagedObjectContext];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __66__ICNoteCoreDataIndexer_unmergePinnedNotesAndNotesSectionIfNeeded__block_invoke;
    v4[3] = &unk_1E5FD8DF0;
    v4[4] = self;
    [v3 performBlockAndWait:v4];
  }
}

void __66__ICNoteCoreDataIndexer_unmergePinnedNotesAndNotesSectionIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) unpinnedNoteIdentifiers];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C978] array];
  }
  uint64_t v5 = v4;

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__ICNoteCoreDataIndexer_unmergePinnedNotesAndNotesSectionIfNeeded__block_invoke_2;
  v9[3] = &unk_1E5FDB3E0;
  v9[4] = *(void *)(a1 + 32);
  uint64_t v6 = objc_msgSend(v5, "ic_objectsPassingTest:", v9);
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 pinnedNoteSectionIdentifier];
  [v7 addObjectIDs:v6 toIndexInSection:v8];

  [*(id *)(a1 + 32) removeUnpinnedNoteObjectIds:v6];
}

uint64_t __66__ICNoteCoreDataIndexer_unmergePinnedNotesAndNotesSectionIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = [*(id *)(a1 + 32) modernManagedObjectContext];
  uint64_t v5 = objc_msgSend(v4, "ic_existingObjectWithID:", v3);

  uint64_t v6 = ICDynamicCast();
  uint64_t v7 = [v6 isPinned];

  return v7;
}

void __64__ICNoteCoreDataIndexer_mergePinnedNotesAndNotesSectionIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__ICNoteCoreDataIndexer_mergePinnedNotesAndNotesSectionIfNeeded__block_invoke_3;
  v17[3] = &unk_1E5FDB408;
  v17[4] = *(void *)(a1 + 40);
  id v3 = objc_msgSend(v2, "ic_compactMap:", v17);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
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
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = *(void **)(a1 + 40);
        id v10 = [v8 objectID];
        int v18 = v10;
        id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
        int v12 = [*(id *)(a1 + 40) unpinnedSectionIdentifierForObject:v8];
        [v9 addObjectIDs:v11 toIndexInSection:v12];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }
}

id __64__ICNoteCoreDataIndexer_mergePinnedNotesAndNotesSectionIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = [*(id *)(a1 + 32) modernManagedObjectContext];
  uint64_t v5 = objc_msgSend(v4, "ic_existingObjectWithID:", v3);

  uint64_t v6 = ICDynamicCast();

  return v6;
}

void __62__ICNoteCoreDataIndexer_updateModernFetchedResultsControllers__block_invoke(uint64_t a1)
{
  v63[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) noteContainer];
  if (v2 || ([*(id *)(a1 + 32) noteQuery], (id v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_4;
  }
  uint64_t v35 = [*(id *)(a1 + 32) virtualSmartFolder];

  if (v35)
  {
LABEL_4:
    id v3 = (void *)MEMORY[0x1E4F83790];
    uint64_t v4 = [*(id *)(a1 + 32) sortType];
    uint64_t v5 = [v3 sortDescriptorsForCurrentTypeIncludingPinnedNotes:0 folderNoteSortType:v4];

    uint64_t v6 = [*(id *)(a1 + 32) noteContainer];

    if (v6)
    {
      objc_opt_class();
      uint64_t v7 = [*(id *)(a1 + 32) modernManagedObjectContext];
      uint64_t v8 = [*(id *)(a1 + 32) noteContainer];
      uint64_t v9 = [v8 objectID];
      id v10 = objc_msgSend(v7, "ic_existingObjectWithID:", v9);
      id v11 = ICCheckedDynamicCast();
      int v12 = [v11 predicateForVisibleNotes];
    }
    else
    {
      long long v13 = [*(id *)(a1 + 32) noteQuery];

      if (!v13)
      {
        uint64_t v37 = [*(id *)(a1 + 32) virtualSmartFolder];

        if (v37)
        {
          uint64_t v38 = [*(id *)(a1 + 32) virtualSmartFolder];
          uint64_t v39 = [*(id *)(a1 + 32) modernManagedObjectContext];
          int v12 = [v38 predicateForContext:v39];
        }
        else
        {
          int v12 = 0;
        }
LABEL_9:
        if ([*(id *)(a1 + 32) sortsByPinned])
        {
          long long v15 = (void *)MEMORY[0x1E4F28BA0];
          v62[0] = v12;
          long long v16 = [MEMORY[0x1E4F83418] predicateForPinnedNotes];
          v62[1] = v16;
          int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
          int v18 = [v15 andPredicateWithSubpredicates:v17];

          long long v19 = (void *)MEMORY[0x1E4F28BA0];
          uint64_t v20 = [MEMORY[0x1E4F83418] predicateForPinnedNotes];
          id v21 = [v19 notPredicateWithSubpredicate:v20];

          id v22 = (void *)MEMORY[0x1E4F28BA0];
          v61[0] = v12;
          v61[1] = v21;
          int v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
          id v24 = [v22 andPredicateWithSubpredicates:v23];
        }
        else
        {
          int v18 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
          id v24 = v12;
        }
        id v25 = [*(id *)(a1 + 32) noteQuery];
        long long v26 = [v25 entityName];
        long long v27 = v26;
        if (v26)
        {
          id v28 = v26;
        }
        else
        {
          v58 = v18;
          id v59 = v24;
          long long v29 = v12;
          v30 = v5;
          uint64_t v31 = [*(id *)(a1 + 32) virtualSmartFolder];
          objc_super v32 = [v31 query];
          v33 = [v32 entityName];
          id v34 = v33;
          if (v33)
          {
            id v28 = v33;
          }
          else
          {
            uint64_t v40 = [MEMORY[0x1E4F83418] entity];
            id v28 = [v40 name];
          }
          uint64_t v5 = v30;
          int v12 = v29;
          int v18 = v58;
          id v24 = v59;
        }

        v41 = [*(id *)(a1 + 32) modernPinnedNoteFetchedResultsController];

        if (v41)
        {
          id v42 = [*(id *)(a1 + 32) modernPinnedNoteFetchedResultsController];
          id v43 = [v42 fetchRequest];
          [v43 setPredicate:v18];

          uint64_t v44 = [*(id *)(a1 + 32) modernPinnedNoteFetchedResultsController];
          uint64_t v45 = [v44 fetchRequest];
          [v45 setSortDescriptors:v5];
        }
        else
        {
          uint64_t v44 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v28];
          [v44 setPredicate:v18];
          [v44 setSortDescriptors:v5];
          id v46 = objc_alloc(MEMORY[0x1E4F1C0F0]);
          uint64_t v45 = [*(id *)(a1 + 32) modernManagedObjectContext];
          v47 = (void *)[v46 initWithFetchRequest:v44 managedObjectContext:v45 sectionNameKeyPath:0 cacheName:0];
          [*(id *)(a1 + 32) setModernPinnedNoteFetchedResultsController:v47];
        }
        uint64_t v48 = [*(id *)(a1 + 32) modernNoteFetchedResultsController];

        if (v48)
        {
          uint64_t v49 = [*(id *)(a1 + 32) modernNoteFetchedResultsController];
          uint64_t v50 = [v49 fetchRequest];
          [v50 setPredicate:v24];

          v51 = [*(id *)(a1 + 32) modernNoteFetchedResultsController];
          uint64_t v52 = [v51 fetchRequest];
          [v52 setSortDescriptors:v5];
        }
        else
        {
          v51 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v28];
          [v51 setPredicate:v24];
          [v51 setSortDescriptors:v5];
          v53 = [*(id *)(a1 + 32) modernDateHeadersAttribute];

          if (v53)
          {
            long long v54 = [*(id *)(a1 + 32) modernDateHeadersAttribute];
            long long v60 = v54;
            uint64_t v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
            [v51 setPropertiesToFetch:v55];
          }
          id v56 = objc_alloc(MEMORY[0x1E4F1C0F0]);
          uint64_t v52 = [*(id *)(a1 + 32) modernManagedObjectContext];
          long long v57 = (void *)[v56 initWithFetchRequest:v51 managedObjectContext:v52 sectionNameKeyPath:0 cacheName:0];
          [*(id *)(a1 + 32) setModernNoteFetchedResultsController:v57];
        }
        return;
      }
      long long v14 = (void *)MEMORY[0x1E4F28BA0];
      uint64_t v7 = [*(id *)(a1 + 32) noteQuery];
      uint64_t v8 = [v7 predicate];
      v63[0] = v8;
      uint64_t v9 = [MEMORY[0x1E4F83418] predicateForFetchedFromCloudObjects];
      v63[1] = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
      int v12 = [v14 andPredicateWithSubpredicates:v10];
    }

    goto LABEL_9;
  }
  [*(id *)(a1 + 32) setModernPinnedNoteFetchedResultsController:0];
  uint64_t v36 = *(void **)(a1 + 32);
  [v36 setModernNoteFetchedResultsController:0];
}

- (void)prependObjectIDs:(id)a3 toIndexInSection:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v11 count])
  {
    uint64_t v7 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
    uint64_t v8 = [v7 objectForKeyedSubscript:v6];

    if (!v8)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA70] orderedSet];
      uint64_t v9 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
      [v9 setObject:v8 forKeyedSubscript:v6];
    }
    id v10 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v11, "count"));
    [v8 insertObjects:v11 atIndexes:v10];
  }
}

- (void)removeObjectIDs:(id)a3 fromIndexInSection:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v10 count])
  {
    uint64_t v7 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
    uint64_t v8 = [v7 objectForKeyedSubscript:v6];

    if (v8)
    {
      [v8 removeObjectsInArray:v10];
      if (![v8 count])
      {
        uint64_t v9 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
        [v9 setObject:0 forKeyedSubscript:v6];
      }
    }
  }
}

- (void)sortSection:(id)a3
{
  id v4 = a3;
  if ([v4 sectionType] != 2)
  {
    id v6 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
    uint64_t v5 = [v6 objectForKeyedSubscript:v4];

    if (!v5) {
      goto LABEL_10;
    }
    uint64_t v7 = [(ICNoteCoreDataIndexer *)self noteContainer];
    if (v7
      || ([(ICNoteCoreDataIndexer *)self noteQuery],
          (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      int v12 = [(ICNoteCoreDataIndexer *)self virtualSmartFolder];

      if (!v12)
      {
        long long v13 = [(ICNoteCoreDataIndexer *)self noteCollection];

        if (!v13) {
          goto LABEL_10;
        }
        uint64_t v8 = [(ICCoreDataIndexer *)self legacyManagedObjectContext];
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        long long v16 = __37__ICNoteCoreDataIndexer_sortSection___block_invoke_4;
        int v17 = &unk_1E5FD8FE8;
        int v18 = self;
        uint64_t v9 = (id *)&v19;
        long long v19 = v5;
        id v10 = &v20;
        id v20 = v4;
        id v11 = &v14;
        goto LABEL_9;
      }
    }
    uint64_t v8 = [(ICCoreDataIndexer *)self modernManagedObjectContext];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __37__ICNoteCoreDataIndexer_sortSection___block_invoke;
    v21[3] = &unk_1E5FD8FE8;
    v21[4] = self;
    uint64_t v9 = (id *)&v22;
    id v22 = v5;
    id v10 = &v23;
    id v23 = v4;
    id v11 = v21;
LABEL_9:
    objc_msgSend(v8, "performBlockAndWait:", v11, v14, v15, v16, v17, v18);

    goto LABEL_10;
  }
  uint64_t v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[ICNoteCoreDataIndexer sortSection:](v5);
  }
LABEL_10:
}

void __37__ICNoteCoreDataIndexer_sortSection___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F83790];
  uint64_t v3 = [*(id *)(a1 + 32) sortsByPinned];
  id v4 = [*(id *)(a1 + 32) sortType];
  uint64_t v5 = [v2 sortDescriptorsForCurrentTypeIncludingPinnedNotes:v3 folderNoteSortType:v4];

  id v6 = [*(id *)(a1 + 40) array];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__ICNoteCoreDataIndexer_sortSection___block_invoke_2;
  v12[3] = &unk_1E5FDB430;
  void v12[4] = *(void *)(a1 + 32);
  uint64_t v7 = objc_msgSend(v6, "ic_map:", v12);

  uint64_t v8 = [v7 sortedArrayUsingDescriptors:v5];
  uint64_t v9 = objc_msgSend(v8, "ic_map:", &__block_literal_global_206);

  id v10 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v9];
  id v11 = [*(id *)(a1 + 32) sectionIdentifiersToManagedObjectIDs];
  [v11 setObject:v10 forKeyedSubscript:*(void *)(a1 + 48)];
}

id __37__ICNoteCoreDataIndexer_sortSection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 modernManagedObjectContext];
  uint64_t v5 = objc_msgSend(v4, "ic_existingObjectWithID:", v3);

  return v5;
}

uint64_t __37__ICNoteCoreDataIndexer_sortSection___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

void __37__ICNoteCoreDataIndexer_sortSection___block_invoke_4(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F83790], "sortDescriptorsForCurrentTypeIncludingPinnedNotes:", objc_msgSend(*(id *)(a1 + 32), "sortsByPinned"));
  id v3 = [*(id *)(a1 + 40) array];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__ICNoteCoreDataIndexer_sortSection___block_invoke_5;
  v9[3] = &unk_1E5FDB430;
  v9[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "ic_map:", v9);

  uint64_t v5 = [v4 sortedArrayUsingDescriptors:v2];
  id v6 = objc_msgSend(v5, "ic_map:", &__block_literal_global_208);

  uint64_t v7 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v6];
  uint64_t v8 = [*(id *)(a1 + 32) sectionIdentifiersToManagedObjectIDs];
  [v8 setObject:v7 forKeyedSubscript:*(void *)(a1 + 48)];
}

id __37__ICNoteCoreDataIndexer_sortSection___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 legacyManagedObjectContext];
  uint64_t v5 = objc_msgSend(v4, "ic_existingObjectWithID:", v3);

  return v5;
}

uint64_t __37__ICNoteCoreDataIndexer_sortSection___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

- (NSArray)sortedNoteIdentifiers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(ICNoteCoreDataIndexer *)self sectionIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
        id v11 = [v10 objectForKeyedSubscript:v9];
        int v12 = [v11 array];
        [v3 addObjectsFromArray:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  long long v13 = objc_msgSend(v3, "ic_compactMap:", &__block_literal_global_211);

  return (NSArray *)v13;
}

id __46__ICNoteCoreDataIndexer_sortedNoteIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "ic_isNoteType")) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)unpinnedSectionIdentifierForObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNoteCoreDataIndexer *)self dateHeadersValueForNote:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectID];
    uint64_t v7 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
    uint64_t v8 = +[ICNoteTimelineController timelineSectionIdentifierForNoteObjectID:v6 date:v5 sectionIdentifiersToManagedObjectIDs:v7];
  }
  else
  {
    uint64_t v8 = [(ICNoteCoreDataIndexer *)self noteSectionIdentifier];
  }

  return v8;
}

- (id)sectionForObjectID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
  uint64_t v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v12 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
        long long v13 = [v12 objectForKeyedSubscript:v11];
        char v14 = [v13 containsObject:v4];

        if (v14)
        {
          id v15 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

- (id)unpinnedNoteIdentifiers
{
  id v3 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
  id v4 = [v3 allKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ICNoteCoreDataIndexer_unpinnedNoteIdentifiers__block_invoke;
  v7[3] = &unk_1E5FDB498;
  v7[4] = self;
  uint64_t v5 = objc_msgSend(v4, "ic_flatMap:", v7);

  return v5;
}

id __48__ICNoteCoreDataIndexer_unpinnedNoteIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) noteSectionIdentifier];
  if ([v4 isEqual:v3])
  {

LABEL_4:
    uint64_t v6 = [*(id *)(a1 + 32) sectionIdentifiersToManagedObjectIDs];
    uint64_t v7 = [v6 objectForKeyedSubscript:v3];
    uint64_t v8 = [v7 array];

    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_4;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_6:

  return v8;
}

- (void)removeUnpinnedNoteObjectIds:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
  uint64_t v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        int v12 = [(ICNoteCoreDataIndexer *)self noteSectionIdentifier];
        if ([v12 isEqual:v11])
        {
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            goto LABEL_10;
          }
        }
        [(ICNoteCoreDataIndexer *)self removeObjectIDs:v4 fromIndexInSection:v11];
LABEL_10:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (id)legacyDateHeadersAttribute
{
  return 0;
}

- (id)dateHeadersValueForNote:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICNoteCoreDataIndexer *)self resolvedDateHeadersType];
  if (v5 == 2)
  {
    uint64_t v6 = [v4 creationDate];
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    uint64_t v6 = [v4 modificationDate];
LABEL_5:
    uint64_t v7 = (void *)v6;
    goto LABEL_7;
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)dateHeadersAreStaleForNote:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICNoteCoreDataIndexer *)self dateHeadersValueForNote:v4];
  if (v5)
  {
    if ([v4 isPinned])
    {
      uint64_t v6 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
      uint64_t v7 = [(ICNoteCoreDataIndexer *)self pinnedNoteSectionIdentifier];
      uint64_t v8 = v6;
      uint64_t v9 = v7;
    }
    else
    {
      uint64_t v11 = [v4 objectID];
      int v12 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
      uint64_t v6 = +[ICNoteTimelineController timelineSectionIdentifierForNoteObjectID:v11 date:v5 sectionIdentifiersToManagedObjectIDs:v12];

      uint64_t v8 = [(ICNoteCoreDataIndexer *)self sectionIdentifiersToManagedObjectIDs];
      uint64_t v7 = v8;
      uint64_t v9 = v6;
    }
    long long v13 = [v8 objectForKeyedSubscript:v9];
    long long v14 = [v4 objectID];
    int v10 = [v13 containsObject:v14] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)setInvitationsIndexer:(id)a3
{
}

- (void)setFolderIndexer:(id)a3
{
}

- (ICTagCoreDataIndexer)tagIndexer
{
  return self->_tagIndexer;
}

- (unint64_t)pinnedNotesSectionMinimumCount
{
  return self->_pinnedNotesSectionMinimumCount;
}

- (void)setIndexAccessQueue:(id)a3
{
}

- (NSFetchedResultsController)legacyNoteFetchedResultsController
{
  return self->_legacyNoteFetchedResultsController;
}

- (ICNoteSectionIdentifier)tagSectionIdentifier
{
  return self->_tagSectionIdentifier;
}

- (void)setTagSectionIdentifier:(id)a3
{
}

- (void)setFolderSectionIdentifier:(id)a3
{
}

- (void)setInvitationsSectionIdentifier:(id)a3
{
}

- (void)setPinnedNoteSectionIdentifier:(id)a3
{
}

- (ICNoteSectionIdentifier)noteSectionIdentifier
{
  return self->_noteSectionIdentifier;
}

- (void)setNoteSectionIdentifier:(id)a3
{
}

- (void)setSortedNoteIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedNoteIdentifiers, 0);
  objc_storeStrong((id *)&self->_noteSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_pinnedNoteSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationsSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_folderSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_tagSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiersToManagedObjectIDs, 0);
  objc_storeStrong((id *)&self->_legacyNoteFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_modernNoteFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_modernPinnedNoteFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_indexAccessQueue, 0);
  objc_storeStrong((id *)&self->_sortType, 0);
  objc_storeStrong((id *)&self->_virtualSmartFolder, 0);
  objc_storeStrong((id *)&self->_noteQuery, 0);
  objc_storeStrong((id *)&self->_noteCollection, 0);
  objc_storeStrong((id *)&self->_noteContainer, 0);
  objc_storeStrong((id *)&self->_tagIndexer, 0);
  objc_storeStrong((id *)&self->_folderIndexer, 0);
  objc_storeStrong((id *)&self->_invitationsIndexer, 0);
}

void __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "indexObjectsInSection:sectionIndex:fetchedResultsController: objectsId count doesn't match dates count", v1, 2u);
}

- (void)deleteObjectWithIDFromIndex:(os_log_t)log inSection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1B08EB000, log, OS_LOG_TYPE_FAULT, "Invalid note section identifier — not deleting object from index {objectID: %@, section: %@}", (uint8_t *)&v3, 0x16u);
}

- (void)sortSection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1B08EB000, log, OS_LOG_TYPE_FAULT, "Sorting the folder section is not supported.", v1, 2u);
}

@end