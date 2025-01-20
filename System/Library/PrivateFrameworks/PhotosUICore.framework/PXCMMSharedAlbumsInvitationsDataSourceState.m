@interface PXCMMSharedAlbumsInvitationsDataSourceState
- (NSDictionary)invitationsBySharedAlbumObjectID;
- (PHFetchResult)sharedAlbums;
- (PXCMMSharedAlbumsInvitationsDataSourceState)initWithSharedAlbums:(id)a3 invitationsBySharedAlbumObjectID:(id)a4;
- (id)stateUpdatedWithChange:(id)a3 changeDetails:(id *)a4;
@end

@implementation PXCMMSharedAlbumsInvitationsDataSourceState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationsBySharedAlbumObjectID, 0);
  objc_storeStrong((id *)&self->_sharedAlbums, 0);
}

- (NSDictionary)invitationsBySharedAlbumObjectID
{
  return self->_invitationsBySharedAlbumObjectID;
}

- (PHFetchResult)sharedAlbums
{
  return self->_sharedAlbums;
}

- (id)stateUpdatedWithChange:(id)a3 changeDetails:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PXCMMSharedAlbumsInvitationsDataSourceState *)self sharedAlbums];
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [v5 changeDetailsForFetchResult:v6];
  v44 = v6;
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__PXCMMSharedAlbumsInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke;
    aBlock[3] = &unk_1E5DC3BF0;
    id v59 = v7;
    v9 = (void (**)(void *, void))_Block_copy(aBlock);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v10 = [v8 insertedObjects];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v54 objects:v61 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v55 != v13) {
            objc_enumerationMutation(v10);
          }
          v9[2](v9, *(void *)(*((void *)&v54 + 1) + 8 * i));
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v54 objects:v61 count:16];
      }
      while (v12);
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v15 = [v8 changedObjects];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v60 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v51 != v18) {
            objc_enumerationMutation(v15);
          }
          v9[2](v9, *(void *)(*((void *)&v50 + 1) + 8 * j));
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v60 count:16];
      }
      while (v17);
    }

    id v20 = [v8 fetchResultAfterChanges];
    id v6 = v44;
  }
  else
  {
    id v20 = v6;
  }
  v21 = [v20 fetchedObjectIDs];
  v22 = [v8 changedIndexes];
  if (v22)
  {
    v23 = [v8 changedIndexes];
    v24 = (void *)[v23 mutableCopy];
  }
  else
  {
    v24 = [MEMORY[0x1E4F28E60] indexSet];
  }

  id v25 = [(PXCMMSharedAlbumsInvitationsDataSourceState *)self invitationsBySharedAlbumObjectID];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __84__PXCMMSharedAlbumsInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke_2;
  v45[3] = &unk_1E5DBC208;
  id v26 = v7;
  id v46 = v26;
  id v41 = v21;
  id v47 = v41;
  id v27 = v5;
  id v48 = v27;
  id v28 = v24;
  id v49 = v28;
  [v25 enumerateKeysAndObjectsUsingBlock:v45];
  v29 = [v8 removedObjects];
  if (v29)
  {
  }
  else if (![v26 count])
  {
    id v30 = v25;
    goto LABEL_27;
  }
  id v30 = (id)[v25 mutableCopy];
  v31 = [v8 removedObjects];

  if (v31)
  {
    v32 = [v8 removedObjects];
    [v30 removeObjectsForKeys:v32];
  }
  [v30 addEntriesFromDictionary:v26];
LABEL_27:
  v42 = v27;
  if (v20 == v6 && v30 == v25) {
    v33 = self;
  }
  else {
    v33 = [[PXCMMSharedAlbumsInvitationsDataSourceState alloc] initWithSharedAlbums:v20 invitationsBySharedAlbumObjectID:v30];
  }
  v40 = v33;
  id v34 = objc_alloc((Class)off_1E5DA5568);
  v35 = [v8 removedIndexes];
  v36 = [v8 insertedIndexes];
  v37 = [v8 movedIndexes];
  v38 = objc_msgSend(v34, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v35, v36, v37, objc_msgSend(v8, "movedFromIndexes"), v28);

  if (a4) {
    *a4 = v38;
  }

  return v40;
}

void __84__PXCMMSharedAlbumsInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = +[PXCMMSharedAlbumInvitation invitationWithAssetCollection:v3];
  v4 = *(void **)(a1 + 32);
  id v5 = [v3 objectID];

  [v4 setObject:v6 forKeyedSubscript:v5];
}

void __84__PXCMMSharedAlbumsInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 previewAssetsFetchResult];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
    if (v8) {
      goto LABEL_3;
    }
    v9 = *(void **)(a1 + 40);
    if (!v9) {
      goto LABEL_3;
    }
    uint64_t v10 = [v9 indexOfObject:v14];

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = *(void **)(a1 + 48);
      uint64_t v12 = [v5 previewAssetsFetchResult];
      v7 = [v11 changeDetailsForFetchResult:v12];

      if (!v7) {
        goto LABEL_4;
      }
      uint64_t v13 = [v7 fetchResultAfterChanges];
      v8 = [v5 invitationWithUpdatedPreviewAssetsFetchResult:v13];

      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v14];
      [*(id *)(a1 + 56) addIndex:v10];
LABEL_3:

LABEL_4:
    }
  }
}

- (PXCMMSharedAlbumsInvitationsDataSourceState)initWithSharedAlbums:(id)a3 invitationsBySharedAlbumObjectID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXCMMSharedAlbumsInvitationsDataSourceState;
  v9 = [(PXCMMSharedAlbumsInvitationsDataSourceState *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharedAlbums, a3);
    objc_storeStrong((id *)&v10->_invitationsBySharedAlbumObjectID, a4);
  }

  return v10;
}

@end