@interface PLCloudUploadChanges
- (BOOL)isEmpty;
- (NSMutableArray)albumChanges;
- (NSMutableArray)albumInserts;
- (NSMutableArray)deferredAssets;
- (NSMutableArray)deletedRecords;
- (NSMutableArray)faceCropChanges;
- (NSMutableArray)insertedAssets;
- (NSMutableArray)insertedResources;
- (NSMutableArray)libraryScopeChanges;
- (NSMutableArray)memoryChanges;
- (NSMutableArray)personChanges;
- (NSMutableArray)socialGroupChanges;
- (NSMutableArray)suggestionChanges;
- (NSMutableArray)updatedAssets;
- (NSMutableArray)updatedMasters;
- (NSMutableArray)updatedResources;
- (NSMutableArray)userFeedbackChanges;
- (NSMutableSet)adjustedAssetUuids;
- (NSMutableSet)computeSyncChangedAssets;
- (NSMutableSet)faceChangedAssetUuids;
- (NSMutableSet)propertyChangedAssetUuids;
- (NSMutableSet)sharingPropertyChangedAssetUuids;
- (NSMutableSet)updatedRelationship;
- (PLCloudUploadChanges)init;
- (id)summaryCounts;
- (void)setAdjustedAssetUuids:(id)a3;
- (void)setAlbumChanges:(id)a3;
- (void)setAlbumInserts:(id)a3;
- (void)setComputeSyncChangedAssets:(id)a3;
- (void)setDeferredAssets:(id)a3;
- (void)setDeletedRecords:(id)a3;
- (void)setFaceChangedAssetUuids:(id)a3;
- (void)setFaceCropChanges:(id)a3;
- (void)setInsertedAssets:(id)a3;
- (void)setInsertedResources:(id)a3;
- (void)setLibraryScopeChanges:(id)a3;
- (void)setMemoryChanges:(id)a3;
- (void)setPersonChanges:(id)a3;
- (void)setPropertyChangedAssetUuids:(id)a3;
- (void)setSharingPropertyChangedAssetUuids:(id)a3;
- (void)setSocialGroupChanges:(id)a3;
- (void)setSuggestionChanges:(id)a3;
- (void)setUpdatedAssets:(id)a3;
- (void)setUpdatedMasters:(id)a3;
- (void)setUpdatedRelationship:(id)a3;
- (void)setUpdatedResources:(id)a3;
- (void)setUserFeedbackChanges:(id)a3;
@end

@implementation PLCloudUploadChanges

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecords, 0);
  objc_storeStrong((id *)&self->_updatedRelationship, 0);
  objc_storeStrong((id *)&self->_socialGroupChanges, 0);
  objc_storeStrong((id *)&self->_libraryScopeChanges, 0);
  objc_storeStrong((id *)&self->_userFeedbackChanges, 0);
  objc_storeStrong((id *)&self->_suggestionChanges, 0);
  objc_storeStrong((id *)&self->_faceCropChanges, 0);
  objc_storeStrong((id *)&self->_personChanges, 0);
  objc_storeStrong((id *)&self->_memoryChanges, 0);
  objc_storeStrong((id *)&self->_albumChanges, 0);
  objc_storeStrong((id *)&self->_albumInserts, 0);
  objc_storeStrong((id *)&self->_updatedResources, 0);
  objc_storeStrong((id *)&self->_insertedResources, 0);
  objc_storeStrong((id *)&self->_updatedMasters, 0);
  objc_storeStrong((id *)&self->_computeSyncChangedAssets, 0);
  objc_storeStrong((id *)&self->_faceChangedAssetUuids, 0);
  objc_storeStrong((id *)&self->_sharingPropertyChangedAssetUuids, 0);
  objc_storeStrong((id *)&self->_propertyChangedAssetUuids, 0);
  objc_storeStrong((id *)&self->_adjustedAssetUuids, 0);
  objc_storeStrong((id *)&self->_deferredAssets, 0);
  objc_storeStrong((id *)&self->_updatedAssets, 0);
  objc_storeStrong((id *)&self->_insertedAssets, 0);
}

- (void)setDeletedRecords:(id)a3
{
}

- (NSMutableArray)deletedRecords
{
  return self->_deletedRecords;
}

- (void)setUpdatedRelationship:(id)a3
{
}

- (NSMutableSet)updatedRelationship
{
  return self->_updatedRelationship;
}

- (void)setSocialGroupChanges:(id)a3
{
}

- (NSMutableArray)socialGroupChanges
{
  return self->_socialGroupChanges;
}

- (void)setLibraryScopeChanges:(id)a3
{
}

- (NSMutableArray)libraryScopeChanges
{
  return self->_libraryScopeChanges;
}

- (void)setUserFeedbackChanges:(id)a3
{
}

- (NSMutableArray)userFeedbackChanges
{
  return self->_userFeedbackChanges;
}

- (void)setSuggestionChanges:(id)a3
{
}

- (NSMutableArray)suggestionChanges
{
  return self->_suggestionChanges;
}

- (void)setFaceCropChanges:(id)a3
{
}

- (NSMutableArray)faceCropChanges
{
  return self->_faceCropChanges;
}

- (void)setPersonChanges:(id)a3
{
}

- (NSMutableArray)personChanges
{
  return self->_personChanges;
}

- (void)setMemoryChanges:(id)a3
{
}

- (NSMutableArray)memoryChanges
{
  return self->_memoryChanges;
}

- (void)setAlbumChanges:(id)a3
{
}

- (NSMutableArray)albumChanges
{
  return self->_albumChanges;
}

- (void)setAlbumInserts:(id)a3
{
}

- (NSMutableArray)albumInserts
{
  return self->_albumInserts;
}

- (void)setUpdatedResources:(id)a3
{
}

- (NSMutableArray)updatedResources
{
  return self->_updatedResources;
}

- (void)setInsertedResources:(id)a3
{
}

- (NSMutableArray)insertedResources
{
  return self->_insertedResources;
}

- (void)setUpdatedMasters:(id)a3
{
}

- (NSMutableArray)updatedMasters
{
  return self->_updatedMasters;
}

- (void)setComputeSyncChangedAssets:(id)a3
{
}

- (NSMutableSet)computeSyncChangedAssets
{
  return self->_computeSyncChangedAssets;
}

- (void)setFaceChangedAssetUuids:(id)a3
{
}

- (NSMutableSet)faceChangedAssetUuids
{
  return self->_faceChangedAssetUuids;
}

- (void)setSharingPropertyChangedAssetUuids:(id)a3
{
}

- (NSMutableSet)sharingPropertyChangedAssetUuids
{
  return self->_sharingPropertyChangedAssetUuids;
}

- (void)setPropertyChangedAssetUuids:(id)a3
{
}

- (NSMutableSet)propertyChangedAssetUuids
{
  return self->_propertyChangedAssetUuids;
}

- (void)setAdjustedAssetUuids:(id)a3
{
}

- (NSMutableSet)adjustedAssetUuids
{
  return self->_adjustedAssetUuids;
}

- (void)setDeferredAssets:(id)a3
{
}

- (NSMutableArray)deferredAssets
{
  return self->_deferredAssets;
}

- (void)setUpdatedAssets:(id)a3
{
}

- (NSMutableArray)updatedAssets
{
  return self->_updatedAssets;
}

- (void)setInsertedAssets:(id)a3
{
}

- (NSMutableArray)insertedAssets
{
  return self->_insertedAssets;
}

- (id)summaryCounts
{
  return (id)[NSString stringWithFormat:@"inserted = %zu, insertedResources = %zu, deferredAssets = %zu, updated = %zu, updatedMasters = %zu, updatedResources = %zu, albumInsert = %zu, albumChange = %zu, memoryChange = %zu, personChange = %zu, faceCropChange = %zu, suggestionChange = %zu, userFeedbackChange = %zu, libraryScopeChanges = %zu, socialGroupChanges = %zu, deletedRecords = %zu", -[NSMutableArray count](self->_insertedAssets, "count"), -[NSMutableArray count](self->_insertedResources, "count"), -[NSMutableArray count](self->_deferredAssets, "count"), -[NSMutableArray count](self->_updatedAssets, "count"), -[NSMutableArray count](self->_updatedMasters, "count"), -[NSMutableArray count](self->_updatedResources, "count"), -[NSMutableArray count](self->_albumInserts, "count"), -[NSMutableArray count](self->_albumChanges, "count"), -[NSMutableArray count](self->_memoryChanges, "count"), -[NSMutableArray count](self->_personChanges, "count"), -[NSMutableArray count](self->_faceCropChanges, "count"), -[NSMutableArray count](self->_suggestionChanges, "count"), -[NSMutableArray count](self->_userFeedbackChanges, "count"), -[NSMutableArray count](self->_libraryScopeChanges, "count"), -[NSMutableArray count](self->_socialGroupChanges, "count"), -[NSMutableArray count](self->_deletedRecords, "count")];
}

- (BOOL)isEmpty
{
  return ![(NSMutableArray *)self->_insertedAssets count]
      && ![(NSMutableArray *)self->_updatedAssets count]
      && ![(NSMutableArray *)self->_updatedMasters count]
      && ![(NSMutableArray *)self->_insertedResources count]
      && ![(NSMutableArray *)self->_updatedResources count]
      && ![(NSMutableSet *)self->_propertyChangedAssetUuids count]
      && ![(NSMutableSet *)self->_sharingPropertyChangedAssetUuids count]
      && ![(NSMutableSet *)self->_computeSyncChangedAssets count]
      && ![(NSMutableSet *)self->_adjustedAssetUuids count]
      && ![(NSMutableSet *)self->_faceChangedAssetUuids count]
      && ![(NSMutableArray *)self->_albumInserts count]
      && ![(NSMutableArray *)self->_albumChanges count]
      && ![(NSMutableArray *)self->_memoryChanges count]
      && ![(NSMutableArray *)self->_personChanges count]
      && ![(NSMutableArray *)self->_suggestionChanges count]
      && ![(NSMutableArray *)self->_userFeedbackChanges count]
      && ![(NSMutableArray *)self->_libraryScopeChanges count]
      && ![(NSMutableArray *)self->_socialGroupChanges count]
      && ![(NSMutableSet *)self->_updatedRelationship count]
      && [(NSMutableArray *)self->_deletedRecords count] == 0;
}

- (PLCloudUploadChanges)init
{
  v49.receiver = self;
  v49.super_class = (Class)PLCloudUploadChanges;
  v2 = [(PLCloudUploadChanges *)&v49 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    insertedAssets = v2->_insertedAssets;
    v2->_insertedAssets = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updatedAssets = v2->_updatedAssets;
    v2->_updatedAssets = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deferredAssets = v2->_deferredAssets;
    v2->_deferredAssets = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updatedMasters = v2->_updatedMasters;
    v2->_updatedMasters = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    insertedResources = v2->_insertedResources;
    v2->_insertedResources = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updatedResources = v2->_updatedResources;
    v2->_updatedResources = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    propertyChangedAssetUuids = v2->_propertyChangedAssetUuids;
    v2->_propertyChangedAssetUuids = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    sharingPropertyChangedAssetUuids = v2->_sharingPropertyChangedAssetUuids;
    v2->_sharingPropertyChangedAssetUuids = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    computeSyncChangedAssets = v2->_computeSyncChangedAssets;
    v2->_computeSyncChangedAssets = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    adjustedAssetUuids = v2->_adjustedAssetUuids;
    v2->_adjustedAssetUuids = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    faceChangedAssetUuids = v2->_faceChangedAssetUuids;
    v2->_faceChangedAssetUuids = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    albumInserts = v2->_albumInserts;
    v2->_albumInserts = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    albumChanges = v2->_albumChanges;
    v2->_albumChanges = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    memoryChanges = v2->_memoryChanges;
    v2->_memoryChanges = v29;

    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    personChanges = v2->_personChanges;
    v2->_personChanges = v31;

    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    faceCropChanges = v2->_faceCropChanges;
    v2->_faceCropChanges = v33;

    v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    suggestionChanges = v2->_suggestionChanges;
    v2->_suggestionChanges = v35;

    v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    userFeedbackChanges = v2->_userFeedbackChanges;
    v2->_userFeedbackChanges = v37;

    v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    libraryScopeChanges = v2->_libraryScopeChanges;
    v2->_libraryScopeChanges = v39;

    v41 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    socialGroupChanges = v2->_socialGroupChanges;
    v2->_socialGroupChanges = v41;

    v43 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    updatedRelationship = v2->_updatedRelationship;
    v2->_updatedRelationship = v43;

    v45 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedRecords = v2->_deletedRecords;
    v2->_deletedRecords = v45;

    v47 = v2;
  }

  return v2;
}

@end