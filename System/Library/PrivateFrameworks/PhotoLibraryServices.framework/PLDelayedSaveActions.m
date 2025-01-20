@interface PLDelayedSaveActions
+ (void)_addHighlightRelationshipChangesFromChangedValues:(id)a3 onAsset:(id)a4 intoChange:(id)a5 forRelationshipNamed:(id)a6;
+ (void)_checkForHighlightChangesOnToManyRelationshipNamed:(id)a3 andAddIntoChange:(id)a4 givenOldValue:(id)a5 andNewValue:(id)a6;
+ (void)_checkForHighlightChangesOnToOneRelationshipNamed:(id)a3 andAddIntoChange:(id)a4 givenOldValue:(id)a5 andNewValue:(id)a6;
- (PLClientServerTransaction)clientTransaction;
- (PLDelayedSaveActions)initWithClientTransaction:(id)a3;
- (id)_existingSharedAssetChangeContainerForAsset:(id)a3;
- (id)popDelayedSaveActionsDetail;
- (void)_popAlbumCountChangesIntoDetail:(id)a3;
- (void)_popAlbumKeyAssetsChangesIntoDetail:(id)a3;
- (void)_popAssetIDsByPersonUUIDNeedingSocialGroupContainmentUpdateIntoDetail:(id)a3;
- (void)_popAssetIDsNeedingAssetPersonEdgeUpdateIntoDetail:(id)a3;
- (void)_popAssetIDsNeedingSocialGroupContainmentUpdateIntoDetail:(id)a3;
- (void)_popAssetsForFilesystemPersistencyChangesIntoDetail:(id)a3;
- (void)_popCloudFeedChangesIntoDetail:(id)a3;
- (void)_popDelayedAlbumCountsAndDateRangeUpdates:(id *)a3;
- (void)_popDelayedAlbumKeyAssetsUpdates:(id *)a3;
- (void)_popDelayedAssetsForAnalysis:(id *)a3;
- (void)_popDelayedAssetsForFilesystemPersistencyUpdates:(id *)a3;
- (void)_popDelayedCloudFeedAlbumUpdates:(id *)a3 assetInserts:(id *)a4 assetUpdates:(id *)a5 commentInserts:(id *)a6 invitationRecordUpdates:(id *)a7 deletionEntries:(id *)a8;
- (void)_popDelayedImportSessionCountsAndDateRangeUpdates:(id *)a3;
- (void)_popDelayedMomentInsertsAndUpdates:(id *)a3 deletes:(id *)a4 updatedAssetIDsForHighlights:(id *)a5 updatedMomentIDsForHighlights:(id *)a6 sharedAssetContainerIncrementalChanges:(id *)a7;
- (void)_popDelayedSearchIndexUpdates:(id *)a3;
- (void)_popDuetDeletedAssetsIntoDetail:(id)a3;
- (void)_popDuetDeletedMemoriesIntoDetail:(id)a3;
- (void)_popFeaturedContentUpdateNeededForPerson:(id)a3;
- (void)_popImportSessionCountChangesIntoDetail:(id)a3;
- (void)_popLibraryScopeParticipantsUpdateIntoDetail:(id)a3;
- (void)_popLibraryScopeRulesUpdatedIntoDetail:(id)a3;
- (void)_popMemberIDsOfGroupNeedingContainmentUpdateIntoDetail:(id)a3;
- (void)_popMembersOfGroupsNeedingDeduplicationIntoDetail:(id)a3;
- (void)_popMemoryAssetUpdateIntoDetail:(id)a3;
- (void)_popMomentChangesIntoDetail:(id)a3;
- (void)_popSearchIndexChangesIntoDetail:(id)a3;
- (void)_popSocialGroupNodeIDsNeedingDeduplicationIntoDetail:(id)a3;
- (void)_popWallpaperFavoriteAlbumAssetRemovalReloadNeeded:(id)a3;
- (void)_popWallpaperSuggestionReloadIntoDetail:(id)a3;
- (void)_popWallpaperUserAlbumAssetRemovalReloadNeeded:(id)a3;
- (void)_popWidgetFavoriteAlbumAssetRemovalReloadNeeded:(id)a3;
- (void)_popWidgetTimelineReloadNeeded:(id)a3;
- (void)_popWidgetUserAlbumAssetRemovalReloadNeeded:(id)a3;
- (void)_recordAlbumUUIDForSearchIndexUpdate:(id)a3 isInsert:(BOOL)a4;
- (void)_recordAssetForSearchIndexUpdate:(id)a3;
- (void)_recordAssetUUIDForSearchIndexUpdate:(id)a3 isInsert:(BOOL)a4;
- (void)_recordDelayedAlbumCountsAndDateRangeUpdate:(id)a3;
- (void)_recordDelayedAlbumKeyAssetsUpdate:(id)a3;
- (void)_recordDelayedCloudFeedAlbumUpdate:(id)a3;
- (void)_recordDelayedCloudFeedAssetInsert:(id)a3;
- (void)_recordDelayedCloudFeedAssetUpdate:(id)a3;
- (void)_recordDelayedCloudFeedCommentInsert:(id)a3;
- (void)_recordDelayedCloudFeedDeletionEntries:(id)a3;
- (void)_recordDelayedCloudFeedInvitationRecordUpdate:(id)a3;
- (void)_recordDelayedHighlightMomentUpdates:(id)a3;
- (void)_recordDelayedImportSessionCountsAndDateRangeUpdate:(id)a3;
- (void)_recordDelayedMomentAssetDeletionsDictionary:(id)a3 forKey:(id)a4;
- (void)_recordDelayedMomentAssetUpdates:(id)a3;
- (void)_recordDetectedFaceUUIDInsertForSearchIndexUpdate:(id)a3;
- (void)_recordHighlightUUIDForSearchIndexUpdate:(id)a3 isInsert:(BOOL)a4;
- (void)_recordManagedObjectUUID:(id)a3 forSearchIndexUpdateKey:(id)a4;
- (void)_recordMemoryUUIDForSearchIndexUpdate:(id)a3 isInsert:(BOOL)a4;
- (void)_recordPersonUUIDInsertForSearchIndexUpdate:(id)a3;
- (void)_recordPersonUUIDRenameForSearchIndexUpdate:(id)a3;
- (void)_recordSharedAssetIncrementalChange:(id)a3 forAsset:(id)a4;
- (void)persistDelayedActionsScope:(id)a3;
- (void)recordAdditionalAssetAttributesForMomentUpdate:(id)a3;
- (void)recordAdditionalAssetAttributesForSearchIndexUpdate:(id)a3;
- (void)recordAlbumForCloudFeedUpdate:(id)a3;
- (void)recordAlbumForCountsAndDateRangeUpdate:(id)a3;
- (void)recordAlbumForKeyAssetsUpdate:(id)a3;
- (void)recordAlbumForSearchIndexUpdate:(id)a3;
- (void)recordAssetDescriptionForSearchIndexUpdate:(id)a3;
- (void)recordAssetForAlbumCountsDateRangeAndKeyAssetsUpdate:(id)a3;
- (void)recordAssetForAnalysis:(id)a3 workerFlags:(int)a4 workerType:(signed __int16)a5;
- (void)recordAssetForCloudFeedUpdate:(id)a3;
- (void)recordAssetForDuetDelete:(id)a3;
- (void)recordAssetForFileSystemPersistencyUpdate:(id)a3;
- (void)recordAssetForImportSessionCountsAndDateRangeUpdate:(id)a3;
- (void)recordAssetForMomentUpdate:(id)a3;
- (void)recordAssetForSearchIndexUpdate:(id)a3;
- (void)recordAssetID:(id)a3 forWallpaperUserAlbumRemoval:(id)a4;
- (void)recordAssetID:(id)a3 forWidgetUserAlbumRemoval:(id)a4;
- (void)recordAssetIDForWallpaperFavoriteAlbumRemoval:(id)a3;
- (void)recordAssetIDForWidgetFavoriteAlbumRemoval:(id)a3;
- (void)recordAssetPersonEdgeUpdateNeededForAsset:(id)a3;
- (void)recordCloudFeedAssetsEntryForAssetUpdate:(id)a3;
- (void)recordCloudFeedCommentsEntryForCommentUpdate:(id)a3;
- (void)recordCommentForCloudFeedUpdate:(id)a3;
- (void)recordDeduplicationNeededForGroupsContainingMember:(id)a3;
- (void)recordDeduplicationNeededForNewGroupNode:(id)a3;
- (void)recordDetectedFaceForSearchIndexUpdate:(id)a3;
- (void)recordFeaturedContentUpdateNeededForPersonUUID:(id)a3;
- (void)recordHighlightForSearchIndexUpdate:(id)a3;
- (void)recordImportSessionCountsAndDateRangeUpdate:(id)a3;
- (void)recordInvitationRecordForCloudFeedUpdate:(id)a3;
- (void)recordLibraryScopeParticipantsUpdateForLibraryScope:(id)a3;
- (void)recordLibraryScopeRulesUpdated;
- (void)recordMediaAnalysisAssetAttributesForSearchIndexUpdate:(id)a3;
- (void)recordMemoryAssetsUpdate:(id)a3;
- (void)recordMemoryForDuetDelete:(id)a3;
- (void)recordMemoryForSearchIndexUpdate:(id)a3;
- (void)recordMomentForHighlightUpdate:(id)a3;
- (void)recordPersonForSearchIndexUpdate:(id)a3;
- (void)recordSocialGroupContainmentUpdateNeededForAsset:(id)a3;
- (void)recordSocialGroupContainmentUpdateNeededForPerson:(id)a3;
- (void)recordSocialGroupContainmentUpdateNeededForPerson:(id)a3 andAsset:(id)a4;
- (void)recordWallpaperSuggestionReloadForUUID:(id)a3;
- (void)recordWidgetTimelineReloadNeededForType:(int64_t)a3;
@end

@implementation PLDelayedSaveActions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTransaction, 0);
  objc_storeStrong((id *)&self->_delayedAssetPersonEdgeUpdatesNeededForAssets, 0);
  objc_storeStrong((id *)&self->_delayedDeduplicationNeededForSocialGroupsContainingMembers, 0);
  objc_storeStrong((id *)&self->_delayedSocialGroupNodesNeedingDeduplication, 0);
  objc_storeStrong((id *)&self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates, 0);
  objc_storeStrong((id *)&self->_delayedAssetsNeedingSocialGroupContainmentUpdates, 0);
  objc_storeStrong((id *)&self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates, 0);
  objc_storeStrong((id *)&self->_delayedLibraryScopeParticipantsUpdateUUIDs, 0);
  objc_storeStrong((id *)&self->_delayedWallpaperSuggestionUUIDs, 0);
  objc_storeStrong((id *)&self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded, 0);
  objc_storeStrong((id *)&self->_delayedWallpaperUserAlbumAssetRemovalNeeded, 0);
  objc_storeStrong((id *)&self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded, 0);
  objc_storeStrong((id *)&self->_delayedWidgetUserAlbumAssetRemovalNeeded, 0);
  objc_storeStrong((id *)&self->_delayedFeaturedContentUpdateNeededForPerson, 0);
  objc_storeStrong((id *)&self->_delayedWidgetTimelineReloadTypesNeeded, 0);
  objc_storeStrong((id *)&self->_delayedMemoriesAssetUpdate, 0);
  objc_storeStrong((id *)&self->_delayedMemoriesForDuetDelete, 0);
  objc_storeStrong((id *)&self->_delayedAssetsForDuetDelete, 0);
  objc_storeStrong((id *)&self->_delayedWorkerTypesToAnalyzeByAssetUUID, 0);
  objc_storeStrong((id *)&self->_delayedImportSessionCountsAndDateRangeUpdates, 0);
  objc_storeStrong((id *)&self->_delayedAlbumKeyAssetsUpdates, 0);
  objc_storeStrong((id *)&self->_delayedAlbumCountsAndDateRangeUpdates, 0);
  objc_storeStrong((id *)&self->_assetBaseSearchIndexPredicate, 0);
  objc_storeStrong((id *)&self->_delayedSearchIndexUpdateUUIDs, 0);
  objc_storeStrong((id *)&self->_delayedAssetsForFileSystemPersistency, 0);
  objc_storeStrong((id *)&self->_delayedCloudFeedInvitationRecordUpdates, 0);
  objc_storeStrong((id *)&self->_delayedCloudFeedCommentInserts, 0);
  objc_storeStrong((id *)&self->_delayedCloudFeedAssetUpdates, 0);
  objc_storeStrong((id *)&self->_delayedCloudFeedAssetInserts, 0);
  objc_storeStrong((id *)&self->_delayedCloudFeedAlbumUpdates, 0);
  objc_storeStrong((id *)&self->_delayedCloudFeedDeletionEntries, 0);
  objc_storeStrong((id *)&self->_delayedHighlightMomentUpdates, 0);
  objc_storeStrong((id *)&self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID, 0);
  objc_storeStrong((id *)&self->_delayedMomentAssetUpdates, 0);
  objc_storeStrong((id *)&self->_delayedHighlightAssetUpdates, 0);
  objc_storeStrong((id *)&self->_delayedMomentAssetDeletions, 0);
}

- (PLClientServerTransaction)clientTransaction
{
  return self->_clientTransaction;
}

- (void)_popAssetIDsNeedingAssetPersonEdgeUpdateIntoDetail:(id)a3
{
  delayedAssetPersonEdgeUpdatesNeededForAssets = self->_delayedAssetPersonEdgeUpdatesNeededForAssets;
  if (delayedAssetPersonEdgeUpdatesNeededForAssets)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = a3;
    v7 = [(NSMutableSet *)delayedAssetPersonEdgeUpdatesNeededForAssets valueForKey:@"objectID"];
    v8 = [v5 setWithSet:v7];
    [v6 setAssetIDsNeedingAssetPersonEdgeUpdates:v8];

    v9 = self->_delayedAssetPersonEdgeUpdatesNeededForAssets;
  }
  else
  {
    v9 = 0;
  }
  [(NSMutableSet *)v9 removeAllObjects];
}

- (void)recordAssetPersonEdgeUpdateNeededForAsset:(id)a3
{
  id v4 = a3;
  delayedAssetPersonEdgeUpdatesNeededForAssets = self->_delayedAssetPersonEdgeUpdatesNeededForAssets;
  id v8 = v4;
  if (!delayedAssetPersonEdgeUpdatesNeededForAssets)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    v7 = self->_delayedAssetPersonEdgeUpdatesNeededForAssets;
    self->_delayedAssetPersonEdgeUpdatesNeededForAssets = v6;

    id v4 = v8;
    delayedAssetPersonEdgeUpdatesNeededForAssets = self->_delayedAssetPersonEdgeUpdatesNeededForAssets;
  }
  [(NSMutableSet *)delayedAssetPersonEdgeUpdatesNeededForAssets addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeSocialGroupAssetPersonEdges"];
}

- (void)_popMembersOfGroupsNeedingDeduplicationIntoDetail:(id)a3
{
  delayedDeduplicationNeededForSocialGroupsContainingMembers = self->_delayedDeduplicationNeededForSocialGroupsContainingMembers;
  if (delayedDeduplicationNeededForSocialGroupsContainingMembers)
  {
    id v5 = a3;
    id v6 = [(NSMutableSet *)delayedDeduplicationNeededForSocialGroupsContainingMembers valueForKey:@"objectID"];
    v7 = (void *)[v6 copy];
    [v5 setMemberIDsOfSocialGroupsNeedingDeduplication:v7];

    id v8 = self->_delayedDeduplicationNeededForSocialGroupsContainingMembers;
  }
  else
  {
    id v8 = 0;
  }
  [(NSMutableSet *)v8 removeAllObjects];
}

- (void)recordDeduplicationNeededForGroupsContainingMember:(id)a3
{
  id v4 = a3;
  delayedDeduplicationNeededForSocialGroupsContainingMembers = self->_delayedDeduplicationNeededForSocialGroupsContainingMembers;
  id v8 = v4;
  if (!delayedDeduplicationNeededForSocialGroupsContainingMembers)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    v7 = self->_delayedDeduplicationNeededForSocialGroupsContainingMembers;
    self->_delayedDeduplicationNeededForSocialGroupsContainingMembers = v6;

    id v4 = v8;
    delayedDeduplicationNeededForSocialGroupsContainingMembers = self->_delayedDeduplicationNeededForSocialGroupsContainingMembers;
  }
  [(NSMutableSet *)delayedDeduplicationNeededForSocialGroupsContainingMembers addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeSocialGroupDeduplication"];
}

- (void)_popSocialGroupNodeIDsNeedingDeduplicationIntoDetail:(id)a3
{
  delayedSocialGroupNodesNeedingDeduplication = self->_delayedSocialGroupNodesNeedingDeduplication;
  if (delayedSocialGroupNodesNeedingDeduplication)
  {
    id v5 = a3;
    id v6 = [(NSMutableSet *)delayedSocialGroupNodesNeedingDeduplication valueForKey:@"objectID"];
    v7 = (void *)[v6 copy];
    [v5 setSocialGroupNodeIDsNeedingDeduplication:v7];

    id v8 = self->_delayedSocialGroupNodesNeedingDeduplication;
  }
  else
  {
    id v8 = 0;
  }
  [(NSMutableSet *)v8 removeAllObjects];
}

- (void)recordDeduplicationNeededForNewGroupNode:(id)a3
{
  id v4 = a3;
  delayedSocialGroupNodesNeedingDeduplication = self->_delayedSocialGroupNodesNeedingDeduplication;
  id v8 = v4;
  if (!delayedSocialGroupNodesNeedingDeduplication)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    v7 = self->_delayedSocialGroupNodesNeedingDeduplication;
    self->_delayedSocialGroupNodesNeedingDeduplication = v6;

    id v4 = v8;
    delayedSocialGroupNodesNeedingDeduplication = self->_delayedSocialGroupNodesNeedingDeduplication;
  }
  [(NSMutableSet *)delayedSocialGroupNodesNeedingDeduplication addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeSocialGroupDeduplication"];
}

- (void)_popAssetIDsByPersonUUIDNeedingSocialGroupContainmentUpdateIntoDetail:(id)a3
{
  if (self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA60];
    id v5 = a3;
    id v6 = [v4 dictionary];
    delayedAssetsByPersonUUIDNeedingContainmentUpdates = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94__PLDelayedSaveActions__popAssetIDsByPersonUUIDNeedingSocialGroupContainmentUpdateIntoDetail___block_invoke;
    v11[3] = &unk_1E5873068;
    id v12 = v6;
    id v8 = v6;
    [(NSMutableDictionary *)delayedAssetsByPersonUUIDNeedingContainmentUpdates enumerateKeysAndObjectsUsingBlock:v11];
    v9 = (void *)[v8 copy];
    [v5 setAssetIDsByPersonUUIDNeedingContainmentUpdates:v9];

    v10 = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
  }
  else
  {
    v10 = 0;
  }
  [(NSMutableDictionary *)v10 removeAllObjects];
}

void __94__PLDelayedSaveActions__popAssetIDsByPersonUUIDNeedingSocialGroupContainmentUpdateIntoDetail___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = [a3 valueForKey:@"objectID"];
  id v6 = (void *)[v7 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (void)recordSocialGroupContainmentUpdateNeededForPerson:(id)a3 andAsset:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  delayedAssetsByPersonUUIDNeedingContainmentUpdates = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
  if (!delayedAssetsByPersonUUIDNeedingContainmentUpdates)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    v9 = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
    self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates = v8;

    delayedAssetsByPersonUUIDNeedingContainmentUpdates = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
  }
  v10 = [v18 personUUID];
  v11 = [(NSMutableDictionary *)delayedAssetsByPersonUUIDNeedingContainmentUpdates objectForKeyedSubscript:v10];

  if (!v11)
  {
    id v12 = [MEMORY[0x1E4F1CA80] set];
    v13 = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
    v14 = [v18 personUUID];
    [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];
  }
  v15 = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
  v16 = [v18 personUUID];
  v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v16];
  [v17 addObject:v6];

  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeSocialGroupAssetContainment"];
}

- (void)_popAssetIDsNeedingSocialGroupContainmentUpdateIntoDetail:(id)a3
{
  delayedAssetsNeedingSocialGroupContainmentUpdates = self->_delayedAssetsNeedingSocialGroupContainmentUpdates;
  if (delayedAssetsNeedingSocialGroupContainmentUpdates)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = a3;
    id v7 = [(NSMutableSet *)delayedAssetsNeedingSocialGroupContainmentUpdates valueForKey:@"objectID"];
    id v8 = [v5 setWithSet:v7];
    [v6 setAssetIDsNeedingContainmentUpdates:v8];

    v9 = self->_delayedAssetsNeedingSocialGroupContainmentUpdates;
  }
  else
  {
    v9 = 0;
  }
  [(NSMutableSet *)v9 removeAllObjects];
}

- (void)recordSocialGroupContainmentUpdateNeededForAsset:(id)a3
{
  id v4 = a3;
  delayedAssetsNeedingSocialGroupContainmentUpdates = self->_delayedAssetsNeedingSocialGroupContainmentUpdates;
  id v8 = v4;
  if (!delayedAssetsNeedingSocialGroupContainmentUpdates)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    id v7 = self->_delayedAssetsNeedingSocialGroupContainmentUpdates;
    self->_delayedAssetsNeedingSocialGroupContainmentUpdates = v6;

    id v4 = v8;
    delayedAssetsNeedingSocialGroupContainmentUpdates = self->_delayedAssetsNeedingSocialGroupContainmentUpdates;
  }
  [(NSMutableSet *)delayedAssetsNeedingSocialGroupContainmentUpdates addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeSocialGroupAssetContainment"];
}

- (void)_popMemberIDsOfGroupNeedingContainmentUpdateIntoDetail:(id)a3
{
  delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates = self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates;
  if (delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = a3;
    id v7 = [(NSMutableSet *)delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates valueForKey:@"objectID"];
    id v8 = [v5 setWithSet:v7];
    [v6 setMemberIDsOfSocialGroupsNeedingContainmentUpdates:v8];

    v9 = self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates;
  }
  else
  {
    v9 = 0;
  }
  [(NSMutableSet *)v9 removeAllObjects];
}

- (void)recordSocialGroupContainmentUpdateNeededForPerson:(id)a3
{
  id v4 = a3;
  delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates = self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates;
  id v8 = v4;
  if (!delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    id v7 = self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates;
    self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates = v6;

    id v4 = v8;
    delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates = self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates;
  }
  [(NSMutableSet *)delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates addObject:v4];
}

- (void)_popLibraryScopeRulesUpdatedIntoDetail:(id)a3
{
  if (self->_delayedLibraryScopeRulesUpdated)
  {
    [a3 setLibraryScopeRulesUpdated:1];
    self->_delayedLibraryScopeRulesUpdated = 0;
  }
}

- (void)recordLibraryScopeRulesUpdated
{
  self->_delayedLibraryScopeRulesUpdated = 1;
}

- (void)_popLibraryScopeParticipantsUpdateIntoDetail:(id)a3
{
  id v5 = a3;
  if ([(NSMutableSet *)self->_delayedLibraryScopeParticipantsUpdateUUIDs count])
  {
    id v4 = (void *)[(NSMutableSet *)self->_delayedLibraryScopeParticipantsUpdateUUIDs copy];
    [v5 setLibraryScopeParticipantsForUpdate:v4];

    [(NSMutableSet *)self->_delayedLibraryScopeParticipantsUpdateUUIDs removeAllObjects];
  }
}

- (void)recordLibraryScopeParticipantsUpdateForLibraryScope:(id)a3
{
  id v4 = [a3 uuid];
  if (v4)
  {
    delayedLibraryScopeParticipantsUpdateUUIDs = self->_delayedLibraryScopeParticipantsUpdateUUIDs;
    id v8 = v4;
    if (!delayedLibraryScopeParticipantsUpdateUUIDs)
    {
      id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v7 = self->_delayedLibraryScopeParticipantsUpdateUUIDs;
      self->_delayedLibraryScopeParticipantsUpdateUUIDs = v6;

      delayedLibraryScopeParticipantsUpdateUUIDs = self->_delayedLibraryScopeParticipantsUpdateUUIDs;
    }
    [(NSMutableSet *)delayedLibraryScopeParticipantsUpdateUUIDs addObject:v8];
    id v4 = v8;
  }
}

- (void)_popMemoryAssetUpdateIntoDetail:(id)a3
{
  id v5 = a3;
  if ([(NSMutableSet *)self->_delayedMemoriesAssetUpdate count])
  {
    id v4 = (void *)[(NSMutableSet *)self->_delayedMemoriesAssetUpdate copy];
    [v5 setMemoriesForAssetUpdate:v4];

    [(NSMutableSet *)self->_delayedMemoriesAssetUpdate removeAllObjects];
  }
}

- (void)recordMemoryAssetsUpdate:(id)a3
{
  id v4 = a3;
  delayedMemoriesAssetUpdate = self->_delayedMemoriesAssetUpdate;
  id v9 = v4;
  if (!delayedMemoriesAssetUpdate)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = self->_delayedMemoriesAssetUpdate;
    self->_delayedMemoriesAssetUpdate = v6;

    id v4 = v9;
    delayedMemoriesAssetUpdate = self->_delayedMemoriesAssetUpdate;
  }
  id v8 = [v4 uuid];
  [(NSMutableSet *)delayedMemoriesAssetUpdate addObject:v8];
}

- (void)_popFeaturedContentUpdateNeededForPerson:(id)a3
{
  id v5 = a3;
  [v5 setPersonsToUpdateForFeaturedContent:self->_delayedFeaturedContentUpdateNeededForPerson];
  delayedFeaturedContentUpdateNeededForPerson = self->_delayedFeaturedContentUpdateNeededForPerson;
  self->_delayedFeaturedContentUpdateNeededForPerson = 0;

  if (self->_delayedFeaturedContentUpdateNeeded)
  {
    [v5 setShouldUpdateFeaturedContent:1];
    self->_delayedFeaturedContentUpdateNeeded = 0;
  }
}

- (void)recordFeaturedContentUpdateNeededForPersonUUID:(id)a3
{
  id v4 = a3;
  delayedFeaturedContentUpdateNeededForPerson = self->_delayedFeaturedContentUpdateNeededForPerson;
  id v8 = v4;
  if (v4)
  {
    if (!delayedFeaturedContentUpdateNeededForPerson)
    {
      id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v7 = self->_delayedFeaturedContentUpdateNeededForPerson;
      self->_delayedFeaturedContentUpdateNeededForPerson = v6;

      delayedFeaturedContentUpdateNeededForPerson = self->_delayedFeaturedContentUpdateNeededForPerson;
    }
    [(NSMutableSet *)delayedFeaturedContentUpdateNeededForPerson addObject:v8];
  }
  else
  {
    self->_delayedFeaturedContentUpdateNeededForPerson = 0;
  }
  self->_delayedFeaturedContentUpdateNeeded = 1;
}

- (void)_popWallpaperSuggestionReloadIntoDetail:(id)a3
{
  id v5 = a3;
  if ([(NSMutableSet *)self->_delayedWallpaperSuggestionUUIDs count])
  {
    id v4 = (void *)[(NSMutableSet *)self->_delayedWallpaperSuggestionUUIDs copy];
    [v5 setWallpaperSuggestionReloadUUIDs:v4];

    [(NSMutableSet *)self->_delayedWallpaperSuggestionUUIDs removeAllObjects];
  }
}

- (void)recordWallpaperSuggestionReloadForUUID:(id)a3
{
  id v4 = a3;
  delayedWallpaperSuggestionUUIDs = self->_delayedWallpaperSuggestionUUIDs;
  id v8 = v4;
  if (!delayedWallpaperSuggestionUUIDs)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = self->_delayedWallpaperSuggestionUUIDs;
    self->_delayedWallpaperSuggestionUUIDs = v6;

    id v4 = v8;
    delayedWallpaperSuggestionUUIDs = self->_delayedWallpaperSuggestionUUIDs;
  }
  [(NSMutableSet *)delayedWallpaperSuggestionUUIDs addObject:v4];
}

- (void)_popWallpaperFavoriteAlbumAssetRemovalReloadNeeded:(id)a3
{
  delayedWallpaperFavoriteAlbumAssetRemovalNeeded = self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded;
  if (delayedWallpaperFavoriteAlbumAssetRemovalNeeded)
  {
    id v5 = a3;
    id v6 = (void *)[(NSMutableSet *)delayedWallpaperFavoriteAlbumAssetRemovalNeeded copy];
    [v5 setAssetsForWallpaperFavoriteAlbumRemoval:v6];

    id v7 = self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded;
    [(NSMutableSet *)v7 removeAllObjects];
  }
}

- (void)recordAssetIDForWallpaperFavoriteAlbumRemoval:(id)a3
{
  id v4 = a3;
  delayedWallpaperFavoriteAlbumAssetRemovalNeeded = self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded;
  id v8 = v4;
  if (!delayedWallpaperFavoriteAlbumAssetRemovalNeeded)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded;
    self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded = v6;

    id v4 = v8;
    delayedWallpaperFavoriteAlbumAssetRemovalNeeded = self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded;
  }
  [(NSMutableSet *)delayedWallpaperFavoriteAlbumAssetRemovalNeeded addObject:v4];
}

- (void)_popWallpaperUserAlbumAssetRemovalReloadNeeded:(id)a3
{
  delayedWallpaperUserAlbumAssetRemovalNeeded = self->_delayedWallpaperUserAlbumAssetRemovalNeeded;
  if (delayedWallpaperUserAlbumAssetRemovalNeeded)
  {
    id v5 = a3;
    id v6 = (void *)[(NSMutableDictionary *)delayedWallpaperUserAlbumAssetRemovalNeeded copy];
    [v5 setAssetsForWallpaperUserAlbumRemoval:v6];

    id v7 = self->_delayedWallpaperUserAlbumAssetRemovalNeeded;
    [(NSMutableDictionary *)v7 removeAllObjects];
  }
}

- (void)recordAssetID:(id)a3 forWallpaperUserAlbumRemoval:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  delayedWallpaperUserAlbumAssetRemovalNeeded = self->_delayedWallpaperUserAlbumAssetRemovalNeeded;
  if (!delayedWallpaperUserAlbumAssetRemovalNeeded)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = self->_delayedWallpaperUserAlbumAssetRemovalNeeded;
    self->_delayedWallpaperUserAlbumAssetRemovalNeeded = v8;

    delayedWallpaperUserAlbumAssetRemovalNeeded = self->_delayedWallpaperUserAlbumAssetRemovalNeeded;
  }
  v10 = [(NSMutableDictionary *)delayedWallpaperUserAlbumAssetRemovalNeeded objectForKeyedSubscript:v14];

  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)self->_delayedWallpaperUserAlbumAssetRemovalNeeded setObject:v11 forKeyedSubscript:v14];
  }
  id v12 = [(NSMutableDictionary *)self->_delayedWallpaperUserAlbumAssetRemovalNeeded objectForKeyedSubscript:v14];
  v13 = [v6 uuid];
  [v12 addObject:v13];
}

- (void)_popWidgetFavoriteAlbumAssetRemovalReloadNeeded:(id)a3
{
  delayedWidgetFavoriteAlbumAssetRemovalNeeded = self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded;
  if (delayedWidgetFavoriteAlbumAssetRemovalNeeded)
  {
    id v5 = a3;
    id v6 = (void *)[(NSMutableSet *)delayedWidgetFavoriteAlbumAssetRemovalNeeded copy];
    [v5 setAssetsForWidgetFavoriteAlbumRemoval:v6];

    id v7 = self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded;
    [(NSMutableSet *)v7 removeAllObjects];
  }
}

- (void)recordAssetIDForWidgetFavoriteAlbumRemoval:(id)a3
{
  id v4 = a3;
  delayedWidgetFavoriteAlbumAssetRemovalNeeded = self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded;
  id v8 = v4;
  if (!delayedWidgetFavoriteAlbumAssetRemovalNeeded)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded;
    self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded = v6;

    id v4 = v8;
    delayedWidgetFavoriteAlbumAssetRemovalNeeded = self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded;
  }
  [(NSMutableSet *)delayedWidgetFavoriteAlbumAssetRemovalNeeded addObject:v4];
}

- (void)_popWidgetUserAlbumAssetRemovalReloadNeeded:(id)a3
{
  delayedWidgetUserAlbumAssetRemovalNeeded = self->_delayedWidgetUserAlbumAssetRemovalNeeded;
  if (delayedWidgetUserAlbumAssetRemovalNeeded)
  {
    id v5 = a3;
    id v6 = (void *)[(NSMutableDictionary *)delayedWidgetUserAlbumAssetRemovalNeeded copy];
    [v5 setAssetsForWidgetUserAlbumRemoval:v6];

    id v7 = self->_delayedWidgetUserAlbumAssetRemovalNeeded;
    [(NSMutableDictionary *)v7 removeAllObjects];
  }
}

- (void)recordAssetID:(id)a3 forWidgetUserAlbumRemoval:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  delayedWidgetUserAlbumAssetRemovalNeeded = self->_delayedWidgetUserAlbumAssetRemovalNeeded;
  if (!delayedWidgetUserAlbumAssetRemovalNeeded)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = self->_delayedWidgetUserAlbumAssetRemovalNeeded;
    self->_delayedWidgetUserAlbumAssetRemovalNeeded = v8;

    delayedWidgetUserAlbumAssetRemovalNeeded = self->_delayedWidgetUserAlbumAssetRemovalNeeded;
  }
  v10 = [(NSMutableDictionary *)delayedWidgetUserAlbumAssetRemovalNeeded objectForKeyedSubscript:v14];

  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)self->_delayedWidgetUserAlbumAssetRemovalNeeded setObject:v11 forKeyedSubscript:v14];
  }
  id v12 = [(NSMutableDictionary *)self->_delayedWidgetUserAlbumAssetRemovalNeeded objectForKeyedSubscript:v14];
  v13 = [v6 uuid];
  [v12 addObject:v13];
}

- (void)_popWidgetTimelineReloadNeeded:(id)a3
{
  id v5 = a3;
  if ([(NSMutableSet *)self->_delayedWidgetTimelineReloadTypesNeeded count])
  {
    id v4 = (void *)[(NSMutableSet *)self->_delayedWidgetTimelineReloadTypesNeeded copy];
    [v5 setWidgetTimelineReloadTypesNeeded:v4];

    [(NSMutableSet *)self->_delayedWidgetTimelineReloadTypesNeeded removeAllObjects];
  }
}

- (void)recordWidgetTimelineReloadNeededForType:(int64_t)a3
{
  delayedWidgetTimelineReloadTypesNeeded = self->_delayedWidgetTimelineReloadTypesNeeded;
  if (!delayedWidgetTimelineReloadTypesNeeded)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = self->_delayedWidgetTimelineReloadTypesNeeded;
    self->_delayedWidgetTimelineReloadTypesNeeded = v6;

    delayedWidgetTimelineReloadTypesNeeded = self->_delayedWidgetTimelineReloadTypesNeeded;
  }
  id v8 = [NSNumber numberWithInteger:a3];
  [(NSMutableSet *)delayedWidgetTimelineReloadTypesNeeded addObject:v8];
}

- (void)_popDuetDeletedMemoriesIntoDetail:(id)a3
{
  id v5 = a3;
  if ([(NSMutableSet *)self->_delayedMemoriesForDuetDelete count])
  {
    id v4 = (void *)[(NSMutableSet *)self->_delayedMemoriesForDuetDelete copy];
    [v5 setMemoriesForDuetDelete:v4];

    [(NSMutableSet *)self->_delayedMemoriesForDuetDelete removeAllObjects];
  }
}

- (void)recordMemoryForDuetDelete:(id)a3
{
  id v4 = a3;
  delayedMemoriesForDuetDelete = self->_delayedMemoriesForDuetDelete;
  id v9 = v4;
  if (!delayedMemoriesForDuetDelete)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = self->_delayedMemoriesForDuetDelete;
    self->_delayedMemoriesForDuetDelete = v6;

    id v4 = v9;
    delayedMemoriesForDuetDelete = self->_delayedMemoriesForDuetDelete;
  }
  id v8 = [v4 uuid];
  [(NSMutableSet *)delayedMemoriesForDuetDelete addObject:v8];
}

- (void)_popDuetDeletedAssetsIntoDetail:(id)a3
{
  id v5 = a3;
  if ([(NSMutableSet *)self->_delayedAssetsForDuetDelete count])
  {
    id v4 = (void *)[(NSMutableSet *)self->_delayedAssetsForDuetDelete copy];
    [v5 setAssetsForDuetDelete:v4];

    [(NSMutableSet *)self->_delayedAssetsForDuetDelete removeAllObjects];
  }
}

- (void)recordAssetForDuetDelete:(id)a3
{
  id v4 = a3;
  delayedAssetsForDuetDelete = self->_delayedAssetsForDuetDelete;
  id v9 = v4;
  if (!delayedAssetsForDuetDelete)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = self->_delayedAssetsForDuetDelete;
    self->_delayedAssetsForDuetDelete = v6;

    id v4 = v9;
    delayedAssetsForDuetDelete = self->_delayedAssetsForDuetDelete;
  }
  id v8 = [v4 uuid];
  [(NSMutableSet *)delayedAssetsForDuetDelete addObject:v8];
}

- (void)_popDelayedAssetsForAnalysis:(id *)a3
{
  if (a3) {
    *a3 = self->_delayedWorkerTypesToAnalyzeByAssetUUID;
  }
  delayedWorkerTypesToAnalyzeByAssetUUID = self->_delayedWorkerTypesToAnalyzeByAssetUUID;
  self->_delayedWorkerTypesToAnalyzeByAssetUUID = 0;
}

- (void)recordAssetForAnalysis:(id)a3 workerFlags:(int)a4 workerType:(signed __int16)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v18 = v8;
  if (!self->_delayedWorkerTypesToAnalyzeByAssetUUID)
  {
    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    delayedWorkerTypesToAnalyzeByAssetUUID = self->_delayedWorkerTypesToAnalyzeByAssetUUID;
    self->_delayedWorkerTypesToAnalyzeByAssetUUID = v9;

    id v8 = v18;
  }
  id v11 = [v8 uuid];
  id v12 = [(NSMutableDictionary *)self->_delayedWorkerTypesToAnalyzeByAssetUUID objectForKeyedSubscript:v11];
  if (!v12)
  {
    id v12 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_delayedWorkerTypesToAnalyzeByAssetUUID setObject:v12 forKeyedSubscript:v11];
  }
  v13 = [NSNumber numberWithShort:v5];
  id v14 = [v12 objectForKeyedSubscript:v13];
  int v15 = [v14 integerValue];

  v16 = [NSNumber numberWithInt:v15 | a4];
  v17 = [NSNumber numberWithShort:v5];
  [v12 setObject:v16 forKeyedSubscript:v17];
}

- (void)_popDelayedAlbumKeyAssetsUpdates:(id *)a3
{
  if (a3)
  {
    id v5 = [(NSMutableSet *)self->_delayedAlbumKeyAssetsUpdates valueForKey:@"objectID"];
    *a3 = v5;
  }
  delayedAlbumKeyAssetsUpdates = self->_delayedAlbumKeyAssetsUpdates;
  [(NSMutableSet *)delayedAlbumKeyAssetsUpdates removeAllObjects];
}

- (void)_popDelayedAlbumCountsAndDateRangeUpdates:(id *)a3
{
  if (a3)
  {
    id v5 = [(NSMutableSet *)self->_delayedAlbumCountsAndDateRangeUpdates valueForKey:@"objectID"];
    *a3 = v5;
  }
  delayedAlbumCountsAndDateRangeUpdates = self->_delayedAlbumCountsAndDateRangeUpdates;
  [(NSMutableSet *)delayedAlbumCountsAndDateRangeUpdates removeAllObjects];
}

- (void)recordAssetForImportSessionCountsAndDateRangeUpdate:(id)a3
{
  id v4 = [a3 importSession];
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    char v6 = [v4 isDeleted];
    id v5 = v7;
    if ((v6 & 1) == 0)
    {
      [(PLDelayedSaveActions *)self _recordDelayedImportSessionCountsAndDateRangeUpdate:v7];
      id v5 = v7;
    }
  }
}

- (void)recordAssetForAlbumCountsDateRangeAndKeyAssetsUpdate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 albums];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v9 isDeleted] & 1) == 0)
        {
          [(PLDelayedSaveActions *)self _recordDelayedAlbumCountsAndDateRangeUpdate:v9];
          [(PLDelayedSaveActions *)self _recordDelayedAlbumKeyAssetsUpdate:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)recordAlbumForKeyAssetsUpdate:(id)a3
{
  id v4 = a3;
  if (([v4 isDeleted] & 1) == 0) {
    [(PLDelayedSaveActions *)self _recordDelayedAlbumKeyAssetsUpdate:v4];
  }
}

- (void)recordAlbumForCountsAndDateRangeUpdate:(id)a3
{
  id v4 = a3;
  if (([v4 isDeleted] & 1) == 0) {
    [(PLDelayedSaveActions *)self _recordDelayedAlbumCountsAndDateRangeUpdate:v4];
  }
}

- (void)_recordDelayedAlbumKeyAssetsUpdate:(id)a3
{
  id v4 = a3;
  delayedAlbumKeyAssetsUpdates = self->_delayedAlbumKeyAssetsUpdates;
  id v8 = v4;
  if (!delayedAlbumKeyAssetsUpdates)
  {
    uint64_t v6 = (NSMutableSet *)objc_opt_new();
    uint64_t v7 = self->_delayedAlbumKeyAssetsUpdates;
    self->_delayedAlbumKeyAssetsUpdates = v6;

    id v4 = v8;
    delayedAlbumKeyAssetsUpdates = self->_delayedAlbumKeyAssetsUpdates;
  }
  [(NSMutableSet *)delayedAlbumKeyAssetsUpdates addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeAlbumCounts"];
}

- (void)_recordDelayedAlbumCountsAndDateRangeUpdate:(id)a3
{
  id v4 = a3;
  delayedAlbumCountsAndDateRangeUpdates = self->_delayedAlbumCountsAndDateRangeUpdates;
  id v8 = v4;
  if (!delayedAlbumCountsAndDateRangeUpdates)
  {
    uint64_t v6 = (NSMutableSet *)objc_opt_new();
    uint64_t v7 = self->_delayedAlbumCountsAndDateRangeUpdates;
    self->_delayedAlbumCountsAndDateRangeUpdates = v6;

    id v4 = v8;
    delayedAlbumCountsAndDateRangeUpdates = self->_delayedAlbumCountsAndDateRangeUpdates;
  }
  [(NSMutableSet *)delayedAlbumCountsAndDateRangeUpdates addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeAlbumCounts"];
}

- (void)_popDelayedImportSessionCountsAndDateRangeUpdates:(id *)a3
{
  if (a3)
  {
    id v5 = [(NSMutableSet *)self->_delayedImportSessionCountsAndDateRangeUpdates valueForKey:@"objectID"];
    *a3 = v5;
  }
  delayedImportSessionCountsAndDateRangeUpdates = self->_delayedImportSessionCountsAndDateRangeUpdates;
  [(NSMutableSet *)delayedImportSessionCountsAndDateRangeUpdates removeAllObjects];
}

- (void)recordImportSessionCountsAndDateRangeUpdate:(id)a3
{
  id v6 = a3;
  if (([v6 isDeleted] & 1) == 0)
  {
    id v4 = [v6 changedValues];
    id v5 = [v4 objectForKeyedSubscript:@"assets"];

    if (v5) {
      [(PLDelayedSaveActions *)self _recordDelayedImportSessionCountsAndDateRangeUpdate:v6];
    }
  }
}

- (void)_recordDelayedImportSessionCountsAndDateRangeUpdate:(id)a3
{
  id v4 = a3;
  delayedImportSessionCountsAndDateRangeUpdates = self->_delayedImportSessionCountsAndDateRangeUpdates;
  id v8 = v4;
  if (!delayedImportSessionCountsAndDateRangeUpdates)
  {
    id v6 = (NSMutableSet *)objc_opt_new();
    uint64_t v7 = self->_delayedImportSessionCountsAndDateRangeUpdates;
    self->_delayedImportSessionCountsAndDateRangeUpdates = v6;

    id v4 = v8;
    delayedImportSessionCountsAndDateRangeUpdates = self->_delayedImportSessionCountsAndDateRangeUpdates;
  }
  [(NSMutableSet *)delayedImportSessionCountsAndDateRangeUpdates addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeImportSessionCounts"];
}

- (void)_popDelayedSearchIndexUpdates:(id *)a3
{
  if (a3) {
    *a3 = self->_delayedSearchIndexUpdateUUIDs;
  }
  delayedSearchIndexUpdateUUIDs = self->_delayedSearchIndexUpdateUUIDs;
  self->_delayedSearchIndexUpdateUUIDs = 0;
}

- (void)recordHighlightForSearchIndexUpdate:(id)a3
{
  id v18 = a3;
  if (!+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled])
  {
    id v4 = [v18 changedValues];
    if (([v18 isDeleted] & 1) == 0 && (objc_msgSend(v18, "isInserted") & 1) == 0)
    {
      id v5 = [v4 objectForKeyedSubscript:@"verboseSmartDescription"];
      if (v5) {
        goto LABEL_28;
      }
      id v5 = [v4 objectForKeyedSubscript:@"subtitle"];
      if (v5) {
        goto LABEL_28;
      }
      id v5 = [v4 objectForKeyedSubscript:@"title"];
      if (v5) {
        goto LABEL_28;
      }
      id v5 = [v4 objectForKeyedSubscript:@"startDate"];
      if (v5) {
        goto LABEL_28;
      }
      id v5 = [v4 objectForKeyedSubscript:@"endDate"];
      if (v5) {
        goto LABEL_28;
      }
      id v5 = [v4 objectForKeyedSubscript:@"startTimeZoneOffset"];
      if (v5) {
        goto LABEL_28;
      }
      id v6 = [v4 objectForKeyedSubscript:@"endTimeZoneOffset"];
      if (v6)
      {
LABEL_27:

        id v5 = 0;
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v7 = [v4 objectForKeyedSubscript:@"type"];
      if (v7)
      {
LABEL_26:

        id v6 = 0;
        goto LABEL_27;
      }
      id v8 = [v4 objectForKeyedSubscript:@"assets"];
      if (v8)
      {
LABEL_25:

        uint64_t v7 = 0;
        goto LABEL_26;
      }
      id v9 = [v4 objectForKeyedSubscript:@"dayGroupAssets"];
      if (v9)
      {
LABEL_24:

        id v8 = 0;
        goto LABEL_25;
      }
      long long v10 = [v4 objectForKeyedSubscript:@"childDayGroupPhotosHighlights"];
      if (v10)
      {
LABEL_23:

        id v9 = 0;
        goto LABEL_24;
      }
      long long v11 = [v4 objectForKeyedSubscript:@"moments"];
      if (v11)
      {
LABEL_22:

        long long v10 = 0;
        goto LABEL_23;
      }
      long long v12 = [v4 objectForKeyedSubscript:@"keyAssetPrivate"];
      if (v12)
      {
LABEL_21:

        long long v11 = 0;
        goto LABEL_22;
      }
      long long v13 = [v4 objectForKeyedSubscript:@"dayGroupKeyAssetPrivate"];
      if (v13)
      {
LABEL_20:

        long long v12 = 0;
        goto LABEL_21;
      }
      id v14 = [v4 objectForKeyedSubscript:@"keyAssetShared"];
      if (v14)
      {

        long long v13 = 0;
        goto LABEL_20;
      }
      v17 = [v4 objectForKeyedSubscript:@"dayGroupKeyAssetShared"];

      if (!v17)
      {
LABEL_33:

        goto LABEL_34;
      }
    }
LABEL_29:
    if ([v18 isDeleted]) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = [v18 isEligibleForSearchIndexing];
    }
    v16 = [v18 uuid];
    [(PLDelayedSaveActions *)self _recordHighlightUUIDForSearchIndexUpdate:v16 isInsert:v15];

    goto LABEL_33;
  }
LABEL_34:
}

- (void)recordMemoryForSearchIndexUpdate:(id)a3
{
  id v9 = a3;
  if (!+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled])
  {
    if ([v9 isDeleted])
    {
      uint64_t v4 = 0;
    }
    else
    {
      id v5 = [v9 photoLibrary];
      id v6 = [v5 libraryServicesManager];
      uint64_t v7 = +[PLMemory isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLMemory, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", [v6 wellKnownPhotoLibraryIdentifier]);
      uint64_t v4 = [v7 evaluateWithObject:v9];
    }
    id v8 = [v9 uuid];
    [(PLDelayedSaveActions *)self _recordMemoryUUIDForSearchIndexUpdate:v8 isInsert:v4];
  }
}

- (void)recordAlbumForSearchIndexUpdate:(id)a3
{
  id v15 = a3;
  BOOL v4 = +[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled];
  id v5 = v15;
  if (!v4)
  {
    int v6 = [v15 isCandidateForSearchIndexing];
    id v5 = v15;
    if (v6)
    {
      if ([v15 isDeleted])
      {
        uint64_t v7 = 0;
      }
      else
      {
        id v8 = [v15 photoLibrary];
        id v9 = [v8 libraryServicesManager];
        long long v10 = +[PLGenericAlbum isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLGenericAlbum, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", [v9 wellKnownPhotoLibraryIdentifier]);
        uint64_t v7 = [v10 evaluateWithObject:v15];
      }
      long long v11 = [v15 uuid];
      long long v12 = [v15 changedValues];
      if (([v15 isDeleted] & 1) == 0 && (objc_msgSend(v15, "isInserted") & 1) == 0)
      {
        long long v13 = [v12 objectForKeyedSubscript:@"trashedState"];
        if (v13
          || ([v12 objectForKeyedSubscript:@"startDate"],
              (long long v13 = objc_claimAutoreleasedReturnValue()) != 0)
          || ([v12 objectForKeyedSubscript:@"endDate"],
              (long long v13 = objc_claimAutoreleasedReturnValue()) != 0)
          || ([v12 objectForKeyedSubscript:@"assets"],
              (long long v13 = objc_claimAutoreleasedReturnValue()) != 0))
        {
        }
        else
        {
          id v14 = [v12 objectForKeyedSubscript:@"title"];

          if (!v14) {
            goto LABEL_14;
          }
        }
      }
      [(PLDelayedSaveActions *)self _recordAlbumUUIDForSearchIndexUpdate:v11 isInsert:v7];
LABEL_14:

      id v5 = v15;
    }
  }
}

- (void)recordAssetForSearchIndexUpdate:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled])
  {
    id v5 = [v4 changedValues];
    if (([v4 isDeleted] & 1) == 0)
    {
      int v6 = [v4 photoLibrary];
      uint64_t v7 = [v6 libraryServicesManager];
      id v8 = +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLManagedAsset, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", [v7 wellKnownPhotoLibraryIdentifier]);
      if ([v8 evaluateWithObject:v4])
      {

        goto LABEL_5;
      }
      v20 = [v5 objectForKeyedSubscript:@"visibilityState"];
      if (v20
        || ([v5 objectForKeyedSubscript:@"savedAssetType"],
            (v20 = objc_claimAutoreleasedReturnValue()) != 0)
        || ([v5 objectForKeyedSubscript:@"hidden"],
            (v20 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        v23 = [v5 objectForKeyedSubscript:@"trashedState"];

        if (!v23)
        {
LABEL_5:
          v34 = [v5 objectForKeyedSubscript:@"dateCreated"];

          v32 = [v5 objectForKeyedSubscript:@"favorite"];

          v31 = [v5 objectForKeyedSubscript:@"kind"];

          v30 = [v5 objectForKeyedSubscript:@"kindSubtype"];

          v29 = [v5 objectForKeyedSubscript:@"depthType"];

          v28 = [v5 objectForKeyedSubscript:@"avalanchePickType"];

          v27 = [v5 objectForKeyedSubscript:@"playbackVariation"];

          v26 = [v5 objectForKeyedSubscript:@"playbackStyle"];

          v33 = [v5 objectForKeyedSubscript:@"visibilityState"];

          id v9 = [v5 objectForKeyedSubscript:@"savedAssetType"];

          long long v10 = [v5 objectForKeyedSubscript:@"hidden"];

          long long v11 = [v5 objectForKeyedSubscript:@"trashedState"];

          v25 = [v5 objectForKeyedSubscript:@"dayGroupHighlightBeingAssets"];

          v24 = [v5 objectForKeyedSubscript:@"albums"];

          long long v12 = [v5 objectForKeyedSubscript:@"memoriesBeingCuratedAssets"];

          char v13 = [v4 isInserted];
          id v14 = [v5 objectForKeyedSubscript:@"libraryScope"];

          id v15 = [v5 objectForKeyedSubscript:@"libraryScopeContributors"];

          if (!v14
            && !v15
            && (v13 & 1) == 0
            && !v34
            && !v33
            && !v9
            && !v10
            && !v11
            && !v32
            && !v31
            && !v30
            && !v29
            && !v28
            && !v27
            && !v26
            && !v25
            && !v24
            && !v12)
          {
            goto LABEL_32;
          }
          v16 = [v4 uuid];
          v17 = self;
          id v18 = v16;
          uint64_t v19 = 1;
LABEL_31:
          [(PLDelayedSaveActions *)v17 _recordAssetUUIDForSearchIndexUpdate:v18 isInsert:v19];

LABEL_32:
          goto LABEL_33;
        }
      }
    }
    v21 = PLSearchBackendIndexStatusGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = [v4 uuid];
      *(_DWORD *)buf = 138412290;
      v36 = v22;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "search: property changes to asset: %@ indicate remove from index", buf, 0xCu);
    }
    v16 = [v4 uuid];
    v17 = self;
    id v18 = v16;
    uint64_t v19 = 0;
    goto LABEL_31;
  }
LABEL_33:
}

- (void)recordMediaAnalysisAssetAttributesForSearchIndexUpdate:(id)a3
{
  id v15 = a3;
  BOOL v4 = +[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled];
  id v5 = v15;
  if (!v4)
  {
    int v6 = [v15 changedValues];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"characterRecognitionAttributes"];

    if (v7)
    {
      id v8 = [v15 asset];
      [(PLDelayedSaveActions *)self _recordAssetForSearchIndexUpdate:v8];
    }
    id v9 = [v6 objectForKeyedSubscript:@"visualSearchAttributes"];

    if (v9)
    {
      long long v10 = [v15 asset];
      [(PLDelayedSaveActions *)self _recordAssetForSearchIndexUpdate:v10];
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"mediaAnalysisImageVersion"];

    uint64_t v12 = [v6 objectForKeyedSubscript:@"mediaAnalysisVersion"];
    uint64_t v13 = v11 | v12;

    if (v13)
    {
      id v14 = [v15 asset];
      [(PLDelayedSaveActions *)self _recordAssetForSearchIndexUpdate:v14];
    }
    id v5 = v15;
  }
}

- (void)recordAdditionalAssetAttributesForSearchIndexUpdate:(id)a3
{
  id v18 = a3;
  BOOL v4 = +[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled];
  id v5 = v18;
  if (!v4)
  {
    int v6 = [v18 changedValues];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"reverseLocationDataIsValid"];
    if (v7)
    {
      BOOL v8 = 1;
    }
    else
    {
      id v9 = [v6 objectForKeyedSubscript:@"reverseLocationData"];
      BOOL v8 = v9 != 0;
    }
    long long v10 = [v6 objectForKeyedSubscript:@"keywords"];

    uint64_t v11 = [v6 objectForKeyedSubscript:@"title"];

    uint64_t v12 = [v6 objectForKeyedSubscript:@"sceneClassifications"];

    uint64_t v13 = [v6 objectForKeyedSubscript:@"temporalSceneClassifications"];

    id v14 = [v6 objectForKeyedSubscript:@"cameraCaptureDevice"];

    id v15 = [v6 objectForKeyedSubscript:@"assetDescription"];

    v16 = [v6 objectForKeyedSubscript:@"accessibilityDescription"];

    if (v8 || v10 || v11 || v12 || v13 || v14 || v15 || v16)
    {
      v17 = [v18 asset];
      [(PLDelayedSaveActions *)self _recordAssetForSearchIndexUpdate:v17];
    }
    id v5 = v18;
  }
}

- (void)recordAssetDescriptionForSearchIndexUpdate:(id)a3
{
  id v8 = a3;
  if (!+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled])
  {
    BOOL v4 = [v8 changedValues];
    id v5 = [v4 objectForKeyedSubscript:@"longDescription"];

    if (v5)
    {
      int v6 = [v8 assetAttributes];
      uint64_t v7 = [v6 asset];
      [(PLDelayedSaveActions *)self _recordAssetForSearchIndexUpdate:v7];
    }
  }
}

- (void)recordDetectedFaceForSearchIndexUpdate:(id)a3
{
  id v15 = a3;
  BOOL v4 = +[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled];
  id v5 = v15;
  if (!v4)
  {
    int v6 = [v15 associatedAssetForFaceOrTorso:1 orTemporal:1];
    if (v6)
    {
      if ([v15 isDeleted])
      {
        uint64_t v7 = [v15 associatedPersonForFaceOrTorso:1 orTemporal:1];
        int v8 = [v7 shouldIndexForSearch];

        if (v8) {
          [(PLDelayedSaveActions *)self _recordAssetForSearchIndexUpdate:v6];
        }
        goto LABEL_14;
      }
      if (![v15 isInserted])
      {
        uint64_t v11 = [v15 changedValues];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"personForFace"];
        if (v12
          || ([v11 objectForKeyedSubscript:@"personForTemporalDetectedFaces"],
              (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
        {
        }
        else
        {
          id v14 = [v11 objectForKeyedSubscript:@"ageType"];

          if (!v14) {
            goto LABEL_13;
          }
        }
        uint64_t v13 = [v15 uuid];
        [(PLDelayedSaveActions *)self _recordDetectedFaceUUIDInsertForSearchIndexUpdate:v13];

LABEL_13:
        goto LABEL_14;
      }
      id v9 = [v15 associatedPersonForFaceOrTorso:1 orTemporal:1];
      int v10 = [v9 shouldIndexForSearch];

      if (v10)
      {
        uint64_t v11 = [v15 uuid];
        [(PLDelayedSaveActions *)self _recordDetectedFaceUUIDInsertForSearchIndexUpdate:v11];
        goto LABEL_13;
      }
    }
LABEL_14:

    id v5 = v15;
  }
}

- (void)recordPersonForSearchIndexUpdate:(id)a3
{
  id v10 = a3;
  BOOL v4 = +[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled];
  id v5 = v10;
  if (!v4)
  {
    int v6 = [v10 changedValues];
    if (([v10 isDeleted] & 1) != 0 || objc_msgSend(v10, "verifiedType") != 1) {
      goto LABEL_8;
    }
    uint64_t v7 = [v6 objectForKeyedSubscript:@"fullName"];
    if (v7)
    {
    }
    else
    {
      int v8 = [v6 objectForKeyedSubscript:@"detectionType"];

      if (!v8)
      {
LABEL_8:

        id v5 = v10;
        goto LABEL_9;
      }
    }
    id v9 = [v10 personUUID];
    [(PLDelayedSaveActions *)self _recordPersonUUIDInsertForSearchIndexUpdate:v9];
    [(PLDelayedSaveActions *)self _recordPersonUUIDRenameForSearchIndexUpdate:v9];

    goto LABEL_8;
  }
LABEL_9:
}

- (void)_recordAssetForSearchIndexUpdate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    if ([v4 isDeleted])
    {
      uint64_t v5 = 0;
    }
    else
    {
      int v6 = [v10 photoLibrary];
      uint64_t v7 = [v6 libraryServicesManager];
      int v8 = +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLManagedAsset, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", [v7 wellKnownPhotoLibraryIdentifier]);
      uint64_t v5 = [v8 evaluateWithObject:v10];
    }
    id v9 = [v10 uuid];
    [(PLDelayedSaveActions *)self _recordAssetUUIDForSearchIndexUpdate:v9 isInsert:v5];

    id v4 = v10;
  }
}

- (void)_recordDetectedFaceUUIDInsertForSearchIndexUpdate:(id)a3
{
}

- (void)_recordPersonUUIDRenameForSearchIndexUpdate:(id)a3
{
}

- (void)_recordPersonUUIDInsertForSearchIndexUpdate:(id)a3
{
}

- (void)_recordHighlightUUIDForSearchIndexUpdate:(id)a3 isInsert:(BOOL)a4
{
  if (a4) {
    id v4 = @"insertHighlight";
  }
  else {
    id v4 = @"removeHighlight";
  }
  [(PLDelayedSaveActions *)self _recordManagedObjectUUID:a3 forSearchIndexUpdateKey:v4];
}

- (void)_recordMemoryUUIDForSearchIndexUpdate:(id)a3 isInsert:(BOOL)a4
{
  if (a4) {
    id v4 = @"insertMemory";
  }
  else {
    id v4 = @"removeMemory";
  }
  [(PLDelayedSaveActions *)self _recordManagedObjectUUID:a3 forSearchIndexUpdateKey:v4];
}

- (void)_recordAlbumUUIDForSearchIndexUpdate:(id)a3 isInsert:(BOOL)a4
{
  if (a4) {
    id v4 = @"insertAlbum";
  }
  else {
    id v4 = @"removeAlbum";
  }
  [(PLDelayedSaveActions *)self _recordManagedObjectUUID:a3 forSearchIndexUpdateKey:v4];
}

- (void)_recordAssetUUIDForSearchIndexUpdate:(id)a3 isInsert:(BOOL)a4
{
  if (a4) {
    id v4 = @"insertAsset";
  }
  else {
    id v4 = @"removeAsset";
  }
  [(PLDelayedSaveActions *)self _recordManagedObjectUUID:a3 forSearchIndexUpdateKey:v4];
}

- (void)_recordManagedObjectUUID:(id)a3 forSearchIndexUpdateKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    delayedSearchIndexUpdateUUIDs = self->_delayedSearchIndexUpdateUUIDs;
    if (delayedSearchIndexUpdateUUIDs) {
      int v8 = delayedSearchIndexUpdateUUIDs;
    }
    else {
      int v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v9 = self->_delayedSearchIndexUpdateUUIDs;
    self->_delayedSearchIndexUpdateUUIDs = v8;

    id v10 = [(NSMutableDictionary *)self->_delayedSearchIndexUpdateUUIDs objectForKey:v6];
    if (!v10)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(NSMutableDictionary *)self->_delayedSearchIndexUpdateUUIDs setObject:v10 forKey:v6];
    }
    [v10 addObject:v11];
    [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeSearchIndex"];
  }
}

- (void)_popDelayedAssetsForFilesystemPersistencyUpdates:(id *)a3
{
  if (a3)
  {
    id v5 = [(NSMutableSet *)self->_delayedAssetsForFileSystemPersistency valueForKey:@"objectID"];
    *a3 = v5;
  }
  delayedAssetsForFileSystemPersistency = self->_delayedAssetsForFileSystemPersistency;
  [(NSMutableSet *)delayedAssetsForFileSystemPersistency removeAllObjects];
}

- (void)recordAssetForFileSystemPersistencyUpdate:(id)a3
{
  id v7 = a3;
  if (([v7 disableFileSystemPersistency] & 1) == 0)
  {
    delayedAssetsForFileSystemPersistency = self->_delayedAssetsForFileSystemPersistency;
    if (!delayedAssetsForFileSystemPersistency)
    {
      id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v6 = self->_delayedAssetsForFileSystemPersistency;
      self->_delayedAssetsForFileSystemPersistency = v5;

      delayedAssetsForFileSystemPersistency = self->_delayedAssetsForFileSystemPersistency;
    }
    [(NSMutableSet *)delayedAssetsForFileSystemPersistency addObject:v7];
    [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeFilePersistence"];
  }
}

- (void)_popDelayedCloudFeedAlbumUpdates:(id *)a3 assetInserts:(id *)a4 assetUpdates:(id *)a5 commentInserts:(id *)a6 invitationRecordUpdates:(id *)a7 deletionEntries:(id *)a8
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v15 = [(NSMutableArray *)self->_delayedCloudFeedAlbumUpdates valueForKey:@"objectID"];
    *a3 = v15;
  }
  [(NSMutableArray *)self->_delayedCloudFeedAlbumUpdates removeAllObjects];
  if (a4)
  {
    id v16 = [(NSMutableArray *)self->_delayedCloudFeedAssetInserts valueForKey:@"objectID"];
    *a4 = v16;
  }
  [(NSMutableArray *)self->_delayedCloudFeedAssetInserts removeAllObjects];
  if (a5)
  {
    id v17 = [(NSMutableArray *)self->_delayedCloudFeedAssetUpdates valueForKey:@"objectID"];
    *a5 = v17;
  }
  [(NSMutableArray *)self->_delayedCloudFeedAssetUpdates removeAllObjects];
  if (a6)
  {
    id v18 = [(NSMutableArray *)self->_delayedCloudFeedCommentInserts valueForKey:@"objectID"];
    *a6 = v18;
  }
  [(NSMutableArray *)self->_delayedCloudFeedCommentInserts removeAllObjects];
  if (a7)
  {
    id v19 = [(NSMutableArray *)self->_delayedCloudFeedInvitationRecordUpdates valueForKey:@"objectID"];
    *a7 = v19;
  }
  [(NSMutableArray *)self->_delayedCloudFeedInvitationRecordUpdates removeAllObjects];
  if (a8 && [(NSMutableSet *)self->_delayedCloudFeedDeletionEntries count])
  {
    v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableSet count](self->_delayedCloudFeedDeletionEntries, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v21 = self->_delayedCloudFeedDeletionEntries;
    uint64_t v22 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v25), "objectID", (void)v28);
          [v20 addObject:v26];

          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v23);
    }

    id v27 = v20;
    *a8 = v27;
  }
  [(NSMutableSet *)self->_delayedCloudFeedDeletionEntries removeAllObjects];
}

- (void)recordCloudFeedAssetsEntryForAssetUpdate:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isDeleted] & 1) == 0)
  {
    id v5 = [v4 entryAssets];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      v8[0] = v4;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      [(PLDelayedSaveActions *)self _recordDelayedCloudFeedDeletionEntries:v7];
    }
  }
}

- (void)recordCloudFeedCommentsEntryForCommentUpdate:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isDeleted] & 1) == 0)
  {
    id v5 = [v4 entryLikeComments];
    if (![v5 count])
    {
      uint64_t v6 = [v4 entryComments];
      uint64_t v7 = [v6 count];

      if (v7) {
        goto LABEL_5;
      }
      v8[0] = v4;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      [(PLDelayedSaveActions *)self _recordDelayedCloudFeedDeletionEntries:v5];
    }
  }
LABEL_5:
}

- (void)recordInvitationRecordForCloudFeedUpdate:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v8 = [v5 objectID];
    *(_DWORD *)buf = 138413314;
    uint64_t v24 = v7;
    __int16 v25 = 2112;
    v26 = v8;
    __int16 v27 = 1024;
    int v28 = [v5 isDeleted];
    __int16 v29 = 1024;
    int v30 = [v5 isInserted];
    __int16 v31 = 1024;
    int v32 = [v5 isUpdated];
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ isDeleted=%i isInserted=%i isUpdated=%i", buf, 0x28u);
  }
  if ([v5 isDeleted])
  {
    id v9 = [v5 managedObjectContext];
    if (([v9 hasPreviouslyMergedDeleteForObject:v5] & 1) == 0)
    {
      id v10 = (void *)MEMORY[0x1E4F1C0D0];
      id v11 = +[PLCloudFeedEntry entityName];
      uint64_t v12 = [v10 fetchRequestWithEntityName:v11];

      uint64_t v13 = (void *)MEMORY[0x1E4F28F60];
      id v14 = [v5 cloudGUID];
      id v15 = [v13 predicateWithFormat:@"((entryTypeNumber = %d) OR (entryTypeNumber = %d)) AND (entryInvitationRecordGUID = %@)", 5, 6, v14];
      [v12 setPredicate:v15];

      id v16 = [v9 executeFetchRequest:v12 error:0];
      id v17 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        id v18 = [v5 cloudGUID];
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v18;
        __int16 v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "invitationRecordGUID=%@ cloudFeedEntries=%@", buf, 0x16u);
      }
      if ([v16 count]) {
        [(PLDelayedSaveActions *)self _recordDelayedCloudFeedDeletionEntries:v16];
      }
    }
    goto LABEL_19;
  }
  if (![v5 isInserted])
  {
    if (![v5 isUpdated]) {
      goto LABEL_20;
    }
    id v9 = [v5 changedValues];
    id v19 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = [v9 allKeys];
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v20;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "changedValues=%@", buf, 0xCu);
    }
    v21 = [v9 objectForKeyedSubscript:@"invitationState"];
    if (v21
      || ([v9 objectForKeyedSubscript:@"invitationStateLocal"],
          (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      uint64_t v22 = [v9 objectForKeyedSubscript:@"inviteeSubscriptionDate"];

      if (!v22) {
        goto LABEL_19;
      }
    }
    [(PLDelayedSaveActions *)self _recordDelayedCloudFeedInvitationRecordUpdate:v5];
LABEL_19:

    goto LABEL_20;
  }
  [(PLDelayedSaveActions *)self _recordDelayedCloudFeedInvitationRecordUpdate:v5];
LABEL_20:
}

- (void)recordCommentForCloudFeedUpdate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v8 = [v5 objectID];
    *(_DWORD *)buf = 138413314;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 1024;
    int v20 = [v5 isDeleted];
    __int16 v21 = 1024;
    int v22 = [v5 isInserted];
    __int16 v23 = 1024;
    int v24 = [v5 isUpdated];
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ isDeleted=%i isInserted=%i isUpdated=%i", buf, 0x28u);
  }
  if ([v5 isDeleted])
  {
    id v9 = [v5 managedObjectContext];
    if (([v9 hasPreviouslyMergedDeleteForObject:v5] & 1) == 0)
    {
      id v10 = [v5 cloudFeedEntry];
      id v11 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = [v10 objectID];
        *(_DWORD *)buf = 138412290;
        id v16 = v12;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "cloudFeedEntry=%@", buf, 0xCu);
      }
      if (v10)
      {
        id v14 = v10;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
        [(PLDelayedSaveActions *)self _recordDelayedCloudFeedDeletionEntries:v13];
      }
    }
  }
  else if ([v5 isInserted])
  {
    [(PLDelayedSaveActions *)self _recordDelayedCloudFeedCommentInsert:v5];
  }
  else
  {
    [v5 isUpdated];
  }
}

- (void)recordAssetForCloudFeedUpdate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v8 = [v5 objectID];
    *(_DWORD *)buf = 138413314;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 1024;
    int v20 = [v5 isIncludedInCloudFeeds];
    __int16 v21 = 1024;
    int v22 = [v5 isDeleted];
    __int16 v23 = 1024;
    int v24 = [v5 isInserted];
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ isIncludedInCloudFeeds=%i isDeleted=%i isInserted=%i", buf, 0x28u);
  }
  if ([v5 isIncludedInCloudFeeds])
  {
    if ([v5 isDeleted])
    {
      id v9 = [v5 managedObjectContext];
      if (([v9 hasPreviouslyMergedDeleteForObject:v5] & 1) == 0)
      {
        id v10 = [v5 cloudFeedAssetsEntry];
        id v11 = PLCloudFeedGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v12 = [v10 objectID];
          *(_DWORD *)buf = 138412290;
          id v16 = v12;
          _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "cloudFeedEntry=%@", buf, 0xCu);
        }
        if (v10)
        {
          id v14 = v10;
          uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
          [(PLDelayedSaveActions *)self _recordDelayedCloudFeedDeletionEntries:v13];
        }
      }
    }
    else if ([v5 isInserted])
    {
      [(PLDelayedSaveActions *)self _recordDelayedCloudFeedAssetInsert:v5];
    }
  }
}

- (void)recordAlbumForCloudFeedUpdate:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v8 = [v5 objectID];
    *(_DWORD *)buf = 138413314;
    int v24 = v7;
    __int16 v25 = 2112;
    v26 = v8;
    __int16 v27 = 1024;
    int v28 = [v5 isDeleted];
    __int16 v29 = 1024;
    int v30 = [v5 isInserted];
    __int16 v31 = 1024;
    int v32 = [v5 isUpdated];
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ isDeleted=%i isInserted=%i isUpdated=%i", buf, 0x28u);
  }
  if ([v5 isDeleted])
  {
    id v9 = [v5 managedObjectContext];
    if (([v9 hasPreviouslyMergedDeleteForObject:v5] & 1) == 0)
    {
      id v10 = (void *)MEMORY[0x1E4F1C0D0];
      id v11 = +[PLCloudFeedEntry entityName];
      uint64_t v12 = [v10 fetchRequestWithEntityName:v11];

      uint64_t v13 = (void *)MEMORY[0x1E4F28F60];
      id v14 = [v5 cloudGUID];
      id v15 = [v13 predicateWithFormat:@"((entryTypeNumber = %d) OR (entryTypeNumber = %d) OR (entryTypeNumber = %d)) AND (entryAlbumGUID = %@)", 3, 4, 7, v14];
      [v12 setPredicate:v15];

      id v16 = [v9 executeFetchRequest:v12 error:0];
      __int16 v17 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        id v18 = [v5 cloudGUID];
        *(_DWORD *)buf = 138412546;
        int v24 = v18;
        __int16 v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "albumGUID=%@ cloudFeedEntries=%@", buf, 0x16u);
      }
      if ([v16 count]) {
        [(PLDelayedSaveActions *)self _recordDelayedCloudFeedDeletionEntries:v16];
      }
    }
    goto LABEL_20;
  }
  if (![v5 isInserted])
  {
    if (![v5 isUpdated]) {
      goto LABEL_21;
    }
    id v9 = [v5 changedValues];
    __int16 v19 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int v20 = [v9 allKeys];
      *(_DWORD *)buf = 138412290;
      int v24 = v20;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "changedValues=%@", buf, 0xCu);
    }
    __int16 v21 = [v9 objectForKeyedSubscript:@"cloudRelationshipState"];
    if (v21
      || ([v9 objectForKeyedSubscript:@"cloudRelationshipStateLocal"],
          (__int16 v21 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([v9 objectForKeyedSubscript:@"cloudSubscriptionDate"],
          (__int16 v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      int v22 = [v9 objectForKeyedSubscript:@"cloudMultipleContributorsEnabled"];

      if (!v22) {
        goto LABEL_20;
      }
    }
    [(PLDelayedSaveActions *)self _recordDelayedCloudFeedAlbumUpdate:v5];
LABEL_20:

    goto LABEL_21;
  }
  [(PLDelayedSaveActions *)self _recordDelayedCloudFeedAlbumUpdate:v5];
LABEL_21:
}

- (void)_recordDelayedCloudFeedInvitationRecordUpdate:(id)a3
{
  id v4 = a3;
  delayedCloudFeedInvitationRecordUpdates = self->_delayedCloudFeedInvitationRecordUpdates;
  id v8 = v4;
  if (!delayedCloudFeedInvitationRecordUpdates)
  {
    uint64_t v6 = (NSMutableArray *)objc_opt_new();
    uint64_t v7 = self->_delayedCloudFeedInvitationRecordUpdates;
    self->_delayedCloudFeedInvitationRecordUpdates = v6;

    id v4 = v8;
    delayedCloudFeedInvitationRecordUpdates = self->_delayedCloudFeedInvitationRecordUpdates;
  }
  [(NSMutableArray *)delayedCloudFeedInvitationRecordUpdates addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeCloudFeed"];
}

- (void)_recordDelayedCloudFeedCommentInsert:(id)a3
{
  id v4 = a3;
  delayedCloudFeedCommentInserts = self->_delayedCloudFeedCommentInserts;
  id v8 = v4;
  if (!delayedCloudFeedCommentInserts)
  {
    uint64_t v6 = (NSMutableArray *)objc_opt_new();
    uint64_t v7 = self->_delayedCloudFeedCommentInserts;
    self->_delayedCloudFeedCommentInserts = v6;

    id v4 = v8;
    delayedCloudFeedCommentInserts = self->_delayedCloudFeedCommentInserts;
  }
  [(NSMutableArray *)delayedCloudFeedCommentInserts addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeCloudFeed"];
}

- (void)_recordDelayedCloudFeedAssetUpdate:(id)a3
{
  id v4 = a3;
  delayedCloudFeedAssetUpdates = self->_delayedCloudFeedAssetUpdates;
  id v8 = v4;
  if (!delayedCloudFeedAssetUpdates)
  {
    uint64_t v6 = (NSMutableArray *)objc_opt_new();
    uint64_t v7 = self->_delayedCloudFeedAssetUpdates;
    self->_delayedCloudFeedAssetUpdates = v6;

    id v4 = v8;
    delayedCloudFeedAssetUpdates = self->_delayedCloudFeedAssetUpdates;
  }
  [(NSMutableArray *)delayedCloudFeedAssetUpdates addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeCloudFeed"];
}

- (void)_recordDelayedCloudFeedAssetInsert:(id)a3
{
  id v4 = a3;
  delayedCloudFeedAssetInserts = self->_delayedCloudFeedAssetInserts;
  id v8 = v4;
  if (!delayedCloudFeedAssetInserts)
  {
    uint64_t v6 = (NSMutableArray *)objc_opt_new();
    uint64_t v7 = self->_delayedCloudFeedAssetInserts;
    self->_delayedCloudFeedAssetInserts = v6;

    id v4 = v8;
    delayedCloudFeedAssetInserts = self->_delayedCloudFeedAssetInserts;
  }
  [(NSMutableArray *)delayedCloudFeedAssetInserts addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeCloudFeed"];
}

- (void)_recordDelayedCloudFeedDeletionEntries:(id)a3
{
  id v4 = a3;
  delayedCloudFeedDeletionEntries = self->_delayedCloudFeedDeletionEntries;
  id v8 = v4;
  if (!delayedCloudFeedDeletionEntries)
  {
    uint64_t v6 = (NSMutableSet *)objc_opt_new();
    uint64_t v7 = self->_delayedCloudFeedDeletionEntries;
    self->_delayedCloudFeedDeletionEntries = v6;

    id v4 = v8;
    delayedCloudFeedDeletionEntries = self->_delayedCloudFeedDeletionEntries;
  }
  [(NSMutableSet *)delayedCloudFeedDeletionEntries addObjectsFromArray:v4];
  if ([v8 count]) {
    [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeCloudFeed"];
  }
}

- (void)_recordDelayedCloudFeedAlbumUpdate:(id)a3
{
  id v4 = a3;
  delayedCloudFeedAlbumUpdates = self->_delayedCloudFeedAlbumUpdates;
  id v8 = v4;
  if (!delayedCloudFeedAlbumUpdates)
  {
    uint64_t v6 = (NSMutableArray *)objc_opt_new();
    uint64_t v7 = self->_delayedCloudFeedAlbumUpdates;
    self->_delayedCloudFeedAlbumUpdates = v6;

    id v4 = v8;
    delayedCloudFeedAlbumUpdates = self->_delayedCloudFeedAlbumUpdates;
  }
  [(NSMutableArray *)delayedCloudFeedAlbumUpdates addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeCloudFeed"];
}

- (void)_popDelayedMomentInsertsAndUpdates:(id *)a3 deletes:(id *)a4 updatedAssetIDsForHighlights:(id *)a5 updatedMomentIDsForHighlights:(id *)a6 sharedAssetContainerIncrementalChanges:(id *)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v13 = [(NSMutableArray *)self->_delayedMomentAssetUpdates valueForKey:@"objectID"];
    *a3 = v13;
  }
  [(NSMutableArray *)self->_delayedMomentAssetUpdates removeAllObjects];
  if (a4)
  {
    id v14 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([(NSMapTable *)self->_delayedMomentAssetDeletions count])
    {
      uint64_t v33 = a6;
      v34 = a7;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v15 = self->_delayedMomentAssetDeletions;
      uint64_t v16 = [(NSMapTable *)v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v38 != v18) {
              objc_enumerationMutation(v15);
            }
            int v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            __int16 v21 = [(NSMapTable *)self->_delayedMomentAssetDeletions objectForKey:v20];
            int v22 = [v20 objectID];
            [v14 setObject:v21 forKey:v22];
          }
          uint64_t v17 = [(NSMapTable *)v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v17);
      }

      a6 = v33;
      a7 = v34;
    }
    id v23 = v14;
    *a4 = v23;
  }
  [(NSMapTable *)self->_delayedMomentAssetDeletions removeAllObjects];
  if (a5)
  {
    int v24 = [(NSMutableSet *)self->_delayedHighlightAssetUpdates allObjects];
    __int16 v25 = [v24 valueForKey:@"objectID"];

    id v26 = v25;
    *a5 = v26;
  }
  [(NSMutableSet *)self->_delayedHighlightAssetUpdates removeAllObjects];
  if (a6)
  {
    __int16 v27 = [(NSMutableSet *)self->_delayedHighlightMomentUpdates allObjects];
    int v28 = [v27 valueForKey:@"objectID"];

    id v29 = v28;
    *a6 = v29;
  }
  [(NSMutableSet *)self->_delayedHighlightMomentUpdates removeAllObjects];
  if (a7)
  {
    int v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID, "count"));
    delayedSharedAssetIncrementalChangeContainersByAssetUUID = self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __165__PLDelayedSaveActions__popDelayedMomentInsertsAndUpdates_deletes_updatedAssetIDsForHighlights_updatedMomentIDsForHighlights_sharedAssetContainerIncrementalChanges___block_invoke;
    v35[3] = &unk_1E5872FB8;
    id v36 = v30;
    id v32 = v30;
    [(NSMutableDictionary *)delayedSharedAssetIncrementalChangeContainersByAssetUUID enumerateKeysAndObjectsUsingBlock:v35];
    *a7 = (id)[v32 copy];
  }
  [(NSMutableDictionary *)self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID removeAllObjects];
}

void __165__PLDelayedSaveActions__popDelayedMomentInsertsAndUpdates_deletes_updatedAssetIDsForHighlights_updatedMomentIDsForHighlights_sharedAssetContainerIncrementalChanges___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v8 = [v4 change];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v4 asset];

  uint64_t v7 = [v6 objectID];
  [v5 setObject:v8 forKeyedSubscript:v7];
}

- (void)recordMomentForHighlightUpdate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLMomentsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v4 objectID];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Recording moment %@ for highlight update", (uint8_t *)&v7, 0xCu);
  }
  [(PLDelayedSaveActions *)self _recordDelayedHighlightMomentUpdates:v4];
}

- (void)recordAdditionalAssetAttributesForMomentUpdate:(id)a3
{
  id v9 = a3;
  id v4 = [v9 changedValues];
  id v5 = [v4 objectForKeyedSubscript:@"timeZoneOffset"];
  if (v5)
  {
  }
  else
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"timeZoneName"];

    if (!v6) {
      goto LABEL_7;
    }
  }
  int v7 = [v9 asset];
  id v8 = +[PLMoment predicateForAssetsIncludedInMoments];
  if ([v8 evaluateWithObject:v7]) {
    [(PLDelayedSaveActions *)self _recordDelayedMomentAssetUpdates:v7];
  }

LABEL_7:
}

- (void)recordAssetForMomentUpdate:(id)a3
{
  v87[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isIncludedInMoments])
  {
    if ([v4 isInserted]) {
      int v80 = [v4 isInFlight] ^ 1;
    }
    else {
      int v80 = 0;
    }
    int v7 = [v4 isUpdated];
    int v8 = [v4 isDeleted];
    int v9 = [v4 needsMomentUpdate];
    id v5 = [v4 photoLibrary];
    id v10 = [v4 changedValues];
    id v11 = objc_alloc_init(PLSharedAssetsContainerIncrementalChange);
    -[PLSharedAssetsContainerIncrementalChange setMediaType:](v11, "setMediaType:", [v4 kind] != 0);
    v81 = v10;
    if ((v7 & 1) == 0 && !v8) {
      goto LABEL_31;
    }
    uint64_t v12 = [v5 libraryServicesManager];
    id v13 = [v12 databaseContext];
    id v14 = [v13 momentLibrary];

    if (v5 == v14) {
      goto LABEL_49;
    }
    id v10 = v81;
    [(id)objc_opt_class() _addHighlightRelationshipChangesFromChangedValues:v81 onAsset:v4 intoChange:v11 forRelationshipNamed:@"highlightBeingAssets"];
    [(id)objc_opt_class() _addHighlightRelationshipChangesFromChangedValues:v81 onAsset:v4 intoChange:v11 forRelationshipNamed:@"highlightBeingExtendedAssets"];
    [(id)objc_opt_class() _addHighlightRelationshipChangesFromChangedValues:v81 onAsset:v4 intoChange:v11 forRelationshipNamed:@"highlightBeingSummaryAssets"];
    [(id)objc_opt_class() _addHighlightRelationshipChangesFromChangedValues:v81 onAsset:v4 intoChange:v11 forRelationshipNamed:@"dayGroupHighlightBeingAssets"];
    [(id)objc_opt_class() _addHighlightRelationshipChangesFromChangedValues:v81 onAsset:v4 intoChange:v11 forRelationshipNamed:@"dayGroupHighlightBeingExtendedAssets"];
    [(id)objc_opt_class() _addHighlightRelationshipChangesFromChangedValues:v81 onAsset:v4 intoChange:v11 forRelationshipNamed:@"dayGroupHighlightBeingSummaryAssets"];
    id v15 = [(PLSharedAssetsContainerIncrementalChange *)v11 highlightContainerChanges];
    uint64_t v16 = [v15 count];

    if (!v16)
    {
LABEL_31:
      if (!v7) {
        goto LABEL_50;
      }
      goto LABEL_32;
    }
    if (v8)
    {
      v87[0] = @"libraryScope";
      v87[1] = @"additionalAttributes";
      v87[2] = @"libraryScopeShareState";
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:3];
      uint64_t v18 = [v4 committedValuesForKeys:v17];

      __int16 v19 = [v18 objectForKey:@"libraryScope"];
      int v20 = [MEMORY[0x1E4F1CA98] null];
      int v21 = [v19 isEqual:v20];
      if (v19) {
        int v22 = v21;
      }
      else {
        int v22 = 1;
      }
      int v76 = v22;

      id v74 = v18;
      id v23 = [v18 objectForKey:@"libraryScopeShareState"];
      int v24 = [MEMORY[0x1E4F1CA98] null];
      if ([v23 isEqual:v24])
      {
        uint64_t v25 = 2;
LABEL_45:

        int v9 = 1;
        if (v76) {
          uint64_t v36 = 2;
        }
        else {
          uint64_t v36 = 1;
        }
        [(PLSharedAssetsContainerIncrementalChange *)v11 setSharingChange:v36];
        [(PLSharedAssetsContainerIncrementalChange *)v11 setSuggestionStateChange:v25];

LABEL_49:
        id v10 = v81;
        if (!v7)
        {
LABEL_50:
          BOOL v32 = 0;
          if (!v8) {
            goto LABEL_51;
          }
          goto LABEL_98;
        }
LABEL_32:
        __int16 v31 = [v10 objectForKeyedSubscript:@"dateCreated"];
        if (v31)
        {
          BOOL v32 = 1;
        }
        else
        {
          int v77 = v9;
          uint64_t v33 = [v10 objectForKeyedSubscript:@"locationData"];
          if (v33)
          {
            BOOL v32 = 1;
          }
          else
          {
            v34 = [v10 objectForKeyedSubscript:@"visibilityState"];
            if (v34)
            {
              BOOL v32 = 1;
            }
            else
            {
              v35 = [v10 objectForKeyedSubscript:@"hidden"];
              if (v35)
              {
                BOOL v32 = 1;
              }
              else
              {
                v57 = [v10 objectForKeyedSubscript:@"trashedState"];
                if (v57)
                {
                  BOOL v32 = 1;
                }
                else
                {
                  v61 = [v10 objectForKeyedSubscript:@"savedAssetType"];
                  BOOL v32 = v61 != 0;

                  v57 = 0;
                }

                v35 = 0;
              }

              v34 = 0;
            }
          }
          id v10 = v81;
          int v9 = v77;
        }

        if (!v8)
        {
LABEL_51:
          int v37 = v80;
          if ((v80 | v7 | v9) != 1)
          {
LABEL_111:
            if ([(PLSharedAssetsContainerIncrementalChange *)v11 hasChanges])
            {
              [(PLSharedAssetsContainerIncrementalChange *)v11 setHasNoOtherAssetChangesRequiringMomentGeneration:!v32];
              [(PLDelayedSaveActions *)self _recordSharedAssetIncrementalChange:v11 forAsset:v4];
              v70 = [v4 photoLibrary];
              v71 = [v70 libraryServicesManager];

              if ([v71 wellKnownPhotoLibraryIdentifier] == 1)
              {
                v72 = [v71 backgroundJobService];
                v73 = [v71 libraryBundle];
                [v72 signalBackgroundProcessingNeededOnBundle:v73];
              }
            }

            goto LABEL_116;
          }
          if (!v7)
          {
LABEL_88:
            if ((v9 | v37 | v32) == 1)
            {
              v58 = PLMomentsGetLog();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
              {
                [v4 objectID];
                v60 = BOOL v59 = v32;
                *(_DWORD *)buf = 138412290;
                v85 = v60;
                _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_DEBUG, "Adding asset %@ to be updated in moments", buf, 0xCu);

                BOOL v32 = v59;
              }

              [(PLDelayedSaveActions *)self _recordDelayedMomentAssetUpdates:v4];
            }
            goto LABEL_111;
          }
          long long v38 = [(PLSharedAssetsContainerIncrementalChange *)v11 highlightContainerChanges];
          if (![v38 count])
          {
            BOOL v78 = v32;
            long long v39 = self;
            long long v40 = [v10 objectForKeyedSubscript:@"libraryScope"];

            if (!v40)
            {
              self = v39;
LABEL_62:
              v46 = [(PLSharedAssetsContainerIncrementalChange *)v11 highlightContainerChanges];
              if ([v46 count])
              {
LABEL_87:

                goto LABEL_88;
              }
              v47 = v10;
              v48 = self;
              v49 = [v47 objectForKeyedSubscript:@"libraryScopeShareState"];

              if (!v49)
              {
                self = v48;
                id v10 = v81;
                goto LABEL_88;
              }
              v82 = @"libraryScopeShareState";
              v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
              v46 = [v4 committedValuesForKeys:v50];

              v51 = [v46 objectForKey:@"libraryScopeShareState"];
              uint64_t v52 = [v51 integerValue];
              if (v52 > 65537)
              {
                if (v52 != 65538)
                {
                  BOOL v53 = v52 == 65552;
                  goto LABEL_71;
                }
              }
              else if (v52 != 2)
              {
                BOOL v53 = v52 == 16;
LABEL_71:
                self = v48;
                int v54 = v53;
                goto LABEL_73;
              }
              self = v48;
              int v54 = 1;
LABEL_73:
              uint64_t v55 = [v4 libraryScopeShareState];
              id v10 = v81;
              if (v55 > 65537)
              {
                if (v55 != 65552 && v55 != 65538)
                {
LABEL_83:
                  if (v54)
                  {
                    uint64_t v56 = 2;
                    goto LABEL_85;
                  }
                  goto LABEL_86;
                }
              }
              else if (v55 != 2 && v55 != 16)
              {
                goto LABEL_83;
              }
              if ((v54 & 1) == 0)
              {
                uint64_t v56 = 1;
LABEL_85:
                [(PLSharedAssetsContainerIncrementalChange *)v11 setSuggestionStateChange:v56];
                int v9 = 1;
              }
LABEL_86:

              int v37 = v80;
              goto LABEL_87;
            }
            v83 = @"libraryScope";
            v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
            long long v38 = [v4 committedValuesForKeys:v41];

            uint64_t v42 = [v38 objectForKey:@"libraryScope"];
            v43 = [MEMORY[0x1E4F1CA98] null];
            LODWORD(v41) = (v42 != 0) & ~[v42 isEqual:v43];

            int v44 = [v4 hasLibraryScope];
            if (v41 != v44)
            {
              int v9 = 1;
              if (v44) {
                uint64_t v45 = 1;
              }
              else {
                uint64_t v45 = 2;
              }
              [(PLSharedAssetsContainerIncrementalChange *)v11 setSharingChange:v45];
            }

            self = v39;
            int v37 = v80;
            BOOL v32 = v78;
          }

          goto LABEL_62;
        }
LABEL_98:
        v62 = [v4 managedObjectContext];
        if (([v62 hasPreviouslyMergedDeleteForObject:v4] & 1) == 0)
        {
          BOOL v79 = v32;
          v86[0] = @"dateCreated";
          v86[1] = @"locationData";
          v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
          v64 = [v4 committedValuesForKeys:v63];

          v65 = [v64 objectForKeyedSubscript:@"dateCreated"];
          v66 = [v64 objectForKeyedSubscript:@"locationData"];
          v67 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
          if (v65)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              [v67 setObject:v65 forKeyedSubscript:@"dateCreated"];
            }
          }
          if (v66)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              [v67 setObject:v66 forKeyedSubscript:@"locationData"];
            }
          }
          if ([v67 count])
          {
            v68 = PLMomentsGetLog();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
            {
              [v4 objectID];
              v69 = v75 = self;
              *(_DWORD *)buf = 138412290;
              v85 = v69;
              _os_log_impl(&dword_19B3C7000, v68, OS_LOG_TYPE_DEBUG, "Removing asset %@ from moments", buf, 0xCu);

              self = v75;
            }

            [(PLSharedAssetsContainerIncrementalChange *)v11 setCollectionChangeType:2];
            [(PLDelayedSaveActions *)self _recordDelayedMomentAssetDeletionsDictionary:v67 forKey:v4];
          }

          id v10 = v81;
          BOOL v32 = v79;
        }

        goto LABEL_111;
      }
      uint64_t v29 = [v23 integerValue];
      if (v29 > 65537)
      {
        if (v29 != 65538)
        {
          BOOL v30 = v29 == 65552;
LABEL_42:
          uint64_t v25 = 1;
          if (!v30) {
            uint64_t v25 = 2;
          }
          goto LABEL_45;
        }
      }
      else if (v29 != 2)
      {
        BOOL v30 = v29 == 16;
        goto LABEL_42;
      }
      uint64_t v25 = 1;
      goto LABEL_45;
    }
    uint64_t v26 = 1;
    if ([v4 hasLibraryScope]) {
      uint64_t v27 = 1;
    }
    else {
      uint64_t v27 = 2;
    }
    [(PLSharedAssetsContainerIncrementalChange *)v11 setSharingChange:v27];
    uint64_t v28 = [v4 libraryScopeShareState];
    if (v28 > 65537)
    {
      if (v28 == 65538 || v28 == 65552) {
        goto LABEL_30;
      }
    }
    else if (v28 == 2 || v28 == 16)
    {
      goto LABEL_30;
    }
    uint64_t v26 = 2;
LABEL_30:
    [(PLSharedAssetsContainerIncrementalChange *)v11 setSuggestionStateChange:v26];
    int v9 = 1;
    goto LABEL_31;
  }
  id v5 = PLMomentsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v4 objectID];
    *(_DWORD *)buf = 138412290;
    v85 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Ignoring update for asset %@", buf, 0xCu);
  }
LABEL_116:

  if ([v4 needsMomentUpdate]) {
    [v4 setNeedsMomentUpdate:0];
  }
}

- (void)_recordSharedAssetIncrementalChange:(id)a3 forAsset:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v13 hasChanges])
  {
    if (!self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID)
    {
      int v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      delayedSharedAssetIncrementalChangeContainersByAssetUUID = self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID;
      self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID = v7;
    }
    int v9 = [v6 uuid];
    if (v9)
    {
      id v10 = [(PLDelayedSaveActions *)self _existingSharedAssetChangeContainerForAsset:v6];
      id v11 = v10;
      if (v10)
      {
        uint64_t v12 = [v10 change];
        [(PLSharedAssetsContainerIncrementalChangeContainer *)v12 mergeChangesFrom:v13];
      }
      else
      {
        uint64_t v12 = [[PLSharedAssetsContainerIncrementalChangeContainer alloc] initWithAsset:v6 change:v13];
        [(NSMutableDictionary *)self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID setObject:v12 forKeyedSubscript:v9];
      }
    }
  }
}

- (id)_existingSharedAssetChangeContainerForAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuid];
  if (v5)
  {
    delayedSharedAssetIncrementalChangeContainersByAssetUUID = self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID;
    int v7 = [v4 uuid];
    int v8 = [(NSMutableDictionary *)delayedSharedAssetIncrementalChangeContainersByAssetUUID objectForKeyedSubscript:v7];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)_recordDelayedHighlightMomentUpdates:(id)a3
{
  id v4 = a3;
  delayedHighlightMomentUpdates = self->_delayedHighlightMomentUpdates;
  id v8 = v4;
  if (!delayedHighlightMomentUpdates)
  {
    id v6 = (NSMutableSet *)objc_opt_new();
    int v7 = self->_delayedHighlightMomentUpdates;
    self->_delayedHighlightMomentUpdates = v6;

    id v4 = v8;
    delayedHighlightMomentUpdates = self->_delayedHighlightMomentUpdates;
  }
  [(NSMutableSet *)delayedHighlightMomentUpdates addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeMomentGeneration"];
}

- (void)_recordDelayedMomentAssetUpdates:(id)a3
{
  id v4 = a3;
  delayedMomentAssetUpdates = self->_delayedMomentAssetUpdates;
  id v8 = v4;
  if (!delayedMomentAssetUpdates)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    int v7 = self->_delayedMomentAssetUpdates;
    self->_delayedMomentAssetUpdates = v6;

    id v4 = v8;
    delayedMomentAssetUpdates = self->_delayedMomentAssetUpdates;
  }
  [(NSMutableArray *)delayedMomentAssetUpdates addObject:v4];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeMomentGeneration"];
}

- (void)_recordDelayedMomentAssetDeletionsDictionary:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  delayedMomentAssetDeletions = self->_delayedMomentAssetDeletions;
  if (!delayedMomentAssetDeletions)
  {
    id v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    int v9 = self->_delayedMomentAssetDeletions;
    self->_delayedMomentAssetDeletions = v8;

    delayedMomentAssetDeletions = self->_delayedMomentAssetDeletions;
  }
  [(NSMapTable *)delayedMomentAssetDeletions setObject:v10 forKey:v6];
  [(PLDelayedSaveActions *)self persistDelayedActionsScope:@"PLTransactionScopeMomentGeneration"];
}

- (void)_popImportSessionCountChangesIntoDetail:(id)a3
{
  id v6 = 0;
  id v4 = a3;
  [(PLDelayedSaveActions *)self _popDelayedImportSessionCountsAndDateRangeUpdates:&v6];
  id v5 = v6;
  [v4 setImportSessionCountsAndDateRangeUpdates:v5];
}

- (void)_popAlbumKeyAssetsChangesIntoDetail:(id)a3
{
  id v6 = 0;
  id v4 = a3;
  [(PLDelayedSaveActions *)self _popDelayedAlbumKeyAssetsUpdates:&v6];
  id v5 = v6;
  [v4 setAlbumKeyAssetsUpdates:v5];
}

- (void)_popAlbumCountChangesIntoDetail:(id)a3
{
  id v6 = 0;
  id v4 = a3;
  [(PLDelayedSaveActions *)self _popDelayedAlbumCountsAndDateRangeUpdates:&v6];
  id v5 = v6;
  [v4 setAlbumCountsAndDateRangeUpdates:v5];
}

- (void)_popSearchIndexChangesIntoDetail:(id)a3
{
  id v6 = 0;
  id v4 = a3;
  [(PLDelayedSaveActions *)self _popDelayedSearchIndexUpdates:&v6];
  id v5 = v6;
  [v4 setSearchIndexUpdates:v5];
}

- (void)_popAssetsForFilesystemPersistencyChangesIntoDetail:(id)a3
{
  id v6 = 0;
  id v4 = a3;
  [(PLDelayedSaveActions *)self _popDelayedAssetsForFilesystemPersistencyUpdates:&v6];
  id v5 = v6;
  [v4 setAssetsForFilesystemPersistency:v5];
}

- (void)_popMomentChangesIntoDetail:(id)a3
{
  id v13 = 0;
  id v14 = 0;
  id v11 = 0;
  id v12 = 0;
  id v10 = 0;
  id v4 = a3;
  [(PLDelayedSaveActions *)self _popDelayedMomentInsertsAndUpdates:&v14 deletes:&v13 updatedAssetIDsForHighlights:&v12 updatedMomentIDsForHighlights:&v11 sharedAssetContainerIncrementalChanges:&v10];
  id v5 = v14;
  id v6 = v13;
  id v7 = v12;
  id v8 = v11;
  id v9 = v10;
  [v4 setMomentInsertsAndUpdates:v5];
  [v4 setMomentDeletes:v6];
  [v4 setUpdatedAssetIDsForHighlights:v7];
  [v4 setUpdatedMomentIDsForHighlights:v8];
  [v4 setSharedAssetContainerIncrementalChangesByAssetID:v9];
}

- (void)_popCloudFeedChangesIntoDetail:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v21 = 0;
  id v22 = 0;
  id v19 = 0;
  id v20 = 0;
  id v17 = 0;
  id v18 = 0;
  id v4 = a3;
  [(PLDelayedSaveActions *)self _popDelayedCloudFeedAlbumUpdates:&v22 assetInserts:&v21 assetUpdates:&v20 commentInserts:&v19 invitationRecordUpdates:&v18 deletionEntries:&v17];
  id v5 = v22;
  id v6 = v21;
  id v7 = v20;
  id v8 = v19;
  id v9 = v18;
  id v10 = v17;
  [v4 setCloudFeedAlbumUpdates:v5];
  [v4 setCloudFeedAssetInserts:v6];
  [v4 setCloudFeedAssetUpdates:v7];
  [v4 setCloudFeedCommentInserts:v8];
  [v4 setCloudFeedInvitationRecordUpdates:v9];
  [v4 setCloudFeedDeletionEntries:v10];

  id v11 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v5;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "cloudFeedAlbumUpdates=%@", buf, 0xCu);
  }

  id v12 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "cloudFeedAssetInserts=%@", buf, 0xCu);
  }

  id v13 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v7;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "cloudFeedAssetUpdates=%@", buf, 0xCu);
  }

  id v14 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "cloudFeedCommentInserts=%@", buf, 0xCu);
  }

  id v15 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v9;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "cloudFeedInvitationRecordUpdates=%@", buf, 0xCu);
  }

  uint64_t v16 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v10;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "cloudFeedDeletionEntries=%@", buf, 0xCu);
  }
}

- (id)popDelayedSaveActionsDetail
{
  v3 = objc_alloc_init(PLDelayedSaveActionsDetail);
  [(PLDelayedSaveActions *)self _popCloudFeedChangesIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popMomentChangesIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popAssetsForFilesystemPersistencyChangesIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popSearchIndexChangesIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popAlbumCountChangesIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popAlbumKeyAssetsChangesIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popImportSessionCountChangesIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popDuetDeletedAssetsIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popDuetDeletedMemoriesIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popWidgetTimelineReloadNeeded:v3];
  [(PLDelayedSaveActions *)self _popWidgetUserAlbumAssetRemovalReloadNeeded:v3];
  [(PLDelayedSaveActions *)self _popWidgetFavoriteAlbumAssetRemovalReloadNeeded:v3];
  [(PLDelayedSaveActions *)self _popWallpaperUserAlbumAssetRemovalReloadNeeded:v3];
  [(PLDelayedSaveActions *)self _popWallpaperFavoriteAlbumAssetRemovalReloadNeeded:v3];
  [(PLDelayedSaveActions *)self _popFeaturedContentUpdateNeededForPerson:v3];
  [(PLDelayedSaveActions *)self _popMemoryAssetUpdateIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popWallpaperSuggestionReloadIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popLibraryScopeParticipantsUpdateIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popLibraryScopeRulesUpdatedIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popMemberIDsOfGroupNeedingContainmentUpdateIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popAssetIDsNeedingSocialGroupContainmentUpdateIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popAssetIDsByPersonUUIDNeedingSocialGroupContainmentUpdateIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popAssetIDsNeedingAssetPersonEdgeUpdateIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popSocialGroupNodeIDsNeedingDeduplicationIntoDetail:v3];
  [(PLDelayedSaveActions *)self _popMembersOfGroupsNeedingDeduplicationIntoDetail:v3];
  return v3;
}

- (void)persistDelayedActionsScope:(id)a3
{
  id v4 = a3;
  id v6 = [(PLDelayedSaveActions *)self clientTransaction];
  id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];

  [v6 addChangeScopes:v5];
}

- (PLDelayedSaveActions)initWithClientTransaction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLDelayedSaveActions;
  id v6 = [(PLDelayedSaveActions *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientTransaction, a3);
  }

  return v7;
}

+ (void)_addHighlightRelationshipChangesFromChangedValues:(id)a3 onAsset:(id)a4 intoChange:(id)a5 forRelationshipNamed:(id)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [a3 objectForKeyedSubscript:v12];

  if (v13)
  {
    v20[0] = v12;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v15 = [v10 committedValuesForKeys:v14];

    uint64_t v16 = [v15 objectForKey:v12];
    id v17 = [MEMORY[0x1E4F1CA98] null];
    if ([v16 isEqual:v17])
    {
      id v18 = 0;
    }
    else
    {
      id v18 = [v15 objectForKey:v12];
    }

    id v19 = [v10 valueForKey:v12];
    [a1 _checkForHighlightChangesOnToOneRelationshipNamed:v12 andAddIntoChange:v11 givenOldValue:v18 andNewValue:v19];
  }
}

+ (void)_checkForHighlightChangesOnToManyRelationshipNamed:(id)a3 andAddIntoChange:(id)a4 givenOldValue:(id)a5 andNewValue:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (([v11 isEqualToSet:v12] & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F1CA80] setWithSet:v11];
    [v13 minusSet:v12];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [*(id *)(*((void *)&v31 + 1) + 8 * v18) objectID];
          [v10 addHighlightContainerChange:v9 sourceHighlightID:v19 destinationHighlightID:0];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v16);
    }

    id v20 = [MEMORY[0x1E4F1CA80] setWithSet:v12];
    [v20 minusSet:v11];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v25), "objectID", (void)v27);
          [v10 addHighlightContainerChange:v9 sourceHighlightID:0 destinationHighlightID:v26];

          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v23);
    }
  }
}

+ (void)_checkForHighlightChangesOnToOneRelationshipNamed:(id)a3 andAddIntoChange:(id)a4 givenOldValue:(id)a5 andNewValue:(id)a6
{
  if ((a5 == 0) == (a6 != 0))
  {
    id v10 = a6;
    id v11 = a4;
    id v12 = a3;
    id v14 = [a5 objectID];
    id v13 = [v10 objectID];

    [v11 addHighlightContainerChange:v12 sourceHighlightID:v14 destinationHighlightID:v13];
  }
}

@end