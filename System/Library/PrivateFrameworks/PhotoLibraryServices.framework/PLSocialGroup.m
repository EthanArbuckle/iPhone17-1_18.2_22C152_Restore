@interface PLSocialGroup
+ (BOOL)_verifiedTypeChangeFromRejectedToUserWithSourceNode:(id)a3;
+ (BOOL)deleteDuplicateGraphAndUnverifiedGroupsInContext:(id)a3 error:(id *)a4;
+ (BOOL)deleteDuplicateGroupsAfterInsertionOfGroup:(id)a3 error:(id *)a4;
+ (BOOL)deleteSocialGroupsHavingMember:(id)a3;
+ (BOOL)rejectSocialGroupsHavingMember:(id)a3;
+ (BOOL)resetAllInContext:(id)a3 error:(id *)a4;
+ (BOOL)runAssetContainmentOnAllSocialGroupsInContext:(id)a3 error:(id *)a4;
+ (NSString)cloudUUIDKeyForDeletion;
+ (id)_fetchDuplicateSocialGroupNodes:(id)a3 error:(id *)a4;
+ (id)_memberIDsByNodeIDFromEdgeDictionaries:(id)a3;
+ (id)_personsFromEdges:(id)a3;
+ (id)_primaryLabelPredicateWithContext:(id)a3;
+ (id)_socialGroupsNodesContainingMember:(id)a3;
+ (id)_sortableKeyPaths;
+ (id)_syncablePredicate;
+ (id)changeFlagsKeysByNodeContainerKey;
+ (id)defaultValueForRequiredNodeValueKey:(id)a3 forNode:(id)a4;
+ (id)fetchAssetIDsHavingAssetPersonEdgesToPersonID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5;
+ (id)fetchDuplicateSocialGroupIDsWithMemberIDs:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)keyAssetUUIDOfSocialGroupWithPersonUUIDs:(id)a3 candidateAssetUUIDs:(id)a4 inLibrary:(id)a5 error:(id *)a6;
+ (id)newNodeContainerWithManagedObjectContext:(id)a3;
+ (id)predicateForAllVerifiedSocialGroupsInContext:(id)a3;
+ (id)predicateForUserVerifiedSocialGroupsInContext:(id)a3;
+ (id)requiredNodeValueKeys;
+ (id)resetAllInLibrary:(id)a3 completion:(id)a4;
+ (id)socialGroupsToUploadInManagedObjectContext:(id)a3 limit:(int64_t)a4;
+ (id)sortableKeys;
+ (int64_t)cloudDeletionTypeForTombstone:(id)a3;
+ (void)_deleteUserAndGraphGroupsFromDuplicateGroupNodes:(id)a3 inContext:(id)a4;
+ (void)didSaveWithNode:(id)a3;
+ (void)prepareForDeletionWithNode:(id)a3;
+ (void)updateKeyAssetOfSocialGroupsWithUUIDs:(id)a3 inLibrary:(id)a4;
+ (void)willSaveWithNode:(id)a3;
- (BOOL)_existingExclusiveAssetEdgeOut;
- (BOOL)_updateAssetEdgesWithAssetContainmentResult:(id)a3 assetIDsToUpdate:(id)a4 error:(id *)a5;
- (BOOL)addMember:(id)a3 error:(id *)a4;
- (BOOL)isSyncableChange;
- (BOOL)keyAssetIsNeeded;
- (BOOL)removeMember:(id)a3 error:(id *)a4;
- (BOOL)resetCustomDataWithError:(id *)a3;
- (BOOL)runAssetContainmentWithError:(id *)a3 assetIDsToUpdate:(id)a4;
- (BOOL)setKeyAsset:(id)a3 error:(id *)a4;
- (BOOL)setKeyAssetPickSource:(int64_t)a3 error:(id *)a4;
- (BOOL)setMembers:(id)a3 error:(id *)a4;
- (BOOL)setSocialGroupVerifiedType:(signed __int16)a3 error:(id *)a4;
- (BOOL)supportsCloudUpload;
- (NSNumber)automaticOrder;
- (NSNumber)manualOrder;
- (NSSet)members;
- (NSString)customTitle;
- (PLManagedAsset)keyAsset;
- (PLSocialGroup)initWithNode:(id)a3;
- (id)_exclusiveAssetEdgesOut;
- (id)_exclusiveAssetEdgesOutFetch;
- (id)_existingMemberEdgeForPerson:(id)a3 success:(BOOL *)a4 error:(id *)a5;
- (id)_inclusiveAssetEdgesOutForSpecificAssetIDs:(id)a3 prefetchEdgeLabels:(BOOL)a4;
- (id)_insertGraphEdgeForAsset:(id)a3 exclusiveLabel:(id)a4;
- (id)_insertMemberEdgeForPerson:(id)a3;
- (id)_keyAssetEdgeWithSuccess:(BOOL *)a3 error:(id *)a4;
- (id)_personEdgesOutWithError:(id *)a3;
- (id)cplSocialGroupChange;
- (id)exclusiveAssetIDs;
- (id)inclusiveAssetIDs;
- (id)localID;
- (id)runAssetContainmentWithCompletion:(id)a3;
- (id)scopeIdentifier;
- (id)scopedIdentifier;
- (int64_t)cloudDeletionType;
- (int64_t)keyAssetPickSource;
- (signed)socialGroupVerifiedType;
- (void)_fetchEdgesOut;
- (void)_resetExistingKeyAssetEdge:(id)a3 keyAssetLabel:(id)a4;
- (void)setAutomaticOrder:(id)a3;
- (void)setCustomTitle:(id)a3;
- (void)setManualOrder:(id)a3;
- (void)updateSocialGroupwithCPLSocialGroupChange:(id)a3 inPhotoLibrary:(id)a4;
@end

@implementation PLSocialGroup

- (BOOL)keyAssetIsNeeded
{
  int v3 = [(PLSocialGroup *)self socialGroupVerifiedType];
  v4 = [(PLSocialGroup *)self keyAsset];
  if ([(PLSocialGroup *)self keyAssetPickSource] == -1)
  {
    int v5 = 0;
  }
  else if (v4)
  {
    int v5 = [v4 isVisibleForSocialGroupKeyAssetFetch] ^ 1;
  }
  else
  {
    int v5 = 1;
  }
  BOOL v6 = (v3 + 1) >= 2
    && v5
    && [(PLSocialGroup *)self _existingExclusiveAssetEdgeOut];

  return v6;
}

- (BOOL)_updateAssetEdgesWithAssetContainmentResult:(id)a3 assetIDsToUpdate:(id)a4 error:(id *)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  v63 = self;
  id v60 = a4;
  v8 = -[PLSocialGroup _inclusiveAssetEdgesOutForSpecificAssetIDs:prefetchEdgeLabels:](self, "_inclusiveAssetEdgesOutForSpecificAssetIDs:prefetchEdgeLabels:");
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v79 objects:v88 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v80 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x19F38D3B0]();
        v17 = [v15 targetAsset];
        v18 = [v17 objectID];

        [v9 setObject:v15 forKeyedSubscript:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v79 objects:v88 count:16];
    }
    while (v12);
  }

  v19 = [(PLGraphNodeContainer *)v63 sourceNode];
  v20 = [v19 managedObjectContext];

  uint64_t v21 = [v62 inclusiveAssetIDs];
  v22 = +[PLManagedAsset fetchRequest];
  v64 = (void *)v21;
  v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v21];
  [v22 setPredicate:v23];

  v65 = [v62 exclusiveAssetIDs];
  v61 = objc_msgSend(v20, "pl_graphCache");
  v24 = [v61 labelWithCode:1004 inContext:v20];
  v25 = [PLEnumerateAndSaveController alloc];
  v26 = NSStringFromSelector(a2);
  v27 = [v20 pathManager];
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __84__PLSocialGroup__updateAssetEdgesWithAssetContainmentResult_assetIDsToUpdate_error___block_invoke;
  v77[3] = &unk_1E586FB88;
  id v78 = v20;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __84__PLSocialGroup__updateAssetEdgesWithAssetContainmentResult_assetIDsToUpdate_error___block_invoke_2;
  v72[3] = &unk_1E58652D8;
  id v57 = v9;
  id v73 = v57;
  id v56 = v65;
  id v74 = v56;
  id v54 = v24;
  id v75 = v54;
  v76 = v63;
  v58 = v22;
  id v66 = v78;
  uint64_t v28 = [(PLEnumerateAndSaveController *)v25 initWithName:v26 fetchRequest:v22 context:v78 pathManager:v27 concurrent:0 refreshAllAfterSave:0 generateContextBlock:v77 didFetchObjectIDsBlock:0 processResultBlock:v72];

  id v71 = 0;
  v53 = (void *)v28;
  LOBYTE(v28) = [(id)v28 processObjectsWithError:&v71];
  id v52 = v71;
  uint64_t v29 = 0;
  BOOL v55 = v28;
  if ((v28 & 1) == 0)
  {
    v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F8C500];
    uint64_t v86 = *MEMORY[0x1E4F28228];
    v87 = @"runAssetContainmentWithError: error getting asset from assetID";
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    uint64_t v29 = [v30 errorWithDomain:v31 code:41003 userInfo:v32];
  }
  v51 = (void *)v29;
  v33 = [v61 labelWithCode:1003 inContext:v66];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v34 = v10;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v67 objects:v85 count:16];
  v36 = v64;
  if (v35)
  {
    uint64_t v37 = v35;
    uint64_t v38 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v68 != v38) {
          objc_enumerationMutation(v34);
        }
        v40 = *(void **)(*((void *)&v67 + 1) + 8 * j);
        v41 = [v40 targetAsset];
        v42 = [v41 objectID];
        if (v42 && ([v36 containsObject:v42] & 1) == 0)
        {
          v43 = [v40 labels];
          int v44 = [v43 containsObject:v33];

          if (v44)
          {
            v45 = PLBackendGetLog();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              v46 = [v41 uuid];
              *(_DWORD *)buf = 138412290;
              v84 = v46;
              _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_ERROR, "[PLSocialGroup] Deleting user picked key asset edge for key asset with uuid %@", buf, 0xCu);
            }
          }
          [v66 deleteObject:v40];
          v36 = v64;
        }
      }
      uint64_t v37 = [v34 countByEnumeratingWithState:&v67 objects:v85 count:16];
    }
    while (v37);
  }

  [(PLGraphNodeContainer *)v63 updateChangeFlagsForNodeContainerKey:@"inclusiveAssetIDs"];
  [(PLGraphNodeContainer *)v63 updateChangeFlagsForNodeContainerKey:@"exclusiveAssetIDs"];
  id v47 = v51;
  v48 = v47;
  if (a5) {
    char v49 = v55;
  }
  else {
    char v49 = 1;
  }
  if ((v49 & 1) == 0) {
    *a5 = v47;
  }

  return v55;
}

id __84__PLSocialGroup__updateAssetEdgesWithAssetContainmentResult_assetIDsToUpdate_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __84__PLSocialGroup__updateAssetEdgesWithAssetContainmentResult_assetIDsToUpdate_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v16 = a3;
  v4 = *(void **)(a1 + 32);
  int v5 = [v16 objectID];
  BOOL v6 = [v4 objectForKeyedSubscript:v5];

  v7 = *(void **)(a1 + 40);
  v8 = [v16 objectID];
  int v9 = [v7 containsObject:v8];
  int v10 = v9;
  if (v6)
  {

    uint64_t v11 = [v6 labels];
    int v12 = [v11 containsObject:*(void *)(a1 + 48)];

    if (v10)
    {
      if ((v12 & 1) == 0) {
        [v6 addLabel:*(void *)(a1 + 48)];
      }
    }
    else if (v12)
    {
      [v6 removeLabel:*(void *)(a1 + 48)];
    }
  }
  else
  {
    if (v9) {
      uint64_t v13 = *(void **)(a1 + 48);
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = v13;

    id v15 = (id)[*(id *)(a1 + 56) _insertGraphEdgeForAsset:v16 exclusiveLabel:v14];
  }
}

- (BOOL)runAssetContainmentWithError:(id *)a3 assetIDsToUpdate:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([(PLSocialGroup *)self socialGroupVerifiedType] == -1
    || ![(PLSocialGroup *)self socialGroupVerifiedType])
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PLSocialGroup.m", 910, @"Invalid parameter not satisfying: %@", @"self.socialGroupVerifiedType != PLSocialGroupVerifiedTypeRejected && self.socialGroupVerifiedType != PLSocialGroupVerifiedTypeNone" object file lineNumber description];
  }
  v8 = [(PLGraphNodeContainer *)self sourceNode];
  int v9 = [v8 managedObjectContext];

  if (v9)
  {
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 1;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__14267;
    v32 = __Block_byref_object_dispose__14268;
    id v33 = 0;
    int v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __63__PLSocialGroup_runAssetContainmentWithError_assetIDsToUpdate___block_invoke;
    v22[3] = &unk_1E586C518;
    id v11 = v10;
    id v23 = v11;
    v24 = self;
    id v25 = v7;
    v26 = &v28;
    v27 = &v34;
    [v9 performBlockAndWait:v22];
    int v12 = *((unsigned __int8 *)v35 + 24);
    id v13 = (id)v29[5];
    id v14 = v13;
    if (!v12 && a3) {
      *a3 = v13;
    }

    BOOL v15 = *((unsigned char *)v35 + 24) != 0;
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28228];
    v39[0] = @"asset containment failed: no managed object context";
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    v18 = [v16 errorWithDomain:*MEMORY[0x1E4F8C500] code:46502 userInfo:v17];
    v19 = v18;
    if (a3) {
      *a3 = v18;
    }

    BOOL v15 = 0;
  }

  return v15;
}

void __63__PLSocialGroup_runAssetContainmentWithError_assetIDsToUpdate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  v2 = [[PLSocialGroupAssetContainment alloc] initWithSocialGroup:*(void *)(a1 + 40)];
  int v3 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void *)(v5 + 40);
  id v7 = (id *)(v5 + 40);
  uint64_t v6 = v8;
  if (v4)
  {
    uint64_t v18 = v6;
    int v9 = (id *)&v18;
    uint64_t v10 = [(PLSocialGroupAssetContainment *)v2 runAssetContainmentOnAssetIDs:v4 error:&v18];
  }
  else
  {
    uint64_t v17 = v6;
    int v9 = (id *)&v17;
    uint64_t v10 = [(PLSocialGroupAssetContainment *)v2 runAssetContainment:&v17];
  }
  id v11 = (void *)v10;
  objc_storeStrong(v7, *v9);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v11 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    int v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    obuint64_t j = *(id *)(v14 + 40);
    char v15 = [v12 _updateAssetEdgesWithAssetContainmentResult:v11 assetIDsToUpdate:v13 error:&obj];
    objc_storeStrong((id *)(v14 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v15;
  }
  [*(id *)(a1 + 32) resignCurrent];
}

- (id)runAssetContainmentWithCompletion:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F28F90];
  uint64_t v6 = [(PLSocialGroup *)self members];
  id v7 = objc_msgSend(v5, "progressWithTotalUnitCount:", objc_msgSend(v6, "count"));

  uint64_t v8 = [(PLGraphNodeContainer *)self sourceNode];
  int v9 = [v8 photoLibrary];

  if (!v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F8C500];
    uint64_t v23 = *MEMORY[0x1E4F28228];
    v24[0] = @"asset containment failed: no library";
    int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:46502 userInfo:v12];
    v4[2](v4, 0, v13);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__PLSocialGroup_runAssetContainmentWithCompletion___block_invoke;
  v19[3] = &unk_1E5874868;
  id v14 = v7;
  id v20 = v14;
  uint64_t v21 = self;
  id v22 = v4;
  char v15 = v4;
  [v9 performTransaction:v19];
  id v16 = v22;
  id v17 = v14;

  return v17;
}

void __51__PLSocialGroup_runAssetContainmentWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  v2 = *(void **)(a1 + 40);
  id v4 = 0;
  [v2 runAssetContainmentWithError:&v4 assetIDsToUpdate:0];
  id v3 = v4;
  [*(id *)(a1 + 32) resignCurrent];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)exclusiveAssetIDs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(PLSocialGroup *)self _exclusiveAssetEdgesOut];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) objectIDsForRelationshipNamed:@"targetAsset"];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  uint64_t v10 = (void *)[v3 copy];

  return v10;
}

- (id)inclusiveAssetIDs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(PLSocialGroup *)self _inclusiveAssetEdgesOutForSpecificAssetIDs:0 prefetchEdgeLabels:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) objectIDsForRelationshipNamed:@"targetAsset"];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  uint64_t v10 = (void *)[v3 copy];

  return v10;
}

- (BOOL)removeMember:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLSocialGroup.m", 849, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  uint64_t v8 = [(PLGraphNodeContainer *)self sourceNode];
  int v9 = [v8 managedObjectContext];

  unsigned __int8 v19 = 1;
  id v18 = 0;
  uint64_t v10 = [(PLSocialGroup *)self _existingMemberEdgeForPerson:v7 success:&v19 error:&v18];
  id v11 = v18;
  if (v10)
  {
    [v9 deleteObject:v10];
    [(PLGraphNodeContainer *)self updateChangeFlagsForNodeContainerKey:@"members"];
  }
  int v12 = v19;
  id v13 = v11;
  long long v14 = v13;
  if (!v12 && a4) {
    *a4 = v13;
  }

  BOOL v15 = v19;
  return v15;
}

- (BOOL)addMember:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLSocialGroup.m", 833, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  unsigned __int8 v18 = 1;
  id v17 = 0;
  uint64_t v8 = [(PLSocialGroup *)self _existingMemberEdgeForPerson:v7 success:&v18 error:&v17];
  id v9 = v17;
  int v10 = v18;
  if (!v8 && v18)
  {
    id v11 = [(PLSocialGroup *)self _insertMemberEdgeForPerson:v7];
    [(PLGraphNodeContainer *)self updateChangeFlagsForNodeContainerKey:@"members"];
    int v10 = v18;
  }
  id v12 = v9;
  id v13 = v12;
  if (!v10 && a4) {
    *a4 = v12;
  }

  BOOL v14 = v18;
  return v14;
}

- (BOOL)setMembers:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLSocialGroup.m", 809, @"Invalid parameter not satisfying: %@", @"members" object file lineNumber description];
  }
  uint64_t v8 = [(PLGraphNodeContainer *)self sourceNode];
  id v9 = [v8 managedObjectContext];

  int v10 = [(PLSocialGroup *)self _personEdgesOutWithError:a4];
  id v11 = v10;
  if (v10)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          [v9 deleteObject:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v13);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = [(PLSocialGroup *)self _insertMemberEdgeForPerson:*(void *)(*((void *)&v24 + 1) + 8 * j)];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v18);
    }

    [(PLGraphNodeContainer *)self updateChangeFlagsForNodeContainerKey:@"members"];
  }

  return v11 != 0;
}

- (NSSet)members
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  v2 = [(PLSocialGroup *)self _personEdgesOutWithError:&v7];
  id v3 = v7;
  if (v2)
  {
    id v4 = [(id)objc_opt_class() _personsFromEdges:v2];
  }
  else
  {
    uint64_t v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch member edges with error: %@", buf, 0xCu);
    }

    id v4 = 0;
  }

  return (NSSet *)v4;
}

- (BOOL)setKeyAssetPickSource:(int64_t)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = [(PLGraphNodeContainer *)self sourceNode];
  uint64_t v8 = [v7 managedObjectContext];

  id v9 = objc_msgSend(v8, "pl_graphCache");
  uint64_t v10 = [v9 labelWithCode:1003 inContext:v8];
  char v26 = 1;
  id v25 = 0;
  id v11 = [(PLSocialGroup *)self _keyAssetEdgeWithSuccess:&v26 error:&v25];
  id v12 = v25;
  uint64_t v13 = v12;
  if (!v26)
  {
    if (a4)
    {
      BOOL v15 = 0;
      *a4 = v12;
      goto LABEL_19;
    }
LABEL_15:
    BOOL v15 = 0;
    goto LABEL_19;
  }
  if (!v11)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F8C500];
    uint64_t v29 = *MEMORY[0x1E4F28228];
    v30[0] = @"no key asset edge";
    uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v19 = (__CFString **)v30;
    id v20 = &v29;
LABEL_12:
    id v21 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
    id v22 = [v16 errorWithDomain:v17 code:46502 userInfo:v21];
    uint64_t v23 = v22;
    if (a4) {
      *a4 = v22;
    }

    goto LABEL_15;
  }
  int v14 = [v11 hasLabel:v10];
  if (a3 == -1)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F8C500];
    uint64_t v27 = *MEMORY[0x1E4F28228];
    long long v28 = @"Invalid key-asset pick source";
    uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v19 = &v28;
    id v20 = &v27;
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    if ((v14 & 1) == 0) {
      [v11 addLabel:v10];
    }
  }
  else if (!a3 && v14)
  {
    [v11 removeLabel:v10];
  }
  [(PLGraphNodeContainer *)self updateChangeFlagsForNodeContainerKey:@"keyAssetPickSource"];
  BOOL v15 = 1;
LABEL_19:

  return v15;
}

- (int64_t)keyAssetPickSource
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v8 = 1;
  id v7 = 0;
  v2 = [(PLSocialGroup *)self _keyAssetEdgeWithSuccess:&v8 error:&v7];
  id v3 = v7;
  if (v8)
  {
    int64_t v4 = [v2 hasLabelWithCode:1003];
  }
  else
  {
    uint64_t v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Error fetching key asset edge: %@", buf, 0xCu);
    }

    int64_t v4 = -1;
  }

  return v4;
}

- (BOOL)setKeyAsset:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"PLSocialGroup.m", 689, @"Invalid parameter not satisfying: %@", @"keyAsset" object file lineNumber description];
  }
  unsigned __int8 v48 = 1;
  id v47 = 0;
  id v8 = [(PLSocialGroup *)self _keyAssetEdgeWithSuccess:&v48 error:&v47];
  id v9 = v47;
  id v10 = v9;
  int v11 = v48;
  if (v48)
  {
    if (!v8
      || ([v8 targetAsset],
          id v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v12 isEqual:v7],
          v12,
          (v13 & 1) == 0))
    {
      v41 = v10;
      int v14 = [(PLGraphNodeContainer *)self sourceNode];
      BOOL v15 = [v14 managedObjectContext];

      id v16 = objc_msgSend(v15, "pl_graphCache");
      uint64_t v17 = [v16 labelWithCode:1001 inContext:v15];
      v40 = v16;
      v42 = [v16 labelWithCode:1004 inContext:v15];
      if (v8)
      {
        [(PLSocialGroup *)self _resetExistingKeyAssetEdge:v8 keyAssetLabel:v17];
      }
      v39 = (void *)v17;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v18 = [(PLSocialGroup *)self _inclusiveAssetEdgesOutForSpecificAssetIDs:0 prefetchEdgeLabels:0];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v44;
LABEL_10:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v44 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v43 + 1) + 8 * v22);
          long long v24 = [v23 targetAsset];
          if ([v24 isEqual:v7]) {
            break;
          }

          if (v20 == ++v22)
          {
            uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v51 count:16];
            if (v20) {
              goto LABEL_10;
            }
            goto LABEL_16;
          }
        }
        uint64_t v27 = [v23 labels];
        char v28 = [v27 containsObject:v42];

        id v25 = v40;
        if ((v28 & 1) == 0)
        {
          [0 addLabel:v42];
          uint64_t v29 = PLBackendGetLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            long long v30 = [v7 uuid];
            *(_DWORD *)buf = 138412290;
            v50 = v30;
            _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "[PLSocialGroup] Missing exclusive label from social group key asset edge found for key asset with uuid %@", buf, 0xCu);
          }
        }
        id v8 = v23;

        id v10 = v41;
        char v26 = v39;
        if (v8) {
          goto LABEL_27;
        }
      }
      else
      {
LABEL_16:

        id v25 = v40;
        id v10 = v41;
        char v26 = v39;
      }
      long long v31 = PLBackendGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = [v7 uuid];
        *(_DWORD *)buf = 138412290;
        v50 = v32;
        _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "[PLSocialGroup] No existing social group key asset edge found for key asset with uuid %@", buf, 0xCu);
      }
      id v33 = +[PLGraphEdge entityName];
      PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v33, (uint64_t)v15, 0);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v34 = [(PLGraphNodeContainer *)self sourceNode];
      [v8 setSourceNode:v34];

      [v8 setTargetAsset:v7];
      uint64_t v35 = [v25 labelWithCode:1004 inContext:v15];
      uint64_t v36 = [MEMORY[0x1E4F1CAD0] setWithObject:v35];
      [v8 setLabels:v36];

LABEL_27:
      [v8 addLabel:v26];
      [(PLGraphNodeContainer *)self updateChangeFlagsForNodeContainerKey:@"keyAsset"];
    }
  }
  else if (a4)
  {
    *a4 = v9;
  }

  return v11 != 0;
}

- (void)_resetExistingKeyAssetEdge:(id)a3 keyAssetLabel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLGraphNodeContainer *)self sourceNode];
  id v11 = [v8 managedObjectContext];

  id v9 = objc_msgSend(v11, "pl_graphCache");
  [v7 removeLabel:v6];

  id v10 = [v9 labelWithCode:1003 inContext:v11];
  [v7 removeLabel:v10];
}

- (PLManagedAsset)keyAsset
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v8 = 1;
  id v7 = 0;
  v2 = [(PLSocialGroup *)self _keyAssetEdgeWithSuccess:&v8 error:&v7];
  id v3 = v7;
  if (!v8)
  {
    int64_t v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Error fetching key asset: %@", buf, 0xCu);
    }
  }
  uint64_t v5 = [v2 targetAsset];

  return (PLManagedAsset *)v5;
}

- (BOOL)setSocialGroupVerifiedType:(signed __int16)a3 error:(id *)a4
{
  int v5 = a3;
  id v7 = [(PLGraphNodeContainer *)self sourceNode];
  BOOL v8 = 1;
  id v9 = [v7 nodeValueWithName:@"socialGroupVerifiedType" createIfMissing:1];

  if ([v9 intValue] != v5)
  {
    uint64_t v10 = v5;
    if (v5 == -1 && [v9 intValue] == 1)
    {
      id v14 = 0;
      BOOL v8 = [(PLSocialGroup *)self resetCustomDataWithError:&v14];
      id v11 = v14;
      id v12 = v11;
      if (!v8 && a4) {
        *a4 = v11;
      }
    }
    [v9 setIntValue:v10];
    [(PLGraphNodeContainer *)self updateChangeFlagsForNodeContainerKey:@"socialGroupVerifiedType"];
  }

  return v8;
}

- (BOOL)resetCustomDataWithError:(id *)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  [(PLSocialGroup *)self setCustomTitle:0];
  [(PLSocialGroup *)self setManualOrder:&unk_1EEBED560];
  char v27 = 1;
  if ([(PLSocialGroup *)self keyAssetPickSource] == 1)
  {
    id v26 = 0;
    int v5 = [(PLSocialGroup *)self _keyAssetEdgeWithSuccess:&v27 error:&v26];
    id v6 = v26;
    id v7 = v6;
    if (v27)
    {
      if (v5)
      {
        id v25 = v6;
        BOOL v8 = [(PLSocialGroup *)self setKeyAssetPickSource:0 error:&v25];
        id v9 = v25;

        if (!v8)
        {
          if (a3) {
            *a3 = v9;
          }
          char v27 = 0;
        }
        uint64_t v10 = [(PLGraphNodeContainer *)self sourceNode];
        id v11 = [v10 managedObjectContext];

        id v12 = objc_msgSend(v11, "pl_graphCache");
        char v13 = [v12 labelWithCode:1001 inContext:v11];
        [v5 removeLabel:v13];
        [(PLGraphNodeContainer *)self updateChangeFlagsForNodeContainerKey:@"keyAsset"];

        id v7 = v9;
        goto LABEL_20;
      }
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F8C500];
      uint64_t v30 = *MEMORY[0x1E4F28228];
      v31[0] = @"no key asset edge";
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      uint64_t v23 = [v20 errorWithDomain:v21 code:46502 userInfo:v22];
      long long v24 = v23;
      if (a3) {
        *a3 = v23;
      }
    }
    else if (a3)
    {
      *a3 = v6;
    }
    char v27 = 0;
LABEL_20:

    return v27 != 0;
  }
  if ([(PLSocialGroup *)self keyAssetPickSource] != -1) {
    return 1;
  }
  BOOL v15 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v16 = *MEMORY[0x1E4F8C500];
  uint64_t v28 = *MEMORY[0x1E4F28228];
  uint64_t v29 = @"Error fetching key asset pick source during custom data reset";
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  uint64_t v18 = [v15 errorWithDomain:v16 code:46502 userInfo:v17];
  uint64_t v19 = v18;
  if (a3) {
    *a3 = v18;
  }

  return 0;
}

- (signed)socialGroupVerifiedType
{
  v2 = [(PLGraphNodeContainer *)self sourceNode];
  id v3 = [v2 nodeValueWithName:@"socialGroupVerifiedType"];

  LOWORD(v2) = [v3 intValue];
  return (__int16)v2;
}

- (void)setAutomaticOrder:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLSocialGroup.m", 598, @"Invalid parameter not satisfying: %@", @"automaticOrder" object file lineNumber description];
  }
  int v5 = [(PLGraphNodeContainer *)self sourceNode];
  id v6 = [v5 nodeValueWithName:@"automaticOrder" createIfMissing:1];

  objc_msgSend(v6, "setIntValue:", objc_msgSend(v8, "integerValue"));
  [(PLGraphNodeContainer *)self updateChangeFlagsForNodeContainerKey:@"automaticOrder"];
}

- (NSNumber)automaticOrder
{
  v2 = [(PLGraphNodeContainer *)self sourceNode];
  id v3 = [v2 nodeValueWithName:@"automaticOrder"];

  int64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "intValue"));

  return (NSNumber *)v4;
}

- (void)setManualOrder:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLSocialGroup.m", 584, @"Invalid parameter not satisfying: %@", @"manualOrder" object file lineNumber description];
  }
  int v5 = [(PLGraphNodeContainer *)self sourceNode];
  id v6 = [v5 nodeValueWithName:@"manualOrder" createIfMissing:1];

  objc_msgSend(v6, "setIntValue:", objc_msgSend(v8, "integerValue"));
  [(PLGraphNodeContainer *)self updateChangeFlagsForNodeContainerKey:@"manualOrder"];
}

- (NSNumber)manualOrder
{
  v2 = [(PLGraphNodeContainer *)self sourceNode];
  id v3 = [v2 nodeValueWithName:@"manualOrder"];

  int64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "intValue"));

  return (NSNumber *)v4;
}

- (void)setCustomTitle:(id)a3
{
  id v4 = a3;
  int v5 = [(PLGraphNodeContainer *)self sourceNode];
  id v6 = [v5 nodeValueWithName:@"customTitle" createIfMissing:1];

  [v6 setStringValue:v4];
  [(PLGraphNodeContainer *)self updateChangeFlagsForNodeContainerKey:@"customTitle"];
}

- (NSString)customTitle
{
  v2 = [(PLGraphNodeContainer *)self sourceNode];
  id v3 = [v2 nodeValueWithName:@"customTitle"];

  id v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (PLSocialGroup)initWithNode:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLSocialGroup.m", 512, @"Invalid parameter not satisfying: %@", @"node" object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)PLSocialGroup;
  id v6 = [(PLGraphNodeContainer *)&v9 initWithNode:v5];

  return v6;
}

- (BOOL)_existingExclusiveAssetEdgeOut
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLGraphNodeContainer *)self sourceNode];
  id v4 = [v3 managedObjectContext];

  id v5 = [(PLSocialGroup *)self _exclusiveAssetEdgesOutFetch];
  [v5 setFetchLimit:1];
  id v10 = 0;
  uint64_t v6 = [v4 countForFetchRequest:v5 error:&v10];
  id v7 = v10;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "_existingExclusiveAssetEdgeOut: fetch request failed: %@", buf, 0xCu);
    }

    uint64_t v6 = 0;
  }

  return v6 != 0;
}

- (id)_exclusiveAssetEdgesOut
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLGraphNodeContainer *)self sourceNode];
  id v4 = [v3 managedObjectContext];

  id v5 = [(PLSocialGroup *)self _exclusiveAssetEdgesOutFetch];
  id v12 = 0;
  uint64_t v6 = [v4 executeFetchRequest:v5 error:&v12];
  id v7 = v12;
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  }
  else
  {
    objc_super v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Error fetching social group exclusive asset edges: %@", buf, 0xCu);
    }

    uint64_t v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v10 = (void *)v8;

  return v10;
}

- (id)_exclusiveAssetEdgesOutFetch
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(PLGraphNodeContainer *)self sourceNode];
  id v4 = [v3 managedObjectContext];

  id v5 = objc_msgSend(v4, "pl_graphCache");
  uint64_t v6 = [v5 labelWithCode:1004 inContext:v4];
  id v7 = +[PLGraphEdge fetchRequest];
  uint64_t v8 = (void *)MEMORY[0x1E4F28BA0];
  objc_super v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [(PLGraphNodeContainer *)self sourceNode];
  id v11 = [v9 predicateWithFormat:@"%K = %@", @"sourceNode", v10];
  v17[0] = v11;
  id v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"targetAsset");
  v17[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K", v6, @"labels"];
  v17[2] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  uint64_t v15 = [v8 andPredicateWithSubpredicates:v14];
  [v7 setPredicate:v15];

  return v7;
}

- (id)_inclusiveAssetEdgesOutForSpecificAssetIDs:(id)a3 prefetchEdgeLabels:(BOOL)a4
{
  BOOL v4 = a4;
  void v31[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PLGraphNodeContainer *)self sourceNode];
  uint64_t v8 = [v7 managedObjectContext];

  objc_super v9 = +[PLGraphEdge fetchRequest];
  id v10 = (void *)MEMORY[0x1E4F28BA0];
  id v11 = (void *)MEMORY[0x1E4F28F60];
  id v12 = [(PLGraphNodeContainer *)self sourceNode];
  uint64_t v13 = [v11 predicateWithFormat:@"%K = %@", @"sourceNode", v12];
  id v14 = (void *)v13;
  if (v6)
  {
    v30[0] = v13;
    uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"targetAsset", v6];
    v30[1] = v15;
    uint64_t v16 = v30;
  }
  else
  {
    v31[0] = v13;
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"targetAsset");
    v31[1] = v15;
    uint64_t v16 = v31;
  }
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  uint64_t v18 = [v10 andPredicateWithSubpredicates:v17];
  [v9 setPredicate:v18];

  if (v4)
  {
    uint64_t v29 = @"labels";
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    [v9 setRelationshipKeyPathsForPrefetching:v19];
  }
  id v26 = 0;
  uint64_t v20 = [v8 executeFetchRequest:v9 error:&v26];
  id v21 = v26;
  if (v20)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v20];
  }
  else
  {
    uint64_t v23 = PLBackendGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v21;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Error fetching social inclusive group asset edges: %@", buf, 0xCu);
    }

    uint64_t v22 = [MEMORY[0x1E4F1CAD0] set];
  }
  long long v24 = (void *)v22;

  return v24;
}

- (id)_insertGraphEdgeForAsset:(id)a3 exclusiveLabel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLSocialGroup.m", 402, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  objc_super v9 = [(PLGraphNodeContainer *)self sourceNode];
  id v10 = [v9 managedObjectContext];

  id v11 = +[PLGraphEdge entityName];
  id v12 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v11, (uint64_t)v10, 0);

  uint64_t v13 = [(PLGraphNodeContainer *)self sourceNode];
  [v12 setSourceNode:v13];

  [v12 setTargetAsset:v7];
  if (v8)
  {
    id v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
    [v12 setLabels:v14];
  }
  return v12;
}

- (id)_personEdgesOutWithError:(id *)a3
{
  id v5 = [(PLGraphNodeContainer *)self sourceNode];
  id v6 = [v5 managedObjectContext];

  id v7 = +[PLGraphEdge fetchRequest];
  id v8 = (void *)MEMORY[0x1E4F28F60];
  objc_super v9 = [(PLGraphNodeContainer *)self sourceNode];
  id v10 = [v8 predicateWithFormat:@"%K = %@ AND %K != nil", @"sourceNode", v9, @"targetPerson"];
  [v7 setPredicate:v10];

  id v16 = 0;
  id v11 = [v6 executeFetchRequest:v7 error:&v16];
  id v12 = v16;
  uint64_t v13 = v12;
  if (v11)
  {
    id v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  }
  else
  {
    id v14 = 0;
    if (a3) {
      *a3 = v12;
    }
  }

  return v14;
}

- (id)_keyAssetEdgeWithSuccess:(BOOL *)a3 error:(id *)a4
{
  v29[3] = *MEMORY[0x1E4F143B8];
  *a3 = 1;
  id v5 = [(PLGraphNodeContainer *)self sourceNode];
  id v6 = [v5 managedObjectContext];
  id v7 = objc_msgSend(v6, "pl_graphCache");

  id v8 = [(PLGraphNodeContainer *)self sourceNode];
  objc_super v9 = [v8 managedObjectContext];
  id v10 = [v7 labelWithCode:1001 inContext:v9];

  id v11 = +[PLGraphEdge fetchRequest];
  id v12 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v13 = (void *)MEMORY[0x1E4F28F60];
  id v14 = [(PLGraphNodeContainer *)self sourceNode];
  uint64_t v15 = [v13 predicateWithFormat:@"noindex:(%K) = %@", @"sourceNode", v14];
  v29[0] = v15;
  id v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) != nil", @"targetAsset");
  v29[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ in %K", v10, @"labels"];
  v29[2] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
  uint64_t v19 = [v12 andPredicateWithSubpredicates:v18];
  [v11 setPredicate:v19];

  uint64_t v20 = [(PLGraphNodeContainer *)self sourceNode];
  id v21 = [v20 managedObjectContext];
  id v28 = 0;
  uint64_t v22 = [v21 executeFetchRequest:v11 error:&v28];
  id v23 = v28;

  if (v22)
  {
    long long v24 = [v22 firstObject];
  }
  else
  {
    *a3 = 0;
    long long v24 = 0;
    if (a4) {
      *a4 = v23;
    }
  }

  return v24;
}

- (void)_fetchEdgesOut
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[PLGraphEdge fetchRequest];
  BOOL v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = [(PLGraphNodeContainer *)self sourceNode];
  id v6 = [v4 predicateWithFormat:@"%K = %@", @"sourceNode", v5];
  [v3 setPredicate:v6];

  v16[0] = @"labels";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v3 setRelationshipKeyPathsForPrefetching:v7];

  id v8 = [(PLGraphNodeContainer *)self sourceNode];
  objc_super v9 = [v8 managedObjectContext];
  id v13 = 0;
  id v10 = (id)[v9 executeFetchRequest:v3 error:&v13];
  id v11 = v13;

  if (v11)
  {
    id v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch graph edges with error: %@", buf, 0xCu);
    }
  }
}

- (id)_existingMemberEdgeForPerson:(id)a3 success:(BOOL *)a4 error:(id *)a5
{
  id v9 = a3;
  if (!v9)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PLSocialGroup.m", 322, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  id v10 = +[PLGraphEdge fetchRequest];
  id v11 = (void *)MEMORY[0x1E4F28F60];
  id v12 = [(PLGraphNodeContainer *)self sourceNode];
  id v13 = [v11 predicateWithFormat:@"%K = %@ AND %K = %@", @"sourceNode", v12, @"targetPerson", v9];
  [v10 setPredicate:v13];

  id v14 = [v9 managedObjectContext];
  id v22 = 0;
  id v15 = [v14 executeFetchRequest:v10 error:&v22];
  id v16 = v22;

  if (v15)
  {
    uint64_t v17 = [v15 firstObject];
    BOOL v18 = 1;
  }
  else if (a5)
  {
    id v19 = v16;
    BOOL v18 = 0;
    uint64_t v17 = 0;
    *a5 = v19;
  }
  else
  {
    BOOL v18 = 0;
    uint64_t v17 = 0;
  }
  *a4 = v18;

  return v17;
}

- (id)_insertMemberEdgeForPerson:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLSocialGroup.m", 310, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  id v6 = [(PLGraphNodeContainer *)self sourceNode];
  id v7 = [v6 managedObjectContext];

  id v8 = +[PLGraphEdge entityName];
  id v9 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);

  id v10 = [(PLGraphNodeContainer *)self sourceNode];
  [v9 setSourceNode:v10];

  [v9 setTargetPerson:v5];
  return v9;
}

+ (id)fetchAssetIDsHavingAssetPersonEdgesToPersonID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[PLGraphEdge fetchRequest];
  [v9 setResultType:2];
  v30[0] = @"sourceAsset";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v9 setPropertiesToFetch:v10];

  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != nil AND %K = %@", @"sourceAsset", @"targetPerson", v7];
  [v9 setPredicate:v11];

  id v28 = 0;
  id v12 = [v8 executeFetchRequest:v9 error:&v28];
  id v13 = v28;
  id v14 = v13;
  if (v12)
  {
    id v23 = v8;
    id v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = [*(id *)(*((void *)&v24 + 1) + 8 * i) objectForKeyedSubscript:@"sourceAsset"];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v18);
    }

    id v8 = v23;
  }
  else
  {
    id v15 = 0;
    if (a5) {
      *a5 = v13;
    }
  }

  return v15;
}

+ (id)predicateForUserVerifiedSocialGroupsInContext:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  BOOL v4 = [a1 _primaryLabelPredicateWithContext:a3];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $v, $v.%K == %@ AND $v.%K == %d).@count > 0", @"values", @"valueName", @"socialGroupVerifiedType", @"intValue", 1, v4];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v7 = [v3 andPredicateWithSubpredicates:v6];

  return v7;
}

+ (id)predicateForAllVerifiedSocialGroupsInContext:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  BOOL v4 = [a1 _primaryLabelPredicateWithContext:a3];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $v, $v.%K == %@ AND $v.%K > %d).@count > 0", @"values", @"valueName", @"socialGroupVerifiedType", @"intValue", 0, v4];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v7 = [v3 andPredicateWithSubpredicates:v6];

  return v7;
}

+ (id)_primaryLabelPredicateWithContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_msgSend(v3, "pl_graphCache");
  id v5 = [v4 objectIDForLabelWithCode:1000 inContext:v3];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"primaryLabel", v5];
  }
  else
  {
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "No social group label found in context %@", buf, 0xCu);
    }

    uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  }
  id v8 = (void *)v6;

  return v8;
}

+ (void)prepareForDeletionWithNode:(id)a3
{
  id v11 = a3;
  if ([v11 shouldUpdatePersistence])
  {
    id v3 = [PLDirectoryJournal alloc];
    BOOL v4 = [v11 managedObjectContext];
    id v5 = [v4 pathManager];
    uint64_t v6 = [(PLDirectoryJournal *)v3 initWithPathManager:v5 payloadClass:objc_opt_class()];

    [(PLDirectoryJournal *)v6 removePersistenceForManagedObject:v11 error:0];
  }
  objc_opt_class();
  id v7 = [v11 managedObjectContext];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = +[PLGraphNodeContainer newNodeContainerWithNode:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 recordCloudDeletionForObject:v10];
  }
}

+ (void)didSaveWithNode:(id)a3
{
  id v7 = a3;
  if ([v7 needsPersistenceUpdate])
  {
    id v3 = [PLDirectoryJournal alloc];
    BOOL v4 = [v7 managedObjectContext];
    id v5 = [v4 pathManager];
    uint64_t v6 = [(PLDirectoryJournal *)v3 initWithPathManager:v5 payloadClass:objc_opt_class()];

    [(PLDirectoryJournal *)v6 persistManagedObject:v7 error:0];
  }
}

+ (void)willSaveWithNode:(id)a3
{
  id v19 = a3;
  if ([v19 shouldUpdatePersistence])
  {
    BOOL v4 = [PLDirectoryJournal alloc];
    id v5 = [v19 managedObjectContext];
    uint64_t v6 = [v5 pathManager];
    id v7 = [(PLDirectoryJournal *)v4 initWithPathManager:v6 payloadClass:objc_opt_class()];

    objc_msgSend(v19, "setNeedsPersistenceUpdate:", -[PLDirectoryJournal shouldPersistManagedObject:](v7, "shouldPersistManagedObject:", v19));
  }
  if (([v19 isDeleted] & 1) == 0)
  {
    objc_opt_class();
    id v8 = [v19 managedObjectContext];
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    id v11 = +[PLGraphNodeContainer newNodeContainerWithNode:v19];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 isSyncableChange]) {
      [v10 recordSyncChangeMarker];
    }
    objc_opt_class();
    if (((objc_opt_isKindOfClass() & 1) != 0 || MEMORY[0x19F38C0C0]())
      && (([v19 isInserted] & 1) != 0
       || [a1 _verifiedTypeChangeFromRejectedToUserWithSourceNode:v19]))
    {
      if ([v19 isInserted])
      {
        uint64_t v12 = [v10 delayedSaveActions];
        [v12 recordDeduplicationNeededForNewGroupNode:v19];
      }
      id v13 = [v11 members];
      uint64_t v14 = [v13 count];

      if (v14)
      {
        id v15 = [v19 managedObjectContext];
        id v16 = [v15 delayedSaveActions];
        uint64_t v17 = [v11 members];
        uint64_t v18 = [v17 anyObject];
        [v16 recordSocialGroupContainmentUpdateNeededForPerson:v18];
      }
    }
  }
}

+ (BOOL)resetAllInContext:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PLSocialGroup.m", 1127, @"Invalid parameter not satisfying: %@", @"moc" object file lineNumber description];
  }
  id v8 = objc_msgSend(v7, "pl_graphCache");
  id v9 = [v8 objectIDForLabelWithCode:1000 inContext:v7];
  if (v9)
  {
    long long v26 = v8;
    id v10 = (void *)MEMORY[0x1E4F1C0D0];
    id v11 = +[PLGraphNode entityName];
    uint64_t v12 = [v10 fetchRequestWithEntityName:v11];

    id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"primaryLabel", v9];
    [v12 setPredicate:v13];

    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3032000000;
    char v37 = __Block_byref_object_copy__14267;
    uint64_t v38 = __Block_byref_object_dispose__14268;
    id v39 = 0;
    uint64_t v14 = [PLEnumerateAndSaveController alloc];
    id v15 = NSStringFromSelector(a2);
    id v16 = [v7 pathManager];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __41__PLSocialGroup_resetAllInContext_error___block_invoke;
    v32[3] = &unk_1E586FB88;
    id v33 = v7;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __41__PLSocialGroup_resetAllInContext_error___block_invoke_2;
    void v31[3] = &unk_1E5870AA8;
    v31[4] = &v34;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __41__PLSocialGroup_resetAllInContext_error___block_invoke_3;
    v28[3] = &unk_1E5865328;
    id v29 = v33;
    uint64_t v30 = &v34;
    uint64_t v17 = [(PLEnumerateAndSaveController *)v14 initWithName:v15 fetchRequest:v12 context:v29 pathManager:v16 concurrent:0 refreshAllAfterSave:0 generateContextBlock:v32 didFetchObjectIDsBlock:v31 processResultBlock:v28];

    [(PLEnumerateAndSaveController *)v17 setItemsPerBatch:1];
    id v27 = 0;
    char v18 = [(PLEnumerateAndSaveController *)v17 processObjectsWithError:&v27];
    id v19 = v27;
    uint64_t v20 = [(id)v35[5] totalUnitCount];
    [(id)v35[5] setCompletedUnitCount:v20];
    id v21 = v19;
    id v22 = v21;
    if (a4) {
      char v23 = v18;
    }
    else {
      char v23 = 1;
    }
    if ((v23 & 1) == 0) {
      *a4 = v21;
    }

    _Block_object_dispose(&v34, 8);
    id v8 = v26;
  }
  else
  {
    char v18 = 1;
  }

  return v18;
}

id __41__PLSocialGroup_resetAllInContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __41__PLSocialGroup_resetAllInContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", objc_msgSend(a2, "count"));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __41__PLSocialGroup_resetAllInContext_error___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteObject:");
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [v2 completedUnitCount] + 1;
  return [v2 setCompletedUnitCount:v3];
}

+ (id)resetAllInLibrary:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PLSocialGroup.m", 1111, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  id v9 = [v7 managedObjectContext];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  char v23 = __Block_byref_object_copy__14267;
  long long v24 = __Block_byref_object_dispose__14268;
  id v25 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__PLSocialGroup_resetAllInLibrary_completion___block_invoke;
  v15[3] = &unk_1E5865300;
  char v18 = &v20;
  id v19 = a1;
  id v10 = v9;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  [v7 performTransaction:v15];
  id v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __46__PLSocialGroup_resetAllInLibrary_completion___block_invoke(void *a1)
{
  [*(id *)(*(void *)(a1[6] + 8) + 40) becomeCurrentWithPendingUnitCount:1];
  v2 = (void *)a1[7];
  uint64_t v3 = a1[4];
  id v5 = 0;
  [v2 resetAllInContext:v3 error:&v5];
  id v4 = v5;
  [*(id *)(*(void *)(a1[6] + 8) + 40) resignCurrent];
  (*(void (**)(void))(a1[5] + 16))();
}

+ (id)keyAssetUUIDOfSocialGroupWithPersonUUIDs:(id)a3 candidateAssetUUIDs:(id)a4 inLibrary:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((unint64_t)[v9 count] >= 2)
  {
    id v13 = [v11 photoAnalysisClient];
    uint64_t v14 = [[PLPhotoAnalysisPhotoLibraryService alloc] initWithServiceProvider:v13];
    id v12 = [(PLPhotoAnalysisPhotoLibraryService *)v14 keyAssetUUIDOfSocialGroupWithPersonUUIDs:v9 candidateAssetUUIDs:v10 operationID:&stru_1EEB2EB80 error:a6];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (void)updateKeyAssetOfSocialGroupsWithUUIDs:(id)a3 inLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = +[PLConcurrencyLimiter sharedLimiter];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__PLSocialGroup_updateKeyAssetOfSocialGroupsWithUUIDs_inLibrary___block_invoke;
    v8[3] = &unk_1E5875E18;
    id v9 = v6;
    id v10 = v5;
    [v7 async:v8 identifyingBlock:0 library:v9];
  }
}

void __65__PLSocialGroup_updateKeyAssetOfSocialGroupsWithUUIDs_inLibrary___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photoAnalysisClient];
  uint64_t v3 = [[PLPhotoAnalysisPhotoLibraryService alloc] initWithServiceProvider:v2];
  id v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PLSocialGroup_updateKeyAssetOfSocialGroupsWithUUIDs_inLibrary___block_invoke_2;
  v5[3] = &unk_1E5873440;
  id v6 = v4;
  [(PLPhotoAnalysisPhotoLibraryService *)v3 updateKeyAssetOfSocialGroupsWithUUIDs:v6 operationID:&stru_1EEB2EB80 reply:v5];
}

void __65__PLSocialGroup_updateKeyAssetOfSocialGroupsWithUUIDs_inLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLBackendGetLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v3;
      id v7 = "Error updating key asset for social groups: %@, error: %@";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v11;
    id v7 = "Updated key asset for social groups: %@";
    id v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

+ (BOOL)runAssetContainmentOnAllSocialGroupsInContext:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(v4, "pl_graphCache");
  uint64_t v6 = [v5 labelWithCode:1000 inContext:v4];
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = +[PLGraphNode entityName];
  os_log_type_t v9 = [v7 fetchRequestWithEntityName:v8];

  uint32_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"primaryLabel", v6];
  [v9 setPredicate:v10];

  id v48 = 0;
  uint64_t v11 = [v4 executeFetchRequest:v9 error:&v48];
  id v12 = v48;
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", objc_msgSend(v11, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v51 count:16];
  v42 = v14;
  if (v15)
  {
    uint64_t v16 = v15;
    id v36 = v12;
    char v37 = v6;
    uint64_t v38 = v5;
    id v39 = v4;
    id v17 = 0;
    uint64_t v18 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        id v21 = (void *)MEMORY[0x19F38D3B0]();
        if ([v13 isCancelled])
        {
          id v27 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v28 = *MEMORY[0x1E4F8C500];
          uint64_t v49 = *MEMORY[0x1E4F28568];
          v50 = @"User cancelled running asset containment on all groups";
          id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          uint64_t v30 = [v27 errorWithDomain:v28 code:3072 userInfo:v29];

          long long v31 = v42;
          BOOL v26 = 0;
          v32 = v42;
          id v5 = v38;
          id v4 = v39;
          uint64_t v6 = v37;
          id v12 = v36;
          goto LABEL_27;
        }
        [v13 becomeCurrentWithPendingUnitCount:1];
        id v22 = +[PLGraphNodeContainer newNodeContainerWithNode:v20];
        if ([v22 socialGroupVerifiedType] - 3 >= 0xFFFFFFFE)
        {
          id v43 = v17;
          int v23 = [v22 runAssetContainmentWithError:&v43 assetIDsToUpdate:0];
          id v24 = v43;

          if (!v23)
          {
            [v13 resignCurrent];

            BOOL v26 = 0;
            goto LABEL_18;
          }
          if ([v22 keyAssetIsNeeded])
          {
            id v25 = [v22 uuid];
            [v41 addObject:v25];
          }
          id v17 = v24;
          id v14 = v42;
        }
        [v13 resignCurrent];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v44 objects:v51 count:16];
      if (v16) {
        continue;
      }
      break;
    }
    BOOL v26 = 1;
    id v24 = v17;
LABEL_18:
    id v5 = v38;
    id v4 = v39;
    uint64_t v6 = v37;
    id v12 = v36;
  }
  else
  {
    id v24 = 0;
    BOOL v26 = 1;
  }

  v32 = [v4 photoLibrary];
  if (v32) {
    +[PLSocialGroup updateKeyAssetOfSocialGroupsWithUUIDs:v41 inLibrary:v32];
  }
  id v33 = v24;
  uint64_t v30 = v33;
  if (a4) {
    char v34 = v26;
  }
  else {
    char v34 = 1;
  }
  if ((v34 & 1) == 0) {
    *a4 = v33;
  }

  long long v31 = v42;
LABEL_27:

  return v26;
}

+ (id)defaultValueForRequiredNodeValueKey:(id)a3 forNode:(id)a4
{
  id v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PLSocialGroup;
  id v7 = objc_msgSendSuper2(&v9, sel_defaultValueForRequiredNodeValueKey_forNode_, v6, a4);
  if (([v6 isEqualToString:@"automaticOrder"] & 1) != 0
    || ([v6 isEqualToString:@"manualOrder"] & 1) != 0
    || [v6 isEqualToString:@"socialGroupVerifiedType"])
  {
    [v7 setIntValue:0];
  }

  return v7;
}

+ (id)_sortableKeyPaths
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"automaticOrder";
  v4[1] = @"customTitle";
  v4[2] = @"manualOrder";
  v4[3] = @"socialGroupVerifiedType";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  return v2;
}

+ (id)sortableKeys
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PLSocialGroup;
  id v3 = objc_msgSendSuper2(&v7, sel_sortableKeys);
  id v4 = [a1 _sortableKeyPaths];
  id v5 = [v3 setByAddingObjectsFromArray:v4];

  return v5;
}

+ (id)requiredNodeValueKeys
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PLSocialGroup;
  id v3 = objc_msgSendSuper2(&v7, sel_requiredNodeValueKeys);
  id v4 = [a1 _sortableKeyPaths];
  id v5 = [v3 setByAddingObjectsFromArray:v4];

  return v5;
}

+ (id)newNodeContainerWithManagedObjectContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PLSocialGroup.m", 524, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  id v6 = objc_msgSend(v5, "pl_graphCache");
  objc_super v7 = [v6 labelWithCode:1000 inContext:v5];
  id v8 = +[PLGraphNode insertGraphNodeInContext:v5 withPrimaryLabel:v7];
  objc_super v9 = (void *)[objc_alloc((Class)a1) initWithNode:v8];
  uint32_t v10 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v11 = [v10 UUIDString];
  [v9 setUuid:v11];

  return v9;
}

+ (BOOL)_verifiedTypeChangeFromRejectedToUserWithSourceNode:(id)a3
{
  id v3 = [a3 nodeValueWithName:@"socialGroupVerifiedType"];
  BOOL v6 = 0;
  if ([v3 valueDidChange])
  {
    if ([v3 intValue] == 1)
    {
      id v4 = objc_msgSend(v3, "pl_committedValueForKey:", @"intValue");
      int v5 = (unsigned __int16)~[v4 intValue];

      if (!v5) {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

+ (id)_personsFromEdges:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLSocialGroup.m", 296, @"Invalid parameter not satisfying: %@", @"edges" object file lineNumber description];
  }
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v12 isDeleted] & 1) == 0)
        {
          uint64_t v13 = [v12 targetPerson];
          if (v13)
          {
            id v14 = (void *)v13;
            uint64_t v15 = [v12 targetPerson];
            char v16 = [v15 isDeleted];

            if ((v16 & 1) == 0)
            {
              id v17 = [v12 targetPerson];
              [v6 addObject:v17];
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (BOOL)rejectSocialGroupsHavingMember:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  objc_msgSend(a1, "_socialGroupsNodesContainingMember:");
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x19F38D3B0]();
        id v11 = +[PLGraphNodeContainer newNodeContainerWithNode:v9];
        id v17 = 0;
        char v12 = [v11 setSocialGroupVerifiedType:0xFFFFFFFFLL error:&v17];
        id v13 = v17;
        if ((v12 & 1) == 0)
        {
          id v14 = PLBackendGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v23 = v13;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "rejectSocialGroupsHavingMember: error setting social group verified type: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v6);
  }

  return v4 != 0;
}

+ (BOOL)deleteSocialGroupsHavingMember:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 _socialGroupsNodesContainingMember:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        id v11 = [v4 managedObjectContext];
        [v11 deleteObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v5 != 0;
}

+ (id)_socialGroupsNodesContainingMember:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  uint64_t v5 = objc_msgSend(v4, "pl_graphCache");

  uint64_t v6 = [v3 managedObjectContext];
  uint64_t v7 = [v5 labelWithCode:1000 inContext:v6];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v9 = +[PLGraphEdge fetchRequest];
    v40[0] = @"sourceNode";
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    [v9 setRelationshipKeyPathsForPrefetching:v10];

    id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K = %@) AND (%K = %@)", @"sourceNode.primaryLabel", v7, @"targetPerson", v3];
    [v9 setPredicate:v11];

    char v12 = [v3 managedObjectContext];
    id v36 = 0;
    id v29 = v9;
    long long v13 = [v12 executeFetchRequest:v9 error:&v36];
    id v14 = v36;

    uint64_t v30 = v7;
    long long v31 = v5;
    uint64_t v28 = v14;
    if (!v13)
    {
      long long v15 = PLBackendGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v14;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch social group edges for person: %@", buf, 0xCu);
      }

      uint64_t v8 = 0;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v22 = [v21 sourceNode];
          if (v22)
          {
            id v23 = (void *)v22;
            id v24 = [v21 sourceNode];
            char v25 = [v24 isDeleted];

            if ((v25 & 1) == 0)
            {
              BOOL v26 = [v21 sourceNode];
              [v8 addObject:v26];
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v18);
    }

    uint64_t v7 = v30;
    uint64_t v5 = v31;
  }
  else
  {
    long long v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to fetch social group label", buf, 2u);
    }
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)changeFlagsKeysByNodeContainerKey
{
  v14[9] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"changeFlag0", @"cplChangeFlag", 0, @"socialGroupVerifiedType");
  v14[0] = v2;
  v13[1] = @"customTitle";
  id v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"changeFlag1", @"cplChangeFlag", 0);
  v14[1] = v3;
  v13[2] = @"manualOrder";
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"changeFlag1", @"cplChangeFlag", 0);
  v14[2] = v4;
  v13[3] = @"automaticOrder";
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:@"changeFlag1"];
  v14[3] = v5;
  v13[4] = @"members";
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"changeFlag2", @"cplChangeFlag", 0);
  v14[4] = v6;
  v13[5] = @"keyAssetPickSource";
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"changeFlag3", @"cplChangeFlag", 0);
  v14[5] = v7;
  v13[6] = @"keyAsset";
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"changeFlag3", @"cplChangeFlag", 0);
  v14[6] = v8;
  v13[7] = @"inclusiveAssetIDs";
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"changeFlag4", 0);
  v14[7] = v9;
  v13[8] = @"exclusiveAssetIDs";
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"changeFlag4", 0);
  v14[8] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:9];

  return v11;
}

+ (BOOL)deleteDuplicateGraphAndUnverifiedGroupsInContext:(id)a3 error:(id *)a4
{
  v49[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v39 = objc_msgSend(v4, "pl_graphCache");
  uint64_t v5 = [v39 labelWithCode:1000 inContext:v4];
  uint64_t v6 = +[PLGraphNodeValue fetchRequest];
  id v36 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v38 = (void *)v5;
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"node.primaryLabel", v5];
  v49[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"valueName", @"socialGroupVerifiedType"];
  v49[1] = v8;
  uint64_t v9 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"intValue", 2);
  v48[0] = v10;
  id v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"intValue", 0);
  v48[1] = v11;
  char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  long long v13 = [v9 orPredicateWithSubpredicates:v12];
  v49[2] = v13;
  id v14 = (void *)v6;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
  long long v16 = [v36 andPredicateWithSubpredicates:v15];
  [v14 setPredicate:v16];

  id v46 = 0;
  uint64_t v17 = [v4 executeFetchRequest:v14 error:&v46];
  id v18 = v46;
  id v19 = v18;
  if (v17)
  {
    [v17 valueForKey:@"node"];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      long long v33 = v17;
      long long v34 = v14;
      id v37 = v4;
      uint64_t v23 = *(void *)v43;
      char v24 = 1;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v43 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v26 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          id v27 = (void *)MEMORY[0x19F38D3B0]();
          id v28 = +[PLGraphNodeContainer newNodeContainerWithNode:v26];
          if (v24)
          {
            id v41 = v19;
            char v24 = [a1 deleteDuplicateGroupsAfterInsertionOfGroup:v28 error:&v41];
            id v29 = v41;

            id v19 = v29;
          }
          else
          {
            char v24 = 0;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v22);

      id v30 = v19;
      id v19 = v30;
      if (v24)
      {
        BOOL v31 = 1;
        id v4 = v37;
        id v14 = v34;
      }
      else
      {
        id v4 = v37;
        id v14 = v34;
        if (a4)
        {
          id v19 = v30;
          BOOL v31 = 0;
          *a4 = v19;
        }
        else
        {
          BOOL v31 = 0;
        }
      }
      uint64_t v17 = v33;
    }
    else
    {

      id v19 = v19;
      BOOL v31 = 1;
    }
  }
  else if (a4)
  {
    id v19 = v18;
    BOOL v31 = 0;
    *a4 = v19;
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

+ (BOOL)deleteDuplicateGroupsAfterInsertionOfGroup:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 _fetchDuplicateSocialGroupNodes:v6 error:a4];
  uint64_t v8 = v7;
  if (v7 && [v7 count])
  {
    switch([v6 socialGroupVerifiedType])
    {
      case 0xFFFFFFFF:
      case 1u:
        uint64_t v9 = [v6 sourceNode];
        uint64_t v10 = [v9 managedObjectContext];
        [a1 _deleteUserAndGraphGroupsFromDuplicateGroupNodes:v8 inContext:v10];
        goto LABEL_6;
      case 0u:
      case 2u:
        uint64_t v9 = [v6 sourceNode];
        uint64_t v10 = [v9 managedObjectContext];
        id v11 = [v6 sourceNode];
        [v10 deleteObject:v11];

LABEL_6:
        break;
      default:
        break;
    }
  }

  return v8 != 0;
}

+ (void)_deleteUserAndGraphGroupsFromDuplicateGroupNodes:(id)a3 inContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
        long long v13 = (void *)MEMORY[0x19F38D3B0](v8);
        id v14 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSocialGroup, "newNodeContainerWithNode:", v12, (void)v15);
        if (([v14 socialGroupVerifiedType] | 2) == 2) {
          [v6 deleteObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v9 = v8;
    }
    while (v8);
  }
}

+ (id)_fetchDuplicateSocialGroupNodes:(id)a3 error:(id *)a4
{
  void v31[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 sourceNode];
  uint64_t v8 = [v6 members];
  uint64_t v9 = [v8 valueForKey:@"objectID"];

  if (v9)
  {
    uint64_t v10 = [v7 managedObjectContext];
    id v29 = 0;
    uint64_t v11 = [a1 fetchDuplicateSocialGroupIDsWithMemberIDs:v9 inContext:v10 error:&v29];
    id v12 = v29;

    if (v11)
    {
      uint64_t v26 = a4;
      long long v13 = +[PLGraphNode fetchRequest];
      id v27 = v12;
      id v14 = (void *)MEMORY[0x1E4F28BA0];
      long long v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v11];
      v31[0] = v15;
      long long v16 = (void *)MEMORY[0x1E4F28F60];
      long long v17 = [v6 sourceNode];
      long long v18 = [v16 predicateWithFormat:@"NOT (self = %@)", v17];
      v31[1] = v18;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
      uint64_t v20 = [v14 andPredicateWithSubpredicates:v19];
      [v13 setPredicate:v20];

      id v30 = @"values";
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      [v13 setRelationshipKeyPathsForPrefetching:v21];

      uint64_t v22 = [v7 managedObjectContext];
      id v28 = v27;
      uint64_t v23 = [v22 executeFetchRequest:v13 error:&v28];
      id v12 = v28;

      if (v23)
      {
        id v24 = v23;
      }
      else if (v26)
      {
        id *v26 = v12;
      }
    }
    else if (a4)
    {
      id v12 = v12;
      uint64_t v23 = 0;
      *a4 = v12;
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

+ (id)_memberIDsByNodeIDFromEdgeDictionaries:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v11 = [v9 objectForKeyedSubscript:@"sourceNode"];
        uint64_t v12 = [v9 objectForKeyedSubscript:@"targetPerson"];
        long long v13 = (void *)v12;
        if (v11) {
          BOOL v14 = v12 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          long long v15 = [v4 objectForKeyedSubscript:v11];
          if (!v15)
          {
            long long v15 = [MEMORY[0x1E4F1CA80] set];
            [v4 setObject:v15 forKeyedSubscript:v11];
          }
          [v15 addObject:v13];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)fetchDuplicateSocialGroupIDsWithMemberIDs:(id)a3 inContext:(id)a4 error:(id *)a5
{
  void v48[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_msgSend(v9, "pl_graphCache");
  uint64_t v11 = [v10 objectIDForLabelWithCode:1000 inContext:v9];
  id v39 = v8;
  if (!v11)
  {
    id v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F8C500];
    uint64_t v45 = *MEMORY[0x1E4F28228];
    id v46 = @"Couldn't retrieve social group labelID";
    long long v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    long long v33 = [v30 errorWithDomain:v31 code:46502 userInfo:v32];
    long long v34 = v33;
    if (a5) {
      *a5 = v33;
    }

    id v27 = 0;
    goto LABEL_15;
  }
  uint64_t v38 = v10;
  uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = (void *)MEMORY[0x1E4F1C0D0];
  BOOL v14 = +[PLGraphEdge entityName];
  long long v15 = [v13 fetchRequestWithEntityName:v14];

  long long v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K = %@) AND (%K != nil)", @"sourceNode.primaryLabel", v11, @"targetPerson"];
  [v15 setPredicate:v16];

  [v15 setResultType:2];
  v48[0] = @"sourceNode";
  v48[1] = @"targetPerson";
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  [v15 setPropertiesToFetch:v17];

  id v44 = 0;
  long long v18 = [v9 executeFetchRequest:v15 error:&v44];
  id v19 = v44;
  long long v20 = v19;
  if (v18)
  {
    long long v21 = [a1 _memberIDsByNodeIDFromEdgeDictionaries:v18];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __75__PLSocialGroup_fetchDuplicateSocialGroupIDsWithMemberIDs_inContext_error___block_invoke;
    v41[3] = &unk_1E586C3D8;
    id v42 = v8;
    id v37 = v12;
    id v22 = v12;
    id v43 = v22;
    [v21 enumerateKeysAndObjectsUsingBlock:v41];
    uint64_t v23 = +[PLGraphNode fetchRequest];
    id v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v22];
    [v23 setPredicate:v24];

    [v23 setResultType:1];
    char v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
    long long v47 = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    [v23 setSortDescriptors:v26];

    id v40 = v20;
    id v27 = [v9 executeFetchRequest:v23 error:&v40];
    id v28 = v40;

    if (!v27 && a5) {
      *a5 = v28;
    }

    id v29 = v37;
  }
  else
  {
    id v29 = v12;
    if (a5)
    {
      id v28 = v19;
      id v27 = 0;
      *a5 = v28;
    }
    else
    {
      id v27 = 0;
      id v28 = v19;
    }
  }

  if (v18)
  {
    uint64_t v10 = v38;
LABEL_15:
    id v27 = v27;
    long long v35 = v27;
    goto LABEL_17;
  }
  long long v35 = 0;
  uint64_t v10 = v38;
LABEL_17:

  return v35;
}

void __75__PLSocialGroup_fetchDuplicateSocialGroupIDsWithMemberIDs_inContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) isEqualToSet:a3]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (int64_t)cloudDeletionType
{
  return 13;
}

- (void)updateSocialGroupwithCPLSocialGroupChange:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v48 = 0;
  BOOL v8 = -[PLSocialGroup setSocialGroupVerifiedType:error:](self, "setSocialGroupVerifiedType:error:", [v6 verifiedType], &v48);
  id v9 = v48;
  if (!v8)
  {
    uint64_t v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "updateSocialGroupwithCPLSocialGroupChange: error setting social group verified type: %@", buf, 0xCu);
    }
  }
  uint64_t v11 = [v6 customTitle];
  [(PLSocialGroup *)self setCustomTitle:v11];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "position"));
  [(PLSocialGroup *)self setManualOrder:v12];

  uint64_t v13 = [v6 keyAssetIdentifier];
  BOOL v14 = (void *)v13;
  if (!v13)
  {
    uint64_t v38 = v9;
    goto LABEL_20;
  }
  uint64_t v50 = v13;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  long long v16 = +[PLManagedAsset assetsByCloudAssetUUID:v15 inLibrary:v7];
  long long v17 = [v16 allValues];
  long long v18 = [v17 firstObject];

  if (!v18)
  {
    uint64_t v23 = PLBackendGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v14;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "updateSocialGroupwithCPLSocialGroupChange: couldn't find key asset with keyAssetUUID: %@", buf, 0xCu);
    }
    id v20 = v9;
    goto LABEL_18;
  }
  id v47 = v9;
  BOOL v19 = [(PLSocialGroup *)self setKeyAsset:v18 error:&v47];
  id v20 = v47;

  if (!v19)
  {
    uint64_t v23 = PLBackendGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v20;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "updateSocialGroupwithCPLSocialGroupChange: error setting social group key asset: %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  id v46 = v20;
  BOOL v21 = [(PLSocialGroup *)self setKeyAssetPickSource:1 error:&v46];
  id v22 = v46;

  if (!v21)
  {
    uint64_t v23 = PLBackendGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v22;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "updateSocialGroupwithCPLSocialGroupChange: error setting social group key asset pick source: %@", buf, 0xCu);
    }
    id v20 = v22;
LABEL_18:

    id v22 = v20;
  }
  uint64_t v38 = v22;

LABEL_20:
  id v39 = v14;
  id v40 = v6;
  id v24 = [v6 persons];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v37 = v24;
  uint64_t v26 = [v24 persons];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = [*(id *)(*((void *)&v42 + 1) + 8 * i) personIdentifier];
        long long v32 = [v7 managedObjectContext];
        long long v33 = +[PLPerson personWithUUID:v31 inManagedObjectContext:v32];

        if (v33) {
          [v25 addObject:v33];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v28);
  }

  id v41 = v38;
  BOOL v34 = [(PLSocialGroup *)self setMembers:v25 error:&v41];
  id v35 = v41;

  if (!v34)
  {
    id v36 = PLBackendGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v35;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "updateSocialGroupwithCPLSocialGroupChange: failed to set members with error: %@", buf, 0xCu);
    }
  }
}

- (id)cplSocialGroupChange
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLSocialGroup *)self scopedIdentifier];
  id v4 = (void *)[MEMORY[0x1E4F59980] newChangeWithScopedIdentifier:v3 changeType:0];
  objc_msgSend(v4, "setVerifiedType:", -[PLSocialGroup socialGroupVerifiedType](self, "socialGroupVerifiedType"));
  id v5 = [(PLSocialGroup *)self customTitle];
  [v4 setCustomTitle:v5];

  id v6 = [(PLSocialGroup *)self manualOrder];
  objc_msgSend(v4, "setPosition:", objc_msgSend(v6, "unsignedIntegerValue"));

  if ([(PLSocialGroup *)self keyAssetPickSource] == 1)
  {
    id v7 = [(PLSocialGroup *)self keyAsset];

    if (v7)
    {
      BOOL v8 = [(PLSocialGroup *)self keyAsset];
      id v9 = [v8 cloudAssetGUID];
      [v4 setKeyAssetIdentifier:v9];
    }
    else
    {
      BOOL v8 = PLBackendGetLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_7:

        goto LABEL_8;
      }
      id v9 = [(PLGraphNodeContainer *)self uuid];
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v9;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "cplSocialGroupChange: social group with UUID %@ has user pick source but no key asset", buf, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_8:
  id v10 = objc_alloc_init(MEMORY[0x1E4F59990]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [(PLSocialGroup *)self members];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v17 = objc_alloc_init(MEMORY[0x1E4F59988]);
        long long v18 = [v16 personUUID];
        [v17 setPersonIdentifier:v18];

        [v10 addPerson:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  [v4 setPersons:v10];
  return v4;
}

- (id)scopedIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F59968]);
  id v4 = [(PLSocialGroup *)self scopeIdentifier];
  id v5 = [(PLGraphNodeContainer *)self uuid];
  id v6 = (void *)[v3 initWithScopeIdentifier:v4 identifier:v5];

  return v6;
}

- (id)scopeIdentifier
{
  v2 = [(PLGraphNodeContainer *)self sourceNode];
  id v3 = [v2 photoLibrary];
  id v4 = [v3 mainScopeIdentifier];

  return v4;
}

- (BOOL)supportsCloudUpload
{
  id v3 = [(id)objc_opt_class() _syncablePredicate];
  LOBYTE(self) = [v3 evaluateWithObject:self];

  return (char)self;
}

- (BOOL)isSyncableChange
{
  v2 = [(PLGraphNodeContainer *)self sourceNode];
  id v3 = [v2 changedValues];
  id v4 = [v3 allKeys];
  char v5 = [v4 containsObject:@"cplChangeFlag"];

  return v5;
}

- (id)localID
{
  v2 = [(PLGraphNodeContainer *)self sourceNode];
  id v3 = [v2 objectID];

  return v3;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)@"uuid";
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 13;
}

+ (id)socialGroupsToUploadInManagedObjectContext:(id)a3 limit:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = objc_msgSend(v4, "pl_graphCache");
  id v6 = [v18 labelWithCode:1000 inContext:v4];
  id v7 = +[PLGraphEdge fetchRequest];
  BOOL v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"sourceNode.primaryLabel", v6];
  [v7 setPredicate:v8];

  id v9 = [v4 executeFetchRequest:v7 error:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v19 + 1) + 8 * i) sourceNode];
        long long v15 = v14;
        if (v14 && ([v14 isDeleted] & 1) == 0)
        {
          id v16 = +[PLGraphNodeContainer newNodeContainerWithNode:v15];
          if ([v16 supportsCloudUpload]
            && ![v16 cloudLocalState])
          {
            [v5 addObject:v16];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v5;
}

+ (id)_syncablePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d || %K == %d", @"socialGroupVerifiedType", 1, @"socialGroupVerifiedType", 0xFFFFFFFFLL);
}

@end