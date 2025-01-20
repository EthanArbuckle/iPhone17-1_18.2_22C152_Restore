@interface PLMemory
+ (BOOL)_isGenerativeMemoryWithUserActionOptions:(unsigned __int16)a3;
+ (BOOL)_shouldPrefetchMemoryMovieCuratedAssetsInPhotoLibrary:(id)a3 prefetchConfiguration:(id)a4;
+ (BOOL)isUserCreatedMemoryWithUserActionOptions:(unsigned __int16)a3;
+ (NSString)cloudUUIDKeyForDeletion;
+ (PLMemory)memoryWithUUID:(id)a3 inPhotoLibrary:(id)a4;
+ (id)_compiledUserEditedAssetsFromSourceMemory:(id)a3 andTargetMemory:(id)a4;
+ (id)_findCollectionMostSimilarToCollectionWithAssets:(id)a3 additionalPredicate:(id)a4;
+ (id)_memoriesMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(int64_t)a5 inPhotoLibrary:(id)a6;
+ (id)_predicateForSourceGeneratedMemories;
+ (id)_predicateForTargetUserEditMemories;
+ (id)entityName;
+ (id)fetchMemoriesForAssetObjectID:(id)a3 libraryIdentifier:(int64_t)a4 managedObjectContext:(id)a5;
+ (id)fetchMemoriesWithUUIDs:(id)a3 managedObjectContext:(id)a4;
+ (id)insertIntoContext:(id)a3 withUUID:(id)a4 title:(id)a5 subtitle:(id)a6 creationDate:(id)a7;
+ (id)isEligibleForSearchIndexingPredicateForLibraryIdentifier:(int64_t)a3;
+ (id)keyPathsForMemoriesBeingAssets;
+ (id)memoriesContainingAsset:(id)a3;
+ (id)memoriesToPrefetchForWidgetInManagedObjectContext:(id)a3;
+ (id)memoriesToPrefetchInPhotoLibrary:(id)a3 prefetchConfiguration:(id)a4;
+ (id)memoriesToUploadInPhotoLibrary:(id)a3 limit:(int64_t)a4;
+ (id)memoriesWithUUIDs:(id)a3 inPhotoLibrary:(id)a4;
+ (id)memoryObjectIDsContainingAsset:(id)a3;
+ (id)predicateForPrivateOnlyCollectionsWithinSubset:(id)a3;
+ (id)predicateForSharedOnlyCollectionsWithinSubset:(id)a3;
+ (id)propertiesToFetch;
+ (id)relationshipKeyPathsToPrefetch;
+ (int64_t)cloudDeletionTypeForTombstone:(id)a3;
+ (signed)_calculateSharingCompositionForMemory:(id)a3;
+ (unint64_t)_deleteMemoriesMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4;
+ (unint64_t)countOfMemoriesCreatedTodayWithNotificationStateRequestedOrSeenInPhotoLibrary:(id)a3 excludingMemory:(id)a4 error:(id *)a5;
+ (void)_deepCopyFromMemory:(id)a3 toMemory:(id)a4;
+ (void)deleteAllMemoriesInPhotoLibrary:(id)a3;
+ (void)deleteMemoriesWithObjectIDs:(id)a3 inManagedObjectContext:(id)a4;
+ (void)deletePendingMemoriesCreatedBefore:(id)a3 inPhotoLibrary:(id)a4;
+ (void)resetCloudStateInPhotoLibrary:(id)a3;
- (BOOL)_attachGeneratedMemoryToNearestUserEditMemory;
- (BOOL)_attachUserEditToNearestSourceMemory;
- (BOOL)_sharingCompositionNeedsUpdate;
- (BOOL)hasAnyAssets;
- (BOOL)isEligibleForSearchIndexing;
- (BOOL)isSyncableChange;
- (BOOL)isUserCreatedMemory;
- (BOOL)isValidForPersistence;
- (BOOL)needsPersistenceUpdate;
- (BOOL)promoteToUserEditedMemoryWithError:(id *)a3;
- (BOOL)supportsCloudUpload;
- (BOOL)updateWithCPLMemoryChange:(id)a3 inPhotoLibrary:(id)a4;
- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3;
- (id)allAvailableAssets;
- (id)calculateKeyAsset;
- (id)cplMemoryChange;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)payloadIDForTombstone:(id)a3;
- (id)scopeIdentifier;
- (id)scopedIdentifier;
- (int64_t)cloudDeletionType;
- (signed)sharingComposition;
- (void)_cacheMemoryPropertiesForUIPerformanceWithPhotosGraphData:(id)a3;
- (void)_propagateRepresentativeAssetsToTargetUserEditMemory;
- (void)_recalculateSharingCompositionIfNeeded;
- (void)_updateCompiledAssetsAfterUserRemovedAssetsChange;
- (void)calculateSyndicatedContentState;
- (void)delete;
- (void)didSave;
- (void)persistMetadataToFileSystemWithPathManager:(id)a3;
- (void)prepareForDeletion;
- (void)recalculateStartAndEndDates;
- (void)recalculateUserActionOptionsBit;
- (void)removePersistedFileSystemDataWithPathManager:(id)a3;
- (void)setKeyAsset:(id)a3;
- (void)setNeedsPersistenceUpdate:(BOOL)a3;
- (void)willSave;
@end

@implementation PLMemory

+ (BOOL)isUserCreatedMemoryWithUserActionOptions:(unsigned __int16)a3
{
  return a3 & 1;
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return [a3 containsObject:@"pendingState"];
}

- (id)payloadIDForTombstone:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"uuid"];
  v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  if ([(PLMemory *)self isValidForPersistence]) {
    v5 = [(PLManagedObjectJournalEntryPayload *)[PLMemoryJournalEntryPayload alloc] initWithManagedObject:self changedKeys:v4];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (id)payloadID
{
  v2 = [(PLMemory *)self uuid];
  v3 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v2];

  return v3;
}

- (BOOL)isEligibleForSearchIndexing
{
  if ([(PLMemory *)self isDeleted]) {
    return 0;
  }
  id v4 = objc_opt_class();
  v5 = [(PLManagedObject *)self photoLibrary];
  v6 = objc_msgSend(v4, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", +[PLSpotlightDonationUtilities wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:](PLSpotlightDonationUtilities, "wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:", v5));
  char v7 = [v6 evaluateWithObject:self];

  return v7;
}

+ (id)fetchMemoriesForAssetObjectID:(id)a3 libraryIdentifier:(int64_t)a4 managedObjectContext:(id)a5
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F1C0D0];
  id v9 = a5;
  id v10 = a3;
  v11 = +[PLMemory entityName];
  v12 = [v8 fetchRequestWithEntityName:v11];

  v13 = (void *)MEMORY[0x1E4F28BA0];
  v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K", v10, @"curatedAssets"];

  v25[0] = v14;
  v15 = [a1 isEligibleForSearchIndexingPredicateForLibraryIdentifier:a4];
  v25[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v17 = [v13 andPredicateWithSubpredicates:v16];
  [v12 setPredicate:v17];

  v24 = @"curatedAssets";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  [v12 setRelationshipKeyPathsForPrefetching:v18];

  id v23 = 0;
  v19 = [v9 executeFetchRequest:v12 error:&v23];

  id v20 = v23;
  if (v19) {
    [MEMORY[0x1E4F8B9B8] successWithResult:v19];
  }
  else {
  v21 = [MEMORY[0x1E4F8B9B8] failureWithError:v20];
  }

  return v21;
}

+ (id)fetchMemoriesWithUUIDs:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  char v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = a4;
  id v9 = +[PLMemory entityName];
  id v10 = [v7 fetchRequestWithEntityName:v9];

  v11 = [a1 propertiesToFetch];
  [v10 setPropertiesToFetch:v11];

  [v10 setIncludesPendingChanges:0];
  if ((unint64_t)[v6 count] >= 0x65) {
    [v10 setFetchBatchSize:100];
  }
  v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v6];
  [v10 setPredicate:v12];

  objc_msgSend(v10, "setFetchLimit:", objc_msgSend(v6, "count"));
  id v17 = 0;
  v13 = [v8 executeFetchRequest:v10 error:&v17];

  id v14 = v17;
  if (v13) {
    [MEMORY[0x1E4F8B9B8] successWithResult:v13];
  }
  else {
  v15 = [MEMORY[0x1E4F8B9B8] failureWithError:v14];
  }

  return v15;
}

+ (id)relationshipKeyPathsToPrefetch
{
  return 0;
}

+ (id)propertiesToFetch
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"uuid";
  v4[1] = @"title";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

+ (id)isEligibleForSearchIndexingPredicateForLibraryIdentifier:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"rejected == NO AND ((category IN (%@)) OR (creationType == %d))", &unk_1EEBF22E8, 1];
}

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  *((unsigned char *)&self->super._willSaveCallCount + 2) = a3;
}

- (BOOL)needsPersistenceUpdate
{
  return *((unsigned char *)&self->super._willSaveCallCount + 2);
}

- (BOOL)promoteToUserEditedMemoryWithError:(id *)a3
{
  v5 = [(PLMemory *)self entity];
  id v6 = [v5 name];
  char v7 = [(PLMemory *)self managedObjectContext];
  id v14 = 0;
  id v8 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v6, (uint64_t)v7, &v14);
  id v9 = v14;

  if (v8)
  {
    [(id)objc_opt_class() _deepCopyFromMemory:self toMemory:v8];
    id v10 = [MEMORY[0x1E4F29128] UUID];
    v11 = [v10 UUIDString];
    objc_msgSend(v8, "pl_safeSetValue:forKey:valueDidChangeHandler:", v11, @"uuid", 0);

    v12 = [MEMORY[0x1E4F1C9C8] date];
    [(PLManagedObject *)self pl_safeSetValue:v12 forKey:@"creationDate" valueDidChangeHandler:0];

    [(PLManagedObject *)self pl_safeSetValue:&unk_1EEBF0668 forKey:@"pendingState" valueDidChangeHandler:0];
    [(PLManagedObject *)self pl_safeSetValue:v8 forKey:@"sourceGeneratedMemory" valueDidChangeHandler:0];
  }
  else if (a3)
  {
    *a3 = v9;
  }

  return v8 != 0;
}

- (BOOL)_attachGeneratedMemoryToNearestUserEditMemory
{
  if ([(PLMemory *)self pendingState] == 3)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PLMemory.m" lineNumber:1199 description:@"can only connect generated memory."];
  }
  id v4 = objc_opt_class();
  v5 = [(PLMemory *)self representativeAssets];
  id v6 = [(id)objc_opt_class() _predicateForTargetUserEditMemories];
  char v7 = [v4 _findCollectionMostSimilarToCollectionWithAssets:v5 additionalPredicate:v6];

  if (v7) {
    [(PLMemory *)self setTargetUserEditedMemory:v7];
  }

  return v7 != 0;
}

- (BOOL)_attachUserEditToNearestSourceMemory
{
  if ([(PLMemory *)self pendingState] != 3)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PLMemory.m" lineNumber:1184 description:@"can only connect userEdit memory."];
  }
  id v4 = objc_opt_class();
  v5 = [(PLMemory *)self representativeAssets];
  id v6 = [(id)objc_opt_class() _predicateForSourceGeneratedMemories];
  char v7 = [v4 _findCollectionMostSimilarToCollectionWithAssets:v5 additionalPredicate:v6];

  if (v7) {
    [(PLManagedObject *)self pl_safeSetValue:v7 forKey:@"sourceGeneratedMemory" valueDidChangeHandler:0];
  }

  return v7 != 0;
}

- (void)_updateCompiledAssetsAfterUserRemovedAssetsChange
{
  if ([(PLMemory *)self pendingState] != 3)
  {
    char v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLMemory.m", 1175, @"Invalid parameter not satisfying: %@", @"self.pendingState == PLMemoryPendingStateUserEdit" object file lineNumber description];
  }
  id v4 = objc_opt_class();
  v5 = [(PLMemory *)self sourceGeneratedMemory];
  id v8 = [v4 _compiledUserEditedAssetsFromSourceMemory:v5 andTargetMemory:self];

  [(PLManagedObject *)self pl_safeSetValue:v8 forKey:@"customUserAssets" valueDidChangeHandler:0];
  id v6 = [v8 set];
  [(PLManagedObject *)self pl_safeSetValue:v6 forKey:@"representativeAssets" valueDidChangeHandler:0];
}

- (void)_propagateRepresentativeAssetsToTargetUserEditMemory
{
  if ([(PLMemory *)self pendingState] == 3)
  {
    char v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLMemory.m", 1163, @"Invalid parameter not satisfying: %@", @"self.pendingState != PLMemoryPendingStateUserEdit" object file lineNumber description];
  }
  id v4 = [(PLMemory *)self targetUserEditedMemory];
  if (v4)
  {
    id v8 = v4;
    v5 = [(id)objc_opt_class() _compiledUserEditedAssetsFromSourceMemory:self andTargetMemory:v4];
    objc_msgSend(v8, "pl_safeSetValue:forKey:valueDidChangeHandler:", v5, @"customUserAssets", 0);
    id v6 = [v5 set];
    objc_msgSend(v8, "pl_safeSetValue:forKey:valueDidChangeHandler:", v6, @"representativeAssets", 0);

    id v4 = v8;
  }
}

- (signed)sharingComposition
{
  [(PLMemory *)self _recalculateSharingCompositionIfNeeded];
  [(PLMemory *)self willAccessValueForKey:@"sharingComposition"];
  v3 = [(PLMemory *)self primitiveValueForKey:@"sharingComposition"];
  signed __int16 v4 = [v3 intValue];

  [(PLMemory *)self didAccessValueForKey:@"sharingComposition"];
  return v4;
}

- (void)_recalculateSharingCompositionIfNeeded
{
  if ([(PLMemory *)self _sharingCompositionNeedsUpdate])
  {
    [(PLMemory *)self willAccessValueForKey:@"sharingComposition"];
    v3 = [(PLMemory *)self primitiveValueForKey:@"sharingComposition"];
    __int16 v4 = [v3 intValue];

    [(PLMemory *)self didAccessValueForKey:@"sharingComposition"];
    uint64_t v5 = [(id)objc_opt_class() _calculateSharingCompositionForMemory:self];
    if (v5 != v4)
    {
      uint64_t v6 = v5;
      [(PLMemory *)self willChangeValueForKey:@"sharingComposition"];
      char v7 = [NSNumber numberWithShort:v6];
      [(PLMemory *)self setPrimitiveValue:v7 forKey:@"sharingComposition"];

      [(PLMemory *)self didChangeValueForKey:@"sharingComposition"];
    }
  }
}

- (BOOL)_sharingCompositionNeedsUpdate
{
  if ([(PLMemory *)self isDeleted]) {
    return 0;
  }
  __int16 v4 = [(PLMemory *)self changedValues];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"extendedCuratedAssets"];
  if (v5)
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v6 = [(PLMemory *)self changedValues];
    char v7 = [v6 objectForKeyedSubscript:@"userCuratedAssets"];
    BOOL v3 = v7 != 0;
  }
  return v3;
}

- (void)removePersistedFileSystemDataWithPathManager:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    char v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLMemory.m", 945, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 isDCIM])
  {
    uint64_t v6 = [[PLPersistedMemoryMetadata alloc] initWithPLMemory:self pathManager:v8];
    [(PLPersistedMemoryMetadata *)v6 removePersistedData];
  }
}

- (void)persistMetadataToFileSystemWithPathManager:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    char v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLMemory.m", 937, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 isDCIM])
  {
    uint64_t v6 = [[PLPersistedMemoryMetadata alloc] initWithPLMemory:self pathManager:v8];
    [(PLPersistedMemoryMetadata *)v6 writePersistedData];
  }
}

- (BOOL)isValidForPersistence
{
  return [(PLMemory *)self pendingState] == 0;
}

- (id)cplMemoryChange
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v47 = [(PLMemory *)self scopedIdentifier];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F598D0], "newChangeWithScopedIdentifier:changeType:");
  __int16 v4 = [(PLMemory *)self title];
  [v3 setTitle:v4];

  id v5 = [(PLMemory *)self subtitle];
  [v3 setSubtitle:v5];

  objc_msgSend(v3, "setCategory:", (int)-[PLMemory category](self, "category"));
  objc_msgSend(v3, "setSubcategory:", (int)-[PLMemory subcategory](self, "subcategory"));
  uint64_t v6 = [(PLMemory *)self creationDate];
  [v3 setCreationDate:v6];

  char v7 = [(PLMemory *)self photosGraphData];
  [v3 setGraphData:v7];

  objc_msgSend(v3, "setGraphVersion:", -[PLMemory photosGraphVersion](self, "photosGraphVersion"));
  id v8 = [(PLMemory *)self movieData];
  [v3 setMovieData:v8];

  [(PLMemory *)self score];
  objc_msgSend(v3, "setScore:");
  objc_msgSend(v3, "setFavorite:", -[PLMemory favorite](self, "favorite"));
  objc_msgSend(v3, "setRejected:", -[PLMemory rejected](self, "rejected"));
  objc_msgSend(v3, "setUserActionOptions:", -[PLMemory userActionOptions](self, "userActionOptions"));
  id v9 = [(PLMemory *)self assetListPredicate];
  [v3 setAssetListPredicate:v9];

  objc_msgSend(v3, "setNotificationState:", (int)-[PLMemory notificationState](self, "notificationState"));
  id v10 = [(PLMemory *)self blacklistedFeature];
  [v3 setBlacklistedFeature:v10];

  objc_msgSend(v3, "setPlayCount:", -[PLMemory playCount](self, "playCount"));
  objc_msgSend(v3, "setShareCount:", -[PLMemory shareCount](self, "shareCount"));
  v48 = v3;
  objc_msgSend(v3, "setViewCount:", -[PLMemory viewCount](self, "viewCount"));
  id v56 = objc_alloc_init(MEMORY[0x1E4F598C8]);
  uint64_t v11 = [(PLMemory *)self representativeAssets];
  uint64_t v12 = [(PLMemory *)self movieCuratedAssets];
  uint64_t v13 = [(PLMemory *)self userCuratedAssets];
  uint64_t v14 = [(PLMemory *)self curatedAssets];
  uint64_t v15 = [(PLMemory *)self extendedCuratedAssets];
  v16 = self;
  uint64_t v17 = [(PLMemory *)self keyAsset];
  v55 = (void *)v11;
  v18 = [MEMORY[0x1E4F1CA80] setWithSet:v11];
  v52 = (void *)v14;
  [v18 unionSet:v14];
  v51 = (void *)v15;
  [v18 unionSet:v15];
  v54 = (void *)v12;
  [v18 unionSet:v12];
  v53 = (void *)v13;
  [v18 unionSet:v13];
  if (v17) {
    [v18 addObject:v17];
  }
  v50 = (void *)v17;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v18;
  uint64_t v19 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v62 != v21) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        id v24 = objc_alloc_init(MEMORY[0x1E4F598C0]);
        objc_msgSend(v24, "setIsRepresentative:", objc_msgSend(v55, "containsObject:", v23));
        objc_msgSend(v24, "setIsCurated:", objc_msgSend(v52, "containsObject:", v23));
        objc_msgSend(v24, "setIsExtendedCurated:", objc_msgSend(v51, "containsObject:", v23));
        objc_msgSend(v24, "setIsMovieCurated:", objc_msgSend(v54, "containsObject:", v23));
        objc_msgSend(v24, "setIsUserCurated:", objc_msgSend(v53, "containsObject:", v23));
        [v24 setIsKeyAsset:v50 == v23];
        v25 = [(PLMemory *)v16 movieAssetState];
        v26 = [v23 uuid];
        v27 = [v25 objectForKey:v26];

        id v28 = objc_alloc_init(MEMORY[0x1E4F598B8]);
        v29 = [v23 cloudAssetGUID];
        [v28 setAssetIdentifier:v29];

        [v28 setAssetFlag:v24];
        [v28 setAssetMovieData:v27];
        v30 = [v23 master];
        v31 = [v30 scopedIdentifier];

        v32 = [v31 identifier];
        [v28 setMasterFingerprint:v32];
        [v56 addAsset:v28];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v20);
  }

  [v48 setAssetList:v56];
  id v33 = objc_alloc_init(MEMORY[0x1E4F598C8]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v34 = [(PLMemory *)v16 customUserAssets];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v58 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v57 + 1) + 8 * j);
        id v40 = objc_alloc_init(MEMORY[0x1E4F598C0]);
        [v40 setIsCustomUserAsset:1];
        id v41 = objc_alloc_init(MEMORY[0x1E4F598B8]);
        v42 = [v39 cloudAssetGUID];
        [v41 setAssetIdentifier:v42];

        [v41 setAssetFlag:v40];
        v43 = [v39 master];
        v44 = [v43 scopedIdentifier];

        v45 = [v44 identifier];
        [v41 setMasterFingerprint:v45];
        [v33 addAsset:v41];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v36);
  }

  [v48 setCustomUserAssetList:v33];
  return v48;
}

- (id)scopedIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F59968]);
  __int16 v4 = [(PLMemory *)self scopeIdentifier];
  id v5 = [(PLMemory *)self uuid];
  uint64_t v6 = (void *)[v3 initWithScopeIdentifier:v4 identifier:v5];

  return v6;
}

- (id)scopeIdentifier
{
  v2 = [(PLManagedObject *)self photoLibrary];
  id v3 = [v2 mainScopeIdentifier];

  return v3;
}

- (void)setKeyAsset:(id)a3
{
  id v6 = a3;
  [(PLMemory *)self willAccessValueForKey:@"keyAsset"];
  __int16 v4 = [(PLMemory *)self primitiveValueForKey:@"keyAsset"];
  [(PLMemory *)self didAccessValueForKey:@"keyAsset"];
  if (([v6 isEqual:v4] & 1) == 0)
  {
    [(PLMemory *)self willChangeValueForKey:@"keyAsset"];
    id v5 = v6;
    if (!v5)
    {
      if ([(PLMemory *)self isDeleted])
      {
        id v5 = 0;
      }
      else
      {
        id v5 = [(PLMemory *)self calculateKeyAsset];
      }
    }
    [(PLMemory *)self setPrimitiveValue:v5 forKey:@"keyAsset"];
    [(PLMemory *)self didChangeValueForKey:@"keyAsset"];
  }
}

- (id)calculateKeyAsset
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  [(PLMemory *)self allAvailableAssets];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isDeleted", (void)v10) & 1) == 0
          && ([v8 hidden] & 1) == 0
          && ![v8 trashedState]
          && [v8 avalanchePickTypeIsVisible])
        {
          id v5 = v8;
          goto LABEL_14;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v5;
}

- (void)calculateSyndicatedContentState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  [(PLMemory *)self allAvailableAssets];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "savedAssetType", (void)v9);
        if (v8 == [MEMORY[0x1E4F8BA10] savedAssetTypeForPromoteToGuestAsset])
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if ([(PLMemory *)self syndicatedContentState] != v5) {
    [(PLMemory *)self setSyndicatedContentState:v5];
  }
}

- (id)allAvailableAssets
{
  uint64_t v17 = [(PLMemory *)self curatedAssets];
  id v3 = [v17 allObjects];
  v16 = [(PLMemory *)self representativeAssets];
  uint64_t v14 = [v16 allObjects];
  id v4 = [(PLMemory *)self extendedCuratedAssets];
  uint64_t v5 = [v4 allObjects];
  uint64_t v6 = [(PLMemory *)self userCuratedAssets];
  char v7 = [v6 allObjects];
  int v8 = [(PLMemory *)self customUserAssets];
  long long v9 = [v8 array];
  long long v10 = [v7 arrayByAddingObjectsFromArray:v9];
  long long v11 = [v5 arrayByAddingObjectsFromArray:v10];
  long long v12 = [v14 arrayByAddingObjectsFromArray:v11];
  id v15 = [v3 arrayByAddingObjectsFromArray:v12];

  return v15;
}

- (BOOL)hasAnyAssets
{
  id v3 = [(PLMemory *)self curatedAssets];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(PLMemory *)self representativeAssets];
    if ([v5 count])
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v6 = [(PLMemory *)self extendedCuratedAssets];
      if ([v6 count])
      {
        BOOL v4 = 1;
      }
      else
      {
        char v7 = [(PLMemory *)self userCuratedAssets];
        if ([v7 count])
        {
          BOOL v4 = 1;
        }
        else
        {
          int v8 = [(PLMemory *)self customUserAssets];
          BOOL v4 = [v8 count] != 0;
        }
      }
    }
  }

  return v4;
}

- (BOOL)updateWithCPLMemoryChange:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 title];
  [(PLMemory *)self setTitle:v8];

  long long v9 = [v6 subtitle];
  [(PLMemory *)self setSubtitle:v9];

  long long v10 = [v6 creationDate];
  [(PLMemory *)self setCreationDate:v10];

  -[PLMemory setCategory:](self, "setCategory:", (__int16)[v6 category]);
  long long v58 = self;
  -[PLMemory setSubcategory:](self, "setSubcategory:", (__int16)[v6 subcategory]);
  v51 = v6;
  long long v11 = [v6 assetList];
  long long v12 = [v11 assets];
  uint64_t v13 = [v12 count];

  long long v60 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v13];
  long long v57 = [MEMORY[0x1E4F1CA80] setWithCapacity:v13];
  id v56 = [MEMORY[0x1E4F1CA80] set];
  v55 = [MEMORY[0x1E4F1CA80] set];
  v54 = [MEMORY[0x1E4F1CA80] set];
  v53 = [MEMORY[0x1E4F1CA80] set];
  v49 = v11;
  uint64_t v14 = [v11 assets];
  v48 = [v14 valueForKey:@"assetIdentifier"];
  v50 = v7;
  id v15 = +[PLManagedAsset assetsByCloudAssetUUID:inLibrary:](PLManagedAsset, "assetsByCloudAssetUUID:inLibrary:");
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v66;
    char v59 = 1;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v66 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        v22 = [v21 assetFlag];
        id v23 = [v21 assetIdentifier];
        id v24 = [v21 assetMovieData];
        if (v23)
        {
          v25 = [v15 objectForKey:v23];
          if (v25)
          {
            if ([v22 isRepresentative]) {
              [v57 addObject:v25];
            }
            if ([v22 isCurated]) {
              [v56 addObject:v25];
            }
            if ([v22 isExtendedCurated]) {
              [v55 addObject:v25];
            }
            if ([v22 isMovieCurated]) {
              [v54 addObject:v25];
            }
            if ([v22 isUserCurated]) {
              [v53 addObject:v25];
            }
            if ([v22 isKeyAsset]) {
              [(PLMemory *)v58 setKeyAsset:v25];
            }
            if (v24)
            {
              v26 = [v25 uuid];
              [v60 setObject:v24 forKey:v26];
            }
          }
          else
          {
            char v59 = 0;
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v18);
  }
  else
  {
    char v59 = 1;
  }

  [(PLMemory *)v58 setRepresentativeAssets:v57];
  [(PLMemory *)v58 setCuratedAssets:v56];
  [(PLMemory *)v58 setExtendedCuratedAssets:v55];
  [(PLMemory *)v58 setMovieCuratedAssets:v54];
  [(PLMemory *)v58 setUserCuratedAssets:v53];
  [(PLMemory *)v58 setMovieAssetState:v60];
  v47 = [v51 customUserAssetList];
  v27 = [v47 assets];
  v46 = [v27 valueForKey:@"assetIdentifier"];
  id v28 = +[PLManagedAsset assetsByCloudAssetUUID:inLibrary:](PLManagedAsset, "assetsByCloudAssetUUID:inLibrary:");
  v52 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v27, "count"));
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v29 = v27;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v62 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v61 + 1) + 8 * j);
        uint64_t v35 = [v34 assetFlag];
        uint64_t v36 = [v34 assetIdentifier];
        if (v36)
        {
          uint64_t v37 = [v28 objectForKey:v36];
          if (v37 && [v35 isCustomUserAsset]) {
            [v52 addObject:v37];
          }
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v31);
  }

  [(PLMemory *)v58 setCustomUserAssets:v52];
  v38 = [v51 graphData];
  [(PLMemory *)v58 setPhotosGraphData:v38];
  [(PLMemory *)v58 _cacheMemoryPropertiesForUIPerformanceWithPhotosGraphData:v38];
  -[PLMemory setPhotosGraphVersion:](v58, "setPhotosGraphVersion:", [v51 graphVersion]);
  v39 = [v51 movieData];
  [(PLMemory *)v58 setMovieData:v39];

  [v51 score];
  -[PLMemory setScore:](v58, "setScore:");
  -[PLMemory setFavorite:](v58, "setFavorite:", [v51 isFavorite]);
  -[PLMemory setRejected:](v58, "setRejected:", [v51 isRejected]);
  -[PLMemory setUserActionOptions:](v58, "setUserActionOptions:", (unsigned __int16)[v51 userActionOptions]);
  id v40 = [v51 assetListPredicate];
  [(PLMemory *)v58 setAssetListPredicate:v40];

  -[PLMemory setNotificationState:](v58, "setNotificationState:", (__int16)[v51 notificationState]);
  id v41 = [v51 blacklistedFeature];
  [(PLMemory *)v58 setBlacklistedFeature:v41];

  uint64_t v42 = [v51 playCount];
  if (v42 >= 1) {
    [(PLMemory *)v58 setPlayCount:v42];
  }
  uint64_t v43 = [v51 shareCount];
  if (v43) {
    [(PLMemory *)v58 setShareCount:v43];
  }
  uint64_t v44 = [v51 viewCount];
  if (v44 >= 1) {
    [(PLMemory *)v58 setViewCount:v44];
  }
  if (objc_msgSend((id)objc_opt_class(), "_isGenerativeMemoryWithUserActionOptions:", -[PLMemory userActionOptions](v58, "userActionOptions")))-[PLMemory setCreationType:](v58, "setCreationType:", 1); {
  [(PLMemory *)v58 setPendingState:0];
  }
  [(PLMemory *)v58 setCloudLocalState:1];

  return v59 & 1;
}

- (void)_cacheMemoryPropertiesForUIPerformanceWithPhotosGraphData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F28DC0];
    BOOL v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = a3;
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    id v25 = 0;
    uint64_t v14 = [v3 unarchivedObjectOfClasses:v13 fromData:v5 error:&v25];

    id v15 = v25;
    if (v14)
    {
      id v16 = [v14 objectForKeyedSubscript:@"storyColorGradeKind"];
      uint64_t v17 = [v16 integerValue];

      if (!v17)
      {
        uint64_t v18 = [v14 objectForKeyedSubscript:@"storyColorGradeCategory"];
        uint64_t v17 = PFStoryColorGradeKindDefaultForColorGradeCategory();
      }
      if (v17 != (int)[(PLMemory *)self storyColorGradeKind]) {
        [(PLMemory *)self setStoryColorGradeKind:(__int16)v17];
      }
      uint64_t v19 = [v14 objectForKeyedSubscript:@"storyTitleCategory"];
      uint64_t SerializedTitleCategory = PFStoryTitleCategoryGetSerializedTitleCategory();

      if (SerializedTitleCategory != (int)[(PLMemory *)self storySerializedTitleCategory])[(PLMemory *)self setStorySerializedTitleCategory:(__int16)SerializedTitleCategory]; {
      uint64_t v21 = [v14 objectForKeyedSubscript:@"graphMemoryIdentifier"];
      }
      if (v21)
      {
        v22 = [(PLMemory *)self graphMemoryIdentifier];
        char v23 = [v21 isEqualToString:v22];

        if ((v23 & 1) == 0) {
          [(PLMemory *)self setGraphMemoryIdentifier:v21];
        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v15;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error unarchiving photosGraphData from Memory: %@", buf, 0xCu);
    }
  }
}

- (int64_t)cloudDeletionType
{
  return 3;
}

- (void)recalculateStartAndEndDates
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(PLMemory *)self representativeAssets];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dateCreated];
        uint64_t v11 = v10;
        if (v10)
        {
          if (!v7 || [v10 compare:v7] == -1)
          {
            id v12 = v11;

            uint64_t v7 = v12;
            if (!v6)
            {
LABEL_13:
              id v13 = v11;

              uint64_t v6 = v13;
              goto LABEL_14;
            }
          }
          else if (!v6)
          {
            goto LABEL_13;
          }
          if ([v11 compare:v6] != 1) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }
LABEL_14:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (!v5) {
        goto LABEL_18;
      }
    }
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
LABEL_18:

  [(PLManagedObject *)self pl_safeSetValue:v7 forKey:@"startDate" valueDidChangeHandler:0];
  [(PLManagedObject *)self pl_safeSetValue:v6 forKey:@"endDate" valueDidChangeHandler:0];
}

- (void)recalculateUserActionOptionsBit
{
  int v3 = [(PLMemory *)self userActionOptions];
  uint64_t v4 = [(PLMemory *)self userFeedbacks];
  BOOL v5 = [v4 count] != 0;

  unsigned int v6 = v3 & 0xFFFFFFF9 | (2 * v5) | (4 * ([(PLMemory *)self creationType] == 1));
  if ([(PLMemory *)self userActionOptions] != v6)
  {
    [(PLMemory *)self setUserActionOptions:(unsigned __int16)v6];
  }
}

- (BOOL)isUserCreatedMemory
{
  int v3 = objc_opt_class();
  uint64_t v4 = [(PLMemory *)self userActionOptions];
  return [v3 isUserCreatedMemoryWithUserActionOptions:v4];
}

- (void)prepareForDeletion
{
  v8.receiver = self;
  v8.super_class = (Class)PLMemory;
  [(PLManagedObject *)&v8 prepareForDeletion];
  int v3 = [(PLMemory *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[PLDelayedSearchIndexUpdates recordMemoryIfNeeded:self];
    if (([v3 mergingChanges] & 1) == 0)
    {
      [v3 recordCloudDeletionForObject:self];
      uint64_t v4 = [(PLMemory *)self uuid];
      if (!v4 || ![(PLMemory *)self isValidForPersistence]) {
        goto LABEL_7;
      }
      BOOL v5 = [(PLMemory *)self managedObjectContext];
      char v6 = [v5 isReadOnly];

      if ((v6 & 1) == 0)
      {
        uint64_t v4 = [(PLManagedObject *)self photoLibrary];
        uint64_t v7 = [v4 pathManager];
        [(PLMemory *)self removePersistedFileSystemDataWithPathManager:v7];

LABEL_7:
      }
    }
  }
}

- (void)didSave
{
  v6.receiver = self;
  v6.super_class = (Class)PLMemory;
  [(PLManagedObject *)&v6 didSave];
  if ([(PLMemory *)self needsPersistenceUpdate])
  {
    int v3 = [(PLMemory *)self uuid];
    if (!v3 || ([(PLMemory *)self isDeleted] & 1) != 0) {
      goto LABEL_6;
    }
    BOOL v4 = [(PLMemory *)self isValidForPersistence];

    if (v4)
    {
      int v3 = [(PLManagedObject *)self photoLibrary];
      BOOL v5 = [v3 pathManager];
      [(PLMemory *)self persistMetadataToFileSystemWithPathManager:v5];

LABEL_6:
    }
  }
  [(PLMemory *)self setNeedsPersistenceUpdate:0];
}

- (void)delete
{
  id v3 = [(PLMemory *)self managedObjectContext];
  [v3 deleteObject:self];
}

- (void)willSave
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)PLMemory;
  [(PLManagedObject *)&v36 willSave];
  id v3 = [(PLMemory *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_72;
  }
  [(PLMemory *)self setNeedsPersistenceUpdate:0];
  BOOL v4 = [(PLMemory *)self changedValues];
  if ([(PLMemory *)self isInserted])
  {
    if ([(PLMemory *)self pendingState] == 3)
    {
      BOOL v5 = [(PLMemory *)self sourceGeneratedMemory];

      if (!v5) {
        [(PLMemory *)self _attachUserEditToNearestSourceMemory];
      }
    }
  }
  if (([(PLMemory *)self isDeleted] & 1) == 0)
  {
    uint64_t v6 = [(PLMemory *)self targetUserEditedMemory];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      objc_super v8 = [v4 objectForKeyedSubscript:@"representativeAssets"];

      if (v8) {
        [(PLMemory *)self _propagateRepresentativeAssetsToTargetUserEditMemory];
      }
    }
  }
  if (([(PLMemory *)self isDeleted] & 1) == 0
    && [(PLMemory *)self pendingState] == 3)
  {
    uint64_t v9 = [v4 objectForKeyedSubscript:@"userRemovedAssets"];

    if (v9) {
      [(PLMemory *)self _updateCompiledAssetsAfterUserRemovedAssetsChange];
    }
  }
  if (([(PLMemory *)self isDeleted] & 1) == 0
    && ([(PLMemory *)self rejected] & 1) == 0
    && ![(PLMemory *)self hasAnyAssets])
  {
    [(PLMemory *)self delete];
  }
  uint64_t v10 = [v4 objectForKeyedSubscript:@"cloudLocalState"];
  if (v10) {
    BOOL v11 = [v4 count] == 1;
  }
  else {
    BOOL v11 = 0;
  }

  if (([(PLMemory *)self isDeleted] & 1) == 0
    && [(PLMemory *)self isValidForPersistence]
    && (([(PLMemory *)self isInserted] & 1) != 0 || !v11))
  {
    [(PLMemory *)self setNeedsPersistenceUpdate:1];
  }
  [(PLMemory *)self _recalculateSharingCompositionIfNeeded];
  if (PLPlatformSearchSupported() && PLIsFeaturedContentAllowed())
  {
    id v12 = [v3 delayedSaveActions];
    [v12 recordMemoryForSearchIndexUpdate:self];
  }
  if (([(PLMemory *)self isDeleted] & 1) == 0) {
    +[PLDelayedSearchIndexUpdates recordMemoryIfNeeded:self];
  }
  id v13 = [v4 objectForKeyedSubscript:@"rejected"];
  if (([(PLMemory *)self isDeleted] & 1) != 0 || v13)
  {
    long long v14 = [v3 delayedSaveActions];
    [v14 recordMemoryForDuetDelete:self];
  }
  int v15 = [(PLMemory *)self isDeleted];
  long long v16 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (v15
    && [(PLMemory *)self featuredState] == 1
    && ![(PLMemory *)self pendingState])
  {
    if (!*v16)
    {
      long long v17 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [(PLMemory *)self uuid];
        *(_DWORD *)buf = 138543362;
        v38 = v18;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Recording ForYou widget timeline invalidation due to featured memory %{public}@ being deleted", buf, 0xCu);
      }
    }
    uint64_t v19 = [v3 delayedSaveActions];
    [v19 recordWidgetTimelineReloadNeededForType:0];
  }
  if ([(PLMemory *)self rejected]
    && [(PLMemory *)self featuredState] == 1)
  {
    [(PLMemory *)self setFeaturedState:0];
    if (!*v16)
    {
      uint64_t v20 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [(PLMemory *)self uuid];
        *(_DWORD *)buf = 138543362;
        v38 = v21;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Recording ForYou widget timeline invalidation due to featured memory %{public}@ being rejected", buf, 0xCu);
      }
    }
    v22 = [v3 delayedSaveActions];
    [v22 recordWidgetTimelineReloadNeededForType:0];
  }
  if (([(PLMemory *)self isInserted] & 1) == 0)
  {
    char v23 = [v4 objectForKeyedSubscript:@"title"];
    if (v23)
    {
    }
    else
    {
      id v24 = [v4 objectForKeyedSubscript:@"subtitle"];

      if (!v24) {
        goto LABEL_58;
      }
    }
    if (!*v16)
    {
      id v25 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [(PLMemory *)self uuid];
        *(_DWORD *)buf = 138543362;
        v38 = v26;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Recording ForYou widget timeline invalidation due to title/subtitle change %{public}@", buf, 0xCu);
      }
    }
    id v27 = [v3 delayedSaveActions];
    [v27 recordWidgetTimelineReloadNeededForType:0];
  }
LABEL_58:
  uint64_t v28 = [v4 objectForKeyedSubscript:@"userFeedbacks"];
  if (v28)
  {
    if (!*v16)
    {
      id v29 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = [(PLMemory *)self uuid];
        *(_DWORD *)buf = 138543362;
        v38 = v30;
        _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "Updating featured content due to changes on user feedback for memory %{public}@", buf, 0xCu);
      }
    }
    uint64_t v31 = [v3 delayedSaveActions];
    [v31 recordFeaturedContentUpdateNeededForPersonUUID:0];

    [(PLMemory *)self recalculateUserActionOptionsBit];
  }
  uint64_t v32 = [v4 objectForKeyedSubscript:@"curatedAssets"];
  if (v32
    || ([v4 objectForKeyedSubscript:@"representativeAssets"],
        (uint64_t v32 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_67:
    id v33 = [v3 delayedSaveActions];
    [v33 recordMemoryAssetsUpdate:self];

    goto LABEL_68;
  }
  uint64_t v35 = [v4 objectForKeyedSubscript:@"extendedCuratedAssets"];

  if (v35) {
    goto LABEL_67;
  }
LABEL_68:
  if (([(PLMemory *)self isDeleted] & 1) == 0)
  {
    v34 = [v4 objectForKeyedSubscript:@"representativeAssets"];

    if (v34) {
      [(PLMemory *)self recalculateStartAndEndDates];
    }
  }

LABEL_72:
}

- (BOOL)isSyncableChange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  long long v14 = __28__PLMemory_isSyncableChange__block_invoke;
  int v15 = &unk_1E5875CE0;
  long long v16 = self;
  pl_dispatch_once();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(PLMemory *)self changedValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([(id)isSyncableChange_syncedProperties_100700 containsObject:*(void *)(*((void *)&v8 + 1) + 8 * i)])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

void __28__PLMemory_isSyncableChange__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"title", @"subtitle", @"creationDate", @"category", @"subcategory", @"rejected", @"favorite", @"pendingState", @"syndicatedContentState", @"userActionOptions", @"movieAssetState", @"movieData", @"photosGraphVersion", @"photosGraphData", @"keyAsset", @"score", @"assetListPredicate",
         @"representativeAssets",
         @"curatedAssets",
         @"extendedCuratedAssets",
         @"movieCuratedAssets",
         @"userCuratedAssets",
         @"customUserAssets",
         @"notificationState",
         @"blacklistedFeature",
         @"playCount",
         @"shareCount",
         @"viewCount",
         @"userFeedbacks",
         0);
  v1 = (void *)isSyncableChange_syncedProperties_100700;
  isSyncableChange_syncedProperties_100700 = v0;
}

- (BOOL)supportsCloudUpload
{
  return ![(PLMemory *)self pendingState]
      && [(PLMemory *)self syndicatedContentState] == 0;
}

+ (id)_compiledUserEditedAssetsFromSourceMemory:(id)a3 andTargetMemory:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 pendingState] == 3)
  {
    int v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PLMemory.m", 1145, @"Invalid parameter not satisfying: %@", @"sourceMemory.pendingState != PLMemoryPendingStateUserEdit" object file lineNumber description];
  }
  long long v9 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v10 = [v7 customUserAssets];
  [v9 unionOrderedSet:v10];

  long long v11 = [v7 representativeAssets];
  [v9 unionSet:v11];

  uint64_t v12 = [v8 representativeAssets];

  [v9 unionSet:v12];
  uint64_t v13 = [v7 userRemovedAssets];

  [v9 minusSet:v13];
  return v9;
}

+ (id)_findCollectionMostSimilarToCollectionWithAssets:(id)a3 additionalPredicate:(id)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v64 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v73 objects:v85 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v74 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v73 + 1) + 8 * i) objectID];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v73 objects:v85 count:16];
      }
      while (v10);
    }

    long long v14 = +[PLMemory fetchRequest];
    int v15 = [v8 anyObject];
    long long v16 = [v15 managedObjectContext];

    long long v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K in %@", @"representativeAssets", v8];
    [v14 setPredicate:v17];

    long long v62 = v7;
    uint64_t v18 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"SUBQUERY(%K, $a, $a IN %@).@count", @"representativeAssets", v7];
    id v19 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v19 setName:@"matchCount"];
    char v59 = (void *)v18;
    [v19 setExpression:v18];
    [v19 setExpressionResultType:200];
    uint64_t v20 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"representativeAssets"];
    uint64_t v21 = (void *)MEMORY[0x1E4F28C68];
    long long v57 = (void *)v20;
    uint64_t v84 = v20;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
    uint64_t v23 = [v21 expressionForFunction:@"count:" arguments:v22];

    id v24 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v24 setName:@"count"];
    id v56 = (void *)v23;
    [v24 setExpression:v23];
    [v24 setExpressionResultType:200];
    v83[0] = @"objectID";
    v83[1] = v19;
    long long v58 = v19;
    v55 = v24;
    v83[2] = v24;
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:3];
    [v14 setPropertiesToFetch:v25];

    [v14 setPropertiesToGroupBy:&unk_1EEBF2318];
    [v14 setResultType:2];
    if (v6)
    {
      v26 = (void *)MEMORY[0x1E4F28BA0];
      id v27 = [v14 predicate];
      v82[0] = v27;
      v82[1] = v6;
      uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
      id v29 = [v26 andPredicateWithSubpredicates:v28];
      [v14 setPredicate:v29];
    }
    id v63 = v6;
    id v72 = 0;
    long long v60 = v16;
    long long v61 = v14;
    uint64_t v30 = [v16 executeFetchRequest:v14 error:&v72];
    id v54 = v72;
    long long v66 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v30, "count"));
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    obuint64_t j = v30;
    uint64_t v31 = [obj countByEnumeratingWithState:&v68 objects:v81 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v69 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = *(void **)(*((void *)&v68 + 1) + 8 * j);
          v79[0] = @"objectID";
          objc_super v36 = objc_msgSend(v35, "objectForKeyedSubscript:");
          v80[0] = v36;
          v79[1] = @"matchCount";
          uint64_t v37 = [v35 objectForKeyedSubscript:@"matchCount"];
          v80[1] = v37;
          v79[2] = @"nonMatchCount";
          v38 = NSNumber;
          uint64_t v39 = [v35 objectForKeyedSubscript:@"count"];
          uint64_t v40 = [v39 integerValue];
          id v41 = [v35 objectForKeyedSubscript:@"matchCount"];
          uint64_t v42 = objc_msgSend(v38, "numberWithInteger:", v40 - objc_msgSend(v41, "integerValue"));
          v80[2] = v42;
          uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:3];

          [v66 addObject:v43];
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v68 objects:v81 count:16];
      }
      while (v32);
    }

    uint64_t v44 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"matchCount" ascending:0];
    v78[0] = v44;
    v45 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"nonMatchCount" ascending:1];
    v78[1] = v45;
    v46 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
    v78[2] = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:3];
    [v66 sortUsingDescriptors:v47];

    v48 = [v66 firstObject];
    v49 = [v48 objectForKeyedSubscript:@"objectID"];

    if (v49)
    {
      uint64_t v67 = 0;
      v50 = v60;
      v51 = [v60 existingObjectWithID:v49 error:&v67];
      v52 = v62;
      id v6 = v63;
    }
    else
    {
      v51 = 0;
      v52 = v62;
      id v6 = v63;
      v50 = v60;
    }

    id v5 = v64;
  }
  else
  {
    v52 = PLBackendGetLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_ERROR, "Cannot find collection similar to an empty collection.", buf, 2u);
    }
    v51 = 0;
  }

  return v51;
}

+ (void)_deepCopyFromMemory:(id)a3 toMemory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PLMemory.m", 1056, @"Invalid parameter not satisfying: %@", @"sourceMemory" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLMemory.m", 1057, @"Invalid parameter not satisfying: %@", @"targetMemory" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = +[PLMemory entity];
  uint64_t v11 = [v10 attributesByName];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __41__PLMemory__deepCopyFromMemory_toMemory___block_invoke;
  v23[3] = &unk_1E5872520;
  id v12 = v7;
  id v24 = v12;
  id v13 = v9;
  id v25 = v13;
  [v11 enumerateKeysAndObjectsUsingBlock:v23];

  long long v14 = +[PLMemory entity];
  int v15 = [v14 relationshipsByName];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __41__PLMemory__deepCopyFromMemory_toMemory___block_invoke_2;
  v20[3] = &unk_1E5872A70;
  id v21 = v12;
  id v22 = v13;
  id v16 = v13;
  id v17 = v12;
  [v15 enumerateKeysAndObjectsUsingBlock:v20];
}

void __41__PLMemory__deepCopyFromMemory_toMemory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  objc_msgSend(*(id *)(a1 + 40), "pl_safeSetValue:forKey:valueDidChangeHandler:", v5, v4, 0);
}

void __41__PLMemory__deepCopyFromMemory_toMemory___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  objc_msgSend(*(id *)(a1 + 40), "pl_safeSetValue:forKey:valueDidChangeHandler:", v5, v4, 0);
}

+ (id)_predicateForTargetUserEditMemories
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d AND %K = nil", @"pendingState", 3, @"sourceGeneratedMemory");
}

+ (id)_predicateForSourceGeneratedMemories
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d AND %K = nil", @"pendingState", 3, @"targetUserEditedMemory");
}

+ (id)predicateForSharedOnlyCollectionsWithinSubset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PLMemory.m", 1030, @"Invalid parameter not satisfying: %@", @"collections" object file lineNumber description];
  }
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@ AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0) AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0)", v5, @"extendedCuratedAssets", 0x1EEB30000, 0, @"userCuratedAssets", 0x1EEB30000, 0];

  return v6;
}

+ (id)predicateForPrivateOnlyCollectionsWithinSubset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PLMemory.m", 1020, @"Invalid parameter not satisfying: %@", @"collections" object file lineNumber description];
  }
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@ AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0) AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0)", v5, @"extendedCuratedAssets", @"activeLibraryScopeParticipationState", 1, @"userCuratedAssets", @"activeLibraryScopeParticipationState", 1];

  return v6;
}

+ (signed)_calculateSharingCompositionForMemory:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = [v3 extendedCuratedAssets];
  id v6 = [v4 setWithSet:v5];

  id v7 = [v3 customUserAssets];
  id v8 = [v7 set];
  [v6 unionSet:v8];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v10)
  {

LABEL_14:
    signed __int16 v16 = 0;
    goto LABEL_15;
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v19 != v14) {
        objc_enumerationMutation(v9);
      }
      v13 += objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "hasLibraryScope", (void)v18);
    }
    v12 += v11;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v11);

  if (v12 == v13) {
    signed __int16 v16 = 1;
  }
  else {
    signed __int16 v16 = 2;
  }
  if (!v13) {
    goto LABEL_14;
  }
LABEL_15:

  return v16;
}

+ (id)memoriesContainingAsset:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 memoriesBeingCuratedAssets];
  [v5 unionSet:v6];

  id v7 = [v4 memoriesBeingExtendedCuratedAssets];
  [v5 unionSet:v7];

  id v8 = [v4 memoriesBeingUserCuratedAssets];
  [v5 unionSet:v8];

  id v9 = [v4 memoriesBeingRepresentativeAssets];
  [v5 unionSet:v9];

  uint64_t v10 = [v4 memoriesBeingCustomUserAssets];

  [v5 unionSet:v10];
  return v5;
}

+ (id)keyPathsForMemoriesBeingAssets
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"memoriesBeingCuratedAssets";
  v4[1] = @"memoriesBeingExtendedCuratedAssets";
  v4[2] = @"memoriesBeingUserCuratedAssets";
  void v4[3] = @"memoriesBeingRepresentativeAssets";
  v4[4] = @"memoriesBeingCustomUserAssets";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return v2;
}

+ (id)memoryObjectIDsContainingAsset:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 objectIDsForRelationshipNamed:@"memoriesBeingCuratedAssets"];
  [v5 addObjectsFromArray:v6];

  id v7 = [v4 objectIDsForRelationshipNamed:@"memoriesBeingExtendedCuratedAssets"];
  [v5 addObjectsFromArray:v7];

  id v8 = [v4 objectIDsForRelationshipNamed:@"memoriesBeingUserCuratedAssets"];
  [v5 addObjectsFromArray:v8];

  id v9 = [v4 objectIDsForRelationshipNamed:@"memoriesBeingRepresentativeAssets"];
  [v5 addObjectsFromArray:v9];

  uint64_t v10 = [v4 objectIDsForRelationshipNamed:@"memoriesBeingCustomUserAssets"];

  [v5 addObjectsFromArray:v10];
  return v5;
}

+ (void)deleteAllMemoriesInPhotoLibrary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v6 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Removing ALL memories", buf, 2u);
    }
  }
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = [a1 entityName];
  id v9 = [v7 fetchRequestWithEntityName:v8];

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v9];
  [v10 setResultType:2];
  uint64_t v11 = [v4 managedObjectContext];
  id v16 = 0;
  uint64_t v12 = [v11 executeRequest:v10 error:&v16];
  id v13 = v16;

  if (v12)
  {
    if (!*v5)
    {
      uint64_t v14 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [v12 result];
        *(_DWORD *)buf = 138412290;
        id v18 = v15;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Batch deleted %@ Memories", buf, 0xCu);
      }
LABEL_12:
    }
  }
  else if (!*v5)
  {
    uint64_t v14 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to batch delete Memories: %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
}

+ (void)deleteMemoriesWithObjectIDs:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v8 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v9;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Removing %@ memories", buf, 0xCu);
      }
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v11 = [v6 allObjects];
    uint64_t v12 = [v10 predicateWithFormat:@"SELF IN %@", v11];

    [a1 _deleteMemoriesMatchingPredicate:v12 inManagedObjectContext:v7];
  }
}

+ (void)deletePendingMemoriesCreatedBefore:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v8 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Removing pending memories created before %@", buf, 0xCu);
    }
  }
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"pendingState == %d and creationDate < %@", 1, v6];
  uint64_t v10 = [v7 managedObjectContext];
  [a1 _deleteMemoriesMatchingPredicate:v9 inManagedObjectContext:v10];
}

+ (unint64_t)_deleteMemoriesMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F38D3B0]();
  id v9 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v10 = [a1 entityName];
  uint64_t v11 = [v9 fetchRequestWithEntityName:v10];

  [v11 setPredicate:v6];
  unint64_t v19 = 0;
  id v12 = [v7 enumerateObjectsFromFetchRequest:v11 count:&v19 batchSize:100 usingBlock:&__block_literal_global_100882];
  if (v12)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v13 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        unint64_t v21 = (unint64_t)v12;
        uint64_t v14 = "Error fetching suggestions: %{public}@";
        uint64_t v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_19B3C7000, v15, v16, v14, buf, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v13 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      unint64_t v21 = v19;
      uint64_t v14 = "Deleted %{public}lu memories";
      uint64_t v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
LABEL_9:
  }
  unint64_t v17 = v19;

  return v17;
}

uint64_t __68__PLMemory__deleteMemoriesMatchingPredicate_inManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 delete];
}

+ (void)resetCloudStateInPhotoLibrary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = objc_alloc(MEMORY[0x1E4F1C038]);
  id v7 = [a1 entityName];
  id v8 = (void *)[v6 initWithEntityName:v7];

  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"cloudLocalState != %d", 0);
  [v8 setResultType:2];
  [v8 setPropertiesToUpdate:&unk_1EEBF2A18];
  [v8 setPredicate:v9];
  uint64_t v10 = [v4 managedObjectContext];
  id v15 = 0;
  uint64_t v11 = [v10 executeRequest:v8 error:&v15];
  id v12 = v15;

  if (v11)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v13 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v11 result];
        *(_DWORD *)buf = 138412290;
        id v17 = v14;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Batch updated %@ Memories", buf, 0xCu);
      }
LABEL_8:
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v13 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to batch update Memories: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
}

+ (id)_memoriesMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(int64_t)a5 inPhotoLibrary:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__100899;
  v34 = __Block_byref_object_dispose__100900;
  id v35 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __76__PLMemory__memoriesMatchingPredicate_sortDescriptors_limit_inPhotoLibrary___block_invoke;
  uint64_t v23 = &unk_1E5874728;
  id v28 = a1;
  id v13 = v10;
  id v24 = v13;
  id v14 = v11;
  int64_t v29 = a5;
  id v25 = v14;
  id v27 = &v30;
  id v15 = v12;
  id v26 = v15;
  [v15 performBlockAndWait:&v20];
  os_log_type_t v16 = (void *)v31[5];
  if (v16)
  {
    id v17 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1C978], "array", v20, v21, v22, v23, v24, v25);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v18 = v17;

  _Block_object_dispose(&v30, 8);
  return v18;
}

void __76__PLMemory__memoriesMatchingPredicate_sortDescriptors_limit_inPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = [*(id *)(a1 + 64) entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  [v4 setFetchBatchSize:100];
  [v4 setPredicate:*(void *)(a1 + 32)];
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v4, "setSortDescriptors:");
  }
  if (*(uint64_t *)(a1 + 72) >= 1) {
    objc_msgSend(v4, "setFetchLimit:");
  }
  id v5 = [*(id *)(a1 + 48) managedObjectContext];
  id v12 = 0;
  uint64_t v6 = [v5 executeFetchRequest:v4 error:&v12];
  id v7 = v12;
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
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
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch memories: %@", buf, 0xCu);
    }
  }
}

+ (unint64_t)countOfMemoriesCreatedTodayWithNotificationStateRequestedOrSeenInPhotoLibrary:(id)a3 excludingMemory:(id)a4 error:(id *)a5
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F1C9A8];
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [v7 currentCalendar];
  id v11 = [MEMORY[0x1E4F1C9C8] date];
  id v12 = [v10 startOfDayForDate:v11];

  id v13 = [v12 dateByAddingTimeInterval:86400.0];
  id v14 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v15 = [v8 uuid];

  os_log_type_t v16 = [v14 predicateWithFormat:@"%K != %@", @"uuid", v15];

  id v17 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d || %K == %d", @"notificationState", 1, @"notificationState", 2);
  uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@ AND %K < %@", @"creationDate", v12, @"creationDate", v13];
  unint64_t v19 = (void *)MEMORY[0x1E4F28BA0];
  v28[0] = v16;
  v28[1] = v17;
  v28[2] = v18;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  uint64_t v21 = [v19 andPredicateWithSubpredicates:v20];

  uint64_t v22 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v23 = +[PLMemory entityName];
  id v24 = [v22 fetchRequestWithEntityName:v23];

  [v24 setPredicate:v21];
  id v25 = [v9 managedObjectContext];

  unint64_t v26 = [v25 countForFetchRequest:v24 error:a5];
  return v26;
}

+ (id)memoriesWithUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"uuid IN %@", a3];
  id v9 = [a1 _memoriesMatchingPredicate:v8 sortDescriptors:0 limit:0 inPhotoLibrary:v7];

  return v9;
}

+ (PLMemory)memoryWithUUID:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"uuid == %@", a3];
  id v9 = [a1 _memoriesMatchingPredicate:v8 sortDescriptors:0 limit:1 inPhotoLibrary:v7];

  BOOL v10 = [v9 firstObject];

  return (PLMemory *)v10;
}

+ (id)memoriesToPrefetchForWidgetInManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = [[PLGlobalValues alloc] initWithManagedObjectContext:v4];
  if ([(PLGlobalValues *)v5 shouldPrefetchWidgetResources])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NO AND %K == %d", @"rejected", @"featuredState", 1);
    id v7 = [v4 photoLibrary];
    id v8 = [a1 _memoriesMatchingPredicate:v6 sortDescriptors:0 limit:0 inPhotoLibrary:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)memoriesToPrefetchInPhotoLibrary:(id)a3 prefetchConfiguration:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([a1 _shouldPrefetchMemoryMovieCuratedAssetsInPhotoLibrary:v6 prefetchConfiguration:v7])
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = objc_msgSend(v8, "dateByAddingTimeInterval:", (double)-objc_msgSend(v7, "memoryPrefetchIfCreationDateWithin"));

    BOOL v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NO AND (%K >= %@) AND %K == %d", @"rejected", @"creationDate", v9, @"featuredState", 1];
    id v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
    v15[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

    id v13 = objc_msgSend(a1, "_memoriesMatchingPredicate:sortDescriptors:limit:inPhotoLibrary:", v10, v12, objc_msgSend(v7, "memoryPrefetchLimit"), v6);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (BOOL)_shouldPrefetchMemoryMovieCuratedAssetsInPhotoLibrary:(id)a3 prefetchConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v9 = [v8 BOOLForKey:@"PLForceMemoryPrefetching"];

  if (v9)
  {
    BOOL v10 = 1;
    *((unsigned char *)v18 + 24) = 1;
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__PLMemory__shouldPrefetchMemoryMovieCuratedAssetsInPhotoLibrary_prefetchConfiguration___block_invoke;
    v12[3] = &unk_1E5873DC0;
    id v13 = v7;
    id v16 = a1;
    id v14 = v6;
    uint64_t v15 = &v17;
    [v14 performBlockAndWait:v12];

    BOOL v10 = *((unsigned char *)v18 + 24) != 0;
  }
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __88__PLMemory__shouldPrefetchMemoryMovieCuratedAssetsInPhotoLibrary_prefetchConfiguration___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  objc_msgSend(v2, "dateByAddingTimeInterval:", (double)-objc_msgSend(*(id *)(a1 + 32), "memoryPrefetchAllowedIfLastViewedDateWithin"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"lastViewedDate", v5];
  id v4 = [*(id *)(a1 + 56) _memoriesMatchingPredicate:v3 sortDescriptors:0 limit:1 inPhotoLibrary:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 count] != 0;
}

+ (id)memoriesToUploadInPhotoLibrary:(id)a3 limit:(int64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  id v8 = objc_msgSend(v6, "predicateWithFormat:", @"%K == %d and %K == %d and %K == %d", @"pendingState", 0, @"cloudLocalState", 0, @"syndicatedContentState", 0);
  int v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v13[0] = v9;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  id v11 = [a1 _memoriesMatchingPredicate:v8 sortDescriptors:v10 limit:a4 inPhotoLibrary:v7];

  return v11;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)@"uuid";
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 3;
}

+ (BOOL)_isGenerativeMemoryWithUserActionOptions:(unsigned __int16)a3
{
  return (a3 >> 2) & 1;
}

+ (id)entityName
{
  return @"Memory";
}

+ (id)insertIntoContext:(id)a3 withUUID:(id)a4 title:(id)a5 subtitle:(id)a6 creationDate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    uint64_t v18 = [a1 entityName];
    [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:v18 inManagedObjectContext:v13];
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PLMemory.m", 159, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    uint64_t v18 = [a1 entityName];
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v18, 0, 0);
  uint64_t v19 = };

  if (v19)
  {
    [v19 setUuid:v14];
    [v19 setTitle:v15];
    [v19 setSubtitle:v16];
    [v19 setCreationDate:v17];
  }

  return v19;
}

@end