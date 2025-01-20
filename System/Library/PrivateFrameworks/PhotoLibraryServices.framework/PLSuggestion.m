@interface PLSuggestion
+ (BOOL)_suggestionSubtypeAllowedToContainSyndicatedAssets:(unsigned __int16)a3;
+ (NSString)cloudUUIDKeyForDeletion;
+ (id)_representativeAssetIDsInSuggestion:(id)a3 managedObjectContext:(id)a4;
+ (id)_syncablePredicate;
+ (id)entityName;
+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4;
+ (id)predicateForAllAssetsInSuggestion:(id)a3 managedObjectContext:(id)a4;
+ (id)predicateForAllMomentsFromRepresentativeAssetsInSuggestion:(id)a3 managedObjectContext:(id)a4;
+ (id)predicateForPrivateOnlyCollectionsWithinSubset:(id)a3;
+ (id)predicateForSharedOnlyCollectionsWithinSubset:(id)a3;
+ (id)suggestionObjectIDsContainingAsset:(id)a3;
+ (id)suggestionWithUUID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)suggestionWithUUID:(id)a3 inPhotoLibrary:(id)a4;
+ (id)suggestionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(int64_t)a5 inManagedObjectContext:(id)a6;
+ (id)suggestionsToPrefetchInManagedObjectContext:(id)a3;
+ (id)suggestionsToUploadInPhotoLibrary:(id)a3 limit:(int64_t)a4;
+ (id)suggestionsWithUUIDs:(id)a3 inPhotoLibrary:(id)a4;
+ (int64_t)cloudDeletionTypeForTombstone:(id)a3;
+ (signed)_calculateSharingCompositionForSuggestion:(id)a3;
+ (unint64_t)_deleteSuggestionsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4;
+ (unint64_t)deletePendingSuggestionsCreatedBefore:(id)a3 withTypes:(id)a4 andRejectedAssetsBySuggestionType:(id)a5 inManagedObjectContext:(id)a6;
+ (unint64_t)deleteSuggestionsWithObjectIDs:(id)a3 inManagedObjectContext:(id)a4;
+ (void)resetCloudStateInPhotoLibrary:(id)a3;
- (BOOL)_sharingCompositionNeedsUpdate;
- (BOOL)isEmpty;
- (BOOL)isPending;
- (BOOL)isSyncableChange;
- (BOOL)supportsCloudUpload;
- (BOOL)updateWithCPLSuggestionChange:(id)a3 inPhotoLibrary:(id)a4;
- (id)cplSuggestionChange;
- (id)mutableKeyAssets;
- (id)mutableRepresentativeAssets;
- (id)scopeIdentifier;
- (id)scopedIdentifier;
- (int64_t)cloudDeletionType;
- (signed)sharingComposition;
- (void)_recalculateSharingCompositionIfNeeded;
- (void)delete;
- (void)prepareForDeletion;
- (void)removeRepresentativeAsset:(id)a3;
- (void)replaceKeyAsset:(id)a3;
- (void)updateCachedCounts:(id)a3;
- (void)updateStartAndEndDate;
- (void)willSave;
@end

@implementation PLSuggestion

- (signed)sharingComposition
{
  [(PLSuggestion *)self _recalculateSharingCompositionIfNeeded];
  [(PLSuggestion *)self willAccessValueForKey:@"sharingComposition"];
  v3 = [(PLSuggestion *)self primitiveValueForKey:@"sharingComposition"];
  signed __int16 v4 = [v3 intValue];

  [(PLSuggestion *)self didAccessValueForKey:@"sharingComposition"];
  return v4;
}

- (void)_recalculateSharingCompositionIfNeeded
{
  if ([(PLSuggestion *)self _sharingCompositionNeedsUpdate])
  {
    [(PLSuggestion *)self willAccessValueForKey:@"sharingComposition"];
    v3 = [(PLSuggestion *)self primitiveValueForKey:@"sharingComposition"];
    __int16 v4 = [v3 intValue];

    [(PLSuggestion *)self didAccessValueForKey:@"sharingComposition"];
    uint64_t v5 = [(id)objc_opt_class() _calculateSharingCompositionForSuggestion:self];
    if (v5 != v4)
    {
      uint64_t v6 = v5;
      [(PLSuggestion *)self willChangeValueForKey:@"sharingComposition"];
      v7 = [NSNumber numberWithShort:v6];
      [(PLSuggestion *)self setPrimitiveValue:v7 forKey:@"sharingComposition"];

      [(PLSuggestion *)self didChangeValueForKey:@"sharingComposition"];
    }
  }
}

- (BOOL)_sharingCompositionNeedsUpdate
{
  if ([(PLSuggestion *)self isDeleted]) {
    return 0;
  }
  __int16 v4 = [(PLSuggestion *)self changedValues];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"keyAssets"];
  if (v5)
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v6 = [(PLSuggestion *)self changedValues];
    v7 = [v6 objectForKeyedSubscript:@"representativeAssets"];
    BOOL v3 = v7 != 0;
  }
  return v3;
}

- (int64_t)cloudDeletionType
{
  return 8;
}

- (id)cplSuggestionChange
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v29 = [(PLSuggestion *)self scopedIdentifier];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F599B0], "newChangeWithScopedIdentifier:changeType:");
  objc_msgSend(v3, "setType:", -[PLSuggestion type](self, "type"));
  objc_msgSend(v3, "setSubtype:", -[PLSuggestion subtype](self, "subtype"));
  __int16 v4 = [(PLSuggestion *)self title];
  [v3 setTitle:v4];

  uint64_t v5 = [(PLSuggestion *)self subtitle];
  [v3 setSubtitle:v5];

  objc_msgSend(v3, "setState:", -[PLSuggestion state](self, "state"));
  objc_msgSend(v3, "setVersion:", (int)-[PLSuggestion version](self, "version"));
  objc_msgSend(v3, "setNotificationState:", -[PLSuggestion notificationState](self, "notificationState"));
  uint64_t v6 = [(PLSuggestion *)self creationDate];
  [v3 setCreationDate:v6];

  v7 = [(PLSuggestion *)self activationDate];
  [v3 setActivationDate:v7];

  v8 = [(PLSuggestion *)self relevantUntilDate];
  [v3 setRelevantUntilDate:v8];

  v9 = [(PLSuggestion *)self expungeDate];
  [v3 setExpungeDate:v9];

  v10 = [(PLSuggestion *)self actionData];
  [v3 setActionData:v10];

  v11 = [(PLSuggestion *)self featuresData];
  v28 = v3;
  [v3 setFeaturesData:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4F599C8]);
  v13 = [(PLSuggestion *)self representativeAssets];
  v14 = [(PLSuggestion *)self keyAssets];
  v15 = [MEMORY[0x1E4F1CA80] setWithSet:v13];
  [v15 unionSet:v14];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v21 = objc_alloc_init(MEMORY[0x1E4F599A8]);
        objc_msgSend(v21, "setIsKeyAsset:", objc_msgSend(v14, "containsObject:", v20));
        objc_msgSend(v21, "setIsRepresentative:", objc_msgSend(v13, "containsObject:", v20));
        id v22 = objc_alloc_init(MEMORY[0x1E4F599A0]);
        v23 = [v20 cloudAssetGUID];
        [v22 setAssetIdentifier:v23];

        [v22 setAssetFlag:v21];
        v24 = [v20 master];
        v25 = [v24 scopedIdentifier];

        v26 = [v25 identifier];
        [v22 setMasterFingerprint:v26];
        [v12 addAsset:v22];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v17);
  }

  [v28 setRecordList:v12];
  return v28;
}

- (id)scopedIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F59968]);
  __int16 v4 = [(PLSuggestion *)self scopeIdentifier];
  uint64_t v5 = [(PLSuggestion *)self uuid];
  uint64_t v6 = (void *)[v3 initWithScopeIdentifier:v4 identifier:v5];

  return v6;
}

- (id)scopeIdentifier
{
  v2 = [(PLManagedObject *)self photoLibrary];
  id v3 = [v2 mainScopeIdentifier];

  return v3;
}

- (BOOL)updateWithCPLSuggestionChange:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  -[PLSuggestion setType:](self, "setType:", [v6 type]);
  -[PLSuggestion setSubtype:](self, "setSubtype:", [v6 subtype]);
  v8 = [v6 title];
  [(PLSuggestion *)self setTitle:v8];

  v9 = [v6 subtitle];
  [(PLSuggestion *)self setSubtitle:v9];

  -[PLSuggestion setState:](self, "setState:", [v6 state]);
  -[PLSuggestion setVersion:](self, "setVersion:", (__int16)[v6 version]);
  -[PLSuggestion setNotificationState:](self, "setNotificationState:", [v6 notificationState]);
  v10 = [v6 creationDate];
  [(PLSuggestion *)self setCreationDate:v10];

  v11 = [v6 activationDate];
  [(PLSuggestion *)self setActivationDate:v11];

  id v12 = [v6 relevantUntilDate];
  [(PLSuggestion *)self setRelevantUntilDate:v12];

  v13 = [v6 expungeDate];
  [(PLSuggestion *)self setExpungeDate:v13];

  v14 = [v6 actionData];
  [(PLSuggestion *)self setActionData:v14];

  v15 = [v6 featuresData];
  long long v33 = self;
  [(PLSuggestion *)self setFeaturesData:v15];

  v35 = v6;
  long long v32 = [v6 recordList];
  uint64_t v16 = [v32 assets];
  uint64_t v17 = [v16 count];
  long long v31 = [v16 valueForKey:@"assetIdentifier"];
  long long v34 = v7;
  uint64_t v18 = +[PLManagedAsset assetsByCloudAssetUUID:inLibrary:](PLManagedAsset, "assetsByCloudAssetUUID:inLibrary:");
  uint64_t v36 = [MEMORY[0x1E4F1CA80] setWithCapacity:v17];
  v19 = [MEMORY[0x1E4F1CA80] setWithCapacity:v17];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v20 = v16;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    char v24 = 1;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        v26 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v27 = [v26 assetFlag];
        v28 = [v26 assetIdentifier];
        if (v28)
        {
          v29 = [v18 objectForKey:v28];
          if (v29)
          {
            if ([v27 isKeyAsset]) {
              [v19 addObject:v29];
            }
            if ([v27 isRepresentative]) {
              [v36 addObject:v29];
            }
          }
          else
          {
            char v24 = 0;
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v22);
  }
  else
  {
    char v24 = 1;
  }

  [(PLSuggestion *)v33 setKeyAssets:v19];
  [(PLSuggestion *)v33 setRepresentativeAssets:v36];
  [(PLSuggestion *)v33 updateStartAndEndDate];
  [(PLSuggestion *)v33 updateCachedCounts:v34];
  [(PLSuggestion *)v33 setCloudLocalState:1];

  return v24 & 1;
}

- (BOOL)isSyncableChange
{
  return 1;
}

- (BOOL)supportsCloudUpload
{
  id v3 = [(id)objc_opt_class() _syncablePredicate];
  LOBYTE(self) = [v3 evaluateWithObject:self];

  return (char)self;
}

- (BOOL)isEmpty
{
  id v3 = [(PLSuggestion *)self keyAssets];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [(PLSuggestion *)self representativeAssets];
    BOOL v4 = [v5 count] == 0;
  }
  return v4;
}

- (void)removeRepresentativeAsset:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLSuggestion *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(PLSuggestion *)self mutableRepresentativeAssets];
    [v6 removeObject:v4];

    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      v11 = self;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Removed representativeAsset %@ from suggestion %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)replaceKeyAsset:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (PLSuggestion *)a3;
  uint64_t v5 = [(PLSuggestion *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(PLSuggestion *)self keyAssets];
    uint64_t v7 = [v6 count];

    if (v7 == 1)
    {
      [(PLSuggestion *)self mutableRepresentativeAssets];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      int v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
LABEL_5:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
          if (![v13 isEqual:v4]) {
            break;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
            if (v10) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        id v15 = v13;

        if (!v15) {
          goto LABEL_18;
        }
        uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v15, 0);
        [(PLSuggestion *)self setKeyAssets:v16];
        uint64_t v17 = PLBackendGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v23 = self;
          __int16 v24 = 2112;
          v25 = v4;
          __int16 v26 = 2112;
          id v27 = v15;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Updating keyAsset for suggestion %@ from %@ to %@", buf, 0x20u);
        }
      }
      else
      {
LABEL_11:

LABEL_18:
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
        [(PLSuggestion *)self setKeyAssets:v15];
        [(PLSuggestion *)self setRepresentativeAssets:v15];
        uint64_t v16 = PLBackendGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v23 = v4;
          __int16 v24 = 2112;
          v25 = self;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Removed last keyAsset %@ from suggestion %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v14 = [(PLSuggestion *)self mutableKeyAssets];
      [v14 removeObject:v4];

      int v8 = PLBackendGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v4;
        __int16 v24 = 2112;
        v25 = self;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Removed keyAsset %@ from suggestion %@", buf, 0x16u);
      }
    }
  }
}

- (void)updateCachedCounts:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 managedObjectContext];
  uint64_t v5 = [(PLSuggestion *)self objectID];
  id v6 = +[PLSuggestion predicateForAllAssetsInSuggestion:v5 managedObjectContext:v4];

  uint64_t v7 = (void *)MEMORY[0x1E4F1C0D0];
  int v8 = +[PLManagedAsset entityName];
  uint64_t v9 = [v7 fetchRequestWithEntityName:v8];

  [v9 setPredicate:v6];
  id v32 = 0;
  uint64_t v10 = [v4 executeFetchRequest:v9 error:&v32];
  id v11 = v32;
  uint64_t v12 = v11;
  if (v10)
  {
    id v22 = v11;
    uint64_t v23 = v10;
    __int16 v24 = v9;
    v25 = v6;
    __int16 v26 = v4;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v10;
    uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(obj);
          }
          long long v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset", v22, v23, v24, v25, v26);
          [v20 savedAssetType];
          if (!PLValidatedSavedAssetTypeApplies()
            || objc_msgSend((id)objc_opt_class(), "_suggestionSubtypeAllowedToContainSyndicatedAssets:", -[PLSuggestion subtype](self, "subtype")))
          {
            if ([v20 isPhoto]) {
              uint64_t v15 = (v15 + 1);
            }
            else {
              uint64_t v16 = v16 + [v20 isVideo];
            }
            uint64_t v17 = (v17 + 1);
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v14);
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
    }

    [(PLSuggestion *)self setCachedCount:v17];
    [(PLSuggestion *)self setCachedPhotosCount:v15];
    [(PLSuggestion *)self setCachedVideosCount:v16];
    [(PLSuggestion *)self setSharingComposition:0];
    id v6 = v25;
    id v4 = v26;
    uint64_t v10 = v23;
    uint64_t v9 = v24;
    uint64_t v12 = v22;
  }
  else
  {
    long long v21 = PLBackendGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      long long v34 = v6;
      __int16 v35 = 2112;
      uint64_t v36 = v12;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to update suggestion cache count. All assets predicate: %@ error: %@", buf, 0x16u);
    }
  }
}

- (void)updateStartAndEndDate
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = [(PLSuggestion *)self keyAssets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v25 + 1) + 8 * v9) dateCreated];
        if ([v3 compare:v10] == 1)
        {
          id v11 = v10;

          id v3 = v11;
        }
        if ([v4 compare:v10] == -1)
        {
          id v12 = v10;

          id v4 = v12;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = [(PLSuggestion *)self representativeAssets];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v21 + 1) + 8 * v17) dateCreated];
        if ([v3 compare:v18] == 1)
        {
          id v19 = v18;

          id v3 = v19;
        }
        if ([v4 compare:v18] == -1)
        {
          id v20 = v18;

          id v4 = v20;
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  [(PLSuggestion *)self setStartDate:v3];
  [(PLSuggestion *)self setEndDate:v4];
}

- (BOOL)isPending
{
  return [(PLSuggestion *)self state] == 0;
}

- (void)delete
{
  id v3 = [(PLSuggestion *)self managedObjectContext];
  [v3 deleteObject:self];
}

- (void)willSave
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)PLSuggestion;
  [(PLManagedObject *)&v30 willSave];
  id v3 = [(PLSuggestion *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([(PLSuggestion *)self isDeleted] & 1) == 0)
    {
      id v4 = [(PLSuggestion *)self keyAssets];
      if ([v4 count])
      {
      }
      else
      {
        uint64_t v5 = [(PLSuggestion *)self representativeAssets];
        uint64_t v6 = [v5 count];

        if (!v6)
        {
          uint64_t v7 = PLBackendGetLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v8 = [(PLSuggestion *)self uuid];
            *(_DWORD *)buf = 138543362;
            id v32 = v8;
            _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Deleting suggestion because it has no assets %{public}@", buf, 0xCu);
          }
          if ([(PLSuggestion *)self featuredState] == 1)
          {
            if ([(PLSuggestion *)self type] == 6)
            {
              uint64_t v9 = PLBackendGetLog();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
              {
                uint64_t v10 = [(PLSuggestion *)self uuid];
                *(_DWORD *)buf = 138543362;
                id v32 = v10;
                _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Recording wallpaper suggestion reload due to wallpaper suggestion with no assets being deleted %{public}@", buf, 0xCu);
              }
              id v11 = [v3 delayedSaveActions];
              id v12 = [(PLSuggestion *)self uuid];
              [v11 recordWallpaperSuggestionReloadForUUID:v12];
            }
            else
            {
              int v13 = [(PLSuggestion *)self type];
              uint64_t v14 = PLBackendGetLog();
              BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
              if (v13 == 7)
              {
                if (v15)
                {
                  uint64_t v16 = [(PLSuggestion *)self uuid];
                  *(_DWORD *)buf = 138543362;
                  id v32 = v16;
                  _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Recording Album widget timeline invalidation due to featured suggestion with no assets being deleted %{public}@", buf, 0xCu);
                }
                uint64_t v17 = [v3 delayedSaveActions];
                id v11 = v17;
                uint64_t v18 = 1;
              }
              else
              {
                if (v15)
                {
                  id v19 = [(PLSuggestion *)self uuid];
                  *(_DWORD *)buf = 138543362;
                  id v32 = v19;
                  _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Recording ForYou widget timeline invalidation due to featured suggestion with no assets being deleted %{public}@", buf, 0xCu);
                }
                uint64_t v17 = [v3 delayedSaveActions];
                id v11 = v17;
                uint64_t v18 = 0;
              }
              [v17 recordWidgetTimelineReloadNeededForType:v18];
            }
          }
          [(PLSuggestion *)self delete];
        }
      }
    }
    if (([(PLSuggestion *)self isDeleted] & 1) == 0
      && [(PLSuggestion *)self state] == 4
      && [(PLSuggestion *)self featuredState] == 1)
    {
      id v20 = PLBackendGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        long long v21 = [(PLSuggestion *)self uuid];
        *(_DWORD *)buf = 138543362;
        id v32 = v21;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Setting suggestion to not featured as suggestion state has been set to denied %{public}@", buf, 0xCu);
      }
      [(PLSuggestion *)self setFeaturedState:0];
      int v22 = [(PLSuggestion *)self type];
      long long v23 = PLBackendGetLog();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22 == 7)
      {
        if (v24)
        {
          long long v25 = [(PLSuggestion *)self uuid];
          *(_DWORD *)buf = 138543362;
          id v32 = v25;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Recording Album widget timeline invalidation due to featured suggestion being denied %{public}@", buf, 0xCu);
        }
        long long v26 = [v3 delayedSaveActions];
        long long v27 = v26;
        uint64_t v28 = 1;
      }
      else
      {
        if (v24)
        {
          long long v29 = [(PLSuggestion *)self uuid];
          *(_DWORD *)buf = 138543362;
          id v32 = v29;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Recording ForYou widget timeline invalidation due to featured suggestion being denied %{public}@", buf, 0xCu);
        }
        long long v26 = [v3 delayedSaveActions];
        long long v27 = v26;
        uint64_t v28 = 0;
      }
      [v26 recordWidgetTimelineReloadNeededForType:v28];
    }
    [(PLSuggestion *)self _recalculateSharingCompositionIfNeeded];
  }
}

- (void)prepareForDeletion
{
  v4.receiver = self;
  v4.super_class = (Class)PLSuggestion;
  [(PLManagedObject *)&v4 prepareForDeletion];
  id v3 = [(PLSuggestion *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 mergingChanges] & 1) == 0) {
    [v3 recordCloudDeletionForObject:self];
  }
}

- (id)mutableRepresentativeAssets
{
  return (id)[(PLSuggestion *)self mutableSetValueForKey:@"representativeAssets"];
}

- (id)mutableKeyAssets
{
  return (id)[(PLSuggestion *)self mutableSetValueForKey:@"keyAssets"];
}

+ (id)predicateForSharedOnlyCollectionsWithinSubset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PLSuggestion.m", 736, @"Invalid parameter not satisfying: %@", @"collections" object file lineNumber description];
  }
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@ AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0) AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0)", v5, @"keyAssets", 0x1EEB30000, 0, @"representativeAssets", 0x1EEB30000, 0];

  return v6;
}

+ (id)predicateForPrivateOnlyCollectionsWithinSubset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PLSuggestion.m", 726, @"Invalid parameter not satisfying: %@", @"collections" object file lineNumber description];
  }
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@ AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0) AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0)", v5, @"keyAssets", @"activeLibraryScopeParticipationState", 1, @"representativeAssets", @"activeLibraryScopeParticipationState", 1];

  return v6;
}

+ (signed)_calculateSharingCompositionForSuggestion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = [v3 keyAssets];
  uint64_t v6 = [v4 setWithSet:v5];

  uint64_t v7 = [v3 representativeAssets];
  [v6 unionSet:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v9)
  {

LABEL_14:
    signed __int16 v15 = 0;
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v8);
      }
      v12 += objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "hasLibraryScope", (void)v17);
    }
    v11 += v10;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v10);

  if (v11 == v12) {
    signed __int16 v15 = 1;
  }
  else {
    signed __int16 v15 = 2;
  }
  if (!v12) {
    goto LABEL_14;
  }
LABEL_15:

  return v15;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)@"uuid";
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 8;
}

+ (id)suggestionObjectIDsContainingAsset:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 objectIDsForRelationshipNamed:@"suggestionsBeingKeyAssets"];
  [v5 addObjectsFromArray:v6];

  uint64_t v7 = [v4 objectIDsForRelationshipNamed:@"suggestionsBeingRepresentativeAssets"];

  [v5 addObjectsFromArray:v7];
  return v5;
}

+ (unint64_t)deleteSuggestionsWithObjectIDs:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v8 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v9;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Removing %@ suggestions", buf, 0xCu);
      }
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v11 = [v6 allObjects];
    uint64_t v12 = [v10 predicateWithFormat:@"SELF IN %@", v11];

    unint64_t v13 = [a1 _deleteSuggestionsMatchingPredicate:v12 inManagedObjectContext:v7];
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

+ (unint64_t)deletePendingSuggestionsCreatedBefore:(id)a3 withTypes:(id)a4 andRejectedAssetsBySuggestionType:(id)a5 inManagedObjectContext:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!*MEMORY[0x1E4F59AC0])
  {
    unint64_t v13 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v54 = v9;
      __int16 v55 = 2112;
      id v56 = v10;
      __int16 v57 = 2112;
      id v58 = v11;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Removing pending suggestions created before %@, types: %@, rejectedAssetsByType: %@", buf, 0x20u);
    }
  }
  unint64_t v14 = 0x1E4F28000uLL;
  unint64_t v15 = 0x1E4F28000;
  if ([v10 count])
  {
    uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"type", v10];
    if (![v11 count])
    {
      uint64_t v17 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v18 = [v11 count];
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    long long v19 = 0;
    if (!v18) {
      goto LABEL_22;
    }
  }
  v41 = v16;
  id v42 = v12;
  id v44 = v10;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v43 = v11;
  id v21 = v11;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        long long v27 = [v21 objectForKeyedSubscript:v26];
        unint64_t v28 = v14;
        long long v29 = [*(id *)(v14 + 3936) predicateWithFormat:@"%K == %d and any %K in %@", @"type", objc_msgSend(v26, "intValue"), @"keyAssets", v27];
        [v20 addObject:v29];

        unint64_t v14 = v28;
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v23);
  }

  unint64_t v15 = 0x1E4F28000uLL;
  uint64_t v17 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v20];

  uint64_t v16 = v41;
  if (!v41)
  {
    long long v19 = v17;
    id v10 = v44;
    id v12 = v42;
    id v11 = v43;
LABEL_22:
    id v34 = v19;
    if (v34) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  id v10 = v44;
  id v12 = v42;
  id v11 = v43;
  if (!v17)
  {
LABEL_20:
    long long v19 = v16;
    goto LABEL_22;
  }
  unint64_t v30 = v14;
  uint64_t v31 = (void *)MEMORY[0x1E4F28BA0];
  v51[0] = v41;
  v51[1] = v17;
  id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  uint64_t v33 = v31;
  unint64_t v14 = v30;
  id v34 = [v33 orPredicateWithSubpredicates:v32];

  if (v34)
  {
LABEL_23:
    uint64_t v36 = [*(id *)(v14 + 3936) predicateWithFormat:@"%K == %d and %K < %@", @"state", 0, @"creationDate", v9];
    long long v37 = *(void **)(v15 + 2976);
    v50[0] = v36;
    v50[1] = v34;
    uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
    long long v39 = [v37 andPredicateWithSubpredicates:v38];

    unint64_t v35 = [a1 _deleteSuggestionsMatchingPredicate:v39 inManagedObjectContext:v12];
    goto LABEL_24;
  }
LABEL_19:
  unint64_t v35 = 0;
LABEL_24:

  return v35;
}

+ (unint64_t)_deleteSuggestionsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F38D3B0]();
  id v9 = (void *)MEMORY[0x1E4F1C0D0];
  id v10 = [a1 entityName];
  id v11 = [v9 fetchRequestWithEntityName:v10];

  [v11 setPredicate:v6];
  unint64_t v19 = 0;
  id v12 = [v7 enumerateObjectsFromFetchRequest:v11 count:&v19 batchSize:100 usingBlock:&__block_literal_global_107];
  if (v12)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      unint64_t v13 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        unint64_t v21 = (unint64_t)v12;
        unint64_t v14 = "Error fetching suggestions: %{public}@";
        unint64_t v15 = v13;
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
    unint64_t v13 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      unint64_t v21 = v19;
      unint64_t v14 = "Deleted %{public}lu suggestions";
      unint64_t v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
LABEL_9:
  }
  unint64_t v17 = v19;

  return v17;
}

uint64_t __75__PLSuggestion__deleteSuggestionsMatchingPredicate_inManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 delete];
}

+ (id)suggestionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(int64_t)a5 inManagedObjectContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__39566;
  id v34 = __Block_byref_object_dispose__39567;
  id v35 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __90__PLSuggestion_suggestionsMatchingPredicate_sortDescriptors_limit_inManagedObjectContext___block_invoke;
  uint64_t v23 = &unk_1E5874728;
  id v28 = a1;
  id v13 = v10;
  id v24 = v13;
  id v14 = v11;
  int64_t v29 = a5;
  id v25 = v14;
  long long v27 = &v30;
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

void __90__PLSuggestion_suggestionsMatchingPredicate_sortDescriptors_limit_inManagedObjectContext___block_invoke(uint64_t a1)
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
  id v5 = *(void **)(a1 + 48);
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
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch suggestions: %@", buf, 0xCu);
    }
  }
}

+ (id)suggestionsToPrefetchInManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = [[PLGlobalValues alloc] initWithManagedObjectContext:v4];
  if ([(PLGlobalValues *)v5 shouldPrefetchWidgetResources])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K <= %d and %K == %d", @"state", 1, @"featuredState", 1);
    id v7 = [a1 suggestionsMatchingPredicate:v6 sortDescriptors:0 limit:0 inManagedObjectContext:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)suggestionsToUploadInPhotoLibrary:(id)a3 limit:(int64_t)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 _syncablePredicate];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"cloudLocalState == %d", 0);
  id v9 = (void *)MEMORY[0x1E4F28BA0];
  v18[0] = v7;
  v18[1] = v8;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v11 = [v9 andPredicateWithSubpredicates:v10];

  id v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  id v17 = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];

  id v14 = [v6 managedObjectContext];

  uint64_t v15 = [a1 suggestionsMatchingPredicate:v11 sortDescriptors:v13 limit:a4 inManagedObjectContext:v14];

  return v15;
}

+ (void)resetCloudStateInPhotoLibrary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = objc_alloc(MEMORY[0x1E4F1C038]);
  id v7 = [a1 entityName];
  uint64_t v8 = (void *)[v6 initWithEntityName:v7];

  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"cloudLocalState != %d", 0);
  [v8 setResultType:2];
  [v8 setPropertiesToUpdate:&unk_1EEBF2950];
  [v8 setPredicate:v9];
  BOOL v10 = [v4 managedObjectContext];
  id v15 = 0;
  id v11 = [v10 executeRequest:v8 error:&v15];
  id v12 = v15;

  if (v11)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v13 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v11 result];
        *(_DWORD *)buf = 138412290;
        id v17 = v14;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Batch updated %@ Suggestions", buf, 0xCu);
      }
LABEL_8:
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    id v13 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to batch update Suggestions: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
}

+ (id)_syncablePredicate
{
  if (_syncablePredicate_onceToken != -1) {
    dispatch_once(&_syncablePredicate_onceToken, &__block_literal_global_39596);
  }
  v2 = (void *)_syncablePredicate_predicate;
  return v2;
}

void __34__PLSuggestion__syncablePredicate__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d AND %K == %d AND (%K != %d)", @"state", 0, @"state", 4, @"type", 7);
  v1 = (void *)_syncablePredicate_predicate;
  _syncablePredicate_predicate = v0;
}

+ (id)predicateForAllMomentsFromRepresentativeAssetsInSuggestion:(id)a3 managedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() _representativeAssetIDsInSuggestion:v6 managedObjectContext:v5];

  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY assets IN (%@)", v7];

  return v8;
}

+ (id)predicateForAllAssetsInSuggestion:(id)a3 managedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() _representativeAssetIDsInSuggestion:v6 managedObjectContext:v5];

  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY moment.assets IN (%@) AND noindex(trashedState) == %d AND noindex(kindSubtype) != %d AND noindex(kindSubtype) != %d AND additionalAttributes.importedBy != %d", v7, 0, 10, 103, 7];

  return v8;
}

+ (id)_representativeAssetIDsInSuggestion:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__39566;
  id v26 = __Block_byref_object_dispose__39567;
  id v27 = (id)MEMORY[0x1E4F1CBF0];
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v8 = +[PLManagedAsset entityName];
  id v9 = [v7 fetchRequestWithEntityName:v8];

  if ([v5 isTemporaryID])
  {
    id v21 = 0;
    BOOL v10 = [v6 existingObjectWithID:v5 error:&v21];
    id v11 = v21;
    BOOL v12 = v10 != 0;
    if (v10)
    {
      id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"suggestionsBeingRepresentativeAssets CONTAINS %@", v10];
      [v9 setPredicate:v13];
    }
    else
    {
      id v13 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v29 = v5;
        __int16 v30 = 2112;
        id v31 = v11;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch existingObjectWithID %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"suggestionsBeingRepresentativeAssets CONTAINS %@", v5];
    [v9 setPredicate:v11];
    BOOL v12 = 1;
  }

  [v9 setResultType:1];
  [v9 setIncludesPropertyValues:0];
  if (v12)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__PLSuggestion__representativeAssetIDsInSuggestion_managedObjectContext___block_invoke;
    v16[3] = &unk_1E5875368;
    uint64_t v20 = &v22;
    id v17 = v6;
    id v18 = v9;
    id v19 = v5;
    [v17 performBlockAndWait:v16];
  }
  id v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __73__PLSuggestion__representativeAssetIDsInSuggestion_managedObjectContext___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v12 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v12];
  id v5 = v12;
  uint64_t v6 = *(void *)(a1[7] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[6];
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch representative asset IDs for %@: %@", buf, 0x16u);
    }

    uint64_t v10 = *(void *)(a1[7] + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = MEMORY[0x1E4F1CBF0];
  }
}

+ (BOOL)_suggestionSubtypeAllowedToContainSyndicatedAssets:(unsigned __int16)a3
{
  return (int)a3 <= 651 && (int)a3 > 305 && (int)a3 <= 600 && (a3 - 501) >= 2 && a3 == 306;
}

+ (id)suggestionsWithUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  uint64_t v8 = [v6 predicateWithFormat:@"uuid IN %@", a3];
  uint64_t v9 = [v7 managedObjectContext];

  uint64_t v10 = [a1 suggestionsMatchingPredicate:v8 sortDescriptors:0 limit:0 inManagedObjectContext:v9];

  return v10;
}

+ (id)suggestionWithUUID:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  uint64_t v8 = [v6 predicateWithFormat:@"%K == %@", @"uuid", a3];
  uint64_t v9 = [a1 suggestionsMatchingPredicate:v8 sortDescriptors:0 limit:1 inManagedObjectContext:v7];

  uint64_t v10 = [v9 firstObject];

  return v10;
}

+ (id)suggestionWithUUID:(id)a3 inPhotoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = [a4 managedObjectContext];
  uint64_t v8 = [a1 suggestionWithUUID:v6 inManagedObjectContext:v7];

  return v8;
}

+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4
{
  id v6 = a4;
  id v7 = [a3 managedObjectContext];
  uint64_t v8 = [a1 entityName];
  uint64_t v9 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);

  if (v9) {
    [v9 setUuid:v6];
  }

  return v9;
}

+ (id)entityName
{
  return @"Suggestion";
}

@end