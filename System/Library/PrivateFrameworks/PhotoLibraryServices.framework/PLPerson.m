@interface PLPerson
+ (BOOL)_deleteObjectsWithFetchRequest:(id)a3 reason:(signed __int16)a4 moc:(id)a5 progress:(id)a6 error:(id *)a7;
+ (BOOL)_detachFacesForPerson:(id)a3 reason:(signed __int16)a4 error:(id *)a5;
+ (BOOL)person:(id)a3 isBetterMergeTargetThanPerson:(id)a4;
+ (BOOL)resetAllInLibrary:(id)a3 error:(id *)a4;
+ (NSString)cloudUUIDKeyForDeletion;
+ (PLPerson)personWithUUID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)_batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:(id)a3 predicate:(id)a4 includedDetectionTypes:(id)a5 inManagedObjectContext:(id)a6 error:(id *)a7;
+ (id)_predicateForSupportedDetectionTypesForUpload;
+ (id)_predicateForSupportedVerifiedTypesForUpload;
+ (id)_predicateToBlockHiddenGraphTypesForUpload;
+ (id)_stringFromContact:(id)a3 preferGivenName:(BOOL)a4;
+ (id)allPersonsInManagedObjectContext:(id)a3;
+ (id)createUnverifiedPersonInManagedObjectContext:(id)a3;
+ (id)displayNameFromContact:(id)a3;
+ (id)entityName;
+ (id)fetchDuplicatePersonUUIDsInManagedObjectContext:(id)a3 error:(id *)a4;
+ (id)fetchFinalMergeTargetPersonForPersonWithUUID:(id)a3 context:(id)a4 predicate:(id)a5;
+ (id)fetchMePersonInManagedObjectContext:(id)a3;
+ (id)fetchPersonCountByAssetUUIDForAssetUUIDs:(id)a3 predicate:(id)a4 includedDetectionTypes:(id)a5 library:(id)a6 error:(id *)a7;
+ (id)fullNameFromContact:(id)a3;
+ (id)insertIntoManagedObjectContext:(id)a3 withPersonUUID:(id)a4 fullName:(id)a5 verifiedType:(int)a6;
+ (id)insertIntoPhotoLibrary:(id)a3 withPersonUUID:(id)a4 fullName:(id)a5 verifiedType:(int)a6;
+ (id)isEligibleForSearchIndexingPredicate;
+ (id)listOfSyncedProperties;
+ (id)personsMatchingPredicate:(id)a3 fetchLimit:(unint64_t)a4 sortDescriptors:(id)a5 relationshipKeyPathsForPrefetching:(id)a6 inManagedObjectContext:(id)a7;
+ (id)personsToPrefetchInManagedObjectContext:(id)a3;
+ (id)personsToUploadInManagedObjectContext:(id)a3 limit:(int64_t)a4;
+ (id)personsWithPersonUri:(id)a3 inManagedObjectContext:(id)a4;
+ (id)personsWithPersonUris:(id)a3 inManagedObjectContext:(id)a4;
+ (id)personsWithUUIDs:(id)a3 inManagedObjectContext:(id)a4;
+ (id)predicateForIncludedDetectionTypes:(id)a3;
+ (id)predicateForMePerson;
+ (id)predicateForPersistence;
+ (id)predicateForPersonsNeedingFaceCropGenerationForFaceObjectID:(id)a3;
+ (id)predicateForVisibleKeyFace;
+ (id)predicateToExcludeTorsoOnlyPerson;
+ (id)resetAllInLibrary:(id)a3 completion:(id)a4;
+ (int64_t)cloudDeletionTypeForTombstone:(id)a3;
+ (void)_resetMediaAnalysisAfterPersonResetInLibraryURL:(id)a3 resetPersons:(BOOL)a4 completion:(id)a5;
+ (void)_setPersonResetInProgress:(BOOL)a3 context:(id)a4;
+ (void)batchFetchAssociatedPersonByFaceGroupUUIDWithFaceGroupUUIDs:(id)a3 predicate:(id)a4 library:(id)a5 completion:(id)a6;
+ (void)batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:(id)a3 predicate:(id)a4 includedDetectionTypes:(id)a5 inManagedObjectContext:(id)a6 completion:(id)a7;
+ (void)batchFetchPersonsByAssetUUIDWithAssetUUIDs:(id)a3 predicate:(id)a4 includedDetectionTypes:(id)a5 library:(id)a6 completion:(id)a7;
+ (void)createAssociatedPersonForFaceGroup:(id)a3;
+ (void)enumerateAssetUUIDsForSearchIndexingWithDetectedFaceUUIDs:(id)a3 managedObjectContext:(id)a4 assetUUIDHandler:(id)a5;
+ (void)enumerateAssetUUIDsForSearchIndexingWithPersonUUID:(id)a3 managedObjectContext:(id)a4 libraryIdentifier:(int64_t)a5 assetUUIDHandler:(id)a6;
+ (void)resetCloudStateInPhotoLibrary:(id)a3;
- (BOOL)_allowSyncOfChangeWithKey:(id)a3;
- (BOOL)_hideGraphPersonInsteadOfDelete;
- (BOOL)_personResetIsInProgress;
- (BOOL)_updateGroupMembershipFromEdges:(id)a3 mergeTarget:(id)a4 error:(id *)a5;
- (BOOL)_updateSocialGroupMembershipWithPersonsToMerge:(id)a3 mergeTarget:(id)a4;
- (BOOL)dedupeGraphPersons:(id)a3 error:(id *)a4;
- (BOOL)deletePersonWithReason:(signed __int16)a3;
- (BOOL)graphVerified;
- (BOOL)isHiddenGraphPerson;
- (BOOL)isSyncableChange;
- (BOOL)isTombstone;
- (BOOL)isValidForPersistence;
- (BOOL)keyFaceIsPicked;
- (BOOL)shouldIndexForSearch;
- (BOOL)supportsCloudUpload;
- (BOOL)userVerified;
- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3;
- (BOOL)validateDetectionTypesForMergingWithPersons:(id)a3 error:(id *)a4;
- (NSSet)allDetectedFaces;
- (id)_nameRelatedMetadataKeys;
- (id)cplPersonChange;
- (id)debugLogDescription;
- (id)edgesIn;
- (id)edgesOut;
- (id)faceGroupDescription;
- (id)finalMergeTargetPerson;
- (id)mutableFaceCrops;
- (id)mutableFaces;
- (id)mutableInvalidMergeCandidates;
- (id)mutableMergeCandidates;
- (id)mutableMergeCandidatesWithConfidence;
- (id)mutableRejectedFaces;
- (id)mutableRejectedFacesNeedingFaceCrops;
- (id)mutableTemporalFaces;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)payloadIDForTombstone:(id)a3;
- (id)pickKeyFaceOptimalStateForContactDedupeWithPersons:(id)a3;
- (id)pickOptimalStateForUserInitiatedMergeWithPersons:(id)a3 nominalTarget:(id)a4;
- (id)reverseOrderedMergeTargetPersons;
- (id)scopeIdentifier;
- (id)scopedIdentifier;
- (id)syncDescription;
- (int64_t)cloudDeletionType;
- (void)_basicMergePersons:(id)a3;
- (void)_moveAllFacesToFinalMergeTarget;
- (void)_removeSharedLibraryPeopleRulesForPerson;
- (void)_triggerPersonSyncUpdateWithLibraryServicesManager:(id)a3;
- (void)_updateSharedLibraryPeopleRulesForTombstone;
- (void)applyCPLChangeForContactMatchingDictionary:(id)a3;
- (void)assignDetectionTypeFromFaces;
- (void)basicMergePersons:(id)a3;
- (void)createUnverifiedPersonForRejectedFaceUUIDs:(id)a3 inManagedObjectContext:(id)a4;
- (void)didSave;
- (void)disconnectFaceGroup;
- (void)enumerateAssetSearchEntityPersonRelationsWithBlock:(id)a3;
- (void)enumeratePersonRelationsWithBlock:(id)a3;
- (void)implementsPLGraphEdgeReferenceObjectRecipient;
- (void)mergePersons:(id)a3 withOptimalState:(id)a4;
- (void)persistMetadataToFileSystemWithPathManager:(id)a3;
- (void)prepareForDeletion;
- (void)prepareForUserInitiatedMergeWithPersons:(id)a3;
- (void)rejectFaceIfPossible:(id)a3 shouldCreateFaceCrop:(BOOL)a4;
- (void)removePersistedFileSystemDataWithPathManager:(id)a3;
- (void)resetAllFacesToDefault;
- (void)resetFacesProcessing;
- (void)setCPLSyncedMergeTarget:(id)a3;
- (void)setEffectiveVerifiedType:(int)a3;
- (void)setKeyFace:(id)a3 pickSource:(signed __int16)a4;
- (void)setKeyFaceToPicked;
- (void)updateDetectionTypeIfNeeded;
- (void)willSave;
@end

@implementation PLPerson

+ (id)predicateForIncludedDetectionTypes:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:&unk_1EEBF0B60])
  {
    char v4 = [v3 containsObject:&unk_1EEBF0B78];

    if (v4)
    {
      v5 = 0;
    }
    else
    {
      v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"detectionType", &unk_1EEBF0B60];
    }
  }
  else
  {
    v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"detectionType", v3];
  }
  return v5;
}

+ (id)predicateToExcludeTorsoOnlyPerson
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0", @"faceCount");
}

- (BOOL)shouldIndexForSearch
{
  int v3 = [(PLPerson *)self verifiedType];
  if (v3 != 1) {
    LOBYTE(v3) = [(PLPerson *)self verifiedType] == 2;
  }
  return v3;
}

+ (void)enumerateAssetUUIDsForSearchIndexingWithDetectedFaceUUIDs:(id)a3 managedObjectContext:(id)a4 assetUUIDHandler:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)MEMORY[0x1E4F1C0D0];
  id v10 = a3;
  v11 = +[PLDetectedFace entityName];
  v12 = [v9 fetchRequestWithEntityName:v11];

  v19[0] = @"assetForFace";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v12 setRelationshipKeyPathsForPrefetching:v13];

  v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v10];

  [v12 setPredicate:v14];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __121__PLPerson_SearchIndex__enumerateAssetUUIDsForSearchIndexingWithDetectedFaceUUIDs_managedObjectContext_assetUUIDHandler___block_invoke;
  v17[3] = &unk_1E586E630;
  id v18 = v8;
  id v15 = v8;
  id v16 = (id)[v7 enumerateObjectsFromFetchRequest:v12 count:0 usingDefaultBatchSizeWithBlock:v17];
}

void __121__PLPerson_SearchIndex__enumerateAssetUUIDsForSearchIndexingWithDetectedFaceUUIDs_managedObjectContext_assetUUIDHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = a2;
  id v7 = [v12 assetForFace];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [v7 uuid];
    v11 = [v12 uuid];
    (*(void (**)(uint64_t, void *, void *, uint64_t, uint64_t))(v9 + 16))(v9, v10, v11, a3, a4);
  }
}

+ (void)enumerateAssetUUIDsForSearchIndexingWithPersonUUID:(id)a3 managedObjectContext:(id)a4 libraryIdentifier:(int64_t)a5 assetUUIDHandler:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [v9 length];
  if (v11 && v10 && v12)
  {
    v13 = +[PLPerson fetchRequest];
    [v13 setResultType:1];
    v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"personUUID", v9];
    [v13 setPredicate:v14];

    id v58 = 0;
    id v15 = [v10 executeFetchRequest:v13 error:&v58];
    id v16 = v58;
    uint64_t v17 = [v15 firstObject];
    id v18 = (void *)v17;
    if (v17)
    {
      int64_t v43 = a5;
      v44 = (void *)v17;
      id v45 = v16;
      v46 = v15;
      v47 = v13;
      v48 = v11;
      v49 = v10;
      v19 = [v10 deletedObjects];
      v50 = [MEMORY[0x1E4F1CA80] set];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:v61 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v55 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            v26 = [v25 entity];
            v27 = [v26 name];
            v28 = +[PLManagedAsset entityName];
            int v29 = [v27 isEqualToString:v28];

            if (v29)
            {
              id v30 = v25;
              v31 = [v30 uuid];
              if (v31) {
                [v50 addObject:v31];
              }
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v54 objects:v61 count:16];
        }
        while (v22);
      }

      id v18 = v44;
      v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K.%K == %@ OR ANY %K.%K == %@", @"detectedFaces", @"personForFace", v44, @"temporalDetectedFaces", @"personForTemporalDetectedFaces", v44];
      v33 = +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:v43];
      v34 = (void *)MEMORY[0x1E4F1C0D0];
      v35 = +[PLManagedAsset entityName];
      v36 = [v34 fetchRequestWithEntityName:v35];

      [v36 setResultType:2];
      v60[0] = @"objectID";
      v60[1] = @"uuid";
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
      [v36 setPropertiesToFetch:v37];

      v38 = (void *)MEMORY[0x1E4F28BA0];
      v59[0] = v32;
      v59[1] = v33;
      v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
      v40 = [v38 andPredicateWithSubpredicates:v39];
      [v36 setPredicate:v40];

      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __132__PLPerson_SearchIndex__enumerateAssetUUIDsForSearchIndexingWithPersonUUID_managedObjectContext_libraryIdentifier_assetUUIDHandler___block_invoke;
      v51[3] = &unk_1E586E608;
      id v52 = v50;
      id v11 = v48;
      id v53 = v48;
      id v41 = v50;
      id v10 = v49;
      id v42 = (id)[v49 enumerateObjectsFromFetchRequest:v36 count:0 usingDefaultBatchSizeWithBlock:v51];

      id v15 = v46;
      v13 = v47;
      id v16 = v45;
    }
    else
    {
      v20 = PLPhotosSearchGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v63 = v9;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Cannot find person with uuid: %{public}@", buf, 0xCu);
      }
    }
  }
}

void __132__PLPerson_SearchIndex__enumerateAssetUUIDsForSearchIndexingWithPersonUUID_managedObjectContext_libraryIdentifier_assetUUIDHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"uuid"];
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (id)isEligibleForSearchIndexingPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d OR %K == %d", @"verifiedType", 1, @"verifiedType", 2);
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return [a3 containsObject:@"verifiedType"];
}

- (id)payloadIDForTombstone:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"personUUID"];
  char v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  if ([(PLPerson *)self isValidForPersistence]) {
    v5 = [(PLManagedObjectJournalEntryPayload *)[PLPersonJournalEntryPayload alloc] initWithManagedObject:self changedKeys:v4];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (id)payloadID
{
  v2 = [(PLPerson *)self personUUID];
  id v3 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v2];

  return v3;
}

- (void)implementsPLGraphEdgeReferenceObjectRecipient
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
}

- (id)edgesOut
{
  return +[PLGraphEdge edgesOutFromObject:self];
}

- (id)edgesIn
{
  return +[PLGraphEdge edgesInToObject:self];
}

- (BOOL)isHiddenGraphPerson
{
  return [(PLPerson *)self verifiedType] == 2
      && [(PLPerson *)self type] == -1;
}

- (BOOL)_hideGraphPersonInsteadOfDelete
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v3 = [(PLPerson *)self verifiedType];
  if (v3 == 2)
  {
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(PLPerson *)self personUUID];
      *(_DWORD *)buf = 138543362;
      v24 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Hiding graph person instead of delete: %{public}@", buf, 0xCu);
    }
    [(PLPerson *)self setType:0xFFFFFFFFLL];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v6 = [(PLPerson *)self faceCrops];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v12 = [v11 face];
          v13 = v12;
          if (v12)
          {
            v14 = [v12 managedObjectContext];
            [v14 deleteObject:v13];
          }
          if (![v11 state]) {
            [v11 setState:1];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    id v15 = [MEMORY[0x1E4F1CAD0] set];
    [(PLPerson *)self setDetectedFaces:v15];

    id v16 = [MEMORY[0x1E4F1CAD0] set];
    [(PLPerson *)self setTemporalDetectedFaces:v16];
  }
  return v3 == 2;
}

- (BOOL)deletePersonWithReason:(signed __int16)a3
{
  int v3 = a3;
  *(void *)&v13[5] = *MEMORY[0x1E4F143B8];
  if (a3 != 6)
  {
    v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(PLPerson *)self personUUID];
      *(_DWORD *)buf = 67109378;
      v13[0] = v3;
      LOWORD(v13[1]) = 2114;
      *(void *)((char *)&v13[1] + 2) = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Delete person with reason %d: %{public}@", buf, 0x12u);
    }
  }
  if (![(PLPerson *)self isDeleted])
  {
    *(&self->super._willSaveCallCount + 1) = v3;
    if (_os_feature_enabled_impl()) {
      BOOL v10 = +[PLSocialGroup deleteSocialGroupsHavingMember:self];
    }
    else {
      BOOL v10 = 1;
    }
    switch(v3)
    {
      case 0:
        uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2, self, @"PLPerson.m", 2059, @"Invalid parameter not satisfying: %@", @"reason != PLPersonDeleteReasonNone" object file lineNumber description];
        goto LABEL_8;
      case 1:
      case 2:
      case 3:
      case 4:
      case 6:
      case 7:
      case 8:
      case 9:
        goto LABEL_13;
      case 5:
        if ([(PLPerson *)self _hideGraphPersonInsteadOfDelete]) {
          return v10;
        }
LABEL_13:
        uint64_t v8 = [(PLPerson *)self managedObjectContext];
        [v8 deleteObject:self];
        goto LABEL_14;
      default:
        return 0;
    }
  }
  uint64_t v8 = PLBackendGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(PLPerson *)self personUUID];
    *(_DWORD *)buf = 138543362;
    *(void *)v13 = v9;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Person already deleted: %{public}@", buf, 0xCu);
  }
LABEL_8:
  BOOL v10 = 0;
LABEL_14:

  return v10;
}

- (void)enumeratePersonRelationsWithBlock:(id)a3
{
}

- (void)enumerateAssetSearchEntityPersonRelationsWithBlock:(id)a3
{
}

- (BOOL)dedupeGraphPersons:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ([v11 verifiedType] != 2)
        {
          long long v18 = NSString;
          long long v19 = [v11 personUUID];
          long long v20 = [v18 stringWithFormat:@"Attempting to dedupe non-graph person (uuid = %@), caller should refetch persons and respond appropriately", v19];

          long long v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v22 = *MEMORY[0x1E4F8C500];
          uint64_t v51 = *MEMORY[0x1E4F28568];
          id v52 = v20;
          uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
          v24 = [v21 errorWithDomain:v22 code:0 userInfo:v23];

          BOOL v25 = 0;
          goto LABEL_39;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v53 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if ([(PLPerson *)self keyFacePickSource] != 1)
  {
    [v6 sortedArrayUsingComparator:&__block_literal_global_375];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v40;
LABEL_12:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v39 + 1) + 8 * v16);
        if ([v17 keyFacePickSource] == 1) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v50 count:16];
          if (v14) {
            goto LABEL_12;
          }
          goto LABEL_18;
        }
      }
      v26 = [v17 keyFace];

      if (!v26) {
        goto LABEL_26;
      }
      if (!*MEMORY[0x1E4F59AC0])
      {
        v27 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v26;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Dedupe target does not have a picked key face, assigning new picked key face %@", buf, 0xCu);
        }
      }
      [(PLPerson *)self setKeyFace:v26 pickSource:1];
      v28 = [(PLPerson *)self mutableFaces];
      [v28 addObject:v26];

      [v26 fixPersonRelationshipsForFaceTorsoOrTemporal];
    }
    else
    {
LABEL_18:

LABEL_26:
      if (*MEMORY[0x1E4F59AC0]) {
        goto LABEL_30;
      }
      v26 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Unable to find picked key face from dedupe persons", buf, 2u);
      }
    }

LABEL_30:
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v29 = v6;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(v29);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * j) deletePersonWithReason:5];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v31);
  }
  v24 = 0;
  BOOL v25 = 1;
LABEL_39:

  if (a4) {
    *a4 = v24;
  }

  return v25;
}

uint64_t __37__PLPerson_dedupeGraphPersons_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 personUUID];
  id v6 = [v4 personUUID];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)validateDetectionTypesForMergingWithPersons:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    long long v36 = a4;
    uint64_t v9 = *(void *)v39;
    BOOL v10 = off_1E585E000;
    id v11 = (unsigned char *)MEMORY[0x1E4F59AC0];
    id v37 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        int v14 = [(PLPerson *)self detectionType];
        if (v14 != [v13 detectionType])
        {
          if ([(PLPerson *)self detectionType] == 1
            && (-[__objc2_class isPetDetectionType:](v10[220], "isPetDetectionType:", [v13 detectionType]) & 1) != 0|| -[__objc2_class isPetDetectionType:](v10[220], "isPetDetectionType:", -[PLPerson detectionType](self, "detectionType"))&& objc_msgSend(v13, "detectionType") == 1)
          {
            v24 = NSString;
            BOOL v25 = [(PLPerson *)self personUUID];
            int v26 = [(PLPerson *)self detectionType];
            v27 = [v13 personUUID];
            v28 = [v24 stringWithFormat:@"Preventing merge persons of different detection types: %@ (%hd) - %@ (%hd)", v25, v26, v27, (int)objc_msgSend(v13, "detectionType")];

            if (!*v11)
            {
              id v29 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                long long v43 = v28;
                _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
              }
            }
            uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v31 = *MEMORY[0x1E4F8C500];
            uint64_t v50 = *MEMORY[0x1E4F28228];
            uint64_t v51 = v28;
            uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
            v33 = [v30 errorWithDomain:v31 code:41005 userInfo:v32];
            v34 = v33;
            if (v36) {
              id *v36 = v33;
            }

            BOOL v23 = 0;
            goto LABEL_25;
          }
          if (!*v11)
          {
            uint64_t v15 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v16 = [(PLPerson *)self personUUID];
              int v17 = [(PLPerson *)self detectionType];
              [v13 personUUID];
              long long v18 = v10;
              uint64_t v19 = v8;
              long long v21 = v20 = v9;
              int v22 = [v13 detectionType];
              *(_DWORD *)buf = 138544130;
              long long v43 = v16;
              __int16 v44 = 1024;
              int v45 = v17;
              __int16 v46 = 2114;
              v47 = v21;
              __int16 v48 = 1024;
              int v49 = v22;
              _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Merging persons of different detection types: %{public}@ (%hd) - %{public}@ (%hd)", buf, 0x22u);

              uint64_t v9 = v20;
              uint64_t v8 = v19;
              BOOL v10 = v18;

              id v6 = v37;
              id v11 = (unsigned char *)MEMORY[0x1E4F59AC0];
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v52 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v23 = 1;
LABEL_25:

  return v23;
}

- (void)mergePersons:(id)a3 withOptimalState:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v33 = a4;
  context = (void *)MEMORY[0x19F38D3B0]();
  [(PLPerson *)self basicMergePersons:v6];
  uint64_t v31 = [(PLPerson *)self finalMergeTargetPerson];
  uint64_t v7 = [(PLPerson *)self mergeCandidates];
  uint64_t v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [(PLPerson *)self mergeCandidatesWithConfidence];
  BOOL v10 = (void *)[v9 mutableCopy];

  id v11 = [(PLPerson *)self invalidMergeCandidates];
  id v12 = (void *)[v11 mutableCopy];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v19 = [v18 mergeCandidates];
        uint64_t v20 = [v19 allObjects];
        [v8 addObjectsFromArray:v20];

        long long v21 = [v18 mergeCandidatesWithConfidence];
        int v22 = [v21 allObjects];
        [v10 addObjectsFromArray:v22];

        BOOL v23 = [v18 invalidMergeCandidates];
        v24 = [v23 allObjects];
        [v12 addObjectsFromArray:v24];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v15);
  }

  [v8 removeObject:v31];
  [v10 removeObject:v31];
  [v12 removeObject:v31];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v25 = v12;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v34 + 1) + 8 * j);
        [v8 removeObject:v30];
        [v10 removeObject:v30];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v27);
  }

  [v31 setMergeCandidates:v8];
  [v31 setMergeCandidatesWithConfidence:v10];
  [v31 setInvalidMergeCandidates:v25];
  [v31 setValuesForKeysWithDictionary:v33];
}

- (void)basicMergePersons:(id)a3
{
  id v5 = a3;
  id v4 = [(PLPerson *)self finalMergeTargetPerson];
  if (_os_feature_enabled_impl()) {
    [(PLPerson *)self _updateSocialGroupMembershipWithPersonsToMerge:v5 mergeTarget:v4];
  }
  [v4 _basicMergePersons:v5];
}

- (BOOL)_updateSocialGroupMembershipWithPersonsToMerge:(id)a3 mergeTarget:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PLPerson *)self managedObjectContext];
  uint64_t v9 = objc_msgSend(v8, "pl_graphCache");

  BOOL v10 = [(PLPerson *)self managedObjectContext];
  id v11 = [v9 labelWithCode:1000 inContext:v10];

  if (v11)
  {
    id v12 = +[PLGraphEdge fetchRequest];
    id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K = %@) AND (%K in %@)", @"sourceNode.primaryLabel", v11, @"targetPerson", v6];
    [v12 setPredicate:v13];

    [v12 setResultType:0];
    v30[0] = @"sourceNode";
    int v14 = 1;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [v12 setRelationshipKeyPathsForPrefetching:v15];

    uint64_t v16 = [(PLPerson *)self managedObjectContext];
    id v27 = 0;
    int v17 = [v16 executeFetchRequest:v12 error:&v27];
    id v18 = v27;

    if (!v17)
    {
      uint64_t v19 = PLBackendGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v18;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Error fetching social group edges during person merge: %@", buf, 0xCu);
      }

      int v14 = 0;
    }
    if ([v17 count])
    {
      id v26 = v18;
      BOOL v20 = [(PLPerson *)self _updateGroupMembershipFromEdges:v17 mergeTarget:v7 error:&v26];
      id v21 = v26;

      if (!v20)
      {
        int v22 = PLBackendGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = v21;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Error adding/ removing members during person merge: %@", buf, 0xCu);
        }

        int v14 = 0;
      }
    }
    else
    {
      id v21 = v18;
    }

    BOOL v24 = v14 != 0;
  }
  else
  {
    BOOL v23 = PLBackendGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Error getting social group label during person merge", buf, 2u);
    }

    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)_updateGroupMembershipFromEdges:(id)a3 mergeTarget:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v32 = a4;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v29 = a5;
    id v33 = 0;
    uint64_t v11 = *(void *)v37;
    uint64_t v31 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        int v14 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v15 = [v13 sourceNode];
        uint64_t v16 = v15;
        if (v15 && ([v15 isDeleted] & 1) == 0)
        {
          id v17 = +[PLGraphNodeContainer newNodeContainerWithNode:v16];
          id v18 = [v13 targetPerson];
          id v35 = v33;
          int v19 = [v17 removeMember:v18 error:&v35];
          id v20 = v35;

          if (!v19) {
            goto LABEL_18;
          }
          id v34 = v20;
          int v21 = [v17 addMember:v32 error:&v34];
          id v33 = v34;

          if (!v21)
          {
            id v20 = v33;
LABEL_18:

            id v8 = v31;

            id v26 = v20;
            if (v29)
            {
              id v26 = v26;
              BOOL v25 = 0;
              *id v29 = v26;
            }
            else
            {
              BOOL v25 = 0;
            }
            id v27 = v26;
            goto LABEL_22;
          }
          int v22 = [v17 members];
          unint64_t v23 = [v22 count];

          if (v23 <= 1)
          {
            BOOL v24 = [(PLPerson *)self managedObjectContext];
            [v24 deleteObject:v16];
          }
          id v8 = v31;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    BOOL v25 = 1;
    id v26 = v8;
    id v27 = v33;
LABEL_22:
  }
  else
  {
    BOOL v25 = 1;
    id v27 = v8;
  }

  return v25;
}

- (void)_basicMergePersons:(id)a3
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x19F38D3B0]();
  v107 = [(PLPerson *)self managedObjectContext];
  v111 = [MEMORY[0x1E4F1CA48] array];
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v147 objects:v169 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v113 = 0;
    uint64_t v8 = *(void *)v148;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v148 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v147 + 1) + 8 * i);
        uint64_t v11 = [(PLPerson *)self personUUID];
        id v12 = [v10 personUUID];
        int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            int v14 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              uint64_t v15 = [(PLPerson *)self personUUID];
              *(_DWORD *)buf = 138412290;
              v159 = v15;
              _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Person to merge should never be the same as the target person, aborting merge, personUUID = %@", buf, 0xCu);
            }
          }
        }
        else if ([(PLPerson *)self validateDetectionTypesForMergingWithPersons:v5 error:0])
        {
          if (v113)
          {
            char v113 = 1;
          }
          else if ([v10 verifiedType] == 1)
          {
            char v113 = 1;
            [(PLPerson *)self setVerifiedType:1];
          }
          else
          {
            char v113 = 0;
          }
          [v111 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v147 objects:v169 count:16];
    }
    while (v7);
  }

  uint64_t v16 = v111;
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v17 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v159 = v16;
      __int16 v160 = 2112;
      v161 = self;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Merging %@ to %@", buf, 0x16u);
    }
  }
  v114 = [MEMORY[0x1E4F1CA80] set];
  id v18 = [MEMORY[0x1E4F1CA80] set];
  v112 = [MEMORY[0x1E4F1CA80] set];
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  obuint64_t j = v16;
  uint64_t v19 = [(PLPerson *)obj countByEnumeratingWithState:&v143 objects:v168 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v144;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v144 != v21) {
          objc_enumerationMutation(obj);
        }
        unint64_t v23 = *(void **)(*((void *)&v143 + 1) + 8 * j);
        BOOL v24 = [v23 rejectedFaces];
        BOOL v25 = [v24 valueForKey:@"objectID"];

        [v114 unionSet:v25];
        id v26 = [v23 allDetectedFaces];
        id v27 = [v26 valueForKey:@"objectID"];

        [v18 unionSet:v27];
        uint64_t v28 = [v23 rejectedFacesNeedingFaceCrops];
        id v29 = [v28 valueForKey:@"objectID"];

        [v112 unionSet:v29];
      }
      uint64_t v20 = [(PLPerson *)obj countByEnumeratingWithState:&v143 objects:v168 count:16];
    }
    while (v20);
  }

  uint64_t v30 = [(PLPerson *)self allDetectedFaces];
  uint64_t v31 = [v30 valueForKey:@"objectID"];

  id v32 = [(PLPerson *)self rejectedFaces];
  id v33 = [v32 valueForKey:@"objectID"];

  id v34 = [(PLPerson *)self rejectedFacesNeedingFaceCrops];
  uint64_t v35 = [v34 valueForKey:@"objectID"];

  long long v36 = (void *)[v33 mutableCopy];
  [v36 intersectSet:v18];
  long long v37 = (void *)[v114 mutableCopy];
  [v37 minusSet:v18];
  v103 = v33;
  [v37 minusSet:v33];
  [v37 minusSet:v31];
  long long v38 = (void *)[v112 mutableCopy];
  [v38 minusSet:v18];
  v106 = (void *)v35;
  [v38 minusSet:v35];
  id v108 = v38;
  v104 = (void *)v31;
  [v38 minusSet:v31];
  if (!*MEMORY[0x1E4F59AC0])
  {
    long long v39 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = [v18 count];
      uint64_t v41 = [v36 count];
      uint64_t v42 = [v37 count];
      uint64_t v43 = [v106 count];
      *(_DWORD *)buf = 134219010;
      v159 = (PLPerson *)v40;
      __int16 v160 = 2048;
      v161 = (PLPerson *)v41;
      __int16 v162 = 2048;
      uint64_t v163 = v42;
      __int16 v164 = 2048;
      uint64_t v165 = v43;
      __int16 v166 = 2112;
      v167 = self;
      _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, "Adding %lu faces, unreject %lu faces, adding %lu rejectedFaces, %lu rejectedFacesNeedingFaceCrops to %@", buf, 0x34u);
    }
  }
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v44 = v18;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v139 objects:v157 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v140;
    do
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v140 != v47) {
          objc_enumerationMutation(v44);
        }
        int v49 = [v107 objectWithID:*(void *)(*((void *)&v139 + 1) + 8 * k)];
        uint64_t v50 = [(PLPerson *)self mutableFaces];
        [v50 addObject:v49];

        [v49 fixPersonRelationshipsForFaceTorsoOrTemporal];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v139 objects:v157 count:16];
    }
    while (v46);
  }

  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v51 = v36;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v135 objects:v156 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v136;
    do
    {
      for (uint64_t m = 0; m != v53; ++m)
      {
        if (*(void *)v136 != v54) {
          objc_enumerationMutation(v51);
        }
        long long v56 = [v107 objectWithID:*(void *)(*((void *)&v135 + 1) + 8 * m)];
        long long v57 = [(PLPerson *)self mutableRejectedFaces];
        [v57 removeObject:v56];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v135 objects:v156 count:16];
    }
    while (v53);
  }

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v58 = v37;
  uint64_t v59 = [v58 countByEnumeratingWithState:&v131 objects:v155 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v132;
    do
    {
      for (uint64_t n = 0; n != v60; ++n)
      {
        if (*(void *)v132 != v61) {
          objc_enumerationMutation(v58);
        }
        id v63 = [v107 objectWithID:*(void *)(*((void *)&v131 + 1) + 8 * n)];
        uint64_t v64 = [(PLPerson *)self mutableRejectedFaces];
        [v64 addObject:v63];
      }
      uint64_t v60 = [v58 countByEnumeratingWithState:&v131 objects:v155 count:16];
    }
    while (v60);
  }

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v109 = v108;
  uint64_t v65 = [v109 countByEnumeratingWithState:&v127 objects:v154 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v128;
    do
    {
      for (iuint64_t i = 0; ii != v66; ++ii)
      {
        if (*(void *)v128 != v67) {
          objc_enumerationMutation(v109);
        }
        v69 = [v107 objectWithID:*(void *)(*((void *)&v127 + 1) + 8 * ii)];
        v70 = [(PLPerson *)self mutableRejectedFacesNeedingFaceCrops];
        [v70 addObject:v69];
      }
      uint64_t v66 = [v109 countByEnumeratingWithState:&v127 objects:v154 count:16];
    }
    while (v66);
  }

  if (!*MEMORY[0x1E4F59AC0])
  {
    v71 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      v72 = [(PLPerson *)self faceCrops];
      uint64_t v73 = [v72 count];
      *(_DWORD *)buf = 138412546;
      v159 = self;
      __int16 v160 = 2048;
      v161 = (PLPerson *)v73;
      _os_log_impl(&dword_19B3C7000, v71, OS_LOG_TYPE_DEFAULT, "%@ has %lu faceCrops before merging", buf, 0x16u);
    }
  }
  v100 = v58;
  v101 = v51;
  v102 = v44;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  v74 = obj;
  uint64_t v75 = [(PLPerson *)v74 countByEnumeratingWithState:&v123 objects:v153 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v124;
    do
    {
      for (juint64_t j = 0; jj != v76; ++jj)
      {
        if (*(void *)v124 != v77) {
          objc_enumerationMutation(v74);
        }
        v79 = *(PLPerson **)(*((void *)&v123 + 1) + 8 * jj);
        v80 = [(PLPerson *)v79 faceCrops];
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        uint64_t v81 = [v80 countByEnumeratingWithState:&v119 objects:v152 count:16];
        if (v81)
        {
          uint64_t v82 = v81;
          uint64_t v83 = *(void *)v120;
          do
          {
            for (kuint64_t k = 0; kk != v82; ++kk)
            {
              if (*(void *)v120 != v83) {
                objc_enumerationMutation(v80);
              }
              [*(id *)(*((void *)&v119 + 1) + 8 * kk) setState:0];
            }
            uint64_t v82 = [v80 countByEnumeratingWithState:&v119 objects:v152 count:16];
          }
          while (v82);
        }
        v85 = [(PLPerson *)v79 faceCrops];
        v86 = [v85 allObjects];

        if (!*MEMORY[0x1E4F59AC0])
        {
          v87 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v88 = [v86 count];
            *(_DWORD *)buf = 134218242;
            v159 = (PLPerson *)v88;
            __int16 v160 = 2112;
            v161 = v79;
            _os_log_impl(&dword_19B3C7000, v87, OS_LOG_TYPE_DEFAULT, "Adding %lu faceCrops from %@", buf, 0x16u);
          }
        }
        v89 = [(PLPerson *)self mutableFaceCrops];
        [v89 addObjectsFromArray:v86];
      }
      uint64_t v76 = [(PLPerson *)v74 countByEnumeratingWithState:&v123 objects:v153 count:16];
    }
    while (v76);
  }

  if (!*MEMORY[0x1E4F59AC0])
  {
    v90 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      v91 = [(PLPerson *)self faceCrops];
      uint64_t v92 = [v91 count];
      *(_DWORD *)buf = 138412546;
      v159 = self;
      __int16 v160 = 2048;
      v161 = (PLPerson *)v92;
      _os_log_impl(&dword_19B3C7000, v90, OS_LOG_TYPE_DEFAULT, "%@ has %lu faceCrops after merging", buf, 0x16u);
    }
  }
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  v93 = v74;
  uint64_t v94 = [(PLPerson *)v93 countByEnumeratingWithState:&v115 objects:v151 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v116;
    do
    {
      for (muint64_t m = 0; mm != v95; ++mm)
      {
        if (*(void *)v116 != v96) {
          objc_enumerationMutation(v93);
        }
        v98 = *(PLPerson **)(*((void *)&v115 + 1) + 8 * mm);
        if (!*MEMORY[0x1E4F59AC0])
        {
          v99 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v159 = v98;
            __int16 v160 = 2112;
            v161 = self;
            _os_log_impl(&dword_19B3C7000, v99, OS_LOG_TYPE_DEFAULT, "Updating targetPerson for %@ to %@ after merging", buf, 0x16u);
          }
        }
        [(PLPerson *)v98 setMergeTargetPerson:self];
      }
      uint64_t v95 = [(PLPerson *)v93 countByEnumeratingWithState:&v115 objects:v151 count:16];
    }
    while (v95);
  }
}

- (id)finalMergeTargetPerson
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = self;
  int v3 = [(PLPerson *)v2 mergeTargetPerson];
  id v4 = [(PLPerson *)v2 mergeTargetPerson];
  id v5 = [v4 mergeTargetPerson];

  if (v3)
  {
    uint64_t v6 = v2;
    while (v6 != v5)
    {
      uint64_t v7 = v3;

      int v3 = [(PLPerson *)v7 mergeTargetPerson];

      uint64_t v8 = [(PLPerson *)v5 mergeTargetPerson];
      uint64_t v9 = [v8 mergeTargetPerson];

      uint64_t v6 = v7;
      id v5 = (PLPerson *)v9;
      if (!v3)
      {
        uint64_t v6 = (PLPerson *)v9;
        v2 = v7;
        goto LABEL_12;
      }
    }
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v10 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        int v14 = v2;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Looping merge target person %@", (uint8_t *)&v13, 0xCu);
      }
    }
    v2 = v6;
  }
  else
  {
    uint64_t v6 = v5;
  }
LABEL_12:
  uint64_t v11 = v2;

  return v11;
}

- (id)pickKeyFaceOptimalStateForContactDedupeWithPersons:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 arrayByAddingObject:self];
  uint64_t v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_345_110857];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v21;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v7);
      }
      int v13 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v12), "keyFace", (void)v20);
      int v14 = v13;
      if (v13)
      {
        if (!v10) {
          id v10 = v13;
        }
        if ([v14 nameSource] == 3 || objc_msgSend(v14, "nameSource") == 1) {
          break;
        }
      }

      if (v9 == ++v12)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
    id v10 = 0;
LABEL_15:
    int v14 = 0;
  }

  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = v10;
  }
  id v16 = v15;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v18 = [NSNumber numberWithShort:v14 != 0];
  [v17 setObject:v18 forKey:@"keyFacePickSource"];

  if (v16) {
    [v17 setObject:v16 forKey:@"keyFace"];
  }

  return v17;
}

uint64_t __63__PLPerson_pickKeyFaceOptimalStateForContactDedupeWithPersons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 personUUID];
  uint64_t v6 = [v4 personUUID];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)prepareForUserInitiatedMergeWithPersons:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLPerson *)self managedObjectContext];
  uint64_t v47 = self;
  __int16 v48 = v4;
  uint64_t v6 = [v4 arrayByAddingObject:self];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"verifiedType", 2);
  id v44 = v6;
  uint64_t v8 = [v6 filteredArrayUsingPredicate:v7];

  uint64_t v9 = (void *)MEMORY[0x1E4F1C0D0];
  id v10 = +[PLFaceCrop entityName];
  uint64_t v11 = [v9 fetchRequestWithEntityName:v10];

  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"person", v8];
  [v11 setPredicate:v12];

  id v63 = 0;
  uint64_t v46 = v11;
  int v13 = [v5 executeFetchRequest:v11 error:&v63];
  id v14 = v63;
  int v49 = (void *)v8;
  uint64_t v45 = v13;
  if (v13)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v60 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          [v20 setPerson:0];
          [v5 deleteObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v59 objects:v70 count:16];
      }
      while (v17);
      uint64_t v8 = (uint64_t)v49;
    }
  }
  else
  {
    uint64_t v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v67 = "-[PLPerson prepareForUserInitiatedMergeWithPersons:]";
      __int16 v68 = 2112;
      id v69 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "%s error fetching face crops to delete: %@", buf, 0x16u);
    }
  }

  long long v21 = (void *)MEMORY[0x1E4F1C0D0];
  long long v22 = +[PLDetectedFace entityName];
  long long v23 = [v21 fetchRequestWithEntityName:v22];

  BOOL v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@ AND %K != %d", @"personForFace", v8, @"nameSource", 0];
  [v23 setPredicate:v24];

  id v58 = v14;
  uint64_t v25 = [v5 executeFetchRequest:v23 error:&v58];
  id v26 = v58;

  uint64_t v43 = v26;
  if (v25)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v27 = v25;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v55 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = *(void **)(*((void *)&v54 + 1) + 8 * j);
          [v32 setEffectiveNameSource:0];
          [v32 setConfirmedFaceCropGenerationState:0];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v54 objects:v65 count:16];
      }
      while (v29);
    }
  }
  else
  {
    id v27 = PLBackendGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v67 = "-[PLPerson prepareForUserInitiatedMergeWithPersons:]";
      __int16 v68 = 2112;
      id v69 = v26;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "%s error fetching faces to reset: %@", buf, 0x16u);
    }
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v33 = v44;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v51 != v36) {
          objc_enumerationMutation(v33);
        }
        long long v38 = *(void **)(*((void *)&v50 + 1) + 8 * k);
        long long v39 = [v38 keyFace];
        int v40 = [v39 nameSource];

        if (v40 != 1)
        {
          uint64_t v41 = [v38 keyFace];
          [v41 setEffectiveNameSource:1];

          uint64_t v42 = [v38 keyFace];
          [v42 setConfirmedFaceCropGenerationState:1];
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v50 objects:v64 count:16];
    }
    while (v35);
  }

  if ([(PLPerson *)v47 keyFacePickSource] != 1) {
    [(PLPerson *)v47 setKeyFacePickSource:1];
  }
}

- (id)reverseOrderedMergeTargetPersons
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v5 = [(PLPerson *)self mergeTargetPerson];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    while (![v4 containsObject:v6])
    {
      [v4 addObject:v6];
      [v3 insertObject:v6 atIndex:0];
      uint64_t v7 = [v6 mergeTargetPerson];

      uint64_t v6 = (void *)v7;
      if (!v7) {
        goto LABEL_9;
      }
    }
    uint64_t v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412546;
      uint64_t v11 = self;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Found a looping merge target person for %@: %@", (uint8_t *)&v10, 0x16u);
    }
  }
LABEL_9:

  return v3;
}

- (id)pickOptimalStateForUserInitiatedMergeWithPersons:(id)a3 nominalTarget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 arrayByAddingObject:self];
  uint64_t v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_331];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v7)
  {
    id v11 = v7;
  }
  else
  {
    id v11 = [v9 lastObject];
  }
  __int16 v12 = v11;
  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "manualOrder"));
  [v10 setObject:v13 forKey:@"manualOrder"];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "type"));
  [v10 setObject:v14 forKey:@"type"];

  uint64_t v15 = [v7 keyFace];

  if (v15)
  {
    uint64_t v16 = [v7 keyFace];
    [v10 setObject:v16 forKey:@"keyFace"];
  }
  uint64_t v17 = [v7 fullName];
  uint64_t v18 = [v17 length];

  if (v18)
  {
    uint64_t v19 = [v7 fullName];
    [v10 setObject:v19 forKey:@"fullName"];

    long long v20 = [v7 displayName];
    if (v20)
    {
      [v10 setObject:v20 forKey:@"displayName"];
    }
    else
    {
      long long v21 = [MEMORY[0x1E4F1CA98] null];
      [v10 setObject:v21 forKey:@"displayName"];
    }
  }
  long long v22 = [v7 contactMatchingDictionary];
  if (v22)
  {

    goto LABEL_14;
  }
  long long v23 = [v7 personUri];

  if (v23)
  {
LABEL_14:
    BOOL v24 = [v7 contactMatchingDictionary];
    if (v24)
    {
      [v10 setObject:v24 forKey:@"contactMatchingDictionary"];
    }
    else
    {
      uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
      [v10 setObject:v25 forKey:@"contactMatchingDictionary"];
    }
    id v26 = [v7 personUri];
    if (v26)
    {
      [v10 setObject:v26 forKey:@"personUri"];
    }
    else
    {
      id v27 = [MEMORY[0x1E4F1CA98] null];
      [v10 setObject:v27 forKey:@"personUri"];
    }
    if (v15 && v18) {
      goto LABEL_38;
    }
  }
  uint64_t v74 = 0;
  uint64_t v75 = &v74;
  uint64_t v76 = 0x3032000000;
  uint64_t v77 = __Block_byref_object_copy__110901;
  v78 = __Block_byref_object_dispose__110902;
  id v79 = 0;
  uint64_t v68 = 0;
  id v69 = &v68;
  uint64_t v70 = 0x3032000000;
  uint64_t v71 = __Block_byref_object_copy__110901;
  v72 = __Block_byref_object_dispose__110902;
  id v73 = 0;
  uint64_t v62 = 0;
  id v63 = &v62;
  uint64_t v64 = 0x3032000000;
  uint64_t v65 = __Block_byref_object_copy__110901;
  uint64_t v66 = __Block_byref_object_dispose__110902;
  id v67 = 0;
  uint64_t v56 = 0;
  long long v57 = &v56;
  uint64_t v58 = 0x3032000000;
  long long v59 = __Block_byref_object_copy__110901;
  long long v60 = __Block_byref_object_dispose__110902;
  id v61 = 0;
  uint64_t v50 = 0;
  long long v51 = &v50;
  uint64_t v52 = 0x3032000000;
  long long v53 = __Block_byref_object_copy__110901;
  long long v54 = __Block_byref_object_dispose__110902;
  id v55 = 0;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __75__PLPerson_pickOptimalStateForUserInitiatedMergeWithPersons_nominalTarget___block_invoke_2;
  v49[3] = &unk_1E5874A58;
  v49[4] = &v50;
  v49[5] = &v68;
  v49[6] = &v62;
  v49[7] = &v74;
  v49[8] = &v56;
  [v9 enumerateObjectsWithOptions:2 usingBlock:v49];
  id v28 = (id)v75[5];
  id v29 = v10;
  uint64_t v30 = v29;
  if (v28)
  {
    uint64_t v31 = [v29 objectForKey:@"keyFace"];

    if (!v31) {
      [v30 setObject:v28 forKey:@"keyFace"];
    }
  }

  id v32 = (id)v69[5];
  id v33 = v30;
  uint64_t v34 = v33;
  if (v32)
  {
    uint64_t v35 = [v33 objectForKey:@"fullName"];

    if (!v35) {
      [v34 setObject:v32 forKey:@"fullName"];
    }
  }

  id v36 = (id)v63[5];
  id v37 = v34;
  long long v38 = v37;
  if (v36)
  {
    long long v39 = [v37 objectForKey:@"displayName"];

    if (!v39) {
      [v38 setObject:v36 forKey:@"displayName"];
    }
  }

  id v40 = (id)v57[5];
  id v41 = v38;
  uint64_t v42 = v41;
  if (v40)
  {
    uint64_t v43 = [v41 objectForKey:@"contactMatchingDictionary"];

    if (!v43) {
      [v42 setObject:v40 forKey:@"contactMatchingDictionary"];
    }
  }

  id v44 = (id)v51[5];
  id v45 = v42;
  uint64_t v46 = v45;
  if (v44)
  {
    uint64_t v47 = [v45 objectForKey:@"personUri"];

    if (!v47) {
      [v46 setObject:v44 forKey:@"personUri"];
    }
  }

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
LABEL_38:

  return v10;
}

void __75__PLPerson_pickOptimalStateForUserInitiatedMergeWithPersons_nominalTarget___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v34 = v3;
  if (!*(void *)(*(void *)(a1[4] + 8) + 40))
  {
    id v4 = [v3 personUri];

    id v3 = v34;
    if (v4)
    {
      uint64_t v5 = [v34 personUri];
      uint64_t v6 = *(void *)(a1[4] + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      uint64_t v8 = [v34 fullName];
      uint64_t v9 = *(void *)(a1[5] + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v11 = [v34 displayName];
      uint64_t v12 = *(void *)(a1[6] + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      uint64_t v14 = [v34 keyFace];
      uint64_t v15 = *(void *)(a1[7] + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      uint64_t v17 = [v34 contactMatchingDictionary];
      uint64_t v18 = *(void *)(a1[8] + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      id v3 = v34;
    }
  }
  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    long long v20 = [v34 fullName];

    id v3 = v34;
    if (v20)
    {
      uint64_t v21 = [v34 fullName];
      uint64_t v22 = *(void *)(a1[5] + 8);
      long long v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      uint64_t v24 = [v34 displayName];
      uint64_t v25 = *(void *)(a1[6] + 8);
      id v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;

      uint64_t v27 = [v34 keyFace];
      uint64_t v28 = *(void *)(a1[7] + 8);
      id v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = v27;

      id v3 = v34;
    }
  }
  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v30 = [v34 keyFace];

    id v3 = v34;
    if (v30)
    {
      uint64_t v31 = [v34 keyFace];
      uint64_t v32 = *(void *)(a1[7] + 8);
      id v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = v31;

      id v3 = v34;
    }
  }
}

uint64_t __75__PLPerson_pickOptimalStateForUserInitiatedMergeWithPersons_nominalTarget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 type];
  if (v6 == [v5 type])
  {
    id v7 = [v4 fullName];
    if ([v7 length])
    {
      uint64_t v8 = [v5 fullName];
      uint64_t v9 = [v8 length];

      if (!v9) {
        goto LABEL_22;
      }
    }
    else
    {
    }
    uint64_t v16 = [v4 fullName];
    if ([v16 length])
    {
    }
    else
    {
      uint64_t v18 = [v5 fullName];
      uint64_t v19 = [v18 length];

      if (v19) {
        goto LABEL_26;
      }
    }
    int v17 = [v4 faceCount];
    if (v17 > (int)[v5 faceCount])
    {
LABEL_22:
      uint64_t v15 = 1;
      goto LABEL_28;
    }
    int v20 = [v4 faceCount];
    if (v20 >= (int)[v5 faceCount])
    {
      uint64_t v21 = [v5 personUUID];
      uint64_t v22 = [v4 personUUID];
      uint64_t v15 = [v21 compare:v22];

      goto LABEL_28;
    }
LABEL_26:
    uint64_t v15 = -1;
    goto LABEL_28;
  }
  int v10 = [v4 type];
  int v11 = [v5 type];
  uint64_t v12 = 1;
  if (v10 <= v11) {
    uint64_t v12 = -1;
  }
  uint64_t v13 = 1;
  if (v10 != 1) {
    uint64_t v13 = -1;
  }
  if (v11 == -1) {
    uint64_t v12 = v13;
  }
  uint64_t v14 = -1;
  if (v11 != 1) {
    uint64_t v14 = 1;
  }
  if (v10 == -1) {
    uint64_t v12 = v14;
  }
  if (v10 == v11) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v12;
  }
LABEL_28:

  return v15;
}

- (id)_nameRelatedMetadataKeys
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"fullName";
  v4[1] = @"displayName";
  v4[2] = @"contactMatchingDictionary";
  v4[3] = @"personUri";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  return v2;
}

- (BOOL)_personResetIsInProgress
{
  v2 = [(PLPerson *)self managedObjectContext];
  id v3 = [v2 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"PLPersonReset"];
  char v5 = [v4 isEqual:MEMORY[0x1E4F1CC38]];

  return v5;
}

- (void)removePersistedFileSystemDataWithPathManager:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLPerson.m", 1101, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 isDCIM])
  {
    int v6 = [[PLPersistedPersonMetadata alloc] initWithPLPerson:self pathManager:v8];
    [(PLPersistedPersonMetadata *)v6 removePersistedData];
  }
}

- (void)persistMetadataToFileSystemWithPathManager:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLPerson.m", 1093, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 isDCIM])
  {
    int v6 = [[PLPersistedPersonMetadata alloc] initWithPLPerson:self pathManager:v8];
    [(PLPersistedPersonMetadata *)v6 writePersistedData];
  }
}

- (BOOL)isValidForPersistence
{
  if (![(PLPerson *)self verifiedType]) {
    return 0;
  }
  id v3 = [(PLPerson *)self personUUID];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_updateSharedLibraryPeopleRulesForTombstone
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"autoSharePolicy", 2);
  BOOL v4 = [(PLPerson *)self managedObjectContext];
  id v5 = +[PLShare sharesWithPredicate:v3 fetchLimit:0 inManagedObjectContext:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        uint64_t v12 = [(PLPerson *)self personUUID];
        uint64_t v13 = [(PLPerson *)self mergeTargetPerson];
        uint64_t v14 = [v13 personUUID];
        [v11 updatePeopleRulesForTombstonePersonUUID:v12 replaceWithPersonUUID:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)setEffectiveVerifiedType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(PLPerson *)self cloudVerifiedType];
  if (v3 == 2 && v5 == 1)
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Setting effectiveVerifiedType ignored, PLPersonVerifiedTypeUser cannot be overwritten by PLPersonVerifiedTypeGraph", v7, 2u);
    }
  }
  else
  {
    [(PLPerson *)self setVerifiedType:v3];
    [(PLPerson *)self setCloudVerifiedType:v3];
    if (v3 == -2)
    {
      [(PLPerson *)self setContactMatchingDictionary:0];
      [(PLPerson *)self setPersonUri:0];
    }
  }
}

- (void)rejectFaceIfPossible:(id)a3 shouldCreateFaceCrop:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  int v6 = [(PLPerson *)self verifiedType];
  uint64_t v7 = v9;
  if (v9)
  {
    if (v6)
    {
      uint64_t v8 = [(PLPerson *)self mutableRejectedFaces];
      [v8 addObject:v9];

      uint64_t v7 = v9;
      if (v4)
      {
        [v9 addRejectedPersonNeedingFaceCrops:self];
        uint64_t v7 = v9;
      }
    }
  }
}

- (void)assignDetectionTypeFromFaces
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v59 = 0;
  memset(v58, 0, sizeof(v58));
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  __int16 v37 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __40__PLPerson_assignDetectionTypeFromFaces__block_invoke;
  v33[3] = &unk_1E58747A0;
  v33[4] = &v38;
  v33[5] = &v34;
  v33[6] = &v42;
  BOOL v4 = (void (**)(void, void, void))MEMORY[0x19F38D650](v33);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int v5 = [(PLPerson *)self detectedFaces];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v57 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v5);
        }
        ((void (**)(void, void, _OWORD *))v4)[2](v4, *(void *)(*((void *)&v29 + 1) + 8 * i), v58);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v57 count:16];
    }
    while (v6);
  }

  id v9 = [(PLPerson *)self temporalDetectedFaces];
  unint64_t v10 = v39[3];
  if (v10 < [v9 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v56 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v11);
          }
          ((void (**)(void, void, _OWORD *))v4)[2](v4, *(void *)(*((void *)&v25 + 1) + 8 * j), v58);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v56 count:16];
      }
      while (v12);
    }
  }
  int v15 = *((__int16 *)v35 + 12);
  if ((v15 - 3) < 2 || v15 == 1)
  {
    unsigned __int16 v17 = [(PLPerson *)self detectionType];
    if (*((unsigned __int16 *)v35 + 12) != v17)
    {
      long long v18 = PLBackendGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = [(PLPerson *)self detectionType];
        int v20 = *((__int16 *)v35 + 12);
        uint64_t v21 = [(PLPerson *)self personUUID];
        uint64_t v22 = v39[3];
        uint64_t v23 = v43[3];
        *(_DWORD *)buf = 67110146;
        int v47 = v19;
        __int16 v48 = 1024;
        int v49 = v20;
        __int16 v50 = 2114;
        long long v51 = v21;
        __int16 v52 = 2048;
        uint64_t v53 = v22;
        __int16 v54 = 2048;
        uint64_t v55 = v23;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Changing detectionType from %d to %d on person %{public}@ for %tu of %tu detected faces", buf, 0x2Cu);
      }
      [(PLPerson *)self setDetectionType:*((__int16 *)v35 + 12)];
    }
  }
  else if (v15 == 2)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PLPerson.m", 713, @"Invalid parameter not satisfying: %@", @"majorityDetectionType != PLDetectionTypePet" object file lineNumber description];
  }
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
}

void __40__PLPerson_assignDetectionTypeFromFaces__block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (([v8 manual] & 1) == 0)
  {
    int v5 = [v8 detectionType];
    if (v5 <= 4)
    {
      unint64_t v6 = *(void *)(a3 + 8 * v5) + 1;
      uint64_t v7 = *(void *)(a1[4] + 8);
      if (v6 > *(void *)(v7 + 24))
      {
        *(void *)(v7 + 24) = v6;
        *(_WORD *)(*(void *)(a1[5] + 8) + 24) = v5;
      }
      *(void *)(a3 + 8 * v5) = v6;
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
    }
  }
}

- (void)resetFacesProcessing
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLPerson *)self entity];
  BOOL v4 = (void *)MEMORY[0x1E4F1C0A8];
  int v5 = +[PLDetectedFace entityName];
  unint64_t v6 = [(PLPerson *)self managedObjectContext];
  uint64_t v7 = [v4 entityForName:v5 inManagedObjectContext:v6];

  long long v27 = v3;
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = [v3 relationshipsByName];
  id v9 = [v8 allValues];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
        int v15 = (void *)MEMORY[0x19F38D3B0]();
        long long v16 = [v14 destinationEntity];
        int v17 = [v16 isEqual:v7];

        if (v17)
        {
          long long v18 = [v14 name];
          int v19 = [(PLPerson *)self valueForKey:v18];

          if (v19)
          {
            if ([v14 isToMany]) {
              [v28 unionSet:v19];
            }
            else {
              [v28 addObject:v19];
            }
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = v28;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = *(void **)(*((void *)&v29 + 1) + 8 * v24);
        long long v26 = (void *)MEMORY[0x19F38D3B0]();
        [v25 setEffectiveNameSource:0];
        [v25 fixPersonRelationshipsForFaceTorsoOrTemporal];
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v22);
  }
}

- (void)resetAllFacesToDefault
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLPerson *)self allDetectedFaces];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
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
        [v8 setClusterSequenceNumber:0];
        [v8 setVuObservationID:0];
        [v8 setAssociatedPerson:0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  id v9 = [(PLPerson *)self rejectedFaces];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [(PLPerson *)self mutableRejectedFaces];
    [v11 removeAllObjects];

    uint64_t v12 = [(PLPerson *)self mutableRejectedFacesNeedingFaceCrops];
    [v12 removeAllObjects];
  }
}

- (id)faceGroupDescription
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v6[0] = @"personUUID";
  v6[1] = @"associatedFaceGroup";
  v6[2] = @"detectedFaces";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  uint64_t v4 = [(NSManagedObject *)self truncatedDescriptionWithPropertyKeys:v3];

  return v4;
}

- (id)debugLogDescription
{
  uint64_t v3 = [(PLPerson *)self fullName];
  uint64_t v4 = (void *)v3;
  uint64_t v5 = @"<No Name>";
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  uint64_t v6 = v5;

  uint64_t v7 = [(PLPerson *)self displayName];
  id v8 = (void *)v7;
  id v9 = @"<No Display Name>";
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  uint64_t v10 = v9;

  uint64_t v11 = NSString;
  uint64_t v12 = [(PLPerson *)self personUUID];
  long long v13 = [v11 stringWithFormat:@"%@ (%@) [%@]", v6, v10, v12];

  return v13;
}

- (void)setKeyFace:(id)a3 pickSource:(signed __int16)a4
{
  if (a3) {
    uint64_t v5 = a4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = a3;
  [(PLPerson *)self setKeyFacePickSource:v5];
  [(PLPerson *)self setKeyFace:v6];
}

- (id)mutableInvalidMergeCandidates
{
  return (id)[(PLPerson *)self mutableSetValueForKey:@"invalidMergeCandidates"];
}

- (id)mutableMergeCandidatesWithConfidence
{
  return (id)[(PLPerson *)self mutableSetValueForKey:@"mergeCandidatesWithConfidence"];
}

- (id)mutableMergeCandidates
{
  return (id)[(PLPerson *)self mutableSetValueForKey:@"mergeCandidates"];
}

- (id)mutableFaceCrops
{
  return (id)[(PLPerson *)self mutableSetValueForKey:@"faceCrops"];
}

- (id)mutableRejectedFacesNeedingFaceCrops
{
  return (id)[(PLPerson *)self mutableSetValueForKey:@"rejectedFacesNeedingFaceCrops"];
}

- (id)mutableRejectedFaces
{
  return (id)[(PLPerson *)self mutableSetValueForKey:@"rejectedFaces"];
}

- (id)mutableTemporalFaces
{
  return (id)[(PLPerson *)self mutableSetValueForKey:@"temporalDetectedFaces"];
}

- (id)mutableFaces
{
  return (id)[(PLPerson *)self mutableSetValueForKey:@"detectedFaces"];
}

- (void)_triggerPersonSyncUpdateWithLibraryServicesManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLSyndicationGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Triggering person sync update", buf, 2u);
  }

  id v6 = [MEMORY[0x1E4F8BA48] transaction:"-[PLPerson _triggerPersonSyncUpdateWithLibraryServicesManager:]"];
  uint64_t v7 = [(PLManagedObject *)self photoLibrary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PLPerson__triggerPersonSyncUpdateWithLibraryServicesManager___block_invoke;
  v10[3] = &unk_1E5875E18;
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  [v7 performBlock:v10];
}

void __63__PLPerson__triggerPersonSyncUpdateWithLibraryServicesManager___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) libraryBundle];
  uint64_t v3 = [v2 bundleController];
  id v4 = [MEMORY[0x1E4F8B980] wellKnownPhotoLibraryURLForIdentifier:3];
  uint64_t v5 = [v3 openBundleAtLibraryURL:v4];

  id v6 = PLSyndicationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Signaling background job service about person sync update on syndication library bundle %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [*(id *)(a1 + 32) backgroundJobService];
  [v7 signalBackgroundProcessingNeededOnBundle:v5];

  [*(id *)(a1 + 40) stillAlive];
}

- (void)updateDetectionTypeIfNeeded
{
  int v3 = [(PLPerson *)self verifiedType];
  if ((v3 + 2) > 5 || ((1 << (v3 + 2)) & 0x27) == 0)
  {
    [(PLPerson *)self assignDetectionTypeFromFaces];
    if (![(PLPerson *)self cloudDetectionType])
    {
      if ([(PLPerson *)self detectionType])
      {
        uint64_t v5 = [(PLPerson *)self detectionType];
        [(PLPerson *)self setCloudDetectionType:v5];
      }
    }
  }
}

- (void)didSave
{
  int v3 = &self->super._willSaveCallCount + 2;
  if (*((unsigned char *)&self->super._willSaveCallCount + 4))
  {
    id v4 = [(PLManagedObject *)self photoLibrary];
    uint64_t v5 = [v4 pathManager];
    [(PLPerson *)self persistMetadataToFileSystemWithPathManager:v5];
  }
  else
  {
    int v3 = (unsigned __int16 *)((char *)&self->super._willSaveCallCount + 5);
    if (!*((unsigned char *)&self->super._willSaveCallCount + 5)) {
      return;
    }
    id v4 = [(PLManagedObject *)self photoLibrary];
    uint64_t v5 = [v4 pathManager];
    [(PLPerson *)self removePersistedFileSystemDataWithPathManager:v5];
  }

  *(unsigned char *)int v3 = 0;
}

- (void)willSave
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v75.receiver = self;
  v75.super_class = (Class)PLPerson;
  [(PLManagedObject *)&v75 willSave];
  int v3 = [(PLPerson *)self changedValues];
  id v4 = [v3 objectForKey:@"verifiedType"];
  BOOL v5 = v4 != 0;

  if (([(PLPerson *)self isDeleted] & 1) == 0)
  {
    id v6 = [v3 objectForKey:@"mergeTargetPerson"];
    if ([(PLPerson *)self isEqual:v6])
    {
      uint64_t v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = [(PLPerson *)self personUUID];
        *(_DWORD *)buf = 138412290;
        id v79 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Attempted to set merge target to self (person uuid: %@), merge target reset to nil", buf, 0xCu);
      }
      [(PLPerson *)self setMergeTargetPerson:0];

      id v6 = 0;
      goto LABEL_19;
    }
    if (!v6) {
      goto LABEL_19;
    }
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v10 = v6;
    if (v6 != (void *)v9)
    {
      id v11 = (void *)v9;
      int v12 = _os_feature_enabled_impl();

      if (!v12)
      {
LABEL_16:
        int v17 = [MEMORY[0x1E4F1CA98] null];
        char v18 = [v17 isEqual:v6];

        if ((v18 & 1) == 0 && [(PLPerson *)self verifiedType] != -2)
        {
          [(PLPerson *)self setEffectiveVerifiedType:4294967294];
          [(PLPerson *)self _updateSharedLibraryPeopleRulesForTombstone];
          BOOL v5 = 1;
        }
LABEL_19:
        if ([(PLPerson *)self verifiedType] == -2)
        {
          int v19 = [(PLPerson *)self mergeCandidates];
          uint64_t v20 = [v19 count];

          if (v20)
          {
            uint64_t v21 = [(PLPerson *)self mutableMergeCandidates];
            [v21 removeAllObjects];
          }
          uint64_t v22 = [(PLPerson *)self mergeCandidatesWithConfidence];
          uint64_t v23 = [v22 count];

          if (v23)
          {
            uint64_t v24 = [(PLPerson *)self mutableMergeCandidatesWithConfidence];
            [v24 removeAllObjects];
          }
          long long v25 = [(PLPerson *)self invalidMergeCandidates];
          uint64_t v26 = [v25 count];

          if (v26)
          {
            long long v27 = [(PLPerson *)self mutableInvalidMergeCandidates];
            [v27 removeAllObjects];
          }
          id v28 = [(PLPerson *)self detectedFaces];
          uint64_t v29 = [v28 count];

          if (v29) {
            [(PLPerson *)self _moveAllFacesToFinalMergeTarget];
          }
        }
        [(PLPerson *)self disconnectFaceGroup];
        long long v30 = [v3 objectForKey:@"mergeCandidatesWithConfidence"];
        long long v31 = v30;
        if (v30)
        {
          if (![v30 count])
          {
            [(PLPerson *)self mergeCandidateConfidence];
            if (v32 != 0.0) {
              [(PLPerson *)self setMergeCandidateConfidence:0.0];
            }
          }
        }
        long long v33 = [v3 objectForKeyedSubscript:@"type"];
        if (v33 && [(PLPerson *)self type] == -1)
        {
          [(PLPerson *)self _removeSharedLibraryPeopleRulesForPerson];
          +[PLSocialGroup rejectSocialGroupsHavingMember:self];
        }
        uint64_t v34 = [v3 objectForKeyedSubscript:@"verifiedType"];
        if (!v34) {
          goto LABEL_50;
        }
        long long v35 = (void *)v34;
        int v36 = [(PLPerson *)self verifiedType];

        if (v36 != 1) {
          goto LABEL_50;
        }
        v77[0] = @"verifiedType";
        v77[1] = @"type";
        __int16 v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
        uint64_t v38 = [(PLPerson *)self committedValuesForKeys:v37];

        uint64_t v39 = [v38 objectForKeyedSubscript:@"type"];
        if ([v39 intValue] == -1)
        {
          uint64_t v40 = [v38 objectForKeyedSubscript:@"verifiedType"];
          int v41 = [v40 intValue];

          if (v41 != 2 || [(PLPerson *)self type] == -1) {
            goto LABEL_49;
          }
          BOOL v70 = v5;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          uint64_t v39 = [(PLPerson *)self faceCrops];
          uint64_t v42 = [v39 countByEnumeratingWithState:&v71 objects:v76 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v66 = v38;
            id v67 = v33;
            uint64_t v68 = v31;
            id v69 = v6;
            uint64_t v44 = *(void *)v72;
            do
            {
              for (uint64_t i = 0; i != v43; ++i)
              {
                if (*(void *)v72 != v44) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v46 = *(void **)(*((void *)&v71 + 1) + 8 * i);
                int v47 = (void *)MEMORY[0x19F38D3B0]();
                objc_msgSend(v46, "pl_safeSetValue:forKey:valueDidChangeHandler:", &unk_1EEBF0B30, @"state", 0);
              }
              uint64_t v43 = [v39 countByEnumeratingWithState:&v71 objects:v76 count:16];
            }
            while (v43);
            BOOL v5 = v70;
            long long v31 = v68;
            id v6 = v69;
            uint64_t v38 = v66;
            long long v33 = v67;
          }
        }

LABEL_49:
LABEL_50:

        goto LABEL_51;
      }
      objc_opt_class();
      long long v13 = [(PLPerson *)self managedObjectContext];
      if (objc_opt_isKindOfClass()) {
        long long v14 = v13;
      }
      else {
        long long v14 = 0;
      }
      id v15 = v14;

      long long v16 = [v15 delayedSaveActions];
      [v16 recordDeduplicationNeededForGroupsContainingMember:v6];

      uint64_t v10 = [v15 delayedSaveActions];

      [v10 recordSocialGroupContainmentUpdateNeededForPerson:v6];
    }

    goto LABEL_16;
  }
  if ([(PLPerson *)self isDeleted])
  {
    [(PLPerson *)self resetAllFacesToDefault];
    BOOL v5 = 1;
  }
LABEL_51:
  __int16 v48 = [(PLPerson *)self managedObjectContext];
  if ([(PLPerson *)self isDeleted]
    && ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19F38C0C0]()))
  {
    +[PLGraphEdge cleanupDanglingReferencesInManagedObjectContext:v48];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (PLPlatformSearchSupported())
    {
      int v49 = [v48 delayedSaveActions];
      [v49 recordPersonForSearchIndexUpdate:self];
    }
    +[PLDelayedSearchIndexUpdates recordPersonIfNeeded:self];
    __int16 v50 = [v3 objectForKeyedSubscript:@"cloudLocalState"];
    if (v50) {
      BOOL v51 = [v3 count] != 1;
    }
    else {
      BOOL v51 = 1;
    }

    if (([(PLPerson *)self isDeleted] & 1) == 0
      && [(PLPerson *)self isValidForPersistence]
      && ([(PLPerson *)self isInserted] | v51) == 1)
    {
      uint64_t v52 = 68;
    }
    else
    {
      if ([(PLPerson *)self isValidForPersistence]) {
        goto LABEL_74;
      }
      uint64_t v53 = [(PLPerson *)self personUUID];
      __int16 v54 = v53;
      if (v53) {
        BOOL v55 = v51;
      }
      else {
        BOOL v55 = 0;
      }
      if (!v55)
      {

LABEL_74:
        long long v57 = [v3 objectForKeyedSubscript:@"userFeedbacks"];
        uint64_t v58 = [v3 objectForKeyedSubscript:@"type"];
        uint64_t v59 = v58;
        if (v57 || [v58 integerValue] == -1)
        {
          uint64_t v60 = PLBackendGetLog();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            id v61 = [(PLPerson *)self personUUID];
            *(_DWORD *)buf = 138543362;
            id v79 = v61;
            _os_log_impl(&dword_19B3C7000, v60, OS_LOG_TYPE_INFO, "Updating featured content due to changes on user feedback for person %{public}@", buf, 0xCu);
          }
          uint64_t v62 = [v48 delayedSaveActions];
          id v63 = [(PLPerson *)self personUUID];
          [v62 recordFeaturedContentUpdateNeededForPersonUUID:v63];
        }
        goto LABEL_80;
      }
      char v56 = [(PLPerson *)self isDeleted];

      if (v56) {
        goto LABEL_74;
      }
      uint64_t v52 = 69;
    }
    *((unsigned char *)&self->super.super.super.isa + v52) = 1;
    goto LABEL_74;
  }
LABEL_80:
  if (v5)
  {
    uint64_t v64 = [(PLManagedObject *)self photoLibrary];
    uint64_t v65 = [v64 libraryServicesManager];

    if ([v65 wellKnownPhotoLibraryIdentifier] == 1) {
      [(PLPerson *)self _triggerPersonSyncUpdateWithLibraryServicesManager:v65];
    }
  }
}

- (void)_moveAllFacesToFinalMergeTarget
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v3 = [(PLPerson *)self finalMergeTargetPerson];
  id v4 = v3;
  if (v3 && v3 != self)
  {
    BOOL v5 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(PLPerson *)self personUUID];
      uint64_t v7 = [(PLPerson *)self detectedFaces];
      uint64_t v8 = [v7 count];
      uint64_t v9 = [(PLPerson *)v4 personUUID];
      *(_DWORD *)buf = 138543874;
      long long v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      int v17 = v9;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Tombstone Person %{public}@ has %tu faces. Moving them to final merge target %{public}@", buf, 0x20u);
    }
    id v11 = self;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [(PLPerson *)v4 _basicMergePersons:v10];
  }
}

- (void)createUnverifiedPersonForRejectedFaceUUIDs:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [(id)objc_opt_class() createUnverifiedPersonInManagedObjectContext:v7];
    uint64_t v9 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v10 = +[PLDetectedFace entityName];
    id v11 = [v9 fetchRequestWithEntityName:v10];

    int v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"uuid", v6];
    [v11 setPredicate:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __78__PLPerson_createUnverifiedPersonForRejectedFaceUUIDs_inManagedObjectContext___block_invoke;
    v37[3] = &unk_1E5874778;
    v37[4] = self;
    id v14 = v8;
    id v38 = v14;
    id v15 = v13;
    id v39 = v15;
    id v16 = (id)[v7 enumerateObjectsFromFetchRequest:v11 usingDefaultBatchSizeWithBlock:v37];
    if ([v15 count])
    {
      uint64_t v29 = v14;
      long long v30 = v11;
      id v31 = v7;
      id v32 = v6;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v44 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        unint64_t v20 = 0;
        __int16 v21 = 0;
        uint64_t v22 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v17);
            }
            uint64_t v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            long long v25 = [v17 objectForKeyedSubscript:v24];
            unint64_t v26 = [v25 unsignedIntegerValue];

            if (v26 > v20)
            {
              __int16 v21 = [v24 shortValue];
              unint64_t v20 = v26;
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v44 count:16];
        }
        while (v19);
      }
      else
      {
        __int16 v21 = 0;
      }

      id v14 = v29;
      [v29 setDetectionType:v21];
      id v7 = v31;
      id v6 = v32;
      id v11 = v30;
    }
    long long v27 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = [v14 personUUID];
      *(_DWORD *)buf = 138543618;
      int v41 = v28;
      __int16 v42 = 2114;
      id v43 = v6;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_INFO, "Created unverified person %{public}@ for rejected face UUIDs %{public}@", buf, 0x16u);
    }
  }
}

void __78__PLPerson_createUnverifiedPersonForRejectedFaceUUIDs_inManagedObjectContext___block_invoke(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 associatedPersonForFaceOrTorso:1 orTemporal:1];
  BOOL v5 = v4;
  if (v4 && ![v4 isEqual:a1[4]])
  {
    id v13 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [v3 uuid];
      id v15 = [v5 personUUID];
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2114;
      uint64_t v19 = v15;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Skipping unverified person assignment for face %{public}@ is already associated with person %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    [v3 setAssociatedPerson:a1[5]];
    id v6 = (void *)a1[6];
    id v7 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v3, "detectionType"));
    uint64_t v8 = [v6 objectForKeyedSubscript:v7];
    uint64_t v9 = [v8 unsignedIntegerValue];

    uint64_t v10 = [NSNumber numberWithUnsignedInteger:v9 + 1];
    id v11 = (void *)a1[6];
    int v12 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v3, "detectionType"));
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
}

- (void)disconnectFaceGroup
{
  id v3 = [(PLPerson *)self associatedFaceGroup];
  if ([(PLPerson *)self verifiedType] && v3)
  {
    [(PLPerson *)self setAssociatedFaceGroup:0];
    [(id)objc_opt_class() createAssociatedPersonForFaceGroup:v3];
  }
}

- (int64_t)cloudDeletionType
{
  return 4;
}

- (void)_removeSharedLibraryPeopleRulesForPerson
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"autoSharePolicy", 2);
  id v4 = [(PLPerson *)self managedObjectContext];
  BOOL v5 = +[PLShare sharesWithPredicate:v3 fetchLimit:0 inManagedObjectContext:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        int v12 = [(PLPerson *)self personUUID];
        [v11 removePeopleRulesForPersonUUID:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)prepareForDeletion
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)PLPerson;
  [(PLManagedObject *)&v13 prepareForDeletion];
  id v3 = [(PLPerson *)self managedObjectContext];
  if ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19F38C0C0]()) {
    +[PLGraphEdge registerDeletedObjectForDanglingReferenceCleanup:self];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 mergingChanges] & 1) == 0)
  {
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BOOL v5 = [(PLPerson *)self personUUID];
      *(_DWORD *)buf = 138543362;
      long long v15 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "prepareForDeletion of person %{public}@", buf, 0xCu);
    }
    id v6 = [v3 mergePolicy];
    objc_opt_class();
    if (((objc_opt_isKindOfClass() & 1) == 0 || ([v6 isResolvingConflicts] & 1) == 0)
      && ![(PLPerson *)self _personResetIsInProgress]
      && [(PLPerson *)self verifiedType] == 2
      && !*(&self->super._willSaveCallCount + 1))
    {
      uint64_t v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(PLPerson *)self personUUID];
        uint64_t v9 = [v3 name];
        *(_DWORD *)buf = 138543618;
        long long v15 = v8;
        __int16 v16 = 2112;
        id v17 = v9;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Deleting graph person %{public}@ with unspecified reason in context %@", buf, 0x16u);
      }
    }
    uint64_t v10 = [(PLPerson *)self personUUID];

    if (v10)
    {
      id v11 = [(PLManagedObject *)self photoLibrary];
      int v12 = [v11 pathManager];
      [(PLPerson *)self removePersistedFileSystemDataWithPathManager:v12];
    }
    [v3 recordCloudDeletionForObject:self];
  }
}

- (NSSet)allDetectedFaces
{
  id v3 = [(PLPerson *)self detectedFaces];
  id v4 = (void *)[v3 mutableCopy];

  BOOL v5 = [(PLPerson *)self temporalDetectedFaces];
  [v4 unionSet:v5];

  id v6 = (void *)[v4 copy];
  return (NSSet *)v6;
}

+ (id)fetchFinalMergeTargetPersonForPersonWithUUID:(id)a3 context:(id)a4 predicate:(id)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [a1 fetchRequest];
  v30[0] = @"mergeTargetPerson.mergeTargetPerson.mergeTargetPerson.mergeTargetPerson.mergeTargetPerson";
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v11 setRelationshipKeyPathsForPrefetching:v12];

  objc_super v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personUUID == %@", v8];
  long long v14 = v13;
  if (v9)
  {
    long long v15 = (void *)MEMORY[0x1E4F28BA0];
    v29[0] = v9;
    v29[1] = v13;
    __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    id v17 = [v15 andPredicateWithSubpredicates:v16];
  }
  else
  {
    id v17 = v13;
  }
  [v11 setPredicate:v17];
  [v11 setReturnsObjectsAsFaults:0];
  [v11 setFetchLimit:1];
  id v24 = 0;
  uint64_t v18 = [v10 executeFetchRequest:v11 error:&v24];

  id v19 = v24;
  if (!v18)
  {
    uint64_t v20 = PLBackendGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v19;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch final merge target person with UUID %@: %@", buf, 0x16u);
    }
  }
  __int16 v21 = [v18 firstObject];
  uint64_t v22 = [v21 finalMergeTargetPerson];

  return v22;
}

+ (BOOL)_detachFacesForPerson:(id)a3 reason:(signed __int16)a4 error:(id *)a5
{
  int v6 = a4;
  v51[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = [v8 managedObjectContext];
  id v11 = [v8 allDetectedFaces];
  int v12 = [v11 allObjects];

  uint64_t v13 = [v12 count];
  long long v14 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v13];
  long long v15 = 0;
  if (v6 == 6 && v13)
  {
    long long v15 = [a1 createUnverifiedPersonInManagedObjectContext:v10];
    objc_msgSend(v15, "setDetectionType:", objc_msgSend(v8, "detectionType"));
    __int16 v16 = [v8 mdID];
    [v15 setMdID:v16];
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __47__PLPerson__detachFacesForPerson_reason_error___block_invoke;
  v44[3] = &unk_1E58749E8;
  id v17 = v14;
  id v45 = v17;
  id v18 = v9;
  id v46 = v18;
  id v19 = v15;
  id v47 = v19;
  uint64_t v20 = [v10 enumerateWithIncrementalSaveUsingObjects:v12 withBlock:v44];
  if ([v17 isCancelled] && !v20)
  {
    __int16 v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F8C500];
    uint64_t v50 = *MEMORY[0x1E4F28228];
    v51[0] = @"Person reset cancelled while deleting unnamed faces";
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    uint64_t v20 = [v21 errorWithDomain:v22 code:41031 userInfo:v23];
  }
  if (!v20)
  {
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __47__PLPerson__detachFacesForPerson_reason_error___block_invoke_2;
    v42[3] = &unk_1E5874A10;
    id v43 = v17;
    uint64_t v20 = [v10 enumerateWithIncrementalSaveUsingObjects:v18 withBlock:v42];
  }
  if (v19)
  {
    id v24 = +[PLKeyFaceManager sharedInstance];
    long long v25 = [v19 personUUID];
    [v19 photoLibrary];
    id v41 = v19;
    id v26 = v17;
    id v27 = v8;
    id v28 = v18;
    uint64_t v29 = v12;
    long long v30 = v10;
    v32 = id v31 = a5;
    [v24 markPersonAsNeedingKeyFace:v25 photoLibrary:v32];

    a5 = v31;
    id v10 = v30;
    int v12 = v29;
    id v18 = v28;
    id v8 = v27;
    id v17 = v26;
    id v19 = v41;
  }
  if ([v17 isCancelled] && !v20)
  {
    long long v33 = a5;
    long long v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F8C500];
    uint64_t v48 = *MEMORY[0x1E4F28228];
    int v49 = @"Person reset cancelled while deleting verified faces";
    long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    __int16 v37 = v34;
    a5 = v33;
    uint64_t v20 = [v37 errorWithDomain:v35 code:41031 userInfo:v36];
  }
  id v38 = v20;
  id v39 = v38;
  if (v20 && a5) {
    *a5 = v38;
  }

  return v20 == 0;
}

void __47__PLPerson__detachFacesForPerson_reason_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    *a4 = 1;
  }
  else
  {
    if ([v6 nameSource] && objc_msgSend(v6, "nameSource") != 2)
    {
      [*(id *)(a1 + 40) addObject:v6];
    }
    else
    {
      [v6 removeAllPersonRelationships];
      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
    }
    [v6 setAssociatedPerson:*(void *)(a1 + 48)];
  }
}

void __47__PLPerson__detachFacesForPerson_reason_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    *a4 = 1;
  }
  else
  {
    [v6 removeAllPersonRelationships];
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  }
}

+ (BOOL)_deleteObjectsWithFetchRequest:(id)a3 reason:(signed __int16)a4 moc:(id)a5 progress:(id)a6 error:(id *)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v32 = a6;
  [v12 setFetchBatchSize:100];
  id v40 = 0;
  long long v14 = [v13 executeFetchRequest:v12 error:&v40];
  long long v15 = (uint64_t (*)(uint64_t, uint64_t))v40;
  __int16 v16 = v15;
  if (v14)
  {
    id v17 = v15;
    *(void *)int v49 = 0;
    *(void *)&v49[8] = v49;
    *(void *)&v49[16] = 0x3032000000;
    uint64_t v50 = __Block_byref_object_copy__110901;
    BOOL v51 = __Block_byref_object_dispose__110902;
    id v52 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __69__PLPerson__deleteObjectsWithFetchRequest_reason_moc_progress_error___block_invoke;
    v33[3] = &unk_1E58749C0;
    id v18 = v32;
    id v34 = v18;
    __int16 v37 = v49;
    id v38 = a1;
    signed __int16 v39 = a4;
    id v31 = v12;
    id v35 = v31;
    id v36 = v13;
    uint64_t v19 = [v36 enumerateWithIncrementalSaveUsingObjects:v14 withBlock:v33];
    uint64_t v20 = (void *)v19;
    __int16 v21 = *(void **)(*(void *)&v49[8] + 40);
    if (!v21) {
      __int16 v21 = (void *)v19;
    }
    id v22 = v21;
    __int16 v16 = v17;
    if (v22) {
      goto LABEL_5;
    }
    if (![v18 isCancelled]) {
      goto LABEL_16;
    }
    id v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28228];
    uint64_t v48 = @"Person reset cancelled during person delete";
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    id v22 = [v28 errorWithDomain:*MEMORY[0x1E4F8C500] code:41031 userInfo:v29];

    if (v22)
    {
LABEL_5:
      uint64_t v23 = PLBackendGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = [v31 entityName];
        *(_DWORD *)buf = 138543874;
        __int16 v42 = v24;
        __int16 v43 = 2082;
        uint64_t v44 = "+[PLPerson _deleteObjectsWithFetchRequest:reason:moc:progress:error:]";
        __int16 v45 = 2112;
        id v46 = v22;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to delete %{public}@ in %{public}s %@", buf, 0x20u);
      }
      if (a7) {
        *a7 = v22;
      }

      BOOL v25 = 0;
    }
    else
    {
LABEL_16:
      BOOL v25 = 1;
    }

    _Block_object_dispose(v49, 8);
  }
  else
  {
    id v26 = PLBackendGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = [v12 entityName];
      *(_DWORD *)int v49 = 138543874;
      *(void *)&v49[4] = v27;
      *(_WORD *)&v49[12] = 2082;
      *(void *)&v49[14] = "+[PLPerson _deleteObjectsWithFetchRequest:reason:moc:progress:error:]";
      *(_WORD *)&v49[22] = 2112;
      uint64_t v50 = v16;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Failed to fetch %{public}@ in %{public}s %@", v49, 0x20u);
    }
    BOOL v25 = 0;
    if (a7) {
      *a7 = v16;
    }
  }

  return v25;
}

void __69__PLPerson__deleteObjectsWithFetchRequest_reason_moc_progress_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    *a4 = 1;
  }
  else
  {
    [*(id *)(a1 + 32) becomeCurrentWithPendingUnitCount:1];
    uint64_t v7 = [*(id *)(a1 + 40) entityName];
    id v8 = +[PLPerson entityName];
    int v9 = [v7 isEqualToString:v8];

    if (v9
      && (uint64_t v10 = *(__int16 *)(a1 + 72),
          id v11 = *(void **)(a1 + 64),
          uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8),
          obuint64_t j = *(id *)(v12 + 40),
          char v13 = [v11 _detachFacesForPerson:v6 reason:v10 error:&obj],
          objc_storeStrong((id *)(v12 + 40), obj),
          (v13 & 1) == 0))
    {
      *a4 = 1;
    }
    else if (!*a4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 deletePersonWithReason:*(__int16 *)(a1 + 72)];
      }
      else {
        [*(id *)(a1 + 48) deleteObject:v6];
      }
    }
    [*(id *)(a1 + 32) resignCurrent];
  }
}

+ (void)_resetMediaAnalysisAfterPersonResetInLibraryURL:(id)a3 resetPersons:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v7 = a5;
  if (v6) {
    +[PLMediaAnalysisServiceRequestAdapter requestResetPersons:0 photoLibraryURL:v8 completionHandler:v7];
  }
  +[PLMediaAnalysisServiceRequestAdapter requestResetFaceClassificationModelForPhotoLibraryURL:v8 progressHandler:&__block_literal_global_305 completionHandler:v7];
}

+ (id)resetAllInLibrary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  char v58 = 0;
  uint64_t v51 = 0;
  id v52 = &v51;
  uint64_t v53 = 0x3032000000;
  __int16 v54 = __Block_byref_object_copy__110901;
  BOOL v55 = __Block_byref_object_dispose__110902;
  id v56 = 0;
  id v8 = [v6 managedObjectContext];
  [a1 _setPersonResetInProgress:1 context:v8];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __41__PLPerson_resetAllInLibrary_completion___block_invoke;
  v47[3] = &unk_1E58748D8;
  id v50 = a1;
  id v9 = v8;
  id v48 = v9;
  id v10 = v7;
  id v49 = v10;
  id v11 = (void (**)(void, void))MEMORY[0x19F38D650](v47);
  uint64_t v12 = +[PLPerson fetchRequest];
  char v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"verifiedType", 0);
  [v12 setPredicate:v13];

  [v12 setFetchBatchSize:100];
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __41__PLPerson_resetAllInLibrary_completion___block_invoke_2;
  v38[3] = &unk_1E5874900;
  id v41 = &v43;
  id v14 = v9;
  id v39 = v14;
  id v15 = v12;
  id v40 = v15;
  __int16 v42 = &v51;
  [v6 performBlockAndWait:v38];
  if (v52[5])
  {
    v11[2](v11, 0);
    id v16 = 0;
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v44[3]];
    id v22 = [MEMORY[0x1E4F8BA48] transaction:"+[PLPerson resetAllInLibrary:completion:]"];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    void v30[2] = __41__PLPerson_resetAllInLibrary_completion___block_invoke_3;
    v30[3] = &unk_1E5874928;
    id v34 = &v43;
    id v35 = v57;
    id v37 = a1;
    id v31 = v15;
    id v32 = v14;
    id v18 = v17;
    id v33 = v18;
    id v36 = &v51;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __41__PLPerson_resetAllInLibrary_completion___block_invoke_299;
    v23[3] = &unk_1E5874978;
    id v24 = v6;
    id v27 = v57;
    id v29 = a1;
    id v26 = v11;
    id v28 = &v51;
    id v19 = v22;
    id v25 = v19;
    [v24 performTransaction:v30 completionHandler:v23];
    uint64_t v20 = v25;
    id v16 = v18;
  }
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(v57, 8);

  return v16;
}

void __41__PLPerson_resetAllInLibrary_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v4 = (void *)a1[6];
  uint64_t v5 = a1[4];
  id v6 = a3;
  [v4 _setPersonResetInProgress:0 context:v5];
  (*(void (**)(void))(a1[5] + 16))();
}

void __41__PLPerson_resetAllInLibrary_completion___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  uint64_t v4 = [v2 countForFetchRequest:v3 error:&v7];
  id v5 = v7;
  id v6 = v7;
  *(void *)(*(void *)(a1[6] + 8) + 24) = v4;
  if (*(void *)(*(void *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL) {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v5);
  }
}

void __41__PLPerson_resetAllInLibrary_completion___block_invoke_3(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1[7] + 8) + 24);
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Person reset deleting %tu persons", buf, 0xCu);
  }

  uint64_t v4 = (void *)a1[10];
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  id v20 = 0;
  char v8 = [v4 _deleteObjectsWithFetchRequest:v5 reason:6 moc:v6 progress:v7 error:&v20];
  id v9 = v20;
  id v10 = v9;
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v8;
  if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
  {
    id v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Person reset deleting face crops, if any are still remaining", buf, 2u);
    }

    uint64_t v12 = +[PLFaceCrop fetchRequest];
    char v13 = (void *)a1[10];
    uint64_t v14 = a1[5];
    id v19 = v10;
    char v15 = [v13 _deleteObjectsWithFetchRequest:v12 reason:6 moc:v14 progress:0 error:&v19];
    id v16 = v19;
    id v17 = v19;

    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v15;
    if (!*(unsigned char *)(*(void *)(a1[8] + 8) + 24)) {
      objc_storeStrong((id *)(*(void *)(a1[9] + 8) + 40), v16);
    }
  }
  else
  {
    uint64_t v18 = *(void *)(a1[9] + 8);
    id v17 = v9;
    uint64_t v12 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
}

uint64_t __41__PLPerson_resetAllInLibrary_completion___block_invoke_299(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) globalValues];
  char v3 = [v2 libraryCreateOptions];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    BOOL v4 = (v3 & 0x10) == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"Person Reset XPC to MAD"];
    uint64_t v6 = *(void **)(a1 + 72);
    uint64_t v7 = [*(id *)(a1 + 32) pathManager];
    char v8 = [v7 libraryURL];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __41__PLPerson_resetAllInLibrary_completion___block_invoke_2_301;
    char v15 = &unk_1E5874950;
    id v9 = *(id *)(a1 + 48);
    id v16 = v5;
    id v17 = v9;
    id v10 = v5;
    [v6 _resetMediaAnalysisAfterPersonResetInLibraryURL:v8 resetPersons:1 completion:&v12];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  return objc_msgSend(*(id *)(a1 + 40), "stillAlive", v12, v13, v14, v15);
}

uint64_t __41__PLPerson_resetAllInLibrary_completion___block_invoke_2_301(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 stillAlive];
}

+ (void)_setPersonResetInProgress:(BOOL)a3 context:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PLPerson__setPersonResetInProgress_context___block_invoke;
  v7[3] = &unk_1E58748B0;
  BOOL v9 = a3;
  id v8 = v5;
  id v6 = v5;
  [v6 performBlockAndWait:v7];
}

void __46__PLPerson__setPersonResetInProgress_context___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = v2;
  if (v1) {
    [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PLPersonReset"];
  }
  else {
    [v2 removeObjectForKey:@"PLPersonReset"];
  }
}

+ (BOOL)resetAllInLibrary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__110901;
  uint64_t v22 = __Block_byref_object_dispose__110902;
  id v23 = 0;
  id v6 = [v5 managedObjectContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __36__PLPerson_resetAllInLibrary_error___block_invoke;
  v14[3] = &unk_1E5875A90;
  id v7 = v6;
  id v15 = v7;
  id v16 = &v24;
  id v17 = &v18;
  [v5 performTransactionAndWait:v14];
  if (*((unsigned char *)v25 + 24))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__PLPerson_resetAllInLibrary_error___block_invoke_292;
    v10[3] = &unk_1E5875A90;
    id v11 = v7;
    uint64_t v12 = &v24;
    uint64_t v13 = &v18;
    [v5 performBlockAndWait:v10];
  }
  if (a4) {
    *a4 = (id) v19[5];
  }
  char v8 = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v8;
}

void __36__PLPerson_resetAllInLibrary_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = +[PLPerson fetchRequest];
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"verifiedType", 0);
  [v2 setPredicate:v3];

  [v2 setFetchBatchSize:100];
  BOOL v4 = *(void **)(a1 + 32);
  id v15 = 0;
  id v5 = [v4 executeFetchRequest:v2 error:&v15];
  id v6 = v15;
  if (!v5)
  {
    uint64_t v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = (uint64_t)v6;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Person reset failed to fetch verified persons with error: %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = v6;
LABEL_12:
    id v6 = v12;
    uint64_t v14 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v12;

    goto LABEL_13;
  }
  if ([v5 count])
  {
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v5 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Person reset deleting %lu verified persons", buf, 0xCu);
    }

    BOOL v9 = [*(id *)(a1 + 32) enumerateWithIncrementalSaveUsingObjects:v5 withBlock:&__block_literal_global_111106];

    if (!v9)
    {
      id v6 = 0;
      goto LABEL_13;
    }
    id v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = (uint64_t)v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Person reset failed to save with error: %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = v9;
    goto LABEL_12;
  }
LABEL_13:
}

void __36__PLPerson_resetAllInLibrary_error___block_invoke_292(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = +[PLFaceCrop fetchRequest];
  [v2 setFetchBatchSize:100];
  id v3 = *(void **)(a1 + 32);
  id v14 = 0;
  BOOL v4 = [v3 executeFetchRequest:v2 error:&v14];
  id v5 = v14;
  if (!v4)
  {
    id v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = (uint64_t)v5;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Person reset failed to fetch face crops with error: %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = v5;
LABEL_12:
    id v5 = v11;
    uint64_t v13 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;

    goto LABEL_13;
  }
  if ([v4 count])
  {
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Person reset found %lu face crops to delete, these are probably orphaned", buf, 0xCu);
    }

    uint64_t v8 = [*(id *)(a1 + 32) deleteObjectsWithIncrementalSave:v4];

    if (!v8)
    {
      id v5 = 0;
      goto LABEL_13;
    }
    BOOL v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = (uint64_t)v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Person reset failed to save with error: %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = v8;
    goto LABEL_12;
  }
LABEL_13:
}

uint64_t __36__PLPerson_resetAllInLibrary_error___block_invoke_290(uint64_t a1, void *a2)
{
  return [a2 deletePersonWithReason:6];
}

+ (id)predicateForPersistence
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d AND %K != %d", @"verifiedType", 0, @"verifiedType", 0xFFFFFFFFLL);
}

+ (id)predicateForVisibleKeyFace
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v2 = +[PLManagedAsset predicateToExcludeNonvisibleBurstAssetsWithAvalanchePickTypeKeyPath:@"keyFace.assetForFace.avalanchePickType"];
  id v3 = +[PLManagedAsset predicateToExcludeHiddenAssetsWithHiddenKeyPath:@"keyFace.assetForFace.hidden"];
  BOOL v4 = +[PLManagedAsset predicateToExcludeTrashedAssetsWithTrashedStateKeyPath:@"keyFace.assetForFace.trashedState"];
  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"keyFace");
  id v6 = +[PLManagedAsset predicateToExcludeVideosWithVideoKeyFrameSetWithKeyPathToAsset:@"keyFace.assetForFace"];
  uint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
  v11[0] = v5;
  v11[1] = v2;
  v11[2] = v3;
  v11[3] = v4;
  v11[4] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  BOOL v9 = [v7 andPredicateWithSubpredicates:v8];

  return v9;
}

+ (id)predicateForPersonsNeedingFaceCropGenerationForFaceObjectID:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v3, "predicateWithFormat:", @"%K == %d", @"verifiedType", 1);
  char v27 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $f, $f == %@ AND $f.%K == %d AND ($f.%K == %d OR $f.%K == %d)).@count > 0", @"detectedFaces", v4, @"confirmedFaceCropGenerationState", 1, @"nameSource", 3, @"nameSource", 1];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"verifiedType", 2);
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $f, $f == %@ AND $f.%K == %d AND $f.%K == %d).@count > 0", @"detectedFaces", v4, @"confirmedFaceCropGenerationState", 1, @"nameSource", 5];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K AND %@ IN %K", v4, @"rejectedFaces", v4, @"rejectedFacesNeedingFaceCrops"];

  BOOL v9 = (void *)MEMORY[0x1E4F28BA0];
  id v28 = (void *)v5;
  v33[0] = v5;
  v33[1] = v6;
  uint64_t v26 = (void *)v6;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  id v11 = [v9 orPredicateWithSubpredicates:v10];

  id v12 = (void *)MEMORY[0x1E4F28BA0];
  v32[0] = v5;
  v32[1] = v27;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  id v14 = [v12 andPredicateWithSubpredicates:v13];

  id v15 = (void *)MEMORY[0x1E4F28BA0];
  v31[0] = v6;
  v31[1] = v7;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  uint64_t v17 = [v15 andPredicateWithSubpredicates:v16];

  uint64_t v18 = (void *)MEMORY[0x1E4F28BA0];
  v30[0] = v11;
  v30[1] = v8;
  id v19 = (void *)v8;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  __int16 v21 = [v18 andPredicateWithSubpredicates:v20];

  uint64_t v22 = (void *)MEMORY[0x1E4F28BA0];
  v29[0] = v14;
  v29[1] = v17;
  void v29[2] = v21;
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
  uint64_t v24 = [v22 orPredicateWithSubpredicates:v23];

  return v24;
}

+ (id)_stringFromContact:(id)a3 preferGivenName:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 givenName];
  uint64_t v7 = v6;
  if (v4 && [v6 length])
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1B910] stringFromContact:v5 style:0];
  }
  BOOL v9 = v8;

  return v9;
}

+ (id)displayNameFromContact:(id)a3
{
  return (id)[a1 _stringFromContact:a3 preferGivenName:1];
}

+ (id)fullNameFromContact:(id)a3
{
  return (id)[a1 _stringFromContact:a3 preferGivenName:0];
}

+ (id)fetchMePersonInManagedObjectContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  uint64_t v6 = +[PLPerson entityName];
  uint64_t v7 = [v4 fetchRequestWithEntityName:v6];

  id v8 = [a1 predicateForMePerson];
  [v7 setPredicate:v8];

  [v7 setFetchLimit:1];
  id v14 = 0;
  BOOL v9 = [v5 executeFetchRequest:v7 error:&v14];

  id v10 = v14;
  if (v9)
  {
    id v11 = [v9 firstObject];
  }
  else
  {
    id v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Fetch for me person failed: %@", buf, 0xCu);
    }

    id v11 = 0;
  }

  return v11;
}

+ (id)predicateForMePerson
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0.0", @"isMeConfidence");
}

+ (void)batchFetchAssociatedPersonByFaceGroupUUIDWithFaceGroupUUIDs:(id)a3 predicate:(id)a4 library:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __101__PLPerson_batchFetchAssociatedPersonByFaceGroupUUIDWithFaceGroupUUIDs_predicate_library_completion___block_invoke;
  v14[3] = &unk_1E5874868;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  [v13 performBlockAndWait:v14];
}

void __101__PLPerson_batchFetchAssociatedPersonByFaceGroupUUIDWithFaceGroupUUIDs_predicate_library_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  BOOL v4 = +[PLPerson entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  [v5 setRelationshipKeyPathsForPrefetching:&unk_1EEBF24B0];
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"associatedFaceGroup.uuid IN %@", *(void *)(v1 + 40)];
  [v5 setPredicate:v6];
  id v27 = 0;
  uint64_t v7 = [v2 executeFetchRequest:v5 error:&v27];
  id v8 = v27;
  id v9 = v8;
  if (v7)
  {
    id v19 = v8;
    uint64_t v20 = v6;
    uint64_t v21 = v1;
    uint64_t v22 = v2;
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v17 = [v16 associatedFaceGroup];
          uint64_t v18 = [v17 uuid];

          if (v18) {
            [v10 setObject:v16 forKeyedSubscript:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v13);
    }

    uint64_t v1 = v21;
    v2 = v22;
    id v9 = v19;
    uint64_t v6 = v20;
  }
  else
  {
    id v10 = 0;
  }
  (*(void (**)(void))(*(void *)(v1 + 48) + 16))();
}

+ (id)fetchPersonCountByAssetUUIDForAssetUUIDs:(id)a3 predicate:(id)a4 includedDetectionTypes:(id)a5 library:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__110901;
  id v39 = __Block_byref_object_dispose__110902;
  id v40 = 0;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__110901;
  id v33 = __Block_byref_object_dispose__110902;
  id v34 = 0;
  id v14 = a6;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __100__PLPerson_fetchPersonCountByAssetUUIDForAssetUUIDs_predicate_includedDetectionTypes_library_error___block_invoke;
  v22[3] = &unk_1E5874840;
  id v15 = v14;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  id v17 = v11;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  id v27 = &v29;
  id v28 = &v35;
  [v15 performBlockAndWait:v22];
  if (a7)
  {
    id v19 = (void *)v30[5];
    if (v19) {
      *a7 = v19;
    }
  }
  id v20 = (id)v36[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

void __100__PLPerson_fetchPersonCountByAssetUUIDForAssetUUIDs_predicate_includedDetectionTypes_library_error___block_invoke(uint64_t a1)
{
  v131[2] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  if (!*(void *)(a1 + 40))
  {
    __int16 v54 = +[PLManagedAsset entityName];
    id v5 = [v3 fetchRequestWithEntityName:v54];

    uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", *(void *)(a1 + 48)];
    id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"ANY %K.%K != nil", @"detectedFaces", @"personForFace");
    BOOL v55 = (void *)MEMORY[0x1E4F28BA0];
    v124[0] = v7;
    v124[1] = v9;
    id v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:2];
    uint64_t v57 = [v55 andPredicateWithSubpredicates:v56];

    v84 = (void *)v57;
    [v5 setPredicate:v57];
    [v5 setResultType:2];
    id v58 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    uint64_t v59 = (void *)MEMORY[0x1E4F28C68];
    uint64_t v60 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
    long long v123 = v60;
    id v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
    uint64_t v62 = [v59 expressionForFunction:@"count:" arguments:v61];

    [v58 setName:@"count"];
    v100 = (void *)v62;
    [v58 setExpression:v62];
    [v58 setExpressionResultType:200];
    v122[0] = @"uuid";
    obuint64_t j = v58;
    v122[1] = v58;
    id v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:2];
    [v5 setPropertiesToFetch:v63];

    [v5 setPropertiesToGroupBy:&unk_1EEBF2498];
    id v106 = 0;
    uint64_t v64 = [v2 executeFetchRequest:v5 error:&v106];
    id v65 = v106;
    id v66 = v106;
    id v67 = v66;
    if (v64)
    {
      id v97 = v66;
      v86 = v9;
      uint64_t v88 = v7;
      v91 = v2;
      id v68 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v69 = *(void *)(*(void *)(a1 + 72) + 8);
      BOOL v70 = *(void **)(v69 + 40);
      *(void *)(v69 + 40) = v68;

      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      v99 = v64;
      id v71 = v64;
      uint64_t v72 = [v71 countByEnumeratingWithState:&v102 objects:v121 count:16];
      if (v72)
      {
        uint64_t v73 = v72;
        uint64_t v74 = *(void *)v103;
        do
        {
          for (uint64_t i = 0; i != v73; ++i)
          {
            if (*(void *)v103 != v74) {
              objc_enumerationMutation(v71);
            }
            uint64_t v76 = *(void **)(*((void *)&v102 + 1) + 8 * i);
            uint64_t v77 = [v76 objectForKeyedSubscript:@"count"];
            v78 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
            id v79 = [v76 objectForKeyedSubscript:@"uuid"];
            [v78 setObject:v77 forKeyedSubscript:v79];
          }
          uint64_t v73 = [v71 countByEnumeratingWithState:&v102 objects:v121 count:16];
        }
        while (v73);
      }

      v2 = v91;
      id v9 = v86;
      uint64_t v7 = v88;
      id v67 = v97;
      uint64_t v64 = v99;
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v65);
    }

    id v40 = v84;
    goto LABEL_54;
  }
  BOOL v4 = +[PLDetectedFace entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  v131[0] = @"personForFace";
  v131[1] = @"assetForFace";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:2];
  [v5 setRelationshipKeyPathsForPrefetching:v6];

  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"assetForFace.uuid", *(void *)(a1 + 48)];
  if (*(void *)(a1 + 56)
    && (+[PLDetectedFace predicateForIncludedDetectionTypes:](PLDetectedFace, "predicateForIncludedDetectionTypes:"), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = (void *)v8;
    id v10 = (void *)MEMORY[0x1E4F28BA0];
    v130[0] = v7;
    v130[1] = v8;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:2];
    id v12 = [v10 andPredicateWithSubpredicates:v11];

    [v5 setPredicate:v12];
  }
  else
  {
    [v5 setPredicate:v7];
    id v9 = 0;
  }
  id v120 = 0;
  id v13 = [v2 executeFetchRequest:v5 error:&v120];
  id v14 = v120;
  id v15 = v14;
  if (v13)
  {
    v85 = v9;
    v87 = v7;
    v89 = v5;
    v90 = v2;
    v100 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    obuint64_t j = v13;
    uint64_t v16 = [obj countByEnumeratingWithState:&v116 objects:v129 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v117;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v117 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v116 + 1) + 8 * j);
          uint64_t v21 = [v20 assetForFace];
          uint64_t v22 = [v21 uuid];

          id v23 = [v20 associatedPersonForFaceOrTorso:1 orTemporal:0];
          id v24 = [v23 personUUID];

          if (v22) {
            BOOL v25 = v24 == 0;
          }
          else {
            BOOL v25 = 1;
          }
          if (!v25)
          {
            id v26 = [v100 objectForKeyedSubscript:v24];
            if (!v26)
            {
              id v26 = [MEMORY[0x1E4F1CA48] array];
              [v100 setObject:v26 forKeyedSubscript:v24];
            }
            [v26 addObject:v22];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v116 objects:v129 count:16];
      }
      while (v17);
    }

    id v27 = (void *)MEMORY[0x1E4F1C0D0];
    id v28 = +[PLPerson entityName];
    uint64_t v29 = [v27 fetchRequestWithEntityName:v28];

    long long v128 = @"personUUID";
    long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v128 count:1];
    [v29 setPropertiesToFetch:v30];

    [v29 setResultType:2];
    uint64_t v31 = (void *)MEMORY[0x1E4F28F60];
    id v32 = [v100 allKeys];
    id v33 = [v31 predicateWithFormat:@"personUUID IN %@", v32];

    id v34 = (void *)MEMORY[0x1E4F28BA0];
    uint64_t v35 = *(void *)(a1 + 40);
    v127[0] = v33;
    v127[1] = v35;
    id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:2];
    uint64_t v37 = [v34 andPredicateWithSubpredicates:v36];
    [v29 setPredicate:v37];

    id v115 = v15;
    v2 = v90;
    id v38 = [v90 executeFetchRequest:v29 error:&v115];
    id v39 = v115;
    id v40 = v115;

    if (v38)
    {
      uint64_t v81 = v33;
      uint64_t v82 = v29;
      id v83 = v40;
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v42 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v43 = *(void **)(v42 + 40);
      *(void *)(v42 + 40) = v41;

      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      id v92 = v38;
      uint64_t v95 = [v92 countByEnumeratingWithState:&v111 objects:v126 count:16];
      if (v95)
      {
        uint64_t v94 = *(void *)v112;
        do
        {
          uint64_t v44 = 0;
          do
          {
            if (*(void *)v112 != v94) {
              objc_enumerationMutation(v92);
            }
            uint64_t v98 = v44;
            uint64_t v96 = [*(id *)(*((void *)&v111 + 1) + 8 * v44) objectForKeyedSubscript:@"personUUID"];
            uint64_t v45 = objc_msgSend(v100, "objectForKeyedSubscript:");
            long long v107 = 0u;
            long long v108 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            uint64_t v46 = [v45 countByEnumeratingWithState:&v107 objects:v125 count:16];
            if (v46)
            {
              uint64_t v47 = v46;
              uint64_t v48 = *(void *)v108;
              do
              {
                for (uint64_t k = 0; k != v47; ++k)
                {
                  if (*(void *)v108 != v48) {
                    objc_enumerationMutation(v45);
                  }
                  uint64_t v50 = *(void *)(*((void *)&v107 + 1) + 8 * k);
                  uint64_t v51 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectForKeyedSubscript:v50];
                  if (v51)
                  {
                    id v52 = v51;
                    uint64_t v53 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v51, "integerValue") + 1);
                  }
                  else
                  {
                    uint64_t v53 = &unk_1EEBF0B48;
                  }
                  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v53 forKeyedSubscript:v50];
                }
                uint64_t v47 = [v45 countByEnumeratingWithState:&v107 objects:v125 count:16];
              }
              while (v47);
            }

            uint64_t v44 = v98 + 1;
          }
          while (v98 + 1 != v95);
          uint64_t v95 = [v92 countByEnumeratingWithState:&v111 objects:v126 count:16];
        }
        while (v95);
      }

      v2 = v90;
      uint64_t v29 = v82;
      id v40 = v83;
      id v33 = v81;
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v39);
    }

    uint64_t v7 = v87;
    id v5 = v89;
    id v9 = v85;
LABEL_54:

    goto LABEL_55;
  }
  uint64_t v80 = *(void *)(*(void *)(a1 + 64) + 8);
  id v40 = v14;
  obuint64_t j = 0;
  v101 = *(void **)(v80 + 40);
  *(void *)(v80 + 40) = v40;

LABEL_55:
}

+ (void)batchFetchPersonsByAssetUUIDWithAssetUUIDs:(id)a3 predicate:(id)a4 includedDetectionTypes:(id)a5 library:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __107__PLPerson_batchFetchPersonsByAssetUUIDWithAssetUUIDs_predicate_includedDetectionTypes_library_completion___block_invoke;
  v21[3] = &unk_1E5874818;
  id v22 = v14;
  id v23 = v11;
  id v24 = v13;
  id v25 = v12;
  id v26 = v15;
  id v16 = v11;
  id v17 = v13;
  id v18 = v12;
  id v19 = v15;
  id v20 = v14;
  [v20 performBlockAndWait:v21];
}

void __107__PLPerson_batchFetchPersonsByAssetUUIDWithAssetUUIDs_predicate_includedDetectionTypes_library_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)a1;
  v84[2] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  BOOL v4 = +[PLDetectedFace entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  v84[0] = @"personForFace";
  v84[1] = @"assetForFace";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
  [v5 setRelationshipKeyPathsForPrefetching:v6];

  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"assetForFace.uuid", v1[5]];
  if (v1[6]
    && (+[PLDetectedFace predicateForIncludedDetectionTypes:](PLDetectedFace, "predicateForIncludedDetectionTypes:"), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = (void *)v8;
    id v10 = (void *)MEMORY[0x1E4F28BA0];
    v83[0] = v7;
    v83[1] = v8;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
    id v12 = [v10 andPredicateWithSubpredicates:v11];

    [v5 setPredicate:v12];
  }
  else
  {
    [v5 setPredicate:v7];
    id v9 = 0;
  }
  id v78 = 0;
  id v13 = [v2 executeFetchRequest:v5 error:&v78];
  id v14 = v78;
  if (v13)
  {
    BOOL v55 = v9;
    id v56 = v5;
    uint64_t v57 = v1;
    id v58 = v2;
    uint64_t v59 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v64 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    __int16 v54 = v13;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v74 objects:v82 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v75 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          uint64_t v21 = [v20 assetForFace];
          id v22 = [v21 uuid];

          id v23 = [v20 associatedPersonForFaceOrTorso:1 orTemporal:0];
          id v24 = v23;
          if (v22) {
            BOOL v25 = v23 == 0;
          }
          else {
            BOOL v25 = 1;
          }
          if (!v25)
          {
            id v26 = [v23 personUUID];
            id v27 = [v64 objectForKeyedSubscript:v26];

            if (!v27)
            {
              id v27 = [MEMORY[0x1E4F1CA48] array];
              id v28 = [v24 personUUID];
              [v64 setObject:v27 forKeyedSubscript:v28];

              [v59 addObject:v24];
            }
            [v27 addObject:v22];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v74 objects:v82 count:16];
      }
      while (v17);
    }

    uint64_t v1 = v57;
    if (v57[7])
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F1C0D0];
      long long v30 = +[PLPerson entityName];
      uint64_t v31 = [v29 fetchRequestWithEntityName:v30];

      id v32 = (void *)MEMORY[0x1E4F28F60];
      id v33 = [v64 allKeys];
      id v34 = [v32 predicateWithFormat:@"personUUID IN %@", v33];

      uint64_t v35 = (void *)MEMORY[0x1E4F28BA0];
      uint64_t v36 = v57[7];
      v81[0] = v34;
      v81[1] = v36;
      uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
      id v38 = [v35 andPredicateWithSubpredicates:v37];
      [v31 setPredicate:v38];

      id v73 = v14;
      v2 = v58;
      id v39 = [v58 executeFetchRequest:v31 error:&v73];
      id v40 = v73;

      if (v39) {
        id v41 = v39;
      }

      id v14 = v40;
      if (v39) {
        goto LABEL_24;
      }
    }
    else
    {
      id v39 = v59;
      v2 = v58;
      if (v39)
      {
LABEL_24:
        id v53 = v14;
        uint64_t v42 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v52 = v39;
        obuint64_t j = v39;
        uint64_t v62 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
        if (v62)
        {
          uint64_t v61 = *(void *)v70;
          do
          {
            for (uint64_t j = 0; j != v62; ++j)
            {
              if (*(void *)v70 != v61) {
                objc_enumerationMutation(obj);
              }
              uint64_t v44 = *(void **)(*((void *)&v69 + 1) + 8 * j);
              id v63 = [v44 personUUID];
              uint64_t v45 = objc_msgSend(v64, "objectForKeyedSubscript:");
              long long v65 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              long long v68 = 0u;
              uint64_t v46 = [v45 countByEnumeratingWithState:&v65 objects:v79 count:16];
              if (v46)
              {
                uint64_t v47 = v46;
                uint64_t v48 = *(void *)v66;
                do
                {
                  for (uint64_t k = 0; k != v47; ++k)
                  {
                    if (*(void *)v66 != v48) {
                      objc_enumerationMutation(v45);
                    }
                    uint64_t v50 = *(void *)(*((void *)&v65 + 1) + 8 * k);
                    uint64_t v51 = [v42 objectForKeyedSubscript:v50];
                    if (!v51)
                    {
                      uint64_t v51 = [MEMORY[0x1E4F1CA48] array];
                      [v42 setObject:v51 forKeyedSubscript:v50];
                    }
                    [v51 addObject:v44];
                  }
                  uint64_t v47 = [v45 countByEnumeratingWithState:&v65 objects:v79 count:16];
                }
                while (v47);
              }
            }
            uint64_t v62 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
          }
          while (v62);
        }

        uint64_t v1 = v57;
        v2 = v58;
        id v39 = v52;
        id v14 = v53;
        goto LABEL_44;
      }
    }
    uint64_t v42 = 0;
LABEL_44:

    id v5 = v56;
    id v13 = v54;
    id v9 = v55;
    goto LABEL_45;
  }
  uint64_t v42 = 0;
LABEL_45:
  (*(void (**)(void))(v1[8] + 16))();
}

+ (void)batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:(id)a3 predicate:(id)a4 includedDetectionTypes:(id)a5 inManagedObjectContext:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __126__PLPerson_batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs_predicate_includedDetectionTypes_inManagedObjectContext_completion___block_invoke;
  v22[3] = &unk_1E58747F0;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v28 = a1;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  [v18 performBlockAndWait:v22];
}

void __126__PLPerson_batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs_predicate_includedDetectionTypes_inManagedObjectContext_completion___block_invoke(void *a1)
{
  v2 = (void *)a1[9];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  id v9 = 0;
  uint64_t v7 = [v2 _batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:v3 predicate:v4 includedDetectionTypes:v5 inManagedObjectContext:v6 error:&v9];
  id v8 = v9;
  (*(void (**)(void))(a1[8] + 16))();
}

+ (id)_batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:(id)a3 predicate:(id)a4 includedDetectionTypes:(id)a5 inManagedObjectContext:(id)a6 error:(id *)a7
{
  v61[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1E4F1CA60];
  id v14 = a3;
  uint64_t v47 = [v13 dictionary];
  id v15 = (void *)MEMORY[0x1E4F1C0D0];
  id v16 = +[PLManagedAsset entityName];
  id v17 = [v15 fetchRequestWithEntityName:v16];

  id v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", v14];

  [v17 setPredicate:v18];
  [v17 setResultType:1];
  id v54 = 0;
  id v19 = [v12 executeFetchRequest:v17 error:&v54];
  id v20 = v54;
  if (v19)
  {
    uint64_t v46 = v12;
    uint64_t v43 = v19;
    uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"assetForFace", v19];
    id v22 = v21;
    id v45 = v10;
    if (v10)
    {
      id v23 = (void *)MEMORY[0x1E4F28BA0];
      v61[0] = v21;
      v61[1] = v10;
      id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
      uint64_t v25 = [v23 andPredicateWithSubpredicates:v24];

      id v22 = v25;
    }
    id v44 = v11;
    if (v11)
    {
      uint64_t v26 = +[PLDetectedFace predicateForIncludedDetectionTypes:v11];
      id v27 = (void *)v26;
      if (v26)
      {
        id v28 = (void *)MEMORY[0x1E4F28BA0];
        v60[0] = v22;
        v60[1] = v26;
        uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
        uint64_t v30 = [v28 andPredicateWithSubpredicates:v29];

        id v22 = v30;
      }
    }
    id v33 = +[PLDetectedFace fetchRequest];
    id v34 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v34 setName:@"assetUUID"];
    uint64_t v35 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"assetForFace.uuid"];
    [v34 setExpression:v35];

    [v34 setExpressionResultType:700];
    id v36 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v36 setName:@"personUUID"];
    uint64_t v37 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"personForFace.personUUID"];
    [v36 setExpression:v37];

    [v36 setExpressionResultType:700];
    v59[0] = v34;
    v59[1] = v36;
    id v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    [v33 setPropertiesToFetch:v38];

    [v33 setPredicate:v22];
    [v33 setResultType:2];
    id v53 = v20;
    id v39 = [v46 executeFetchRequest:v33 error:&v53];
    id v31 = v53;

    if (v39)
    {
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __122__PLPerson__batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs_predicate_includedDetectionTypes_inManagedObjectContext_error___block_invoke;
      v49[3] = &unk_1E58747C8;
      uint64_t v50 = @"assetUUID";
      uint64_t v51 = @"personUUID";
      id v32 = v47;
      id v52 = v47;
      [v39 enumerateObjectsUsingBlock:v49];

      id v40 = v50;
    }
    else
    {
      id v40 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v56 = "+[PLPerson _batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:predicate:includedDetectionTypes:inManagedObjec"
              "tContext:error:]";
        __int16 v57 = 2112;
        id v58 = v31;
        _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_ERROR, "%s error fetching face data: %@", buf, 0x16u);
      }
      id v32 = v47;
    }

    id v11 = v44;
    id v10 = v45;
    id v12 = v46;
    id v19 = v43;
  }
  else
  {
    id v22 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v56 = "+[PLPerson _batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:predicate:includedDetectionTypes:inManagedObjectContext:error:]";
      __int16 v57 = 2112;
      id v58 = v20;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "%s error fetching assets: %@", buf, 0x16u);
    }
    id v31 = v20;
    id v32 = v47;
  }

  if (a7) {
    *a7 = v31;
  }
  id v41 = v32;

  return v41;
}

void __122__PLPerson__batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs_predicate_includedDetectionTypes_inManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v9 = [v4 objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v5) {
    BOOL v6 = v9 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:v9];
    if (v7)
    {
      id v8 = v7;
      if (([v7 containsObject:v5] & 1) == 0) {
        [v8 addObject:v5];
      }
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1CA48] arrayWithObject:v5];
      [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:v9];
    }
  }
}

+ (id)entityName
{
  return @"Person";
}

+ (id)createUnverifiedPersonInManagedObjectContext:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F29128];
  id v4 = a3;
  uint64_t v5 = [v3 UUID];
  BOOL v6 = [v5 UUIDString];
  uint64_t v7 = +[PLPerson insertIntoManagedObjectContext:v4 withPersonUUID:v6 fullName:&stru_1EEB2EB80 verifiedType:0];

  return v7;
}

+ (void)createAssociatedPersonForFaceGroup:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 managedObjectContext];
    [a1 createAssociatedPersonForFaceGroup:v4 inManagedObjectContext:v5];
  }
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)@"personUUID";
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 4;
}

+ (id)personsWithUUIDs:(id)a3 inManagedObjectContext:(id)a4
{
  BOOL v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"personUUID IN %@", a3];
  id v9 = [a1 personsMatchingPredicate:v8 fetchLimit:0 sortDescriptors:0 relationshipKeyPathsForPrefetching:0 inManagedObjectContext:v7];

  return v9;
}

+ (id)personsWithPersonUris:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x19F38D3B0]();
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"personUri", v6];
    id v10 = [a1 personsMatchingPredicate:v9 fetchLimit:0 sortDescriptors:0 relationshipKeyPathsForPrefetching:0 inManagedObjectContext:v7];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)personsWithPersonUri:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v12 count:1];

  id v10 = objc_msgSend(a1, "personsWithPersonUris:inManagedObjectContext:", v9, v7, v12, v13);

  return v10;
}

+ (id)allPersonsInManagedObjectContext:(id)a3
{
  return (id)[a1 personsMatchingPredicate:0 fetchLimit:0 sortDescriptors:0 relationshipKeyPathsForPrefetching:0 inManagedObjectContext:a3];
}

+ (PLPerson)personWithUUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x19F38D3B0]();
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personUUID == %@", v6];
    id v10 = [a1 personsMatchingPredicate:v9 fetchLimit:1 sortDescriptors:0 relationshipKeyPathsForPrefetching:0 inManagedObjectContext:v7];
    if ([v10 count])
    {
      id v11 = [v10 firstObject];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return (PLPerson *)v11;
}

+ (id)personsMatchingPredicate:(id)a3 fetchLimit:(unint64_t)a4 sortDescriptors:(id)a5 relationshipKeyPathsForPrefetching:(id)a6 inManagedObjectContext:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__110901;
  id v34 = __Block_byref_object_dispose__110902;
  id v35 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __122__PLPerson_personsMatchingPredicate_fetchLimit_sortDescriptors_relationshipKeyPathsForPrefetching_inManagedObjectContext___block_invoke;
  v22[3] = &unk_1E5874750;
  id v28 = a1;
  id v16 = v12;
  id v23 = v16;
  unint64_t v29 = a4;
  id v17 = v13;
  id v24 = v17;
  id v18 = v14;
  id v25 = v18;
  id v27 = &v30;
  id v19 = v15;
  id v26 = v19;
  [v19 performBlockAndWait:v22];
  id v20 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  return v20;
}

void __122__PLPerson_personsMatchingPredicate_fetchLimit_sortDescriptors_relationshipKeyPathsForPrefetching_inManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = [*(id *)(a1 + 72) entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  if (*(void *)(a1 + 32)) {
    objc_msgSend(v4, "setPredicate:");
  }
  if (*(void *)(a1 + 80)) {
    objc_msgSend(v4, "setFetchLimit:");
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v4, "setSortDescriptors:");
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v4, "setRelationshipKeyPathsForPrefetching:");
  }
  id v5 = *(void **)(a1 + 56);
  id v13 = 0;
  uint64_t v6 = [v5 executeFetchRequest:v4 error:&v13];
  id v7 = v13;
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = *MEMORY[0x1E4F59AC0] == 0;
  }
  if (v10)
  {
    id v11 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to find person matching predicate %@: %@", buf, 0x16u);
    }
  }
}

+ (id)insertIntoManagedObjectContext:(id)a3 withPersonUUID:(id)a4 fullName:(id)a5 verifiedType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    id v14 = [a1 entityName];
    [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:v14 inManagedObjectContext:v11];
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PLPerson.m", 194, @"Invalid parameter not satisfying: %@", @"moc" object file lineNumber description];

    id v14 = [a1 entityName];
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v14, 0, 0);
  uint64_t v15 = };

  [v15 setPersonUUID:v12];
  [v15 setFullName:v13];
  [v15 setType:0];
  [v15 setEffectiveVerifiedType:v6];

  return v15;
}

+ (id)insertIntoPhotoLibrary:(id)a3 withPersonUUID:(id)a4 fullName:(id)a5 verifiedType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PLPerson.m", 188, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  id v14 = [v11 managedObjectContext];
  uint64_t v15 = [a1 insertIntoManagedObjectContext:v14 withPersonUUID:v12 fullName:v13 verifiedType:v6];

  return v15;
}

+ (id)fetchDuplicatePersonUUIDsInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__110901;
  id v26 = __Block_byref_object_dispose__110902;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__110901;
  id v20 = __Block_byref_object_dispose__110902;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PLPerson_fetchDuplicatePersonUUIDsInManagedObjectContext_error___block_invoke;
  v12[3] = &unk_1E5875A90;
  id v6 = v5;
  id v13 = v6;
  id v14 = &v16;
  uint64_t v15 = &v22;
  [v6 performBlockAndWait:v12];
  uint64_t v7 = v17[5];
  id v8 = (id)v23[5];
  id v9 = v8;
  if (!v7 && a4) {
    *a4 = v8;
  }

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

void __66__PLPerson_fetchDuplicatePersonUUIDsInManagedObjectContext_error___block_invoke(void *a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLPerson entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  v19[0] = @"personUUID";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v4 setPropertiesToGroupBy:v5];

  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"count(SELF) > 1"];
  [v4 setHavingPredicate:v6];

  [v4 setResultType:2];
  uint64_t v18 = @"personUUID";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [v4 setPropertiesToFetch:v7];

  id v8 = (void *)a1[4];
  id v17 = 0;
  id v9 = [v8 executeFetchRequest:v4 error:&v17];
  id v10 = v17;
  id v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v9 valueForKey:@"personUUID"];
    uint64_t v13 = *(void *)(a1[5] + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    uint64_t v15 = *(void *)(a1[6] + 8);
    id v16 = v10;
    id v14 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v16;
  }
}

- (id)syncDescription
{
  v6[12] = *MEMORY[0x1E4F143B8];
  v6[0] = @"personUUID";
  v6[1] = @"verifiedType";
  v6[2] = @"fullName";
  v6[3] = @"cloudLocalState";
  void v6[4] = @"cloudVerifiedType";
  v6[5] = @"mergeTargetPerson";
  v6[6] = @"faceCount";
  v6[7] = @"personUri";
  v6[8] = @"contactMatchingDictionary";
  v6[9] = @"type";
  v6[10] = @"manualOrder";
  v6[11] = @"detectionType";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:12];
  id v4 = [(NSManagedObject *)self truncatedDescriptionWithPropertyKeys:v3];

  return v4;
}

- (BOOL)isTombstone
{
  return [(PLPerson *)self verifiedType] == -2;
}

- (BOOL)graphVerified
{
  return [(PLPerson *)self verifiedType] == 2;
}

- (BOOL)userVerified
{
  return [(PLPerson *)self verifiedType] == 1;
}

- (void)setKeyFaceToPicked
{
}

- (BOOL)keyFaceIsPicked
{
  return [(PLPerson *)self keyFacePickSource] == 1;
}

- (void)setCPLSyncedMergeTarget:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 finalMergeTargetPerson];
  id v6 = [(PLPerson *)self mergeTargetPerson];

  if (!v6)
  {
    uint64_t v7 = [(PLPerson *)self personUUID];
    id v8 = [v5 personUUID];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      id v10 = [(PLPerson *)self keyFace];
      int v11 = [(PLPerson *)self keyFacePickSource];
      v24[0] = self;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      [v5 basicMergePersons:v12];

      uint64_t v13 = [v5 keyFace];

      if (!v13 && v10 && v11 == 1)
      {
        if (!*MEMORY[0x1E4F59AC0])
        {
          id v14 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = [v5 personUUID];
            id v16 = [v10 uuid];
            id v17 = [(PLPerson *)self personUUID];
            int v18 = 138543874;
            id v19 = v15;
            __int16 v20 = 2114;
            id v21 = v16;
            __int16 v22 = 2114;
            id v23 = v17;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Final merge target person %{public}@ missing key face, updating to key face %{public}@ from %{public}@", (uint8_t *)&v18, 0x20u);
          }
        }
        [v5 setKeyFace:v10 pickSource:1];
      }
      goto LABEL_14;
    }
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v10 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412546;
        id v19 = self;
        __int16 v20 = 2112;
        id v21 = v4;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Unable to merge %@ to %@, final merge target personUUID is the same", (uint8_t *)&v18, 0x16u);
      }
LABEL_14:
    }
  }
}

- (id)cplPersonChange
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLPerson *)self personUUID];

  if (v3)
  {
    id v4 = [(PLPerson *)self scopedIdentifier];
    id v5 = (void *)[MEMORY[0x1E4F598F0] newChangeWithScopedIdentifier:v4 changeType:0];
    id v6 = [(PLPerson *)self fullName];
    [v5 setFullName:v6];

    uint64_t v7 = [(PLPerson *)self displayName];
    [v5 setDisplayName:v7];

    objc_msgSend(v5, "setPersonType:", (int)-[PLPerson type](self, "type"));
    objc_msgSend(v5, "setManualSortOrder:", -[PLPerson manualOrder](self, "manualOrder"));
    if ([MEMORY[0x1E4F598F0] serverSupportsAssetSortOrder]) {
      objc_msgSend(v5, "setAssetSortOrder:", (int)-[PLPerson assetSortOrder](self, "assetSortOrder"));
    }
    id v8 = [(PLPerson *)self contactMatchingDictionary];
    [v5 setContactMatchingDictionary:v8];

    if ([MEMORY[0x1E4F598F0] serverSupportsGraphPeopleHome])
    {
      int v9 = [(PLPerson *)self cloudVerifiedType];
      uint64_t v10 = [(PLPerson *)self cloudDetectionType];
      if (v9 == -2)
      {
        uint64_t v12 = -2;
      }
      else
      {
        uint64_t v11 = v10;
        if (v9 == 2)
        {
          if ([MEMORY[0x1E4F598F0] serverSupportsDetectionType]
            && +[PLDetectionTrait isPetDetectionType:v11])
          {
            uint64_t v12 = 4;
          }
          else
          {
            uint64_t v12 = 2;
          }
        }
        else if (v9 == 1)
        {
          if ([MEMORY[0x1E4F598F0] serverSupportsDetectionType]
            && +[PLDetectionTrait isPetDetectionType:v11])
          {
            uint64_t v12 = 3;
          }
          else
          {
            uint64_t v12 = 1;
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      [v5 setVerifiedType:v12];
    }
    if ([MEMORY[0x1E4F598F0] serverSupportsMergeTargetRef])
    {
      uint64_t v15 = [(PLPerson *)self mergeTargetPerson];
      id v16 = v15;
      if (v15)
      {
        id v17 = [v15 personUUID];
        [v5 setMergeTargetPersonIdentifier:v17];
      }
    }
    if ([MEMORY[0x1E4F598F0] serverSupportsDetectionType]) {
      objc_msgSend(v5, "setDetectionType:", -[PLPerson cloudDetectionType](self, "cloudDetectionType"));
    }
  }
  else
  {
    uint64_t v13 = [NSString stringWithFormat:@"Missing personUUID for person %@, Please file a Radar to Photos Backend iCloud with 'cplctl diagnose' logs and relate to 32789330", self];
    PLSimulateCrash();

    if (!*MEMORY[0x1E4F59AC0])
    {
      id v14 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v20 = self;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Trying to upload a person %@ without a personUUID, skipping", buf, 0xCu);
      }
    }
    id v5 = 0;
  }
  return v5;
}

- (id)scopedIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F59968]);
  id v4 = [(PLPerson *)self scopeIdentifier];
  id v5 = [(PLPerson *)self personUUID];
  id v6 = (void *)[v3 initWithScopeIdentifier:v4 identifier:v5];

  return v6;
}

- (id)scopeIdentifier
{
  v2 = [(PLManagedObject *)self photoLibrary];
  id v3 = [v2 mainScopeIdentifier];

  return v3;
}

- (void)applyCPLChangeForContactMatchingDictionary:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLPerson *)self setContactMatchingDictionary:v4];
  if (v4 || [0 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    v23[0] = *MEMORY[0x1E4F1AE08];
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    uint64_t v7 = +[PLContactStoreUtilitiesWorkaround contactWithMatchingDictionary:v4 keysToFetch:v6 contactStore:v5];

    if (v7)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        id v8 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = [(NSManagedObject *)self pointerDescription];
          uint64_t v10 = [v7 identifier];
          uint64_t v11 = [(PLPerson *)self personUri];
          int v17 = 138412802;
          int v18 = v9;
          __int16 v19 = 2112;
          __int16 v20 = v10;
          __int16 v21 = 2112;
          __int16 v22 = v11;
          _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Setting contact ID of person %@ to %@ (was %@)", (uint8_t *)&v17, 0x20u);
        }
      }
      uint64_t v12 = [v7 identifier];
      [(PLPerson *)self setPersonUri:v12];
    }
    else
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v13 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [(PLPerson *)self personUUID];
          int v17 = 138412290;
          int v18 = v14;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Reset contact ID of person %@ to nil since we can't find the contact", (uint8_t *)&v17, 0xCu);
        }
      }
      [(PLPerson *)self setPersonUri:0];
    }
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v15 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [(NSManagedObject *)self pointerDescription];
        int v17 = 138412290;
        int v18 = v16;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Setting contact ID of person %@ to nil since contactsMatchingDictionary on cloud record was nil", (uint8_t *)&v17, 0xCu);
      }
    }
    [(PLPerson *)self setPersonUri:0];
  }
}

- (BOOL)_allowSyncOfChangeWithKey:(id)a3
{
  if (![a3 isEqualToString:@"manualOrder"]) {
    return 1;
  }
  int v4 = [(PLPerson *)self cloudLocalState];
  int v5 = [(PLPerson *)self verifiedType];
  unsigned int v6 = [(PLPerson *)self manualOrder];
  return v4 != 1 || v5 != 2 || v6 < 0x400;
}

- (BOOL)isSyncableChange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLPerson *)self changedValues];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v4 = objc_msgSend((id)objc_opt_class(), "listOfSyncedProperties", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v3 objectForKey:v9];

        if (v10 && [(PLPerson *)self _allowSyncOfChangeWithKey:v9])
        {
          BOOL v11 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)supportsCloudUpload
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (![MEMORY[0x1E4F59840] serverSupportsVision]) {
    return 0;
  }
  if (![MEMORY[0x1E4F598F0] serverSupportsGraphPeopleHome]) {
    return [(PLPerson *)self verifiedType] == 1;
  }
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  int v4 = [(id)objc_opt_class() _predicateForSupportedVerifiedTypesForUpload];
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "_predicateForSupportedDetectionTypesForUpload", v4);
  v11[1] = v5;
  uint64_t v6 = [(id)objc_opt_class() _predicateToBlockHiddenGraphTypesForUpload];
  v11[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  id v8 = [v3 andPredicateWithSubpredicates:v7];

  char v9 = [v8 evaluateWithObject:self];
  return v9;
}

+ (BOOL)person:(id)a3 isBetterMergeTargetThanPerson:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 personUUID];
  uint64_t v7 = [v5 personUUID];

  LOBYTE(v5) = [v6 compare:v7] == -1;
  return (char)v5;
}

+ (void)resetCloudStateInPhotoLibrary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = objc_alloc(MEMORY[0x1E4F1C038]);
  uint64_t v7 = [a1 entityName];
  id v8 = (void *)[v6 initWithEntityName:v7];

  char v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"cloudLocalState", 0);
  [v8 setResultType:2];
  [v8 setPropertiesToUpdate:&unk_1EEBF2A68];
  [v8 setPredicate:v9];
  uint64_t v10 = [v4 managedObjectContext];
  id v15 = 0;
  BOOL v11 = [v10 executeRequest:v8 error:&v15];
  id v12 = v15;

  if (v11)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      long long v13 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        long long v14 = [v11 result];
        *(_DWORD *)buf = 138412290;
        id v17 = v14;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Batch updated %@ people", buf, 0xCu);
      }
LABEL_8:
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    long long v13 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to batch update people: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
}

+ (id)personsToPrefetchInManagedObjectContext:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "predicateWithFormat:", @"%K = %d AND %K != %d AND %K != NULL", @"verifiedType", 1, @"type", 0xFFFFFFFFLL, @"keyFace");
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"type" ascending:0];
  v13[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  id v12 = @"keyFace.assetForFace";
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  uint64_t v10 = [a1 personsMatchingPredicate:v6 fetchLimit:100 sortDescriptors:v8 relationshipKeyPathsForPrefetching:v9 inManagedObjectContext:v5];

  return v10;
}

+ (id)personsToUploadInManagedObjectContext:(id)a3 limit:(int64_t)a4
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  id v8 = objc_msgSend(v6, "predicateWithFormat:", @"%K == %d", @"cloudLocalState", 0);
  char v9 = (void *)MEMORY[0x1E4F28BA0];
  v20[0] = v8;
  uint64_t v10 = [a1 _predicateForSupportedVerifiedTypesForUpload];
  v20[1] = v10;
  BOOL v11 = [a1 _predicateForSupportedDetectionTypesForUpload];
  v20[2] = v11;
  id v12 = [a1 _predicateToBlockHiddenGraphTypesForUpload];
  v20[3] = v12;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  long long v14 = [v9 andPredicateWithSubpredicates:v13];

  id v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"manualOrder" ascending:0];
  __int16 v19 = v15;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];

  id v17 = [a1 personsMatchingPredicate:v14 fetchLimit:a4 sortDescriptors:v16 relationshipKeyPathsForPrefetching:0 inManagedObjectContext:v7];

  return v17;
}

+ (id)_predicateToBlockHiddenGraphTypesForUpload
{
  v2 = (void *)MEMORY[0x1E4F28BA0];
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d AND %K == %d", @"type", 0xFFFFFFFFLL, @"verifiedType", 2);
  id v4 = [v2 notPredicateWithSubpredicate:v3];

  return v4;
}

+ (id)_predicateForSupportedDetectionTypesForUpload
{
  pl_dispatch_once();
  v2 = (void *)_predicateForSupportedDetectionTypesForUpload_predicate;
  return v2;
}

void __62__PLPerson_CPL___predicateForSupportedDetectionTypesForUpload__block_invoke()
{
  if ([MEMORY[0x1E4F598F0] serverSupportsDetectionType]) {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d OR %K > %d", @"detectionType", 1, @"detectionType", 2);
  }
  else {
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"detectionType", 1, v2, v3);
  }
  uint64_t v1 = (void *)_predicateForSupportedDetectionTypesForUpload_predicate;
  _predicateForSupportedDetectionTypesForUpload_predicate = v0;
}

+ (id)_predicateForSupportedVerifiedTypesForUpload
{
  pl_dispatch_once();
  uint64_t v2 = (void *)_predicateForSupportedVerifiedTypesForUpload_predicate;
  return v2;
}

void __61__PLPerson_CPL___predicateForSupportedVerifiedTypesForUpload__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d AND %K != %d AND %K != nil", @"verifiedType", 0, @"verifiedType", 0xFFFFFFFFLL, @"personUUID");
  uint64_t v1 = (void *)_predicateForSupportedVerifiedTypesForUpload_predicate;
  _predicateForSupportedVerifiedTypesForUpload_predicate = v0;
}

+ (id)listOfSyncedProperties
{
  if ([MEMORY[0x1E4F598F0] serverSupportsGraphPeopleHome])
  {
    if ([MEMORY[0x1E4F598F0] serverSupportsMergeTargetRef])
    {
      pl_dispatch_once();
      uint64_t v2 = &listOfSyncedProperties_pl_once_object_1;
    }
    else
    {
      pl_dispatch_once();
      uint64_t v2 = &listOfSyncedProperties_pl_once_object_2;
    }
  }
  else
  {
    pl_dispatch_once();
    uint64_t v2 = &listOfSyncedProperties_pl_once_object_3;
  }
  uint64_t v3 = (void *)*v2;
  return v3;
}

void __39__PLPerson_CPL__listOfSyncedProperties__block_invoke()
{
  v3[9] = *MEMORY[0x1E4F143B8];
  v3[0] = @"personUUID";
  v3[1] = @"fullName";
  v3[2] = @"displayName";
  v3[3] = @"type";
  v3[4] = @"manualOrder";
  v3[5] = @"contactMatchingDictionary";
  v3[6] = @"verifiedType";
  v3[7] = @"mergeTargetPerson";
  v3[8] = @"assetSortOrder";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:9];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)listOfSyncedProperties_pl_once_object_1;
  listOfSyncedProperties_pl_once_object_1 = v1;
}

void __39__PLPerson_CPL__listOfSyncedProperties__block_invoke_2()
{
  v3[7] = *MEMORY[0x1E4F143B8];
  v3[0] = @"personUUID";
  v3[1] = @"fullName";
  v3[2] = @"displayName";
  v3[3] = @"type";
  v3[4] = @"manualOrder";
  v3[5] = @"contactMatchingDictionary";
  v3[6] = @"verifiedType";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:7];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)listOfSyncedProperties_pl_once_object_2;
  listOfSyncedProperties_pl_once_object_2 = v1;
}

void __39__PLPerson_CPL__listOfSyncedProperties__block_invoke_3()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v3[0] = @"personUUID";
  v3[1] = @"fullName";
  v3[2] = @"displayName";
  v3[3] = @"type";
  v3[4] = @"manualOrder";
  v3[5] = @"contactMatchingDictionary";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:6];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)listOfSyncedProperties_pl_once_object_3;
  listOfSyncedProperties_pl_once_object_3 = v1;
}

@end