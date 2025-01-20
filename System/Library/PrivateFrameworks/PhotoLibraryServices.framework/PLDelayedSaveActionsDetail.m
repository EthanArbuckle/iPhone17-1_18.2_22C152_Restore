@interface PLDelayedSaveActionsDetail
+ (BOOL)supportsSecureCoding;
+ (id)_decodeAssetIDsByPersonUUIDNeedingContainmentUpdates:(id)a3 urlToObjectID:(id)a4;
+ (id)_decodeAssetsForWallpaperUserAlbumRemoval:(id)a3 urlToObjectID:(id)a4;
+ (id)_decodeAssetsForWidgetUserAlbumRemoval:(id)a3 urlToObjectID:(id)a4;
+ (id)_decodeMomentDeletes:(id)a3 urlToObjectID:(id)a4;
+ (id)_decodeSharedAssetContainerIncrementalChanges:(id)a3 urlToObjectID:(id)a4;
- (BOOL)libraryScopeRulesUpdated;
- (BOOL)shouldHandleMoments;
- (BOOL)shouldUpdateFeaturedContent;
- (NSArray)assetsForFilesystemPersistency;
- (NSArray)cloudFeedAlbumUpdates;
- (NSArray)cloudFeedAssetInserts;
- (NSArray)cloudFeedAssetUpdates;
- (NSArray)cloudFeedCommentInserts;
- (NSArray)cloudFeedDeletionEntries;
- (NSArray)cloudFeedInvitationRecordUpdates;
- (NSArray)momentInsertsAndUpdates;
- (NSArray)updatedAssetIDsForHighlights;
- (NSArray)updatedMomentIDsForHighlights;
- (NSDictionary)assetIDsByPersonUUIDNeedingContainmentUpdates;
- (NSDictionary)assetsForWallpaperUserAlbumRemoval;
- (NSDictionary)assetsForWidgetUserAlbumRemoval;
- (NSDictionary)momentDeletes;
- (NSDictionary)searchIndexUpdates;
- (NSDictionary)sharedAssetContainerIncrementalChangesByAssetID;
- (NSSet)albumCountsAndDateRangeUpdates;
- (NSSet)albumKeyAssetsUpdates;
- (NSSet)assetIDsNeedingAssetPersonEdgeUpdates;
- (NSSet)assetIDsNeedingContainmentUpdates;
- (NSSet)assetsForDuetDelete;
- (NSSet)assetsForWallpaperFavoriteAlbumRemoval;
- (NSSet)assetsForWidgetFavoriteAlbumRemoval;
- (NSSet)importSessionCountsAndDateRangeUpdates;
- (NSSet)libraryScopeParticipantsForUpdate;
- (NSSet)memberIDsOfSocialGroupsNeedingContainmentUpdates;
- (NSSet)memberIDsOfSocialGroupsNeedingDeduplication;
- (NSSet)memoriesForAssetUpdate;
- (NSSet)memoriesForDuetDelete;
- (NSSet)personsToUpdateForFeaturedContent;
- (NSSet)socialGroupNodeIDsNeedingDeduplication;
- (NSSet)wallpaperSuggestionReloadUUIDs;
- (NSSet)widgetTimelineReloadTypesNeeded;
- (PLDelayedSaveActionsDetail)init;
- (PLDelayedSaveActionsDetail)initWithCoder:(id)a3;
- (id)_encodableAssetIDsByPersonUUIDNeedingContainmentUpdates;
- (id)_encodableAssetsForWallpaperUserAlbumRemoval;
- (id)_encodableAssetsForWidgetUserAlbumRemoval;
- (id)_encodableMomentDeletes;
- (id)_encodableSharedAssetContainerIncrementalChanges;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumCountsAndDateRangeUpdates:(id)a3;
- (void)setAlbumKeyAssetsUpdates:(id)a3;
- (void)setAssetIDsByPersonUUIDNeedingContainmentUpdates:(id)a3;
- (void)setAssetIDsNeedingAssetPersonEdgeUpdates:(id)a3;
- (void)setAssetIDsNeedingContainmentUpdates:(id)a3;
- (void)setAssetsForDuetDelete:(id)a3;
- (void)setAssetsForFilesystemPersistency:(id)a3;
- (void)setAssetsForWallpaperFavoriteAlbumRemoval:(id)a3;
- (void)setAssetsForWallpaperUserAlbumRemoval:(id)a3;
- (void)setAssetsForWidgetFavoriteAlbumRemoval:(id)a3;
- (void)setAssetsForWidgetUserAlbumRemoval:(id)a3;
- (void)setCloudFeedAlbumUpdates:(id)a3;
- (void)setCloudFeedAssetInserts:(id)a3;
- (void)setCloudFeedAssetUpdates:(id)a3;
- (void)setCloudFeedCommentInserts:(id)a3;
- (void)setCloudFeedDeletionEntries:(id)a3;
- (void)setCloudFeedInvitationRecordUpdates:(id)a3;
- (void)setImportSessionCountsAndDateRangeUpdates:(id)a3;
- (void)setLibraryScopeParticipantsForUpdate:(id)a3;
- (void)setLibraryScopeRulesUpdated:(BOOL)a3;
- (void)setMemberIDsOfSocialGroupsNeedingContainmentUpdates:(id)a3;
- (void)setMemberIDsOfSocialGroupsNeedingDeduplication:(id)a3;
- (void)setMemoriesForAssetUpdate:(id)a3;
- (void)setMemoriesForDuetDelete:(id)a3;
- (void)setMomentDeletes:(id)a3;
- (void)setMomentInsertsAndUpdates:(id)a3;
- (void)setPersonsToUpdateForFeaturedContent:(id)a3;
- (void)setSearchIndexUpdates:(id)a3;
- (void)setSharedAssetContainerIncrementalChangesByAssetID:(id)a3;
- (void)setShouldUpdateFeaturedContent:(BOOL)a3;
- (void)setSocialGroupNodeIDsNeedingDeduplication:(id)a3;
- (void)setUpdatedAssetIDsForHighlights:(id)a3;
- (void)setUpdatedMomentIDsForHighlights:(id)a3;
- (void)setWallpaperSuggestionReloadUUIDs:(id)a3;
- (void)setWidgetTimelineReloadTypesNeeded:(id)a3;
@end

@implementation PLDelayedSaveActionsDetail

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIDsNeedingAssetPersonEdgeUpdates, 0);
  objc_storeStrong((id *)&self->_memberIDsOfSocialGroupsNeedingDeduplication, 0);
  objc_storeStrong((id *)&self->_socialGroupNodeIDsNeedingDeduplication, 0);
  objc_storeStrong((id *)&self->_assetIDsByPersonUUIDNeedingContainmentUpdates, 0);
  objc_storeStrong((id *)&self->_assetIDsNeedingContainmentUpdates, 0);
  objc_storeStrong((id *)&self->_memberIDsOfSocialGroupsNeedingContainmentUpdates, 0);
  objc_storeStrong((id *)&self->_libraryScopeParticipantsForUpdate, 0);
  objc_storeStrong((id *)&self->_memoriesForAssetUpdate, 0);
  objc_storeStrong((id *)&self->_personsToUpdateForFeaturedContent, 0);
  objc_storeStrong((id *)&self->_wallpaperSuggestionReloadUUIDs, 0);
  objc_storeStrong((id *)&self->_assetsForWallpaperFavoriteAlbumRemoval, 0);
  objc_storeStrong((id *)&self->_assetsForWallpaperUserAlbumRemoval, 0);
  objc_storeStrong((id *)&self->_assetsForWidgetFavoriteAlbumRemoval, 0);
  objc_storeStrong((id *)&self->_assetsForWidgetUserAlbumRemoval, 0);
  objc_storeStrong((id *)&self->_widgetTimelineReloadTypesNeeded, 0);
  objc_storeStrong((id *)&self->_memoriesForDuetDelete, 0);
  objc_storeStrong((id *)&self->_assetsForDuetDelete, 0);
  objc_storeStrong((id *)&self->_importSessionCountsAndDateRangeUpdates, 0);
  objc_storeStrong((id *)&self->_albumKeyAssetsUpdates, 0);
  objc_storeStrong((id *)&self->_albumCountsAndDateRangeUpdates, 0);
  objc_storeStrong((id *)&self->_searchIndexUpdates, 0);
  objc_storeStrong((id *)&self->_assetsForFilesystemPersistency, 0);
  objc_storeStrong((id *)&self->_sharedAssetContainerIncrementalChangesByAssetID, 0);
  objc_storeStrong((id *)&self->_updatedMomentIDsForHighlights, 0);
  objc_storeStrong((id *)&self->_updatedAssetIDsForHighlights, 0);
  objc_storeStrong((id *)&self->_momentDeletes, 0);
  objc_storeStrong((id *)&self->_momentInsertsAndUpdates, 0);
  objc_storeStrong((id *)&self->_cloudFeedDeletionEntries, 0);
  objc_storeStrong((id *)&self->_cloudFeedInvitationRecordUpdates, 0);
  objc_storeStrong((id *)&self->_cloudFeedCommentInserts, 0);
  objc_storeStrong((id *)&self->_cloudFeedAssetUpdates, 0);
  objc_storeStrong((id *)&self->_cloudFeedAssetInserts, 0);
  objc_storeStrong((id *)&self->_cloudFeedAlbumUpdates, 0);
}

- (void)setAssetIDsNeedingAssetPersonEdgeUpdates:(id)a3
{
}

- (NSSet)assetIDsNeedingAssetPersonEdgeUpdates
{
  return self->_assetIDsNeedingAssetPersonEdgeUpdates;
}

- (void)setMemberIDsOfSocialGroupsNeedingDeduplication:(id)a3
{
}

- (NSSet)memberIDsOfSocialGroupsNeedingDeduplication
{
  return self->_memberIDsOfSocialGroupsNeedingDeduplication;
}

- (void)setSocialGroupNodeIDsNeedingDeduplication:(id)a3
{
}

- (NSSet)socialGroupNodeIDsNeedingDeduplication
{
  return self->_socialGroupNodeIDsNeedingDeduplication;
}

- (void)setAssetIDsByPersonUUIDNeedingContainmentUpdates:(id)a3
{
}

- (NSDictionary)assetIDsByPersonUUIDNeedingContainmentUpdates
{
  return self->_assetIDsByPersonUUIDNeedingContainmentUpdates;
}

- (void)setAssetIDsNeedingContainmentUpdates:(id)a3
{
}

- (NSSet)assetIDsNeedingContainmentUpdates
{
  return self->_assetIDsNeedingContainmentUpdates;
}

- (void)setMemberIDsOfSocialGroupsNeedingContainmentUpdates:(id)a3
{
}

- (NSSet)memberIDsOfSocialGroupsNeedingContainmentUpdates
{
  return self->_memberIDsOfSocialGroupsNeedingContainmentUpdates;
}

- (void)setLibraryScopeRulesUpdated:(BOOL)a3
{
  self->_libraryScopeRulesUpdated = a3;
}

- (BOOL)libraryScopeRulesUpdated
{
  return self->_libraryScopeRulesUpdated;
}

- (void)setLibraryScopeParticipantsForUpdate:(id)a3
{
}

- (NSSet)libraryScopeParticipantsForUpdate
{
  return self->_libraryScopeParticipantsForUpdate;
}

- (void)setMemoriesForAssetUpdate:(id)a3
{
}

- (NSSet)memoriesForAssetUpdate
{
  return self->_memoriesForAssetUpdate;
}

- (void)setPersonsToUpdateForFeaturedContent:(id)a3
{
}

- (NSSet)personsToUpdateForFeaturedContent
{
  return self->_personsToUpdateForFeaturedContent;
}

- (void)setShouldUpdateFeaturedContent:(BOOL)a3
{
  self->_shouldUpdateFeaturedContent = a3;
}

- (BOOL)shouldUpdateFeaturedContent
{
  return self->_shouldUpdateFeaturedContent;
}

- (void)setWallpaperSuggestionReloadUUIDs:(id)a3
{
}

- (NSSet)wallpaperSuggestionReloadUUIDs
{
  return self->_wallpaperSuggestionReloadUUIDs;
}

- (void)setAssetsForWallpaperFavoriteAlbumRemoval:(id)a3
{
}

- (NSSet)assetsForWallpaperFavoriteAlbumRemoval
{
  return self->_assetsForWallpaperFavoriteAlbumRemoval;
}

- (void)setAssetsForWallpaperUserAlbumRemoval:(id)a3
{
}

- (NSDictionary)assetsForWallpaperUserAlbumRemoval
{
  return self->_assetsForWallpaperUserAlbumRemoval;
}

- (void)setAssetsForWidgetFavoriteAlbumRemoval:(id)a3
{
}

- (NSSet)assetsForWidgetFavoriteAlbumRemoval
{
  return self->_assetsForWidgetFavoriteAlbumRemoval;
}

- (void)setAssetsForWidgetUserAlbumRemoval:(id)a3
{
}

- (NSDictionary)assetsForWidgetUserAlbumRemoval
{
  return self->_assetsForWidgetUserAlbumRemoval;
}

- (void)setWidgetTimelineReloadTypesNeeded:(id)a3
{
}

- (NSSet)widgetTimelineReloadTypesNeeded
{
  return self->_widgetTimelineReloadTypesNeeded;
}

- (void)setMemoriesForDuetDelete:(id)a3
{
}

- (NSSet)memoriesForDuetDelete
{
  return self->_memoriesForDuetDelete;
}

- (void)setAssetsForDuetDelete:(id)a3
{
}

- (NSSet)assetsForDuetDelete
{
  return self->_assetsForDuetDelete;
}

- (void)setImportSessionCountsAndDateRangeUpdates:(id)a3
{
}

- (NSSet)importSessionCountsAndDateRangeUpdates
{
  return self->_importSessionCountsAndDateRangeUpdates;
}

- (void)setAlbumKeyAssetsUpdates:(id)a3
{
}

- (NSSet)albumKeyAssetsUpdates
{
  return self->_albumKeyAssetsUpdates;
}

- (void)setAlbumCountsAndDateRangeUpdates:(id)a3
{
}

- (NSSet)albumCountsAndDateRangeUpdates
{
  return self->_albumCountsAndDateRangeUpdates;
}

- (void)setSearchIndexUpdates:(id)a3
{
}

- (NSDictionary)searchIndexUpdates
{
  return self->_searchIndexUpdates;
}

- (void)setAssetsForFilesystemPersistency:(id)a3
{
}

- (NSArray)assetsForFilesystemPersistency
{
  return self->_assetsForFilesystemPersistency;
}

- (void)setSharedAssetContainerIncrementalChangesByAssetID:(id)a3
{
}

- (NSDictionary)sharedAssetContainerIncrementalChangesByAssetID
{
  return self->_sharedAssetContainerIncrementalChangesByAssetID;
}

- (void)setUpdatedMomentIDsForHighlights:(id)a3
{
}

- (NSArray)updatedMomentIDsForHighlights
{
  return self->_updatedMomentIDsForHighlights;
}

- (void)setUpdatedAssetIDsForHighlights:(id)a3
{
}

- (NSArray)updatedAssetIDsForHighlights
{
  return self->_updatedAssetIDsForHighlights;
}

- (void)setMomentDeletes:(id)a3
{
}

- (NSDictionary)momentDeletes
{
  return self->_momentDeletes;
}

- (void)setMomentInsertsAndUpdates:(id)a3
{
}

- (NSArray)momentInsertsAndUpdates
{
  return self->_momentInsertsAndUpdates;
}

- (void)setCloudFeedDeletionEntries:(id)a3
{
}

- (NSArray)cloudFeedDeletionEntries
{
  return self->_cloudFeedDeletionEntries;
}

- (void)setCloudFeedInvitationRecordUpdates:(id)a3
{
}

- (NSArray)cloudFeedInvitationRecordUpdates
{
  return self->_cloudFeedInvitationRecordUpdates;
}

- (void)setCloudFeedCommentInserts:(id)a3
{
}

- (NSArray)cloudFeedCommentInserts
{
  return self->_cloudFeedCommentInserts;
}

- (void)setCloudFeedAssetUpdates:(id)a3
{
}

- (NSArray)cloudFeedAssetUpdates
{
  return self->_cloudFeedAssetUpdates;
}

- (void)setCloudFeedAssetInserts:(id)a3
{
}

- (NSArray)cloudFeedAssetInserts
{
  return self->_cloudFeedAssetInserts;
}

- (void)setCloudFeedAlbumUpdates:(id)a3
{
}

- (NSArray)cloudFeedAlbumUpdates
{
  return self->_cloudFeedAlbumUpdates;
}

- (PLDelayedSaveActionsDetail)initWithCoder:(id)a3
{
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v165.receiver = self;
  v165.super_class = (Class)PLDelayedSaveActionsDetail;
  v6 = [(PLDelayedSaveActionsDetail *)&v165 init];
  if (v6)
  {
    v161 = +[PLXPCCoder userInfoForCoder:v5];
    v7 = [v161 persistentStoreCoordinator];
    if (!v7)
    {
      v149 = [MEMORY[0x1E4F28B00] currentHandler];
      [v149 handleFailureInMethod:a2, v6, @"PLDelayedSaveActionsDetail.m", 188, @"Invalid parameter not satisfying: %@", @"coordinator != nil" object file lineNumber description];
    }
    v163[0] = MEMORY[0x1E4F143A8];
    v163[1] = 3221225472;
    v163[2] = __44__PLDelayedSaveActionsDetail_initWithCoder___block_invoke;
    v163[3] = &unk_1E5876088;
    id v160 = v7;
    id v164 = v160;
    v8 = (void *)MEMORY[0x19F38D650](v163);
    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v162 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (uint64_t i = 8; i != -8; i -= 8)

    v10 = [v5 decodeObjectOfClasses:v162 forKey:@"key_cloudFeedAlbumUpdates"];
    uint64_t v11 = objc_msgSend(v10, "_pl_map:", v8);
    cloudFeedAlbumUpdates = v6->_cloudFeedAlbumUpdates;
    v6->_cloudFeedAlbumUpdates = (NSArray *)v11;

    v13 = [v5 decodeObjectOfClasses:v162 forKey:@"key_cloudFeedAssetInserts"];
    uint64_t v14 = objc_msgSend(v13, "_pl_map:", v8);
    cloudFeedAssetInserts = v6->_cloudFeedAssetInserts;
    v6->_cloudFeedAssetInserts = (NSArray *)v14;

    v16 = [v5 decodeObjectOfClasses:v162 forKey:@"key_cloudFeedAssetUpdates"];
    uint64_t v17 = objc_msgSend(v16, "_pl_map:", v8);
    cloudFeedAssetUpdates = v6->_cloudFeedAssetUpdates;
    v6->_cloudFeedAssetUpdates = (NSArray *)v17;

    v19 = [v5 decodeObjectOfClasses:v162 forKey:@"key_cloudFeedCommentInserts"];
    uint64_t v20 = objc_msgSend(v19, "_pl_map:", v8);
    cloudFeedCommentInserts = v6->_cloudFeedCommentInserts;
    v6->_cloudFeedCommentInserts = (NSArray *)v20;

    v22 = [v5 decodeObjectOfClasses:v162 forKey:@"key_cloudFeedInvitationRecordUpdates"];
    uint64_t v23 = objc_msgSend(v22, "_pl_map:", v8);
    cloudFeedInvitationRecordUpdates = v6->_cloudFeedInvitationRecordUpdates;
    v6->_cloudFeedInvitationRecordUpdates = (NSArray *)v23;

    v25 = [v5 decodeObjectOfClasses:v162 forKey:@"key_cloudFeedDeletionEntries"];
    uint64_t v26 = objc_msgSend(v25, "_pl_map:", v8);
    cloudFeedDeletionEntries = v6->_cloudFeedDeletionEntries;
    v6->_cloudFeedDeletionEntries = (NSArray *)v26;

    v28 = [v5 decodeObjectOfClasses:v162 forKey:@"key_momentInsertsAndUpdates"];
    uint64_t v29 = objc_msgSend(v28, "_pl_map:", v8);
    momentInsertsAndUpdates = v6->_momentInsertsAndUpdates;
    v6->_momentInsertsAndUpdates = (NSArray *)v29;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    uint64_t v168 = objc_opt_class();
    uint64_t v169 = objc_opt_class();
    uint64_t v170 = objc_opt_class();
    v31 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:5];
    for (uint64_t j = 32; j != -8; j -= 8)

    uint64_t v33 = [v5 decodeObjectOfClasses:v31 forKey:@"key_momentDeletes"];

    v159 = (void *)v33;
    uint64_t v34 = [(id)objc_opt_class() _decodeMomentDeletes:v33 urlToObjectID:v8];
    momentDeletes = v6->_momentDeletes;
    v6->_momentDeletes = (NSDictionary *)v34;

    v36 = [v5 decodeObjectOfClasses:v162 forKey:@"key_updatedAssetIDsForHighlights"];
    uint64_t v37 = objc_msgSend(v36, "_pl_map:", v8);
    updatedAssetIDsForHighlights = v6->_updatedAssetIDsForHighlights;
    v6->_updatedAssetIDsForHighlights = (NSArray *)v37;

    v39 = [v5 decodeObjectOfClasses:v162 forKey:@"key_updatedMomentIDsForHighlights"];
    uint64_t v40 = objc_msgSend(v39, "_pl_map:", v8);
    updatedMomentIDsForHighlights = v6->_updatedMomentIDsForHighlights;
    v6->_updatedMomentIDsForHighlights = (NSArray *)v40;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    uint64_t v168 = objc_opt_class();
    uint64_t v169 = objc_opt_class();
    v42 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:4];
    for (uint64_t k = 24; k != -8; k -= 8)

    uint64_t v44 = [v5 decodeObjectOfClasses:v42 forKey:@"key_sharedAssetContainerIncrementalChangesByAssetID"];

    v158 = (void *)v44;
    uint64_t v45 = [(id)objc_opt_class() _decodeSharedAssetContainerIncrementalChanges:v44 urlToObjectID:v8];
    sharedAssetContainerIncrementalChangesByAssetID = v6->_sharedAssetContainerIncrementalChangesByAssetID;
    v6->_sharedAssetContainerIncrementalChangesByAssetID = (NSDictionary *)v45;

    v47 = [v5 decodeObjectOfClasses:v162 forKey:@"key_assetsForFilesystemPersistency"];
    uint64_t v48 = objc_msgSend(v47, "_pl_map:", v8);
    assetsForFilesystemPersistency = v6->_assetsForFilesystemPersistency;
    v6->_assetsForFilesystemPersistency = (NSArray *)v48;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    uint64_t v168 = objc_opt_class();
    v50 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:3];
    for (uint64_t m = 16; m != -8; m -= 8)

    uint64_t v52 = [v5 decodeObjectOfClasses:v50 forKey:@"key_searchIndexUpdates"];
    searchIndexUpdates = v6->_searchIndexUpdates;
    v6->_searchIndexUpdates = (NSDictionary *)v52;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v54 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (uint64_t n = 8; n != -8; n -= 8)

    v56 = [v5 decodeObjectOfClasses:v54 forKey:@"key_albumCountsAndDateRangeUpdates"];

    v157 = v56;
    uint64_t v57 = objc_msgSend(v56, "_pl_map:", v8);
    albumCountsAndDateRangeUpdates = v6->_albumCountsAndDateRangeUpdates;
    v6->_albumCountsAndDateRangeUpdates = (NSSet *)v57;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v59 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (iuint64_t i = 8; ii != -8; ii -= 8)

    v61 = [v5 decodeObjectOfClasses:v59 forKey:@"key_albumKeyAssetsUpdates"];

    v156 = v61;
    uint64_t v62 = objc_msgSend(v61, "_pl_map:", v8);
    albumKeyAssetsUpdates = v6->_albumKeyAssetsUpdates;
    v6->_albumKeyAssetsUpdates = (NSSet *)v62;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v64 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (juint64_t j = 8; jj != -8; jj -= 8)

    v66 = [v5 decodeObjectOfClasses:v64 forKey:@"key_importSessionCountsAndDateRangeUpdates"];

    v155 = v66;
    uint64_t v67 = objc_msgSend(v66, "_pl_map:", v8);
    importSessionCountsAndDateRangeUpdates = v6->_importSessionCountsAndDateRangeUpdates;
    v6->_importSessionCountsAndDateRangeUpdates = (NSSet *)v67;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v69 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (kuint64_t k = 8; kk != -8; kk -= 8)

    uint64_t v71 = [v5 decodeObjectOfClasses:v69 forKey:@"key_assetsForDuetDelete"];
    assetsForDuetDelete = v6->_assetsForDuetDelete;
    v6->_assetsForDuetDelete = (NSSet *)v71;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v73 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (muint64_t m = 8; mm != -8; mm -= 8)

    uint64_t v75 = [v5 decodeObjectOfClasses:v73 forKey:@"key_memoriesForDuetDelete"];
    memoriesForDuetDelete = v6->_memoriesForDuetDelete;
    v6->_memoriesForDuetDelete = (NSSet *)v75;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v77 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (nuint64_t n = 8; nn != -8; nn -= 8)

    uint64_t v79 = [v5 decodeObjectOfClasses:v77 forKey:@"key_widgetTimelineReloadTypesNeeded"];
    widgetTimelineReloadTypesNeeded = v6->_widgetTimelineReloadTypesNeeded;
    v6->_widgetTimelineReloadTypesNeeded = (NSSet *)v79;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    uint64_t v168 = objc_opt_class();
    uint64_t v169 = objc_opt_class();
    v81 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:4];
    for (uint64_t i1 = 24; i1 != -8; i1 -= 8)

    uint64_t v83 = [v5 decodeObjectOfClasses:v81 forKey:@"key_assetsForWidgetUserAlbumRemoval"];

    v154 = (void *)v83;
    uint64_t v84 = [(id)objc_opt_class() _decodeAssetsForWidgetUserAlbumRemoval:v83 urlToObjectID:v8];
    assetsForWidgetUserAlbumRemoval = v6->_assetsForWidgetUserAlbumRemoval;
    v6->_assetsForWidgetUserAlbumRemoval = (NSDictionary *)v84;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v86 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (uint64_t i2 = 8; i2 != -8; i2 -= 8)

    v88 = [v5 decodeObjectOfClasses:v86 forKey:@"key_assetsForWidgetFavoriteAlbumRemoval"];

    v153 = v88;
    uint64_t v89 = objc_msgSend(v88, "_pl_map:", v8);
    assetsForWidgetFavoriteAlbumRemoval = v6->_assetsForWidgetFavoriteAlbumRemoval;
    v6->_assetsForWidgetFavoriteAlbumRemoval = (NSSet *)v89;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    uint64_t v168 = objc_opt_class();
    uint64_t v169 = objc_opt_class();
    v91 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:4];
    for (uint64_t i3 = 24; i3 != -8; i3 -= 8)

    uint64_t v93 = [v5 decodeObjectOfClasses:v91 forKey:@"key_assetsForWallpaperUserAlbumRemoval"];

    v152 = (void *)v93;
    uint64_t v94 = [(id)objc_opt_class() _decodeAssetsForWallpaperUserAlbumRemoval:v93 urlToObjectID:v8];
    assetsForWallpaperUserAlbumRemoval = v6->_assetsForWallpaperUserAlbumRemoval;
    v6->_assetsForWallpaperUserAlbumRemoval = (NSDictionary *)v94;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v96 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (uint64_t i4 = 8; i4 != -8; i4 -= 8)

    v98 = [v5 decodeObjectOfClasses:v96 forKey:@"key_assetsForWallpaperFavoriteAlbumRemoval"];

    v151 = v98;
    uint64_t v99 = objc_msgSend(v98, "_pl_map:", v8);
    assetsForWallpaperFavoriteAlbumRemoval = v6->_assetsForWallpaperFavoriteAlbumRemoval;
    v6->_assetsForWallpaperFavoriteAlbumRemoval = (NSSet *)v99;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v101 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (uint64_t i5 = 8; i5 != -8; i5 -= 8)

    uint64_t v103 = [v5 decodeObjectOfClasses:v101 forKey:@"key_wallpaperSuggestionReloadUUIDs"];
    wallpaperSuggestionReloadUUIDs = v6->_wallpaperSuggestionReloadUUIDs;
    v6->_wallpaperSuggestionReloadUUIDs = (NSSet *)v103;

    v6->_shouldUpdateFeaturedContent = [v5 decodeBoolForKey:@"key_shouldUpdateFeaturedContent"];
    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v105 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (uint64_t i6 = 8; i6 != -8; i6 -= 8)

    uint64_t v107 = [v5 decodeObjectOfClasses:v105 forKey:@"key_personsToUpdateForFeaturedContent"];
    personsToUpdateForFeaturedContent = v6->_personsToUpdateForFeaturedContent;
    v6->_personsToUpdateForFeaturedContent = (NSSet *)v107;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v109 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (uint64_t i7 = 8; i7 != -8; i7 -= 8)

    uint64_t v111 = [v5 decodeObjectOfClasses:v109 forKey:@"key_memoriesForAssetUpdate"];
    memoriesForAssetUpdate = v6->_memoriesForAssetUpdate;
    v6->_memoriesForAssetUpdate = (NSSet *)v111;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v113 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (uint64_t i8 = 8; i8 != -8; i8 -= 8)

    uint64_t v115 = [v5 decodeObjectOfClasses:v113 forKey:@"key_libraryScopeParticipantsForUpdate"];
    libraryScopeParticipantsForUpdate = v6->_libraryScopeParticipantsForUpdate;
    v6->_libraryScopeParticipantsForUpdate = (NSSet *)v115;

    v6->_libraryScopeRulesUpdated = [v5 decodeBoolForKey:@"key_libraryScopeRulesUpdated"];
    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v117 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (uint64_t i9 = 8; i9 != -8; i9 -= 8)

    v119 = [v5 decodeObjectOfClasses:v117 forKey:@"key_assetIDsNeedingContainmentUpdates"];

    v150 = v119;
    uint64_t v120 = objc_msgSend(v119, "_pl_map:", v8);
    assetIDsNeedingContainmentUpdates = v6->_assetIDsNeedingContainmentUpdates;
    v6->_assetIDsNeedingContainmentUpdates = (NSSet *)v120;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v122 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (uint64_t i10 = 8; i10 != -8; i10 -= 8)

    v124 = [v5 decodeObjectOfClasses:v122 forKey:@"key_memberIDsOfSocialGroupsNeedingContainmentUpdates"];

    uint64_t v125 = objc_msgSend(v124, "_pl_map:", v8);
    memberIDsOfSocialGroupsNeedingContainmentUpdates = v6->_memberIDsOfSocialGroupsNeedingContainmentUpdates;
    v6->_memberIDsOfSocialGroupsNeedingContainmentUpdates = (NSSet *)v125;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    uint64_t v168 = objc_opt_class();
    uint64_t v169 = objc_opt_class();
    v127 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:4];
    for (uint64_t i11 = 24; i11 != -8; i11 -= 8)

    v129 = [v5 decodeObjectOfClasses:v127 forKey:@"key_assetIDsByPersonUUIDNeedingContainmentUpdates"];

    uint64_t v130 = [(id)objc_opt_class() _decodeAssetIDsByPersonUUIDNeedingContainmentUpdates:v129 urlToObjectID:v8];
    assetIDsByPersonUUIDNeedingContainmentUpdates = v6->_assetIDsByPersonUUIDNeedingContainmentUpdates;
    v6->_assetIDsByPersonUUIDNeedingContainmentUpdates = (NSDictionary *)v130;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v132 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (uint64_t i12 = 8; i12 != -8; i12 -= 8)

    v134 = [v5 decodeObjectOfClasses:v132 forKey:@"key_socialGroupNodeIDsNeedingDeduplication"];

    uint64_t v135 = objc_msgSend(v134, "_pl_map:", v8);
    socialGroupNodeIDsNeedingDeduplicatiouint64_t n = v6->_socialGroupNodeIDsNeedingDeduplication;
    v6->_socialGroupNodeIDsNeedingDeduplicatiouint64_t n = (NSSet *)v135;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v137 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (uint64_t i13 = 8; i13 != -8; i13 -= 8)

    v139 = [v5 decodeObjectOfClasses:v137 forKey:@"key_memberIDsOfSocialGroupsNeedingDeduplication"];

    uint64_t v140 = objc_msgSend(v139, "_pl_map:", v8);
    memberIDsOfSocialGroupsNeedingDeduplicatiouint64_t n = v6->_memberIDsOfSocialGroupsNeedingDeduplication;
    v6->_memberIDsOfSocialGroupsNeedingDeduplicatiouint64_t n = (NSSet *)v140;

    uint64_t v166 = objc_opt_class();
    uint64_t v167 = objc_opt_class();
    v142 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v166 count:2];
    for (uint64_t i14 = 8; i14 != -8; i14 -= 8)

    v144 = [v5 decodeObjectOfClasses:v142 forKey:@"key_assetIDsNeedingAssetPersonEdgeUpdates"];

    uint64_t v145 = objc_msgSend(v144, "_pl_map:", v8);
    assetIDsNeedingAssetPersonEdgeUpdates = v6->_assetIDsNeedingAssetPersonEdgeUpdates;
    v6->_assetIDsNeedingAssetPersonEdgeUpdates = (NSSet *)v145;

    v147 = v6;
  }

  return v6;
}

uint64_t __44__PLDelayedSaveActionsDetail_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) managedObjectIDForURIRepresentation:a2];
}

- (id)_encodableAssetIDsByPersonUUIDNeedingContainmentUpdates
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  assetIDsByPersonUUIDNeedingContainmentUpdates = self->_assetIDsByPersonUUIDNeedingContainmentUpdates;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__PLDelayedSaveActionsDetail__encodableAssetIDsByPersonUUIDNeedingContainmentUpdates__block_invoke;
  v7[3] = &unk_1E5876060;
  id v5 = v3;
  id v8 = v5;
  [(NSDictionary *)assetIDsByPersonUUIDNeedingContainmentUpdates enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __85__PLDelayedSaveActionsDetail__encodableAssetIDsByPersonUUIDNeedingContainmentUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 set];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__PLDelayedSaveActionsDetail__encodableAssetIDsByPersonUUIDNeedingContainmentUpdates__block_invoke_2;
  v10[3] = &unk_1E5876038;
  id v11 = v8;
  id v9 = v8;
  [v6 enumerateObjectsUsingBlock:v10];

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
}

void __85__PLDelayedSaveActionsDetail__encodableAssetIDsByPersonUUIDNeedingContainmentUpdates__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 URIRepresentation];
  [*(id *)(a1 + 32) addObject:v3];
}

- (id)_encodableSharedAssetContainerIncrementalChanges
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sharedAssetContainerIncrementalChangesByAssetID = self->_sharedAssetContainerIncrementalChangesByAssetID;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PLDelayedSaveActionsDetail__encodableSharedAssetContainerIncrementalChanges__block_invoke;
  v7[3] = &unk_1E5876010;
  id v5 = v3;
  id v8 = v5;
  [(NSDictionary *)sharedAssetContainerIncrementalChangesByAssetID enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __78__PLDelayedSaveActionsDetail__encodableSharedAssetContainerIncrementalChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 URIRepresentation];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (id)_encodableAssetsForWallpaperUserAlbumRemoval
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  assetsForWallpaperUserAlbumRemoval = self->_assetsForWallpaperUserAlbumRemoval;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PLDelayedSaveActionsDetail__encodableAssetsForWallpaperUserAlbumRemoval__block_invoke;
  v7[3] = &unk_1E5875FE8;
  id v5 = v3;
  id v8 = v5;
  [(NSDictionary *)assetsForWallpaperUserAlbumRemoval enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __74__PLDelayedSaveActionsDetail__encodableAssetsForWallpaperUserAlbumRemoval__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 URIRepresentation];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (id)_encodableAssetsForWidgetUserAlbumRemoval
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  assetsForWidgetUserAlbumRemoval = self->_assetsForWidgetUserAlbumRemoval;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PLDelayedSaveActionsDetail__encodableAssetsForWidgetUserAlbumRemoval__block_invoke;
  v7[3] = &unk_1E5875FE8;
  id v5 = v3;
  id v8 = v5;
  [(NSDictionary *)assetsForWidgetUserAlbumRemoval enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __71__PLDelayedSaveActionsDetail__encodableAssetsForWidgetUserAlbumRemoval__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 URIRepresentation];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (id)_encodableMomentDeletes
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  momentDeletes = self->_momentDeletes;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PLDelayedSaveActionsDetail__encodableMomentDeletes__block_invoke;
  v7[3] = &unk_1E5875FC0;
  id v5 = v3;
  id v8 = v5;
  [(NSDictionary *)momentDeletes enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __53__PLDelayedSaveActionsDetail__encodableMomentDeletes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 URIRepresentation];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (void)encodeWithCoder:(id)a3
{
  cloudFeedAlbumUpdates = self->_cloudFeedAlbumUpdates;
  id v5 = a3;
  id v6 = [(NSArray *)cloudFeedAlbumUpdates _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v6 forKey:@"key_cloudFeedAlbumUpdates"];

  id v7 = [(NSArray *)self->_cloudFeedAssetInserts _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v7 forKey:@"key_cloudFeedAssetInserts"];

  id v8 = [(NSArray *)self->_cloudFeedAssetUpdates _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v8 forKey:@"key_cloudFeedAssetUpdates"];

  id v9 = [(NSArray *)self->_cloudFeedCommentInserts _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v9 forKey:@"key_cloudFeedCommentInserts"];

  v10 = [(NSArray *)self->_cloudFeedInvitationRecordUpdates _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v10 forKey:@"key_cloudFeedInvitationRecordUpdates"];

  id v11 = [(NSArray *)self->_cloudFeedDeletionEntries _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v11 forKey:@"key_cloudFeedDeletionEntries"];

  v12 = [(NSArray *)self->_momentInsertsAndUpdates _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v12 forKey:@"key_momentInsertsAndUpdates"];

  v13 = [(PLDelayedSaveActionsDetail *)self _encodableMomentDeletes];
  [v5 encodeObject:v13 forKey:@"key_momentDeletes"];

  uint64_t v14 = [(NSArray *)self->_updatedAssetIDsForHighlights _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v14 forKey:@"key_updatedAssetIDsForHighlights"];

  v15 = [(NSArray *)self->_updatedMomentIDsForHighlights _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v15 forKey:@"key_updatedMomentIDsForHighlights"];

  v16 = [(PLDelayedSaveActionsDetail *)self _encodableSharedAssetContainerIncrementalChanges];
  [v5 encodeObject:v16 forKey:@"key_sharedAssetContainerIncrementalChangesByAssetID"];

  uint64_t v17 = [(NSArray *)self->_assetsForFilesystemPersistency _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v17 forKey:@"key_assetsForFilesystemPersistency"];

  [v5 encodeObject:self->_searchIndexUpdates forKey:@"key_searchIndexUpdates"];
  v18 = [(NSSet *)self->_albumCountsAndDateRangeUpdates _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v18 forKey:@"key_albumCountsAndDateRangeUpdates"];

  v19 = [(NSSet *)self->_albumKeyAssetsUpdates _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v19 forKey:@"key_albumKeyAssetsUpdates"];

  uint64_t v20 = [(NSSet *)self->_importSessionCountsAndDateRangeUpdates _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v20 forKey:@"key_importSessionCountsAndDateRangeUpdates"];

  [v5 encodeObject:self->_assetsForDuetDelete forKey:@"key_assetsForDuetDelete"];
  [v5 encodeObject:self->_memoriesForDuetDelete forKey:@"key_memoriesForDuetDelete"];
  [v5 encodeObject:self->_widgetTimelineReloadTypesNeeded forKey:@"key_widgetTimelineReloadTypesNeeded"];
  v21 = [(PLDelayedSaveActionsDetail *)self _encodableAssetsForWidgetUserAlbumRemoval];
  [v5 encodeObject:v21 forKey:@"key_assetsForWidgetUserAlbumRemoval"];

  v22 = [(NSSet *)self->_assetsForWidgetFavoriteAlbumRemoval _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v22 forKey:@"key_assetsForWidgetFavoriteAlbumRemoval"];

  uint64_t v23 = [(PLDelayedSaveActionsDetail *)self _encodableAssetsForWallpaperUserAlbumRemoval];
  [v5 encodeObject:v23 forKey:@"key_assetsForWallpaperUserAlbumRemoval"];

  v24 = [(NSSet *)self->_assetsForWallpaperFavoriteAlbumRemoval _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v24 forKey:@"key_assetsForWallpaperFavoriteAlbumRemoval"];

  [v5 encodeObject:self->_wallpaperSuggestionReloadUUIDs forKey:@"key_wallpaperSuggestionReloadUUIDs"];
  [v5 encodeBool:self->_shouldUpdateFeaturedContent forKey:@"key_shouldUpdateFeaturedContent"];
  [v5 encodeObject:self->_personsToUpdateForFeaturedContent forKey:@"key_personsToUpdateForFeaturedContent"];
  [v5 encodeObject:self->_memoriesForAssetUpdate forKey:@"key_memoriesForAssetUpdate"];
  [v5 encodeObject:self->_libraryScopeParticipantsForUpdate forKey:@"key_libraryScopeParticipantsForUpdate"];
  [v5 encodeBool:self->_libraryScopeRulesUpdated forKey:@"key_libraryScopeRulesUpdated"];
  v25 = [(NSSet *)self->_memberIDsOfSocialGroupsNeedingContainmentUpdates _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v25 forKey:@"key_memberIDsOfSocialGroupsNeedingContainmentUpdates"];

  uint64_t v26 = [(NSSet *)self->_assetIDsNeedingContainmentUpdates _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v26 forKey:@"key_assetIDsNeedingContainmentUpdates"];

  v27 = [(PLDelayedSaveActionsDetail *)self _encodableAssetIDsByPersonUUIDNeedingContainmentUpdates];
  [v5 encodeObject:v27 forKey:@"key_assetIDsByPersonUUIDNeedingContainmentUpdates"];

  v28 = [(NSSet *)self->_socialGroupNodeIDsNeedingDeduplication _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v28 forKey:@"key_socialGroupNodeIDsNeedingDeduplication"];

  uint64_t v29 = [(NSSet *)self->_memberIDsOfSocialGroupsNeedingDeduplication _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v29 forKey:@"key_memberIDsOfSocialGroupsNeedingDeduplication"];

  id v30 = [(NSSet *)self->_assetIDsNeedingAssetPersonEdgeUpdates _pl_map:&__block_literal_global_117128];
  [v5 encodeObject:v30 forKey:@"key_assetIDsNeedingAssetPersonEdgeUpdates"];
}

uint64_t __46__PLDelayedSaveActionsDetail_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 URIRepresentation];
}

- (BOOL)shouldHandleMoments
{
  int v3 = PLPlatformMomentsSupported();
  if (v3) {
    LOBYTE(v3) = [(NSArray *)self->_momentInsertsAndUpdates count]
  }
              || [(NSDictionary *)self->_momentDeletes count]
              || [(NSArray *)self->_updatedAssetIDsForHighlights count]
              || [(NSArray *)self->_updatedMomentIDsForHighlights count] != 0;
  return v3;
}

- (PLDelayedSaveActionsDetail)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLDelayedSaveActionsDetail;
  return [(PLDelayedSaveActionsDetail *)&v3 init];
}

+ (id)_decodeAssetIDsByPersonUUIDNeedingContainmentUpdates:(id)a3 urlToObjectID:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = [v6 dictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__PLDelayedSaveActionsDetail__decodeAssetIDsByPersonUUIDNeedingContainmentUpdates_urlToObjectID___block_invoke;
  v14[3] = &unk_1E5876150;
  id v16 = v5;
  id v9 = v8;
  id v15 = v9;
  id v10 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v14];

  id v11 = v15;
  id v12 = v9;

  return v12;
}

void __97__PLDelayedSaveActionsDetail__decodeAssetIDsByPersonUUIDNeedingContainmentUpdates_urlToObjectID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 set];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __97__PLDelayedSaveActionsDetail__decodeAssetIDsByPersonUUIDNeedingContainmentUpdates_urlToObjectID___block_invoke_2;
  v13 = &unk_1E5876128;
  id v14 = v8;
  id v15 = *(id *)(a1 + 40);
  id v9 = v8;
  [v6 enumerateObjectsUsingBlock:&v10];

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7, v10, v11, v12, v13);
}

void __97__PLDelayedSaveActionsDetail__decodeAssetIDsByPersonUUIDNeedingContainmentUpdates_urlToObjectID___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

+ (id)_decodeSharedAssetContainerIncrementalChanges:(id)a3 urlToObjectID:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = [v6 dictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __90__PLDelayedSaveActionsDetail__decodeSharedAssetContainerIncrementalChanges_urlToObjectID___block_invoke;
  v14[3] = &unk_1E5876100;
  id v16 = v5;
  id v9 = v8;
  id v15 = v9;
  id v10 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v14];

  uint64_t v11 = v15;
  id v12 = v9;

  return v12;
}

void __90__PLDelayedSaveActionsDetail__decodeSharedAssetContainerIncrementalChanges_urlToObjectID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a3;
  v6(v5, a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
}

+ (id)_decodeAssetsForWallpaperUserAlbumRemoval:(id)a3 urlToObjectID:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = [v6 dictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__PLDelayedSaveActionsDetail__decodeAssetsForWallpaperUserAlbumRemoval_urlToObjectID___block_invoke;
  v14[3] = &unk_1E58760D8;
  id v16 = v5;
  id v9 = v8;
  id v15 = v9;
  id v10 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v14];

  uint64_t v11 = v15;
  id v12 = v9;

  return v12;
}

void __86__PLDelayedSaveActionsDetail__decodeAssetsForWallpaperUserAlbumRemoval_urlToObjectID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a3;
  v6(v5, a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
}

+ (id)_decodeAssetsForWidgetUserAlbumRemoval:(id)a3 urlToObjectID:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = [v6 dictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__PLDelayedSaveActionsDetail__decodeAssetsForWidgetUserAlbumRemoval_urlToObjectID___block_invoke;
  v14[3] = &unk_1E58760D8;
  id v16 = v5;
  id v9 = v8;
  id v15 = v9;
  id v10 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v14];

  uint64_t v11 = v15;
  id v12 = v9;

  return v12;
}

void __83__PLDelayedSaveActionsDetail__decodeAssetsForWidgetUserAlbumRemoval_urlToObjectID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a3;
  v6(v5, a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
}

+ (id)_decodeMomentDeletes:(id)a3 urlToObjectID:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = [v6 dictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__PLDelayedSaveActionsDetail__decodeMomentDeletes_urlToObjectID___block_invoke;
  v14[3] = &unk_1E58760B0;
  id v16 = v5;
  id v9 = v8;
  id v15 = v9;
  id v10 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v14];

  uint64_t v11 = v15;
  id v12 = v9;

  return v12;
}

void __65__PLDelayedSaveActionsDetail__decodeMomentDeletes_urlToObjectID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a3;
  v6(v5, a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end