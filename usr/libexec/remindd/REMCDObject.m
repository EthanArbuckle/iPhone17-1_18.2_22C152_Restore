@interface REMCDObject
+ (BOOL)conformsToICCloudObject;
+ (BOOL)conformsToREMChangeTrackingIdentifiable;
+ (BOOL)isAbstract;
+ (BOOL)needsToReFetchServerRecordValue:(id)a3;
+ (BOOL)shouldAttemptLocalObjectMerge;
+ (BOOL)shouldSyncToCloud;
+ (NSString)cdEntityName;
+ (NSString)ckRecordKeyForMinimumSupportedVersion;
+ (REMCDObject)objectWithRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)allCloudObjectIDsInContext:(id)a3;
+ (id)allCloudObjectsInContext:(id)a3;
+ (id)allCloudObjectsPredicate;
+ (id)allDirtyCloudObjectIDsInContext:(id)a3;
+ (id)allDirtyCloudObjectsPredicate;
+ (id)assetForData:(id)a3;
+ (id)ckIdentifierFromRecordName:(id)a3;
+ (id)entity;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)failedToSyncCountsByCKIdentifier;
+ (id)failureCountQueue;
+ (id)fetchRequest;
+ (id)getResolutionTokenMapFromRecord:(id)a3;
+ (id)ic_objectsFromObjectIDs:(id)a3 propertiesToFetch:(id)a4 relationshipKeyPathsForPrefetching:(id)a5 context:(id)a6;
+ (id)ic_resultsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 resultType:(unint64_t)a5 fetchBatchSize:(unint64_t)a6 propertiesToFetch:(id)a7 relationshipKeyPathsForPrefetching:(id)a8 context:(id)a9;
+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud;
+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion;
+ (id)keyPathsForValuesAffectingIsSharedReadOnly;
+ (id)keyPathsForValuesAffectingIsSharedViaICloud;
+ (id)keyPathsForValuesAffectingNeedsToBeDeletedFromCloud;
+ (id)keyPathsForValuesAffectingNeedsToBePushedToCloud;
+ (id)keyPathsForValuesAffectingServerShareCheckingParent;
+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5;
+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)newObjectID;
+ (id)newObjectWithCKIdentifier:(id)a3 context:(id)a4 account:(id)a5;
+ (id)newObjectWithCKRecordName:(id)a3 context:(id)a4 account:(id)a5;
+ (id)newPlaceholderObjectForRecordID:(id)a3 account:(id)a4 context:(id)a5;
+ (id)numberOfPushAttemptsToWaitByCKIdentifier;
+ (id)objectCkZoneOwnerNameFromCKRecordZoneID:(id)a3;
+ (id)objectIDWithUUID:(id)a3;
+ (id)recordSystemFieldsTransformer;
+ (id)recordTypes;
+ (id)relationshipsEligibleForEffectiveMinimumSupportedVersionPropagationWithEntity:(id)a3;
+ (id)shareSystemFieldsTransformer;
+ (id)subclassNamesOfREMCDObjectRepresentingRootCoreDataEntities;
+ (id)subclassesOfREMCDObjectRepresentingRootCoreDataEntities;
+ (id)temporaryAssetDirectoryURL;
+ (id)temporaryAssets;
+ (id)versionsByOperationQueue;
+ (id)versionsByRecordIDByOperation;
+ (void)deleteAllTemporaryAssetFilesForAllObjects;
+ (void)deleteTemporaryAssetFilesForOperation:(id)a3;
+ (void)deleteTemporaryFilesForAsset:(id)a3;
+ (void)mergeSystemPropertiesIntoCDObject:(id)a3 fromCKRecord:(id)a4;
- (BOOL)_allowsObjectSupportedVersion;
- (BOOL)_isInICloudAccount;
- (BOOL)_validateZoneOwnerNamesWithLogPrefix:(id)a3 error:(id *)a4;
- (BOOL)canBeRootShareObject;
- (BOOL)canBeSharedViaICloud;
- (BOOL)hack_didHandleShouldSyncUpDelete;
- (BOOL)hack_willSaveHandled;
- (BOOL)hasAllMandatoryFields;
- (BOOL)hasSuccessfullyPushedLatestVersionToCloud;
- (BOOL)isConcealed;
- (BOOL)isConnectedToAccountObject:(id)a3;
- (BOOL)isDeletable;
- (BOOL)isInCloud;
- (BOOL)isInICloudAccount;
- (BOOL)isMergeableWithLocalObject;
- (BOOL)isOwnedByCurrentUser;
- (BOOL)isPlaceholder;
- (BOOL)isSharedReadOnly;
- (BOOL)isSharedRootObject;
- (BOOL)isSharedViaICloud;
- (BOOL)isUnsupported;
- (BOOL)isValidObject;
- (BOOL)mergeDataRefusedToMergeMarkedForDeletion;
- (BOOL)mergeDataRevertedLocallyMarkedForDeletion;
- (BOOL)mergeWithLocalObject:(id)a3;
- (BOOL)needsToBeDeletedFromCloud;
- (BOOL)needsToBePushedToCloud;
- (BOOL)needsToDeleteShare;
- (BOOL)needsToFetchAfterServerRecordChanged:(id)a3;
- (BOOL)shouldBeDeletedFromLocalDatabase;
- (BOOL)shouldBeIgnoredForSync;
- (BOOL)shouldCascadeMarkAsDeleteInto:(id)a3 forRelationship:(id)a4;
- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately;
- (BOOL)shouldPerformCloudSchemaCatchUpSync;
- (BOOL)shouldSyncUpDelete;
- (BOOL)spotlightIndexCountUpdated;
- (BOOL)supportsDeletionByTTL;
- (BOOL)validateEffectiveMinimumSupportedVersionApplyingChange:(BOOL)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForInsertion_handledJournalEntries;
- (BOOL)validateForUpdate:(id *)a3;
- (BOOL)validateForUpdate_handledJournalEntries;
- (CKRecord)ckServerRecord;
- (CKShare)ckServerShare;
- (NSData)resolutionTokenMapData;
- (NSString)_parentZoneMismatchErrorDebugDescription;
- (NSString)accountCKIdentifier;
- (NSString)ckZoneOwnerName;
- (RDStoreControllerManagedObjectContext)storeControllerManagedObjectContext;
- (REMCDAccount)previousAccount;
- (REMObjectID)remObjectID;
- (REMResolutionTokenMap)cached_CDResolutionMap;
- (REMResolutionTokenMap)hack_resolutionTokenMapCopy;
- (REMResolutionTokenMap)resolutionTokenMap;
- (id)allChildObjects;
- (id)ckIdentifierFromRecordName:(id)a3;
- (id)cloudAccount;
- (id)cloudKitReferenceWithRecordIDAndValidateAction:(id)a3;
- (id)createResolutionTokenMapIfNecessary;
- (id)currentUserShareParticipantID;
- (id)existingLocalObjectToMergeWithPredicate:(id)a3;
- (id)getResolutionTokenMapFromRecord:(id)a3;
- (id)ic_loggingValues;
- (id)jsonDataFromResolutionTokenMap:(id)a3;
- (id)newlyCreatedRecord;
- (id)objectsToBeDeletedBeforeThisObject;
- (id)parentCloudObject;
- (id)recordID;
- (id)recordName;
- (id)recordType;
- (id)recordZoneName;
- (id)remObjectIDWithError:(id *)a3;
- (id)resolutionTokenMapFromJsonData:(id)a3;
- (id)serverShareCheckingParent;
- (id)shortLoggingDescription;
- (int64_t)effectiveMinimumSupportedVersion;
- (int64_t)failedToSyncCount;
- (int64_t)isPushingSameOrLaterThanVersion:(int64_t)a3;
- (int64_t)numberOfPushAttemptsToWaitCount;
- (int64_t)parentEffectiveMinimumSupportedVersion;
- (int64_t)rd_ckDatabaseScope;
- (int64_t)versionForOperation:(id)a3;
- (void)_markDirtyForEffectiveMinimumSupportedVersionValidation;
- (void)_setCKIdentifierIfNecessary;
- (void)awakeFromFetch;
- (void)awakeFromInsert;
- (void)clearChangeCount;
- (void)clearServerRecord;
- (void)clearTransformedCKServerValueCachesOnDidTurnIntoFault;
- (void)debug_lowLevelRemoveFromParent;
- (void)decrementFailureCounts;
- (void)deleteAllChildrenFromLocalDatabase;
- (void)deleteChangeTokensAndReSync;
- (void)deleteFromLocalDatabase;
- (void)didAcceptShare:(id)a3;
- (void)didChangeValueForKey:(id)a3;
- (void)didSave;
- (void)didTurnIntoFault;
- (void)fixValueBeforeMarkingForDeletionForKey:(id)a3;
- (void)fixValueBeforeUnmarkingForDeletionForKey:(id)a3;
- (void)fixValuesOfKeysWithUniqueConstraintBeforeSettingMarkedForDeletion:(BOOL)a3;
- (void)forcePushToCloud;
- (void)generateReolutionTokenMapForTestingWithKeys:(id)a3;
- (void)incrementFailureCounts;
- (void)insertCloudStateIfNeededOnAwakeFromFetch;
- (void)insertCloudStateOnAwakeFromInsert;
- (void)lowLevelMarkForDeletion;
- (void)lowLevelUnmarkForDeletion;
- (void)markForDeletion;
- (void)markObjectDirtyAfterMarkedForDeletion;
- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4;
- (void)objectFailedToBePushedToCloudWithOperation:(id)a3 recordID:(id)a4 error:(id)a5;
- (void)objectWasDeletedFromCloud;
- (void)objectWasDeletedFromCloudByAnotherDevice;
- (void)objectWasFetchedButDoesNotExistInCloud;
- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4;
- (void)objectWasPushedToCloudWithOperation:(id)a3 serverRecord:(id)a4;
- (void)objectWillBePushedToCloudWithOperation:(id)a3;
- (void)prepareForDeletion;
- (void)recursiveMarkForDeletion:(BOOL)a3 usingVisitedMap:(id)a4;
- (void)recursivelyFixCrossZoneRelationshipWithVisitedMap:(id)a3 perObjectHandler:(id)a4;
- (void)resetFailureCounts;
- (void)setAccount:(id)a3;
- (void)setCached_CDResolutionMap:(id)a3;
- (void)setCkNeedsToBeFetchedFromCloud:(BOOL)a3;
- (void)setCkServerRecord:(id)a3;
- (void)setCkServerShare:(id)a3;
- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3;
- (void)setFailedToSyncCount:(int64_t)a3;
- (void)setHack_didHandleShouldSyncUpDelete:(BOOL)a3;
- (void)setHack_resolutionTokenMapCopy:(id)a3;
- (void)setHack_willSaveHandled:(BOOL)a3;
- (void)setInCloud:(BOOL)a3;
- (void)setMarkedForDeletion:(BOOL)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setNumberOfPushAttemptsToWaitCount:(int64_t)a3;
- (void)setPreviousAccount:(id)a3;
- (void)setResolutionTokenMap:(id)a3;
- (void)setResolutionTokenMapData:(id)a3;
- (void)setServerShareIfNewer:(id)a3;
- (void)setShouldSyncUpDeleteIfNeeded;
- (void)setSpotlightIndexCountUpdated:(BOOL)a3;
- (void)setValidateForInsertion_handledJournalEntries:(BOOL)a3;
- (void)setValidateForUpdate_handledJournalEntries:(BOOL)a3;
- (void)setVersion:(int64_t)a3 forOperation:(id)a4;
- (void)traverseObjectTreeUsingVisitedMap:(id)a3 handler:(id)a4;
- (void)unmarkForDeletion;
- (void)updateChangeCount;
- (void)updateDeletedFlagAccordingToOrphanState:(id)a3;
- (void)updateObjectWithShare:(id)a3;
- (void)updateParentReferenceIfNecessary;
- (void)updateSharedObjectOwnerName:(id)a3;
- (void)willChangeValueForKey:(id)a3;
- (void)willSave;
@end

@implementation REMCDObject

+ (id)ic_objectsFromObjectIDs:(id)a3 propertiesToFetch:(id)a4 relationshipKeyPathsForPrefetching:(id)a5 context:(id)a6
{
  id v40 = a4;
  id v39 = a5;
  id v10 = a6;
  v11 = [v10 reduceIntoDictionaryByRootEntityNamesWithManagedObjectIDs:a3];
  if ([v11 count])
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = NSStringFromClass((Class)a1);
    unsigned int v15 = [v13 isEqualToString:v14];

    if (v15)
    {
      v34 = [a1 subclassesOfREMCDObjectRepresentingRootCoreDataEntities];
      id v38 = +[NSMutableArray array];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      v32 = v11;
      id obj = v11;
      id v35 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v35)
      {
        uint64_t v33 = *(void *)v46;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v46 != v33) {
              objc_enumerationMutation(obj);
            }
            uint64_t v37 = v16;
            uint64_t v17 = *(void *)(*((void *)&v45 + 1) + 8 * v16);
            v18 = [obj objectForKeyedSubscript:v17];
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v19 = v34;
            id v20 = [v19 countByEnumeratingWithState:&v41 objects:v49 count:16];
            if (v20)
            {
              id v21 = v20;
              uint64_t v22 = *(void *)v42;
              do
              {
                for (i = 0; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v42 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  v24 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                  v25 = [v24 cdEntityName];
                  unsigned int v26 = [v25 isEqualToString:v17];

                  if (v26)
                  {
                    v27 = [v24 _ic_objectsFromObjectIDs:v18 propertiesToFetch:v40 relationshipKeyPathsForPrefetching:v39 context:v10];
                    if (v27) {
                      [v38 addObjectsFromArray:v27];
                    }
                  }
                }
                id v21 = [v19 countByEnumeratingWithState:&v41 objects:v49 count:16];
              }
              while (v21);
            }

            uint64_t v16 = v37 + 1;
          }
          while ((id)(v37 + 1) != v35);
          id v35 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v35);
      }

      v11 = v32;
    }
    else
    {
      v28 = [a1 cdEntityName];
      v29 = [v10 rootEntityNameWithEntityName:v28];

      if ([v29 length])
      {
        v30 = [v11 objectForKeyedSubscript:v29];
        if ([v30 count])
        {
          [a1 _ic_objectsFromObjectIDs:v30 propertiesToFetch:v40 relationshipKeyPathsForPrefetching:v39 context:v10];
          id v38 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v38 = &__NSArray0__struct;
        }
      }
      else
      {
        id v38 = &__NSArray0__struct;
      }
    }
  }
  else
  {
    id v38 = &__NSArray0__struct;
  }

  return v38;
}

+ (id)ic_resultsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 resultType:(unint64_t)a5 fetchBatchSize:(unint64_t)a6 propertiesToFetch:(id)a7 relationshipKeyPathsForPrefetching:(id)a8 context:(id)a9
{
  id v37 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = (objc_class *)a1;
  id v18 = a9;
  id v19 = (objc_class *)objc_opt_class();
  id v20 = NSStringFromClass(v19);
  id v21 = NSStringFromClass(v17);
  unsigned int v22 = [v20 isEqualToString:v21];

  if (v22)
  {
    id v41 = v16;
    id v23 = v14;
    v24 = v37;
    id v40 = +[NSMutableArray array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = [(objc_class *)v17 subclassesOfREMCDObjectRepresentingRootCoreDataEntities];
    id v25 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    unint64_t v26 = a6;
    if (v25)
    {
      id v27 = v25;
      uint64_t v28 = *(void *)v43;
      do
      {
        v29 = 0;
        do
        {
          if (*(void *)v43 != v28) {
            objc_enumerationMutation(obj);
          }
          id v30 = v18;
          id v36 = v18;
          unint64_t v31 = a5;
          unint64_t v32 = a5;
          unint64_t v33 = v26;
          v34 = [*(id *)(*((void *)&v42 + 1) + 8 * (void)v29) _ic_resultsMatchingPredicate:v37 sortDescriptors:v23 resultType:v32 fetchBatchSize:v26 propertiesToFetch:v15 relationshipKeyPathsForPrefetching:v41 context:v36];
          if (v34) {
            [v40 addObjectsFromArray:v34];
          }

          v29 = (char *)v29 + 1;
          unint64_t v26 = v33;
          a5 = v31;
          id v18 = v30;
        }
        while (v27 != v29);
        id v27 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v27);
    }

    id v14 = v23;
    id v16 = v41;
  }
  else
  {
    v24 = v37;
    id v40 = [(objc_class *)v17 _ic_resultsMatchingPredicate:v37 sortDescriptors:v14 resultType:a5 fetchBatchSize:a6 propertiesToFetch:v15 relationshipKeyPathsForPrefetching:v16 context:v18];
  }

  return v40;
}

+ (BOOL)isAbstract
{
  v2 = +[REMLogStore write];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_10074F58C();
  }

  return 1;
}

- (RDStoreControllerManagedObjectContext)storeControllerManagedObjectContext
{
  objc_opt_class();
  v3 = [(REMCDObject *)self managedObjectContext];
  v4 = REMDynamicCast();

  return (RDStoreControllerManagedObjectContext *)v4;
}

- (BOOL)isConcealed
{
  if ([(REMCDObject *)self markedForDeletion]) {
    return 1;
  }

  return [(REMCDObject *)self isUnsupported];
}

- (BOOL)isPlaceholder
{
  unsigned int v3 = [(REMCDObject *)self isInICloudAccount];
  if (v3)
  {
    LOBYTE(v3) = [(REMCDObject *)self ckNeedsInitialFetchFromCloud];
  }
  return v3;
}

- (void)awakeFromInsert
{
  v3.receiver = self;
  v3.super_class = (Class)REMCDObject;
  [(REMCDObject *)&v3 awakeFromInsert];
  if ([(id)objc_opt_class() shouldSyncToCloud]) {
    [(REMCDObject *)self insertCloudStateOnAwakeFromInsert];
  }
}

- (void)awakeFromFetch
{
  v3.receiver = self;
  v3.super_class = (Class)REMCDObject;
  [(REMCDObject *)&v3 awakeFromFetch];
  if ([(id)objc_opt_class() shouldSyncToCloud]) {
    [(REMCDObject *)self insertCloudStateIfNeededOnAwakeFromFetch];
  }
}

- (void)didTurnIntoFault
{
  v3.receiver = self;
  v3.super_class = (Class)REMCDObject;
  [(REMCDObject *)&v3 didTurnIntoFault];
  [(REMCDObject *)self clearTransformedCKServerValueCachesOnDidTurnIntoFault];
}

- (void)willChangeValueForKey:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)REMCDObject;
  [(REMCDObject *)&v5 willChangeValueForKey:v4];
  if (objc_opt_respondsToSelector()) {
    [(REMCDObject *)self willChangeValueForKey_Swfit:v4];
  }
}

- (void)didChangeValueForKey:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMCDObject;
  [(REMCDObject *)&v9 didChangeValueForKey:v4];
  if ([(REMCDObject *)self _allowsObjectSupportedVersion])
  {
    objc_super v5 = [(id)objc_opt_class() keyPathsForValuesAffectingEffectiveMinimumSupportedVersion];
    unsigned int v6 = [v5 containsObject:v4];

    if (v6)
    {
      v7 = +[REMLogStore write];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = [(REMCDObject *)self remObjectID];
        *(_DWORD *)buf = 138543618;
        id v11 = v4;
        __int16 v12 = 2114;
        v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "REMSupportedVersionUpdating: didChangeValueForKey:[%{public}@] calling _markObjectDirtyForSupportedVersionValidation on {remObjectID: %{public}@}", buf, 0x16u);
      }
      [(REMCDObject *)self _markDirtyForEffectiveMinimumSupportedVersionValidation];
    }
  }
  if (objc_opt_respondsToSelector()) {
    [(REMCDObject *)self didChangeValueForKey_Swfit:v4];
  }
}

- (void)setResolutionTokenMap:(id)a3
{
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (((uint64_t (*)(REMCDObject *, const char *))[(REMCDObject *)self methodForSelector:"shouldUseResolutionTokenMapForMergingData"])(self, "shouldUseResolutionTokenMapForMergingData") & 1) != 0)
  {
    unsigned int v6 = +[REMLogStore write];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10074F618(self, a2, v6);
    }
  }
  else
  {
    unsigned int v6 = +[REMLogStore write];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10074F718(self, a2, v6);
    }
  }

  v7 = [(REMCDObject *)self cached_CDResolutionMap];
  if (!v7)
  {
    v8 = [(REMCDObject *)self primitiveValueForKey:@"resolutionTokenMap_v3_JSONData"];
    v7 = [(REMCDObject *)self resolutionTokenMapFromJsonData:v8];
  }
  if (([v7 isEqual:v5] & 1) == 0)
  {
    objc_super v9 = [(REMCDObject *)self jsonDataFromResolutionTokenMap:v5];
    [(REMCDObject *)self setResolutionTokenMapData:v9];
  }
  id v10 = [v5 copy];
  [(REMCDObject *)self setCached_CDResolutionMap:v10];

  [(REMCDObject *)self setHack_resolutionTokenMapCopy:v5];
}

- (REMResolutionTokenMap)resolutionTokenMap
{
  [(REMCDObject *)self willAccessValueForKey:@"resolutionTokenMap"];
  [(REMCDObject *)self willAccessValueForKey:@"resolutionTokenMap_v3_JSONData"];
  objc_super v3 = [(REMCDObject *)self hack_resolutionTokenMapCopy];

  if (!v3)
  {
    id v4 = [(REMCDObject *)self primitiveValueForKey:@"resolutionTokenMap_v3_JSONData"];
    id v5 = [(REMCDObject *)self resolutionTokenMapFromJsonData:v4];
    [(REMCDObject *)self setHack_resolutionTokenMapCopy:v5];

    unsigned int v6 = [(REMCDObject *)self hack_resolutionTokenMapCopy];
    id v7 = [v6 copy];
    [(REMCDObject *)self setCached_CDResolutionMap:v7];
  }
  v8 = [(REMCDObject *)self hack_resolutionTokenMapCopy];
  [(REMCDObject *)self didAccessValueForKey:@"resolutionTokenMap_v3_JSONData"];
  [(REMCDObject *)self didAccessValueForKey:@"resolutionTokenMap"];

  return (REMResolutionTokenMap *)v8;
}

- (void)setResolutionTokenMapData:(id)a3
{
  id v5 = a3;
  id v4 = [(REMCDObject *)self primitiveValueForKey:@"resolutionTokenMap_v3_JSONData"];
  if (v4 != v5 && (!v5 || ([v4 isEqualToData:v5] & 1) == 0))
  {
    [(REMCDObject *)self willChangeValueForKey:@"resolutionTokenMapData"];
    [(REMCDObject *)self willChangeValueForKey:@"resolutionTokenMap_v3_JSONData"];
    [(REMCDObject *)self setPrimitiveValue:v5 forKey:@"resolutionTokenMap_v3_JSONData"];
    [(REMCDObject *)self didChangeValueForKey:@"resolutionTokenMap_v3_JSONData"];
    [(REMCDObject *)self didChangeValueForKey:@"resolutionTokenMap"];
    [(REMCDObject *)self setHack_resolutionTokenMapCopy:0];
    [(REMCDObject *)self setCached_CDResolutionMap:0];
  }
}

- (NSData)resolutionTokenMapData
{
  [(REMCDObject *)self willAccessValueForKey:@"resolutionTokenMap"];
  [(REMCDObject *)self willAccessValueForKey:@"resolutionTokenMap_v3_JSONData"];
  objc_super v3 = [(REMCDObject *)self primitiveValueForKey:@"resolutionTokenMap_v3_JSONData"];
  [(REMCDObject *)self didAccessValueForKey:@"resolutionTokenMap_v3_JSONData"];
  [(REMCDObject *)self didAccessValueForKey:@"resolutionTokenMap"];

  return (NSData *)v3;
}

- (id)jsonDataFromResolutionTokenMap:(id)a3
{
  objc_super v3 = [a3 objc_toJSONString];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 dataUsingEncoding:4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)resolutionTokenMapFromJsonData:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
    if (v4)
    {
      id v5 = +[REMResolutionTokenMap objc_newObjectFromJSONString:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)createResolutionTokenMapIfNecessary
{
  objc_opt_class();
  id v4 = [(REMCDObject *)self resolutionTokenMap];
  REMDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    id v5 = objc_alloc_init((Class)REMResolutionTokenMap);
    [(REMCDObject *)self setResolutionTokenMap:v5];
  }

  return v5;
}

- (void)setAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(REMCDObject *)self primitiveValueForKey:@"account"];
  [(REMCDObject *)self setPreviousAccount:v5];

  [(REMCDObject *)self willChangeValueForKey:@"account"];
  [(REMCDObject *)self setPrimitiveValue:v4 forKey:@"account"];

  [(REMCDObject *)self didChangeValueForKey:@"account"];
}

- (void)willSave
{
  v19.receiver = self;
  v19.super_class = (Class)REMCDObject;
  [(REMCDObject *)&v19 willSave];
  uint64_t v3 = [(REMCDObject *)self hack_resolutionTokenMapCopy];
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned __int8 v5 = [(REMCDObject *)self hack_willSaveHandled];

    if ((v5 & 1) == 0)
    {
      [(REMCDObject *)self setHack_willSaveHandled:1];
      unsigned int v6 = [(REMCDObject *)self hack_resolutionTokenMapCopy];
      [(REMCDObject *)self setResolutionTokenMap:v6];
      [(REMCDObject *)self setHack_resolutionTokenMapCopy:0];
      [(REMCDObject *)self setCached_CDResolutionMap:0];
    }
  }
  uint64_t v7 = [(REMCDObject *)self storeControllerManagedObjectContext];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(REMCDObject *)self storeControllerManagedObjectContext];
    uint64_t v10 = [v9 storeController];
    if (!v10)
    {
LABEL_9:

      goto LABEL_10;
    }
    id v11 = (void *)v10;
    __int16 v12 = [(REMCDObject *)self storeControllerManagedObjectContext];
    v13 = [v12 storeController];
    if (![v13 supportsCoreSpotlightIndexing]
      || [(REMCDObject *)self spotlightIndexCountUpdated])
    {

      goto LABEL_9;
    }
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      uint64_t v17 = [(REMCDObject *)self changedValues];
      v8 = [v17 allKeys];

      objc_super v9 = +[NSMutableSet setWithArray:v8];
      id v18 = [(id)objc_opt_class() propertiesThatShouldTriggerReindexing];
      [v9 intersectSet:v18];

      if ([v9 count])
      {
        [self performSelector:spotlightObjectToReindex] incrementSpotlightIndexCount];
        [(REMCDObject *)self setSpotlightIndexCountUpdated:1];
      }
      goto LABEL_9;
    }
  }
LABEL_10:
  if (![(REMCDObject *)self hack_didHandleShouldSyncUpDelete])
  {
    [(REMCDObject *)self setHack_didHandleShouldSyncUpDelete:1];
    [(REMCDObject *)self setShouldSyncUpDeleteIfNeeded];
  }
  if (objc_opt_respondsToSelector()) {
    [(REMCDObject *)self willSave_Swift];
  }
  id v14 = [(REMCDObject *)self identifier];

  if (!v14)
  {
    id v15 = +[REMLogStore write];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_10074F818();
    }
  }
}

- (void)didSave
{
  v3.receiver = self;
  v3.super_class = (Class)REMCDObject;
  [(REMCDObject *)&v3 didSave];
  [(REMCDObject *)self setHack_willSaveHandled:0];
  [(REMCDObject *)self setSpotlightIndexCountUpdated:0];
  [(REMCDObject *)self setHack_didHandleShouldSyncUpDelete:0];
  if (objc_opt_respondsToSelector()) {
    [(REMCDObject *)self didSave_Swift];
  }
  [(REMCDObject *)self setValidateForInsertion_handledJournalEntries:0];
  [(REMCDObject *)self setValidateForUpdate_handledJournalEntries:0];
}

- (void)prepareForDeletion
{
  v3.receiver = self;
  v3.super_class = (Class)REMCDObject;
  [(REMCDObject *)&v3 prepareForDeletion];
  if (objc_opt_respondsToSelector()) {
    [(REMCDObject *)self prepareForDeletion_Swift];
  }
}

- (BOOL)validateForInsert:(id *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)REMCDObject;
  if (!-[REMCDObject validateForInsert:](&v14, "validateForInsert:"))
  {
    unsigned __int8 v6 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  unsigned __int8 v5 = REMDynamicCast();
  if (!v5)
  {
    objc_opt_class();
    unsigned __int8 v5 = REMDynamicCast();
    if (!v5)
    {
      __int16 v12 = [(REMCDObject *)self account];

      if (v12) {
        goto LABEL_5;
      }
      unsigned __int8 v5 = +[REMLogStore write];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_10074F934(self, v5);
      }
    }
  }

LABEL_5:
  unsigned __int8 v6 = [(REMCDObject *)self _validateZoneOwnerNamesWithLogPrefix:@"Inserting" error:a3];
LABEL_7:
  if (![(REMCDObject *)self validateForInsertion_handledJournalEntries]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v7 = self;
    id v13 = 0;
    unsigned __int8 v8 = [(REMCDObject *)v7 validateForInsert_Swift:&v13];
    id v9 = v13;
    if ((v8 & 1) == 0)
    {
      uint64_t v10 = +[REMLogStore write];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_10074F8C0();
      }
    }
    [(REMCDObject *)v7 setValidateForInsertion_handledJournalEntries:1];
    v6 &= v8;
  }
  return v6;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)REMCDObject;
  if (!-[REMCDObject validateForUpdate:](&v24, "validateForUpdate:")) {
    goto LABEL_9;
  }
  uint64_t v5 = [(REMCDObject *)self previousAccount];
  if (!v5) {
    goto LABEL_11;
  }
  unsigned __int8 v6 = (void *)v5;
  uint64_t v7 = [(REMCDObject *)self account];
  if (!v7)
  {

    goto LABEL_11;
  }
  unsigned __int8 v8 = (void *)v7;
  id v9 = [(REMCDObject *)self previousAccount];
  uint64_t v10 = [(REMCDObject *)self account];
  unsigned __int8 v11 = [v9 isEqual:v10];

  if (v11)
  {
LABEL_11:
    LOBYTE(a3) = [(REMCDObject *)self _validateZoneOwnerNamesWithLogPrefix:@"Updating" error:a3];
    goto LABEL_12;
  }
  __int16 v12 = +[REMLogStore write];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10074FA8C(self, v12);
  }

  if (a3)
  {
    id v13 = [(REMCDObject *)self previousAccount];
    objc_super v14 = [v13 remObjectID];
    id v15 = [(REMCDObject *)self account];
    char v16 = [v15 remObjectID];
    uint64_t v17 = [(REMCDObject *)self remObjectID];
    *a3 = +[REMError validationErrorMoveFromAccount:v14 toAccount:v16 objectID:v17];

LABEL_9:
    LOBYTE(a3) = 0;
  }
LABEL_12:
  if (![(REMCDObject *)self validateForUpdate_handledJournalEntries]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v18 = self;
    id v23 = 0;
    unsigned __int8 v19 = [(REMCDObject *)v18 validateForUpdate_Swift:&v23];
    id v20 = v23;
    if ((v19 & 1) == 0)
    {
      id v21 = +[REMLogStore write];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        sub_10074FA18();
      }
    }
    [(REMCDObject *)v18 setValidateForUpdate_handledJournalEntries:1];
    LOBYTE(a3) = a3 & v19;
  }
  return (char)a3;
}

- (NSString)_parentZoneMismatchErrorDebugDescription
{
  return 0;
}

- (BOOL)_validateZoneOwnerNamesWithLogPrefix:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(REMCDObject *)self parentCloudObject];
  if (v7)
  {
    unsigned __int8 v8 = [(REMCDObject *)self ckZoneOwnerName];
    if (!v8) {
      unsigned __int8 v8 = CKCurrentUserDefaultName;
    }
    id v9 = [v7 ckZoneOwnerName];
    if (!v9) {
      id v9 = CKCurrentUserDefaultName;
    }
    unsigned __int8 v10 = [(NSString *)v8 isEqual:v9];
    if ((v10 & 1) == 0)
    {
      unsigned __int8 v11 = [v7 _parentZoneMismatchErrorDebugDescription];
      __int16 v12 = +[REMLogStore write];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        id v18 = objc_opt_class();
        id v20 = v18;
        id v21 = [(REMCDObject *)self remObjectID];
        char v16 = objc_opt_class();
        id v19 = v16;
        [v7 remObjectID];
        *(_DWORD *)buf = 138545154;
        id v23 = v6;
        __int16 v24 = 2114;
        id v25 = v18;
        __int16 v26 = 2114;
        id v27 = v21;
        __int16 v28 = 2114;
        v29 = v8;
        __int16 v30 = 2114;
        unint64_t v31 = v16;
        uint64_t v33 = v32 = 2114;
        uint64_t v17 = (void *)v33;
        __int16 v34 = 2114;
        id v35 = v9;
        __int16 v36 = 2114;
        id v37 = v11;
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Validation Failure: %{public}@ {%{public}@, %{public}@, %{public}@} and its parent {%{public}@, %{public}@, %{public}@, %{public}@} have different zones", buf, 0x52u);
      }
      if (a4)
      {
        id v13 = [(REMCDObject *)self remObjectID];
        objc_super v14 = [v7 remObjectID];
        *a4 = +[REMError validationErrorDifferentZoneObjectID:v13 zoneOwnerName:v8 parentObjectID:v14 parentZoneOwnerName:v9];
      }
    }
  }
  else
  {
    unsigned __int8 v10 = 1;
  }

  return v10;
}

- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately
{
  return 0;
}

- (void)updateDeletedFlagAccordingToOrphanState:(id)a3
{
  unsigned int v4 = [(REMCDObject *)self isConnectedToAccountObject:a3];
  if (v4 != [(REMCDObject *)self markedForDeletion])
  {
    uint64_t v5 = [(REMCDObject *)self changedValues];
    id v6 = [v5 allKeys];
    unsigned int v7 = [v6 containsObject:@"markedForDeletion"];

    if (!v7)
    {
      unsigned __int8 v11 = +[REMLogStore write];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_10074FB70(self, v11);
      }
      goto LABEL_19;
    }
  }
  if (v4)
  {
    unsigned __int8 v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = +[NSNumber numberWithBool:0];
      unsigned __int8 v10 = [(REMCDObject *)self remObjectID];
      int v21 = 138543618;
      unsigned int v22 = v9;
      __int16 v23 = 2114;
      __int16 v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Begin recursiveMarkForDeletion:%{public}@ from %{public}@", (uint8_t *)&v21, 0x16u);
    }
    unsigned __int8 v11 = +[NSMutableSet set];
    __int16 v12 = self;
    uint64_t v13 = 0;
LABEL_13:
    [(REMCDObject *)v12 recursiveMarkForDeletion:v13 usingVisitedMap:v11];
LABEL_19:

    return;
  }
  if (![(REMCDObject *)self shouldMarkAsDeletedInsteadOfDeletingImmediately])
  {
    uint64_t v17 = +[REMLogStore write];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [(REMCDObject *)self remObjectID];
      int v21 = 138543362;
      unsigned int v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Deleting orphan object %{public}@ permanently from local database", (uint8_t *)&v21, 0xCu);
    }
    unsigned __int8 v11 = [(REMCDObject *)self managedObjectContext];
    [v11 deleteObject:self];
    goto LABEL_19;
  }
  if (![(REMCDObject *)self isSharedRootObject]
    || [(REMCDObject *)self isOwnedByCurrentUser])
  {
    objc_super v14 = +[REMLogStore write];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = +[NSNumber numberWithBool:1];
      char v16 = [(REMCDObject *)self remObjectID];
      int v21 = 138543618;
      unsigned int v22 = v15;
      __int16 v23 = 2114;
      __int16 v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Begin recursiveMarkForDeletion:%{public}@ from %{public}@", (uint8_t *)&v21, 0x16u);
    }
    unsigned __int8 v11 = +[NSMutableSet set];
    __int16 v12 = self;
    uint64_t v13 = 1;
    goto LABEL_13;
  }
  id v19 = +[REMLogStore write];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = [(REMCDObject *)self remObjectID];
    int v21 = 138543362;
    unsigned int v22 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Mark shared-to-me root %{public}@ for deletion and recursively deleted all child objects from local database", (uint8_t *)&v21, 0xCu);
  }
  [(REMCDObject *)self markForDeletion];
  [(REMCDObject *)self deleteAllChildrenFromLocalDatabase];
}

- (void)traverseObjectTreeUsingVisitedMap:(id)a3 handler:(id)a4
{
  id v40 = a3;
  id v39 = (uint64_t (**)(id, REMCDObject *))a4;
  id v6 = [(REMCDObject *)self remObjectID];
  if (!v6)
  {
    id obj = +[REMLogStore write];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      sub_10074FC04(self);
    }
    goto LABEL_34;
  }
  if ([v40 containsObject:v6])
  {
    id obj = +[REMLogStore write];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      sub_10074FC94(self);
    }
LABEL_34:

    goto LABEL_35;
  }
  int v7 = v39[2](v39, self);
  [v40 addObject:v6];
  if (v7)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    unsigned __int8 v8 = [(REMCDObject *)self entity];
    id v9 = [v8 relationshipsByName];

    id obj = v9;
    id v10 = [v9 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (!v10) {
      goto LABEL_34;
    }
    id v11 = v10;
    __int16 v32 = v6;
    uint64_t v12 = *(void *)v48;
    uint64_t v33 = *(void *)v48;
    while (1)
    {
      uint64_t v13 = 0;
      id v34 = v11;
      do
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(obj);
        }
        objc_super v14 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v13);
        id v15 = [(REMCDObject *)self entity];
        char v16 = [v15 relationshipsByName];
        uint64_t v17 = [v16 objectForKeyedSubscript:v14];

        id v41 = v17;
        if ([v17 deleteRule] == (id)2)
        {
          __int16 v36 = v13;
          id v38 = v14;
          id v18 = [(REMCDObject *)self objectIDsForRelationshipNamed:v14];
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v19 = [v18 countByEnumeratingWithState:&v43 objects:v55 count:16];
          if (!v19) {
            goto LABEL_30;
          }
          id v20 = v19;
          uint64_t v21 = *(void *)v44;
          while (1)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v44 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              __int16 v24 = [(REMCDObject *)self managedObjectContext];
              id v42 = 0;
              id v25 = [v24 existingObjectWithID:v23 error:&v42];
              id v26 = v42;

              if (v26)
              {
                id v27 = +[REMLogStore write];
                if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
                  goto LABEL_28;
                }
                __int16 v28 = [(REMCDObject *)self entity];
                v29 = [v28 name];
                *(_DWORD *)buf = 138543618;
                v52 = v38;
                __int16 v53 = 2114;
                uint64_t v54 = (uint64_t)v29;
                _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Failed to fetch objects in {relationship: %{public}@} of object {type: %{public}@}", buf, 0x16u);
              }
              else
              {
                objc_opt_class();
                id v27 = REMDynamicCast();
                if (v27
                  && [(REMCDObject *)self shouldCascadeMarkAsDeleteInto:v27 forRelationship:v41])
                {
                  [v27 traverseObjectTreeUsingVisitedMap:v40 handler:v39];
                  goto LABEL_28;
                }
                __int16 v28 = +[REMLogStore write];
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  id v37 = [v27 remObjectID];
                  uint64_t v30 = [v25 objectID];
                  *(_DWORD *)buf = 138412546;
                  v52 = v37;
                  __int16 v53 = 2112;
                  uint64_t v54 = v30;
                  unint64_t v31 = (void *)v30;
                  _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Skipped traverseObjectTreeUsingVisitedMap for {remObjectID: %@, managedObjectID: %@}", buf, 0x16u);
                }
              }

LABEL_28:
            }
            id v20 = [v18 countByEnumeratingWithState:&v43 objects:v55 count:16];
            if (!v20)
            {
LABEL_30:

              uint64_t v12 = v33;
              id v11 = v34;
              uint64_t v13 = v36;
              break;
            }
          }
        }

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      id v11 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (!v11)
      {
        id v6 = v32;
        goto LABEL_34;
      }
    }
  }
LABEL_35:
}

- (void)recursiveMarkForDeletion:(BOOL)a3 usingVisitedMap:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000479A8;
  v4[3] = &unk_1008AF930;
  BOOL v5 = a3;
  v4[4] = self;
  [(REMCDObject *)self traverseObjectTreeUsingVisitedMap:a4 handler:v4];
}

- (void)deleteAllChildrenFromLocalDatabase
{
  objc_super v3 = +[NSMutableSet set];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100047B38;
  v4[3] = &unk_1008AF958;
  v4[4] = self;
  [(REMCDObject *)self traverseObjectTreeUsingVisitedMap:v3 handler:v4];
}

- (id)allChildObjects
{
  objc_super v3 = +[NSMutableArray array];
  unsigned int v4 = +[NSMutableSet set];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100047CA4;
  v9[3] = &unk_1008AF980;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(REMCDObject *)self traverseObjectTreeUsingVisitedMap:v4 handler:v9];

  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (void)fixValueBeforeMarkingForDeletionForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"identifier"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"externalIdentifier"])
    {
      id v5 = [(REMCDObject *)self externalIdentifier];
      id v6 = +[REMExternalSyncMetadataUtils encodeExternalIdentifierForMarkedForDeletionObject:v5];

      [(REMCDObject *)self setValue:v6 forKey:v4];
LABEL_8:

      goto LABEL_9;
    }
    id v7 = [(REMCDObject *)self entity];
    unsigned __int8 v8 = [v7 attributesByName];
    id v9 = [v8 objectForKeyedSubscript:v4];
    id v10 = [v9 attributeType];

    if (v10 != (id)700)
    {
      id v6 = +[REMLogStore write];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_10074FDE8((uint64_t)v4, self);
      }
      goto LABEL_8;
    }
    [(REMCDObject *)self setValue:0 forKey:v4];
  }
LABEL_9:
}

- (void)fixValueBeforeUnmarkingForDeletionForKey:(id)a3
{
  id v6 = a3;
  if ([v6 isEqualToString:@"externalIdentifier"])
  {
    id v4 = [(REMCDObject *)self externalIdentifier];
    id v5 = +[REMExternalSyncMetadataUtils decodeExternalIdentifierForMarkedForDeletionObject:v4];

    [(REMCDObject *)self setValue:v5 forKey:v6];
  }
}

- (BOOL)_allowsObjectSupportedVersion
{
  if ([(REMCDObject *)self shouldMarkAsDeletedInsteadOfDeletingImmediately])
  {
    return 1;
  }
  objc_super v3 = [(id)objc_opt_class() cdEntityName];
  id v4 = +[REMCDAccount cdEntityName];
  unsigned __int8 v5 = [v3 isEqual:v4];

  return v5;
}

- (BOOL)isUnsupported
{
  [(REMCDObject *)self effectiveMinimumSupportedVersion];

  return rem_isUnsupportedVersionByRuntime();
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  if ([(REMCDObject *)self _allowsObjectSupportedVersion])
  {
    id v5 = [(REMCDObject *)self minimumSupportedAppVersion];
    id v6 = +[REMLogStore write];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = +[NSNumber numberWithInteger:a3];
      unsigned __int8 v8 = +[NSNumber numberWithInteger:v5];
      id v9 = [(REMCDObject *)self remObjectID];
      int v13 = 138543874;
      objc_super v14 = v7;
      __int16 v15 = 2114;
      char v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "REMSupportedVersionUpdating: setMinimumSupportedVersion {newValue: %{public}@, oldValue: %{public}@, remObjectID: %{public}@}", (uint8_t *)&v13, 0x20u);
    }
    if (v5 != (id)a3)
    {
      [(REMCDObject *)self setMinimumSupportedAppVersion:a3];
      id v10 = +[REMLogStore write];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [(REMCDObject *)self remObjectID];
        int v13 = 138543362;
        objc_super v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "REMSupportedVersionUpdating: setMinimumSupportedVersion: calling _markObjectDirtyForSupportedVersionValidation on {remObjectID: %{public}@}", (uint8_t *)&v13, 0xCu);
      }
      [(REMCDObject *)self _markDirtyForEffectiveMinimumSupportedVersionValidation];
    }
  }
  else
  {
    uint64_t v12 = +[REMLogStore write];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10074FE84();
    }
  }
}

- (int64_t)effectiveMinimumSupportedVersion
{
  return (int64_t)[(REMCDObject *)self effectiveMinimumSupportedAppVersion];
}

- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3
{
  if ([(REMCDObject *)self _allowsObjectSupportedVersion])
  {
    [(REMCDObject *)self setEffectiveMinimumSupportedAppVersion:a3];
  }
  else
  {
    id v5 = +[REMLogStore write];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10074FF2C();
    }
  }
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  v2 = +[REMLogStore write];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_10074FFD4();
  }

  return kREMSupportedVersionUnset;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  v2 = +[REMLogStore write];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_100750084();
  }

  objc_super v3 = +[NSSet set];

  return v3;
}

- (void)_markDirtyForEffectiveMinimumSupportedVersionValidation
{
  if (![(REMCDObject *)self isDeleted])
  {
    id v5 = [(REMCDObject *)self storeControllerManagedObjectContext];
    objc_super v3 = [v5 managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion];

    if (!v3)
    {
      id v6 = +[REMLogStore write];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_100750134(self);
      }
    }
    id v4 = [(REMCDObject *)self ic_permanentObjectID];
    [v3 addObject:v4];
    goto LABEL_6;
  }
  objc_super v3 = +[REMLogStore write];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(REMCDObject *)self ic_loggingIdentifier];
    int v7 = 138543362;
    unsigned __int8 v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "REMSupportedVersionUpdating: Not actually adding dirty object to managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion because this CoreData object is being deleted {ic_loggingIdentifier: %{public}@}", (uint8_t *)&v7, 0xCu);
LABEL_6:
  }
}

+ (id)relationshipsEligibleForEffectiveMinimumSupportedVersionPropagationWithEntity:(id)a3
{
  id v3 = a3;
  id v16 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v3 relationshipsByName];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [v3 relationshipsByName];
        id v11 = [v10 objectForKeyedSubscript:v9];

        uint64_t v12 = [v11 destinationEntity];
        int v13 = [v12 name];
        unsigned int v14 = [v13 rem_hasPrefixCaseInsensitive:@"REMCD"];

        if (v14 && [v11 deleteRule] == (id)2) {
          [v16 addObject:v11];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v16;
}

- (BOOL)validateEffectiveMinimumSupportedVersionApplyingChange:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(REMCDObject *)self _allowsObjectSupportedVersion];
  if (!v5)
  {
    id v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1007501D0();
    }
    goto LABEL_13;
  }
  int64_t v6 = [(REMCDObject *)self minimumSupportedVersion];
  int64_t v7 = [(REMCDObject *)self parentEffectiveMinimumSupportedVersion];
  int64_t v8 = [(REMCDObject *)self effectiveMinimumSupportedVersion];
  if (v7 <= v6) {
    int64_t v9 = v6;
  }
  else {
    int64_t v9 = v7;
  }
  if (v8 != v9)
  {
    int64_t v11 = v8;
    if (v3) {
      -[REMCDObject setEffectiveMinimumSupportedVersion:](self, "setEffectiveMinimumSupportedVersion:");
    }
    id v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [(REMCDObject *)self remObjectID];
      int v14 = 134218754;
      int64_t v15 = v6;
      __int16 v16 = 2048;
      int64_t v17 = v7;
      __int16 v18 = 2048;
      int64_t v19 = v11;
      __int16 v20 = 2114;
      uint64_t v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "REMSupportedVersionUpdating: validateEffectiveMinimumSupportedVersion indicates that my descendants should also be validated since my effective version changed {myVersion: %lld, parentEffectiveVersion: %lld, oldValue: %lld, remObjectID: %{public}@}", (uint8_t *)&v14, 0x2Au);
    }
LABEL_13:

    return v5;
  }
  return 0;
}

- (REMObjectID)remObjectID
{
  BOOL v3 = [(REMCDObject *)self identifier];
  id v4 = [(REMCDObject *)self entity];
  BOOL v5 = [v4 name];

  int64_t v6 = 0;
  if (v3 && v5)
  {
    int64_t v6 = +[REMObjectID objectIDWithUUID:v3 entityName:v5];
  }

  return (REMObjectID *)v6;
}

- (id)remObjectIDWithError:(id *)a3
{
  uint64_t v4 = [(REMCDObject *)self remObjectID];
  BOOL v5 = (void *)v4;
  if (a3 && !v4)
  {
    *a3 = +[REMError internalErrorWithDebugDescription:@"Failed to create REMObjectID: REMCDObject.identifier or REMCDObject.entity.name is nil."];
  }

  return v5;
}

+ (id)newObjectID
{
  BOOL v3 = +[NSUUID UUID];
  uint64_t v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 cdEntityName];
  int64_t v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  v2 = +[REMLogStore write];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_100750278();
  }

  return (NSString *)@"REMCDObject";
}

+ (BOOL)conformsToREMChangeTrackingIdentifiable
{
  return 1;
}

- (REMCDAccount)previousAccount
{
  return self->previousAccount;
}

- (void)setPreviousAccount:(id)a3
{
}

- (REMResolutionTokenMap)hack_resolutionTokenMapCopy
{
  return self->hack_resolutionTokenMapCopy;
}

- (void)setHack_resolutionTokenMapCopy:(id)a3
{
}

- (BOOL)hack_willSaveHandled
{
  return self->hack_willSaveHandled;
}

- (void)setHack_willSaveHandled:(BOOL)a3
{
  self->hack_willSaveHandled = a3;
}

- (BOOL)hack_didHandleShouldSyncUpDelete
{
  return self->hack_didHandleShouldSyncUpDelete;
}

- (void)setHack_didHandleShouldSyncUpDelete:(BOOL)a3
{
  self->hack_didHandleShouldSyncUpDelete = a3;
}

- (REMResolutionTokenMap)cached_CDResolutionMap
{
  return self->cached_CDResolutionMap;
}

- (void)setCached_CDResolutionMap:(id)a3
{
}

- (BOOL)spotlightIndexCountUpdated
{
  return self->spotlightIndexCountUpdated;
}

- (void)setSpotlightIndexCountUpdated:(BOOL)a3
{
  self->spotlightIndexCountUpdated = a3;
}

- (BOOL)validateForInsertion_handledJournalEntries
{
  return self->validateForInsertion_handledJournalEntries;
}

- (void)setValidateForInsertion_handledJournalEntries:(BOOL)a3
{
  self->validateForInsertion_handledJournalEntries = a3;
}

- (BOOL)validateForUpdate_handledJournalEntries
{
  return self->validateForUpdate_handledJournalEntries;
}

- (void)setValidateForUpdate_handledJournalEntries:(BOOL)a3
{
  self->validateForUpdate_handledJournalEntries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cached_CDResolutionMap, 0);
  objc_storeStrong((id *)&self->hack_resolutionTokenMapCopy, 0);
  objc_storeStrong((id *)&self->previousAccount, 0);
  objc_storeStrong((id *)&self->_ckServerShare, 0);

  objc_storeStrong((id *)&self->_ckServerRecord, 0);
}

+ (BOOL)conformsToICCloudObject
{
  return 1;
}

+ (NSString)ckRecordKeyForMinimumSupportedVersion
{
  return (NSString *)@"MinimumSupportedAppVersion";
}

+ (id)recordTypes
{
  uint64_t v3 = objc_opt_class();
  id v4 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"Abstract method called -[%@ %@]", v3, v4);

  return 0;
}

- (void)clearTransformedCKServerValueCachesOnDidTurnIntoFault
{
  ckServerRecord = self->_ckServerRecord;
  self->_ckServerRecord = 0;

  ckServerShare = self->_ckServerShare;
  self->_ckServerShare = 0;
}

- (void)insertCloudStateOnAwakeFromInsert
{
  uint64_t v3 = [(REMCDObject *)self managedObjectContext];
  if (!v3)
  {
    int64_t v7 = +[REMLog cloudkit];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1007505C0();
    }
  }
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  int64_t v6 = +[NSEntityDescription insertNewObjectForEntityForName:v5 inManagedObjectContext:v3];

  [(REMCDObject *)self setCkCloudState:v6];
}

- (void)insertCloudStateIfNeededOnAwakeFromFetch
{
  uint64_t v3 = [(REMCDObject *)self ckCloudState];

  if (!v3)
  {
    id v4 = +[REMLog cloudkit];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = [(REMCDObject *)self shortLoggingDescription];
      int v11 = 138412290;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Nil cloud state for %@. Sorry. Fixing now.", (uint8_t *)&v11, 0xCu);
    }
    int64_t v6 = [(REMCDObject *)self managedObjectContext];
    if (!v6)
    {
      id v10 = +[REMLog cloudkit];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_1007505C0();
      }
    }
    int64_t v7 = (objc_class *)objc_opt_class();
    int64_t v8 = NSStringFromClass(v7);
    int64_t v9 = +[NSEntityDescription insertNewObjectForEntityForName:v8 inManagedObjectContext:v6];

    [(REMCDObject *)self setCkCloudState:v9];
  }
}

- (id)cloudAccount
{
  v2 = [(REMCDObject *)self parentCloudObject];
  uint64_t v3 = [v2 cloudAccount];

  if (!v3)
  {
    id v4 = +[REMLog cloudkit];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1007505F4();
    }
  }

  return v3;
}

- (NSString)accountCKIdentifier
{
  objc_opt_class();
  uint64_t v3 = REMDynamicCast();
  if (v3)
  {
    id v4 = [(REMCDObject *)self ckIdentifier];
  }
  else
  {
    BOOL v5 = [(REMCDObject *)self account];
    id v4 = [v5 ckIdentifier];
  }

  return (NSString *)v4;
}

- (void)setCkNeedsToBeFetchedFromCloud:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  BOOL v5 = [(REMCDObject *)self primitiveValueForKey:@"ckNeedsToBeFetchedFromCloud"];
  int64_t v6 = REMDynamicCast();
  unsigned int v7 = [v6 BOOLValue];

  if (v7 != v3)
  {
    if (v3) {
      [(REMCDObject *)self clearServerRecord];
    }
    [(REMCDObject *)self willChangeValueForKey:@"ckNeedsToBeFetchedFromCloud"];
    int64_t v8 = +[NSNumber numberWithBool:v3];
    [(REMCDObject *)self setPrimitiveValue:v8 forKey:@"ckNeedsToBeFetchedFromCloud"];

    [(REMCDObject *)self didChangeValueForKey:@"ckNeedsToBeFetchedFromCloud"];
    uint64_t v9 = [(REMCDObject *)self ckDirtyFlags] & 0xFFFFFFFE | v3;
    [(REMCDObject *)self willChangeValueForKey:@"ckDirtyFlags"];
    id v10 = +[NSNumber numberWithShort:v9];
    [(REMCDObject *)self setPrimitiveValue:v10 forKey:@"ckDirtyFlags"];

    [(REMCDObject *)self didChangeValueForKey:@"ckDirtyFlags"];
  }
}

- (void)_setCKIdentifierIfNecessary
{
  BOOL v3 = [(REMCDObject *)self ckIdentifier];

  if (!v3)
  {
    id v4 = [(REMCDObject *)self identifier];
    BOOL v5 = [v4 UUIDString];

    if (!v5)
    {
      int64_t v6 = +[REMLog cloudkit];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_100750744();
      }
    }
    [(REMCDObject *)self setCkIdentifier:v5];
  }
  unsigned int v7 = [(REMCDObject *)self ckIdentifier];

  if (!v7)
  {
    int64_t v8 = +[REMLog cloudkit];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100750694();
    }
  }
}

- (BOOL)shouldSyncUpDelete
{
  return ([(REMCDObject *)self ckDirtyFlags] >> 2) & 1;
}

- (void)setShouldSyncUpDeleteIfNeeded
{
  if ([(REMCDObject *)self _isInICloudAccount])
  {
    if (![(REMCDObject *)self supportsDeletionByTTL])
    {
      if ([(REMCDObject *)self markedForDeletion])
      {
        BOOL v3 = [(REMCDObject *)self managedObjectContext];
        id v4 = [v3 transactionAuthor];
        unsigned __int8 v5 = [v4 hasPrefix:RDStoreControllerICCloudContextAuthor];

        if ((v5 & 1) == 0)
        {
          uint64_t v6 = [(REMCDObject *)self ckDirtyFlags] | 4;
          [(REMCDObject *)self setCkDirtyFlags:v6];
        }
      }
    }
  }
}

- (void)updateChangeCount
{
  if ([(REMCDObject *)self _isInICloudAccount])
  {
    BOOL v3 = [(REMCDObject *)self managedObjectContext];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10004C178;
    v4[3] = &unk_1008ADA80;
    v4[4] = self;
    [v3 performBlockAndWait:v4];
  }
}

- (void)clearChangeCount
{
  BOOL v3 = [(REMCDObject *)self ckCloudState];
  [v3 setCurrentLocalVersion:0];

  id v4 = [(REMCDObject *)self ckCloudState];
  [v4 setLatestVersionSyncedToCloud:0];

  id v5 = [(REMCDObject *)self ckCloudState];
  [v5 setLocalVersionDate:0];
}

- (void)clearServerRecord
{
}

+ (id)ckIdentifierFromRecordName:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 rangeOfString:@"/"];
  id v5 = v3;
  if (v4 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [v3 substringFromIndex:v4 + 1];
  }

  return v5;
}

- (id)ckIdentifierFromRecordName:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() ckIdentifierFromRecordName:v3];

  return v4;
}

+ (REMCDObject)objectWithRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 recordName];
  uint64_t v12 = [a1 ckIdentifierFromRecordName:v11];

  if (!v12) {
    goto LABEL_10;
  }
  objc_opt_class();
  int v13 = REMDynamicCast();
  int v14 = [v13 batchFetchHelper];
  int64_t v15 = v14;
  if (!v14)
  {
LABEL_14:
    __int16 v20 = +[NSPredicate predicateWithFormat:@"ckIdentifier == %@", v12];
    uint64_t v21 = [a1 ic_objectsMatchingPredicate:v20 context:v10];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10004C8E0;
    v37[3] = &unk_1008AFAF8;
    id v38 = v9;
    __int16 v16 = [v21 ic_objectPassingTest:v37];

    if (!v16) {
      goto LABEL_30;
    }
    goto LABEL_15;
  }
  if ([v14 isMissingCKIdentifier:v12 accountIdentifier:v9])
  {
    __int16 v16 = +[REMLog cloudkit];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v40 = v12;
      __int16 v41 = 2114;
      id v42 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "(object.ckIdentifier: %{public}@, accountID: %{public}@) is in batchFetchHelper missing cache", buf, 0x16u);
    }
    goto LABEL_9;
  }
  uint64_t v17 = [v15 cachedManagedObjectForCKIdentifier:v12 accountIdentifier:v9];
  if (!v17)
  {
    int64_t v19 = +[REMLog cloudkit];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v40 = v12;
      __int16 v41 = 2114;
      id v42 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "(object.ckIdentifier: %{public}@, accountID: %{public}@) does not correspond to a batchFetchHelper cachedManagedObject", buf, 0x16u);
    }

    goto LABEL_14;
  }
  __int16 v18 = (void *)v17;
  objc_opt_class();
  __int16 v16 = REMDynamicCast();

  if (!v16) {
    goto LABEL_14;
  }
  if ([v16 isDeleted])
  {
LABEL_9:

LABEL_10:
    __int16 v16 = 0;
    goto LABEL_30;
  }

LABEL_15:
  unsigned int v22 = [v16 account];

  if (!v22)
  {
    uint64_t v23 = +[REMLog cloudkit];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v40 = v12;
      __int16 v41 = 2114;
      id v42 = v9;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "objectWithRecordID: (object.ckIdentifier: %{public}@, accountID: %{public}@) with nil account", buf, 0x16u);
    }

    __int16 v24 = +[REMCDAccount accountWithCKIdentifier:v9 context:v10];
    [v16 setAccount:v24];
    id v25 = [v16 account];

    if (!v25)
    {
      id v26 = +[REMLog cloudkit];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1007507F4();
      }
    }
  }
  id v27 = [v8 zoneID];
  __int16 v28 = [v27 ownerName];

  uint64_t v29 = [v16 ckZoneOwnerName];
  uint64_t v30 = (void *)v29;
  unint64_t v31 = CKCurrentUserDefaultName;
  if (v29) {
    unint64_t v31 = (NSString *)v29;
  }
  __int16 v32 = v31;

  if (([v28 isEqualToString:v32] & 1) == 0)
  {
    uint64_t v33 = +[REMLog cloudkit];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v35 = [v8 recordName];
      __int16 v36 = [v16 ckZoneOwnerName];
      *(_DWORD *)buf = 138543874;
      id v40 = v35;
      __int16 v41 = 2114;
      id v42 = v28;
      __int16 v43 = 2114;
      long long v44 = v36;
      _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "objectWithCKIdentifier zone mismatched: { recordName: %{public}@, zoneOwner: %{public}@ }, but found zoneOwner: %{public}@", buf, 0x20u);
    }
  }

LABEL_30:

  return (REMCDObject *)v16;
}

+ (id)failureCountQueue
{
  if (qword_100922998 != -1) {
    dispatch_once(&qword_100922998, &stru_1008AFB18);
  }
  v2 = (void *)qword_100922990;

  return v2;
}

+ (id)failedToSyncCountsByCKIdentifier
{
  if (qword_1009229A8 != -1) {
    dispatch_once(&qword_1009229A8, &stru_1008AFB38);
  }
  v2 = (void *)qword_1009229A0;

  return v2;
}

- (int64_t)failedToSyncCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(id)objc_opt_class() failureCountQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004CB64;
  v6[3] = &unk_1008AFB60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setFailedToSyncCount:(int64_t)a3
{
  id v5 = [(id)objc_opt_class() failureCountQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004CCB0;
  v6[3] = &unk_1008AF458;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

+ (id)numberOfPushAttemptsToWaitByCKIdentifier
{
  if (qword_1009229B8 != -1) {
    dispatch_once(&qword_1009229B8, &stru_1008AFB80);
  }
  v2 = (void *)qword_1009229B0;

  return v2;
}

- (int64_t)numberOfPushAttemptsToWaitCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(id)objc_opt_class() failureCountQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004CEE0;
  v6[3] = &unk_1008AFB60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setNumberOfPushAttemptsToWaitCount:(int64_t)a3
{
  id v5 = [(id)objc_opt_class() failureCountQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004D02C;
  v6[3] = &unk_1008AF458;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)incrementFailureCounts
{
  if (![(REMCDObject *)self numberOfPushAttemptsToWaitCount]) {
    [(REMCDObject *)self setNumberOfPushAttemptsToWaitCount:3];
  }
  [(REMCDObject *)self setFailedToSyncCount:(char *)[(REMCDObject *)self failedToSyncCount] + 1];
  id v3 = +[REMLog cloudkit];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    unsigned int v6 = [(REMCDObject *)self failedToSyncCount];
    unsigned int v7 = [(REMCDObject *)self failedToSyncCount];
    id v8 = [(REMCDObject *)self loggingDescription];
    int v9 = 138413570;
    uint64_t v10 = v5;
    __int16 v11 = 1024;
    unsigned int v12 = v6;
    __int16 v13 = 1024;
    int v14 = 3;
    __int16 v15 = 1024;
    unsigned int v16 = v7;
    __int16 v17 = 1024;
    int v18 = 6;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ failed to be pushed. Incrementing failedToSyncCount, failure (%d/%d) before being temporarily ignored. (%d/%d) before deleting change tokens and full re-sync. %@", (uint8_t *)&v9, 0x2Eu);
  }
  if ([(REMCDObject *)self failedToSyncCount] >= 6)
  {
    [(REMCDObject *)self clearServerRecord];
    [(REMCDObject *)self deleteChangeTokensAndReSync];
  }
}

- (void)decrementFailureCounts
{
  if ([(REMCDObject *)self numberOfPushAttemptsToWaitCount] >= 1) {
    [(REMCDObject *)self setNumberOfPushAttemptsToWaitCount:(char *)[(REMCDObject *)self numberOfPushAttemptsToWaitCount] - 1];
  }
  id v3 = +[REMLog cloudkit];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    unsigned int v6 = [(REMCDObject *)self numberOfPushAttemptsToWaitCount];
    unsigned int v7 = [(REMCDObject *)self loggingDescription];
    int v8 = 138412802;
    int v9 = v5;
    __int16 v10 = 1024;
    unsigned int v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Decrementing failure counts for %@, %d push attempts before it is retried. %@", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)deleteChangeTokensAndReSync
{
  id v3 = +[REMLog cloudkit];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100750940();
  }

  int64_t v4 = [(id)objc_opt_class() failureCountQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D458;
  block[3] = &unk_1008ADA80;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)resetFailureCounts
{
  [(REMCDObject *)self setFailedToSyncCount:0];

  [(REMCDObject *)self setNumberOfPushAttemptsToWaitCount:0];
}

- (BOOL)shouldBeIgnoredForSync
{
  if ([(REMCDObject *)self failedToSyncCount] < 3
    || [(REMCDObject *)self numberOfPushAttemptsToWaitCount] < 1)
  {
    return 0;
  }
  id v3 = +[REMLog cloudkit];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    unsigned int v6 = [(REMCDObject *)self failedToSyncCount];
    unsigned int v7 = [(REMCDObject *)self numberOfPushAttemptsToWaitCount];
    int v8 = [(REMCDObject *)self loggingDescription];
    int v10 = 138413314;
    unsigned int v11 = v5;
    __int16 v12 = 1024;
    unsigned int v13 = v6;
    __int16 v14 = 1024;
    int v15 = 3;
    __int16 v16 = 1024;
    unsigned int v17 = v7;
    __int16 v18 = 2112;
    __int16 v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ failed to be pushed %d times. Max number of retries is %d. It will now be ignored for %d push attempts. %@", (uint8_t *)&v10, 0x28u);
  }
  return 1;
}

- (id)recordName
{
  [(REMCDObject *)self _setCKIdentifierIfNecessary];
  id v3 = [(REMCDObject *)self ckIdentifier];

  if (v3)
  {
    int64_t v4 = [(REMCDObject *)self recordType];
    id v5 = [(REMCDObject *)self ckIdentifier];
    unsigned int v6 = +[NSString stringWithFormat:@"%@/%@", v4, v5];
  }
  else
  {
    unsigned int v7 = +[REMLog cloudkit];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100750A14();
    }

    unsigned int v6 = &stru_1008D0E58;
  }

  return v6;
}

- (id)recordZoneName
{
  uint64_t v3 = objc_opt_class();
  int64_t v4 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"Abstract method called -[%@ %@]", v3, v4);

  return @"Reminders";
}

- (NSString)ckZoneOwnerName
{
  [(REMCDObject *)self willAccessValueForKey:@"ckZoneOwnerName"];
  uint64_t v3 = [(REMCDObject *)self primitiveCkZoneOwnerName];
  [(REMCDObject *)self didAccessValueForKey:@"ckZoneOwnerName"];
  if (!v3)
  {
    int64_t v4 = [(REMCDObject *)self parentCloudObject];
    id v5 = v4;
    if (v4)
    {
      uint64_t v3 = [v4 ckZoneOwnerName];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }

  return (NSString *)v3;
}

- (id)recordID
{
  uint64_t v3 = [(REMCDObject *)self managedObjectContext];

  if (!v3)
  {
    unsigned int v7 = +[REMLog cloudkit];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100750AC4();
    }
    goto LABEL_16;
  }
  int64_t v4 = [(REMCDObject *)self recordName];

  if (!v4)
  {
    unsigned int v7 = +[REMLog cloudkit];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100750B64();
    }
    goto LABEL_16;
  }
  id v5 = [(REMCDObject *)self recordName];
  unsigned int v6 = [v5 isEqualToString:&stru_1008D0E58];

  if (v6)
  {
    unsigned int v7 = +[REMLog cloudkit];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100750C04();
    }
LABEL_16:

    id v15 = 0;
    goto LABEL_17;
  }
  int v8 = [(REMCDObject *)self recordZoneName];

  if (!v8)
  {
    unsigned int v7 = +[REMLog cloudkit];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100750CA4();
    }
    goto LABEL_16;
  }
  int v9 = [(REMCDObject *)self ckZoneOwnerName];
  if (!v9) {
    int v9 = CKCurrentUserDefaultName;
  }
  int64_t v10 = +[CKRecordZoneID ic_defaultDatabaseScopeForOwnerName:v9];
  id v11 = objc_alloc((Class)CKRecordZoneID);
  __int16 v12 = [(REMCDObject *)self recordZoneName];
  id v13 = [v11 initWithZoneName:v12 ownerName:v9 databaseScope:v10];

  __int16 v14 = [(REMCDObject *)self recordName];
  id v15 = [objc_alloc((Class)CKRecordID) initWithRecordName:v14 zoneID:v13];

LABEL_17:

  return v15;
}

- (int64_t)rd_ckDatabaseScope
{
  v2 = [(REMCDObject *)self recordID];
  id v3 = [v2 rd_ckDatabaseScope];

  return (int64_t)v3;
}

- (id)recordType
{
  uint64_t v3 = objc_opt_class();
  int64_t v4 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"Abstract method called -[%@ %@]", v3, v4);

  return 0;
}

- (BOOL)needsToBeDeletedFromCloud
{
  if ([(REMCDObject *)self supportsDeletionByTTL]
    || ![(REMCDObject *)self isInCloud]
    || ![(REMCDObject *)self markedForDeletion])
  {
    return 0;
  }

  return [(REMCDObject *)self shouldSyncUpDelete];
}

- (BOOL)_isInICloudAccount
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    REMDynamicCast();
  }
  else
  {
    [(REMCDObject *)self account];
  uint64_t v3 = };
  if ([v3 debugSyncDisabled])
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    id v5 = [v3 accountTypeHost];
    unsigned __int8 v4 = [v5 isCloudKit];
  }
  return v4;
}

- (BOOL)isInICloudAccount
{
  v2 = self;
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(REMCDObject *)self managedObjectContext];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004DD5C;
  v5[3] = &unk_1008ADB18;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isValidObject
{
  v2 = self;
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(REMCDObject *)self managedObjectContext];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004DE68;
  v5[3] = &unk_1008ADB18;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  return 0;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[REMCDAccount cloudKitAccountWithCKIdentifier:v9 context:v10];
  if (v11)
  {
    id v12 = [a1 newCloudObjectForRecord:v8 account:v11 context:v10];
  }
  else
  {
    id v13 = +[REMLog cloudkit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      id v15 = [v8 recordID];
      __int16 v16 = [v15 recordName];
      unsigned int v17 = (objc_class *)objc_opt_class();
      __int16 v18 = NSStringFromClass(v17);
      int v19 = 138543874;
      __int16 v20 = v16;
      __int16 v21 = 2114;
      id v22 = v9;
      __int16 v23 = 2114;
      __int16 v24 = v18;
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Cannot get CK account for newCloudObjectForRecord {record: %{public}@, accountID: %{public}@, class: %{public}@}", (uint8_t *)&v19, 0x20u);
    }
    id v12 = 0;
  }

  return v12;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  return 0;
}

+ (id)newObjectWithCKRecordName:(id)a3 context:(id)a4 account:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 ckIdentifierFromRecordName:a3];
  id v11 = [a1 newObjectWithCKIdentifier:v10 context:v9 account:v8];

  return v11;
}

+ (id)newObjectWithCKIdentifier:(id)a3 context:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![a1 isAbstract])
  {
    id v11 = [a1 cdEntityName];
    if (!v11)
    {
      id v13 = +[REMLog cloudkit];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        sub_100751038();
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      long long v44 = sub_10004E764;
      *(void *)long long v45 = sub_10004E774;
      *(void *)&v45[8] = [a1 entity];
      __int16 v14 = *(void **)(*(void *)&buf[8] + 40);
      if (!v14)
      {
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_10004E77C;
        v42[3] = &unk_1008AFA70;
        v42[4] = buf;
        v42[5] = a1;
        [v9 performBlockAndWait:v42];
        __int16 v14 = *(void **)(*(void *)&buf[8] + 40);
      }
      id v11 = [v14 name];
      if (!v11)
      {
        uint64_t v33 = +[REMLog cloudkit];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
          sub_100751004();
        }
      }
      _Block_object_dispose(buf, 8);
    }
    id v15 = +[REMCDAccount cdEntityName];
    unsigned int v16 = [v11 isEqual:v15];

    if (v16)
    {
      unsigned int v17 = +[REMLog cloudkit];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_100750DD8();
      }
    }
    else if (v10)
    {
      __int16 v18 = [v10 ckIdentifier];
      BOOL v19 = v18 == 0;

      if (!v19)
      {
        id v12 = +[NSEntityDescription insertNewObjectForEntityForName:v11 inManagedObjectContext:v9];
        if (!v12)
        {
          id v34 = +[REMLog cloudkit];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          {
            __int16 v36 = [v10 ckIdentifier];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v11;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v8;
            *(_WORD *)&buf[22] = 2114;
            long long v44 = v36;
            _os_log_fault_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!newObject) -- Unexpected error: Could not create and insert new object with {entity: %{public}@, ckIdentifier: %{public}@, account.ckID: %{public}@}", buf, 0x20u);
          }
        }
        id v20 = [objc_alloc((Class)NSUUID) initWithUUIDString:v8];
        [v12 setIdentifier:v20];

        __int16 v21 = [v12 identifier];
        LODWORD(v20) = v21 == 0;

        if (v20)
        {
          id v22 = +[REMLog cloudkit];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
            sub_100750F9C();
          }

          __int16 v23 = +[NSUUID UUID];
          [v12 setIdentifier:v23];
        }
        [v12 setCkIdentifier:v8];
        [v12 setAccount:v10];
        objc_opt_class();
        unsigned int v17 = REMDynamicCast();
        __int16 v41 = [v17 batchFetchHelper];
        if (!v41)
        {
          id v35 = +[REMLog cloudkit];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
            sub_100750F68();
          }
        }
        if (v8 && v12)
        {
          __int16 v24 = [v12 accountCKIdentifier];
          [v41 setCachedManagedObject:v12 forCKIdentifier:v8 accountIdentifier:v24];
        }
        objc_opt_class();
        id v25 = REMDynamicCast();
        id v26 = v25;
        if (v25)
        {
          id v27 = [v25 identifier];
          __int16 v28 = [v27 UUIDString];
          [v26 setDaCalendarItemUniqueIdentifier:v28];
        }
        uint64_t v29 = +[REMLog cloudkit];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          id v40 = [v12 shortLoggingDescription];
          id v39 = [v12 identifier];
          id v38 = [v12 ckIdentifier];
          id v37 = [v26 daCalendarItemUniqueIdentifier];
          uint64_t v30 = [v10 ckIdentifier];
          unint64_t v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 isPlaceholder]);
          *(_DWORD *)buf = 138544642;
          *(void *)&uint8_t buf[4] = v40;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v39;
          *(_WORD *)&buf[22] = 2114;
          long long v44 = v38;
          *(_WORD *)long long v45 = 2114;
          *(void *)&v45[2] = v37;
          *(_WORD *)&v45[10] = 2114;
          *(void *)&v45[12] = v30;
          __int16 v46 = 2114;
          long long v47 = v31;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Creating REMCDObject for CloudKit: %{public}@ .identifier=%{public}@ .ckIdentifier=%{public}@ .daCalendarItemUniqueIdentifier=%{public}@ .account.ckIdentifier=%{public}@, isPlaceholder=%{public}@", buf, 0x3Eu);
        }
        goto LABEL_36;
      }
      unsigned int v17 = +[REMLog cloudkit];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_100750ED4((objc_class *)a1);
      }
    }
    else
    {
      unsigned int v17 = +[REMLog cloudkit];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_100750E40((objc_class *)a1);
      }
    }
    id v12 = 0;
LABEL_36:

    goto LABEL_37;
  }
  id v11 = +[REMLog cloudkit];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100750D44((objc_class *)a1);
  }
  id v12 = 0;
LABEL_37:

  return v12;
}

+ (id)newPlaceholderObjectForRecordID:(id)a3 account:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 recordName];
  id v12 = [a1 ckIdentifierFromRecordName:v11];

  id v13 = [v10 zoneID];

  id v14 = [a1 newObjectWithCKIdentifier:v12 context:v8 account:v9];
  [v14 setCkNeedsInitialFetchFromCloud:1];
  [v14 setInCloud:1];
  id v15 = [a1 objectCkZoneOwnerNameFromCKRecordZoneID:v13];
  [v14 setCkZoneOwnerName:v15];

  [v14 setAccount:v9];
  return v14;
}

+ (id)allCloudObjectsPredicate
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  unsigned __int8 v4 = NSStringFromClass(v3);
  id v5 = NSStringFromClass((Class)a1);
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v8 = +[REMLog cloudkit];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10075106C();
    }

    id v9 = +[NSException exceptionWithName:@"MethodCalledOnAbstractClass" reason:@"Should not call +allCloudObjectsPredicate on the abstract 'REMCDObject'" userInfo:0];
    objc_exception_throw(v9);
  }

  return +[REMCDAccount predicateForCloudKitAccountsWithKeyPathPrefix:@"account"];
}

+ (id)allCloudObjectsInContext:(id)a3
{
  id v4 = a3;
  id v5 = [a1 allCloudObjectsPredicate];
  unsigned int v6 = NSStringFromSelector("ckCloudState");
  id v10 = v6;
  unsigned int v7 = +[NSArray arrayWithObjects:&v10 count:1];
  id v8 = [a1 ic_objectsMatchingPredicate:v5 sortDescriptors:0 propertiesToFetch:0 relationshipKeyPathsForPrefetching:v7 context:v4];

  return v8;
}

+ (id)allCloudObjectIDsInContext:(id)a3
{
  id v4 = a3;
  id v5 = [a1 allCloudObjectsPredicate];
  unsigned int v6 = [a1 ic_objectIDsMatchingPredicate:v5 context:v4];

  return v6;
}

+ (id)allDirtyCloudObjectsPredicate
{
  return +[NSPredicate predicateWithFormat:@"ckDirtyFlags > 0"];
}

+ (id)allDirtyCloudObjectIDsInContext:(id)a3
{
  id v4 = a3;
  id v5 = [a1 allDirtyCloudObjectsPredicate];
  unsigned int v6 = [a1 ic_objectIDsMatchingPredicate:v5 context:v4];

  return v6;
}

- (void)recursivelyFixCrossZoneRelationshipWithVisitedMap:(id)a3 perObjectHandler:(id)a4
{
  id v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004EC5C;
  v9[3] = &unk_1008AFBA8;
  id v10 = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(REMCDObject *)v8 traverseObjectTreeUsingVisitedMap:a3 handler:v9];
}

- (id)newlyCreatedRecord
{
  uint64_t v3 = [(REMCDObject *)self ckServerRecord];
  id v4 = [v3 copy];

  if (!v4)
  {
    id v5 = [(REMCDObject *)self recordID];
    if (v5)
    {
      id v6 = objc_alloc((Class)CKRecord);
      id v7 = [(REMCDObject *)self recordType];
      id v4 = [v6 initWithRecordType:v7 recordID:v5];
    }
    else
    {
      id v8 = +[REMLog cloudkit];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_100751160(self);
      }

      id v4 = 0;
    }
  }
  id v9 = [(REMCDObject *)self parentCloudObject];
  id v10 = [v9 recordID];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 zoneID];
    id v13 = [v4 recordID];
    id v14 = [v13 zoneID];
    unsigned int v15 = [v12 isEqual:v14];

    if (v15)
    {
      [v4 setParent:0];
      unsigned int v16 = [objc_alloc((Class)CKReference) initWithRecordID:v11 action:0];
      [v4 setParent:v16];
    }
    else
    {
      unsigned int v16 = +[REMLog cloudkit];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        id v27 = objc_opt_class();
        id v33 = v27;
        __int16 v28 = [v4 recordID];
        uint64_t v29 = [v28 ic_loggingDescription];
        uint64_t v30 = objc_opt_class();
        id v32 = v30;
        unint64_t v31 = [v11 ic_loggingDescription];
        *(_DWORD *)buf = 138544130;
        id v35 = v27;
        __int16 v36 = 2114;
        id v37 = v29;
        __int16 v38 = 2114;
        id v39 = v30;
        __int16 v40 = 2114;
        __int16 v41 = v31;
        _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Not creating cross-zone parent record relationship from %{public}@ %{public}@ to parent %{public}@ %{public}@", buf, 0x2Au);
      }
    }
  }
  else if (objc_msgSend(v4, "ic_isOwnedByCurrentUser"))
  {
    [v4 setParent:0];
  }
  if ([(REMCDObject *)self supportsDeletionByTTL]
    && ([(REMCDObject *)self isOwnedByCurrentUser]
     || ![(REMCDObject *)self isSharedRootObject]))
  {
    unsigned int v17 = +[NSNumber numberWithBool:[(REMCDObject *)self markedForDeletion]];
    [v4 setObject:v17 forKeyedSubscript:@"Deleted"];
  }
  __int16 v18 = +[REMCDObject ckRecordKeyForMinimumSupportedVersion];
  int64_t v19 = [(REMCDObject *)self minimumSupportedVersion];
  if (v19 == kREMSupportedVersionUnset)
  {
    [v4 setObject:0 forKeyedSubscript:v18];
  }
  else
  {
    id v20 = +[NSNumber numberWithInteger:[(REMCDObject *)self minimumSupportedVersion]];
    [v4 setObject:v20 forKeyedSubscript:v18];
  }
  objc_opt_class();
  id v22 = [(REMCDObject *)self resolutionTokenMap];
  __int16 v23 = REMDynamicCast();

  if (v23)
  {
    __int16 v24 = [v23 objc_toJSONString];
    if (v24)
    {
      [v4 setObject:v24 forKeyedSubscript:@"ResolutionTokenMap"];
    }
    else
    {
      id v25 = +[REMLog cloudkit];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1007510F8();
      }
    }
  }

  [v4 setObject:&off_1008D73F0 forKeyedSubscript:@"Imported"];

  return v4;
}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 recordType];
  id v9 = [(REMCDObject *)self recordType];
  unsigned __int8 v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v30 = +[REMLog cloudkit];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      sub_100751324(v6);
    }
  }
  unsigned int v11 = [(REMCDObject *)self hasSuccessfullyPushedLatestVersionToCloud];
  self->_mergeDataRefusedToMergeMarkedForDeletion = 0;
  self->_mergeDataRevertedLocallyMarkedForDeletion = 0;
  id v12 = [v6 objectForKeyedSubscript:@"Deleted"];

  if (v12)
  {
    id v13 = [v6 objectForKeyedSubscript:@"Deleted"];
    id v14 = [v13 BOOLValue];

    unsigned int v15 = [(REMCDObject *)self markedForDeletion];
    if (v14 != [(REMCDObject *)self markedForDeletion])
    {
      unsigned int v16 = v14 ^ 1 | v11;
      unsigned int v17 = +[REMLog cloudkit];
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v16 == 1)
      {
        if (v18)
        {
          int64_t v19 = [(REMCDObject *)self shortLoggingDescription];
          int v31 = 138543362;
          id v32 = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ marked for deletion when merging data from record", (uint8_t *)&v31, 0xCu);
        }
        [(REMCDObject *)self setMarkedForDeletion:v14];
      }
      else
      {
        if (v18)
        {
          id v20 = [(REMCDObject *)self shortLoggingDescription];
          int v31 = 138543362;
          id v32 = v20;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Setting mergeDataRefusedToMergeMarkedForDeletion=YES for %{public}@ when merging data from record", (uint8_t *)&v31, 0xCu);
        }
        self->_mergeDataRefusedToMergeMarkedForDeletion = 1;
      }
    }
    if (((v14 | v15 ^ 1) & 1) == 0)
    {
      [(REMCDObject *)self unmarkForDeletion];
      __int16 v21 = +[REMLog cloudkit];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [(REMCDObject *)self shortLoggingDescription];
        int v31 = 138543362;
        id v32 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Setting mergeDataRevertedLocallyMarkedForDeletion=YES for %{public}@ when merging data from record", (uint8_t *)&v31, 0xCu);
      }
      self->_mergeDataRevertedLocallyMarkedForDeletion = 1;
    }
  }
  self->_shouldPerformCloudSchemaCatchUpSync = 0;
  objc_opt_class();
  __int16 v23 = [(REMCDObject *)self managedObjectContext];
  __int16 v24 = REMDynamicCast();

  id v25 = [v24 cloudSchemaCatchUpSyncContextsByAccountIdentifier];
  id v26 = [v25 objectForKey:v7];

  if ([v26 shouldPerformCloudSchemaCatchUpSync]) {
    self->_shouldPerformCloudSchemaCatchUpSync = 1;
  }
  objc_opt_class();
  char v27 = objc_opt_respondsToSelector();
  __int16 v28 = +[REMLog cloudkit];
  uint64_t v29 = (REMCDObject *)v28;
  if (v27)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_1007511E4();
    }

    uint64_t v29 = self;
    [(id)objc_opt_class() mergeSystemPropertiesIntoCDObject:v29 fromCKRecord:v6];
  }
  else if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    sub_100751284();
  }
}

+ (BOOL)shouldSyncToCloud
{
  return 1;
}

- (BOOL)needsToBePushedToCloud
{
  if (![(id)objc_opt_class() shouldSyncToCloud]) {
    return 0;
  }
  if ([(REMCDObject *)self ckNeedsToBeFetchedFromCloud]) {
    return 0;
  }
  if ([(REMCDObject *)self ckNeedsInitialFetchFromCloud]) {
    return 0;
  }
  uint64_t v3 = [(REMCDObject *)self ckCloudState];
  id v4 = [v3 latestVersionSyncedToCloud];
  id v5 = [(REMCDObject *)self ckCloudState];
  id v6 = [v5 currentLocalVersion];

  if ((uint64_t)v4 >= (uint64_t)v6) {
    return 0;
  }
  id v7 = [(REMCDObject *)self ckCloudState];
  int64_t v8 = -[REMCDObject isPushingSameOrLaterThanVersion:](self, "isPushingSameOrLaterThanVersion:", [v7 currentLocalVersion]);

  if (v8
    || [(REMCDObject *)self markedForDeletion]
    && ![(REMCDObject *)self isInCloud])
  {
    return 0;
  }
  if ([(REMCDObject *)self isSharedReadOnly]) {
    return 0;
  }
  unsigned int v11 = [(REMCDObject *)self parentCloudObject];
  if ([v11 ckNeedsInitialFetchFromCloud])
  {
    id v12 = [(REMCDObject *)self parentCloudObject];
    unsigned __int8 v9 = [v12 isInCloud];
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (void)forcePushToCloud
{
  if ([(REMCDObject *)self isPlaceholder])
  {
    uint64_t v3 = objc_opt_class();
    id v4 = [(REMCDObject *)self ckIdentifier];
    id v5 = +[NSString stringWithFormat:@"Placeholder %@ { %@ } forcePushToCloud", v3, v4];

    [(id)objc_opt_class() faultAndPromptToFileRadarWithICTap2RadarType:4 title:@"Placeholder forcePushToCloud" description:&stru_1008D0E58 logMessage:v5];
  }
  else
  {
    [(REMCDObject *)self setCkNeedsToBeFetchedFromCloud:0];
    [(REMCDObject *)self setCkNeedsInitialFetchFromCloud:0];
    if ([(REMCDObject *)self markedForDeletion]) {
      [(REMCDObject *)self setInCloud:1];
    }
    [(REMCDObject *)self updateChangeCount];
  }
}

+ (id)keyPathsForValuesAffectingNeedsToBePushedToCloud
{
  return +[NSSet setWithObjects:@"ckNeedsToBeFetchedFromCloud", @"ckNeedsInitialFetchFromCloud", 0];
}

- (BOOL)hasSuccessfullyPushedLatestVersionToCloud
{
  uint64_t v3 = [(REMCDObject *)self ckCloudState];
  id v4 = [v3 latestVersionSyncedToCloud];
  id v5 = [(REMCDObject *)self ckCloudState];
  LOBYTE(v4) = (uint64_t)v4 >= (uint64_t)[v5 currentLocalVersion];

  return (char)v4;
}

- (BOOL)needsToFetchAfterServerRecordChanged:(id)a3
{
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [v3 allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned __int8 v9 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        unsigned __int8 v10 = [(id)objc_opt_class() needsToReFetchServerRecordValue:v9];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

+ (BOOL)needsToReFetchServerRecordValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 fileURL];
    BOOL v6 = v5 == 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v4;
      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v14;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            if (objc_msgSend(a1, "needsToReFetchServerRecordValue:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
            {

              BOOL v6 = 1;
              goto LABEL_15;
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    BOOL v6 = 0;
  }
LABEL_15:

  return v6;
}

- (void)objectWasDeletedFromCloud
{
}

- (void)objectWasDeletedFromCloudByAnotherDevice
{
  [(REMCDObject *)self setInCloud:0];
  if ([(REMCDObject *)self isSharedViaICloud]
    && ![(REMCDObject *)self isOwnedByCurrentUser])
  {
    id v5 = +[REMLog cloudkit];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = [(REMCDObject *)self shortLoggingDescription];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Shared object was deleted %@", (uint8_t *)&v7, 0xCu);
    }
    [(REMCDObject *)self setMarkedForDeletion:1];
    goto LABEL_11;
  }
  if ([(REMCDObject *)self hasSuccessfullyPushedLatestVersionToCloud])
  {
    id v3 = +[REMLog cloudkit];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(REMCDObject *)self shortLoggingDescription];
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Marking %@ for deletion after being deleted from cloud by another device", (uint8_t *)&v7, 0xCu);
    }
    [(REMCDObject *)self setMarkedForDeletion:1];
    if ([(REMCDObject *)self shouldBeDeletedFromLocalDatabase]) {
LABEL_11:
    }
      [(REMCDObject *)self deleteFromLocalDatabase];
  }
}

- (void)objectWillBePushedToCloudWithOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(REMCDObject *)self ckCloudState];
  -[REMCDObject setVersion:forOperation:](self, "setVersion:forOperation:", [v5 currentLocalVersion], v4);
}

- (void)objectFailedToBePushedToCloudWithOperation:(id)a3 recordID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [v8 database];
  id v12 = [v11 container];
  long long v13 = [v12 options];
  long long v14 = [v13 accountOverrideInfo];
  long long v15 = [v14 accountID];

  if (![v15 length])
  {
    long long v16 = +[REMLog cloudkit];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_1007513C4(v8);
    }
  }
  uint64_t v17 = (uint64_t)[v10 code];
  if (v17 > 19)
  {
    if (v17 > 25)
    {
      if (v17 != 26)
      {
        if (v17 != 31) {
          goto LABEL_26;
        }
        id v25 = +[REMLog cloudkit];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          id v35 = [v9 ic_loggingDescription];
          __int16 v36 = [v8 ic_loggingDescription];
          *(_DWORD *)buf = 138544130;
          id v42 = v15;
          __int16 v43 = 2112;
          long long v44 = v35;
          __int16 v45 = 2114;
          __int16 v46 = v36;
          __int16 v47 = 2114;
          id v48 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Reference violation for server record in account ID %{public}@: %@ %{public}@: %{public}@", buf, 0x2Au);
        }
        [(REMCDObject *)self fixBrokenReferences];
      }
    }
    else if (v17 != 20 && v17 != 22)
    {
      goto LABEL_26;
    }
  }
  else if ((unint64_t)(v17 - 6) >= 2)
  {
    if (v17 != 11)
    {
      if (v17 == 14)
      {
        BOOL v18 = [v10 userInfo];
        int64_t v19 = [v18 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey];

        if (v19)
        {
          unsigned int v20 = [(REMCDObject *)self needsToFetchAfterServerRecordChanged:v19];
          __int16 v21 = +[REMLog cloudkit];
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (!v20)
          {
            if (v22)
            {
              uint64_t v29 = [v19 ic_loggingDescription];
              uint64_t v30 = [v8 ic_loggingDescription];
              *(_DWORD *)buf = 138544130;
              id v42 = v15;
              __int16 v43 = 2112;
              long long v44 = v29;
              __int16 v45 = 2114;
              __int16 v46 = v30;
              __int16 v47 = 2112;
              id v48 = v10;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Server record changed in account ID %{public}@: %@ %{public}@: %@", buf, 0x2Au);
            }
            if (v15)
            {
              __int16 v40 = [(REMCDObject *)self ckServerRecord];
              int v31 = [v40 recordID];
              id v32 = [v31 zoneID];
              id v33 = [v19 recordID];
              id v34 = [v33 zoneID];
              unsigned __int8 v39 = [v32 isEqual:v34];

              if ((v39 & 1) == 0) {
                [(REMCDObject *)self setCkServerRecord:0];
              }
              [(REMCDObject *)self objectWasFetchedFromCloudWithRecord:v19 accountID:v15];
            }
            goto LABEL_36;
          }
          if (!v22)
          {
LABEL_29:

            [(REMCDObject *)self setCkNeedsToBeFetchedFromCloud:1];
LABEL_36:

            goto LABEL_37;
          }
          __int16 v23 = [v19 ic_loggingDescription];
          __int16 v24 = [v8 ic_loggingDescription];
          *(_DWORD *)buf = 138544130;
          id v42 = v15;
          __int16 v43 = 2112;
          long long v44 = v23;
          __int16 v45 = 2112;
          __int16 v46 = v24;
          __int16 v47 = 2112;
          id v48 = v10;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Server record changed (needs refetch) in account ID %{public}@: %@ %@: %@", buf, 0x2Au);
        }
        else
        {
          __int16 v21 = +[REMLog cloudkit];
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
            goto LABEL_29;
          }
          __int16 v23 = [(REMCDObject *)self shortLoggingDescription];
          __int16 v24 = [v8 ic_loggingDescription];
          *(_DWORD *)buf = 138544130;
          id v42 = v15;
          __int16 v43 = 2114;
          long long v44 = v23;
          __int16 v45 = 2114;
          __int16 v46 = v24;
          __int16 v47 = 2112;
          id v48 = v10;
          _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Server record changed with no server record in the error in account ID %{public}@: %{public}@ %{public}@: %@", buf, 0x2Au);
        }

        goto LABEL_29;
      }
LABEL_26:
      int64_t v19 = +[REMLog cloudkit];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        char v27 = [v9 ic_loggingDescription];
        __int16 v28 = [v8 ic_loggingDescription];
        *(_DWORD *)buf = 138544130;
        id v42 = v15;
        __int16 v43 = 2112;
        long long v44 = v27;
        __int16 v45 = 2114;
        __int16 v46 = v28;
        __int16 v47 = 2112;
        id v48 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error pushing in account ID %{public}@: %@ %{public}@: %@", buf, 0x2Au);
      }
      goto LABEL_36;
    }
    id v26 = +[REMLog cloudkit];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v37 = [v9 ic_loggingDescription];
      __int16 v38 = [v8 ic_loggingDescription];
      *(_DWORD *)buf = 138544130;
      id v42 = v15;
      __int16 v43 = 2112;
      long long v44 = v37;
      __int16 v45 = 2114;
      __int16 v46 = v38;
      __int16 v47 = 2112;
      id v48 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Invalid cached server record in account ID %{public}@: %@ %{public}@: %@", buf, 0x2Au);
    }
    [(REMCDObject *)self setCkServerRecord:0];
  }
LABEL_37:
  [(id)objc_opt_class() deleteTemporaryAssetFilesForOperation:v8];
}

- (void)objectWasPushedToCloudWithOperation:(id)a3 serverRecord:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [(REMCDObject *)self versionForOperation:v7];
  id v9 = [(REMCDObject *)self ckCloudState];
  id v10 = [v9 latestVersionSyncedToCloud];

  if (v8 > (uint64_t)v10)
  {
    BOOL v11 = [(REMCDObject *)self ckCloudState];
    [v11 setLatestVersionSyncedToCloud:v8];
  }
  [(id)objc_opt_class() deleteTemporaryAssetFilesForOperation:v7];

  [(REMCDObject *)self resetFailureCounts];
  [(REMCDObject *)self setInCloud:1];
  [(REMCDObject *)self setCkDirtyFlags:(unint64_t)[(REMCDObject *)self ckDirtyFlags] & 0xFFFFFFFD];
  uint64_t v12 = [(REMCDObject *)self ckServerRecord];
  if (!v12) {
    goto LABEL_8;
  }
  long long v13 = (void *)v12;
  long long v14 = [(REMCDObject *)self ckServerRecord];
  long long v15 = [v14 modificationDate];
  long long v16 = [v6 modificationDate];
  unsigned __int8 v17 = [v15 ic_isLaterThanDate:v16];

  if (v17)
  {
    BOOL v18 = +[REMLog cloudkit];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_100751458(v6);
    }
  }
  else
  {
LABEL_8:
    [(REMCDObject *)self setCkServerRecord:v6];
  }
}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [v6 objectForKeyedSubscript:@"Deleted"];
  if ([v8 BOOLValue])
  {
    unsigned __int8 v9 = [(REMCDObject *)self markedForDeletion];

    if (v9)
    {
      unsigned int v10 = 0;
      goto LABEL_9;
    }
  }
  else
  {
  }
  objc_opt_class();
  BOOL v11 = [(REMCDObject *)self managedObjectContext];
  uint64_t v12 = REMDynamicCast();

  long long v13 = [v12 cloudSchemaCatchUpSyncContextsByAccountIdentifier];
  long long v14 = [v13 objectForKey:v7];

  if ([v14 shouldPerformCloudSchemaCatchUpSync]) {
    unsigned int v10 = +[ICCloudSchemaCompatibilityUtils isCloudSchemaCatchUpSyncNeededForExistingCloudObject:persistenceCloudSchemaVersion:](ICCloudSchemaCompatibilityUtils, "isCloudSchemaCatchUpSyncNeededForExistingCloudObject:persistenceCloudSchemaVersion:", self, [v14 persistenceCloudSchemaVersion]);
  }
  else {
    unsigned int v10 = 0;
  }

LABEL_9:
  long long v15 = [v6 recordChangeTag];
  if (v15)
  {
    long long v16 = [(REMCDObject *)self ckServerRecord];
    unsigned __int8 v17 = [v16 recordChangeTag];
    unsigned int v18 = [v17 isEqualToString:v15] ^ 1;
  }
  else
  {
    unsigned int v18 = 0;
  }
  if ((v10 | v18) == 1)
  {
    if (v10)
    {
      int64_t v19 = +[REMLog cloudkit];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v20 = [(REMCDObject *)self remObjectID];
        int v35 = 138543618;
        id v36 = v7;
        __int16 v37 = 2114;
        __int16 v38 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Object fetched from cloud and is an entity that should perform CloudSchemaCatchUpSync, force merging data from CKRecord {accountID: %{public}@, remObjectID: %{public}@}", (uint8_t *)&v35, 0x16u);
      }
    }
    [(REMCDObject *)self mergeDataFromRecord:v6 accountID:v7];
    uint64_t v21 = [(REMCDObject *)self ckServerRecord];
    if (!v21) {
      goto LABEL_25;
    }
    BOOL v22 = (void *)v21;
    __int16 v23 = [(REMCDObject *)self ckServerRecord];
    __int16 v24 = [v23 modificationDate];
    id v25 = [v6 modificationDate];
    unsigned __int8 v26 = [v24 ic_isLaterThanDate:v25];

    if (v26)
    {
      char v27 = +[REMLog cloudkit];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1007514F4(v6);
      }
    }
    else
    {
LABEL_25:
      [(REMCDObject *)self setCkServerRecord:v6];
    }
    uint64_t v30 = [v6 share];
    if (v30)
    {
    }
    else
    {
      int v31 = [(REMCDObject *)self ckServerShare];

      if (v31)
      {
        id v32 = +[REMLog cloudkit];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = [(REMCDObject *)self ckServerShare];
          id v34 = [v33 ic_loggingDescription];
          int v35 = 138412290;
          id v36 = v34;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Object fetched does not have a share removing our severShare: %@", (uint8_t *)&v35, 0xCu);
        }
        [(REMCDObject *)self setCkServerShare:0];
      }
    }
    [(REMCDObject *)self setCkNeedsInitialFetchFromCloud:0];
    [(REMCDObject *)self setInCloud:1];
    if (![(REMCDObject *)self supportsDeletionByTTL]) {
      [(REMCDObject *)self setMarkedForDeletion:0];
    }
    [(REMCDObject *)self updateParentReferenceIfNecessary];
  }
  else
  {
    __int16 v28 = +[REMLog cloudkit];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = [v6 ic_loggingDescription];
      int v35 = 138412290;
      id v36 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Not merging fetched record with same change tag %@", (uint8_t *)&v35, 0xCu);
    }
  }
  [(REMCDObject *)self setCkNeedsToBeFetchedFromCloud:0];
}

- (void)objectWasFetchedButDoesNotExistInCloud
{
  id v3 = [(REMCDObject *)self recordID];
  unsigned int v4 = [v3 ic_isOwnedByCurrentUser];

  if (v4)
  {
    [(REMCDObject *)self setCkServerRecord:0];
    [(REMCDObject *)self setCkNeedsInitialFetchFromCloud:0];
    [(REMCDObject *)self setCkNeedsToBeFetchedFromCloud:0];
    [(REMCDObject *)self setInCloud:0];
  }
  else
  {
    id v5 = +[REMLog cloudkit];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(REMCDObject *)self shortLoggingDescription];
      int v7 = 138412290;
      int64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting shared %@ because it no longer exists in cloud", (uint8_t *)&v7, 0xCu);
    }
    [(REMCDObject *)self deleteFromLocalDatabase];
  }
}

+ (id)temporaryAssets
{
  if (qword_1009229C8 != -1) {
    dispatch_once(&qword_1009229C8, &stru_1008AFBC8);
  }
  v2 = (void *)qword_1009229C0;

  return v2;
}

+ (id)assetForData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v12 = 0;
    goto LABEL_11;
  }
  id v5 = [a1 temporaryAssets];
  objc_sync_enter(v5);
  id v6 = +[NSUUID UUID];
  int v7 = [v6 UUIDString];

  int64_t v8 = [a1 temporaryAssetDirectoryURL];
  unsigned __int8 v9 = [v8 URLByAppendingPathComponent:v7 isDirectory:0];

  if (!v9)
  {
    id v11 = 0;
    goto LABEL_7;
  }
  id v15 = 0;
  unsigned int v10 = [v4 writeToURL:v9 options:0 error:&v15];
  id v11 = v15;
  if (!v10)
  {
LABEL_7:
    long long v13 = +[REMLog cloudkit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100751578();
    }
    id v12 = 0;
    goto LABEL_10;
  }
  id v12 = [objc_alloc((Class)CKAsset) initWithFileURL:v9];
  long long v13 = [a1 temporaryAssets];
  [v13 addObject:v12];
LABEL_10:

  objc_sync_exit(v5);
LABEL_11:

  return v12;
}

+ (id)temporaryAssetDirectoryURL
{
  v2 = (void *)qword_1009229D0;
  if (!qword_1009229D0)
  {
    id v3 = +[NSFileManager defaultManager];
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 bundleIdentifier];
    id v6 = +[NSString stringWithFormat:@"%@-%@", v5, @"TemporaryAssetFiles"];

    id v18 = 0;
    int v7 = [v3 rem_createProtectedTemporaryDirectoryIfNeededWithError:&v18];
    id v8 = v18;
    if (v7)
    {
      uint64_t v9 = [v7 URLByAppendingPathComponent:v6 isDirectory:1];
      unsigned int v10 = (void *)qword_1009229D0;
      qword_1009229D0 = v9;

      id v17 = v8;
      unsigned __int8 v11 = [v3 createDirectoryAtURL:qword_1009229D0 withIntermediateDirectories:1 attributes:0 error:&v17];
      id v12 = v17;

      if ((v11 & 1) == 0)
      {
        long long v13 = +[REMLog cloudkit];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100751648();
        }
      }
      long long v14 = +[REMLog cloudkit];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [(id)qword_1009229D0 absoluteString];
        *(_DWORD *)buf = 138412290;
        unsigned int v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "REMCDObject.temporaryAssetDirectoryURL: %@", buf, 0xCu);
      }
      id v8 = v12;
    }
    else
    {
      long long v14 = +[REMLog cloudkit];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1007515E0();
      }
    }

    v2 = (void *)qword_1009229D0;
  }

  return v2;
}

+ (void)deleteTemporaryAssetFilesForOperation:(id)a3
{
  id v4 = a3;
  id v5 = [a1 temporaryAssets];
  objc_sync_enter(v5);
  id v6 = [a1 temporaryAssets];
  id v7 = [v6 count];

  objc_sync_exit(v5);
  if (v7)
  {
    id v8 = dispatch_get_global_queue(-2, 0);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000511C0;
    v9[3] = &unk_1008AF458;
    id v11 = a1;
    id v10 = v4;
    dispatch_async(v8, v9);
  }
}

+ (void)deleteTemporaryFilesForAsset:(id)a3
{
  id v4 = a3;
  id v5 = [a1 temporaryAssets];
  objc_sync_enter(v5);
  id v6 = [a1 temporaryAssets];
  [v6 removeObject:v4];

  id v7 = [v4 fileURL];

  if (v7)
  {
    id v8 = [v4 fileURL];
    uint64_t v9 = +[NSFileManager defaultManager];
    id v13 = 0;
    unsigned __int8 v10 = [v9 removeItemAtURL:v8 error:&v13];
    id v11 = v13;

    if ((v10 & 1) == 0)
    {
      id v12 = +[REMLog cloudkit];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1007516B0();
      }
    }
  }
  objc_sync_exit(v5);
}

+ (void)deleteAllTemporaryAssetFilesForAllObjects
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = [a1 temporaryAssetDirectoryURL];
  id v5 = [v3 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:0 errorHandler:&stru_1008AFC08];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v8 = 138412290;
    long long v17 = v8;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v11);
        id v13 = +[NSFileManager defaultManager];
        id v18 = 0;
        unsigned __int8 v14 = [v13 removeItemAtURL:v12 error:&v18];
        id v15 = v18;

        if ((v14 & 1) == 0)
        {
          long long v16 = +[REMLog cloudkit];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            id v24 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error deleting temporary asset file: %@", buf, 0xCu);
          }
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }
}

- (BOOL)isDeletable
{
  return 1;
}

- (BOOL)shouldBeDeletedFromLocalDatabase
{
  if (![(REMCDObject *)self isDeletable]
    || ![(REMCDObject *)self markedForDeletion]
    || [(REMCDObject *)self isInICloudAccount]
    && ![(REMCDObject *)self hasSuccessfullyPushedLatestVersionToCloud])
  {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(REMCDObject *)self objectsToBeDeletedBeforeThisObject];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (![*(id *)(*((void *)&v10 + 1) + 8 * i) shouldBeDeletedFromLocalDatabase])
        {
          BOOL v8 = 0;
          goto LABEL_17;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_17:

  return v8;
}

- (void)deleteFromLocalDatabase
{
  id v3 = +[ICSyncSettings sharedSettings];
  unsigned int v4 = [v3 hasOptions:64];

  if (v4)
  {
    id v5 = +[REMLog cloudkit];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100751780();
    }
  }
  else
  {
    id v6 = [(REMCDObject *)self managedObjectContext];
    [v6 deleteObject:self];
  }
}

- (id)objectsToBeDeletedBeforeThisObject
{
  return &__NSArray0__struct;
}

+ (id)keyPathsForValuesAffectingNeedsToBeDeletedFromCloud
{
  return +[NSSet setWithObjects:@"markedForDeletion", 0];
}

- (void)fixValuesOfKeysWithUniqueConstraintBeforeSettingMarkedForDeletion:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(REMCDObject *)self entity];
  id v6 = [v5 uniquenessConstraints];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v11 = v10;
        long long v12 = (char *)[v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          long long v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              objc_opt_class();
              long long v16 = REMDynamicCast();
              if (v16)
              {
                if (v3) {
                  [(REMCDObject *)self fixValueBeforeMarkingForDeletionForKey:v16];
                }
                else {
                  [(REMCDObject *)self fixValueBeforeUnmarkingForDeletionForKey:v16];
                }
              }
            }
            long long v13 = (char *)[v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }
}

- (void)markForDeletion
{
  if (([(REMCDObject *)self markedForDeletion] & 1) == 0)
  {
    BOOL v3 = +[REMLog cloudkit];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v4 = [(REMCDObject *)self shortLoggingDescription];
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Marking %@ for deletion", (uint8_t *)&v5, 0xCu);
    }
    [(REMCDObject *)self fixValuesOfKeysWithUniqueConstraintBeforeSettingMarkedForDeletion:1];
    [(REMCDObject *)self lowLevelMarkForDeletion];
    [(REMCDObject *)self markObjectDirtyAfterMarkedForDeletion];
  }
}

- (void)lowLevelMarkForDeletion
{
}

- (void)markObjectDirtyAfterMarkedForDeletion
{
  if ([(REMCDObject *)self supportsDeletionByTTL])
  {
    [(REMCDObject *)self updateChangeCount];
  }
  else if ([(REMCDObject *)self isInCloud] {
         || ([(REMCDObject *)self ckServerShare],
  }
             BOOL v3 = objc_claimAutoreleasedReturnValue(),
             v3,
             v3))
  {
    uint64_t v4 = [(REMCDObject *)self ckDirtyFlags] | 2;
    [(REMCDObject *)self setCkDirtyFlags:v4];
  }
}

- (void)unmarkForDeletion
{
  if ([(REMCDObject *)self markedForDeletion])
  {
    BOOL v3 = +[REMLog cloudkit];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(REMCDObject *)self shortLoggingDescription];
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unmarking %@ for deletion", (uint8_t *)&v5, 0xCu);
    }
    [(REMCDObject *)self fixValuesOfKeysWithUniqueConstraintBeforeSettingMarkedForDeletion:0];
    [(REMCDObject *)self lowLevelUnmarkForDeletion];
    [(REMCDObject *)self markObjectDirtyAfterUnmarkedForDeletion];
  }
}

- (void)lowLevelUnmarkForDeletion
{
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  BOOL v3 = a3;
  [(REMCDObject *)self willChangeValueForKey:@"markedForDeletion"];
  int v5 = +[NSNumber numberWithBool:v3];
  [(REMCDObject *)self setPrimitiveValue:v5 forKey:@"markedForDeletion"];

  [(REMCDObject *)self didChangeValueForKey:@"markedForDeletion"];
  id v6 = +[REMLog cloudkit];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(REMCDObject *)self identifier];
    id v8 = [(id)objc_opt_class() cdEntityName];
    v9[0] = 67109634;
    v9[1] = v3;
    __int16 v10 = 2114;
    id v11 = v7;
    __int16 v12 = 2114;
    long long v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting markedForDeletion %d on {identifier: %{public}@, cdEntity: %{public}@}", (uint8_t *)v9, 0x1Cu);
  }
}

- (BOOL)supportsDeletionByTTL
{
  return 0;
}

- (void)debug_lowLevelRemoveFromParent
{
  uint64_t v3 = objc_opt_class();
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"Abstract method called -[%@ %@]", v3, v4);
}

- (id)parentCloudObject
{
  return 0;
}

- (void)updateParentReferenceIfNecessary
{
  uint64_t v3 = [(REMCDObject *)self ckServerRecord];

  if (v3)
  {
    id v4 = [(REMCDObject *)self parentCloudObject];
    int v5 = [v4 recordID];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char v7 = isKindOfClass;
    if (v4 && (isKindOfClass & 1) == 0 && !v5)
    {
      id v8 = +[REMLog cloudkit];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_1007517E8(self, v8);
      }

      goto LABEL_18;
    }
    id v9 = [(REMCDObject *)self recordID];
    __int16 v10 = [v9 zoneID];
    id v11 = [v10 ownerName];
    __int16 v12 = [v5 zoneID];
    long long v13 = [v12 ownerName];
    unsigned int v14 = [v11 isEqualToString:v13];

    if (!v14)
    {
LABEL_18:

      return;
    }
    id v15 = [(REMCDObject *)self ckServerRecord];
    long long v16 = [v15 parent];

    if (v16)
    {
      if (v7) {
        goto LABEL_18;
      }
      long long v17 = [(REMCDObject *)self ckServerRecord];
      uint64_t v18 = [v17 parent];
      long long v19 = [v18 recordID];
      unsigned __int8 v20 = [v19 isEqual:v5];

      if (v20) {
        goto LABEL_18;
      }
      long long v21 = +[REMLog cloudkit];
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      long long v22 = [(REMCDObject *)self shortLoggingDescription];
      long long v23 = [(REMCDObject *)self ckServerRecord];
      long long v24 = [v23 parent];
      long long v25 = [v24 recordID];
      long long v26 = [v25 ic_loggingDescription];
      char v27 = [v5 ic_loggingDescription];
      int v28 = 138412802;
      uint64_t v29 = v22;
      __int16 v30 = 2112;
      int v31 = v26;
      __int16 v32 = 2112;
      id v33 = v27;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Server record for %@ parent %@ is different from expected parent %@. Re-saving record.", (uint8_t *)&v28, 0x20u);
    }
    else
    {
      long long v21 = +[REMLog cloudkit];
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:

        [(REMCDObject *)self updateChangeCount];
        goto LABEL_18;
      }
      long long v22 = [(REMCDObject *)self shortLoggingDescription];
      int v28 = 138412290;
      uint64_t v29 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Server record for %@ has no parent, but expects one. Re-saving record.", (uint8_t *)&v28, 0xCu);
    }

    goto LABEL_17;
  }
}

- (BOOL)needsToDeleteShare
{
  if (![(REMCDObject *)self markedForDeletion]) {
    return 0;
  }
  uint64_t v3 = [(REMCDObject *)self ckServerShare];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud
{
  return +[NSSet setWithObjects:@"isSharedViaICloud", @"cloudAccount.accountType", 0];
}

- (BOOL)canBeSharedViaICloud
{
  v2 = [(REMCDObject *)self cloudAccount];
  uint64_t v3 = [v2 accountTypeHost];
  unsigned __int8 v4 = [v3 isCloudKit];

  return v4;
}

+ (id)keyPathsForValuesAffectingIsSharedViaICloud
{
  return +[NSSet setWithObjects:@"ckServerShare", @"ckZoneOwnerName", @"ckServerRecord", @"parentCloudObject.isSharedViaICloud", 0];
}

- (BOOL)isSharedViaICloud
{
  uint64_t v3 = [(REMCDObject *)self ckServerShare];

  if (v3) {
    return 1;
  }
  unsigned __int8 v4 = [(REMCDObject *)self ckServerRecord];
  int v5 = [v4 share];

  if (v5) {
    return 1;
  }
  uint64_t v8 = [(REMCDObject *)self ckZoneOwnerName];
  if (!v8) {
    goto LABEL_7;
  }
  id v9 = (void *)v8;
  __int16 v10 = [(REMCDObject *)self ckZoneOwnerName];
  unsigned int v11 = [v10 isEqualToString:CKCurrentUserDefaultName];

  if (!v11) {
    return 1;
  }
LABEL_7:
  __int16 v12 = [(REMCDObject *)self parentCloudObject];
  long long v13 = v12;
  if (v12) {
    unsigned __int8 v6 = [v12 isSharedViaICloud];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)canBeRootShareObject
{
  return 0;
}

- (BOOL)isOwnedByCurrentUser
{
  v2 = [(REMCDObject *)self recordID];
  unsigned __int8 v3 = [v2 ic_isOwnedByCurrentUser];

  return v3;
}

- (BOOL)isSharedRootObject
{
  unsigned __int8 v3 = [(REMCDObject *)self ckServerRecord];
  unsigned __int8 v4 = [v3 share];

  if (v4) {
    return 1;
  }
  unsigned __int8 v6 = [(REMCDObject *)self ckServerShare];
  BOOL v5 = v6 != 0;

  return v5;
}

+ (id)keyPathsForValuesAffectingIsSharedReadOnly
{
  return +[NSSet setWithObject:@"serverShareCheckingParent"];
}

- (BOOL)isSharedReadOnly
{
  v2 = [(REMCDObject *)self serverShareCheckingParent];
  unsigned __int8 v3 = v2;
  if (v2)
  {
    unsigned __int8 v4 = [v2 currentUserParticipant];
    BOOL v5 = [v4 permission] == (id)2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingServerShareCheckingParent
{
  return +[NSSet setWithObject:@"serverShare"];
}

- (id)serverShareCheckingParent
{
  v2 = self;
  if (v2)
  {
    do
    {
      unsigned __int8 v3 = v2;
      unsigned __int8 v4 = [(REMCDObject *)v2 ckServerShare];
      v2 = [(REMCDObject *)v2 parentCloudObject];
    }
    while (!v4 && v2);
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)currentUserShareParticipantID
{
  v2 = [(REMCDObject *)self serverShareCheckingParent];
  unsigned __int8 v3 = [v2 currentUserParticipant];
  unsigned __int8 v4 = [v3 participantID];
  BOOL v5 = [v4 uppercaseString];

  return v5;
}

- (void)updateObjectWithShare:(id)a3
{
  unsigned __int8 v4 = +[REMLog cloudkitCollaboration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100751930(self);
  }
}

- (void)setServerShareIfNewer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 recordChangeTag];
  unsigned __int8 v6 = [(REMCDObject *)self ckServerShare];

  if (!v6)
  {
    __int16 v12 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v23 = [(REMCDObject *)self shortLoggingDescription];
      long long v24 = [v4 ic_loggingDescription];
      int v28 = 138412546;
      uint64_t v29 = v23;
      __int16 v30 = 2112;
      int v31 = v24;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No server share for %@, setting to %@", (uint8_t *)&v28, 0x16u);

LABEL_15:
    }
LABEL_16:

    [(REMCDObject *)self setCkServerShare:v4];
    goto LABEL_17;
  }
  uint64_t v7 = [v4 recordChangeTag];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(REMCDObject *)self ckServerShare];
    __int16 v10 = [v9 recordChangeTag];
    unsigned int v11 = [v10 isEqualToString:v5];

    if (v11)
    {
      __int16 v12 = +[REMLog cloudkitCollaboration];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = [(REMCDObject *)self shortLoggingDescription];
        unsigned int v14 = [(REMCDObject *)self ckServerShare];
        id v15 = [v14 ic_loggingDescription];
        long long v16 = [v4 ic_loggingDescription];
        int v28 = 138412802;
        uint64_t v29 = v13;
        __int16 v30 = 2112;
        int v31 = v15;
        __int16 v32 = 2112;
        id v33 = v16;
        long long v17 = "Existing server share for %@ %@ has the same change tag as %@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v28, 0x20u);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  uint64_t v18 = [(REMCDObject *)self ckServerShare];
  long long v19 = [v18 modificationDate];
  unsigned __int8 v20 = [v4 modificationDate];
  unsigned int v21 = [v19 ic_isLaterThanDate:v20];

  __int16 v12 = +[REMLog cloudkitCollaboration];
  BOOL v22 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v21)
  {
    if (v22)
    {
      long long v23 = [(REMCDObject *)self shortLoggingDescription];
      long long v25 = [(REMCDObject *)self ckServerShare];
      long long v26 = [v25 ic_loggingDescription];
      char v27 = [v4 ic_loggingDescription];
      int v28 = 138412802;
      uint64_t v29 = v23;
      __int16 v30 = 2112;
      int v31 = v26;
      __int16 v32 = 2112;
      id v33 = v27;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Replacing old server share for %@ %@ with %@", (uint8_t *)&v28, 0x20u);

      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (v22)
  {
    long long v13 = [(REMCDObject *)self shortLoggingDescription];
    unsigned int v14 = [(REMCDObject *)self ckServerShare];
    id v15 = [v14 ic_loggingDescription];
    long long v16 = [v4 ic_loggingDescription];
    int v28 = 138412802;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    int v31 = v15;
    __int16 v32 = 2112;
    id v33 = v16;
    long long v17 = "Existing server share for %@ %@ is newer than %@";
    goto LABEL_9;
  }
LABEL_10:

LABEL_17:
}

- (void)didAcceptShare:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(REMCDObject *)self ckServerShare];

  if (!v5)
  {
    unsigned __int8 v6 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(REMCDObject *)self shortLoggingDescription];
      uint64_t v8 = [v4 ic_loggingDescription];
      int v11 = 138412546;
      __int16 v12 = v7;
      __int16 v13 = 2112;
      unsigned int v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No server share for %@, setting to %@", (uint8_t *)&v11, 0x16u);
    }
    [(REMCDObject *)self setCkServerShare:v4];
  }
  if ([(REMCDObject *)self markedForDeletion])
  {
    id v9 = +[REMLog cloudkitCollaboration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = [(REMCDObject *)self shortLoggingDescription];
      int v11 = 138412290;
      __int16 v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Undeleting shared %@", (uint8_t *)&v11, 0xCu);
    }
    [(REMCDObject *)self unmarkForDeletion];
    [(REMCDObject *)self restoreParentReferenceAfterUnmarkingForDeletion];
  }
}

+ (id)versionsByOperationQueue
{
  if (qword_1009229E0 != -1) {
    dispatch_once(&qword_1009229E0, &stru_1008AFC28);
  }
  v2 = (void *)qword_1009229D8;

  return v2;
}

+ (id)versionsByRecordIDByOperation
{
  if (qword_1009229F0 != -1) {
    dispatch_once(&qword_1009229F0, &stru_1008AFC48);
  }
  v2 = (void *)qword_1009229E8;

  return v2;
}

- (int64_t)versionForOperation:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  BOOL v5 = [(id)objc_opt_class() versionsByOperationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052FE4;
  block[3] = &unk_1008ADFD0;
  block[4] = self;
  id v10 = v4;
  int v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setVersion:(int64_t)a3 forOperation:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(id)objc_opt_class() versionsByOperationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053150;
  block[3] = &unk_1008AFC70;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (int64_t)isPushingSameOrLaterThanVersion:(int64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  BOOL v5 = [(id)objc_opt_class() versionsByOperationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053310;
  block[3] = &unk_1008AFC98;
  block[4] = self;
  void block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  int64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)setInCloud:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMCDObject *)self ckCloudState];
  [v4 setInCloud:v3];
}

- (BOOL)isInCloud
{
  v2 = [(REMCDObject *)self ckCloudState];
  unsigned __int8 v3 = [v2 isInCloud];

  return v3;
}

+ (id)recordSystemFieldsTransformer
{
  if (qword_100922A00 != -1) {
    dispatch_once(&qword_100922A00, &stru_1008AFCB8);
  }
  v2 = (void *)qword_1009229F8;

  return v2;
}

+ (id)shareSystemFieldsTransformer
{
  if (qword_100922A10 != -1) {
    dispatch_once(&qword_100922A10, &stru_1008AFCD8);
  }
  v2 = (void *)qword_100922A08;

  return v2;
}

- (void)setCkServerRecord:(id)a3
{
  id v5 = a3;
  if (([(CKRecord *)self->_ckServerRecord isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ckServerRecord, a3);
    if (v5)
    {
      int64_t v6 = [(id)objc_opt_class() recordSystemFieldsTransformer];
      int64_t v7 = [v6 transformedValue:v5];
      [(REMCDObject *)self setCkServerRecordData:v7];

      id v8 = [v5 recordID];
      uint64_t v9 = [v8 zoneID];

      id v10 = [(id)objc_opt_class() objectCkZoneOwnerNameFromCKRecordZoneID:v9];
      [(REMCDObject *)self setCkZoneOwnerName:v10];
    }
    else
    {
      [(REMCDObject *)self setCkServerRecordData:0];
      uint64_t v11 = +[REMLog cloudkit];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        char v12 = [(REMCDObject *)self shortLoggingDescription];
        int v13 = 138543362;
        uint64_t v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "setCkServerRecord: Clearing serverRecord for: %{public}@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (CKRecord)ckServerRecord
{
  ckServerRecord = self->_ckServerRecord;
  if (!ckServerRecord)
  {
    id v4 = [(REMCDObject *)self ckServerRecordData];
    if (v4)
    {
      id v5 = [(id)objc_opt_class() recordSystemFieldsTransformer];
      int64_t v6 = [v5 reverseTransformedValue:v4];
      int64_t v7 = self->_ckServerRecord;
      self->_ckServerRecord = v6;
    }
    ckServerRecord = self->_ckServerRecord;
  }

  return ckServerRecord;
}

- (void)updateSharedObjectOwnerName:(id)a3
{
  id v4 = a3;
  id v5 = +[REMLog cloudkit];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = (id)objc_opt_class();
    __int16 v28 = 2112;
    id v29 = v4;
    id v6 = v27;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Update shared object's owner names {class: %@, ownerName: %@}", buf, 0x16u);
  }
  int64_t v7 = [(REMCDObject *)self managedObjectContext];
  if (v7)
  {
    id v8 = [(REMCDObject *)self account];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = [v8 ckIdentifier];
      if (v10)
      {
        if (v4)
        {
          uint64_t v11 = (objc_class *)objc_opt_class();
          char v12 = NSStringFromClass(v11);
          int v13 = +[NSEntityDescription insertNewObjectForEntityForName:v12 inManagedObjectContext:v7];
          objc_opt_class();
          uint64_t v14 = REMCheckedDynamicCast();
          uint64_t v15 = [(REMCDObject *)self ckIdentifier];
          [v14 setObjectIdentifier:v15];

          [v14 setOwnerName:v4];
          [v14 setAccount:v9];
          long long v16 = [(REMCDObject *)self ckIdentifier];

          if (v16 && v14)
          {
            long long v25 = v12;
            objc_opt_class();
            long long v17 = REMDynamicCast();
            uint64_t v18 = [v17 batchFetchHelper];
            if (!v18)
            {
              long long v24 = +[REMLog cloudkit];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
                sub_100750F68();
              }
            }
            long long v19 = [(REMCDObject *)self ckIdentifier];
            [v18 setCachedManagedObject:v14 forCKIdentifier:v19 accountIdentifier:v10];

            char v12 = v25;
          }
        }
        else
        {
          unsigned int v21 = [(REMCDObject *)self ckIdentifier];
          char v12 = +[NSPredicate predicateWithFormat:@"objectIdentifier == %@", v21];

          objc_opt_class();
          BOOL v22 = +[REMCKSharedObjectOwnerName ic_objectsMatchingPredicate:v12 context:v7];
          long long v23 = [v22 firstObject];
          int v13 = REMDynamicCast();

          if (v13)
          {
            [v9 removeCkSharedObjectOwnerNamesObject:v13];
            [v7 deleteObject:v13];
          }
        }

        [v9 updateChangeCount];
      }
      else
      {
        unsigned __int8 v20 = +[REMLog cloudkit];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          sub_100751AF4();
        }
      }
    }
    else
    {
      id v10 = +[REMLog cloudkit];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_100751A54();
      }
    }
  }
  else
  {
    uint64_t v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_1007519B4();
    }
  }
}

- (void)setCkServerShare:(id)a3
{
  id v7 = a3;
  if ((-[CKShare isEqual:](self->_ckServerShare, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ckServerShare, a3);
    [(REMCDObject *)self updateObjectWithShare:v7];
    if (v7)
    {
      id v5 = [(id)objc_opt_class() shareSystemFieldsTransformer];
      id v6 = [v5 transformedValue:v7];
      [(REMCDObject *)self setCkServerShareData:v6];
    }
    else
    {
      [(REMCDObject *)self setCkServerShareData:0];
    }
  }
}

- (CKShare)ckServerShare
{
  ckServerShare = self->_ckServerShare;
  if (!ckServerShare)
  {
    id v4 = [(REMCDObject *)self ckServerShareData];
    if (v4)
    {
      id v5 = [(id)objc_opt_class() shareSystemFieldsTransformer];
      id v6 = [v5 reverseTransformedValue:v4];
      id v7 = self->_ckServerShare;
      self->_ckServerShare = v6;
    }
    ckServerShare = self->_ckServerShare;
  }

  return ckServerShare;
}

+ (id)objectCkZoneOwnerNameFromCKRecordZoneID:(id)a3
{
  unsigned __int8 v3 = [a3 ownerName];
  if ([v3 isEqualToString:CKCurrentUserDefaultName]) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)hasAllMandatoryFields
{
  v2 = [(REMCDObject *)self ckIdentifier];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)shortLoggingDescription
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(REMCDObject *)self ckIdentifier];
  id v5 = +[NSString stringWithFormat:@"<%@ %@>", v3, v4];

  return v5;
}

- (id)ic_loggingValues
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  id v4 = [(REMCDObject *)self managedObjectContext];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100053F70;
  v8[3] = &unk_1008ADC88;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  [v4 performBlockAndWait:v8];

  id v6 = v5;
  return v6;
}

- (id)cloudKitReferenceWithRecordIDAndValidateAction:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc((Class)CKReference);
    id v5 = [v4 initWithRecordID:v3 action:CKReferenceActionValidate];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)getResolutionTokenMapFromRecord:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"ResolutionTokenMap"];
  if (v3)
  {
    id v4 = +[REMResolutionTokenMap objc_newObjectFromJSONString:v3];
    if (!v4)
    {
      id v5 = +[REMLog cloudkit];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_100751B94();
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)getResolutionTokenMapFromRecord:(id)a3
{
  return +[REMCDObject getResolutionTokenMapFromRecord:a3];
}

- (void)generateReolutionTokenMapForTestingWithKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(REMCDObject *)self createResolutionTokenMapIfNecessary];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 updateForKey:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) withValue:v11];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (BOOL)isMergeableWithLocalObject
{
  if (![(id)objc_opt_class() shouldAttemptLocalObjectMerge]
    || ([(REMCDObject *)self isDeleted] & 1) != 0
    || [(REMCDObject *)self isConcealed])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    BOOL v3 = [(REMCDObject *)self isInCloud];
    id v5 = +[REMLog cloudkit];
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v6) {
        sub_100751BFC();
      }
    }
    else if (v6)
    {
      sub_100751CB4();
    }
  }
  return v3;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  return 0;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  return 0;
}

- (BOOL)mergeDataRefusedToMergeMarkedForDeletion
{
  return self->_mergeDataRefusedToMergeMarkedForDeletion;
}

- (BOOL)mergeDataRevertedLocallyMarkedForDeletion
{
  return self->_mergeDataRevertedLocallyMarkedForDeletion;
}

- (BOOL)shouldPerformCloudSchemaCatchUpSync
{
  return self->_shouldPerformCloudSchemaCatchUpSync;
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4 = +[REMLogStore write];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(REMCDObject *)self objectID];
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Warning: Calling super (REMCDObject's) -isConnectedToAccountObject:, make sure this model class implements proper connection to the account to avoid being auto marked as deleted {self: %@}.", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (BOOL)shouldCascadeMarkAsDeleteInto:(id)a3 forRelationship:(id)a4
{
  return 1;
}

+ (id)entity
{
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromClass((Class)a1);
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    int v7 = +[REMCDObject entity];
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___REMCDObject;
    int v7 = [super entity];
  }

  return v7;
}

+ (id)fetchRequest
{
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromClass((Class)a1);
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    int v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1007533BC(v7);
    }

    id v8 = +[REMCDRootEntityObject fetchRequest];
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___REMCDObject;
    id v8 = [super fetchRequest];
  }

  return v8;
}

+ (id)subclassesOfREMCDObjectRepresentingRootCoreDataEntities
{
  if (qword_100922A48 != -1) {
    dispatch_once(&qword_100922A48, &stru_1008B0038);
  }
  v2 = (void *)qword_100922A50;

  return v2;
}

+ (id)subclassNamesOfREMCDObjectRepresentingRootCoreDataEntities
{
  if (qword_100922A58 != -1) {
    dispatch_once(&qword_100922A58, &stru_1008B0058);
  }
  v2 = (void *)qword_100922A60;

  return v2;
}

+ (void)mergeSystemPropertiesIntoCDObject:(id)a3 fromCKRecord:(id)a4
{
  id v5 = a3;
  id v7 = a4;
  if ([v5 respondsToSelector:"shouldUseResolutionTokenMapForMergingData"])
  {
    [v5 mergeDataRevertedLocallyMarkedForDeletion];
    [v5 mergeDataRefusedToMergeMarkedForDeletion];
    id v6 = v5;
    id v5 = v7;
    sub_1004CDEE8(v5, v6, v6, v5);
  }
  else
  {
    sub_1004CD528(v5, v7);
  }
}

@end