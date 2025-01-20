@interface PXCMMMomentShareInvitationsDataSourceState
+ (PXCMMMomentShareInvitationsDataSourceState)new;
- (NSDictionary)invitationsByMomentShareObjectID;
- (PHFetchResult)momentShares;
- (PXCMMMomentShareInvitationsDataSourceState)init;
- (PXCMMMomentShareInvitationsDataSourceState)initWithMomentShares:(id)a3 invitationsByMomentShareObjectID:(id)a4;
- (id)stateUpdatedWithChange:(id)a3 changeDetails:(id *)a4;
@end

@implementation PXCMMMomentShareInvitationsDataSourceState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationsByMomentShareObjectID, 0);
  objc_storeStrong((id *)&self->_momentShares, 0);
}

- (NSDictionary)invitationsByMomentShareObjectID
{
  return self->_invitationsByMomentShareObjectID;
}

- (PHFetchResult)momentShares
{
  return self->_momentShares;
}

- (id)stateUpdatedWithChange:(id)a3 changeDetails:(id *)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = self->_momentShares;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [v5 changeDetailsForFetchResult:v6];
  v54 = v6;
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__PXCMMMomentShareInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke;
    aBlock[3] = &unk_1E5DB05B0;
    id v69 = v7;
    v9 = (void (**)(void *, void))_Block_copy(aBlock);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v10 = [v8 insertedObjects];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v65 != v13) {
            objc_enumerationMutation(v10);
          }
          v9[2](v9, *(void *)(*((void *)&v64 + 1) + 8 * i));
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v64 objects:v71 count:16];
      }
      while (v12);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v15 = [v8 changedObjects];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v61 != v18) {
            objc_enumerationMutation(v15);
          }
          v9[2](v9, *(void *)(*((void *)&v60 + 1) + 8 * j));
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v60 objects:v70 count:16];
      }
      while (v17);
    }

    v20 = [v8 fetchResultAfterChanges];
  }
  else
  {
    v20 = v6;
  }
  v21 = v20;
  v22 = [(PHFetchResult *)v20 fetchedObjectIDs];
  v23 = [v8 changedIndexes];
  v24 = (void *)[v23 mutableCopy];
  v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    id v26 = [MEMORY[0x1E4F28E60] indexSet];
  }
  v27 = v26;

  id v28 = [(PXCMMMomentShareInvitationsDataSourceState *)self invitationsByMomentShareObjectID];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __83__PXCMMMomentShareInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke_2;
  v55[3] = &unk_1E5DB05D8;
  id v29 = v7;
  id v56 = v29;
  id v52 = v22;
  id v57 = v52;
  id v30 = v5;
  id v58 = v30;
  id v31 = v27;
  id v59 = v31;
  [v28 enumerateKeysAndObjectsUsingBlock:v55];
  v32 = [v8 removedObjects];
  if (v32)
  {

    v33 = v54;
  }
  else
  {
    v33 = v54;
    if (![v29 count])
    {
      id v34 = v28;
      goto LABEL_27;
    }
  }
  id v34 = (id)[v28 mutableCopy];
  v35 = [v8 removedObjects];

  if (v35)
  {
    v36 = [v8 removedObjects];
    [v34 removeObjectsForKeys:v36];
  }
  [v34 addEntriesFromDictionary:v29];
LABEL_27:
  if (v21 == v33 && v34 == v28) {
    v37 = self;
  }
  else {
    v37 = [[PXCMMMomentShareInvitationsDataSourceState alloc] initWithMomentShares:v21 invitationsByMomentShareObjectID:v34];
  }
  v38 = v37;
  if (a4)
  {
    v51 = v21;
    v50 = v28;
    v39 = v37;
    id v40 = objc_alloc((Class)off_1E5DA5568);
    [v8 removedIndexes];
    id v41 = v29;
    v43 = id v42 = v30;
    v44 = [v8 insertedIndexes];
    v45 = [v8 movedIndexes];
    uint64_t v46 = objc_msgSend(v40, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v43, v44, v45, objc_msgSend(v8, "movedFromIndexes"), v31);

    v33 = v54;
    id v30 = v42;
    id v29 = v41;
    v47 = (void *)v46;
    v38 = v39;
    id v28 = v50;
    id v48 = v47;
    *a4 = v48;
    v21 = v51;
  }
  return v38;
}

void __83__PXCMMMomentShareInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = +[PXCMMMomentShareInvitation invitationWithMomentShare:v3];
  v4 = *(void **)(a1 + 32);
  id v5 = [v3 objectID];

  [v4 setObject:v6 forKeyedSubscript:v5];
}

void __83__PXCMMMomentShareInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 participantsFetchResult];
  uint64_t v7 = [v5 previewAssetsFetchResult];
  if (v6 | v7)
  {
    v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v19];
    if (v8)
    {
LABEL_3:

      goto LABEL_4;
    }
    v9 = *(void **)(a1 + 40);
    if (!v9)
    {
      v8 = 0;
      goto LABEL_3;
    }
    uint64_t v10 = [v9 indexOfObject:v19];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = v10;
      if (v6)
      {
        uint64_t v12 = [*(id *)(a1 + 48) changeDetailsForFetchResult:v6];
        uint64_t v13 = v12;
        if (v12)
        {
          v14 = [v12 fetchResultAfterChanges];
          v8 = [v5 invitationWithUpdatedParticipantsFetchResult:v14];
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        v8 = 0;
        uint64_t v13 = 0;
      }
      if (v7)
      {
        v15 = [*(id *)(a1 + 48) changeDetailsForFetchResult:v7];

        if (v15)
        {
          if (v8) {
            uint64_t v16 = v8;
          }
          else {
            uint64_t v16 = v5;
          }
          uint64_t v17 = [v15 fetchResultAfterChanges];
          uint64_t v18 = [v16 invitationWithUpdatedPreviewAssetsFetchResult:v17];

          v8 = (void *)v18;
          uint64_t v13 = v15;
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      if (v8)
      {
        [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v19];
        [*(id *)(a1 + 56) addIndex:v11];
      }

      goto LABEL_3;
    }
  }
LABEL_4:
}

- (PXCMMMomentShareInvitationsDataSourceState)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMMomentShareInvitationsDataSourceManager.m", 342, @"%s is not available as initializer", "-[PXCMMMomentShareInvitationsDataSourceState init]");

  abort();
}

- (PXCMMMomentShareInvitationsDataSourceState)initWithMomentShares:(id)a3 invitationsByMomentShareObjectID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXCMMMomentShareInvitationsDataSourceState;
  v9 = [(PXCMMMomentShareInvitationsDataSourceState *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_momentShares, a3);
    objc_storeStrong((id *)&v10->_invitationsByMomentShareObjectID, a4);
  }

  return v10;
}

+ (PXCMMMomentShareInvitationsDataSourceState)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXCMMMomentShareInvitationsDataSourceManager.m", 346, @"%s is not available as initializer", "+[PXCMMMomentShareInvitationsDataSourceState new]");

  abort();
}

@end