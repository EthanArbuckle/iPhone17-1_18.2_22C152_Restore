@interface PLDelayedSaveActionsProcessor
- (PLDelayedSaveActionsProcessor)initWithLibraryServicesManager:(id)a3;
- (id)_assetIDsByContainingSocialGroupIDsFromAssetIDsNeedingContainmentUpdates:(id)a3 inContext:(id)a4;
- (id)_assetIDsByNodeIDFromAssetPersonEdgeDictionaries:(id)a3 assetIDsNeedingContainmentUpdates:(id)a4 inContext:(id)a5;
- (id)_assetIDsByPersonUUIDWithAllPersonsFromAssetsNeedingContainmentUpdates:(id)a3 assetIDsNeedingContainmentUpdates:(id)a4 inContext:(id)a5;
- (id)_personUUIDsByNodeIDFromAssetPersonDictionaries:(id)a3 inContext:(id)a4;
- (id)_socialGroupNodeIDsContainingMember:(id)a3 library:(id)a4 error:(id *)a5;
- (void)_deleteUUIDs:(id)a3 fromCoreDuetStreams:(id)a4 transaction:(id)a5;
- (void)_processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)_processAssetIDsByPersonUUIDNeedingContainmentUpdates:(id)a3 assetIDsNeedingContainmentUpdates:(id)a4 pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates:(BOOL)a5 library:(id)a6 transaction:(id)a7;
- (void)_processAssetsNeedingAssetPersonEdgeUpdates:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)_processDelayedAlbumCountsAndDateRangeUpdates:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)_processDelayedAlbumKeyAssetsUpdates:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)_processDelayedAlbumWidgetTimelineReload:(BOOL)a3 library:(id)a4 transaction:(id)a5;
- (void)_processDelayedAssetsForDuetDelete:(id)a3 transaction:(id)a4;
- (void)_processDelayedAssetsForWallpaperFavoriteAlbumRemoval:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)_processDelayedAssetsForWallpaperUserAlbumRemoval:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)_processDelayedAssetsForWidgetFavoriteAlbumRemoval:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)_processDelayedAssetsForWidgetUserAlbumRemoval:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)_processDelayedCloudFeedAlbumUpdates:(id)a3 assetInserts:(id)a4 assetUpdates:(id)a5 commentInserts:(id)a6 invitationRecordUpdates:(id)a7 deletionEntries:(id)a8 transaction:(id)a9;
- (void)_processDelayedFeaturedContentUpdateAndWidgetTimelineReload:(BOOL)a3 withPersonUUIDs:(id)a4 shouldReloadWidgetTimeline:(BOOL)a5 library:(id)a6 transaction:(id)a7;
- (void)_processDelayedForYouWidgetTimelineReload:(BOOL)a3 library:(id)a4 transaction:(id)a5;
- (void)_processDelayedImportSessionCountsAndDateRangeUpdates:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)_processDelayedLibraryScopeParticipantsUpdate:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)_processDelayedLibraryScopeRulesUpdate:(BOOL)a3 library:(id)a4 transaction:(id)a5;
- (void)_processDelayedMemoriesAssetUpdate:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)_processDelayedMemoriesForDuetDelete:(id)a3 transaction:(id)a4;
- (void)_processDelayedMomentChangesWithTransaction:(id)a3;
- (void)_processDelayedSearchIndexUpdates:(id)a3 transaction:(id)a4;
- (void)_processDelayedWallpaperSuggestionReload:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)_processMembersOfSocialGroupsNeedingDeduplication:(id)a3 pendingSocialGroupIDsNeedingDeduplication:(BOOL)a4 library:(id)a5 transaction:(id)a6;
- (void)_processSocialGroupsNeedingDeduplication:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)_runAssetContainmentForSocialGroup:(id)a3 assetIDsToUpdate:(id)a4;
- (void)_runContainmentOnAllGroupsNeedingContainmentUpdates:(id)a3 inLibrary:(id)a4;
- (void)processDelayedDeletionsFromChangeHubEvent:(id)a3 library:(id)a4 transaction:(id)a5;
- (void)processDelayedMomentGeneratorSaveActionsFromDetail:(id)a3;
- (void)processDelayedSaveActionsDetail:(id)a3 withPhotoLibrary:(id)a4 transaction:(id)a5;
@end

@implementation PLDelayedSaveActionsProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDuetCallback, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
}

- (void)_processSocialGroupsNeedingDeduplication:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (PLIsAssetsd() && [v7 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __94__PLDelayedSaveActionsProcessor__processSocialGroupsNeedingDeduplication_library_transaction___block_invoke;
    v12[3] = &unk_1E5875E18;
    id v13 = v7;
    id v14 = v8;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __94__PLDelayedSaveActionsProcessor__processSocialGroupsNeedingDeduplication_library_transaction___block_invoke_170;
    v10[3] = &unk_1E5875CE0;
    id v11 = v9;
    [v14 performTransactionAndWait:v12 completionHandler:v10];
  }
}

void __94__PLDelayedSaveActionsProcessor__processSocialGroupsNeedingDeduplication_library_transaction___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = +[PLGraphNode fetchRequest];
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v26 = 0;
  v20 = v2;
  v5 = [v4 executeFetchRequest:v2 error:&v26];
  id v6 = v26;

  if (!v5)
  {
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error getting social group source nodes from ids: %@", buf, 0xCu);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x19F38D3B0]();
        if (([v13 isDeleted] & 1) == 0)
        {
          id v15 = +[PLGraphNodeContainer newNodeContainerWithNode:v13];
          id v21 = v6;
          BOOL v16 = +[PLSocialGroup deleteDuplicateGroupsAfterInsertionOfGroup:v15 error:&v21];
          id v17 = v21;

          if (!v16)
          {
            v18 = PLBackendGetLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = [v15 uuid];
              *(_DWORD *)buf = 138412546;
              id v28 = v19;
              __int16 v29 = 2112;
              id v30 = v17;
              _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error deleting duplicate groups after insertion of group with UUID: %@, error: %@", buf, 0x16u);
            }
          }

          id v6 = v17;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v10);
  }
}

void *__94__PLDelayedSaveActionsProcessor__processSocialGroupsNeedingDeduplication_library_transaction___block_invoke_170(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result)
  {
    [result stillAlive];
    v3 = *(void **)(a1 + 32);
    return (void *)[v3 completeTransactionScope:@"PLTransactionScopeSocialGroupDeduplication"];
  }
  return result;
}

- (void)_processMembersOfSocialGroupsNeedingDeduplication:(id)a3 pendingSocialGroupIDsNeedingDeduplication:(BOOL)a4 library:(id)a5 transaction:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (PLIsAssetsd() && [v10 count])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __145__PLDelayedSaveActionsProcessor__processMembersOfSocialGroupsNeedingDeduplication_pendingSocialGroupIDsNeedingDeduplication_library_transaction___block_invoke;
    v16[3] = &unk_1E5873A50;
    v16[4] = self;
    id v17 = v10;
    id v18 = v11;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __145__PLDelayedSaveActionsProcessor__processMembersOfSocialGroupsNeedingDeduplication_pendingSocialGroupIDsNeedingDeduplication_library_transaction___block_invoke_169;
    v13[3] = &unk_1E58748B0;
    id v14 = v12;
    BOOL v15 = a4;
    [v18 performBlockAndWait:v16 completionHandler:v13];
  }
}

void __145__PLDelayedSaveActionsProcessor__processMembersOfSocialGroupsNeedingDeduplication_pendingSocialGroupIDsNeedingDeduplication_library_transaction___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = 0;
  v5 = [v2 _socialGroupNodeIDsContainingMember:v3 library:v4 error:&v8];
  id v6 = v8;
  if (!v5)
  {
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error fetching social group node IDs containing member for deduplication: %@", buf, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _processSocialGroupsNeedingDeduplication:v5 library:*(void *)(a1 + 48) transaction:0];
}

uint64_t __145__PLDelayedSaveActionsProcessor__processMembersOfSocialGroupsNeedingDeduplication_pendingSocialGroupIDsNeedingDeduplication_library_transaction___block_invoke_169(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) stillAlive];
  if (!*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 completeTransactionScope:@"PLTransactionScopeSocialGroupDeduplication"];
  }
  return result;
}

- (void)_processAssetsNeedingAssetPersonEdgeUpdates:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (PLIsAssetsd() && [v7 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97__PLDelayedSaveActionsProcessor__processAssetsNeedingAssetPersonEdgeUpdates_library_transaction___block_invoke;
    v12[3] = &unk_1E5875E18;
    id v13 = v7;
    id v14 = v8;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __97__PLDelayedSaveActionsProcessor__processAssetsNeedingAssetPersonEdgeUpdates_library_transaction___block_invoke_168;
    v10[3] = &unk_1E5875CE0;
    id v11 = v9;
    [v14 performBlockAndWait:v12 completionHandler:v10];
  }
}

void __97__PLDelayedSaveActionsProcessor__processAssetsNeedingAssetPersonEdgeUpdates_library_transaction___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) allObjects];
  uint64_t v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v7 = 0;
  BOOL v4 = +[PLSocialGroupAssetContainment updateAndSaveAssetPersonEdgesForAssetsWithIDs:v2 inContext:v3 error:&v7];
  id v5 = v7;

  if (!v4)
  {
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error updating asset-person edges: %@", buf, 0xCu);
    }
  }
}

uint64_t __97__PLDelayedSaveActionsProcessor__processAssetsNeedingAssetPersonEdgeUpdates_library_transaction___block_invoke_168(uint64_t a1)
{
  [*(id *)(a1 + 32) stillAlive];
  v2 = *(void **)(a1 + 32);
  return [v2 completeTransactionScope:@"PLTransactionScopeSocialGroupAssetPersonEdges"];
}

- (void)_processAssetIDsByPersonUUIDNeedingContainmentUpdates:(id)a3 assetIDsNeedingContainmentUpdates:(id)a4 pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates:(BOOL)a5 library:(id)a6 transaction:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (PLIsAssetsd() && ([v12 count] || objc_msgSend(v13, "count")))
  {
    BOOL v16 = (void *)MEMORY[0x19F38D3B0]();
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __197__PLDelayedSaveActionsProcessor__processAssetIDsByPersonUUIDNeedingContainmentUpdates_assetIDsNeedingContainmentUpdates_pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates_library_transaction___block_invoke;
    v24[3] = &unk_1E5870618;
    id v25 = v14;
    id v26 = self;
    id v27 = v12;
    id v28 = v13;
    id v29 = v17;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __197__PLDelayedSaveActionsProcessor__processAssetIDsByPersonUUIDNeedingContainmentUpdates_assetIDsNeedingContainmentUpdates_pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates_library_transaction___block_invoke_2;
    v19[3] = &unk_1E5873988;
    id v20 = v29;
    id v21 = v25;
    id v22 = v15;
    BOOL v23 = a5;
    id v18 = v29;
    [v21 performTransactionAndWait:v24 completionHandler:v19];
  }
}

void __197__PLDelayedSaveActionsProcessor__processAssetIDsByPersonUUIDNeedingContainmentUpdates_assetIDsNeedingContainmentUpdates_pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates_library_transaction___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = [*(id *)(a1 + 40) _assetIDsByPersonUUIDWithAllPersonsFromAssetsNeedingContainmentUpdates:*(void *)(a1 + 48) assetIDsNeedingContainmentUpdates:*(void *)(a1 + 56) inContext:v2];
  BOOL v4 = [*(id *)(a1 + 40) _assetIDsByNodeIDFromAssetPersonEdgeDictionaries:v3 assetIDsNeedingContainmentUpdates:*(void *)(a1 + 56) inContext:v2];
  id v5 = +[PLGraphNode fetchRequest];
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = [v4 allKeys];
  id v8 = [v6 predicateWithFormat:@"self in %@", v7];
  [v5 setPredicate:v8];

  id v16 = 0;
  id v9 = [v2 executeFetchRequest:v5 error:&v16];
  id v10 = v16;
  if (!v9)
  {
    id v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error fetching nodes with IDs: %@", buf, 0xCu);
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __197__PLDelayedSaveActionsProcessor__processAssetIDsByPersonUUIDNeedingContainmentUpdates_assetIDsNeedingContainmentUpdates_pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates_library_transaction___block_invoke_165;
  v13[3] = &unk_1E586C428;
  void v13[4] = *(void *)(a1 + 40);
  id v14 = v4;
  id v15 = *(id *)(a1 + 64);
  id v12 = v4;
  [v9 enumerateObjectsUsingBlock:v13];
}

uint64_t __197__PLDelayedSaveActionsProcessor__processAssetIDsByPersonUUIDNeedingContainmentUpdates_assetIDsNeedingContainmentUpdates_pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates_library_transaction___block_invoke_2(uint64_t a1)
{
  +[PLSocialGroup updateKeyAssetOfSocialGroupsWithUUIDs:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 48) stillAlive];
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void **)(a1 + 48);
    return [v3 completeTransactionScope:@"PLTransactionScopeSocialGroupAssetContainment"];
  }
  return result;
}

void __197__PLDelayedSaveActionsProcessor__processAssetIDsByPersonUUIDNeedingContainmentUpdates_assetIDsNeedingContainmentUpdates_pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates_library_transaction___block_invoke_165(void *a1, void *a2)
{
  id v12 = a2;
  char v3 = [v12 isDeleted];
  BOOL v4 = v12;
  if ((v3 & 1) == 0)
  {
    id v5 = +[PLGraphNodeContainer newNodeContainerWithNode:v12];
    id v6 = (void *)a1[4];
    id v7 = (void *)a1[5];
    id v8 = [v12 objectID];
    id v9 = [v7 objectForKeyedSubscript:v8];
    [v6 _runAssetContainmentForSocialGroup:v5 assetIDsToUpdate:v9];

    if ([v5 keyAssetIsNeeded])
    {
      id v10 = (void *)a1[6];
      id v11 = [v5 uuid];
      [v10 addObject:v11];
    }
    BOOL v4 = v12;
  }
}

- (id)_assetIDsByNodeIDFromAssetPersonEdgeDictionaries:(id)a3 assetIDsNeedingContainmentUpdates:(id)a4 inContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PLDelayedSaveActionsProcessor *)self _personUUIDsByNodeIDFromAssetPersonDictionaries:v8 inContext:v10];
  if (v9) {
    [(PLDelayedSaveActionsProcessor *)self _assetIDsByContainingSocialGroupIDsFromAssetIDsNeedingContainmentUpdates:v9 inContext:v10];
  }
  else {
  id v12 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __126__PLDelayedSaveActionsProcessor__assetIDsByNodeIDFromAssetPersonEdgeDictionaries_assetIDsNeedingContainmentUpdates_inContext___block_invoke;
  v22[3] = &unk_1E586C3D8;
  id v14 = v13;
  id v23 = v14;
  id v24 = v8;
  id v15 = v8;
  [v11 enumerateKeysAndObjectsUsingBlock:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __126__PLDelayedSaveActionsProcessor__assetIDsByNodeIDFromAssetPersonEdgeDictionaries_assetIDsNeedingContainmentUpdates_inContext___block_invoke_2;
  v20[3] = &unk_1E586C400;
  id v16 = v14;
  id v21 = v16;
  [v12 enumerateKeysAndObjectsUsingBlock:v20];
  id v17 = v21;
  id v18 = v16;

  return v18;
}

void __126__PLDelayedSaveActionsProcessor__assetIDsByNodeIDFromAssetPersonEdgeDictionaries_assetIDsNeedingContainmentUpdates_inContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        id v14 = (void *)MEMORY[0x19F38D3B0](v9);
        id v15 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v13, (void)v16);
        [v7 unionSet:v15];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v10 = v9;
    }
    while (v9);
  }

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

void __126__PLDelayedSaveActionsProcessor__assetIDsByNodeIDFromAssetPersonEdgeDictionaries_assetIDsNeedingContainmentUpdates_inContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
  }
  [v7 unionSet:v8];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)_assetIDsByContainingSocialGroupIDsFromAssetIDsNeedingContainmentUpdates:(id)a3 inContext:(id)a4
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v32 = objc_msgSend(v6, "pl_graphCache");
  uint64_t v7 = [v32 labelWithCode:1000 inContext:v6];
  id v8 = +[PLGraphEdge fetchRequest];
  uint64_t v9 = (void *)MEMORY[0x1E4F28BA0];
  v31 = (void *)v7;
  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"sourceNode.primaryLabel", v7];
  v45[0] = v10;
  v34 = v5;
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"targetAsset", v5];
  v45[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  uint64_t v13 = [v9 andPredicateWithSubpredicates:v12];
  [v8 setPredicate:v13];

  [v8 setResultType:2];
  v44[0] = @"sourceNode";
  v44[1] = @"targetAsset";
  v44[2] = @"objectID";
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
  [v8 setPropertiesToFetch:v14];

  [v8 setFetchBatchSize:100];
  id v40 = 0;
  v33 = v6;
  id v30 = v8;
  id v15 = [v6 executeFetchRequest:v8 error:&v40];
  id v16 = v40;
  if (!v15)
  {
    long long v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v16;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error fetch social group asset edges: %@", buf, 0xCu);
    }
  }
  id v29 = v16;
  long long v18 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v15;
  uint64_t v19 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v24 = (void *)MEMORY[0x19F38D3B0]();
        id v25 = [v23 objectForKeyedSubscript:@"targetAsset"];
        id v26 = [v23 objectForKeyedSubscript:@"sourceNode"];
        id v27 = [v18 objectForKeyedSubscript:v26];
        if (!v27)
        {
          id v27 = [MEMORY[0x1E4F1CA80] set];
        }
        [v27 addObject:v25];
        [v18 setObject:v27 forKeyedSubscript:v26];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v20);
  }

  return v18;
}

- (id)_personUUIDsByNodeIDFromAssetPersonDictionaries:(id)a3 inContext:(id)a4
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v33 = objc_msgSend(v6, "pl_graphCache");
  uint64_t v7 = [v33 labelWithCode:1000 inContext:v6];
  id v8 = +[PLGraphEdge fetchRequest];
  uint64_t v9 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
  v35 = v5;
  uint64_t v11 = [v5 allKeys];
  uint64_t v12 = [v10 predicateWithFormat:@"%K in %@", @"targetPerson.personUUID", v11];
  v46[0] = v12;
  uint64_t v32 = (void *)v7;
  uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"sourceNode.primaryLabel", v7];
  v46[1] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  id v15 = [v9 andPredicateWithSubpredicates:v14];
  [v8 setPredicate:v15];

  [v8 setResultType:2];
  v45[0] = @"sourceNode";
  v45[1] = @"targetPerson.personUUID";
  v45[2] = @"objectID";
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  [v8 setPropertiesToFetch:v16];

  [v8 setFetchBatchSize:100];
  id v41 = 0;
  v34 = v6;
  long long v17 = [v6 executeFetchRequest:v8 error:&v41];
  id v18 = v41;
  if (!v17)
  {
    uint64_t v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v18;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error fetch social group member edges: %@", buf, 0xCu);
    }
  }
  v31 = v18;
  uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v17;
  uint64_t v21 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v26 = (void *)MEMORY[0x19F38D3B0]();
        id v27 = [v25 objectForKeyedSubscript:@"targetPerson.personUUID"];
        id v28 = [v25 objectForKeyedSubscript:@"sourceNode"];
        id v29 = [v20 objectForKeyedSubscript:v28];
        if (!v29)
        {
          id v29 = [MEMORY[0x1E4F1CA80] set];
        }
        [v29 addObject:v27];
        [v20 setObject:v29 forKeyedSubscript:v28];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v22);
  }

  return v20;
}

- (id)_assetIDsByPersonUUIDWithAllPersonsFromAssetsNeedingContainmentUpdates:(id)a3 assetIDsNeedingContainmentUpdates:(id)a4 inContext:(id)a5
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    uint64_t v10 = [v7 mutableCopy];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v11 = (void *)v10;
  if (!v8)
  {
LABEL_16:
    id v32 = v11;
    goto LABEL_20;
  }
  uint64_t v12 = +[PLGraphEdge fetchRequest];
  uint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
  id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"sourceAsset", v8];
  v49[0] = v14;
  id v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"targetPerson");
  v49[1] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  long long v17 = [v13 andPredicateWithSubpredicates:v16];
  [v12 setPredicate:v17];

  [v12 setResultType:2];
  v48[0] = @"sourceAsset";
  v48[1] = @"targetPerson.personUUID";
  v48[2] = @"objectID";
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  [v12 setPropertiesToFetch:v18];

  [v12 setFetchBatchSize:100];
  id v44 = 0;
  long long v38 = v12;
  uint64_t v19 = [v9 executeFetchRequest:v12 error:&v44];
  id v20 = v44;
  uint64_t v21 = v20;
  if (v19)
  {
    v35 = v20;
    id v36 = v9;
    id v37 = v7;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v19;
    uint64_t v22 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v41 != v24) {
            objc_enumerationMutation(obj);
          }
          id v26 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v27 = (void *)MEMORY[0x19F38D3B0]();
          id v28 = [v26 objectForKeyedSubscript:@"targetPerson.personUUID"];
          id v29 = [v26 objectForKeyedSubscript:@"sourceAsset"];
          id v30 = [v11 objectForKeyedSubscript:v28];
          v31 = (void *)[v30 mutableCopy];

          if (!v31)
          {
            v31 = [MEMORY[0x1E4F1CA80] set];
          }
          [v31 addObject:v29];
          [v11 setObject:v31 forKeyedSubscript:v28];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v23);
    }

    id v7 = v37;
    id v9 = v36;
    goto LABEL_16;
  }
  v33 = PLBackendGetLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v21;
    _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error fetching asset-person edge dictionaries: %@", buf, 0xCu);
  }

  id v32 = 0;
LABEL_20:

  return v32;
}

- (void)_processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (PLIsAssetsd() && [v8 count])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __125__PLDelayedSaveActionsProcessor__processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs_library_transaction___block_invoke;
    v13[3] = &unk_1E5873A50;
    void v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __125__PLDelayedSaveActionsProcessor__processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs_library_transaction___block_invoke_140;
    v11[3] = &unk_1E5875CE0;
    id v12 = v10;
    [v15 performTransactionAndWait:v13 completionHandler:v11];
  }
}

void __125__PLDelayedSaveActionsProcessor__processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs_library_transaction___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = 0;
  id v5 = [v2 _socialGroupNodeIDsContainingMember:v3 library:v4 error:&v8];
  id v6 = v8;
  if (!v5)
  {
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error fetching social group node IDs containing member for containment: %@", buf, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _runContainmentOnAllGroupsNeedingContainmentUpdates:v5 inLibrary:*(void *)(a1 + 48)];
}

void *__125__PLDelayedSaveActionsProcessor__processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs_library_transaction___block_invoke_140(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result)
  {
    [result stillAlive];
    uint64_t v3 = *(void **)(a1 + 32);
    return (void *)[v3 completeTransactionScope:@"PLTransactionScopeSocialGroupAssetContainment"];
  }
  return result;
}

- (id)_socialGroupNodeIDsContainingMember:(id)a3 library:(id)a4 error:(id *)a5
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 managedObjectContext];
  id v10 = objc_msgSend(v9, "pl_graphCache");

  uint64_t v11 = [v8 managedObjectContext];
  id v12 = [v10 labelWithCode:1000 inContext:v11];

  if (v12)
  {
    long long v43 = v10;
    uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
    id v14 = (void *)MEMORY[0x1E4F1C0D0];
    id v15 = +[PLGraphEdge entityName];
    id v16 = [v14 fetchRequestWithEntityName:v15];

    long long v17 = (void *)MEMORY[0x1E4F28BA0];
    id v44 = v8;
    long long v42 = v12;
    id v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"sourceNode.primaryLabel", v12];
    v51[0] = v18;
    uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"targetPerson", v7];
    v51[1] = v19;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    uint64_t v21 = [v17 andPredicateWithSubpredicates:v20];
    [v16 setPredicate:v21];

    uint64_t v22 = [v8 managedObjectContext];
    id v49 = 0;
    uint64_t v23 = [v22 executeFetchRequest:v16 error:&v49];
    id v24 = v49;

    if (v24)
    {
      id v25 = 0;
      if (a5) {
        *a5 = v24;
      }
    }
    else
    {
      long long v40 = v23;
      id v41 = v7;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v29 = v23;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v46 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            v35 = [v34 sourceNode];
            id v36 = v35;
            if (v35 && ([v35 isDeleted] & 1) == 0)
            {
              id v37 = [v34 sourceNode];
              long long v38 = [v37 objectID];
              if (v38) {
                [v13 addObject:v38];
              }
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v31);
      }

      id v25 = v13;
      uint64_t v23 = v40;
      id v7 = v41;
      id v8 = v44;
    }

    id v12 = v42;
    id v10 = v43;
  }
  else
  {
    id v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F8C500];
    uint64_t v52 = *MEMORY[0x1E4F28228];
    v53[0] = @"error getting the social group label";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
    id v28 = [v26 errorWithDomain:v27 code:46502 userInfo:v13];
    id v16 = v28;
    if (a5)
    {
      id v16 = v28;
      id v25 = 0;
      *a5 = v16;
    }
    else
    {
      id v25 = 0;
    }
  }

  return v25;
}

- (void)_runContainmentOnAllGroupsNeedingContainmentUpdates:(id)a3 inLibrary:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = (void *)MEMORY[0x19F38D3B0]();
        id v14 = [v6 managedObjectContext];
        id v21 = 0;
        id v15 = [v14 existingObjectWithID:v12 error:&v21];
        id v16 = v21;

        if (v15)
        {
          if ([v15 isDeleted]) {
            goto LABEL_13;
          }
          long long v17 = +[PLGraphNodeContainer newNodeContainerWithNode:v15];
          [(PLDelayedSaveActionsProcessor *)self _runAssetContainmentForSocialGroup:v17 assetIDsToUpdate:0];
          if ([v17 keyAssetIsNeeded])
          {
            id v18 = [v17 uuid];
            [v19 addObject:v18];
          }
        }
        else
        {
          long long v17 = PLBackendGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v27 = v16;
            _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error getting social group source node from ID: %@", buf, 0xCu);
          }
        }

LABEL_13:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }

  +[PLSocialGroup updateKeyAssetOfSocialGroupsWithUUIDs:v19 inLibrary:v6];
}

- (void)_runAssetContainmentForSocialGroup:(id)a3 assetIDsToUpdate:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 socialGroupVerifiedType] - 1 > 1)
  {
    id v8 = 0;
  }
  else
  {
    id v10 = 0;
    char v7 = [v5 runAssetContainmentWithError:&v10 assetIDsToUpdate:v6];
    id v8 = v10;
    if ((v7 & 1) == 0)
    {
      uint64_t v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v8;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error running containment on social group needing update: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_processDelayedLibraryScopeRulesUpdate:(BOOL)a3 library:(id)a4 transaction:(id)a5
{
  BOOL v5 = a3;
  id v6 = a4;
  if (PLIsAssetsd() && v5)
  {
    char v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Delayed save actions processor: Reset sharing suggestions on library scope rules update", v9, 2u);
    }

    id v8 = [v6 photoAnalysisClient];
    [v8 requestReprocessSuggestionsOnLibraryScopeRulesChangeWithReply:0];
  }
}

- (void)_processDelayedLibraryScopeParticipantsUpdate:(id)a3 library:(id)a4 transaction:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (PLIsAssetsd() && [v6 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v14 = PLBackendGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v21 = v13;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Delayed save actions processor: Updating smart-sharing cache with photo analysis %@", buf, 0xCu);
          }

          id v15 = [v7 photoAnalysisClient];
          [v15 asyncRequestCameraSmartSharingProcessingForLibraryScopeWithUUID:v13 withOptions:0 reply:0];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v10);
    }
  }
}

- (void)_processDelayedMemoriesAssetUpdate:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  if (PLIsAssetsd() && [v6 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__PLDelayedSaveActionsProcessor__processDelayedMemoriesAssetUpdate_library_transaction___block_invoke;
    v8[3] = &unk_1E5875E18;
    id v9 = v6;
    id v10 = v7;
    [v10 performTransaction:v8];
  }
}

void __88__PLDelayedSaveActionsProcessor__processDelayedMemoriesAssetUpdate_library_transaction___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = +[PLMemory memoryWithUUID:inPhotoLibrary:](PLMemory, "memoryWithUUID:inPhotoLibrary:", *(void *)(*((void *)&v8 + 1) + 8 * v6), *(void *)(a1 + 40), (void)v8);
        [v7 calculateSyndicatedContentState];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_deleteUUIDs:(id)a3 fromCoreDuetStreams:(id)a4 transaction:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v31 = a5;
  uint64_t v30 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithStreamNames:v8];
  uint64_t v29 = [MEMORY[0x1E4F5B560] knowledgeStore];
  id v26 = v7;
  id v28 = [v7 allObjects];
  uint64_t v9 = [v28 count];
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = 0;
    do
    {
      context = (void *)MEMORY[0x19F38D3B0]();
      uint64_t v34 = v11;
      unint64_t v35 = v10;
      if (v10 >= 0xA) {
        unint64_t v10 = 10;
      }
      id v12 = objc_msgSend(v28, "subarrayWithRange:", v11, v10);
      unint64_t v32 = v10;
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v40 != v17) {
              objc_enumerationMutation(v14);
            }
            long long v19 = [MEMORY[0x1E4F5B5D0] predicateForObjectsWithMetadataKey:@"_DKPhotosMetadataKey.identifier" andStringValue:*(void *)(*((void *)&v39 + 1) + 8 * i)];
            if (v19)
            {
              [v13 addObject:v19];
            }
            else
            {
              id v20 = PLBackendGetLog();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to create a predicate for coreduet stream info", buf, 2u);
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v16);
      }

      uint64_t v21 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v13];
      long long v22 = (void *)MEMORY[0x1E4F28BA0];
      v43[0] = v30;
      v43[1] = v21;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
      long long v24 = [v22 andPredicateWithSubpredicates:v23];

      coreDuetCallback = self->_coreDuetCallback;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __78__PLDelayedSaveActionsProcessor__deleteUUIDs_fromCoreDuetStreams_transaction___block_invoke;
      v36[3] = &unk_1E586C3B0;
      id v37 = v31;
      [v29 deleteAllEventsMatchingPredicate:v24 responseQueue:coreDuetCallback withCompletion:v36];
      unint64_t v10 = v35 - v32;
      uint64_t v11 = v34 + v32;
    }
    while (v35 != v32);
  }
}

void __78__PLDelayedSaveActionsProcessor__deleteUUIDs_fromCoreDuetStreams_transaction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Failed to delete info from knowledge store: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [*(id *)(a1 + 32) stillAlive];
}

- (void)_processDelayedMemoriesForDuetDelete:(id)a3 transaction:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PLDelayedSaveActionsProcessor.m" lineNumber:444 description:@"Must be in assetsd"];
  }
  uint64_t v9 = [v7 count];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      uint64_t v14 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Going to delete %lu memories from knowledge store", (uint8_t *)&v13, 0xCu);
    }

    [(PLDelayedSaveActionsProcessor *)self _deleteUUIDs:v7 fromCoreDuetStreams:&unk_1EEBF1F58 transaction:v8];
  }
}

- (void)_processDelayedAssetsForDuetDelete:(id)a3 transaction:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"PLDelayedSaveActionsProcessor.m" lineNumber:397 description:@"Must be in assetsd"];
  }
  uint64_t v9 = [v7 count];
  if (v9)
  {
    uint64_t v10 = v9;
    id v76 = v8;
    v77 = self;
    id v78 = v7;
    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v81 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Going to delete %lu assets from knowledge store", buf, 0xCu);
    }

    v75 = [MEMORY[0x1E4F5B5B0] sharesStream];
    v74 = [v75 name];
    v79[0] = v74;
    v73 = [MEMORY[0x1E4F5B5B0] shareExtensionStream];
    v72 = [v73 name];
    v79[1] = v72;
    v71 = [MEMORY[0x1E4F5B5B0] useAsWallpaperStream];
    v70 = [v71 name];
    v79[2] = v70;
    v69 = [MEMORY[0x1E4F5B5B0] createWatchFaceStream];
    v68 = [v69 name];
    v79[3] = v68;
    v67 = [MEMORY[0x1E4F5B5B0] airplayStream];
    v66 = [v67 name];
    v79[4] = v66;
    v65 = [MEMORY[0x1E4F5B5B0] airdropStream];
    v64 = [v65 name];
    v79[5] = v64;
    v63 = [MEMORY[0x1E4F5B5B0] saveToFilesStream];
    v62 = [v63 name];
    v79[6] = v62;
    v61 = [MEMORY[0x1E4F5B5B0] assignToContactStream];
    v60 = [v61 name];
    v79[7] = v60;
    v59 = [MEMORY[0x1E4F5B5B0] addToAlbumStream];
    v58 = [v59 name];
    v79[8] = v58;
    v57 = [MEMORY[0x1E4F5B5B0] addToSharedAlbumStream];
    v56 = [v57 name];
    v79[9] = v56;
    v55 = [MEMORY[0x1E4F5B5B0] hideStream];
    v54 = [v55 name];
    v79[10] = v54;
    v53 = [MEMORY[0x1E4F5B5B0] viewedFor1SecondStream];
    uint64_t v52 = [v53 name];
    v79[11] = v52;
    v51 = [MEMORY[0x1E4F5B5B0] viewedFor2SecondsStream];
    v50 = [v51 name];
    v79[12] = v50;
    id v49 = [MEMORY[0x1E4F5B5B0] viewedFor3SecondsStream];
    long long v48 = [v49 name];
    v79[13] = v48;
    long long v47 = [MEMORY[0x1E4F5B5B0] eyeCatchinessStream];
    long long v46 = [v47 name];
    v79[14] = v46;
    uint64_t v45 = [MEMORY[0x1E4F5B5B0] zoomEngagementStream];
    id v44 = [v45 name];
    v79[15] = v44;
    long long v43 = [MEMORY[0x1E4F5B5B0] otherEngagementStream];
    long long v42 = [v43 name];
    v79[16] = v42;
    long long v41 = [MEMORY[0x1E4F5B5B0] recentFavoritesStream];
    long long v40 = [v41 name];
    v79[17] = v40;
    long long v39 = [MEMORY[0x1E4F5B5B0] oldFavoritesStream];
    long long v38 = [v39 name];
    v79[18] = v38;
    id v36 = [MEMORY[0x1E4F5B5B0] otherFavoritesStream];
    unint64_t v35 = [v36 name];
    v79[19] = v35;
    uint64_t v34 = [MEMORY[0x1E4F5B5B0] recentDeletionsStream];
    v33 = [v34 name];
    v79[20] = v33;
    unint64_t v32 = [MEMORY[0x1E4F5B5B0] oldDeletionsStream];
    id v31 = [v32 name];
    v79[21] = v31;
    uint64_t v30 = [MEMORY[0x1E4F5B5B0] allDeletionsStream];
    uint64_t v29 = [v30 name];
    v79[22] = v29;
    id v28 = [MEMORY[0x1E4F5B5B0] editFilterStream];
    id v27 = [v28 name];
    v79[23] = v27;
    id v26 = [MEMORY[0x1E4F5B5B0] editLightingStream];
    long long v25 = [v26 name];
    v79[24] = v25;
    long long v24 = [MEMORY[0x1E4F5B5B0] editCropStream];
    uint64_t v23 = [v24 name];
    v79[25] = v23;
    id v12 = [MEMORY[0x1E4F5B5B0] editAllStream];
    int v13 = [v12 name];
    v79[26] = v13;
    uint64_t v14 = [MEMORY[0x1E4F5B5B0] livePhotosLoopStream];
    uint64_t v15 = [v14 name];
    v79[27] = v15;
    uint64_t v16 = [MEMORY[0x1E4F5B5B0] livePhotosBounceStream];
    uint64_t v17 = [v16 name];
    v79[28] = v17;
    long long v18 = [MEMORY[0x1E4F5B5B0] livePhotosLongExposureStream];
    long long v19 = [v18 name];
    v79[29] = v19;
    id v20 = [MEMORY[0x1E4F5B5B0] livePhotosOtherStream];
    uint64_t v21 = [v20 name];
    v79[30] = v21;
    id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:31];

    id v7 = v78;
    id v8 = v76;
    [(PLDelayedSaveActionsProcessor *)v77 _deleteUUIDs:v78 fromCoreDuetStreams:v37 transaction:v76];
  }
}

- (void)_processDelayedWallpaperSuggestionReload:(id)a3 library:(id)a4 transaction:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (PLIsAssetsd() && [v6 count])
  {
    id v8 = [v7 photoAnalysisClient];
    [v8 reloadWallpaperSuggestions:v6 reply:0];
    uint64_t v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      uint64_t v11 = [v6 count];
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Delayed save actions processor: reloading wallpaper suggestions. suggestion count %lu", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_processDelayedAssetsForWallpaperFavoriteAlbumRemoval:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (PLIsAssetsd() && [v8 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __107__PLDelayedSaveActionsProcessor__processDelayedAssetsForWallpaperFavoriteAlbumRemoval_library_transaction___block_invoke;
    v11[3] = &unk_1E5875BF8;
    id v12 = v9;
    id v13 = v8;
    uint64_t v14 = self;
    id v15 = v10;
    [v12 performTransaction:v11];
  }
}

void __107__PLDelayedSaveActionsProcessor__processDelayedAssetsForWallpaperFavoriteAlbumRemoval_library_transaction___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %d && %K == %d && %K == %d && ANY %K IN %@", @"featuredState", 1, @"type", 6, @"subtype", 682, @"keyAssets", *(void *)(a1 + 40)];
  id v4 = +[PLSuggestion suggestionsMatchingPredicate:v3 sortDescriptors:0 limit:0 inManagedObjectContext:v2];
  if ([v4 count])
  {
    uint64_t v16 = v3;
    uint64_t v17 = a1;
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          [v2 deleteObject:v11];
          id v12 = PLBackendGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            id v13 = [v11 uuid];
            *(_DWORD *)buf = 138543362;
            uint64_t v23 = v13;
            _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "Delayed save actions processor: Deleting suggestion due to favorite album no long being tied to key asset for suggestion %{public}@", buf, 0xCu);
          }
          uint64_t v14 = [v11 uuid];
          [v5 addObject:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v8);
    }

    [*(id *)(v17 + 48) _processDelayedWallpaperSuggestionReload:v5 library:*(void *)(v17 + 32) transaction:*(void *)(v17 + 56)];
    id v4 = v15;
    uint64_t v3 = v16;
  }
}

- (void)_processDelayedAssetsForWallpaperUserAlbumRemoval:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (PLIsAssetsd() && [v8 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __103__PLDelayedSaveActionsProcessor__processDelayedAssetsForWallpaperUserAlbumRemoval_library_transaction___block_invoke;
    v11[3] = &unk_1E5875BF8;
    id v12 = v9;
    id v13 = v8;
    uint64_t v14 = self;
    id v15 = v10;
    [v12 performTransaction:v11];
  }
}

void __103__PLDelayedSaveActionsProcessor__processDelayedAssetsForWallpaperUserAlbumRemoval_library_transaction___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v22 = a1;
  id obj = [*(id *)(a1 + 40) allKeys];
  uint64_t v23 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        id v6 = [*(id *)(v22 + 40) objectForKeyedSubscript:v5];
        uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v39 = v5;
        id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
        id v9 = [v7 predicateWithFormat:@"%K == %d && %K == %d && %K == %d && ANY %K IN %@ && ANY %K IN %@", @"featuredState", 1, @"type", 6, @"subtype", 681, @"suggestionContext", v6, @"keyAssets", v8];

        id v10 = +[PLSuggestion suggestionsMatchingPredicate:v9 sortDescriptors:0 limit:0 inManagedObjectContext:v2];
        if ([v10 count])
        {
          uint64_t v25 = v9;
          id v26 = v6;
          uint64_t v27 = i;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v24 = v10;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v29 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                [v2 deleteObject:v16];
                uint64_t v17 = PLBackendGetLog();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  long long v18 = [v16 uuid];
                  *(_DWORD *)buf = 138543362;
                  id v37 = v18;
                  _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, "Delayed save actions processor: Deleting suggestion due to user album no long being tied to key asset for wallpaper suggestion %{public}@", buf, 0xCu);
                }
                long long v19 = [v16 uuid];
                [v3 addObject:v19];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
            }
            while (v13);
          }

          id v6 = v26;
          uint64_t i = v27;
          id v10 = v24;
          id v9 = v25;
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v23);
  }

  if ([v3 count]) {
    [*(id *)(v22 + 48) _processDelayedWallpaperSuggestionReload:v3 library:*(void *)(v22 + 32) transaction:*(void *)(v22 + 56)];
  }
}

- (void)_processDelayedAssetsForWidgetFavoriteAlbumRemoval:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (PLIsAssetsd() && [v8 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __104__PLDelayedSaveActionsProcessor__processDelayedAssetsForWidgetFavoriteAlbumRemoval_library_transaction___block_invoke;
    v11[3] = &unk_1E5875BF8;
    id v12 = v9;
    id v13 = v8;
    uint64_t v14 = self;
    id v15 = v10;
    [v12 performTransaction:v11];
  }
}

void __104__PLDelayedSaveActionsProcessor__processDelayedAssetsForWidgetFavoriteAlbumRemoval_library_transaction___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %d && %K == %d && %K == %d && ANY %K IN %@", @"featuredState", 1, @"type", 7, @"subtype", 702, @"keyAssets", *(void *)(a1 + 40)];
  id v4 = +[PLSuggestion suggestionsMatchingPredicate:v3 sortDescriptors:0 limit:0 inManagedObjectContext:v2];
  if ([v4 count])
  {
    id v13 = v4;
    uint64_t v14 = v3;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          [v2 deleteObject:v10];
          id v11 = PLBackendGetLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            id v12 = [v10 uuid];
            *(_DWORD *)buf = 138543362;
            long long v20 = v12;
            _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "Delayed save actions processor: Deleting suggestion due to user album tied to suggestion being deleted %{public}@", buf, 0xCu);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v7);
    }

    [*(id *)(a1 + 48) _processDelayedAlbumWidgetTimelineReload:1 library:*(void *)(a1 + 32) transaction:*(void *)(a1 + 56)];
    id v4 = v13;
    id v3 = v14;
  }
}

- (void)_processDelayedAssetsForWidgetUserAlbumRemoval:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (PLIsAssetsd() && [v8 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __100__PLDelayedSaveActionsProcessor__processDelayedAssetsForWidgetUserAlbumRemoval_library_transaction___block_invoke;
    v11[3] = &unk_1E5875BF8;
    id v12 = v8;
    id v13 = v9;
    uint64_t v14 = self;
    id v15 = v10;
    [v13 performTransaction:v11];
  }
}

void __100__PLDelayedSaveActionsProcessor__processDelayedAssetsForWidgetUserAlbumRemoval_library_transaction___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v2 = [*(id *)(a1 + 32) allKeys];
  uint64_t v23 = [v2 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v23)
  {
    char v3 = 0;
    uint64_t v22 = *(void *)v32;
    id obj = v2;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
        uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v38 = v5;
        id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
        id v9 = [v7 predicateWithFormat:@"%K == %d && %K == %d && %K == %d && ANY %K IN %@ && ANY %K IN %@", @"featuredState", 1, @"type", 7, @"subtype", 701, @"suggestionContext", v6, @"keyAssets", v8];

        id v10 = [*(id *)(a1 + 40) managedObjectContext];
        id v11 = +[PLSuggestion suggestionsMatchingPredicate:v9 sortDescriptors:0 limit:0 inManagedObjectContext:v10];

        if ([v11 count])
        {
          uint64_t v25 = v9;
          id v26 = v6;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v24 = v11;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v37 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v12);
                }
                long long v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
                long long v18 = [*(id *)(a1 + 40) managedObjectContext];
                [v18 deleteObject:v17];

                long long v19 = PLBackendGetLog();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  long long v20 = [v17 uuid];
                  *(_DWORD *)buf = 138543362;
                  id v36 = v20;
                  _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_INFO, "Delayed save actions processor: Deleting suggestion due to user album tied to widget suggestion being deleted %{public}@", buf, 0xCu);
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v37 count:16];
            }
            while (v14);
          }

          char v3 = 1;
          id v9 = v25;
          uint64_t v6 = v26;
          id v11 = v24;
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v23);

    if (v3) {
      [*(id *)(a1 + 48) _processDelayedAlbumWidgetTimelineReload:1 library:*(void *)(a1 + 40) transaction:*(void *)(a1 + 56)];
    }
  }
  else
  {
  }
}

- (void)_processDelayedForYouWidgetTimelineReload:(BOOL)a3 library:(id)a4 transaction:(id)a5
{
  BOOL v5 = a3;
  id v6 = a4;
  if (PLIsAssetsd() && v5)
  {
    uint64_t v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Delayed save actions processor: Invalidating ForYou widget timeline with photo analysis", v9, 2u);
    }

    id v8 = [v6 photoAnalysisClient];
    [v8 reloadForYouWidgetTimelineWithReply:0];
  }
}

- (void)_processDelayedAlbumWidgetTimelineReload:(BOOL)a3 library:(id)a4 transaction:(id)a5
{
  BOOL v5 = a3;
  id v6 = a4;
  if (PLIsAssetsd() && v5)
  {
    uint64_t v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Delayed save actions processor: Invalidating Album widget timeline with photo analysis", v9, 2u);
    }

    id v8 = [v6 photoAnalysisClient];
    [v8 reloadAlbumWidgetTimelineWithReply:0];
  }
}

- (void)_processDelayedFeaturedContentUpdateAndWidgetTimelineReload:(BOOL)a3 withPersonUUIDs:(id)a4 shouldReloadWidgetTimeline:(BOOL)a5 library:(id)a6 transaction:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (PLIsAssetsd() && v10)
  {
    uint64_t v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Delayed save actions processor: updating featured content with photo analysis", buf, 2u);
    }

    long long v16 = [v13 photoAnalysisClient];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __156__PLDelayedSaveActionsProcessor__processDelayedFeaturedContentUpdateAndWidgetTimelineReload_withPersonUUIDs_shouldReloadWidgetTimeline_library_transaction___block_invoke;
    v17[3] = &unk_1E586C388;
    BOOL v20 = v9;
    v17[4] = self;
    id v18 = v13;
    id v19 = v14;
    [v16 requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs:v12 reply:v17];
  }
  else
  {
    [(PLDelayedSaveActionsProcessor *)self _processDelayedForYouWidgetTimelineReload:v9 library:v13 transaction:v14];
  }
}

void __156__PLDelayedSaveActionsProcessor__processDelayedFeaturedContentUpdateAndWidgetTimelineReload_withPersonUUIDs_shouldReloadWidgetTimeline_library_transaction___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 && (a2 & 1) == 0)
  {
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error updating featured content with photo analysis: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = a2;
  }
  [*(id *)(a1 + 32) _processDelayedForYouWidgetTimelineReload:v7 library:*(void *)(a1 + 40) transaction:*(void *)(a1 + 48)];
  [*(id *)(a1 + 48) stillAlive];
}

- (void)_processDelayedImportSessionCountsAndDateRangeUpdates:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  if (PLIsAssetsd() && [v11 count])
  {
    id v9 = [v8 libraryServicesManager];
    if (!v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PLDelayedSaveActionsProcessor.m", 238, @"Invalid parameter not satisfying: %@", @"libraryServicesManager" object file lineNumber description];
    }
    [v9 refreshImportSessionCountForImportSessionIDs:v11];
  }
}

- (void)_processDelayedAlbumKeyAssetsUpdates:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (PLIsAssetsd() && [v7 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __90__PLDelayedSaveActionsProcessor__processDelayedAlbumKeyAssetsUpdates_library_transaction___block_invoke;
    v12[3] = &unk_1E5875E18;
    id v13 = v8;
    id v14 = v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __90__PLDelayedSaveActionsProcessor__processDelayedAlbumKeyAssetsUpdates_library_transaction___block_invoke_2;
    v10[3] = &unk_1E5875CE0;
    id v11 = v9;
    [v13 performTransaction:v12 completionHandler:v10];
  }
}

uint64_t __90__PLDelayedSaveActionsProcessor__processDelayedAlbumKeyAssetsUpdates_library_transaction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateKeyAssetsInAlbums:*(void *)(a1 + 40)];
}

uint64_t __90__PLDelayedSaveActionsProcessor__processDelayedAlbumKeyAssetsUpdates_library_transaction___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) completeTransactionScope:@"PLTransactionScopeAlbumCounts"];
  id v2 = *(void **)(a1 + 32);
  return [v2 stillAlive];
}

- (void)_processDelayedAlbumCountsAndDateRangeUpdates:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  if (PLIsAssetsd() && [v11 count])
  {
    id v9 = [v8 libraryServicesManager];
    if (!v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PLDelayedSaveActionsProcessor.m", 201, @"Invalid parameter not satisfying: %@", @"libraryServicesManager" object file lineNumber description];
    }
    [v9 refreshAlbumCountForAlbumIDs:v11];
  }
}

- (void)_processDelayedSearchIndexUpdates:(id)a3 transaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PLDelayedSaveActionsProcessor.m" lineNumber:175 description:@"Must be in assetsd"];
  }
  if ([v7 count])
  {
    id v9 = [(PLLibraryServicesManager *)self->_libraryServicesManager searchIndexManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__PLDelayedSaveActionsProcessor__processDelayedSearchIndexUpdates_transaction___block_invoke;
    v11[3] = &unk_1E5875CE0;
    id v12 = v8;
    [v9 applyUpdates:v7 completion:v11];
  }
}

uint64_t __79__PLDelayedSaveActionsProcessor__processDelayedSearchIndexUpdates_transaction___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) completeTransactionScope:@"PLTransactionScopeSearchIndex"];
  id v2 = *(void **)(a1 + 32);
  return [v2 stillAlive];
}

- (void)_processDelayedMomentChangesWithTransaction:(id)a3
{
  id v5 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PLDelayedSaveActionsProcessor.m" lineNumber:163 description:@"Must be in assetsd"];
  }
  id v6 = [(PLLibraryServicesManager *)self->_libraryServicesManager momentGenerationDataManager];
  id v7 = [v6 generator];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__PLDelayedSaveActionsProcessor__processDelayedMomentChangesWithTransaction___block_invoke;
  v10[3] = &unk_1E5875CE0;
  id v11 = v5;
  id v8 = v5;
  [v7 generateWithIncrementalDataCompletionHandler:v10];
}

uint64_t __77__PLDelayedSaveActionsProcessor__processDelayedMomentChangesWithTransaction___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) completeTransactionScope:@"PLTransactionScopeMomentGeneration"];
  id v2 = *(void **)(a1 + 32);
  return [v2 stillAlive];
}

- (void)_processDelayedCloudFeedAlbumUpdates:(id)a3 assetInserts:(id)a4 assetUpdates:(id)a5 commentInserts:(id)a6 invitationRecordUpdates:(id)a7 deletionEntries:(id)a8 transaction:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"PLDelayedSaveActionsProcessor.m" lineNumber:144 description:@"Must be in assetsd"];
  }
  if ([v16 count]
    || [v17 count]
    || [v18 count]
    || [v19 count]
    || [v20 count]
    || [v21 count])
  {
    uint64_t v23 = [(PLLibraryServicesManager *)self->_libraryServicesManager databaseContext];
    long long v24 = (void *)[v23 newShortLivedLibraryWithName:"delayedSaveActions_cloudFeed_processAlbumUpdates"];

    uint64_t v25 = [[PLCloudFeedEntriesManager alloc] initWithPhotoLibrary:v24];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __163__PLDelayedSaveActionsProcessor__processDelayedCloudFeedAlbumUpdates_assetInserts_assetUpdates_commentInserts_invitationRecordUpdates_deletionEntries_transaction___block_invoke;
    v27[3] = &unk_1E5875CE0;
    id v28 = v22;
    [(PLCloudFeedEntriesManager *)v25 processAlbumUpdates:v16 assetInserts:v17 assetUpdates:v18 commentInserts:v19 invitationRecordUpdates:v20 deletionEntries:v21 completionHandler:v27];
  }
}

uint64_t __163__PLDelayedSaveActionsProcessor__processDelayedCloudFeedAlbumUpdates_assetInserts_assetUpdates_commentInserts_invitationRecordUpdates_deletionEntries_transaction___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) completeTransactionScope:@"PLTransactionScopeCloudFeed"];
  id v2 = *(void **)(a1 + 32);
  return [v2 stillAlive];
}

- (void)processDelayedSaveActionsDetail:(id)a3 withPhotoLibrary:(id)a4 transaction:(id)a5
{
  id v45 = a3;
  id v8 = a5;
  id v9 = a4;
  if (PLPlatformCloudFeedSupported())
  {
    uint64_t v10 = [v45 cloudFeedAlbumUpdates];
    id v11 = [v45 cloudFeedAssetInserts];
    id v12 = [v45 cloudFeedAssetUpdates];
    id v13 = [v45 cloudFeedCommentInserts];
    id v14 = [v45 cloudFeedInvitationRecordUpdates];
    uint64_t v15 = [v45 cloudFeedDeletionEntries];
    [(PLDelayedSaveActionsProcessor *)self _processDelayedCloudFeedAlbumUpdates:v10 assetInserts:v11 assetUpdates:v12 commentInserts:v13 invitationRecordUpdates:v14 deletionEntries:v15 transaction:v8];
  }
  if ([v45 shouldHandleMoments]) {
    [(PLDelayedSaveActionsProcessor *)self _processDelayedMomentChangesWithTransaction:v8];
  }
  if (PLPlatformSearchSupported())
  {
    id v16 = [v45 searchIndexUpdates];
    [(PLDelayedSaveActionsProcessor *)self _processDelayedSearchIndexUpdates:v16 transaction:v8];
  }
  id v17 = [v45 albumCountsAndDateRangeUpdates];
  [(PLDelayedSaveActionsProcessor *)self _processDelayedAlbumCountsAndDateRangeUpdates:v17 library:v9 transaction:v8];

  id v18 = [v45 albumKeyAssetsUpdates];
  [(PLDelayedSaveActionsProcessor *)self _processDelayedAlbumKeyAssetsUpdates:v18 library:v9 transaction:v8];

  id v19 = [v45 importSessionCountsAndDateRangeUpdates];
  [(PLDelayedSaveActionsProcessor *)self _processDelayedImportSessionCountsAndDateRangeUpdates:v19 library:v9 transaction:v8];

  id v20 = [v45 widgetTimelineReloadTypesNeeded];
  uint64_t v21 = [v20 containsObject:&unk_1EEBEF048];

  uint64_t v22 = [v45 shouldUpdateFeaturedContent];
  uint64_t v23 = [v45 personsToUpdateForFeaturedContent];
  [(PLDelayedSaveActionsProcessor *)self _processDelayedFeaturedContentUpdateAndWidgetTimelineReload:v22 withPersonUUIDs:v23 shouldReloadWidgetTimeline:v21 library:v9 transaction:v8];

  long long v24 = [v45 assetsForWidgetUserAlbumRemoval];
  [(PLDelayedSaveActionsProcessor *)self _processDelayedAssetsForWidgetUserAlbumRemoval:v24 library:v9 transaction:v8];

  uint64_t v25 = [v45 assetsForWidgetFavoriteAlbumRemoval];
  [(PLDelayedSaveActionsProcessor *)self _processDelayedAssetsForWidgetFavoriteAlbumRemoval:v25 library:v9 transaction:v8];

  id v26 = [v45 widgetTimelineReloadTypesNeeded];
  uint64_t v27 = [v26 containsObject:&unk_1EEBEF060];

  [(PLDelayedSaveActionsProcessor *)self _processDelayedAlbumWidgetTimelineReload:v27 library:v9 transaction:v8];
  id v28 = [v45 assetsForWallpaperUserAlbumRemoval];
  [(PLDelayedSaveActionsProcessor *)self _processDelayedAssetsForWallpaperUserAlbumRemoval:v28 library:v9 transaction:v8];

  long long v29 = [v45 assetsForWallpaperFavoriteAlbumRemoval];
  [(PLDelayedSaveActionsProcessor *)self _processDelayedAssetsForWallpaperFavoriteAlbumRemoval:v29 library:v9 transaction:v8];

  long long v30 = [v45 wallpaperSuggestionReloadUUIDs];
  [(PLDelayedSaveActionsProcessor *)self _processDelayedWallpaperSuggestionReload:v30 library:v9 transaction:v8];

  long long v31 = [v45 assetsForDuetDelete];
  [(PLDelayedSaveActionsProcessor *)self _processDelayedAssetsForDuetDelete:v31 transaction:v8];

  long long v32 = [v45 memoriesForDuetDelete];
  [(PLDelayedSaveActionsProcessor *)self _processDelayedMemoriesForDuetDelete:v32 transaction:v8];

  long long v33 = [v45 memoriesForAssetUpdate];
  [(PLDelayedSaveActionsProcessor *)self _processDelayedMemoriesAssetUpdate:v33 library:v9 transaction:v8];

  long long v34 = [v45 libraryScopeParticipantsForUpdate];
  [(PLDelayedSaveActionsProcessor *)self _processDelayedLibraryScopeParticipantsUpdate:v34 library:v9 transaction:v8];

  -[PLDelayedSaveActionsProcessor _processDelayedLibraryScopeRulesUpdate:library:transaction:](self, "_processDelayedLibraryScopeRulesUpdate:library:transaction:", [v45 libraryScopeRulesUpdated], v9, v8);
  long long v35 = [v45 socialGroupNodeIDsNeedingDeduplication];
  BOOL v36 = [v35 count] != 0;

  id v37 = [v45 memberIDsOfSocialGroupsNeedingDeduplication];
  [(PLDelayedSaveActionsProcessor *)self _processMembersOfSocialGroupsNeedingDeduplication:v37 pendingSocialGroupIDsNeedingDeduplication:v36 library:v9 transaction:v8];

  uint64_t v38 = [v45 socialGroupNodeIDsNeedingDeduplication];
  [(PLDelayedSaveActionsProcessor *)self _processSocialGroupsNeedingDeduplication:v38 library:v9 transaction:v8];

  uint64_t v39 = [v45 assetIDsNeedingAssetPersonEdgeUpdates];
  [(PLDelayedSaveActionsProcessor *)self _processAssetsNeedingAssetPersonEdgeUpdates:v39 library:v9 transaction:v8];

  uint64_t v40 = [v45 memberIDsOfSocialGroupsNeedingContainmentUpdates];
  BOOL v41 = [v40 count] != 0;

  long long v42 = [v45 assetIDsByPersonUUIDNeedingContainmentUpdates];
  long long v43 = [v45 assetIDsNeedingContainmentUpdates];
  [(PLDelayedSaveActionsProcessor *)self _processAssetIDsByPersonUUIDNeedingContainmentUpdates:v42 assetIDsNeedingContainmentUpdates:v43 pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates:v41 library:v9 transaction:v8];

  id v44 = [v45 memberIDsOfSocialGroupsNeedingContainmentUpdates];
  [(PLDelayedSaveActionsProcessor *)self _processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs:v44 library:v9 transaction:v8];

  [v8 completeTransactionScope:@"PLTransactionScopeFileIngestion"];
}

- (void)processDelayedMomentGeneratorSaveActionsFromDetail:(id)a3
{
  libraryServicesManager = self->_libraryServicesManager;
  id v4 = a3;
  id v5 = [(PLLibraryServicesManager *)libraryServicesManager momentGenerationDataManager];
  id v11 = [v5 generator];

  id v6 = [v4 momentInsertsAndUpdates];
  id v7 = [v4 momentDeletes];
  id v8 = [v4 updatedAssetIDsForHighlights];
  id v9 = [v4 updatedMomentIDsForHighlights];
  uint64_t v10 = [v4 sharedAssetContainerIncrementalChangesByAssetID];

  [v11 saveChangesForAssetInsertsAndUpdates:v6 assetDeletes:v7 assetUpdatesForHighlights:v8 momentUpdatesForHighlights:v9 sharedAssetContainerIncrementalChangesByAssetID:v10];
}

- (void)processDelayedDeletionsFromChangeHubEvent:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v13 = a3;
  id v9 = a5;
  id v10 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PLDelayedSaveActionsProcessor.m" lineNumber:72 description:@"Must be in assetsd"];
  }
  id v11 = +[PLDelayedFiledSystemDeletions deletionsFromChangeHubEvent:v13];
  [v11 deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary:v10];

  [v9 stillAlive];
}

- (PLDelayedSaveActionsProcessor)initWithLibraryServicesManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLDelayedSaveActionsProcessor;
  id v6 = [(PLDelayedSaveActionsProcessor *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryServicesManager, a3);
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.assetsd.coreduetcallback", v9);
    coreDuetCallback = v7->_coreDuetCallback;
    v7->_coreDuetCallback = (OS_dispatch_queue *)v10;

    id v12 = v7;
  }

  return v7;
}

@end