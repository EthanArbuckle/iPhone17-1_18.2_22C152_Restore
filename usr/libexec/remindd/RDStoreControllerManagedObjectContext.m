@interface RDStoreControllerManagedObjectContext
+ (id)managedObjectIDsSortedByTopologicalWeightsForEffectiveMinimumSupportedVersionPropagation:(id)a3;
+ (id)topologicallyWeightedEntitiesForEffectiveMinimumSupportedVersionPropagation;
+ (unint64_t)_heightOfEntityNodeInMOMTreeForEffectiveMinimumSupportedVersionPropagation:(id)a3 heightMap:(id)a4;
- (BOOL)__unsafe_doesNotWorkUniversally_setAffectedStoresWithAccountIdentifier:(id)a3;
- (BOOL)canAccessAllPersistentStoresReferencedByFetchResultToken:(id)a3;
- (BOOL)containerShouldSortChildrenAfterFetchingWithRecordID:(id)a3;
- (BOOL)coreDataSave:(id *)a3;
- (BOOL)hasPendingListNameRelatedChanges;
- (BOOL)save:(id *)a3;
- (BOOL)shouldSortChildrenAfterFetching;
- (ICBatchFetchHelper)batchFetchHelper;
- (NSArray)__unsafe_doesNotWorkUniversally_affectedStores;
- (NSDictionary)_unittest_awakeCounts;
- (NSDictionary)cloudSchemaCatchUpSyncContextsByAccountIdentifier;
- (NSMutableDictionary)candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
- (NSMutableDictionary)confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
- (NSMutableDictionary)fileAttachmentIdentifiersToPurgeByAccountIdentifier;
- (NSMutableSet)managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion;
- (NSMutableSet)recordIDsToSortChildrenAfterFetching;
- (RDStoreController)storeController;
- (RDStoreControllerValidationPolicy)validationPolicy;
- (id)_debug_managedObjectIDsSortedByTopologicalWeightsForEffectiveMinimumSupportedVersionPropagation:(id)a3;
- (id)_unitTest_purgeDeletedFileAttachmentsDidComplete;
- (id)executeFetchRequest:(id)a3 error:(id *)a4;
- (id)executeRequest:(id)a3 error:(id *)a4;
- (id)existingFileAttachmentsMatchingSHA512Sums:(id)a3 accountID:(id)a4 error:(id *)a5;
- (id)latestFetchResultTokenWithError:(id *)a3;
- (id)objectTreeProcessorDelegateFactoryWithTreeNode:(id)a3;
- (id)persistentStoreOfAccountWithAccountID:(id)a3;
- (unint64_t)_unittest_validateDirtyEffectiveMinimumSupportedVersionsManually;
- (unint64_t)_validateDirtyEffectiveMinimumSupportedVersionsWithBatchSize:(unint64_t)a3 isManualValidation:(BOOL)a4;
- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4;
- (unint64_t)pendingPostSaveActions;
- (void)_rem_setAllowsExpandedUserInfoKeys:(BOOL)a3;
- (void)confirmOrRejectFilePurgeCandidatesThatMightBeDeduplicatedAcrossMultipleAttachments;
- (void)notifyDidMarkExtraneousAlarmsPendingToSyncUpDelete;
- (void)proposePurgingFileAttachmentWithSha512Sum:(id)a3 fileExtension:(id)a4 account:(id)a5;
- (void)purgeDeletedFileAttachments;
- (void)rejectPurgingFileAttachmentWithSha512Sum:(id)a3 fileExtension:(id)a4 account:(id)a5;
- (void)setBatchFetchHelper:(id)a3;
- (void)setCandidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier:(id)a3;
- (void)setCloudSchemaCatchUpSyncContextsByAccountIdentifier:(id)a3;
- (void)setConfirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier:(id)a3;
- (void)setFileAttachmentIdentifiersToPurgeByAccountIdentifier:(id)a3;
- (void)setManagedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion:(id)a3;
- (void)setPendingPostSaveActions:(unint64_t)a3;
- (void)setRecordIDsToSortChildrenAfterFetching:(id)a3;
- (void)setShouldSortChildrenAfterFetching:(BOOL)a3;
- (void)setStoreController:(id)a3;
- (void)setValidationPolicy:(id)a3;
- (void)set__unsafe_doesNotWorkUniversally_affectedStores:(id)a3;
- (void)set_unitTest_purgeDeletedFileAttachmentsDidComplete:(id)a3;
- (void)set_unittest_awakeCounts:(id)a3;
- (void)validateDirtyEffectiveMinimumSupportedVersions;
@end

@implementation RDStoreControllerManagedObjectContext

- (id)objectTreeProcessorDelegateFactoryWithTreeNode:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = REMCDObjectEffectiveVersionValidationDelegateImpl;
LABEL_5:
    id v6 = [[v5 alloc] initWithManagedObjectContext:self];
    goto LABEL_9;
  }
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = _REMCDObjectEffectiveVersionManualValidationDelegateImpl;
    goto LABEL_5;
  }
  v7 = +[REMLogStore write];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    sub_100752CA4((uint64_t)v4, v7);
  }

  id v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)save:(id *)a3
{
  v5 = [(RDStoreControllerManagedObjectContext *)self insertedObjects];
  id v6 = [v5 count];

  v7 = [(RDStoreControllerManagedObjectContext *)self updatedObjects];
  id v8 = [v7 count];

  v9 = [(RDStoreControllerManagedObjectContext *)self deletedObjects];
  id v10 = [v9 count];

  unsigned int v11 = [(RDStoreControllerManagedObjectContext *)self hasPendingListNameRelatedChanges];
  v32.receiver = self;
  v32.super_class = (Class)RDStoreControllerManagedObjectContext;
  id v33 = 0;
  BOOL v12 = [(RDStoreControllerManagedObjectContext *)&v32 save:&v33];
  id v13 = v33;
  v14 = INDateRelevanceProvider_ptr;
  v15 = +[REMLogStore write];
  v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
      *(_DWORD *)buf = 138544130;
      v35 = v17;
      __int16 v36 = 2048;
      id v37 = v6;
      __int16 v38 = 2048;
      id v39 = v8;
      __int16 v40 = 2048;
      id v41 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SAVE COREDATA {author: %{public}@, insert.count: %ld, update.count: %ld, delete.count: %ld}", buf, 0x2Au);

      v14 = INDateRelevanceProvider_ptr;
    }

    if (v11) {
      notify_post("com.apple.reminder.list.name.siri_data_changed");
    }
    [(RDStoreControllerManagedObjectContext *)self validateDirtyEffectiveMinimumSupportedVersions];
    [(RDStoreControllerManagedObjectContext *)self confirmOrRejectFilePurgeCandidatesThatMightBeDeduplicatedAcrossMultipleAttachments];
    [(RDStoreControllerManagedObjectContext *)self purgeDeletedFileAttachments];
    if ([(RDStoreControllerManagedObjectContext *)self pendingPostSaveActions]) {
      [(RDStoreControllerManagedObjectContext *)self notifyDidMarkExtraneousAlarmsPendingToSyncUpDelete];
    }
    if (([(RDStoreControllerManagedObjectContext *)self pendingPostSaveActions] & 2) != 0)
    {
      v18 = +[NSNotificationCenter defaultCenter];
      [v18 postNotificationName:@"com.apple.remindd.SharedToMeList.pinnedStateDidBecomeStale" object:0 userInfo:0];
    }
    if (([(RDStoreControllerManagedObjectContext *)self pendingPostSaveActions] & 4) != 0)
    {
      v19 = +[NSNotificationCenter defaultCenter];
      [v19 postNotificationName:@"com.apple.remindd.SharedToMeList.mostRecentTargetTemplateIdentifierByCurrentUserDidBecomeStale" object:0 userInfo:0];
    }
    [(RDStoreControllerManagedObjectContext *)self setPendingPostSaveActions:0];
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v31 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
      *(_DWORD *)buf = 138544386;
      v35 = v31;
      __int16 v36 = 2048;
      id v37 = v6;
      __int16 v38 = 2048;
      id v39 = v8;
      __int16 v40 = 2048;
      id v41 = v10;
      __int16 v42 = 2114;
      id v43 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "SAVE COREDATA ERROR {author: %{public}@, insert.count: %ld, update.count: %ld, delete.count: %ld, error: %{public}@}", buf, 0x34u);
    }
  }
  v20 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];

  if (v20)
  {
    v21 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
    +[RDAsyncAnalytics recordSaveWith:v21];

    if (a3) {
LABEL_18:
    }
      *a3 = v13;
  }
  else
  {
    v23 = [v14[202] write];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      sub_100754174(v23, v24, v25, v26, v27, v28, v29, v30);
    }

    +[RDAsyncAnalytics recordSaveWith:@"nil author"];
    if (a3) {
      goto LABEL_18;
    }
  }

  return v12;
}

- (BOOL)hasPendingListNameRelatedChanges
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v2 = [(RDStoreControllerManagedObjectContext *)self updatedObjects];
  v3 = [v2 allObjects];

  id v4 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v33;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v8 isMemberOfClass:objc_opt_class()])
        {
          v9 = [v8 changedValues];
          id v10 = [v9 objectForKeyedSubscript:@"name"];
          if (v10)
          {

            goto LABEL_29;
          }
          unsigned int v11 = [v8 changedValues];
          BOOL v12 = [v11 objectForKeyedSubscript:@"markedForDeletion"];

          if (v12) {
            goto LABEL_29;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = [(RDStoreControllerManagedObjectContext *)self insertedObjects];
  v3 = [v13 allObjects];

  id v14 = [v3 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v29;
LABEL_13:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v29 != v16) {
        objc_enumerationMutation(v3);
      }
      if ([*(id *)(*((void *)&v28 + 1) + 8 * v17) isMemberOfClass:objc_opt_class()]) {
        goto LABEL_29;
      }
      if (v15 == (id)++v17)
      {
        id v15 = [v3 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v15) {
          goto LABEL_13;
        }
        break;
      }
    }
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v18 = [(RDStoreControllerManagedObjectContext *)self deletedObjects];
  v3 = [v18 allObjects];

  id v19 = [v3 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v25;
LABEL_21:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v25 != v20) {
        objc_enumerationMutation(v3);
      }
      if ([*(id *)(*((void *)&v24 + 1) + 8 * v21) isMemberOfClass:objc_opt_class()]) {
        break;
      }
      if (v19 == (id)++v21)
      {
        id v19 = [v3 countByEnumeratingWithState:&v24 objects:v36 count:16];
        if (v19) {
          goto LABEL_21;
        }
        goto LABEL_30;
      }
    }
LABEL_29:
    LOBYTE(v19) = 1;
  }
LABEL_30:

  return (char)v19;
}

- (id)executeRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 affectedStores];
  if (!v7)
  {
    id v8 = [(RDStoreControllerManagedObjectContext *)self __unsafe_doesNotWorkUniversally_affectedStores];

    if (!v8) {
      goto LABEL_5;
    }
    v7 = [(RDStoreControllerManagedObjectContext *)self __unsafe_doesNotWorkUniversally_affectedStores];
    [v6 setAffectedStores:v7];
  }

LABEL_5:
  v9 = +[REMLogStore read];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1007541AC(self);
  }

  v15.receiver = self;
  v15.super_class = (Class)RDStoreControllerManagedObjectContext;
  id v16 = 0;
  id v10 = [(RDStoreControllerManagedObjectContext *)&v15 executeRequest:v6 error:&v16];
  id v11 = v16;
  if (!v10)
  {
    BOOL v12 = +[REMLogStore read];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v14 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      __int16 v19 = 2114;
      id v20 = v6;
      __int16 v21 = 2114;
      id v22 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "COREDATA REQUEST ERROR {author: %{public}@, request: %{public}@, error: %{public}@}", buf, 0x20u);
    }
  }
  if (a4) {
    *a4 = v11;
  }

  return v10;
}

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 affectedStores];
  if (!v7)
  {
    id v8 = [(RDStoreControllerManagedObjectContext *)self __unsafe_doesNotWorkUniversally_affectedStores];

    if (!v8) {
      goto LABEL_5;
    }
    v7 = [(RDStoreControllerManagedObjectContext *)self __unsafe_doesNotWorkUniversally_affectedStores];
    [v6 setAffectedStores:v7];
  }

LABEL_5:
  v9 = INDateRelevanceProvider_ptr;
  id v10 = +[REMLogStore read];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100754274(self);
  }

  id v11 = +[NSDate now];
  v59.receiver = self;
  v59.super_class = (Class)RDStoreControllerManagedObjectContext;
  id v60 = 0;
  BOOL v12 = [(RDStoreControllerManagedObjectContext *)&v59 executeFetchRequest:v6 error:&v60];
  id v13 = v60;
  if (v12)
  {
    id v14 = +[NSDate now];
    [v14 timeIntervalSinceDate:v11];
    double v16 = v15 * 1000.0;

    id v17 = [v6 fetchBatchSize];
    v18 = +[REMLogStore read];
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (!v19) {
        goto LABEL_16;
      }
      id v20 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
      v48 = [v6 entityName];
      id v47 = [v12 count];
      v54 = [v6 affectedStores];
      id v46 = [v54 count];
      v52 = [(RDStoreControllerManagedObjectContext *)self persistentStoreCoordinator];
      v50 = [v52 persistentStores];
      id v21 = [v50 count];
      id v22 = v11;
      v23 = a4;
      id v24 = [v6 fetchBatchSize];
      [v6 propertiesToFetch];
      long long v25 = v57 = v13;
      id v26 = [v25 count];
      *(_DWORD *)buf = 134219778;
      double v62 = v16;
      __int16 v63 = 2114;
      v64 = v20;
      __int16 v65 = 2114;
      id v66 = v48;
      __int16 v67 = 2048;
      id v68 = v47;
      __int16 v69 = 2048;
      id v70 = v46;
      __int16 v71 = 2048;
      id v72 = v21;
      v9 = INDateRelevanceProvider_ptr;
      __int16 v73 = 2048;
      id v74 = v24;
      a4 = v23;
      id v11 = v22;
      __int16 v75 = 2048;
      id v76 = v26;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "BATCH FETCH COREDATA {elapsedTime: %.4lf ms, author: %{public}@, entityName: %{public}@, result.count: %ld, affectedStores.count: %ld, persistentStoreCoordinator.persistentStores.count: %ld, propsToFetch.count: %ld, fetchBatchSize: %ld}", buf, 0x52u);

      id v13 = v57;
      goto LABEL_11;
    }
    if (v19)
    {
      long long v28 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
      long long v29 = [v6 entityName];
      id v51 = [v12 count];
      v56 = [v6 affectedStores];
      id v49 = [v56 count];
      v55 = [(RDStoreControllerManagedObjectContext *)self persistentStoreCoordinator];
      v53 = [v55 persistentStores];
      id v58 = v13;
      long long v30 = v11;
      long long v31 = a4;
      id v32 = [v53 count];
      long long v33 = [v6 propertiesToFetch];
      id v34 = [v33 count];
      *(_DWORD *)buf = 134219522;
      double v62 = v16;
      __int16 v63 = 2114;
      v64 = v28;
      __int16 v65 = 2114;
      id v66 = v29;
      __int16 v67 = 2048;
      id v68 = v51;
      __int16 v69 = 2048;
      id v70 = v49;
      __int16 v71 = 2048;
      id v72 = v32;
      a4 = v31;
      id v11 = v30;
      id v13 = v58;
      __int16 v73 = 2048;
      id v74 = v34;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "FETCH COREDATA {elapsedTime: %.4lf ms, author: %{public}@, entityName: %{public}@, result.count: %ld, affectedStores.count: %ld, persistentStoreCoordinator.persistentStores.count: %ld, propsToFetch.count: %ld}", buf, 0x48u);

      v9 = INDateRelevanceProvider_ptr;
    }
  }
  else
  {
    v18 = +[REMLogStore read];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v20 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
      long long v27 = [v6 entityName];
      *(_DWORD *)buf = 138543874;
      double v62 = *(double *)&v20;
      __int16 v63 = 2114;
      v64 = v27;
      __int16 v65 = 2114;
      id v66 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "FETCH COREDATA ERROR {author: %{public}@, entityName: %{public}@, error: %{public}@}", buf, 0x20u);

LABEL_11:
    }
  }
LABEL_16:

  long long v35 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];

  if (v35)
  {
    __int16 v36 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
    +[RDAsyncAnalytics recordFetchWith:v36];

    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  __int16 v38 = [v9[202] write];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
    sub_10075423C(v38, v39, v40, v41, v42, v43, v44, v45);
  }

  +[RDAsyncAnalytics recordFetchWith:@"nil author"];
  if (a4) {
LABEL_18:
  }
    *a4 = v13;
LABEL_19:

  return v12;
}

- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 affectedStores];
  if (!v7)
  {
    id v8 = [(RDStoreControllerManagedObjectContext *)self __unsafe_doesNotWorkUniversally_affectedStores];

    if (!v8) {
      goto LABEL_5;
    }
    v7 = [(RDStoreControllerManagedObjectContext *)self __unsafe_doesNotWorkUniversally_affectedStores];
    [v6 setAffectedStores:v7];
  }

LABEL_5:
  v9 = +[REMLogStore read];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100754304(self);
  }

  id v10 = +[NSDate now];
  v40.receiver = self;
  v40.super_class = (Class)RDStoreControllerManagedObjectContext;
  id v41 = 0;
  id v11 = [(RDStoreControllerManagedObjectContext *)&v40 countForFetchRequest:v6 error:&v41];
  id v12 = v41;
  id v13 = +[NSDate now];
  [v13 timeIntervalSinceDate:v10];
  double v15 = v14;

  double v16 = +[REMLogStore read];
  id v17 = v16;
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      double v18 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
      BOOL v19 = [v6 entityName];
      *(_DWORD *)buf = 138543874;
      double v43 = v18;
      __int16 v44 = 2114;
      uint64_t v45 = v19;
      __int16 v46 = 2114;
      id v47 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "FETCH COUNT COREDATA ERROR {author: %{public}@, entityName: %{public}@, error: %{public}@}", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
    [v6 entityName];
    v21 = id v38 = v12;
    [v6 affectedStores];
    id v37 = v39 = a4;
    id v22 = [v37 count];
    v23 = [(RDStoreControllerManagedObjectContext *)self persistentStoreCoordinator];
    id v24 = [v23 persistentStores];
    id v25 = [v24 count];
    *(_DWORD *)buf = 134219266;
    double v43 = v15 * 1000.0;
    __int16 v44 = 2114;
    uint64_t v45 = v20;
    __int16 v46 = 2114;
    id v47 = v21;
    __int16 v48 = 2048;
    id v49 = v11;
    __int16 v50 = 2048;
    id v51 = v22;
    __int16 v52 = 2048;
    id v53 = v25;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FETCH COUNT COREDATA {elapsedTime: %.9lf ms, author: %{public}@, entityName: %{public}@, count: %ld, affectedStores.count: %ld, persistentStoreCoordinator.persistentStores.count: %ld}", buf, 0x3Eu);

    a4 = v39;
    id v12 = v38;
  }
  id v26 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];

  if (v26)
  {
    long long v27 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
    +[RDAsyncAnalytics recordFetchWith:v27];

    if (a4) {
LABEL_14:
    }
      *a4 = v12;
  }
  else
  {
    long long v29 = +[REMLogStore write];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      sub_10075423C(v29, v30, v31, v32, v33, v34, v35, v36);
    }

    +[RDAsyncAnalytics recordFetchWith:@"nil author"];
    if (a4) {
      goto LABEL_14;
    }
  }

  return (unint64_t)v11;
}

- (BOOL)__unsafe_doesNotWorkUniversally_setAffectedStoresWithAccountIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(RDStoreControllerManagedObjectContext *)self storeController];
    id v6 = [v5 storeForAccountIdentifier:v4];

    BOOL v7 = v6 != 0;
    if (v6)
    {
      id v10 = v6;
      id v8 = +[NSArray arrayWithObjects:&v10 count:1];
      [(RDStoreControllerManagedObjectContext *)self set__unsafe_doesNotWorkUniversally_affectedStores:v8];
    }
    else
    {
      [(RDStoreControllerManagedObjectContext *)self set__unsafe_doesNotWorkUniversally_affectedStores:0];
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)persistentStoreOfAccountWithAccountID:(id)a3
{
  id v4 = a3;
  id v5 = [(RDStoreControllerManagedObjectContext *)self storeController];
  id v6 = [v4 uuid];

  BOOL v7 = [v6 UUIDString];
  id v8 = [v5 storeForAccountIdentifier:v7];

  return v8;
}

- (BOOL)containerShouldSortChildrenAfterFetchingWithRecordID:(id)a3
{
  id v4 = a3;
  if ([(RDStoreControllerManagedObjectContext *)self shouldSortChildrenAfterFetching])
  {
    id v5 = [(RDStoreControllerManagedObjectContext *)self recordIDsToSortChildrenAfterFetching];

    BOOL v6 = 0;
    if (v4 && v5)
    {
      BOOL v7 = [(RDStoreControllerManagedObjectContext *)self recordIDsToSortChildrenAfterFetching];
      [v7 addObject:v4];

      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSMutableSet)managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion
{
  managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion = self->_managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion;
  if (!managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion)
  {
    id v4 = +[NSMutableSet set];
    id v5 = self->_managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion;
    self->_managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion = v4;

    managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion = self->_managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion;
  }

  return managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion;
}

+ (unint64_t)_heightOfEntityNodeInMOMTreeForEffectiveMinimumSupportedVersionPropagation:(id)a3 heightMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 name];

  if (!v8)
  {
    v9 = +[REMLogStore utility];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100754394(v6, v9);
    }
    goto LABEL_9;
  }
  v9 = [v6 name];
  id v10 = [v6 superentity];
  if (!v10)
  {
    id v11 = +[REMCDObject subclassNamesOfREMCDObjectRepresentingRootCoreDataEntities];
    id v12 = [v6 managedObjectClassName];
    unsigned int v13 = [v11 containsObject:v12];

    if (v13) {
      goto LABEL_7;
    }
LABEL_9:
    unint64_t v17 = 0;
    goto LABEL_29;
  }

LABEL_7:
  double v14 = [v7 objectForKey:v9];
  double v15 = v14;
  if (v14)
  {
    uint64_t v16 = (uint64_t)[v14 unsignedIntegerValue];
    unint64_t v17 = 0;
  }
  else
  {
    [v7 setObject:&off_1008D7450 forKey:v9];
    double v18 = +[REMCDObject relationshipsEligibleForEffectiveMinimumSupportedVersionPropagationWithEntity:v6];
    BOOL v19 = +[REMLogStore utility];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = [v18 valueForKeyPath:@"destinationEntity.name"];
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v9;
      __int16 v46 = 2114;
      id v47 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[entity-height-in-MoM-tree] node.entity=%{public}@, node.entity.relationships=%{public}@", buf, 0x16u);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = v18;
    id v22 = [v21 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v35 = 0;
      uint64_t v36 = v9;
      id v37 = v6;
      id obj = v21;
      id v24 = 0;
      uint64_t v25 = *(void *)v40;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v40 != v25) {
            objc_enumerationMutation(obj);
          }
          long long v27 = [*(id *)(*((void *)&v39 + 1) + 8 * i) destinationEntity:v35, v36, v37];
          long long v28 = [v27 subentities];
          id v29 = [v28 mutableCopy];
          while (1)
          {

            if (![v29 count]) {
              break;
            }
            long long v28 = [v29 lastObject];
            id v30 = [a1 _heightOfEntityNodeInMOMTreeForEffectiveMinimumSupportedVersionPropagation:v28 heightMap:v7];
            if (v24 <= v30) {
              id v24 = v30;
            }
            [v29 removeLastObject];
            uint64_t v31 = [v28 subentities];
            [v29 addObjectsFromArray:v31];
          }
          id v32 = [a1 _heightOfEntityNodeInMOMTreeForEffectiveMinimumSupportedVersionPropagation:v27 heightMap:v7];
          if (v24 <= v32) {
            id v24 = v32;
          }
        }
        id v23 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v23);

      unint64_t v17 = (unint64_t)v24 + 1;
      uint64_t v16 = (uint64_t)v24 + 1;
      v9 = v36;
      id v6 = v37;
      double v15 = v35;
    }
    else
    {

      unint64_t v17 = 1;
      uint64_t v16 = 1;
    }
  }
  uint64_t v33 = +[NSNumber numberWithUnsignedInteger:v16];
  [v7 setObject:v33 forKey:v9];

LABEL_29:
  return v17;
}

+ (id)topologicallyWeightedEntitiesForEffectiveMinimumSupportedVersionPropagation
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100065B44;
  block[3] = &unk_1008AFF00;
  block[4] = a1;
  if (qword_100922A70 != -1) {
    dispatch_once(&qword_100922A70, block);
  }
  v2 = +[REMLogStore utility];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10075442C(v2);
  }

  v3 = (void *)qword_100922A68;

  return v3;
}

+ (id)managedObjectIDsSortedByTopologicalWeightsForEffectiveMinimumSupportedVersionPropagation:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() topologicallyWeightedEntitiesForEffectiveMinimumSupportedVersionPropagation];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100065C98;
  v7[3] = &unk_1008B04D8;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v8;
  id v5 = [v3 sortedArrayUsingComparator:v7];

  return v5;
}

- (void)validateDirtyEffectiveMinimumSupportedVersions
{
  id v3 = +[ICCloudConfiguration sharedConfiguration];
  -[RDStoreControllerManagedObjectContext _validateDirtyEffectiveMinimumSupportedVersionsWithBatchSize:isManualValidation:](self, "_validateDirtyEffectiveMinimumSupportedVersionsWithBatchSize:isManualValidation:", [v3 objectEffectiveVersionValidationFlushBatchSize], 0);
}

- (unint64_t)_validateDirtyEffectiveMinimumSupportedVersionsWithBatchSize:(unint64_t)a3 isManualValidation:(BOOL)a4
{
  id v7 = [(RDStoreControllerManagedObjectContext *)self managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion];
  id v8 = [v7 allObjects];

  if ([v8 count])
  {
    v9 = +[NSDate date];
    id v10 = [(id)objc_opt_class() managedObjectIDsSortedByTopologicalWeightsForEffectiveMinimumSupportedVersionPropagation:v8];
    id v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "REMSupportedVersionUpdating: VALIDATING dirty MOIDs for effectiveMinimumSupportedVersion {author: %{public}@, dirtyObjectIDs.count: %ld}", buf, 0x16u);
    }
    unsigned int v13 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v10 count]);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v36 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10006612C;
    v23[3] = &unk_1008B0500;
    id v14 = v13;
    id v24 = v14;
    uint64_t v25 = self;
    BOOL v28 = a4;
    id v26 = buf;
    unint64_t v27 = a3;
    [v10 enumerateObjectsUsingBlock:v23];
    double v15 = [(RDStoreControllerManagedObjectContext *)self managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion];
    [v15 removeAllObjects];

    uint64_t v16 = +[REMLogStore write];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v17 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
      uint64_t v18 = *(void *)(*(void *)&buf[8] + 24);
      BOOL v19 = +[NSDate date];
      [v19 timeIntervalSinceDate:v9];
      *(_DWORD *)id v29 = 138543874;
      id v30 = v17;
      __int16 v31 = 2048;
      uint64_t v32 = v18;
      __int16 v33 = 2048;
      double v34 = v20 * 1000.0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "REMSupportedVersionUpdating: VALIDATION COMPLETED for effectiveMinimumSupportedVersion {author: %{public}@, subtrees.count: %ld, elapsed: %.4f ms}", v29, 0x20u);
    }
    unint64_t v21 = *(void *)(*(void *)&buf[8] + 24);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    unint64_t v21 = 0;
  }

  return v21;
}

- (BOOL)coreDataSave:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RDStoreControllerManagedObjectContext;
  return [(RDStoreControllerManagedObjectContext *)&v4 save:a3];
}

- (id)latestFetchResultTokenWithError:(id *)a3
{
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  id v24 = +[NSString stringWithFormat:@"%@.%@", v7, v8];

  v9 = [(RDStoreControllerManagedObjectContext *)self persistentStoreCoordinator];
  if (v9)
  {
    id v10 = +[NSMutableDictionary dictionary];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = [(RDStoreControllerManagedObjectContext *)self storeController];
    id v12 = [v11 validPersistentStores];

    id v13 = [v12 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          unint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          __int16 v33 = v17;
          uint64_t v18 = +[NSArray arrayWithObjects:&v33 count:1];
          BOOL v19 = [v9 currentPersistentHistoryTokenFromStores:v18];

          if (v19)
          {
            double v20 = [v17 identifier];
            [v10 setObject:v19 forKeyedSubscript:v20];
          }
          else
          {
            double v20 = +[REMLogStore container];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v30 = v24;
              __int16 v31 = 2112;
              uint64_t v32 = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%{public}@] store has no transactions. Not getting tokens {store: %@}", buf, 0x16u);
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v14);
    }

    id v21 = [objc_alloc((Class)REMFetchResultToken) initWithPersistentHistoryTokens:v10];
    goto LABEL_18;
  }
  id v22 = +[REMLogStore container];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_1007545B0((uint64_t)v24, (uint64_t)self, v22);
  }

  if (a3)
  {
    id v10 = +[NSString stringWithFormat:@"[%@] missing persistentStoreCoordinator -- Can't get REMFetchResultToken {managedObjectContext: %@}", v24, self];
    +[REMError internalErrorWithDebugDescription:v10];
    id v21 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  id v21 = 0;
LABEL_19:

  return v21;
}

- (BOOL)canAccessAllPersistentStoresReferencedByFetchResultToken:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(RDStoreControllerManagedObjectContext *)self storeController];
  id v7 = [v6 validPersistentStores];

  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v11) identifier];
        [v5 addObject:v12];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  id v13 = [v4 persistentHistoryTokens];
  id v14 = [v13 allKeys];
  uint64_t v15 = +[NSSet setWithArray:v14];

  unsigned __int8 v16 = [v15 isSubsetOfSet:v5];
  return v16;
}

- (void)proposePurgingFileAttachmentWithSha512Sum:(id)a3 fileExtension:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  id v15 = v11;
  if (v9)
  {
    id v11 = [v11 stringByAppendingPathExtension:v9];
  }
  id v12 = [(RDStoreControllerManagedObjectContext *)self candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier];
  id v13 = [v12 objectForKeyedSubscript:v10];

  if (v13)
  {
    [v13 addObject:v11];
  }
  else
  {
    id v13 = +[NSMutableSet setWithObject:v11];
    id v14 = [(RDStoreControllerManagedObjectContext *)self candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier];
    [v14 setObject:v13 forKeyedSubscript:v10];
  }
}

- (void)rejectPurgingFileAttachmentWithSha512Sum:(id)a3 fileExtension:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v13 = v8;
  id v10 = v13;
  if (a4)
  {
    id v10 = [v13 stringByAppendingPathExtension:a4];
  }
  id v11 = [(RDStoreControllerManagedObjectContext *)self candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier];
  id v12 = [v11 objectForKeyedSubscript:v9];

  [v12 removeObject:v10];
}

- (NSMutableDictionary)fileAttachmentIdentifiersToPurgeByAccountIdentifier
{
  fileAttachmentIdentifiersToPurgeByAccountIdentifier = self->_fileAttachmentIdentifiersToPurgeByAccountIdentifier;
  if (!fileAttachmentIdentifiersToPurgeByAccountIdentifier)
  {
    id v4 = +[NSMutableDictionary dictionary];
    id v5 = self->_fileAttachmentIdentifiersToPurgeByAccountIdentifier;
    self->_fileAttachmentIdentifiersToPurgeByAccountIdentifier = v4;

    fileAttachmentIdentifiersToPurgeByAccountIdentifier = self->_fileAttachmentIdentifiersToPurgeByAccountIdentifier;
  }

  return fileAttachmentIdentifiersToPurgeByAccountIdentifier;
}

- (NSMutableDictionary)candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier
{
  candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier = self->_candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
  if (!candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier)
  {
    id v4 = +[NSMutableDictionary dictionary];
    id v5 = self->_candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
    self->_candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier = v4;

    candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier = self->_candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
  }

  return candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
}

- (NSMutableDictionary)confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier
{
  confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier = self->_confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
  if (!confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier)
  {
    id v4 = +[NSMutableDictionary dictionary];
    id v5 = self->_confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
    self->_confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier = v4;

    confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier = self->_confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
  }

  return confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
}

- (id)existingFileAttachmentsMatchingSHA512Sums:(id)a3 accountID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(RDStoreControllerManagedObjectContext *)self storeController];
  id v11 = [v9 UUIDString];
  id v12 = [v10 storeForAccountIdentifier:v11];

  if (!v12)
  {
    long long v19 = [v9 UUIDString];
    long long v20 = +[NSString stringWithFormat:@"Failed to acquire persistentStore for account identifier %@", v19];
    *a5 = +[REMError internalErrorWithDebugDescription:v20];

    id v21 = 0;
    goto LABEL_9;
  }
  id v30 = +[NSMutableArray array];
  id v13 = +[REMCDFileAttachment fetchRequest];
  double v34 = v12;
  id v14 = +[NSArray arrayWithObjects:&v34 count:1];
  [v13 setAffectedStores:v14];

  id v15 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"sha512Sum", v8];
  [v13 setPredicate:v15];
  [v13 setPropertiesToFetch:&off_1008D7AC0];
  [v13 setReturnsDistinctResults:1];
  id v32 = 0;
  unsigned __int8 v16 = [(RDStoreControllerManagedObjectContext *)self executeFetchRequest:v13 error:&v32];
  id v17 = v32;
  if (v17)
  {
    id v18 = v17;
    *a5 = v18;
  }
  else
  {
    [v30 addObjectsFromArray:v16];

    id v22 = +[REMCDObject fetchRequest];
    __int16 v33 = v12;
    id v23 = +[NSArray arrayWithObjects:&v33 count:1];
    [v22 setAffectedStores:v23];

    id v24 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"sha512Sum", v8];
    [v22 setPredicate:v24];
    [v22 setPropertiesToFetch:&off_1008D7AD8];
    [v22 setReturnsDistinctResults:1];
    id v31 = 0;
    long long v25 = [(RDStoreControllerManagedObjectContext *)self executeFetchRequest:v22 error:&v31];
    id v26 = v31;
    if (!v26)
    {
      long long v28 = v30;
      [v30 addObjectsFromArray:v25];

      id v21 = v30;
      goto LABEL_8;
    }
    id v27 = v26;
    *a5 = v27;
  }
  id v21 = 0;
  long long v28 = v30;
LABEL_8:

LABEL_9:

  return v21;
}

- (void)confirmOrRejectFilePurgeCandidatesThatMightBeDeduplicatedAcrossMultipleAttachments
{
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = NSStringFromSelector(a2);
  long long v40 = +[NSString stringWithFormat:@"%@.%@", v5, v6];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  __int16 v48 = self;
  id obj = [(RDStoreControllerManagedObjectContext *)self candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier];
  id v44 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v44)
  {
    uint64_t v7 = *(void *)v59;
    id v8 = INDateRelevanceProvider_ptr;
    uint64_t v41 = *(void *)v59;
    do
    {
      for (id i = 0; i != v44; id i = v25 + 1)
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(obj);
        }
        id v47 = (char *)i;
        id v10 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v11 = [(RDStoreControllerManagedObjectContext *)v48 candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier];
        id v12 = [v11 objectForKeyedSubscript:v10];

        id v13 = [v8[60] setWithCapacity:[v12 count]];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v14 = v12;
        id v15 = [v14 countByEnumeratingWithState:&v54 objects:v69 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v55;
          do
          {
            for (j = 0; j != v16; j = (char *)j + 1)
            {
              if (*(void *)v55 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = [*(id *)(*((void *)&v54 + 1) + 8 * (void)j) stringByDeletingPathExtension];
              [v13 addObject:v19];
            }
            id v16 = [v14 countByEnumeratingWithState:&v54 objects:v69 count:16];
          }
          while (v16);
        }

        id v53 = 0;
        long long v20 = [(RDStoreControllerManagedObjectContext *)v48 existingFileAttachmentsMatchingSHA512Sums:v13 accountID:v10 error:&v53];
        id v45 = v53;
        if (v45)
        {
          id v21 = [v13 allObjects];
          id v22 = [v21 componentsJoinedByString:@", "];

          id v23 = +[REMLogStore container];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            [v10 UUIDString];
            v38 = id v37 = v20;
            *(_DWORD *)buf = 138543874;
            v64 = v40;
            __int16 v65 = 2114;
            id v66 = v38;
            __int16 v67 = 2114;
            id v68 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch existing attachments in account [%{public}@] with sha512Sums [%{public}@]. Not purging any attachments for this account.", buf, 0x20u);

            long long v20 = v37;
          }

          id v24 = [(RDStoreControllerManagedObjectContext *)v48 confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier];
          [v24 removeObjectForKey:v10];
          id v26 = v46;
          long long v25 = v47;
        }
        else
        {
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          double v43 = v20;
          id v27 = v20;
          id v28 = [v27 countByEnumeratingWithState:&v49 objects:v62 count:16];
          if (v28)
          {
            id v29 = v28;
            uint64_t v30 = *(void *)v50;
            do
            {
              for (k = 0; k != v29; k = (char *)k + 1)
              {
                if (*(void *)v50 != v30) {
                  objc_enumerationMutation(v27);
                }
                id v32 = *(void **)(*((void *)&v49 + 1) + 8 * (void)k);
                __int16 v33 = [v32 sha512Sum];
                double v34 = [v32 fileName];
                uint64_t v35 = [v34 pathExtension];

                [(RDStoreControllerManagedObjectContext *)v48 rejectPurgingFileAttachmentWithSha512Sum:v33 fileExtension:v35 account:v10];
              }
              id v29 = [v27 countByEnumeratingWithState:&v49 objects:v62 count:16];
            }
            while (v29);
          }

          id v22 = [(RDStoreControllerManagedObjectContext *)v48 candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier];
          id v24 = [v22 objectForKeyedSubscript:v10];
          uint64_t v36 = [(RDStoreControllerManagedObjectContext *)v48 confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier];
          [v36 setObject:v24 forKeyedSubscript:v10];

          uint64_t v7 = v41;
          id v8 = INDateRelevanceProvider_ptr;
          id v26 = v46;
          long long v25 = v47;
          long long v20 = v43;
        }
      }
      id v44 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v44);
  }

  long long v39 = [(RDStoreControllerManagedObjectContext *)v48 candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier];
  [v39 removeAllObjects];
}

- (void)purgeDeletedFileAttachments
{
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  double v34 = sub_100067790;
  uint64_t v35 = sub_1000677A0;
  id v4 = [(RDStoreControllerManagedObjectContext *)self fileAttachmentIdentifiersToPurgeByAccountIdentifier];
  id v36 = [v4 copy];

  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_100067790;
  id v29 = sub_1000677A0;
  id v5 = [(RDStoreControllerManagedObjectContext *)self confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier];
  id v30 = [v5 copy];

  if ([(id)v32[5] count] || objc_msgSend((id)v26[5], "count"))
  {
    uint64_t v22 = 0;
    v23[0] = &v22;
    v23[1] = 0x3032000000;
    v23[2] = sub_100067790;
    v23[3] = sub_1000677A0;
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    id v24 = +[NSString stringWithFormat:@"%@.%@", v7, v8];

    id v9 = [(RDStoreControllerManagedObjectContext *)self storeController];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 fileIOWorkerQueue];
      if (v11)
      {
        id v12 = [(RDStoreControllerManagedObjectContext *)self _unitTest_purgeDeletedFileAttachmentsDidComplete];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000677A8;
        block[3] = &unk_1008B0528;
        long long v19 = &v22;
        long long v20 = &v31;
        id v17 = v10;
        id v21 = &v25;
        id v13 = v12;
        id v18 = v13;
        dispatch_async(v11, block);
        id v14 = [(RDStoreControllerManagedObjectContext *)self fileAttachmentIdentifiersToPurgeByAccountIdentifier];
        [v14 removeAllObjects];

        id v15 = [(RDStoreControllerManagedObjectContext *)self confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier];
        [v15 removeAllObjects];
      }
      else
      {
        id v13 = +[REMLogStore container];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1007546B8((uint64_t)v23, v13);
        }
      }
    }
    else
    {
      id v11 = +[REMLogStore container];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100754638((uint64_t)v23, v11);
      }
    }

    _Block_object_dispose(&v22, 8);
  }
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

- (void)notifyDidMarkExtraneousAlarmsPendingToSyncUpDelete
{
  id v6 = +[NSMutableDictionary dictionary];
  id v3 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];

  if (v3)
  {
    id v4 = [(RDStoreControllerManagedObjectContext *)self transactionAuthor];
    [v6 setObject:v4 forKeyedSubscript:@"RDStoreControllerManagedObjectContextNotificationTransactionAuthorKey"];
  }
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"RDStoreControllerManagedObjectContextDidMarkExtraneousAlarmsPendingToSyncUpDeleteNotification" object:0 userInfo:v6];
}

- (void)_rem_setAllowsExpandedUserInfoKeys:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(RDStoreControllerManagedObjectContext *)self _setAllowsExpandedUserInfoKeys:v3];
  }
}

- (id)_debug_managedObjectIDsSortedByTopologicalWeightsForEffectiveMinimumSupportedVersionPropagation:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() managedObjectIDsSortedByTopologicalWeightsForEffectiveMinimumSupportedVersionPropagation:v3];

  return v4;
}

- (unint64_t)_unittest_validateDirtyEffectiveMinimumSupportedVersionsManually
{
  return [(RDStoreControllerManagedObjectContext *)self _validateDirtyEffectiveMinimumSupportedVersionsWithBatchSize:1 isManualValidation:1];
}

- (RDStoreController)storeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storeController);

  return (RDStoreController *)WeakRetained;
}

- (void)setStoreController:(id)a3
{
}

- (RDStoreControllerValidationPolicy)validationPolicy
{
  return self->_validationPolicy;
}

- (void)setValidationPolicy:(id)a3
{
}

- (NSArray)__unsafe_doesNotWorkUniversally_affectedStores
{
  return self->___unsafe_doesNotWorkUniversally_affectedStores;
}

- (void)set__unsafe_doesNotWorkUniversally_affectedStores:(id)a3
{
}

- (ICBatchFetchHelper)batchFetchHelper
{
  return self->_batchFetchHelper;
}

- (void)setBatchFetchHelper:(id)a3
{
}

- (NSDictionary)cloudSchemaCatchUpSyncContextsByAccountIdentifier
{
  return self->_cloudSchemaCatchUpSyncContextsByAccountIdentifier;
}

- (void)setCloudSchemaCatchUpSyncContextsByAccountIdentifier:(id)a3
{
}

- (BOOL)shouldSortChildrenAfterFetching
{
  return self->_shouldSortChildrenAfterFetching;
}

- (void)setShouldSortChildrenAfterFetching:(BOOL)a3
{
  self->_shouldSortChildrenAfterFetching = a3;
}

- (NSMutableSet)recordIDsToSortChildrenAfterFetching
{
  return self->_recordIDsToSortChildrenAfterFetching;
}

- (void)setRecordIDsToSortChildrenAfterFetching:(id)a3
{
}

- (void)setManagedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion:(id)a3
{
}

- (void)setFileAttachmentIdentifiersToPurgeByAccountIdentifier:(id)a3
{
}

- (unint64_t)pendingPostSaveActions
{
  return self->_pendingPostSaveActions;
}

- (void)setPendingPostSaveActions:(unint64_t)a3
{
  self->_pendingPostSaveActions = a3;
}

- (NSDictionary)_unittest_awakeCounts
{
  return self->__unittest_awakeCounts;
}

- (void)set_unittest_awakeCounts:(id)a3
{
}

- (id)_unitTest_purgeDeletedFileAttachmentsDidComplete
{
  return self->__unitTest_purgeDeletedFileAttachmentsDidComplete;
}

- (void)set_unitTest_purgeDeletedFileAttachmentsDidComplete:(id)a3
{
}

- (void)setCandidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier:(id)a3
{
}

- (void)setConfirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier, 0);
  objc_storeStrong(&self->__unitTest_purgeDeletedFileAttachmentsDidComplete, 0);
  objc_storeStrong((id *)&self->__unittest_awakeCounts, 0);
  objc_storeStrong((id *)&self->_fileAttachmentIdentifiersToPurgeByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion, 0);
  objc_storeStrong((id *)&self->_recordIDsToSortChildrenAfterFetching, 0);
  objc_storeStrong((id *)&self->_cloudSchemaCatchUpSyncContextsByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_batchFetchHelper, 0);
  objc_storeStrong((id *)&self->___unsafe_doesNotWorkUniversally_affectedStores, 0);
  objc_storeStrong((id *)&self->_validationPolicy, 0);

  objc_destroyWeak((id *)&self->_storeController);
}

@end